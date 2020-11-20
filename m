Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 65EC92BB664
	for <lists+linux-audit@lfdr.de>; Fri, 20 Nov 2020 21:20:02 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-K3las0LTPJqV9ndUENi5nQ-1; Fri, 20 Nov 2020 15:19:58 -0500
X-MC-Unique: K3las0LTPJqV9ndUENi5nQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 162FA185A0E5;
	Fri, 20 Nov 2020 20:19:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE8A25D9D7;
	Fri, 20 Nov 2020 20:19:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BBB4D180954D;
	Fri, 20 Nov 2020 20:19:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AKKJoFJ030345 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 15:19:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9EF81EAF86; Fri, 20 Nov 2020 20:19:50 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 98177F1004
	for <linux-audit@redhat.com>; Fri, 20 Nov 2020 20:19:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D343800183
	for <linux-audit@redhat.com>; Fri, 20 Nov 2020 20:19:47 +0000 (UTC)
Received: from sonic305-28.consmr.mail.ne1.yahoo.com
	(sonic305-28.consmr.mail.ne1.yahoo.com [66.163.185.154]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-97--A85R37rM7WPK5-Esw2iyA-1;
	Fri, 20 Nov 2020 15:19:45 -0500
X-MC-Unique: -A85R37rM7WPK5-Esw2iyA-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1605903584; bh=AxO0uiNByt+iqdyzzxBHXt+aD/TCwNMOCEtKGesbFia=;
	h=From:To:Subject:Date:From:Subject;
	b=r37cSMDUCBoEouRjQU4g+9gmy+FpMQycpZzGkyA1s9AgltL1/bmaVKQkyfQuU8ZjNYiCcXlbp9ItHE1SFGLXe1cHTPNMyDvkWbd93sUmJYwUt0XT2OO0CWnc5VzXBw9fvnF6je8rNd78ec+dSiQl4moMH5GHQmY08a648pxmPAJzMTvbFg5b1hDRiii8NPNtgSfO0tDUeCt6k8mtO/eusS/xBVB1KN2wVfQ3rJ1kCrCq5xUXZ9RL7bhRU3U5C8f/HR+UhoJBNJQbcKZCaeKPK+uqFbjE+ALAFgWCE621gCknPgUJiS3tTxaLWu0rH0auQCnI92oQFikxiayNtvXINQ==
X-YMail-OSG: GIK2ZQ4VM1nE5a95SJHWYPPuhGHlkVBU_KtgBD_ZwtW30XA8Y5ElYG8S_FInnRJ
	xqODN6Xrezcj_TVmuwQdo0kgfvfku054MnV8PNVA5STWpzxWqwo.289eii5lov9RUx5YZz2x5czK
	wJtyahipXdZZSQ0TztFXsm0LqLGUF8KfJ6MVZVe4Yt3J65a79OxNK8.N5_oxKzkk3uBiIKZRfxJz
	inx_Usou0TWL2wEADC0WD8hSsGdVNMxt0vQmMF7ZMZBcvbmgjCyILEj_WNa38MST3J7lrZiPO.IB
	DyErJJRfkaABGLKyl2oUYqxL3gAuFSfZgD2.rZwtZzTZU6LVAqDkEHQ3mQoha41Q9vzVGMf2_Vyc
	H7fIAvWu1YtJtmi7uV8wrWyQRE8mDIz4T_b_4YR_a7je..F8qRsm.SeEFk1szZ7Zt_nrmfjmucvM
	ePkCffwsL7EDkjWvPZ0m0ba6tjrIrmNv6eZfvgZOz1iQ4Ae9ejxbp1GF3xfnOo7nq5UGhPSUUT2g
	ORzZ5YEVI2aw0GhAOJi4bEUjlF23YF245vPJzy4wlb1BY8BdFFkBnNpaSZe1udEtDCiU4WVjFXOA
	xReoMpnrLYdvkmpagh2KRQoYiH8olItuYuN5Fqt9EeHi.oQ_W1gs5Ykyftyul1m8yGVDrPxz9nEs
	rdBa6s2SjJ0HMLWtlqcX.ofi7KL84XCWNMxge8l9K27Vr5YncjzjuFilLiv._rKAw9LHJEYLasFR
	ouhi5tH3BUAp5p431PMWpynrVN02iZuDkA9Q1qH9qQf0d2kXjJcI1lXS7z365tBrNNC3pZHxlYvJ
	4emtLcOP2JLjdpwGRPAgaQAv0Lc_6l0mZDvRGeLsnwjElvATXet7nqUHM3ZANSy0JhZCjX1KXJD9
	FQgTzQ.oacckvGKk0E..BRebpXXg9YW06FYoSPIpMPkxLbEK26zZDD6flTKizI2WM3np0aD_eRTT
	ARawRbTvpa8DTZn1ZUWiSaQbPdhHSE.zwYRF4jam9gX6rlAxWcr.yIbUb4xrsnDZtihxT0gZ_21g
	gFuuDu6ywMmTRAOfjKB_A18fIcqzv5sEEt9wr2mV5oHaMMpffVcQ5zdHPiG1SshHYH3CBHxTk7Kq
	JqAiA.ADCRfLSacM5ivbB.rbOiJFkfJHyw7rNRV_wtLE4jLjaAxprd1wF83iIJxrYWcQIheP7uxC
	1hGCRRLbubVVEW4eDO.sqwjMP_JHT2YYm0IMIwHikCHIhDeDlxvEFa4YMNJT8XSUC7Y_2O8jSsOi
	8BG71MTR3ytE1xn3f2.o61qhpEePfdVcJIn7AXkPg4Asm4cDvGGiiHM9.BT1duUG_nTssYB0qxh4
	vaRvdN1aKHT1KjM8BqOlFwwYAdwGHOFJvCAeeVkv3EM2_mxC71V5y8UZq63yHuff0pxAwDwPsuuu
	deiPucj2DlLZL5TR.iW4kxSi4Aa2LHGeROO7s8k53Rv0H57_cIBfs.pCxMm4TdjuX4Z46.J9HKDF
	XwYtk1vmdkTGmUdM2KOdfaQnt9Im_z3vLdJoekJl2xI1FRNvzi4zcYRugfhbI8cyh61X99Llt3q1
	igFaBh_MTQb7clTDq1nvfU43nhzwUvUitWghkW3wsj2puvcs53PMUi.uBzaqaUz1JzQ0L0dHfKsx
	z6da3.JkLY1F24rYuoji2T7ofVjYeMnUTw8HEL6tyeA3gHiUzSUGuVuaelpiZv6fZEQVBhXh7xRP
	3shJbGVMAiRm82.3MVHBaW8SQ7lN_1s_b2QxIgmUkzIflU_V0j128GumM67gzcUJq74Yrj_UstLh
	Z4jaQfePaPsFK7ueAQ1HOBBaVRZEExJPgu9tJ7ONoqWm1du_W8EBOyWwTmAUJVeBiti2ZVbFW11n
	VQ4mf_9Ezrc6KRoggYJrwQm6b9NDGfqHLqhdI41D9nvBGA7nZ9VDhwN5ecvzReNxOr5BeZzCSNSA
	1mwKiZus.x425ZAPjTbZVJWhhKrAlgnM18InVlpuNBb.0I_q80KnTs8m71oJj26JjBnIf1OPtbdt
	t7RWgK_EHhABSGBs_IkzEv1TJMLfDIp.NpEFpiEaOFB3RD6lXuTJ72CDDzWj0TJhVKkSXp2GrHHi
	8bVA8PhKJx036RMAJA4Y.ZOYSASioVHSQ3PNwOQVBtO6v5kXacdK_F.orVHq2ygRktW8RRjiSR.t
	qPriTaJ_O3Jb4tpUYBnEARDVbIpCmwhnf7XU_FYOcqpJNRdTRotYdN2i7dubPokzR267Ka2fBskA
	FoEm4Teb4w_2xfpfCsjxwZSMu670.wz9OvjMOoN428wampYNedJinK2IK74xzMcRKcd62Y_cU_LJ
	50i4a81U4eaLavRSCA1CAEKF.IYUpq7EB5J.YiutpBtaGSorA6fpkKZKT1Fzixj3GpF6kCdHOUOU
	pbd4SBxMeh6uqERv5MqxFF7TiYcqBh3TI57oGuYZTW8OvZX9e_R7MyaLXsJZSi7eAkR5wAkFjv4T
	BaM09wyuiMGhvMNaBiA0nuo.RENE92PlIqd7wX8alWTnmcwr7O.zHq6DOTph4oNDfSYFTu.MMe6Q
	6s.MSWNMaYJNYrLL.PHJbsbgZCDJ7cBu0oZXrbIJyleiMO5EmPRYkxaA929kCV8s3pV0STkTmN9e
	d92mBZjpo3vHGcl7GLB_ia9qKwmid9MCexQNOgFCpXURRhtN0jLDwNHn_GEo3S1Wm0i3P4LigDT7
	YGdqrDEc4AWdGPvczVyRMLw54CK.1Me6ki9MNUAN4FUqP0JUj99iRUbcKPSc0eo4wbMqPbVkQXyB
	whEW.okcVBuTv2E2sBEJUne33Mn3Z80hxeslPRDrjmbfbgQ3LiVIIYHPTsT1IAgaFNbqJ6A4GiXG
	VRvbGcDeqqZDnN6eDrmBFnjAH78iGjcx58Mb_Pj.sTuHckr8d3L_IPt7LUS1HV95BbGjf.432YYL
	GBeNGfLVOYEyhXuA9Whx0IHvbFsLg2A0jlHmW1a21f1bcjENl0sEF_0fHnffs.Bj79IDeAUmheP1
	4mikj1WYz5sWKBlWNg7PUSFCYDHkYQVXI7fRiw4SGOwAOmJ5_l4zMnRyfO695T3rPBdvzhdAW.MC
	y16lpl2qfFFubF5HQw2xC8DUGZpTPD2rkcy33DBlfZu2QnplqQZEydK3J12bMaaXZwKAz0H.vNCP
	tN69rIq2Y07j3Au1laXm5lTG557khc6Juyp_g86MoLBP5N9J1VKBL6dUQpMKHg28bbItOaO83Ql2
	46grmiLlKQXZ7Wz_qARpP2HlZZzlXiiGREdaBvehyz6ei9FglN5K7_ZFP6XPatwisTWSkWPsaAy4
	u15U8ii6Qo2_C9uAsZkL9MH2DsqQi8BRi5CV5muF1R_LBZWmLNhRH.DEI9gTj8g--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic305.consmr.mail.ne1.yahoo.com with HTTP;
	Fri, 20 Nov 2020 20:19:44 +0000
Received: by smtp425.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 34d99afb7fb384aead877b81c3736f31; 
	Fri, 20 Nov 2020 20:19:40 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v23 04/23] LSM: Use lsmblob in security_kernel_act_as
