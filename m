Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3914A290
	for <lists+linux-audit@lfdr.de>; Tue, 18 Jun 2019 15:42:39 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DA0DA83F3C;
	Tue, 18 Jun 2019 13:41:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E783319492;
	Tue, 18 Jun 2019 13:41:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 31BCF206D2;
	Tue, 18 Jun 2019 13:41:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5IDeNTA025125 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 18 Jun 2019 09:40:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9FC1C3769; Tue, 18 Jun 2019 13:40:23 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 99D815BBBD
	for <linux-audit@redhat.com>; Tue, 18 Jun 2019 13:40:21 +0000 (UTC)
Received: from smtppost.atos.net (smtppost.atos.net [193.56.114.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 379BE5277D
	for <linux-audit@redhat.com>; Tue, 18 Jun 2019 13:40:10 +0000 (UTC)
Received: from mail3-ext.my-it-solutions.net (mail3-ext.my-it-solutions.net)
	by smarthost5.atos.net with smtp
	(TLS: TLSv1/SSLv3,256bits,ECDHE-RSA-AES256-GCM-SHA384)
	id 5c3e_2424_1b20d816_cf38_4567_9b18_d2dbfccfaa02;
	Tue, 18 Jun 2019 15:34:09 +0200
Received: from mail3-int.my-it-solutions.net ([10.92.32.10])
	by mail3-ext.my-it-solutions.net (8.15.2/8.15.2) with ESMTPS id
	x5IDY9XT004597
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-audit@redhat.com>; Tue, 18 Jun 2019 15:34:09 +0200
Received: from DEERLM99ETRMSX.ww931.my-it-solutions.net ([10.86.142.103])
	by mail3-int.my-it-solutions.net (8.15.2/8.15.2) with ESMTPS id
	x5IDY9kW015841
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <linux-audit@redhat.com>; Tue, 18 Jun 2019 15:34:09 +0200
Received: from DEERLM99EX7MSX.ww931.my-it-solutions.net ([169.254.9.210]) by
	DEERLM99ETRMSX.ww931.my-it-solutions.net ([10.86.142.103]) with mapi id
	14.03.0439.000; Tue, 18 Jun 2019 15:34:09 +0200
From: "MAUPERTUIS, PHILIPPE" <philippe.maupertuis@equensworldline.com>
To: "linux-audit@redhat.com" <linux-audit@redhat.com>
Subject: audit-3.0
Thread-Topic: audit-3.0
Thread-Index: AdUl2OKomcO7uJvgTyWBVtiYDWH83w==
Date: Tue, 18 Jun 2019 13:34:08 +0000
Message-ID: <5F4EE10832231F4F921A255C1D95429807F871@DEERLM99EX7MSX.ww931.my-it-solutions.net>
Accept-Language: en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.86.142.14]
MIME-Version: 1.0
X-Greylist: Delayed for 00:05:29 by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.29]); Tue, 18 Jun 2019 13:40:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Tue, 18 Jun 2019 13:40:11 +0000 (UTC) for IP:'193.56.114.176'
	DOMAIN:'smtppost.atos.net' HELO:'smtppost.atos.net'
	FROM:'philippe.maupertuis@equensworldline.com' RCPT:''
X-RedHat-Spam-Score: 0.004  (HTML_MESSAGE, SPF_HELO_NONE, SPF_NONE,
	UNPARSEABLE_RELAY) 193.56.114.176 smtppost.atos.net
	193.56.114.176 smtppost.atos.net
	<philippe.maupertuis@equensworldline.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Content-Type: multipart/mixed; boundary="===============3711630037278630879=="
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Tue, 18 Jun 2019 13:42:38 +0000 (UTC)

--===============3711630037278630879==
Content-Language: fr-FR
Content-Type: multipart/alternative;
	boundary="_000_5F4EE10832231F4F921A255C1D95429807F871DEERLM99EX7MSXww9_"

--_000_5F4EE10832231F4F921A255C1D95429807F871DEERLM99EX7MSXww9_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
On the mailing list a few days ago, it was announce that Audit-3.0 alpha8  =
was available.
I am a little bit confused because on a RHEL 8 server I get :
rpm -q audit
audit-3.0-0.10.20180831git0047a6c.el8.x86_64
What are the link between the Rhel 8 rpm and the version audit-3.0 announce=
d.
I can't imagine RHEL8 using an alpha version.

