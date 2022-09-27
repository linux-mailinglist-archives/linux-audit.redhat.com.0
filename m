Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B71385ECDB5
	for <lists+linux-audit@lfdr.de>; Tue, 27 Sep 2022 22:04:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664309095;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Mj58ghBfr7tkGFLF97+njPpweBGP0qt2PFi0fRK32A4=;
	b=LgRd/PU6SruQ/eDziQ0Kg88uctuIMvI8Gfmz7/fFBOAzUxHxWO5NEkeGCXKcN5zKBHQ7wA
	iW2kzbIja7XLMgKaMGRzkzECTC9yFNH6jwl+WiYR2To6ancP3mRXcOhd5dqUEjjiDo+j2E
	9AXGLQEUZoVwrWetuZWei5I+XQFY6Ig=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-CHmXjdntNe6F8E1-wOaggA-1; Tue, 27 Sep 2022 16:04:54 -0400
X-MC-Unique: CHmXjdntNe6F8E1-wOaggA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC290862FE2;
	Tue, 27 Sep 2022 20:04:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7ED42C15BA5;
	Tue, 27 Sep 2022 20:04:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2258B1946A48;
	Tue, 27 Sep 2022 20:04:51 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B72941946586 for <linux-audit@listman.corp.redhat.com>;
 Tue, 27 Sep 2022 20:04:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9903F112132C; Tue, 27 Sep 2022 20:04:49 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 913CB112132D
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 20:04:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C7DF857F90
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 20:04:49 +0000 (UTC)
Received: from sonic304-28.consmr.mail.ne1.yahoo.com
 (sonic304-28.consmr.mail.ne1.yahoo.com [66.163.191.154]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-460-xxHCwLwYP1--FIe7oZrcYQ-1; Tue,
 27 Sep 2022 16:04:35 -0400
X-MC-Unique: xxHCwLwYP1--FIe7oZrcYQ-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1664309060; bh=FBq0vBJ5sabnrCp02ar0BfXeQiQvBgu52esBZAUKP5f=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=jVFUJT51yEnapg81fleM4C72klwAgxvxf+jrEGBAEJypvtw+gqK44shI86YI4CwLdC8lmFChXNYab3Q+zbSlfLJmri1aAgLK96WPBcNKwZTXH2NuSF11ermOh2JOGYHv7w1RjOpX1KcRDZS0VRBGpM6Yl/nWY8X4uwe8nioohzOJAsBUZq6oi7t+ufMstA6iQHiLoDe8xlis/3vYNH15NhlqfUsOw5rDU3kDXkxBnD2R8UDMY2tvB6If5q+WUMsD6c6pEYmPyJHhTSiZInOD0b3un2Mhb5uVc9nMohwq008Q8iX4hcP59Mk2AVAxGr0GDDLX9+MOTIcRTPNdHEfAQg==
X-YMail-OSG: hoOxSOsVM1mr5DcZRE9vQ3_JDLHQERhsvm.5gCS63qYNDBnOu_MAHh6WKY55pXg
 0BDiKC2OO4coG7cfbmec8TrRMuEEljvrE_wwjt_BjGKzTQ1e5_Y0JBhXAjwpx6mNsmGTSDcEzQ4w
 phlFlYqtCNLfHB7r8rz_AGfdAOBfpKhUQmugFQQkPPuYPVhH4SGtUB1xtPJTewtRyBcA2BPPJMJ8
 ZtXaCYKu7XQi6wzXAS.DRSBd4bow0GJPEEzVzX3x0_CLLo5VhO0RF7Kfq9_qo_eKi0ERb7TJW9zp
 H9Iv1IsEecvuXizbijqOD2mfWp.ZYumBK5WYaLnv06Kf44237QyOjLcLl76k07fD1356nU7_4sBB
 NKK19xnCaI2F5NknnhyuY8.44J5ZMxdWrOXlJKb7r4Vkgrka1R5yOJiPekO3ghDD4fXZxQRIjmnk
 oOx9Ct4y2b8sRk.7rhVEtIeaBOICxXvCWBDK_Eu7f2eeHtCrgXFgGjTlX8HUDSMNZb.5ZLOU1Wym
 Xt7NQ_B8JwKCGX0LV27gMxOIkZlU1vwEuf3I68V77iaVWjGmNC.BTQVtXuWiHfStKpOF9AWxlazH
 sHyulMzJsgRZvtmlAxk9OQViH2f.NWrXNW97RnA3fyHyGchF4so6zOMKkoI0uOKlcUFtu0wPKDRt
 V2uZ7CcbRH1P2XiX5_QAhQ5d2mFtoKPEodzTf0AaxQ5LI.UcI2l_qredI9llHte3HkHaE.nyKdh8
 Z_FwiFq38wPeM7gy_wOCNy8WaLzmAQsaMMQ6v0hiiEN06ufjT5oO3quzZ3w5.uaoPbak80Vpy538
 zYAsS5GOvdOGArPI94Wy1qlTpMvRb2zRH6hHBNSX3yRKb5WvS4Tsy0dDWclcgaDajBq7XBfJJT2w
 aLfD.MX_8p008n_2I70i7UIdR0C4GrPUB4um471hzk.mGunVverguux.5HtllPEyW0DpXTkxusT.
 rUD175PcvVqON0_VXTVNpgH4cpK3EG_wOt2q0ShZLb5464AemGdPa5MVqFUznD5YB2OeHhnSYBmT
 o.gv_lQfWMZac9OIRPYN6cyDlXfjluxwvpNiWB6T.0XjI6lPVcAq5z7RXQHBy.aLbVebsQYWJNqj
 YPJYhHe.u4hWn3mm3De2.6dohfcrTDMDoKFE.SwHqT11XOVWJIVQr3qZ..Np6EbJNRjcYTzS7F3S
 JVo1WyDthkWHBf6mors8XXxnjp._JTX4KimvkX0ri8O9IFh7Wdz1jHV7VG07CUYNPaA1XU4IeAoa
 dzHAi7bg5ijVZMSQRDh9Oqjhxr73yx_rWynlAnPEqSwUtPm_eb2Tk7GUaKFQbziy4taAnKHZUhiO
 3fqA2wlTeWK_wZ_tT55trHW6KzPwxAE9D1GAk5qm8d3wXHZNG_9NBtwMillv38UUL5T3jUvihLhD
 NEGQzGbugXe7d9iMtS6AP.0NpIk0.U2P..JwdesBtsNSWGcPqWnT_B0JQM20lDCqEnenjNPS.JGp
 lmDkCdpkT923q9ypb9HCLUXPlho.NC0MqnwTkkRM0ulNJ9MsZ.wQRQu__GNX93RzgIZLr8AHM5Fg
 p_MJQetGYv1YRltOhxcVf.2kJjQ2KcfYa8RBTG2R1EgVsmA_w93pIDQ2WWAtefGErWbcApQK6mhU
 ok_w0J9WmZ_t1zGPGnWr7WQ8XUgmutbJ6Z5jzVjMLD5lvm2bb4YqpIdtOjP7gZd2oDY_ubjBqxnA
 heof9jBqQXkxjlLK3Hu_4IYCMQ35a26cLUijcU8tjbDIYhVSzA.Wf4grTR6Im0.Ff3XHRRrTMjXy
 wJJaqgllptEnEbaG.HHVlrTJ5ffz3Jra_hfxShf_azhCNhGHkDWy2i52jsSNVHboWJhyl6tZK_Mr
 pwCVbwgHewwohfV6IPkKf74kcXLRu.8iJArazTI3kd.HidoHP6pwUtArMfdCcKJM1.Tzm0gXEnM7
 A3IE5POjJd.EPlLPWbBZLpVx1a3taxznW0faGpXCwFjAyzikvp7Z57SrOzG4NQ_EaamwvbY_ZyKD
 OOPQDr.Jse0sNf43hXy6fWCXKmMX9hdaDTs5yn0itOslp5RX4hLcz_pDDN2VjtwNRcmJx_1I7.U3
 .qo6kn7JbVXPZQg0241.2wg9dcHA9gi5oKoyDrIGgqB2P_J8hQwUQK8TFbqmVlRKjqJsq0Eg0lJX
 c6H1d45VbE_iySEYm5ey4Z4YYN8NtidyeJ6yVVXqbdPbrWHpUlz7BQndIbkzLcen.5gvlTu7S60V
 O.Um56p9L0HHM
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.ne1.yahoo.com with HTTP; Tue, 27 Sep 2022 20:04:20 +0000
Received: by hermes--production-gq1-7dfd88c84d-mgq76 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 59c24ac7dff90509b43b845d0fe4485e; 
 Tue, 27 Sep 2022 20:04:18 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, paul@paul-moore.com,
 linux-security-module@vger.kernel.org
Subject: [PATCH v38 18/39] LSM: Use lsmblob in security_inode_getsecid
Date: Tue, 27 Sep 2022 12:54:00 -0700
Message-Id: <20220927195421.14713-19-casey@schaufler-ca.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
Cc: john.johansen@canonical.com, selinux@vger.kernel.org, jmorris@namei.org,
 linux-kernel@vger.kernel.org, linux-audit@redhat.com,
 linux-integrity@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Change the security_inode_getsecid() interface to fill in a
lsmblob structure instead of a u32 secid. This allows for its
callers to gather data from all registered LSMs. Data is provided
for IMA and audit.

Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: John Johansen <john.johansen@canonical.com>
Acked-by: Stephen Smalley <stephen.smalley.work@gmail.com>
Acked-by: Paul Moore <paul@paul-moore.com>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
Cc: linux-integrity@vger.kernel.org
Cc: linux-audit@redhat.com
---
 include/linux/security.h            | 13 +++++++------
 kernel/auditsc.c                    |  6 +++++-
 security/integrity/ima/ima_policy.c |  9 +++++----
 security/security.c                 | 19 +++++++++++++------
 4 files changed, 30 insertions(+), 17 deletions(-)

diff --git a/include/linux/security.h b/include/linux/security.h
index 142ecbf4dfc9..ca5dcaee7c23 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -494,7 +494,7 @@ int security_inode_getsecurity(struct user_namespace *mnt_userns,
 			       void **buffer, bool alloc);
 int security_inode_setsecurity(struct inode *inode, const char *name, const void *value, size_t size, int flags);
 int security_inode_listsecurity(struct inode *inode, char *buffer, size_t buffer_size);
-void security_inode_getsecid(struct inode *inode, u32 *secid);
+void security_inode_getsecid(struct inode *inode, struct lsmblob *blob);
 int security_inode_copy_up(struct dentry *src, struct cred **new);
 int security_inode_copy_up_xattr(const char *name);
 int security_kernfs_init_security(struct kernfs_node *kn_dir,
@@ -1041,9 +1041,10 @@ static inline int security_inode_listsecurity(struct inode *inode, char *buffer,
 	return 0;
 }
 
-static inline void security_inode_getsecid(struct inode *inode, u32 *secid)
+static inline void security_inode_getsecid(struct inode *inode,
+					   struct lsmblob *blob)
 {
-	*secid = 0;
+	lsmblob_init(blob, 0);
 }
 
 static inline int security_inode_copy_up(struct dentry *src, struct cred **new)
@@ -2059,8 +2060,8 @@ static inline void security_audit_rule_free(struct audit_lsm_rules *lsmrules)
 #if defined(CONFIG_IMA_LSM_RULES) && defined(CONFIG_SECURITY)
 int ima_filter_rule_init(u32 field, u32 op, char *rulestr, void **lsmrule,
 			 int lsmslot);
-int ima_filter_rule_match(u32 secid, u32 field, u32 op, void *lsmrule,
-			  int lsmslot);
+int ima_filter_rule_match(struct lsmblob *blob, u32 field, u32 op,
+			  void *lsmrule, int lsmslot);
 void ima_filter_rule_free(void *lsmrule, int lsmslot);
 
 #else
@@ -2071,7 +2072,7 @@ static inline int ima_filter_rule_init(u32 field, u32 op, char *rulestr,
 	return 0;
 }
 
-static inline int ima_filter_rule_match(u32 secid, u32 field, u32 op,
+static inline int ima_filter_rule_match(struct lsmblob *blob, u32 field, u32 op,
 					void *lsmrule, int lsmslot)
 {
 	return 0;
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index b2879bdf45d8..ad5f33af3b50 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -2281,13 +2281,17 @@ static void audit_copy_inode(struct audit_names *name,
 			     const struct dentry *dentry,
 			     struct inode *inode, unsigned int flags)
 {
+	struct lsmblob blob;
+
 	name->ino   = inode->i_ino;
 	name->dev   = inode->i_sb->s_dev;
 	name->mode  = inode->i_mode;
 	name->uid   = inode->i_uid;
 	name->gid   = inode->i_gid;
 	name->rdev  = inode->i_rdev;
-	security_inode_getsecid(inode, &name->osid);
+	security_inode_getsecid(inode, &blob);
+	/* scaffolding until osid is updated */
+	name->osid = lsmblob_first(&blob);
 	if (flags & AUDIT_INODE_NOEVAL) {
 		name->fcap_ver = -1;
 		return;
diff --git a/security/integrity/ima/ima_policy.c b/security/integrity/ima/ima_policy.c
index 2e1aadd36482..e8693939447b 100644
--- a/security/integrity/ima/ima_policy.c
+++ b/security/integrity/ima/ima_policy.c
@@ -636,7 +636,7 @@ static bool ima_match_rules(struct ima_rule_entry *rule,
 		return false;
 	for (i = 0; i < MAX_LSM_RULES; i++) {
 		int rc = 0;
-		u32 osid;
+		struct lsmblob lsmdata;
 
 		if (!rule->lsm[i].rule) {
 			if (!rule->lsm[i].args_p)
@@ -648,8 +648,9 @@ static bool ima_match_rules(struct ima_rule_entry *rule,
 		case LSM_OBJ_USER:
 		case LSM_OBJ_ROLE:
 		case LSM_OBJ_TYPE:
-			security_inode_getsecid(inode, &osid);
-			rc = ima_filter_rule_match(osid, rule->lsm[i].type,
+			security_inode_getsecid(inode, &lsmdata);
+			rc = ima_filter_rule_match(&lsmdata,
+						   rule->lsm[i].type,
 						   Audit_equal,
 						   rule->lsm[i].rule,
 						   rule->lsm[i].rules_lsm);
@@ -657,7 +658,7 @@ static bool ima_match_rules(struct ima_rule_entry *rule,
 		case LSM_SUBJ_USER:
 		case LSM_SUBJ_ROLE:
 		case LSM_SUBJ_TYPE:
-			rc = ima_filter_rule_match(lsmblob_first(blob),
+			rc = ima_filter_rule_match(blob,
 						   rule->lsm[i].type,
 						   Audit_equal,
 						   rule->lsm[i].rule,
diff --git a/security/security.c b/security/security.c
index 8bfece0911aa..563452000729 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1579,9 +1579,16 @@ int security_inode_listsecurity(struct inode *inode, char *buffer, size_t buffer
 }
 EXPORT_SYMBOL(security_inode_listsecurity);
 
-void security_inode_getsecid(struct inode *inode, u32 *secid)
+void security_inode_getsecid(struct inode *inode, struct lsmblob *blob)
 {
-	call_void_hook(inode_getsecid, inode, secid);
+	struct security_hook_list *hp;
+
+	lsmblob_init(blob, 0);
+	hlist_for_each_entry(hp, &security_hook_heads.inode_getsecid, list) {
+		if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
+			continue;
+		hp->hook.inode_getsecid(inode, &blob->secid[hp->lsmid->slot]);
+	}
 }
 
 int security_inode_copy_up(struct dentry *src, struct cred **new)
@@ -2827,15 +2834,15 @@ void ima_filter_rule_free(void *lsmrule, int lsmslot)
 	}
 }
 
-int ima_filter_rule_match(u32 secid, u32 field, u32 op, void *lsmrule,
-			  int lsmslot)
+int ima_filter_rule_match(struct lsmblob *blob, u32 field, u32 op,
+			  void *lsmrule, int lsmslot)
 {
 	struct security_hook_list *hp;
 
 	hlist_for_each_entry(hp, &security_hook_heads.audit_rule_match, list)
 		if (hp->lsmid->slot == lsmslot)
-			return hp->hook.audit_rule_match(secid, field, op,
-							 lsmrule);
+			return hp->hook.audit_rule_match(blob->secid[lsmslot],
+							 field, op, lsmrule);
 
 	return 0;
 }
-- 
2.37.3

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

