Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 72C7B12294C
	for <lists+linux-audit@lfdr.de>; Tue, 17 Dec 2019 11:58:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576580306;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=5k+Dk317iTCeGRDRcPxOU09FTr8oQ5dhGRd4URTzcA8=;
	b=YeOYn70CCj3mOB2K5I/tdyOaz6u+gLvPgG/zN5gQOuO81j8WKqHDG9F0/4ZzCkaeQ7cncr
	//yZHNpvmqplTEvo9A3TX9C4ymEnn8QcK0E7QZjpiauQtEMkE0ZM5X3mGRNuyzy3v1HgTS
	PKQ4kVAhIRlWv6TtpO0fPFyMjZPivd8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-_X9RXaKrPDasJZjMgbB5lQ-1; Tue, 17 Dec 2019 05:58:24 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D393BDB24;
	Tue, 17 Dec 2019 10:58:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ABC085D9C9;
	Tue, 17 Dec 2019 10:58:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0874818089CD;
	Tue, 17 Dec 2019 10:58:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBHAw2Hb017434 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 17 Dec 2019 05:58:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 157462166B29; Tue, 17 Dec 2019 10:58:02 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FECD2166B2D
	for <linux-audit@redhat.com>; Tue, 17 Dec 2019 10:58:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E91158002F5
	for <linux-audit@redhat.com>; Tue, 17 Dec 2019 10:57:59 +0000 (UTC)
IronPort-SDR: /eNGgkotf/ygAKRe99rnXxxpnqpVnsjmlA85WFM+m/DwSmG29nvIBpFeJW0mDxNyTCIMHS2JiG
	n7WXUKQu8UKtEyOkyOJY7t4aS9jhGrmWlfzo+vpvJnkt7qgnhS2b0IogHYRK2AoGCk+q7XgSB0
	y7W95GZ9Xh2A9QgkMkzuo54f04UnQz21uCxDqxFEcXTaXnO7pfcy6cHK+sX+TZLU66AWDgKczS
	oEOdhhj+EmdFOjroXdW9cEOitWcaxvybZtDA2AV/alkCGxq9VsO/koQM42EjpyKAdZ3qjtaT/G
	eeuqRq2XitmO/6WZk/kOGIC7
X-IronPort-AV: E=Sophos;i="5.69,325,1571695200"; d="scan'208,217";a="16046452"
X-MGA-submission: =?us-ascii?q?MDG7dAaPZ90x8wAxJzrDsFU4AGd35qoV9qjMcZ?=
	=?us-ascii?q?euzm0VdgDgyqlTkvCTCYAUWFX6dtf2bNXikrrquELSpWyudXOJQFMCpa?=
	=?us-ascii?q?IsDe7JJ9tC5KRSMoaBVBWN2mj4tR1ovbqVFll0n8r3PuL6/xh0+p3f2m?=
	=?us-ascii?q?rd?=
Received: from smarthost2.atos.net (smtppost.atos.net [193.56.114.177])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-117-B-7d4LmaOMu2ZMsK0cO8ZA-1; Tue, 17 Dec 2019 05:57:57 -0500
Received: from unknown (HELO DEERLM99ETRMSX.ww931.my-it-solutions.net)
	([10.86.142.103])
	by smarthost2.atos.net with ESMTP/TLS/ECDHE-RSA-AES256-SHA384;
	17 Dec 2019 11:57:57 +0100
Received: from DEERLM99EX7MSX.ww931.my-it-solutions.net ([169.254.9.235]) by
	DEERLM99ETRMSX.ww931.my-it-solutions.net ([10.86.142.103]) with mapi id
	14.03.0468.000; Tue, 17 Dec 2019 11:57:55 +0100
From: "MAUPERTUIS, PHILIPPE" <philippe.maupertuis@equensworldline.com>
To: "linux-audit@redhat.com" <linux-audit@redhat.com>
Subject: Matching SSHD information in audit logs
Thread-Topic: Matching SSHD information in audit logs
Thread-Index: AdW0xsE2xs4NnhHyQk20NBwcglIfxA==
Date: Tue, 17 Dec 2019 10:57:53 +0000
Message-ID: <5F4EE10832231F4F921A255C1D95429822CB57@DEERLM99EX7MSX.ww931.my-it-solutions.net>
Accept-Language: en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.86.142.14]
MIME-Version: 1.0
X-MC-Unique: B-7d4LmaOMu2ZMsK0cO8ZA-1
X-MC-Unique: _X9RXaKrPDasJZjMgbB5lQ-1
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
Content-Type: multipart/mixed; boundary="===============1565808179675713843=="

