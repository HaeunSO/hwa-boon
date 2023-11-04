.class final Lcom/android/tools/ir/server/Restarter$2;
.super Ljava/lang/Object;
.source "Restarter.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/tools/ir/server/Restarter;->showToast(Landroid/app/Activity;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$text:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 0

    .line 159
    iput-object p1, p0, Lcom/android/tools/ir/server/Restarter$2;->val$activity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/android/tools/ir/server/Restarter$2;->val$text:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 163
    const-string v0, "InstantRun"

    const/4 v1, 0x5

    :try_start_0
    iget-object v2, p0, Lcom/android/tools/ir/server/Restarter$2;->val$activity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    .line 164
    .local v2, "context":Landroid/content/Context;
    instance-of v3, v2, Landroid/content/ContextWrapper;

    if-eqz v3, :cond_1

    .line 165
    move-object v3, v2

    check-cast v3, Landroid/content/ContextWrapper;

    invoke-virtual {v3}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v3

    .line 166
    .local v3, "base":Landroid/content/Context;
    if-nez v3, :cond_1

    .line 167
    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 168
    const-string v4, "Couldn\'t show toast: no base context"

    invoke-static {v0, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 170
    :cond_0
    return-void

    .line 175
    .end local v3    # "base":Landroid/content/Context;
    :cond_1
    const/4 v3, 0x0

    .line 176
    .local v3, "duration":I
    iget-object v4, p0, Lcom/android/tools/ir/server/Restarter$2;->val$text:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    const/16 v5, 0x3c

    if-ge v4, v5, :cond_2

    iget-object v4, p0, Lcom/android/tools/ir/server/Restarter$2;->val$text:Ljava/lang/String;

    const/16 v5, 0xa

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_3

    .line 177
    :cond_2
    const/4 v3, 0x1

    .line 183
    :cond_3
    iget-object v4, p0, Lcom/android/tools/ir/server/Restarter$2;->val$activity:Landroid/app/Activity;

    iget-object v5, p0, Lcom/android/tools/ir/server/Restarter$2;->val$text:Ljava/lang/String;

    invoke-static {v4, v5, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 188
    .end local v2    # "context":Landroid/content/Context;
    .end local v3    # "duration":I
    goto :goto_0

    .line 184
    :catch_0
    move-exception v2

    .line 185
    .local v2, "e":Ljava/lang/Throwable;
    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 186
    const-string v1, "Couldn\'t show toast"

    invoke-static {v0, v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 189
    .end local v2    # "e":Ljava/lang/Throwable;
    :cond_4
    :goto_0
    return-void
.end method
