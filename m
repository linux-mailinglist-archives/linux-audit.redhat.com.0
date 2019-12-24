Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 30EAB129C56
	for <lists+linux-audit@lfdr.de>; Tue, 24 Dec 2019 02:16:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1577150182;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=HGLh8uep1mTQXGswGaKTpfG6o73tfNI4qL+zYMZMkIg=;
	b=irt0xcpXley0ZY1DzVNmFygg4JqRbP9cwpDDjvmWjbPCPtlAlL6sYa2eiEzaAzH1LkuWNa
	ittLLj9FcGM9+0EyG/UTQPDeRhOQxRqZdhZPhR9JxpqIeVVWzKNyZd3tPWhJvsCYm+MJVf
	RG/Y0kLdrf+u8v8vxbUZItwos+5ZB6o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-VdDLL0JePgG1YU67NosuYA-1; Mon, 23 Dec 2019 20:16:21 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E189A107ACC9;
	Tue, 24 Dec 2019 01:16:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D9206649B2;
	Tue, 24 Dec 2019 01:16:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A4E10825A6;
	Tue, 24 Dec 2019 01:16:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBO1Fn0K020836 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 23 Dec 2019 20:15:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DFC6E2166B2B; Tue, 24 Dec 2019 01:15:48 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DAC512166B29
	for <linux-audit@redhat.com>; Tue, 24 Dec 2019 01:15:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D9B1B85A304
	for <linux-audit@redhat.com>; Tue, 24 Dec 2019 01:15:46 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
	[209.85.166.47]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-44-OQGilJC0N-a3b-bcCz5aSg-1; Mon, 23 Dec 2019 20:15:44 -0500
Received: by mail-io1-f47.google.com with SMTP id b10so17800049iof.11;
	Mon, 23 Dec 2019 17:15:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OFtJNzvwg58e+NhwuxIz6io74G1Mop/sI1tkefI3QOk=;
	b=CJiUAKVC/7JqTKgj3GwNB7pNy8slxIN4RmWw3fC380LnNpuMH2piQ9zgx9Hzot348x
	WRwpJQGdSfbFeEpZuDbZT5W3pxL1rpwPwyVfEs5S+1f39TgnpxRMUwWMpGMVpWbnc9/R
	zuUa9nUDuS9QXEQHZ0tukTDHz2RsJHtoClX5LGaF1d01p3oP3KS22x6hJXe9ugHfKcNp
	/HnDuhtMbEp5dQi2DwGHGhcD5/1jo2fVsDA2pIVXVGEd2owUnZB/P5JY3lY0e8NB+3vx
	yMd6HMJStGa0fAbjKsQ6YLhzXb1db9t1QO+SUhphKDJCWIyVy1+QObuBRO50QPyLhTfe
	fdjA==
X-Gm-Message-State: APjAAAVvnNh5/J3dro4x5vJWpBSiYjqcMDb5fraobmqEIhSHSWTps4nn
	aAT1n/6FdzEV1oJLAF2tAL/DJxmzxSb8uB0+DHGxWA==
X-Google-Smtp-Source: APXvYqzPnTN/2hRIUX5dOduvsGHj6DDjKEJPuB+I/F1/7FKCeorPgN0j85xEfrAu/b+X+A7GOLIPUCkDLJn4QD8YMvU=
X-Received: by 2002:a6b:d903:: with SMTP id r3mr13943298ioc.293.1577150144092; 
	Mon, 23 Dec 2019 17:15:44 -0800 (PST)
MIME-Version: 1.0
References: <5F4EE10832231F4F921A255C1D9542982304BF@DEERLM99EX7MSX.ww931.my-it-solutions.net>
	<1765069.Uqzcf1Iu7r@x2>
	<5F4EE10832231F4F921A255C1D954298230A39@DEERLM99EX7MSX.ww931.my-it-solutions.net>
In-Reply-To: <5F4EE10832231F4F921A255C1D954298230A39@DEERLM99EX7MSX.ww931.my-it-solutions.net>
From: "warron.french" <warron.french@gmail.com>
Date: Mon, 23 Dec 2019 20:15:32 -0500
Message-ID: <CAJdJdQmQyPMbC__JVQLuFjaVcsxjHxVX+QH4OAgErh4pT1f6ag@mail.gmail.com>
Subject: Re: ausearch on the fly
To: "MAUPERTUIS, PHILIPPE" <philippe.maupertuis@equensworldline.com>
X-MC-Unique: OQGilJC0N-a3b-bcCz5aSg-1
X-MC-Unique: VdDLL0JePgG1YU67NosuYA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: "linux-audit@redhat.com" <linux-audit@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============2041895325647403013=="

--===============2041895325647403013==
Content-Type: multipart/alternative; boundary="000000000000189e3a059a68e2d5"

--000000000000189e3a059a68e2d5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I have seen it done in exactly this manner too.  Where I work we do this.

--------------------------
Warron French



On Fri, Dec 20, 2019 at 2:26 PM MAUPERTUIS, PHILIPPE <
philippe.maupertuis@equensworldline.com> wrote:

