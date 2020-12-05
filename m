Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 41F852CF8C0
	for <lists+linux-audit@lfdr.de>; Sat,  5 Dec 2020 02:46:26 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-ChI-_7uUMtShg2cVAe38xA-1; Fri, 04 Dec 2020 20:46:22 -0500
X-MC-Unique: ChI-_7uUMtShg2cVAe38xA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5718E1005513;
	Sat,  5 Dec 2020 01:46:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA4A51349A;
	Sat,  5 Dec 2020 01:46:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 36855180954D;
	Sat,  5 Dec 2020 01:46:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B51jpdL030345 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 4 Dec 2020 20:45:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8A35B108488; Sat,  5 Dec 2020 01:45:51 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 83267F496B
	for <linux-audit@redhat.com>; Sat,  5 Dec 2020 01:45:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14830858EEC
	for <linux-audit@redhat.com>; Sat,  5 Dec 2020 01:45:49 +0000 (UTC)
Received: from emailgw02.pnnl.gov (emailgw02.pnnl.gov [192.101.109.63])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-168-m0j--cQCMGyvf226-Ov3gg-1; Fri, 04 Dec 2020 20:45:46 -0500
X-MC-Unique: m0j--cQCMGyvf226-Ov3gg-1
X-RoutedThroughMyMX: Yes
Received: from ex10cashub03.pnnl.gov ([130.20.251.222])
	by emailgw02.pnnl.gov with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2020 16:45:41 -0800
Received: from GCC02-BL0-obe.outbound.protection.outlook.com (130.20.128.10)
	by hybrid.pnnl.gov (130.20.251.222) with Microsoft SMTP Server (TLS) id
	14.3.487.0; Fri, 4 Dec 2020 16:45:41 -0800
Received: from SJ0PR09MB6048.namprd09.prod.outlook.com (2603:10b6:a03:26a::10)
	by SJ0PR09MB7070.namprd09.prod.outlook.com (2603:10b6:a03:26f::14)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22;
	Sat, 5 Dec 2020 00:45:39 +0000
Received: from SJ0PR09MB6048.namprd09.prod.outlook.com
	([fe80::c9a4:1044:5de5:1bc6]) by
	SJ0PR09MB6048.namprd09.prod.outlook.com
	([fe80::c9a4:1044:5de5:1bc6%6]) with mapi id 15.20.3589.025;
	Sat, 5 Dec 2020 00:45:39 +0000
