Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0D37A2377
	for <lists+linux-audit@lfdr.de>; Fri, 15 Sep 2023 18:21:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694794915;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=+UFjFN77KF1406Ii+qBKYpJJVunun1nR9FBttMLrEpU=;
	b=Lf6j8114WbufuKWXCNgQbDbxF2RsaC5lWWWy5q1N8t9nC9IESGmSBxH7fjJXgnexeWGmt5
	hX9MA8QaI8q53CH70Xt7VX7ZwbbbkqfSdH7ODiG2V3bxmwrbGXlC5uhyq0rmD/lWNAEXGP
	rPe+5J51aYfFjyaDchLJSHZwsVucHJA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-OZlzBBxjPwaMT25HKYGStQ-1; Fri, 15 Sep 2023 12:21:51 -0400
X-MC-Unique: OZlzBBxjPwaMT25HKYGStQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8CCF945935;
	Fri, 15 Sep 2023 16:21:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2522B170E4;
	Fri, 15 Sep 2023 16:21:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5DD4519465B9;
	Fri, 15 Sep 2023 16:21:33 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C3E6F1946588 for <linux-audit@listman.corp.redhat.com>;
 Fri, 15 Sep 2023 16:21:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AD3D540E0421; Fri, 15 Sep 2023 16:21:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A559F40E0420
 for <linux-audit@redhat.com>; Fri, 15 Sep 2023 16:21:27 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-inbound-delivery-1.mimecast.com [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8225C85A5BE
 for <linux-audit@redhat.com>; Fri, 15 Sep 2023 16:21:27 +0000 (UTC)
Received: from aplegw02.jhuapl.edu (aplegw02.jhuapl.edu [128.244.251.169])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-NK6uMTi1M2SzeP6TfBnMBg-1; Fri, 15 Sep 2023 12:21:23 -0400
X-MC-Unique: NK6uMTi1M2SzeP6TfBnMBg-1
Received: from pps.filterd (aplegw02.jhuapl.edu [127.0.0.1])
 by aplegw02.jhuapl.edu (8.17.1.19/8.17.1.19) with ESMTP id 38FCVqFK008125
 for <linux-audit@redhat.com>; Fri, 15 Sep 2023 12:15:13 -0400
Received: from aplex22.dom1.jhuapl.edu (aplex22.dom1.jhuapl.edu [10.114.162.7])
 by aplegw02.jhuapl.edu (PPS) with ESMTPS id 3t2yes32fm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-audit@redhat.com>; Fri, 15 Sep 2023 12:15:13 -0400
Received: from APLEX26.dom1.jhuapl.edu (10.114.162.11) by
 APLEX22.dom1.jhuapl.edu (10.114.162.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 15 Sep 2023 12:15:12 -0400
Received: from APLEX26.dom1.jhuapl.edu ([fe80::8b67:5cb8:8fbe:fd18]) by
 APLEX26.dom1.jhuapl.edu ([fe80::8b67:5cb8:8fbe:fd18%12]) with mapi id
 15.02.1118.026; Fri, 15 Sep 2023 12:15:12 -0400
From: "Wieprecht, Karen M." <Karen.Wieprecht@jhuapl.edu>
To: "linux-audit@redhat.com" <linux-audit@redhat.com>
Subject: 128 Character limit on proctitle field?
Thread-Topic: 128 Character limit on proctitle field?
Thread-Index: Adnn7XCv4G5FhuKUT3CiGEqUr+p2zg==
Date: Fri, 15 Sep 2023 16:15:12 +0000
Message-ID: <f04d10f4d94c4c2295031fee26dc8082@jhuapl.edu>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.114.162.18]
MIME-Version: 1.0
X-CrossPremisesHeadersFilteredBySendConnector: APLEX22.dom1.jhuapl.edu
X-OrganizationHeadersPreserved: APLEX22.dom1.jhuapl.edu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_12,2023-09-15_01,2023-05-22_02
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: jhuapl.edu
Content-Language: en-US
Content-Type: multipart/mixed; boundary="===============0881015176276008567=="

--===============0881015176276008567==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_f04d10f4d94c4c2295031fee26dc8082jhuapledu_"

--_000_f04d10f4d94c4c2295031fee26dc8082jhuapledu_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

All,

We're working with Docker and podman, and I'm working on parsing the audit =
data we get to flag prohibited and missing command options based on STIG gu=
idelines.   I normally extract the proctitle from the raw auditd data , but=
 these commands are very long with sometimes 23 or more command line parame=
ters ,  and I noticed that all of the auditd proctitle data for the lengthi=
er commands is being cut off at 128 characters.

I'm bringing this up  for two reasons:

     One,  not everyone working with this data may realize that there seems=
 to be a character limit,
     and second, if this is by chance a bug as opposed to intentional,  the=
n I'm hoping we can get a fix cooking for it?

In the meantime,  I may be able to work around this by piecing together the=
 full command from the "a#=3D "  fields, but it would be much easier if pro=
ctitle wasn't cut off after 128 chars.

Thanks, any info you can share would be much appreciated,

Karen Wieprecht

--_000_f04d10f4d94c4c2295031fee26dc8082jhuapledu_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
=09{font-family:"Cambria Math";
=09panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
=09{font-family:Calibri;
=09panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
=09{margin:0in;
=09margin-bottom:.0001pt;
=09font-size:11.0pt;
=09font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
=09{mso-style-priority:99;
=09color:#0563C1;
=09text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
=09{mso-style-priority:99;
=09color:#954F72;
=09text-decoration:underline;}
span.EmailStyle17
=09{mso-style-type:personal-compose;
=09font-family:"Calibri",sans-serif;
=09color:windowtext;}
.MsoChpDefault
=09{mso-style-type:export-only;
=09font-family:"Calibri",sans-serif;}
@page WordSection1
=09{size:8.5in 11.0in;
=09margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
=09{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">All,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We&#8217;re working with Docker and podman, and I&#8=
217;m working on parsing the audit data we get to flag prohibited and missi=
ng command options based on STIG guidelines.&nbsp;&nbsp; I normally extract=
 the proctitle from the raw auditd data , but these commands
 are very long with sometimes 23 or more command line parameters ,&nbsp; an=
d I noticed that all of the auditd proctitle data for the lengthier command=
s is being cut off at 128 characters.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;m bringing this up &nbsp;for two reasons:&nb=
sp;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; One,&nbsp; not everyone wor=
king with this data may realize that there seems to be a character limit,&n=
bsp;
<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;and second, if this is=
 by chance a bug as opposed to intentional,&nbsp; then I&#8217;m hoping we =
can get a fix cooking for it?
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">In the meantime,&nbsp; I may be able to work around =
this by piecing together the full command from the &#8220;a#=3D &#8220; &nb=
sp;fields, but it would be much easier if proctitle wasn&#8217;t cut off af=
ter 128 chars.&nbsp;
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks, any info you can share would be much appreci=
ated,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Karen Wieprecht &nbsp;&nbsp;<o:p></o:p></p>
</div>
</body>
</html>

--_000_f04d10f4d94c4c2295031fee26dc8082jhuapledu_--

--===============0881015176276008567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============0881015176276008567==--

