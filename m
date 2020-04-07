Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id A18CA1A0380
	for <lists+linux-audit@lfdr.de>; Tue,  7 Apr 2020 02:15:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586218534;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HPg6e6A3DJjKybcoyqCPLs5/P//0DMxraJOKASjZHZI=;
	b=XJ1ePBRob22PrE+cXfMbK0NIDFkAlCc25MygqiOEEwaUP2Ccz6XgEvW9aytKQCHAj9ZsB5
	yvNJ2o0v+Jlex1JaHmpsMt1zoaHkb05U9bNmMNRWBZQfqPk2t1pFHeKkA/Pa1Xlsg9qiOL
	1T1nYlyNIguJ1acZy4Hfaw/3B7kw34k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-h0B1_Iq0N26gAq7LYys1wA-1; Mon, 06 Apr 2020 20:15:31 -0400
X-MC-Unique: h0B1_Iq0N26gAq7LYys1wA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7746DB60;
	Tue,  7 Apr 2020 00:15:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7020F5C28E;
	Tue,  7 Apr 2020 00:15:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9FD1218089C8;
	Tue,  7 Apr 2020 00:15:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0370FLj4025475 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 6 Apr 2020 20:15:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 23A8E2166B2D; Tue,  7 Apr 2020 00:15:21 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FF642166B2A
	for <linux-audit@redhat.com>; Tue,  7 Apr 2020 00:15:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B1148F3BB8
	for <linux-audit@redhat.com>; Tue,  7 Apr 2020 00:15:17 +0000 (UTC)
Received: from sonic313-15.consmr.mail.ne1.yahoo.com
	(sonic313-15.consmr.mail.ne1.yahoo.com [66.163.185.38]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-341-n0E3GSKENrWumEiwyJtoMw-1;
	Mon, 06 Apr 2020 20:15:15 -0400
X-MC-Unique: n0E3GSKENrWumEiwyJtoMw-1
X-YMail-OSG: 70_PCWwVM1lF5WQOrkmPpAEaaSbpDBKuDDll_Akgbt5yPL4ICKXPUbwM12SAXMN
	d3qvJJO7cpD.eIR2c1iozEqQxzqKcQLfLSulq8pKym2VSaPItP_Fld6jy0DvfgUjevLZegR0BEVk
	wiEduaVwpabyPBK1ERcs9vTKrFWdKN1E0059tl1d0lYprloAa9yRvKI8pWzR4Ey8AibsjZu.gxWT
	E2zx7sg8cZV9v3y_5ybOkfT4LqSzEPp0qmjjjFUhyyoZAZ_MPnPy3C4L33T9KmapP7Pxwid3F9Wu
	GXkPINs_u9X.7ppNNOUUeIdm0I5J32cKwiRy5ae4ZZy58J6Bw4I5jaKQs2rWzxXG5vVBfRz2Civi
	PS.3nuZiD7MvNHliYI_zyoz5Y9DpWeZxO90cWHulwY5t5Fr9LIeLOGP1es0UcM9eNfdxIgZEZPQu
	hXPQ5Tm9h_Nu.9QP1ROZwBc5iAsFZGbaVSrKGxkLpUnPMGnW5UvuQyOeZ_8KuigXcqRVbPUHbJWc
	GNuSmMTJXAvPIO7G3BMuvT3sLcdOOkcVI2kLbCPjakbgulWKz4.GDuyV0LyfBuzdC1p2ZRpHfu15
	efcOPc9V17wUyea5oYgvKG_GtRT25C8XhCKzevids9Yd7omRHEz6PO9GLUTsr6PiFnAycP.LYcoC
	iXquYNFQBWlpo2ak6NZ6yCoCQ4QzwNSYPn3OV4t93Wno9fb2v4OOS.SEDuFaqk_p8S4k5CvlQCBl
	fAKBNJUBym.pfJA55_96QXyrhMl8SsqGkOe3m12YXi10brJidTK0_tFdvDD2q8skNUrRn3V128tV
	xVUdmaMfQ8n724QZSegOM7n0Uj5NGnuhpYlRmwTsCjKguLZwuG2TVCw4TM1WUpAG_mCWZ3bPITac
	CTqrKZpv1iHJ2NtbZpFmuF60QELoIAxO7SIiFj.QrDUqlcnKYBicszTpVhXWAkrO0djW0u4PjU0c
	B_L39BvL_Ot.1YHlwBlEwkEq6ueZJsTEFol9Agckq5vWxjwOsml31otNUOzsVbGh3GZmUsg1UYYz
	iE_GLfEhImC5EYMDRuF9HwqH49BtaKSxXyxwKtUm7BbXi6ZCK6gX5PTRfV6tYCJRYTjS6gGChG85
	IgAo8W43lnUaNQWioypm7O1X1r6c8aEnzF6wQHKWFJakHcZRrhvGoWmIFblaeZ30PtSsnsN2Jazw
	R7s0HSzpntAx7w9mXjKgeajAqud_u7rX08wX.HSMkraNEXu8dvf2ZUDT5cxnT8m7hyCRv4FTzvMP
	uRv.rwVxFEda6SUnFDEdK1_EBITGs_XQrR65UVAGmIfqfdadr5CAVWQchyK6Vxp_HjyGk_uBrnz6
	5VYEz7n59SUNeQLK1NqW1MU_8Sr6ROY9ulgEds.7JfF4fzWGtvaHNUztDQxWEAX7mqH5M2bdxt.8
	..0EuMc3rgmulaMRG4iH50ZX5rI2EJZ4Ek7Fnsk1zXVEFK_cucFyL.Eut7MLZ4R0-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic313.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 7 Apr 2020 00:15:14 +0000
Received: by smtp429.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 521ec3bf1659742e4042339efc7d0573; 
	Tue, 07 Apr 2020 00:15:13 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v16 12/23] IMA: Change internal interfaces to use lsmblobs
