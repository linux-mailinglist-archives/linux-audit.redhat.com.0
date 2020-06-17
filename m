Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 289411FD681
	for <lists+linux-audit@lfdr.de>; Wed, 17 Jun 2020 22:56:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592427411;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oQsk0H+8gu5JWeO5wpu3Kmv2bfgW2z45sdXdyc/8jw8=;
	b=TWaC5oeRr99WZSN8nTg9OLniLWnAA+Rd19wDnczdp4V6Znm2ZCeAkjcwmJedRtU8zFPa3m
	y62HGj4kdCqNMk/k/Nt20EuwM2vSx1ddEWsNw4e7F9N69auE/EyOBhq321YXLVdwtalGIJ
	mu0A9mTKJnv53G+V6g8SIrruOnGCTj4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-nBTkuz1WOU2h3Una0hhMBQ-1; Wed, 17 Jun 2020 16:56:48 -0400
X-MC-Unique: nBTkuz1WOU2h3Una0hhMBQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15D141005513;
	Wed, 17 Jun 2020 20:56:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E9E4319931;
	Wed, 17 Jun 2020 20:56:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6969A1809547;
	Wed, 17 Jun 2020 20:56:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05HKiqu6030809 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 17 Jun 2020 16:44:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CA59A2156A2E; Wed, 17 Jun 2020 20:44:52 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C4C6D2157F26
	for <linux-audit@redhat.com>; Wed, 17 Jun 2020 20:44:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDE028007CB
	for <linux-audit@redhat.com>; Wed, 17 Jun 2020 20:44:49 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-347-gmpHsf7POa-9Gp0xfg9dWQ-1;
	Wed, 17 Jun 2020 16:44:42 -0400
X-MC-Unique: gmpHsf7POa-9Gp0xfg9dWQ-1
Received: from localhost.localdomain (c-73-42-176-67.hsd1.wa.comcast.net
	[73.42.176.67])
	by linux.microsoft.com (Postfix) with ESMTPSA id 682C020B7192;
	Wed, 17 Jun 2020 13:44:41 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 682C020B7192
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
To: zohar@linux.ibm.com, bauerman@linux.ibm.com, nayna@linux.ibm.com,
	sgrubb@redhat.com, paul@paul-moore.com
Subject: [PATCH 1/2] IMA: pass error code in result parameter to
	integrity_audit_msg()
Date: Wed, 17 Jun 2020 13:44:35 -0700
Message-Id: <20200617204436.2226-1-nramas@linux.microsoft.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05HKiqu6030809
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Wed, 17 Jun 2020 16:55:12 -0400
Cc: rgb@redhat.com, linux-integrity@vger.kernel.org, linux-audit@redhat.com,
	linux-kernel@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The value passed in "result" parameter to integrity_audit_msg() is
not an error code in some instances. Update these instances so that
"result" parameter always contains an error code.

Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
---
 security/integrity/ima/ima_appraise.c | 20 ++++++++++++--------
 security/integrity/ima/ima_fs.c       |  8 +++++---
 2 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/security/integrity/ima/ima_appraise.c b/security/integrity/ima/ima_appraise.c
