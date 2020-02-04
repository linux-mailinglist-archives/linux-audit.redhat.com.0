Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id DFD221516D1
	for <lists+linux-audit@lfdr.de>; Tue,  4 Feb 2020 09:11:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580803860;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=YtyVYJsULoWgYxjhaJ+parIlmnHWqxSgnA26xPk5v2M=;
	b=gRTUQ39wbZVZhb9Cali4YJd4/ptuK4LaYSD661VBFxk7YXePxxhUGAzFo3tfP4awVQ9NV0
	Wm2Qwr60wcszWvZoBtaNOmFFR1dgamrUCeu4TrArOU6dnuxbX8gEVq1zRTvwGRDHC3pDNa
	tx9AavOXwuK34M2/X7PImGQ/vd5ynlw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-sK9ElW4DPo-EQDnwYzET5w-1; Tue, 04 Feb 2020 03:10:57 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85660DB24;
	Tue,  4 Feb 2020 08:10:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14DDF19C7F;
	Tue,  4 Feb 2020 08:10:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B33A58174D;
	Tue,  4 Feb 2020 08:10:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0148APju007348 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 4 Feb 2020 03:10:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 84E692038BBE; Tue,  4 Feb 2020 08:10:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F3E12038BAC
	for <linux-audit@redhat.com>; Tue,  4 Feb 2020 08:10:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1526A1019288
	for <linux-audit@redhat.com>; Tue,  4 Feb 2020 08:10:23 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2BKBgC5JTle/9vbLXlbChwBAQEBAQc?=
	=?us-ascii?q?BAREBBAQBAYF7gX2BGFQhEoQ+iQOGDQGCEJldgVsJAQEBAQEBAQEBLQcBAgE?=
	=?us-ascii?q?BhDoEAgKCWTgTAhABAQEEAQEBAQEFAwFthGtMDIVnAQUjMzMLCAYKHA4CAlc?=
	=?us-ascii?q?GAYJtTIJKAQEuEKwkgTKFOhGCMwaBDIE4BoE4hR4MhweBTD+BR4JdPoJLGQK?=
	=?us-ascii?q?BOIM9gl4EjWeCbIZmiHSOQHYHgj54BIVKGmmOehubCI5hh1yBC5REIoFYMxo?=
	=?us-ascii?q?fghYYXgEBATJPGA2NeYQXimcwgTYBAY1hAQE?=
X-IPAS-Result: =?us-ascii?q?A2BKBgC5JTle/9vbLXlbChwBAQEBAQcBAREBBAQBAYF7g?=
	=?us-ascii?q?X2BGFQhEoQ+iQOGDQGCEJldgVsJAQEBAQEBAQEBLQcBAgEBhDoEAgKCWTgTA?=
	=?us-ascii?q?hABAQEEAQEBAQEFAwFthGtMDIVnAQUjMzMLCAYKHA4CAlcGAYJtTIJKAQEuE?=
	=?us-ascii?q?KwkgTKFOhGCMwaBDIE4BoE4hR4MhweBTD+BR4JdPoJLGQKBOIM9gl4EjWeCb?=
	=?us-ascii?q?IZmiHSOQHYHgj54BIVKGmmOehubCI5hh1yBC5REIoFYMxofghYYXgEBATJPG?=
	=?us-ascii?q?A2NeYQXimcwgTYBAY1hAQE?=
X-IronPort-AV: E=Sophos;i="5.70,398,1574092800"; 
	d="scan'208,217";a="273967152"
Received: from icp-osb-irony-out1.external.iinet.net.au
	(icp-osb-irony-out1.external.iinet.net.au [203.59.1.210]) by
	relay.mimecast.com with ESMTP id us-mta-48-Gs5WIZpsMsWC2GI31k-9Qg-1;
	Tue, 04 Feb 2020 03:10:19 -0500
Received: from ppp121-45-219-219.bras1.cbr2.internode.on.net (HELO
	swtf.swtf.dyndns.org) ([121.45.219.219])
	by icp-osb-irony-out1.iinet.net.au with ESMTP;
	04 Feb 2020 16:10:16 +0800
