Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE7D762423
	for <lists+linux-audit@lfdr.de>; Tue, 25 Jul 2023 23:09:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690319356;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=NOKae0/lxx1HEdfmTtk3d6X4AjWF0PRntvzlaph8RaA=;
	b=X8lcLnlxOgIv3b2T9RcBizPC9TLPaBY2Sve7Z93FCH/hRQRMzWTuBJKxZsyCbq/7TfJkh0
	uj0gbacrywuXCzPcnNHT6aUD/cK5B9Qp4MzoJH10cH9vwfIA/KU++f4UDWpiZg8ti7x3qQ
	S9/NEiAsAWUL8SQbE3BYjBCsAtUpu1Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-688-FoZNmUPNP0q3h7vofUUbrA-1; Tue, 25 Jul 2023 17:09:15 -0400
X-MC-Unique: FoZNmUPNP0q3h7vofUUbrA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43A20873232;
	Tue, 25 Jul 2023 21:09:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0E7DDC2C7D3;
	Tue, 25 Jul 2023 21:09:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2106B1946A5E;
	Tue, 25 Jul 2023 21:09:01 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 720771946589 for <linux-audit@listman.corp.redhat.com>;
 Tue, 25 Jul 2023 21:00:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4B4DB40C206F; Tue, 25 Jul 2023 21:00:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 43BFE40C2063
 for <linux-audit@redhat.com>; Tue, 25 Jul 2023 21:00:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1FE663810D30
 for <linux-audit@redhat.com>; Tue, 25 Jul 2023 21:00:13 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-t8I7AP7vMIOId0H_jZhTww-1; Tue, 25 Jul 2023 17:00:10 -0400
X-MC-Unique: t8I7AP7vMIOId0H_jZhTww-1
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2b933bbd3eeso89080201fa.1
 for <linux-audit@redhat.com>; Tue, 25 Jul 2023 14:00:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690318808; x=1690923608;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J+T5HFAQEkP+eqGAThMnN0dkHOWI2tx33n/C14m47uA=;
 b=hwAK6sM7HDdmBUD/onG7xYXBsKrF7Vr8Xahbo/lme1Eu7bNcO8kkHt3bXMNej0RzUJ
 BhNZoYhZviZu5CqJCB8PO9W5Jw/zi6UTmyYe+80O/9+qjOAYEIO2xa+bNguf8UxR1wWm
 6dhXPrPJB+peDDzWp+TtPvE9mil7tii5iJcZRzgxHAfSLuWPImqXTNs9CdoNgm+/KP+e
 lUydh9yl8gNjtemunY91GDdGI2eeWwOM+2nT6pdCRDL0e/GCGNOsywNmwCndZ0207cG/
 msyedd0SSEBZhoBtl/tTYVLl48rmHHb+pvnP3y58G0yFV3+onrUn1CMNV8p60BqzOy3B
 Sjlw==
X-Gm-Message-State: ABy/qLa77yCdm7/1WeFDQ+Rq3Q2z7FTQQQKOuvrbtRqnpHLeqqyeejri
 /DCiUGyXM5jB4oNwn0rk5dum6+S5YTzA0PiJ2rrYnQ==
X-Google-Smtp-Source: APBJJlHNjeHlgiyJcbrN7cyCPLs7qnfA153QxgCMBDSXt2JngP9e9XKNSbOtUbTnYC9GzEwV8iObQRMQXhsuOdPCIaE=
X-Received: by 2002:a2e:b00a:0:b0:2b9:3db7:322a with SMTP id
 y10-20020a2eb00a000000b002b93db7322amr9991536ljk.29.1690318808470; Tue, 25
 Jul 2023 14:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAG0SdGBHWZCDTHrx-OthDoJ6O==RqSzH3yvAEzmQLT=iYHZhSw@mail.gmail.com>
 <2691760.mvXUDI8C0e@x2>
 <CAG0SdGBHnFLf=DDMwvyYyctfq3YcA3RUzuEibMdDbxTCuwFxZA@mail.gmail.com>
 <2241383.iZASKD2KPV@x2>
In-Reply-To: <2241383.iZASKD2KPV@x2>
From: Samuel Bahr <sbahr@pinterest.com>
Date: Tue, 25 Jul 2023 15:59:57 -0500
Message-ID: <CAG0SdGAH-De7KW00gXhMyFBF17-yVn+H+COU7w6WuZRydSyAyQ@mail.gmail.com>
Subject: Re: Cannot disable kernel's audit system via auditctl
To: Steve Grubb <sgrubb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Tue, 25 Jul 2023 21:08:59 +0000
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: pinterest.com
Content-Type: multipart/mixed; boundary="===============2143266204850063370=="

--===============2143266204850063370==
Content-Type: multipart/alternative; boundary="000000000000234b8b06015604e8"

--000000000000234b8b06015604e8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steve,

Since auditd.service is disabled nothing is writing to the audit log:

# aureport --start yesterday --event --summary -i
>
> Event Summary Report
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> total  type
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> <no events of interest were found>
>

However, I can parse the audit logs that do make it to the kernel ring
buffer (not suppressed by printk):

> $ dmesg | grep -Eo 'type=3D[0-9]+' | sort | uniq -c | sort -n
>    1198 type=3D1400
>

In the past, before landing on our current (partial) solution to disable
the kernel audit subsystem w/ `auditctl -e 0` we tried just filtering out
type 1400 messages w/ `auditctl -a exclude,always -F msgtype=3D1400`.
However, that only lead us to seeing other types of audit messages in the
kernel ring buffer:

