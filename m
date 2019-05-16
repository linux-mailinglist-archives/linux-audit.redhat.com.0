Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DD4203DC
	for <lists+linux-audit@lfdr.de>; Thu, 16 May 2019 12:47:34 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 90E1F36883;
	Thu, 16 May 2019 10:47:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA9795D9DC;
	Thu, 16 May 2019 10:47:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E3C141806B12;
	Thu, 16 May 2019 10:47:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4GAlDoC001732 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 16 May 2019 06:47:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4456D78544; Thu, 16 May 2019 10:47:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 383654D748
	for <Linux-audit@redhat.com>; Thu, 16 May 2019 10:47:10 +0000 (UTC)
Received: from de-out1.bosch-org.com (de-out1.bosch-org.com [139.15.230.186])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 369CF30024A4
	for <Linux-audit@redhat.com>; Thu, 16 May 2019 10:47:08 +0000 (UTC)
Received: from si0vm1948.rbesz01.com (unknown [139.15.230.188])
	by si0vms0216.rbdmz01.com (Postfix) with ESMTPS id 454SmB54KDz1XLG7Z
	for <Linux-audit@redhat.com>; Thu, 16 May 2019 12:47:06 +0200 (CEST)
Received: from si0vm02576.rbesz01.com (unknown [10.58.172.176])
	by si0vm1948.rbesz01.com (Postfix) with ESMTPS id 454SmB32Qbz1V5
	for <Linux-audit@redhat.com>; Thu, 16 May 2019 12:47:06 +0200 (CEST)
X-AuditID: 0a3aad0d-15bff700000036fe-c3-5cdd3faa54b5
Received: from fe0vm1652.rbesz01.com ( [10.58.173.29])
	(using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by si0vm02576.rbesz01.com (SMG Outbound) with SMTP id
	B5.35.14078.AAF3DDC5; Thu, 16 May 2019 12:47:06 +0200 (CEST)
Received: from FE-MBX2055.de.bosch.com (unknown [10.3.231.149])
	by fe0vm1652.rbesz01.com (Postfix) with ESMTPS id 454SmB1P0yz5gK
	for <Linux-audit@redhat.com>; Thu, 16 May 2019 12:47:06 +0200 (CEST)
Received: from FE-MBX2054.de.bosch.com (10.3.231.148) by
	FE-MBX2055.de.bosch.com (10.3.231.149) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.1.1713.5; Thu, 16 May 2019 12:47:05 +0200
Received: from FE-MBX2054.de.bosch.com ([fe80::25e4:a4ce:3b4c:cbe0]) by
	FE-MBX2054.de.bosch.com ([fe80::25e4:a4ce:3b4c:cbe0%7]) with mapi id
	15.01.1713.006; Thu, 16 May 2019 12:47:05 +0200
From: "Wolff Felix (ETAS-SEC/ECT-Be)" <Felix.Wolff@escrypt.com>
To: "Linux-audit@redhat.com" <Linux-audit@redhat.com>
Subject: Error starting auditd
Thread-Topic: Error starting auditd
Thread-Index: AdUL06nypkIiZtCPQWyH1I2gnFnVGg==
Date: Thu, 16 May 2019 10:47:05 +0000
Message-ID: <3dc64aea26e94e68818b81289f1a713b@escrypt.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.12.254.95]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA21TbUxTVxjmtLftpevF20uR1ypku2NZdMrAjTl1m/uhcdsfZclittTOIhfa
	SFvSW4hoZsiWsQ3Zgk4yKEgRLCNlugZxTpiI12WCoHyJiB1QPsZonYEtStlEstveVppsf548
	53mf9+OcNwcXU6XRatxgsjIWky6Hlsox+ZYzCRuc20Y0Ke2LylevdFxCb6K3ZtsGpbvRB/LX
	MpkcQz5jefGNfXJ9Q49fknv8GDrY2eaXFKLKz1ExisaBfBnGbxSLipEcp8gKEXxjc2LCoRPB
	Dx01ocgsgrqLNplwaEdQ2+qSBfKl5Db4uvqqJMBVZBr8NeUJ6rFkIpTYF0L6s3D7swmRwJPh
	gf10kGPkc/D9t3a+HY4T5BbwlhwOyIhMAJerRxzgYjIemqb9EmFUFYz3dUkFHgfeyaWQ/jTc
	un8TE/xH4JPK0mB5glRCZ8UUVopibRGlbBE2W4TNxk8hJjOAO79ZsCTDnbITUoG/APWn7okF
	vgHKlzjsv/p6ONbUHPI/Ayf7biMb/1pi0oHg5/IOadg0cHlQFjadODouq0GEE61kDSn5xpSN
	aZteSbZkMOyhlNTk/WZjExJWTPyIbs5ncYjEEa0gUteNaCiJLp8tMHIoDRfRccRe7lcNFZNh
	zizQ61j9h5a8HIal1cSa3nc0VOwTmc3LMBpY1mA2cSiJH2DC1diL1JjJbGJoFeGadWsoIlNX
	cIixmIUSHFqNY3Q8kY3v0lBkts7KHGCYXMYSjm7FcRqIpdf5eZQWJps5mGXIsYbDdAKBoqKi
	qJWRkcgRRHg0h17CFXxvX6AEwebqjKwhO5S+Skinwupy6nVUgLfXjp8U453+AI4+nuRxLIie
	IE4EsXlsmseWII5e+Z3H6fIqu5gK3lgdT7gDXclAfX2e6cnc6jVE3ST/FHERgeXePjSE+C3E
	Ek/xn45S8H9xeWIgVgceXBkSl5M21vE5ZH0i3OKeh2uet+HStSkEZefnRNA5V4hBm9+GQZGt
	HoPelgsYfDnchQFXP4TB4vESCXjclyWwMP+nBB6VTUuh+tySFM4snpXBKUe7DD5u9cpg5u9P
	cWi2l+P8r/gpGhrdxQRMnZ4ioOG6LwYucgsxUPnAtwJ6Bh0kDHfPkzDX06eE+XszFDi/uKCC
	rq7fVD5+GSJ+GZsNdwPLsOqs/7OMkLp8N3Uh2q7cUeu9e79xl6F150d0gdHrWftVy9qrbpOB
	Hn2oqSn7ZShN252uGPbPH+nfLRrRjq1P/26PVpuVcfRd7Z2sFenFRs+Ao6+7//GmVVsVwzuL
	/km03djXkfQoqfvsgLN6jx5zPOxueG9vrb1fGnducbu9yNU6I/pjlqs6wFYcrnp/P42xel3q
	OrGF1f0L9U90YyMFAAA=
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.40]); Thu, 16 May 2019 10:47:09 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Thu, 16 May 2019 10:47:09 +0000 (UTC) for IP:'139.15.230.186'
	DOMAIN:'de-out1.bosch-org.com' HELO:'de-out1.bosch-org.com'
	FROM:'Felix.Wolff@escrypt.com' RCPT:''
