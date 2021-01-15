Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 445532F7D8F
	for <lists+linux-audit@lfdr.de>; Fri, 15 Jan 2021 15:03:27 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-xYpHK2OdOIWVAuGm2UteFA-1; Fri, 15 Jan 2021 09:03:23 -0500
X-MC-Unique: xYpHK2OdOIWVAuGm2UteFA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2CB5100E431;
	Fri, 15 Jan 2021 14:03:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB3E16F991;
	Fri, 15 Jan 2021 14:03:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 919BD18095C9;
	Fri, 15 Jan 2021 14:03:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10F0NdpA020457 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 14 Jan 2021 19:23:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B3A46115588D; Fri, 15 Jan 2021 00:23:39 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AFE0B115588B
	for <linux-audit@redhat.com>; Fri, 15 Jan 2021 00:23:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BD68800296
	for <linux-audit@redhat.com>; Fri, 15 Jan 2021 00:23:37 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-440-ZkLRtcF_NRee4-3oW5K4uA-1;
	Thu, 14 Jan 2021 19:23:35 -0500
X-MC-Unique: ZkLRtcF_NRee4-3oW5K4uA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 5009CABDA;
	Fri, 15 Jan 2021 00:12:29 +0000 (UTC)
From: Davidlohr Bueso <dave@stgolabs.net>
To: paul@paul-moore.com
Subject: [PATCH] audit: Remove leftover reference to the audit_tasklet
Date: Thu, 14 Jan 2021 16:12:01 -0800
Message-Id: <20210115001201.116832-1-dave@stgolabs.net>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 10F0NdpA020457
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 15 Jan 2021 09:02:57 -0500
Cc: linux-audit@redhat.com, dave@stgolabs.net, linux-kernel@vger.kernel.org,
	Davidlohr Bueso <dbueso@suse.de>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This was replaced with a kauditd_wait kthread long ago,
back in:

     b7d1125817c (AUDIT: Send netlink messages from a separate kernel thread)

Update the stale comment.

Signed-off-by: Davidlohr Bueso <dbueso@suse.de>
---
 kernel/audit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/audit.c b/kernel/audit.c
index 1ffc2e059027..8fd735190c12 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -2365,7 +2365,7 @@ int audit_signal_info(int sig, struct task_struct *t)
  *
  * We can not do a netlink send inside an irq context because it blocks (last
  * arg, flags, is not set to MSG_DONTWAIT), so the audit buffer is placed on a
- * queue and a tasklet is scheduled to remove them from the queue outside the
+ * queue and a kthread is scheduled to remove them from the queue outside the
  * irq context.  May be called in any context.
  */
 void audit_log_end(struct audit_buffer *ab)
-- 
2.26.2


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

