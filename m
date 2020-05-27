Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 28CB81E4E75
	for <lists+linux-audit@lfdr.de>; Wed, 27 May 2020 21:44:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590608688;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=9pFetct2kWAKr8eYyy/pWZQAXJlRfcces3JaPZy7XaY=;
	b=FFduBsdSOH3XpUEdlctO9JfliRJpvJmv5NX5R6WAUoSHckKnlKKgdVFtNwx6CvnZ04fgAS
	WYUZJ/mmgEeGWZIikQ7reMwalOESsF2CabUvNRccWliwCET1Gy3jrMLpXHJlLQva4k+tvp
	GQvW1K/smXpjnecOwhfiEGMx28gPrGs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-vE5DCk1oOGiAN1NMyklENw-1; Wed, 27 May 2020 15:44:45 -0400
X-MC-Unique: vE5DCk1oOGiAN1NMyklENw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAC248005AA;
	Wed, 27 May 2020 19:44:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C1A0768B0;
	Wed, 27 May 2020 19:44:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 087DB6B4E5;
	Wed, 27 May 2020 19:44:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04RJiX5Q008785 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 27 May 2020 15:44:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3107020110D9; Wed, 27 May 2020 19:44:33 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 20E2C2017E80
	for <linux-audit@redhat.com>; Wed, 27 May 2020 19:44:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D6CEE185A78B
	for <linux-audit@redhat.com>; Wed, 27 May 2020 19:44:30 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
	[209.85.208.43]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-402-2fhRIdJVMGWasPM_104ydA-1; Wed, 27 May 2020 15:44:26 -0400
X-MC-Unique: 2fhRIdJVMGWasPM_104ydA-1
Received: by mail-ed1-f43.google.com with SMTP id e10so21294011edq.0;
	Wed, 27 May 2020 12:44:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=XGKnQrWqq+9Vq6/mUQumw/JKMENWn53HFZWM4b0lyqY=;
	b=uGfVL9maW535yKSTcktjgj9YMXxGzxmEWfr0rvppLHN3mHrdJd4hO4MsRpbvVC6iKl
	c+auksizdTuh1p1Gn4e6t7WEiiTuGrJFMJkiG0uKnwCJPFAoIWBwXwvWa1l7DkeDcrl5
	myedKrF9NVlVVqzmV4JELe6jL+AwwYPZS+F8xvFgVXufAAaQDmGN0gN9rcfdJssF7paH
	iI9BNWlo6sxP6KHK0hr81hsLjs/65AW3Yq00EbZiwLKmz9kazQUvvlwpOs5MVKCWB8hS
	4Z1sFoPiRxi6kYNVl7doNGOB7S1+osDuE6RG72cPM1Xmsj5pB+LlaBBUoRJx4Bg0Qd9h
	6ihg==
X-Gm-Message-State: AOAM531N2oc0nnx2VgRsU73fruX+rhOVz+qbkehYfdZ5L4f9tgQAdbzP
	dJ4sH3Aj5i6qNdA8cGublXryV7af1mC4UQQfCO7FR1sr
X-Google-Smtp-Source: ABdhPJzORJqRids5M1WAhqR3BtmNMywCPD9TjdiLz5BIr3EtK74Rv8gl7m/tCSAiSNyxPTnM8JEV588zgC4G59YQ+2A=
X-Received: by 2002:a50:d785:: with SMTP id w5mr24566198edi.212.1590608664606; 
	Wed, 27 May 2020 12:44:24 -0700 (PDT)
MIME-Version: 1.0
From: Vishnu Srinivasa Ramaprasad <srvishnu123@gmail.com>
Date: Thu, 28 May 2020 01:14:13 +0530
Message-ID: <CAKLd27D7ts_1Orymr50D-qZHhmxs7Jkbb4uh660nCoH4n4WG_w@mail.gmail.com>
Subject: What value gets stored in a3 when -S execve?
To: linux-audit@redhat.com, sgrubb@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============1232440863482396801=="

--===============1232440863482396801==
Content-Type: multipart/alternative; boundary="0000000000006e3d0405a6a67013"

--0000000000006e3d0405a6a67013
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

--0000000000006e3d0405a6a67013
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr" class=3D"gmail_attr"><span style=3D"color=
:rgb(36,39,41);font-family:Arial,&quot;Helvetica Neue&quot;,Helvetica,sans-=
serif;font-size:15px">Hi Steve Grubb and Linux-Audit team,</span><br></div>=
<div dir=3D"ltr"><p style=3D"margin:0px 0px 1em;padding:0px;border:0px;font=
-variant-numeric:inherit;font-variant-east-asian:inherit;font-stretch:inher=
it;line-height:inherit;font-family:Arial,&quot;Helvetica Neue&quot;,Helveti=
ca,sans-serif;font-size:15px;vertical-align:baseline;box-sizing:inherit;cle=
ar:both;color:rgb(36,39,41)"><br>I&#39;m Vish and I am a newbie to auditd. =
My requirement is to log only shell/bash commands and custom commands execu=
ted by administrator users.<br>I have created these rules in /etc/audit/rul=
es.d/audit.rules, to ensure SYSCALL, EXECVE are being added to audit.log fo=
r administrator users with auid greater than 1000:<br>-a exit,always -F arc=
h=3Db64 -S execve -F auid&gt;=3D1000 -F auid!=3D-1 -k log_cmd<br>-a exit,al=
ways -F arch=3Db32 -S execve -F auid&gt;=3D1000 -F auid!=3D-1 -k log_cmd<br=
><br>After restarting auditd service, I had executed strace on a simple com=
mand which will display version of my project&#39;s toolkit:<br><br>~# stra=
ce -e trace=3Dexecve toolkit-version-show<br>execve(&quot;/var/tmp/toolkit-=
version-show&quot;, [&quot;toolkit-version-show&quot;], 0x7ffef1fa38b0 /* 3=
0 vars */) =3D 0<br>Toolkit Version: 1.01<br>+++ exited with 0 +++<br><br>L=
ater, I executed the ausearch command to check the log entry:<br>~#=C2=A0au=
search -i --start recent=C2=A0<br>----<br>type=3DEXECVE msg=3Daudit(05/27/2=
020 19:01:26.605:12725) : argc=3D2 a0=3D/usr/bin/perl a1=3D/var/tmp/toolkit=
-version-show<br>type=3DSYSCALL msg=3Daudit(05/27/2020 19:01:26.605:12725) =
: arch=3Dx86_64 syscall=3Dexecve success=3Dyes exit=3D0 a0=3D0x7ffef1fa2450=
 a1=3D0x7ffef1fa38a0 a2=3D0x7ffef1fa38b0 a3=3D0x7f47f8669740 items=3D3 ppid=
