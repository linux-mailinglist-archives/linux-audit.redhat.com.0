Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id EDD4028C287
	for <lists+linux-audit@lfdr.de>; Mon, 12 Oct 2020 22:36:25 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-ON5p8-vwOoe6JOyog8E_gw-1; Mon, 12 Oct 2020 16:36:22 -0400
X-MC-Unique: ON5p8-vwOoe6JOyog8E_gw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A8E4801FD8;
	Mon, 12 Oct 2020 20:36:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 339A15D9CD;
	Mon, 12 Oct 2020 20:36:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ADD64180B658;
	Mon, 12 Oct 2020 20:36:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09CKaBlh020227 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 12 Oct 2020 16:36:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 822C62166BCC; Mon, 12 Oct 2020 20:36:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 796EE2166BDB
	for <linux-audit@redhat.com>; Mon, 12 Oct 2020 20:36:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74E7D811E79
	for <linux-audit@redhat.com>; Mon, 12 Oct 2020 20:36:08 +0000 (UTC)
Received: from sonic302-28.consmr.mail.ne1.yahoo.com
	(sonic302-28.consmr.mail.ne1.yahoo.com [66.163.186.154]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-240-d_p28DF9POKCZEY2t6nEqw-1;
	Mon, 12 Oct 2020 16:36:06 -0400
X-MC-Unique: d_p28DF9POKCZEY2t6nEqw-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1602534965; bh=kVCg/O5/0U749SrHWFz4Ixae7Wjz+dHM8W+srt+Cr/0=;
	h=From:To:Subject:Date;
	b=QB7VLJ0auzHazu8ACaQFJqczbkq+rx57JEbtFVy+TJenk2j62w4wNSF4HCpW5tXolzIy2U6eZql3xft8SLKzwEjKqKulCPyj/gIXHPckBqXLONYLKj3VvonWN6JFHZaKj0fNgeAcVZmf5Edx5/WZRp3M4Q0eXtjxbMmdUyqHVo+s/l9dFZ4Li66KgvO8DUhdJFWhoaluME2cuwCfYpO2NhHOrvT3L6W2PcSGnD3ZlDxfYqjDHaT1bX5nDnfoRT9Z5E1nDwxrSOSePbz1KCMrRAK9cR2AruLzPVB7Yg6SsTT+7EbnYRZ5P92y7SfyR/kfuXudSPiNxE6xd4WA7DI/Ng==
X-YMail-OSG: HhqcqSIVM1lrJ9CClI.B.ns.GA7crqyEdaaRb3u9n.Czbj8.r_B4A0qnrDQwzkY
	KBAhfvpQqMAJBDqZoWopv92GijoX_EaPYADePQZN5M4vXbHcGaupA2PoeaXjNvju.qzFvdgAAnoB
	3Qd18qqLpjFxIXK3VnxFcM._jKebKJ8IcHGJUMNw.I0ORPwGe9THs7jrM4Bqoiset3Q0LgXqMA2f
	Lr_ZrhBR_CXO6aKC07Mt1fpAiaTlGPBNuJMEUDjR92MfJRCB_bYUplJSH__s9MqRkBD5mI_.NG6H
	gP4KfaPeN8nYcFyMH9fS_54OMdWwjkvf9BAJlG6FtoMwn4Y96fCPsXnzw1uqfPxznfYpEigepm5w
	1sgo8TF.XxwxNSpuKANgDVONzcbh0pcenW3kTeXzetLrZ6TgLJaBa6v5l1LujK7dXlAE2uHHE7sz
	bQ1ZeTj5LYm5q07uAp.AyuwAxWQ.kGplGFD6IR18ryJItN.rKNAOpdaMMM7XEVD7V37HmOKlrw91
	P5EsHKVeCNsZXdX_G27CwLsrygZutPLWXbQ.5Av6sxTH8z7OjGdBTWNe_CQVLxcg_ZQORhz64Dwk
	U1aNAaizoTitUdZyq_nJpdlgNiKHsljo9ybuA.IpGoTuYzXPuJBM_JRO3Pvs9I5WR1P4HC51QJRY
	L63AjVVtjRE06uIq1wKUus6Xqd69G9Pza.5n1Bs2HWZB26Sq5SX.AFeRHNlXDhr6VzBjeJTJ6cHd
	E8ar4hFsprGS3PN7heDwrKXVnO5ODSHQQglatFwYI_PcCxvyIBPSOk6XaTHTkACsdljLQUFGD8gr
	1QVDhD9fDmDJO5fHMwFJ9tuzPjAUA.PfAZpHEgFtO5CF.usuUbdAAOvw5z5.fgOuUfNvLi.bAQsb
	L1DuZkudj547M50oXaPlTaSttDtprAMoQD5c9s6vw5pMSG8MI7KuBY.56pygJtHHInQc_T4Kcbk4
	ya_CqTd6j8._JX8qJA5A7pNRUcGWWW0zmNlTIarS0AB7.Eb6DLeFHGlw.UMY_c.aejuNM6rLQ1V5
	B8MBI8V3NkhrYSqHML2TnecaqguVC.SL16E4cOvsOxXPVz18ZMx5h_rVkJZA74od1tWDWOcnMvxI
	ssq.nukVNxFckxBjJiUlzY4w_OOiBV84Jhe_gFEw5ih79QgBZRzkiSp.vkmqatq9DkfsFPGw2kM2
	KYWoSVqgnu0JKGJRdWKp7nnWH0rDzhSAicaZV9bnCVErfi5xcP5.3cN.A5URNWNaw9llG2q8m2sM
	o2Sd.OaMR0mUUoCs7S32IQquEw4NXjIxA0vKWjz2_YiHcL6zdFMw5PrC_g0eL23QTInUVzrGrcSa
	k5Xxfko5rVrAPrXJ1uj7kiIOb0gKe.q5anotXYeisxrTm7UqNPnS.4m38hTo1vi1GlfUrr_O9xke
	dZ64dX63pC2N09oifIHf.tJ_UMQxj5EEpZg3_xoCYqba96VlCLc.fnrucQSOkIZqqUPjrQVeZLxn
	LvCQtri.HpaBLW1Y.TexoVIEQPpcuQyTc1eTCXxOx9znCd_tdSi0qaY9afwBgttg2YOWguVsaqEy
	.bygfMrOaACE6UxD.0DWOYZSKSSzblGqhMe5a0tQt8WYk8EQw3KWcRA--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic302.consmr.mail.ne1.yahoo.com with HTTP;
	Mon, 12 Oct 2020 20:36:05 +0000
Received: by smtp405.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 1f969a116641fdc60ea411156bc6ad8a; 
	Mon, 12 Oct 2020 20:35:59 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v21 15/23] LSM: Use lsmcontext in security_inode_getsecctx
