Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B53AD83566
	for <lists+linux-audit@lfdr.de>; Tue,  6 Aug 2019 17:35:23 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9A0FE30FB8F2;
	Tue,  6 Aug 2019 15:35:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 642511001948;
	Tue,  6 Aug 2019 15:35:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E52E7149F6;
	Tue,  6 Aug 2019 15:35:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x76DT7WC019580 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 6 Aug 2019 09:29:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0665D19C7F; Tue,  6 Aug 2019 13:29:07 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 000A719C78
	for <linux-audit@redhat.com>; Tue,  6 Aug 2019 13:29:04 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
	(mail-eopbgr30083.outbound.protection.outlook.com [40.107.3.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A3A4552151
	for <linux-audit@redhat.com>; Tue,  6 Aug 2019 13:29:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=ChSfIQawPhgYyrGZ/nhRa11D8W+BfCs024KL0Sxkm1Hbzb1YiJ6/7GJalFz3VNpxrkjegF938Mgv/C+hcjY1WydysrmGVwIu9CrSBH56JFUD/ZDTbah7VyHkuBaY8vYvuvTzgTcYTxtQFuIk7qpHfoT4xc3AZV2spFie2XO2ilwJKkhBlUycYDukWhxMOaF3UzMwiKesRm1TXyvmviV3QWpzlvxd7qFH7bnzhy2j3GMUPM57dbPRxptSYWDXZpoCNHWF60AYfo2e9tpCsqo8CfGCgAy3JTnnprOoKSTFEmRXcvDqLr8TUzmdHMqX5NhVbl33EKw3SM/VVZ+wTApceA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=GGcJYsFpfCPfBJTZmWsj9CfW5xQJ0Sqg+b1JBoWIUEg=;
	b=BKiTLI7riNV6Gh1cWHZCwJPL1EU82nPt6//6sR8+/w8yXM1iKq7G/wdyohI7C7vp8Rzun4OZ+mpgzTVs0yI629OTF91Wpf22hoL8HQUDQR7FZ6chhK0a9dgXF2AaMhKqB7vHPcN0LkGkttNkRDtPszS9CQNqED0nDYF8XE7Du/e0xbLO8eTI234T31o3Fr47EfXMN9MT8q+04vbdpbcPv0yXDwiJzVApElgxIHwkmdjeX4b992MFhzecV5HQ4p9iw6RC3Xdxz9oftLt5WmWTlAnIdqPr9m04z0/NlTGvzlSi6C4kOM4o6nFW0kTUbTMMET35PEfGXjSEf0aOSyZQtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=lums.edu.pk;
	dmarc=pass action=none header.from=lums.edu.pk; 
	dkim=pass header.d=lums.edu.pk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pern.onmicrosoft.com; 
	s=selector2-pern-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=GGcJYsFpfCPfBJTZmWsj9CfW5xQJ0Sqg+b1JBoWIUEg=;
	b=Gvhe6czegZJwYcV44SlabX3xoZaV0S1MwccqYe0eFBelxUAhYTZ6xmKHFg2jpxTY8zarGhwWz2H2x+f19/7RAcuMo3k1rZijVbPnnm5+xOknLmtp3TmqvBhCWJiYgOiO+YNfObblcSTxKqoifWMDNlnRCECDPs7GJ1BF5y+5CWs=
Received: from DB7PR07MB6057.eurprd07.prod.outlook.com (20.178.107.202) by
	DB7PR07MB6058.eurprd07.prod.outlook.com (20.178.107.203) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2157.8; Tue, 6 Aug 2019 13:28:58 +0000
Received: from DB7PR07MB6057.eurprd07.prod.outlook.com
	([fe80::7c77:94fe:3a84:84ad]) by
	DB7PR07MB6057.eurprd07.prod.outlook.com
	([fe80::7c77:94fe:3a84:84ad%5]) with mapi id 15.20.2157.011;
	Tue, 6 Aug 2019 13:28:58 +0000
From: Muhammad Adil Inam <20100180@lums.edu.pk>
To: "linux-audit@redhat.com" <linux-audit@redhat.com>
Subject: Query - System Calls Arguments in Linux Audit Kernel 
Thread-Topic: Query - System Calls Arguments in Linux Audit Kernel 
Thread-Index: AQHVTFrawf84iUAJJ0elB3jXOCNECg==
Date: Tue, 6 Aug 2019 13:28:58 +0000
Message-ID: <DB7PR07MB60579436984C50BB515349C898D50@DB7PR07MB6057.eurprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=20100180@lums.edu.pk; 
x-originating-ip: [110.93.234.9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f2ac414-1beb-4661-b752-08d71a7209a0
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:DB7PR07MB6058; 
x-ms-traffictypediagnostic: DB7PR07MB6058:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR07MB605840F0E620BEC3EE12B77798D50@DB7PR07MB6058.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0121F24F22
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(366004)(136003)(396003)(346002)(376002)(39860400002)(189003)(199004)(786003)(25786009)(316002)(8936002)(74316002)(5660300002)(66946007)(256004)(4326008)(66556008)(478600001)(64756008)(66446008)(81166006)(52536014)(8676002)(2351001)(66476007)(7736002)(33656002)(7696005)(19627405001)(68736007)(81156014)(26005)(102836004)(186003)(6506007)(2501003)(14454004)(53936002)(4743002)(99286004)(66066001)(88552002)(5640700003)(6436002)(2906002)(55016002)(107886003)(71190400001)(6116002)(54896002)(9686003)(476003)(486006)(3846002)(105004)(71200400001)(76116006)(6916009)(86362001)(81782002)(81742002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR07MB6058;
	H:DB7PR07MB6057.eurprd07.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: lums.edu.pk does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kPOwnnJIpF+zI/YqNzFak0U5k/entRsShcBTumvtERv6VMgbpvqzGYZkMYrl3II0g/mUUaSiZzwak8keWPVwy/4NDmYBX8pBNLEc2VRfs39O4ShUXUXlPjjpEB4vLZ/e0mz9L9T6E6qsvSFzkn8EGcUoiGCIQQNgtrL1gG3N/T0g8latnM3O/yY/vxSEMKH33zJRTq65EHwJnKDxTmhx2MhBrqxWO9llhdRbdtHrtl2yzLaXF9yp452JTvaIv+zksZRTnepH57WPukgxo2R029FPcjMLO/VGXLit34WFr4UGCm5CzKd0rsxZvKf4KtGoxFGsBSQfGc+w1tgAZfLGJbOmVxMDRxYyfP+V2RJcv3Z+NEw8QscRv+dywMVV6aHLt2r1aoCyZHd4eCOIlB1lbmvHP2fU7pEcZEoSzuNmZLg=
MIME-Version: 1.0
X-OriginatorOrg: lums.edu.pk
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f2ac414-1beb-4661-b752-08d71a7209a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2019 13:28:58.5016 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 75df096c-8b72-48e4-9b91-cbf79d87ee3a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F0aYf/97KjKZD0SwGPjZD9x9pVO+I2ez7jApg2PHkz64EhXRY4EyjoDAtP6AUbdj4VsYifDPbl+i9AT/MJMsZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR07MB6058
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.25]); Tue, 06 Aug 2019 13:29:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Tue, 06 Aug 2019 13:29:03 +0000 (UTC) for IP:'40.107.3.83'
	DOMAIN:'mail-eopbgr30083.outbound.protection.outlook.com'
	HELO:'EUR03-AM5-obe.outbound.protection.outlook.com'
	FROM:'20100180@lums.edu.pk' RCPT:''
X-RedHat-Spam-Score: -0.001  (DKIM_SIGNED, DKIM_VALID, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, SPF_HELO_PASS,
	SPF_PASS) 40.107.3.83 mail-eopbgr30083.outbound.protection.outlook.com
	40.107.3.83 mail-eopbgr30083.outbound.protection.outlook.com
	<20100180@lums.edu.pk>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 06 Aug 2019 11:28:02 -0400
Cc: Ali Ahad <20100284@lums.edu.pk>
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
Content-Type: multipart/mixed; boundary="===============6702435343831292461=="
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Tue, 06 Aug 2019 15:35:22 +0000 (UTC)

--===============6702435343831292461==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DB7PR07MB60579436984C50BB515349C898D50DB7PR07MB6057eurp_"

--_000_DB7PR07MB60579436984C50BB515349C898D50DB7PR07MB6057eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

To whom it may concern,

Hi,

           I am a CS research assistant currently working at Lahore Univers=
ity of Management Sciences (LUMS), Pakistan. The project I am working on in=
volves understanding and working with the Linux Audit Kernel.

As you know, linux-audit logs all the syscall arguments as a1, a2, a3, a4 a=
s unsigned longs. In the case of some syscall, such as WRITE, the second ar=
gument, a2, stores the pointer to a buffer, where the buffer contains the c=
ontent being written. I have been trying to deference the buffer from its a=
ddress stored in a2. I am dereferencing the buffer currently in kernel/audi=
tsc.c and dumping the dereferenced contents of a2 to printk. However, after=
 building the customized kernel, auditd fails probably due to invalid point=
er dereferencing.

                I am confused regarding the scope of that pointer variable =
stored in a2. I have two questions:

1) Is it possible to deference the syscall arguments in the Linux kernel, g=
iven the buffer was initially sent by the process that initiated the syscal=
l?

2) If it is possible to do so, what is the right way to go about it. What i=
s the right file to work if the goal is to dereference the address stored i=
n one of the SYSCALL arguments?

