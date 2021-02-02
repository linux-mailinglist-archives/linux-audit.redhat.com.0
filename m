Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7F88B30CE4F
	for <lists+linux-audit@lfdr.de>; Tue,  2 Feb 2021 22:57:34 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-GAgGPOHYODG3gHN9OAoWRw-1; Tue, 02 Feb 2021 16:57:31 -0500
X-MC-Unique: GAgGPOHYODG3gHN9OAoWRw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F2CF192CC41;
	Tue,  2 Feb 2021 21:57:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DA705D9E3;
	Tue,  2 Feb 2021 21:57:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 86A925003B;
	Tue,  2 Feb 2021 21:57:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 112LUepe015911 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 2 Feb 2021 16:30:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 96AAE2166B2A; Tue,  2 Feb 2021 21:30:40 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 91B822166B27
	for <linux-audit@redhat.com>; Tue,  2 Feb 2021 21:30:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CD14101A531
	for <linux-audit@redhat.com>; Tue,  2 Feb 2021 21:30:37 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com
	[173.37.142.89]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-590-DQadR5aAMjOaf6UriO1bLA-1; Tue, 02 Feb 2021 16:30:35 -0500
X-MC-Unique: DQadR5aAMjOaf6UriO1bLA-1
X-IronPort-AV: E=Sophos;i="5.79,396,1602547200"; d="scan'208";a="663080871"
Received: from rcdn-core-7.cisco.com ([173.37.93.143])
	by alln-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
	02 Feb 2021 21:29:32 +0000
Received: from zorba.cisco.com ([10.24.3.200])
	by rcdn-core-7.cisco.com (8.15.2/8.15.2) with ESMTP id 112LTUJ7026870; 
	Tue, 2 Feb 2021 21:29:31 GMT
From: Daniel Walker <danielwa@cisco.com>
To: Paul Moore <paul@paul-moore.com>, Eric Paris <eparis@redhat.com>
Subject: [PATCH 2/2] audit: show (grand)parents information of an audit context
Date: Tue,  2 Feb 2021 13:29:29 -0800
Message-Id: <20210202212930.18845-2-danielwa@cisco.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 02 Feb 2021 16:57:02 -0500
Cc: Phil Zhang <xuanyzha@cisco.com>, linux-audit@redhat.com,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Phil Zhang <xuanyzha@cisco.com>

To ease the root cause analysis of SELinux AVCs, this new feature
traverses task structs to iteratively find all parent processes
starting with the denied process and ending at the kernel. Meanwhile,
it prints out the command lines and subject contexts of those parents.

This provides developers a clear view of how processes were spawned
and where transitions happened, without the need to reproduce the
issue and manually audit interesting events.

Example on bash over ssh:
    $ runcon -u system_u -r system_r -t polaris_hm_t ls
    ...
    type=PARENT msg=audit(1610548241.033:255): subj=root:unconfined_r:unconfined_t:s0-s0:c0.c1023  cmdline="-bash"
    type=PARENT msg=audit(1610548241.033:255): subj=system_u:system_r:sshd_t:s0-s0:c0.c1023        cmdline="sshd: root@pts/0"
    type=PARENT msg=audit(1610548241.033:255): subj=system_u:system_r:sshd_t:s0-s0:c0.c1023        cmdline="/tmp/sw/rp/0/0/rp_security/mount/usr/sbin/sshd
    type=PARENT msg=audit(1610548241.033:255): subj=system_u:system_r:init_t:s0                    cmdline="/init"
    type=PARENT msg=audit(1610548241.033:255): subj=system_u:system_r:kernel_t:s0
    ...

Cc: xe-linux-external@cisco.com
Signed-off-by: Phil Zhang <xuanyzha@cisco.com>
Signed-off-by: Daniel Walker <danielwa@cisco.com>
---
 include/uapi/linux/audit.h |  5 ++-
 init/Kconfig               |  7 +++++
 kernel/audit.c             |  3 +-
 kernel/auditsc.c           | 64 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 77 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
index 7bea44b1c028..8f1a2880b198 100644
--- a/include/uapi/linux/audit.h
+++ b/include/uapi/linux/audit.h
@@ -119,6 +119,7 @@
 #define AUDIT_BPF		1334	/* BPF subsystem */
 #define AUDIT_EVENT_LISTENER	1335	/* Task joined multicast read socket */
 #define AUDIT_UBACKTRACE	1336	/* User land backtrace */
+#define AUDIT_PARENT		1340    /* Process Parent emit event */
 
 #define AUDIT_AVC		1400	/* SE Linux avc denial or grant */
 #define AUDIT_SELINUX_ERR	1401	/* Internal SE Linux Errors */
