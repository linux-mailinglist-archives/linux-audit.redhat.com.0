Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 46D552532D4
	for <lists+linux-audit@lfdr.de>; Wed, 26 Aug 2020 17:06:17 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-lsQi8xW_O66JH9Z9grabBg-1; Wed, 26 Aug 2020 11:06:14 -0400
X-MC-Unique: lsQi8xW_O66JH9Z9grabBg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75DFD191E2A3;
	Wed, 26 Aug 2020 15:06:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5842974F58;
	Wed, 26 Aug 2020 15:06:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 24343181A869;
	Wed, 26 Aug 2020 15:06:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07QF65w9007452 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 26 Aug 2020 11:06:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 449B4114F268; Wed, 26 Aug 2020 15:06:05 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4469C114B9CD
	for <linux-audit@redhat.com>; Wed, 26 Aug 2020 15:06:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1537980350A
	for <linux-audit@redhat.com>; Wed, 26 Aug 2020 15:06:00 +0000 (UTC)
Received: from sonic310-30.consmr.mail.ne1.yahoo.com
	(sonic310-30.consmr.mail.ne1.yahoo.com [66.163.186.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-121-Mnr6HStbN3SFk9TjKQ1Qpw-1;
	Wed, 26 Aug 2020 11:05:56 -0400
X-MC-Unique: Mnr6HStbN3SFk9TjKQ1Qpw-1
X-YMail-OSG: 3ZguHRsVM1nX4G7sDRNjlAL7KrMjPgJzH_Vxhfmcq7a7kMvVUvFVPwHZ_ZKMxWf
	CXkCkqJK9nnAlFnHW5l9X.dX.2vTZznm5PtxZ0MBnD0XP3LNz3ELlzBq2x4OYI2fConKimdiUAKs
	Y_.uDi4szRoHLgaSHnSfCb5ewxu9c9w05P9116vPpd0BGuPaS1kZDzchULtnKC7sCV31JxRoTqct
	S5FFLwdrKagbvMPpJTpayNWJ3mCi7Uh2nhIFoILmctOa9Ix.wiEfskpbkmi6LskN5hiCDIk0cHo0
	Ynz7MDnAki6RyzU1r2WStmZ_SpNuwT0cThhShKr5JFUT9ruAJok8oDPekIMYvjb3R3c.OUGtIW1S
	rhRjMw2Ph17e4V4UILu11FqJhyBRAy_69qd8capUvCHF16KUVBhNIjRwXkPCrntV6w_BthRzj7tP
	kt_s4Ef.2cJXLYOrUoe3qtfeK7YBF6KHuXJ1Qr3YvpSb2W3suognk.pT6oOqTEhscBRPMDBEtG46
	PrK3CjD.8o5yezZzTPwpBX9yFwtD.diKK65Tnpa4tHhCf.KYKJLauLzurroQ0lxd11haCmsHAi5a
	sdMNxc0hqAo5bhcbW6YTkIrF0h7Qd1ikepKKAOYcmfAG7pnFX6EX8HNzswWrH1OmIV7dVahQ057j
	ywGJwao_TSU1bT9u9tsZ4x1mchTlAyqLIC4A12aAAo9oLbIAA71u8R6wwaL.lnVWJmurbfEinIqe
	RzWN0oD64wundgLOLumy5mHJ6fh_Oe6c1kOWelQdIC4NKk7z9Xpxx_KoJvrcXgCrZpTkADF51qZ9
	a1Y7PIu.qyCp.CoZv7tFnJwGuHpyG0.PGVrYGjW1s7z_1NwPQwE3wD0Xiza7SzswKOcDsQ1.sZ_V
	e6THDrPkm0mkW.JZ.fk0TR5Sk.6Ueuuz5wNmnDvoXVvpW.Xi_qYCBmH8DsmDniCEdiytOkxNVrU8
	oHNjZ26oGarCXAcsfOO2risQbiGwFAiARTE3e_kk86tx21BwXCl.6yntXhnbXKlJX2I2CmhPCn75
	Dwl0AqSFWhsGS1Le6MRU8hDYrfANA73DK6GHFPqIn8Joh8uKqbl4VysxpzlGnLTjYTvvxDueEeI4
	.rZCtGpYFoAk58LFOy4pZNI_kT9z9LHJVhXK8RBJnmM_RPJXlfExuN5J4ND3ZNiPP1ItQ0rNPtNC
	sKxJaWdV.V1u6XMkTyyQoILLjWqFJw8W9oNDvPZGFWgCuplQLlWfoT.nUX.nO1RYWRm8t3m8IR_2
	8DX8fC72OoLfZS_gacjlL1_lyxEcqYbm4LXdw2UOKKHmx.WTLfkDffwchl9D3mJL6zbyRkXOFr4b
	X_HQln_KfDLWRuDaKfE4HDzPIfvK063UVZNR1COITmCc2K02tfkK_bXASc_GtdCundkoeJ0Bkv78
	53TQOaSCpyREcnmRmN0IXSPBtZQeJ8Fa5VnmMuwlALFYcevP5beO.Y7H9l.G5SdGNa4hgt5GdarX
	68PJwgERmvu8sYxovSTV7E39WeirHXP78PctUd6nGxIcJhzBbdIY1YsmtH4vjGrr4y29xtN2fbVL
	3EzMQcxcXoeMaAbIL
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic310.consmr.mail.ne1.yahoo.com with HTTP;
	Wed, 26 Aug 2020 15:05:56 +0000
Received: by smtp405.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 23eff56b35f3779ce5132127100bf911; 
	Wed, 26 Aug 2020 15:05:51 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v20 04/23] LSM: Use lsmblob in security_kernel_act_as
Date: Wed, 26 Aug 2020 07:52:28 -0700
Message-Id: <20200826145247.10029-5-casey@schaufler-ca.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
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
is undated to provide a lsmblob instead of a secid.

Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: John Johansen <john.johansen@canonical.com>
Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
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