X-RedHat-Spam-Score: -2.291  (HTML_MESSAGE, RCVD_IN_DNSWL_MED, SPF_HELO_PASS,
	SPF_PASS,
	T_FILL_THIS_FORM_SHORT) 139.15.230.186 de-out1.bosch-org.com
	139.15.230.186 de-out1.bosch-org.com <Felix.Wolff@escrypt.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Content-Type: multipart/mixed; boundary="===============4417802161047919504=="
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Thu, 16 May 2019 10:47:33 +0000 (UTC)

--===============4417802161047919504==
Content-Language: de-DE
Content-Type: multipart/related;
	boundary="_004_3dc64aea26e94e68818b81289f1a713bescryptcom_";
	type="multipart/alternative"

--_004_3dc64aea26e94e68818b81289f1a713bescryptcom_
Content-Type: multipart/alternative;
	boundary="_000_3dc64aea26e94e68818b81289f1a713bescryptcom_"

--_000_3dc64aea26e94e68818b81289f1a713bescryptcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

I am currently porting auditd to a new platform. When starting it using `au=
ditd -f`, I get the following error:

"Error setting audit daemon pid (File exists)"

It occurs during the call to `audit_set_pid(fd, getpid(), WAIT_YES);` in au=
ditd.c. If I understand correctly, this call registers auditd with the kern=
el, is that correct? fd looks like a valid file descriptor, at least its >0=
. Especially the "file exists" part confuses me. In which direction can I i=
nvestigate that error?

Thank you and greets,
Felix



