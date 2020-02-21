Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id CF5A6166B41
	for <lists+linux-audit@lfdr.de>; Fri, 21 Feb 2020 01:05:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582243514;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=pgGXDh++znVP1qYxgf0nxAXqzsA8r0a0hDoiKHkjPpE=;
	b=GJwnJPYOcAZ6p58WGQFKFrY345Tw92cjH3Sp28ZNm6CsigNyDtkpofW3z5A234pFSCWLAy
	aEt1TD/yTIoRHtY4/WyUR6J32MyCstzFpCxZH/0nhGAvD7H3/PSzotm5DJEzC0fM8i+uyF
	fvMczVW2UeDXurU/W9EIoqTmkdKsy+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-JkR98m2YM_y_we7aJtJu-Q-1; Thu, 20 Feb 2020 19:05:11 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C29B800D55;
	Fri, 21 Feb 2020 00:05:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F26560BE1;
	Fri, 21 Feb 2020 00:05:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 72F5918089CD;
	Fri, 21 Feb 2020 00:05:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01L04tLX024412 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 20 Feb 2020 19:04:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2D0542166B2C; Fri, 21 Feb 2020 00:04:55 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 286772166B2B
	for <linux-audit@redhat.com>; Fri, 21 Feb 2020 00:04:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74C44800658
	for <linux-audit@redhat.com>; Fri, 21 Feb 2020 00:04:52 +0000 (UTC)
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
	[209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-48-1cyX_HE8MNyldKdFweb7og-1; Thu, 20 Feb 2020 19:04:49 -0500
X-MC-Unique: 1cyX_HE8MNyldKdFweb7og-1
X-MC-Unique: JkR98m2YM_y_we7aJtJu-Q-1
Received: by mail-vk1-f198.google.com with SMTP id e25so216528vkm.2
	for <linux-audit@redhat.com>; Thu, 20 Feb 2020 16:04:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yoTLckXHJwB83+bMwCI9OL414gmszTDKy/MRW8B273k=;
	b=nr+Kif/Fd048jD7x7pORR/4hLw68ut5iQQ6Ai1QCSAbqXiBefDrYaJAdWlV6KEmxCe
	LvYtPHItm2NieWlUc7+lsozrUJfMg3KZYo0dkBMusatZhhBylpL3sSv++cEtqDv1DTc7
	p4teB/XZioib+HoT5uml6dK9Uq5kBqIv1SoJ9bz67e/a1kekN37c1z+PbD22Lgy2jbat
	gbiKfycoFqeW7jSUbNSJ+cuD7hVO+S8geQWcxiXTRQA8VN5p9+kWb4zo+DbcbK3wR9dk
	gC8TsIZIMZ9Qe1Y4qmtZxuX/c7LKeHpNtY4bv/TgOecDJWEGnGaUq1BPp/E6ZicnoDGW
	d8ZQ==
X-Gm-Message-State: APjAAAWcL+jodSLiYV1CdpFdE3zOJP97Jl71bZcqsAuPy0vXnlyqdxyl
	TO6F1CqP1WlD/R2P+/es/5qHa4NWgyIkEAPLJeFJ3uIt4S4sm7I0tuRU6YShMzevFjeHXQfD0+0
	UB0fJQZUQAhIqHpmyl48lAOI4zj3Ug3v6dZo=
X-Received: by 2002:ab0:1c0e:: with SMTP id a14mr16746197uaj.141.1582243488644;
	Thu, 20 Feb 2020 16:04:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqy8wROMeejizH8jHK1ltzk0K+vO8WwHBb5/QWBCeArG33qq50Zw+r6hbQMB0orZVWMT8kzg3WE8bWCUhQL0LkY=
X-Received: by 2002:ab0:1c0e:: with SMTP id a14mr16746184uaj.141.1582243488342;
	Thu, 20 Feb 2020 16:04:48 -0800 (PST)
MIME-Version: 1.0
References: <CAM5ObREwVjihySamgkSGOxBK8Rwe0jgra5+Ec5ZHK5J5XzD_Ow@mail.gmail.com>
	<2400991.fjeXDc8RHV@x2>
In-Reply-To: <2400991.fjeXDc8RHV@x2>
From: Moshe Rechtman <mrechtma@redhat.com>
Date: Fri, 21 Feb 2020 02:04:37 +0200
Message-ID: <CAM5ObRF7HEK2qyCX+bbW_CTVwuEbmrCJVKg9mHQZkHUcJXRWwA@mail.gmail.com>
Subject: Re: Question about excluding rules
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============4727689118640351901=="

--===============4727689118640351901==
Content-Type: multipart/alternative; boundary="000000000000123e40059f0ac517"

--000000000000123e40059f0ac517
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Steve,

Thanks for the quick response.
Those particular logs generated by a third party monitoring application
named Microfocus, which keeps on running "ps -auxwwww" command and filling
up quickly the audit log.

Please your advice..

Thanks in adbance,
Kind regards,
Moshe



=D7=91=D7=AA=D7=90=D7=A8=D7=99=D7=9A =D7=99=D7=95=D7=9D =D7=95=D7=B3, 21 =
=D7=91=D7=A4=D7=91=D7=A8=D7=B3 2020, 01:41, =D7=9E=D7=90=D7=AA Steve Grubb =
=E2=80=8F<sgrubb@redhat.com>:

> On Thursday, February 20, 2020 6:36:46 PM EST Moshe Rechtman wrote:
> > Hello Experts,
> >
> > We have a big customer that facing the following issue on RHEL 6.2.
> > As per customer request I've configured the following rules:
> >
> > $ cat audit.rules
> >
> > # This file contains the auditctl rules that are loaded
> > # whenever the audit daemon is started via the initscripts.
> > # The rules are simply the parameters that would be passed
> > # to auditctl.
> >
> > # First rule - delete all
> > -D
> >
> > # Increase the buffers to survive stress events.
> > # Make this bigger for busy systems
> > -b 320
> >
> > # Feel free to add below this line. See auditctl man page
> >
> > -a exit,always -F arch=3Db64 -F euid=3D0 -S execve -k rootact
> > -a exit,always -F arch=3Db32 -F euid=3D0 -S execve -k rootact
> > -a exit,always -F arch=3Db64 -F euid>=3D500 -S execve -k useract
> > -a exit,always -F arch=3Db32 -F euid>=3D500 -S execve -k useract
> >
> >
> > Audit start working as expected. Now customer is asking to exclude/igno=
re
> > the following from audit logs:
> >
> > type=3DSYSCALL msg=3Daudit(1581664357.597:257516): arch=3Dc000003e
> > syscall=3D59 success=3Dyes exit=3D0 a0=3D3869161ea3 a1=3D7ffd15530c20
> > a2=3D7ffd15534348 a3=3D3869617240 items=3D2 ppid=3D3350 pid=3D59266
> > auid=3D4294967295 uid=3D0 gid=3D0 euid=3D0 suid=3D0 fsuid=3D0 egid=3D0 =
sgid=3D0
> > fsgid=3D0 tty=3D(none) ses=3D4294967295 comm=3D"sh" exe=3D"/bin/bash"
> > key=3D"rootact"
> > type=3DEXECVE msg=3Daudit(1581664357.597:257516): argc=3D3 a0=3D"sh" a1=
=3D"-c"
> > a2=3D2F62696E2F70732061757877777777
> > type=3DCWD msg=3Daudit(1581664357.597:257516):
> > cwd=3D"/opt/microfocus/Discovery/bin" type=3DPATH
> > msg=3Daudit(1581664357.597:257516): item=3D0 name=3D"/bin/sh" inode=3D3=
98
> > dev=3Dfd:01 mode=3D0100755 ouid=3D0 ogid=3D0 rdev=3D00:00
> > nametype=3DNORMAL
> > type=3DPATH msg=3Daudit(1581664357.597:257516): item=3D1 name=3D(null)
> > inode=3D4481 dev=3Dfd:01 mode=3D0100755 ouid=3D0 ogid=3D0 rdev=3D00:00
> > nametype=3DNORMAL
> >
> > ype=3DSYSCALL msg=3Daudit(1581664357.601:257517): arch=3Dc000003e sysca=
ll=3D59
> > success=3Dyes exit=3D0 a0=3D155c2f0 a1=3D155b8d0 a2=3D155b460 a3=3D18 i=
tems=3D2
> > ppid=3D3350 pid=3D59266 auid=3D4294967295 uid=3D0 gid=3D0 euid=3D0 suid=
=3D0 fsuid=3D0
> > egid=3D0 sgid=3D0 fsgid=3D0 tty=3D(none) ses=3D4294967295 comm=3D"ps"
> > exe=3D"/bin/ps" key=3D"rootact"
> > type=3DEXECVE msg=3Daudit(1581664357.601:257517): argc=3D2 a0=3D"/bin/p=
s"
> > a1=3D"auxwwww" type=3DCWD msg=3Daudit(1581664357.601:257517):
> > cwd=3D"/opt/microfocus/Discovery/bin" type=3DPATH
> > msg=3Daudit(1581664357.601:257517): item=3D0 name=3D"/bin/ps" inode=3D1=
451
> > dev=3Dfd:01 mode=3D0100755 ouid=3D0 ogid=3D0 rdev=3D00:00
> > nametype=3DNORMAL
> > type=3DPATH msg=3Daudit(1581664357.601:257517): item=3D1 name=3D(null)
> > inode=3D4481 dev=3Dfd:01 mode=3D0100755 ouid=3D0 ogid=3D0 rdev=3D00:00
> > nametype=3DNORMAL
> >
> > What would be the best way to exclude such audit?
> > Your help would be much appreciated.
>
> What's objectionable about these events? The fact that its got a key says
> they think they wanted it.
>
> -Steve
>
>
>
>

--000000000000123e40059f0ac517
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto">Hello Steve,</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">Thanks for the quick response.=C2=A0</div><div dir=
=3D"auto">Those particular logs generated by a third party monitoring appli=
cation named Microfocus, which keeps on running &quot;ps -auxwwww&quot; com=
mand and filling up quickly the audit log.</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Please your advice..</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Thanks in adbance,</div><div dir=3D"auto">Kind regards,</di=
v><div dir=3D"auto">Moshe</div><div dir=3D"auto"><br></div><div dir=3D"auto=
"><br></div><div dir=3D"auto"><br><div class=3D"gmail_quote" dir=3D"auto"><=
div dir=3D"ltr" class=3D"gmail_attr">=D7=91=D7=AA=D7=90=D7=A8=D7=99=D7=9A =
=D7=99=D7=95=D7=9D =D7=95=D7=B3, 21 =D7=91=D7=A4=D7=91=D7=A8=D7=B3 2020, 01=
:41, =D7=9E=D7=90=D7=AA Steve Grubb =E2=80=8F&lt;<a href=3D"mailto:sgrubb@r=
edhat.com" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">sgrub=
b@redhat.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thursday, =
February 20, 2020 6:36:46 PM EST Moshe Rechtman wrote:<br>
&gt; Hello Experts,<br>
&gt; <br>
&gt; We have a big customer that facing the following issue on RHEL 6.2.<br=
>
&gt; As per customer request I&#39;ve configured the following rules:<br>
&gt; <br>
&gt; $ cat audit.rules<br>
&gt; <br>
&gt; # This file contains the auditctl rules that are loaded<br>
&gt; # whenever the audit daemon is started via the initscripts.<br>
&gt; # The rules are simply the parameters that would be passed<br>
&gt; # to auditctl.<br>
&gt; <br>
&gt; # First rule - delete all<br>
&gt; -D<br>
&gt; <br>
&gt; # Increase the buffers to survive stress events.<br>
&gt; # Make this bigger for busy systems<br>
&gt; -b 320<br>
&gt; <br>
&gt; # Feel free to add below this line. See auditctl man page<br>
&gt; <br>
&gt; -a exit,always -F arch=3Db64 -F euid=3D0 -S execve -k rootact<br>
&gt; -a exit,always -F arch=3Db32 -F euid=3D0 -S execve -k rootact<br>
&gt; -a exit,always -F arch=3Db64 -F euid&gt;=3D500 -S execve -k useract<br=
>
&gt; -a exit,always -F arch=3Db32 -F euid&gt;=3D500 -S execve -k useract<br=
>
&gt; <br>
&gt; <br>
&gt; Audit start working as expected. Now customer is asking to exclude/ign=
ore<br>
&gt; the following from audit logs:<br>
&gt; <br>
&gt; type=3DSYSCALL msg=3Daudit(1581664357.597:257516): arch=3Dc000003e<br>
&gt; syscall=3D59 success=3Dyes exit=3D0 a0=3D3869161ea3 a1=3D7ffd15530c20<=
br>
&gt; a2=3D7ffd15534348 a3=3D3869617240 items=3D2 ppid=3D3350 pid=3D59266<br=
>
&gt; auid=3D4294967295 uid=3D0 gid=3D0 euid=3D0 suid=3D0 fsuid=3D0 egid=3D0=
 sgid=3D0<br>
&gt; fsgid=3D0 tty=3D(none) ses=3D4294967295 comm=3D&quot;sh&quot; exe=3D&q=
uot;/bin/bash&quot;<br>
&gt; key=3D&quot;rootact&quot;<br>
&gt; type=3DEXECVE msg=3Daudit(1581664357.597:257516): argc=3D3 a0=3D&quot;=
sh&quot; a1=3D&quot;-c&quot;<br>
&gt; a2=3D2F62696E2F70732061757877777777<br>
&gt; type=3DCWD msg=3Daudit(1581664357.597:257516): <br>
&gt; cwd=3D&quot;/opt/microfocus/Discovery/bin&quot; type=3DPATH<br>
&gt; msg=3Daudit(1581664357.597:257516): item=3D0 name=3D&quot;/bin/sh&quot=
; inode=3D398<br>
&gt; dev=3Dfd:01 mode=3D0100755 ouid=3D0 ogid=3D0 rdev=3D00:00<br>
&gt; nametype=3DNORMAL<br>
&gt; type=3DPATH msg=3Daudit(1581664357.597:257516): item=3D1 name=3D(null)=
<br>
&gt; inode=3D4481 dev=3Dfd:01 mode=3D0100755 ouid=3D0 ogid=3D0 rdev=3D00:00=
<br>
&gt; nametype=3DNORMAL<br>
&gt; <br>
&gt; ype=3DSYSCALL msg=3Daudit(1581664357.601:257517): arch=3Dc000003e sysc=
all=3D59<br>
&gt; success=3Dyes exit=3D0 a0=3D155c2f0 a1=3D155b8d0 a2=3D155b460 a3=3D18 =
items=3D2<br>
&gt; ppid=3D3350 pid=3D59266 auid=3D4294967295 uid=3D0 gid=3D0 euid=3D0 sui=
d=3D0 fsuid=3D0<br>
&gt; egid=3D0 sgid=3D0 fsgid=3D0 tty=3D(none) ses=3D4294967295 comm=3D&quot=
;ps&quot;<br>
&gt; exe=3D&quot;/bin/ps&quot; key=3D&quot;rootact&quot;<br>
&gt; type=3DEXECVE msg=3Daudit(1581664357.601:257517): argc=3D2 a0=3D&quot;=
/bin/ps&quot;<br>
&gt; a1=3D&quot;auxwwww&quot; type=3DCWD msg=3Daudit(1581664357.601:257517)=
: <br>
&gt; cwd=3D&quot;/opt/microfocus/Discovery/bin&quot; type=3DPATH<br>
&gt; msg=3Daudit(1581664357.601:257517): item=3D0 name=3D&quot;/bin/ps&quot=
; inode=3D1451<br>
&gt; dev=3Dfd:01 mode=3D0100755 ouid=3D0 ogid=3D0 rdev=3D00:00<br>
&gt; nametype=3DNORMAL<br>
&gt; type=3DPATH msg=3Daudit(1581664357.601:257517): item=3D1 name=3D(null)=
<br>
&gt; inode=3D4481 dev=3Dfd:01 mode=3D0100755 ouid=3D0 ogid=3D0 rdev=3D00:00=
<br>
&gt; nametype=3DNORMAL<br>
&gt; <br>
&gt; What would be the best way to exclude such audit?<br>
&gt; Your help would be much appreciated.<br>
<br>
What&#39;s objectionable about these events? The fact that its got a key sa=
ys <br>
they think they wanted it.<br>
<br>
-Steve<br>
<br>
<br>
<br>
</blockquote></div></div></div>

--000000000000123e40059f0ac517--

--===============4727689118640351901==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============4727689118640351901==--

