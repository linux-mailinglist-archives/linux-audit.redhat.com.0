Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id B3F89145716
	for <lists+linux-audit@lfdr.de>; Wed, 22 Jan 2020 14:49:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579700983;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=TcYEqj2jWR1nZuUBJT26NZ9FxQa2tJloRdHXcGlJzwc=;
	b=SXBkMOPvcjuFRuZ0PfsosWWxQz0MINnsTGoBUy4uSUfq2jMTp2fBG8elcO8dJp8Sy33IhT
	pe4xYwR/EUrH4v9LUrEvJMmFCuyHtCpgGbVOM4++MkLGeylxeWLe9czrZiygpH9WyyJnPx
	Ncca33/P8CuR5cjMLvvjDhXd2QuFS1M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-OcDaJOnRMlucKJW4mloKIQ-1; Wed, 22 Jan 2020 08:49:40 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B1EA1800D78;
	Wed, 22 Jan 2020 13:49:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 739AA85748;
	Wed, 22 Jan 2020 13:49:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D48D518089CD;
	Wed, 22 Jan 2020 13:49:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00MDn30w031779 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 22 Jan 2020 08:49:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DAD1AEC4C8; Wed, 22 Jan 2020 13:49:03 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2663F18B2
	for <linux-audit@redhat.com>; Wed, 22 Jan 2020 13:49:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E44D802E56
	for <linux-audit@redhat.com>; Wed, 22 Jan 2020 13:49:00 +0000 (UTC)
