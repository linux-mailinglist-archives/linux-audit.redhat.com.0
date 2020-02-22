Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 357A5168AB0
	for <lists+linux-audit@lfdr.de>; Sat, 22 Feb 2020 01:05:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582329949;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Iz06utkmD+BmHyXZOf3Sn/1mCi5hLL2n9xESxhljzTI=;
	b=bm9yXdEoBEkhNDAg/Xbfw/5nL5i8MKcvqUjMvJHdJnFzafaabn8wpCkGYVPwRUi8LrMJHd
	Af7hHwt3gFmPIH5nQrm/2/oRrZdK24EDrFhXnAQ51Q3DujxDUqwfsdYZYeYMa+OE4pK9Dj
	VJVRzNX26x7qIlSyhcn947RyXvFv4t4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-VNGs5rx6NWG66MNeSK16Bw-1; Fri, 21 Feb 2020 19:05:46 -0500
X-MC-Unique: VNGs5rx6NWG66MNeSK16Bw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BEA8801E53;
	Sat, 22 Feb 2020 00:05:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E8CF25C219;
	Sat, 22 Feb 2020 00:05:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A3DD918089CD;
	Sat, 22 Feb 2020 00:05:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01M05cSU001574 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 21 Feb 2020 19:05:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6FC182063FEA; Sat, 22 Feb 2020 00:05:38 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AABC2063FE6
	for <linux-audit@redhat.com>; Sat, 22 Feb 2020 00:05:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48FAB800658
	for <linux-audit@redhat.com>; Sat, 22 Feb 2020 00:05:36 +0000 (UTC)
