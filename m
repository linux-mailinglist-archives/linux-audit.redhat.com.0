Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 1D49B1E663A
	for <lists+linux-audit@lfdr.de>; Thu, 28 May 2020 17:35:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590680150;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=XJeegLsQiFOcCqaR0jXYc9TOq7ktJsI4eOh5K0jrciM=;
	b=Aj5lE+Vleqr15s1ed629YISStEYgVGiFdsmZSeCPEskGbaT9R89ExQylmWcYnRDFDyX/Es
	HhSHJeAqt895EzOiUigP/KdVZbUwjHz3ANJeeyx1fWv3Okx9xD/Ou/PS65LwBFojY/R7mu
	5+uUPMgSHG5/4zm/x4Ac0kKFzrX5S9o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-Jh0Zw3aTPL-HrgKt3rawnw-1; Thu, 28 May 2020 11:35:47 -0400
X-MC-Unique: Jh0Zw3aTPL-HrgKt3rawnw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74F341005510;
	Thu, 28 May 2020 15:35:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A6581A18BB;
	Thu, 28 May 2020 15:35:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 71FFE6B57D;
	Thu, 28 May 2020 15:35:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04SFZCfa017592 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 28 May 2020 11:35:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 612182166BA4; Thu, 28 May 2020 15:35:12 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 461612166BA2
	for <linux-audit@redhat.com>; Thu, 28 May 2020 15:35:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5FE08007DD
	for <linux-audit@redhat.com>; Thu, 28 May 2020 15:35:09 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
	[209.85.218.54]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-480-v-Ik3lpdPLCkdXVbRVzrVw-1; Thu, 28 May 2020 11:35:06 -0400
X-MC-Unique: v-Ik3lpdPLCkdXVbRVzrVw-1
Received: by mail-ej1-f54.google.com with SMTP id o15so368124ejm.12;
	Thu, 28 May 2020 08:35:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DHOe5x6QXSm/rWEL/AxRi2d5MFn/O0+ZCAzoawOPmPQ=;
	b=CYJblfcYo5BtZcCfrxiZwKQev6CY9nGCqxkbIcsEj89B3BActRKuuv+yowE/u2YXIa
	jGHCgmCC44wOOLVGGu+AFrLFOXrtL+shSNkSYrmlIBW5QjKWSV8N05WWmtXS9nWGT+Iw
	APjjtaOygWqD1LSMoben4lWrBB3tnsnT6kl0WCVzuWiMXI8X7Tynr48mbJKxGc4FWO9e
	ioa6hZMAXo54sf2K6PK9BLCrdY+uT1zR5x7xTHDyJuYdloXzNQS7FUIgixmUlM0t7XzR
	PKt2YOwFMSaOR0YnZMHtNBofeEDzedMtLL/SFg7d0m7dDF7sCF8B0aUSiKxt9uIzqdtX
	fj6g==
X-Gm-Message-State: AOAM532FIstZNAqMPUDjKvZPioZHyrG8NztYZXtW2Y01icDLcmqacd2/
	sTIJfmp3xM/S4uzb4+dTeI3GHbNi8PaBp/0jBlVy3w==
X-Google-Smtp-Source: ABdhPJwog2ZrgfNFRh2X+sQd05xj8ithOSpDoJHJLHs5LcvimHv4nNoRw30C5hKyC7C2i+d9SQqZo17NKikF0kmOkO0=
X-Received: by 2002:a17:906:e0c5:: with SMTP id
	gl5mr3428111ejb.524.1590680104913; 
	Thu, 28 May 2020 08:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAKLd27D7ts_1Orymr50D-qZHhmxs7Jkbb4uh660nCoH4n4WG_w@mail.gmail.com>
	<4000710.EZmUHuUpmd@x2>
In-Reply-To: <4000710.EZmUHuUpmd@x2>
From: Vishnu Srinivasa Ramaprasad <srvishnu123@gmail.com>
Date: Thu, 28 May 2020 21:04:53 +0530
Message-ID: <CAKLd27BRuezHtuWjjfUo1dQtxgAN1hjT7W0kdQvCExCASYgHXw@mail.gmail.com>
Subject: Re: What value gets stored in a3 when -S execve?
To: Steve Grubb <sgrubb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============8013414567856541399=="

--===============8013414567856541399==
Content-Type: multipart/alternative; boundary="0000000000009ad52105a6b712c9"

--0000000000009ad52105a6b712c9
Content-Type: text/plain; charset="UTF-8"

