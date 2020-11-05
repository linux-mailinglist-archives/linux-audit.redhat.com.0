Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A73912A747D
	for <lists+linux-audit@lfdr.de>; Thu,  5 Nov 2020 02:07:12 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-xxe1K1woMlOp8SwTNOR59A-1; Wed, 04 Nov 2020 20:07:09 -0500
X-MC-Unique: xxe1K1woMlOp8SwTNOR59A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3025803F69;
	Thu,  5 Nov 2020 01:07:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 689455B4CF;
	Thu,  5 Nov 2020 01:07:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EB8E258123;
	Thu,  5 Nov 2020 01:07:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A516woV030029 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 4 Nov 2020 20:06:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B5A791004041; Thu,  5 Nov 2020 01:06:58 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B114A100332B
	for <linux-audit@redhat.com>; Thu,  5 Nov 2020 01:06:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5ACE6185A78B
	for <linux-audit@redhat.com>; Thu,  5 Nov 2020 01:06:56 +0000 (UTC)
Received: from sonic313-16.consmr.mail.ne1.yahoo.com
	(sonic313-16.consmr.mail.ne1.yahoo.com [66.163.185.39]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-414-HdfsdAuaPyi7ncCXnAKnEQ-1;
	Wed, 04 Nov 2020 20:06:54 -0500
X-MC-Unique: HdfsdAuaPyi7ncCXnAKnEQ-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1604538413; bh=GNr5o7JahmpKikHLt93btXAUHG/JadK4c6VYSaxbcb/=;
	h=From:To:Subject:Date;
	b=JSe+/7OsFMraN4+W7X1jZzfY5IfT3lFxkjK1I4UXU/nAsd/aL1K/+qljMQ5cFJsSTpSWvnFZAUNtl/nt4585gdsvIolGc02oKyIVhbFFnmtCioQbgqv2En2Fc5QO7oiDBJ93RtXcLzp/c1rnc478SpU/GXs9/+J/fGGifdvwFi6ykglfaB/30I0FUd/RDtQ1XqW2/EUAX9GpDgDlKDY7V0JgMh5567NgeYcwIorJHl/iiiBUk3ahmr/mnVIP0OP07UNL/Gj4Y2UpqOcDoGPKrbcFR5J7ylKXVVEzu6UDB8eCThuk6cjbJNq4rbvyEVGoL3kRDql7wKUue3Sg6fyQPQ==
X-YMail-OSG: 3jJ_VdEVM1lxSqD1rE4e6z8wa6C8cfumMl79N6zzjYfkRNEz8pbG3HkRSqt8o._
	aHlpZvaCTbKhtUuy7StcXvj9IjP1XTcWotUjuVD7UjuEeCtayfm5Ktsyi6b4BvGdX_O_jLMZY2Ef
	mpBPEXqrY9Uu8VLOiRQP3H8txZB6LI3I9aXLTIqQ0hRAfnxvrrsoiIqCUr1mQiV97.HIwLP4S2AK
	vbAoDQgjIRQKcWkpNqBCMomHXO04tnlNchVRqFd50bKiRY_8g71r4GnXSbt6ghN7e28bhBRf6qWI
	cB7dLbPLbjN9FQcWeMktNXMq4VRnKdqmjHxe8u9QaAehM_tpR8Rmt9qPHV_UNCXyIoq7Cx30LFhH
	1GYz5K04YklSYYLWgJpzQZB2MjpTy0K5sJix2OWAICSgneytZ5.DHNVbUa5R5wvAfomB_OM4.MV.
	Ya_vjosvR3kMNHuN2CVkAIfC3GbVmoM3JEsFiotjLs_L3AcP9ry8VOi6oztEBZbYPTnO64fvVCds
	t2vG_rzdaJwD.6pNcUzrhuNVP0mhpfT90d24LIuRzI3JAVlxbafctPYeIB_4UXYJJt7PiHAB5qFC
	8HjzankrLV53ZHr2916qOGjGjNj6BiMSFcb_WLsasLjiclbgkc9XotpEff4lae9rvrSsxv.4AEFZ
	V8dmYYNME_rdjALIHShtdGcu4DUOHO7gcUaFmvD_fiyyzvP1t21czZ2cjtu_NuLiLawHyfy6SK6u
	SqlSMF9JHhtb3uDj3HASlXYSkX__pd9TDHQnV5u_yhs5U44VFWN3xcZWpyqxa.P48rm8zzVVzvmI
	UDZ3jTVFX9y43QJIYGgPAJ_LWaf7nYM1X0JeHKYU9NMVqcPLzZedpMsV1IaTWLwrZGnl8y4TRnC6
	iqYrhr8g4KVMyxesvIuMEivp2gtcLHkCkuXiDkHCsdibhATkfeaR8UeFl.mIy9ANlxcvYox9pVx8
	r.cCLeUV2zqaASGJw1F8M50anEvCQWqBcMgNZKP4NFK.lTaPupyGEZVe_EyQxYQW9mJmph3TGCZU
	KSi6FBJgJ7Phv8RknypXr_s6fmZM3AOf4otNq4PKHPDJAaRGdtyBE5q3UAwz3rtLmDHjLR28bwRb
	kpqmumUxxd_awXEtGsgkHcuadyVRPSYZruqIuaFqVUH4ghTadJhZPbLCQ0J_QC3ICNqGZYTILfuM
	DO7ARRkkqTAPuE0Tv0PXordueMZIQUquvX7Qc5zabrvgXpUekqiOFFosBbKgxLRPEluRJfFyWAzx
	hjVN0ACkyobZm7KnHGzEtlfH3Zm5VwmcIqR9tPa33NVSEq6HfwYxQajz0SQu4YFVqF7g9Mnjs0M9
	NImMc22MyP9mipKz54qYTCu3G9GFo7o9ShMFcTsWCi5uCd8FuhdZaGITBYjKFRT3iIaKDYAeNN2Y
	OK6_dYtnydeu.FzNSfr24j_JYOiyHDyzn.XPQreCtrZQ_flCUnVRQ8tWrI.aymEVtmHNAmfKb4pV
	R8wnWu7Al4l0E_L5cNho1tD41VCWieRVnlPpAJptpTcdI4fWWt0pl5JXSR_xsVN4zeM5ECt7zqn2
	Kja1JS5PYZNAnKZk1aSG6b5mRA_QsgMjENKNlGKznVYwAwjpkitBfkhHBGX0.4irvgsOsxglvAk9
	wzZVJdkw2NNNAi8m37JNlM1nXIm6YPprQ5CNBZYzBan5rlAXFgJHXhumpDMEFmj.K18XMx.qrsgh
	3ul6BUjvnB989QviD5jXsvx_bmwLm4tLq6VkdVo5kmttzly_6BzeUs7NWvK7s42qifTrazLyWtii
	eWs4NVFhlzcEyREBn2MRjxJ13ohmslvNYhCY5uunF3MDvRoOMkR__cxFlIWWmDnd01B93JOw3ipE
	d8.NMZToR2aQ7zqMcDnjdSwecm9b89E1AVDzSZSKzQzrW6OB_nn_URx2iwhfE_IG27ljjd45MSfL
	67NDRtvVoHoWTq9ntMLEzA3_KmWhsgNlEdAFmIr6fdsJLtf4ACAtiKPo4IYEE_iVPm58yuI_v2Yu
	TBUYemSkmUssMYl4xL8do0.aWy5b3DVdLOiB_O_1qiDPNVD814rkjRewHTXMgcszNrcHrcArj2lF
	XzUr70DnXW1Ythuyz.uSIw3X3KOqKIrtUh6kcJ36sahKE.mIJda3yrkBuRMJbs2uxrgq.m4RvHZw
	cuj2ttcB7LPqnIsriZoctWwHhVGiuBM6mkn058jRMKUuJ1yVvmahbUJGass16Pa95fyraVEZT7G5
	jLxlRpu1RsThzBea3sZ3hFpyG3fZi9uRYgapdIPrVRCLDahVe8RxmlGii54ilbv1jNfmR82bPguF
	Bn_1pAMtIyzcWb1B.Y83k10rVfhgIWio3AvNJU767QOE7H7UO_kuu8Kcdy_CuQfonbZFkcOP2i3v
	bm5Tcj6yFyqizgkF8GwwXi0vkVXSk8YuwvBeSdr2oakd4_G7rULxjAzbH_mspHSbNLJOIjxGOJKl
	FCiuDtHymDxrB2mlR3KzRR_w21JJn87nVJiPsHGmVWUjxZV25Xu3C4ZFpDJT4OaIk7yeXWZAczn4
	NheI3aqa7UaoR4o6g_lG93qZfrKnJSLkkEnZS_2xLbT6RNeePxCxolKmkWdTt2JJt9RhiOn98RCG
	fpY7XndBHd2hMy.JRN3UO5XnHOE68Scrl155s7nXne3o20wdWdnQ_4pFW6CwQjpEYV8_IxpTYUOH
	6UlORI4DpACCRpFk8ANpXxgCgRMdaNbWZSFqkxPlNViWidfLx2dA1VQSvcMMtsKCXmLSwE2xw38a
	Z2D.FdiMX6D5gyzHYuf7n3bLWIdEWmJSd5.L6PjP.ImSkiM9TxGMcsmsImfjRG3dHahRGDLUtmAB
	.TN.Sddh0DAuTzwWGhK2pgom6EOjpZd.cMSQWw9JhkG9f640Lrp.kqfCjq_pJeayqeqOlH8BP9jG
	N3byDqORKGKx2PH7G6RnChBOhIK_BH16PgFdbg0.M2EmKJn7vsBvUeULDctJOVoLFIioTexpConP
	2qdvDm5M4xwigkR7SySl7cLfIO_BTz4MWKhNorbNgo8Bg0CTADdJdqLA708fcfB7HZ8sQPrRMftN
	iX5L_5JcmssloZYer6FVOdF.CwvjezO7Gl2m9G7xerbWHXYrcCABPwZvoP5C2roE9lP7vqJ6Hz6i
	7ppH7o_KK_elowzylHexw5McsgLnKEWkiUL.wrRvjGOIzn7.zih.oQJ2QCAfRmfbzKVvhCTjb3Q3
	ElvUWg1uaBpCv3scKNvahOPjB6UuHOwjbID1rhbfLV4oufgphGLqytKRc_GAQS6eZxll4KHQllOc
	P_qr1K4O13DA5mHewU.m7ZKwQ398Ll4QCyB__1HEzNuPFGGamtcn3kSXy7EIj0UpYHomMPxH3KDp
	e.Jasebr6nn7LCJiOqaZLlUdbJyzV9k4emDT1_ZV4RoRIMWKjU.dK.6N9KV9svytug206SE4NlDd
	axcIFhsZGIS8-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic313.consmr.mail.ne1.yahoo.com with HTTP;
	Thu, 5 Nov 2020 01:06:53 +0000
Received: by smtp409.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 1448427b61f01d52f59ffdd0cb44fc24; 
	Thu, 05 Nov 2020 01:06:52 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v22 15/23] LSM: Use lsmcontext in security_inode_getsecctx