--===============1565808179675713843==
Content-Language: fr-FR
Content-Type: multipart/alternative;
	boundary="_000_5F4EE10832231F4F921A255C1D95429822CB57DEERLM99EX7MSXww9_"

--_000_5F4EE10832231F4F921A255C1D95429822CB57DEERLM99EX7MSXww9_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hi,
When setting the SSHD log level to verbose as recommended by the CIS, I get=
 the following in the secure log :
Dec 17 11:32:29 myserver sshd[8456]: Connection from xx.xx.xx.xx port 44090=
 on xx.xx.xx.xx port 22
Dec 17 11:32:30 myserver sshd[8456]: Accepted key RSA SHA256: qhpzQKKbwaX8 =
found at /usr/bin/sss_ssh_authorizedkeys:1
Dec 17 11:32:30 myserver sshd[8456]: Postponed publickey for myuser from xx=
.xx.xx.xx port 44090 ssh2 [preauth]
Dec 17 11:32:30 myserver sshd[8456]: Accepted key RSA SHA256: qhpzQKKbwaX8 =
found at /usr/bin/sss_ssh_authorizedkeys:1
Dec 17 11:32:30 myserver sshd[8456]: Accepted publickey for myuser from xx.=
xx.xx.xx port 44090 ssh2: RSA SHA256: qhpzQKKbwaX8
Dec 17 11:32:30 myserver sshd[8456]: pam_unix(sshd:session): session opened=
 for user myuser by (uid=3D0)
Dec 17 11:32:31 myserver sshd[8456]: User child is on pid 8460
Dec 17 11:32:31 myserver sshd[8460]: Starting session: shell on pts/4 for m=
yuser from xx.xx.xx.xx port 44090 id 0

What are the corresponding events in audit ?
My main concern is with the bold line which indicates how the public key wa=
s granted

Could you point me to a documentation showing which events a ssh login woul=
d generate ?

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

--_000_5F4EE10832231F4F921A255C1D95429822CB57DEERLM99EX7MSXww9_
Content-Type: text/html; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:p=3D"urn:schemas-m=
icrosoft-com:office:powerpoint" xmlns:a=3D"urn:schemas-microsoft-com:office=
:access" xmlns:dt=3D"uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" xmlns:s=3D"=
uuid:BDC6E3F0-6DA3-11d1-A2A3-00AA00C14882" xmlns:rs=3D"urn:schemas-microsof=
t-com:rowset" xmlns:z=3D"#RowsetSchema" xmlns:b=3D"urn:schemas-microsoft-co=
m:office:publisher" xmlns:ss=3D"urn:schemas-microsoft-com:office:spreadshee=
t" xmlns:c=3D"urn:schemas-microsoft-com:office:component:spreadsheet" xmlns=
:odc=3D"urn:schemas-microsoft-com:office:odc" xmlns:oa=3D"urn:schemas-micro=
soft-com:office:activation" xmlns:html=3D"http://www.w3.org/TR/REC-html40" =
xmlns:q=3D"http://schemas.xmlsoap.org/soap/envelope/" xmlns:rtc=3D"http://m=
icrosoft.com/officenet/conferencing" xmlns:D=3D"DAV:" xmlns:Repl=3D"http://=
schemas.microsoft.com/repl/" xmlns:mt=3D"http://schemas.microsoft.com/share=
point/soap/meetings/" xmlns:x2=3D"http://schemas.microsoft.com/office/excel=
/2003/xml" xmlns:ppda=3D"http://www.passport.com/NameSpace.xsd" xmlns:ois=
=3D"http://schemas.microsoft.com/sharepoint/soap/ois/" xmlns:dir=3D"http://=
schemas.microsoft.com/sharepoint/soap/directory/" xmlns:ds=3D"http://www.w3=
.org/2000/09/xmldsig#" xmlns:dsp=3D"http://schemas.microsoft.com/sharepoint=
/dsp" xmlns:udc=3D"http://schemas.microsoft.com/data/udc" xmlns:xsd=3D"http=
://www.w3.org/2001/XMLSchema" xmlns:sub=3D"http://schemas.microsoft.com/sha=
repoint/soap/2002/1/alerts/" xmlns:ec=3D"http://www.w3.org/2001/04/xmlenc#"=
 xmlns:sp=3D"http://schemas.microsoft.com/sharepoint/" xmlns:sps=3D"http://=