@@ -485,7 +486,9 @@ struct audit_features {
 #define AUDIT_FEATURE_ONLY_UNSET_LOGINUID	0
 #define AUDIT_FEATURE_LOGINUID_IMMUTABLE	1
 #define AUDIT_FEATURE_UBACKTRACE_CONTEXT	2
-#define AUDIT_LAST_FEATURE			AUDIT_FEATURE_UBACKTRACE_CONTEXT
+#define AUDIT_FEATURE_LIST_PARENTS		3
+#define AUDIT_LAST_FEATURE			AUDIT_FEATURE_LIST_PARENTS
+
 
 #define audit_feature_valid(x)		((x) >= 0 && (x) <= AUDIT_LAST_FEATURE)
 #define AUDIT_FEATURE_TO_MASK(x)	(1 << ((x) & 31)) /* mask for __u32 */
diff --git a/init/Kconfig b/init/Kconfig
index 4327a8afb1f9..2dbc1c2aa833 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -446,6 +446,13 @@ config AUDIT_USER_BACKTRACE_SIZE
         depends on AUDIT_USER_BACKTRACE
         default 40
 
+config AUDIT_LIST_PARENTS
+	bool "Displaying parent processes in audit context messages"
+	def_bool n
+	depends on AUDITSYSCALL
+	help
+	  Capture contexts and cmdlines of parent processes when auditing syscalls
+
 source "kernel/irq/Kconfig"
 source "kernel/time/Kconfig"
 source "kernel/Kconfig.preempt"
diff --git a/kernel/audit.c b/kernel/audit.c
index 4608cddb4bb9..834adc462f47 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -165,10 +165,11 @@ static struct audit_features af = {.vers = AUDIT_FEATURE_VERSION,
 				   .features = 0,
 				   .lock = 0,};
 
-static char *audit_feature_names[3] = {
+static char *audit_feature_names[4] = {
 	"only_unset_loginuid",
 	"loginuid_immutable",
 	"ubacktrace_context",
+	"list_parents",
 };
 
 /**
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index d048b01345b8..c27e9f928bf1 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -96,6 +96,10 @@
 /* number of audit rules */
 int audit_n_rules;
 
+/* max length of per audit entry and max number of entries */
+#define MAX_PARENT_AUDIT_LEN 256
+#define MAX_PARENT_ENTRY_CNT 16
+
 /* determines whether we collect data for signals sent */
 int audit_signals;
 
@@ -1472,6 +1476,61 @@ static void audit_log_proctitle(void)
 	audit_log_end(ab);
 }
 
+static void audit_log_parents(void)
+{
+	int res, len, item_cnt;
+	u32 sid;
+	char *buf;
+	char *ctx = NULL;
+	struct audit_context *context = audit_context();
+	struct audit_buffer *ab;
+	struct task_struct *task_iter;
+
+	if (!context || context->dummy)
+		return;
+
+	buf = kmalloc(MAX_PARENT_AUDIT_LEN, GFP_KERNEL);
+	if (!buf)
+		return;
+
+	rcu_read_lock();
+	task_iter = rcu_dereference(current->real_parent);
+	for (item_cnt = 0; item_cnt < MAX_PARENT_ENTRY_CNT; ++item_cnt) {
+		ab = audit_log_start(context, GFP_ATOMIC, AUDIT_PARENT);
+		if (!ab)
+			break;
+
+		// get subject context
+		security_task_getsecid(task_iter, &sid);
+		if (sid) {
+			res = security_secid_to_secctx(sid, &ctx, &len);
+			if (!res) {
+				audit_log_format(ab, "subj=%-60s", ctx);
+				security_release_secctx(ctx, len);
+			}
+		}
+
+		// get cmdline
+		res = get_cmdline(task_iter, buf, MAX_PARENT_AUDIT_LEN);
+		if (res) {
+			res = audit_proctitle_rtrim(buf, res);
+			if (res) {
+				audit_log_format(ab, " proctitle=");
+				audit_log_n_untrustedstring(ab, buf, res);
+			}
+		}
+
+		audit_log_end(ab);
+
+		if (task_iter == task_iter->real_parent)
+			break;
+		task_iter = rcu_dereference(task_iter->real_parent);
+	}
+	rcu_read_unlock();
+
+	kfree(buf);
+}
+
 #ifdef CONFIG_AUDIT_USER_BACKTRACE
 static void audit_log_print_backtrace(struct audit_buffer *ab,
 				      struct task_struct *tsk,
@@ -1682,6 +1741,11 @@ static void audit_log_exit(void)
 
 	audit_log_proctitle();
 
+#ifdef CONFIG_AUDIT_LIST_PARENTS
+	if (is_audit_feature_set(AUDIT_FEATURE_LIST_PARENTS))
+		audit_log_parents();
+#endif /* CONFIG_AUDIT_LIST_PARENTS */
+
 #ifdef CONFIG_AUDIT_USER_BACKTRACE
 	if (is_audit_feature_set(AUDIT_FEATURE_UBACKTRACE_CONTEXT))
 		audit_log_ubacktrace(current, context);
-- 
2.17.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

