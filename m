Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id B584E155531
	for <lists+linux-audit@lfdr.de>; Fri,  7 Feb 2020 11:02:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581069759;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=f3XmT1GA+Hj4wfLSWJXZRxJiwFppf1A1K1QoHf6H9vQ=;
	b=K5MZC7G859v2vMXZYS3HYYvIh6wGNykhaGxtX78PZlOZR2EwgNKET5tCTt7k3kqyKFLVov
	lEYXmU5aTk7SPGbwJx0lzuIkm+y3Ei4+zxNrvZnx95+ITcTnmaTe40dKML38YVnLy7a0rB
	HQsjO4hXYsrm/VhZoI0gaw/uppeR27A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-DoNvJo_bNNC802onZ172ag-1; Fri, 07 Feb 2020 05:02:36 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 430C98010D6;
	Fri,  7 Feb 2020 10:02:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 36DC8790E5;
	Fri,  7 Feb 2020 10:02:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0CF7818089CE;
	Fri,  7 Feb 2020 10:02:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 017A29jT028657 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 7 Feb 2020 05:02:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A6DBD10F8E16; Fri,  7 Feb 2020 10:02:09 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A1EE710F8E12
	for <linux-audit@redhat.com>; Fri,  7 Feb 2020 10:02:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 137C618AE976
	for <linux-audit@redhat.com>; Fri,  7 Feb 2020 10:02:07 +0000 (UTC)
IronPort-SDR: oNGi3ej2bqXzDs472ugtjq3FKM1X6oqYWat/eLA0MlpC5fwhQL2pq5aQxkME/yp92MEdyicmTa
	X+ac2eYSX7vL+Ntem8zYNSt7EngK+kt58VmiRqJqJ/e7VWDw22duotNttbvecMgvqtF9fuCge/
	jy91hdoZSgXLlnRHmofKjFoRhkfzZ4JJHxNPaYAp14kmzbtJ6s7xUx4gWTsegsJslvGnEDMeZV
	/wYCXb3pfGSTcxXDyZeNF9sCyxMej5zGtUylUHE7gbyX75kT0vOSjtFLf/f32xH3OBjlh7/HdZ
	vU6B5SnZRrMYNFEkKEaG2GxX
X-IronPort-AV: E=Sophos;i="5.70,412,1574118000"; d="scan'208,217";a="39120331"
X-MGA-submission: =?us-ascii?q?MDFrVOGioApnlWM30odhlS1YaoBd+jsa12R+qx?=
	=?us-ascii?q?yfjz3m+KJyYIf8YLFHCe4epTvNMEH7+KopYLcfV/6RQp+wVgZ4FYM9s5?=
	=?us-ascii?q?ArsUWMV+617u8j5wHZbsehtX3KYWCmhG+1ufBvtn/od5TUvQSoB4FJWn?=
	=?us-ascii?q?US?=
Received: from smarthost6.atos.net (smtppost.atos.net [193.56.114.177])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-216-lc-8b4llOle_mUs9EH86Aw-1; Fri, 07 Feb 2020 05:02:04 -0500
Received: from unknown (HELO DEERLM99ETXMSX.ww931.my-it-solutions.net)
	([10.86.142.46])
	by smarthost6.atos.net with ESMTP/TLS/ECDHE-RSA-AES256-SHA384;
	07 Feb 2020 11:02:02 +0100
Received: from DEERLM99EX7MSX.ww931.my-it-solutions.net ([169.254.9.55]) by
	DEERLM99ETXMSX.ww931.my-it-solutions.net ([10.86.142.46]) with mapi id
	14.03.0468.000; Fri, 7 Feb 2020 11:02:01 +0100
From: "MAUPERTUIS, PHILIPPE" <philippe.maupertuis@equensworldline.com>
To: "linux-audit@redhat.com" <linux-audit@redhat.com>
Subject: audisp-remote
Thread-Topic: audisp-remote
Thread-Index: AdXdmJKF7QAm0YkYStektGxabbttyQ==
Date: Fri, 7 Feb 2020 10:02:01 +0000
Message-ID: <5F4EE10832231F4F921A255C1D95429829B091@DEERLM99EX7MSX.ww931.my-it-solutions.net>
Accept-Language: en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.86.142.14]
MIME-Version: 1.0
X-MC-Unique: lc-8b4llOle_mUs9EH86Aw-1
X-MC-Unique: DoNvJo_bNNC802onZ172ag-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============6960797251914953522=="

