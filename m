Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4B900F12A0
	for <lists+linux-audit@lfdr.de>; Wed,  6 Nov 2019 10:46:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573033607;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=UHdAB9KI93iAH3vYX6juim5yTDQnut8drr7ZWq/Z4mQ=;
	b=grLpGSfJ3wYV+3UbGqzMTa36f53K942P9yJEJJJj5D0vMjD6fDA6MgDGkfql4kTZQ+6ubP
	T8K22FDzHc+DWlzS0/gHz6xxhsra5mwL+e5DmJgHkZ5i4MN2CdlC5fC55QqszhJcuiV6RM
	Uhf1HdnbhzJrxFvlEg+gtYIyvj5QALw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-Igr4hvUDPkOW9liYfMZeGg-1; Wed, 06 Nov 2019 04:46:45 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52351477;
	Wed,  6 Nov 2019 09:46:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A0A8600C4;
	Wed,  6 Nov 2019 09:46:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2DB701803C37;
	Wed,  6 Nov 2019 09:46:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA69e1fw018101 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 6 Nov 2019 04:40:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CC7C960852; Wed,  6 Nov 2019 09:40:01 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C4D32608AC
	for <linux-audit@redhat.com>; Wed,  6 Nov 2019 09:39:59 +0000 (UTC)
Received: from smtppost.atos.net (smtppost.atos.net [193.56.114.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A99BE307D844
	for <linux-audit@redhat.com>; Wed,  6 Nov 2019 09:39:56 +0000 (UTC)
IronPort-SDR: WWcyxLSrg2Zjq61YVuwIFSXngzaRKogEaUKwNy/MocpXCmpzx6Cwx1K3/bHIdLsYZFpfd9kCkH
	FZYZjjeHxXmbPUR1ruGF1kd1TavpxPYagOv3TI/JbgSdp+GQZ1LXW19hsKmytMKDRwvAgZg7u2
	c6OYsrjmw6jBQrlG04iO1TVnRg7WC3BRfsboVwkVwY5OckPHjzu5VHxfdF0Pe4isy54EYo0Ktp
	6GlgPWITLDUFHdW36RMRQNi5lV+utEqkxi3eXYAYHPos47bWYmHRyfZeu4Wqx9b2OQYasRxFb2
	veU=
X-IronPort-AV: E=Sophos;i="5.68,274,1569276000"; d="scan'208,217";a="25892544"
Received: from unknown (HELO DEERLM99ETTMSX.ww931.my-it-solutions.net)
	([10.86.142.105])
	by smtppost.atos.net with ESMTP/TLS/ECDHE-RSA-AES256-SHA384;
	06 Nov 2019 10:39:55 +0100
Received: from DEERLM99EX7MSX.ww931.my-it-solutions.net ([169.254.9.56]) by
	DEERLM99ETTMSX.ww931.my-it-solutions.net ([10.86.142.105]) with mapi id
	14.03.0439.000; Wed, 6 Nov 2019 10:39:54 +0100
From: "MAUPERTUIS, PHILIPPE" <philippe.maupertuis@equensworldline.com>
To: "linux-audit@redhat.com" <linux-audit@redhat.com>
Subject: RHEL 8  audit rules
Thread-Topic: RHEL 8  audit rules
Thread-Index: AdWUhA2K8qlw/DplSiGM1KVjgsz8ug==
Date: Wed, 6 Nov 2019 09:39:54 +0000
Message-ID: <5F4EE10832231F4F921A255C1D95429819F47E@DEERLM99EX7MSX.ww931.my-it-solutions.net>
Accept-Language: en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.86.142.14]
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.48]); Wed, 06 Nov 2019 09:39:58 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Wed, 06 Nov 2019 09:39:58 +0000 (UTC) for IP:'193.56.114.176'
	DOMAIN:'smtppost.atos.net' HELO:'smtppost.atos.net'
	FROM:'philippe.maupertuis@equensworldline.com' RCPT:''
X-RedHat-Spam-Score: -2.299  (HTML_MESSAGE, RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 193.56.114.176 smtppost.atos.net 193.56.114.176
	smtppost.atos.net <philippe.maupertuis@equensworldline.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: Igr4hvUDPkOW9liYfMZeGg-1
X-Mimecast-Spam-Score: 0
Content-Type: multipart/mixed; boundary="===============8892289376088853480=="

--===============8892289376088853480==
Content-Language: fr-FR
Content-Type: multipart/alternative;
	boundary="_000_5F4EE10832231F4F921A255C1D95429819F47EDEERLM99EX7MSXww9_"

--_000_5F4EE10832231F4F921A255C1D95429819F47EDEERLM99EX7MSXww9_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hi,
The rules proposed in /usr/share/doc/audit/rules/ contain 32 bits stuff.
For example :
## 10.2.5.b All elevation of privileges is logged
-a always,exit -F arch=3Db64 -S setuid -F a0=3D0 -F exe=3D/usr/bin/su -F ke=
y=3D10.2.5.b-elevated-privs-session
-a always,exit -F arch=3Db32 -S setuid -F a0=3D0 -F exe=3D/usr/bin/su -F ke=
y=3D10.2.5.b-elevated-privs-session

Is it still necessary for RHEL 8 ?
Would the 21-no32bit.rules be enough ?
Can we run any 32 bits binary on rhel 8 ?

Regards
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

--_000_5F4EE10832231F4F921A255C1D95429819F47EDEERLM99EX7MSXww9_
Content-Type: text/html; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
=09{font-family:Calibri;
=09panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
=09{margin:0cm;
=09margin-bottom:.0001pt;
=09font-size:11.0pt;
=09font-family:"Calibri","sans-serif";
=09mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
=09{mso-style-priority:99;
=09color:blue;
=09text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
=09{mso-style-priority:99;
=09color:purple;
=09text-decoration:underline;}
span.EmailStyle17
=09{mso-style-type:personal-compose;
=09font-family:"Calibri","sans-serif";
=09color:windowtext;}
.MsoChpDefault
=09{mso-style-type:export-only;
=09font-family:"Calibri","sans-serif";
=09mso-fareast-language:EN-US;}
@page WordSection1
=09{size:612.0pt 792.0pt;
=09margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.WordSection1
=09{page:WordSection1;}
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">The rules proposed in /usr/shar=
e/doc/audit/rules/ contain 32 bits stuff.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">For example :<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">## 10.2.5.b All elevation of pr=
ivileges is logged<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">-a always,exit -F arch=3Db64 -S=
 setuid -F a0=3D0 -F exe=3D/usr/bin/su -F key=3D10.2.5.b-elevated-privs-ses=
sion<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">-a always,exit -F arch=3Db32 -S=
 setuid -F a0=3D0 -F exe=3D/usr/bin/su -F key=3D10.2.5.b-elevated-privs-ses=
sion<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Is it still necessary for RHEL =
8 ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Would the 21-no32bit.rules be e=
nough ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Can we run any 32 bits binary o=
n rhel 8 ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Regards<o:p></o:p></span></p>
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

--_000_5F4EE10832231F4F921A255C1D95429819F47EDEERLM99EX7MSXww9_--

--===============8892289376088853480==
Content-Type: text/plain; charset=WINDOWS-1252
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============8892289376088853480==--