As the side note the Rhel 8 rpm has the following description
rpm -qi audit
Name        : audit
Version     : 3.0
Release     : 0.10.20180831git0047a6c.el8
Architecture: x86_64
Install Date: Mon 17 Jun 2019 05:55:23 PM CEST
Group       : Unspecified
Size        : 678098
License     : GPLv2+
Signature   : RSA/SHA256, Wed 09 Jan 2019 07:26:49 PM CET, Key ID 199e2f91f=
d431d51
Source RPM  : audit-3.0-0.10.20180831git0047a6c.el8.src.rpm
Build Date  : Wed 09 Jan 2019 06:26:29 PM CET
Build Host  : x86-vm-06.build.eng.bos.redhat.com
Relocations : (not relocatable)
Packager    : Red Hat, Inc. <http://bugzilla.redhat.com/bugzilla>
Vendor      : Red Hat, Inc.
URL         : http://people.redhat.com/sgrubb/audit/
Summary     : User space tools for 2.6 kernel auditing

Of course the kernel for REHL8 is :
rpm -q kernel
kernel-4.18.0-80.el8.x86_64

Any clarification is welcome
Philippe

equensWorldline is a registered trade mark and trading name owned by the Wo=
rldline Group through its holding company.
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
nsWorldline and the Worldline Group by email

--_000_5F4EE10832231F4F921A255C1D95429807F871DEERLM99EX7MSXww9_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:m=3D"http://schema=
s.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html=
40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"FR" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On the mailing list a few days =
ago, it was announce that Audit-3.0 alpha8 &nbsp;was available.<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I am a little bit confused beca=
use on a RHEL 8 server I get :<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">rpm -q audit<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">audit-3.0-0.10.20180831git0047a=
6c.el8.x86_64<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">What are the link between the R=
hel 8 rpm and the version audit-3.0 announced.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I can&#8217;t imagine RHEL8 usi=
ng an alpha version.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">As the side note the Rhel 8 rpm=
 has the following description<o:p></o:p></span></p>
<p class=3D"MsoNormal">rpm -qi audit<o:p></o:p></p>
<p class=3D"MsoNormal">Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : aud=
it<o:p></o:p></p>
<p class=3D"MsoNormal">Version&nbsp;&nbsp;&nbsp;&nbsp; : 3.0<o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Release&nbsp;&nbsp;&nbsp;&nbsp;=
 : 0.10.20180831git0047a6c.el8<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Architecture: x86_64<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal">Install Date: Mon 17 Jun 2019 05:55:23 PM CEST<o:p><=
/o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Group&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; : Unspecified<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Size&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; : 678098<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">License&nbsp;&nbsp;&nbsp;&nbsp;=
 : GPLv2&#43;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Signature&nbsp;&nbsp; : RSA/SHA=
256, Wed 09 Jan 2019 07:26:49 PM CET, Key ID 199e2f91fd431d51<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Source RPM&nbsp; : audit-3.0-0.=
10.20180831git0047a6c.el8.src.rpm<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Build Date&nbsp; : Wed 09 Jan 2=
019 06:26:29 PM CET<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Build Host&nbsp; : x86-vm-06.bu=
ild.eng.bos.redhat.com<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Relocations : (not relocatable)=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Packager&nbsp;&nbsp;&nbsp; : Re=
d Hat, Inc. &lt;http://bugzilla.redhat.com/bugzilla&gt;<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Vendor&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; : Red Hat, Inc.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">URL&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; : http://people.redhat.com/sgrubb/audit/<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">Summary&nbsp;&nbsp;&nbsp;&nb=
sp; : User space tools for 2.6 kernel auditing<o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Of course the kernel for REHL8 =
is :<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">rpm -q kernel<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">kernel-4.18.0-80.el8.x86_64<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Any clarification is welcome<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Philippe<o:p></o:p></span></p>
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
</body>
</html>

--_000_5F4EE10832231F4F921A255C1D95429807F871DEERLM99EX7MSXww9_--


--===============3711630037278630879==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============3711630037278630879==--