Really looking forward to hearing back from you.

Best Regards,

Adil


--_000_DB7PR07MB60579436984C50BB515349C898D50DB7PR07MB6057eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<p style=3D"margin: 0in 0in 8pt; line-height: 107%; font-size: 11pt; font-f=
amily: Calibri, sans-serif">
<span style=3D"font-size: 9pt; font-family: &quot;Segoe UI&quot;, sans-seri=
f; color: rgb(0, 0, 0); background: white;">To whom it may concern,
</span></p>
<p style=3D"margin: 0in 0in 8pt; line-height: 107%; font-size: 11pt; font-f=
amily: Calibri, sans-serif">
<span style=3D"font-size: 9pt; font-family: &quot;Segoe UI&quot;, sans-seri=
f; color: rgb(0, 0, 0); background: white;">Hi,
</span><span style=3D"font-size:9.0pt; font-family:=0A=
&quot;Segoe UI&quot;,sans-serif; color:#0078D4; background:white"><span sty=
le=3D"color: rgb(0, 0, 0);">&nbsp;</span></span></p>
<p style=3D"margin: 0in 0in 8pt; line-height: 107%; font-size: 11pt; font-f=
amily: Calibri, sans-serif">
<span style=3D"font-size:9.0pt; font-family:=0A=
&quot;Segoe UI&quot;,sans-serif; color:#0078D4; background:white"><span sty=
le=3D"color: rgb(0, 0, 0);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;
</span><span style=3D"color: rgb(0, 0, 0);">&nbsp;</span></span><span style=
=3D"font-size: 9pt; font-family: &quot;Segoe UI&quot;, sans-serif; color: r=
gb(0, 0, 0); background: white;">I am a CS research assistant currently wor=
king at Lahore University of Management Sciences (LUMS),
 Pakistan. The project I am working on involves understanding and working w=
