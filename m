Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B9A1A154
	for <lists+linux-audit@lfdr.de>; Fri, 10 May 2019 18:22:35 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 839433082137;
	Fri, 10 May 2019 16:22:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F7975D704;
	Fri, 10 May 2019 16:22:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D08C041F56;
	Fri, 10 May 2019 16:22:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4AGMR7E004557 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 10 May 2019 12:22:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AF3835D71C; Fri, 10 May 2019 16:22:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-16.phx2.redhat.com [10.3.112.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 197BB5D6A9;
	Fri, 10 May 2019 16:22:13 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>
Subject: [PATCH ghak111 V2] audit: deliver signal_info regarless of syscall
Date: Fri, 10 May 2019 12:21:49 -0400
Message-Id: <67828806f9d2bf0f1e98e24afa58af55c8c8678f.1557358701.git.rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, oleg@redhat.com, ebiederm@xmission.com,
	eparis@parisplace.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Fri, 10 May 2019 16:22:33 +0000 (UTC)

When a process signals the audit daemon (shutdown, rotate, resume,
reconfig) but syscall auditing is not enabled, we still want to know the
identity of the process sending the signal to the audit daemon.

Move audit_signal_info() out of syscall auditing to general auditing but
create a new function audit_signal_info_syscall() to take care of the
syscall dependent parts for when syscall auditing is enabled.

Please see the github kernel audit issue
https://github.com/linux-audit/audit-kernel/issues/111

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
Changelog:
v2:
- change patch title to avoid siginfo_t confusion
- change return value to "0" from AUDIT_OFF
- use dummy functions instead of macros in header files

Compile/boot/test auditsyscall enable/disable, audit disable,
auditsyscall enable/selinux disable.

 include/linux/audit.h |  9 +++++++++
 kernel/audit.c        | 27 +++++++++++++++++++++++++++
 kernel/audit.h        |  8 ++++++--
 kernel/auditsc.c      | 19 +++----------------
 kernel/signal.c       |  2 +-
 5 files changed, 46 insertions(+), 19 deletions(-)

diff --git a/include/linux/audit.h b/include/linux/audit.h
index 43a23e28ba23..b4078560cb73 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -196,6 +196,9 @@ static inline unsigned int audit_get_sessionid(struct task_struct *tsk)
 }
 
 extern u32 audit_enabled;
+
+extern int audit_signal_info(int sig, struct task_struct *t);
+
 #else /* CONFIG_AUDIT */
 static inline __printf(4, 5)
 void audit_log(struct audit_context *ctx, gfp_t gfp_mask, int type,
@@ -249,6 +252,12 @@ static inline unsigned int audit_get_sessionid(struct task_struct *tsk)
 }
 
 #define audit_enabled AUDIT_OFF
+
+static inline int audit_signal_info(int sig, struct task_struct *t)
+{
+	return 0;
+}
+
 #endif /* CONFIG_AUDIT */
 
 #ifdef CONFIG_AUDIT_COMPAT_GENERIC
diff --git a/kernel/audit.c b/kernel/audit.c
index b96bf69183f4..67399ff72d43 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -2274,6 +2274,33 @@ int audit_set_loginuid(kuid_t loginuid)
 }
 
 /**
+ * audit_signal_info - record signal info for shutting down audit subsystem
+ * @sig: signal value
+ * @t: task being signaled
+ *
+ * If the audit subsystem is being terminated, record the task (pid)
+ * and uid that is doing that.
+ */
+int audit_signal_info(int sig, struct task_struct *t)
+{
+	kuid_t uid = current_uid(), auid;
+
+	if (auditd_test_task(t) &&
+	    (sig == SIGTERM || sig == SIGHUP ||
+	     sig == SIGUSR1 || sig == SIGUSR2)) {
+		audit_sig_pid = task_tgid_nr(current);
+		auid = audit_get_loginuid(current);
+		if (uid_valid(auid))
+			audit_sig_uid = auid;
+		else
+			audit_sig_uid = uid;
+		security_task_getsecid(current, &audit_sig_sid);
+	}
+
+	return audit_signal_info_syscall(t);
+}
+
+/**
  * audit_log_end - end one audit record
  * @ab: the audit_buffer
  *
diff --git a/kernel/audit.h b/kernel/audit.h
index 958d5b8fc1b3..e5df0c125e2d 100644
--- a/kernel/audit.h
+++ b/kernel/audit.h
@@ -299,7 +299,7 @@ extern bool audit_tree_match(struct audit_chunk *chunk,
 extern void audit_put_tree(struct audit_tree *tree);
 extern void audit_kill_trees(struct audit_context *context);
 
-extern int audit_signal_info(int sig, struct task_struct *t);
+extern int audit_signal_info_syscall(struct task_struct *t);
 extern void audit_filter_inodes(struct task_struct *tsk,
 				struct audit_context *ctx);
 extern struct list_head *audit_killed_trees(void);
@@ -330,7 +330,11 @@ extern void audit_filter_inodes(struct task_struct *tsk,
 #define audit_tree_path(rule) ""	/* never called */
 #define audit_kill_trees(context) BUG()
 
-#define audit_signal_info(s, t) AUDIT_DISABLED
+static inline int audit_signal_info_syscall(struct task_struct *t)
+{
+	return 0;
+}
+
 #define audit_filter_inodes(t, c) AUDIT_DISABLED
 #endif /* CONFIG_AUDITSYSCALL */
 
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 5371b59bde36..3209640df2cb 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -2360,30 +2360,17 @@ void __audit_ptrace(struct task_struct *t)
 }
 
 /**
- * audit_signal_info - record signal info for shutting down audit subsystem
- * @sig: signal value
+ * audit_signal_info_syscall - record signal info for syscalls
  * @t: task being signaled
  *
  * If the audit subsystem is being terminated, record the task (pid)
  * and uid that is doing that.
  */
-int audit_signal_info(int sig, struct task_struct *t)
+int audit_signal_info_syscall(struct task_struct *t)
 {
 	struct audit_aux_data_pids *axp;
 	struct audit_context *ctx = audit_context();
-	kuid_t uid = current_uid(), auid, t_uid = task_uid(t);
-
-	if (auditd_test_task(t) &&
-	    (sig == SIGTERM || sig == SIGHUP ||
-	     sig == SIGUSR1 || sig == SIGUSR2)) {
-		audit_sig_pid = task_tgid_nr(current);
-		auid = audit_get_loginuid(current);
-		if (uid_valid(auid))
-			audit_sig_uid = auid;
-		else
-			audit_sig_uid = uid;
-		security_task_getsecid(current, &audit_sig_sid);
-	}
+	kuid_t t_uid = task_uid(t);
 
 	if (!audit_signals || audit_dummy_context())
 		return 0;
diff --git a/kernel/signal.c b/kernel/signal.c
index b7953934aa99..73db5dfa797d 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -43,6 +43,7 @@
 #include <linux/compiler.h>
 #include <linux/posix-timers.h>
 #include <linux/livepatch.h>
+#include <linux/audit.h>	/* audit_signal_info() */
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/signal.h>
@@ -52,7 +53,6 @@
 #include <asm/unistd.h>
 #include <asm/siginfo.h>
 #include <asm/cacheflush.h>
-#include "audit.h"	/* audit_signal_info() */
 
 /*
  * SLAB caches for signal bits.
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
