Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 834DA20C2B0
	for <lists+linux-audit@lfdr.de>; Sat, 27 Jun 2020 17:19:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593271179;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RR7PqhxeonDs+KBQ75QtcYNneQd3tW3pjlpdg413hpA=;
	b=CT+/Vl7QVvYX5pl24a7GkWBK/k9U8oayE0gEBkKIo7PLTo8l+RdqvisVRFfihyraCO7xFt
	v08a7ojQON/GQHnTJwVJoazgpdleimXRwHZNCcE7wWs25nr9JFoT5mRk6gzOBNw7gUJ6Rs
	mqT2gVGD01BDyXNhpndhNpt2iRH1a+4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-Dwt9QWAUPsqv4hi1j0yPYg-1; Sat, 27 Jun 2020 11:19:30 -0400
X-MC-Unique: Dwt9QWAUPsqv4hi1j0yPYg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDC7E80400F;
	Sat, 27 Jun 2020 15:19:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A2AF9CFC2;
	Sat, 27 Jun 2020 15:19:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4C77C1809547;
	Sat, 27 Jun 2020 15:19:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05RFIlRa019162 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 27 Jun 2020 11:18:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6CEF8610F3; Sat, 27 Jun 2020 15:18:47 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ADDA860BF4;
	Sat, 27 Jun 2020 15:18:44 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: containers@lists.linux-foundation.org,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH ghau51/ghau40 v9 01/11] AUDIT_CONTAINER_OP message type basic
	support
Date: Sat, 27 Jun 2020 11:18:01 -0400
Message-Id: <1593271091-30188-2-git-send-email-rgb@redhat.com>
In-Reply-To: <1593271091-30188-1-git-send-email-rgb@redhat.com>
References: <1593271091-30188-1-git-send-email-rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
Cc: nhorman@redhat.com, Richard Guy Briggs <rgb@redhat.com>,
	eparis@parisplace.org, mpatel@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This defines the message number for the audit container identifier
registration record should the kernel headers not be up to date, gives
the record number a name for printing and allows the record to be
interpreted since it is in the 1000 range like AUDIT_LOGIN.

See: https://github.com/linux-audit/audit-userspace/issues/51
See: https://github.com/linux-audit/audit-kernel/issues/90
See: https://github.com/linux-audit/audit-testsuite/issues/64
See: https://github.com/linux-audit/audit-kernel/wiki/RFE-Audit-Container-ID
Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 lib/libaudit.h     | 4 ++++
 lib/msg_typetab.h  | 1 +
 lib/netlink.c      | 1 +
 src/ausearch-lol.c | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/lib/libaudit.h b/lib/libaudit.h
index c3a8e4ddb65c..da7c61cc2e6d 100644
--- a/lib/libaudit.h
+++ b/lib/libaudit.h
@@ -246,6 +246,10 @@ extern "C" {
 #define AUDIT_GET_FEATURE       1019    /* Get which features are enabled */
 #endif
 
+#ifndef AUDIT_CONTAINER_OP
+#define AUDIT_CONTAINER_OP	1020    /* Container creation notice */
+#endif
+
 #ifndef AUDIT_MMAP
 #define AUDIT_MMAP		1323 /* Descriptor and flags in mmap */
 #endif
diff --git a/lib/msg_typetab.h b/lib/msg_typetab.h
index 35127709c039..881f440c9d32 100644
--- a/lib/msg_typetab.h
+++ b/lib/msg_typetab.h
@@ -44,6 +44,7 @@ _S(AUDIT_LOGIN,                      "LOGIN"                         )
 //_S(AUDIT_TTY_SET,                    "TTY_SET"                       )
 //_S(AUDIT_SET_FEATURE,                "SET_FEATURE"                   )
 //_S(AUDIT_GET_FEATURE,                "GET_FEATURE"                   )
+_S(AUDIT_CONTAINER_OP,               "CONTAINER_OP"                  )
 _S(AUDIT_USER_AUTH,                  "USER_AUTH"                     )
 _S(AUDIT_USER_ACCT,                  "USER_ACCT"                     )
 _S(AUDIT_USER_MGMT,                  "USER_MGMT"                     )
diff --git a/lib/netlink.c b/lib/netlink.c
index 5b2028fda7e8..caa963b1ddb2 100644
--- a/lib/netlink.c
+++ b/lib/netlink.c
@@ -184,6 +184,7 @@ static int adjust_reply(struct audit_reply *rep, int len)
 			break;
 		case AUDIT_USER:
 		case AUDIT_LOGIN:
+		case AUDIT_CONTAINER_OP:
 		case AUDIT_KERNEL:
 		case AUDIT_FIRST_USER_MSG...AUDIT_LAST_USER_MSG:
 		case AUDIT_FIRST_USER_MSG2...AUDIT_LAST_USER_MSG2:
diff --git a/src/ausearch-lol.c b/src/ausearch-lol.c
index f0f36e04dd93..05fe80fe3ad6 100644
--- a/src/ausearch-lol.c
+++ b/src/ausearch-lol.c
@@ -248,6 +248,8 @@ static void check_events(lol *lo, time_t sec)
 				ready++;
 			} else if ( cur->l->e.type <  AUDIT_LOGIN            ||
 				   (cur->l->e.type >  AUDIT_LOGIN           &&
+				    cur->l->e.type <  AUDIT_CONTAINER_OP   ) ||
+				   (cur->l->e.type >  AUDIT_CONTAINER_OP    &&
 				    cur->l->e.type <  AUDIT_FIRST_EVENT    ) ||
 				    cur->l->e.type == AUDIT_PROCTITLE        ||
 				   (cur->l->e.type >= AUDIT_MAC_UNLBL_ALLOW &&
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

