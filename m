Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 87713182505
	for <lists+linux-audit@lfdr.de>; Wed, 11 Mar 2020 23:36:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583966183;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=55jx520fkWpTwO43jA7uiqz4vobQsuOym+5vDTuVboY=;
	b=GwSUDmVnqREYLl89WExpy+I+3Y2kNv980cMaypZ9JooSxqzC0V6mqxZZv1eYWE+937sgjt
	g9CnItHKVYaLxy72iOCke/aaHwryDNhIu/hfxBty0WnBsFHL9n+Ywwo7pWOPgA347a+B+C
	ALH5roWqLshbendqFs6CvUvFopPk6S8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409--QZaDwgnM9mnEQskQ1MEhg-1; Wed, 11 Mar 2020 18:36:19 -0400
X-MC-Unique: -QZaDwgnM9mnEQskQ1MEhg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADCA3800D4E;
	Wed, 11 Mar 2020 22:36:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0281E27180;
	Wed, 11 Mar 2020 22:36:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1D36218089CE;
	Wed, 11 Mar 2020 22:36:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02BM2F2q026379 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 11 Mar 2020 18:02:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 176992028CD4; Wed, 11 Mar 2020 22:02:15 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 116552028CD2
	for <linux-audit@redhat.com>; Wed, 11 Mar 2020 22:02:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC698800646
	for <linux-audit@redhat.com>; Wed, 11 Mar 2020 22:02:12 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
	[209.85.167.51]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-61-QfIRNfTRPJ-j6E6-bIxZMg-1; Wed, 11 Mar 2020 18:02:09 -0400
X-MC-Unique: QfIRNfTRPJ-j6E6-bIxZMg-1
Received: by mail-lf1-f51.google.com with SMTP id c20so3083236lfb.0
	for <linux-audit@redhat.com>; Wed, 11 Mar 2020 15:02:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=McRPLd6j8Arrw7rZUnDhTwjXm6lOXBlCi4keTPBAlIU=;
	b=eF7KloI/e3ZRMvckwFqhQXkuTFyN0LMEdUNUKdjdW4383Vdpm4AVfbtIUxnwfBQWDN
	082RMsD2St1rsd/apBOi5SPI5cqNyC4YZiDKI2KeFlj/pgnbUT7L8VFZkbeudedffcBg
	8NTgfFF1JFo3X3tCIrYREYTt3JVxsYHi/UpfB58OnSsFgD7hkv/A20QU1At57v1Xfmek
	RBgjncwCX4apoh8bDCgmMu/XRSg4cKKadf5MQfm5TsI6IDequGqyjtKkiU4tnynDyW91
	NYKtaBLJkZ5Mi9o8xuYnotA1BYtchx+XjDwKPM4xHpv1wkxYATA8yGW7yr2wV4yq3+cO
	YbcQ==
X-Gm-Message-State: ANhLgQ1n5oh6UH2K1Qf4HSXz0xe/vq7NZCBw9nq1lPHFa6AumHWswmV3
	I+TnNrMlNRg8KDn2/a78Md1TDqO8vaKtdGK8MWlFlm4E
X-Google-Smtp-Source: ADFU+vu/SM/Z2ikpfoq7alAAjLoZwOpozRDn+OBP7cw6Z87uW4XaYyjQNnFCX7WCpA5xajZDdScQHxiUHjvSTS3/+P0=
X-Received: by 2002:a05:6512:10cf:: with SMTP id
	k15mr3430108lfg.142.1583964127466; 
	Wed, 11 Mar 2020 15:02:07 -0700 (PDT)
MIME-Version: 1.0
From: Aaron Biver <aaron.biver@gmail.com>
Date: Wed, 11 Mar 2020 18:01:54 -0400
Message-ID: <CAMd7AX8ytYZeVdZxUb3RXpgqJdToN9Lj2KVOUN9m9WtZoaiVKQ@mail.gmail.com>
Subject: Bitbake-type build question
To: linux-audit@redhat.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Wed, 11 Mar 2020 18:35:50 -0400
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
Content-Type: multipart/mixed; boundary="===============0819939122083022636=="

--===============0819939122083022636==
Content-Type: multipart/alternative; boundary="00000000000027980d05a09b63b7"

--00000000000027980d05a09b63b7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I'm attempting to cross-compile the 2.8 maintenance branch with petalinux,
which uses bitbake yocto under the hood to build it, and I run it on a
system V target which is a 64 bit arm architecture.  I'm seeing some errors
when I attempt to load rules for system some calls (like open, creat,
rename, link, etc) with auditctl, and I'm not sure how critical these
errors are.  This is my first encounter with linux auditing, and I'll
apologize in advance because I'm sure this is something easy, but I could
not find a way to search the mailing list archives.

These are some of my errors from auditctl's output:
> Syscall name unknown: creat
> There was an error in line 14 of /etc/audit/audit.rules
> Syscall name unknown: link
> There was an error in line 15 of /etc/audit/audit.rules
> Syscall name unknown: open
> There was an error in line 16 of /etc/audit/audit.rules
> Syscall name unknown: open
> There was an error in line 17 of /etc/audit/audit.rules
> Syscall name unknown: rename
> There was an error in line 19 of /etc/audit/audit.rules
> Syscall name unknown: rename
> There was an error in line 20 of /etc/audit/audit.rules

Those lines are below in an excerpt from my rules file (with line numbers
prepended for easy reading):
 13 -w /etc/hostname -p wa -k system-locale
 14 -a always,exit -F arch=3Db64 -S
