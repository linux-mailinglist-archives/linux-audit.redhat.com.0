Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 84E492AC8E3
	for <lists+linux-audit@lfdr.de>; Mon,  9 Nov 2020 23:54:05 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-DZLcv-OZN86tIWLKA9keqg-1; Mon, 09 Nov 2020 17:54:02 -0500
X-MC-Unique: DZLcv-OZN86tIWLKA9keqg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAE20809DDC;
	Mon,  9 Nov 2020 22:53:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A77225C5B0;
	Mon,  9 Nov 2020 22:53:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 795B2922FB;
	Mon,  9 Nov 2020 22:53:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A68apAQ015838 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 6 Nov 2020 03:36:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 312202144B34; Fri,  6 Nov 2020 08:36:51 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C1AD2166B28
	for <linux-audit@redhat.com>; Fri,  6 Nov 2020 08:36:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DED98858297
	for <linux-audit@redhat.com>; Fri,  6 Nov 2020 08:36:48 +0000 (UTC)
Received: from out30-45.freemail.mail.aliyun.com
	(out30-45.freemail.mail.aliyun.com [115.124.30.45]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-2-1fBrvTp8NDKpm0_zpJlEiw-1;
	Fri, 06 Nov 2020 03:36:46 -0500
X-MC-Unique: 1fBrvTp8NDKpm0_zpJlEiw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1;
	HT=alimailimapcm10staff010182156082;
	MF=alex.shi@linux.alibaba.com; NM=1; PH=DS; RN=4; SR=0;
	TI=SMTPD_---0UEPYlOn_1604651488
Received: from aliy80.localdomain(mailfrom:alex.shi@linux.alibaba.com
	fp:SMTPD_---0UEPYlOn_1604651488) by smtp.aliyun-inc.com(127.0.0.1);
	Fri, 06 Nov 2020 16:31:28 +0800
From: Alex Shi <alex.shi@linux.alibaba.com>
To: paul@paul-moore.com
Subject: [PATCH] audit: remove unused macros
Date: Fri,  6 Nov 2020 16:31:22 +0800
Message-Id: <1604651482-9780-1-git-send-email-alex.shi@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 09 Nov 2020 17:53:46 -0500
Cc: linux-audit@redhat.com, linux-kernel@vger.kernel.org
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
MIME-Version: 1.0
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Some unused macros could cause gcc warning:
kernel/audit.c:68:0: warning: macro "AUDIT_UNINITIALIZED" is not used
[-Wunused-macros]
kernel/auditsc.c:104:0: warning: macro "AUDIT_AUX_IPCPERM" is not used
[-Wunused-macros]
kernel/auditsc.c:82:0: warning: macro "AUDITSC_INVALID" is not used
[-Wunused-macros]

remove them to tame gcc.

Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
Cc: Paul Moore <paul@paul-moore.com> 
Cc: Eric Paris <eparis@redhat.com> 
Cc: linux-audit@redhat.com 
Cc: linux-kernel@vger.kernel.org 
---
 kernel/audit.c   | 1 -
 kernel/auditsc.c | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/kernel/audit.c b/kernel/audit.c
index ac0aeaa99937..dfac1e0ca887 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -65,7 +65,6 @@
 /* No auditing will take place until audit_initialized == AUDIT_INITIALIZED.
  * (Initialization happens after skb_init is called.) */
 #define AUDIT_DISABLED		-1
-#define AUDIT_UNINITIALIZED	0
 #define AUDIT_INITIALIZED	1
 static int	audit_initialized;
 
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 183d79cc2e12..eeb4930d499f 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -80,7 +80,6 @@
 #include "audit.h"
 
 /* flags stating the success for a syscall */
-#define AUDITSC_INVALID 0
 #define AUDITSC_SUCCESS 1
 #define AUDITSC_FAILURE 2
 
@@ -102,8 +101,6 @@ struct audit_aux_data {
 	int			type;
 };
 
-#define AUDIT_AUX_IPCPERM	0
-
 /* Number of target pids per aux struct. */
 #define AUDIT_AUX_PIDS	16
 
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

