Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 97A192FDB4A
	for <lists+linux-audit@lfdr.de>; Wed, 20 Jan 2021 22:15:35 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-_t6TP8AbNReeokVe__2rwQ-1; Wed, 20 Jan 2021 16:15:31 -0500
X-MC-Unique: _t6TP8AbNReeokVe__2rwQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 425FB806661;
	Wed, 20 Jan 2021 21:15:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 523B861F38;
	Wed, 20 Jan 2021 21:15:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 437FD4A7C6;
	Wed, 20 Jan 2021 21:15:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10KKtvEN030470 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 20 Jan 2021 15:55:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D97C7A9E78; Wed, 20 Jan 2021 20:55:57 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2E36B17C9
	for <linux-audit@redhat.com>; Wed, 20 Jan 2021 20:55:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BA4F187504D
	for <linux-audit@redhat.com>; Wed, 20 Jan 2021 20:55:55 +0000 (UTC)
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
	[216.71.155.175]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-378-oTLvtgJjMuCI_7I4lY1uLg-1; Wed, 20 Jan 2021 15:55:51 -0500
X-MC-Unique: oTLvtgJjMuCI_7I4lY1uLg-1
IronPort-SDR: aGR/c4SQrgc72uwXbCcLfiwNDN36HHX75mcH6asIGtDzSNO2maog9B2loh8crVv/64FMSkDKaj
	wNgezMpsnljbflhlx9uVeaXR+bLLtN60/9Uo+FmdnckVTz8yCtV7ZtQ165HVMxmPl10OiiAoS6
	GbMrFy9ERWyqnmEy/w2gjTJyB2ezBjQUaSOF3fbzYENZyVz12zQYwFHarjc9JaE4h8LE80degW
	zHnzdRKYeFO4SpC9f8LBtMBLg3K+GeKP+QVPh9YCYqeC61pX2QJuQHpEKga1Qb5QqfNWjXY380
	40s=
