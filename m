Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1F6A5173596
	for <lists+linux-audit@lfdr.de>; Fri, 28 Feb 2020 11:47:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582886840;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=aXHJC+K2pXc6CsOi98NJMRxOrzZposc12ml05ymqHD0=;
	b=CzAJzi/G//e+xaasHsTuWGAehHBeO5fQCQT/T7R954J8wNKh7Xb/E8XtMuAuU/xR36wI+J
	FQnPI6bzxEkRUSwh6WFCui+vyp2TyS4MT6uOxcewmIfvnBgIscpHD+f1QufkC1o9f93mET
	pSD6KRzzzX9P+C8SwP8xdEvi3thw5kI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-0pkvtrUtNzKK-HACFz5a9Q-1; Fri, 28 Feb 2020 05:47:16 -0500
X-MC-Unique: 0pkvtrUtNzKK-HACFz5a9Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B298C13F5;
	Fri, 28 Feb 2020 10:47:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ADE0092996;
	Fri, 28 Feb 2020 10:47:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 77D8884480;
	Fri, 28 Feb 2020 10:46:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01SAkm7w014149 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 28 Feb 2020 05:46:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 94FA22166B2D; Fri, 28 Feb 2020 10:46:48 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 909792166B2A
	for <linux-audit@redhat.com>; Fri, 28 Feb 2020 10:46:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F6C9101A55F
	for <linux-audit@redhat.com>; Fri, 28 Feb 2020 10:46:46 +0000 (UTC)
Received: from smarthost1.atos.net (smtppost.atos.net [193.56.114.176])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-96-5PxckmCGMzibp5OMRSAY5A-1; Fri, 28 Feb 2020 05:46:43 -0500
X-MC-Unique: 5PxckmCGMzibp5OMRSAY5A-1
IronPort-SDR: SUxTbumEXAxQNg3grdvb3pj73VbA+HxisAMxFbdGmrxusfuFbwwChi9zC+GIRRhVpw2LD8X//5
	V9RlUSBC53E6a9xD6FEMGj45wAwR0tW2mfWO8796qyyX4t/k9RSR9001S9qWrMrsAyrfgjw2a/
	tBNd9dH+FhQJGjMQfMBELutj0h/8+1yTabDrvRjSjco/ju+6IN7ffdi7XU8TovSBm0+cJAcHYE
	t0ThzfRvAzcq5cHsgadA5WdIF4nCtFUOSdXHDxQO6gThCxMrP37I/olfQwI+0c4ZjJsiL6Aa4r
	YvOBzQZfvgXgdpSXsD5EvRyQ
X-IronPort-AV: E=Sophos;i="5.70,495,1574118000"; d="scan'208,217";a="15854191"
X-MGA-submission: =?us-ascii?q?MDEtD2jmBlUbTaj9HtROSW4vvRyRVNz+62qR1i?=
	=?us-ascii?q?3RtIrytSo10+JQW9ucw/lHjF5MnJwNKq30+sqEmGa4K3vb1SgQ+D/WqB?=
	=?us-ascii?q?x7ddev8ce8hEbCe9L418LdlIhU0iH6H/MtoeP12HaZCAvZn4N50TTOMZ?=
	=?us-ascii?q?VU?=
Received: from unknown (HELO DEERLM99ETYMSX.ww931.my-it-solutions.net)
	([10.86.142.47])
	by smarthost1.atos.net with ESMTP/TLS/ECDHE-RSA-AES256-SHA384;
	28 Feb 2020 11:46:41 +0100
Received: from DEERLM99EX7MSX.ww931.my-it-solutions.net ([169.254.9.55]) by
	DEERLM99ETYMSX.ww931.my-it-solutions.net ([10.86.142.47]) with mapi id
	14.03.0468.000; Fri, 28 Feb 2020 11:46:41 +0100
