Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1BD492BB68F
	for <lists+linux-audit@lfdr.de>; Fri, 20 Nov 2020 21:21:12 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-LIB19ZDNOHeUXDjVZQnCvQ-1; Fri, 20 Nov 2020 15:21:07 -0500
X-MC-Unique: LIB19ZDNOHeUXDjVZQnCvQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF0ED8735D5;
	Fri, 20 Nov 2020 20:21:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A845C60C4D;
	Fri, 20 Nov 2020 20:21:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 65B57180954D;
	Fri, 20 Nov 2020 20:21:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AKKKwCl030908 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 15:20:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6F781F1008; Fri, 20 Nov 2020 20:20:58 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 67C65EAF86
	for <linux-audit@redhat.com>; Fri, 20 Nov 2020 20:20:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B8F9858EEC
	for <linux-audit@redhat.com>; Fri, 20 Nov 2020 20:20:55 +0000 (UTC)
Received: from sonic302-28.consmr.mail.ne1.yahoo.com
	(sonic302-28.consmr.mail.ne1.yahoo.com [66.163.186.154]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-264-d5l7bc0MNTqEzrHzYUPMQg-1;
	Fri, 20 Nov 2020 15:20:53 -0500
X-MC-Unique: d5l7bc0MNTqEzrHzYUPMQg-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1605903652; bh=8jstPlIFnSza0RcoZk+GnjlrXJFwae2QHoJX0Q81QQq=;
	h=From:To:Subject:Date:From:Subject;
	b=sAZ4ZyM4SVrN+ASxuFQChzHMweto8uzoS8mxy2J1oPkibA9sQfCiCfMsHGm3y8YMeOYuQZhMH/HbPI5ro94bf2iTGxmIa+hEMCD+2J/chtbUUMWvlItZ+P+bHvklZNTy/i66GORKV7F8JKzidnBKquhc6/uNrJrHnoUSMsnpdDOHkkAeIE0MMZRfnQFll8fqY/dBZnXT5NEFBUznd0vQ32SIkE84kF02rvFLSFssjF0B0tqzYZt2fPKBtOALRH9gbah/alVQg0dSbsU7oN5rkuUi0hrCwaGRhjFJr2zOzxdyZXRmYqzFyoM0hOhX+zyjGE2AtxyucxRrgCAqR1hSCw==
X-YMail-OSG: FlhGOYwVM1mkPTuuqhJE1zZ9cdU13t3f.5STFVuVYBUL6tu0zsFmJlpBoU2oN7q
	wY6ND2AknL.MkG5CIkoOQlbmNL07K5xLHApQc9cbIeMMWEheIu09AEFF3iWOohzRzDhaPmq7vkip
	iIW831QVi3tJ4R6ZKJXy99GjdQ73H2_RtjnFVUmI0BiyyH8zCGqCt9vM_AT72kkLhXE75Jbo07VB
	MuxrzHYT8HUhp2qDoPN69QajGXLUoL8Ge8EENcq6h0GENUxk9_XAqd130Et7Fm_zKXGDPaFRUJuO
	vbLHOZfFLDFnzSo9DoUp2a9W9qgWy8c5gRO3K3uQ4kh87aBuARIJGrtGdXHWiZYn_uIAn4StbtBB
	ANxV2LyZEfx_rc9PD400ETsQ8rEsFNoH3Gju5BCFIEidcKz8zKMntShm9jezgLzMtK1CYHdXliSD
	SHDudQEDxEFqes5z84bv0I4.OLljHMcYc5iwUqFlJt5Dfa3YnTIlGEIcnhitfx1WjdrNtto3jcxf
	QR4M0fx3gbu3LESQ0uA2XSYdJhyQB75AV_eYW05RsvKAXTDcL0QZeAtWy.Ubjqy_czJp87YMkQUD
	nFiGGNK2742o2fEKt5RISVjuEZcbrFVncoko2ACr3UrZhYykgiczVi4ahezf0V3ziw_9yhYL_hnF
	z1y2buy6QCn8Ic8BvwXYOlU8KXmgBNqN4CPxz3.tp4DAlLADAUWYGfDtvgdm8uJNE4v_w2RWAWI4
	PNy8Nf4TFZZ6THHetddCfpQgLIv9hNiHGgQylydzvAtSZiAJJWFhK0bfxTaBWoopUiTIOkGx8yDF
	i3u7oR.wCsMVdl0g6iGdbjFg2uFJBF5BbtjKwrF_vI1IGSrrDDLKIj6iR81W7hFOVtZN_yQH3oWI
	s.ah0cIyPhjAtWTWBl0g80Ao8VO8pmSyK2xbrI_CHEi3qVoaT.iNYty7bgHgIRzYTQqx_0CGrOMy
	t0Gg.h0HP9vh0zUmuVCEl3O7jAzl.20iMJjrg7LtpZv3GRJqjwwOtQLHgEUhkdHdGfbo67MeVV8l
	DxV1fOGi65UzXMMRyeEwQmSVB_kDj.idC1TNDa5nnw34FEVyMErl7nQQbUtHXyr92q1go6eUOH5t
	Rz5bRg.Sz7fxWsI4ku0bbtaXaNcG8_LP6Q90nQVLwaH5hx0qYc8QejVDwTle7fF9wF_m.sSojVaC
	6X1B.uDu4kTuxMYHAAWaV.iN57wc9Me9La6oGl3yMLyW1dLFzDPdKSJg5qmE3Oahq1fFCfbeANFy
	msUjt59401VWdC5FhThpcv62RyYIwZU0opDc641g4a_PElka0bjq3vFL_kFAGXTdAfLs9PS6qTYY
	Ommbb2BH4fVlDte29RVUJftZomM8VTEJ4vl5y0Aj54DX2hG6bYqiSloFCcZWbU0PAhFlraeWM6Cu
	hF210BjIZB1lp4.wyEVIDRA0ql8gdKdLelmDxp.OM6urzWeAbZdEg7ty4unLjV.vRYIb1kGdd9wa
	glm1HW4VpYcUukqzU7a34B4g2ZyLWHd6dwf3ERNilWnoGlnxq9SklG3ctQOypsxOvp6SkLdoiomA
	ecw6kkx2rOFC.bz8RMJ6UuiE.jw5serjyTbaEAxdO88Yzku4z1nFfWivtRs.L7d0YlowKa3ijSCT
	xaN8mSlBRWdfgtm6OmUu7OG5yxF81Y1qc_Dv2GXptfEi5X_T8zTZrQ9AjRxTF_.RYgq524gh4og7
	2fp2NCof.EA1y..qkBNxYRF1t11QXe4_8Kjo2vZKYLblp6izQA9eBeS_3lHibAB.dPPIfFB4GNhK
	GDOj1O30SsxowDq9rOrSRcVWT8lAOCMPSHQ6eWMYUV.vi0buKFS4kHPf21_ZRWV31jDH9ke11ZaZ
	V.IdplsNDDN8ehEm2VA0uG5BxanHlXw1Jblz27.hQNl0KzxXnHXf0CgrMauuxNf4HPfHuR_TNvxL
	pWGBveXmcirn5GoO0aHgLuJ4i2FzMngOQg585sVt61K5DbYSnwPf1sH0AfccQH.ylUCIDRJv7fRI
	MHYISMidl1_0dU9r03CT_WnWqFQLbGbyVfhoOiiCJexF8IYF_JbYjIvZHs8tFppXw7ibLwvtwtat
	doWMcy.9xzDePtiUHEBhRQpmZsLgcXm1IcjPAuKKzazWm2XIW2VOLSZffdi.4RJF4ZkhaJ2Q6c_L
	GEfbyar_u7vHWAOk0AhxZxqxcePbid7Xo6uHLZS_hm6KYlJMD8RtsZQ5W_F2hU89ozkOsZuBZ0Q6
	u77tiIlcmlfCXR34MiLl9qgll8TS6.sUMSvCSGd2pn8DQokptXLrSwR9AofMr97M5PjVjF7nAy24
	mfqRGDU2uMI1d5dvoNMLVWb_0h1MkLne.wl0npqdalBmwBvKew4wz5crm0R6pLCQUwpedzwQJe1Z
	JNm1hp5qdVLlAldIIR7hl.OfNj8qnMMtRyaFbwxmI7sM.BSZYRWGtY6RFTXURRq0KaPUCjOU9ylL
	JQLyBFcab3_mdnED6rVuD4y.eOLp4IckX6q1WqFoWZPmX7.rOM4pbaMa03MXxzQYhkl8rDb96OP6
	qOUM8zzNKX8.zAGlvdvo6KXzy63XOPIZTJcT2Izn4yMv5L76elYcFazQLPV4kxctPE8xX4Mj5D_r
	wtw9Y4nUb9dsMeNCOIt0JrKXCFmtaCIIYW7.8kdZTMx43Nh6CwsSQ0I2tHu5zIdXgvMpzfxd5TYM
	AxzTkhqmOIZeyQh9cUgGCxM8HqEPKt7PM8mwnrUdy8h1DwsDX_mCqeI.TikAYTtEGaH5q1jMsbfR
	OrzxhNvmZABWK6tBDfwo1.TREQa3DHG7.A0Nazsm_EoXLhhllHZ48SSl87BNxvs7o0dkfFNNxPb5
	4pHP2nRP6.kOcJUa2KF3ovE1HhvlDZUthYgLgyuQKmUygqgB_tDVZIC_IomG6mr7hmElCXgkpsgz
	NzbXmbGTtkzgvKLR.cqa1RIp7V8noz90PYCWaME1qU8aUAHWhfMnfUfuEoqaQ5oqvIIywKtf.rQK
	68S.NN0_77ef63xqmqj6KyiaF67q2OYCu4fvBg_8_APrTDtl5iIOE6w.uhV_SPNX48.LLRBgSENC
	ZZPrRECwr3Lv3fO45cuSTNQ9R19a7sYM_U.9HOL08eedUA06I_XK7KF67A3TsKH.nm6B75_HRShV
	xiqcWayJ.IYjrEc297UX3wAswWm0vouprCcZsBKt5iiKbLug9MxKHi5_QIQjd254xGBG.uAsrS1L
	eilTkAvvHVAazBiBJcjIaiCuqOgmrfSDDdLyZ7nScPt.wGLyLW8AP4SQ1RZNPL4Dk3Xxymts.T5m
	CxeD4N_1xPiCL4G6pfUDO8GUGEXedWk1vZ1ZSV5zjaoNi4AbAMLgLR5tQunw8Lr_quXRuxN8g9AG
	496DKRjfNp7eq24hxmrBDoLc2kudnEsFA8ghz3DzHrOOlbVfu3BmXW5lo1AxOD8KtBa6b64sjfZT
	Eq2I69dknpCrsoQEud72SuU6IwBOwHBhjm_BbItR_XgnbZGdSWBmiWn1FJVKuVoFuV5uHjJ3A.4N
	9gQ8Jz_fr4hVU82.SdSji
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic302.consmr.mail.ne1.yahoo.com with HTTP;
	Fri, 20 Nov 2020 20:20:52 +0000
Received: by smtp417.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 3fea8d9feb3cc20fa2b4afa5206cbedf; 
	Fri, 20 Nov 2020 20:20:46 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v23 05/23] LSM: Use lsmblob in security_secctx_to_secid