Date: Fri, 20 Nov 2020 12:14:48 -0800
Message-Id: <20201120201507.11993-5-casey@schaufler-ca.com>
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
Cc: john.johansen@canonical.com, linux-kernel@vger.kernel.org,
	linux-audit@redhat.com, sds@tycho.nsa.gov
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

Change the security_kernel_act_as interface to use a lsmblob
structure in place of the single u32 secid in support of
module stacking. Change its only caller, set_security_override,
to do the same. Change that one's only caller,
set_security_override_from_ctx, to call it with the new
parameter type.

The security module hook is unchanged, still taking a secid.
The infrastructure passes the correct entry from the lsmblob.
lsmblob_init() is used to fill the lsmblob structure, however
this will be removed later in the series when security_secctx_to_secid()
is updated to provide a lsmblob instead of a secid.

Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: John Johansen <john.johansen@canonical.com>
Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
Acked-by: Paul Moore <paul@paul-moore.com>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
To: David Howells <dhowells@redhat.com>
---
 include/linux/cred.h     |  3 ++-
 include/linux/security.h |  5 +++--
 kernel/cred.c            | 10 ++++++----
 security/security.c      | 14 ++++++++++++--
 4 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/include/linux/cred.h b/include/linux/cred.h
index 18639c069263..03ae0182cba6 100644
--- a/include/linux/cred.h
+++ b/include/linux/cred.h
@@ -18,6 +18,7 @@
 
 struct cred;
 struct inode;