X-SBRS: 5.2
X-MesageID: 35718149
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,362,1602561600"; d="scan'208,217";a="35718149"
From: Shourya Jaiswal <shourya.jaiswal@citrix.com>
To: "linux-audit@redhat.com" <linux-audit@redhat.com>
Subject: Probable bug in auditd
Thread-Topic: Probable bug in auditd
Thread-Index: AdbvbXTZYlTBATHnTJWpY9jAms4IVw==
Date: Wed, 20 Jan 2021 20:54:45 +0000
Message-ID: <SA2PR03MB567451FA692CEF4BC66D0A9886A20@SA2PR03MB5674.namprd03.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f5ba3104-6490-4cb0-ce7f-08d8bd859e22
x-ms-traffictypediagnostic: SN2PR03MB2173:
x-microsoft-antispam-prvs: <SN2PR03MB2173A80C5C4FC8A2D9921C2686A29@SN2PR03MB2173.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: RuoVsH5Sdk6szbtfUVhc6LbEZNEsVmHtvfWfwyToXYLRaRcBRM5wmCviatAnKVqe+xtb6KZiIvlEUt9JIfQ9D9+15AwAfv64LVgCHpwLdDlS1z92zZdbAdnBr9hihUG/ls/ZwH8czH36AxAEjuJHGAyJAWjMlMqRbhAYmv8cCYHAEmSbCh2nREeDBgj+l9N8UgisMgNxV70FLuChJ2Iq2u/YaPoizCDZ8XT3jhpAkyPp050awlcH2IAwW8ZcvMq0jXEcuUw53QUKijbMn9n6E+2/7UsUjI0uitlvm4roedK5l42TbUsMPJFJaUxuhXjl5ZP3w+SBSpCdgVID4V9mwFInqHX5njXLdSCp8JAJ6/N/mxX4lBb2JsvxPCbwGv81OjvxwF7PRwfvxlyU4OMdmQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SA2PR03MB5674.namprd03.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(6916009)(9326002)(86362001)(316002)(44832011)(4744005)(2906002)(478600001)(7696005)(71200400001)(4326008)(52536014)(8676002)(66946007)(66556008)(5660300002)(55016002)(9686003)(66446008)(76116006)(3480700007)(64756008)(33656002)(26005)(66476007)(186003)(6506007)(8936002);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?nEOVePYL3B2t2PnrZ+d9/FVHMLhpkRfs1ZrjNOhnIVcz0xpqN4xrZmj8PTUY?=
	=?us-ascii?Q?kPjINvRv8LD07ClZkiufXjwBjjb+uCcZPO2kQelHsyrKBhUnaAj7BKZ/sQGv?=
	=?us-ascii?Q?e8jpqlZl3dMrOM0lj9OTcJFJH+FNXMft74XXLR/nTGf5vjihhjHuPH/mNI1B?=
	=?us-ascii?Q?Dz1MyA138zk9TJ5QKGzXCoPMYQU1BT/NbspsDEZL12an2UQah4sQio6gfZwF?=
	=?us-ascii?Q?iLaKylKKVFyPdNlTdhxEbIdNhCPoG6bCrlvzEm8IFLXixhqqT6DIGv0JH/R3?=
	=?us-ascii?Q?QLj+tpHS13doVilUVf7zITwSNaXeK3QyKR3O/z+eBWdk2NoJCq1yglrVye3e?=
	=?us-ascii?Q?WCeIqclbwuLTUsKz7EZJf9SOUd3PGcw9nYu5OwxrnHJTWm0/PTF2eBRLPOxc?=
	=?us-ascii?Q?+Ewr0d3wYOIqToHhmfqemaiDdnn3UsUn8XeURSQ7XBEkqQ8bkv7NvUndf03C?=
	=?us-ascii?Q?V03HolteSX0Feylhlv7Cj2GE4ZRoiLSqTfpqlPtXYGic9HKcL1j6vFq9tnYl?=
	=?us-ascii?Q?X71+gEpWNUB547ilsKE++T32hkMwamph8UXR0mrxv1aWj6OYzEAMvJj+bYU1?=
	=?us-ascii?Q?f5M5fzRr8nQ1RTipNfzJEZnGTkouUdByDeDniKye5AeP5C9A1cltMvuLQeZr?=
	=?us-ascii?Q?qUdE1TT0RG09xjRduQkoAjgfVx0Cqi8LBbkbO8qHrkkvDdR55KqM1CW/4mO1?=
	=?us-ascii?Q?SY45od+xF8+hN6/w9avh/yKvuRkVNcnVk+MBfkE2Cegmv7YX8L93JXsnp3tw?=
	=?us-ascii?Q?2nIhOQSAW8mFInwezGvgD94a54VISTKHialvQbOLk6A10IJG/8pbO14wrgby?=
	=?us-ascii?Q?2BxIolTd/hXeR6pj1mlGroJpmc2BGOLEG6Ecb82dur33o2OuuMA7Q6Uasq0D?=
	=?us-ascii?Q?k85TFJPVFEx6Y08gk8fK+IJ/dc+vJnptn1aNZ0cStGAVZNkT5YYOXcQZfN9a?=
	=?us-ascii?Q?zB2/YyT5H+fWfZ98K5W+EL2oVy4XUJhJCniF2+dZziY=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR03MB5674.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5ba3104-6490-4cb0-ce7f-08d8bd859e22
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2021 20:54:45.3699 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yBL6UcY0u9wC4HQXXUVfOZgoRCqmSmCklVclW7dgC8Tn2sr1+82T6op+k9VwHBeii1fKeK6A2asb+Z4BJZAgv3eKXBIh6gljByUnm0cm0xQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR03MB2173
X-OriginatorOrg: citrix.com
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
X-Mailman-Approved-At: Wed, 20 Jan 2021 16:14:49 -0500
Cc: "shourya98@gmail.com" <shourya98@gmail.com>
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
Content-Language: en-US
Content-Type: multipart/mixed; boundary="===============9166783983952397123=="

--===============9166783983952397123==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SA2PR03MB567451FA692CEF4BC66D0A9886A20SA2PR03MB5674namp_"

--_000_SA2PR03MB567451FA692CEF4BC66D0A9886A20SA2PR03MB5674namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I have found a weird behavior in auditd. File "/abc" does not exist.

audit.rules:

-a always,exit -F arch=3Db32 -S open -S openat

-a always,exit -F arch=3Db64 -S open -S openat

A non-root user executes "echo > /abc", it doesn't get logged in audit.log.=
 Same with "echo > /etc/abc"
A non-root user executes "cat /abc", it gets logged in audit.log

Since auditd is monitoring all the open and openat syscalls, ideally both t=
he cases (i.e. read and write) should have be logged.

After I execute "chmod a+w /" then "chmod a-w /", if a non-root user execut=
es "echo > /abc", then it gets logged in audit.log.

This looks like a bug to me. Kindly let me know if it's a bug or an intende=
d feature.

