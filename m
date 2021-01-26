Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id C9C7E304445
	for <lists+linux-audit@lfdr.de>; Tue, 26 Jan 2021 18:00:58 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-fkDMMYVNNfOuNyPRC0g9yw-1; Tue, 26 Jan 2021 12:00:54 -0500
X-MC-Unique: fkDMMYVNNfOuNyPRC0g9yw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC8591034AF1;
	Tue, 26 Jan 2021 17:00:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF05A10013BD;
	Tue, 26 Jan 2021 17:00:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 90D495002E;
	Tue, 26 Jan 2021 17:00:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10QH0SXq029452 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 26 Jan 2021 12:00:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 16E8EA7FA1; Tue, 26 Jan 2021 17:00:28 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 109F4A9E56
	for <linux-audit@redhat.com>; Tue, 26 Jan 2021 17:00:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF356805B03
	for <linux-audit@redhat.com>; Tue, 26 Jan 2021 17:00:25 +0000 (UTC)
Received: from sonic314-26.consmr.mail.ne1.yahoo.com
	(sonic314-26.consmr.mail.ne1.yahoo.com [66.163.189.152]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-292-f87j1cKmPlGf3vyI-makGQ-1;
	Tue, 26 Jan 2021 12:00:22 -0500
X-MC-Unique: f87j1cKmPlGf3vyI-makGQ-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1611680421; bh=gwNOCaEy6yt0WOFccZALi7eVruQJp7eZE72TWotB/iV=;
	h=From:To:Subject:Date:From:Subject:Reply-To;
	b=sWJhDg1ncVxvrbKBzQWHWvNcrHCm20z4Ni4cvcBd9nq0J2wLAcwlp80hXP9lzRCCoREheCAGMJKMaFQ2DeHaLporGstFl0knxLTr4Ew9jJo3e1NgEQ3D48hTxfmL4hCDA9vxgMXG+Nr5DuAjpi1T6ck8bRp7Yq4JIToNoDjPkJ9Cnay7xaQkDIBFEA2jFcsqLXbfcqZrhrOHWvGJNgXYlTqRPVMFad5b7dKxpi5pkZ0UdrinFKdEMhMASqasDD4k+xYENzPiZQhcGuOiCnaGcWywq+cGJmMsSlEZ0VmhPbIFsFEnjmj5SrkJN3JDp4TihzNwmFH8hd9LzSzJwkRRQg==
X-YMail-OSG: VLVKbmgVM1m01P9Y9_afw3QuK9jJDTtjs6eCjC0NpBsEYrjrV2bosNpmZMLMLFe
	VK_a0Tz5QVMI8MerDRHZPI6iKBA83_yQhncoOa6sEkwvMf8GavV1WgxjiPzvLBGwCqzLgTptlKID
	i.C9EIVZ_4G8Kc0I5QN6VuGegQtCi5UJJXWVw.M.Ns1jdaT8_EfZltKodKBwkFQy4w4MmKeHhp8V
	D52azi.nVwZB7PB3w5PPxSieJ.TnQJFgZXxuJMdIy3xaaeEV0I3r0ASF3EXBtD2wl7rMlx.aXOzT
	5ZjX70V3jcEvY.eY.1yjG5X.SeLDExt1.0mp3FSJgbIUukoCdO0RNHXYeNOw2XvdP4rtNJFCvcrI
	Y4dm57FVmdfYZsYsKSNSWr83H5BcCBSMZLxaHNI1UUS8o6nMxZF_bVDWkD3dx7b3b.VtyEhH.DFU
	Nrs1e7pZFpvM6V0.oq.oyx.wZXrwxypGSipcsXh3ii6a5d9uRjv9b_TJ.jF.jraeO0YDJIKQk35j
	P_vuWTwHfl4A_DrPQJ5GE5WH..O9sQQIo08Hszq5SL2Gx2r5DVXZIDLlBGbF6FeQbuuiefbgljTI
	RpETRk2n2LMdDkJ.XcEwR4wK2eL5Z.wtdxVS8gv3mf5GbgLRx34oamQFIr.anKnJ5kcFtIDTa3q4
	IKi3Zq9a_6XRJRq.iX90ExKztwFnYAh7QJ4KlZ7T3C19HWI9WeMUFYgkoL9aNz3CKnHnnrDeMe.K
	ihCdY8edOFXgNtOThdZUrEOLaV1AE6DXvL5GHjC6uEyrQ2WQI9D4Hx2lNOp8lpvbz2n0yiYl0bNp
	mvLCd_unoK5grSkRSXFO4rbnX4Oj2AWCrGgR4HM3iR3n_4fuNHmAhO4LbZDF4B.hCaXSUO6B0Ua3
	jJCyXNvZdfs9hkfo.CBSUh3yO6jg0ad8En1u4QbNSccD42hOVl1fQokXTA2EmjcYkLzSeqo7ibxw
	wmrMc2Y85EiAWWNLP8mymkPW4ZWqn1Tndh1mraYZMu9hIgCxUByAVQ3Qoydkiz9hPpQbBW_Hp8GP
	mdqaAIAPVwJwpq608wHGfHyjME3jIJpvAfa3eCL9SS1S.bt4jPAIFVVPmvYxaaWq8UjT__3vnsT3
	X5T6ApMOS3tWRBRIX6ZuXPjzncEXmOIR0ukgnbHIMruISNew4LFIrcF.g3Yv_KIVLDsydIrG.FEW
	OpdpECyPN.UjD72Iex9wMs3CDGw7cyOSpswCzW8MS6Wrv4n3oUpL7o0sBZ9hNRMiNK73YhW40kdy
	.CGdro9UE5eif_AQ0ZXFNn4bZbfQnoC5MmfnDDXanmZVpolQuoZV4VVQmi5sv_Vm1pAczR0wqOZm
	IvJgtuJZii2_.cnLLdnIcBd.J37v71cJjqaiNoycmUTSpC6tcafWQ1ru2jeyqMbyz.f19z2.B8ra
	qiBCM5TV7Zmc6EHQAKTpWLXmdxQcyfsoSLwLYfxwyOj.jk5KUBm77lEyLSaQ5BTXPXuLELnOaDGl
	9RpuxEC6SAskw2163oXgPU3hNgHTPCM6grRtXgSnuIWF61iUWJkivqgpNhvPlIprSDNyj1C5mbaS
	wQcMrWjNiTUmPmIMD8lW8mHV9IB0PCWSdh.vWt1bl0_Q_uJeEPmZm.jWcZSd0r9rRg53ObfrUFsm
	8NcmIqq04ZzwXRuzHo0JA0HJK0872zHiY7QHLMTRje5NBcypoyd6leYJTOx35LcrXWuZ6niYHWYY
	Ke8.cXiz5D3BYNLnOrTtinUdHatZT_pBLUDqwWN5K80E1lICAiRUoVvDZfMS6YmZowPYEUXUOyiU
	CEN7jbPkl9RjCyVlMm3zTVis1XBRuYuH4dwWRd5r3NHXO5t0ttNFQdIe.dWkP2YuEPBSeP9RoHKY
	db36aP7JGBGm05.h5zMSBHkyqeKjnhic3uVozaykMqEx2YiS6IpX4EGDqppI2l5RU0bT6W2iYmTU
	sF2AKkA1J99bQmLDWa0uSxyLhiuIjNZ.pT9Azq_q0KyA.rDgZZMwmYbbm1aBCS5fVhXyQD1J2ozw
	47aIdnNEfuIy73EvJfMOB.vjqjFleTan4BshDX.9_uiOgw9K5YnVNIK6wsv4Ry9fPljlSHJIUhiA
	AGnod7jXncg7Da9ohSNYD27_ujwZD0A8ZWkG8vm0KI3X1HWeX0KO23I60CyfT79k9fCLthYJhxHn
	ngTRlsu1SzUqoW7_YSD6jrmOOEccsQZDwCxd8Vpe.Ttw.MOadIcVklGvHZbr06Ito1GQ3JuhXCLi
	fzGrffSsgtDbdz6MwNNFglsmMDQtie61OKCVWNcK5zTXWtz.n5bUOqHE0l.enNrRrDNtkVSwJjBG
	HQ_Zum.ZTDxDP7tpiHLYxrAnooMGdXfhmVlzxNaFITlB3SomE3n2fd_3N7SzM4bMxTjO8rVFYGcQ
	KICwgh8sXj5i4ysJ5UnF9QMOdr8Iu8K2KgCd7sckRDJ8kgSzY7IpAL62WbweiTBkZLIWqVnLhcvv
	ZMC4N1XIZSAXjzfrTIhR_.MHpW7EIbgP1_Vh.4saJG1TYFbfGlOEU4ikzrLoLj9HrAGlizjmxMrw
	VEmZoNLYzEqC9k06GhqzqNXunSod_66ToBfJYPNcYd3..LGWQRMWhQ4RUcUlwGnkpbM_AfagLjdd
	B6hrn57b.sPWUjqcQGz35p4c5QG9uTR.TwHcsLsCr_QtXWkDWwWVjhs3EhC4Lfls0qJDbixOnVVy
	dcX204NOVcZWnr9i26SFkxDgirRnUrkesdRbTIQ42kQccuPjUqJhk.TDQtTJdu9H3HZN3LshtQ_e
	4EtwXD5xbqX5SinhTM5i0e9mHLgIyUb3aSxg.VTTPYz3j2LTML6Up2G3N6pNR1XE7dRcaqO.A96a
	PFdFv3.tS4cz.S8fi3bRaKFTsRC1r0dgDmoPp4GAD0ZHD_N74y4IyClCC5KecdHkRkbIOsQcAarX
	Uv2.tEpR.Mc6a5f3aI5VvhpFLtT_JuwlCsNawKiIKqBEVHGzmOluy1.y3Yl1W4oFLy0XO3qQiW4G
	x8VSKb4G8GnvGLzL3Zyqm1nUcSQ8rbN9_esmztUTxa.lCQ4o5BVFVSTqMHGzT21JUMmlc4lLVf_Q
	932dtNBrucGSHdTPTIlWGBeqNVs8KeiBnlUY7kIEe0NqNq8BArlEMDIeAGqs3QxGRgcX4z007IL6
	jgA295Y7T_8oq2y4bmYV0jK1HadMYTXKd2Wg-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic314.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 26 Jan 2021 17:00:21 +0000
Received: by smtp416.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 65f04a03bde3b39170d266c6e909c123; 
	Tue, 26 Jan 2021 17:00:15 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v24 17/25] LSM: Use lsmcontext in security_inode_getsecctx
