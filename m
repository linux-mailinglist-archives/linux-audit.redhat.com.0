Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A3A221D4101
	for <lists+linux-audit@lfdr.de>; Fri, 15 May 2020 00:29:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589495381;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=htYejBevj8lTjyCEoPQs5AcAPyBEhAolQKOOtSEI7AI=;
	b=OX4uiCEllPXUQPchSari5v72smifMS9FZbe1czM87AyP2qvWBVyBLeGO5n0pafRt5BS9v5
	OHzu3Q8wQ13myN9EUpo01zulo6ZrWjuzZGTD69kx3Y0dOHuJfZNcZOAJ3lNzrT+PPAEO+J
	jneLif7ryQRdySjGj+4+v4yKHyeF994=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-UTukDSIkMoGGsPoKLuAvaw-1; Thu, 14 May 2020 18:29:39 -0400
X-MC-Unique: UTukDSIkMoGGsPoKLuAvaw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF0768015CE;
	Thu, 14 May 2020 22:29:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D40B15D9D7;
	Thu, 14 May 2020 22:29:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AA9924E9B5;
	Thu, 14 May 2020 22:29:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04EMTVCa020092 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 14 May 2020 18:29:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B0D12F5AFB; Thu, 14 May 2020 22:29:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A537113E774
	for <linux-audit@redhat.com>; Thu, 14 May 2020 22:29:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA49E89C836
	for <linux-audit@redhat.com>; Thu, 14 May 2020 22:29:28 +0000 (UTC)
Received: from sonic316-27.consmr.mail.ne1.yahoo.com
	(sonic316-27.consmr.mail.ne1.yahoo.com [66.163.187.153]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-420-YVy4M8ZQPFmRtVT6Ji8bUQ-1;
	Thu, 14 May 2020 18:29:26 -0400
X-MC-Unique: YVy4M8ZQPFmRtVT6Ji8bUQ-1
X-YMail-OSG: V2MWXj4VM1l9p20rWoqTKkoY3lNt7CnLK1TkyKciYKjg04mshSSDiHpzA1jnAC6
	icfSWi0DcfLrmyI4gE3BxqBVW.to18coaHicxghpfHU_eDxlZdnq3tmClAZa3JxaWmS8ZO5E9cIK
	DeReSvNa6q6Bva0Ul8LjIiXmhYgh2DmXRmG_qU8s9UkAExrrKlIW7wTygu9pR.BuEzUsrJ0FhQgW
	sqZ.U8kmygXZaT2ODoOuCCB0xn0fXj0wbH_bBJAeE3fBRTDO2qofZtg1DhTkikdVXZRLSFPGPEP5
	LBP_mKcFZyuuYJDlolK2zzP80RLHn.7wYaYba.JGhyFGnLXTQMywZQkYsodVDdg7cpqZrQN_sJkn
	tZ1JWkZMuaPIPMrFb1jFYjLcY6fTGxZAoWbAYDDMZzMEBBKSlT4qGYnBnYws5DkuXWm1RbmSQiiy
	cChXqngIIme4QiyG46WGT3.xHIpTS8Lj7WINkSlEUm7e08lD2mJLH4IXJR5WsIhvtlkA8mCXygZc
	S97B6UpKT8lUyLcYVR1GscLnbinK127sAczHCrZXEf2X3SkUDigsbMJ43nRTSesDo8ikYEN3bHtS
	ossKUVY5AombF2j1CXbU596qJ56vErmrrpdT.ad07fQgJKdaMQWZABey.Pudeo9qUl6Ow_4ycamC
	XXrX6RUMVs5OhuxDE14GdLFM0AM9U2J9cM0DpNg71mZIAOhiiDZeTPnUnnZuHTdeVcsgHxRb5pWz
	zdHOuXkM6J00BtnI4adLsFYLevn0QinQaSZPWTLsSOrryOmiYoFbqL2MWBj0UNA1Gl_sHFHVOWz9
	ti56LDRCY8euf2gAA_VtoUYK.U0u7tmN136q0LPvJHpbeEtwqXN2FvhCY14udhAK6CAO4LHKTv5y
	o2qTHBwqbYAg9QyTjK80H6_JQ4paZmdSKntia55Sj3bCmBmfR3kQhXaYIAZrCte8T.y7gmla4xSu
	xqg_nJ0K69teynsEwtep9MzLIf9Vu0Nnt25CwwMccEv4X5ZNbs9GDgTs7Pv7qLKHcGx8I_7VDxEi
	MBNW0cLRaLJyNVLXkA3j8pMRKxq2_6aedSPwsMM4SZzq1sRf5LhflfbVBJSFCJAYsPfPeIdhzdhX
	KIdp5wZl_OkAFg7KbfZiJneqWnn0.43hOCE9YMF5QZTDRYjPdY6Q4jdoZbg1h.MgMnCuC8YVMAFS
	a8rZF_8uErd0sHdhZaQ4_bo68tRVSEr62RcsKRb6WqxSvEV0Pk0BG1CInH6hyw5xXpWEFNececx3
	3TEXeBzEZ_QCKKsekrLtQBIwun.mpc3SXPI4..FVMISHiKpEZisE4yFOa8Bm8Si9oUxYlJUQThyK
	nnZwLJ.B4XwUNSxOOZiFc_ZA80rWOgo0q3ob5SI5FPoCqWYxzAnHGvhD94LgDHkPyMjmxnZDAAPt
	fEkA7gYmAZ2M1HDC11JDR8l_dlmmkTzX0Gr6lYIRpU7WCqpbFBQQioms-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic316.consmr.mail.ne1.yahoo.com with HTTP;
	Thu, 14 May 2020 22:29:25 +0000
Received: by smtp407.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID fb4317f000220668872eb2209d604646; 
	Thu, 14 May 2020 22:29:20 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v17 16/23] LSM: Use lsmcontext in security_inode_getsecctx