Date: Mon, 12 Oct 2020 13:19:16 -0700
Message-Id: <20201012201924.71463-16-casey@schaufler-ca.com>
In-Reply-To: <20201012201924.71463-1-casey@schaufler-ca.com>
References: <20201012201924.71463-1-casey@schaufler-ca.com>
MIME-Version: 1.0
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
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
Acked-by: Paul Moore <paul@paul-moore.com>
Reviewed-by: John Johansen <john.johansen@canonical.com>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 fs/nfsd/nfs4xdr.c        | 23 +++++++++--------------
 include/linux/security.h |  5 +++--
 security/security.c      | 13 +++++++++++--
 3 files changed, 23 insertions(+), 18 deletions(-)

diff --git a/fs/nfsd/nfs4xdr.c b/fs/nfsd/nfs4xdr.c
index 0fc505392728..9352c05f3086 100644
--- a/fs/nfsd/nfs4xdr.c
+++ b/fs/nfsd/nfs4xdr.c
@@ -2600,11 +2600,11 @@ nfsd4_encode_layout_types(struct xdr_stream *xdr, u32 layout_types)
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
 
@@ -2614,13 +2614,13 @@ nfsd4_encode_security_label(struct xdr_stream *xdr, struct svc_rqst *rqstp,
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
 
@@ -2717,9 +2717,7 @@ nfsd4_encode_fattr(struct xdr_stream *xdr, struct svc_fh *fhp,
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
@@ -2777,7 +2775,7 @@ nfsd4_encode_fattr(struct xdr_stream *xdr, struct svc_fh *fhp,
 	     bmval0 & FATTR4_WORD0_SUPPORTED_ATTRS) {
 		if (exp->ex_flags & NFSEXP_SECURITY_LABEL)
 			err = security_inode_getsecctx(d_inode(dentry),
-						&context, &contextlen);
+						       &context);
 		else
 			err = -EOPNOTSUPP;
 		contextsupport = (err == 0);
@@ -3207,8 +3205,7 @@ nfsd4_encode_fattr(struct xdr_stream *xdr, struct svc_fh *fhp,
 
 #ifdef CONFIG_NFSD_V4_SECURITY_LABEL
 	if (bmval2 & FATTR4_WORD2_SECURITY_LABEL) {
-		status = nfsd4_encode_security_label(xdr, rqstp, context,
-								contextlen);
+		status = nfsd4_encode_security_label(xdr, rqstp, &context);
 		if (status)
 			goto out;
 	}
@@ -3229,10 +3226,8 @@ nfsd4_encode_fattr(struct xdr_stream *xdr, struct svc_fh *fhp,
 
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
index 6ddfad740277..b845de9a4aad 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -561,7 +561,7 @@ void security_release_secctx(struct lsmcontext *cp);
 void security_inode_invalidate_secctx(struct inode *inode);
 int security_inode_notifysecctx(struct inode *inode, void *ctx, u32 ctxlen);
 int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32 ctxlen);
-int security_inode_getsecctx(struct inode *inode, void **ctx, u32 *ctxlen);
+int security_inode_getsecctx(struct inode *inode, struct lsmcontext *cp);
 int security_locked_down(enum lockdown_reason what);
 #else /* CONFIG_SECURITY */
 
@@ -1400,7 +1400,8 @@ static inline int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32
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
index 32c66a74ca15..022af5ae8525 100644
--- a/security/security.c
+++ b/security/security.c
@@ -2265,9 +2265,18 @@ int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32 ctxlen)
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

