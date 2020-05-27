Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 46F061E4E5B
	for <lists+linux-audit@lfdr.de>; Wed, 27 May 2020 21:39:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590608377;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=4c+y6N0Af3TnBj0GXifLod602P62QEJYEIoJYYCKUoU=;
	b=O3hS6ren40zTaAcZ1Fp5tLpWMRJ93ls7g1w0bsRDF9/QHJIBLFICNyIl97QpkNPiSOdpqZ
	vuuZAkR9QcXKLYfJAF1DOfPmMpY3AiyNc3mfEb1BH1wucUKZhwwuoaXJR+yq64lQuFYwLl
	fnQ8q1facSveAIT836Ufikr54ZjR5Q0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-Qs3PqWZiNGa_52b9d-TMgA-1; Wed, 27 May 2020 15:39:35 -0400
X-MC-Unique: Qs3PqWZiNGa_52b9d-TMgA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BE54835B40;
	Wed, 27 May 2020 19:39:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 837BF60C05;
	Wed, 27 May 2020 19:39:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 711DA1809554;
	Wed, 27 May 2020 19:39:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04RJdEmK008508 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 27 May 2020 15:39:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D814B202696B; Wed, 27 May 2020 19:39:14 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D25C12017DCB
	for <linux-audit@redhat.com>; Wed, 27 May 2020 19:39:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B00F8007A4
	for <linux-audit@redhat.com>; Wed, 27 May 2020 19:39:12 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
	[209.85.208.49]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-347-NPbdjbNONaqrP9TL8q_7DA-1; Wed, 27 May 2020 15:39:09 -0400
X-MC-Unique: NPbdjbNONaqrP9TL8q_7DA-1
Received: by mail-ed1-f49.google.com with SMTP id q13so2048016edi.3
	for <linux-audit@redhat.com>; Wed, 27 May 2020 12:39:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=4iLLpcHqrd6CKih4R60vFzObZ7s778a0mLBuPSf1Za4=;
	b=JcdruQ+usKRWDzncKz2Cx+iV9Yl2mGRLDMVG8mbPTbRgXWf0WPXMX+FzvQwxfnXsCY
	gtwQO97oT28yDxxfk36wqGK1Nm6bV6dGSuMACZszetbX0wqEytxQ+R0CbTxXgVjLcXsT
	OjtyNOTFOVxJcR0B4ebg1zzi2nJqDvCcIPqXUK+xGUh6L/Xrrs3OA0Q5Nl/j8zqvIMfi
	BBG9NGTWSXA+8CP2kZcTZsSQJszChImhAWcBqJW/XT0wsrV9zBO2f2ftJIfJtN5HLzdw
	kdoZQVfMzJM2q61LxXSpNWcuA2uEgsjiDnAzGMCn46JgVIFloLTtH2eplJVUnoVuu8OS
	4LFA==
X-Gm-Message-State: AOAM532ynOIDT00YCZvzyoe1Zvl9vGZdaeDNBTtFQTq/Iwfv8A+uLj9I
	2yptQJG7jdoSz2ZEAkVAzZgV4FS/0Tq4YDJObfmlgqEh
X-Google-Smtp-Source: ABdhPJzFpcKZ7gxPpvWbHLeX+yDGAO+z0M3e9Ie4wZL1ZYs1ZD6Z1sL6H6kyrgyGAgDY+rALZWfqV2f8m6zj+YmqjpM=
X-Received: by 2002:a05:6402:17c7:: with SMTP id
	s7mr3243701edy.57.1590608347983; 
	Wed, 27 May 2020 12:39:07 -0700 (PDT)
MIME-Version: 1.0
From: Vishnu Srinivasa Ramaprasad <srvishnu123@gmail.com>
Date: Thu, 28 May 2020 01:08:56 +0530
Message-ID: <CAKLd27C3yL9XEYrRHD5PqbpJgddMHHWaQLU6u73GYYt1Nwb-2Q@mail.gmail.com>
Subject: 
To: linux-audit@redhat.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============0115508034299768205=="