schemas.microsoft.com/sharepoint/soap/" xmlns:xsi=3D"http://www.w3.org/2001=
/XMLSchema-instance" xmlns:udcs=3D"http://schemas.microsoft.com/data/udc/so=
ap" xmlns:udcxf=3D"http://schemas.microsoft.com/data/udc/xmlfile" xmlns:udc=
p2p=3D"http://schemas.microsoft.com/data/udc/parttopart" xmlns:wf=3D"http:/=
/schemas.microsoft.com/sharepoint/soap/workflow/" xmlns:dsss=3D"http://sche=
mas.microsoft.com/office/2006/digsig-setup" xmlns:dssi=3D"http://schemas.mi=
crosoft.com/office/2006/digsig" xmlns:mdssi=3D"http://schemas.openxmlformat=
s.org/package/2006/digital-signature" xmlns:mver=3D"http://schemas.openxmlf=
ormats.org/markup-compatibility/2006" xmlns:m=3D"http://schemas.microsoft.c=
om/office/2004/12/omml" xmlns:mrels=3D"http://schemas.openxmlformats.org/pa=
ckage/2006/relationships" xmlns:spwp=3D"http://microsoft.com/sharepoint/web=
partpages" xmlns:ex12t=3D"http://schemas.microsoft.com/exchange/services/20=
06/types" xmlns:ex12m=3D"http://schemas.microsoft.com/exchange/services/200=
6/messages" xmlns:pptsl=3D"http://schemas.microsoft.com/sharepoint/soap/Sli=
deLibrary/" xmlns:spsl=3D"http://microsoft.com/webservices/SharePointPortal=
Server/PublishedLinksService" xmlns:Z=3D"urn:schemas-microsoft-com:" xmlns:=
tax=3D"http://schemas.microsoft.com/sharepoint/taxonomy/soap/" xmlns:tns=3D=
"http://schemas.microsoft.com/sharepoint/soap/recordsrepository/" xmlns:sps=
up=3D"http://microsoft.com/webservices/SharePointPortalServer/UserProfileSe=
rvice" xmlns:mml=3D"http://www.w3.org/1998/Math/MathML" xmlns:st=3D"&#1;" x=
mlns=3D"http://www.w3.org/TR/REC-html40">
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
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">When setting the SSHD log level=
 to verbose as recommended by the CIS, I get the following in the secure lo=
g :<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Dec 17 11:32:29 myserver sshd[8=
456]: Connection from xx.xx.xx.xx port 44090 on xx.xx.xx.xx port 22<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Dec 17 11:32:30 myserver sshd[8=
456]: Accepted key RSA SHA256: qhpzQKKbwaX8 found at /usr/bin/sss_ssh_autho=
rizedkeys:1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Dec 17 11:32:30 myserver sshd[8=
456]: Postponed publickey for myuser from xx.xx.xx.xx port 44090 ssh2 [prea=
uth]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">Dec 17 11:32:30 myserver ssh=
d[8456]: Accepted key RSA SHA256: qhpzQKKbwaX8 found at /usr/bin/sss_ssh_au=
thorizedkeys:1<o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Dec 17 11:32:30 myserver sshd[8=
456]: Accepted publickey for myuser from xx.xx.xx.xx port 44090 ssh2: RSA S=
HA256: qhpzQKKbwaX8<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Dec 17 11:32:30 myserver sshd[8=
456]: pam_unix(sshd:session): session opened for user myuser by (uid=3D0)<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Dec 17 11:32:31 myserver sshd[8=
456]: User child is on pid 8460<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Dec 17 11:32:31 myserver sshd[8=
460]: Starting session: shell on pts/4 for myuser from xx.xx.xx.xx port 440=
90 id 0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">What are the corresponding even=
ts in audit ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">My main concern is with the bol=
d line which indicates how the public key was granted<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Could you point me to a documen=
tation showing which events a ssh login would generate ?
<o:p></o:p></span></p>
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

--_000_5F4EE10832231F4F921A255C1D95429822CB57DEERLM99EX7MSXww9_--

--===============1565808179675713843==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============1565808179675713843==--