+struct lsmblob;
 
 /*
  * COW Supplementary groups list
@@ -165,7 +166,7 @@ extern const struct cred *override_creds(const struct cred *);
 extern void revert_creds(const struct cred *);
 extern struct cred *prepare_kernel_cred(struct task_struct *);
 extern int change_create_files_as(struct cred *, struct inode *);
-extern int set_security_override(struct cred *, u32);
+extern int set_security_override(struct cred *, struct lsmblob *);
 extern int set_security_override_from_ctx(struct cred *, const char *);
 extern int set_create_files_as(struct cred *, struct inode *);
 extern int cred_fscmp(const struct cred *, const struct cred *);
diff --git a/include/linux/security.h b/include/linux/security.h
index 89c538aa283e..948d12a5eb25 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -443,7 +443,7 @@ void security_cred_free(struct cred *cred);
 int security_prepare_creds(struct cred *new, const struct cred *old, gfp_t gfp);
 void security_transfer_creds(struct cred *new, const struct cred *old);
 void security_cred_getsecid(const struct cred *c, u32 *secid);
-int security_kernel_act_as(struct cred *new, u32 secid);
+int security_kernel_act_as(struct cred *new, struct lsmblob *blob);
 int security_kernel_create_files_as(struct cred *new, struct inode *inode);
 int security_kernel_module_request(char *kmod_name);
 int security_kernel_load_data(enum kernel_load_data_id id, bool contents);
@@ -1061,7 +1061,8 @@ static inline void security_transfer_creds(struct cred *new,
 {
 }
 
-static inline int security_kernel_act_as(struct cred *cred, u32 secid)
+static inline int security_kernel_act_as(struct cred *cred,
+					 struct lsmblob *blob)
 {
 	return 0;
 }
diff --git a/kernel/cred.c b/kernel/cred.c
index 421b1149c651..22e0e7cbefde 100644
--- a/kernel/cred.c
+++ b/kernel/cred.c
@@ -733,14 +733,14 @@ EXPORT_SYMBOL(prepare_kernel_cred);
 /**
  * set_security_override - Set the security ID in a set of credentials
  * @new: The credentials to alter
- * @secid: The LSM security ID to set
+ * @blob: The LSM security information to set
  *
  * Set the LSM security ID in a set of credentials so that the subjective
  * security is overridden when an alternative set of credentials is used.
  */
