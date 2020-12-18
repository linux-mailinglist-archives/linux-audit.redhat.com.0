Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5542DE374
	for <lists+linux-audit@lfdr.de>; Fri, 18 Dec 2020 14:48:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608299280;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kz84cQq4P4kwN5XOwSlaihxRYNZ33pGX9NERJQnfBkM=;
	b=eA31C7LlZMvUbVzTnWQv58+k69fJXlf4GL9MOXcNChA2oVkszp25vbqXT+ifwHhycq1D9G
	6m48FqyDnHRak4NEiIqUWQaytsMeq0xmjrapxQ+2U9FMI9cVo+4IgVaoXBAT58ieLN7/Qs
	I1hSFyuDj36l2Ea0+E4PapxgSQxqbTs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-wB-S5AuONEGnTS0ScfykNQ-1; Fri, 18 Dec 2020 08:47:56 -0500
X-MC-Unique: wB-S5AuONEGnTS0ScfykNQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8BC21005504;
	Fri, 18 Dec 2020 13:47:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E09C160C43;
	Fri, 18 Dec 2020 13:47:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 56785180954D;
	Fri, 18 Dec 2020 13:47:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BIDiUpg002063 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 18 Dec 2020 08:44:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6DE3E10023B7; Fri, 18 Dec 2020 13:44:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-114-141.rdu2.redhat.com [10.10.114.141])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8DE0D100239A;
	Fri, 18 Dec 2020 13:44:26 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Andreas Hasenack <andreas@canonical.com>
Subject: Re: "key=" on all related log lines
Date: Fri, 18 Dec 2020 08:44:24 -0500
Message-ID: <4613628.31r3eYUQgx@x2>
Organization: Red Hat
In-Reply-To: <CANYNYEEfJGivaVCmBcRHisVOOQDLDQ5qjthO3ZA6niO28mT=7Q@mail.gmail.com>
References: <CANYNYEEfJGivaVCmBcRHisVOOQDLDQ5qjthO3ZA6niO28mT=7Q@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
Cc: Linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Friday, December 18, 2020 8:24:04 AM EST Andreas Hasenack wrote:
> I use the -k "sometext" parameter in my audit rules, to help analyze
> the logs. I noticed that it's only added to one of the log lines, not
> the others, but the tools (ausearch, aureport) find the other related
> entries nevertheless.

Correct.

> For example:
> 
> -w /etc/shadow -p wa -k shadow-file-changed
> 
> After a "# touch /etc/shadow" I get:
> type=SYSCALL msg=audit(1608297571.005:160): arch=c000003e syscall=257
> success=yes exit=3 a0=ffffff9c a1=7ffedcecb865 a2=941 a3=1b6 items=2
> ppid=1623 pid=2382 auid=1000 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0
> sgid=0 fsgid=0 tty=pts1 ses=1 comm="touch" exe="/bin/touch"
> key="shadow-file-changed"
> type=CWD msg=audit(1608297571.005:160): cwd="/root"
> type=PATH msg=audit(1608297571.005:160): item=0 name="/etc/" inode=206
> dev=fc:01 mode=040755 ouid=0 ogid=0 rdev=00:00 nametype=PARENT
> cap_fp=0000000000000000 cap_fi=0000000000000000 cap_fe=0 cap_fver=0
> type=PATH msg=audit(1608297571.005:160): item=1 name="/etc/shadow"
> inode=64013 dev=fc:01 mode=0100640 ouid=0 ogid=42 rdev=00:00
> nametype=NORMAL cap_fp=0000000000000000 cap_fi=0000000000000000
> cap_fe=0 cap_fver=0
> type=PROCTITLE msg=audit(1608297571.005:160):
> proctitle=746F756368002F6574632F736861646F77
> 
> But only the first line has my key.

Correct.

> Are the other entries correlated via the id in "audit(id)"?

They are correlated by the combination of seconds since 1970, millisecond, 
and serial number. And the records between two events can be interlaced in 
the logs. Nothing in the klernel serializes the output. So, its entirely on 
user space to correlate things.

> Is there a way to have the key parameter attached to all of them? 

No.

> I'd like to send to a remote log server only certain events, and if I filter
> by key, I only get one of these log lines.

Then, I'd say you're not doing it the way it was intended. A simple grep is 
not sufficient. You would want to use the audit tools or auparse library to do 
this for you. They take care of the correlation and de-interlacing of events. 
And they can do the filtering. A good example is the setroubleshooter plugin. 
It filters just for AVC's and then sees if they have configuration solutions to 
avoid the AVC's.

Writing a filre using the auparse library is pretty simple. You can find an 
example to start from here:

https://github.com/linux-audit/audit-userspace/blob/master/contrib/plugin/
audisp-example.c

I'd also suggest making any plugin double threaded, with one side dequeuing 
events and the other thread processing them and some kind of queue in 
between. If the socket buffer between auditd and the plugin gets full, it can 
affect the audit daemon's performance.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

