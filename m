Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B2F5ECD39
	for <lists+linux-audit@lfdr.de>; Tue, 27 Sep 2022 21:54:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664308492;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=G9fO52FVs8rj9e4ptpjm4nOMEzCePPeS1Qn5Fi6FzUk=;
	b=GQdXlporNCWjOPm1wBDaOyM2tSorrPIXByoovDXmih1eYjG1AT1ud8j6DY9lI2pnS01ryk
	fKckig1SFDu7KE3aABkEs7JPqgVcnR83rfEyfLzC0u4KYNxKYSWaGydp2DPcB+Xt7b053I
	whdlCVjLyX+SBvdBKny+dbHtw48UrIc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-AIg1-UPyOpegyOd7KcG2Vg-1; Tue, 27 Sep 2022 15:54:50 -0400
X-MC-Unique: AIg1-UPyOpegyOd7KcG2Vg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91399887400;
	Tue, 27 Sep 2022 19:54:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F31BF492B05;
	Tue, 27 Sep 2022 19:54:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D51C51946A4E;
	Tue, 27 Sep 2022 19:54:45 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B03841946586 for <linux-audit@listman.corp.redhat.com>;
 Tue, 27 Sep 2022 19:54:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 92615140EBF5; Tue, 27 Sep 2022 19:54:44 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A820140EBF3
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 19:54:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6AC51803520
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 19:54:44 +0000 (UTC)
Received: from sonic302-28.consmr.mail.ne1.yahoo.com
 (sonic302-28.consmr.mail.ne1.yahoo.com [66.163.186.154]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-364-BDegqN1LPES2ZojwhrEhHQ-1; Tue,
 27 Sep 2022 15:54:42 -0400
X-MC-Unique: BDegqN1LPES2ZojwhrEhHQ-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1664308480; bh=ln/9DuY/ngdUUjXm0bwG0VwCKJITLeSyKKXuEmrP7TK=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=YkVVpPRjPjL2in+MB1WwaPaMvBvhO+eYQYxr6fbYeByV6QFXwQsZZjj4FNPTK/zVStbXojRxVcOXiT2eLa+4w/4Ir/TTZL13+bsiK/M8taPP4CUy9nJoXpbbiEx9VR7YXKWQEjRKksJXwFVpRSIZDUK8rahozzdD5OwDeX6nhv8DxpIbSM6LwRyBzQ1Tt0viovdrpUwD0HOyF0KvOZs02wAehRmSBf4WtcHuyCdnn9owqb2tHs1YfWEryYoJXCpAO3zaCHTAvC+cZMIfOKUVZQsIERjalIpQWZE9tfbQunzNhYzN/GeqXdGnvKIgLjhN/CBnY2ZEqfFxGXk9wNP5dA==
X-YMail-OSG: VdiAsOAVM1lbbijUtWUVTvYKNXBPDMt58xbYuXW91ByJc4HfIZ6Y8pwsOtZdrC5
 2DFS9Nw8_zcidCVowKi0FyRnhPAmfQO2X4If_WDFyRBcvRZ9RxRi9f68B9zdL9snLQ9ghguknaNT
 pSf2J0XRluQ9wr98byCZqnSx5AQNEAbBxRvqbiSIZIEFxZoTiLY07tHpX2Ggm.YUYS0HmLU71pbQ
 _0VlYi8uJQskyVoL1dTTFVTsN9obaXbv9HA0m4Gyat25W8ZzpHL9kNCPd.XsbNiI7_DZuCfjANYT
 O.E5HRz3qnmgZLrfvNFCQuVqHQ8H2i_E6pVFb6q2lbytJy9cQLWm.rW.stQW5jo3MtnFVWyyVT17
 cw.0GMKn.tjIdiUioiMDM0BQdeiOO7EmA9BObXA7K0D0eIg0XJarfSd8SLExgWDIo9aookQqApgC
 HoCpJXEqzSpQm00QK.QhKJIFAgFMsv0pxHuO7WcDEX1ZUkSaYK9pujaeB3u4zI8CROh2l9MyPCTr
 SJwBF21LBZ6DQJU4VHHkSe.lxArykKnRriLF2WV3IGtssYN3ay3JjOSEwR7af41evL0tvC3VKq_P
 Ca1BEs_MDzTcst1IssxwH5h19KD7Cazl7sPaROaaKdYli..DmFAGewM9yekuPMUwwPLeqFlUXp4X
 YRl6jNyeHF6PKUsM8ttQSpRZsyuDazn9vz4PSsq20A6.3QliOy2M7nzTt_Qo0lCCtUKKOAY5JKBm
 8ABNfLmp.R2EG_2CC2o32voocAVh2vh_5E7W2wNaoRuqaU058pXO5DnD6CmoyuLDcvNiX.nQzZBT
 lfaj2SbR9..rEW8cNMnnf1KyzK1_DPej5Cw3PaO93ZXdZ8.VYYggGgrJ1Xx.fy1z7hj6AtYd05LZ
 bnGVu0f52LXSxAmBPF17JC34Mm1DsKP46FRPenFWQb1G1fqiTrpdMxAzxSvaWO25Q6SE3sgZf1y7
 _u2f4UXklbiowOeAeKuotWhJ4.gDMSJHweo3Kna1Ejj3eqLwx0n3GfJ9FYyMz251vG__SCPpkyTQ
 TU4taseUD.9vExiZ.I_IP4KcBsh7fh9AYCwamFUqmpvjMi1Nhw2SAzImOUa3QynSk5L1Oia4YGr0
 7avfS1mmE8CP.WjX5oQxzz5XoiyB80sYPx3YOgQTOFGNMDaIktPwSCg1.j8kGsRPDjwlG2547OcD
 lXjqh_JpTXocSJoFvhko6qaHCucp9d1F7vHIyuDbN4Vh2JgBwT8PHmDVwM8tFyx5NhgOeE69ie9W
 ZEdsXgbgV4wLbcz05dVxJ5kjxhJfkRoIt66ylFrNQBAZangK.y45jBeso6a9BmSqs0CFeUrGsD9p
 .Y.23W.Z1SY_pC7ilI4APXyYkLKgd_JKYpIXxxfAAOZwtUe7azufcoO_Zs4tc1tCbEAAliIDb1SN
 pzXZ52PhGE_lg9lMrMEAc7WBTiUUvHqslict1_NGEgifhZAbLsX.l8jpI1.5iy7pwfzRd3olqXAR
 kjkHGPPa5JAsnCz9_0fpDLJeTAYSeZEiSYd5lavkRggPSYkRuRiQNJ2GMzr7SVT.VmBxUtcsjHb0
 GvH.iLHl07vPN.UR7QrVGu38SnUjzw2WIbG2_SvdLWA2oOuU6fvWdonFsRiOetR37VMZIN29vnDw
 OxeOIc036KraUsJ_M1F6Tcg_t0n2iSrrd06KKMtmjz1JePQkfZB1FBDS8Q7ErtKkcs7p8mDobaPW
 TaymC0ZpN6RaqERFs31z5oDf56TI13tGkGTPWv6ywIRD0.rKXvYMZPw4eyBzCzXSZf.W1Llzmadi
 qihqQSHNh1OCLCTtt86HidKbBufa1Q.YuJs8tZ_mgpPNChOxJuyM7cnYh2aF8E8TTJp.Rja6h6HD
 U5ade3Q1R9E4r4iQms5XLkPk4xtwJ4BydQxMhDsVpZ5ywq0sTF1QUCHga1dlZnU6yDz7N32qnpX1
 XeMXspEpRk62zgtemDxq2NKluowNe3E8DhxJTRnDjoJ0l4RNq_ns6zg4_jo8tKHDqCBu7X.7EB7J
 mgrAFgoyglqhEFtGnmQLqJmC.GjUyZns9pDC44DBeKXpJQTPDbI71QBsSioBYHlQM1zqKFpvVcaa
 jT7WPCKXcEX8cplnZbD8VRDFaAPebVOFkGfXuoAuSQKaq7WtxxCX9t8l9e2f5Gm5Yl7kU4d_.Is7
 e7Z4VO3qR2drnYz7GekW79lnARprSc7_ooEiEtDk3rjpguyhCH.2I6ZNVpucrMscqdSEFta7pnFU
 xtQAqE2NLdODdsd6S_Es8BvFpJdbW2WJMIO8hg9WMzHPacML21QiyvJU-
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic302.consmr.mail.ne1.yahoo.com with HTTP; Tue, 27 Sep 2022 19:54:40 +0000
Received: by hermes--production-bf1-759bcdd488-njfbl (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 0b959d6dc02d7e129b663c80c767d31c; 
 Tue, 27 Sep 2022 19:54:34 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, paul@paul-moore.com,
 linux-security-module@vger.kernel.org
Subject: [PATCH v38 02/39] LSM: Add an LSM identifier for external use
Date: Tue, 27 Sep 2022 12:53:44 -0700
Message-Id: <20220927195421.14713-3-casey@schaufler-ca.com>
In-Reply-To: <20220927195421.14713-1-casey@schaufler-ca.com>
References: <20220927195421.14713-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
Cc: john.johansen@canonical.com, selinux@vger.kernel.org, jmorris@namei.org,
 linux-kernel@vger.kernel.org, linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add an integer member "id" to the struct lsm_id. This value is
a unique identifier associated with each security module. The
values are defined in a new UAPI header file. Each existing LSM
has been updated to include it's LSMID in the lsm_id.

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 include/linux/lsm_hooks.h    |  1 +
 include/uapi/linux/lsm.h     | 32 ++++++++++++++++++++++++++++++++
 security/apparmor/lsm.c      |  2 ++
 security/bpf/hooks.c         |  2 ++
 security/commoncap.c         |  2 ++
 security/landlock/setup.c    |  2 ++
 security/loadpin/loadpin.c   |  2 ++
 security/lockdown/lockdown.c |  4 +++-
 security/safesetid/lsm.c     |  2 ++
 security/selinux/hooks.c     |  2 ++
 security/smack/smack_lsm.c   |  2 ++
 security/tomoyo/tomoyo.c     |  2 ++
 security/yama/yama_lsm.c     |  2 ++
 13 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 include/uapi/linux/lsm.h

diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
index 23054881eb08..407f57aaa6ef 100644
--- a/include/linux/lsm_hooks.h
+++ b/include/linux/lsm_hooks.h
@@ -1603,6 +1603,7 @@ struct security_hook_heads {
  */
 struct lsm_id {
 	const char	*lsm;		/* Name of the LSM */
+	int		id;		/* LSM ID */
 };
 
 /*
diff --git a/include/uapi/linux/lsm.h b/include/uapi/linux/lsm.h
new file mode 100644
index 000000000000..5647c3e220c0
--- /dev/null
+++ b/include/uapi/linux/lsm.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Linus Security Modules (LSM) - User space API
+ *
+ * Copyright (C) 2022 Casey Schaufler <casey@schaufler-ca.com>
+ * Copyright (C) Intel Corporation
+ */
+
+#ifndef _UAPI_LINUX_LSM_H
+#define _UAPI_LINUX_LSM_H
+
+/*
+ * ID values to identify security modules.
+ * A system may use more than one security module.
+ *
+ * LSM_ID_XXX values 32 and below are reserved for future use
+ */
+#define LSM_ID_INVALID		-1
+#define LSM_ID_SELINUX		33
+#define LSM_ID_SMACK		34
+#define LSM_ID_TOMOYO		35
+#define LSM_ID_IMA		36
+#define LSM_ID_APPARMOR		37
+#define LSM_ID_YAMA		38
+#define LSM_ID_LOADPIN		39
+#define LSM_ID_SAFESETID	40
+#define LSM_ID_LOCKDOWN		41
+#define LSM_ID_BPF		42
+#define LSM_ID_LANDLOCK		43
+#define LSM_ID_CAPABILITY	44
+
+#endif /* _UAPI_LINUX_LSM_H */
diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index b71f7d4159d7..fb6c7edd5393 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -24,6 +24,7 @@
 #include <linux/zlib.h>
 #include <net/sock.h>
 #include <uapi/linux/mount.h>
+#include <uapi/linux/lsm.h>
 
 #include "include/apparmor.h"
 #include "include/apparmorfs.h"
@@ -1204,6 +1205,7 @@ struct lsm_blob_sizes apparmor_blob_sizes __lsm_ro_after_init = {
 
 static struct lsm_id apparmor_lsmid __lsm_ro_after_init = {
 	.lsm      = "apparmor",
+	.id       = LSM_ID_APPARMOR,
 };
 
 static struct security_hook_list apparmor_hooks[] __lsm_ro_after_init = {
diff --git a/security/bpf/hooks.c b/security/bpf/hooks.c
index e50de3abfde2..c462fc41dd57 100644
--- a/security/bpf/hooks.c
+++ b/security/bpf/hooks.c
@@ -5,6 +5,7 @@
  */
 #include <linux/lsm_hooks.h>
 #include <linux/bpf_lsm.h>
+#include <uapi/linux/lsm.h>
 
 static struct security_hook_list bpf_lsm_hooks[] __lsm_ro_after_init = {
 	#define LSM_HOOK(RET, DEFAULT, NAME, ...) \
@@ -21,6 +22,7 @@ static struct security_hook_list bpf_lsm_hooks[] __lsm_ro_after_init = {
  */
 struct lsm_id bpf_lsmid __lsm_ro_after_init = {
 	.lsm      = "bpf",
+	.id       = LSM_ID_BPF,
 };
 
 static int __init bpf_lsm_init(void)
diff --git a/security/commoncap.c b/security/commoncap.c
index dab1b5f5e6aa..4e9b140159d8 100644
--- a/security/commoncap.c
+++ b/security/commoncap.c
@@ -25,6 +25,7 @@
 #include <linux/binfmts.h>
 #include <linux/personality.h>
 #include <linux/mnt_idmapping.h>
+#include <uapi/linux/lsm.h>
 
 /*
  * If a non-root user executes a setuid-root binary in
@@ -1448,6 +1449,7 @@ int cap_mmap_file(struct file *file, unsigned long reqprot,
 
 static struct lsm_id capability_lsmid __lsm_ro_after_init = {
 	.lsm      = "capability",
+	.id       = LSM_ID_CAPABILITY,
 };
 
 static struct security_hook_list capability_hooks[] __lsm_ro_after_init = {
diff --git a/security/landlock/setup.c b/security/landlock/setup.c
index fc7b69c5839e..1242c61c9de4 100644
--- a/security/landlock/setup.c
+++ b/security/landlock/setup.c
@@ -8,6 +8,7 @@
 
 #include <linux/init.h>
 #include <linux/lsm_hooks.h>
+#include <uapi/linux/lsm.h>
 
 #include "common.h"
 #include "cred.h"
@@ -25,6 +26,7 @@ struct lsm_blob_sizes landlock_blob_sizes __lsm_ro_after_init = {
 
 struct lsm_id landlock_lsmid __lsm_ro_after_init = {
 	.lsm      = LANDLOCK_NAME,
+	.id       = LSM_ID_LANDLOCK,
 };
 
 static int __init landlock_init(void)
diff --git a/security/loadpin/loadpin.c b/security/loadpin/loadpin.c
index 7e5c897ccbb2..276c8a7cd6fe 100644
--- a/security/loadpin/loadpin.c
+++ b/security/loadpin/loadpin.c
@@ -20,6 +20,7 @@
 #include <linux/string_helpers.h>
 #include <linux/dm-verity-loadpin.h>
 #include <uapi/linux/loadpin.h>
+#include <uapi/linux/lsm.h>
 
 static void report_load(const char *origin, struct file *file, char *operation)
 {
@@ -197,6 +198,7 @@ static int loadpin_load_data(enum kernel_load_data_id id, bool contents)
 
 static struct lsm_id loadpin_lsmid __lsm_ro_after_init = {
 	.lsm      = "loadpin",
+	.id       = LSM_ID_LOADPIN,
 };
 
 static struct security_hook_list loadpin_hooks[] __lsm_ro_after_init = {
diff --git a/security/lockdown/lockdown.c b/security/lockdown/lockdown.c
index 2af4bff8d101..3d3347f3dbd1 100644
--- a/security/lockdown/lockdown.c
+++ b/security/lockdown/lockdown.c
@@ -13,6 +13,7 @@
 #include <linux/security.h>
 #include <linux/export.h>
 #include <linux/lsm_hooks.h>
+#include <uapi/linux/lsm.h>
 
 static enum lockdown_reason kernel_locked_down;
 
@@ -76,7 +77,8 @@ static struct security_hook_list lockdown_hooks[] __lsm_ro_after_init = {
 };
 
 static struct lsm_id lockdown_lsmid __lsm_ro_after_init = {
-	.lsm     = "lockdown",
+	.lsm      = "lockdown",
+	.id       = LSM_ID_LOCKDOWN,
 };
 
 static int __init lockdown_lsm_init(void)
diff --git a/security/safesetid/lsm.c b/security/safesetid/lsm.c
index 3a94103f3c5b..88002731e603 100644
--- a/security/safesetid/lsm.c
+++ b/security/safesetid/lsm.c
@@ -19,6 +19,7 @@
 #include <linux/ptrace.h>
 #include <linux/sched/task_stack.h>
 #include <linux/security.h>
+#include <uapi/linux/lsm.h>
 #include "lsm.h"
 
 /* Flag indicating whether initialization completed */
@@ -263,6 +264,7 @@ static int safesetid_task_fix_setgroups(struct cred *new, const struct cred *old
 
 static struct lsm_id safesetid_lsmid __lsm_ro_after_init = {
 	.lsm      = "safesetid",
+	.id       = LSM_ID_SAFESETID,
 };
 
 static struct security_hook_list safesetid_security_hooks[] = {
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 5e4938f3ce11..9803bbbc6747 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -92,6 +92,7 @@
 #include <linux/fsnotify.h>
 #include <linux/fanotify.h>
 #include <linux/io_uring.h>
+#include <uapi/linux/lsm.h>
 
 #include "avc.h"
 #include "objsec.h"
@@ -7014,6 +7015,7 @@ static int selinux_uring_cmd(struct io_uring_cmd *ioucmd)
 
 static struct lsm_id selinux_lsmid __lsm_ro_after_init = {
 	.lsm      = "selinux",
+	.id       = LSM_ID_SELINUX,
 };
 
 /*
diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
index 5d8bc13feb09..2a88b4e7669e 100644
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@ -43,6 +43,7 @@
 #include <linux/fs_parser.h>
 #include <linux/watch_queue.h>
 #include <linux/io_uring.h>
+#include <uapi/linux/lsm.h>
 #include "smack.h"
 
 #define TRANS_TRUE	"TRUE"
@@ -4776,6 +4777,7 @@ struct lsm_blob_sizes smack_blob_sizes __lsm_ro_after_init = {
 
 static struct lsm_id smack_lsmid __lsm_ro_after_init = {
 	.lsm      = "smack",
+	.id       = LSM_ID_SMACK,
 };
 
 static struct security_hook_list smack_hooks[] __lsm_ro_after_init = {
diff --git a/security/tomoyo/tomoyo.c b/security/tomoyo/tomoyo.c
index 38342c1fa4bc..71eab206ba6e 100644
--- a/security/tomoyo/tomoyo.c
+++ b/security/tomoyo/tomoyo.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/lsm_hooks.h>
+#include <uapi/linux/lsm.h>
 #include "common.h"
 
 /**
@@ -532,6 +533,7 @@ static void tomoyo_task_free(struct task_struct *task)
 
 static struct lsm_id tomoyo_lsmid __lsm_ro_after_init = {
 	.lsm      = "tomoyo",
+	.id       = LSM_ID_TOMOYO,
 };
 
 /*
diff --git a/security/yama/yama_lsm.c b/security/yama/yama_lsm.c
index ed6d45e62e0d..b178d74bb00b 100644
--- a/security/yama/yama_lsm.c
+++ b/security/yama/yama_lsm.c
@@ -18,6 +18,7 @@
 #include <linux/task_work.h>
 #include <linux/sched.h>
 #include <linux/spinlock.h>
+#include <uapi/linux/lsm.h>
 
 #define YAMA_SCOPE_DISABLED	0
 #define YAMA_SCOPE_RELATIONAL	1
@@ -423,6 +424,7 @@ static int yama_ptrace_traceme(struct task_struct *parent)
 
 static struct lsm_id yama_lsmid __lsm_ro_after_init = {
 	.lsm      = "yama",
+	.id       = LSM_ID_YAMA,
 };
 
 static struct security_hook_list yama_hooks[] __lsm_ro_after_init = {
-- 
2.37.3

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

