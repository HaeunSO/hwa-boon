.class public abstract Lcom/android/tools/ir/runtime/AbstractPatchesLoaderImpl;
.super Ljava/lang/Object;
.source "AbstractPatchesLoaderImpl.java"

# interfaces
.implements Lcom/android/tools/ir/runtime/PatchesLoader;


# instance fields
.field private final get:Ljava/lang/reflect/Method;

.field private final set:Ljava/lang/reflect/Method;


# direct methods
.method public constructor <init>()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    const-class v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    const-string v3, "get"

    invoke-virtual {v0, v3, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iput-object v0, p0, Lcom/android/tools/ir/runtime/AbstractPatchesLoaderImpl;->get:Ljava/lang/reflect/Method;

    .line 35
    const-class v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Class;

    const-class v3, Ljava/lang/Object;

    aput-object v3, v2, v1

    const-string v1, "set"

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iput-object v0, p0, Lcom/android/tools/ir/runtime/AbstractPatchesLoaderImpl;->set:Ljava/lang/reflect/Method;

    .line 36
    return-void
.end method

.method private patchClass(Ljava/lang/reflect/Field;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "changeField"    # Ljava/lang/reflect/Field;
    .param p2, "patch"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .line 110
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 111
    .local v1, "previous":Ljava/lang/Object;
    invoke-virtual {p1, v0, p2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 112
    return-object v1
.end method

.method private patchInterface(Ljava/lang/reflect/Field;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .param p1, "changeField"    # Ljava/lang/reflect/Field;
    .param p2, "patch"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .line 95
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 96
    .local v0, "atomicReference":Ljava/lang/Object;
    iget-object v1, p0, Lcom/android/tools/ir/runtime/AbstractPatchesLoaderImpl;->get:Ljava/lang/reflect/Method;

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Object;

    invoke-virtual {v1, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 97
    .local v1, "previous":Ljava/lang/Object;
    iget-object v3, p0, Lcom/android/tools/ir/runtime/AbstractPatchesLoaderImpl;->set:Ljava/lang/reflect/Method;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p2, v4, v2

    invoke-virtual {v3, v0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    return-object v1
.end method


# virtual methods
.method public abstract getPatchedClasses()[Ljava/lang/String;
.end method

.method public load()Z
    .locals 17

    .line 42
    move-object/from16 v1, p0

    invoke-virtual/range {p0 .. p0}, Lcom/android/tools/ir/runtime/AbstractPatchesLoaderImpl;->getPatchedClasses()[Ljava/lang/String;

    move-result-object v0

    array-length v2, v0

    const/4 v4, 0x0

    :goto_0
    const/4 v5, 0x1

    if-ge v4, v2, :cond_4

    aget-object v6, v0, v4

    .line 44
    .local v6, "className":Ljava/lang/String;
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v7

    .line 45
    .local v7, "cl":Ljava/lang/ClassLoader;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "$override"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    .line 46
    .local v8, "aClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v8}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v9

    .line 48
    .local v9, "o":Ljava/lang/Object;
    invoke-virtual {v7, v6}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v10

    .line 49
    .local v10, "originalClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v11, "$change"

    invoke-virtual {v10, v11}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v11

    .line 52
    .local v11, "changeField":Ljava/lang/reflect/Field;
    invoke-virtual {v11, v5}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 54
    nop

    .line 55
    invoke-virtual {v10}, Ljava/lang/Class;->isInterface()Z

    move-result v12

    if-eqz v12, :cond_0

    .line 56
    invoke-direct {v1, v11, v9}, Lcom/android/tools/ir/runtime/AbstractPatchesLoaderImpl;->patchInterface(Ljava/lang/reflect/Field;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    goto :goto_1

    .line 57
    :cond_0
    invoke-direct {v1, v11, v9}, Lcom/android/tools/ir/runtime/AbstractPatchesLoaderImpl;->patchClass(Ljava/lang/reflect/Field;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    :goto_1
    nop

    .line 60
    .local v12, "previous":Ljava/lang/Object;
    if-eqz v12, :cond_1

    .line 61
    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v13

    const-string v14, "$obsolete"

    invoke-virtual {v13, v14}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v13

    .line 62
    .local v13, "isObsolete":Ljava/lang/reflect/Field;
    if-eqz v13, :cond_1

    .line 63
    const/4 v14, 0x0

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 67
    .end local v13    # "isObsolete":Ljava/lang/reflect/Field;
    :cond_1
    sget-object v13, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    if-eqz v13, :cond_2

    sget-object v13, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    sget-object v14, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-interface {v13, v14}, Lcom/android/tools/ir/common/Log$Logging;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v13

    if-eqz v13, :cond_2

    .line 68
    sget-object v13, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    sget-object v14, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v15, "patched %s"

    new-array v3, v5, [Ljava/lang/Object;

    const/16 v16, 0x0

    aput-object v6, v3, v16

    invoke-static {v15, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v13, v14, v3}, Lcom/android/tools/ir/common/Log$Logging;->log(Ljava/util/logging/Level;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 78
    .end local v7    # "cl":Ljava/lang/ClassLoader;
    .end local v8    # "aClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v9    # "o":Ljava/lang/Object;
    .end local v10    # "originalClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v11    # "changeField":Ljava/lang/reflect/Field;
    .end local v12    # "previous":Ljava/lang/Object;
    :cond_2
    nop

    .line 42
    .end local v6    # "className":Ljava/lang/String;
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 70
    .restart local v6    # "className":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 71
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    if-eqz v2, :cond_3

    .line 72
    sget-object v2, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    sget-object v3, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    new-array v4, v5, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v6, v4, v5

    .line 74
    const-string v7, "Exception while patching %s"

    invoke-static {v7, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 72
    invoke-interface {v2, v3, v4, v0}, Lcom/android/tools/ir/common/Log$Logging;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    .line 71
    :cond_3
    const/4 v5, 0x0

    .line 77
    :goto_2
    return v5

    .line 80
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v6    # "className":Ljava/lang/String;
    :cond_4
    return v5
.end method
