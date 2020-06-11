Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id C740C1F6940
	for <lists+linux-audit@lfdr.de>; Thu, 11 Jun 2020 15:43:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591883008;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qA6LIkvWFizwWxSz3B7tnzgG9UiB9hlx75FbI4jp4+U=;
	b=JMNerzCasyVl3G9EZgL90Isk1KbpP3GvuTkVfzl62iZ2Fsn7u7ZCKxbpHeTdP31gFGBWhu
	OA+8+MyRTQC0A9KJOlzYAYpGPnfNUM5wvmMQzuodOVy28+15yJnwTzOaU+vmLxLq/xqgE1
	kw/hprZQRQoHhv+n/YAZ2HwoZHByBVM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-ZQDqe3neNHa-PR0iFo_Gng-1; Thu, 11 Jun 2020 09:43:26 -0400
X-MC-Unique: ZQDqe3neNHa-PR0iFo_Gng-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 883978018AC;
	Thu, 11 Jun 2020 13:43:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2176F60E1C;
	Thu, 11 Jun 2020 13:43:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DD97D14CCD;
	Thu, 11 Jun 2020 13:43:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05B04BLR027367 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 10 Jun 2020 20:04:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DACBB2156A2E; Thu, 11 Jun 2020 00:04:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D6B222156A2D
	for <linux-audit@redhat.com>; Thu, 11 Jun 2020 00:04:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DBDEF858EE0
	for <linux-audit@redhat.com>; Thu, 11 Jun 2020 00:04:09 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-326-1ZAsnjexPC-kL-4WjWNe1w-1;
	Wed, 10 Jun 2020 20:04:06 -0400
X-MC-Unique: 1ZAsnjexPC-kL-4WjWNe1w-1
Received: from localhost.localdomain (c-73-42-176-67.hsd1.wa.comcast.net
	[73.42.176.67])
	by linux.microsoft.com (Postfix) with ESMTPSA id 48C3620B4778;
	Wed, 10 Jun 2020 17:04:05 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 48C3620B4778
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
To: zohar@linux.ibm.com, sgrubb@redhat.com, paul@paul-moore.com
Subject: [PATCH 1/2] integrity: Add errno field in audit message
Date: Wed, 10 Jun 2020 17:03:59 -0700
Message-Id: <20200611000400.3771-1-nramas@linux.microsoft.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05B04BLR027367
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 11 Jun 2020 09:42:50 -0400
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Error code is not included in the audit messages logged by
the integrity subsystem. Add a new field namely "errno" in
the audit message and set the value to the error code passed
to integrity_audit_msg() in the "result" parameter.

Sample audit message:

[    6.284329] audit: type=1804 audit(1591756723.627:2): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel op=add_boot_aggregate cause=alloc_entry errno=-12 comm="swapper/0" name="boot_aggregate" res=0

Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Suggested-by: Steve Grubb <sgrubb@redhat.com>
---
 security/integrity/integrity_audit.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/security/integrity/integrity_audit.c b/security/integrity/integrity_audit.c
index 5109173839cc..8cbf415bb977 100644
--- a/security/integrity/integrity_audit.c
+++ b/security/integrity/integrity_audit.c
@@ -42,7 +42,8 @@ void integrity_audit_msg(int audit_msgno, struct inode *inode,
 			 from_kuid(&init_user_ns, audit_get_loginuid(current)),
 			 audit_get_sessionid(current));
 	audit_log_task_context(ab);
-	audit_log_format(ab, " op=%s cause=%s comm=", op, cause);
+	audit_log_format(ab, " op=%s cause=%s errno=%d comm=",
+			 op, cause, result);
 	audit_log_untrustedstring(ab, get_task_comm(name, current));
 	if (fname) {
 		audit_log_format(ab, " name=");
-- 
2.27.0


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

