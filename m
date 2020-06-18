Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id CA5FF204758
	for <lists+linux-audit@lfdr.de>; Tue, 23 Jun 2020 04:36:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592879812;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=e0lngRm1Ly9HYofUyWR6mE45yYVI0Yu/cWFjdIvZMrk=;
	b=bOtIURRkNnWnlaLiHINf2KWTgZj4SQF30M6Q9XU+nfhfbDQo6RUKkBznnLrkpP+8j5OH8a
	/3mP3/KLToSYYf2/K0aELrIX9Aq8PpiCog7hyLbC5Hzt4zjaO9IpFLSg93BuIl4Ihe3kbV
	bVsAdYc3yInQXDhDNJzyGHSPocLlAz0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-95w-UNWqPIeBIoa7-AFgCA-1; Mon, 22 Jun 2020 22:36:46 -0400
X-MC-Unique: 95w-UNWqPIeBIoa7-AFgCA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DCB98031C2;
	Tue, 23 Jun 2020 02:36:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BCCCC512FE;
	Tue, 23 Jun 2020 02:36:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E6A961809554;
	Tue, 23 Jun 2020 02:36:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05ILAOZm003126 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 18 Jun 2020 17:10:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6B24E2156A2E; Thu, 18 Jun 2020 21:10:24 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6662E2157F26
	for <linux-audit@redhat.com>; Thu, 18 Jun 2020 21:10:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E05D38316EB
	for <linux-audit@redhat.com>; Thu, 18 Jun 2020 21:10:21 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-43-9PS2d28RNwWDAOkYSdp8sw-1;
	Thu, 18 Jun 2020 17:10:17 -0400
X-MC-Unique: 9PS2d28RNwWDAOkYSdp8sw-1
Received: from localhost.localdomain (c-73-42-176-67.hsd1.wa.comcast.net
	[73.42.176.67])
	by linux.microsoft.com (Postfix) with ESMTPSA id EDA5E207564C;
	Thu, 18 Jun 2020 14:10:15 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com EDA5E207564C
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
To: zohar@linux.ibm.com, sgrubb@redhat.com, paul@paul-moore.com
Subject: [PATCH v3 1/2] integrity: Add errno field in audit message
Date: Thu, 18 Jun 2020 14:10:11 -0700
Message-Id: <20200618211012.2823-1-nramas@linux.microsoft.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05ILAOZm003126
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 22 Jun 2020 22:36:20 -0400
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Error code is not included in the audit messages logged by
the integrity subsystem.

Define a new function integrity_audit_message() that takes error code
in the "errno" parameter. Add "errno" field in the audit messages logged
by the integrity subsystem and set the value passed in the "errno"
parameter.

[    6.303048] audit: type=1804 audit(1592506281.627:2): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel op=measuring_key cause=ENOMEM comm="swapper/0" name=".builtin_trusted_keys" res=0 errno=-12

[    7.987647] audit: type=1802 audit(1592506283.312:9): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 op=policy_update cause=completed comm="systemd" res=1 errno=0

[    8.019432] audit: type=1804 audit(1592506283.344:10): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 op=measuring_kexec_cmdline cause=hashing_error comm="systemd" name="kexec-cmdline" res=0 errno=-22

Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Suggested-by: Steve Grubb <sgrubb@redhat.com>
Suggested-by: Mimi Zohar <zohar@linux.ibm.com>
---
 security/integrity/integrity.h       | 13 +++++++++++++
 security/integrity/integrity_audit.c | 11 ++++++++++-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/security/integrity/integrity.h b/security/integrity/integrity.h
index 16c1894c29bb..413c803c5208 100644
--- a/security/integrity/integrity.h
+++ b/security/integrity/integrity.h
@@ -239,6 +239,11 @@ void integrity_audit_msg(int audit_msgno, struct inode *inode,
 			 const unsigned char *fname, const char *op,
 			 const char *cause, int result, int info);
 
+void integrity_audit_message(int audit_msgno, struct inode *inode,
+			     const unsigned char *fname, const char *op,
+			     const char *cause, int result, int info,
+			     int errno);
+
 static inline struct audit_buffer *
 integrity_audit_log_start(struct audit_context *ctx, gfp_t gfp_mask, int type)
 {
@@ -253,6 +258,14 @@ static inline void integrity_audit_msg(int audit_msgno, struct inode *inode,
 {
 }
 
+static inline void integrity_audit_message(int audit_msgno,
+					   struct inode *inode,
+					   const unsigned char *fname,
+					   const char *op, const char *cause,
+					   int result, int info, int errno)
+{
+}
+
 static inline struct audit_buffer *
 integrity_audit_log_start(struct audit_context *ctx, gfp_t gfp_mask, int type)
 {
diff --git a/security/integrity/integrity_audit.c b/security/integrity/integrity_audit.c
index 5109173839cc..f25e7df099c8 100644
--- a/security/integrity/integrity_audit.c
+++ b/security/integrity/integrity_audit.c
@@ -28,6 +28,15 @@ __setup("integrity_audit=", integrity_audit_setup);
 void integrity_audit_msg(int audit_msgno, struct inode *inode,
 			 const unsigned char *fname, const char *op,
 			 const char *cause, int result, int audit_info)
+{
+	integrity_audit_message(audit_msgno, inode, fname, op, cause,
+				result, audit_info, 0);
+}
+
+void integrity_audit_message(int audit_msgno, struct inode *inode,
+			     const unsigned char *fname, const char *op,
+			     const char *cause, int result, int audit_info,
+			     int errno)
 {
 	struct audit_buffer *ab;
 	char name[TASK_COMM_LEN];
@@ -53,6 +62,6 @@ void integrity_audit_msg(int audit_msgno, struct inode *inode,
 		audit_log_untrustedstring(ab, inode->i_sb->s_id);
 		audit_log_format(ab, " ino=%lu", inode->i_ino);
 	}
-	audit_log_format(ab, " res=%d", !result);
+	audit_log_format(ab, " res=%d errno=%d", !result, errno);
 	audit_log_end(ab);
 }
-- 
2.27.0


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

