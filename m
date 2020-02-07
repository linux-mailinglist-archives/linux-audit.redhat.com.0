Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 34962155E94
	for <lists+linux-audit@lfdr.de>; Fri,  7 Feb 2020 20:28:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581103689;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=cWdnfAcjb3yKit9LEqUhl6RXAznMqcXCv2oLuZ7VcDA=;
	b=ZZvCMK4JVSkZn5aJ2ypUQP6D87ip8MDRooqsDl/7lbdeaaUns4KgKbDWnvXRf0iStEVICf
	zwWg5ef7NqW6wttGonfrgU25JjI31LE2DsOwMVgClPvOvmv0TXOqu2QsqQQyWmTJtHqbZ0
	ci+dUAYKCNlWTlVCLR0UTgbrn0R29cg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-K5bNwtfvNIqRuJbMue2VfA-1; Fri, 07 Feb 2020 14:28:05 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CAA3C801E76;
	Fri,  7 Feb 2020 19:28:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A6D50790D7;
	Fri,  7 Feb 2020 19:27:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8C6AB1803C33;
	Fri,  7 Feb 2020 19:27:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 017JRqVi016347 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 7 Feb 2020 14:27:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 344112166B27; Fri,  7 Feb 2020 19:27:52 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3036E2166B2A
	for <linux-audit@redhat.com>; Fri,  7 Feb 2020 19:27:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2D101011A6A
	for <linux-audit@redhat.com>; Fri,  7 Feb 2020 19:27:49 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
	[209.85.166.173]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-331-CL72h3k1NoyYvjxhrnGxqg-1; Fri, 07 Feb 2020 14:27:45 -0500
Received: by mail-il1-f173.google.com with SMTP id s85so483935ill.11;
	Fri, 07 Feb 2020 11:27:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=75Ono+oRBXbXPKt0sMsxxl0QhXBzJz2oi+wEUdZT7JA=;
	b=evzTlC1DAxBMbCdzxwRcYbDCMGT/bod59wt1kwPoGQvGaIDkKHA4InnlEmeUI4tVLR
	YerjpxUM9fZe5O1FPjKGrxHgil6KIUsRoxW7HQo3NPeREShhkXwd6c7ojymDLHlTvTAr
	hPGA20rqcwO55Q9NJArHEVef21F7LHhEXcBcxDkpH007IW0UVanGGHgEJZaU2cSshfG/
	J3S1kQpYr+f9zddb8jIvrixv4kLm9M0Y7TSj8siEfWxKngVG1VSt45sDVRFTaZmWLeCR
	65BKcrHPsb8t7+HxodtfaNK1fkTpbERPgJzbDb9UNc29lm+GLfjewgo6EIcWBFDVoq9M
	v80w==
X-Gm-Message-State: APjAAAXXFZrW+ZAJ44eFAwP5+NGuXxp2qsGiHy2A2HYHAsWVhVmOUKpi
	fzPjO3TRRioO1UTA3sHVX0jUAcAzQj1wpQz2hJWgCAwr
X-Google-Smtp-Source: APXvYqyHHQhF6ZkixRnVoCbInx0y1sqKB2S7aJCrcD8WDwVOI3Qgrc8Twq91zCpvyTKDcFb1tBaFPJz/toneFpB7ALs=
X-Received: by 2002:a92:4982:: with SMTP id k2mr946795ilg.57.1581103663942;
	Fri, 07 Feb 2020 11:27:43 -0800 (PST)
MIME-Version: 1.0
References: <5F4EE10832231F4F921A255C1D95429829B091@DEERLM99EX7MSX.ww931.my-it-solutions.net>
	<2537219.Lru4QqDhYW@x2>
In-Reply-To: <2537219.Lru4QqDhYW@x2>
From: "warron.french" <warron.french@gmail.com>
Date: Fri, 7 Feb 2020 14:27:30 -0500
Message-ID: <CAJdJdQk3OD0hPWyTL_HJ0XkgYLSKOeT8d4k8yXnQ8w2Gm4DGpA@mail.gmail.com>
Subject: Re: audisp-remote
To: Steve Grubb <sgrubb@redhat.com>
X-MC-Unique: CL72h3k1NoyYvjxhrnGxqg-1
X-MC-Unique: K5bNwtfvNIqRuJbMue2VfA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: Linux Audit <linux-audit@redhat.com>, "MAUPERTUIS,
	PHILIPPE" <philippe.maupertuis@equensworldline.com>
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
Content-Type: multipart/mixed; boundary="===============8057277619980992767=="

