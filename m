Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 51A611585CE
	for <lists+linux-audit@lfdr.de>; Mon, 10 Feb 2020 23:55:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581375323;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AjXTb14gVULNWBz95J6J85qXrEU7mJaPWFYCZuHpGL0=;
	b=TzyhmVccsPX0eMxTUAtH8l1BD9aApyh8qyA/bXzWV/Q6gjMFORrlrjFUzhcqPJFZn/8Wsx
	+4BMCuDqLjTHL6WZUS13SE8wH9URE4x75Am4h96ViCEPhPDVZEGoOgzRflB6QdUF6D5DTp
	mH+IbXGK9zIjtmXwtUTbG6kJPUlbV+c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-JR29Ff6ENgqeqiFpjX7PUA-1; Mon, 10 Feb 2020 17:55:21 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C484B107ACC7;
	Mon, 10 Feb 2020 22:55:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31F1D87B34;
	Mon, 10 Feb 2020 22:55:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9B1C618089CD;
	Mon, 10 Feb 2020 22:55:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01AMsomu013252 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 10 Feb 2020 17:54:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7BEAA2026D67; Mon, 10 Feb 2020 22:54:50 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 765112063209
	for <linux-audit@redhat.com>; Mon, 10 Feb 2020 22:54:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49EC480020F
	for <linux-audit@redhat.com>; Mon, 10 Feb 2020 22:54:48 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-23-UZsulXRbM_aV8ISg5AfPwg-1; Mon, 10 Feb 2020 17:54:46 -0500
Received: by mail-ed1-f68.google.com with SMTP id dc19so2356148edb.10
	for <linux-audit@redhat.com>; Mon, 10 Feb 2020 14:54:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=g7KSx02EYFq+THxRcwq3AOIRXx21m4bcv9d+qk2UPxw=;
	b=LHbL/b7zzBLvKrW0Yzbjdg1SQfdB81W4y3ja++8lTb5m7wEBb7uAtvZpBc2gnBX8DC
	MWponbO+IRyZ49E0zIE3orzFMEJYWTF6VQsyt8sGa3/RQsE+++zPuWUURmynDuQonHJW
	U0BYB2uFWSDb8kb9ycEyckb4lKB1WVho1OpA2ZSmvlfBpRDQZ2b81S9NUl5M39UY2k+S
	UsGhw894Hgi2RjCMpVzk9FmwLR/7Vwx/jn4c32LzPvk21NjWkuN3add6eZ5MsrUVlNzA
	Qp8XMoPacYkuB6W6V4UkqiTepvCvAkrCgVi1c5ctCLHnFzmtMbBftV9r0+B0FIablR9Z
	/yDQ==
X-Gm-Message-State: APjAAAVNne7Bomc9I4dNRTLZLUV0v+8sMBQK51R4P91dBat9dcmV/BY3
	whUXx+PPX19apKs/mgeAje1K8NOROtI4clUHE3NwHzfhmV12
X-Google-Smtp-Source: APXvYqwIjMvHAoCrud9lT1Yk3o9mR7tut+1VCRa6rKXjlb9Mxf2cXtcOJb7D+pddT3SIT9mfk+UbFOu2TMeY6kGxA4Y=
X-Received: by 2002:a17:906:22cf:: with SMTP id
	q15mr3184587eja.77.1581375284880; 
	Mon, 10 Feb 2020 14:54:44 -0800 (PST)
MIME-Version: 1.0
References: <5599a207-7054-af2e-6d10-0421154168b8@nwra.com>
	<8010cdd2-468b-ac87-54f1-2846baf28d28@nwra.com>
	<57c2b1a1-5406-4d77-9dc5-ad6c99b987a8@magitekltd.com>
	<1758232.KkKbY19U6n@x2>
	<17021a5a608.27df.85c95baa4474aabc7814e68940a78392@paul-moore.com>