--===============0115508034299768205==
Content-Type: multipart/alternative; boundary="0000000000008ef35b05a6a65d61"

--0000000000008ef35b05a6a65d61
Content-Type: text/plain; charset="UTF-8"

Hi Steve Grubb and Linux-Audit team,

I'm Vish and I am a newbie to auditd. My requirement is to log only
shell/bash commands and custom commands executed by administrator users.
I have created these rules in /etc/audit/rules.d/audit.rules, to ensure
SYSCALL, EXECVE are being added to audit.log for administrator users with
auid greater than 1000:
-a exit,always -F arch=b64 -S execve -F auid>=1000 -F auid!=-1 -k log_cmd
-a exit,always -F arch=b32 -S execve -F auid>=1000 -F auid!=-1 -k log_cmd

After restarting auditd service, I had executed strace on a simple command
which will display version of my project's toolkit:

~# strace -e trace=execve toolkit-version-show
execve("/var/tmp/toolkit-version-show", ["toolkit-version-show"],
0x7ffef1fa38b0 /* 30 vars */) = 0
Toolkit Version: 1.01
+++ exited with 0 +++

Later, I executed the ausearch command to check the log entry:
~# ausearch -i --start recent
----
type=EXECVE msg=audit(05/27/2020 19:01:26.605:12725) : argc=2
a0=/usr/bin/perl a1=/var/tmp/toolkit-version-show
type=SYSCALL msg=audit(05/27/2020 19:01:26.605:12725) : arch=x86_64
syscall=execve success=yes exit=0 a0=0x7ffef1fa2450 a1=0x7ffef1fa38a0
a2=0x7ffef1fa38b0 a3=0x7f47f8669740 items=3 ppid=3641 pid=3643
auid=administrator uid=root gid=root euid=root suid=root fsuid=root
egid=root sgid=root fsgid=root tty=pts0 ses=8936 comm=toolkit-version-sho
exe=/usr/bin/perl key=log_cmd
----
type=EXECVE msg=audit(05/27/2020 19:01:26.601:12724) : argc=4 a0=strace
a1=-e a2=trace=execve a3=toolkit-version-show
type=SYSCALL msg=audit(05/27/2020 19:01:26.601:12724) : arch=x86_64
syscall=execve success=yes exit=0 a0=0x55a2d44c9010 a1=0x55a2d449fe80
a2=0x55a2d4389490 a3=0x8 items=2 ppid=3099 pid=3641 auid=administrator
uid=root gid=root euid=root suid=root fsuid=root egid=root sgid=root
fsgid=root tty=pts0 ses=8936 comm=strace exe=/usr/bin/strace key=log_cmd
----

My understanding of a0 - a2: Please refer the syntax of execve() :

int execve(const char*filename, char *const argv[], char *const envp[]);

Based on syntax of execve() and output from strace, I could understand that
in audit.log event entry:
a0=0x7ffef1fa2450 represents filename argument of execve
a1=0x7ffef1fa38a0 represents argv[] argument of execve
a2=0x7ffef1fa38b0 represents envp[] argument of execve

Question  1:  What does the a3=0x7f47f8669740  value represent?
As execve() has only 3 arguments (represented by a0,a1,a2), what value gets
stored in a3?
I have noticed a3 values to be varying from:
a3=0x0
a3=0x7
a3=0x55a2d4389490
a3=0x56a2d44adc00
a3=0x8

Question 2: a3=0x8 seems to be the value assigned for a majority of
execve() syscalls.
Is this a standard value set in case of main/primary system call, such as
toolkit-version-show?
Could I use this in a rule filter *-F a3=8* to log only primary (custom
script) command executed by user and not internal commands executed by
custom script like ls, cat, grep.. etc.:
-a exit,always -F arch=b64 -S execve *-F a3=8* -F auid>=1000 -F auid!=-1 -k
log_cmd
-a exit,always -F arch=b32 -S execve *-F a3=8* -F auid>=1000 -F auid!=-1 -k
log_cmd

