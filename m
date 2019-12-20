Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 46F77127BB9
	for <lists+linux-audit@lfdr.de>; Fri, 20 Dec 2019 14:33:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576848831;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=y3X76ES6fTlD/gfC/9uClmjJQNQ1CAhbnyyWRxIx50s=;
	b=e4RwDmRhS7yo9Gp8Q6bKKgv++VcOpCogoqMBqVh/mhV6Wy/fyj84KCfSotL366oeQXqo0j
	kDLJTWYJ0fUNaRugJvQRbRzcgGXmWNDjhOvuRyi0IiDRBJhRKYvs4vOaJVNf0z2ho0VgKP
	sWUqUS7v1YoSLpAs1sOPvkccsFm7xag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-_TazvymHPlyGWhlCOJ9kMA-1; Fri, 20 Dec 2019 08:33:49 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13BB61005502;
	Fri, 20 Dec 2019 13:33:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BAA545C28F;
	Fri, 20 Dec 2019 13:33:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 562741809567;
	Fri, 20 Dec 2019 13:33:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBKDXJuI029371 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 20 Dec 2019 08:33:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B88C12166B2A; Fri, 20 Dec 2019 13:33:19 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B423D2166B29
	for <linux-audit@redhat.com>; Fri, 20 Dec 2019 13:33:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63D20185B0C2
	for <linux-audit@redhat.com>; Fri, 20 Dec 2019 13:33:17 +0000 (UTC)
IronPort-SDR: QAQHhD1eHvi/dOML5LL/Q9sQHtgH2g7PN9hOloKWbMZ5TcLxm7VuvtKU/QKsbiup4ycvw0NhQ4
	KhP2hNC1TqiQc/Pq6O0rj46pNZDVYAcWh7vrwt/NWePf0jJDElEPMXMBX4qyCc7ke+LOtvechs
	R0sA3bFmjryTW5o2VXaD4YmRFIHDfoutLA5gGwbPQUtMeYh8k28CgSvFE6SjV3DDlIgk+/oJDf
	+VnO/ARfZUaf//kRzdx1ksQO+G3TnNhYcYPqZXO6o7YVD6MePPjqh33W/uAlV69WcGoU0mciPZ
	YpRMJQxxu0RBIpc4A7qW3bNG
X-IronPort-AV: E=Sophos;i="5.69,336,1571695200"; d="scan'208,217";a="38974786"
X-MGA-submission: =?us-ascii?q?MDHdwJ8B1zHh97KWTZ5iTnYHUIIy10b6zQ9UzV?=
	=?us-ascii?q?dQytPTshVDzyUrGvdyv5DvBqZTrkIWr8l/r3JyaDybR++NgvNiSLYAIw?=
	=?us-ascii?q?HoX/4qdD+/KU7DQkz5JwzbkcjuhR/BC4MXAG6EwWGnJKBQ/usFDigjo5?=
	=?us-ascii?q?WI?=
Received: from smarthost5.atos.net (smtppost.atos.net [193.56.114.176])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-229-uY7MXQJ6No6Ojilh8wEQfw-1; Fri, 20 Dec 2019 08:33:15 -0500
Received: from unknown (HELO DEFTHW99ETYMSX.ww931.my-it-solutions.net)
	([10.86.142.53])
	by smarthost5.atos.net with ESMTP/TLS/ECDHE-RSA-AES256-SHA384;
	20 Dec 2019 14:33:12 +0100
Received: from DEERLM99EX7MSX.ww931.my-it-solutions.net ([169.254.9.235]) by
	DEFTHW99ETYMSX.ww931.my-it-solutions.net ([10.86.142.53]) with mapi id
	14.03.0468.000; Fri, 20 Dec 2019 14:33:11 +0100
From: "MAUPERTUIS, PHILIPPE" <philippe.maupertuis@equensworldline.com>
To: "linux-audit@redhat.com" <linux-audit@redhat.com>
Subject: ausearch on the fly
Thread-Topic: ausearch on the fly
Thread-Index: AdW3OU/dw1JpOtpPSVSmBrkse/xbnw==
Date: Fri, 20 Dec 2019 13:33:11 +0000
Message-ID: <5F4EE10832231F4F921A255C1D9542982304BF@DEERLM99EX7MSX.ww931.my-it-solutions.net>
Accept-Language: en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.86.142.14]
MIME-Version: 1.0
X-MC-Unique: uY7MXQJ6No6Ojilh8wEQfw-1
X-MC-Unique: _TazvymHPlyGWhlCOJ9kMA-1
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
Content-Type: multipart/mixed; boundary="===============5750592539742850326=="

--===============5750592539742850326==
Content-Language: fr-FR
Content-Type: multipart/alternative;
	boundary="_000_5F4EE10832231F4F921A255C1D9542982304BFDEERLM99EX7MSXww9_"

--_000_5F4EE10832231F4F921A255C1D9542982304BFDEERLM99EX7MSXww9_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hi,
We are centralizing  the audit logs with rsyslog.
The SIEM behind the central log server is unable to process the raw logs.
We would like to push the ausearch  result in CSV format in real time or ne=
ar real time.
Is there a way to have ausearch working from a pipe and and waiting when no=
 logs are received

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

--_000_5F4EE10832231F4F921A255C1D9542982304BFDEERLM99EX7MSXww9_
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">We are centralizing &nbsp;the a=
udit logs with rsyslog.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The SIEM behind the central log=
 server is unable to process the raw logs.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">We would like to push the ausea=
rch &nbsp;result in CSV format in real time or near real time.<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Is there a way to have ausearch=
 working from a pipe and and waiting when no logs are received<o:p></o:p></=
span></p>
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

--_000_5F4EE10832231F4F921A255C1D9542982304BFDEERLM99EX7MSXww9_--

--===============5750592539742850326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============5750592539742850326==--

