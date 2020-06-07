Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id C5C8E1F18CC
	for <lists+linux-audit@lfdr.de>; Mon,  8 Jun 2020 14:32:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591619563;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TatiPrQR/T0mJADiYC4Lo6HFpTTMBSf1efy57Xk8KxA=;
	b=feRlZ5DTH0xr8X1vWxSGD+yZMTdr6ThSRtnMWM0W1MpD5AWFdHznHL7UV/KxRtyylN89U1
	jE+f41ZTaV9ULfHJgXijRRNSzJUxleChpfqHY1rDKCDIMGCkDX7rBiR6jNHBgppJ7D/pmg
	cZ9oSuLEo/8C6lQqtPg7jk6Ss1Q5zZ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-bNk3cWT1M5agww0Y7sHZ9A-1; Mon, 08 Jun 2020 08:32:41 -0400
X-MC-Unique: bNk3cWT1M5agww0Y7sHZ9A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 982218018AD;
	Mon,  8 Jun 2020 12:32:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2983F5C1C5;
	Mon,  8 Jun 2020 12:32:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 398F41809554;
	Mon,  8 Jun 2020 12:32:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 057MF0ef008277 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 7 Jun 2020 18:15:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3557E2166BA2; Sun,  7 Jun 2020 22:15:00 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B62C2166B27
	for <linux-audit@redhat.com>; Sun,  7 Jun 2020 22:14:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B5AA80CDAF
	for <linux-audit@redhat.com>; Sun,  7 Jun 2020 22:14:57 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-498-9FTAWm2hMVqP5yZJUY75SA-1;
	Sun, 07 Jun 2020 18:14:54 -0400
X-MC-Unique: 9FTAWm2hMVqP5yZJUY75SA-1
Received: from localhost.localdomain (c-73-42-176-67.hsd1.wa.comcast.net
	[73.42.176.67])
	by linux.microsoft.com (Postfix) with ESMTPSA id 9A53120B717B;
	Sun,  7 Jun 2020 15:14:53 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9A53120B717B
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
To: zohar@linux.ibm.com, paul@paul-moore.com
Subject: [PATCH v2] IMA: Add audit log for failure conditions
Date: Sun,  7 Jun 2020 15:14:49 -0700
Message-Id: <20200607221449.2837-1-nramas@linux.microsoft.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 057MF0ef008277
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 08 Jun 2020 08:32:21 -0400
Cc: linux-integrity@vger.kernel.org, linux-audit@redhat.com,
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

The final log statement in process_buffer_measurement() for failure
condition is at debug level. This does not log the message unless
the system log level is raised which would significantly increase
the messages in the system log. Change this log message to an audit
message for better triaging failures in the function.

ima_alloc_key_entry() does not log a message for failure condition.
Add an audit message for failure condition in this function.

Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
---
 security/integrity/ima/ima_main.c       | 17 ++++++++++++-----
 security/integrity/ima/ima_queue_keys.c |  4 ++++
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
index 800fb3bba418..1225198fceb1 100644
--- a/security/integrity/ima/ima_main.c
+++ b/security/integrity/ima/ima_main.c
@@ -739,6 +739,7 @@ void process_buffer_measurement(const void *buf, int size,
 				int pcr, const char *keyring)
 {
 	int ret = 0;
+	const char *audit_cause = "ENOMEM";
 	struct ima_template_entry *entry = NULL;
 	struct integrity_iint_cache iint = {};
 	struct ima_event_data event_data = {.iint = &iint,
@@ -793,21 +794,27 @@ void process_buffer_measurement(const void *buf, int size,
 	iint.ima_hash->length = hash_digest_size[ima_hash_algo];
 
 	ret = ima_calc_buffer_hash(buf, size, iint.ima_hash);
-	if (ret < 0)
+	if (ret < 0) {
+		audit_cause = "calc_buffer_hash";
 		goto out;
+	}
 
 	ret = ima_alloc_init_template(&event_data, &entry, template);
-	if (ret < 0)
+	if (ret < 0) {
+		audit_cause = "alloc_init_template";
 		goto out;
+	}
 
 	ret = ima_store_template(entry, violation, NULL, buf, pcr);
-
-	if (ret < 0)
+	if (ret < 0) {
+		audit_cause = "store_template";
 		ima_free_template_entry(entry);
+	}
 
 out:
 	if (ret < 0)
-		pr_devel("%s: failed, result: %d\n", __func__, ret);
+		integrity_audit_msg(AUDIT_INTEGRITY_PCR, NULL, eventname,
+				    __func__, audit_cause, ret, 0);
 
 	return;
 }
diff --git a/security/integrity/ima/ima_queue_keys.c b/security/integrity/ima/ima_queue_keys.c
index cb3e3f501593..fa606ce68f87 100644
--- a/security/integrity/ima/ima_queue_keys.c
+++ b/security/integrity/ima/ima_queue_keys.c
@@ -68,6 +68,7 @@ static struct ima_key_entry *ima_alloc_key_entry(struct key *keyring,
 						 size_t payload_len)
 {
 	int rc = 0;
+	const char *audit_cause = "ENOMEM";
 	struct ima_key_entry *entry;
 
 	entry = kzalloc(sizeof(*entry), GFP_KERNEL);
@@ -88,6 +89,9 @@ static struct ima_key_entry *ima_alloc_key_entry(struct key *keyring,
 
 out:
 	if (rc) {
+		integrity_audit_msg(AUDIT_INTEGRITY_PCR, NULL,
+				    keyring->description, __func__,
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

