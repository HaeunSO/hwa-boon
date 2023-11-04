package com.android.tools.ir.runtime;

import com.android.tools.ir.common.Log;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.concurrent.atomic.AtomicReference;
import java.util.logging.Level;
/* loaded from: classes7.dex */
public abstract class AbstractPatchesLoaderImpl implements PatchesLoader {
    private final Method get = AtomicReference.class.getMethod("get", new Class[0]);
    private final Method set = AtomicReference.class.getMethod("set", Object.class);

    public abstract String[] getPatchedClasses();

    @Override // com.android.tools.ir.runtime.PatchesLoader
    public boolean load() {
        String[] patchedClasses;
        Object previous;
        Field isObsolete;
        for (String className : getPatchedClasses()) {
            try {
                ClassLoader cl = getClass().getClassLoader();
                Class<?> aClass = cl.loadClass(className + "$override");
                Object o = aClass.newInstance();
                Class<?> originalClass = cl.loadClass(className);
                Field changeField = originalClass.getDeclaredField("$change");
                changeField.setAccessible(true);
                if (originalClass.isInterface()) {
                    previous = patchInterface(changeField, o);
                } else {
                    previous = patchClass(changeField, o);
                }
                if (previous != null && (isObsolete = previous.getClass().getDeclaredField("$obsolete")) != null) {
                    isObsolete.set(null, true);
                }
                if (Log.logging != null && Log.logging.isLoggable(Level.FINE)) {
                    Log.logging.log(Level.FINE, String.format("patched %s", className));
                }
            } catch (Exception e) {
                if (Log.logging == null) {
                    return false;
                }
                Log.logging.log(Level.SEVERE, String.format("Exception while patching %s", className), e);
                return false;
            }
        }
        return true;
    }

    private Object patchInterface(Field changeField, Object patch) throws IllegalAccessException, NoSuchMethodException, InvocationTargetException {
        Object atomicReference = changeField.get(null);
        Object previous = this.get.invoke(atomicReference, new Object[0]);
        this.set.invoke(atomicReference, patch);
        return previous;
    }

    private Object patchClass(Field changeField, Object patch) throws IllegalAccessException {
        Object previous = changeField.get(null);
        changeField.set(null, patch);
        return previous;
    }
}
