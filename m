Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 652135ECD94
	for <lists+linux-audit@lfdr.de>; Tue, 27 Sep 2022 22:01:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664308882;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WlacM5amXGNenWinC1bpSk++PhDpyLqA8kbSwZRv1Cw=;
	b=HYWOdZ5C84/2IPw3xZBSQmuiPuBom1087Qo7fyfuvyHZJrCOGYS0MZtmUoPx6VtLMWMKd0
	eVY9Yh4azLX/UR0gxtmdoTtc5wOfeldZwQaTeDEbmWhXqNWnWYQOgJBfNxn5vey9m2/WRl
	6XTYM4aUFxy5leNaL9KanWrFucCpz14=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-0twU5IE4MsuqrqX5yTXgcQ-1; Tue, 27 Sep 2022 16:01:18 -0400
X-MC-Unique: 0twU5IE4MsuqrqX5yTXgcQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 057DD3C01D9C;
	Tue, 27 Sep 2022 20:01:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DEF6B2027061;
	Tue, 27 Sep 2022 20:01:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8B5201946A48;
	Tue, 27 Sep 2022 20:01:16 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 231B91946586 for <linux-audit@listman.corp.redhat.com>;
 Tue, 27 Sep 2022 20:01:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 09AD740C2065; Tue, 27 Sep 2022 20:01:15 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 016F740C2064
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 20:01:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD65385A59D
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 20:01:14 +0000 (UTC)
Received: from sonic306-27.consmr.mail.ne1.yahoo.com
 (sonic306-27.consmr.mail.ne1.yahoo.com [66.163.189.89]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-523-GWHtkWmAP9qwrCMKkiVKqA-1; Tue,
 27 Sep 2022 16:01:12 -0400
X-MC-Unique: GWHtkWmAP9qwrCMKkiVKqA-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1664308870; bh=iztO2S6w6r/nQr5zYudlmrPAyiYnUBLn9uuVK6+KZH6=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=mVK48TyuhdqV245hN5IFh+lOCzGR8i/SMtyVKQTjnB+0xkCsUXG1RoG81WJOUCDfkgjIH0+L7mDfGZeOQwH8nTdjfWgZFCO2t/waYj52IN+UaVUK/n5l/fy+phE7136UWlWzRGkC1zlzqgNR+goBdWOtuWexSi7q44rQvES3F+UqTAStU/AU9nRNUdRjTfgjGfeUo0hEvlCbV/MV5rjIOGAMJB/pd58YJI2YILQn28MJzX9VoE9sS4P5aIUoABHuhKQH5FvrLyRZxh3PF/QCReLxRDVJmyjz5XXLsBLKGFGVCd13EOW+R2aMSyQ2ImriyBoU/U8H/0DHQCrHoEghBw==
X-YMail-OSG: PtVHTAUVM1nqXZ3sFGdaogjiDnDjBqCNkbGV_DIUH_PIAxTFFWeD4xJQJG_oz2T
 YOBlKNXJ0gUKZtnrD0Q5G5ZdWOtc5YL.iu5qnCCo5JQbv0iTDwHxHWOBiQ3eRmnL2bHe79Zt8bkA
 0nTk7OdP05MzpHMpwRILv3wXjB18i3RO6w8axqwASN8pWHwhzitDPILARG1vOz037U7_yEuwcEto
 BQt0UTmvijBdlLCDcTNB.8YhHPkPHGKA7ogqLChAtHnZ5E45aXtcHp2LLy7jpM.Zg_NLXLKaufcM
 VfIHUgGZjulkrsHMPpYcg6QUrGEfmBRkR8Y4oJNGOt4pSVN9eGIObwxnx9R._Nmx55xgUS_DRwqj
 30RhOHlF2MjAitJbtiYsBSaIk8ScEywt6Y2OyVd3wjCETnGRJPZkKwIvo56ZQOR6KwFvmzc52cr5
 cI6B5mGQz6Zcw6uKuZjpspUledpbNbIHVCvq_pXcxV.LvtL4VXRw3wTCUkh5B8oSGuG_yl1sJ4.w
 dhdTUFkMy2iXA.cx60Y42OTA7fxeRk.40p2868yPG6A_mjhaE8FFX6GPd94qyYz38_yis3NTan4n
 pEVMVP00OeLBA7uv8ywQewkxdZVQ1dY70LbDYIvkbWsgZ0rIfYrdk1XDeTFRLdFbCkWSUnCZ1SLM
 EPn0VPuvXShM9bBOLNxK0IZckFn8m1xkmiYwH2cSafX6cCx3BAxNzc73s9d6suLKs7rLpMvtChPx
 fQjwbdkEnU6DL6rQd9ImyxqH.PEEB3WqMhzIlQI3_KGcX1FT3N_R4vPoRz5cowRgKUtsSthrJDl6
 eVanbnsYbMeBf8q7fCYq0GXfXmQWQPD20gXLpk4Duyha5BU7nfUHXTv4oLsIeSJvtPfhd0tdLkVi
 1hiecaML8upOxfgztY7J8HZnTNQJtiDDHjNqy3P5xS.zizecIgQany7he.En5IuTbQjrWX1ckaaA
 v9K.hkOZ3Nk1UUt.vkFvAW7S9ricvMbTvxQscbKQaFjBlE8InJwkG45VCYHDr5K2fKhRLSZRm5hQ
 Rl4hrDMGBK9VKL_qfeNFOuuzePEgbcNATSGN6kOrYHXszCYDeQhzNbz4M9yBNNYu65NWWL46AzWG
 Am1LXsWX4UMmAR9ySvY3VvKOAzu5EUNY.ynSphhwFQhNzG9_pqf7ujRVfv_hgFJcNrh.Cwo2pyhe
 h2hsiuiNNLPJRBEgLAjdtXHKPOJOj02.QL6TdmG_7vRoW8Q1KJuMOB6ScRX_RegBxxMU1ZwPXNmI
 RMBotC.ppKbJPyAqDsaik0dJBfRIWg4MgHea75V41sfkWsv0l5P0t_qWWZ_qHHMP2nvcQPNVh3gu
 lucr3GUDEm00awGOA5aeuKi3kClQ1QQwpK_fWHnUIDHc0sdZuyMGR7D6Spf3aLAwZXfw_qb3l4zd
 CHN44wmvILfmbx01Wh1oPeZm9xOGbyGCblLD8x4uZLhHAuX0zc.egpbTX.rCl2w3m9ugKKWip_BR
 WS3Y70XSWW8tH._Tga8CPt5KiVKam2ABRPAP6ZH7DRj0q1Vs6UPnbYBQf9pb8Iol1BxJS__OXfXJ
 Lf58yb1Z.rX1O_OB_.G6KLdxifpFI3Ccx_mAyDud2HZBPp5k29AAIk5qhjIutF316nxyaBPetwXL
 NaMi3agloJG9a8OVBB5Q9h2a8f0i24DpDNjg6nE0MxBADu9d1zfrZwHo7ZTAFG3l.B4ybcGJErzz
 7Aj7xoVW19Ch1.VPQEvRV11tD.IoMn6unt6vff3nIw31eRE4dt93KBrwfwf.Y4_71lOSr8e7VHdb
 10nQSOctIgJqzGT1qsl0I_WKLvcizNLEB8DLVfG1JWc6hc3GnSoZLGN_62zSvK2KC4IkxDLulzcS
 CxCav3oRyLRAvheFBWeIEYJcmrFGP7s03_RYVTW_jd.vS1rqLMT8RXeX9oL9gMBI2OqdwMW05NWF
 Bzf.ULl_0KhFylNvAXfL2T2VjaOfemuq61Bml8p41wQuhaty5IDsq5NLyyab8Ps4iEdHgWn0ezr.
 lNixR17.vLtUEcEHgiiqJrYHD5qV9tWw_u5jwALLY2cch6sFhcvrY4.ddOquzb3i0fOi9Wh7fR8O
 ofsk7xd0ZVEb9eCaFKBsGd5VYfhBlxukFe7N8I6SrF9PvaybijiarOlgT.tYi_oRjijUMmZATCOR
 _KkzDuflWM7LfRfcILbGH6_x9gpPaT4OiicjECa._Bkj3vN3NTWyUYoVeWiOJaREHqLrVgR7VN87
 DUtZCP5Vie2FAztxTTNq99Pai8all3197fldchdUG1_rKxsKMy.agWDgfeKGio7QCv83x9jSB2MR
 bBufaBRCd_VghChO4.fezrDyXiM7ltYU0ApCRSEynJ4RsKbucWiYqxRU8rROeV7xx3w--
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.ne1.yahoo.com with HTTP; Tue, 27 Sep 2022 20:01:10 +0000
Received: by hermes--production-bf1-759bcdd488-mc79z (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 6e213c213e954b1fa721ede3259fc3d6; 
 Tue, 27 Sep 2022 20:01:07 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, paul@paul-moore.com,
 linux-security-module@vger.kernel.org
Subject: [PATCH v38 14/39] LSM: Use lsmblob in security_secctx_to_secid
Date: Tue, 27 Sep 2022 12:53:56 -0700
Message-Id: <20220927195421.14713-15-casey@schaufler-ca.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
Cc: john.johansen@canonical.com, selinux@vger.kernel.org,
 netdev@vger.kernel.org, jmorris@namei.org, linux-kernel@vger.kernel.org,
 linux-audit@redhat.com, netfilter-devel@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Change the security_secctx_to_secid interface to use a lsmblob
structure in place of the single u32 secid in support of
module stacking. Change its callers to do the same.

The security module hook is unchanged, still passing back a secid.
The infrastructure passes the correct entry from the lsmblob.

Acked-by: Paul Moore <paul@paul-moore.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
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
index e95801437328..0134a938fd65 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -218,6 +218,27 @@ static inline bool lsmblob_equal(const struct lsmblob *bloba,
 extern int lsm_name_to_slot(char *name);
 extern const char *lsm_slot_to_name(int slot);
 
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
@@ -549,7 +570,8 @@ int security_setprocattr(int lsmid, const char *name, void *value, size_t size);
 int security_netlink_send(struct sock *sk, struct sk_buff *skb);
 int security_ismaclabel(const char *name);
 int security_secid_to_secctx(u32 secid, char **secdata, u32 *seclen);
-int security_secctx_to_secid(const char *secdata, u32 seclen, u32 *secid);
+int security_secctx_to_secid(const char *secdata, u32 seclen,
+			     struct lsmblob *blob);
 void security_release_secctx(char *secdata, u32 seclen);
 void security_inode_invalidate_secctx(struct inode *inode);
 int security_inode_notifysecctx(struct inode *inode, void *ctx, u32 ctxlen);
@@ -1411,7 +1433,7 @@ static inline int security_secid_to_secctx(u32 secid, char **secdata, u32 *secle
 
 static inline int security_secctx_to_secid(const char *secdata,
 					   u32 seclen,
-					   u32 *secid)
+					   struct lsmblob *blob)
 {
 	return -EOPNOTSUPP;
 }
diff --git a/kernel/cred.c b/kernel/cred.c
index 3925d38f49f4..adea727744f4 100644
--- a/kernel/cred.c
+++ b/kernel/cred.c
@@ -791,14 +791,12 @@ EXPORT_SYMBOL(set_security_override);
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
index 55d2d49c3425..2c6edee9fbea 100644
--- a/net/netfilter/nft_meta.c
+++ b/net/netfilter/nft_meta.c
@@ -851,21 +851,21 @@ static const struct nla_policy nft_secmark_policy[NFTA_SECMARK_MAX + 1] = {
 
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
index 498a0bf6f044..87ca3a537d1c 100644
--- a/net/netfilter/xt_SECMARK.c
+++ b/net/netfilter/xt_SECMARK.c
@@ -42,13 +42,14 @@ secmark_tg(struct sk_buff *skb, const struct xt_secmark_target_info_v1 *info)
 
 static int checkentry_lsm(struct xt_secmark_target_info_v1 *info)
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
@@ -56,6 +57,10 @@ static int checkentry_lsm(struct xt_secmark_target_info_v1 *info)
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
index 0555dffd80e0..87fb0747d3e9 100644
--- a/net/netlabel/netlabel_unlabeled.c
+++ b/net/netlabel/netlabel_unlabeled.c
@@ -880,7 +880,7 @@ static int netlbl_unlabel_staticadd(struct sk_buff *skb,
 	void *addr;
 	void *mask;
 	u32 addr_len;
-	u32 secid;
+	struct lsmblob blob;
 	struct netlbl_audit audit_info;
 
 	/* Don't allow users to add both IPv4 and IPv6 addresses for a
@@ -904,13 +904,18 @@ static int netlbl_unlabel_staticadd(struct sk_buff *skb,
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
@@ -931,7 +936,7 @@ static int netlbl_unlabel_staticadddef(struct sk_buff *skb,
 	void *addr;
 	void *mask;
 	u32 addr_len;
-	u32 secid;
+	struct lsmblob blob;
 	struct netlbl_audit audit_info;
 
 	/* Don't allow users to add both IPv4 and IPv6 addresses for a
@@ -953,13 +958,15 @@ static int netlbl_unlabel_staticadddef(struct sk_buff *skb,
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
index ca749a8f36b8..0c5be69d8146 100644
--- a/security/security.c
+++ b/security/security.c
@@ -2228,10 +2228,22 @@ int security_secid_to_secctx(u32 secid, char **secdata, u32 *seclen)
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
 
@@ -2382,10 +2394,26 @@ int security_socket_getpeersec_stream(struct socket *sock, char __user *optval,
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
2.37.3

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