Thank You so much Steve for the clarification.
Have a Nice day :)

On Thu, May 28, 2020 at 1:52 AM Steve Grubb <sgrubb@redhat.com> wrote:

> Hello,
>
> On Wednesday, May 27, 2020 3:44:13 PM EDT Vishnu Srinivasa Ramaprasad
> wrote:
> > I'm Vish and I am a newbie to auditd. My requirement is to log only
> > shell/bash commands and custom commands executed by administrator users.
> > I have created these rules in /etc/audit/rules.d/audit.rules, to ensure
> > SYSCALL, EXECVE are being added to audit.log for administrator users with
> > auid greater than 1000:
> > -a exit,always -F arch=b64 -S execve -F auid>=1000 -F auid!=-1 -k log_cmd
> > -a exit,always -F arch=b32 -S execve -F auid>=1000 -F auid!=-1 -k log_cmd
> >
> > After restarting auditd service, I had executed strace on a simple
> command
> > which will display version of my project's toolkit:
> >
> > ~# strace -e trace=execve toolkit-version-show
> > execve("/var/tmp/toolkit-version-show", ["toolkit-version-show"],
> > 0x7ffef1fa38b0 /* 30 vars */) = 0
> > Toolkit Version: 1.01
> > +++ exited with 0 +++
> >
> > Later, I executed the ausearch command to check the log entry:
> > ~# ausearch -i --start recent
> > ----
> > type=EXECVE msg=audit(05/27/2020 19:01:26.605:12725) : argc=2
> > a0=/usr/bin/perl a1=/var/tmp/toolkit-version-show
> > type=SYSCALL msg=audit(05/27/2020 19:01:26.605:12725) : arch=x86_64
> > syscall=execve success=yes exit=0 a0=0x7ffef1fa2450 a1=0x7ffef1fa38a0
> > a2=0x7ffef1fa38b0 a3=0x7f47f8669740 items=3 ppid=3641 pid=3643
> > auid=administrator uid=root gid=root euid=root suid=root fsuid=root
> > egid=root sgid=root fsgid=root tty=pts0 ses=8936 comm=toolkit-version-sho
> > exe=/usr/bin/perl key=log_cmd
> > ----
> > type=EXECVE msg=audit(05/27/2020 19:01:26.601:12724) : argc=4 a0=strace
> > a1=-e a2=trace=execve a3=toolkit-version-show
> > type=SYSCALL msg=audit(05/27/2020 19:01:26.601:12724) : arch=x86_64
> > syscall=execve success=yes exit=0 a0=0x55a2d44c9010 a1=0x55a2d449fe80
> > a2=0x55a2d4389490 a3=0x8 items=2 ppid=3099 pid=3641 auid=administrator
> > uid=root gid=root euid=root suid=root fsuid=root egid=root sgid=root
> > fsgid=root tty=pts0 ses=8936 comm=strace exe=/usr/bin/strace key=log_cmd
> > ----
> >
> > My understanding of a0 - a2: Please refer the syntax of execve() :
> >
> > int execve(const char*filename, char *const argv[], char *const envp[]);
> >
> > Based on syntax of execve() and output from strace, I could understand
> that
> > in audit.log event entry:
> > a0=0x7ffef1fa2450 represents filename argument of execve
>
> It a pointer to the string.
>
> > a1=0x7ffef1fa38a0 represents argv[] argument of execve
> > a2=0x7ffef1fa38b0 represents envp[] argument of execve
> >
> > Question  1:  What does the a3=0x7f47f8669740  value represent?
>
> whatever is on the stack in that position.
>
> > As execve() has only 3 arguments (represented by a0,a1,a2), what value
> gets
> > stored in a3?
> > I have noticed a3 values to be varying from:
> > a3=0x0
> > a3=0x7
> > a3=0x55a2d4389490
> > a3=0x56a2d44adc00
> > a3=0x8
> >
> > Question 2: a3=0x8 seems to be the value assigned for a majority of
> > execve() syscalls.
> > Is this a standard value set in case of main/primary system call, such as
> > toolkit-version-show?
>
> Nope. It depends entirely on what the previous syscalls or system activity
> were and where on the stack it currently is.
>
> > Could I use this in a rule filter *-F a3=8* to log only primary (custom
> > script) command executed by user and not internal commands executed by
> > custom script like ls, cat, grep.. etc.:
> > -a exit,always -F arch=b64 -S execve *-F a3=8* -F auid>=1000 -F auid!=-1
> -k
> > log_cmd
> > -a exit,always -F arch=b32 -S execve *-F a3=8* -F auid>=1000 -F auid!=-1
> -k
> > log_cmd
> >
> > Would I miss logging a few primary syscalls, if a3 is not 0x80 in some
> > cases?
>
> Nope. you can't count on anything in a3 since it is not valid for that
> syscall.
>
> > Question 3: If a3=0x8 is not a standard value, Is it possible to identify
> > primary custom command and log only that command, and not internal
> commands
> > with a3=0x0 or a3=0x55a2d4389490?
>
> You can always place a watch on the custom commands.
> -a exit,always -F path=/path-to/custom-command -F perm=x -F key=command
>
>
> > Question 4: Is it possible to filter out and not log syscalls with
> > tty=(none)?
>
> No. But there is a loose correlation with auid or sessionid being -1. That
> means it is a daemon. And if you only want commands run by people, then
> you
> want -F auid>=1000 -F auid!=-1.
>
> -Steve
>
>
>
>