Would I miss logging a few primary syscalls, if a3 is not 0x80 in some
cases?

Question 3: If a3=0x8 is not a standard value, Is it possible to identify
primary custom command and log only that command, and not internal commands
with a3=0x0 or a3=0x55a2d4389490?

Question 4: Is it possible to filter out and not log syscalls with
tty=(none)?

I am looking forward to your kind response.

Thank You
Regards,
Vish

--0000000000008ef35b05a6a65d61
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p style=3D"margin:0px 0px 1em;padding:0px;border:0px;font=
-variant-numeric:inherit;font-variant-east-asian:inherit;font-stretch:inher=
it;line-height:inherit;font-family:Arial,&quot;Helvetica Neue&quot;,Helveti=
ca,sans-serif;font-size:15px;vertical-align:baseline;box-sizing:inherit;cle=
ar:both;color:rgb(36,39,41)">Hi Steve Grubb and Linux-Audit team,<br><br>I&=
#39;m Vish and I am a newbie to auditd. My requirement is to log only shell=
/bash commands and custom commands executed by administrator users.<br>I ha=
ve created these rules in /etc/audit/rules.d/audit.rules, to ensure SYSCALL=
, EXECVE are being added to audit.log for administrator users with auid gre=
ater than 1000:<br>-a exit,always -F arch=3Db64 -S execve -F auid&gt;=3D100=
0 -F auid!=3D-1 -k log_cmd<br>-a exit,always -F arch=3Db32 -S execve -F aui=
d&gt;=3D1000 -F auid!=3D-1 -k log_cmd<br><br>After restarting auditd servic=
e, I had executed strace on a simple command which will display version of =
my project&#39;s toolkit:<br><br>~# strace -e trace=3Dexecve toolkit-versio=
n-show<br>execve(&quot;/var/tmp/toolkit-version-show&quot;, [&quot;toolkit-=
version-show&quot;], 0x7ffef1fa38b0 /* 30 vars */) =3D 0<br>Toolkit Version=
: 1.01<br>+++ exited with 0 +++<br><br>Later, I executed the ausearch comma=
nd to check the log entry:<br>~#=C2=A0ausearch -i --start recent=C2=A0<br>-=
---<br>type=3DEXECVE msg=3Daudit(05/27/2020 19:01:26.605:12725) : argc=3D2 =
a0=3D/usr/bin/perl a1=3D/var/tmp/toolkit-version-show<br>type=3DSYSCALL msg=
=3Daudit(05/27/2020 19:01:26.605:12725) : arch=3Dx86_64 syscall=3Dexecve su=
ccess=3Dyes exit=3D0 a0=3D0x7ffef1fa2450 a1=3D0x7ffef1fa38a0 a2=3D0x7ffef1f=
a38b0 a3=3D0x7f47f8669740 items=3D3 ppid=3D3641 pid=3D3643 auid=3Dadministr=
ator uid=3Droot gid=3Droot euid=3Droot suid=3Droot fsuid=3Droot egid=3Droot=
 sgid=3Droot fsgid=3Droot tty=3Dpts0 ses=3D8936 comm=3Dtoolkit-version-sho =