Received: from mail.swtf.dyndns.org
	(ppp121-45-219-219.bras1.cbr2.internode.on.net [121.45.219.219]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-333-sErmheGPO5mDm9eV2a1eHg-1; Wed, 22 Jan 2020 08:48:57 -0500
Received: from mail.swtf.dyndns.org (localhost [127.0.0.1])
	by mail.swtf.dyndns.org (Postfix) with ESMTP id 2354B203000B
	for <linux-audit@redhat.com>; Thu, 23 Jan 2020 00:48:54 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at mail.swtf.dyndns.org
Received: from mail.swtf.dyndns.org ([127.0.0.1])
	by mail.swtf.dyndns.org (mail.swtf.dyndns.org [127.0.0.1]) (amavisd-new,
	port 10026) with ESMTP id 2cCqtIxWWn91 for <linux-audit@redhat.com>;
	Thu, 23 Jan 2020 00:43:27 +1100 (AEDT)
Received: from swtf.swtf.dyndns.org (swtf.swtf.dyndns.org [192.168.2.220])
	by mail.swtf.dyndns.org (Postfix) with ESMTPSA id 603682030009;
	Thu, 23 Jan 2020 00:43:26 +1100 (AEDT)
Message-ID: <80ba1854f20289af72a23a5c7cc0971a1a0b513e.camel@swtf.dyndns.org>
Subject: Re: auditing removable media
From: Burn Alting <burn@swtf.dyndns.org>
To: Richard Guy Briggs <rgb@redhat.com>, Linux-Audit Mailing List
	<linux-audit@redhat.com>
Date: Thu, 23 Jan 2020 00:43:26 +1100
In-Reply-To: <c4078163465539257084371f1b4eed0d105564bb.camel@swtf.dyndns.org>
References: <20200121201654.wezzozvsgbf57oz5@madcap2.tricolour.ca>
	<c4078163465539257084371f1b4eed0d105564bb.camel@swtf.dyndns.org>
Mime-Version: 1.0
X-MC-Unique: sErmheGPO5mDm9eV2a1eHg-1
X-MC-Unique: OcDaJOnRMlucKJW4mloKIQ-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============1835200623041078498=="

--===============1835200623041078498==
Content-Type: multipart/alternative; boundary="=-9SnKAer6DWEsTw71/rYE"

--=-9SnKAer6DWEsTw71/rYE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Well, there is one thing we may need to change.
If USBGuard is configured to sent it's logs to auditd generating a USER_DEV=
ICE event
type, we are going to have to add some new keys to the typetab.h table so t=
hat one
can interpret some of the USBGuard keys. Unfortunately, USBGuard appears to=
 decide
to encode a key's value dependant on it's content (e.g. embedded spaces or =
quotes)
not the key. I am not sure if ausearch's interpret code can decide on the f=
ly
whether to unescape a possible encoded key's value or that will need to be =
built in.
Also any down-stream processing of interpreted values may be challenging gi=
ven an
example key value pair
likeencoded:device_rule=3D616C6C6F7720696420316436623A303030322073657269616=
C202230303
0303A30303A31612E3022206E616D6520224548434920486F737420436F6E74726F6C6C6572=
222068617
3682022656A3157566564794C79554D4C6951787A45637277625934357A436F64775638354B=
7A7937686
D324776343D2220706172656E742D686173682022652F5257306D4D624D2B54534651787052=
694D45664
C372F33524A664B5664716666426D39463571412B453D22207669612D706F72742022757362=
312220776
974682D696E746572666163652030393A30303A3030decoded:device_rule=3Dallow id 1=
d6b:0002
serial "0000:00:1a.0" name "EHCI Host Controller" hash
"ej1WVedyLyUMLiQxzEcrwbY45zCodwV85Kzy7hm2Gv4=3D" parent-hash
"e/RW0mMbM+TSFQxpRiMEfL7/3RJfKVdqffBm9F5qA+E=3D" via-port "usb1" with-inter=
face
09:00:00=20

On Wed, 2020-01-22 at 20:27 +1100, Burn Alting wrote:
> Richard,
>=20
> On the surface, it appears to have value, but as you say it would need to=
 be
> extended to other traditional, and non-traditional, removable media. Furt=
her, the
> initial appeal in having the capability directly within the kernel was to=
 make it
> a little more difficult to subvert, centralise auditing policy/monitoring=
 and, if
> frame-worked appropriately, easily extensible to other than USB media typ=
es (which
> was the basis for the Proof of Concept developed by RedHat back in 2016).
>=20
> I have not used USBGuard myself, so will do some experimentation and repo=
rt back.
>=20
> Regards
>=20
> On Tue, 2020-01-21 at 15:16 -0500, Richard Guy Briggs wrote:
> > Hi Burn, and all,
> > I've been aware of this issue for a while now, but wasn't directlyworki=
ng on
> > it.  Now that I'm taking a closer look at this issue, I amwondering how=
 much
> > USBGuard changes the equation?
> > https://www.kernel.org/doc/Documentation/usb/authorization.txt
> > https://usbguard.github.io/
> > =09https://github.com/USBGuard/usbguard
> >=20
> > https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/=
7/html/security_guide/sec-using-usbguard
> >=20
> > It has tools to generate baseline lists of devices, but this is only
> > forusb.  Other interfaces would need to be appropriately instrumented.
> > - RGB
> > --Richard Guy Briggs <rgb@redhat.com>Sr. S/W Engineer, Kernel Security,=
 Base
> > Operating SystemsRemote, Ottawa, Red Hat CanadaIRC: rgb, SunRaycerVoice=
:
> > +1.647.777.2635, Internal: (81) 32635
>=20
> --Linux-audit mailing listLinux-audit@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-audit

--=-9SnKAer6DWEsTw71/rYE
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div>Well, there is one thing we may need to change.</div><div><br></di=
v><div>If USBGuard is configured to sent it's logs to auditd generating a U=
SER_DEVICE event type, we are going to have to add some new keys to the typ=
etab.h table so that one can interpret some of the USBGuard keys. Unfortuna=
tely, USBGuard appears to decide to encode a key's value dependant on it's =
content (e.g. embedded spaces or quotes) not the key. I am not sure if ause=
arch's interpret code can decide on the fly whether to unescape a possible =
encoded key's value or that will need to be built in.</div><div><br></div><=
div>Also any down-stream processing of interpreted values may be challengin=
g given an example key value pair like</div><div>encoded:</div><div>device_=
rule=3D616C6C6F7720696420316436623A303030322073657269616C2022303030303A3030=
3A31612E3022206E616D6520224548434920486F737420436F6E74726F6C6C6572222068617=
3682022656A3157566564794C79554D4C6951787A45637277625934357A436F64775638354B=
7A7937686D324776343D2220706172656E742D686173682022652F5257306D4D624D2B54534=
651787052694D45664C372F33524A664B5664716666426D39463571412B453D22207669612D=
706F72742022757362312220776974682D696E746572666163652030393A30303A3030</div=
><div>decoded:</div><div>device_rule=3Dallow id 1d6b:0002 serial "0000:00:1=
a.0" name "EHCI Host Controller" hash "ej1WVedyLyUMLiQxzEcrwbY45zCodwV85Kzy=
7hm2Gv4=3D" parent-hash "e/RW0mMbM+TSFQxpRiMEfL7/3RJfKVdqffBm9F5qA+E=3D" vi=
a-port "usb1" with-interface 09:00:00&nbsp;</div><div><br></div><div></div>=
<div><br></div><div>On Wed, 2020-01-22 at 20:27 +1100, Burn Alting wrote:</=
div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #=
729fcf solid;padding-left:1ex"><div>Richard,</div><div><br></div><div>On th=
e surface, it appears to have value, but as you say it would need to be ext=
ended to other traditional, and non-traditional, removable media. Further, =
the initial appeal in having the capability directly within the kernel was =
to make it a little more difficult to subvert, centralise auditing policy/m=
onitoring and, if frame-worked appropriately, easily extensible to other th=
an USB media types (which was the basis for the Proof of Concept developed =
by RedHat back in 2016).</div><div><br></div><div>I have not used USBGuard =
myself, so will do some experimentation and report back.</div><div><br></di=
v><div>Regards</div><div><br></div><div>On Tue, 2020-01-21 at 15:16 -0500, =
Richard Guy Briggs wrote:</div><blockquote type=3D"cite" style=3D"margin:0 =
0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><pre>Hi Burn, and=
 all,</pre><br><pre>I've been aware of this issue for a while now, but wasn=
't directly</pre><pre>working on it.  Now that I'm taking a closer look at =
this issue, I am</pre><pre>wondering how much USBGuard changes the equation=
?</pre><br><a href=3D"https://www.kernel.org/doc/Documentation/usb/authoriz=
ation.txt"><pre>https://www.kernel.org/doc/Documentation/usb/authorization.=
txt</pre></a><br><a href=3D"https://usbguard.github.io/"><pre>https://usbgu=
ard.github.io/</pre></a><br><pre>=09</pre><a href=3D"https://github.com/USB=
Guard/usbguard"><pre>https://github.com/USBGuard/usbguard</pre></a><br><br>=
<a href=3D"https://access.redhat.com/documentation/en-us/red_hat_enterprise=
_linux/7/html/security_guide/sec-using-usbguard"><pre>https://access.redhat=
.com/documentation/en-us/red_hat_enterprise_linux/7/html/security_guide/sec=
-using-usbguard</pre></a><br><br><pre>It has tools to generate baseline lis=
ts of devices, but this is only for</pre><pre>usb.  Other interfaces would =
need to be appropriately instrumented.</pre><br><pre>- RGB</pre><br><pre>--=
</pre><pre>Richard Guy Briggs &lt;</pre><a href=3D"mailto:rgb@redhat.com"><=
pre>rgb@redhat.com</pre></a><pre>&gt;</pre><pre>Sr. S/W Engineer, Kernel Se=
curity, Base Operating Systems</pre><pre>Remote, Ottawa, Red Hat Canada</pr=
e><pre>IRC: rgb, SunRaycer</pre><pre>Voice: +1.647.777.2635, Internal: (81)=
 32635</pre><br></blockquote>
<pre>--</pre><pre>Linux-audit mailing list</pre><a href=3D"mailto:Linux-aud=
it@redhat.com"><pre>Linux-audit@redhat.com</pre></a><pre><br></pre><a href=
=3D"https://www.redhat.com/mailman/listinfo/linux-audit"><pre>https://www.r=
edhat.com/mailman/listinfo/linux-audit</pre></a></blockquote></body></html>

--=-9SnKAer6DWEsTw71/rYE--

--===============1835200623041078498==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============1835200623041078498==--

