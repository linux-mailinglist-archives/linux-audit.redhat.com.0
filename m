Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id DEB8822CFFB
	for <lists+linux-audit@lfdr.de>; Fri, 24 Jul 2020 22:50:41 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-d8TlFV9tOFutM-vH3T1I0A-1; Fri, 24 Jul 2020 16:50:37 -0400
X-MC-Unique: d8TlFV9tOFutM-vH3T1I0A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EBAB800464;
	Fri, 24 Jul 2020 20:50:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E8781001B2C;
	Fri, 24 Jul 2020 20:50:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0F2BC1809554;
	Fri, 24 Jul 2020 20:50:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06OKoSxA032480 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 24 Jul 2020 16:50:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 05A99201828C; Fri, 24 Jul 2020 20:50:28 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 00A352018283
	for <linux-audit@redhat.com>; Fri, 24 Jul 2020 20:50:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F19CD1832D2B
	for <linux-audit@redhat.com>; Fri, 24 Jul 2020 20:50:24 +0000 (UTC)
Received: from sonic311-22.consmr.mail.bf2.yahoo.com
	(sonic311-22.consmr.mail.bf2.yahoo.com [74.6.131.196]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-201-H7IIuYDIPpWsACtHekU9fQ-1;
	Fri, 24 Jul 2020 16:50:22 -0400
X-MC-Unique: H7IIuYDIPpWsACtHekU9fQ-1
X-YMail-OSG: 7N9tpWEVM1nbstJT7cnDTIcoObPKYvKTk.CdKWmXk9_8tfTA35znK0IeIj4Mb3_
	IRJfund9qwktTegmaIiQUKSP4vVh9k4KwiYw8fY9r9AS5dvOzJY7HyFlIsl8cK9W.eD5421.BZ5O
	TEgTJiFGEfcUobFfSKrwXlING3PEhGL6TWzGS_wXo3Z2vGrG5REyJrPL33fLD5l09xYzjiXLpEVw
	a0WxxXtx7KayAtxR8kN39YEaLU8mpBYoqADVtgE_aqnShLwNerGRcuiLWUtRGPz7qYkjLZPASgdm
	WQ_gQDp07KpMUb99QVOw5hl1Rreji.UBRupS_cWHkQblRN_GnKFyJMLdX.YN1bL4Erb5fLzlxN5g
	lAptx7b3HaUxQpm.22giVE.ZO_QyEq5sASrSBKFk7pYNMYQmKk_FbfFB84GXCc_PEUZwB3TSDYzH
	pBRhZ5pM0XzA3AQ5oV3xLTJhg5c.umXbGbWKhT.p2XUsbB39cE6F7deddXtlQZDcvwwJoTqXNXCf
	IY49xWrimUtjN.CHsTNh_zJPEvNBJ5ddv.PgPV3QfpC5MzGql9lpYy9XWYUQw5DRb76CXEPpye5E
	pIwzwcVrVvO6uRUnYBXCo2jbbrKgRLqKdCB49PKi5hLyP.IIAWuGvTSS4z4bcRizYnhV5zsHqUo8
	BxUyKC639cFkLcRj77karGm_jUX2wobvl1G47.CxIEc.hspXbRqrXZahG7v3GWuN47KGnvCFUowy
	p26QTXSnH0sTe3uLfPNriITTGwrhnrCA0XThhdvxcR0aNoc_klT3a1SjUaQhU8KQ8.ybgi8orcap
	6kMpUo1x.0jpF7v.d8RTUiMUX5PwVZ98dzW35AGDTBy0is59G6Dz4WWjzDS2dj3NNF_sHFgpBNiQ
	qqfSkEWt1YVvXPLqJOadgz7vztYYXYQ1a_95d8N2lpV6_9wShHsS4QPjm3_Ue.iczJ18vqS1jI9L
	2Y1uNWn2L9kPHxVEIKCu9txIRm6Q6BeNjGKSq.adWPYlfuG6lsHoMc5Bob54gcah8vapA7L3kb8z
	qvksMYOLzb1t6SjbpqIV7fJeksbI09eU.4gUcoEd1S8YxXE5NoHZux1YPxHxXa4.rryImugG9C5b
	YNPRP45OTc7A3gHDxMj1X1xPB34x5HdhiEPZb_yQIarEi_QZ0jG0rOlc0.SEBEhcerhenXQvFkKr
	i0cfZP8hz3mMwr1UtwE0V.MI29fFUzpQ3OstvNnhD7YSgcEMe_wGQE5YEebxlycHaTnNPkOXc6bG
	LxceRv9DV3VPPv7oRYK0IYCNAK_J78N.R0NVBhs7aCRiOJVam0bjwA08Bz95SOu.N419Tu6Kw8ex
	fjt8nGb9UCQpyhtEitMf_XDUgqTOmtODjBhRGIH2CLKuLnv9vXtEdBuNQHC.ArIOv9Er0rnXmJqX
	MMwk5BB0Op.ro7XaMacJ5YJYwMHtfr1mqjqJOpBcA9nKLwyOptRG91kFN5bEbY70-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic311.consmr.mail.bf2.yahoo.com with HTTP;
	Fri, 24 Jul 2020 20:50:22 +0000
Received: by smtp419.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 60c342417e9848f4eb43b1eee7277e1e; 
	Fri, 24 Jul 2020 20:50:19 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v19 16/23] LSM: Use lsmcontext in security_inode_getsecctx
Date: Fri, 24 Jul 2020 13:32:19 -0700
Message-Id: <20200724203226.16374-17-casey@schaufler-ca.com>
In-Reply-To: <20200724203226.16374-1-casey@schaufler-ca.com>
References: <20200724203226.16374-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
index 43f8a2660d37..02dc3b5ef57b 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -560,7 +560,7 @@ void security_release_secctx(struct lsmcontext *cp);
 void security_inode_invalidate_secctx(struct inode *inode);
 int security_inode_notifysecctx(struct inode *inode, void *ctx, u32 ctxlen);
 int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32 ctxlen);
-int security_inode_getsecctx(struct inode *inode, void **ctx, u32 *ctxlen);
+int security_inode_getsecctx(struct inode *inode, struct lsmcontext *cp);
 int security_locked_down(enum lockdown_reason what);
 #else /* CONFIG_SECURITY */
 
@@ -1399,7 +1399,8 @@ static inline int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32
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
index 862f0bc2f114..ddbaf2073b02 100644
--- a/security/security.c
+++ b/security/security.c
@@ -2263,9 +2263,18 @@ int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32 ctxlen)
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

