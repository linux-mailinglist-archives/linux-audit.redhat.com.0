Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9C4F11F9839
	for <lists+linux-audit@lfdr.de>; Mon, 15 Jun 2020 15:21:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592227266;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=byWyD6QOhTKr5aVundc4OAh9FiMx99UptCEYl/3IN70=;
	b=OFQMgPLMkmi/7ILu2OS9byEZMkSY6rmixV1QUiXMBl61zPhwvHtI5VfEFj4PalwKp3AUJs
	u0KKa2RfYoJF1+a2nKaFnyQ7m4T98nDFa80VWD64zR3FkxnmVx6A58JHGYHWSo9mvh3FVD
	cFnQJ7F48f6Xsootgh3f1mV4FG0A0K4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-TxOPVRQHP-mUZj2j6YInvw-1; Mon, 15 Jun 2020 09:21:04 -0400
X-MC-Unique: TxOPVRQHP-mUZj2j6YInvw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1973D18A8229;
	Mon, 15 Jun 2020 13:20:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF5C95C1D2;
	Mon, 15 Jun 2020 13:20:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BD8B01809561;
	Mon, 15 Jun 2020 13:20:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05D2R496021580 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 12 Jun 2020 22:27:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DF7DB2EFA1; Sat, 13 Jun 2020 02:27:04 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D9A342EF98
	for <linux-audit@redhat.com>; Sat, 13 Jun 2020 02:27:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2CCBE1859160
	for <linux-audit@redhat.com>; Sat, 13 Jun 2020 02:27:02 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-104-JpGdIJKvMgyukGhRgBUHSw-1;
	Fri, 12 Jun 2020 22:26:47 -0400
X-MC-Unique: JpGdIJKvMgyukGhRgBUHSw-1
Received: from localhost.localdomain (c-73-42-176-67.hsd1.wa.comcast.net
	[73.42.176.67])
	by linux.microsoft.com (Postfix) with ESMTPSA id 2C12D20B4781;
	Fri, 12 Jun 2020 19:26:46 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2C12D20B4781
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
To: zohar@linux.ibm.com, sgrubb@redhat.com, paul@paul-moore.com
Subject: [PATCH v2 2/2] IMA: Add audit log for failure conditions
Date: Fri, 12 Jun 2020 19:26:33 -0700
Message-Id: <20200613022633.3129-2-nramas@linux.microsoft.com>
In-Reply-To: <20200613022633.3129-1-nramas@linux.microsoft.com>
References: <20200613022633.3129-1-nramas@linux.microsoft.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05D2R496021580
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 15 Jun 2020 09:20:43 -0400
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

process_buffer_measurement() and ima_alloc_key_entry() functions need to
log an audit message for auditing integrity measurement failures.

Add audit message in these two functions. Remove "pr_devel" log message
in process_buffer_measurement().

Sample audit messages:

[    6.415374] audit: type=1804 audit(1592005945.627:2): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel op=measuring_kexec_cmdline cause=alloc_entry comm="swapper/0" name="kexec-cmdline" res=0 result=-12

[    8.085456] audit: type=1802 audit(1592005947.297:9): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 op=policy_update cause=completed comm="systemd" res=1 result=0

[    8.128004] audit: type=1804 audit(1592005947.341:11): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 op=measuring_key cause=hashing_error comm="systemd" name=".builtin_trusted_keys" res=0 result=-22

Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Suggested-by: Mimi Zohar <zohar@linux.ibm.com>
---
 security/integrity/ima/ima.h            | 48 ++++++++++++++++---------
 security/integrity/ima/ima_main.c       | 18 +++++++---
 security/integrity/ima/ima_policy.c     |  2 +-
 security/integrity/ima/ima_queue_keys.c |  5 +++
 4 files changed, 51 insertions(+), 22 deletions(-)

diff --git a/security/integrity/ima/ima.h b/security/integrity/ima/ima.h
index df93ac258e01..c3a32e181b48 100644
--- a/security/integrity/ima/ima.h
+++ b/security/integrity/ima/ima.h
@@ -186,27 +186,43 @@ static inline unsigned int ima_hash_key(u8 *digest)
 	return (digest[0] | digest[1] << 8) % IMA_MEASURE_HTABLE_SIZE;
 }
 