Date: Mon,  6 Apr 2020 17:01:48 -0700
Message-Id: <20200407000159.43602-13-casey@schaufler-ca.com>
In-Reply-To: <20200407000159.43602-1-casey@schaufler-ca.com>
References: <20200407000159.43602-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0370FLj4025475
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
index 594cf716a16b..ccb570257f9c 100644
--- a/security/integrity/ima/ima_policy.c
+++ b/security/integrity/ima/ima_policy.c
@@ -424,7 +424,7 @@ static bool ima_match_keyring(struct ima_rule_entry *rule,
  * @rule: a pointer to a rule
  * @inode: a pointer to an inode
  * @cred: a pointer to a credentials structure for user validation
- * @secid: the secid of the task to be validated
+ * @blob: the lsm data of the task to be validated
  * @func: LIM hook identifier
  * @mask: requested action (MAY_READ | MAY_WRITE | MAY_APPEND | MAY_EXEC)
  * @keyring: keyring name to check in policy for KEY_CHECK func
@@ -432,7 +432,7 @@ static bool ima_match_keyring(struct ima_rule_entry *rule,
  * Returns true on rule match, false on failure.
  */
 static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
-			    const struct cred *cred, u32 secid,
+			    const struct cred *cred, struct lsmblob *blob,
 			    enum ima_hooks func, int mask,
 			    const char *keyring)
 {
@@ -502,7 +502,6 @@ static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
 		case LSM_SUBJ_USER:
 		case LSM_SUBJ_ROLE:
 		case LSM_SUBJ_TYPE:
-			lsmblob_init(&lsmdata, secid);
 			rc = security_filter_rule_match(&lsmdata,
 							rule->lsm[i].type,
 							Audit_equal,
@@ -546,7 +545,7 @@ static int get_subaction(struct ima_rule_entry *rule, enum ima_hooks func)
  * @inode: pointer to an inode for which the policy decision is being made
  * @cred: pointer to a credentials structure for which the policy decision is
  *        being made
- * @secid: LSM secid of the task to be validated
+ * @blob: LSM data of the task to be validated
  * @func: IMA hook identifier
  * @mask: requested action (MAY_READ | MAY_WRITE | MAY_APPEND | MAY_EXEC)
  * @pcr: set the pcr to extend
@@ -561,8 +560,9 @@ static int get_subaction(struct ima_rule_entry *rule, enum ima_hooks func)
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
@@ -578,7 +578,7 @@ int ima_match_policy(struct inode *inode, const struct cred *cred, u32 secid,
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

