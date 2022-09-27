Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCE35ECDC4
	for <lists+linux-audit@lfdr.de>; Tue, 27 Sep 2022 22:06:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664309168;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aWFIDGTNGS4i7V3ycww3Uqxn1vlc0GnSiX+cSxtj9ac=;
	b=aRTli8hXTCt84QCW/7+GVDqsE8JjDXamxAxutbQzZj/DSTBxdLedyZ5vh5VAeL1vgfeiTG
	GSHk7fqWV9HLUImtJW3R+lH/gcALt0DtcigznLh+0nmfNXXNtmDRPCZEHO0iXCGzBtTOea
	fVZalTkdGxRlG4OQFqUEVBCL57HV4Tk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-20-Zry2bLTjOfOQnyD4OQTbUw-1; Tue, 27 Sep 2022 16:06:06 -0400
X-MC-Unique: Zry2bLTjOfOQnyD4OQTbUw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 163E4101CC6E;
	Tue, 27 Sep 2022 20:06:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CCB22140EBF3;
	Tue, 27 Sep 2022 20:06:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6D7801946A48;
	Tue, 27 Sep 2022 20:06:04 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 362F71946586 for <linux-audit@listman.corp.redhat.com>;
 Tue, 27 Sep 2022 20:06:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E648D2027062; Tue, 27 Sep 2022 20:06:02 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF3FA2027061
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 20:06:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF191101CC62
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 20:06:02 +0000 (UTC)
Received: from sonic304-28.consmr.mail.ne1.yahoo.com
 (sonic304-28.consmr.mail.ne1.yahoo.com [66.163.191.154]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-267-t_3-e3HBONySKuwNZpfSQg-1; Tue,
 27 Sep 2022 16:06:01 -0400
X-MC-Unique: t_3-e3HBONySKuwNZpfSQg-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1664309160; bh=mUmcTURU2sVdBFhDA+/jjmsWgEQhOz36vPEkVO4CD0D=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=GHe7mgqtQLqAjw0c9667PCLiC+tvi3VhSuEzW2QtrvF5CNX/04/hDji9KW6cv+dJhOTqM1HZXWK6ZJe8s3JLfPHYyfKwGY0ydDOFqAUJ5H5AgwcihvaOIUnWK94ao16/OgtLnmNV2Fq/MBrjCYphUuIQ1Lde/TF8Gmko8F5LTDczR5kr+w+Qi/voCzhy0yF/W0TMj8F7taVX8aGaQAC+zQB3DrP5y7QCe97zOsgVOwWigU8eNTy00ycKCxdIDfl2Mbg2EOETkwWPNpqE+1jhcA2zZs2nOybV5lFD5hBf/u/BVT2K1BOqDknM+IcjOUSoVh2fEVOKkNCUhDYxtm+00A==
X-YMail-OSG: sSpgQmgVM1nsq3Ca0Y5AZwCThumSZjKfDo8t21KurnDIPtwxfxIOqP7aCrnYgYA
 NK8A6c0b45h7odRSqP5G3EIZw5tWX8RuYjk90lyFFJD7wK2Bv0Lv6o1hm3FE75hf86H1TUC6bUNv
 8DAGhdPmNJoHex71VwsWOAIVuT2nw8UoIMiFC4Kmb29_jqgu9Zk_7A3XibbPaMPNzNYESp4g_yP0
 tssXhZPIDHiCUtfxYVOiWk1ts3akNV21EV813r625Bcf3crBROXVStdZP18ip5gy2bf084bpyuLB
 IEw8BCxNaK9fAfBs7yo1UFnsLEdYSeG1qSs1QoJcI5l5Gbk3vtPcns5tGQ6cT7mB43YSG4WO_HYy
 4o9SDLeQfXyr_JzkWLZEYlS7iuaEmmZwAr9SPgBRLPHdZxRPMvy5E1A8FT69.x.st3pBkkj9e17f
 0oJXFIDWCaqmdjMxdYt3PE4zzvBlaQbr9Qy6zmojkPNkjs.4hep3Qqx2Gt9T0Bi6pSwResfKLHUn
 HlajICg0gMiJgt9KH51WXmHJ3KAEm80oWGnxdnE0I4l_djEo8LqS54t4WQxI0ExEi2HktsJbA1FG
 4XTAqlI.xHRqms4MeWozkm37jjzlkUMBDQ.bAqt8Ef1XAZfTfTjF3HHpvizQgbclZdimw0omXTcL
 uWoDT7kcvP0bpYirL4PiaSemB1YgZl5DU5.LPJUerxKvpRDUYb5ogCQTaTEugWTOnkZpDwWdlALb
 tqouaRMbxYYmo6n9qSzeu04rjaq4RP7BNMslFsQw.oHEo9jQGRB_JpekxixSVKqVmRJTmJXWCDHp
 cb0JNq0AwhKcmmYPSh7T35Ty2RR9Iv88ARaLl4be673bBDUwtLT8iiVodyQ0pOBdepqKU4H.BsqH
 lfiS5S0vwvpwfaiwLE_7rL1Nd8uTAvZvs4nGRvvKKqRbXQ8f_kYPfuch7ED81vIBecw5H7eDa_xJ
 uNZU.dp6f84_eRDU0iTTRfQ0mr6y049Un4jOD7RqeTAqLT7ZtcTqs90Xg38QE4PpDz0TnUpSBfXD
 csim.3KDnb765NIh6W6ShvyIPPwHn3XjX0WuJTVNm4IJaI_QXwNNSmKNWd1B5QUnB_8paaitS1Rf
 8qaS.3oG6m1CYLKkPpr.O11.ScBQdY4K1q.iY85Qy4UPwJ4t1HnyHlFt2O7NCQe5DITcdL8IyzmD
 cBnqTUUyb9gJjrqcItLuQ_kAhvEucbi.2UxKYYb0Cx0Yo0qOFlhvmmzLvGcqVWZJS0AGTw5flMqK
 RihPyzqOH0fFhgly0GGpA1x0MLpunnyCDfZ9YnqoENsPRINCC4aPh2y7aGN8dCOqb.5.mtS0zRa0
 xOIHqrQx20CUIsGWjbBBCTqlGwVeLQktltrrNuqENcibesxUR__Xb2xXBr_yr0H3k1zPdnvp9iZ7
 G3WaSFmx_tRBVhoHAbeV8SDCaaOWPSlGz0.19lhb3j2vJ_5Q9UAuAsu1IpnvcMKpMR79DAcHB36J
 2jWIOM4oX0b.s7AzGTXMI2QSsAtZw9kJ7gRRYcZMO9YTfQMX5y66d5UKuLVIIJo0OIabRL2lXM56
 n1WsL_bOrQ_MX7cO5n_6r5XMqZTWJRFMvlCsXqc5J66FXjAxcOJ0NMX6BXBP1VB8TBHSgW52vj5t
 TI5pM0GA6a6fVaPT24miVqytmGc5GX8Sj6_aD0HFZs06VrUm2Pd6k9yXZS6paPon1fZb0X.ZkHn2
 maAFqPT4l5QnURLdJ9TzXqX8NjL5gCrS9zeUW5vLdwIIQaEw81vuBKLq_I.m.LzXD87LE1zMOkjU
 H_3pUKbj.Gr6YIsFRQZEm7u2v4xas1FTT476bZ1lfQFGTdavSUR0IgHCXej4x3qOrRx0eigEOHWO
 IBttzoBvm7YcnxvnjxhxL_lY3NIC5n2LR5yYd6Z7jruSgW.AqHI1XfmjsDE7Q2R2Ho0RXqP5Vzk7
 LAPSZwwxoQC9dL.65vjIbpIpQQpyESdDkFfDW5r_Bun3GpHI.sfwq4yIO2VjHX1LPOuW.NTU5naO
 3IRhQ_K22FbaEs71E9uKmPlkdSXZjYn88rmodTM2JgoQthraqLt7ZsKMcpbY5NU9XTg3Sgp2RFYV
 yQ8CfBgRmSTjxIpIWXncTpR04jeIW4VYO.nf5838_XMFif5ptLO_IXVD_fCh9Uze2a1cSwjf9GVH
 hjOU.J.kOnFrIC9DNruA3hrBMr9I6lBfOYWpqIu6PTwPXWliGgqet3s8Q2a7BQJ2AZrXkvdnMbnQ
 BKFiMUmVEntjBuGLwyCPK9vg2KM3JD.gblu1IJU7MhANK7I_FPU9CU4AeXqSN7A--
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.ne1.yahoo.com with HTTP; Tue, 27 Sep 2022 20:06:00 +0000
Received: by hermes--production-gq1-7dfd88c84d-h7f6x (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID f8e196d1098f8fc47a5a474327d019a8; 
 Tue, 27 Sep 2022 20:05:58 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, paul@paul-moore.com,
 linux-security-module@vger.kernel.org
Subject: [PATCH v38 23/39] LSM: Use lsmcontext in security_inode_getsecctx
Date: Tue, 27 Sep 2022 12:54:05 -0700
Message-Id: <20220927195421.14713-24-casey@schaufler-ca.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
Cc: linux-nfs@vger.kernel.org, john.johansen@canonical.com,
 selinux@vger.kernel.org, jmorris@namei.org, linux-kernel@vger.kernel.org,
 linux-audit@redhat.com, Chuck Lever <chuck.lever@oracle.com>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Change the security_inode_getsecctx() interface to fill
a lsmcontext structure instead of data and length pointers.
This provides the information about which LSM created the
context so that security_release_secctx() can use the
correct hook.

Acked-by: Stephen Smalley <stephen.smalley.work@gmail.com>
Acked-by: Paul Moore <paul@paul-moore.com>
Acked-by: Chuck Lever <chuck.lever@oracle.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: John Johansen <john.johansen@canonical.com>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
Cc: linux-nfs@vger.kernel.org
---
 fs/nfsd/nfs4xdr.c        | 23 +++++++++--------------
 include/linux/security.h |  5 +++--
 security/security.c      | 13 +++++++++++--
 3 files changed, 23 insertions(+), 18 deletions(-)

diff --git a/fs/nfsd/nfs4xdr.c b/fs/nfsd/nfs4xdr.c
index 4a96e06f4827..515ea278a200 100644
--- a/fs/nfsd/nfs4xdr.c
+++ b/fs/nfsd/nfs4xdr.c
@@ -2732,11 +2732,11 @@ nfsd4_encode_layout_types(struct xdr_stream *xdr, u32 layout_types)
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
 
@@ -2746,13 +2746,13 @@ nfsd4_encode_security_label(struct xdr_stream *xdr, struct svc_rqst *rqstp,
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
 
@@ -2848,9 +2848,7 @@ nfsd4_encode_fattr(struct xdr_stream *xdr, struct svc_fh *fhp,
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
@@ -2911,7 +2909,7 @@ nfsd4_encode_fattr(struct xdr_stream *xdr, struct svc_fh *fhp,
 	     bmval0 & FATTR4_WORD0_SUPPORTED_ATTRS) {
 		if (exp->ex_flags & NFSEXP_SECURITY_LABEL)
 			err = security_inode_getsecctx(d_inode(dentry),
-						&context, &contextlen);
+						       &context);
 		else
 			err = -EOPNOTSUPP;
 		contextsupport = (err == 0);
@@ -3337,8 +3335,7 @@ nfsd4_encode_fattr(struct xdr_stream *xdr, struct svc_fh *fhp,
 
 #ifdef CONFIG_NFSD_V4_SECURITY_LABEL
 	if (bmval2 & FATTR4_WORD2_SECURITY_LABEL) {
-		status = nfsd4_encode_security_label(xdr, rqstp, context,
-								contextlen);
+		status = nfsd4_encode_security_label(xdr, rqstp, &context);
 		if (status)
 			goto out;
 	}
@@ -3358,10 +3355,8 @@ nfsd4_encode_fattr(struct xdr_stream *xdr, struct svc_fh *fhp,
 
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
index bb548f71a824..be935b8d7df5 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -642,7 +642,7 @@ void security_release_secctx(struct lsmcontext *cp);
 void security_inode_invalidate_secctx(struct inode *inode);
 int security_inode_notifysecctx(struct inode *inode, void *ctx, u32 ctxlen);
 int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32 ctxlen);
-int security_inode_getsecctx(struct inode *inode, void **ctx, u32 *ctxlen);
+int security_inode_getsecctx(struct inode *inode, struct lsmcontext *cp);
 int security_locked_down(enum lockdown_reason what);
 #else /* CONFIG_SECURITY */
 
@@ -1525,7 +1525,8 @@ static inline int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32
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
index cae35e5767ec..d57554ce386a 100644
--- a/security/security.c
+++ b/security/security.c
@@ -2412,9 +2412,18 @@ int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32 ctxlen)
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
2.37.3

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

