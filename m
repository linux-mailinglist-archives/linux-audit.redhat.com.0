Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E952A13991D
	for <lists+linux-audit@lfdr.de>; Mon, 13 Jan 2020 19:43:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578940996;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=PkBnqkufB6TWPivjRHkP105WxKxuY5kHW+0nN8dZwGM=;
	b=No3ufQ0Suxti862RVwMvtpZAPs0bzEsabBvaPNerkhKXSWxFj62mkTouTHJEHHK7Qpbckh
	9tx2QnejXK6Mo1gu/fGyhIPzTHpFZec/EauRyf1fVEj0fmNZq+6OX29esZJea8bv9iFEie
	c87FSYyBYO97JxxhlaymunTZZkGK04M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-St1S-TulNkCESwmjknlssA-1; Mon, 13 Jan 2020 13:43:14 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 471FE805C33;
	Mon, 13 Jan 2020 18:43:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2D955DA75;
	Mon, 13 Jan 2020 18:43:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 55A4D18089CD;
	Mon, 13 Jan 2020 18:43:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00DIguWN004070 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 13 Jan 2020 13:42:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0DC972166B2D; Mon, 13 Jan 2020 18:42:56 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 096102166B2B
	for <linux-audit@redhat.com>; Mon, 13 Jan 2020 18:42:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4080785A310
	for <linux-audit@redhat.com>; Mon, 13 Jan 2020 18:42:54 +0000 (UTC)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com
	[209.85.221.180]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-119-7Q5P_P1AMay4DKhjKeZ-EQ-1; Mon, 13 Jan 2020 13:42:52 -0500
Received: by mail-vk1-f180.google.com with SMTP id u6so2842623vkn.13
	for <linux-audit@redhat.com>; Mon, 13 Jan 2020 10:42:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GArFg/q4HzvytdoIT09Ehv8F8FAJiFdMFYGa8X7QiK4=;
	b=j6FIg/LXYRJI1nT1HsJZFPMpTgqp+WJVJjUzgenYyy9snd7tupqtme2B4oQrDPtAAf
	A2FHAcLPb4ilCH1seYGC1GW/d6wfieOPtQhl2M4oU/zpBV8Z/izCj7n7G1s26NDGlvP/
	Cb1WtQQJ5p8FOvM4whrxcTf6LPxpwBqoPT3wzSLaAyyW3p9NGP1LmU5xd7lt2cmyrsKW
	J46FGKvH5sU0mZgVY8e7R1GDzAqm4q+4ev7L9oNj3YvIlbJox3GIA3w8sg59yI628P3g
	mQ2c6cmyK46ySniulLkrD3pSAuNiWS/r1Hq0+5KWvmr/b59YXUM1MRc5i2pvd4+ajiRX
	oc+Q==
X-Gm-Message-State: APjAAAXdnR8xKSmvIn2c4T/OMbjymH4S+eFOEYsdsQ8S4HzPjSOpYU3M
	xlKAOwyLXb5guJDBqDpgx80it7slmlkm4G+tq6YQ/A==
X-Google-Smtp-Source: APXvYqxU6dS5pIIB8u5TTZRRMvzy/4dv9ca6OFThobBaNKBk17iMAsllQGkY5Hsi241M9Ga6h178dnWSgXC6vtDIkho=
X-Received: by 2002:a1f:6005:: with SMTP id u5mr8590247vkb.35.1578940971373;
	Mon, 13 Jan 2020 10:42:51 -0800 (PST)
MIME-Version: 1.0
References: <5F4EE10832231F4F921A255C1D954298261DA3@DEERLM99EX7MSX.ww931.my-it-solutions.net>
In-Reply-To: <5F4EE10832231F4F921A255C1D954298261DA3@DEERLM99EX7MSX.ww931.my-it-solutions.net>
From: F Rafi <farhanible@gmail.com>
Date: Mon, 13 Jan 2020 13:42:40 -0500
Message-ID: <CABXp1csAJ5HFPU-Xz+TrMGE5XTjUganT+8VFr8p7o-xxzvnmCw@mail.gmail.com>
Subject: Re: PCI System level object
To: "MAUPERTUIS, PHILIPPE" <philippe.maupertuis@equensworldline.com>
X-MC-Unique: 7Q5P_P1AMay4DKhjKeZ-EQ-1
X-MC-Unique: St1S-TulNkCESwmjknlssA-1
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
Content-Type: multipart/mixed; boundary="===============3446519008821079429=="

