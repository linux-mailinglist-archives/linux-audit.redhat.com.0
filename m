Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1E631293780
	for <lists+linux-audit@lfdr.de>; Tue, 20 Oct 2020 11:04:00 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-U7Jx2MQyPUS9qXyJRIWMKw-1; Tue, 20 Oct 2020 05:03:56 -0400
X-MC-Unique: U7Jx2MQyPUS9qXyJRIWMKw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B146710066FC;
	Tue, 20 Oct 2020 09:03:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F6967513E;
	Tue, 20 Oct 2020 09:03:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B04B344A7E;
	Tue, 20 Oct 2020 09:03:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09K921gt019528 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 20 Oct 2020 05:02:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CB81C115DF9; Tue, 20 Oct 2020 09:02:01 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5AA3115DFF
	for <linux-audit@redhat.com>; Tue, 20 Oct 2020 09:01:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8965C8726C9
	for <linux-audit@redhat.com>; Tue, 20 Oct 2020 09:01:58 +0000 (UTC)
Received: from smarthost1.atos.net (smtppost.atos.net [193.56.114.176])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-267-a9OB4cpvNC--LyGs19oRrg-1; Tue, 20 Oct 2020 05:01:55 -0400
X-MC-Unique: a9OB4cpvNC--LyGs19oRrg-1
IronPort-SDR: 3xUG30iub4wxX75mn1R8nJrhIk1Cx2xc0OeiNnyln/w0Lzc3Q4IYTo7J0i0UOGcBPD9g2hqrPm
	pJSp0vehcJR4uxhdaJ2kpOr/xo0NHapoviU3DYF0eJuHNQG6FfL+b467qjGwEu3+2ptklqX5aW
	NUaRV+UC70Xy89gMe6lq1MBCD4yXZe33NrVgFbDhFlN5T/l2KvpIdI2Z1bqw3bFy1+/amppNNj
	Bq3rKi5vRo9IzzTPorikxVbiqK6TFASwK1sve3fMgYcEemCDZFm7/ORbJVdrUBXrM5bYJn9eWl
	KKh7ESe/mvFaSYXDZ7iR9RH2
X-IronPort-AV: E=Sophos;i="5.77,396,1596492000"; 
	d="scan'208,217";a="138054698"
X-MGA-submission: =?us-ascii?q?MDG3No4N+OVEBEozUJyWI15OQwLviW2E9caq4j?=
	=?us-ascii?q?OI1/XmNwYvdx8ReBIzLKpnQKCLl1zZALIu7Dp9jy1yv6ny3RoQCbRgMj?=
	=?us-ascii?q?/QeKO2cKn4zvZGUqlGxngpO9fLYUFk6xAQak5KXrJ2xfsVMz7MRUqSPx?=
	=?us-ascii?q?bJ?=
Received: from unknown (HELO DEERLM99ETTMSX.ww931.my-it-solutions.net)
	([10.86.142.105])
	by smarthost1.atos.net with ESMTP/TLS/ECDHE-RSA-AES256-SHA384;
	20 Oct 2020 10:59:58 +0200
Received: from DEERLM99EX7MSX.ww931.my-it-solutions.net ([169.254.9.44]) by
	DEERLM99ETTMSX.ww931.my-it-solutions.net ([10.86.142.105]) with mapi id
	14.03.0487.000; Tue, 20 Oct 2020 10:59:57 +0200
From: "MAUPERTUIS, PHILIPPE" <philippe.maupertuis@equensworldline.com>
To: "linux-audit@redhat.com" <linux-audit@redhat.com>
Subject: How to monitor only when a binary is launched
Thread-Topic: How to monitor only when a binary is launched
Thread-Index: AdamvQ1BIRDTL6JQQJOxN0dulZJVeQ==
Date: Tue, 20 Oct 2020 08:59:56 +0000
Message-ID: <5F4EE10832231F4F921A255C1D954298154FB33A@DEERLM99EX7MSX.ww931.my-it-solutions.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.86.142.14]
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: fr-FR
Content-Type: multipart/mixed; boundary="===============5049705555096759974=="

--===============5049705555096759974==
Content-Language: fr-FR
Content-Type: multipart/alternative;
	boundary="_000_5F4EE10832231F4F921A255C1D954298154FB33ADEERLM99EX7MSXw_"

--_000_5F4EE10832231F4F921A255C1D954298154FB33ADEERLM99EX7MSXw_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,
Aide or clamscan are analyzing all the files on the system thus generating =
a lot of messages
They are binaries that I can trust so I can exclude their activity from aud=
itd.
I know that I can do this with -a never,exit -F arch=3Db64 -F exe=3D/sbin/a=
ide

However I would like to have an entry for the execution of the binary itsel=
f with the parameters used.
I would like to turn off only the report of the syscall it issued .

Is there a general way to achieve that : record the launch of a binary but =
not its actions.
Thanks
Philippe
Worldline and equensWorldline are registered trademarks and trading names o=
wned by the Worldline Group.
This e-mail and any documents attached are confidential and intended solely=
 for the addressee. If you receive this e-mail in error, you are not author=
ized to copy, disclose, use or retain it. Please notify the sender immediat=
ely and delete this e-mail from your systems. As e-mails may be intercepted=
, amended or lost, they are not secure. Worldline and its subsidiaries ther=
efore cannot accept liability for any errors in their content. Although Wor=
ldline endeavours to maintain a virus-free network, we do not warrant that =
this e-mail is virus-free and cannot accept liability for any damages resul=
ting from any transmitted virus if any. The risks are deemed to be accepted=
 by anyone who communicates with Worldline or its subsidiaries by e-mail.

--_000_5F4EE10832231F4F921A255C1D954298154FB33ADEERLM99EX7MSXw_
Content-Type: text/html; charset="us-ascii"
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hello,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Aide or clamscan are analyzing =
all the files on the system thus generating a lot of messages<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">They are binaries that I can tr=
ust so I can exclude their activity from auditd.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I know that I can do this with =
-a never,exit -F arch=3Db64 -F exe=3D/sbin/aide<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">However I would like to have an=
 entry for the execution of the binary itself with the parameters used.<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I would like to turn off only t=
he report of the syscall it issued .<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Is there a general way to achie=
ve that : record the launch of a binary but not its actions.<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Philippe<o:p></o:p></span></p>
</div>
<div>Worldline and equensWorldline are registered trademarks and trading na=
mes owned by the Worldline Group.<br>
This e-mail and any documents attached are confidential and intended solely=
 for the addressee. If you receive this e-mail in error, you are not author=
ized to copy, disclose, use or retain it. Please notify the sender immediat=
ely and delete this e-mail from
 your systems. As e-mails may be intercepted, amended or lost, they are not=
 secure. Worldline and its subsidiaries therefore cannot accept liability f=
or any errors in their content. Although Worldline endeavours to maintain a=
 virus-free network, we do not warrant
 that this e-mail is virus-free and cannot accept liability for any damages=
 resulting from any transmitted virus if any. The risks are deemed to be ac=
cepted by anyone who communicates with Worldline or its subsidiaries by e-m=
ail.</div>
</body>
</html>

--_000_5F4EE10832231F4F921A255C1D954298154FB33ADEERLM99EX7MSXw_--

--===============5049705555096759974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============5049705555096759974==--