Date: Wed,  4 Nov 2020 16:49:16 -0800
Message-Id: <20201105004924.11651-16-casey@schaufler-ca.com>
In-Reply-To: <20201105004924.11651-1-casey@schaufler-ca.com>
References: <20201105004924.11651-1-casey@schaufler-ca.com>
MIME-Version: 1.0
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
Cc: linux-nfs@vger.kernel.org, john.johansen@canonical.com,
	linux-kernel@vger.kernel.org, linux-audit@redhat.com, sds@tycho.nsa.gov
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: linux-nfs@vger.kernel.org
---
 fs/nfsd/nfs4xdr.c        | 23 +++++++++--------------
 include/linux/security.h |  5 +++--
 security/security.c      | 13 +++++++++++--
 3 files changed, 23 insertions(+), 18 deletions(-)

diff --git a/fs/nfsd/nfs4xdr.c b/fs/nfsd/nfs4xdr.c
index 4ae7e156ea87..3092568d5ed3 100644
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
index c86c9870b352..20486380c176 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -566,7 +566,7 @@ void security_release_secctx(struct lsmcontext *cp);
 void security_inode_invalidate_secctx(struct inode *inode);
 int security_inode_notifysecctx(struct inode *inode, void *ctx, u32 ctxlen);
 int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32 ctxlen);
-int security_inode_getsecctx(struct inode *inode, void **ctx, u32 *ctxlen);
+int security_inode_getsecctx(struct inode *inode, struct lsmcontext *cp);
 int security_locked_down(enum lockdown_reason what);
 #else /* CONFIG_SECURITY */
 
@@ -1413,7 +1413,8 @@ static inline int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32
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
index 007f23797de1..6c8debdfd629 100644
--- a/security/security.c
+++ b/security/security.c
@@ -2281,9 +2281,18 @@ int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32 ctxlen)
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