Received: from sonic315-27.consmr.mail.ne1.yahoo.com
	(sonic315-27.consmr.mail.ne1.yahoo.com [66.163.190.153]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-438-5BEL7-kjPxeIxK_q4u5i-Q-1;
	Fri, 21 Feb 2020 19:05:34 -0500
X-MC-Unique: 5BEL7-kjPxeIxK_q4u5i-Q-1
X-YMail-OSG: G_6qJwMVM1mL2GKjiShS.YiUGwMKQRMMsAWjN.mq75yYaFD91YLatmbz2gv3Ozk
	fXv8kgPLtliwVdAshx83GC.jXw0wIFKkeUDDVKrMkHTMLyZzKZk.gg8eSPw8D0FArIT4vOFoeT71
	pDrFjeDacsUrg77vV8QlZtAtpB.ozmhYc0ua3t3FJRfhBlRcJI0bsLQhWPJr.l31DJ0lYD3yTyJn
	ZPp2rBbphbA1z5gtk3j2Rst6cj8YANedTvktS6gyoupcXrsdTqWZD0K331sdTNlXlSFIk0c3jpQP
	F6Ih6K_.pcoU.xelSLOAGLomnAmvetHE3XK.HyzAn7YQEMH.gHpDcyEI2DI5hrZ.Mg23EuTHSGJf
	YjVkvVkBrBTQTiIOcrfEFyBKMm0xW2xh_jlsf0M7K3qBLAUh4Z7GF5D.rDF2.1fjMqYv2rXUkWkm
	8KmH89buDGxwto8dxp3P6FOY9Pytau4H9J8sphSpiBRe8weKIc2IE9INrnTeu_Khw8KALSiSwIcW
	U1Uojs6huczKfGyzgtP7bD9Gwj77lZhvh9z8z9fOLGwBJd.heKS6ndNCiZ9XTFU_onGCNo9E0eLn
	CWCnHjp6GBT7HZkUyJR28Do_NF9RG_4Zb3IMApPXuTMoE9RW8laW0pMRTpL5DrmhAGtqvfHA6AQP
	tI1wW7eLB.Ief41Xniy5uQ2tJxHn9yBP_lu4gYvpB_M49tvRzBJnsWHiMPcqrwU36Qy1P3.__vV4
	vF.hK_a7_EVnGO2FIuXbVBEo2kocLamFBkfbAE_dnRWHrQYop4MNn_aDDDoywqwOVy1blns0k40R
	k.S9HHViKAGIQFe7KIFbmmyFF9oohNyBkLk_o82MTTTK3VDfHBQelje_3Y2ggBVWYzs4_bMWfZ92
	PGQLodqMawbvFFHHqseaKqNs_905ENIvIX5U_G865ftmykuMxpfyeZF9mwMNmo_MMNAgziBp7RnU
	4ToZzCG1GJn1TZiH.hZmJsmEN6oORszcAXsaB.SAKpKrsJsZ_96jGnU8.58BSi8aJDo3M5NX1zJy
	_xkDp4YUmFlwFtHtwuyy6iihpqZyn9j0Ou1v7brGbQKPsW8SiBmFcTrKKfbirmTPy2qMxd6irCQX
	zvz58Lgou1r5G.sYgoqGnDNLpGBG.rfO7Ed_oEZYSC38f_dSAAwYkl5s0VrFZ.mjNelYq0t5R4nb
	alK7TeAPSgwOZYXz3NibbVYcdQYqhPESx9q85EmMSU01E1H20uVApRBCZGpdQFZ3m5dynKjrOMFW
	uvVz0epFQ8x7zXXVs4KPuqQkwFowpglMPp.krScD1oVXfZl6q24mpkU4PM4hF.fOyF9H7_1IgxN_
	70spQ0GmJ4CNFyiZ3PC7MSJRArIbf19PJYF1HpwfOT8jz3jthP6R1XDjuSBjiq1TExAPfnKKrdR4
	tzI1a257B96FHKYpN9.lISGTX30MS0bb8CyB04EbMTgCJ1gYoOblraw--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic315.consmr.mail.ne1.yahoo.com with HTTP;
	Sat, 22 Feb 2020 00:05:33 +0000
Received: by smtp407.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID bc004ae203dd3a2252190e464b196e15; 
	Sat, 22 Feb 2020 00:05:30 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, linux-audit@redhat.com
Subject: [PATCH v15 12/23] IMA: Change internal interfaces to use lsmblobs
Date: Fri, 21 Feb 2020 16:04:03 -0800
Message-Id: <20200222000407.110158-10-casey@schaufler-ca.com>
In-Reply-To: <20200222000407.110158-1-casey@schaufler-ca.com>
References: <20200222000407.110158-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01M05cSU001574
X-loop: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The IMA interfaces ima_get_action() and ima_match_policy()
call LSM functions that use lsmblobs. Change the IMA functions
to pass the lsmblob to be compatible with the LSM functions.

Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: John Johansen <john.johansen@canonical.com>
Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
cc: linux-integrity@vger.kernel.org
---
 security/integrity/ima/ima.h          | 11 ++++-----
 security/integrity/ima/ima_api.c      | 10 ++++-----
 security/integrity/ima/ima_appraise.c |  6 ++---
 security/integrity/ima/ima_main.c     | 32 +++++++++++----------------
 security/integrity/ima/ima_policy.c   | 12 +++++-----
 5 files changed, 32 insertions(+), 39 deletions(-)

diff --git a/security/integrity/ima/ima.h b/security/integrity/ima/ima.h
index f9e3ca96fa52..a85aa57d28c5 100644
--- a/security/integrity/ima/ima.h
+++ b/security/integrity/ima/ima.h
@@ -230,9 +230,9 @@ static inline void ima_process_queued_keys(void) {}
 #endif /* CONFIG_IMA_QUEUE_EARLY_BOOT_KEYS */
 
 /* LIM API function definitions */
-int ima_get_action(struct inode *inode, const struct cred *cred, u32 secid,
-		   int mask, enum ima_hooks func, int *pcr,
-		   struct ima_template_desc **template_desc,
+int ima_get_action(struct inode *inode, const struct cred *cred,
+		   struct lsmblob *blob, int mask, enum ima_hooks func,
+		   int *pcr, struct ima_template_desc **template_desc,
 		   const char *keyring);
 int ima_must_measure(struct inode *inode, int mask, enum ima_hooks func);
 int ima_collect_measurement(struct integrity_iint_cache *iint,
@@ -258,8 +258,9 @@ void ima_free_template_entry(struct ima_template_entry *entry);
 const char *ima_d_path(const struct path *path, char **pathbuf, char *filename);
 
 /* IMA policy related functions */
-int ima_match_policy(struct inode *inode, const struct cred *cred, u32 secid,
-		     enum ima_hooks func, int mask, int flags, int *pcr,
+int ima_match_policy(struct inode *inode, const struct cred *cred,
+		     struct lsmblob *blob, enum ima_hooks func, int mask,
+		     int flags, int *pcr,
 		     struct ima_template_desc **template_desc,
 		     const char *keyring);
 void ima_init_policy(void);
diff --git a/security/integrity/ima/ima_api.c b/security/integrity/ima/ima_api.c
index f6bc00914aa5..b481bbc2e55f 100644
--- a/security/integrity/ima/ima_api.c
+++ b/security/integrity/ima/ima_api.c
@@ -163,7 +163,7 @@ void ima_add_violation(struct file *file, const unsigned char *filename,
  * ima_get_action - appraise & measure decision based on policy.
  * @inode: pointer to inode to measure
  * @cred: pointer to credentials structure to validate
- * @secid: secid of the task being validated
+ * @blob: LSM data of the task being validated
  * @mask: contains the permission mask (MAY_READ, MAY_WRITE, MAY_EXEC,
  *        MAY_APPEND)
  * @func: caller identifier
@@ -182,16 +182,16 @@ void ima_add_violation(struct file *file, const unsigned char *filename,
  * Returns IMA_MEASURE, IMA_APPRAISE mask.
  *
  */
-int ima_get_action(struct inode *inode, const struct cred *cred, u32 secid,
-		   int mask, enum ima_hooks func, int *pcr,
-		   struct ima_template_desc **template_desc,
+int ima_get_action(struct inode *inode, const struct cred *cred,
+		   struct lsmblob *blob, int mask, enum ima_hooks func,
+		   int *pcr, struct ima_template_desc **template_desc,
 		   const char *keyring)
 {
 	int flags = IMA_MEASURE | IMA_AUDIT | IMA_APPRAISE | IMA_HASH;
 
 	flags &= ima_policy_flag;
 
-	return ima_match_policy(inode, cred, secid, func, mask, flags, pcr,
+	return ima_match_policy(inode, cred, blob, func, mask, flags, pcr,
 				template_desc, keyring);
 }
 
diff --git a/security/integrity/ima/ima_appraise.c b/security/integrity/ima/ima_appraise.c
index 3dfb573c7171..bf66e3e6f398 100644
--- a/security/integrity/ima/ima_appraise.c
+++ b/security/integrity/ima/ima_appraise.c
@@ -54,10 +54,8 @@ int ima_must_appraise(struct inode *inode, int mask, enum ima_hooks func)
 		return 0;
 
 	security_task_getsecid(current, &blob);
-	/* scaffolding the .secid[0] */
-	return ima_match_policy(inode, current_cred(), blob.secid[0], func,
-				mask, IMA_APPRAISE | IMA_HASH, NULL, NULL,
-				NULL);
+	return ima_match_policy(inode, current_cred(), &blob, func, mask,
+				IMA_APPRAISE | IMA_HASH, NULL, NULL, NULL);
 }
 
 static int ima_fix_xattr(struct dentry *dentry,
diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
index 8ad399ea7883..a6348dca299c 100644
--- a/security/integrity/ima/ima_main.c
+++ b/security/integrity/ima/ima_main.c
@@ -190,8 +190,8 @@ void ima_file_free(struct file *file)
 }
 
 static int process_measurement(struct file *file, const struct cred *cred,
-			       u32 secid, char *buf, loff_t size, int mask,
-			       enum ima_hooks func)
+			       struct lsmblob *blob, char *buf, loff_t size,
+			       int mask, enum ima_hooks func)
 {
 	struct inode *inode = file_inode(file);
 	struct integrity_iint_cache *iint = NULL;
@@ -214,7 +214,7 @@ static int process_measurement(struct file *file, const struct cred *cred,
 	 * bitmask based on the appraise/audit/measurement policy.
 	 * Included is the appraise submask.
 	 */
-	action = ima_get_action(inode, cred, secid, mask, func, &pcr,
+	action = ima_get_action(inode, cred, blob, mask, func, &pcr,
 				&template_desc, NULL);
 	violation_check = ((func == FILE_CHECK || func == MMAP_CHECK) &&
 			   (ima_policy_flag & IMA_MEASURE));
@@ -388,8 +388,7 @@ int ima_file_mmap(struct file *file, unsigned long prot)
 
 	if (file && (prot & PROT_EXEC)) {
 		security_task_getsecid(current, &blob);
-		/* scaffolding - until process_measurement changes */
-		return process_measurement(file, current_cred(), blob.secid[0],
+		return process_measurement(file, current_cred(), &blob,
 					   NULL, 0, MAY_EXEC, MMAP_CHECK);
 	}
 
@@ -415,16 +414,14 @@ int ima_bprm_check(struct linux_binprm *bprm)
 	struct lsmblob blob;
 
 	security_task_getsecid(current, &blob);
-	/* scaffolding until process_measurement changes */
-	ret = process_measurement(bprm->file, current_cred(), blob.secid[0],
-				  NULL, 0, MAY_EXEC, BPRM_CHECK);
+	ret = process_measurement(bprm->file, current_cred(), &blob, NULL, 0,
+				  MAY_EXEC, BPRM_CHECK);
 	if (ret)
 		return ret;
 
 	security_cred_getsecid(bprm->cred, &blob);
-	/* scaffolding until process_measurement changes */
-	return process_measurement(bprm->file, bprm->cred, blob.secid[0],
-				   NULL, 0, MAY_EXEC, CREDS_CHECK);
+	return process_measurement(bprm->file, bprm->cred, &blob, NULL, 0,
+				   MAY_EXEC, CREDS_CHECK);
 }
 
 /**
@@ -442,8 +439,7 @@ int ima_file_check(struct file *file, int mask)
 	struct lsmblob blob;
 
 	security_task_getsecid(current, &blob);
-	/* scaffolding until process_measurement changes */
-	return process_measurement(file, current_cred(), blob.secid[0], NULL, 0,
+	return process_measurement(file, current_cred(), &blob, NULL, 0,
 				   mask & (MAY_READ | MAY_WRITE | MAY_EXEC |
 					   MAY_APPEND), FILE_CHECK);
 }
@@ -624,9 +620,8 @@ int ima_post_read_file(struct file *file, void *buf, loff_t size,
 
 	func = read_idmap[read_id] ?: FILE_CHECK;
 	security_task_getsecid(current, &blob);
-	/* scaffolding until process_measurement changes */
-	return process_measurement(file, current_cred(), blob.secid[0], buf,
-				   size, MAY_READ, func);
+	return process_measurement(file, current_cred(), &blob, buf, size,
+				   MAY_READ, func);
 }
 
 /**
@@ -722,9 +717,8 @@ void process_buffer_measurement(const void *buf, int size,
 	 */
 	if (func) {
 		security_task_getsecid(current, &blob);
-		/* scaffolding */
-		action = ima_get_action(NULL, current_cred(), blob.secid[0], 0,
-					func, &pcr, &template, keyring);
+		action = ima_get_action(NULL, current_cred(), &blob, 0, func,
+					&pcr, &template, keyring);
 		if (!(action & IMA_MEASURE))
 			return;
 	}
diff --git a/security/integrity/ima/ima_policy.c b/security/integrity/ima/ima_policy.c
index 5c3270050dd8..5ff6218a9c4a 100644
--- a/security/integrity/ima/ima_policy.c
+++ b/security/integrity/ima/ima_policy.c
@@ -426,7 +426,7 @@ static bool ima_match_keyring(struct ima_rule_entry *rule,
  * Returns true on rule match, false on failure.
  */
 static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
-			    const struct cred *cred, u32 secid,
+			    const struct cred *cred, struct lsmblob *blob,
 			    enum ima_hooks func, int mask,
 			    const char *keyring)
 {
@@ -496,7 +496,6 @@ static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
 		case LSM_SUBJ_USER:
 		case LSM_SUBJ_ROLE:
 		case LSM_SUBJ_TYPE:
-			lsmblob_init(&blob, secid);
 			rc = security_filter_rule_match(&blob,
 							rule->lsm[i].type,
 							Audit_equal,
@@ -540,7 +539,7 @@ static int get_subaction(struct ima_rule_entry *rule, enum ima_hooks func)
  * @inode: pointer to an inode for which the policy decision is being made
  * @cred: pointer to a credentials structure for which the policy decision is
  *        being made
- * @secid: LSM secid of the task to be validated
+ * @blob: LSM data of the task to be validated
  * @func: IMA hook identifier
  * @mask: requested action (MAY_READ | MAY_WRITE | MAY_APPEND | MAY_EXEC)
  * @pcr: set the pcr to extend
@@ -555,8 +554,9 @@ static int get_subaction(struct ima_rule_entry *rule, enum ima_hooks func)
  * list when walking it.  Reads are many orders of magnitude more numerous
  * than writes so ima_match_policy() is classical RCU candidate.
  */
-int ima_match_policy(struct inode *inode, const struct cred *cred, u32 secid,
-		     enum ima_hooks func, int mask, int flags, int *pcr,
+int ima_match_policy(struct inode *inode, const struct cred *cred,
+		     struct lsmblob *blob, enum ima_hooks func, int mask,
+		     int flags, int *pcr,
 		     struct ima_template_desc **template_desc,
 		     const char *keyring)
 {
@@ -572,7 +572,7 @@ int ima_match_policy(struct inode *inode, const struct cred *cred, u32 secid,
 		if (!(entry->action & actmask))
 			continue;
 
-		if (!ima_match_rules(entry, inode, cred, secid, func, mask,
+		if (!ima_match_rules(entry, inode, cred, blob, func, mask,
 				     keyring))
 			continue;
 
-- 
2.24.1


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