--
Mit freundlichen Gr=FC=DFen/Best regards
Felix Wolff
Software Engineer
[ESCRYPT-Logo_RGB]
ESCRYPT GmbH
Wittener Stra=DFe 45
44789 Bochum, Germany
Email:        felix.wolff@escrypt.com
Phone:      +49 30 403 691 957
Mobile:     +49 1525 6953 720
www.escrypt.com

Managing directors: Christopher White, Dr.-Ing. Thomas Wollinger
Registered office and court of registry: Bochum, Germany, HRB 7877


--_000_3dc64aea26e94e68818b81289f1a713bescryptcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Segoe UI Semilight";
	panose-1:2 11 4 2 4 2 4 2 2 3;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
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
span.E-MailFormatvorlage17
	{mso-style-type:personal-compose;
	font-family:"Arial",sans-serif;
	color:windowtext;
	font-weight:normal;
	font-style:normal;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
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
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">Hello,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">I am currently porting auditd to a new platform. When=
 starting it using `auditd &#8211;f`, I get the following error:<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">&#8220;Error setting audit daemon pid (File exists)&#=
8221;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">It occurs during the call to `audit_set_pid(fd, getpi=
d(), WAIT_YES);` in auditd.c. If I understand correctly, this call register=
s auditd with the kernel, is that correct? fd
 looks like a valid file descriptor, at least its &gt;0. Especially the &#8=
220;file exists&#8221; part confuses me. In which direction can I investiga=
te that error?
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">Thank you and greets,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">Felix<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><b><span style=3D"font-size:12.0pt;font-family:&quot;Segoe UI Semi=
light&quot;,sans-serif">--<o:p></o:p></span></b></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:12.0pt;font-family:&quot;Segoe UI Semilig=
ht&quot;,sans-serif;mso-fareast-language:DE">Mit freundlichen Gr=FC=DFen/Be=
st regards<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto"><b><span style=3D"=
font-size:12.0pt;font-family:&quot;Segoe UI Semilight&quot;,sans-serif">Fel=
ix Wolff<o:p></o:p></span></b></p>
<p class=3D"MsoNormal" style=3D"mso-margin-bottom-alt:auto"><span style=3D"=
font-size:12.0pt;font-family:&quot;Segoe UI Semilight&quot;,sans-serif">Sof=
tware Engineer<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:12.0pt;font-family:&quot;Segoe UI Semilig=
ht&quot;,sans-serif"><img width=3D"128" height=3D"44" style=3D"width:1.3333=
in;height:.4583in" id=3D"Bild_x0020_1" src=3D"cid:image003.png@01D50BE5.770=
7BDB0" alt=3D"ESCRYPT-Logo_RGB"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto"><span style=3D"fon=
t-size:12.0pt;font-family:&quot;Segoe UI Semilight&quot;,sans-serif">ESCRYP=
T GmbH<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Se=
goe UI Semilight&quot;,sans-serif">Wittener Stra=DFe 45<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Se=
goe UI Semilight&quot;,sans-serif">44789 B</span><span lang=3D"DE" style=3D=
"font-size:12.0pt;font-family:&quot;Segoe UI Semilight&quot;,sans-serif">oc=
hum, Germany<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto"><span style=3D"fon=
t-size:12.0pt;font-family:&quot;Segoe UI Semilight&quot;,sans-serif">Email:=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href=3D"felix.wolff@escrypt.com">felix.wolff@escrypt.com</a><o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Se=
goe UI Semilight&quot;,sans-serif">Phone:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#4=
3;49 30 403 691 957<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-bottom-alt:auto"><span style=3D"=
font-size:12.0pt;font-family:&quot;Segoe UI Semilight&quot;,sans-serif">Mob=
ile:&nbsp;&nbsp;&nbsp;&nbsp; &#43;49 1525 6953 720<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:12.0pt;font-family:&quot;Segoe UI Semilig=
ht&quot;,sans-serif"><a href=3D"www.escrypt.com">www.escrypt.com</a><o:p></=
o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:12.0pt;font-family:&quot;Segoe UI Semilig=
ht&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto"><span style=3D"fon=
t-size:12.0pt;font-family:&quot;Segoe UI Semilight&quot;,sans-serif">Managi=
ng directors: Christopher White, Dr.-Ing. Thomas Wollinger<o:p></o:p></span=
></p>
<p class=3D"MsoNormal" style=3D"mso-margin-bottom-alt:auto"><span style=3D"=
font-size:12.0pt;font-family:&quot;Segoe UI Semilight&quot;,sans-serif">Reg=
istered office and court of registry: Bochum, Germany, HRB 7877<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_3dc64aea26e94e68818b81289f1a713bescryptcom_--

--_004_3dc64aea26e94e68818b81289f1a713bescryptcom_
Content-Type: image/png; name="image003.png"
Content-Description: image003.png
Content-Disposition: inline; filename="image003.png"; size=6498;
	creation-date="Thu, 16 May 2019 10:47:05 GMT";
	modification-date="Thu, 16 May 2019 10:47:05 GMT"
Content-ID: <image003.png@01D50BE5.7707BDB0>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAIAAAAAsCAYAAACt4LBeAAAAAXNSR0IArs4c6QAAAAlwSFlzAAAO
xAAADsQBlSsOGwAAABl0RVh0U29mdHdhcmUATWljcm9zb2Z0IE9mZmljZX/tNXEAABjiSURBVHhe
7VwHmBzFla7q7umZ6c0ChImWBAaUjmTEei1A5GgMnOEEhwGZA47DGEywABlJu0gIfZh4HGAyGGww
oIAtwiEZGcQiRDRGrEhLOIJQ2jQ7oae7y//f2730zs7ujqz9fMjflr6n7qnwKrxX7716r3qN+vp6
MZT+OVYgHq8rzzpinGEmj8xlOz8x1PJ7BpqZMVCFofLNYwU8Vbdn1tOejpnx4eUVwwQY4FeljHyI
AUpZpc2hjuFVxwxreD6fFel0u5BK5EoZ9hADlLJKm0EdR2iu5thCKbVRox1igI1arm905VQ4Oiml
UFJkRQm8UJQBZsyYsTuQHQgYA6gAZAAfARoBz8NwzJeyFMCzLertD9gDsDUgAbAB6wBvApYA1xel
4IrHR8PA2eJQJdxaIbVtlefpQshWIxZb6TrqOc19/p1ieDy1/36xhF7pCFeorJPVZOMS1lOybpIw
jMOVUDtI5eGhfYrcpdJd9qxfrtftZibKdsulOvIyYaKtbWtyuV9WSoJO3lu34tu46YyKJ5KxXCb3
tqY1fuDpE8bEzapRtpdTwvbclX9d/+y4cU2urfYfFTflEa7r/IsQXpWUWs5T3qea1F/JdHhLLaux
I9pvOn500rTXH6Cbpq4cx9GEGK+Ux5EL18kLMMEYT9QdJjwRi7aLW2XSTne+K2Xj+8zvwQAgGAl+
NeAYABa4aHoD9WaCcE/0tRAoZ1seL/4TsEU/C7YOdWcD1439Laqn155ui8QVZjy2i6bpEHOcKMgP
TmeyQR1Pfv++jF59oZVbRGbtTp7u3GnGK3YFCUUq3/KRcutqRUy/1jBip8VipvC8EJcmXDd/hesd
8Jyb6ZgidENz8vb8REWV8FxHGFVlItVR92NDNT44EAMoVbe9jGlLY7pZHquICTuHIUkxrqudfm7C
Kv+pzEmRznfkxo6t2dHTv3+eKdUlZtyySEBfjGNunJ3rukKrzn/guhNnau6yh8K+k9m1W3u69lTc
SAhX5v02+XyX2ocBiOHHTtZ142R2HE0Jq0xksqmrDSWmMb+bAUCIg/H7UUDNABPcE+ULUf8SEO66
Purej/x/H2ihUL4l4Abg0oDr+mL1HVk7pyxZfZnj2iKbTXFiImaY/gKBQP6kwRRmefmws922dd8a
PXr68U1NDV1U7UppGkYgLtZWSU9XT5Rb1fs60Jch8VnO39h1oqy85sBUPrdId58fl/dqL4/HrTmZ
XBpoFPpRV6WNuvlWrrGzv7m5mnd5ebKqvLOzlfiAO3+NIZevZBv0aeftrMiBKUCaNlf3HrKSVYfk
7QzmkvXnR9JzF3NuZHbTTO4ciyUeTKVrdzLV8gbiUQokFMqGxDBdz2XG10OiCkA7D/mFJgGZGauA
gq7qPgOAADvh8TigKjIx/p4P+CrIPxLPKQBIGz/9Cu3eBuGeiS4G8k7F7yjx2Z5HkhUALhxVwXGA
syLtrka7x4HrkyguR9WeVV5Zc1km3eFPJpEoAxN0rsOCvs7JQwLsZsaTO+ftnOjoWC/KK6qPXblq
8WQM8LchHn8tsAo+gTV9RDxhjSAjAccrKFuJhbCUkJNM0xpugwipjg0g2rCxqY7aUxquPGzuzNmL
z2QfJFhZWfUIL9Xyc+CeFR1n9N32Juxixo0z2UcsFhednS1rdU+7NtyIYDJ/PCQExj88ZiQOscFg
BpjattPN4I63pPCwleXO2MF7g7fBLCyPiXKrsj6dnvC2oVbMAz4P0ALGLoeUAMMr0jLZNRYUgtHA
GMQT0ssvwbyFrmLdUjKUANzJUeKfA2LcUTDJx0GkRch7BBDqleuRt0eBTXBupB0NkyNR/kYBrifR
bg3yfDGEFAdMBswN63lqr600Q7vGxm4h8eMgPohwn+bKadBfvt0Ax4eVtXPTrLLKK7AThBlLik7Z
et6M6TN+hz4LTCCJHayJPFYZm2OK7r30+6/7qtsODLKwsnLLvckEcTMpUlIe39DQ8FtP1l6qSW0+
1U0uB9Gq65d6+b3u1eTrnxdjAk3XrozHy+PpdKs/Zox/jpQvbShWl4zAcWNcrm3nLkka8s5cRLoo
OfFQV+TvghTasYsJTJBWuxb6/6nmUc1fjG1OfldlLVA44ypD7iulPo87H0wuspnUbTgXcD17qPls
3pFZ02uzgkOiAUKMRKVjIwN8uAjx/WLkz0f92/F6flCfNgNVx9P8jTIyEaVJmF4vQvywbA5emgBU
UoT3eiySZp5qWVXDOlOtIpEk8dNLNbdxSlSlYbHSaDgt3Vn3JhYmAVtIaUpPcWFBvF5rDlHKM/JV
8JB1E5+VYBh+ns7vdYKZjx+QyWSU57rcpz6BUXdBJlP7pFVWdVS6sw3Soboy7bn12H//UdiBrer2
MGP6KdlsB8S2hb7amm2z7XajnxO5GU8ISLip6OfGHCR5NNEg9ZwJx7im1ggJUE4mSFqVo1R6/dHj
mpoeQ93PwvXIiwlfmtLwRT5VmfBUqyZf+rLXImAsMDS6E7njiIAAzOSuKaqLI20ozs8BQBH7iQaj
zwBInEJ0GiPBFFuBCdYWDgR5VAfdRk1hudK0H1BvSw36EIYQZNesAnumuwkYg7aLUKhGTmpoWNZr
3ppm0Pjp1DztoWJ4LPn6p/lO8RsuCAVnVG5ChF+cz6UPBhHi2FnYifEpbq7uNjDOa9GOsJHr4/EK
jY4Y6nKVS9dbuaYeRmm0vmkmRDadWjV+t7YbmrgViiRNrvir6+77a8uqvth38NA4lPIYUIoMEEk0
jHpmFMfYu9J+kSzy6lgQjXq6p/nYVYkMwqMcjyShdY9jS1cCUVNoy6nw+Me0A2AJ8q7hE+W0BwZM
EO1VaVuN9fWVHoPYznxmJYwXcyX5toqjh+gWbt5Zk0u0rgvF34ADCSpA5azKO7U3lJfXXJZKtUD1
WDgh5OZgNQ4Lcdj6hIkJI3lsBgwSj5eJdGf7G6t2a3toXB+EZTudNLOz85uamqJGa69hQbQ/DPVz
sYQKc2jMCjl+xvTpsr6hoYSTfv+zJMPvEqlC4t5b6sIE9bYFgU0Ql+d7nw8A9CGEm2g83rnTeeR7
C8+/ALhzXkObVcX6ymTFtkoXNdT9sH5F3rHfg7jPbuS4elWHMFGjavZWq1f3Q5U+OikztdmZdNvJ
8Xjy2yRyIll+aK6z9ofwDSxkE0iWBuroPE4m/onBU9MgpguEek/knJ+UqocUKda9dFo+cPTqr3D6
2Rr+D9BfDZs6dzEleb+nkVLWiwxQXkrFfup8G2WVJLBP/fr6F0DoE/B6E4BlYeKR76AAmJdHPU7+
bkJPo82wNOnC0IR9Dq6XSrVs4hj95tCPsqWlpZhkGxA9GBC2Re1UPRF7WNDJBmRKl3NgCyyE0+fg
RDJ5INVDMllO3b/EkC8/1R9S6mkeY4WjrelLtYXta/atSK1/Ta7HWnQxgJLQHTCc5eAwQI8zMzrl
8Y/CtpSFYh1yYbj7/TGDmPQTPI/X4wE/AOwNoDqIJp4kagM4AfUno127X8FwoOZ4fgsGIaVXiltz
QCpuYgXs9kc607Vnl1mVB2Uy7TiWlo/OZerOV7o6mn4JWJP+WR5Oyl+WtHpdk+pX/LPCso4ONdqr
gnfXdxPxn0yW1sGAM6YEaI3UosHCI2CfhsuAGIMKwMFdy3j0PSAuJcR3AFQH3wNQRfB3mOhj+DUA
niskR+Q8zfU0eON4rMGE6Y7+RiRdM3+Oo91rsE0M+gZAlZvpuMnh3A9DDbu/9RFTLl8+0GBJRp7t
s46q0QbQ5Hs31yTTUlX6jitIDujWXAaacWNtmWJjIgPQJ0yiMFUDeCws6lcfaFJ9lQc729f7gPvA
ENRfdKhcBQglzWTkz0LdlchYp6TsgJis8k8ASo2Eh08r8PD9vcPZpHaIObzlePveAs/jhTQI6Zrm
vqSxms2l4Jwyp5fUAcSbhjaaSHNT/LG/NpmssZ00nG1oM9DOcKRob36tJT0ucC6X1F8flcgAJMpp
QTlnQ6t+UBmgsG8Qmb7V2SD4Pnj+MFLOINTKGTMOWT191rOfwhM2nh48THqnle8sHQ0J67tT/7+T
5uUbMun2E3GM267L/66gDipFR2fLnTHv5Z7+jH4G67tlu1QkfSJ9Jk+zD7cSlUYm0wFGA8ny8kMG
kPprAxXa7e7trx4ZgLo6mk7HDxg6xROINgwlHDR1F9u/C4IySkhH0CQ8RgDCwS3s1uvF0ZGgUQbw
hSGcOEpqdUuNmDkejjsYVlVGxm27AD2eXQwN4gWTdaH552BXeDYs9gWDcWroaw3gBWzxvNpLpIz/
jgKMohzEadNdffbGqGZ6HeFm/l4uU3scYgULivWXTtdVJCvlhdwITDSKYQguLaxr0LNMfyoTVtGV
aquBVAurkoA8mnHH06vHdAQISTuAOrlYmonM0BPI8ssAPgMgHQe4INKIIr6oSEQfHC4ZKUxkqG6X
MWyqBxBFO58OnC6/euIsx657Q1ONt0UH5eh1l1SWD7uWC0THSlvb2k+TSWfepvgM+ph3j2wMtror
Gqn8cz/UwfUgYm/PWz/I/JgAwIibd3ru/hugXnpsRqX2+laiWrvHNJIjufsZW4AzqBOOqUd7MZpy
1jrY8xoGRUM0psWOQeSzHj6MHr4XnFiOhhkRl6pxHodmgNAeiDED7743LUi3I4tRP/r9GaDhmZ5W
/EkAhnjDRF//A5Hfd+L9Z4BQr08DHjqMFgCaAZSX9DVQzdAGoP4L06KoXwDevVcRjXuwonKLUzva
1wvXw04zzVudfN0xiN4vwYBwiFYTdU37EaNuXfoRkTQl72ptXdHjVBLpY1BeEe7dAqq/wfUcnyjw
D3xud2o3GlEfa0k94aQDww6xgC2VdBZ7Wt2j4CdsJs9G5hgwyElwLm3LDUBmSyQrREf72uukfLlX
HGLYMPHhunav2YhZO9FlDH/FDo7y/uyIuns0z1uHXrYHioMqKmoO6OhouVZXoosB+B8W/jEQ6oaA
KOHQ6e4l0AFDgoYCJjq1y9G2m+tpwAHPFagQ6jQyzn8FQDxkAEasCt2W/4c8Mk6PpHn2z9KptvEV
FcN2J5EdrIuZsI6C4XUUK3LxGKDhToKPXnSkWt7XPPHfGyOGS6JTQSVPelPLrJqtEOkTVlm1cOzs
bMta3nWELTGRoLjwkYO7+wvDKBsJBo6ZybJTcKI4hfOhqGfYONT7iERyfk9tWTVyVmvry716AdPn
hKy7BYGgG2iX8IQCibhr3DDn8iSFSKgfgeyKFLp2eNmjO1IE4l0E4pGYjNBFI4PcsYWJruAGtLml
sAB51wAPJcOVgOGRcuIphmsJ8qlyPu7FANS1+b0Oz6S12xDIOZ6WNu8FOHlOpCvoAY+c/8xlMy/L
vHOa1Fa0FuCpsqxKLrbIt62t9ldgE5JSE0ZoMeM87kpc4BBg0FVbVHl3txb2OmAfUugIHaq8ew7C
wafGk2WnIeroh2v9Cy+womjwwUZgRBFh5bY7csaGC1tbX+zzNtb43Q65+e13n90DAaPTOUni8m0H
MBvO0/5JxY+v6Prq0ErrESoEEa4F8egIOhFwAIBin55C6mdyOHcqIy3zUPeDvuZIxgAeBiuOA0wC
MEJYA2B/9DHQa4iYvqDY/9/+1krTXv8KfoET8u7EQ9yYcyLE7p7Y+fQqUnS2YULvYr/8oabsrUda
7dYuzgjSjBnT5YyGxbelOlu3ZxAe6mF9MrnW2RT7wNP16Vai3IK3T2DLQjeqK/9elQNJFnMN1QJ1
d3ouXfe4ETNOQmh/nKfcalANlFNrdNdY4bnyMc19odHqMbveq8ZjMnb2GbnOiQv0mA5c7hgXuED/
PFhgja7lV0CqLNyyRiwLGbYHAxAlCEJdzTjyXBCR5dy1ZIBMT3dtf2Tz8axGDYaOCTwhUPRT8tiR
uEH/SCKlUi1brGyxmDolHj/aahEtcu7Ug9MMiJDbi+3A+noES5S4TgVBJLbd+J369SBsNWGPRMw8
jbsfXkDE3NuX62p5QVSu5Cl1Xf1yoBLpRFSNT0DDPTFm9GitubmG1gQY9aUsfaw9bnSUgB5rtQC4
FjBgNHfuo2UtLcK1rKYMo6UG+oquQS8GiOIHochzFOebnAbDuxgOIpdblOYK1TeEh49NHt6ACGD4
7RiLaXfjVKKHYlq6Xoku377RM4QfDaAHkcFBWXMep0k/3jTsK/XLAAOuyj95BRB9uKurOw1dL/Nc
b3czZm6JK2m4ejZMpNrXLzTkCtovm3UaYoB+yedYhh4/1hf3ILydywrcCaBl3oybR+dumjn5zeCb
IQbolw4J//zNu4S8Z8djFI6dS3EJ9UxTrtgop0+kmwTvCtJvQbzZTEdf1+//IRwyxAD9S4B2XDO8
Cd43EwRbD1fUMuk+/4y5CQdJeOpW4W7hCtvudHAKIKa2fwil++hkiAH6WX24UTfonriQZ6CNtcT7
QivdxlucjLjFxwerfBN4aVD4ZogBBmUZN18kQwyw+dJuUEY+xACDsoybL5IhBth8aTcoIx9igEFZ
xs0Xic8A8NPvjwe/8OEXPLfCbduJvDq87wfgObUZed23hFDGjz8Zy6eXnRHBVgA/kniG7mOUM/iz
A96XBvEEfjDKu4bEfw+vhPFbArwfivdFeN8R78TJkDHdl4wb8ANPRr72QR3/7j3qHYLHBvxmIKlH
QhkvmvJuIyOVbE9ctwLKAD8BMML5Htr6H46i/vZ47IrfvjcvmG8Kv3lBhr//DQ/eZuYHsA8E5ZMC
/AyNMz5yF8qKhoFRn1fieYOJ63c7o53IIz5+Cf1K0MfheL6J3/6lDZQzenoGYCvAO8j3v9FAPsfO
OfCDm4+Qfyvy6OD9MYA3tHiYeAT5HyKf72cCdgU0Im9+gIN3MLjGDMbdgnz/Gj+/DeTVQn5Ix0++
GPkLHRNEwqtdSwF+5QA5bwoxQESGYISPJ5pqwOWA5wCMH5AQjNmzLQd4IeCXgEkAEuWMAMdlwPkC
3slInwL+FcDFDYnPu4P1qMMbS3S88Aujvj47J+EZrfwFgB+x8q4jmYmLzja89PIT4BqJyc/GOxmY
BArdubwX+THgLdSZgievqnGu4T0I+ueJ/1LAnwC8+Vv0SndAMLbFlTF/buEp8ni88zq8zwBIFwFm
Ab4KNs2DeCfBuI7+nQnkb4MHL+ZwnMwPPfsj8M6bWbx7QfzhhzMM53Oz8cKHPz7gGIXHjYD/AXA+
3adaSgASiJ1x90ZjzUTIz7n8myNBIlFHIY87sTuhA3ImHRrhBWdOOgxohBLkj6jHK19cFCYOjm1i
wQ54COXV+G3hd/c3g8jjwHmphNHFh1D2brTv8B35r+L9VdSnJOJu8K+XBZLmjUDScPEnB214a4hM
EyZ+3xAuIiUSpUH3xx2BZCBzHIoyfspOxu0rUQJRwnAH+n+JI0hk6KjaZf/hmnODPIr61xcgJcO9
gPz6gnzieT+6VkE5if0V5xupX413htCfQ/6GKB4i4URY+U+YHAdwc1CBA+MlEe4EDuAuPCcAeB+g
WCLxQwYgcUMfBxd1B+C5Cc/vAsJPwsPysA1xcuEKL43cj7w/AMYCju6j72g2mTn6tRMZsTZgJIpB
3nJiYv/RvvkejolEuA5tuOtuxNzZf5gK8fcaEuqvRtvpKLgfT6qrXyCPxC/WZzgGMgylcGHi9xMM
zxcm4hsD/PfhSUnNv9pCCUVGugn5zwR5LyH/dfxmWP5pPMnUvMzjX9zlnUAOgFe0qW/m4fk58ngp
hMxBcc27guEtX+pwErEwsZyEC68scNeHqoR4uNN/D6C04SWTkhPHhzEx7psokFCl4iDBqF44p10A
VFthKrzm5otM9MOdeTb6pfq4F89VBTt5wL4pOdGOG+sOAJmBl2cLHX+USNFNsx1+F159pzSlPVG4
8bhZKA2pxjhm/x4knl/gcSL6pk13M54HI68dQLuB0peqm/c6qQ58G4AGBwnzGYAEDheFBKXYYDkH
SR3Myw9cmDPwpK6icdICoI3AxTsFZU/geTLgSXaAxElKDOBFlJFRqPN+E5RRn0UXhX0Xu3tIIhIP
RTr11xGAFcDp2yYFiTijYpbz4GUWfrO4F95p26wAcKG/gzxKBYrFiQD/tjPyuOtoLHFNuNP8voPE
hQ+NZxJsd+AO5+pXQXtKIOphXq7hrgwlEi/zzUQ57QMyI42+8DuCB/DO63Rr8PwYUA28fN4D4OUc
4qItVBPks6vqAAf7bEU+v87m7W4alazP9daRt0VQjxuBdNSCvH04Ee6ImQAS4mlAqKO566hPuQvW
oMHUQLQdi980tCiOaQFTnHSgnKL1qiD/z8jjDWEmLiRPAyTcXwDLgwUiZy8FRG/wcoLFGIDEColA
yUKjjpMpxgBUaVzEMHFHvBT84I6sRv9kyC/xpBFG3Up1Nxd5oXFGC/p0gC8dkc9xhYk7kTiZuDN/
BDxPBZI0rMM5cD1IYBKCEoC781nUpQSkZOW8f4q81qCMNhDtEKpI0oJj4Zj411RY9wIA6fU2YGYw
hk/wvDqofx+eVFlU07TVSPyL0L4F7cmMUwFkXtpGPLlxM5z4N6iEwLiCALZoAAAAAElFTkSuQmCC

--_004_3dc64aea26e94e68818b81289f1a713bescryptcom_--


--===============4417802161047919504==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============4417802161047919504==--

