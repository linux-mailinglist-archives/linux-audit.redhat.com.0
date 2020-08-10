Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id A62922400AB
	for <lists+linux-audit@lfdr.de>; Mon, 10 Aug 2020 03:17:51 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-nmZRTCo8PHWi0yyipqE-OA-1; Sun, 09 Aug 2020 21:17:48 -0400
X-MC-Unique: nmZRTCo8PHWi0yyipqE-OA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C7421005504;
	Mon, 10 Aug 2020 01:17:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F4195F9DC;
	Mon, 10 Aug 2020 01:17:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C9F4B97548;
	Mon, 10 Aug 2020 01:17:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07A1Bovk027298 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 9 Aug 2020 21:11:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 029022166BA2; Mon, 10 Aug 2020 01:11:50 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F29F32166BA0
	for <linux-audit@redhat.com>; Mon, 10 Aug 2020 01:11:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92E70185A78B
	for <linux-audit@redhat.com>; Mon, 10 Aug 2020 01:11:46 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-246-YiY_x7ugNYSRfoPlUdDUog-1;
	Sun, 09 Aug 2020 21:11:44 -0400
X-MC-Unique: YiY_x7ugNYSRfoPlUdDUog-1
Received: from localhost.localdomain (c-73-42-176-67.hsd1.wa.comcast.net
	[73.42.176.67])
	by linux.microsoft.com (Postfix) with ESMTPSA id 99DE720B4908;
	Sun,  9 Aug 2020 18:02:14 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 99DE720B4908
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
To: zohar@linux.ibm.com, sgrubb@redhat.com, paul@paul-moore.com
Subject: [PATCH] field-dictionary.csv: Add errno to audit message field
	dictionary
Date: Sun,  9 Aug 2020 18:02:10 -0700
Message-Id: <20200810010210.4037-1-nramas@linux.microsoft.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07A1Bovk027298
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Sun, 09 Aug 2020 21:17:20 -0400
Cc: linux-integrity@vger.kernel.org, linux-audit@redhat.com
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Error code was not included in the audit messages logged by
the integrity subsystem in the Linux kernel.

commit 2f845882ecd2 in https://github.com/torvalds/linux tree added
"errno" field in the audit messages logged by the integrity subsystem.
The "errno" field will be set to 0 when the operation was completed
successfully, and on failure a non-zero error code is set in this field
in the audit message.

Add the documentation for the "errno" field in the audit message
field dictionary.

Sample audit message from the integrity subsystem with errno field:

    [    6.303048] audit: type=1804 audit(1592506281.627:2): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel op=measuring_key cause=ENOMEM comm="swapper/0" name=".builtin_trusted_keys" res=0 errno=-12

Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
---
 specs/fields/field-dictionary.csv | 1 +
 1 file changed, 1 insertion(+)

diff --git a/specs/fields/field-dictionary.csv b/specs/fields/field-dictionary.csv
index 055ff79..5117e25 100644
--- a/specs/fields/field-dictionary.csv
+++ b/specs/fields/field-dictionary.csv
@@ -49,6 +49,7 @@ dport,numeric,remote port number,
 egid,numeric,effective group ID,
 enforcing,numeric,new MAC enforcement status,
 entries,numeric,number of entries in the netfilter table,
+errno,numeric,error code of the audited operation,
 euid,numeric,effective user ID,
 exe,encoded,executable name,
 exit,numeric,syscall exit code,
-- 
2.28.0


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

