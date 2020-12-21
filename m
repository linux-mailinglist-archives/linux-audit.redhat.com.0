Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9114F2DFE3E
	for <lists+linux-audit@lfdr.de>; Mon, 21 Dec 2020 17:57:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608569826;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HC52kMNS6eSBoo9cudeuZ3BzelhfdEXzhyBCnxP4gwU=;
	b=e/zRpbASsFSGJgjwi4UiVbahe9tvIFrUDZk1FfWIhu6K7O9JSC7heCEwOAERG001nSHb0g
	o5yd1ykXh2PZuGq+UIkELK9/6knEsV0iVc4HymKguUKwUoBhxFCSQtXk76H6kFfKktMAmX
	2/fnRq18BhCMpE1BayhZDuD9TQusOfI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-ldUQJsxWNTO3XtFtxWAP-Q-1; Mon, 21 Dec 2020 11:57:04 -0500
X-MC-Unique: ldUQJsxWNTO3XtFtxWAP-Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EF16801A9D;
	Mon, 21 Dec 2020 16:56:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E7F575B4BC;
	Mon, 21 Dec 2020 16:56:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 408761809C9F;
	Mon, 21 Dec 2020 16:56:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BLGuiid016623 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 21 Dec 2020 11:56:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2F00A60C0F; Mon, 21 Dec 2020 16:56:44 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 386C960C61;
	Mon, 21 Dec 2020 16:56:37 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux Containers List <containers@lists.linux-foundation.org>,
	Linux API <linux-api@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	Linux FSdevel <linux-fsdevel@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux NetDev Upstream Mailing List <netdev@vger.kernel.org>,
	Netfilter Devel List <netfilter-devel@vger.kernel.org>
Subject: [PATCH ghak90 v10 01/11] audit: collect audit task parameters
Date: Mon, 21 Dec 2020 11:55:35 -0500
Message-Id: <982b9adffbd32264a853fe7f4f06f0d0a882c11d.1608225886.git.rgb@redhat.com>
In-Reply-To: <cover.1608225886.git.rgb@redhat.com>
References: <cover.1608225886.git.rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Neil Horman <nhorman@tuxdriver.com>,
	Richard Guy Briggs <rgb@redhat.com>, David Howells <dhowells@redhat.com>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Simo Sorce <simo@redhat.com>, Eric Paris <eparis@parisplace.org>,
	Christian Brauner <christian.brauner@ubuntu.com>,
	mpatel@redhat.com, Serge Hallyn <serge@hallyn.com>
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
MIME-Version: 1.0
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The audit-related parameters in struct task_struct should ideally be
collected together and accessed through a standard audit API and the audit
structures made opaque to other kernel subsystems.

Collect the existing loginuid, sessionid and audit_context together in a
new opaque struct audit_task_info called "audit" in struct task_struct.

Use kmem_cache to manage this pool of memory.
Un-inline audit_free() to be able to always recover that memory.

Please see the upstream github issues
https://github.com/linux-audit/audit-kernel/issues/81
https://github.com/linux-audit/audit-kernel/issues/90

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
Acked-by: Neil Horman <nhorman@tuxdriver.com>
Reviewed-by: Ondrej Mosnacek <omosnace@redhat.com>
---
 fs/io-wq.c            |   8 +--
 fs/io_uring.c         |  16 ++---
 include/linux/audit.h |  49 +++++---------
 include/linux/sched.h |   7 +-
 init/init_task.c      |   3 +-
 init/main.c           |   2 +
 kernel/audit.c        | 154 +++++++++++++++++++++++++++++++++++++++++-
 kernel/audit.h        |   7 ++
 kernel/auditsc.c      |  24 ++++---
 kernel/fork.c         |   1 -
 10 files changed, 205 insertions(+), 66 deletions(-)