--0000000000009ad52105a6b712c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank You so much Steve for the clarification.=C2=A0<div>H=
ave a Nice day :)</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Thu, May 28, 2020 at 1:52 AM Steve Grubb &lt;<a h=
ref=3D"mailto:sgrubb@redhat.com">sgrubb@redhat.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
On Wednesday, May 27, 2020 3:44:13 PM EDT Vishnu Srinivasa Ramaprasad wrote=
:<br>
&gt; I&#39;m Vish and I am a newbie to auditd. My requirement is to log onl=
y<br>
&gt; shell/bash commands and custom commands executed by administrator user=
s.<br>
&gt; I have created these rules in /etc/audit/rules.d/audit.rules, to ensur=
e<br>
&gt; SYSCALL, EXECVE are being added to audit.log for administrator users w=
ith<br>
&gt; auid greater than 1000:<br>
&gt; -a exit,always -F arch=3Db64 -S execve -F auid&gt;=3D1000 -F auid!=3D-=
1 -k log_cmd<br>
&gt; -a exit,always -F arch=3Db32 -S execve -F auid&gt;=3D1000 -F auid!=3D-=
1 -k log_cmd<br>
&gt; <br>
&gt; After restarting auditd service, I had executed strace on a simple com=
mand<br>
&gt; which will display version of my project&#39;s toolkit:<br>
&gt; <br>
&gt; ~# strace -e trace=3Dexecve toolkit-version-show<br>
&gt; execve(&quot;/var/tmp/toolkit-version-show&quot;, [&quot;toolkit-versi=
on-show&quot;],<br>
&gt; 0x7ffef1fa38b0 /* 30 vars */) =3D 0<br>
&gt; Toolkit Version: 1.01<br>
&gt; +++ exited with 0 +++<br>
&gt; <br>
&gt; Later, I executed the ausearch command to check the log entry:<br>
&gt; ~# ausearch -i --start recent<br>
&gt; ----<br>
&gt; type=3DEXECVE msg=3Daudit(05/27/2020 19:01:26.605:12725) : argc=3D2<br=
>
&gt; a0=3D/usr/bin/perl a1=3D/var/tmp/toolkit-version-show<br>
&gt; type=3DSYSCALL msg=3Daudit(05/27/2020 19:01:26.605:12725) : arch=3Dx86=
_64<br>
&gt; syscall=3Dexecve success=3Dyes exit=3D0 a0=3D0x7ffef1fa2450 a1=3D0x7ff=
ef1fa38a0<br>
&gt; a2=3D0x7ffef1fa38b0 a3=3D0x7f47f8669740 items=3D3 ppid=3D3641 pid=3D36=
43<br>
&gt; auid=3Dadministrator uid=3Droot gid=3Droot euid=3Droot suid=3Droot fsu=
id=3Droot<br>
&gt; egid=3Droot sgid=3Droot fsgid=3Droot tty=3Dpts0 ses=3D8936 comm=3Dtool=
kit-version-sho<br>
&gt; exe=3D/usr/bin/perl key=3Dlog_cmd<br>
&gt; ----<br>
&gt; type=3DEXECVE msg=3Daudit(05/27/2020 19:01:26.601:12724) : argc=3D4 a0=
=3Dstrace<br>
&gt; a1=3D-e a2=3Dtrace=3Dexecve a3=3Dtoolkit-version-show<br>
&gt; type=3DSYSCALL msg=3Daudit(05/27/2020 19:01:26.601:12724) : arch=3Dx86=
_64<br>
&gt; syscall=3Dexecve success=3Dyes exit=3D0 a0=3D0x55a2d44c9010 a1=3D0x55a=
2d449fe80<br>
&gt; a2=3D0x55a2d4389490 a3=3D0x8 items=3D2 ppid=3D3099 pid=3D3641 auid=3Da=
dministrator<br>
&gt; uid=3Droot gid=3Droot euid=3Droot suid=3Droot fsuid=3Droot egid=3Droot=
 sgid=3Droot<br>