Date: Tue, 26 Jan 2021 08:41:00 -0800
Message-Id: <20210126164108.1958-18-casey@schaufler-ca.com>
In-Reply-To: <20210126164108.1958-1-casey@schaufler-ca.com>
References: <20210126164108.1958-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
index 43698f15a52b..ac855bf37869 100644
--- a/fs/nfsd/nfs4xdr.c
+++ b/fs/nfsd/nfs4xdr.c
@@ -2717,11 +2717,11 @@ nfsd4_encode_layout_types(struct xdr_stream *xdr, u32 layout_types)
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
 
@@ -2731,13 +2731,13 @@ nfsd4_encode_security_label(struct xdr_stream *xdr, struct svc_rqst *rqstp,
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
 
@@ -2834,9 +2834,7 @@ nfsd4_encode_fattr(struct xdr_stream *xdr, struct svc_fh *fhp,
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
@@ -2894,7 +2892,7 @@ nfsd4_encode_fattr(struct xdr_stream *xdr, struct svc_fh *fhp,
 	     bmval0 & FATTR4_WORD0_SUPPORTED_ATTRS) {
 		if (exp->ex_flags & NFSEXP_SECURITY_LABEL)
 			err = security_inode_getsecctx(d_inode(dentry),
-						&context, &contextlen);
+						       &context);
 		else
 			err = -EOPNOTSUPP;
 		contextsupport = (err == 0);
@@ -3314,8 +3312,7 @@ nfsd4_encode_fattr(struct xdr_stream *xdr, struct svc_fh *fhp,
 
 #ifdef CONFIG_NFSD_V4_SECURITY_LABEL
 	if (bmval2 & FATTR4_WORD2_SECURITY_LABEL) {
-		status = nfsd4_encode_security_label(xdr, rqstp, context,
-								contextlen);
+		status = nfsd4_encode_security_label(xdr, rqstp, &context);
 		if (status)
 			goto out;
 	}
@@ -3336,10 +3333,8 @@ nfsd4_encode_fattr(struct xdr_stream *xdr, struct svc_fh *fhp,
 
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
index ead44674cea2..e5740e08bc0c 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -571,7 +571,7 @@ void security_release_secctx(struct lsmcontext *cp);
 void security_inode_invalidate_secctx(struct inode *inode);
 int security_inode_notifysecctx(struct inode *inode, void *ctx, u32 ctxlen);
 int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32 ctxlen);
-int security_inode_getsecctx(struct inode *inode, void **ctx, u32 *ctxlen);
+int security_inode_getsecctx(struct inode *inode, struct lsmcontext *cp);
 int security_locked_down(enum lockdown_reason what);
 #else /* CONFIG_SECURITY */
 
@@ -1418,7 +1418,8 @@ static inline int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32
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
index aab6d3f86e4a..ba39b9b13e08 100644
--- a/security/security.c
+++ b/security/security.c
@@ -2324,9 +2324,18 @@ int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32 ctxlen)
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
2.25.4

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

