Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1537DE155
	for <lists+linux-audit@lfdr.de>; Wed,  1 Nov 2023 14:06:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698843985;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=5uQDqiISaHVhh7dIHvq+Te2OpRmN9PyNFdhpeJNEcX0=;
	b=Y8RwPn1O44dft9i1l0/n/NtBPSzVbZEzGw174Ccv5tDzNGaPcggCC2tL5j+tblvTj0VNkV
	yYtvpeTB1rt7rP+prqkpn0C55sRPJDLC4r+iREe+KNGRF6R7VR+8v9uEZ9KoWHU/FyIsK9
	eDhyZGWciXncrCfaDhqnI6m58YyXi6w=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-211-JbhU11svO_ynTytqkbRE1w-1; Wed,
 01 Nov 2023 09:06:20 -0400
X-MC-Unique: JbhU11svO_ynTytqkbRE1w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92B8D3C0BE31;
	Wed,  1 Nov 2023 13:06:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B93CB10F52;
	Wed,  1 Nov 2023 13:06:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B4D3C19466ED;
	Wed,  1 Nov 2023 13:06:06 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2BAEC194658F for <linux-audit@listman.corp.redhat.com>;
 Wed,  1 Nov 2023 10:30:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C7E571C060BF; Wed,  1 Nov 2023 10:30:45 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C08611C060BE
 for <linux-audit@redhat.com>; Wed,  1 Nov 2023 10:30:45 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9BDAC85A58A
 for <linux-audit@redhat.com>; Wed,  1 Nov 2023 10:30:45 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01olkn2040.outbound.protection.outlook.com [40.92.53.40]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-nlE09AfOMhu8R2oyhmtohw-1; Wed, 01 Nov 2023 06:30:43 -0400
