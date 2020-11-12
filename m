Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8259E2AFBD6
	for <lists+linux-audit@lfdr.de>; Thu, 12 Nov 2020 01:46:12 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-8U20rHa_N26szNNG1jznyw-1; Wed, 11 Nov 2020 19:46:07 -0500
X-MC-Unique: 8U20rHa_N26szNNG1jznyw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDE44AF063;
	Thu, 12 Nov 2020 00:45:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C93052C31E;
	Thu, 12 Nov 2020 00:45:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7753F181A06D;
	Thu, 12 Nov 2020 00:45:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AC0bk9Z022018 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 11 Nov 2020 19:37:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BD1D62156A38; Thu, 12 Nov 2020 00:37:46 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8BDD2156A3C
	for <linux-audit@redhat.com>; Thu, 12 Nov 2020 00:37:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 60D878582AA
	for <linux-audit@redhat.com>; Thu, 12 Nov 2020 00:37:43 +0000 (UTC)
Received: from out30-133.freemail.mail.aliyun.com
	(out30-133.freemail.mail.aliyun.com [115.124.30.133]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-316-j__VUxD1OYCef-sejwSmBw-1;
	Wed, 11 Nov 2020 19:37:40 -0500
X-MC-Unique: j__VUxD1OYCef-sejwSmBw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394;
	MF=alex.shi@linux.alibaba.com; NM=1; PH=DS; RN=4; SR=0;
	TI=SMTPD_---0UF10qhn_1605141454
Received: from IT-FVFX43SYHV2H.lan(mailfrom:alex.shi@linux.alibaba.com
	fp:SMTPD_---0UF10qhn_1605141454) by smtp.aliyun-inc.com(127.0.0.1);
	Thu, 12 Nov 2020 08:37:35 +0800
Subject: Re: [PATCH] audit: remove unused macros
To: Richard Guy Briggs <rgb@redhat.com>
References: <1604651482-9780-1-git-send-email-alex.shi@linux.alibaba.com>
	<20201110152310.GB55411@madcap2.tricolour.ca>
	<CAHC9VhQiQoZh8in+zoYa5hbTN_yL-=mt7nTQFN9GAyQZ+tz-Ww@mail.gmail.com>
	<20201111030359.GB55072@madcap2.tricolour.ca>
	<bae6d2fa-64d9-623b-6729-3827d745ed7a@linux.alibaba.com>
	<20201111131759.GD55072@madcap2.tricolour.ca>
From: Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <9784a39e-c39f-b3f9-3d05-68d63e560c75@linux.alibaba.com>
Date: Thu, 12 Nov 2020 08:36:50 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201111131759.GD55072@madcap2.tricolour.ca>
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
X-Mailman-Approved-At: Wed, 11 Nov 2020 19:45:32 -0500
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============1488735922290811026=="

--===============1488735922290811026==
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: 8bit



鍦� 2020/11/11 涓嬪崍9:17, Richard Guy Briggs 鍐欓亾:
>>  
>>  		audit_filter_syscall(tsk, context,
> This all looks good, but I don't see the initialization of
> context->return_valid in audit_alloc_context() that was mentioned for
> completeness.
> 

Sorry for missing that. Here they are.

>From 5fef5f1b7b745b52bedc9c7eec9fc163202ad421 Mon Sep 17 00:00:00 2001
From: Alex Shi <alex.shi@linux.alibaba.com>
Date: Fri, 6 Nov 2020 16:31:22 +0800
Subject: [PATCH v3] audit: fix macros warnings

Some unused macros could cause gcc warning:
kernel/audit.c:68:0: warning: macro "AUDIT_UNINITIALIZED" is not used
[-Wunused-macros]
kernel/auditsc.c:104:0: warning: macro "AUDIT_AUX_IPCPERM" is not used
[-Wunused-macros]
kernel/auditsc.c:82:0: warning: macro "AUDITSC_INVALID" is not used
[-Wunused-macros]

AUDIT_UNINITIALIZED and AUDITSC_INVALID are still meaningful and should
be in incorporated.

Just remove AUDIT_AUX_IPCPERM.

Thanks comments from Richard Guy Briggs and Paul Moore.

Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
Cc: Paul Moore <paul@paul-moore.com>
Cc: Richard Guy Briggs <rgb@redhat.com>
Cc: Eric Paris <eparis@redhat.com>
Cc: linux-audit@redhat.com
Cc: linux-kernel@vger.kernel.org
---
 kernel/audit.c   |  2 +-
 kernel/auditsc.c | 11 +++++------
 2 files changed, 6 insertions(+), 7 deletions(-)

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
index 183d79cc2e12..9cbe6d5437be 100644
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
@@ -930,6 +928,7 @@ static inline struct audit_context *audit_alloc_context(enum audit_state state)
 	INIT_LIST_HEAD(&context->killed_trees);
 	INIT_LIST_HEAD(&context->names_list);
 	context->fds[0] = -1;
+	context->return_valid = AUDITSC_INVALID;
 	return context;
 }
 
@@ -1488,7 +1487,7 @@ static void audit_log_exit(void)
 			 context->arch, context->major);
 	if (context->personality != PER_LINUX)
 		audit_log_format(ab, " per=%lx", context->personality);
-	if (context->return_valid)
+	if (context->return_valid != AUDITSC_INVALID)
 		audit_log_format(ab, " success=%s exit=%ld",
 				 (context->return_valid==AUDITSC_SUCCESS)?"yes":"no",
 				 context->return_code);
@@ -1625,7 +1624,7 @@ void __audit_free(struct task_struct *tsk)
 	 * need to log via audit_log_exit().
 	 */
 	if (tsk == current && !context->dummy && context->in_syscall) {
-		context->return_valid = 0;
+		context->return_valid = AUDITSC_INVALID;
 		context->return_code = 0;
 
 		audit_filter_syscall(tsk, context,
-- 
1.8.3.1


--===============1488735922290811026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============1488735922290811026==--

