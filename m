Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 08B5230CE52
	for <lists+linux-audit@lfdr.de>; Tue,  2 Feb 2021 22:57:54 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-XAypGpvEMAW2IXAU1fbrbQ-1; Tue, 02 Feb 2021 16:57:51 -0500
X-MC-Unique: XAypGpvEMAW2IXAU1fbrbQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78E5281620;
	Tue,  2 Feb 2021 21:57:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5695910016DB;
	Tue,  2 Feb 2021 21:57:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BE48A18095CE;
	Tue,  2 Feb 2021 21:57:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 112LUgqI015921 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 2 Feb 2021 16:30:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 99CF31102E1E; Tue,  2 Feb 2021 21:30:42 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 918471134CC9
	for <linux-audit@redhat.com>; Tue,  2 Feb 2021 21:30:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38B51811764
	for <linux-audit@redhat.com>; Tue,  2 Feb 2021 21:30:39 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com
	[173.37.142.94]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-345-I7ovUg-GO4WcocRn6yJwRg-1; Tue, 02 Feb 2021 16:30:35 -0500
X-MC-Unique: I7ovUg-GO4WcocRn6yJwRg-1
X-IronPort-AV: E=Sophos;i="5.79,396,1602547200"; d="scan'208";a="639763896"
Received: from rcdn-core-7.cisco.com ([173.37.93.143])
	by alln-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
	02 Feb 2021 21:29:31 +0000
Received: from zorba.cisco.com ([10.24.3.200])
	by rcdn-core-7.cisco.com (8.15.2/8.15.2) with ESMTP id 112LTUJ6026870; 
	Tue, 2 Feb 2021 21:29:30 GMT
From: Daniel Walker <danielwa@cisco.com>
To: Paul Moore <paul@paul-moore.com>, Eric Paris <eparis@redhat.com>
Subject: [PATCH 1/2] audit: show user land backtrace as part of audit context
	messages
Date: Tue,  2 Feb 2021 13:29:28 -0800
Message-Id: <20210202212930.18845-1-danielwa@cisco.com>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.3.200, [10.24.3.200]
X-Outbound-Node: rcdn-core-7.cisco.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 02 Feb 2021 16:57:02 -0500
Cc: linux-audit@redhat.com, Ruslan Bilovol <rbilovol@cisco.com>,
	Victor Kamensky <kamensky@cisco.com>,
	linux-kernel@vger.kernel.org, xe-linux-external@cisco.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Victor Kamensky <kamensky@cisco.com>

To efficiently find out where SELinux AVC denial is comming from
take backtrace of user land process and display it as type=UBACKTRACE
message that comes as audit context for SELinux AVC and other audit
messages.

By default UBACKTRACE context messages are off. Needs to be enabled
through audit AUDIT_FEATURE_UBACKTRACE_CONTEXT feature.

Context UBACKTRACE message example:
type=UBACKTRACE msg=audit(1574205625.557:30): backtrace=libc-2.30.so+0xc99ab:dmesg.util-linux+0x1483:libc-2.30.so+0x1e35:dmesg.util-linux+0x1e5a

I.e because of ASLR instead of absolute user land addresses, name
of executable or library captured and followed by offset from text
segment vma. To decode backtrace entry: find executable or library
symbol file, find its text segment vma and add offset to it; run
'addr2line -f -e symbol_file resulting_address'.

Note feature depends on PERF_EVENTS, from perf subsystem it uses
perf_callchain_user function on architectures where it is implemented.
And it has the same capturing restriction as 'perf -g': user land code
must be compiled with -fno-omit-frame-pointer option, otherwise kernel
is not capable walk user land stack frames.

Cc: xe-linux-external@cisco.com
Signed-off-by: Victor Kamensky <kamensky@cisco.com>
Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
Signed-off-by: Daniel Walker <danielwa@cisco.com>
---
 include/uapi/linux/audit.h |  6 ++-
 init/Kconfig               | 13 ++++++
 kernel/audit.c             |  3 +-
 kernel/auditsc.c           | 93 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 112 insertions(+), 3 deletions(-)

diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
index cd2d8279a5e4..7bea44b1c028 100644
--- a/include/uapi/linux/audit.h
+++ b/include/uapi/linux/audit.h
@@ -118,6 +118,7 @@
 #define AUDIT_TIME_ADJNTPVAL	1333	/* NTP value adjustment */
 #define AUDIT_BPF		1334	/* BPF subsystem */
 #define AUDIT_EVENT_LISTENER	1335	/* Task joined multicast read socket */
+#define AUDIT_UBACKTRACE	1336	/* User land backtrace */
 
 #define AUDIT_AVC		1400	/* SE Linux avc denial or grant */
 #define AUDIT_SELINUX_ERR	1401	/* Internal SE Linux Errors */
@@ -474,7 +475,7 @@ struct audit_status {
 };
 
 struct audit_features {
-#define AUDIT_FEATURE_VERSION	1
+#define AUDIT_FEATURE_VERSION	2
 	__u32	vers;
 	__u32	mask;		/* which bits we are dealing with */
 	__u32	features;	/* which feature to enable/disable */
@@ -483,7 +484,8 @@ struct audit_features {
 
 #define AUDIT_FEATURE_ONLY_UNSET_LOGINUID	0
 #define AUDIT_FEATURE_LOGINUID_IMMUTABLE	1
-#define AUDIT_LAST_FEATURE			AUDIT_FEATURE_LOGINUID_IMMUTABLE
+#define AUDIT_FEATURE_UBACKTRACE_CONTEXT	2
+#define AUDIT_LAST_FEATURE			AUDIT_FEATURE_UBACKTRACE_CONTEXT
 
 #define audit_feature_valid(x)		((x) >= 0 && (x) <= AUDIT_LAST_FEATURE)
 #define AUDIT_FEATURE_TO_MASK(x)	(1 << ((x) & 31)) /* mask for __u32 */
diff --git a/init/Kconfig b/init/Kconfig
index b77c60f8b963..4327a8afb1f9 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -433,6 +433,19 @@ config AUDITSYSCALL
 	depends on AUDIT && HAVE_ARCH_AUDITSYSCALL
 	select FSNOTIFY
 
+config AUDIT_USER_BACKTRACE
+        bool "Enable user land backtrace in audit context messages"
+        def_bool n
+        depends on AUDITSYSCALL && PERF_EVENTS
+        help
+          Enable UBACKTRACE audit context messages, capturing backtrace of
+          user land process causing the message.
+
+config AUDIT_USER_BACKTRACE_SIZE
+        int "Maximum size of user land backtrace entries captured in UBACKTACE"
+        depends on AUDIT_USER_BACKTRACE
+        default 40
+
 source "kernel/irq/Kconfig"
 source "kernel/time/Kconfig"
 source "kernel/Kconfig.preempt"
diff --git a/kernel/audit.c b/kernel/audit.c
index 1ffc2e059027..4608cddb4bb9 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -165,9 +165,10 @@ static struct audit_features af = {.vers = AUDIT_FEATURE_VERSION,
 				   .features = 0,
 				   .lock = 0,};
 
-static char *audit_feature_names[2] = {
+static char *audit_feature_names[3] = {
 	"only_unset_loginuid",
 	"loginuid_immutable",
+	"ubacktrace_context",
 };
 
 /**
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index ce8c9e2279ba..d048b01345b8 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -67,6 +67,7 @@
 #include <linux/highmem.h>
 #include <linux/syscalls.h>
 #include <asm/syscall.h>
+#include <linux/mmap_lock.h>
 #include <linux/capability.h>
 #include <linux/fs_struct.h>
 #include <linux/compat.h>
@@ -74,6 +75,7 @@
 #include <linux/string.h>
 #include <linux/uaccess.h>
 #include <linux/fsnotify_backend.h>
+#include <linux/perf_event.h>
 #include <uapi/linux/limits.h>
 #include <uapi/linux/netfilter/nf_tables.h>
 
@@ -1470,6 +1472,92 @@ static void audit_log_proctitle(void)
 	audit_log_end(ab);
 }
 
+#ifdef CONFIG_AUDIT_USER_BACKTRACE
+static void audit_log_print_backtrace(struct audit_buffer *ab,
+				      struct task_struct *tsk,
+				      struct perf_callchain_entry *entry)
+{
+	struct mm_struct *mm;
+	const struct vm_area_struct *vma;
+	struct file *file;
+	const char *filename;
+	unsigned long vmstart;
+	int i;
+
+	audit_log_format(ab, "backtrace=");
+
+	mm = tsk->mm;
+	mmap_write_lock(mm);
+	for (i = 0; i < entry->nr; i++) {
+		vma = find_vma(mm, entry->ip[i]);
+		if (vma && (vma->vm_flags & VM_EXEC)) {
+			file = vma->vm_file;
+			vmstart = vma->vm_start;
+
+			if (file && file->f_path.dentry) {
+				filename = file->f_path.dentry->d_name.name;
+			} else {
+				filename = "";
+			}
+
+			if (i == 0) {
+				audit_log_format(ab, "%s+0x%llx",
+						 filename,
+						 entry->ip[i] - vmstart);
+			} else {
+				audit_log_format(ab, ":%s+0x%llx",
+						 filename,
+						 entry->ip[i] - vmstart);
+			}
+		} else {
+			/* No corresponding executable vma, assume garbage entry */
+			break;
+		}
+	}
+	mmap_write_unlock(mm);
+}
+
+static void audit_log_ubacktrace(struct task_struct *tsk,
+				 struct audit_context *context)
+{
+	struct audit_buffer *ab;
+	struct perf_callchain_entry_ctx ctx;
+	struct pt_regs *regs = NULL;
+
+	if  (tsk->mm)
+		regs = task_pt_regs(tsk);
+
+	if (regs) {
+		ctx.entry = kmalloc(sizeof(struct perf_callchain_entry) +
+				    CONFIG_AUDIT_USER_BACKTRACE_SIZE * sizeof(__u64),
+				    GFP_KERNEL);
+		if (ctx.entry) {
+			mm_segment_t fs;
+
+			ctx.max_stack = CONFIG_AUDIT_USER_BACKTRACE_SIZE;
+			ctx.nr = ctx.entry->nr = 0;
+			ctx.contexts = 0;
+			ctx.contexts_maxed = false;
+
+			fs = force_uaccess_begin();
+			perf_callchain_user(&ctx, regs);
+			force_uaccess_end(fs);
+
+			if (ctx.entry->nr) {
+				ab = audit_log_start(context, GFP_KERNEL, AUDIT_UBACKTRACE);
+
+				if (ab) {
+					audit_log_print_backtrace(ab, tsk, ctx.entry);
+					audit_log_end(ab);
+				}
+			}
+
+			kfree(ctx.entry);
+		}
+	}
+}
+#endif /* CONFIG_AUDIT_USER_BACKTRACE */
+
 static void audit_log_exit(void)
 {
 	int i, call_panic = 0;
@@ -1594,6 +1682,11 @@ static void audit_log_exit(void)
 
 	audit_log_proctitle();
 
+#ifdef CONFIG_AUDIT_USER_BACKTRACE
+	if (is_audit_feature_set(AUDIT_FEATURE_UBACKTRACE_CONTEXT))
+		audit_log_ubacktrace(current, context);
+#endif /* CONFIG_AUDIT_USER_BACKTRACE */
+
 	/* Send end of event record to help user space know we are finished */
 	ab = audit_log_start(context, GFP_KERNEL, AUDIT_EOE);
 	if (ab)
-- 
2.17.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

