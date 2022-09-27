Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC795ECDED
	for <lists+linux-audit@lfdr.de>; Tue, 27 Sep 2022 22:09:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664309367;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3iIShDxvROJQUDOMVpskCyQTy4ax1kAELTD4Gh1vwvc=;
	b=B5wFf1GomU4N3PnIjxaDN+GwWEHMw3fVc5jfuOCKl8fYZRL/CfWyBHsG5pgRQNDIPp/JfS
	O+IoVvxR5I8sloq4tiaAdRLVvNx7AnwNUEZqn4K4/DOR2w449z3YWD05Op+kmCGrTpM6y/
	HqzH/UZjTUAp2gExVlAp5OvB6Y80rf0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-OZGPoVtdN-qZBHhjG1oDRg-1; Tue, 27 Sep 2022 16:09:25 -0400
X-MC-Unique: OZGPoVtdN-qZBHhjG1oDRg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 871CB86C145;
	Tue, 27 Sep 2022 20:09:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6D28E14152E8;
	Tue, 27 Sep 2022 20:09:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 31BC91946A48;
	Tue, 27 Sep 2022 20:09:23 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E0FE11946586 for <linux-audit@listman.corp.redhat.com>;
 Tue, 27 Sep 2022 20:09:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BAE7A140EBF5; Tue, 27 Sep 2022 20:09:21 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B308F140EBF3
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 20:09:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8AF253804520
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 20:09:21 +0000 (UTC)
Received: from sonic302-28.consmr.mail.ne1.yahoo.com
 (sonic302-28.consmr.mail.ne1.yahoo.com [66.163.186.154]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-645-agBXLwXPNkiszGELhN17Ag-1; Tue,
 27 Sep 2022 16:09:18 -0400
X-MC-Unique: agBXLwXPNkiszGELhN17Ag-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1664309357; bh=bho2X12oNS19WM5/1W3KAWaCNq34D62T/6fZvoQaCmd=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=sLQgZFH4XhMVxWLEUa1l9wD5HnrXJEtv84Nf92dmxHn8PNLVUR1akBgeFwDWoLoWUYY7MPbzxCOszGrLDg9z1/7DnEYFhuuWbFL6vgtlOCF+jd1LkBdn4eEpr32VmXtkLlShCcc4VEwUDsMCuJTw+IyPgbtA2jwBTkUYynIxKL33fXOa3Mng7ue2SQZyZ2mcrspjIBsExSfDc0ZfbgyqMNAu5mRTYpbAvAIjlsJ3KXDmpee6NWh74cVsACW57WLJaWWK/j2RSa8qnvFIULW+JcBGFYcp1UyTVM/RtHKmNzMBV4n8PHb5iP1egJR/VLcBu7s2uzteKDdOx7HusVkX2Q==
X-YMail-OSG: epppJwEVM1mZ0L.s5YTCarJ4gFo_xdBozrarhW5yrNFJWVy6ap4pLmGO5lmXIiz
 _1Gfw0zzWRWoMLKDWr7AWHzho_BwnQ06ZYleH3Hm0CQvKax4ZTSVAcg_ICXRTuSk8K713ARIIhYz
 BCkA4VtWN6SEFitQnJ4ali2HD.BPfwt7ori80uWQOAna1JXohxEa3Ibnp3AFF6Q2AavgJOTVA8iN
 5zIf_37rViwIj0RSk80UpKCbLCa8HxfKAymnUmU9uzZZ4wDF_J7OPJ4aMMtPgu9TjZTK6VCw2eLC
 M77zvDZBGljjoXrxc2RW2hJz.WrBngXZRtGdYKTjdYLQr5eZlpStC46Jj_ttRbVWZYcb5k7NbFb9
 FkU9l82qae_PqxwyAbZPaMOBraavyDG6MT0BJTNakDwYV21v3p8mKWeBxM1LDxAjXmWP3sEPyY8m
 r6iPQtd9t4jrHffIG0GhEKIKwU5gZNqi6D7t_WyxH9OGOQ.CfscGs8A5hSt.ClXv6VRWRHWROhXw
 mFjAMPaDJfCZQkjTBK3cFUVM0ZxfKitmf2xxnAwH8zwJpBtnG4mD7eOWXH0y0iPw1LHzJnl7c1qn
 .31m8sNnlEOgq1I7qqDynfilAkjpZpAIaLBZqyP7GGiTi6eTejyyFLqSK8uoQBTXjWpbnvgCn997
 N36GSd1CUj69YSku20LB9ve8x1bEwwp.s889hwKC9TgUJX851IW_eBIm9dgp0coz1XV8GLn95Lu0
 K3zgTvRtJVabwNqD0jf3izzacMcfNGf4fsMQLCIj4MCv7.QqfpVOVqq.yuI_79ZlaN7tkL0Dgtoq
 ImL9JRxU2ytkEEUywki93WrsAcE0apFmCOsGALlHbm5qE9g3jAXV9EYnG8Rr_XZp6kmLZVB2Iu31
 wKAKnkIMOo.F63wPQGDc_.TSYLNeBVTmUf41_DKykrKkAr0bP.DZENFc49kyPTi_oKF2o6tdWM7N
 7SxuLwXwFrcYK6YP5CKbno4GH6HOrXsrawpI4.nBT.ei.7lsy7wD.GqhOzuFz189MJMPve6okLXI
 7VN.o2dMKrl2iC5OI7VBSMqe9TIF7lsEy_O2_0OcVvRvncgftSZQqQt8naLHPFVEpdhsjJ0pvdgq
 YrASYfyrZOE0ouZV_dnTDNyGr8yWOu5jGJQh7uUnUl5AZKBv1dnQKYumfovgrasiaTUgRgjMrrCF
 YIEKQUe7Ly940BgDLm9Jss_T4dFRIdDfJKND_OPrJUuzN.8sp.SDjtRgdSvIDMVzswpwsk.J1uby
 vIYqFxMGHC4WMJ0gsB98vMxwRo85ZXVTVU7os8vFeu1umc8jNMXxidDzfcFhLq.wzBLkAcBH9Q6Q
 W0WMzC8ZZWWS3wwu0C9ZSgs9g6LlGkxVTzmmHdY16wdJKhJHxJHy28v0HRIuEJYkCG.GhBgSv6Ww
 2Irmw0WEgjtsaJjUB4oaChvJr5yh8uZH4Ch6WnXPKluCmrYcg2Pfm5U8ZO9PODPorb9fsTtOyt3E
 FUZi12R2QkmZ9RhPr.TZtDOdC4x.voa5EF7xQdVgSdKRHeb0Frf8XZX5E70yyLvjF49xCItdDc1Y
 00IT2NRKh6XOtMdCfCDuqxP6cbRz40yC8U8LICWghwt1sTmbWKtsMSUd8eq7DVcCSZWMnefuIEx.
 _JwW91nfECfQOb4L_yiF2hNXjbB3izJFEl2yVTaSa7bpoxdc2JqJ7KL63aj1m0mzRAzESRvJI4Q1
 4ke_oHnGSgH2fCv5RMiNJFxpOnXTvcb9ew4yuJZ2Fbxv0XdXj2lFI3MnIHjrS5uadl9ytCO5C.l.
 QoH_O_R6_PE4Nu6lvKYJe18r9qVeN.2DkXXRWvJ6ddRxCbZMP86QR3xNPWq3lQ3m2q4tmlnrh13O
 3SMB.66.GgnvRUvGdBGYZATeMMozesqXpwjneWnEwigih.zhA54gvJ7XurRhAAP6pC2Ad4nc3p7Z
 qW72F2KGeJdKjA5KuYcAgGi0kIOWUZbNLTS7PGNf0JJkvarQbd37cARipnAb81_HERR90XrI6Mp9
 spewcB4bo1mTbFWgvzuyvfBD_9p1.hd0fJ.Ay9WH8r133EajF6VwkOgvwzgDRzK9MtvP8tu9YnwN
 ORCViLhjEAL3DglrsfKqFM7qURFQGsI.0gEmFkuGkh2jnlNvN7vL8O7PS3pEBPDqsv.OmRnnAr4z
 aLsCyvEXTDj_GxeXZ5AZwp60TYOg8a4.iAfSWIb1wf2Py9yin9DwDC1hagwjr9OurwMbbTeE2PN3
 GQ5cOvH35qakKtpXyVWe6jU.i32zUGzKet36_bdtgciQpVYC9O4eXJWcS6x8vGJ5IC_5GjS2Ntsd
 6cROSt_ws6aJUZAA8ahiJhrB5Hf_dIMVPfE7QQA--
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic302.consmr.mail.ne1.yahoo.com with HTTP; Tue, 27 Sep 2022 20:09:17 +0000
Received: by hermes--production-ne1-6dd4f99767-x2f2n (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 962ba498c220faeab9c55c1f2e7ba390; 
 Tue, 27 Sep 2022 20:09:12 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, paul@paul-moore.com,
 linux-security-module@vger.kernel.org
Subject: [PATCH v38 29/39] Audit: Keep multiple LSM data in audit_names
Date: Tue, 27 Sep 2022 12:54:11 -0700
Message-Id: <20220927195421.14713-30-casey@schaufler-ca.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Replace the osid field in the audit_names structure
with a lsmblob structure. This accommodates the use
of an lsmblob in security_audit_rule_match() and
security_inode_getsecid().

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
Acked-by: Paul Moore <paul@paul-moore.com>
---
 kernel/audit.h   |  2 +-
 kernel/auditsc.c | 22 ++++++++--------------
 2 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/kernel/audit.h b/kernel/audit.h
index 316fac62d5f7..4af63e7dde17 100644
--- a/kernel/audit.h
+++ b/kernel/audit.h
@@ -82,7 +82,7 @@ struct audit_names {
 	kuid_t			uid;
 	kgid_t			gid;
 	dev_t			rdev;
-	u32			osid;
+	struct lsmblob		lsmblob;
 	struct audit_cap_data	fcap;
 	unsigned int		fcap_ver;
 	unsigned char		type;		/* record type */
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index ca00187b4864..e8f632736d2b 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -700,17 +700,16 @@ static int audit_filter_rules(struct task_struct *tsk,
 					 * lsmblob, which happens later in
 					 * this patch set.
 					 */
-					lsmblob_init(&blob, name->osid);
 					result = security_audit_rule_match(
-								&blob,
+								&name->lsmblob,
 								f->type,
 								f->op,
 								&f->lsm_rules);
 				} else if (ctx) {
 					list_for_each_entry(n, &ctx->names_list, list) {
-						lsmblob_init(&blob, n->osid);
 						if (security_audit_rule_match(
-							&blob, f->type, f->op,
+							&n->lsmblob,
+							f->type, f->op,
 							&f->lsm_rules)) {
 							++result;
 							break;
@@ -1564,13 +1563,12 @@ static void audit_log_name(struct audit_context *context, struct audit_names *n,
 				 from_kgid(&init_user_ns, n->gid),
 				 MAJOR(n->rdev),
 				 MINOR(n->rdev));
-	if (n->osid != 0) {
-		struct lsmblob blob;
+	if (lsmblob_is_set(&n->lsmblob)) {
 		struct lsmcontext lsmctx;
 
-		lsmblob_init(&blob, n->osid);
-		if (security_secid_to_secctx(&blob, &lsmctx, LSMBLOB_FIRST)) {
-			audit_log_format(ab, " osid=%u", n->osid);
+		if (security_secid_to_secctx(&n->lsmblob, &lsmctx,
+					     LSMBLOB_FIRST)) {
+			audit_log_format(ab, " osid=?");
 			if (call_panic)
 				*call_panic = 2;
 		} else {
@@ -2278,17 +2276,13 @@ static void audit_copy_inode(struct audit_names *name,
 			     const struct dentry *dentry,
 			     struct inode *inode, unsigned int flags)
 {
-	struct lsmblob blob;
-
 	name->ino   = inode->i_ino;
 	name->dev   = inode->i_sb->s_dev;
 	name->mode  = inode->i_mode;
 	name->uid   = inode->i_uid;
 	name->gid   = inode->i_gid;
 	name->rdev  = inode->i_rdev;
-	security_inode_getsecid(inode, &blob);
-	/* scaffolding until osid is updated */
-	name->osid = lsmblob_first(&blob);
+	security_inode_getsecid(inode, &name->lsmblob);
 	if (flags & AUDIT_INODE_NOEVAL) {
 		name->fcap_ver = -1;
 		return;
-- 
2.37.3

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

