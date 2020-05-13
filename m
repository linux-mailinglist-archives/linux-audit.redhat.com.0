Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 959AD1D038F
	for <lists+linux-audit@lfdr.de>; Wed, 13 May 2020 02:22:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589329377;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0s9KriF3PdXYTKVsT8LkPsSVCIPZmfDY3byV4pHC/GU=;
	b=Uq2dW9zxktwVEr0RqjVmeLehsMb72HmoKe0oT5CaH3s8KtevLx0O99+B3RrzP88hc393iN
	4Dn8WB+GtnJOiCJOL6KcM9emJYSvYChQ8ThzTl/XajhmgQyeiBs1ftYg0Ol+zmjCSCJsxo
	aFjovIzsB7VAaORZph3AxE/+JpHyFBk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-9yoyHkYqMBSPM3wjEiEd2w-1; Tue, 12 May 2020 20:22:54 -0400
X-MC-Unique: 9yoyHkYqMBSPM3wjEiEd2w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78C40460;
	Wed, 13 May 2020 00:22:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BC0A5C1C3;
	Wed, 13 May 2020 00:22:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 564424E982;
	Wed, 13 May 2020 00:22:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04D0MSN3001776 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 12 May 2020 20:22:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7483A38E; Wed, 13 May 2020 00:22:28 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-112-77.phx2.redhat.com [10.3.112.77])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4813E1A924
	for <linux-audit@redhat.com>; Wed, 13 May 2020 00:22:25 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: reactive audit proposal
Date: Tue, 12 May 2020 20:22:24 -0400
Message-ID: <6360160.ZmnOHIC0Qm@x2>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

I wanted to run this by the crowd to see what people's reaction might be.

The audit system sometimes needs to have rules applied when something
happens. For example, if someone plugs in a USB flash drive, the system
creates the device in /dev and then automatically mounts it under some
circumstances.

I would propose 2 new additions to the audit rule syntax: on-mount and
on-login.These rules would be in a separate file from the main audit rules.
When a file system is mounted, /proc/mounts changes and the mount table can
be scanned to see if something new is there. In this way we can reliably
detect newly mounted filesystems. We can then match against a specifier to
see if this is a file system in which we want to apply new rules. If so, we
send the new rules to the kernel. When the device is unmounted, the kernel
drops all watches on that file system. So, we only need to worry about when
a device is mounted.

This works good for anything that gets mounted. But it is also possible for
a USB flash drive to be accessed as a block device, such as the dd utility.
If we had to detect device discovery, there is a netlink group,
NETLINK_KOBJECT_UEVENT which we could monitor for events. The only thing is
that we could only detect open/read/write/close/ioctl/lseek. And we probably
do not want to monitor anything except block devices.

It may also be possible to poll /sys/block to watch for changes. This might
be easier as the names are more friendly. This would take some research to
see if its even possible.

The rule syntax could look something like:
on=mount mount=/run/user/1000 : -a exit,always ...
on=device device=/dev/sdd : -a exit,always ...

The on-login event would simply watch the audit trail for any AUDIT_LOGIN
events. That event can be parsed to get the new auid. If the auid matches
any rules, then it will load them into the kernel. To remove the rules, we
could watch for the AUDIT_USER_END event. The only issue is that we would
need to track how many sessions the user has open and remove the rules only
when the last session closes out.

The rules for this might look something like this:
on=login auid=1000 : -a exit,always ...

The question is whether or not this should be done as part of the audit
daemon or as a plugin for the audit daemon. One advantage of doing this as
a plugin is that it will keep the audit daemon focused on getting events
and distributing them. Any programming mistake in the plugin will crash it
and not the daemon. The tradeoff is that it will get the event slightly
after auditd sees it. This only matters for the on-login functionality. The
device and mount events come from an entirely different source. And I'm sure 
that in every case, the program will react faster than a user possibily can 
winning the race evry time.

Thoughts?

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