--===============6960797251914953522==
Content-Language: fr-FR
Content-Type: multipart/alternative;
	boundary="_000_5F4EE10832231F4F921A255C1D95429829B091DEERLM99EX7MSXww9_"

--_000_5F4EE10832231F4F921A255C1D95429829B091DEERLM99EX7MSXww9_
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: quoted-printable

Hi,
Apart the man pages, I didn=1B$B!G=1B(Bt find anything useful relating to a=
udisp-remote.
I am searching information on how it scales ? Is there any performance issu=
e ?
How to use it in a large environment ? =1B$B!D=1B(B.
Most of what I found dated a long time ago and mainly said use rsyslog inst=
ead.
It seems that centralizing the messages through rsyslog is far more popular=
.
Is audisp-remote really used ?
The man page read :
       tcp_max_per_addr
              This  is  a  numeric  value  which  indicates  how many concu=
rrent connections from one IP address is allowed.  The
              default is 1 and the maximum is 1024. Setting this too large =
may allow for a Denial of Service attack on  the  log=1B$B!>=1B(B
              ging  server.  Also  note  that the kernel has an internal ma=
ximum that will eventually prevent this even if auditd
              allows it by config. The default should be adequate in most c=
ases unless a custom written recovery script  runs  to
              forward unsent events. In this case you would increase the nu=
mber only large enough to let it in too.
Where could I find an example of recovery script ?
Could it be a way to inject the audit message in auditd after having receiv=
ing them via rsyslog ?
This might be useful just because, by default ausearch in all available log=
s and the -if parameter accepts only one file.


Maybe my lack of knowledge about auditd leads me to write rubbish.
If so, please direct me to where I can find how to manage and use audit log=
s after centralizing them.
Not only keeping them but  acutually using them.

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

--_000_5F4EE10832231F4F921A255C1D95429829B091DEERLM99EX7MSXww9_
Content-Type: text/html; charset=ISO-2022-JP
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Apart the man pages, I didn=1B$=
B!G=1B(Bt find anything useful relating to audisp-remote.<br>
I am searching information on how it scales ? Is there any performance issu=
e ?<br>
How to use it in a large environment ? =1B$B!D=1B(B.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Most of what I found dated a lo=
ng time ago and mainly said use rsyslog instead.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">It seems that centralizing the =
messages through rsyslog is far more popular.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Is audisp-remote really used ?<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The man page read :<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; tcp_max_per_addr<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This&nbsp; is&nbsp; a&nbsp;=
 numeric &nbsp;value&nbsp; which&nbsp; indicates&nbsp; how many concurrent =
connections from one IP address is allowed.&nbsp; The<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default is 1 and the maximu=
m is 1024. Setting this too large may allow for a Denial of Service attack =
on&nbsp; the&nbsp; log=1B$B!>=1B(B<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ging&nbsp; server.&nbsp; Al=
so&nbsp; note&nbsp; that the kernel has an internal maximum that will event=
ually prevent this even if auditd<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; allows it by config. The de=
fault should be adequate in most cases unless a custom written recovery scr=
ipt&nbsp; runs&nbsp; to<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; forward unsent events. In t=
his case you would increase the number only large enough to let it in too.<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Where could I find an example o=
f recovery script ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Could it be a way to inject the=
 audit message in auditd after having receiving them via rsyslog ?<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">This might be useful just becau=
se, by default ausearch in all available logs and the &#8211;if parameter a=
ccepts only one file.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Maybe my lack of knowledge abou=
t auditd leads me to write rubbish.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">If so, please direct me to wher=
e I can find how to manage and use audit logs after centralizing them.<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Not only keeping them but&nbsp;=
 acutually using them.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Philippe <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;<o:p></o:p></span><=
/p>
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

--_000_5F4EE10832231F4F921A255C1D95429829B091DEERLM99EX7MSXww9_--

--===============6960797251914953522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============6960797251914953522==--

