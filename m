Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0839A37554
	for <lists+linux-audit@lfdr.de>; Thu,  6 Jun 2019 15:35:31 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 69BA43078ABB;
	Thu,  6 Jun 2019 13:34:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47A276136C;
	Thu,  6 Jun 2019 13:34:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C1407C841;
	Thu,  6 Jun 2019 13:33:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x56DWYN9015703 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 6 Jun 2019 09:32:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 07BDC183C9; Thu,  6 Jun 2019 13:32:34 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 00DAA7C3EF
	for <linux-audit@redhat.com>; Thu,  6 Jun 2019 13:32:31 +0000 (UTC)
Received: from xspv0103.northgrum.com (xspv0103.northgrum.com [134.223.120.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6B84EB2DCD
	for <linux-audit@redhat.com>; Thu,  6 Jun 2019 13:32:13 +0000 (UTC)
Received: from XHTVAG10.northgrum.com (unknown [134.223.82.86]) by
	xspv0103.northgrum.com with smtp
	id 4008_127d_902f7a1d_2118_48d8_a173_9c33ce4901a1;
	Thu, 06 Jun 2019 08:32:07 -0500
From: "Boyce, Kevin P [US] (AS)" <Kevin.Boyce@ngc.com>
To: "linux-audit@redhat.com" <linux-audit@redhat.com>
Subject: Auditd Troubleshooting
Thread-Topic: Auditd Troubleshooting
Thread-Index: AdUca5TUPGx5icj/RaOU+NsvQU/M/Q==
Date: Thu, 6 Jun 2019 13:31:41 +0000
Message-ID: <16ca40d7967a4a0198d1d2799c939349@XCGVAG30.northgrum.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [134.223.82.20]
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.26]); Thu, 06 Jun 2019 13:32:18 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]);
	Thu, 06 Jun 2019 13:32:18 +0000 (UTC) for IP:'134.223.120.78'
	DOMAIN:'xspv0103.northgrum.com' HELO:'xspv0103.northgrum.com'
	FROM:'Kevin.Boyce@ngc.com' RCPT:''
X-RedHat-Spam-Score: -4.999  (HTML_MESSAGE, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 134.223.120.78 xspv0103.northgrum.com
	134.223.120.78 xspv0103.northgrum.com <Kevin.Boyce@ngc.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.26
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Content-Type: multipart/mixed; boundary="===============9174472214243390463=="
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Thu, 06 Jun 2019 13:35:29 +0000 (UTC)

--===============9174472214243390463==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_16ca40d7967a4a0198d1d2799c939349XCGVAG30northgrumcom_"

--_000_16ca40d7967a4a0198d1d2799c939349XCGVAG30northgrumcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Dear List,

It would be really great if there were an audit rule hit counter like many =
firewalls have when IP traffic passes through a filter rule.

This would be beneficial for finding rules that might not be working the as=
 intended (to fix user implementation problems).

I'm thinking it would be a switch option on auditctl -l (maybe -h for hitco=
unt).  This would list each rule that the kernel has, and how many times si=
nce auditd started that an event matched the rule.

Is this within the realm of feasibility?  Does this function exist maybe el=
sewhere in the audit suite (like aureport)?

Kind Regards,
Kevin

--_000_16ca40d7967a4a0198d1d2799c939349XCGVAG30northgrumcom_
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
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Dear List,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">It would be really great if there were an audit rule=
 hit counter like many firewalls have when IP traffic passes through a filt=
er rule.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This would be beneficial for finding rules that migh=
t not be working the as intended (to fix user implementation problems).<o:p=
></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;m thinking it would be a switch option on au=
ditctl &#8211;l (maybe &#8211;h for hitcount).&nbsp; This would list each r=
ule that the kernel has, and how many times since auditd started that an ev=
ent matched the rule.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Is this within the realm of feasibility?&nbsp; Does =
this function exist maybe elsewhere in the audit suite (like aureport)?<o:p=
></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Kind Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Kevin<o:p></o:p></p>
</div>
</body>
</html>

--_000_16ca40d7967a4a0198d1d2799c939349XCGVAG30northgrumcom_--


--===============9174472214243390463==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============9174472214243390463==--

