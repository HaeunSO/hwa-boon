.class public Lcom/android/tools/ir/runtime/AndroidInstantRuntime;
.super Ljava/lang/Object;
.source "AndroidInstantRuntime.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/tools/ir/runtime/AndroidInstantRuntime$Logging;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .locals 3
    .param p0, "target"    # Ljava/lang/Class;
    .param p1, "name"    # Ljava/lang/String;

    .line 121
    invoke-static {p0, p1}, Lcom/android/tools/ir/runtime/AndroidInstantRuntime;->getFieldByName(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 122
    .local v0, "declareField":Ljava/lang/reflect/Field;
    if-eqz v0, :cond_0

    .line 125
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 126
    return-object v0

    .line 123
    :cond_0
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/util/NoSuchElementException;

    invoke-direct {v2, p1}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method private static getFieldByName(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .locals 5
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/reflect/Field;"
        }
    .end annotation

    .line 206
    .local p0, "aClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v0, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-interface {v0, v1}, Lcom/android/tools/ir/common/Log$Logging;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 207
    sget-object v0, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const-string v3, "getFieldByName:%s in %s"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/android/tools/ir/common/Log$Logging;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    .line 210
    :cond_0
    move-object v0, p0

    .line 211
    .local v0, "currentClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    if-eqz v0, :cond_1

    .line 213
    :try_start_0
    invoke-virtual {v0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 214
    :catch_0
    move-exception v1

    .line 217
    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_0

    .line 219
    :cond_1
    const/4 v1, 0x0

    return-object v1
.end method

.method private static getMethodByName(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .locals 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "paramTypes"    # [Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class;",
            ")",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .line 224
    .local p0, "aClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 225
    return-object v0

    .line 228
    :cond_0
    move-object v1, p0

    .line 229
    .local v1, "currentClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_1
    :goto_0
    if-eqz v1, :cond_2

    .line 231
    :try_start_0
    invoke-virtual {v1, p1, p2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 232
    :catch_0
    move-exception v2

    .line 235
    invoke-virtual {v1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v1

    .line 236
    if-eqz v1, :cond_1

    sget-object v2, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    if-eqz v2, :cond_1

    sget-object v2, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-interface {v2, v3}, Lcom/android/tools/ir/common/Log$Logging;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 237
    sget-object v2, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    .line 238
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    .line 237
    const-string v5, "getMethodByName:Looking in %s now"

    invoke-static {v5, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lcom/android/tools/ir/common/Log$Logging;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    goto :goto_0

    .line 242
    :cond_2
    return-object v0
.end method

.method public static getPrivateField(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;
    .locals 6
    .param p0, "targetObject"    # Ljava/lang/Object;
    .param p1, "targetClass"    # Ljava/lang/Class;
    .param p2, "fieldName"    # Ljava/lang/String;

    .line 105
    :try_start_0
    invoke-static {p1, p2}, Lcom/android/tools/ir/runtime/AndroidInstantRuntime;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 106
    .local v0, "declaredField":Ljava/lang/reflect/Field;
    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 107
    .end local v0    # "declaredField":Ljava/lang/reflect/Field;
    :catch_0
    move-exception v0

    .line 108
    .local v0, "e":Ljava/lang/IllegalAccessException;
    sget-object v1, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    if-eqz v1, :cond_1

    .line 109
    sget-object v1, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    sget-object v2, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    if-nez p0, :cond_0

    const-string v5, " static"

    goto :goto_0

    :cond_0
    const-string v5, ""

    :goto_0
    aput-object v5, v3, v4

    const/4 v4, 0x1

    aput-object p2, v3, v4

    .line 110
    const-string v4, "Exception during%1$s getField %2$s"

    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 109
    invoke-interface {v1, v2, v3, v0}, Lcom/android/tools/ir/common/Log$Logging;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 114
    :cond_1
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static getStaticPrivateField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p0, "targetClass"    # Ljava/lang/Class;
    .param p1, "fieldName"    # Ljava/lang/String;

    .line 72
    const/4 v0, 0x0

    invoke-static {v0, p0, p1}, Lcom/android/tools/ir/runtime/AndroidInstantRuntime;->getPrivateField(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static invokeProtectedMethod(Ljava/lang/Object;[Ljava/lang/Object;[Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;
    .locals 6
    .param p0, "receiver"    # Ljava/lang/Object;
    .param p1, "params"    # [Ljava/lang/Object;
    .param p2, "parameterTypes"    # [Ljava/lang/Class;
    .param p3, "methodName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 134
    sget-object v0, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-interface {v0, v3}, Lcom/android/tools/ir/common/Log$Logging;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 135
    sget-object v0, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p3, v4, v1

    aput-object p0, v4, v2

    const-string v5, "protectedMethod:%s on %s"

    invoke-static {v5, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v3, v4}, Lcom/android/tools/ir/common/Log$Logging;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    .line 138
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0, p3, p2}, Lcom/android/tools/ir/runtime/AndroidInstantRuntime;->getMethodByName(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 139
    .local v0, "toDispatchTo":Ljava/lang/reflect/Method;
    if-eqz v0, :cond_1

    .line 142
    invoke-virtual {v0, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 143
    invoke-virtual {v0, p0, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 140
    :cond_1
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/NoSuchMethodException;

    invoke-direct {v4, p3}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .end local p0    # "receiver":Ljava/lang/Object;
    .end local p1    # "params":[Ljava/lang/Object;
    .end local p2    # "parameterTypes":[Ljava/lang/Class;
    .end local p3    # "methodName":Ljava/lang/String;
    throw v3
    :try_end_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 147
    .end local v0    # "toDispatchTo":Ljava/lang/reflect/Method;
    .restart local p0    # "receiver":Ljava/lang/Object;
    .restart local p1    # "params":[Ljava/lang/Object;
    .restart local p2    # "parameterTypes":[Ljava/lang/Class;
    .restart local p3    # "methodName":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 148
    .local v0, "e":Ljava/lang/IllegalAccessException;
    sget-object v3, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    sget-object v4, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p3, v2, v1

    const-string v1, "Exception while invoking %s"

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v3, v4, v1, v0}, Lcom/android/tools/ir/common/Log$Logging;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 149
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 144
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_1
    move-exception v0

    .line 146
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    throw v1
.end method

.method public static invokeProtectedStaticMethod([Ljava/lang/Object;[Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 7
    .param p0, "params"    # [Ljava/lang/Object;
    .param p1, "parameterTypes"    # [Ljava/lang/Class;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "receiverClass"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 159
    sget-object v0, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-interface {v0, v3}, Lcom/android/tools/ir/common/Log$Logging;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 160
    sget-object v0, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p2, v4, v1

    .line 161
    invoke-virtual {p3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v2

    const-string v5, "protectedStaticMethod:%s on %s"

    invoke-static {v5, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 160
    invoke-interface {v0, v3, v4}, Lcom/android/tools/ir/common/Log$Logging;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    .line 164
    :cond_0
    :try_start_0
    invoke-static {p3, p2, p1}, Lcom/android/tools/ir/runtime/AndroidInstantRuntime;->getMethodByName(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 165
    .local v0, "toDispatchTo":Ljava/lang/reflect/Method;
    if-eqz v0, :cond_1

    .line 169
    invoke-virtual {v0, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 170
    const/4 v3, 0x0

    invoke-virtual {v0, v3, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 166
    :cond_1
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/NoSuchMethodException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " in class "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    invoke-virtual {p3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .end local p0    # "params":[Ljava/lang/Object;
    .end local p1    # "parameterTypes":[Ljava/lang/Class;
    .end local p2    # "methodName":Ljava/lang/String;
    .end local p3    # "receiverClass":Ljava/lang/Class;
    throw v3
    :try_end_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 174
    .end local v0    # "toDispatchTo":Ljava/lang/reflect/Method;
    .restart local p0    # "params":[Ljava/lang/Object;
    .restart local p1    # "parameterTypes":[Ljava/lang/Class;
    .restart local p2    # "methodName":Ljava/lang/String;
    .restart local p3    # "receiverClass":Ljava/lang/Class;
    :catch_0
    move-exception v0

    .line 175
    .local v0, "e":Ljava/lang/IllegalAccessException;
    sget-object v3, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    sget-object v4, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p2, v2, v1

    const-string v1, "Exception while invoking %s"

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v3, v4, v1, v0}, Lcom/android/tools/ir/common/Log$Logging;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 176
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 171
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_1
    move-exception v0

    .line 173
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    throw v1
.end method

.method public static newForClass([Ljava/lang/Object;[Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 7
    .param p0, "params"    # [Ljava/lang/Object;
    .param p1, "paramTypes"    # [Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([",
            "Ljava/lang/Object;",
            "[",
            "Ljava/lang/Class;",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 184
    .local p2, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const-string v0, "Exception while instantiating %s"

    :try_start_0
    invoke-virtual {p2, p1}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_3

    .line 188
    .local v1, "declaredConstructor":Ljava/lang/reflect/Constructor;
    nop

    .line 189
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 191
    const/4 v3, 0x0

    :try_start_1
    invoke-virtual {v1, p0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p2, v4}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/InstantiationException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_0

    return-object v0

    .line 198
    :catch_0
    move-exception v4

    .line 199
    .local v4, "e":Ljava/lang/IllegalAccessException;
    sget-object v5, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    sget-object v6, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p2, v2, v3

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v5, v6, v0, v4}, Lcom/android/tools/ir/common/Log$Logging;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 200
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    .line 195
    .end local v4    # "e":Ljava/lang/IllegalAccessException;
    :catch_1
    move-exception v4

    .line 196
    .local v4, "e":Ljava/lang/InstantiationException;
    sget-object v5, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    sget-object v6, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p2, v2, v3

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v5, v6, v0, v4}, Lcom/android/tools/ir/common/Log$Logging;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 197
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    .line 192
    .end local v4    # "e":Ljava/lang/InstantiationException;
    :catch_2
    move-exception v0

    .line 194
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    throw v2

    .line 185
    .end local v0    # "e":Ljava/lang/reflect/InvocationTargetException;
    .end local v1    # "declaredConstructor":Ljava/lang/reflect/Constructor;
    :catch_3
    move-exception v0

    .line 186
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    sget-object v1, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    sget-object v2, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    const-string v3, "Exception while resolving constructor"

    invoke-interface {v1, v2, v3, v0}, Lcom/android/tools/ir/common/Log$Logging;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 187
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static setLogger(Ljava/util/logging/Logger;)V
    .locals 1
    .param p0, "logger"    # Ljava/util/logging/Logger;

    .line 51
    new-instance v0, Lcom/android/tools/ir/runtime/AndroidInstantRuntime$1;

    invoke-direct {v0, p0}, Lcom/android/tools/ir/runtime/AndroidInstantRuntime$1;-><init>(Ljava/util/logging/Logger;)V

    sput-object v0, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    .line 68
    return-void
.end method

.method public static setPrivateField(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;)V
    .locals 5
    .param p0, "targetObject"    # Ljava/lang/Object;
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "targetClass"    # Ljava/lang/Class;
    .param p3, "fieldName"    # Ljava/lang/String;

    .line 87
    :try_start_0
    invoke-static {p2, p3}, Lcom/android/tools/ir/runtime/AndroidInstantRuntime;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 88
    .local v0, "declaredField":Ljava/lang/reflect/Field;
    invoke-virtual {v0, p0, p1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 95
    .end local v0    # "declaredField":Ljava/lang/reflect/Field;
    nop

    .line 96
    return-void

    .line 89
    :catch_0
    move-exception v0

    .line 90
    .local v0, "e":Ljava/lang/IllegalAccessException;
    sget-object v1, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    if-eqz v1, :cond_0

    .line 91
    sget-object v1, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    sget-object v2, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p3, v3, v4

    .line 92
    const-string v4, "Exception during setPrivateField %s"

    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 91
    invoke-interface {v1, v2, v3, v0}, Lcom/android/tools/ir/common/Log$Logging;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 94
    :cond_0
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static setStaticPrivateField(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;)V
    .locals 1
    .param p0, "value"    # Ljava/lang/Object;
    .param p1, "targetClass"    # Ljava/lang/Class;
    .param p2, "fieldName"    # Ljava/lang/String;

    .line 77
    const/4 v0, 0x0

    invoke-static {v0, p0, p1, p2}, Lcom/android/tools/ir/runtime/AndroidInstantRuntime;->setPrivateField(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;)V

    .line 78
    return-void
.end method

.method public static trace(Ljava/lang/String;)V
    .locals 2
    .param p0, "s"    # Ljava/lang/String;

    .line 246
    sget-object v0, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    if-eqz v0, :cond_0

    .line 247
    sget-object v0, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-interface {v0, v1, p0}, Lcom/android/tools/ir/common/Log$Logging;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    .line 249
    :cond_0
    return-void
.end method

.method public static trace(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p0, "s1"    # Ljava/lang/String;
    .param p1, "s2"    # Ljava/lang/String;

    .line 252
    sget-object v0, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    if-eqz v0, :cond_0

    .line 253
    sget-object v0, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    const/4 v3, 0x1

    aput-object p1, v2, v3

    const-string v3, "%s %s"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/android/tools/ir/common/Log$Logging;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    .line 255
    :cond_0
    return-void
.end method

.method public static trace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p0, "s1"    # Ljava/lang/String;
    .param p1, "s2"    # Ljava/lang/String;
    .param p2, "s3"    # Ljava/lang/String;

    .line 258
    sget-object v0, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    if-eqz v0, :cond_0

    .line 259
    sget-object v0, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    const/4 v3, 0x1

    aput-object p1, v2, v3

    const/4 v3, 0x2

    aput-object p2, v2, v3

    const-string v3, "%s %s %s"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/android/tools/ir/common/Log$Logging;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    .line 261
    :cond_0
    return-void
.end method

.method public static trace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p0, "s1"    # Ljava/lang/String;
    .param p1, "s2"    # Ljava/lang/String;
    .param p2, "s3"    # Ljava/lang/String;
    .param p3, "s4"    # Ljava/lang/String;

    .line 264
    sget-object v0, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    if-eqz v0, :cond_0

    .line 265
    sget-object v0, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    const/4 v3, 0x1

    aput-object p1, v2, v3

    const/4 v3, 0x2

    aput-object p2, v2, v3

    const/4 v3, 0x3

    aput-object p3, v2, v3

    const-string v3, "%s %s %s %s"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/android/tools/ir/common/Log$Logging;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    .line 267
    :cond_0
    return-void
.end method