-#define __ima_hooks(hook)		\
-	hook(NONE)			\
-	hook(FILE_CHECK)		\
-	hook(MMAP_CHECK)		\
-	hook(BPRM_CHECK)		\
-	hook(CREDS_CHECK)		\
-	hook(POST_SETATTR)		\
-	hook(MODULE_CHECK)		\
-	hook(FIRMWARE_CHECK)		\
-	hook(KEXEC_KERNEL_CHECK)	\
-	hook(KEXEC_INITRAMFS_CHECK)	\
-	hook(POLICY_CHECK)		\
-	hook(KEXEC_CMDLINE)		\
-	hook(KEY_CHECK)			\
-	hook(MAX_CHECK)
-#define __ima_hook_enumify(ENUM)	ENUM,
+#define __ima_hooks(hook)				\
+	hook(NONE, none)				\
+	hook(FILE_CHECK, file)				\
+	hook(MMAP_CHECK, mmap)				\
+	hook(BPRM_CHECK, bprm)				\
+	hook(CREDS_CHECK, creds)			\
+	hook(POST_SETATTR, post_setattr)		\
+	hook(MODULE_CHECK, module)			\
+	hook(FIRMWARE_CHECK, firmware)			\
+	hook(KEXEC_KERNEL_CHECK, kexec_kernel)		\
+	hook(KEXEC_INITRAMFS_CHECK, kexec_initramfs)	\
+	hook(POLICY_CHECK, policy)			\
+	hook(KEXEC_CMDLINE, kexec_cmdline)		\
+	hook(KEY_CHECK, key)				\
+	hook(MAX_CHECK, none)
+
+#define __ima_hook_enumify(ENUM, str)	ENUM,
+#define __ima_stringify(arg) (#arg)
+#define __ima_hook_measuring_stringify(ENUM, str) \
+		(__ima_stringify(measuring_ ##str)),
 
 enum ima_hooks {
 	__ima_hooks(__ima_hook_enumify)
 };
 
+static const char * const ima_hooks_measure_str[] = {
+	__ima_hooks(__ima_hook_measuring_stringify)
+};
+
+static inline const char *func_measure_str(enum ima_hooks func)
+{
+	if (func >= MAX_CHECK)
+		return ima_hooks_measure_str[NONE];
+
+	return ima_hooks_measure_str[func];
+}
+
 extern const char *const func_tokens[];
 
 struct modsig;
diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
index c1583d98c5e5..8a001aa8e592 100644
--- a/security/integrity/ima/ima_main.c
+++ b/security/integrity/ima/ima_main.c
@@ -740,6 +740,7 @@ void process_buffer_measurement(const void *buf, int size,
 				int pcr, const char *keyring)
 {
 	int ret = 0;
+	const char *audit_cause = "ENOMEM";
 	struct ima_template_entry *entry = NULL;
 	struct integrity_iint_cache iint = {};
 	struct ima_event_data event_data = {.iint = &iint,
@@ -794,21 +795,28 @@ void process_buffer_measurement(const void *buf, int size,
 	iint.ima_hash->length = hash_digest_size[ima_hash_algo];
 
 	ret = ima_calc_buffer_hash(buf, size, iint.ima_hash);
-	if (ret < 0)
+	if (ret < 0) {
+		audit_cause = "hashing_error";
 		goto out;
+	}
 
 	ret = ima_alloc_init_template(&event_data, &entry, template);
-	if (ret < 0)
+	if (ret < 0) {
+		audit_cause = "alloc_entry";
 		goto out;
+	}
 
 	ret = ima_store_template(entry, violation, NULL, buf, pcr);
-
-	if (ret < 0)
+	if (ret < 0) {
+		audit_cause = "store_entry";
 		ima_free_template_entry(entry);
+	}
 
 out:
 	if (ret < 0)
-		pr_devel("%s: failed, result: %d\n", __func__, ret);
+		integrity_audit_msg(AUDIT_INTEGRITY_PCR, NULL, eventname,
+				    func_measure_str(func),
+				    audit_cause, ret, 0);
 
 	return;
 }
diff --git a/security/integrity/ima/ima_policy.c b/security/integrity/ima/ima_policy.c
index e493063a3c34..66aa3e17a888 100644
--- a/security/integrity/ima/ima_policy.c
+++ b/security/integrity/ima/ima_policy.c
@@ -1414,7 +1414,7 @@ void ima_delete_rules(void)
 	}
 }
 
-#define __ima_hook_stringify(str)	(#str),
+#define __ima_hook_stringify(func, str)	(#func),
 
 const char *const func_tokens[] = {
 	__ima_hooks(__ima_hook_stringify)
diff --git a/security/integrity/ima/ima_queue_keys.c b/security/integrity/ima/ima_queue_keys.c
index cb3e3f501593..631fd7ab2dcd 100644
--- a/security/integrity/ima/ima_queue_keys.c
+++ b/security/integrity/ima/ima_queue_keys.c
@@ -68,6 +68,7 @@ static struct ima_key_entry *ima_alloc_key_entry(struct key *keyring,
 						 size_t payload_len)
 {
 	int rc = 0;
+	const char *audit_cause = "ENOMEM";
 	struct ima_key_entry *entry;
 
 	entry = kzalloc(sizeof(*entry), GFP_KERNEL);
@@ -88,6 +89,10 @@ static struct ima_key_entry *ima_alloc_key_entry(struct key *keyring,
 
 out:
 	if (rc) {
+		integrity_audit_msg(AUDIT_INTEGRITY_PCR, NULL,
+				    keyring->description,
+				    func_measure_str(KEY_CHECK),
+				    audit_cause, rc, 0);
 		ima_free_key_entry(entry);
 		entry = NULL;
 	}
-- 
2.27.0


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