diff --git a/fs/io-wq.c b/fs/io-wq.c
index 02894df7656d..1c39207f3ffc 100644
--- a/fs/io-wq.c
+++ b/fs/io-wq.c
@@ -496,8 +496,8 @@ static void io_impersonate_work(struct io_worker *worker,
 		current->signal->rlim[RLIMIT_FSIZE].rlim_cur = RLIM_INFINITY;
 	io_wq_switch_blkcg(worker, work);
 #ifdef CONFIG_AUDIT
-	current->loginuid = work->identity->loginuid;
-	current->sessionid = work->identity->sessionid;
+	audit_set_loginuid_iouring(work->identity->loginuid);
+	audit_set_sessionid_iouring(work->identity->sessionid);
 #endif
 }
 
@@ -512,8 +512,8 @@ static void io_assign_current_work(struct io_worker *worker,
 	}
 
 #ifdef CONFIG_AUDIT
-	current->loginuid = KUIDT_INIT(AUDIT_UID_UNSET);
-	current->sessionid = AUDIT_SID_UNSET;
+	audit_set_loginuid_iouring(KUIDT_INIT(AUDIT_UID_UNSET));
+	audit_set_sessionid_iouring(AUDIT_SID_UNSET);
 #endif
 
 	spin_lock_irq(&worker->lock);
diff --git a/fs/io_uring.c b/fs/io_uring.c
index b42dfa0243bf..a1e178d8b040 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -1064,8 +1064,8 @@ static void io_init_identity(struct io_identity *id)
 	id->fs = current->fs;
 	id->fsize = rlimit(RLIMIT_FSIZE);
 #ifdef CONFIG_AUDIT
-	id->loginuid = current->loginuid;
-	id->sessionid = current->sessionid;
+	id->loginuid = audit_get_loginuid(current);
+	id->sessionid = audit_get_sessionid(current);
 #endif
 	refcount_set(&id->count, 1);
 }
@@ -1335,8 +1335,8 @@ static bool io_grab_identity(struct io_kiocb *req)
 		req->work.flags |= IO_WQ_WORK_CREDS;
 	}
 #ifdef CONFIG_AUDIT
-	if (!uid_eq(current->loginuid, id->loginuid) ||
-	    current->sessionid != id->sessionid)
+	if (!uid_eq(audit_get_loginuid(current), id->loginuid) ||
+	    audit_get_sessionid(current) != id->sessionid)
 		return false;
 #endif
 	if (!(req->work.flags & IO_WQ_WORK_FS) &&
@@ -6771,8 +6771,8 @@ static int io_sq_thread(void *data)
 			}
 			io_sq_thread_associate_blkcg(ctx, &cur_css);
 #ifdef CONFIG_AUDIT
-			current->loginuid = ctx->loginuid;
-			current->sessionid = ctx->sessionid;
+			audit_set_loginuid_iouring(ctx->loginuid);
+			audit_set_sessionid_iouring(ctx->sessionid);
 #endif
 
 			ret |= __io_sq_thread(ctx, start_jiffies, cap_entries);