index a9649b04b9f1..253dcb331249 100644
--- a/security/integrity/ima/ima_appraise.c
+++ b/security/integrity/ima/ima_appraise.c
@@ -226,7 +226,7 @@ static int xattr_verify(enum ima_hooks func, struct integrity_iint_cache *iint,
 		}
 		clear_bit(IMA_DIGSIG, &iint->atomic_flags);
 		if (xattr_len - sizeof(xattr_value->type) - hash_start >=
-				iint->ima_hash->length)
+				iint->ima_hash->length) {
 			/*
 			 * xattr length may be longer. md5 hash in previous
 			 * version occupied 20 bytes in xattr, instead of 16
@@ -234,6 +234,9 @@ static int xattr_verify(enum ima_hooks func, struct integrity_iint_cache *iint,
 			rc = memcmp(&xattr_value->data[hash_start],
 				    iint->ima_hash->digest,
 				    iint->ima_hash->length);
+			if (rc)
+				rc = -EINVAL;
+		}
 		else
 			rc = -EINVAL;
 		if (rc) {
@@ -355,7 +358,7 @@ int ima_appraise_measurement(enum ima_hooks func,
 	struct dentry *dentry = file_dentry(file);
 	struct inode *inode = d_backing_inode(dentry);
 	enum integrity_status status = INTEGRITY_UNKNOWN;
-	int rc = xattr_len;
+	int rc = -EACCES;
 	bool try_modsig = iint->flags & IMA_MODSIG_ALLOWED && modsig;
 
 	/* If not appraising a modsig, we need an xattr. */
@@ -363,10 +366,7 @@ int ima_appraise_measurement(enum ima_hooks func,
 		return INTEGRITY_UNKNOWN;
 
 	/* If reading the xattr failed and there's no modsig, error out. */
-	if (rc <= 0 && !try_modsig) {
-		if (rc && rc != -ENODATA)
-			goto out;
-
+	if (xattr_len <= 0 && !try_modsig) {
 		cause = iint->flags & IMA_DIGSIG_REQUIRED ?
 				"IMA-signature-required" : "missing-hash";
 		status = INTEGRITY_NOLABEL;
@@ -379,7 +379,8 @@ int ima_appraise_measurement(enum ima_hooks func,
 		goto out;
 	}
 
-	status = evm_verifyxattr(dentry, XATTR_NAME_IMA, xattr_value, rc, iint);
+	status = evm_verifyxattr(dentry, XATTR_NAME_IMA,
+				 xattr_value, xattr_len, iint);
 	switch (status) {
 	case INTEGRITY_PASS:
 	case INTEGRITY_PASS_IMMUTABLE:
@@ -432,14 +433,17 @@ int ima_appraise_measurement(enum ima_hooks func,
 		if ((ima_appraise & IMA_APPRAISE_FIX) && !try_modsig &&
 		    (!xattr_value ||
 		     xattr_value->type != EVM_IMA_XATTR_DIGSIG)) {
-			if (!ima_fix_xattr(dentry, iint))
+			if (!ima_fix_xattr(dentry, iint)) {
 				status = INTEGRITY_PASS;
+				rc = 0;
+			}
 		}
 
 		/* Permit new files with file signatures, but without data. */
 		if (inode->i_size == 0 && iint->flags & IMA_NEW_FILE &&
 		    xattr_value && xattr_value->type == EVM_IMA_XATTR_DIGSIG) {
 			status = INTEGRITY_PASS;
+			rc = 0;
 		}
 
 		integrity_audit_msg(AUDIT_INTEGRITY_DATA, inode, filename,
diff --git a/security/integrity/ima/ima_fs.c b/security/integrity/ima/ima_fs.c
index e3fcad871861..a3a270cff94f 100644
--- a/security/integrity/ima/ima_fs.c
+++ b/security/integrity/ima/ima_fs.c
@@ -335,10 +335,10 @@ static ssize_t ima_write_policy(struct file *file, const char __user *buf,
 		result = ima_read_policy(data);
 	} else if (ima_appraise & IMA_APPRAISE_POLICY) {
 		pr_err("signed policy file (specified as an absolute pathname) required\n");
+		result = -EACCES;
 		integrity_audit_msg(AUDIT_INTEGRITY_STATUS, NULL, NULL,
 				    "policy_update", "signed policy required",
-				    1, 0);
-		result = -EACCES;
+				    result, 0);
 	} else {
 		result = ima_parse_add_rule(data);
 	}
@@ -406,6 +406,7 @@ static int ima_open_policy(struct inode *inode, struct file *filp)
 static int ima_release_policy(struct inode *inode, struct file *file)
 {
 	const char *cause = valid_policy ? "completed" : "failed";
+	int result = 0;
 
 	if ((file->f_flags & O_ACCMODE) == O_RDONLY)
 		return seq_release(inode, file);
@@ -413,11 +414,12 @@ static int ima_release_policy(struct inode *inode, struct file *file)
 	if (valid_policy && ima_check_policy() < 0) {
 		cause = "failed";
 		valid_policy = 0;
+		result = -EINVAL;
 	}
 
 	pr_info("policy update %s\n", cause);
 	integrity_audit_msg(AUDIT_INTEGRITY_STATUS, NULL, NULL,
-			    "policy_update", cause, !valid_policy, 0);
+			    "policy_update", cause, result, 0);
 
 	if (!valid_policy) {
 		ima_delete_rules();
-- 
2.27.0


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