ith the Linux Audit Kernel.</span></p>
<p style=3D"margin: 0in 0in 8pt; line-height: 107%; font-size: 11pt; font-f=
amily: Calibri, sans-serif;text-indent:.5in">
<span style=3D"font-size: 9pt; font-family: &quot;Segoe UI&quot;, sans-seri=
f; color: rgb(0, 0, 0); background: white;">As you know, linux-audit logs a=
ll the syscall arguments as a1, a2, a3, a4 as unsigned longs. In the case o=
f some syscall, such as WRITE, the second argument,
 a2, stores the pointer to a buffer, where the buffer contains the content =
being written. I have been trying to deference the buffer from its address =
stored in a2. I am dereferencing the buffer currently in kernel/auditsc.c a=
nd dumping the dereferenced contents
 of a2 to printk. However, after building the customized kernel, auditd fai=
ls probably due to invalid pointer dereferencing.
</span></p>
<p style=3D"margin: 0in 0in 8pt; line-height: 107%; font-size: 11pt; font-f=
amily: Calibri, sans-serif">
<span style=3D"font-size:9.0pt; font-family:=0A=
&quot;Segoe UI&quot;,sans-serif; color:#0078D4; background:white"><span sty=
le=3D"color: rgb(0, 0, 0);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"color: rgb(0, 0, 0);">&nbsp;</span></span><span style=
=3D"font-size: 9pt; font-family: &quot;Segoe UI&quot;, sans-serif; color: r=
gb(0, 0, 0); background: white;">I am confused regarding the scope of that =
pointer variable stored in a2. I have two questions:</span></p>
<p style=3D"margin: 0in 0in 8pt; line-height: 107%; font-size: 11pt; font-f=
amily: Calibri, sans-serif">
<span style=3D"font-size:9.0pt; font-family:=0A=
&quot;Segoe UI&quot;,sans-serif; color:#0078D4; background:white"><br>
</span><span style=3D"font-size: 9pt; font-family: &quot;Segoe UI&quot;, sa=
ns-serif; color: rgb(0, 0, 0); background: white;"><b>1) Is it possible to =
deference the syscall arguments in the Linux kernel, given the buffer was i=
nitially sent by the process that initiated
 the syscall?</b></span></p>