=3D3641 pid=3D3643 auid=3Dadministrator uid=3Droot gid=3Droot euid=3Droot s=
uid=3Droot fsuid=3Droot egid=3Droot sgid=3Droot fsgid=3Droot tty=3Dpts0 ses=
=3D8936 comm=3Dtoolkit-version-sho exe=3D/usr/bin/perl key=3Dlog_cmd<br>---=
-<br>type=3DEXECVE msg=3Daudit(05/27/2020 19:01:26.601:12724) : argc=3D4 a0=
=3Dstrace a1=3D-e a2=3Dtrace=3Dexecve a3=3Dtoolkit-version-show<br>type=3DS=
YSCALL msg=3Daudit(05/27/2020 19:01:26.601:12724) : arch=3Dx86_64 syscall=
=3Dexecve success=3Dyes exit=3D0 a0=3D0x55a2d44c9010 a1=3D0x55a2d449fe80 a2=
=3D0x55a2d4389490 a3=3D0x8 items=3D2 ppid=3D3099 pid=3D3641 auid=3Dadminist=
rator uid=3Droot gid=3Droot euid=3Droot suid=3Droot fsuid=3Droot egid=3Droo=
t sgid=3Droot fsgid=3Droot tty=3Dpts0 ses=3D8936 comm=3Dstrace exe=3D/usr/b=
in/strace key=3Dlog_cmd<br>----<br><br>My understanding of a0 - a2: Please =
refer the syntax of execve() :=C2=A0</p><p style=3D"margin:0px 0px 1em;padd=
ing:0px;border:0px;font-variant-numeric:inherit;font-variant-east-asian:inh=
erit;font-stretch:inherit;line-height:inherit;font-family:Arial,&quot;Helve=
tica Neue&quot;,Helvetica,sans-serif;font-size:15px;vertical-align:baseline=
;box-sizing:inherit;clear:both;color:rgb(36,39,41)">int execve(const char*f=
ilename, char *const argv[], char *const envp[]);<br><br>Based on syntax of=
 execve() and output from strace, I could understand that in audit.log even=
t entry:<br>a0=3D0x7ffef1fa2450 represents filename argument of execve<br>a=
1=3D0x7ffef1fa38a0 represents argv[] argument of execve<br>a2=3D0x7ffef1fa3=
8b0 represents envp[] argument of execve<br><br>Question=C2=A0 1:=C2=A0 Wha=
t does the a3=3D0x7f47f8669740=C2=A0 value represent? <br>As execve() has o=
nly 3 arguments (represented by a0,a1,a2), what value gets stored in a3?<br=
>I have noticed a3 values to be varying from:<br>a3=3D0x0<br>a3=3D0x7<br>a3=
=3D0x55a2d4389490<br>a3=3D0x56a2d44adc00<br>a3=3D0x8 <br><br>Question 2: a3=
=3D0x8 seems to be the value assigned for a majority of execve() syscalls.=
=C2=A0<br>Is this a standard value set in case of main/primary system call,=
 such as toolkit-version-show?<br>Could I use this in a rule filter <b>-F a=
3=3D8</b> to log only primary (custom script) command executed by user and =
not internal commands executed by custom script like ls, cat, grep.. etc.:<=
br>-a exit,always -F arch=3Db64 -S execve <b>-F a3=3D8</b> -F auid&gt;=3D10=
00 -F auid!=3D-1 -k log_cmd<br>-a exit,always -F arch=3Db32 -S execve <b>-F=
 a3=3D8</b> -F auid&gt;=3D1000 -F auid!=3D-1 -k log_cmd<br><br>Would I miss=
 logging a few primary syscalls, if a3 is not 0x80 in some cases?</p><p sty=
le=3D"margin:0px 0px 1em;padding:0px;border:0px;font-variant-numeric:inheri=
t;font-variant-east-asian:inherit;font-stretch:inherit;line-height:inherit;=
font-family:Arial,&quot;Helvetica Neue&quot;,Helvetica,sans-serif;font-size=
:15px;vertical-align:baseline;box-sizing:inherit;clear:both;color:rgb(36,39=
,41)">Question 3: If a3=3D0x8 is not a standard value,=C2=A0Is it possible =
to identify primary custom command and log only that command, and not inter=
nal commands with a3=3D0x0 or a3=3D0x55a2d4389490?<br><br>Question 4: Is it=
 possible to filter out and not log syscalls with tty=3D(none)?<br><br>I am=
 looking forward to your kind response.<br><br>Thank You<br>Regards,<br>Vis=
h<br></p></div></div>

--0000000000006e3d0405a6a67013--

--===============1232440863482396801==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============1232440863482396801==--