--===============8057277619980992767==
Content-Type: multipart/alternative; boundary="0000000000003e119b059e0162df"

--0000000000003e119b059e0162df
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Philippe, by "managing and using" the audit logs after centralizing, what
do you mean?

You can centralize logfiles using *rsyslog *to a "central" (r)*syslog*
server, then you can find the logs in whatever path you decided to store
them and use the ausearch command and seek out whatever records you want
based on audit record details you can query.

It is important though to fully and discretely articulate what you mean by
"managing and using" audit logs after centralizing.
Perhaps what you mean by managing is:  logrotation?
Perhaps what you mean by using is: query audit-record data based on
specific filter-capable details?


--------------------------
Warron French



On Fri, Feb 7, 2020 at 2:15 PM Steve Grubb <sgrubb@redhat.com> wrote:

> On Friday, February 7, 2020 5:02:01 AM EST MAUPERTUIS, PHILIPPE wrote:
> > Apart the man pages, I didn=E2=80=99t find anything useful relating to
> > audisp-remote. I am searching information on how it scales ? Is there a=
ny
> > performance issue ? How to use it in a large environment ?
>
> It is really designed for smaller deployments. If you have 10 or so
> systems,
> it should do OK. I have not tested load handling of the daemon via networ=
k
> sources. But have tested the ability to write logs and its very fast. Fas=
t
> enough to fill your hard drive in a minute or so.
>
> > Most of what I found dated a long time ago and mainly said use rsyslog
> > instead. It seems that centralizing the messages through rsyslog is far
> > more popular. Is audisp-remote really used ?
>
> For small deployments sure. If you really have a lot, then you probably
> should use some kind of subsystem designed to handle large amounts of
> data.
> ELK, graylog, splunk are all a couple that come to mind. I also suspect
> you
> want audit data correlated with other application information.
>
> The main issues at scale are log management, searching, and alerting.
> These
> are all problems that one person hacking on spare time can't really
> achieve
> well. If we had a stronger community with more participants, we probably
> would have better and nicer tools.
>
> > The man page read :
> >        tcp_max_per_addr
> >               This  is  a  numeric  value  which  indicates  how many
> > concurrent connections from one IP address is allowed.  The default is =
1
> > and the maximum is 1024. Setting this too large may allow for a Denial =
of
> > Service attack on  the  log=E2=80=90 ging  server.  Also  note  that th=
e kernel
> > has an internal maximum that will eventually prevent this even if audit=
d
> > allows it by config. The default should be adequate in most cases unles=
s
> a
> > custom written recovery script  runs  to forward unsent events. In this
> > case you would increase the number only large enough to let it in too.
> > Where could I find an example of recovery script ?
> > Could it be a way to inject the audit message in auditd after having
> > receiving them via rsyslog ? This might be useful just because, by
> default
> > ausearch in all available logs and the -if parameter accepts only one
> > file.
>
> I think you can inject logs by
>
> ausearch --start XXX --raw | audisp-remote
>
>
> > Maybe my lack of knowledge about auditd leads me to write rubbish.
> > If so, please direct me to where I can find how to manage and use audit
> > logs after centralizing them. Not only keeping them but  acutually usin=
g
> > them.
>
> There may be others in the community that can offer some insight here.
>
> -Steve
>
>
>
> --
> Linux-audit mailing list
> Linux-audit@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-audit

--0000000000003e119b059e0162df
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Philippe, by &quot;managing and using&quot; the audit logs=
 after centralizing, what do you=C2=A0mean?<div><br></div><div>You can cent=
ralize logfiles using <b>rsyslog </b>to a &quot;central&quot; (r)<i>syslog<=
/i> server, then you can find the logs in whatever path you decided to stor=
e them and use the ausearch command and seek out whatever records you want =
based on audit record details you can query.</div><div><br></div><div>It is=
 important though to fully and discretely articulate what you mean by &quot=
