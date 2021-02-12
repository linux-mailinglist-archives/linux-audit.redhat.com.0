Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7B92431A62B
	for <lists+linux-audit@lfdr.de>; Fri, 12 Feb 2021 21:46:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613162772;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9SP2yL0mLceOZCFJOxMZI8pE6AeXCh/Bdnmd0rFFBv8=;
	b=dAFxbygfOApd7AGgrdrC/ROaSFtiMv2zozko9K/1Y5fh4idNbdPxVp75F8ONFwFZBUk+Fz
	oyXUzRMIn9ooQ9Z+zH3mpOYP3+nux8qRFY5zoXWIX88lvVgDqmTFb6Sez17OMXcFcSnZEU
	Vhp+U8CldHRJiP0oJpCvXK8+0HsZsyA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-lTBX-1uyMCykQZLullWucQ-1; Fri, 12 Feb 2021 15:46:09 -0500
X-MC-Unique: lTBX-1uyMCykQZLullWucQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30821107ACE8;
	Fri, 12 Feb 2021 20:46:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A2B6F5C23D;
	Fri, 12 Feb 2021 20:45:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 157204E58D;
	Fri, 12 Feb 2021 20:45:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11CKjOiE030779 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 12 Feb 2021 15:45:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id ED44F10023AB; Fri, 12 Feb 2021 20:45:24 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-117-32.rdu2.redhat.com [10.10.117.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B60FB1002388
	for <linux-audit@redhat.com>; Fri, 12 Feb 2021 20:45:21 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Linux Audit <linux-audit@redhat.com>
Subject: audit 3.0.1 released
Date: Fri, 12 Feb 2021 15:45:19 -0500
Message-ID: <3094014.aeNJFYEL58@x2>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

I've just released a new version of the audit daemon. It can be
downloaded from http://people.redhat.com/sgrubb/audit. It will also be
in rawhide soon. The ChangeLog is:

- Update syscall table to the 5.11 kernel
- Add new --eoe-timeout option to ausearch and aureport (Burn Alting)
- Only enable periodic timers when listening on the network
- Upgrade libev to 4.33
- Add auparse_new_buffer function to auparse library
- Use the select libev backend unless aggregating events
- Add sudoers to some base audit rules
- Update the auparse normalizer for some new syscalls and event types

This release features 2 new experimental plugins. The statsd plugin should be 
ready to try out. The other IDS plugin is more of a long term work in 
progress. No timeline for it's development, either. (There is a known bug 
where the ids plugin fails to build in some environments. There is a brand 
new commit in github fixing this. Grab it if it fails to build.)

During the work for statsd, I found that the audit daemon is a little more 
active than it should be. This was because it was enabling periodic timers 
that are used to detect dead network connections when the daemon is configured 
to be an aggregator. This is fixed and libev was updated to the latest 
release. While I was in the libev section of code I did some testing betweek 
using select and epoll as the event backend. Turns out select is about 4 ms 
faster. So, as long as auditd is not receiving network events, it will use 
select. If it does receive network events, then it will continue to use epoll 
in case it needs a lot of descriptors.

Ausearch/report now have a new command line option to --eoe-timeout to help 
gather event records into the right event if they were slow getting output. 
Auditd also has a setting that could be considered the eoe_timeout default 
setting. Libauparse automatically tries to read this if it has the 
permissions.

SHA256: 994c4250d8fd43f3087a3c2ce73461832e30f1e9b278bf5bb03c3e07091155a5

Please let me know if you run across any problems with this release.

-Steve




--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

