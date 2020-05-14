Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA691D40E6
	for <lists+linux-audit@lfdr.de>; Fri, 15 May 2020 00:25:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589495120;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=J2CivzuZjAqGp+l9CZ8yITvwQWty/S97Pta2xu1YWlY=;
	b=JI3aRaf2ArF6Hf7dtwSgQWb71wo4s2JyDnvALHGIs705/Chemc+SJ4dmqlIcdqtupHE8G1
	VUsUm2byQKPFzN4us4fkRyTaAezXmmNw+JR7uIfqAAGKnPfnT9MFpmsxaYS0TCfvoxdDnk
	9o2Xpxhh+Wqi5vX9fXrXX6wUj+FcoRI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-jpiqLiJRMpCiKDiE7ipTwA-1; Thu, 14 May 2020 18:25:18 -0400
X-MC-Unique: jpiqLiJRMpCiKDiE7ipTwA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A53753;
	Thu, 14 May 2020 22:25:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E6455C1BE;
	Thu, 14 May 2020 22:25:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 226371809543;
	Thu, 14 May 2020 22:25:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04EMP93a019498 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 14 May 2020 18:25:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9B4E220110C7; Thu, 14 May 2020 22:25:09 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 966452028CD3
	for <linux-audit@redhat.com>; Thu, 14 May 2020 22:25:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C78A31049880
	for <linux-audit@redhat.com>; Thu, 14 May 2020 22:25:06 +0000 (UTC)
Received: from sonic309-27.consmr.mail.ne1.yahoo.com
	(sonic309-27.consmr.mail.ne1.yahoo.com [66.163.184.153]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-179-BcWKYbBQNWCuUMNTQqtP1g-1;
	Thu, 14 May 2020 18:25:04 -0400
X-MC-Unique: BcWKYbBQNWCuUMNTQqtP1g-1
X-YMail-OSG: 0nYPTOcVM1kC6DB2xE6dLG9f.zTR6axMPRJo1XTGnZggrUXtb9kd3Tt5yR_EkGr
	spaHB89rr7O2dpON9cr3DMMxkKvGPMWB0JA9gRa9154BfCRHriEHQxO9UWRuV1lZid51LtezGakc
	XxKntaPtKvNgcYyGZfHJW9ty5uAsAAEKxTrztGd7eGPo.8G1pDdE0E..5iH0xxbJOCRob3iqlybQ
	bg36Y6isyebGbR_PcLJWa2rBsvJn_Zis4eFGvKgRtdUvJ8AhGG5tCW8v8TZ8PzsMUf0MlpuY3.Ly
	uS2iFcEqrHGvO7DI9IM_ejSAueQ.Df0GDqeloMCvmzI_oGl7szuYieBVbkw1ENSfGMMqqWC4TYIg
	kad6tDZfBuxEVRL.9kwfqFSugA3AKOV8r0CwH.FrmuXsQ.ZNdoLMcFr15og6F1kw4RQPRsVo_UOB
	E6p.VVJDlYjD_E8ivy053CaQ21GaM9MZ7Q88rpxWEVz1HoBaQZ58x6YGQxl9huXsrQOXL71v3zSe
	iwdvmhLy2Np..WLjDy.TxQlWKYRPdFbQSfmQx_S36DIim35utWMIuesaejXh5TS.KX1lX94r6J4w
	pUns_AGhFlJCKSCpJv4.ECYkgQJR.s4885ZZ1kndIfJsN0yMnoVM0hPJvtB3WG0wVDMOirkY7NBU
	RuU.gVuleg6w_OUIHp1awL2MxwWymDDCgC_AdTr0hK.BxJqpqiKuUQa_IkjmOp0kZEpAE5iM4Kyd
	ASQiKgm4YK16dY6Cc8BTVD2gQcPtNiq6mQyqIkQz77T_KQ7riEwp6OoGyG5.54uff6bSj2vc3as1
	ckXAwQWp.h3V9XTmqCnL0w13BsCRoDp8InuwmmE9HUcAJbzdPRuH4Wf_O.qJZ9GluXrW_6S3RpI8
	nn_nzltt3SY_nZ23wUgDi12u7eJqaHFhjpVqOWLqUXFz7UXGudnEGHWQABf0IDb8vLxOGDJbDt0b
	_T5MCjNbC3DeUtalldCc1xTbSkE1scEMfBBgW3u0lVxwgl6P2HeoLCNiVIO1rMenAO0hnaUsPUeS
	Z8LnCIUij6z.RHXMrPMTHlc2yYLqQeP_wRPXYI8qzXAhUSj.2oNLQ.a5bdWxz3Fa_DcYBODbyguM
	pxmhcRRHlzoYm66e_BP77YlvdbtMPZp3GNCkSHX5fUFoXO_eiQ8_DX6IlWgJbtsvgCrseUZ0VqIe
	hkkGkx9kWhk0AIxQaQOAWPu20RXy0MyGKl2OC9ucb2Gsg_L7.NxCYHZmjwptCfs324CR1Om_Yj5r
	uqmO0JgGgPJllRq.gBQq8ChO3UwRk90uFlwQBbAiNPtERu.6JJqmC1r97hs6tkGUZlwGwMhn80Pd
	5k_mk4_s9B0B7t38_wZ.jvJjFOaWGdLOa1z1RgpTOeg9NKRkHem1bzNxsyKBiO4O_J0QgFj2qN3k
	sJLut5c3Ky8lSwDqR0W3n2qIWG9KtwvratApT4KRiuOt0CI2eal5Zg7sGgRbwb3kjDAI-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic309.consmr.mail.ne1.yahoo.com with HTTP;
	Thu, 14 May 2020 22:25:03 +0000
Received: by smtp423.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 98df4c152f71d4c6c0d885f8fda43499; 
	Thu, 14 May 2020 22:24:59 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v17 12/23] IMA: Change internal interfaces to use lsmblobs
