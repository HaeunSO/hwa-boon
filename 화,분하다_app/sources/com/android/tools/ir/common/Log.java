package com.android.tools.ir.common;

import java.util.logging.Level;
/* loaded from: classes3.dex */
public class Log {
    public static Logging logging = null;

    /* loaded from: classes10.dex */
    public interface Logging {
        boolean isLoggable(Level level);

        void log(Level level, String str);

        void log(Level level, String str, Throwable th);
    }
}