System used to test: Linux 5.4.0-56-generic #62-Ubuntu SMP x86_64 x86_64 x8=
6_64 GNU/Linux

Regards,
Shourya Jaiswal


--_000_SA2PR03MB567451FA692CEF4BC66D0A9886A20SA2PR03MB5674namp_
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
=09{font-family:DengXian;
=09panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
=09{font-family:Calibri;
=09panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
=09{font-family:"\@DengXian";
=09panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
=09{margin:0cm;
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
p
=09{mso-style-priority:99;
=09mso-margin-top-alt:auto;
=09margin-right:0cm;
=09mso-margin-bottom-alt:auto;
=09margin-left:0cm;
=09font-size:12.0pt;
=09font-family:"Times New Roman",serif;}
span.EmailStyle17
=09{mso-style-type:personal-compose;
=09font-family:"Calibri",sans-serif;
=09color:windowtext;}
.MsoChpDefault
=09{mso-style-type:export-only;}
@page WordSection1
=09{size:612.0pt 792.0pt;
=09margin:72.0pt 72.0pt 72.0pt 72.0pt;}
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
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif">Hi, <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif">I have found a weird behavior in auditd.
</span><span lang=3D"EN-IN" style=3D"font-family:&quot;Arial&quot;,sans-ser=
if">File &#8220;/abc&#8221; does not exist.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-IN" style=3D"font-family:&quot;Aria=
l&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><u><span style=3D"font-family:&quot;Arial&quot;,sans=
-serif">audit.rules:<o:p></o:p></span></u></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span lang=3D"EN-IN" style=3D=
"font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">-a =
always,exit -F arch=3Db32 -S open -S openat<o:p></o:p></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span lang=3D"EN-IN" style=3D=
"font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">-a =
always,exit -F arch=3Db64 -S open -S openat<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-IN" style=3D"font-family:&quot;Aria=
l&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-IN" style=3D"font-family:&quot;Aria=
l&quot;,sans-serif">A non-root user executes &#8220;echo &gt; /abc&#8221;, =
it doesn&#8217;t get logged in audit.log. Same with &#8220;echo &gt; /etc/a=
bc&#8221;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-IN" style=3D"font-family:&quot;Aria=
l&quot;,sans-serif">A non-root user executes &#8220;cat /abc&#8221;, it get=
s logged in audit.log<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-IN" style=3D"font-family:&quot;Aria=
l&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-IN" style=3D"font-family:&quot;Aria=
l&quot;,sans-serif">Since auditd is monitoring all the open and openat sysc=
alls, ideally both the cases (i.e. read and write) should have be logged.<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-IN" style=3D"font-family:&quot;Aria=
l&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif">After I execute &#8220;chmod a+w /&#8221; then &#8220;chmod a-w /&#822=
1;,
</span><span lang=3D"EN-IN" style=3D"font-family:&quot;Arial&quot;,sans-ser=
if">if a non-root user executes &#8220;echo &gt; /abc&#8221;, then it gets =
logged in audit.log.</span><span style=3D"font-family:&quot;Arial&quot;,san=
s-serif"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-IN" style=3D"font-family:&quot;Aria=
l&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-IN" style=3D"font-family:&quot;Aria=
l&quot;,sans-serif">This looks like a bug to me. Kindly let me know if it&#=
8217;s a bug or an intended feature.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-IN" style=3D"font-family:&quot;Aria=
l&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-IN" style=3D"font-family:&quot;Aria=
l&quot;,sans-serif">System used to test:
</span><span style=3D"font-family:&quot;Arial&quot;,sans-serif">Linux 5.4.0=
-56-generic #62-Ubuntu SMP x86_64 x86_64 x86_64 GNU/Linux<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-IN" style=3D"font-family:&quot;Aria=
l&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-IN" style=3D"font-family:&quot;Aria=
l&quot;,sans-serif">Regards,<o:p></o:p></span></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" style=3D"border-collapse:collapse">
<tbody>
<tr>
<td width=3D"708" style=3D"width:894.5pt;padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal" style=3D"line-height:11.25pt"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#000001">Shourya J=
aiswal</span><span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,=
sans-serif;color:black"><o:p></o:p></span></p>
</td>
</tr>
<tr>
<td width=3D"708" style=3D"width:894.5pt;padding:0cm 0cm 0cm 0cm"></td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SA2PR03MB567451FA692CEF4BC66D0A9886A20SA2PR03MB5674namp_--

--===============9166783983952397123==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============9166783983952397123==--

