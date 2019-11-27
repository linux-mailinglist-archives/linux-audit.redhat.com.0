Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 5548710CA60
	for <lists+linux-audit@lfdr.de>; Thu, 28 Nov 2019 15:30:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574951445;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=v6Ks56zXMYf5eObRDCQnr/bp8y4acR2i2wfKwrKUu14=;
	b=gYoFt1BpYA87pT9wxqFfvK6E3mmtTnU5uVBwXsUPGfjO6yDiRGUrMAZCmDBju6xdN5Pkqg
	WlIiHxhR8jsat9cWhYJ9DLM6IMRtZYsf3XJSLBduh5YiWe6spXrXF+mngHlZCm1O09aQmT
	LLctFfvaY1Eqmz93DjDTqiWyVttWInE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-UCaU2wCfNuyaUuQa0Q7GXA-1; Thu, 28 Nov 2019 09:30:40 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1FAF102313D;
	Thu, 28 Nov 2019 14:30:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 035A95D9E2;
	Thu, 28 Nov 2019 14:30:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9E90A1819AC0;
	Thu, 28 Nov 2019 14:30:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xARH4xPZ010103 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 27 Nov 2019 12:04:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B3798ED177; Wed, 27 Nov 2019 17:04:59 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AEEBCC6902
	for <linux-audit@redhat.com>; Wed, 27 Nov 2019 17:04:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66FE08D3FFE
	for <linux-audit@redhat.com>; Wed, 27 Nov 2019 17:04:57 +0000 (UTC)