X-MC-Unique: nlE09AfOMhu8R2oyhmtohw-1
Received: from TYZPR04MB6983.apcprd04.prod.outlook.com (2603:1096:400:342::7)
 by PUZPR04MB6745.apcprd04.prod.outlook.com (2603:1096:301:11b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.27; Wed, 1 Nov
 2023 10:30:38 +0000
Received: from TYZPR04MB6983.apcprd04.prod.outlook.com
 ([fe80::2e62:efef:2dd6:cf82]) by TYZPR04MB6983.apcprd04.prod.outlook.com
 ([fe80::2e62:efef:2dd6:cf82%7]) with mapi id 15.20.6954.019; Wed, 1 Nov 2023
 10:30:37 +0000
From: charles xia <qi.hsia@hotmail.com>
To: "linux-audit@redhat.com" <linux-audit@redhat.com>
Subject: how to monitor file access inside container by auditd?
Thread-Topic: how to monitor file access inside container by auditd?
Thread-Index: AQHaDKscHiCPWGeVy0CJdATobwPFNw==
Date: Wed, 1 Nov 2023 10:30:37 +0000
Message-ID: <TYZPR04MB6983ABBF5AD8BAF58F5031FCEAA7A@TYZPR04MB6983.apcprd04.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-tmn: [2R/ol4gCtbyJ+9jfpqWh6cy0wZJsKyGx]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR04MB6983:EE_|PUZPR04MB6745:EE_
x-ms-office365-filtering-correlation-id: b3e4d670-b13a-488e-6929-08dbdac596b2
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: Q/9VKe8L9ivfmUbhA63FJvtI4nz3sh6nUgwWFqlhNqmsPT0eR/Ntw74NaozQQLn9KpqKS0EEAe62DipX3fNC162l4MWaVdmigY4l9j5S5h/ArlihKghHNqlXQ5Ci7caIGGMAReVMwsNQp97LfpLZFI0Lh3VvfLh9WvBF3dr1IYvdclGcAv6f2WhN6b54ewdtDdcfLTUx7nY4sEDP5N23D8nSyr3Q/4cjlPPEq+TUiAvM7qNYnHEUoo5py1LEKRZTwvp4XAr4c4IBOqpyUW8RpF+B0wu8bhZpGCU4s7mug9sxjsz6oudtocBlV8cPNifSSEd07oqYaFN9/A/ZAOg5Hsw7u9joSWc1oekfDyzPB2+8QExKAPOElfYlHj7aY6eViCaRMk3aTyYK6QO9w+Az20x4/MzHrhj6SIwO/fT3GluYxs/gG9NIXH339eHVOy13ntD73mq9R3fDcOvhz+mDYG7UiwbAfZ1YHXFMEHyRu23HGOqPJ2EyucK4y392gSfYkeDcSMCamX/AFOiWf7ehsHS9v2XMGNFVq6SF+O5/Bp3wsKtK0Er9llJ9XVaaiR6N
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?44XFEu52p4heDANm+bID78D4prFa8Mj7VIl4nbBzOdBgDlBNRGfdt+iBJY?=
 =?iso-8859-1?Q?5youbRsQsmQXZHf5Fr26zw3k2MTm82Ya+q2DLVd3oY66y1KzpRUCd32bFm?=
 =?iso-8859-1?Q?N+tRK8dl4xz33t5FL9/fEJgChEqmqNCYM9ceBYRZSamhRIO072LWgTeFTB?=
 =?iso-8859-1?Q?wM/EEZHzoDN9iQEnaS5hDkqaP7htT62T9sq3R3Bw76JZkH7u7xkca6bjkM?=
 =?iso-8859-1?Q?mAooFU/6UQh9ENjSsbXczrrmr9vNBLwycbL3gygN7w7VXUJKuDmuOpXG8+?=
 =?iso-8859-1?Q?c3iWp1khg+chEE7ANG/v+VJ2rSmI3NBkaphMKC6/vyeFHBZJJ3gYRsZXpt?=
 =?iso-8859-1?Q?hTOdBGBdpOiGe4cJtD14OfW+I8uJ4/vDhybu/2aE1tYckvZCB10EgT0lnO?=
 =?iso-8859-1?Q?z1XQH1Fme1AXnCbkUDMxHfSZxdUb56p5C24yRO3UAXodQBVuJXGVEfolTj?=
 =?iso-8859-1?Q?LFOU381Gl81DCXgoBzxq0bpnjje2VEiVUamBUBAGOKjaYDzGkyArhCZ2KR?=
 =?iso-8859-1?Q?TzhGG6ryqXql4xRHpnLzkrTh8zw5ggjhlySnlV4HYwD+u6HPzWTKvngsqX?=
 =?iso-8859-1?Q?8Q4sPvH/OaGXqwt98ALQdENt+f7jaXJzpH+o51NgCXjg8yYebEwgI7+2Mw?=
 =?iso-8859-1?Q?XNkMxW8BmW0vv3oakmIBjBd0ie2XPP4VWE+KqUFhXA/MreWYDfVrIqbqsm?=
 =?iso-8859-1?Q?wpHsbNLys+YkC/7cLTDr1Ez0Ayr0v62XmEfMzreBQ438h9/ts3nrN1oPgD?=
 =?iso-8859-1?Q?kDTI1C5fZBEa8AEWXWYd5Jp8yjirrCFlb/kL+MQoG9YMquSE8b1zKnBTRx?=
 =?iso-8859-1?Q?vy3O3kRbO6JkZkT4xl60IpnNfyTofzuwBRgaLAKkLJHSSSCtdz0lbbTjGz?=
 =?iso-8859-1?Q?jNsD5vUsVlp9y3xaF3CK3p7Vl1KQpCXpIBp/34fI5G0CxBnP9VtBrkOKEW?=
 =?iso-8859-1?Q?OWC4TGux5llDveMN3FQeFKRykO2PR9c2mjUMepVz8elBM4IAdFOwiBxkIu?=
 =?iso-8859-1?Q?8z1DpRWEM/wpk1YNhTSmr5dS1QC7WSaf9MlL1B+aNIgeWCGF9+ATfFTR2b?=
 =?iso-8859-1?Q?0Oxep6W+vqtOa0HBofG/jg5m2mR8nwY8g8k6jBsqQTGlEfOTRhygYTVreW?=
 =?iso-8859-1?Q?ioWwkF+d5Js8oXPOicMUVxlPjB/hgSOX3dBs9XfcS+CrAjYoVC59cY4Yx7?=
 =?iso-8859-1?Q?mJi2eNJ341Ct43JI7iCZ8u3oyesuIAk3N53ExpRZcEopa8CeiMyk90tM?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-6ea25.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR04MB6983.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: b3e4d670-b13a-488e-6929-08dbdac596b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2023 10:30:37.4712 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB6745
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mailman-Approved-At: Wed, 01 Nov 2023 13:06:05 +0000
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: hotmail.com
Content-Language: en-US
Content-Type: multipart/mixed; boundary="===============0092185492408794764=="

--===============0092185492408794764==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_TYZPR04MB6983ABBF5AD8BAF58F5031FCEAA7ATYZPR04MB6983apcp_"

--_000_TYZPR04MB6983ABBF5AD8BAF58F5031FCEAA7ATYZPR04MB6983apcp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Dear audit group,
I have docker containers running in k8s cluster, in one container there was=
 issue reported that some specific file was lost but we didn't know who del=
eted the file or when the file got lost.
The worker node where container is located has auditd installed and running=
 however container doesn't have auditd installed. My idea is to set up some=
 audit rule to watch the specific file and see how it was deleted.
the problematic file in container:
[admin@1422dd6ae839 data]$ ls /data/foo.log
foo.log
[admin@1422dd6ae839 data]$ pwd
/data

Problem is that auditd is running in worker, therefore when I specify the r=
ule for the file inside container, I'd give rule like following:
auditctl -w /data/foo.log
however this path doesn't exist in worker node so auditd would not be able =
to watch it.

I tried "nsenter" to enter the container mount namespace and add rule but s=
ince auditd is not running in container it could not work either.

Appreciate if someone could help me to find out a way to watch file inside =
container while auditd is running in worker node.

BR/Charles

--_000_TYZPR04MB6983ABBF5AD8BAF58F5031FCEAA7ATYZPR04MB6983apcp_
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
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Dear audit group,</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
I have docker containers running in k8s cluster, in one container there was=
 issue reported that some specific file was lost but we didn't know who del=
eted the file or when the file got lost.</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
The worker node where container is located has auditd installed and running=
 however container doesn't have auditd installed. My idea is to set up some=
 audit rule to watch the specific file and see how it was deleted.&nbsp;</d=
iv>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
the problematic file in container:</div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">[admin@1422dd6ae839&n=
bsp;data]$ ls /data/foo.log</span></div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">foo.log</span></div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">[admin@1422dd6ae839&nbsp;data]$ pwd</span></di=
v>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">/data</span></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Problem is that auditd is running in worker, therefore when I specify the r=
ule for the file inside container, I'd give rule like following:</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
auditctl -w /data/foo.log&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
however this path doesn't exist in worker node so auditd would not be able =
to watch it.</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
I tried &quot;nsenter&quot; to enter the container mount namespace and add =
rule but since auditd is not running in container it could not work either.=
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Appreciate if someone could help me to find out a way to watch file inside =
container while auditd is running in worker node.</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
BR/Charles</div>
</body>
</html>

--_000_TYZPR04MB6983ABBF5AD8BAF58F5031FCEAA7ATYZPR04MB6983apcp_--

--===============0092185492408794764==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============0092185492408794764==--