> $ dmesg | grep -Eo 'type=3D[0-9]+' | sort | uniq -c | sort -n
> 7 type=3D1109
> 10 type=3D1110
> 12 type=3D1123
> 52 type=3D1112
> 91 type=3D1131
> 93 type=3D1130
> 268 type=3D1105
> 356 type=3D1104
> 357 type=3D1106
> 414 type=3D1006
> 454 type=3D1103
> 459 type=3D1101
>

Note, that was with the kernel audit subsystem enabled so perhaps the
behavior is different than now where it's disabled entirely.

Regards,
Samuel Bahr
Pinterest Sr. Site Reliability Engineer

On Tue, Jul 25, 2023 at 12:05=E2=80=AFPM Steve Grubb <sgrubb@redhat.com> wr=
ote:

> On Monday, July 24, 2023 5:06:02 PM EDT Samuel Bahr wrote:
> > `auditctl -D` does not make it go away (outputs `No rules`). auditd isn=
't
> > running at all and this behavior is happening purely from the kernel.
> These
> > systems were never set to enabled 2 (locked).
> >
> > I went ahead and filed a Github issue for this thread:
> > https://github.com/linux-audit/audit-kernel/issues/146
> >
> > The maintainer there suggested it's too difficult to debug due to eBPF
> > programs + AWS's modified kernel.
>
> I think there is data that could help decide where the problem might be.
> On
> one of the systems that is still logging, try running an event type repor=
t:
>
> aureport --start yesterday --event --summary -i
>
> This should identify what kind of event is being emitted. Based on that,
> it
> might point to where the problem is.
>
> > I've resigned to asking Red Canary to support eBPF mode with `audit=3D0=
`
> > kernel parameter in their Linux EDR. Let me know if you have any other
> > ideas.
>
> I'd say collecting summary information about what kind of events are bein=
g
> logged would be a good start.
>
> -Steve
>
>
>

--000000000000234b8b06015604e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Steve,<div><br></div><div>Since auditd.service is disab=
led nothing is writing to the audit log:</div><div><br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"># aureport --start yesterday --event --=
summary -i<br><br>Event Summary Report<br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>total =C2=A0type<br>=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>&lt;no events of intere=
st were found&gt;<br></blockquote><div><br></div><div>However, I can parse =
the audit logs that do make it to the kernel ring buffer (not suppressed by=
 printk):</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">$ dmesg | =
grep -Eo &#39;type=3D[0-9]+&#39; | sort | uniq -c | sort -n<br>=C2=A0 =C2=
=A01198 type=3D1400<br></blockquote><div><br></div><div>In the past, before=
 landing on our current (partial) solution to disable the kernel audit subs=
ystem w/ `auditctl -e 0` we tried just filtering out type 1400 messages w/ =
`auditctl -a exclude,always -F msgtype=3D1400`. However, that only lead us =
to seeing other types of audit messages in the kernel ring buffer:</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">$ dmesg | grep -Eo &#39;type=
=3D[0-9]+&#39; | sort | uniq -c | sort -n<br>7 type=3D1109<br>10 type=3D111=
0<br>12 type=3D1123<br>52 type=3D1112<br>91 type=3D1131<br>93 type=3D1130<b=
r>268 type=3D1105<br>356 type=3D1104<br>357 type=3D1106<br>414 type=3D1006<=
br>454 type=3D1103<br>459 type=3D1101<br></blockquote><div><br></div><div>N=
ote, that was with the kernel=C2=A0audit subsystem enabled so perhaps the b=
ehavior is different than now where it&#39;s disabled entirely.</div><div><=
br></div><div>Regards,</div><div>Samuel Bahr</div><div>Pinterest Sr. Site R=
eliability Engineer</div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Tue, Jul 25, 2023 at 12:05=E2=80=AFPM Steve Gru=
bb &lt;<a href=3D"mailto:sgrubb@redhat.com">sgrubb@redhat.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Monday, Jul=
y 24, 2023 5:06:02 PM EDT Samuel Bahr wrote:<br>
&gt; `auditctl -D` does not make it go away (outputs `No rules`). auditd is=
n&#39;t<br>
&gt; running at all and this behavior is happening purely from the kernel. =
These<br>
&gt; systems were never set to enabled 2 (locked).<br>
&gt; <br>
&gt; I went ahead and filed a Github issue for this thread:<br>
&gt; <a href=3D"https://github.com/linux-audit/audit-kernel/issues/146" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/linux-audit/audit-kern=
el/issues/146</a><br>
&gt; <br>
&gt; The maintainer there suggested it&#39;s too difficult to debug due to =
eBPF<br>
&gt; programs + AWS&#39;s modified kernel.<br>
<br>
I think there is data that could help decide where the problem might be. On=
 <br>
one of the systems that is still logging, try running an event type report:=
<br>
<br>
aureport --start yesterday --event --summary -i<br>
<br>
This should identify what kind of event is being emitted. Based on that, it=
 <br>
might point to where the problem is.<br>
<br>
&gt; I&#39;ve resigned to asking Red Canary to support eBPF mode with `audi=
t=3D0`<br>
&gt; kernel parameter in their Linux EDR. Let me know if you have any other=
<br>
&gt; ideas.<br>
<br>
I&#39;d say collecting summary information about what kind of events are be=
ing <br>
logged would be a good start.<br>
<br>
-Steve<br>
<br>
<br>
</blockquote></div>

--000000000000234b8b06015604e8--

--===============2143266204850063370==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============2143266204850063370==--

