Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id B51CA28C23E
	for <lists+linux-audit@lfdr.de>; Mon, 12 Oct 2020 22:24:11 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-m_T_NUQ6NzWXOEou0G-4AQ-1; Mon, 12 Oct 2020 16:24:09 -0400
X-MC-Unique: m_T_NUQ6NzWXOEou0G-4AQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4573918FE866;
	Mon, 12 Oct 2020 20:24:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 28A7760C13;
	Mon, 12 Oct 2020 20:24:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F14EF58107;
	Mon, 12 Oct 2020 20:24:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09CKO1pH018677 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 12 Oct 2020 16:24:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 105922166BCC; Mon, 12 Oct 2020 20:24:01 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0ABDC2166BA4
	for <linux-audit@redhat.com>; Mon, 12 Oct 2020 20:23:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 89A26811E83
	for <linux-audit@redhat.com>; Mon, 12 Oct 2020 20:23:58 +0000 (UTC)
Received: from sonic302-28.consmr.mail.ne1.yahoo.com
	(sonic302-28.consmr.mail.ne1.yahoo.com [66.163.186.154]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-109-tENk70ePMLKXiYXkP86rSA-1;
	Mon, 12 Oct 2020 16:23:56 -0400
X-MC-Unique: tENk70ePMLKXiYXkP86rSA-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1602534236; bh=1NQ6/sbnFEDPBPKLg2KWqII5Tj3TuCV6+TODkdxpRKr=;
	h=From:To:Subject:Date;
	b=smi4XGA+5eCLgXjTVUVW3rp/B/PqKps6pTxLaBr3HetLSwWkbWUxyea+YFFKFqO+PFNbQvJaAaKRJ1D7z/8AzwJu6HZTMV9TNymcMAyk0AP8hzHaP4f8RipWief5ayTl+wL121b4I2e1x5V+jKqF4O5FNFrCVjOgCK/ivIO96kHgAsuOZbGLbKG9WzCaiBoq4TjMiPgb/Z+NulEBwbJon4tw/zPmJ5mFAoCjU85tHJt3JCt10HcavXCGNeL22kcoCd1+KOWYMekXlMADWBqE4I5vh7I3vl7sM6lHp57DoM+RNosHApoh5nKHMc8EtnZlNZNb2clhoMOh5GL1nPdsCA==
X-YMail-OSG: Lu6Kf8MVM1lYZVG3VvBhT3K_2LWTRhAg64Pt3iOZ7yeeM5OA6NetQKVkp6cZbRY
	gZ8OymAyj.gZjeVGPdrfqX2ZxBDFrYRmy1_6tYNyO7E_qzGqnSje_NQeX_7hli09DrrdOUlIHnka
	96WEHD6QjvIAdqoiXXivgB2KiG1jKdGov2wK_F6F3MMuNrkYtQELBxr0PRanld5j_pHUuJxYcla.
	gFbcW7knn6pwI_.lO2Y4tz5106cRNF6OOFF8qcMFUyK0sqmuapxbhGs9vPz_rt1EIhpPyVKMoIWW
	DwFTsbS5GAsfn9h2CHewsDGnKlKFsjJtDyyiXYoQlSrzyEW0rHUD0Xm16.7fzCx6TILNs2lIGKDB
	cHzVTWj3zsfuMaHdsscOWwVVuvBlScWysdQIi0sQ3XW7jF3KaSov1PNF3MTiTFYosO6Tj7YkYwL2
	PZWrjTpFg0fImV6cxjKmdF9G2y5SeHdClPTqVlUXXJN.a4lCJ0wsqF9bOPpma5dLU0uVFG4JyfLN
	j6_FUchHmMndF_QrJBn6m.eavsixGma.hY52njQ3djI4s73L1XlU90DOEuFH9yJ2lkg0NhYnWhlb
	4J9FMiqcIxn4IouLUuRCGtCKZtfyUKFAAwee1neEMxXVqBfFWRdIJpGw8o4n5fUcNrOh_Jktk9Uj
	u.are3egqsrBFLTWDrk8JcQrk8WdyWExrWW0WkJPNGB3r5M8jn7KgOCV7xHBfJaI5X9MU3SCHMwu
	aS785zajus7Yg_FiHY8je7rMFz6eLO.NrcAw1iXlYzXcyQsdzFUZOuRPhNslZUtOmv3M870SqRMD
	oJoWiMZ.acydqt_zRgLASvT.jjbdA2L1cNpha6tYDgWd0F7d53NbWkeVpMuyeWe1HLDDeA9lfXXZ
	xcRWSKXaYYvW6eKZlZWxfNuJkUG.xJAshB9XiiPYMOGkgn7Qwf30rXkC.CcbO9vAHDH_97XM4n.c
	SzCHObNraQwOpecsAIA542j.dZD_HvrQA1gK50tBFkT9_mMvOckriiF0V0X8HnX3CXRYURj15n7y
	Vc0LUJFEGcaywImN8BLfFhyHjqVQJc2hdGRxa5yeF.wfXmZ2QTKMXnU1caCUmNGZN3.mn38QVpRE
	ouijEysVihA0Yd0gPrU.0.bfv6jfAMJbyzRJtBAcaafJHozoRjnCvVWFDMCbAIYQeGh0c1HJ34YJ
	NJA9MtjPRT0bSUtUlvKtdlU0qNOFf48AH4La4oaJ7B8H3uhWZPE1PVF9Q2aorgsNQzMvuOw7hMCU
	ZJD.Qwp.I71q4ZO8c0i.N.Z0046mKDOdAK9dTaIHgkfGiPnU6zXNmJu0NQke_sedIgTpYnYn.q.L
	tNbBBX8hQu14d2l6Nljhr1YxlJ8cqlQ.Runc8yTjNyeJ9GR7E97OnM9aR1eypsFHOYqyYjbpsJwz
	Sc2qwSGfT7q67Kjeq3VtU0smqka28AHkwFVkruYPbg3EKbyYBsn7Cn8BtePlngVirFb_J3Vu_K3v
	aYNI_wLtPGhsgAqEHG7Nq5Ewigp_p3JV68VLtAkK8HwNHT0cMNMwYW8etyh7fZtnrXC3EGj2TCEc
	9pEezZGhS0cuxzWnQ2ZZCCYPn6abK50KEEdHrQ8oABfNfYV6S9w--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic302.consmr.mail.ne1.yahoo.com with HTTP;
	Mon, 12 Oct 2020 20:23:56 +0000
Received: by smtp424.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID ce34801972830366278caf76cfac350e; 
	Mon, 12 Oct 2020 20:23:53 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v21 04/23] LSM: Use lsmblob in security_kernel_act_as
Date: Mon, 12 Oct 2020 13:19:05 -0700
Message-Id: <20201012201924.71463-5-casey@schaufler-ca.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
index cbf1eea42e72..e2ef982b3dd7 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -442,7 +442,7 @@ void security_cred_free(struct cred *cred);
 int security_prepare_creds(struct cred *new, const struct cred *old, gfp_t gfp);
 void security_transfer_creds(struct cred *new, const struct cred *old);
 void security_cred_getsecid(const struct cred *c, u32 *secid);
-int security_kernel_act_as(struct cred *new, u32 secid);
+int security_kernel_act_as(struct cred *new, struct lsmblob *blob);
 int security_kernel_create_files_as(struct cred *new, struct inode *inode);
 int security_kernel_module_request(char *kmod_name);
 int security_kernel_load_data(enum kernel_load_data_id id);
@@ -1056,7 +1056,8 @@ static inline void security_transfer_creds(struct cred *new,
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
index f9a249a93215..d6d882b1f7d5 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1692,9 +1692,19 @@ void security_cred_getsecid(const struct cred *c, u32 *secid)
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

