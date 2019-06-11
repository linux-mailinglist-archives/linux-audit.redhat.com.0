Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D3B3CAE5
	for <lists+linux-audit@lfdr.de>; Tue, 11 Jun 2019 14:17:12 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1CA95A836;
	Tue, 11 Jun 2019 12:16:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA4EC611B6;
	Tue, 11 Jun 2019 12:16:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E84335ED62;
	Tue, 11 Jun 2019 12:16:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5BCF62m006567 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 11 Jun 2019 08:15:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EB977611CD; Tue, 11 Jun 2019 12:15:06 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E484E611CA
	for <linux-audit@redhat.com>; Tue, 11 Jun 2019 12:15:04 +0000 (UTC)
Received: from xspv0103.northgrum.com (xspv0103.northgrum.com [134.223.120.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5DB6D308213F
	for <linux-audit@redhat.com>; Tue, 11 Jun 2019 12:14:52 +0000 (UTC)
Received: from XHTVAG10.northgrum.com (unknown [134.223.82.86]) by
	xspv0103.northgrum.com with smtp
	id 3694_00ac_15f1fd81_0c8a_4eff_abdb_2ec9906ac44f;
	Tue, 11 Jun 2019 07:14:50 -0500
From: "Boyce, Kevin P [US] (AS)" <Kevin.Boyce@ngc.com>
To: "linux-audit@redhat.com" <linux-audit@redhat.com>
Subject: RHEL7 audispd syslog journal question
Thread-Topic: RHEL7 audispd syslog journal question
Thread-Index: AdUgTgE3WlCMgTP1SUyd65C48321SQ==
Date: Tue, 11 Jun 2019 12:14:30 +0000
Message-ID: <07fef14388544a36828818d3e0691f3c@XCGVAG30.northgrum.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [134.223.82.17]
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.42]); Tue, 11 Jun 2019 12:14:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Tue, 11 Jun 2019 12:14:57 +0000 (UTC) for IP:'134.223.120.78'
	DOMAIN:'xspv0103.northgrum.com' HELO:'xspv0103.northgrum.com'
	FROM:'Kevin.Boyce@ngc.com' RCPT:''
X-RedHat-Spam-Score: -4.999  (HTML_MESSAGE, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 134.223.120.78 xspv0103.northgrum.com
	134.223.120.78 xspv0103.northgrum.com <Kevin.Boyce@ngc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
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
Content-Type: multipart/mixed; boundary="===============7868225551244028654=="
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Tue, 11 Jun 2019 12:17:11 +0000 (UTC)

--===============7868225551244028654==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_07fef14388544a36828818d3e0691f3cXCGVAG30northgrumcom_"

--_000_07fef14388544a36828818d3e0691f3cXCGVAG30northgrumcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Does anyone have any ideas how to prevent the journal from filling up with =
events that come from audispd?

There is a double penalty due to this and it really slows down my system wi=
th a lot of rules in place.

I have audispd syslog plugin enabled to send remotely as LOG_LOCAL5.
Auditd is also writing output to /var/log/audit/audit.log.

If you do journalctl -u auditd you also see copies of the syslog events.  I=
s there any way to prevent this behavior?
I did find this RedHat page but it doesn't really sound like a good solutio=
n, having to modify selinux policy.
https://bugzilla.redhat.com/show_bug.cgi?id=3D1419388

Thanks,
Kevin



--_000_07fef14388544a36828818d3e0691f3cXCGVAG30northgrumcom_
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
<p class=3D"MsoNormal">Does anyone have any ideas how to prevent the journa=
l from filling up with events that come from audispd?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">There is a double penalty due to this and it really =
slows down my system with a lot of rules in place.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I have audispd syslog plugin enabled to send remotel=
y as LOG_LOCAL5.<o:p></o:p></p>
<p class=3D"MsoNormal">Auditd is also writing output to /var/log/audit/audi=
t.log.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">If you do journalctl &#8211;u auditd you also see co=
pies of the syslog events.&nbsp; Is there any way to prevent this behavior?=
<o:p></o:p></p>
<p class=3D"MsoNormal">I did find this RedHat page but it doesn&#8217;t rea=
lly sound like a good solution, having to modify selinux policy.<o:p></o:p>=
</p>
<p class=3D"MsoNormal"><a href=3D"https://bugzilla.redhat.com/show_bug.cgi?=
id=3D1419388">https://bugzilla.redhat.com/show_bug.cgi?id=3D1419388</a><o:p=
></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Kevin<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_07fef14388544a36828818d3e0691f3cXCGVAG30northgrumcom_--


--===============7868225551244028654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============7868225551244028654==--