From: "MAUPERTUIS, PHILIPPE" <philippe.maupertuis@equensworldline.com>
To: "linux-audit@redhat.com" <linux-audit@redhat.com>
Subject: corrupted checkpoint
Thread-Topic: corrupted checkpoint
Thread-Index: AdXuGYX1rGOqALoSSpuOMui6HgS/Yw==
Date: Fri, 28 Feb 2020 10:46:40 +0000
Message-ID: <5F4EE10832231F4F921A255C1D9542982AC13B@DEERLM99EX7MSX.ww931.my-it-solutions.net>
Accept-Language: en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.86.142.14]
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
Content-Type: multipart/mixed; boundary="===============8269825086351483269=="

--===============8269825086351483269==
Content-Language: fr-FR
Content-Type: multipart/alternative;
	boundary="_000_5F4EE10832231F4F921A255C1D9542982AC13BDEERLM99EX7MSXww9_"

--_000_5F4EE10832231F4F921A255C1D9542982AC13BDEERLM99EX7MSXww9_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hi
I set a cron job script to perform ausearch every 5 minutes  on a central l=
og server.
The logs from various hosts are received together in the same file
The logs are rotated on a daily basis
Everything ran fine for several days, then suddently I got :
Corrupted checkpoint file. Inode match, but newer complete event (158268450=
1.003:48035) found before loaded checkpoint 1582684346.999:48034
The events are :
checkpoint
audit.log.3: node=3Dxxxxxxxx type=3DUSER_END msg=3Daudit(1582684346.999:480=
34): pid=3D15666 uid=3D0 auid=3D0
newer event
audit.log.2: node=3D xxxxxxxx type=3DUSER_ACCT msg=3Daudit(1582684501.003:4=
8035): pid=3D16000
I  guess the problem is due to the log rotation since the two messages are =
coming from the same host.
I have a few  questions
When it happens how can I restart the process ?
Is there a way to restart ausearch from the newer event ?
How could I extract the events between the checkpoint and the newer event ?
The checkpoint file contains :
dev=3D0xFD03
inode=3D1048581
output=3Dxxxxxxxx 1582770601.342:380885 0x456

What is this : 0x456 ?
How can I find the value for a given event ?

Philippe


Worldline and equensWorldline are a registered trademarks and trading names=
 owned by Worldline Group.
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

--_000_5F4EE10832231F4F921A255C1D9542982AC13BDEERLM99EX7MSXww9_
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I set a cron job script to perf=
orm ausearch every 5 minutes &nbsp;on a central log server.<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The logs from various hosts are=
 received together in the same file<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The logs are rotated on a daily=
 basis<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Everything ran fine for several=
 days, then suddently I got :<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Corrupted checkpoint file. Inod=
e match, but newer complete event (1582684501.003:48035) found before loade=
d checkpoint 1582684346.999:48034<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The events are :<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">checkpoint<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">audit.log.3: node=3Dxxxxxxxx ty=
pe=3DUSER_END msg=3Daudit(1582684346.999:48034): pid=3D15666 uid=3D0 auid=
=3D0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">newer event<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">audit.log.2: node=3D xxxxxxxx t=
ype=3DUSER_ACCT msg=3Daudit(1582684501.003:48035): pid=3D16000<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I &nbsp;guess the problem is du=
e to the log rotation since the two messages are coming from the same host.=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I have a few &nbsp;questions<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">When it happens how can I resta=
rt the process ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Is there a way to restart ausea=
rch from the newer event ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">How could I extract the events =
between the checkpoint and the newer event ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The checkpoint file contains :<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">dev=3D0xFD03<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">inode=3D1048581<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">output=3Dxxxxxxxx 1582770601.34=
2:380885 0x456<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">What is this : 0x456 ?<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">How can I find the value for a =
given event ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Philippe<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<p>Worldline and equensWorldline are a registered trademarks and trading na=
mes owned by Worldline Group.<br>
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

--_000_5F4EE10832231F4F921A255C1D9542982AC13BDEERLM99EX7MSXww9_--

--===============8269825086351483269==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============8269825086351483269==--

