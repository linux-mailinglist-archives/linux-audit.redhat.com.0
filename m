Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A78572AF02B
	for <lists+linux-audit@lfdr.de>; Wed, 11 Nov 2020 12:58:11 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509--Wkia-NzOFa9_cLGnT8Q1g-1; Wed, 11 Nov 2020 06:58:08 -0500
X-MC-Unique: -Wkia-NzOFa9_cLGnT8Q1g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A9E91008301;
	Wed, 11 Nov 2020 11:58:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 106C96115F;
	Wed, 11 Nov 2020 11:58:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C46D844A43;
	Wed, 11 Nov 2020 11:57:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AB6K4ov010355 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 11 Nov 2020 01:20:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B9A9810F2702; Wed, 11 Nov 2020 06:20:04 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4A5D10F26FE
	for <linux-audit@redhat.com>; Wed, 11 Nov 2020 06:20:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C5DB1021F85
	for <linux-audit@redhat.com>; Wed, 11 Nov 2020 06:20:00 +0000 (UTC)
Received: from out30-43.freemail.mail.aliyun.com
	(out30-43.freemail.mail.aliyun.com [115.124.30.43]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-405-CWL6WYPTM3KJpuT9nCFa8Q-1;
	Wed, 11 Nov 2020 01:19:57 -0500
X-MC-Unique: CWL6WYPTM3KJpuT9nCFa8Q-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01424;
	MF=alex.shi@linux.alibaba.com; NM=1; PH=DS; RN=4; SR=0;
	TI=SMTPD_---0UEx57L3_1605075591
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com
	fp:SMTPD_---0UEx57L3_1605075591) by smtp.aliyun-inc.com(127.0.0.1);
	Wed, 11 Nov 2020 14:19:51 +0800
Subject: Re: [PATCH] audit: remove unused macros
To: Richard Guy Briggs <rgb@redhat.com>, Paul Moore <paul@paul-moore.com>
References: <1604651482-9780-1-git-send-email-alex.shi@linux.alibaba.com>
	<20201110152310.GB55411@madcap2.tricolour.ca>
	<CAHC9VhQiQoZh8in+zoYa5hbTN_yL-=mt7nTQFN9GAyQZ+tz-Ww@mail.gmail.com>
	<20201111030359.GB55072@madcap2.tricolour.ca>
From: Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <bae6d2fa-64d9-623b-6729-3827d745ed7a@linux.alibaba.com>
Date: Wed, 11 Nov 2020 14:19:17 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201111030359.GB55072@madcap2.tricolour.ca>
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
X-Mailman-Approved-At: Wed, 11 Nov 2020 06:57:51 -0500
Cc: linux-audit@redhat.com, linux-kernel@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Thanks for comments!
So here is the v2 according to your suggestion!

>From 033425b6072ff4cee05d6bbffc97cd6a4c13166c Mon Sep 17 00:00:00 2001
From: Alex Shi <alex.shi@linux.alibaba.com>
Date: Fri, 6 Nov 2020 16:31:22 +0800
Subject: [PATCH v2] kernel/audit: fix macros warning

Some unused macros could cause gcc warning:
kernel/audit.c:68:0: warning: macro "AUDIT_UNINITIALIZED" is not used
[-Wunused-macros]
kernel/auditsc.c:104:0: warning: macro "AUDIT_AUX_IPCPERM" is not used
[-Wunused-macros]
kernel/auditsc.c:82:0: warning: macro "AUDITSC_INVALID" is not used
[-Wunused-macros]

AUDIT_UNINITIALIZED and AUDITSC_INVALID are still meaningful and could
be used in code.

Just remove AUDIT_AUX_IPCPERM.

Thanks comments from Richard Guy Briggs and Paul Moore.

Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
Cc: Paul Moore <paul@paul-moore.com>
Cc: Eric Paris <eparis@redhat.com>
Cc: linux-audit@redhat.com
Cc: linux-kernel@vger.kernel.org
---
 kernel/audit.c   |  2 +-
 kernel/auditsc.c | 10 ++++------
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/kernel/audit.c b/kernel/audit.c
index ac0aeaa99937..e22f22bdc000 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -67,7 +67,7 @@
 #define AUDIT_DISABLED		-1
 #define AUDIT_UNINITIALIZED	0
 #define AUDIT_INITIALIZED	1
-static int	audit_initialized;
+static int	audit_initialized = AUDIT_UNINITIALIZED;
 
 u32		audit_enabled = AUDIT_OFF;
 bool		audit_ever_enabled = !!AUDIT_OFF;
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 183d79cc2e12..ea0ed81ddee0 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -102,8 +102,6 @@ struct audit_aux_data {
 	int			type;
 };
 
-#define AUDIT_AUX_IPCPERM	0
-
 /* Number of target pids per aux struct. */
 #define AUDIT_AUX_PIDS	16
 
@@ -552,11 +550,11 @@ static int audit_filter_rules(struct task_struct *tsk,
 			break;
 
 		case AUDIT_EXIT:
-			if (ctx && ctx->return_valid)
+			if (ctx && ctx->return_valid != AUDITSC_INVALID)
 				result = audit_comparator(ctx->return_code, f->op, f->val);
 			break;
 		case AUDIT_SUCCESS:
-			if (ctx && ctx->return_valid) {
+			if (ctx && ctx->return_valid != AUDITSC_INVALID) {
 				if (f->val)
 					result = audit_comparator(ctx->return_valid, f->op, AUDITSC_SUCCESS);
 				else
@@ -1488,7 +1486,7 @@ static void audit_log_exit(void)
 			 context->arch, context->major);
 	if (context->personality != PER_LINUX)
 		audit_log_format(ab, " per=%lx", context->personality);
-	if (context->return_valid)
+	if (context->return_valid != AUDITSC_INVALID)
 		audit_log_format(ab, " success=%s exit=%ld",
 				 (context->return_valid==AUDITSC_SUCCESS)?"yes":"no",
 				 context->return_code);
@@ -1625,7 +1623,7 @@ void __audit_free(struct task_struct *tsk)
 	 * need to log via audit_log_exit().
 	 */
 	if (tsk == current && !context->dummy && context->in_syscall) {
-		context->return_valid = 0;
+		context->return_valid = AUDITSC_INVALID;
 		context->return_code = 0;
 
 		audit_filter_syscall(tsk, context,
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

