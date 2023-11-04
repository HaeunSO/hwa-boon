.class public Lcom/android/tools/ir/server/MonkeyPatcher;
.super Ljava/lang/Object;
.source "MonkeyPatcher.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getActivityThread(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 8
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 57
    .local p1, "activityThread":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 58
    :try_start_0
    const-string v1, "android.app.ActivityThread"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    move-object p1, v1

    .line 60
    :cond_0
    const-string v1, "currentActivityThread"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {p1, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 61
    .local v1, "m":Ljava/lang/reflect/Method;
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 62
    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 63
    .local v2, "currentActivityThread":Ljava/lang/Object;
    if-nez v2, :cond_1

    if-eqz p0, :cond_1

    .line 67
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "mLoadedApk"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    .line 68
    .local v4, "mLoadedApk":Ljava/lang/reflect/Field;
    invoke-virtual {v4, v3}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 69
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 70
    .local v5, "apk":Ljava/lang/Object;
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    const-string v7, "mActivityThread"

    invoke-virtual {v6, v7}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v6

    .line 71
    .local v6, "mActivityThreadField":Ljava/lang/reflect/Field;
    invoke-virtual {v6, v3}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 72
    invoke-virtual {v6, v5}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-object v2, v0

    .line 74
    .end local v4    # "mLoadedApk":Ljava/lang/reflect/Field;
    .end local v5    # "apk":Ljava/lang/Object;
    .end local v6    # "mActivityThreadField":Ljava/lang/reflect/Field;
    :cond_1
    return-object v2

    .line 75
    .end local v1    # "m":Ljava/lang/reflect/Method;
    .end local v2    # "currentActivityThread":Ljava/lang/Object;
    :catch_0
    move-exception v1

    .line 76
    .local v1, "ignore":Ljava/lang/Throwable;
    return-object v0
.end method

.method public static monkeyPatchExistingResources(Landroid/content/Context;Ljava/lang/String;Ljava/util/Collection;)V
    .locals 16
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "externalResourceFile"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/util/Collection<",
            "Landroid/app/Activity;",
            ">;)V"
        }
    .end annotation

    .line 83
    .local p2, "activities":Ljava/util/Collection;, "Ljava/util/Collection<Landroid/app/Activity;>;"
    const-string v1, "mTheme"

    if-nez p1, :cond_0

    .line 84
    return-void

    .line 90
    :cond_0
    :try_start_0
    const-class v0, Landroid/content/res/AssetManager;

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    new-array v3, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/res/AssetManager;

    move-object v3, v0

    .line 91
    .local v3, "newAssetManager":Landroid/content/res/AssetManager;
    const-class v0, Landroid/content/res/AssetManager;

    const-string v4, "addAssetPath"

    const/4 v5, 0x1

    new-array v6, v5, [Ljava/lang/Class;

    const-class v7, Ljava/lang/String;

    aput-object v7, v6, v2

    invoke-virtual {v0, v4, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    move-object v4, v0

    .line 92
    .local v4, "mAddAssetPath":Ljava/lang/reflect/Method;
    invoke-virtual {v4, v5}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 93
    new-array v0, v5, [Ljava/lang/Object;

    aput-object p1, v0, v2

    invoke-virtual {v4, v3, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-eqz v0, :cond_6

    .line 99
    const-class v0, Landroid/content/res/AssetManager;

    const-string v6, "ensureStringBlocks"

    new-array v7, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v6, v7}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    move-object v6, v0

    .line 100
    .local v6, "mEnsureStringBlocks":Ljava/lang/reflect/Method;
    invoke-virtual {v6, v5}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 101
    new-array v0, v2, [Ljava/lang/Object;

    invoke-virtual {v6, v3, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_6

    .line 103
    const-string v7, "mResourcesImpl"

    const/4 v8, 0x0

    const-string v9, "mAssets"

    if-eqz p2, :cond_2

    .line 104
    :try_start_1
    invoke-interface/range {p2 .. p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    move-object v11, v0

    .line 105
    .local v11, "activity":Landroid/app/Activity;
    invoke-virtual {v11}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_6

    move-object v12, v0

    .line 108
    .local v12, "resources":Landroid/content/res/Resources;
    :try_start_2
    const-class v0, Landroid/content/res/Resources;

    invoke-virtual {v0, v9}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 109
    .local v0, "mAssets":Ljava/lang/reflect/Field;
    invoke-virtual {v0, v5}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 110
    invoke-virtual {v0, v12, v3}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    .line 118
    .end local v0    # "mAssets":Ljava/lang/reflect/Field;
    goto :goto_1

    .line 111
    :catch_0
    move-exception v0

    .line 112
    .local v0, "ignore":Ljava/lang/Throwable;
    :try_start_3
    const-class v13, Landroid/content/res/Resources;

    invoke-virtual {v13, v7}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v13

    .line 113
    .local v13, "mResourcesImpl":Ljava/lang/reflect/Field;
    invoke-virtual {v13, v5}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 114
    invoke-virtual {v13, v12}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    .line 115
    .local v14, "resourceImpl":Ljava/lang/Object;
    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v15

    invoke-virtual {v15, v9}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v15

    .line 116
    .local v15, "implAssets":Ljava/lang/reflect/Field;
    invoke-virtual {v15, v5}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 117
    invoke-virtual {v15, v14, v3}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 120
    .end local v0    # "ignore":Ljava/lang/Throwable;
    .end local v13    # "mResourcesImpl":Ljava/lang/reflect/Field;
    .end local v14    # "resourceImpl":Ljava/lang/Object;
    .end local v15    # "implAssets":Ljava/lang/reflect/Field;
    :goto_1
    invoke-virtual {v11}, Landroid/app/Activity;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v0
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_6

    move-object v13, v0

    .line 123
    .local v13, "theme":Landroid/content/res/Resources$Theme;
    :try_start_4
    const-class v0, Landroid/content/res/Resources$Theme;

    invoke-virtual {v0, v9}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 124
    .local v0, "ma":Ljava/lang/reflect/Field;
    invoke-virtual {v0, v5}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 125
    invoke-virtual {v0, v13, v3}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_4
    .catch Ljava/lang/NoSuchFieldException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_1

    .line 133
    .end local v0    # "ma":Ljava/lang/reflect/Field;
    goto :goto_2

    .line 152
    :catch_1
    move-exception v0

    goto :goto_3

    .line 126
    :catch_2
    move-exception v0

    .line 127
    .local v0, "ignore":Ljava/lang/NoSuchFieldException;
    :try_start_5
    const-class v14, Landroid/content/res/Resources$Theme;

    const-string v15, "mThemeImpl"

    invoke-virtual {v14, v15}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v14

    .line 128
    .local v14, "themeField":Ljava/lang/reflect/Field;
    invoke-virtual {v14, v5}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 129
    invoke-virtual {v14, v13}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    .line 130
    .local v15, "impl":Ljava/lang/Object;
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    .line 131
    .local v2, "ma":Ljava/lang/reflect/Field;
    invoke-virtual {v2, v5}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 132
    invoke-virtual {v2, v15, v3}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 135
    .end local v0    # "ignore":Ljava/lang/NoSuchFieldException;
    .end local v2    # "ma":Ljava/lang/reflect/Field;
    .end local v14    # "themeField":Ljava/lang/reflect/Field;
    .end local v15    # "impl":Ljava/lang/Object;
    :goto_2
    const-class v0, Landroid/view/ContextThemeWrapper;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 136
    .local v0, "mt":Ljava/lang/reflect/Field;
    invoke-virtual {v0, v5}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 137
    invoke-virtual {v0, v11, v8}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 138
    const-class v2, Landroid/view/ContextThemeWrapper;

    const-string v14, "initializeTheme"

    const/4 v15, 0x0

    new-array v8, v15, [Ljava/lang/Class;

    invoke-virtual {v2, v14, v8}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 139
    .local v2, "mtm":Ljava/lang/reflect/Method;
    invoke-virtual {v2, v5}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 140
    new-array v8, v15, [Ljava/lang/Object;

    invoke-virtual {v2, v11, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v14, 0x18

    if-ge v8, v14, :cond_1

    .line 144
    const-class v8, Landroid/content/res/AssetManager;

    const-string v14, "createTheme"

    const/4 v15, 0x0

    new-array v5, v15, [Ljava/lang/Class;

    .line 145
    invoke-virtual {v8, v14, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    .line 146
    .local v5, "mCreateTheme":Ljava/lang/reflect/Method;
    const/4 v8, 0x1

    invoke-virtual {v5, v8}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 147
    new-array v8, v15, [Ljava/lang/Object;

    invoke-virtual {v5, v3, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    .line 148
    .local v8, "internalTheme":Ljava/lang/Object;
    const-class v14, Landroid/content/res/Resources$Theme;

    invoke-virtual {v14, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v14

    .line 149
    .local v14, "mTheme":Ljava/lang/reflect/Field;
    const/4 v15, 0x1

    invoke-virtual {v14, v15}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 150
    invoke-virtual {v14, v13, v8}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_1

    .line 155
    .end local v0    # "mt":Ljava/lang/reflect/Field;
    .end local v2    # "mtm":Ljava/lang/reflect/Method;
    .end local v5    # "mCreateTheme":Ljava/lang/reflect/Method;
    .end local v8    # "internalTheme":Ljava/lang/Object;
    .end local v14    # "mTheme":Ljava/lang/reflect/Field;
    :cond_1
    goto :goto_4

    .line 153
    .local v0, "e":Ljava/lang/Throwable;
    :goto_3
    :try_start_6
    const-string v2, "InstantRun"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Failed to update existing theme for activity "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 157
    .end local v0    # "e":Ljava/lang/Throwable;
    :goto_4
    invoke-static {v12}, Lcom/android/tools/ir/server/MonkeyPatcher;->pruneResourceCaches(Ljava/lang/Object;)V

    .line 158
    .end local v11    # "activity":Landroid/app/Activity;
    .end local v12    # "resources":Landroid/content/res/Resources;
    .end local v13    # "theme":Landroid/content/res/Resources$Theme;
    const/4 v2, 0x0

    const/4 v5, 0x1

    const/4 v8, 0x0

    goto/16 :goto_0

    .line 163
    :cond_2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_6

    const/16 v1, 0x13

    const-string v2, "mActiveResources"

    if-lt v0, v1, :cond_3

    .line 165
    :try_start_7
    const-string v0, "android.app.ResourcesManager"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    move-object v1, v0

    .line 166
    .local v1, "resourcesManagerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v0, "getInstance"

    const/4 v5, 0x0

    new-array v8, v5, [Ljava/lang/Class;

    invoke-virtual {v1, v0, v8}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    move-object v8, v0

    .line 167
    .local v8, "mGetInstance":Ljava/lang/reflect/Method;
    const/4 v10, 0x1

    invoke-virtual {v8, v10}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 168
    new-array v0, v5, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {v8, v5, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_6

    move-object v5, v0

    .line 170
    .local v5, "resourcesManager":Ljava/lang/Object;
    :try_start_8
    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 171
    .local v0, "fMActiveResources":Ljava/lang/reflect/Field;
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 173
    nop

    .line 174
    invoke-virtual {v0, v5}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/ArrayMap;

    .line 175
    .local v2, "arrayMap":Landroid/util/ArrayMap;, "Landroid/util/ArrayMap<*Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;>;"
    invoke-virtual {v2}, Landroid/util/ArrayMap;->values()Ljava/util/Collection;

    move-result-object v10
    :try_end_8
    .catch Ljava/lang/NoSuchFieldException; {:try_start_8 .. :try_end_8} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_8} :catch_6

    move-object v0, v10

    .line 181
    .end local v2    # "arrayMap":Landroid/util/ArrayMap;, "Landroid/util/ArrayMap<*Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;>;"
    .local v0, "references":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;>;"
    goto :goto_5

    .line 176
    .end local v0    # "references":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;>;"
    :catch_3
    move-exception v0

    .line 177
    .local v0, "ignore":Ljava/lang/NoSuchFieldException;
    :try_start_9
    const-string v2, "mResourceReferences"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    .line 178
    .local v2, "mResourceReferences":Ljava/lang/reflect/Field;
    const/4 v10, 0x1

    invoke-virtual {v2, v10}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 180
    invoke-virtual {v2, v5}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/Collection;

    move-object v0, v10

    .line 182
    .end local v1    # "resourcesManagerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "mResourceReferences":Ljava/lang/reflect/Field;
    .end local v5    # "resourcesManager":Ljava/lang/Object;
    .end local v8    # "mGetInstance":Ljava/lang/reflect/Method;
    .local v0, "references":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;>;"
    :goto_5
    move-object/from16 v2, p0

    move-object v1, v0

    goto :goto_6

    .line 183
    .end local v0    # "references":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;>;"
    :cond_3
    const-string v0, "android.app.ActivityThread"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 184
    .local v0, "activityThread":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 185
    .local v1, "fMActiveResources":Ljava/lang/reflect/Field;
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_9
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_9} :catch_6

    .line 186
    move-object/from16 v2, p0

    :try_start_a
    invoke-static {v2, v0}, Lcom/android/tools/ir/server/MonkeyPatcher;->getActivityThread(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v5

    .line 188
    .local v5, "thread":Ljava/lang/Object;
    nop

    .line 189
    invoke-virtual {v1, v5}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/HashMap;

    .line 190
    .local v8, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<*Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;>;"
    invoke-virtual {v8}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v10

    move-object v0, v10

    move-object v1, v0

    .line 192
    .end local v0    # "activityThread":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v5    # "thread":Ljava/lang/Object;
    .end local v8    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<*Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;>;"
    .local v1, "references":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;>;"
    :goto_6
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_7
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    move-object v8, v0

    .line 193
    .local v8, "wr":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;"
    invoke-virtual {v8}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/res/Resources;
    :try_end_a
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_a} :catch_5

    move-object v10, v0

    .line 194
    .local v10, "resources":Landroid/content/res/Resources;
    if-eqz v10, :cond_4

    .line 197
    :try_start_b
    const-class v0, Landroid/content/res/Resources;

    invoke-virtual {v0, v9}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 198
    .local v0, "mAssets":Ljava/lang/reflect/Field;
    const/4 v11, 0x1

    invoke-virtual {v0, v11}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 199
    invoke-virtual {v0, v10, v3}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_b
    .catch Ljava/lang/Throwable; {:try_start_b .. :try_end_b} :catch_4

    .line 207
    .end local v0    # "mAssets":Ljava/lang/reflect/Field;
    const/4 v14, 0x1

    goto :goto_8

    .line 200
    :catch_4
    move-exception v0

    .line 201
    .local v0, "ignore":Ljava/lang/Throwable;
    :try_start_c
    const-class v11, Landroid/content/res/Resources;

    invoke-virtual {v11, v7}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v11

    .line 202
    .local v11, "mResourcesImpl":Ljava/lang/reflect/Field;
    const/4 v12, 0x1

    invoke-virtual {v11, v12}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 203
    invoke-virtual {v11, v10}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    .line 204
    .local v12, "resourceImpl":Ljava/lang/Object;
    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v13

    invoke-virtual {v13, v9}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v13

    .line 205
    .local v13, "implAssets":Ljava/lang/reflect/Field;
    const/4 v14, 0x1

    invoke-virtual {v13, v14}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 206
    invoke-virtual {v13, v12, v3}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 209
    .end local v0    # "ignore":Ljava/lang/Throwable;
    .end local v11    # "mResourcesImpl":Ljava/lang/reflect/Field;
    .end local v12    # "resourceImpl":Ljava/lang/Object;
    .end local v13    # "implAssets":Ljava/lang/reflect/Field;
    :goto_8
    invoke-virtual {v10}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    invoke-virtual {v10}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v11

    invoke-virtual {v10, v0, v11}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V

    goto :goto_9

    .line 194
    :cond_4
    const/4 v14, 0x1

    .line 211
    .end local v8    # "wr":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;"
    .end local v10    # "resources":Landroid/content/res/Resources;
    :goto_9
    goto :goto_7

    .line 214
    .end local v1    # "references":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;>;"
    .end local v3    # "newAssetManager":Landroid/content/res/AssetManager;
    .end local v4    # "mAddAssetPath":Ljava/lang/reflect/Method;
    .end local v6    # "mEnsureStringBlocks":Ljava/lang/reflect/Method;
    :cond_5
    nop

    .line 215
    return-void

    .line 94
    .restart local v3    # "newAssetManager":Landroid/content/res/AssetManager;
    .restart local v4    # "mAddAssetPath":Ljava/lang/reflect/Method;
    :cond_6
    move-object/from16 v2, p0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Could not create new AssetManager"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local p0    # "context":Landroid/content/Context;
    .end local p1    # "externalResourceFile":Ljava/lang/String;
    .end local p2    # "activities":Ljava/util/Collection;, "Ljava/util/Collection<Landroid/app/Activity;>;"
    throw v0
    :try_end_c
    .catch Ljava/lang/Throwable; {:try_start_c .. :try_end_c} :catch_5

    .line 212
    .end local v3    # "newAssetManager":Landroid/content/res/AssetManager;
    .end local v4    # "mAddAssetPath":Ljava/lang/reflect/Method;
    .restart local p0    # "context":Landroid/content/Context;
    .restart local p1    # "externalResourceFile":Ljava/lang/String;
    .restart local p2    # "activities":Ljava/util/Collection;, "Ljava/util/Collection<Landroid/app/Activity;>;"
    :catch_5
    move-exception v0

    goto :goto_a

    :catch_6
    move-exception v0

    move-object/from16 v2, p0

    .line 213
    .local v0, "e":Ljava/lang/Throwable;
    :goto_a
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    return-void
.end method

.method private static pruneResourceCache(Ljava/lang/Object;Ljava/lang/String;)Z
    .locals 12
    .param p0, "resources"    # Ljava/lang/Object;
    .param p1, "fieldName"    # Ljava/lang/String;

    .line 293
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_3

    .line 296
    .local v1, "resourcesClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_1
    invoke-virtual {v1, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2
    :try_end_1
    .catch Ljava/lang/NoSuchFieldException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_3

    .line 299
    .local v2, "cacheField":Ljava/lang/reflect/Field;
    goto :goto_0

    .line 297
    .end local v2    # "cacheField":Ljava/lang/reflect/Field;
    :catch_0
    move-exception v2

    .line 298
    .local v2, "ignore":Ljava/lang/NoSuchFieldException;
    :try_start_2
    const-class v3, Landroid/content/res/Resources;

    invoke-virtual {v3, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    move-object v2, v3

    .line 300
    .local v2, "cacheField":Ljava/lang/reflect/Field;
    :goto_0
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 301
    invoke-virtual {v2, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 304
    .local v4, "cache":Ljava/lang/Object;
    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v5

    .line 305
    .local v5, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x10

    if-ge v6, v7, :cond_1

    .line 306
    instance-of v6, v4, Landroid/util/SparseArray;

    if-eqz v6, :cond_0

    .line 307
    move-object v6, v4

    check-cast v6, Landroid/util/SparseArray;

    invoke-virtual {v6}, Landroid/util/SparseArray;->clear()V

    .line 308
    return v3

    .line 309
    :cond_0
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0xe

    if-lt v6, v7, :cond_9

    instance-of v6, v4, Landroid/util/LongSparseArray;

    if-eqz v6, :cond_9

    .line 313
    move-object v6, v4

    check-cast v6, Landroid/util/LongSparseArray;

    invoke-virtual {v6}, Landroid/util/LongSparseArray;->clear()V

    .line 314
    return v3

    .line 316
    :cond_1
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x17

    const/4 v8, -0x1

    if-ge v6, v7, :cond_8

    .line 318
    const-string v6, "mColorStateListCache"

    invoke-virtual {v6, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 321
    instance-of v3, v4, Landroid/util/LongSparseArray;

    if-eqz v3, :cond_9

    .line 323
    move-object v3, v4

    check-cast v3, Landroid/util/LongSparseArray;

    invoke-virtual {v3}, Landroid/util/LongSparseArray;->clear()V

    goto/16 :goto_3

    .line 325
    :cond_2
    const-class v6, Landroid/util/ArrayMap;

    invoke-virtual {v5, v6}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_3

    const-string v7, "clearDrawableCachesLocked"

    const/4 v9, 0x2

    if-eqz v6, :cond_3

    .line 326
    :try_start_3
    const-class v6, Landroid/content/res/Resources;

    new-array v10, v9, [Ljava/lang/Class;

    const-class v11, Landroid/util/ArrayMap;

    aput-object v11, v10, v0

    sget-object v11, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v11, v10, v3

    invoke-virtual {v6, v7, v10}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    .line 328
    .local v6, "clearArrayMap":Ljava/lang/reflect/Method;
    invoke-virtual {v6, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 329
    new-array v7, v9, [Ljava/lang/Object;

    aput-object v4, v7, v0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v3

    invoke-virtual {v6, p0, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 330
    return v3

    .line 331
    .end local v6    # "clearArrayMap":Ljava/lang/reflect/Method;
    :cond_3
    const-class v6, Landroid/util/LongSparseArray;

    invoke-virtual {v5, v6}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_3

    if-eqz v6, :cond_5

    .line 333
    :try_start_4
    const-class v6, Landroid/content/res/Resources;

    new-array v10, v9, [Ljava/lang/Class;

    const-class v11, Landroid/util/LongSparseArray;

    aput-object v11, v10, v0

    sget-object v11, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v11, v10, v3

    invoke-virtual {v6, v7, v10}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    .line 335
    .local v6, "clearSparseMap":Ljava/lang/reflect/Method;
    invoke-virtual {v6, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 336
    new-array v7, v9, [Ljava/lang/Object;

    aput-object v4, v7, v0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v3

    invoke-virtual {v6, p0, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4
    .catch Ljava/lang/NoSuchMethodException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_3

    .line 337
    return v3

    .line 338
    .end local v6    # "clearSparseMap":Ljava/lang/reflect/Method;
    :catch_1
    move-exception v6

    .line 339
    .local v6, "e":Ljava/lang/NoSuchMethodException;
    :try_start_5
    instance-of v7, v4, Landroid/util/LongSparseArray;

    if-eqz v7, :cond_4

    .line 341
    move-object v7, v4

    check-cast v7, Landroid/util/LongSparseArray;

    invoke-virtual {v7}, Landroid/util/LongSparseArray;->clear()V

    .line 342
    return v3

    .line 344
    .end local v6    # "e":Ljava/lang/NoSuchMethodException;
    :cond_4
    goto :goto_3

    .line 345
    :cond_5
    invoke-virtual {v5}, Ljava/lang/Class;->isArray()Z

    move-result v6

    if-eqz v6, :cond_9

    .line 346
    invoke-virtual {v5}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v6

    const-class v7, Landroid/util/LongSparseArray;

    invoke-virtual {v6, v7}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_9

    .line 347
    move-object v6, v4

    check-cast v6, [Landroid/util/LongSparseArray;

    check-cast v6, [Landroid/util/LongSparseArray;

    .line 348
    .local v6, "arrays":[Landroid/util/LongSparseArray;
    array-length v7, v6

    const/4 v8, 0x0

    :goto_1
    if-ge v8, v7, :cond_7

    aget-object v9, v6, v8

    .line 349
    .local v9, "array":Landroid/util/LongSparseArray;
    if-eqz v9, :cond_6

    .line 351
    invoke-virtual {v9}, Landroid/util/LongSparseArray;->clear()V
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_3

    .line 348
    .end local v9    # "array":Landroid/util/LongSparseArray;
    :cond_6
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 354
    :cond_7
    return v3

    .line 358
    .end local v6    # "arrays":[Landroid/util/LongSparseArray;
    :cond_8
    :goto_2
    if-eqz v5, :cond_9

    .line 360
    :try_start_6
    const-string v6, "onConfigurationChange"

    new-array v7, v3, [Ljava/lang/Class;

    sget-object v9, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v9, v7, v0

    invoke-virtual {v5, v6, v7}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    .line 362
    .local v6, "configChangeMethod":Ljava/lang/reflect/Method;
    invoke-virtual {v6, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 363
    new-array v7, v3, [Ljava/lang/Object;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v0

    invoke-virtual {v6, v4, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_2

    .line 364
    return v3

    .line 365
    .end local v6    # "configChangeMethod":Ljava/lang/reflect/Method;
    :catch_2
    move-exception v6

    .line 368
    :try_start_7
    invoke-virtual {v5}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v6
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_3

    move-object v5, v6

    goto :goto_2

    .line 378
    .end local v1    # "resourcesClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "cacheField":Ljava/lang/reflect/Field;
    .end local v4    # "cache":Ljava/lang/Object;
    .end local v5    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_9
    :goto_3
    goto :goto_4

    .line 371
    :catch_3
    move-exception v1

    .line 380
    :goto_4
    return v0
.end method

.method private static pruneResourceCaches(Ljava/lang/Object;)V
    .locals 7
    .param p0, "resources"    # Ljava/lang/Object;

    .line 220
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x1

    const/16 v2, 0x15

    if-lt v0, v2, :cond_1

    .line 222
    :try_start_0
    const-class v0, Landroid/content/res/Resources;

    const-string v2, "mTypedArrayPool"

    .line 223
    invoke-virtual {v0, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 224
    .local v0, "typedArrayPoolField":Ljava/lang/reflect/Field;
    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 225
    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 226
    .local v2, "pool":Ljava/lang/Object;
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    .line 227
    .local v3, "poolClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v4, "acquire"

    const/4 v5, 0x0

    new-array v6, v5, [Ljava/lang/Class;

    invoke-virtual {v3, v4, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 228
    .local v4, "acquireMethod":Ljava/lang/reflect/Method;
    invoke-virtual {v4, v1}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 230
    :goto_0
    new-array v6, v5, [Ljava/lang/Object;

    invoke-virtual {v4, v2, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 231
    .local v6, "typedArray":Ljava/lang/Object;
    if-nez v6, :cond_0

    .line 232
    nop

    .line 236
    .end local v0    # "typedArrayPoolField":Ljava/lang/reflect/Field;
    .end local v2    # "pool":Ljava/lang/Object;
    .end local v3    # "poolClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "acquireMethod":Ljava/lang/reflect/Method;
    .end local v6    # "typedArray":Ljava/lang/Object;
    goto :goto_1

    .line 234
    .restart local v0    # "typedArrayPoolField":Ljava/lang/reflect/Field;
    .restart local v2    # "pool":Ljava/lang/Object;
    .restart local v3    # "poolClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v4    # "acquireMethod":Ljava/lang/reflect/Method;
    :cond_0
    goto :goto_0

    .line 235
    .end local v0    # "typedArrayPoolField":Ljava/lang/reflect/Field;
    .end local v2    # "pool":Ljava/lang/Object;
    .end local v3    # "poolClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "acquireMethod":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v0

    .line 239
    :cond_1
    :goto_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x17

    if-lt v0, v2, :cond_2

    .line 242
    :try_start_1
    const-class v0, Landroid/content/res/Resources;

    const-string v3, "mResourcesImpl"

    invoke-virtual {v0, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 243
    .local v0, "mResourcesImpl":Ljava/lang/reflect/Field;
    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 246
    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move-object p0, v3

    .line 248
    .end local v0    # "mResourcesImpl":Ljava/lang/reflect/Field;
    goto :goto_2

    .line 247
    :catch_1
    move-exception v0

    .line 252
    :cond_2
    :goto_2
    const/4 v0, 0x0

    .line 253
    .local v0, "lock":Ljava/lang/Object;
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x12

    if-lt v3, v4, :cond_3

    .line 255
    :try_start_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "mAccessLock"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    .line 256
    .local v3, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v3, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 257
    invoke-virtual {v3, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2

    move-object v0, v1

    .line 259
    .end local v3    # "field":Ljava/lang/reflect/Field;
    :goto_3
    goto :goto_4

    .line 258
    :catch_2
    move-exception v1

    goto :goto_3

    .line 262
    :cond_3
    :try_start_3
    const-class v3, Landroid/content/res/Resources;

    const-string v4, "mTmpValue"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    .line 263
    .restart local v3    # "field":Ljava/lang/reflect/Field;
    invoke-virtual {v3, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 264
    invoke-virtual {v3, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_3

    move-object v0, v1

    .line 266
    .end local v3    # "field":Ljava/lang/reflect/Field;
    goto :goto_4

    .line 265
    :catch_3
    move-exception v1

    .line 269
    :goto_4
    if-nez v0, :cond_4

    .line 270
    const-class v0, Lcom/android/tools/ir/server/MonkeyPatcher;

    .line 274
    :cond_4
    monitor-enter v0

    .line 276
    :try_start_4
    const-string v1, "mDrawableCache"

    invoke-static {p0, v1}, Lcom/android/tools/ir/server/MonkeyPatcher;->pruneResourceCache(Ljava/lang/Object;Ljava/lang/String;)Z

    .line 277
    const-string v1, "mColorDrawableCache"

    invoke-static {p0, v1}, Lcom/android/tools/ir/server/MonkeyPatcher;->pruneResourceCache(Ljava/lang/Object;Ljava/lang/String;)Z

    .line 278
    const-string v1, "mColorStateListCache"

    invoke-static {p0, v1}, Lcom/android/tools/ir/server/MonkeyPatcher;->pruneResourceCache(Ljava/lang/Object;Ljava/lang/String;)Z

    .line 279
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v1, v2, :cond_5

    .line 280
    const-string v1, "mAnimatorCache"

    invoke-static {p0, v1}, Lcom/android/tools/ir/server/MonkeyPatcher;->pruneResourceCache(Ljava/lang/Object;Ljava/lang/String;)Z

    .line 281
    const-string v1, "mStateListAnimatorCache"

    invoke-static {p0, v1}, Lcom/android/tools/ir/server/MonkeyPatcher;->pruneResourceCache(Ljava/lang/Object;Ljava/lang/String;)Z

    goto :goto_5

    .line 282
    :cond_5
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x13

    if-ne v1, v2, :cond_6

    .line 283
    const-string v1, "sPreloadedDrawables"

    invoke-static {p0, v1}, Lcom/android/tools/ir/server/MonkeyPatcher;->pruneResourceCache(Ljava/lang/Object;Ljava/lang/String;)Z

    .line 284
    const-string v1, "sPreloadedColorDrawables"

    invoke-static {p0, v1}, Lcom/android/tools/ir/server/MonkeyPatcher;->pruneResourceCache(Ljava/lang/Object;Ljava/lang/String;)Z

    .line 285
    const-string v1, "sPreloadedColorStateLists"

    invoke-static {p0, v1}, Lcom/android/tools/ir/server/MonkeyPatcher;->pruneResourceCache(Ljava/lang/Object;Ljava/lang/String;)Z

    .line 287
    :cond_6
    :goto_5
    monitor-exit v0

    .line 288
    return-void

    .line 287
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v1

    return-void
.end method
