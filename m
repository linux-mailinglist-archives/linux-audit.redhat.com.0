Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 41324102EEF
	for <lists+linux-audit@lfdr.de>; Tue, 19 Nov 2019 23:15:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574201721;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=fpcVfENEgDBqyRkcD6rjA+Lgq1Mkbco/gNzLYQO/fWw=;
	b=QKqKKWbhYsBJVXjsXySKy+m3HgPKp1GtMB6okqsX6vRyzjM/9mz52j/RDveEcAoStVy2qZ
	P4PaRpNIJNZYBJtcH2bnMFYILV0IC0dPh3GlFzZA/MGahpm4RYdFbLkoyIw8nNBM6/ZhAF
	NamRyN2x02CHWRmDwDN2YWEdygTM7QU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-gQhUTU7hNimI05md5wzwkg-1; Tue, 19 Nov 2019 17:15:19 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D746A801E5B;
	Tue, 19 Nov 2019 22:15:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B1D675E258;
	Tue, 19 Nov 2019 22:15:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5D09618095FF;
	Tue, 19 Nov 2019 22:15:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA8CqVSG003001 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 8 Nov 2019 07:52:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 871411001B39; Fri,  8 Nov 2019 12:52:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx27.extmail.prod.ext.phx2.redhat.com
	[10.5.110.68])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 805711001B34
	for <linux-audit@redhat.com>; Fri,  8 Nov 2019 12:52:28 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
	(mail-eopbgr30114.outbound.protection.outlook.com [40.107.3.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9B7E0800396
	for <linux-audit@redhat.com>; Fri,  8 Nov 2019 12:52:27 +0000 (UTC)
Received: from AM0PR07MB4148.eurprd07.prod.outlook.com (52.133.59.151) by
	AM0PR07MB5235.eurprd07.prod.outlook.com (20.178.17.85) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2430.16; Fri, 8 Nov 2019 12:52:25 +0000
Received: from AM0PR07MB4148.eurprd07.prod.outlook.com
	([fe80::a8b7:80fe:fd07:1497]) by
	AM0PR07MB4148.eurprd07.prod.outlook.com
	([fe80::a8b7:80fe:fd07:1497%4]) with mapi id 15.20.2430.023;
	Fri, 8 Nov 2019 12:52:25 +0000
From: "Kadirvadivelu, Vezhavendan 1. (EXT - IN/Chennai)"
	<vezhavendan.1.kadirvadivelu.ext@nokia.com>
To: "linux-audit@redhat.com" <linux-audit@redhat.com>
Subject: Security audit rules
Thread-Topic: Security audit rules
Thread-Index: AdWWMyZTL2zLwTN+QTK6b84pFG3fdg==
Date: Fri, 8 Nov 2019 12:52:25 +0000
Message-ID: <AM0PR07MB414818424612036066D01E9BB27B0@AM0PR07MB4148.eurprd07.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [131.228.32.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a1c74557-facd-4f4f-c624-08d7644a8138
x-ms-traffictypediagnostic: AM0PR07MB5235:
x-microsoft-antispam-prvs: <AM0PR07MB52355D07B84DBCF5A322D1A3B27B0@AM0PR07MB5235.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0215D7173F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(39860400002)(376002)(366004)(396003)(346002)(189003)(199004)(99286004)(5640700003)(478600001)(6436002)(790700001)(6116002)(3846002)(7736002)(74316002)(2351001)(52536014)(25786009)(71200400001)(8936002)(2501003)(7696005)(14454004)(476003)(486006)(256004)(71190400001)(6506007)(6306002)(8676002)(3480700005)(102836004)(26005)(558084003)(81166006)(81156014)(2906002)(33656002)(186003)(9326002)(55016002)(54896002)(76116006)(64756008)(9686003)(66476007)(66556008)(86362001)(5660300002)(7116003)(66446008)(316002)(66066001)(66946007)(6916009);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR07MB5235;
	H:AM0PR07MB4148.eurprd07.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7FNpgRrQ+lMLuXeWfb4nY6KyU8cGW+jKN5b/C7aCNkw36mqBm0E4ggMDyN7iYZHET1acVBMCOdtzJbT+sLSEAnpWGzWMqLETbq5VhP0Ngj0XSYQMHCfGbAK/nuPfJSxHQhqF7It6PhrL3AehozBIu987FBa7IT+gwWBi65bg38qrdBpRBbFyXaC9E0hQKnF78NL0nqpzAoGPVTmvoiXexvAu3EWUSxJC699giXvv8G7W1Tmi2XyNeejZ+9qLxVuC8n9sO9kyXdL0I9djr9LnmPxExkLx0iet7ut5RWKaE4KThjdyd8FzLL4qcgA/Q0UoKSMzjxQ/iVhDtfDlgpZ5tmjMalffOGEB1dtgkgYtUmLvtffaYTKLDs/mW/RWJQIiiWjPY7lX7Tq5u9Xa+JQPaHZrzFQkq9c7SyLkWiWtgZrLYwnoJS/uEBwuPb4RKD4K
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1c74557-facd-4f4f-c624-08d7644a8138
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2019 12:52:25.3724 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uW1oULx48QoFEObxowNYbu4lI/GioKKw2pDjsfkQVhFJ6EtIqugVF/b1XDtLIAFeQAZqh0bNeiVJLNkefLgeD28DcSc5HjWYysrRNK/VNj/yzMQKJPZfH3WVhxvcF0i2BalZ5icV8pcRapDQcyug6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR07MB5235
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.68]); Fri, 08 Nov 2019 12:52:28 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]);
	Fri, 08 Nov 2019 12:52:28 +0000 (UTC) for IP:'40.107.3.114'
	DOMAIN:'mail-eopbgr30114.outbound.protection.outlook.com'
	HELO:'EUR03-AM5-obe.outbound.protection.outlook.com'
	FROM:'vezhavendan.1.kadirvadivelu.ext@nokia.com' RCPT:''
