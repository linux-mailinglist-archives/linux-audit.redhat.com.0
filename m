Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 01500213E70
	for <lists+linux-audit@lfdr.de>; Fri,  3 Jul 2020 19:18:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593796704;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1Iu3LKc6Qza+Hpy4SDbPSdNNeEADO/64S8kMuHUDLsk=;
	b=T0NhOlw/SGnyYEawhK74qWbk10O8y5oZpvhoiZy1kOYJIfs9sYnah8hsuFgm3MQ792TGio
	zNfFeTeu5GLAA0NDbCxh2H+c1W/AfS3Dr7WwfbpWLUXXhld4/sNjF2xhSFzmUEsuqAvPBh
	OLgfEkOpbY5IBa5nMUG99qg8MaCwaTE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-ABWlBHAJO6qLplQS36WDDg-1; Fri, 03 Jul 2020 13:18:21 -0400
X-MC-Unique: ABWlBHAJO6qLplQS36WDDg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1703B100CCC2;
	Fri,  3 Jul 2020 17:18:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 511207BD5C;
	Fri,  3 Jul 2020 17:18:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6C17D1809547;
	Fri,  3 Jul 2020 17:18:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 063HI8R4000765 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 3 Jul 2020 13:18:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DCCA77BD4E; Fri,  3 Jul 2020 17:18:08 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.3])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 608117BD44;
	Fri,  3 Jul 2020 17:17:59 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>
Subject: [PATCH ghak122 v1] audit: store event sockaddr in case of no rules
Date: Fri,  3 Jul 2020 13:17:35 -0400
Message-Id: <b62d4388b488dedfa2758f32e6d1e5414179b4f2.1593796497.git.rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When there are no rules present, the event SOCKADDR record is not
generated due to audit_dummy_context() generated at syscall entry from
audit_n_rules.  Store this information if there is a context present to
store it so that mandatory events are more complete (startup, LSMs...).

Please see the upstream issue
https://github.com/linux-audit/audit-kernel/issues/122

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
Passes audit-testsuite.

 include/linux/audit.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/audit.h b/include/linux/audit.h
index 03c4035a532b..07fecd99741a 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -448,7 +448,7 @@ static inline int audit_socketcall_compat(int nargs, u32 *args)
 
 static inline int audit_sockaddr(int len, void *addr)
 {
-	if (unlikely(!audit_dummy_context()))
+	if (audit_context())
 		return __audit_sockaddr(len, addr);
 	return 0;
 }
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

