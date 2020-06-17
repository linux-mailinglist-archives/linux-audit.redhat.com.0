Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 8AD8F1FD67B
	for <lists+linux-audit@lfdr.de>; Wed, 17 Jun 2020 22:55:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592427328;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=W14OJ4cQx+F1Zhq7rU8K/Sml32iYWga+sYIFhtI2rdE=;
	b=WqhBUX5ip0aDB+QOWXCax6LGsyA8WmWiePRinx/2xWXcIw6WRhlbFTx5gXAmbWkzvnTijy
	B/Z536Zpw0/kPS5pj9gPyiCUH8UaUeqYdt1cd0MAFlEvZj8uiSCpPCRUPj1XZxl8H1AOom
	rqkh5lEEmp840vSCdpNIsIdsgOwCEao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403--BhBMEjQOBq7bD_p63rkMg-1; Wed, 17 Jun 2020 16:55:26 -0400
X-MC-Unique: -BhBMEjQOBq7bD_p63rkMg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87FC318AACDE;
	Wed, 17 Jun 2020 20:55:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C4251024871;
	Wed, 17 Jun 2020 20:55:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 973C01809547;
	Wed, 17 Jun 2020 20:55:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05HKitss030822 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 17 Jun 2020 16:44:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 36CEA2026E04; Wed, 17 Jun 2020 20:44:55 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 329A22028DCC
	for <linux-audit@redhat.com>; Wed, 17 Jun 2020 20:44:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DFA3108C267
	for <linux-audit@redhat.com>; Wed, 17 Jun 2020 20:44:49 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-379-F9bLzZNoPQWAeD-FTRXc5g-1;
	Wed, 17 Jun 2020 16:44:42 -0400
X-MC-Unique: F9bLzZNoPQWAeD-FTRXc5g-1
Received: from localhost.localdomain (c-73-42-176-67.hsd1.wa.comcast.net
	[73.42.176.67])
	by linux.microsoft.com (Postfix) with ESMTPSA id B038B20B711C;
	Wed, 17 Jun 2020 13:44:41 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B038B20B711C
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
To: zohar@linux.ibm.com, bauerman@linux.ibm.com, nayna@linux.ibm.com,
	sgrubb@redhat.com, paul@paul-moore.com
Subject: [PATCH 2/2] integrity: Add errno field in audit message
Date: Wed, 17 Jun 2020 13:44:36 -0700
Message-Id: <20200617204436.2226-2-nramas@linux.microsoft.com>
In-Reply-To: <20200617204436.2226-1-nramas@linux.microsoft.com>
References: <20200617204436.2226-1-nramas@linux.microsoft.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05HKitss030822
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Error code is not included in the audit messages logged by
the integrity subsystem. Add "errno" field in the audit messages
logged by the integrity subsystem and set the value to the error code
passed to integrity_audit_msg() in the "result" parameter.

Sample audit messages:

[    6.284329] audit: type=1804 audit(1591756723.627:2): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel op=add_boot_aggregate cause=alloc_entry comm="swapper/0" name="boot_aggregate" res=0 errno=-12

[    8.085456] audit: type=1802 audit(1592005947.297:9): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 op=policy_update cause=completed comm="systemd" res=1 errno=0

Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Suggested-by: Steve Grubb <sgrubb@redhat.com>
---
 security/integrity/integrity_audit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/integrity/integrity_audit.c b/security/integrity/integrity_audit.c
index 5109173839cc..a265024f82f3 100644
--- a/security/integrity/integrity_audit.c
+++ b/security/integrity/integrity_audit.c
@@ -53,6 +53,6 @@ void integrity_audit_msg(int audit_msgno, struct inode *inode,
 		audit_log_untrustedstring(ab, inode->i_sb->s_id);
 		audit_log_format(ab, " ino=%lu", inode->i_ino);
 	}
-	audit_log_format(ab, " res=%d", !result);
+	audit_log_format(ab, " res=%d errno=%d", !result, result);
 	audit_log_end(ab);
 }
-- 
2.27.0


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