Date: Fri, 20 Nov 2020 12:14:49 -0800
Message-Id: <20201120201507.11993-6-casey@schaufler-ca.com>
In-Reply-To: <20201120201507.11993-1-casey@schaufler-ca.com>
References: <20201120201507.11993-1-casey@schaufler-ca.com>
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
Cc: john.johansen@canonical.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-audit@redhat.com,
	netfilter-devel@vger.kernel.org, sds@tycho.nsa.gov
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Change the security_secctx_to_secid interface to use a lsmblob
structure in place of the single u32 secid in support of
module stacking. Change its callers to do the same.

The security module hook is unchanged, still passing back a secid.
The infrastructure passes the correct entry from the lsmblob.

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
Cc: netdev@vger.kernel.org
Cc: netfilter-devel@vger.kernel.org
To: Pablo Neira Ayuso <pablo@netfilter.org>
---
 include/linux/security.h          | 26 ++++++++++++++++++--
 kernel/cred.c                     |  4 +---
 net/netfilter/nft_meta.c          | 10 ++++----
 net/netfilter/xt_SECMARK.c        |  7 +++++-
 net/netlabel/netlabel_unlabeled.c | 23 +++++++++++-------
 security/security.c               | 40 ++++++++++++++++++++++++++-----
 6 files changed, 85 insertions(+), 25 deletions(-)

