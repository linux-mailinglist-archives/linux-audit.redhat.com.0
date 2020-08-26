Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id EE7F025336A
	for <lists+linux-audit@lfdr.de>; Wed, 26 Aug 2020 17:19:32 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-udvaxMjgOfCN_EQ89KsCaA-1; Wed, 26 Aug 2020 11:19:29 -0400
X-MC-Unique: udvaxMjgOfCN_EQ89KsCaA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EC6881F02A;
	Wed, 26 Aug 2020 15:19:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E35A15D9CD;
	Wed, 26 Aug 2020 15:19:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4BCB2181A869;
	Wed, 26 Aug 2020 15:19:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07QFJHJX010842 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 26 Aug 2020 11:19:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 37F982068533; Wed, 26 Aug 2020 15:19:17 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DA342068538
	for <linux-audit@redhat.com>; Wed, 26 Aug 2020 15:19:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D7AD102F220
	for <linux-audit@redhat.com>; Wed, 26 Aug 2020 15:19:14 +0000 (UTC)
Received: from sonic310-30.consmr.mail.ne1.yahoo.com
	(sonic310-30.consmr.mail.ne1.yahoo.com [66.163.186.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-401-qQXJl1hTNGmZkJJUUU8zyA-1;
	Wed, 26 Aug 2020 11:19:11 -0400
X-MC-Unique: qQXJl1hTNGmZkJJUUU8zyA-1
X-YMail-OSG: O8B5IdMVM1mqyuSkXaQ2DybSWA3z4bkQrhr_4b3UW8.SXBXEpGn4DHUpYTslrxU
	wTcCxO8YQXKbDB3QEcJvPw0tG5ZaaRcKtdbGtBC6_fkO1rx8fmLQTBWHo2LQ1RkkP7t6g7S.Ze_j
	HafLBtbdaQSiAHaGIyxeE8A.IqPmc4HbB8Eb12X9SZ5YUWO4OiXgrpAlAnOg.3TJpeTuJDDXRrtM
	gS.Y9w75tphGxQPWsKI.5jEv6b24Ogamd_D2lmGvoqgXI_0fFdvBYE7biK.oDieNyS64UVdSJCl5
	x57lSomT32bZct3SWjJHZmZPY1g.bGBkdMEWHYCf.fhHyQW5kKYHxSwmx1kDJ3iK4ZEfxPtLJ08d
	_O3uvI_h9WffwL0EW5PWd84yvS8leqQOTR6rGks1tyl3_634._TyMUGDDxocOguDtKeppmYML2Uz
	KimZyqXbr0p69olsMo7vzLmwamTkPf0ar.94N5orkMANxv.Syg2FAvEMQcOBn3IgMkGrzEEGizWu
	_qwpCacVHbKq8WonSAgwP5JzsuZWxuIdYudL9.0bbhMlaXxelvO_CttN26NA2P18Bu6SFY6dlFs8
	sTpolU7gr.gr6IUPJmOxR0z_uHZA2HLX3cWF5PPPjZyzJYlIJLvNq2KhAIJjS3HF_hOsi.fPoEFq
	7XVbelPMQTfhiv8V8LBR3ULxq_zq2LQCmsATF8..Krxr54X6xZElxfh0PqvNZ6pjOyH0dkovuUYr
	8HezKWczhZSkQ31jtu93WnjymDBr_d_JHdJT9tR3ePSxnhno2_2qEQhMPKlPEqcFWhmfhwhtvfrX
	.C.AkWODGQPCO8LJwkJv7M8m5XzYR0HPrPUrvScUfnNpGrpa8M52VhDUmSEYA22dg3Bn9tU1wxuk
	st2gK3dWx1qDr23TX0dc5kV6Mk6YBHPi9Y4t5fgrn8bpxRCCDq1i.2YxR7SIAEZJ_HAVXXIpwaFJ
	vY3viBcc1FD6HnY4wvnVBI7QeEXqgHA5jwfWS70wMV5A5X_7LxGdtIQ2nRMmbVdJf9G_I.64ojEa
	JVVrZ4c75OZU_sUGCIzu6M43H_JD35g6LTus_DOKCEaq5ujLcGHc5.W4_SXmx2hbOGihwGJ3DmcB
	vaN_TtTMmaKIS_pRSmxT7xYmi02twwPP4c9Uw4k9rwyrwIVxH74ZuS.cXdrQwT5Rj2oR4OH_r45q
	dNCyIeVY1QBXx9vXcz69.lAfRuo2Xa5NCmSOPmwtdxTBmFNQmbHcbSnFW85DZ.I9esUFrwY1FZ0S
	VQurSwRGZzbCkltpJsdfOMQzPK1cTGSH85gulXAHtMVn0jWVg_Dcey0N6NehDsNeVl0k4YSblJoD
	7OHYwzQ6f9Sg1ZO8oeVjK.jFhl1mfrSwMWbOE1Jjr8LeHr_QsPlibgGUAe.VYDc.bn0TflJ0n0BF
	OsHsK7AoV9rhlBIr6dtWVH9Y_khQ3Hm9YYH4a1Kuncc8wiA032jqtQ1DaxCrqEBqAVYdACuPcXa2
	Zp6VXU6KrkmZ9kEC_P8_OUtElL30Z1IhE1ZNif7CQs5PoLSNAhmLPI8Frg2BArHIaK9IOp6GwZmD
	EvFxtilNpydc1JNOL8WASR2P5nL9.jT4Ed8vDefnxovL3dw--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic310.consmr.mail.ne1.yahoo.com with HTTP;
	Wed, 26 Aug 2020 15:19:10 +0000
Received: by smtp415.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 1377ee3152b6b6d6b3fb26df43faf948; 
	Wed, 26 Aug 2020 15:19:06 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v20 16/23] LSM: Use lsmcontext in security_inode_getsecctx
Date: Wed, 26 Aug 2020 07:52:40 -0700
Message-Id: <20200826145247.10029-17-casey@schaufler-ca.com>
In-Reply-To: <20200826145247.10029-1-casey@schaufler-ca.com>
References: <20200826145247.10029-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
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
X-Mimecast-Spam-Score: 0.002
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
index de6b44751dee..40260bfc3a0d 100644
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