creat,link,mknod,mkdir,symlink,mknodat,linkat,symlinkat -F exit=3D-EACCES -=
F
key=3Dcreation
 15 -a always,exit -F arch=3Db64 -S link,mkdir,symlink,mkdirat -F exit=3D-E=
PERM
-F key=3Dcreation
 16 -a always,exit -F arch=3Db64 -S open,openat,open_by_handle_at -F
exit=3D-EACCES -F key=3Dopen
 17 -a always,exit -F arch=3Db64 -S open,openat,open_by_handle_at -F
exit=3D-EPERM -F key=3Dopen
 18 -a always,exit -F arch=3Db64 -S close -F exit=3D-EIO -F key=3Dclose
 19 -a always,exit -F arch=3Db64 -S rename -S renameat -S truncate -S chmod
-S setxattr -S lsetxattr -S removexattr -S lremovexattr -F exit=3D-EACCES -=
F
key=3Dmods
 20 -a always,exit -F arch=3Db64 -S rename -S renameat -S truncate -S chmod
-S setxattr -S lsetxattr -S removexattr -S lremovexattr -F exit=3D-EPERM -F
key=3Dmods

The startup script and rules I'm repurposing had rules for open, create,
link, unlink, rename, and others, and it seems like those would be part of
a reasonable auditing security plan, but these system calls do not appear
to be auditable on my system.

My target platform is a 64 bit arm architecture.   I have a bitbake recipe
which uses  the --with-aarch64.
I build the kernel with auditing support (CONFIG_AUDIT and others like it),
and I pass the audit=3D1 argument on the kernel boot command line.

Are there other incantations I am missing?  Any help would be greatly
appreciated.

Aaron

--00000000000027980d05a09b63b7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;m attempting to cross-compile the 2.8 maintenan=
ce branch with petalinux, which uses bitbake yocto under the hood to build =
it, and I run it on a system V target which is a 64 bit arm architecture.=
=C2=A0 I&#39;m seeing some errors when I attempt to load rules for system s=
ome calls (like open, creat, rename, link, etc) with auditctl, and I&#39;m =
not sure how critical these errors are.=C2=A0 This is my first encounter wi=
th linux auditing, and I&#39;ll apologize in advance because I&#39;m sure t=
his is something easy, but I could not find a way to search the mailing lis=
t archives.<br></div><div><br></div><div>These are some of my errors from a=
uditctl&#39;s output:</div><div></div><div>&gt; Syscall name unknown: creat=
<br>&gt; There was an error in line 14 of /etc/audit/audit.rules<br>&gt; Sy=
scall name unknown: link<br>&gt; There was an error in line 15 of /etc/audi=
t/audit.rules<br>&gt; Syscall name unknown: open<br>&gt; There was an error=
 in line 16 of /etc/audit/audit.rules<br>&gt; Syscall name unknown: open<br=
>&gt; There was an error in line 17 of /etc/audit/audit.rules<br></div><div=
></div><div>&gt; Syscall name unknown: rename<br>&gt; There was an error in=
 line 19 of /etc/audit/audit.rules<br>&gt; Syscall name unknown: rename<br>=
&gt; There was an error in line 20 of /etc/audit/audit.rules<br></div><div>=
<br></div><div>Those lines are below in an excerpt from my rules file (with=
 line numbers prepended for easy reading):</div><div>=C2=A013 -w /etc/hostn=
ame -p wa -k system-locale<br>=C2=A014 -a always,exit -F arch=3Db64 -S crea=
t,link,mknod,mkdir,symlink,mknodat,linkat,symlinkat -F exit=3D-EACCES -F ke=
y=3Dcreation<br>=C2=A015 -a always,exit -F arch=3Db64 -S link,mkdir,symlink=
,mkdirat -F exit=3D-EPERM -F key=3Dcreation<br>=C2=A016 -a always,exit -F a=
rch=3Db64 -S open,openat,open_by_handle_at -F exit=3D-EACCES -F key=3Dopen<=
br>=C2=A017 -a always,exit -F arch=3Db64 -S open,openat,open_by_handle_at -=
F exit=3D-EPERM -F key=3Dopen<br>=C2=A018 -a always,exit -F arch=3Db64 -S c=
lose -F exit=3D-EIO -F key=3Dclose<br>=C2=A019 -a always,exit -F arch=3Db64=
 -S rename -S renameat -S truncate -S chmod -S setxattr -S lsetxattr -S rem=
ovexattr -S lremovexattr -F exit=3D-EACCES -F key=3Dmods<br>=C2=A020 -a alw=
ays,exit -F arch=3Db64 -S rename -S renameat -S truncate -S chmod -S setxat=
tr -S lsetxattr -S removexattr -S lremovexattr -F exit=3D-EPERM -F key=3Dmo=
ds <br></div><div><br></div><div>The startup script and rules I&#39;m repur=
posing had rules for open, create, link, unlink, rename, and others, and it=
 seems like those would be part of a reasonable auditing security plan, but=
 these system calls do not appear to be auditable on my system.</div><div><=
br></div><div>My target platform is a 64 bit arm architecture. =C2=A0
I have a bitbake recipe which uses=C2=A0 the --with-aarch64.</div><div></di=
v><div>I build the kernel with auditing support (CONFIG_AUDIT and others li=
ke it), and I pass the audit=3D1 argument on the kernel boot command line. =
<br></div><div><br></div><div>Are there other incantations I am missing?=C2=
=A0 Any help would be greatly appreciated.</div><div><br></div><div>Aaron<b=
r></div><div><br></div><div><br></div><div><br></div><div><br></div></div>

--00000000000027980d05a09b63b7--

--===============0819939122083022636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============0819939122083022636==--