Date: Thu, 14 May 2020 15:11:35 -0700
Message-Id: <20200514221142.11857-17-casey@schaufler-ca.com>
In-Reply-To: <20200514221142.11857-1-casey@schaufler-ca.com>
References: <20200514221142.11857-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
Cc: john.johansen@canonical.com, linux-audit@redhat.com, sds@tycho.nsa.gov
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
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Change the security_inode_getsecctx() interface to fill
a lsmcontext structure instead of data and length pointers.
This provides the information about which LSM created the
context so that security_release_secctx() can use the
correct hook.

Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 fs/nfsd/nfs4xdr.c        | 23 +++++++++--------------
 include/linux/security.h |  5 +++--
 security/security.c      | 13 +++++++++++--
 3 files changed, 23 insertions(+), 18 deletions(-)

diff --git a/fs/nfsd/nfs4xdr.c b/fs/nfsd/nfs4xdr.c
index 61d6b8a0e8f0..6673221d5606 100644
--- a/fs/nfsd/nfs4xdr.c
+++ b/fs/nfsd/nfs4xdr.c
@@ -2379,11 +2379,11 @@ nfsd4_encode_layout_types(struct xdr_stream *xdr, u32 layout_types)
 #ifdef CONFIG_NFSD_V4_SECURITY_LABEL
 static inline __be32
 nfsd4_encode_security_label(struct xdr_stream *xdr, struct svc_rqst *rqstp,
-			    void *context, int len)
+			    struct lsmcontext *context)
 {
 	__be32 *p;
 
-	p = xdr_reserve_space(xdr, len + 4 + 4 + 4);
+	p = xdr_reserve_space(xdr, context->len + 4 + 4 + 4);
 	if (!p)
 		return nfserr_resource;
 
@@ -2393,13 +2393,13 @@ nfsd4_encode_security_label(struct xdr_stream *xdr, struct svc_rqst *rqstp,
 	 */
 	*p++ = cpu_to_be32(0); /* lfs */
 	*p++ = cpu_to_be32(0); /* pi */
-	p = xdr_encode_opaque(p, context, len);
+	p = xdr_encode_opaque(p, context->context, context->len);
 	return 0;
 }
 #else
 static inline __be32
 nfsd4_encode_security_label(struct xdr_stream *xdr, struct svc_rqst *rqstp,
-			    void *context, int len)
+			    struct lsmcontext *context)
 { return 0; }
 #endif
 