Message-ID: <0d16a8086bd4d075880f6d4fc88341a5f0fcb755.camel@iinet.net.au>
Subject: Re: USBguard bug
From: Burn Alting <burn.alting@iinet.net.au>
To: Steve Grubb <sgrubb@redhat.com>, linux-audit@redhat.com
Date: Tue, 04 Feb 2020 19:10:14 +1100
In-Reply-To: <2617745.EWgzpobAnq@x2>
References: <60ca6b1cdb64b8c27f328f93ec01fa6596dfce46.camel@iinet.net.au>
	<2617745.EWgzpobAnq@x2>
Mime-Version: 1.0
X-MC-Unique: Gs5WIZpsMsWC2GI31k-9Qg-1
X-MC-Unique: sK9ElW4DPo-EQDnwYzET5w-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: burn@swtf.dyndns.org
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
Content-Type: multipart/mixed; boundary="===============0710419844734879748=="

--===============0710419844734879748==
Content-Type: multipart/alternative; boundary="=-2eG8qBKE1w6ePWaiRWaR"

--=-2eG8qBKE1w6ePWaiRWaR
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-02-03 at 11:35 -0500, Steve Grubb wrote:
> Hello,
> On Friday, January 31, 2020 4:58:18 PM EST Burn Alting wrote:
> > Currently when the USB management framework, usbguard (
> > https://github.com/USBGuard/usbguard),  is building it's key-value pair=
sprior to
> > calling audit_log_user_message() with a AUDIT_USER_DEVICE type,it looks=
 at each
> > value  and decides to hex encode the value if anycharacter  in the valu=
e matches
> > the expression (str[i] =3D=3D '"' || str[i] <0x21 || str[i] =3D=3D 0x7F=
).=20
>=20
> It should be calling audit_value_needs_encoding().
> > This can be found in
> > https://github.com/USBGuard/usbguard/blob/master/src/Daemon/LinuxAuditB=
ack
> > end.cpp where it makes the call
> > =09audit_log_user_message(_audit_fd, AUDIT_USER_DEVICE,
> > message.c_str(),      /*hostname=3D*/nullptr, /*addr=3D*/nullptr, /*tty=
=3D*/nullptr,
> > result);
> > As a result, one sees audit events such as
>=20
>  <snip>
>=20
> > I have a number of questions- What is the best recommendation I can mak=
e in a
> > bug report I'd like toraise so that the auparse library can reliably in=
terpret
> > all their key'svalues?
>=20
> If its a field that is knowingly going to be user controlled, then it has=
 to
> follow the convention shown here:
> https://github.com/linux-audit/audit-userspace/blob/master/lib/
> audit_logging.c#L196
> Notably, the "else" branch includes double quotes.=20

I believe their code does that. I should have been a little clearer ... if =
they have
a msg value with multiple key value pairs, some escaped with double quotes =
and other
hex encoded, how do I get ausearch to reliably decode the hex encoded value=
?Do we
need to add usbguard specific keys to auparse/typetab.h?
> > - Should I also request they actually provide hostname and addrvalues t=
o
> > audit_log_user_message()?
>=20
> This should be covered by auditd.conf, name_format.
>=20
> > - If one want them to identify the user who participates in the activit=
ywhat is
> > the best recommendation to make in terms of keys in the message?
>=20
> There is no way to associate a user to a device being plugged in. What if=
 no one
> is logged in? For example a "janitor" walks by a system at night and plug=
s in a
> usb cactus or evil crow. And then sometimes a system permanently has a us=
b device
> connected and the event is seen during boot before people log in.

Agreed, but the USBguard daemon accepts commands from authorised users and =
acts on
those commands. For example, blocking or unblocking access for a device jus=
t
inserted. What key should be given in their msg string given the initiating=
 user is
not root (or unset). At the moment, they don't log this detail but I will a=
sk them
to, so want to advise the key to use.
> -Steve
>=20

--=-2eG8qBKE1w6ePWaiRWaR
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div>On Mon, 2020-02-03 at 11:35 -0500, Steve Grubb wrote:</div><blockq=
uote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf soli=
d;padding-left:1ex"><pre>Hello,</pre><pre><br></pre><pre>On Friday, January=
 31, 2020 4:58:18 PM EST Burn Alting wrote:</pre><blockquote type=3D"cite" =
style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"=
><pre><br></pre><pre>Currently when the USB management framework, usbguard =
(</pre><a href=3D"https://github.com/USBGuard/usbguard"><pre>https://github=
.com/USBGuard/usbguard</pre></a><pre>),  is building it's key-value pairs</=
pre><pre>prior to calling audit_log_user_message() with a AUDIT_USER_DEVICE=
 type,</pre><pre>it looks at each value  and decides to hex encode the valu=
e if any</pre><pre>character  in the value matches the expression (str[i] =
=3D=3D '"' || str[i] &lt;</pre><pre>0x21 || str[i] =3D=3D 0x7F). </pre></bl=
ockquote><pre><br></pre><pre><br></pre><pre>It should be calling audit_valu=
e_needs_encoding().</pre><pre><br></pre><blockquote type=3D"cite" style=3D"=
margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><pre><br=
></pre><pre>This can be found in</pre><a href=3D"https://github.com/USBGuar=
d/usbguard/blob/master/src/Daemon/LinuxAuditBack"><pre>https://github.com/U=
SBGuard/usbguard/blob/master/src/Daemon/LinuxAuditBack</pre></a><pre><br></=
pre><pre>end.cpp where it makes the call</pre><pre><br></pre><pre>=09audit_=
log_user_message(_audit_fd, AUDIT_USER_DEVICE, message.c_str(),</pre><pre> =
     /*hostname=3D*/nullptr, /*addr=3D*/nullptr, /*tty=3D*/nullptr, result)=
;</pre><pre><br></pre><pre>As a result, one sees audit events such as</pre>=
</blockquote><pre><br></pre><pre> </pre><pre>&lt;snip&gt;</pre><pre><br></p=
re><pre><br></pre><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; bor=
der-left:2px #729fcf solid;padding-left:1ex"><pre><br></pre><pre>I have a n=
umber of questions</pre><pre>- What is the best recommendation I can make i=
n a bug report I'd like to</pre><pre>raise so that the auparse library can =
reliably interpret all their key's</pre><pre>values?</pre></blockquote><pre=
><br></pre><pre><br></pre><pre>If its a field that is knowingly going to be=
 user controlled, then it has to </pre><pre>follow the convention shown her=
e:</pre><pre><br></pre><a href=3D"https://github.com/linux-audit/audit-user=
space/blob/master/lib/"><pre>https://github.com/linux-audit/audit-userspace=
/blob/master/lib/</pre></a><pre><br></pre><pre>audit_logging.c#L196</pre><p=
re><br></pre><pre>Notably, the "else" branch includes double quotes. </pre>=
</blockquote><div><br></div><div>I believe their code does that. I should h=
ave been a little clearer ... if they have a msg value with multiple key va=
lue pairs, some escaped with double quotes and other hex encoded, how do I =
get ausearch to reliably decode the hex encoded value?</div><div>Do we need=
 to add usbguard specific keys to auparse/typetab.h?</div><div><br></div><b=
lockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf=
 solid;padding-left:1ex"><pre><br></pre><blockquote type=3D"cite" style=3D"=
margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><pre><br=
></pre><pre>- Should I also request they actually provide hostname and addr=
</pre><pre>values to audit_log_user_message()?</pre></blockquote><pre><br><=
/pre><pre><br></pre><pre>This should be covered by auditd.conf, name_format=
.</pre><pre><br></pre><pre><br></pre><blockquote type=3D"cite" style=3D"mar=
gin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><pre><br></=
pre><pre>- If one want them to identify the user who participates in the ac=
tivity</pre><pre>what is the best recommendation to make in terms of keys i=
n the message?</pre></blockquote><pre><br></pre><pre><br></pre><pre>There i=
s no way to associate a user to a device being plugged in. What if no </pre=
><pre>one is logged in? For example a "janitor" walks by a system at night =
and </pre><pre>plugs in a usb cactus or evil crow. And then sometimes a sys=
tem permanently </pre><pre>has a usb device connected and the event is seen=
 during boot before people </pre><pre>log in.</pre></blockquote><div><br></=
div><div>Agreed, but the USBguard daemon accepts commands from authorised u=
sers and acts on those commands. For example, blocking or unblocking access=
 for a device just inserted. What key should be given in their msg string g=
iven the initiating user is not root (or unset). At the moment, they don't =
log this detail but I will ask them to, so want to advise the key to use.</=
div><div><br></div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; bo=
rder-left:2px #729fcf solid;padding-left:1ex"><pre><br></pre><pre>-Steve</p=
re><pre><br></pre><pre><br></pre></blockquote></body></html>

--=-2eG8qBKE1w6ePWaiRWaR--

--===============0710419844734879748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============0710419844734879748==--