From: "Smith, Gary R" <Gary.Smith@pnnl.gov>
To: Linux-Audit Mailing List <linux-audit@redhat.com>
Subject: Audit firewall changes in RHEL 8
Thread-Topic: Audit firewall changes in RHEL 8
Thread-Index: AQHWyp4r7dWGpu58fUehpQXJITDYYQ==
Date: Sat, 5 Dec 2020 00:45:39 +0000
Message-ID: <SJ0PR09MB60481EFF857F6B4D0C65A31FFEF00@SJ0PR09MB6048.namprd09.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [68.185.40.210]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3aedad65-cb87-41b2-a773-08d898b71643
x-ms-traffictypediagnostic: SJ0PR09MB7070:
x-microsoft-antispam-prvs: <SJ0PR09MB7070D8B940D9A489E996AA60FEF00@SJ0PR09MB7070.namprd09.prod.outlook.com>
x-ld-processed: d6faa5f9-0ae2-4033-8c01-30048a38deeb,ExtAddr
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:5797
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: W5wdTcR5A7CHfmmRWaRlMHEMluX1tj7RXoPw082U0qTyQkBrFgApHXsSA9gAi9SA0fHZJYLoxcMOQTRqKLNt7YnFaD2ydBMynd8iz+FcTtWbi4Q8cPEfQl5bjqwZRJxf93z6n/AnyZnL9q0nzcTCJvepz+UdjTT1/5reS3jqMEPtxUhr0XZtkHVpkwmy65Al08k1jcNGQgAob0j7pwkna16OLwRLmGZUeS49+Nl+Pody3txYWGf7e5Ac7MaOnTCoQhRn2ZpyzWscLuSKVsy9To/VgmwOFBbaaDRp6TMpJnq0lO8vRFJy01WOcH77x+QJTmuRh1gNB7sjv4sbR3omfQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SJ0PR09MB6048.namprd09.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(4636009)(376002)(39860400002)(136003)(346002)(396003)(366004)(55016002)(316002)(6916009)(2906002)(52536014)(66446008)(64756008)(66556008)(66476007)(66946007)(91956017)(76116006)(8936002)(8676002)(6506007)(7696005)(86362001)(478600001)(26005)(186003)(5660300002)(71200400001)(33656002)(9686003);
	DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata: =?Windows-1252?Q?Xs0NA8R0WA8HrAOdBkhsg2OXH6g2nQPqzANkd/QJEXuWIrf83LNDM87i?=
	=?Windows-1252?Q?5G9RqdT9+e8t5mQaJL0dw+P5L3lFoP20hX/NSG+cEpRV+WJmtIQxIFX7?=
	=?Windows-1252?Q?c7KhtWkx5aMh289/tkKr8yy69KRudDo4RRi+bjs/MdxcfZ9imn5S8TZK?=
	=?Windows-1252?Q?FfkLU9RA+ZcPIUEFF3EalZVm/zOLNM1oNKJqelSHBFczY7Zp81ykE9Hi?=
	=?Windows-1252?Q?TsqnOld5EBXtTAErvBgAnYb1rlxLZnteqRYtGK3ZdJkx5vSM1SMp28K3?=
	=?Windows-1252?Q?FO9l4UmzOHI2U1jevBVcn8HtkD2KYHZP/BrmvYRA5zXSpJNLmJebrFN7?=
	=?Windows-1252?Q?z/5sh3XpunFahTo/TBFr4vbKEIaUkB8sfQjhd9MOFDeyCt0xoCBrtIBV?=
	=?Windows-1252?Q?c9/lsfL/o+myMU/SY1cm52XNtLXugSbRpN1Um4J7izQt1dL1Q9X+JCQJ?=
	=?Windows-1252?Q?nxERrOzRonjHcdUwJ1mF/7FEFPRHH1NwuJ6bKUBDr22BJm8fJfO0lKx9?=
	=?Windows-1252?Q?jqAEYOzOOZKJcfkgTt5hPvIhWTldpfB+jZAi3eYr1HeMAjq2HKNGsJu/?=
	=?Windows-1252?Q?3SbjL2iIcqmaXTi0wxs3mEr4nDQ7MsVJCUJN0CSbxBhkGAq++iSJ8EtT?=
	=?Windows-1252?Q?eHp+iRrbYi8YbyvYG1zjskYWmBE1VvbmisoHlMCEPzZOmop1w9dv4oBu?=
	=?Windows-1252?Q?LbLVzIo2dqRfYNjHEmE90O0mRiRnrcQbnLOE5PiDgNCYiZdI2L7fwYkB?=
	=?Windows-1252?Q?s+NGv1p8Bn+m4pUX8TXWMc/4KahQj3PE5tGfi2O/FzwGLHWKYTNBT2KR?=
	=?Windows-1252?Q?CdrJ/hIeVyDNhLIJS89mSJS3YZAzKzDpdbj2KHHEXESQwAnKp7Zf4NTL?=
	=?Windows-1252?Q?yjDgxdw3je1eIyUQVsoAzjesInk3YJzHiO99Op1Hbiqo6qDx/QVwwDyS?=
	=?Windows-1252?Q?2tkyjqvsjZIwfq4cK76KWo7Vd5EfbMxhuQEDOz7IbLVOnNZ9/Orr4YhE?=
	=?Windows-1252?Q?c8yL5po/A/g2lBjWlxuQAjAitXCAnNYySasfbnCUjT/DTXvna9SG27O8?=
	=?Windows-1252?Q?pQ8XgFspvoBrqwoZ?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR09MB6048.namprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aedad65-cb87-41b2-a773-08d898b71643
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2020 00:45:39.2168 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d6faa5f9-0ae2-4033-8c01-30048a38deeb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LQS2KfyCBt3ionaiygZP3/l1xs25Xtd5DC4cJ4AcBPfGbMaWl0FaoigFt6doyePi3qnZrWc2M/TNnbupK8rBQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR09MB7070
X-OriginatorOrg: pnnl.gov
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: multipart/mixed; boundary="===============1959503636825441574=="

--===============1959503636825441574==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SJ0PR09MB60481EFF857F6B4D0C65A31FFEF00SJ0PR09MB6048namp_"

--_000_SJ0PR09MB60481EFF857F6B4D0C65A31FFEF00SJ0PR09MB6048namp_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Good afternoon,

