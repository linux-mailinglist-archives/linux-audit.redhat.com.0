Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9958A226093
	for <lists+linux-audit@lfdr.de>; Mon, 20 Jul 2020 15:18:49 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-3jvGCV_zMJ-9OobiRVGTtw-1; Mon, 20 Jul 2020 09:18:45 -0400
X-MC-Unique: 3jvGCV_zMJ-9OobiRVGTtw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B430B8064DE;
	Mon, 20 Jul 2020 13:18:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 939B16FECD;
	Mon, 20 Jul 2020 13:18:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5E8E61806B0A;
	Mon, 20 Jul 2020 13:18:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06HNGnYE002250 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 17 Jul 2020 19:16:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DA8D22156880; Fri, 17 Jul 2020 23:16:48 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D4D5A2156A50
	for <linux-audit@redhat.com>; Fri, 17 Jul 2020 23:16:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3E5C80CC22
	for <linux-audit@redhat.com>; Fri, 17 Jul 2020 23:16:46 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-189-nGc1STRDPwOgtfoJtFX7wg-1;
	Fri, 17 Jul 2020 19:16:42 -0400
X-MC-Unique: nGc1STRDPwOgtfoJtFX7wg-1
Received: from dede-linux-virt.corp.microsoft.com (unknown [131.107.160.54])
	by linux.microsoft.com (Postfix) with ESMTPSA id 7A58020B491A;
	Fri, 17 Jul 2020 16:09:49 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7A58020B491A
From: Deven Bowers <deven.desai@linux.microsoft.com>
To: agk@redhat.com, axboe@kernel.dk, snitzer@redhat.com, jmorris@namei.org,
	serge@hallyn.com, zohar@linux.ibm.com, viro@zeniv.linux.org.uk,
	paul@paul-moore.com, eparis@redhat.com, jannh@google.com,
	dm-devel@redhat.com, linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-audit@redhat.com
Subject: [RFC PATCH v4 12/12] cleanup: uapi/linux/audit.h
Date: Fri, 17 Jul 2020 16:09:41 -0700
Message-Id: <20200717230941.1190744-13-deven.desai@linux.microsoft.com>
In-Reply-To: <20200717230941.1190744-1-deven.desai@linux.microsoft.com>
References: <20200717230941.1190744-1-deven.desai@linux.microsoft.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06HNGnYE002250
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 20 Jul 2020 09:18:19 -0400
Cc: sashal@kernel.org, mdsakib@microsoft.com, corbet@lwn.net,
	linux-kernel@vger.kernel.org, pasha.tatshin@soleen.com,
	nramas@linux.microsoft.com, tyhicks@linux.microsoft.com,
	jaskarankhurana@linux.microsoft.com
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

Remove trailing whitespaces and align the integrity #defines in
linux/uapi/audit.h

Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
---
 include/uapi/linux/audit.h | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
index 5a634cca1d42..609b4a5e8a80 100644
--- a/include/uapi/linux/audit.h
+++ b/include/uapi/linux/audit.h
@@ -48,7 +48,7 @@
  * 2500 - 2999 future user space (maybe integrity labels and related events)
  *
  * Messages from 1000-1199 are bi-directional. 1200-1299 & 2100 - 2999 are
- * exclusively user space. 1300-2099 is kernel --> user space 
+ * exclusively user space. 1300-2099 is kernel --> user space
  * communication.
  */
 #define AUDIT_GET		1000	/* Get status */
@@ -78,7 +78,7 @@
 #define AUDIT_LAST_USER_MSG	1199
 #define AUDIT_FIRST_USER_MSG2	2100	/* More user space messages */
 #define AUDIT_LAST_USER_MSG2	2999
- 
+
 #define AUDIT_DAEMON_START      1200    /* Daemon startup record */
 #define AUDIT_DAEMON_END        1201    /* Daemon normal stop record */
 #define AUDIT_DAEMON_ABORT      1202    /* Daemon error stop record */
@@ -140,20 +140,20 @@
 #define AUDIT_MAC_CALIPSO_ADD	1418	/* NetLabel: add CALIPSO DOI entry */
 #define AUDIT_MAC_CALIPSO_DEL	1419	/* NetLabel: del CALIPSO DOI entry */
 
-#define AUDIT_FIRST_KERN_ANOM_MSG   1700
-#define AUDIT_LAST_KERN_ANOM_MSG    1799
-#define AUDIT_ANOM_PROMISCUOUS      1700 /* Device changed promiscuous mode */
-#define AUDIT_ANOM_ABEND            1701 /* Process ended abnormally */
-#define AUDIT_ANOM_LINK		    1702 /* Suspicious use of file links */
-#define AUDIT_ANOM_CREAT	    1703 /* Suspicious file creation */
-#define AUDIT_INTEGRITY_DATA	    1800 /* Data integrity verification */
-#define AUDIT_INTEGRITY_METADATA    1801 /* Metadata integrity verification */
-#define AUDIT_INTEGRITY_STATUS	    1802 /* Integrity enable status */
-#define AUDIT_INTEGRITY_HASH	    1803 /* Integrity HASH type */
-#define AUDIT_INTEGRITY_PCR	    1804 /* PCR invalidation msgs */
-#define AUDIT_INTEGRITY_RULE	    1805 /* policy rule */
-#define AUDIT_INTEGRITY_EVM_XATTR   1806 /* New EVM-covered xattr */
-#define AUDIT_INTEGRITY_POLICY_RULE 1807 /* IMA policy rules */
+#define AUDIT_FIRST_KERN_ANOM_MSG	1700
+#define AUDIT_LAST_KERN_ANOM_MSG	1799
+#define AUDIT_ANOM_PROMISCUOUS		1700 /* Device changed promiscuous mode */
+#define AUDIT_ANOM_ABEND		1701 /* Process ended abnormally */
+#define AUDIT_ANOM_LINK			1702 /* Suspicious use of file links */
+#define AUDIT_ANOM_CREAT		1703 /* Suspicious file creation */
+#define AUDIT_INTEGRITY_DATA		1800 /* Data integrity verification */
+#define AUDIT_INTEGRITY_METADATA	1801 /* Metadata integrity verification */
+#define AUDIT_INTEGRITY_STATUS		1802 /* Integrity enable status */
+#define AUDIT_INTEGRITY_HASH		1803 /* Integrity HASH type */
+#define AUDIT_INTEGRITY_PCR		1804 /* PCR invalidation msgs */
+#define AUDIT_INTEGRITY_RULE		1805 /* policy rule */
+#define AUDIT_INTEGRITY_EVM_XATTR	1806 /* New EVM-covered xattr */
+#define AUDIT_INTEGRITY_POLICY_RULE	1807 /* IMA policy rules */
 #define AUDIT_INTEGRITY_POLICY_LOAD	1808 /* IPE Policy Load */
 #define AUDIT_INTEGRITY_POLICY_ACTIVATE	1809 /* IPE Policy Activation */
 #define AUDIT_INTEGRITY_EVENT		1810 /* IPE Evaluation Event */
-- 
2.27.0


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

