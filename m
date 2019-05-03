Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1C61340A
	for <lists+linux-audit@lfdr.de>; Fri,  3 May 2019 21:32:30 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E866B3001805;
	Fri,  3 May 2019 19:32:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE31B608D0;
	Fri,  3 May 2019 19:32:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 03D8C18089C9;
	Fri,  3 May 2019 19:32:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x43JVpC2004788 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 3 May 2019 15:31:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 16CE91001E61; Fri,  3 May 2019 19:31:51 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F4A0100194A
	for <linux-audit@redhat.com>; Fri,  3 May 2019 19:31:48 +0000 (UTC)
Received: from ppes-mail-c5.wal-mart.com (ppes-mail-c5.wal-mart.com
	[161.167.229.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6F9E0882FD
	for <linux-audit@redhat.com>; Fri,  3 May 2019 19:31:43 +0000 (UTC)
Received: from pps.filterd (ppes-mail-c5.wal-mart.com [127.0.0.1])
	by ppes-mail-c5.wal-mart.com (8.16.0.27/8.16.0.27) with SMTP id
	x43JV0n5065065
	for <linux-audit@redhat.com>; Fri, 3 May 2019 14:31:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walmart.com;
	h=from : to : subject
	: date : message-id : content-type : mime-version; s=mail;
	bh=ZSrDxAs4B6KqMSpGDALPV31rZesewLy8jOB1LOjzTCs=;
	b=uuOt2wExAr0EGcXzrhGt2Pp2xJeAghOZDXPbSeECJI8mRklyfH4ysjJYzTUuqKb1MseX
	B6PBNaJOOqeBWdxo43ViYBlBiA6JMzznWQCtWskQOzsSwZhQNkrgUbtroGPBMQU9/VH1
	hOt/OGDba9ve0gd8u68WXgys4AbYLKgzW05C7g6XuZqF+xl36hLpEGmWCKsZjdMBCLDP
	pykRGRlXKoRymZoZuB9BFGEP1hKlpCrukQDC4eIf3eBVAWw021PhKX3uSIEq/TxKkK/V
	IQhT3pDPPVRjI4nqURRQxm5fqPowcwv3ULA63MLIdhXUB3ZI0oNtFzTH1CRhx1XFFqUn
	3g== 
Received: from honts35016.homeoffice.wal-mart.com (oser500437.wal-mart.com
	[10.24.131.30])
	by ppes-mail-c5.wal-mart.com with ESMTP id 2s8q93ha7a-2
	for <linux-audit@redhat.com>; Fri, 03 May 2019 14:31:42 -0500
Received: from PHONT10105USC.homeoffice.Wal-Mart.com (10.24.137.104) by
	HONTS35016.homeoffice.Wal-Mart.com (10.24.144.220) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Fri, 3 May 2019 14:31:41 -0500
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (10.10.197.231)
	by hybrid.wal-mart.com (10.24.137.104) with Microsoft SMTP Server (TLS)
	id 14.3.408.0; Fri, 3 May 2019 14:31:41 -0500
Received: from MWHP100MB0222.NAMP100.PROD.OUTLOOK.COM (129.75.89.217) by
	MWHP100MB0207.NAMP100.PROD.OUTLOOK.COM (129.75.89.214) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1835.14; Fri, 3 May 2019 19:31:39 +0000
Received: from MWHP100MB0222.NAMP100.PROD.OUTLOOK.COM
	([fe80::4888:ce33:9d39:c74b]) by MWHP100MB0222.NAMP100.PROD.OUTLOOK.COM
	([fe80::4888:ce33:9d39:c74b%10]) with mapi id 15.20.1835.018;
	Fri, 3 May 2019 19:31:39 +0000
From: Joshua Ammons <Joshua.Ammons@walmart.com>
To: "linux-audit@redhat.com" <linux-audit@redhat.com>
Subject: auid = unset
Thread-Topic: auid = unset
Thread-Index: AdUB5WDM1bPJWX9HQ3G1uxIT7bYesg==
Date: Fri, 3 May 2019 19:31:39 +0000
Message-ID: <MWHP100MB022241AAEC6251F1F37A6B34F2350@MWHP100MB0222.NAMP100.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [161.168.138.245]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f6c87688-b93d-40f3-83e3-08d6cffdf6df
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
	SRVR:MWHP100MB0207; 
x-ms-traffictypediagnostic: MWHP100MB0207:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <MWHP100MB02073D84587F6F8C69FB97FDF2350@MWHP100MB0207.NAMP100.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0026334A56
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(346002)(376002)(136003)(366004)(396003)(39860400002)(189003)(199004)(504964003)(6916009)(26005)(14454004)(256004)(33656002)(14444005)(486006)(606006)(476003)(86362001)(2906002)(74316002)(7736002)(2351001)(68736007)(3846002)(6116002)(790700001)(71190400001)(71200400001)(52536014)(186003)(966005)(478600001)(6506007)(102836004)(316002)(25786009)(2501003)(4744005)(7696005)(5660300002)(72206003)(99286004)(5640700003)(81156014)(66066001)(81166006)(9686003)(6306002)(236005)(6436002)(66446008)(8676002)(8936002)(53936002)(55016002)(64756008)(54896002)(73956011)(66946007)(76116006)(66476007)(66556008)(9030500004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHP100MB0207;
	H:MWHP100MB0222.NAMP100.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: walmart.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: G5dBpMTew+/HCPGVSXEKFaYHsiAtd1KtxvPFiqzViJEh4DPlc38sHVJsRwgcFw3ycok4jH+OSZzo9aJJkudU53ePLK7fIMJBBAoBCw7/gn+Ssg3ci7i1TwA6O5SdsO6ehAoPxHi8si7N58x79C+QQ2gXZlFETSe+N3UTN/MH6300dIBYeV8OFAFG3b/P5B4xi4wfUcRqhwNtHMV5zSw4+BaznltqUuiep0KEz61JOYyU61ePJWw0tEqtoLpj5iJlu8YNmslCceRYGxNogGyfLoKJrLBNQArPgWfCzdblxg3Q0pKlVibkRtIo96npCiRUPflhuPHGxbTH1WUyw/SNLEtlmowMg/h0GOYECIJtZ8loaGiCMGtkPWMkMxpkpJUEY04ju2z3aMccwtgxBooYOwnpfQFQC1ZB4SLBgJyJ6Xo=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f6c87688-b93d-40f3-83e3-08d6cffdf6df
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2019 19:31:39.2860 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3cbcc3d3-094d-4006-9849-0d11d61f484d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHP100MB0207
X-OriginatorOrg: walmart.com
X-CFilter-Loop: oser500437
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-03_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=848
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
	definitions=main-1905030127
X-Greylist: Sender passed SPF test, ACL 242 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Fri, 03 May 2019 19:31:44 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Fri, 03 May 2019 19:31:44 +0000 (UTC) for IP:'161.167.229.196'
	DOMAIN:'ppes-mail-c5.wal-mart.com' HELO:'ppes-mail-c5.wal-mart.com'
	FROM:'Joshua.Ammons@walmart.com' RCPT:''
X-RedHat-Spam-Score: -7.61  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	HTML_MESSAGE, SPF_HELO_PASS, T_DKIMWL_WL_HIGH,
	USER_IN_DEF_DKIM_WL) 161.167.229.196 ppes-mail-c5.wal-mart.com
	161.167.229.196 ppes-mail-c5.wal-mart.com
	<Joshua.Ammons@walmart.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Content-Type: multipart/mixed; boundary="===============6903090440928135318=="
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Fri, 03 May 2019 19:32:28 +0000 (UTC)

--===============6903090440928135318==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MWHP100MB022241AAEC6251F1F37A6B34F2350MWHP100MB0222NAMP_"

--_000_MWHP100MB022241AAEC6251F1F37A6B34F2350MWHP100MB0222NAMP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello, I just wanted to see if anyone has had much success with configuring=
 redhat systems to reduce and/or eliminate the occurrence of auid =3D unset=
 in the audit events?  I found the following redhat article that provides a=
 fix by updating a grub setting for auditd but this doesn't seem to have mu=
ch of an effect, as I still see large number of unset values in the logs.

https://access.redhat.com/solutions/971883

Thank you in advance for any information you may have on this.



--_000_MWHP100MB022241AAEC6251F1F37A6B34F2350MWHP100MB0222NAMP_
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
<p class=3D"MsoNormal">Hello, I just wanted to see if anyone has had much s=
uccess with configuring redhat systems to reduce and/or eliminate the occur=
rence of auid =3D unset in the audit events?&nbsp; I found the following re=
dhat article that provides a fix by updating
 a grub setting for auditd but this doesn&#8217;t seem to have much of an e=
ffect, as I still see large number of unset values in the logs.<o:p></o:p><=
/p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://access.redhat.com/solutions/97188=
3">https://access.redhat.com/solutions/971883</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thank you in advance for any information you may hav=
e on this.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_MWHP100MB022241AAEC6251F1F37A6B34F2350MWHP100MB0222NAMP_--


--===============6903090440928135318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============6903090440928135318==--