I have RHEL 7 systems set up to emit audit records when the firewall rules =
with iptables change. I do it with a single audit command:

-a always,exit -F arch=3Db64 -S setsockopt -F a2=3D0x40 -F key=3DIPTablesCh=
ange

And it works great. I get audit logs like this:

type=3DPROCTITLE msg=3Daudit(12/04/2020 11:04:58.840:3334178) : proctitle=
=3Diptables -D INPUT 2
type=3DSYSCALL msg=3Daudit(12/04/2020 11:04:58.840:3334178) : arch=3Dx86_64=
 syscall=3Dsetsockopt success=3Dyes exit=3D0 a0=3D0x4 a1=3Dip a2=3DIPT_SO_S=
ET_REPLACE a3=3D0x1009ca0 items=3D0 ppid=3D154754 pid=3D160855 auid=3DDrEvi=
l uid=3Droot gid=3Droot euid=3Droot suid=3Droot fsuid=3Droot egid=3Droot sg=
id=3Droot fsgid=3Droot tty=3Dpts0 ses=3D198995 comm=3Diptables exe=3D/usr/s=
bin/xtables-multi key=3DIPtablesChange
type=3DNETFILTER_CFG msg=3Daudit(12/04/2020 11:04:58.840:3334178) : table=
=3Dfilter family=3Dipv4 entries=3D48

I want to do the same thing with RHEL 8 and nftables. I tried the same audi=
t rule but nothing happens. I tried using firewall-cmd to change the rules.=
 The rules changed, but no audit records. I fat fingered rules using nft bu=
t no audit record. I suspect that I=92m not writing the audit rule correctl=
y.  I looked around to see if a2 needed to be something other than 0x040 (I=
PT_SO_SET_REPLACE) but I couldn=92t find anything.

Any suggestions on how to do this in RHEL 8 would be appreciated.

Best regards,

Gary Smith


--_000_SJ0PR09MB60481EFF857F6B4D0C65A31FFEF00SJ0PR09MB6048namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
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
=09{margin:0in;
=09font-size:11.0pt;
=09font-family:"Calibri",sans-serif;}
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
--></style>
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Good afternoon,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I have RHEL 7 systems set up to emit audit records w=
hen the firewall rules with iptables change. I do it with a single audit co=
mmand:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">-a always,exit -F arch=3Db64 -S setsockopt -F a2=3D0=
x40 -F key=3DIPTablesChange<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">And it works great. I get audit logs like this:<o:p>=
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">type=3DPROCTITLE msg=3Daudit(12/04/2020 11:04:58.840=
:3334178) : proctitle=3Diptables -D INPUT 2<o:p></o:p></p>
<p class=3D"MsoNormal">type=3DSYSCALL msg=3Daudit(12/04/2020 11:04:58.840:3=
334178) : arch=3Dx86_64 syscall=3Dsetsockopt success=3Dyes exit=3D0 a0=3D0x=
4 a1=3Dip a2=3DIPT_SO_SET_REPLACE a3=3D0x1009ca0 items=3D0 ppid=3D154754 pi=
d=3D160855 auid=3DDrEvil uid=3Droot gid=3Droot euid=3Droot suid=3Droot
 fsuid=3Droot egid=3Droot sgid=3Droot fsgid=3Droot tty=3Dpts0 ses=3D198995 =
comm=3Diptables exe=3D/usr/sbin/xtables-multi key=3DIPtablesChange<o:p></o:=
p></p>
<p class=3D"MsoNormal">type=3DNETFILTER_CFG msg=3Daudit(12/04/2020 11:04:58=
.840:3334178) : table=3Dfilter family=3Dipv4 entries=3D48<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I want to do the same thing with RHEL 8 and nftables=
. I tried the same audit rule but nothing happens. I tried using firewall-c=
md to change the rules. The rules changed, but no audit records. I fat fing=
ered rules using nft but no audit
 record. I suspect that I=92m not writing the audit rule correctly. &nbsp;I=
 looked around to see if a2 needed to be something other than 0x040 (IPT_SO=
_SET_REPLACE) but I couldn=92t find anything.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Any suggestions on how to do this in RHEL 8 would be=
 appreciated.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best regards,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Gary Smith<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SJ0PR09MB60481EFF857F6B4D0C65A31FFEF00SJ0PR09MB6048namp_--

--===============1959503636825441574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============1959503636825441574==--