diff --git a/include/linux/security.h b/include/linux/security.h
index 948d12a5eb25..0766725a6b21 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -191,6 +191,27 @@ static inline bool lsmblob_equal(struct lsmblob *bloba, struct lsmblob *blobb)
 	return !memcmp(bloba, blobb, sizeof(*bloba));
 }
 
+/**
+ * lsmblob_value - find the first non-zero value in an lsmblob structure.
+ * @blob: Pointer to the data
+ *
+ * This needs to be used with extreme caution, as the cases where
+ * it is appropriate are rare.
+ *
+ * Return the first secid value set in the lsmblob.
+ * There should only be one.
+ */
+static inline u32 lsmblob_value(const struct lsmblob *blob)
+{
+	int i;
+
+	for (i = 0; i < LSMBLOB_ENTRIES; i++)
+		if (blob->secid[i])
+			return blob->secid[i];
+
+	return 0;
+}
+
 /* These functions are in security/commoncap.c */
 extern int cap_capable(const struct cred *cred, struct user_namespace *ns,
 		       int cap, unsigned int opts);
@@ -508,7 +529,8 @@ int security_setprocattr(const char *lsm, const char *name, void *value,
 int security_netlink_send(struct sock *sk, struct sk_buff *skb);
 int security_ismaclabel(const char *name);
 int security_secid_to_secctx(u32 secid, char **secdata, u32 *seclen);
-int security_secctx_to_secid(const char *secdata, u32 seclen, u32 *secid);
+int security_secctx_to_secid(const char *secdata, u32 seclen,
+			     struct lsmblob *blob);
 void security_release_secctx(char *secdata, u32 seclen);
 void security_inode_invalidate_secctx(struct inode *inode);
 int security_inode_notifysecctx(struct inode *inode, void *ctx, u32 ctxlen);
@@ -1335,7 +1357,7 @@ static inline int security_secid_to_secctx(u32 secid, char **secdata, u32 *secle
 
 static inline int security_secctx_to_secid(const char *secdata,
 					   u32 seclen,
-					   u32 *secid)
+					   struct lsmblob *blob)
 {
 	return -EOPNOTSUPP;
 }
diff --git a/kernel/cred.c b/kernel/cred.c
index 22e0e7cbefde..848306c7d823 100644
--- a/kernel/cred.c
+++ b/kernel/cred.c
@@ -757,14 +757,12 @@ EXPORT_SYMBOL(set_security_override);
 int set_security_override_from_ctx(struct cred *new, const char *secctx)
 {
 	struct lsmblob blob;
-	u32 secid;
 	int ret;
 
-	ret = security_secctx_to_secid(secctx, strlen(secctx), &secid);
+	ret = security_secctx_to_secid(secctx, strlen(secctx), &blob);
 	if (ret < 0)
 		return ret;
 
-	lsmblob_init(&blob, secid);
 	return set_security_override(new, &blob);
 }
 EXPORT_SYMBOL(set_security_override_from_ctx);
diff --git a/net/netfilter/nft_meta.c b/net/netfilter/nft_meta.c
index b37bd02448d8..f1b9b0021414 100644
--- a/net/netfilter/nft_meta.c
+++ b/net/netfilter/nft_meta.c
@@ -811,21 +811,21 @@ static const struct nla_policy nft_secmark_policy[NFTA_SECMARK_MAX + 1] = {
 
 static int nft_secmark_compute_secid(struct nft_secmark *priv)
 {
-	u32 tmp_secid = 0;
+	struct lsmblob blob;
 	int err;
 
-	err = security_secctx_to_secid(priv->ctx, strlen(priv->ctx), &tmp_secid);
+	err = security_secctx_to_secid(priv->ctx, strlen(priv->ctx), &blob);
 	if (err)
 		return err;
 
-	if (!tmp_secid)
+	if (!lsmblob_is_set(&blob))
 		return -ENOENT;
 
-	err = security_secmark_relabel_packet(tmp_secid);
+	err = security_secmark_relabel_packet(lsmblob_value(&blob));
 	if (err)
 		return err;
 
-	priv->secid = tmp_secid;
+	priv->secid = lsmblob_value(&blob);
 	return 0;
 }
 
diff --git a/net/netfilter/xt_SECMARK.c b/net/netfilter/xt_SECMARK.c
index 75625d13e976..9845d98e6b77 100644
--- a/net/netfilter/xt_SECMARK.c
+++ b/net/netfilter/xt_SECMARK.c
@@ -43,13 +43,14 @@ secmark_tg(struct sk_buff *skb, const struct xt_action_param *par)
 
 static int checkentry_lsm(struct xt_secmark_target_info *info)
 {
+	struct lsmblob blob;
 	int err;
 
 	info->secctx[SECMARK_SECCTX_MAX - 1] = '\0';
 	info->secid = 0;
 
 	err = security_secctx_to_secid(info->secctx, strlen(info->secctx),
-				       &info->secid);
+				       &blob);
 	if (err) {
 		if (err == -EINVAL)
 			pr_info_ratelimited("invalid security context \'%s\'\n",
@@ -57,6 +58,10 @@ static int checkentry_lsm(struct xt_secmark_target_info *info)
 		return err;
 	}
 
+	/* xt_secmark_target_info can't be changed to use lsmblobs because
+	 * it is exposed as an API. Use lsmblob_value() to get the one
+	 * value that got set by security_secctx_to_secid(). */
+	info->secid = lsmblob_value(&blob);
 	if (!info->secid) {
 		pr_info_ratelimited("unable to map security context \'%s\'\n",
 				    info->secctx);
diff --git a/net/netlabel/netlabel_unlabeled.c b/net/netlabel/netlabel_unlabeled.c
index fc55c9116da0..3b7a3e0ae8af 100644
--- a/net/netlabel/netlabel_unlabeled.c
+++ b/net/netlabel/netlabel_unlabeled.c
@@ -882,7 +882,7 @@ static int netlbl_unlabel_staticadd(struct sk_buff *skb,
 	void *addr;
 	void *mask;
 	u32 addr_len;
-	u32 secid;
+	struct lsmblob blob;
 	struct netlbl_audit audit_info;
 
 	/* Don't allow users to add both IPv4 and IPv6 addresses for a
@@ -906,13 +906,18 @@ static int netlbl_unlabel_staticadd(struct sk_buff *skb,
 	ret_val = security_secctx_to_secid(
 		                  nla_data(info->attrs[NLBL_UNLABEL_A_SECCTX]),
 				  nla_len(info->attrs[NLBL_UNLABEL_A_SECCTX]),
-				  &secid);
+				  &blob);
 	if (ret_val != 0)
 		return ret_val;
 
+	/* netlbl_unlhsh_add will be changed to pass a struct lsmblob *
+	 * instead of a u32 later in this patch set. security_secctx_to_secid()
+	 * will only be setting one entry in the lsmblob struct, so it is
+	 * safe to use lsmblob_value() to get that one value. */
+
 	return netlbl_unlhsh_add(&init_net,
-				 dev_name, addr, mask, addr_len, secid,
-				 &audit_info);
+				 dev_name, addr, mask, addr_len,
+				 lsmblob_value(&blob), &audit_info);
 }
 
 /**
@@ -933,7 +938,7 @@ static int netlbl_unlabel_staticadddef(struct sk_buff *skb,
 	void *addr;
 	void *mask;
 	u32 addr_len;
-	u32 secid;
+	struct lsmblob blob;
 	struct netlbl_audit audit_info;
 
 	/* Don't allow users to add both IPv4 and IPv6 addresses for a
@@ -955,13 +960,15 @@ static int netlbl_unlabel_staticadddef(struct sk_buff *skb,
 	ret_val = security_secctx_to_secid(
 		                  nla_data(info->attrs[NLBL_UNLABEL_A_SECCTX]),
 				  nla_len(info->attrs[NLBL_UNLABEL_A_SECCTX]),
-				  &secid);
+				  &blob);
 	if (ret_val != 0)
 		return ret_val;
 
+	/* security_secctx_to_secid() will only put one secid into the lsmblob
+	 * so it's safe to use lsmblob_value() to get the secid. */
 	return netlbl_unlhsh_add(&init_net,
-				 NULL, addr, mask, addr_len, secid,
-				 &audit_info);
+				 NULL, addr, mask, addr_len,
+				 lsmblob_value(&blob), &audit_info);
 }
 
 /**
diff --git a/security/security.c b/security/security.c
index 3a88a90ddba6..eac7c10b8cfa 100644
--- a/security/security.c
+++ b/security/security.c
@@ -2081,10 +2081,22 @@ int security_secid_to_secctx(u32 secid, char **secdata, u32 *seclen)
 }
 EXPORT_SYMBOL(security_secid_to_secctx);
 
-int security_secctx_to_secid(const char *secdata, u32 seclen, u32 *secid)
+int security_secctx_to_secid(const char *secdata, u32 seclen,
+			     struct lsmblob *blob)
 {
-	*secid = 0;
-	return call_int_hook(secctx_to_secid, 0, secdata, seclen, secid);
+	struct security_hook_list *hp;
+	int rc;
+
+	lsmblob_init(blob, 0);
+	hlist_for_each_entry(hp, &security_hook_heads.secctx_to_secid, list) {
+		if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
+			continue;
+		rc = hp->hook.secctx_to_secid(secdata, seclen,
+					      &blob->secid[hp->lsmid->slot]);
+		if (rc != 0)
+			return rc;
+	}
+	return 0;
 }
 EXPORT_SYMBOL(security_secctx_to_secid);
 
@@ -2235,10 +2247,26 @@ int security_socket_getpeersec_stream(struct socket *sock, char __user *optval,
 				optval, optlen, len);
 }
 
-int security_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *skb, u32 *secid)
+int security_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *skb,
+				     u32 *secid)
 {
-	return call_int_hook(socket_getpeersec_dgram, -ENOPROTOOPT, sock,
-			     skb, secid);
+	struct security_hook_list *hp;
+	int rc = -ENOPROTOOPT;
+
+	/*
+	 * Only one security module should provide a real hook for
+	 * this. A stub or bypass like is used in BPF should either
+	 * (somehow) leave rc unaltered or return -ENOPROTOOPT.
+	 */
+	hlist_for_each_entry(hp, &security_hook_heads.socket_getpeersec_dgram,
+			     list) {
+		if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
+			continue;
+		rc = hp->hook.socket_getpeersec_dgram(sock, skb, secid);
+		if (rc != -ENOPROTOOPT)
+			break;
+	}
+	return rc;
 }
 EXPORT_SYMBOL(security_socket_getpeersec_dgram);
 
-- 
2.24.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