&gt; fsgid=3Droot tty=3Dpts0 ses=3D8936 comm=3Dstrace exe=3D/usr/bin/strace=
 key=3Dlog_cmd<br>
&gt; ----<br>
&gt; <br>
&gt; My understanding of a0 - a2: Please refer the syntax of execve() :<br>
&gt; <br>
&gt; int execve(const char*filename, char *const argv[], char *const envp[]=
);<br>
&gt; <br>
&gt; Based on syntax of execve() and output from strace, I could understand=
 that<br>
&gt; in audit.log event entry:<br>
&gt; a0=3D0x7ffef1fa2450 represents filename argument of execve<br>
<br>
It a pointer to the string.<br>
<br>
&gt; a1=3D0x7ffef1fa38a0 represents argv[] argument of execve<br>
&gt; a2=3D0x7ffef1fa38b0 represents envp[] argument of execve<br>
&gt; <br>
&gt; Question=C2=A0 1:=C2=A0 What does the a3=3D0x7f47f8669740=C2=A0 value =
represent?<br>
<br>
whatever is on the stack in that position.<br>
<br>
&gt; As execve() has only 3 arguments (represented by a0,a1,a2), what value=
 gets<br>
&gt; stored in a3?<br>
&gt; I have noticed a3 values to be varying from:<br>
&gt; a3=3D0x0<br>
&gt; a3=3D0x7<br>
&gt; a3=3D0x55a2d4389490<br>
&gt; a3=3D0x56a2d44adc00<br>
&gt; a3=3D0x8<br>
&gt; <br>
&gt; Question 2: a3=3D0x8 seems to be the value assigned for a majority of<=
br>
&gt; execve() syscalls.<br>
&gt; Is this a standard value set in case of main/primary system call, such=
 as<br>
&gt; toolkit-version-show?<br>
<br>
Nope. It depends entirely on what the previous syscalls or system activity =
<br>
were and where on the stack it currently is.<br>
<br>
&gt; Could I use this in a rule filter *-F a3=3D8* to log only primary (cus=
tom<br>
&gt; script) command executed by user and not internal commands executed by=
<br>
&gt; custom script like ls, cat, grep.. etc.:<br>
&gt; -a exit,always -F arch=3Db64 -S execve *-F a3=3D8* -F auid&gt;=3D1000 =
-F auid!=3D-1 -k<br>
&gt; log_cmd<br>
&gt; -a exit,always -F arch=3Db32 -S execve *-F a3=3D8* -F auid&gt;=3D1000 =
-F auid!=3D-1 -k<br>
&gt; log_cmd<br>
&gt; <br>
&gt; Would I miss logging a few primary syscalls, if a3 is not 0x80 in some=
<br>
&gt; cases?<br>
<br>
Nope. you can&#39;t count on anything in a3 since it is not valid for that =
<br>
syscall.<br>
<br>
&gt; Question 3: If a3=3D0x8 is not a standard value, Is it possible to ide=
ntify<br>
&gt; primary custom command and log only that command, and not internal com=
mands<br>
&gt; with a3=3D0x0 or a3=3D0x55a2d4389490?<br>
<br>
You can always place a watch on the custom commands.<br>
-a exit,always -F path=3D/path-to/custom-command -F perm=3Dx -F key=3Dcomma=
nd<br>
<br>
<br>
&gt; Question 4: Is it possible to filter out and not log syscalls with<br>
&gt; tty=3D(none)?<br>
<br>
No. But there is a loose correlation with auid or sessionid being -1. That =
<br>
means it is a daemon. And if you only want commands run by people, then you=
 <br>
want -F auid&gt;=3D1000 -F auid!=3D-1.<br>
<br>
-Steve<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000009ad52105a6b712c9--

--===============8013414567856541399==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============8013414567856541399==--

