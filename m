Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id D8FA4158F57
	for <lists+linux-audit@lfdr.de>; Tue, 11 Feb 2020 13:59:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581425944;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=y5h3LbFSEzq/JKWtPKRAtigjxjb0O0zDAtV5Vuj1G1Y=;
	b=AJL2tnZagEQYUx6Yw6RQHAgctcRq0q2sZW3VRScUrDTYNsqu58lFb98Cs/QGiRrVIFt74x
	PjKq52tcUdgitdR/H8XCIJhGhIfXqSxyQ9EFE/13cbjVxOZWvJiOEcIjqGHpVoR64WyBFe
	06PGw50b3GUnv7rb5SmwkMog8iVToyY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-GaJPwVzFNMqvyxrb8pND1A-1; Tue, 11 Feb 2020 07:59:02 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68909DB63;
	Tue, 11 Feb 2020 12:58:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B7DC89F24;
	Tue, 11 Feb 2020 12:58:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0CBE518089CD;
	Tue, 11 Feb 2020 12:58:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01BCwRNM026220 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 11 Feb 2020 07:58:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1352E814D; Tue, 11 Feb 2020 12:58:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EFB56C341
	for <linux-audit@redhat.com>; Tue, 11 Feb 2020 12:58:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11DD28012C0
	for <linux-audit@redhat.com>; Tue, 11 Feb 2020 12:58:22 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-241-SseCVjJUNH64-uN9w-meCw-1; Tue, 11 Feb 2020 07:58:19 -0500
Received: by mail-ed1-f67.google.com with SMTP id c26so4491808eds.8
	for <linux-audit@redhat.com>; Tue, 11 Feb 2020 04:58:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CTkIxHnRW5YNdW/bQ2RafIj0hzOb+ddbxbyerWhZ57M=;
	b=cmsxb7uoBGAGhnJIFYiLcKIzT5p1zKwylELIsz5NwccXSJpmiC+3ztNASSDt535J/p
	xncXOpwZCdE1EABZsS+y27+dToWkLoxP9ACxXyB/O9wTA0md2TA2cX6XDBhQAhZkxA/Q
	bYHQQPF0Yw0UMTwE+VleVgHUOQOF4vY/lZ/GTMEk/OPLLqA9JsVDg67+CETLLSMzEY70
	B3sOohW0/1reOh+HTQgyqc0SJ/cNsCb+qTJhDMplDR/qMXlC9CbQcwYMKlxiBocVSp/D
	6vx0tqdmfBLRro+o9GphV7aIe6b+S/GiHpC8yWf6yCMlUWTylkcRJX2L/trd1K6CDCD/
	caSQ==
X-Gm-Message-State: APjAAAU1b9o5l6I2E8BcEFT/jjyUHlINo+6Px8ErRGVJQAVfFWFMgyBU
	1JRH3f230kzzfI2oR+2UgkqxyJIpOsU+4FMRclaBLK9a6Q==
X-Google-Smtp-Source: APXvYqxgeYpwDf+EdQhqsj70Sh/n9KLax71sOGtNfaq1wq/Tem864BbvY8wPjw6J1K8RDe4fhJ7XQDWxkJ8UQARZa9w=
X-Received: by 2002:a17:906:7c47:: with SMTP id
	g7mr6105862ejp.281.1581425897955; 
	Tue, 11 Feb 2020 04:58:17 -0800 (PST)
MIME-Version: 1.0
References: <5599a207-7054-af2e-6d10-0421154168b8@nwra.com>
	<8010cdd2-468b-ac87-54f1-2846baf28d28@nwra.com>
	<57c2b1a1-5406-4d77-9dc5-ad6c99b987a8@magitekltd.com>
	<1758232.KkKbY19U6n@x2>
	<17021a5a608.27df.85c95baa4474aabc7814e68940a78392@paul-moore.com>
	<CAHC9VhRhCQook8wPcYTb6Xfr0v+fqszzHxuVGzZxmK5N1KPzcw@mail.gmail.com>
	<4b16e97a-49d7-d558-0d87-7cdff23888b5@nwra.com>
