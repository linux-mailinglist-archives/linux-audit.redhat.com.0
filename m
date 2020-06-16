Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 4DE361FAFD3
	for <lists+linux-audit@lfdr.de>; Tue, 16 Jun 2020 14:07:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592309228;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vN3Fv7h8MGhFmflDgSzCSDd6KIhTHAWtyGsn7c9qK9A=;
	b=eyavK77X9rRxCTUQPIXnz5i7yqSfwsY5HCj3v9eyIg6VenNGOCYv3v2tpJyW+P4gC1bZv8
	WKjysiUkC9X93lf2oDKX/zyoWs11XRWl0/276QraEbhmO6ZqUcnWFvb9TQWtwKO+eTGy18
	xnD5QUM8RB/D70K0UVKUG4C/OpKLyC0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-s_jiPVhXNKOJUmM83VdMfA-1; Tue, 16 Jun 2020 08:07:05 -0400
X-MC-Unique: s_jiPVhXNKOJUmM83VdMfA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF79E835BAA;
	Tue, 16 Jun 2020 12:06:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B3817CAA5;
	Tue, 16 Jun 2020 12:06:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EE17287422;
	Tue, 16 Jun 2020 12:06:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05GC6axC001017 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 16 Jun 2020 08:06:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3F2D479301; Tue, 16 Jun 2020 12:06:36 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 29FB890334;
	Tue, 16 Jun 2020 12:06:25 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>
Subject: [PATCH ghau86] allow LOGIN event record to be grouped with its
	SYSCALL record
Date: Tue, 16 Jun 2020 08:05:50 -0400
Message-Id: <1592309150-11920-1-git-send-email-rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, eparis@parisplace.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

LOGIN records were not grouped with the rest of their event, records with the
identical timestamp and serial number:

----
time->Tue Mar 19 12:23:15 2019
type=LOGIN msg=audit(1553012595.401:219): pid=647 uid=0 subj=system_u:system_r:local_login_t:s0-s0:c0.c1023 old-auid=4294967295 auid=0 tty=ttyS0 old-ses=4294967295 ses=1 res=1
----
time->Tue Mar 19 12:23:15 2019
type=PROCTITLE msg=audit(1553012595.401:219): proctitle=2F62696E2F6C6F67696E002D70002D2D0020202020
type=SYSCALL msg=audit(1553012595.401:219): arch=c000003e syscall=1 success=yes exit=1 a0=3 a1=7fff3fb13380 a2=1 a3=0 items=0 ppid=1 pid=647 auid=0 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=ttyS0 ses=1 comm="login" exe="/usr/bin/login" subj=system_u:system_r:local_login_t:s0-s0:c0.c1023 key=(null)
----

Tidy up the list/ranges of records to be in ascending order for easier parsing
and updating by humans.

See the upstream issues
	https://github.com/linux-audit/audit-userspace/issues/86

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 src/ausearch-lol.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/src/ausearch-lol.c b/src/ausearch-lol.c
index e70945612f79..f0f36e04dd93 100644
--- a/src/ausearch-lol.c
+++ b/src/ausearch-lol.c
@@ -246,12 +246,14 @@ static void check_events(lol *lo, time_t sec)
 			if (cur->l->e.sec + 2 <= sec) { 
 				cur->status = L_COMPLETE;
 				ready++;
-			} else if (cur->l->e.type == AUDIT_PROCTITLE ||
-				    cur->l->e.type < AUDIT_FIRST_EVENT ||
-				    cur->l->e.type >= AUDIT_FIRST_ANOM_MSG ||
-				    cur->l->e.type == AUDIT_KERNEL ||
-				    (cur->l->e.type >= AUDIT_MAC_UNLBL_ALLOW &&
-				    cur->l->e.type <= AUDIT_MAC_CALIPSO_DEL)) {
+			} else if ( cur->l->e.type <  AUDIT_LOGIN            ||
+				   (cur->l->e.type >  AUDIT_LOGIN           &&
+				    cur->l->e.type <  AUDIT_FIRST_EVENT    ) ||
+				    cur->l->e.type == AUDIT_PROCTITLE        ||
+				   (cur->l->e.type >= AUDIT_MAC_UNLBL_ALLOW &&
+				    cur->l->e.type <= AUDIT_MAC_CALIPSO_DEL) ||
+				    cur->l->e.type == AUDIT_KERNEL           ||
+				    cur->l->e.type >= AUDIT_FIRST_ANOM_MSG     ) {
 				// If known to be 1 record event, we are done
 				cur->status = L_COMPLETE;
 				ready++;
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

