Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id E57CD235472
	for <lists+linux-audit@lfdr.de>; Sat,  1 Aug 2020 23:46:02 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-xwMfJIJ0PMm0meip33zn2w-1; Sat, 01 Aug 2020 17:45:59 -0400
X-MC-Unique: xwMfJIJ0PMm0meip33zn2w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80838800460;
	Sat,  1 Aug 2020 21:45:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 337FC5D9DD;
	Sat,  1 Aug 2020 21:45:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4AEB595497;
	Sat,  1 Aug 2020 21:45:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 071IkixV021235 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 1 Aug 2020 14:46:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7ADF82026FFE; Sat,  1 Aug 2020 18:46:44 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 765F12026D69
	for <linux-audit@redhat.com>; Sat,  1 Aug 2020 18:46:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 616AE8008A5
	for <linux-audit@redhat.com>; Sat,  1 Aug 2020 18:46:41 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-467-KHoN9uSbPcGqGV6P1JG9pg-1; Sat, 01 Aug 2020 14:46:39 -0400
X-MC-Unique: KHoN9uSbPcGqGV6P1JG9pg-1
Received: by mail-wr1-f68.google.com with SMTP id y3so30706577wrl.4;
	Sat, 01 Aug 2020 11:46:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=DoAzX0mPxKwifGhIAYoV8gWIU4fgddXvYUu1szasbME=;
	b=sCOLJjG/C/Qhk2vaH7/kQFUigtO8M0LUFAYiO8M/C9l+Ev+M9wjIXKT/tGBxD4nwYh
	fZTfaOhaJEcuNzDFPAKnqK7RN2R3iaWuYPSpaVppsGHqj/zrBNLnwdQCymcOoI/d6uvx
	DY8Mtbj2jnH5NIruavxCBMxgvCUNmWrBnjT6SU2L+U364IzBRNKWJdEPA7IjB0RSV6mf
	1+GOf5kizOwnE20ME9P9h1hpNtg26K4Xs+k7+VxM4d/EV7fOwnvOd0o1ZWg/FqLV+wnl
	KqKUhwPhgRyox4tcFd5mbZl911+Cw6AcwIesIdZCQd1Ii/bUqibZQb9KMnPHjOcSbhde
	2/xQ==
X-Gm-Message-State: AOAM531nPK0vUh/futsEsRNnBS+ykGT0pYgPqRMAKLTaIWmsZKGtcsHo
	cDtpBQPKq3FsRC3fhEVBFetuMz4QlJmT
X-Google-Smtp-Source: ABdhPJyftIU1s71JqoytPv8/QTAqp8h9/0euUzcWCNTNP34ycJ0FWWaTZ4liZzlyVwNckRuyLLlHrQ==
X-Received: by 2002:a5d:438c:: with SMTP id i12mr8998288wrq.210.1596307597696; 
	Sat, 01 Aug 2020 11:46:37 -0700 (PDT)
Received: from localhost.lan (host-92-25-238-49.as13285.net. [92.25.238.49])
	by smtp.gmail.com with ESMTPSA id
	g7sm17468447wrv.82.2020.08.01.11.46.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 01 Aug 2020 11:46:37 -0700 (PDT)
From: Jules Irenge <jbi.octave@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] audit: uninitialize static variables
Date: Sat,  1 Aug 2020 19:46:02 +0100
Message-Id: <20200801184603.310769-4-jbi.octave@gmail.com>
In-Reply-To: <20200801184603.310769-1-jbi.octave@gmail.com>
References: <0/4>
 <20200801184603.310769-1-jbi.octave@gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Sat, 01 Aug 2020 17:45:19 -0400
Cc: Jules Irenge <jbi.octave@gmail.com>,
	"moderated list:AUDIT SUBSYSTEM" <linux-audit@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Checkpatch tool reports an error at variable declaration

"ERROR: do not initialise statics to 0"

This is due to the fact that these variables are stored in the buffer
In the .bss section, one can not set an initial value
Here we can trust the compiler to automatically set them to zero.
The variable has since been uninitialized.

Signed-off-by: Jules Irenge <jbi.octave@gmail.com>
---
 kernel/audit.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/audit.c b/kernel/audit.c
index 7b1a38a211a9..7d79ecb58b01 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -311,8 +311,8 @@ void audit_panic(const char *message)
 
 static inline int audit_rate_check(void)
 {
-	static unsigned long	last_check = 0;
-	static int		messages   = 0;
+	static unsigned long	last_check;
+	static int		messages;
 	static DEFINE_SPINLOCK(lock);
 	unsigned long		flags;
 	unsigned long		now;
@@ -348,7 +348,7 @@ static inline int audit_rate_check(void)
 */
 void audit_log_lost(const char *message)
 {
-	static unsigned long	last_msg = 0;
+	static unsigned long	last_msg;
 	static DEFINE_SPINLOCK(lock);
 	unsigned long		flags;
 	unsigned long		now;
@@ -713,7 +713,7 @@ static int kauditd_send_queue(struct sock *sk, u32 portid,
 {
 	int rc = 0;
 	struct sk_buff *skb;
-	static unsigned int failed = 0;
+	static unsigned int failed;
 
 	/* NOTE: kauditd_thread takes care of all our locking, we just use
 	 *       the netlink info passed to us (e.g. sk and portid) */
-- 
2.26.2

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