;managing and using&quot; audit logs after centralizing.</div><div>Perhaps =
what you mean by managing is:=C2=A0 logrotation?</div><div>Perhaps what you=
 mean by using is: query audit-record data based on specific filter-capable=
 details?</div><div><br></div><div><br></div><div><div><div dir=3D"ltr" cla=
ss=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">=
--------------------------<br><font color=3D"#000099" size=3D"4">Warron Fre=
nch<br><font size=3D"4"><font size=3D"4"><font size=3D"4"><br></font></font=
></font></font></div></div></div><br></div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 7, 2020 at 2:15 PM S=
teve Grubb &lt;<a href=3D"mailto:sgrubb@redhat.com">sgrubb@redhat.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri=
day, February 7, 2020 5:02:01 AM EST MAUPERTUIS, PHILIPPE wrote:<br>
&gt; Apart the man pages, I didn=E2=80=99t find anything useful relating to=
<br>
&gt; audisp-remote. I am searching information on how it scales ? Is there =
any<br>
&gt; performance issue ? How to use it in a large environment ?<br>
<br>
It is really designed for smaller deployments. If you have 10 or so systems=
, <br>
it should do OK. I have not tested load handling of the daemon via network =
<br>
sources. But have tested the ability to write logs and its very fast. Fast =
<br>
enough to fill your hard drive in a minute or so.<br>
<br>
&gt; Most of what I found dated a long time ago and mainly said use rsyslog=
<br>
&gt; instead. It seems that centralizing the messages through rsyslog is fa=
r<br>
&gt; more popular. Is audisp-remote really used ?<br>
<br>
For small deployments sure. If you really have a lot, then you probably <br=
>
should use some kind of subsystem designed to handle large amounts of data.=
 <br>
ELK, graylog, splunk are all a couple that come to mind. I also suspect you=
 <br>
want audit data correlated with other application information.<br>
<br>
The main issues at scale are log management, searching, and alerting. These=
 <br>
are all problems that one person hacking on spare time can&#39;t really ach=
ieve <br>
well. If we had a stronger community with more participants, we probably <b=
r>
would have better and nicer tools.<br>
<br>
&gt; The man page read :<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcp_max_per_addr<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This=C2=A0 is=C2=
=A0 a=C2=A0 numeric=C2=A0 value=C2=A0 which=C2=A0 indicates=C2=A0 how many<=
br>
&gt; concurrent connections from one IP address is allowed.=C2=A0 The defau=
lt is 1<br>
&gt; and the maximum is 1024. Setting this too large may allow for a Denial=
 of<br>
&gt; Service attack on=C2=A0 the=C2=A0 log=E2=80=90 ging=C2=A0 server.=C2=
=A0 Also=C2=A0 note=C2=A0 that the kernel<br>
&gt; has an internal maximum that will eventually prevent this even if audi=
td<br>
&gt; allows it by config. The default should be adequate in most cases unle=
ss a<br>
&gt; custom written recovery script=C2=A0 runs=C2=A0 to forward unsent even=
ts. In this<br>
&gt; case you would increase the number only large enough to let it in too.=
<br>
&gt; Where could I find an example of recovery script ?<br>
&gt; Could it be a way to inject the audit message in auditd after having<b=
r>
&gt; receiving them via rsyslog ? This might be useful just because, by def=
ault<br>
&gt; ausearch in all available logs and the -if parameter accepts only one<=
br>
&gt; file.<br>
<br>
I think you can inject logs by <br>
<br>
ausearch --start XXX --raw | audisp-remote<br>
<br>
<br>
&gt; Maybe my lack of knowledge about auditd leads me to write rubbish.<br>
&gt; If so, please direct me to where I can find how to manage and use audi=
t<br>
&gt; logs after centralizing them. Not only keeping them but=C2=A0 acutuall=
y using<br>
&gt; them.<br>
<br>
There may be others in the community that can offer some insight here.<br>
<br>
-Steve<br>
<br>
<br>
<br>
--<br>
Linux-audit mailing list<br>
<a href=3D"mailto:Linux-audit@redhat.com" target=3D"_blank">Linux-audit@red=
hat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-audit" rel=3D"nore=
ferrer" target=3D"_blank">https://www.redhat.com/mailman/listinfo/linux-aud=
it</a></blockquote></div>

--0000000000003e119b059e0162df--

--===============8057277619980992767==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============8057277619980992767==--