-int set_security_override(struct cred *new, u32 secid)
+int set_security_override(struct cred *new, struct lsmblob *blob)
 {
-	return security_kernel_act_as(new, secid);
+	return security_kernel_act_as(new, blob);
 }
 EXPORT_SYMBOL(set_security_override);
 
@@ -756,6 +756,7 @@ EXPORT_SYMBOL(set_security_override);
  */
 int set_security_override_from_ctx(struct cred *new, const char *secctx)
 {
+	struct lsmblob blob;
 	u32 secid;
 	int ret;
 
@@ -763,7 +764,8 @@ int set_security_override_from_ctx(struct cred *new, const char *secctx)
 	if (ret < 0)
 		return ret;
 
-	return set_security_override(new, secid);
+	lsmblob_init(&blob, secid);
+	return set_security_override(new, &blob);
 }
 EXPORT_SYMBOL(set_security_override_from_ctx);
 
diff --git a/security/security.c b/security/security.c
index 4ecbef074809..3a88a90ddba6 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1693,9 +1693,19 @@ void security_cred_getsecid(const struct cred *c, u32 *secid)
 }
 EXPORT_SYMBOL(security_cred_getsecid);
 
-int security_kernel_act_as(struct cred *new, u32 secid)
+int security_kernel_act_as(struct cred *new, struct lsmblob *blob)
 {
-	return call_int_hook(kernel_act_as, 0, new, secid);
+	struct security_hook_list *hp;
+	int rc;
+
+	hlist_for_each_entry(hp, &security_hook_heads.kernel_act_as, list) {
+		if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
+			continue;
+		rc = hp->hook.kernel_act_as(new, blob->secid[hp->lsmid->slot]);
+		if (rc != 0)
+			return rc;
+	}
+	return 0;
 }
 
 int security_kernel_create_files_as(struct cred *new, struct inode *inode)
-- 
2.24.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