Date: Thu, 14 May 2020 15:11:31 -0700
Message-Id: <20200514221142.11857-13-casey@schaufler-ca.com>
In-Reply-To: <20200514221142.11857-1-casey@schaufler-ca.com>
References: <20200514221142.11857-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
Cc: john.johansen@canonical.com, linux-audit@redhat.com,
	linux-integrity@vger.kernel.org, sds@tycho.nsa.gov
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
 security/integrity/ima/ima_policy.c   | 14 ++++++------
 5 files changed, 33 insertions(+), 40 deletions(-)

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
index 2dec956b6852..d6133f4451d1 100644
--- a/security/integrity/ima/ima_main.c
+++ b/security/integrity/ima/ima_main.c
@@ -188,8 +188,8 @@ void ima_file_free(struct file *file)
 }
 
 static int process_measurement(struct file *file, const struct cred *cred,
-			       u32 secid, char *buf, loff_t size, int mask,
-			       enum ima_hooks func)
+			       struct lsmblob *blob, char *buf, loff_t size,
+			       int mask, enum ima_hooks func)
 {
 	struct inode *inode = file_inode(file);
 	struct integrity_iint_cache *iint = NULL;
@@ -212,7 +212,7 @@ static int process_measurement(struct file *file, const struct cred *cred,
 	 * bitmask based on the appraise/audit/measurement policy.
 	 * Included is the appraise submask.
 	 */
-	action = ima_get_action(inode, cred, secid, mask, func, &pcr,
+	action = ima_get_action(inode, cred, blob, mask, func, &pcr,
 				&template_desc, NULL);
 	violation_check = ((func == FILE_CHECK || func == MMAP_CHECK) &&
 			   (ima_policy_flag & IMA_MEASURE));
@@ -386,8 +386,7 @@ int ima_file_mmap(struct file *file, unsigned long prot)
 
 	if (file && (prot & PROT_EXEC)) {
 		security_task_getsecid(current, &blob);
-		/* scaffolding - until process_measurement changes */
-		return process_measurement(file, current_cred(), blob.secid[0],
+		return process_measurement(file, current_cred(), &blob,
 					   NULL, 0, MAY_EXEC, MMAP_CHECK);
 	}
 
@@ -413,16 +412,14 @@ int ima_bprm_check(struct linux_binprm *bprm)
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
@@ -440,8 +437,7 @@ int ima_file_check(struct file *file, int mask)
 	struct lsmblob blob;
 
 	security_task_getsecid(current, &blob);
-	/* scaffolding until process_measurement changes */
-	return process_measurement(file, current_cred(), blob.secid[0], NULL, 0,
+	return process_measurement(file, current_cred(), &blob, NULL, 0,
 				   mask & (MAY_READ | MAY_WRITE | MAY_EXEC |
 					   MAY_APPEND), FILE_CHECK);
 }
@@ -622,9 +618,8 @@ int ima_post_read_file(struct file *file, void *buf, loff_t size,
 
 	func = read_idmap[read_id] ?: FILE_CHECK;
 	security_task_getsecid(current, &blob);
-	/* scaffolding until process_measurement changes */
-	return process_measurement(file, current_cred(), blob.secid[0], buf,
-				   size, MAY_READ, func);
+	return process_measurement(file, current_cred(), &blob, buf, size,
+				   MAY_READ, func);
 }
 
 /**
@@ -720,9 +715,8 @@ void process_buffer_measurement(const void *buf, int size,
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
index 2f084a388142..a89f0c3cadfe 100644
--- a/security/integrity/ima/ima_policy.c
+++ b/security/integrity/ima/ima_policy.c
@@ -422,7 +422,7 @@ static bool ima_match_keyring(struct ima_rule_entry *rule,
  * @rule: a pointer to a rule
  * @inode: a pointer to an inode
  * @cred: a pointer to a credentials structure for user validation
- * @secid: the secid of the task to be validated
+ * @blob: the lsm data of the task to be validated
  * @func: LIM hook identifier
  * @mask: requested action (MAY_READ | MAY_WRITE | MAY_APPEND | MAY_EXEC)
  * @keyring: keyring name to check in policy for KEY_CHECK func
@@ -430,7 +430,7 @@ static bool ima_match_keyring(struct ima_rule_entry *rule,
  * Returns true on rule match, false on failure.
  */
 static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
-			    const struct cred *cred, u32 secid,
+			    const struct cred *cred, struct lsmblob *blob,
 			    enum ima_hooks func, int mask,
 			    const char *keyring)
 {
@@ -500,7 +500,6 @@ static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
 		case LSM_SUBJ_USER:
 		case LSM_SUBJ_ROLE:
 		case LSM_SUBJ_TYPE:
-			lsmblob_init(&lsmdata, secid);
 			rc = security_filter_rule_match(&lsmdata,
 							rule->lsm[i].type,
 							Audit_equal,
@@ -544,7 +543,7 @@ static int get_subaction(struct ima_rule_entry *rule, enum ima_hooks func)
  * @inode: pointer to an inode for which the policy decision is being made
  * @cred: pointer to a credentials structure for which the policy decision is
  *        being made
- * @secid: LSM secid of the task to be validated
+ * @blob: LSM data of the task to be validated
  * @func: IMA hook identifier
  * @mask: requested action (MAY_READ | MAY_WRITE | MAY_APPEND | MAY_EXEC)
  * @pcr: set the pcr to extend
@@ -559,8 +558,9 @@ static int get_subaction(struct ima_rule_entry *rule, enum ima_hooks func)
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
@@ -576,7 +576,7 @@ int ima_match_policy(struct inode *inode, const struct cred *cred, u32 secid,
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

