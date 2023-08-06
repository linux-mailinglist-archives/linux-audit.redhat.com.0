Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.145.221.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AE6771566
	for <lists+linux-audit@lfdr.de>; Sun,  6 Aug 2023 15:43:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691329386;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GyXsnWYgWz6ghPOM5Od0/5alzJHInCL9ziRxCdzCr7s=;
	b=GeCXcYmmszeekWC6U2xw0QQa5KvJ27jf//mzu8PE2ITqWN6g91FYsNaGAjUeyx4idKxIGf
	jAnEepb9RXqZG0jLVhTQF7AaAmSTBmN9hD7axYf+a7C4ogTU4dFyLnHEOJRx+jYq75LIgk
	CtT52B4PFT1KGP53SHq5LjHAVVm4qrQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-WgHV4rXTOzm9mS_JU9ALWA-1; Sun, 06 Aug 2023 09:43:02 -0400
X-MC-Unique: WgHV4rXTOzm9mS_JU9ALWA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41E9D185A78B;
	Sun,  6 Aug 2023 13:43:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2A125201EE6E;
	Sun,  6 Aug 2023 13:42:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 49D3B1946594;
	Sun,  6 Aug 2023 13:42:47 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CC7E01946587 for <linux-audit@listman.corp.redhat.com>;
 Sun,  6 Aug 2023 13:41:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E8DCEF7FC1; Sun,  6 Aug 2023 13:41:53 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E0AE8F7FC0
 for <linux-audit@redhat.com>; Sun,  6 Aug 2023 13:41:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE6DC185A78F
 for <linux-audit@redhat.com>; Sun,  6 Aug 2023 13:41:53 +0000 (UTC)
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-WjKYVS3CO9y-3fvYcOs6nQ-1; Sun, 06 Aug 2023 09:41:50 -0400
X-MC-Unique: WjKYVS3CO9y-3fvYcOs6nQ-1
Received: from fsav413.sakura.ne.jp (fsav413.sakura.ne.jp [133.242.250.112])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 376D4v3i062567;
 Sun, 6 Aug 2023 22:04:57 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav413.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav413.sakura.ne.jp);
 Sun, 06 Aug 2023 22:04:57 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav413.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 376D4v8N062563
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Sun, 6 Aug 2023 22:04:57 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <41d03271-ff8a-9888-11de-a7f53da47328@I-love.SAKURA.ne.jp>
Date: Sun, 6 Aug 2023 22:04:55 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
To: linux-security-module <linux-security-module@vger.kernel.org>,
 audit@vger.kernel.org, linux-audit@redhat.com
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [PATCH v2] TaskTracker : Simplified thread information tracker.
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: i-love.sakura.ne.jp
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When an unexpected system event occurs, the administrator may want to
identify which application triggered the event. For example, unexpected
process termination is still a real concern enough to write articles
like https://access.redhat.com/solutions/165993 . TaskTracker is a
trivial LSM module which emits TOMOYO-like information into the audit
logs for better understanding of unexpected system events.

I suggested TaskTracker about 10 years ago [1]. Compared to that time,
security_task_alloc()/security_task_free() hooks have been revived, but
the multiple concurrent LSM patches have not completed yet.

When I proposed TaskTracker as an LSM module [2], there was a comment that
this module should not reuse the subj= field and instead add new fields to
audit logs. But that thread died for unknown reason, and there is an effort
for making it possible to enable SELinux and Smack at the same time.
Thus, retrying as an LSM module based on an assumption that the multiple
concurrent LSM patches will address how to share the subj= field. I think
that passing whole history in one string is easier for those who want to
avoid bloating audit log files to control history size and fields to
include. Also, I think that userspace tools won't try to tokenize
this history in order to perform more than fgrep matching.

But now that LSM people are about to require an LSM ID for registering an
LSM module, I can't wait till it becomes possible to enable SELinux and
Smack at the same time. I have to send TaskTracker upstream in order to
assign an LSM ID for TaskTracker.

Link: https://marc.info/?l=linux-security-module&m=138547679621695 [1]
Link: https://lkml.kernel.org/r/201405232144.JFB30480.OVMOOSFtQJHLFF@I-love.SAKURA.ne.jp [2]
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
 security/Kconfig                   |   1 +
 security/Makefile                  |   1 +
 security/tasktracker/Kconfig       |  24 +++++
 security/tasktracker/Makefile      |   2 +
 security/tasktracker/tasktracker.c | 160 +++++++++++++++++++++++++++++
 5 files changed, 188 insertions(+)
 create mode 100644 security/tasktracker/Kconfig
 create mode 100644 security/tasktracker/Makefile
 create mode 100644 security/tasktracker/tasktracker.c

