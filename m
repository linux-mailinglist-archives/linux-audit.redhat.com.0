Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C0ED41A039A
	for <lists+linux-audit@lfdr.de>; Tue,  7 Apr 2020 02:19:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586218798;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Yznw8CQqkFYqiOCkaiO51eR7UvJfHkD2qbckUv/bzo0=;
	b=Q/gNXNuJTpeYadbGzsI/cnTsCnwDUxmOtUHpOlbPJga26JVJWnaDKrUxnSMVzQYQmgojaI
	xwF0e8eWtVXKY6mg+S9R2IAPU8UzvewybpHjcmHPb8pJBuX7wie9WQtV5PFmwrXfWLfxw2
	oOwak8ZctgAew50HzSmzaTSr4r4NW0c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-NhAfqQ-9MK2HS3_sP9Eybg-1; Mon, 06 Apr 2020 20:19:56 -0400
X-MC-Unique: NhAfqQ-9MK2HS3_sP9Eybg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 709C618C35A2;
	Tue,  7 Apr 2020 00:19:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B9DD100164D;
	Tue,  7 Apr 2020 00:19:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E526B18089CF;
	Tue,  7 Apr 2020 00:19:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0370JjaL025950 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 6 Apr 2020 20:19:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BA4E52166B29; Tue,  7 Apr 2020 00:19:45 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4D532166B2D
	for <linux-audit@redhat.com>; Tue,  7 Apr 2020 00:19:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E70F2185A78E
	for <linux-audit@redhat.com>; Tue,  7 Apr 2020 00:19:41 +0000 (UTC)
Received: from sonic311-31.consmr.mail.ne1.yahoo.com
	(sonic311-31.consmr.mail.ne1.yahoo.com [66.163.188.212]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-506-82O2xMvJORqgnBCkzKPJtQ-1;
	Mon, 06 Apr 2020 20:19:39 -0400
X-MC-Unique: 82O2xMvJORqgnBCkzKPJtQ-1
X-YMail-OSG: oMN_LdgVM1nyxwDnpz46eUws47Kb7qmHGsjwvH76RAANMXKlogWEDIQQ53s0OTx
	paSgeAMJFfOEVYpFqSk8524BpTkEpJCZMPspNk3gUovaFaqT_HsklUTfWX_6toETCHMzy2GOKQ.3
	WwllnI26U9VkN1qjcdGBb8rJCwrrCf7E1bD2m8W105xhWgv7y0NsfZlHUk9SE4bcn8W9UU.Bf8zc
	t2LC0GmCZDp0MQBwfOxbTWhMkJRPNfOg7lakQrMjyGMqe6Ot_Lotgg7sGGOAMcpmbHjMX8yZrfcn
	qKiuGrBh1uckCN8fHGL8sfBqMO_xWg.VlnYFZDD6Db1Ouma15Voag6G3o3aGz67thjLDh9q7l80w
	OE_cvvPtrncGATp2OcRLuzDyt29pbhGPusjH15aecoKlOCfMzZNXA_6b0Esz_fpEANHQUSMKcWWP
	..S4961L6Q2dSwBqgn783FnKZO1NfoS3mH.XYetLZl6XzL5CYFohz6eer6z5b_mLmyiPWpL_fxHq
	jaBUeBKDQ3swhu7Fzpjgwe7o517bXuThkHv3ZbV7AbCm.z.e70f12V9FxY2qcuc3DIwVHqPqg6XJ
	tZFVFW._1.s55Pnca6gv3T903IW.5UdZHUJrvs16yWwknq8JktwHCUcUjtdYyt7U3qpKIvgeD7T1
	1S2I63nyjC6Ubd5SYThTl8ZLqTTqaUzS_h7J6uQhh.NdiUn1BSmONrjLkFy1.JuY31uWqaFLSkKz
	zyYkHo8UhqKmQRRRGrc7qc61LQpzX8CLXZdMWbgd3Ky23xFs4KEhdq8EkazH891BCr.kJF.O35rm
	.VMeCBHCYnQ.TTVa4pHuEcdPaJyIWwWP90hHvJZDVR.aMkgLsXSTruiKOE.F7QGmpDmUWR4Lf2Z.
	tRftnE6VvI90nrJbthpURiQhgRmjW7N8ddHfpnSohV.6qeN_S7gY8hUbuDRCgUrDvAkvkzFc0lxW
	1ZvS1YzfUhKvkxsO3xYonaBboV2Yrgm2RByl18kLO.NdCXogaOV8RcVnyV7NtbCo.xeWp609CSO_
	DYmJ_A9ddvXxr617F0FCOUHlU7vgtRQdwwWWSngsGU5OLOHjjrg6IXatST4YOcdKlcPBI1DPtHy3
	jsKyB3upFljmRUmJfK52TbdOsJRQq37.Vxi1TiT.ZgxPbBKHgyWryuO6FZE.rm_ZW2794KlcvcNV
	VveRqAmquiq6FFPdirFWTBJrHlnb3ukod2a71XkZa.50YuU9d5fDCUJT7iKJRLsQVa9dFWaYZipi
	k2DPJJ1w.inggaQwkSeENXoaa5w6pPooqJVd7L_SG4uwpI6QQY0mmcn4CcWmw9_2gxFnZlXPj6dL
	RZhWAsiDUHBE94eYdXLFjTP.LHkYwGK6IGs82YuT6GuD1cqrfqNihnfRjrhOM_46utFWc3zCJyfL
	rPsKLrqccbxdDaAuFqbeFQ8qaJB2XlTlJf0H7_.zlynyBp2qF0OqiFw--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic311.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 7 Apr 2020 00:19:39 +0000
Received: by smtp407.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID ea1af58f83a714a42a96c4b340cba5cc; 
	Tue, 07 Apr 2020 00:19:35 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v16 16/23] LSM: Use lsmcontext in security_inode_getsecctx
Date: Mon,  6 Apr 2020 17:01:52 -0700
Message-Id: <20200407000159.43602-17-casey@schaufler-ca.com>
In-Reply-To: <20200407000159.43602-1-casey@schaufler-ca.com>
References: <20200407000159.43602-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0370JjaL025950
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
index df308b1b37fa..ac8eb77d0053 100644
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
index ec64ccd2e168..fac5547dd89e 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -556,7 +556,7 @@ void security_release_secctx(struct lsmcontext *cp);
 void security_inode_invalidate_secctx(struct inode *inode);
 int security_inode_notifysecctx(struct inode *inode, void *ctx, u32 ctxlen);
 int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32 ctxlen);
-int security_inode_getsecctx(struct inode *inode, void **ctx, u32 *ctxlen);
+int security_inode_getsecctx(struct inode *inode, struct lsmcontext *cp);
 int security_locked_down(enum lockdown_reason what);
 #else /* CONFIG_SECURITY */
 
@@ -1382,7 +1382,8 @@ static inline int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32
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
index 356c5cd94c48..84f33bd4990a 100644
--- a/security/security.c
+++ b/security/security.c
@@ -2211,9 +2211,18 @@ int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32 ctxlen)
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