--===============3446519008821079429==
Content-Type: multipart/alternative; boundary="000000000000b85846059c09d77c"

--000000000000b85846059c09d77c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I have used audit logs instead of a FIM solution for PCI compliance at the
system/OS level. IMO most FIM-only products do not provide a significant
value or reduction in threats.

Farhan

On Mon, Jan 13, 2020 at 12:46 PM MAUPERTUIS, PHILIPPE <
philippe.maupertuis@equensworldline.com> wrote:

> Hi,
>
> Redhat is providing audit rules sample for PCI DSS.
>
> For the requirement 10.2.7 it is written :
>
> ## 10.2.7 Creation and deletion of system-level objects
>
> ## This requirement seems to be database table related and not audit
>
>
>
> However the PCI glossary defines system level objects as :
>
> System-level object:
>
> Anything on a system component that is required for its operation,
> including but not limited to database tables, stored procedures,
> application executables and configuration files, system configuration
> files, static and shared libraries and DLLs, system executables, device
> drivers and device configuration files,and third-party components.
>
> It seems It should be covered by the FIM solution and not by audit.
>
> However loading and unloading kernel modules  should probably be covered
> by auditd.
>
> Could you tell me which events are generated in that case ?
>
> Are there any others events that should consider for this requirement
>
>
>
> Regards
>
> Philippe
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
> --
> Linux-audit mailing list
> Linux-audit@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-audit

--000000000000b85846059c09d77c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">I have used audit logs instead of a FIM solution for=
 PCI compliance at the system/OS level. IMO most FIM-only products do not p=
rovide a significant value or reduction in threats.</div></div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Farhan</div><div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 13, 2020 at 12:46 =
PM MAUPERTUIS, PHILIPPE &lt;<a href=3D"mailto:philippe.maupertuis@equenswor=
ldline.com">philippe.maupertuis@equensworldline.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">





<div lang=3D"FR" link=3D"blue" vlink=3D"purple">
<div class=3D"m_-493385025883880932WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Redhat is providing audit rules=
 sample for PCI DSS.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">For the requirement 10.2.7 it i=
s written :<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">## 10.2.7 Creation and deletion=
 of system-level objects<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">## This requirement seems to be=
 database table related and not audit<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">However the PCI glossary define=
s system level objects as :<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">System-level object:<u></u><u><=
/u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Anything on a system component =
that is required for its operation, including but not limited to database t=
ables, stored procedures, application executables and configuration files, =
system configuration files, static and
 shared libraries and DLLs, system executables, device drivers and device c=
onfiguration files,and third-party components.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">It seems It should be covered b=
y the FIM solution and not by audit.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">However loading and unloading k=
ernel modules =C2=A0should probably be covered by auditd.<u></u><u></u></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Could you tell me which events =
are generated in that case ?<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Are there any others events tha=
t should consider for this requirement<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Regards<u></u><u></u></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Philippe<u></u><u></u></span></=
p>
</div>
<p>equensWorldline is a registered trade mark and trading name owned by the=
 Worldline Group through its holding company.<br>
This e-mail and the documents attached are confidential and intended solely=
 for the addressee. If you receive this e-mail in error, you are not author=
ized to copy, disclose, use or retain it. Please notify the sender immediat=
ely and delete this email from your
 systems. As emails may be intercepted, amended or lost, they are not secur=
e. EquensWorldline and the Worldline Group therefore can accept no liabilit=
y for any errors or their content. Although equensWorldline and the Worldli=
ne Group endeavours to maintain
 a virus-free network, we do not warrant that this transmission is virus-fr=
ee and can accept no liability for any damages resulting from any virus tra=
nsmitted. The risks are deemed to be accepted by everyone who communicates =
with equensWorldline and the Worldline
 Group by email<br>
</p>
</div>

--<br>
Linux-audit mailing list<br>
<a href=3D"mailto:Linux-audit@redhat.com" target=3D"_blank">Linux-audit@red=
hat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-audit" rel=3D"nore=
ferrer" target=3D"_blank">https://www.redhat.com/mailman/listinfo/linux-aud=
it</a></blockquote></div></div>

--000000000000b85846059c09d77c--

--===============3446519008821079429==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============3446519008821079429==--