In-Reply-To: <4b16e97a-49d7-d558-0d87-7cdff23888b5@nwra.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 11 Feb 2020 07:58:06 -0500
Message-ID: <CAHC9VhR-hGOgOkpQaFEM=CFCETR7goOxfYjT52brgUpNibnkBg@mail.gmail.com>
Subject: Re: Is auditing ftruncate useful?
To: Orion Poplawski <orion@nwra.com>
X-MC-Unique: SseCVjJUNH64-uN9w-meCw-1
X-MC-Unique: GaJPwVzFNMqvyxrb8pND1A-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01BCwRNM026220
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 10, 2020 at 6:05 PM Orion Poplawski <orion@nwra.com> wrote:
> On 2/10/20 3:54 PM, Paul Moore wrote:
> > On Fri, Feb 7, 2020 at 4:56 PM Paul Moore <paul@paul-moore.com> wrote:
> >> On February 7, 2020 2:18:33 PM Steve Grubb <sgrubb@redhat.com> wrote:
> >>> On Thursday, February 6, 2020 1:33:19 PM EST Lenny Bruzenak wrote:
> >>>>> Doesn't seem much better:
> >>>>>
> >>>>> type=PROCTITLE msg=audit(02/06/2020 10:58:23.626:119631) :
> >>>>> proctitle=/bin/bash /usr/bin/thunderbird
> >>>>> type=SYSCALL msg=audit(02/06/2020 10:58:23.626:119631) : arch=x86_64
> >>>>> syscall=ftruncate success=yes exit=0 a0=0x4a a1=0x28 a2=0x7f1e41600018
> >>>>> a3=0xfffffe00 items=0 ppid=2451 pid=3561 auid=USER uid=USER gid=USER
> >>>>> euid=USER suid=USER fsuid=USER egid=USER sgid=USER fsgid=USER tty=(none)
> >>>>> ses=1 comm=thunderbird exe=/usr/lib64/thunderbird/thunderbird
> >>>>> subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
> >>>>> key=watched_users
> >>>>> Why no PATH entry?  I have them for things like open:
> >>>>
> >>>> The kernel guys can probably answer this accurately.
> >>>
> >>> I would have thought that they would have chimed in by now. Since they didn't
> >>> you might want to file an issue on github. I think you found a problem that
> >>> someone should look into some day.
> >>
> >> One of them (me) is on vacation, and only dealing with emergencies as they arise - this isn't one of those.  I'm not sure what Richard is doing, but you'll get an answer when I'm back in "the office" if Richard doesn't comment first.
> >>
> >> That said, it's always okay to file a GH issue.
> >
> > Generally speaking the only syscalls which generate a PATH record are
> > those syscalls which take a file pathname as an argument.  The reason
> > why is that pathnames are notoriously transient and are only valid for
> > the instant they actually resolve to a file; in fact it is possible
> > that by the time an open(2) syscall returns the fd to the calling
> > application, the file it opened may no longer be accessible at the
> > pathname used to open the file.  It really is that crazy.
> >
> > In the case of ftruncate(2) we see that the syscall doesn't take a
> > pathname argument, it takes an open file descriptor, this is why you
> > don't see a PATH record.  If we compare it to a syscall which does
> > take a pathname, e.g. chown(2), we will generate a PATH record.  Take
> > the example below where we use the example program found in the
> > chown(2) manpage:
> >
> > # touch /tmp/test
> > # auditctl -w /tmp/test -k path_test
> > # gcc -o chown_test -g chown_test.c
> > # ./chown_test
> > ./chown_test <owner> <file>
> > # ./chown_test nobody /tmp/test
> > # ausearch -i -k path_test
> > ----
> > type=CONFIG_CHANGE msg=audit(02/10/2020 17:50:45.251:255) : auid=root ses=5 subj
> > =unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 op=add_rule key=path_test
> > list=exit res=yes
> > ----
> > type=PROCTITLE msg=audit(02/10/2020 17:51:29.356:258) : proctitle=./chown_test n
> > obody /tmp/test
> > type=PATH msg=audit(02/10/2020 17:51:29.356:258) : item=0 name=/tmp/test inode=7
> > 0660 dev=00:21 mode=file,644 ouid=root ogid=root rdev=00:00 obj=unconfined_u:obj
> > ect_r:user_tmp_t:s0 nametype=NORMAL cap_fp=none cap_fi=none cap_fe=0 cap_fver=0
> > cap_frootid=0
> > type=CWD msg=audit(02/10/2020 17:51:29.356:258) : cwd=/root/tmp
> > type=SYSCALL msg=audit(02/10/2020 17:51:29.356:258) : arch=x86_64 syscall=chown
> > success=yes exit=0 a0=0x7ffc820c0603 a1=nobody a2=unset a3=0x40044e items=1 ppid
> > =1678 pid=35451 auid=root uid=root gid=root euid=root suid=root fsuid=root egid=
> > root sgid=root fsgid=root tty=pts1 ses=5 comm=chown_test exe=/root/tmp/chown_tes
> > t subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=path_test
> >
> > ... in the example above we see that we do have a PATH record, as expected.
> >
>
> So, this is all reasonable.  But why do I get this with fchown which also
> takes a file descriptor?
>
> type=PROCTITLE msg=audit(02/06/2020 10:59:30.562:59894) : proctitle=kwin
> -session 106f726361000123384967700000029380000_1548775895_794186
> type=PATH msg=audit(02/06/2020 10:59:30.562:59894) : item=0 name=(null)
> inode=595335 dev=fd:01 mode=file,600 ouid=USER ogid=USER rdev=00:00
> obj=unconfined_u:object_r:config_home_t:s0 objtype=NORMAL cap_fp=none
> cap_fi=none cap_fe=0 cap_fver=0
> type=SYSCALL msg=audit(02/06/2020 10:59:30.562:59894) : arch=x86_64
> syscall=fchown success=yes exit=0 a0=0xd a1=0x584b a2=0x584b a3=0xc items=1
> ppid=27089 pid=27152 auid=USER uid=USER gid=USER euid=USER suid=USER
> fsuid=USER egid=USER sgid=USER fsgid=USER tty=(none) ses=16 comm=kwin
> exe=/usr/bin/kwin subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
> key=perm_mod
>
> It's this disparity between fchown and ftruncate that caught my attention.

First off, it is worth distinguishing between a PATH record with a
valid pathname (the chown(2) case) and a PATH record with an
invalid/NULL pathname (the fchown(2) case).  At this point you
hopefully understand why those PATH records are different, and why
they sometimes have a pathname, and why sometimes they do not.

For syscalls which resolve pathnames the pathname information for the
PATH records are collected as the pathname is resolved (the only time
they are valid).  When the syscall is done, the resolved pathname
information is turned into the PATH records you see.

In the case of fchown(2) there is no pathname resolution, the kernel's
fchown(2) implementation explicitly records the passed file descriptor
for reasons that Casey mentioned: it's security relevant since you are
changing the file's ownership.  The ftruncate(2) syscall isn't
security relevant so there is no explicit attempt to record the file
descriptor information.  This is why fchown(2) generates a pathless
PATH record, and why ftruncate(2) does not.

If you are still curious, I would suggest you take a look at the
kernel code, all the answers are there, and we could always use
another set of hands/eyes ;)

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