In-Reply-To: <17021a5a608.27df.85c95baa4474aabc7814e68940a78392@paul-moore.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 10 Feb 2020 17:54:33 -0500
Message-ID: <CAHC9VhRhCQook8wPcYTb6Xfr0v+fqszzHxuVGzZxmK5N1KPzcw@mail.gmail.com>
Subject: Re: Is auditing ftruncate useful?
To: Steve Grubb <sgrubb@redhat.com>, linux-audit@redhat.com
X-MC-Unique: UZsulXRbM_aV8ISg5AfPwg-1
X-MC-Unique: JR29Ff6ENgqeqiFpjX7PUA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01AMsomu013252
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 7, 2020 at 4:56 PM Paul Moore <paul@paul-moore.com> wrote:
> On February 7, 2020 2:18:33 PM Steve Grubb <sgrubb@redhat.com> wrote:
> > On Thursday, February 6, 2020 1:33:19 PM EST Lenny Bruzenak wrote:
> >>> Doesn't seem much better:
> >>>
> >>> type=PROCTITLE msg=audit(02/06/2020 10:58:23.626:119631) :
> >>> proctitle=/bin/bash /usr/bin/thunderbird
> >>> type=SYSCALL msg=audit(02/06/2020 10:58:23.626:119631) : arch=x86_64
> >>> syscall=ftruncate success=yes exit=0 a0=0x4a a1=0x28 a2=0x7f1e41600018
> >>> a3=0xfffffe00 items=0 ppid=2451 pid=3561 auid=USER uid=USER gid=USER
> >>> euid=USER suid=USER fsuid=USER egid=USER sgid=USER fsgid=USER tty=(none)
> >>> ses=1 comm=thunderbird exe=/usr/lib64/thunderbird/thunderbird
> >>> subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
> >>> key=watched_users
> >>> Why no PATH entry?  I have them for things like open:
> >>
> >> The kernel guys can probably answer this accurately.
> >
> > I would have thought that they would have chimed in by now. Since they didn't
> > you might want to file an issue on github. I think you found a problem that
> > someone should look into some day.
>
> One of them (me) is on vacation, and only dealing with emergencies as they arise - this isn't one of those.  I'm not sure what Richard is doing, but you'll get an answer when I'm back in "the office" if Richard doesn't comment first.
>
> That said, it's always okay to file a GH issue.

Generally speaking the only syscalls which generate a PATH record are
those syscalls which take a file pathname as an argument.  The reason
why is that pathnames are notoriously transient and are only valid for
the instant they actually resolve to a file; in fact it is possible
that by the time an open(2) syscall returns the fd to the calling
application, the file it opened may no longer be accessible at the
pathname used to open the file.  It really is that crazy.

In the case of ftruncate(2) we see that the syscall doesn't take a
pathname argument, it takes an open file descriptor, this is why you
don't see a PATH record.  If we compare it to a syscall which does
take a pathname, e.g. chown(2), we will generate a PATH record.  Take
the example below where we use the example program found in the
chown(2) manpage:

# touch /tmp/test
# auditctl -w /tmp/test -k path_test
# gcc -o chown_test -g chown_test.c
# ./chown_test
./chown_test <owner> <file>
# ./chown_test nobody /tmp/test
# ausearch -i -k path_test
----
type=CONFIG_CHANGE msg=audit(02/10/2020 17:50:45.251:255) : auid=root ses=5 subj
=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 op=add_rule key=path_test
list=exit res=yes
----
type=PROCTITLE msg=audit(02/10/2020 17:51:29.356:258) : proctitle=./chown_test n
obody /tmp/test
type=PATH msg=audit(02/10/2020 17:51:29.356:258) : item=0 name=/tmp/test inode=7
0660 dev=00:21 mode=file,644 ouid=root ogid=root rdev=00:00 obj=unconfined_u:obj
ect_r:user_tmp_t:s0 nametype=NORMAL cap_fp=none cap_fi=none cap_fe=0 cap_fver=0
cap_frootid=0
type=CWD msg=audit(02/10/2020 17:51:29.356:258) : cwd=/root/tmp
type=SYSCALL msg=audit(02/10/2020 17:51:29.356:258) : arch=x86_64 syscall=chown
success=yes exit=0 a0=0x7ffc820c0603 a1=nobody a2=unset a3=0x40044e items=1 ppid
=1678 pid=35451 auid=root uid=root gid=root euid=root suid=root fsuid=root egid=
root sgid=root fsgid=root tty=pts1 ses=5 comm=chown_test exe=/root/tmp/chown_tes
t subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=path_test

... in the example above we see that we do have a PATH record, as expected.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

