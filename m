Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 733CD1490E1
	for <lists+linux-audit@lfdr.de>; Fri, 24 Jan 2020 23:32:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579905148;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aWWWsDEGWPL2yCOdxsCaQ35GTaSJQ/fbN1ACq08EYKE=;
	b=PymOPWDdmDT0mT1Nqtz7zlyPIzRDCs9gOH1NQXzMZcXG3G8Fsdpm+tQDRi4CBCOB5GaY+Y
	T0cFPnNj3IhfD8sZN9EFayKUZLgxnyCuHExBtDJNF9mViykx8Pep4MHDs/TJhTJlYzd0uk
	hMb51Jl5RnoxKGxgssnG5q28gk0tFsY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-RfKKmo_vPpWGbPEJP2Fljw-1; Fri, 24 Jan 2020 17:32:24 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CE64DB20;
	Fri, 24 Jan 2020 22:32:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 425478DC17;
	Fri, 24 Jan 2020 22:32:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5D9B685957;
	Fri, 24 Jan 2020 22:32:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00OMTJOW000836 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 24 Jan 2020 17:29:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 49CF31001B11; Fri, 24 Jan 2020 22:29:19 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-74.phx2.redhat.com [10.3.116.74])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1D3A11001B07
	for <linux-audit@redhat.com>; Fri, 24 Jan 2020 22:29:16 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Linux Audit <linux-audit@redhat.com>
Subject: audit: CONFIG_CHANGE don't log internal bookkeeping as an event
Date: Fri, 24 Jan 2020 17:29:16 -0500
Message-ID: <1952297.O3Wc8COjA7@x2>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
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
X-MC-Unique: RfKKmo_vPpWGbPEJP2Fljw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Common Criteria calls out for any action that modifies the audit trail to
be recorded. That usually is interpreted to mean insertion or removal of
rules. It is not required to log modification of the inode information
since the watch is still in effect. Additionally, if the rule is a never
rule and the underlying file is one they do not want events for, they
get an event for this bookkeeping update against their wishes.

Since no device/inode info is logged at insertion and no device/inode
information is logged on update, there is nothing meaningful being
communicated to the admin by the CONFIG_CHANGE updated_rules event. One
can assume that the rule was not "modified" because it is still watching
the intended target. If the device or inode cannot be resolved, then
audit_panic is called which is sufficient.

The correct resolution is to drop logging config_update events since
the watch is still in effect but just on another unknown inode.

Signed-off-by: Steve Grubb <sgrubb@redhat.com>
---
 kernel/audit_watch.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/kernel/audit_watch.c b/kernel/audit_watch.c
index 4508d5e0cf69..8a8fd732ff6d 100644
--- a/kernel/audit_watch.c
+++ b/kernel/audit_watch.c
@@ -302,8 +302,6 @@ static void audit_update_watch(struct audit_parent *parent,
 			if (oentry->rule.exe)
 				audit_remove_mark(oentry->rule.exe);
 
-			audit_watch_log_rule_change(r, owatch, "updated_rules");
-
 			call_rcu(&oentry->rcu, audit_free_rule_rcu);
 		}
 
-- 
2.24.1




--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