exe=3D/usr/bin/perl key=3Dlog_cmd<br>----<br>type=3DEXECVE msg=3Daudit(05/2=
7/2020 19:01:26.601:12724) : argc=3D4 a0=3Dstrace a1=3D-e a2=3Dtrace=3Dexec=
ve a3=3Dtoolkit-version-show<br>type=3DSYSCALL msg=3Daudit(05/27/2020 19:01=
:26.601:12724) : arch=3Dx86_64 syscall=3Dexecve success=3Dyes exit=3D0 a0=
=3D0x55a2d44c9010 a1=3D0x55a2d449fe80 a2=3D0x55a2d4389490 a3=3D0x8 items=3D=
2 ppid=3D3099 pid=3D3641 auid=3Dadministrator uid=3Droot gid=3Droot euid=3D=
root suid=3Droot fsuid=3Droot egid=3Droot sgid=3Droot fsgid=3Droot tty=3Dpt=
s0 ses=3D8936 comm=3Dstrace exe=3D/usr/bin/strace key=3Dlog_cmd<br>----<br>=
<br>My understanding of a0 - a2: Please refer the syntax of execve() :=C2=
=A0</p><p style=3D"margin:0px 0px 1em;padding:0px;border:0px;font-variant-n=
umeric:inherit;font-variant-east-asian:inherit;font-stretch:inherit;line-he=
ight:inherit;font-family:Arial,&quot;Helvetica Neue&quot;,Helvetica,sans-se=
rif;font-size:15px;vertical-align:baseline;box-sizing:inherit;clear:both;co=
lor:rgb(36,39,41)">int execve(const char*filename, char *const argv[], char=
 *const envp[]);<br><br>Based on syntax of execve() and output from strace,=
 I could understand that in audit.log event entry:<br>a0=3D0x7ffef1fa2450 r=
epresents filename argument of execve<br>a1=3D0x7ffef1fa38a0 represents arg=
v[] argument of execve<br>a2=3D0x7ffef1fa38b0 represents envp[] argument of=
 execve<br><br>Question=C2=A0 1:=C2=A0 What does the a3=3D0x7f47f8669740=C2=
=A0 value represent? <br>As execve() has only 3 arguments (represented by a=
0,a1,a2), what value gets stored in a3?<br>I have noticed a3 values to be v=
arying from:<br>a3=3D0x0<br>a3=3D0x7<br>a3=3D0x55a2d4389490<br>a3=3D0x56a2d=
44adc00<br>a3=3D0x8 <br><br>Question 2: a3=3D0x8 seems to be the value assi=
gned for a majority of execve() syscalls.=C2=A0<br>Is this a standard value=
 set in case of main/primary system call, such as toolkit-version-show?<br>=
Could I use this in a rule filter <b>-F a3=3D8</b> to log only primary (cus=
tom script) command executed by user and not internal commands executed by =
custom script like ls, cat, grep.. etc.:<br>-a exit,always -F arch=3Db64 -S=
 execve <b>-F a3=3D8</b> -F auid&gt;=3D1000 -F auid!=3D-1 -k log_cmd<br>-a =
exit,always -F arch=3Db32 -S execve <b>-F a3=3D8</b> -F auid&gt;=3D1000 -F =
auid!=3D-1 -k log_cmd<br><br>Would I miss logging a few primary syscalls, i=
f a3 is not 0x80 in some cases?</p><p style=3D"margin:0px 0px 1em;padding:0=
px;border:0px;font-variant-numeric:inherit;font-variant-east-asian:inherit;=
font-stretch:inherit;line-height:inherit;font-family:Arial,&quot;Helvetica =
Neue&quot;,Helvetica,sans-serif;font-size:15px;vertical-align:baseline;box-=
sizing:inherit;clear:both;color:rgb(36,39,41)">Question 3: If a3=3D0x8 is n=
ot a standard value,=C2=A0Is it possible to identify primary custom command=
 and log only that command, and not internal commands with a3=3D0x0 or a3=
=3D0x55a2d4389490?<br><br>Question 4: Is it possible to filter out and not =
log syscalls with tty=3D(none)?<br><br>I am looking forward to your kind re=
sponse.<br><br>Thank You<br>Regards,<br>Vish<br><br></p></div>

--0000000000008ef35b05a6a65d61--

--===============0115508034299768205==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============0115508034299768205==--

