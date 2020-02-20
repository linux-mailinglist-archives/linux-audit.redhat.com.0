Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3A84D166B1E
	for <lists+linux-audit@lfdr.de>; Fri, 21 Feb 2020 00:44:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582242251;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KILiC0MzuzLtgjnyGvOXafimhnztoHR4846fotC3nGc=;
	b=ej68eJvrIm2fgGcjc4R842heIz7BuG9gHP7NTOjaMGSS7AW14NdeHKWbNdZW016TW07xYV
	N6vU/jN/4rgO46EdPARhcTKu1n2BZB3i5EcbN33zkhH+4AdNnbo27tZeiCBTXZx9iIkBUL
	07MbSovX2cLUuU6fvth9i18MXoJ4jKQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-MuZS2Jb8OFiWk4qWzBJp1Q-1; Thu, 20 Feb 2020 18:44:08 -0500
X-MC-Unique: MuZS2Jb8OFiWk4qWzBJp1Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F602B1509;
	Thu, 20 Feb 2020 23:44:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 859D3194B2;
	Thu, 20 Feb 2020 23:44:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A5E5935B17;
	Thu, 20 Feb 2020 23:43:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01KNfBo9022780 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 20 Feb 2020 18:41:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3C2665C28E; Thu, 20 Feb 2020 23:41:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-254.phx2.redhat.com [10.3.116.254])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F35195C553;
	Thu, 20 Feb 2020 23:41:08 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: Question about excluding rules
Date: Thu, 20 Feb 2020 18:41:08 -0500
Message-ID: <2400991.fjeXDc8RHV@x2>
Organization: Red Hat
In-Reply-To: <CAM5ObREwVjihySamgkSGOxBK8Rwe0jgra5+Ec5ZHK5J5XzD_Ow@mail.gmail.com>
References: <CAM5ObREwVjihySamgkSGOxBK8Rwe0jgra5+Ec5ZHK5J5XzD_Ow@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thursday, February 20, 2020 6:36:46 PM EST Moshe Rechtman wrote:
> Hello Experts,
> 
> We have a big customer that facing the following issue on RHEL 6.2.
> As per customer request I've configured the following rules:
> 
> $ cat audit.rules
> 
> # This file contains the auditctl rules that are loaded
> # whenever the audit daemon is started via the initscripts.
> # The rules are simply the parameters that would be passed
> # to auditctl.
> 
> # First rule - delete all
> -D
> 
> # Increase the buffers to survive stress events.
> # Make this bigger for busy systems
> -b 320
> 
> # Feel free to add below this line. See auditctl man page
> 
> -a exit,always -F arch=b64 -F euid=0 -S execve -k rootact
> -a exit,always -F arch=b32 -F euid=0 -S execve -k rootact
> -a exit,always -F arch=b64 -F euid>=500 -S execve -k useract
> -a exit,always -F arch=b32 -F euid>=500 -S execve -k useract
> 
> 
> Audit start working as expected. Now customer is asking to exclude/ignore
> the following from audit logs:
> 
> type=SYSCALL msg=audit(1581664357.597:257516): arch=c000003e
> syscall=59 success=yes exit=0 a0=3869161ea3 a1=7ffd15530c20
> a2=7ffd15534348 a3=3869617240 items=2 ppid=3350 pid=59266
> auid=4294967295 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0
> fsgid=0 tty=(none) ses=4294967295 comm="sh" exe="/bin/bash"
> key="rootact"
> type=EXECVE msg=audit(1581664357.597:257516): argc=3 a0="sh" a1="-c"
> a2=2F62696E2F70732061757877777777
> type=CWD msg=audit(1581664357.597:257516): 
> cwd="/opt/microfocus/Discovery/bin" type=PATH
> msg=audit(1581664357.597:257516): item=0 name="/bin/sh" inode=398
> dev=fd:01 mode=0100755 ouid=0 ogid=0 rdev=00:00
> nametype=NORMAL
> type=PATH msg=audit(1581664357.597:257516): item=1 name=(null)
> inode=4481 dev=fd:01 mode=0100755 ouid=0 ogid=0 rdev=00:00
> nametype=NORMAL
> 
> ype=SYSCALL msg=audit(1581664357.601:257517): arch=c000003e syscall=59
> success=yes exit=0 a0=155c2f0 a1=155b8d0 a2=155b460 a3=18 items=2
> ppid=3350 pid=59266 auid=4294967295 uid=0 gid=0 euid=0 suid=0 fsuid=0
> egid=0 sgid=0 fsgid=0 tty=(none) ses=4294967295 comm="ps"
> exe="/bin/ps" key="rootact"
> type=EXECVE msg=audit(1581664357.601:257517): argc=2 a0="/bin/ps"
> a1="auxwwww" type=CWD msg=audit(1581664357.601:257517): 
> cwd="/opt/microfocus/Discovery/bin" type=PATH
> msg=audit(1581664357.601:257517): item=0 name="/bin/ps" inode=1451
> dev=fd:01 mode=0100755 ouid=0 ogid=0 rdev=00:00
> nametype=NORMAL
> type=PATH msg=audit(1581664357.601:257517): item=1 name=(null)
> inode=4481 dev=fd:01 mode=0100755 ouid=0 ogid=0 rdev=00:00
> nametype=NORMAL
> 
> What would be the best way to exclude such audit?
> Your help would be much appreciated.

What's objectionable about these events? The fact that its got a key says 
they think they wanted it.

-Steve



--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