X-EEMSG-check-017: 34319957|UPDC19PA21_ESA_OUT03.csd.disa.mil
X-IronPort-AV: E=Sophos;i="5.69,250,1571702400"; d="scan'208";a="34319957"
Received: from UPDC19PA21.eemsg.mail.mil (UPDC19PA21.eemsg.mail.mil
	[214.24.27.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-12-yeZk1r7jMjmCX8fyYrSyew-1; Wed, 27 Nov 2019 12:04:54 -0500
Received: from emsm-gh1-uea11.ncsc.mil ([214.29.60.3])
	by UPDC19PA21.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256;
	27 Nov 2019 17:04:49 +0000
X-IronPort-AV: E=Sophos;i="5.69,250,1571702400"; d="scan'208";a="36092306"
IronPort-PHdr: =?us-ascii?q?9a23=3AapskcxcspfQBru6ThmObAw8tlGMj4u6mDksu8p?=
	=?us-ascii?q?Mizoh2WeGdxc26bBGN2/xhgRfzUJnB7Loc0qyK6vumADJdqsfd+Fk5M7V0Hy?=
	=?us-ascii?q?cfjssXmwFySOWkMmbcaMDQUiohAc5ZX0Vk9XzoeWJcGcL5ekGA6ibqtW1aFR?=
	=?us-ascii?q?rwLxd6KfroEYDOkcu3y/qy+5rOaAlUmTaxe7x/IAi4oAnLq8UbgItvJqk1xx?=
	=?us-ascii?q?bGv3BFZ/lYyWR0KFyJgh3y/N2w/Jlt8yRRv/Iu6ctNWrjkcqo7ULJVEi0oP3?=
	=?us-ascii?q?g668P3uxbDSxCP5mYHXWUNjhVIGQnF4wrkUZr3ryD3q/By2CiePc3xULA0RT?=
	=?us-ascii?q?Gv5LplRRP0lCsKMSMy/2/Nisx0kalVvhSvqRJiyILQeY2YNP5zcqbbcNgHR2?=
	=?us-ascii?q?ROQ9xRWjRBDI2icoUBAekPM+FXoIfyvFYCsRizCBOwCO711jNEmnn71rA63e?=
	=?us-ascii?q?Q7FgHG2RQtEc8SsHvKtNX1NLkdUeaox6fVyDXMdfdW2TPj54nIbxsspuqMUq?=
	=?us-ascii?q?9rccfK1UkuFx/KjlWXqYD/OTOVzf4Cv3KU7+pnS+KikmgqoBxyrDi33sogl4?=
	=?us-ascii?q?bEi40Pxl3E6Cl12pg5KNKmREJhfNKpFoZbuTuAOItsWMwiRnlluCM9yrIbp5?=
	=?us-ascii?q?G2ZDMKyJE7xx7HbPyHbpSI7grjVOmPJTd4g2poeK6liBao8Eig1/b8WtO10F?=
	=?us-ascii?q?ZMoCpFlcLMuW4R2BDJ9siGSudy/kem2TqV0QDc9vpELlwumareKp4hxqY8lp?=
	=?us-ascii?q?sVsUvdAi/7gFj6gaCZe0k++uWk9v7rbqvpq5OCLYN4lxnyMqE0lcy+BeQ4PB?=
	=?us-ascii?q?IOX2+e+emkz73s4Fb5Ta5Wjvw2jqbZsJfaKd4dpq6iGQBZyIkj6xGhDzu+yt?=
	=?us-ascii?q?QXgWEHLE5ZeBKAl4XpPkvBIOzkDfe/nVutnjhryOrcPr37HJrNMmTDnazufb?=
	=?us-ascii?q?Z67E5cxw4zws5F651IDbEBJer5WlXtu9zAEh85Lwu0zv7lCNV40YMeQ3iPAq?=
	=?us-ascii?q?6CMK7Jt1+H/OcvLPeNZIMPvzb9Mfcl7eb0jXAlgV8dYbWp3ZwPZXCgBPtmPk?=
	=?us-ascii?q?GZbGH0gtgbDGcKuhMyTOntiF2FSz5ceWy+UL475jE+EIimF5vMRpixgLyd2y?=
	=?us-ascii?q?e2BplWZmFAClCRHnbkbp+LW+oRZyKTPs9siSYEWqa8RI8hzx6uqBX2xKZgLu?=
	=?us-ascii?q?rR4icYr47s1MBp5+3PkhE/7Th0D8Wb02GQQGB4h3gISCEq06Biu0x9y0uD0K?=
	=?us-ascii?q?hhj/xdEtxc+u5JUgMkOpPH0ex6BM79WhjbcteKVlmmWNOmDi81Tt4rxN8OeU?=
	=?us-ascii?q?l9Ec24jh/fxyqqH6MVl7uTCZwv7K3c23nxJ8Bgy3fJz6QhkVYmTdVVNWG8ha?=
	=?us-ascii?q?5w6RLTB4jXnEWdjaqqcr4c3CGevFuEmHGDuEBeTR5YT6rIRzYca1HQoNC/4V?=
	=?us-ascii?q?nNHJG0DrFyCRdM0c6PLONxb9TtiVhXDKP4NM/2f3O6m2D2Aw2BgLyLcty5KC?=
	=?us-ascii?q?0mwCzBBR1cwEgo9nGcOF17W3as?=
X-IPAS-Result: =?us-ascii?q?A2CqAgDiq95d/wHyM5BlHAEBAQEBBwEBEQEEBAEBgX6Bb?=
	=?us-ascii?q?wWBbSASKo0ukXeRRAkBAQEBAQEBAQEbHAEBhECCJjgTAhABAQEEAQEBAQEFA?=
	=?us-ascii?q?wEBbIVDgjspgxwLAUaBUYJjP4JTJbQyM4kagUiBNoc9gzuBOHmBB4ERNoMbh?=
	=?us-ascii?q?DWGAgSNFBWKAHSWHII3gjmTEQwbgkCMKYs2qm0igVgrCAIYCCEPgydQERSGV?=
	=?us-ascii?q?BeOQSMDMIt9ASQHghQBAQ?=
Received: from tarius.tycho.ncsc.mil (HELO tarius.infosec.tycho.ncsc.mil)
	([144.51.242.1])
	by emsm-gh1-uea11.NCSC.MIL with ESMTP; 27 Nov 2019 17:04:48 +0000
Received: from moss-pluto.infosec.tycho.ncsc.mil (moss-pluto [192.168.25.131])
	by tarius.infosec.tycho.ncsc.mil (8.14.7/8.14.4) with ESMTP id
	xARH4gO5064133; Wed, 27 Nov 2019 12:04:42 -0500
From: Stephen Smalley <sds@tycho.nsa.gov>
To: selinux@vger.kernel.org
Subject: [RFC PATCH v2] security,lockdown,selinux: implement SELinux lockdown
Date: Wed, 27 Nov 2019 12:04:36 -0500
Message-Id: <20191127170436.4237-1-sds@tycho.nsa.gov>
MIME-Version: 1.0
X-MC-Unique: yeZk1r7jMjmCX8fyYrSyew-1
X-MC-Unique: UCaU2wCfNuyaUuQa0Q7GXA-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xARH4xPZ010103
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 28 Nov 2019 09:30:15 -0500
Cc: matthewgarrett@google.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	Stephen Smalley <sds@tycho.nsa.gov>
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
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Implement a SELinux hook for lockdown.  If the lockdown module is also
enabled, then a denial by the lockdown module will take precedence over
SELinux, so SELinux can only further restrict lockdown decisions.
The SELinux hook only distinguishes at the granularity of integrity
versus confidentiality similar to the lockdown module, but includes the
full lockdown reason as part of the audit record as a hint in diagnosing
what triggered the denial.  To support this auditing, move the
lockdown_reasons[] string array from being private to the lockdown
module to the security framework so that it can be used by the lsm audit
code and so that it is always available even when the lockdown module
is disabled.

Note that the SELinux implementation allows the integrity and
confidentiality reasons to be controlled independently from one another.
Thus, in an SELinux policy, one could allow operations that specify
an integrity reason while blocking operations that specify a
confidentiality reason. The SELinux hook implementation is
stricter than the lockdown module in validating the provided reason value.

Sample AVC audit output from denials:
avc:  denied  { integrity } for pid=3402 comm="fwupd"
 lockdown_reason="/dev/mem,kmem,port" scontext=system_u:system_r:fwupd_t:s0
 tcontext=system_u:system_r:fwupd_t:s0 tclass=lockdown permissive=0

avc:  denied  { confidentiality } for pid=4628 comm="cp"
 lockdown_reason="/proc/kcore access"
 scontext=unconfined_u:unconfined_r:test_lockdown_integrity_t:s0-s0:c0.c1023
 tcontext=unconfined_u:unconfined_r:test_lockdown_integrity_t:s0-s0:c0.c1023
 tclass=lockdown permissive=0

Signed-off-by: Stephen Smalley <sds@tycho.nsa.gov>
---
 include/linux/lsm_audit.h           |  2 ++
 include/linux/security.h            |  2 ++
 security/lockdown/lockdown.c        | 24 -----------------------
 security/lsm_audit.c                |  5 +++++
 security/security.c                 | 30 +++++++++++++++++++++++++++++
 security/selinux/hooks.c            | 30 +++++++++++++++++++++++++++++
 security/selinux/include/classmap.h |  2 ++
 7 files changed, 71 insertions(+), 24 deletions(-)

diff --git a/include/linux/lsm_audit.h b/include/linux/lsm_audit.h
index 915330abf6e5..99d629fd9944 100644
--- a/include/linux/lsm_audit.h
+++ b/include/linux/lsm_audit.h
@@ -74,6 +74,7 @@ struct common_audit_data {
 #define LSM_AUDIT_DATA_FILE	12
 #define LSM_AUDIT_DATA_IBPKEY	13
 #define LSM_AUDIT_DATA_IBENDPORT 14
+#define LSM_AUDIT_DATA_LOCKDOWN 15
 	union 	{
 		struct path path;
 		struct dentry *dentry;
@@ -93,6 +94,7 @@ struct common_audit_data {
 		struct file *file;
 		struct lsm_ibpkey_audit *ibpkey;
 		struct lsm_ibendport_audit *ibendport;
+		int reason;
 	} u;
 	/* this union contains LSM specific data */
 	union {
diff --git a/include/linux/security.h b/include/linux/security.h
index a8d59d612d27..df7a4d293fe8 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -125,6 +125,8 @@ enum lockdown_reason {
 	LOCKDOWN_CONFIDENTIALITY_MAX,
 };
 
+extern const char *const lockdown_reasons[LOCKDOWN_CONFIDENTIALITY_MAX+1];
+
 /* These functions are in security/commoncap.c */
 extern int cap_capable(const struct cred *cred, struct user_namespace *ns,
 		       int cap, unsigned int opts);
diff --git a/security/lockdown/lockdown.c b/security/lockdown/lockdown.c
index 8a10b43daf74..5a952617a0eb 100644
--- a/security/lockdown/lockdown.c
+++ b/security/lockdown/lockdown.c
@@ -16,30 +16,6 @@
 
 static enum lockdown_reason kernel_locked_down;
 
-static const char *const lockdown_reasons[LOCKDOWN_CONFIDENTIALITY_MAX+1] = {
-	[LOCKDOWN_NONE] = "none",
-	[LOCKDOWN_MODULE_SIGNATURE] = "unsigned module loading",
-	[LOCKDOWN_DEV_MEM] = "/dev/mem,kmem,port",
-	[LOCKDOWN_KEXEC] = "kexec of unsigned images",
-	[LOCKDOWN_HIBERNATION] = "hibernation",
-	[LOCKDOWN_PCI_ACCESS] = "direct PCI access",
-	[LOCKDOWN_IOPORT] = "raw io port access",
-	[LOCKDOWN_MSR] = "raw MSR access",
-	[LOCKDOWN_ACPI_TABLES] = "modifying ACPI tables",
-	[LOCKDOWN_PCMCIA_CIS] = "direct PCMCIA CIS storage",
-	[LOCKDOWN_TIOCSSERIAL] = "reconfiguration of serial port IO",
-	[LOCKDOWN_MODULE_PARAMETERS] = "unsafe module parameters",
-	[LOCKDOWN_MMIOTRACE] = "unsafe mmio",
-	[LOCKDOWN_DEBUGFS] = "debugfs access",
-	[LOCKDOWN_INTEGRITY_MAX] = "integrity",
-	[LOCKDOWN_KCORE] = "/proc/kcore access",
-	[LOCKDOWN_KPROBES] = "use of kprobes",
-	[LOCKDOWN_BPF_READ] = "use of bpf to read kernel RAM",
-	[LOCKDOWN_PERF] = "unsafe use of perf",
-	[LOCKDOWN_TRACEFS] = "use of tracefs",
-	[LOCKDOWN_CONFIDENTIALITY_MAX] = "confidentiality",
-};
-
 static const enum lockdown_reason lockdown_levels[] = {LOCKDOWN_NONE,
 						 LOCKDOWN_INTEGRITY_MAX,
 						 LOCKDOWN_CONFIDENTIALITY_MAX};
diff --git a/security/lsm_audit.c b/security/lsm_audit.c
index e40874373f2b..2d2bf49016f4 100644
--- a/security/lsm_audit.c
+++ b/security/lsm_audit.c
@@ -27,6 +27,7 @@
 #include <linux/dccp.h>
 #include <linux/sctp.h>
 #include <linux/lsm_audit.h>
+#include <linux/security.h>
 
 /**
  * ipv4_skb_to_auditdata : fill auditdata from skb
@@ -425,6 +426,10 @@ static void dump_common_audit_data(struct audit_buffer *ab,
 				 a->u.ibendport->dev_name,
 				 a->u.ibendport->port);
 		break;
+	case LSM_AUDIT_DATA_LOCKDOWN:
+		audit_log_format(ab, " lockdown_reason=");
+		audit_log_string(ab, lockdown_reasons[a->u.reason]);
+		break;
 	} /* switch (a->type) */
 }
 
diff --git a/security/security.c b/security/security.c
index 1bc000f834e2..f439c1102b1a 100644
--- a/security/security.c
+++ b/security/security.c
@@ -35,6 +35,36 @@
 #define LSM_COUNT (__end_lsm_info - __start_lsm_info)
 #define EARLY_LSM_COUNT (__end_early_lsm_info - __start_early_lsm_info)
 
+/*
+ * These are descriptions of the reasons that can be passed to the
+ * security_locked_down() LSM hook. Placing this array here allows
+ * all security modules to use the same descriptions for auditing
+ * purposes.
+ */
+const char *const lockdown_reasons[LOCKDOWN_CONFIDENTIALITY_MAX+1] = {
+	[LOCKDOWN_NONE] = "none",
+	[LOCKDOWN_MODULE_SIGNATURE] = "unsigned module loading",
+	[LOCKDOWN_DEV_MEM] = "/dev/mem,kmem,port",
+	[LOCKDOWN_KEXEC] = "kexec of unsigned images",
+	[LOCKDOWN_HIBERNATION] = "hibernation",
+	[LOCKDOWN_PCI_ACCESS] = "direct PCI access",
+	[LOCKDOWN_IOPORT] = "raw io port access",
+	[LOCKDOWN_MSR] = "raw MSR access",
+	[LOCKDOWN_ACPI_TABLES] = "modifying ACPI tables",
+	[LOCKDOWN_PCMCIA_CIS] = "direct PCMCIA CIS storage",
+	[LOCKDOWN_TIOCSSERIAL] = "reconfiguration of serial port IO",
+	[LOCKDOWN_MODULE_PARAMETERS] = "unsafe module parameters",
+	[LOCKDOWN_MMIOTRACE] = "unsafe mmio",
+	[LOCKDOWN_DEBUGFS] = "debugfs access",
+	[LOCKDOWN_INTEGRITY_MAX] = "integrity",
+	[LOCKDOWN_KCORE] = "/proc/kcore access",
+	[LOCKDOWN_KPROBES] = "use of kprobes",
+	[LOCKDOWN_BPF_READ] = "use of bpf to read kernel RAM",
+	[LOCKDOWN_PERF] = "unsafe use of perf",
+	[LOCKDOWN_TRACEFS] = "use of tracefs",
+	[LOCKDOWN_CONFIDENTIALITY_MAX] = "confidentiality",
+};
+
 struct security_hook_heads security_hook_heads __lsm_ro_after_init;
 static BLOCKING_NOTIFIER_HEAD(blocking_lsm_notifier_chain);
 
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 36e531b91df2..ca8a9d1b3ffd 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -6799,6 +6799,34 @@ static void selinux_bpf_prog_free(struct bpf_prog_aux *aux)
 }
 #endif
 
+static int selinux_lockdown(enum lockdown_reason what)
+{
+	struct common_audit_data ad;
+	u32 sid = current_sid();
+	int invalid_reason = (what <= LOCKDOWN_NONE) ||
+			     (what == LOCKDOWN_INTEGRITY_MAX) ||
+			     (what >= LOCKDOWN_CONFIDENTIALITY_MAX);
+
+	if (WARN(invalid_reason, "Invalid lockdown reason")) {
+		audit_log(audit_context(),
+			  GFP_ATOMIC, AUDIT_SELINUX_ERR,
+			  "lockdown_reason=invalid");
+		return -EINVAL;
+	}
+
+	ad.type = LSM_AUDIT_DATA_LOCKDOWN;
+	ad.u.reason = what;
+
+	if (what <= LOCKDOWN_INTEGRITY_MAX)
+		return avc_has_perm(&selinux_state,
+				    sid, sid, SECCLASS_LOCKDOWN,
+				    LOCKDOWN__INTEGRITY, &ad);
+	else
+		return avc_has_perm(&selinux_state,
+				    sid, sid, SECCLASS_LOCKDOWN,
+				    LOCKDOWN__CONFIDENTIALITY, &ad);
+}
+
 struct lsm_blob_sizes selinux_blob_sizes __lsm_ro_after_init = {
 	.lbs_cred = sizeof(struct task_security_struct),
 	.lbs_file = sizeof(struct file_security_struct),
@@ -7042,6 +7070,8 @@ static struct security_hook_list selinux_hooks[] __lsm_ro_after_init = {
 	LSM_HOOK_INIT(bpf_map_free_security, selinux_bpf_map_free),
 	LSM_HOOK_INIT(bpf_prog_free_security, selinux_bpf_prog_free),
 #endif
+
+	LSM_HOOK_INIT(locked_down, selinux_lockdown),
 };
 
 static __init int selinux_init(void)
diff --git a/security/selinux/include/classmap.h b/security/selinux/include/classmap.h
index 32e9b03be3dd..594c32febcd8 100644
--- a/security/selinux/include/classmap.h
+++ b/security/selinux/include/classmap.h
@@ -244,6 +244,8 @@ struct security_class_mapping secclass_map[] = {
 	  {"map_create", "map_read", "map_write", "prog_load", "prog_run"} },
 	{ "xdp_socket",
 	  { COMMON_SOCK_PERMS, NULL } },
+	{ "lockdown",
+	  { "integrity", "confidentiality", NULL } },
 	{ NULL }
   };
 
-- 
2.23.0


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