@@ -2496,9 +2496,7 @@ nfsd4_encode_fattr(struct xdr_stream *xdr, struct svc_fh *fhp,
 	int err;
 	struct nfs4_acl *acl = NULL;
 #ifdef CONFIG_NFSD_V4_SECURITY_LABEL
-	struct lsmcontext scaff; /* scaffolding */
-	void *context = NULL;
-	int contextlen;
+	struct lsmcontext context = { };
 #endif
 	bool contextsupport = false;
 	struct nfsd4_compoundres *resp = rqstp->rq_resp;
@@ -2556,7 +2554,7 @@ nfsd4_encode_fattr(struct xdr_stream *xdr, struct svc_fh *fhp,
 	     bmval0 & FATTR4_WORD0_SUPPORTED_ATTRS) {
 		if (exp->ex_flags & NFSEXP_SECURITY_LABEL)
 			err = security_inode_getsecctx(d_inode(dentry),
-						&context, &contextlen);
+						       &context);
 		else
 			err = -EOPNOTSUPP;
 		contextsupport = (err == 0);
@@ -2986,8 +2984,7 @@ nfsd4_encode_fattr(struct xdr_stream *xdr, struct svc_fh *fhp,
 
 #ifdef CONFIG_NFSD_V4_SECURITY_LABEL
 	if (bmval2 & FATTR4_WORD2_SECURITY_LABEL) {
-		status = nfsd4_encode_security_label(xdr, rqstp, context,
-								contextlen);
+		status = nfsd4_encode_security_label(xdr, rqstp, &context);
 		if (status)
 			goto out;
 	}
@@ -2999,10 +2996,8 @@ nfsd4_encode_fattr(struct xdr_stream *xdr, struct svc_fh *fhp,
 
 out:
 #ifdef CONFIG_NFSD_V4_SECURITY_LABEL
-	if (context) {
-		lsmcontext_init(&scaff, context, contextlen, 0); /*scaffolding*/
-		security_release_secctx(&scaff);
-	}
+	if (context.context)
+		security_release_secctx(&context);
 #endif /* CONFIG_NFSD_V4_SECURITY_LABEL */
 	kfree(acl);
 	if (tempfh) {
diff --git a/include/linux/security.h b/include/linux/security.h
index c625b69b729e..3f53098ee89f 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -555,7 +555,7 @@ void security_release_secctx(struct lsmcontext *cp);
 void security_inode_invalidate_secctx(struct inode *inode);
 int security_inode_notifysecctx(struct inode *inode, void *ctx, u32 ctxlen);
 int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32 ctxlen);
-int security_inode_getsecctx(struct inode *inode, void **ctx, u32 *ctxlen);
+int security_inode_getsecctx(struct inode *inode, struct lsmcontext *cp);
 int security_locked_down(enum lockdown_reason what);
 #else /* CONFIG_SECURITY */
 
@@ -1381,7 +1381,8 @@ static inline int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32
 {
 	return -EOPNOTSUPP;
 }
-static inline int security_inode_getsecctx(struct inode *inode, void **ctx, u32 *ctxlen)
+static inline int security_inode_getsecctx(struct inode *inode,
+					   struct lsmcontext *cp)
 {
 	return -EOPNOTSUPP;
 }
diff --git a/security/security.c b/security/security.c
index a22c019d397c..d082ef0673d0 100644
--- a/security/security.c
+++ b/security/security.c
@@ -2230,9 +2230,18 @@ int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32 ctxlen)
 }
 EXPORT_SYMBOL(security_inode_setsecctx);
 
-int security_inode_getsecctx(struct inode *inode, void **ctx, u32 *ctxlen)
+int security_inode_getsecctx(struct inode *inode, struct lsmcontext *cp)
 {
-	return call_int_hook(inode_getsecctx, -EOPNOTSUPP, inode, ctx, ctxlen);
+	struct security_hook_list *hp;
+
+	memset(cp, 0, sizeof(*cp));
+
+	hlist_for_each_entry(hp, &security_hook_heads.inode_getsecctx, list) {
+		cp->slot = hp->lsmid->slot;
+		return hp->hook.inode_getsecctx(inode, (void **)&cp->context,
+						&cp->len);
+	}
+	return -EOPNOTSUPP;
 }
 EXPORT_SYMBOL(security_inode_getsecctx);
 
-- 
2.24.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