X-RedHat-Spam-Score: -0.002  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	HTML_MESSAGE, RCVD_IN_DNSWL_NONE, SPF_HELO_PASS,
	SPF_PASS) 40.107.3.114 mail-eopbgr30114.outbound.protection.outlook.com
	40.107.3.114 mail-eopbgr30114.outbound.protection.outlook.com
	<vezhavendan.1.kadirvadivelu.ext@nokia.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.68
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 19 Nov 2019 17:14:54 -0500
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
X-MC-Unique: gQhUTU7hNimI05md5wzwkg-1
X-Mimecast-Spam-Score: 0
Content-Type: multipart/mixed; boundary="===============5739382083361642610=="

--===============5739382083361642610==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AM0PR07MB414818424612036066D01E9BB27B0AM0PR07MB4148eurp_"

--_000_AM0PR07MB414818424612036066D01E9BB27B0AM0PR07MB4148eurp_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hi,

In one of the VM I find audit.rules defined under /etc/audit as well as /et=
c/audit/rules.d.

What is the significance as well as difference between the files found in 2=
 places.

Also please let me know what is the correct location where audit.rules need=
 to be places.


Regards,
Vezhavendan K

--_000_AM0PR07MB414818424612036066D01E9BB27B0AM0PR07MB4148eurp_
Content-Type: text/html; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:m=3D"http://schema=
s.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html=
40">
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
=09{margin:0cm;
=09margin-bottom:.0001pt;
=09font-size:11.0pt;
=09font-family:"Calibri",sans-serif;
=09mso-fareast-language:EN-US;}
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
=09font-family:"Calibri",sans-serif;
=09mso-fareast-language:EN-US;}
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
<body lang=3D"EN-IN" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">In one of the VM I find audit.r=
ules defined under /etc/audit as well as /etc/audit/rules.d.<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">What is the significance as wel=
l as difference between the files found in 2 places.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Also please let me know what is=
 the correct location where audit.rules need to be places.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Regards,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Vezhavendan K<o:p></o:p></span>=
</p>
</div>
</body>
</html>

--_000_AM0PR07MB414818424612036066D01E9BB27B0AM0PR07MB4148eurp_--

--===============5739382083361642610==
Content-Type: text/plain; charset=WINDOWS-1252
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============5739382083361642610==--