diff --git a/security/Kconfig b/security/Kconfig
index 52c9af08ad35..aea0ac2b24a1 100644
--- a/security/Kconfig
+++ b/security/Kconfig
@@ -194,6 +194,7 @@ source "security/yama/Kconfig"
 source "security/safesetid/Kconfig"
 source "security/lockdown/Kconfig"
 source "security/landlock/Kconfig"
+source "security/tasktracker/Kconfig"
 
 source "security/integrity/Kconfig"
 
diff --git a/security/Makefile b/security/Makefile
index 18121f8f85cd..86ae43be3207 100644
--- a/security/Makefile
+++ b/security/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_SECURITY_LOCKDOWN_LSM)	+= lockdown/
 obj-$(CONFIG_CGROUPS)			+= device_cgroup.o
 obj-$(CONFIG_BPF_LSM)			+= bpf/
 obj-$(CONFIG_SECURITY_LANDLOCK)		+= landlock/
+obj-$(CONFIG_SECURITY_TASKTRACKER)	+= tasktracker/
 
 # Object integrity file lists
 obj-$(CONFIG_INTEGRITY)			+= integrity/
diff --git a/security/tasktracker/Kconfig b/security/tasktracker/Kconfig
new file mode 100644
index 000000000000..6b294bf18878
--- /dev/null
+++ b/security/tasktracker/Kconfig
@@ -0,0 +1,24 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config SECURITY_TASKTRACKER
+	bool "TaskTracker Support"
+	depends on SECURITY && AUDIT
+	default n
+	help
+	  This selects TaskTracker, a module which provides a thread's
+	  history for better understanding of audit logs.
+
+          If you enable this module, you will find history of current
+          thread in the subj= field of audit logs in the form of
+          name=$commname;pid=$pid;start=$YYYYMMDDhhmmss delimited by =>
+          like an example shown below.
+
+          [root@localhost ~]# auditctl -a exit,always -F arch=b64 -S kill
+          [root@localhost ~]# bash
+          [root@localhost ~]# kill -9 $$
+          Killed
+          [root@localhost ~]# ausearch -sc kill
+          ----
+          time->Sun Aug  6 15:36:17 2023
+          type=PROCTITLE msg=audit(1691303777.054:117): proctitle="(null)"
+          type=OBJ_PID msg=audit(1691303777.054:117): opid=3787 oauid=0 ouid=0 oses=1 ocomm="bash"
+          type=SYSCALL msg=audit(1691303777.054:117): arch=c000003e syscall=62 success=yes exit=0 a0=ecb a1=9 a2=0 a3=7ffc779be760 items=0 ppid=3766 pid=3787 auid=0 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=pts0 ses=1 comm="bash" exe="/usr/bin/bash" subj="name=swapper/0;pid=0;start=20230806153345=>name=init;pid=1;start=20230806153400=>name=systemd;pid=1;start=20230806153457=>name=sshd;pid=3661;start=20230806063525=>name=sshd;pid=3764;start=20230806063543=>name=bash;pid=3766;start=20230806063549=>name=bash;pid=3787;start=20230806063612" key=(null)
diff --git a/security/tasktracker/Makefile b/security/tasktracker/Makefile
new file mode 100644
index 000000000000..1c11673c7684
--- /dev/null
+++ b/security/tasktracker/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-y = tasktracker.o
diff --git a/security/tasktracker/tasktracker.c b/security/tasktracker/tasktracker.c
new file mode 100644
index 000000000000..bd76d7e2b42b
--- /dev/null
+++ b/security/tasktracker/tasktracker.c
@@ -0,0 +1,160 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * tt.c - Simplified thread information tracker.
+ */
+
+#include <linux/lsm_hooks.h>
+#include <linux/ctype.h>
+
+#define HISTORY_BUFFER_SIZE 1024
+
+struct lsm_blob_sizes tt_blob_sizes __ro_after_init = {
+	.lbs_task = HISTORY_BUFFER_SIZE,
+};
+
+/**
+ * tt_task - Get history of specified thread.
+ *
+ * @task - Pointer to "struct task_struct".
+ *
+ * Returns history of specified thread.
+ */
+static char *tt_task(struct task_struct *task)
+{
+	return task->security + tt_blob_sizes.lbs_task;
+}
+
+/**
+ * tt_update_history - Update history of current thread.
+ *
+ * Returns nothing.
+ */
+static void tt_update_history(void)
+{
+	int i;
+	int required;
+	struct tm tm;
+	char buf[256];
+	char *cp = buf;
+	char *history = tt_task(current);
+
+	cp += snprintf(buf, sizeof(buf) - 1, "name=");
+	for (i = 0; i < TASK_COMM_LEN; i++) {
+		const unsigned char c = current->comm[i];
+
+		if (!c)
+			break;
+		if (isalnum(c) || c == '.' || c == '_' || c == '-' || c == '/') {
+			*cp++ = c;
+			continue;
+		}
+		*cp++ = '\\';
+		*cp++ = (c >> 6) + '0';
+		*cp++ = ((c >> 3) & 7) + '0';
+		*cp++ = (c & 7) + '0';
+	}
+	/* Append PID. */
+	cp += snprintf(cp, buf - cp + sizeof(buf) - 1, ";pid=%u",
+		       current->pid);
+	/* Append timestamp. */
+	time64_to_tm(ktime_get_real_seconds(), 0, &tm);
+	cp += snprintf(cp, buf - cp + sizeof(buf) - 1,
+		       ";start=%04u%02u%02u%02u%02u%02u", (int) tm.tm_year + 1900,
+		       tm.tm_mon + 1, tm.tm_mday, tm.tm_hour, tm.tm_min,
+		       tm.tm_sec);
+	/* Terminate the buffer. */
+	if (cp >= buf + sizeof(buf))
+		cp = buf + sizeof(buf) - 1;
+	*cp = '\0';
+	required = cp - buf;
+	/* Truncate history if history is too long to append. */
+	cp = history;
+	while (i = strlen(cp), i + required >= HISTORY_BUFFER_SIZE - 10) {
+		char *cp2 = memchr(cp + 3, '>', i - 3);
+
+		if (WARN_ON_ONCE(!cp2))
+			return;
+		cp2--;
+		memmove(cp + 1, cp2, strlen(cp2) + 1);
+	}
+	/* Create or append history. */
+	if (!i)
+		sprintf(cp, "\"%s\"", buf);
+	else
+		sprintf(cp + i - 1, "=>%s\"", buf);
+}
+
+static void tt_current_getsecid_subj(u32 *secid)
+{
+	*secid = 1;
+}
+
+/**
+ * tt_secid_to_secctx - Allocate memory used for auditing.
+ *
+ * @secid:   Bool flag to allocate.
+ * @secdata: Pointer to allocate memory.
+ * @seclen:  Unused.
+ *
+ * Returns 0 on success, -EINVAL otherwise.
+ */
+static int tt_secid_to_secctx(u32 secid, char **secdata, u32 *seclen)
+{
+	char *history = tt_task(current);
+
+	/*
+	 * This module avoids returning -ENOMEM in order to avoid audit_panic(),
+	 * by returning only current thread's history. Since current thread's
+	 * history is updated and read by only current thread, we don't need to
+	 * copy the history for reading.
+	 */
+	if (secid != 1)
+		return -EINVAL;
+	if (secdata)
+		*secdata = history;
+	*seclen = strlen(history);
+	return 0;
+}
+
+static int tt_task_alloc(struct task_struct *task, unsigned long clone_flags)
+{
+	/* Copy from current thread's history upon clone(). */
+	strscpy(tt_task(task), tt_task(current), HISTORY_BUFFER_SIZE);
+	return 0;
+}
+
+static void tt_bprm_committing_creds(struct linux_binprm *bprm)
+{
+	/* Update current thread's history upon successful execve(). */
+	tt_update_history();
+}
+
+static struct security_hook_list tt_hooks[] __ro_after_init = {
+	LSM_HOOK_INIT(current_getsecid_subj, tt_current_getsecid_subj),
+	LSM_HOOK_INIT(secid_to_secctx, tt_secid_to_secctx),
+	LSM_HOOK_INIT(task_alloc, tt_task_alloc),
+	LSM_HOOK_INIT(bprm_committing_creds, tt_bprm_committing_creds),
+};
+
+/**
+ * tt_init - Register TaskTracker as a LSM module.
+ *
+ * Returns 0.
+ */
+static int __init tt_init(void)
+{
+	char *history = tt_task(current);
+
+	memset(history, 0, HISTORY_BUFFER_SIZE);
+	tt_update_history();
+	security_add_hooks(tt_hooks, ARRAY_SIZE(tt_hooks), "tt");
+	pr_info("TaskTracker initialized\n");
+	return 0;
+}
+
+DEFINE_LSM(tt) = {
+	.name = "tt",
+	.flags = LSM_FLAG_EXCLUSIVE, /* Due to use of "u32 *secid' argument. */
+	.blobs = &tt_blob_sizes,
+	.init = tt_init,
+};
-- 
2.18.4

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