<p style=3D"margin: 0in 0in 8pt; line-height: 107%; font-size: 11pt; font-f=
amily: Calibri, sans-serif">
<span style=3D"font-size: 9pt; font-family: &quot;Segoe UI&quot;, sans-seri=
f; color: rgb(0, 0, 0); background: white;"><b>2) If it is possible to do s=
o, what is the right way to go about it. What is the right file to work if =
the goal is to dereference the address stored
 in one of the SYSCALL arguments?</b></span></p>
<p style=3D"margin: 0in 0in 8pt; line-height: 107%; font-size: 11pt; font-f=
amily: Calibri, sans-serif">
<span style=3D"font-size:9.0pt; font-family:=0A=
&quot;Segoe UI&quot;,sans-serif; color:#0078D4; background:white"></span></=
p>
<p style=3D"margin: 0in 0in 8pt; line-height: 107%; font-size: 11pt; font-f=
amily: Calibri, sans-serif">
<span style=3D"font-size: 9pt; font-family: &quot;Segoe UI&quot;, sans-seri=
f; color: rgb(0, 0, 0); background: white;">Really looking forward to heari=
ng back from you.</span></p>
<p style=3D"margin: 0in 0in 8pt; line-height: 107%; font-size: 11pt; font-f=
amily: Calibri, sans-serif">
<span style=3D"font-size:9.0pt; font-family:=0A=
&quot;Segoe UI&quot;,sans-serif; color:#0078D4; background:white"></span></=
p>
<p style=3D"margin: 0in 0in 8pt; line-height: 107%; font-size: 11pt; font-f=
amily: Calibri, sans-serif">
<span style=3D"font-size: 9pt; font-family: &quot;Segoe UI&quot;, sans-seri=
f; color: rgb(0, 0, 0); background: white;">Best Regards,</span></p>
<p style=3D"margin: 0in 0in 8pt; line-height: 107%; font-size: 11pt; font-f=
amily: Calibri, sans-serif">
<span style=3D"font-size: 9pt; font-family: &quot;Segoe UI&quot;, sans-seri=
f; color: rgb(0, 0, 0); background: white;">Adil</span></p>
<br>
</div>
</body>
</html>

--_000_DB7PR07MB60579436984C50BB515349C898D50DB7PR07MB6057eurp_--


--===============6702435343831292461==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============6702435343831292461==--