> Thank you steve,
> I will have a look at it.
> Philippe
>
> -----Message d'origine-----
> De : Steve Grubb [mailto:sgrubb@redhat.com]
> Envoy=C3=A9 : vendredi 20 d=C3=A9cembre 2019 20:24
> =C3=80 : linux-audit@redhat.com
> Cc : MAUPERTUIS, PHILIPPE
> Objet : Re: ausearch on the fly
>
> On Friday, December 20, 2019 8:33:11 AM EST MAUPERTUIS, PHILIPPE wrote:
> > We are centralizing  the audit logs with rsyslog.
> > The SIEM behind the central log server is unable to process the raw log=
s.
> > We would like to push the ausearch  result in CSV format in real time o=
r
> > near real time. Is there a way to have ausearch working from a pipe and
> > and waiting when no logs are received
>
> I think that I've seen others who setup a cron job and use the
> checkpointing
> feature so that they do not miss anything. You can pipe its output into
> logger. You probably also want to cut the first line which has the column
> headers.
>
> ausearch --start today --checkpoint /root/last-ausearch .chpt --format cs=
v
> | tail -n +2 | logger
>
> Also, the latest syslog plugin can now do interpretation. I think its in
> alpha-9 which dates back to Nov 04, 2019.
>
> It really shouldn't be hard to copy and paste the code from ausearch into
> the
> syslog plugin to log directly in that format. I wonder if anyone else wou=
ld
> find that useful?
>
> -Steve
>
>
> equensWorldline is a registered trade mark and trading name owned by the
> Worldline Group through its holding company.
> This e-mail and the documents attached are confidential and intended
> solely for the addressee. If you receive this e-mail in error, you are no=
t
> authorized to copy, disclose, use or retain it. Please notify the sender
> immediately and delete this email from your systems. As emails may be
> intercepted, amended or lost, they are not secure. EquensWorldline and th=
e
> Worldline Group therefore can accept no liability for any errors or their
> content. Although equensWorldline and the Worldline Group endeavours to
> maintain a virus-free network, we do not warrant that this transmission i=
s
> virus-free and can accept no liability for any damages resulting from any
> virus transmitted. The risks are deemed to be accepted by everyone who
> communicates with equensWorldline and the Worldline Group by email
>
>
> --
> Linux-audit mailing list
> Linux-audit@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-audit
>
>

--000000000000189e3a059a68e2d5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have seen it done in exactly this manner too.=C2=A0 Wher=
e I work we do this.<div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"g=
mail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">-------=
-------------------<br><font color=3D"#000099" size=3D"4">Warron French<br>=
<font size=3D"4"><font size=3D"4"><font size=3D"4"><br></font></font></font=
></font></div></div></div><br></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 20, 2019 at 2:26 PM MAUPERT=
UIS, PHILIPPE &lt;<a href=3D"mailto:philippe.maupertuis@equensworldline.com=
">philippe.maupertuis@equensworldline.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">Thank you steve,<br>
I will have a look at it.<br>
Philippe<br>
<br>
-----Message d&#39;origine-----<br>
De : Steve Grubb [mailto:<a href=3D"mailto:sgrubb@redhat.com" target=3D"_bl=
ank">sgrubb@redhat.com</a>]<br>
Envoy=C3=A9 : vendredi 20 d=C3=A9cembre 2019 20:24<br>
=C3=80 : <a href=3D"mailto:linux-audit@redhat.com" target=3D"_blank">linux-=
audit@redhat.com</a><br>
Cc : MAUPERTUIS, PHILIPPE<br>
Objet : Re: ausearch on the fly<br>
<br>
On Friday, December 20, 2019 8:33:11 AM EST MAUPERTUIS, PHILIPPE wrote:<br>
&gt; We are centralizing=C2=A0 the audit logs with rsyslog.<br>
&gt; The SIEM behind the central log server is unable to process the raw lo=
gs.<br>
&gt; We would like to push the ausearch=C2=A0 result in CSV format in real =
time or<br>
&gt; near real time. Is there a way to have ausearch working from a pipe an=
d<br>
&gt; and waiting when no logs are received<br>
<br>
I think that I&#39;ve seen others who setup a cron job and use the checkpoi=
nting<br>
feature so that they do not miss anything. You can pipe its output into<br>
logger. You probably also want to cut the first line which has the column<b=
r>
headers.<br>
<br>
ausearch --start today --checkpoint /root/last-ausearch .chpt --format csv =
| tail -n +2 | logger<br>
<br>
Also, the latest syslog plugin can now do interpretation. I think its in<br=
>
alpha-9 which dates back to Nov 04, 2019.<br>
<br>
It really shouldn&#39;t be hard to copy and paste the code from ausearch in=
to the<br>
syslog plugin to log directly in that format. I wonder if anyone else would=
<br>
find that useful?<br>
<br>
-Steve<br>
<br>
<br>
equensWorldline is a registered trade mark and trading name owned by the Wo=
rldline Group through its holding company.<br>
This e-mail and the documents attached are confidential and intended solely=
 for the addressee. If you receive this e-mail in error, you are not author=
ized to copy, disclose, use or retain it. Please notify the sender immediat=
ely and delete this email from your systems. As emails may be intercepted, =
amended or lost, they are not secure. EquensWorldline and the Worldline Gro=
up therefore can accept no liability for any errors or their content. Altho=
ugh equensWorldline and the Worldline Group endeavours to maintain a virus-=
free network, we do not warrant that this transmission is virus-free and ca=
n accept no liability for any damages resulting from any virus transmitted.=
 The risks are deemed to be accepted by everyone who communicates with eque=
nsWorldline and the Worldline Group by email<br>
<br>
<br>
--<br>
Linux-audit mailing list<br>
<a href=3D"mailto:Linux-audit@redhat.com" target=3D"_blank">Linux-audit@red=
hat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-audit" rel=3D"nore=
ferrer" target=3D"_blank">https://www.redhat.com/mailman/listinfo/linux-aud=
it</a><br>
<br>
</blockquote></div>

--000000000000189e3a059a68e2d5--

--===============2041895325647403013==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============2041895325647403013==--