@@ -9205,8 +9205,8 @@ static int io_uring_create(unsigned entries, struct io_uring_params *p,
 	ctx->user = user;
 	ctx->creds = get_current_cred();
 #ifdef CONFIG_AUDIT
-	ctx->loginuid = current->loginuid;
-	ctx->sessionid = current->sessionid;
+	ctx->loginuid = audit_get_loginuid(current);
+	ctx->sessionid = audit_get_sessionid(current);
 #endif
 	ctx->sqo_task = get_task_struct(current);
 
diff --git a/include/linux/audit.h b/include/linux/audit.h
index 82b7c1116a85..515cc89a7e0c 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -154,6 +154,9 @@ struct filename;
 #ifdef CONFIG_AUDIT
 /* These are defined in audit.c */
 				/* Public API */
+extern int  audit_alloc(struct task_struct *task);
+extern void audit_free(struct task_struct *task);
+extern void __init audit_task_init(void);
 extern __printf(4, 5)
 void audit_log(struct audit_context *ctx, gfp_t gfp_mask, int type,
 	       const char *fmt, ...);
@@ -194,22 +197,26 @@ extern int audit_rule_change(int type, int seq, void *data, size_t datasz);
 extern int audit_list_rules_send(struct sk_buff *request_skb, int seq);
 
 extern int audit_set_loginuid(kuid_t loginuid);
+extern void audit_set_loginuid_iouring(kuid_t loginuid);
 
-static inline kuid_t audit_get_loginuid(struct task_struct *tsk)
-{
-	return tsk->loginuid;
-}
+extern kuid_t audit_get_loginuid(struct task_struct *tsk);
 
-static inline unsigned int audit_get_sessionid(struct task_struct *tsk)
-{
-	return tsk->sessionid;
-}
+extern unsigned int audit_get_sessionid(struct task_struct *tsk);
+extern void audit_set_sessionid_iouring(unsigned int sessionid);
 
 extern u32 audit_enabled;
 
 extern int audit_signal_info(int sig, struct task_struct *t);
 
 #else /* CONFIG_AUDIT */
+static inline int audit_alloc(struct task_struct *task)
+{
+	return 0;
+}
+static inline void audit_free(struct task_struct *task)
+{ }
+static inline void __init audit_task_init(void)
+{ }
 static inline __printf(4, 5)
 void audit_log(struct audit_context *ctx, gfp_t gfp_mask, int type,
 	       const char *fmt, ...)
@@ -285,8 +292,6 @@ static inline int audit_signal_info(int sig, struct task_struct *t)
 
 /* These are defined in auditsc.c */
 				/* Public API */
-extern int  audit_alloc(struct task_struct *task);
-extern void __audit_free(struct task_struct *task);
 extern void __audit_syscall_entry(int major, unsigned long a0, unsigned long a1,
 				  unsigned long a2, unsigned long a3);
 extern void __audit_syscall_exit(int ret_success, long ret_value);
@@ -303,26 +308,14 @@ extern void audit_seccomp_actions_logged(const char *names,
 					 const char *old_names, int res);
 extern void __audit_ptrace(struct task_struct *t);
 
-static inline void audit_set_context(struct task_struct *task, struct audit_context *ctx)
-{
-	task->audit_context = ctx;
-}
-
-static inline struct audit_context *audit_context(void)
-{
-	return current->audit_context;
-}
+extern struct audit_context *audit_context(void);
 
 static inline bool audit_dummy_context(void)
 {
 	void *p = audit_context();
 	return !p || *(int *)p;
 }
-static inline void audit_free(struct task_struct *task)
-{
-	if (unlikely(task->audit_context))
-		__audit_free(task);
-}
+
 static inline void audit_syscall_entry(int major, unsigned long a0,
 				       unsigned long a1, unsigned long a2,
 				       unsigned long a3)
@@ -550,12 +543,6 @@ static inline void audit_log_nfcfg(const char *name, u8 af,
 extern int audit_n_rules;
 extern int audit_signals;
 #else /* CONFIG_AUDITSYSCALL */
-static inline int audit_alloc(struct task_struct *task)
-{
-	return 0;
-}
-static inline void audit_free(struct task_struct *task)
-{ }
 static inline void audit_syscall_entry(int major, unsigned long a0,
 				       unsigned long a1, unsigned long a2,
 				       unsigned long a3)
@@ -566,8 +553,6 @@ static inline bool audit_dummy_context(void)
 {
 	return true;
 }
-static inline void audit_set_context(struct task_struct *task, struct audit_context *ctx)
-{ }
 static inline struct audit_context *audit_context(void)
 {
 	return NULL;
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 063cd120b459..b28348868b27 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -36,7 +36,6 @@
 #include <linux/kcsan.h>
 
 /* task_struct member predeclarations (sorted alphabetically): */
-struct audit_context;
 struct backing_dev_info;
 struct bio_list;
 struct blk_plug;
@@ -958,11 +957,7 @@ struct task_struct {
 	struct callback_head		*task_works;
 
 #ifdef CONFIG_AUDIT
-#ifdef CONFIG_AUDITSYSCALL
-	struct audit_context		*audit_context;
-#endif
-	kuid_t				loginuid;
-	unsigned int			sessionid;
+	void				*audit;
 #endif
 	struct seccomp			seccomp;
 
diff --git a/init/init_task.c b/init/init_task.c
index a56f0abb63e9..2909c46056e1 100644
--- a/init/init_task.c
+++ b/init/init_task.c
@@ -134,8 +134,7 @@ struct task_struct init_task
 	.thread_group	= LIST_HEAD_INIT(init_task.thread_group),
 	.thread_node	= LIST_HEAD_INIT(init_signals.thread_head),
 #ifdef CONFIG_AUDIT
-	.loginuid	= INVALID_UID,
-	.sessionid	= AUDIT_SID_UNSET,
+	.audit		= NULL,
 #endif
 #ifdef CONFIG_PERF_EVENTS
 	.perf_event_mutex = __MUTEX_INITIALIZER(init_task.perf_event_mutex),
diff --git a/init/main.c b/init/main.c
index 130376ec10ba..da821e5ce077 100644
--- a/init/main.c
+++ b/init/main.c
@@ -98,6 +98,7 @@
 #include <linux/mem_encrypt.h>
 #include <linux/kcsan.h>
 #include <linux/init_syscalls.h>
+#include <linux/audit.h>
 
 #include <asm/io.h>
 #include <asm/bugs.h>
@@ -1036,6 +1037,7 @@ asmlinkage __visible void __init __no_sanitize_address start_kernel(void)
 	nsfs_init();
 	cpuset_init();
 	cgroup_init();
+	audit_task_init();
 	taskstats_init_early();
 	delayacct_init();
 
diff --git a/kernel/audit.c b/kernel/audit.c
index 1ffc2e059027..2719ca147150 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -208,6 +208,148 @@ struct audit_reply {
 	struct sk_buff *skb;
 };
 
+struct audit_task_info {
+	kuid_t			loginuid;
+	unsigned int		sessionid;
+#ifdef CONFIG_AUDITSYSCALL
+	struct audit_context	*ctx;
+#endif
+};
+
+static struct kmem_cache *audit_task_cache;
+
+void __init audit_task_init(void)
+{
+	audit_task_cache = kmem_cache_create("audit_task",
+					     sizeof(struct audit_task_info),
+					     0, SLAB_PANIC, NULL);
+}
+
+inline kuid_t audit_get_loginuid(struct task_struct *tsk)
+{
+	struct audit_task_info *info = tsk->audit;
+
+	if (!info)
+		return INVALID_UID;
+	return info->loginuid;
+}
+
+inline void audit_set_loginuid_iouring(kuid_t loginuid)
+{
+	struct audit_task_info *info = current->audit;
+
+	if (!info)
+		return;
+	info->loginuid = loginuid;
+}
+
+inline unsigned int audit_get_sessionid(struct task_struct *tsk)
+{
+	struct audit_task_info *info = tsk->audit;
+
+	if (!info)
+		return AUDIT_SID_UNSET;
+	return info->sessionid;
+}
+
+inline void audit_set_sessionid_iouring(unsigned int sessionid)
+{
+	struct audit_task_info *info = current->audit;
+
+	if (!info)
+		return;
+	info->sessionid = sessionid;
+}
+
+inline struct audit_context *_audit_context(struct task_struct *tsk)
+{
+	struct audit_task_info *info = tsk->audit;
+
+	if (!info)
+		return NULL;
+	return info->ctx;
+}
+
+struct audit_context *audit_context(void)
+{
+	return _audit_context(current);
+}
+EXPORT_SYMBOL(audit_context);
+
+static void audit_alloc_task(struct task_struct *tsk)
+{
+	struct audit_task_info *info = tsk->audit;
+
+	if (info && !IS_ERR(info))
+		return;
+	info = kmem_cache_alloc(audit_task_cache, GFP_KERNEL);
+	if (!info) {
+		tsk->audit = ERR_PTR(-ENOMEM);
+		return;
+	}
+	info->loginuid = audit_get_loginuid(current);
+	info->sessionid = audit_get_sessionid(current);
+	tsk->audit = info;
+}
+
+void audit_set_context(struct task_struct *tsk, struct audit_context *ctx)
+{
+	struct audit_task_info *info;
+
+	audit_alloc_task(tsk);
+	info = tsk->audit;
+	if (!IS_ERR(info))
+		info->ctx = ctx;
+	else
+		tsk->audit = NULL;
+}
+
+/**
+ * audit_alloc - allocate an audit info block for a task
+ * @tsk: task
+ *
+ * Call audit_alloc_syscall to filter on the task information and
+ * allocate a per-task audit context if necessary.  This is called from
+ * copy_process, so no lock is needed.
+ */
+int audit_alloc(struct task_struct *tsk)
+{
+	int ret = 0;
+
+	tsk->audit = NULL;
+	audit_alloc_task(tsk);
+	if (IS_ERR(tsk->audit)) {
+		ret = PTR_ERR(tsk->audit);
+		tsk->audit = NULL;
+		goto out;
+	}
+	ret = audit_alloc_syscall(tsk);
+	if (ret) {
+		kmem_cache_free(audit_task_cache, tsk->audit);
+		tsk->audit = NULL;
+	}
+out:
+	return ret;
+}
+
+/**
+ * audit_free - free per-task audit info
+ * @tsk: task whose audit info block to free
+ *
+ * Called from copy_process and do_exit
+ */
+void audit_free(struct task_struct *tsk)
+{
+	struct audit_task_info *info = tsk->audit;
+
+	audit_free_syscall(tsk);
+	/* Freeing the audit_task_info struct must be performed after
+	 * audit_log_exit() due to need for loginuid and sessionid.
+	 */
+	tsk->audit = NULL;
+	kmem_cache_free(audit_task_cache, info);
+}
+
 /**
  * auditd_test_task - Check to see if a given task is an audit daemon
  * @task: the task to check
@@ -2310,6 +2452,7 @@ int audit_set_loginuid(kuid_t loginuid)
 	unsigned int oldsessionid, sessionid = AUDIT_SID_UNSET;
 	kuid_t oldloginuid;
 	int rc;
+	struct audit_task_info *info;
 
 	oldloginuid = audit_get_loginuid(current);
 	oldsessionid = audit_get_sessionid(current);
@@ -2317,6 +2460,12 @@ int audit_set_loginuid(kuid_t loginuid)
 	rc = audit_set_loginuid_perm(loginuid);
 	if (rc)
 		goto out;
+	audit_alloc_task(current);
+	if (IS_ERR(current->audit)) {
+		rc = PTR_ERR(current->audit);
+		current->audit = NULL;
+		goto out;
+	}
 
 	/* are we setting or clearing? */
 	if (uid_valid(loginuid)) {
@@ -2325,8 +2474,9 @@ int audit_set_loginuid(kuid_t loginuid)
 			sessionid = (unsigned int)atomic_inc_return(&session_id);
 	}
 
-	current->sessionid = sessionid;
-	current->loginuid = loginuid;
+	info = current->audit;
+	info->sessionid = sessionid;
+	info->loginuid = loginuid;
 out:
 	audit_log_set_loginuid(oldloginuid, loginuid, oldsessionid, sessionid, rc);
 	return rc;
diff --git a/kernel/audit.h b/kernel/audit.h
index 3b9c0945225a..aa81d913a3d2 100644
--- a/kernel/audit.h
+++ b/kernel/audit.h
@@ -251,6 +251,10 @@ extern void audit_put_tty(struct tty_struct *tty);
 extern unsigned int audit_serial(void);
 extern int auditsc_get_stamp(struct audit_context *ctx,
 			      struct timespec64 *t, unsigned int *serial);
+extern void audit_set_context(struct task_struct *task, struct audit_context *ctx);
+extern struct audit_context *_audit_context(struct task_struct *tsk);
+extern int audit_alloc_syscall(struct task_struct *tsk);
+extern void audit_free_syscall(struct task_struct *tsk);
 
 extern void audit_put_watch(struct audit_watch *watch);
 extern void audit_get_watch(struct audit_watch *watch);
@@ -292,6 +296,9 @@ extern void audit_filter_inodes(struct task_struct *tsk,
 extern struct list_head *audit_killed_trees(void);
 #else /* CONFIG_AUDITSYSCALL */
 #define auditsc_get_stamp(c, t, s) 0
+#define audit_alloc_syscall(t) 0
+#define audit_free_syscall(t) {}
+
 #define audit_put_watch(w) {}
 #define audit_get_watch(w) {}
 #define audit_to_watch(k, p, l, o) (-EINVAL)
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 9cbe6d5437be..dc8dc103a8a4 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -932,23 +932,25 @@ static inline struct audit_context *audit_alloc_context(enum audit_state state)
 	return context;
 }
 
-/**
- * audit_alloc - allocate an audit context block for a task
+/*
+ * audit_alloc_syscall - allocate an audit context block for a task
  * @tsk: task
  *
  * Filter on the task information and allocate a per-task audit context
  * if necessary.  Doing so turns on system call auditing for the
- * specified task.  This is called from copy_process, so no lock is
- * needed.
+ * specified task.  This is called from copy_process via audit_alloc, so
+ * no lock is needed.
  */
-int audit_alloc(struct task_struct *tsk)
+int audit_alloc_syscall(struct task_struct *tsk)
 {
 	struct audit_context *context;
 	enum audit_state     state;
 	char *key = NULL;
 
-	if (likely(!audit_ever_enabled))
+	if (likely(!audit_ever_enabled)) {
+		audit_set_context(tsk, NULL);
 		return 0; /* Return if not auditing. */
+	}
 
 	state = audit_filter_task(tsk, &key);
 	if (state == AUDIT_DISABLED) {
@@ -958,7 +960,7 @@ int audit_alloc(struct task_struct *tsk)
 
 	if (!(context = audit_alloc_context(state))) {
 		kfree(key);
-		audit_log_lost("out of memory in audit_alloc");
+		audit_log_lost("out of memory in audit_alloc_syscall");
 		return -ENOMEM;
 	}
 	context->filterkey = key;
@@ -1603,14 +1605,14 @@ static void audit_log_exit(void)
 }
 
 /**
- * __audit_free - free a per-task audit context
+ * audit_free_syscall - free per-task audit context info
  * @tsk: task whose audit context block to free
  *
- * Called from copy_process and do_exit
+ * Called from audit_free
  */
-void __audit_free(struct task_struct *tsk)
+void audit_free_syscall(struct task_struct *tsk)
 {
-	struct audit_context *context = tsk->audit_context;
+	struct audit_context *context = _audit_context(tsk);
 
 	if (!context)
 		return;
diff --git a/kernel/fork.c b/kernel/fork.c
index 32083db7a2a2..261446f7bbee 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2024,7 +2024,6 @@ static __latent_entropy struct task_struct *copy_process(
 	posix_cputimers_init(&p->posix_cputimers);
 
 	p->io_context = NULL;
-	audit_set_context(p, NULL);
 	cgroup_fork(p);
 #ifdef CONFIG_NUMA
 	p->mempolicy = mpol_dup(p->mempolicy);
-- 
2.18.4

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

