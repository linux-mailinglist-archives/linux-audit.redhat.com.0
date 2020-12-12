Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 373C52D89F4
	for <lists+linux-audit@lfdr.de>; Sat, 12 Dec 2020 21:24:45 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280--JjgHZCuPc-J_AKkCen7Kw-1; Sat, 12 Dec 2020 15:24:42 -0500
X-MC-Unique: -JjgHZCuPc-J_AKkCen7Kw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B588180A089;
	Sat, 12 Dec 2020 20:24:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0912C2BFE3;
	Sat, 12 Dec 2020 20:24:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2795C18095C7;
	Sat, 12 Dec 2020 20:24:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BCKONEq010293 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 12 Dec 2020 15:24:23 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3CA85621BF; Sat, 12 Dec 2020 20:24:23 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 345AB63536
	for <linux-audit@redhat.com>; Sat, 12 Dec 2020 20:24:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBDE1185A794
	for <linux-audit@redhat.com>; Sat, 12 Dec 2020 20:24:20 +0000 (UTC)
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com
	[148.163.147.86]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-460-JT610K04M-a8XxKpHnpENA-1; Sat, 12 Dec 2020 15:24:18 -0500
X-MC-Unique: JT610K04M-a8XxKpHnpENA-1
Received: from pps.filterd (m0134422.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
	0BCKJZ5S023595; Sat, 12 Dec 2020 20:24:17 GMT
Received: from g4t3425.houston.hpe.com (g4t3425.houston.hpe.com
	[15.241.140.78])
	by mx0b-002e3701.pphosted.com with ESMTP id 35cq8kk888-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sat, 12 Dec 2020 20:24:16 +0000
Received: from G2W6311.americas.hpqcorp.net (g2w6311.austin.hp.com
	[16.197.64.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by g4t3425.houston.hpe.com (Postfix) with ESMTPS id 707C2A8;
	Sat, 12 Dec 2020 20:24:16 +0000 (UTC)
Received: from G4W9330.americas.hpqcorp.net (16.208.32.116) by
	G2W6311.americas.hpqcorp.net (16.197.64.53) with Microsoft SMTP Server
	(TLS) id 15.0.1497.2; Sat, 12 Dec 2020 20:21:27 +0000
Received: from G9W9209.americas.hpqcorp.net (2002:10dc:429c::10dc:429c) by
	G4W9330.americas.hpqcorp.net (2002:10d0:2074::10d0:2074) with Microsoft
	SMTP Server (TLS) id 15.0.1497.2; Sat, 12 Dec 2020 20:21:27 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (15.241.52.11) by
	G9W9209.americas.hpqcorp.net (16.220.66.156) with Microsoft SMTP
	Server (TLS)
	id 15.0.1497.2 via Frontend Transport; Sat, 12 Dec 2020 20:21:26 +0000
Received: from DF4PR8401MB0347.NAMPRD84.PROD.OUTLOOK.COM
	(2a01:111:e400:7606::14) by DF4PR8401MB0346.NAMPRD84.PROD.OUTLOOK.COM
	(2a01:111:e400:760a::22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12;
	Sat, 12 Dec 2020 20:21:25 +0000
Received: from DF4PR8401MB0347.NAMPRD84.PROD.OUTLOOK.COM
	([fe80::e4cc:4e9:c375:2b3d]) by
	DF4PR8401MB0347.NAMPRD84.PROD.OUTLOOK.COM
	([fe80::e4cc:4e9:c375:2b3d%5]) with mapi id 15.20.3654.020;
	Sat, 12 Dec 2020 20:21:25 +0000
From: "Tia, Javier" <javier.tia@hpe.com>
To: Steve Grubb <sgrubb@redhat.com>, "linux-audit@redhat.com"
	<linux-audit@redhat.com>
Subject: Re: [PATCH] Fix audispd crash on ARM 32-Bits
Thread-Topic: [PATCH] Fix audispd crash on ARM 32-Bits
Thread-Index: AQHW0CwH37E7K+oTnkmX2kw2+/Ph0Knz3mwAgAAJ9oA=
Date: Sat, 12 Dec 2020 20:21:25 +0000
Message-ID: <f1c0ffd0-fbe0-5233-33e8-059a141ab55b@hpe.com>
References: <20201212021050.26656-1-javier.tia@hpe.com>
	<11696239.O9o76ZdvQC@x2>
In-Reply-To: <11696239.O9o76ZdvQC@x2>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.5.0
x-originating-ip: [190.171.127.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 45670adb-6e70-4875-98d3-08d89edb8018
x-ms-traffictypediagnostic: DF4PR8401MB0346:
x-microsoft-antispam-prvs: <DF4PR8401MB0346A755EC616ECB104F4B4D99C90@DF4PR8401MB0346.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6108
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: kcI2EKf+feDonEsrwwXyN7d/UvMNElM/JWhak96Kvq80FIz2uKnrIfo1j+lpTc1qU9TRA0TUz7Oyq17jIXQw6ciFLGqQDRQSZD4EJM5HKeUe5CmV+2yLvPbk14O5i0QyBeGnBWFnwBXfPoLwShwT29puctiKxcOZBql2IZNkfuFy3WgL9bojUwzfJzVhlK/NJ1j0baNlJKZCPeXIsuTfwF28HFzFLG4A0iCCE6YFBgXYFxEJGew7fqIVtNgzOw9IqpgULyyyBlrwSc5uPHeTJOXPqJ0gi8h7iwn/2TBaEQioT1QFrHFOFrmg6Hj5foa4M+2sghAfQHJGLwXUzbw7YZKrcsURB6HD6D2VOxWBuOKw+F1vhz4/VBI6103ECZkzB532altC56cgxFFnqrP9I6lYSPBMWD4EIjSA9alOx/k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DF4PR8401MB0347.NAMPRD84.PROD.OUTLOOK.COM;
	PTR:; CAT:NONE;
	SFS:(376002)(346002)(366004)(136003)(186003)(66476007)(66446008)(66946007)(450100002)(36756003)(64756008)(31686004)(2906002)(66556008)(2616005)(6512007)(110136005)(8676002)(6486002)(508600001)(83380400001)(5660300002)(86362001)(31696002)(26005)(6506007)(76116006)(71200400001)(53546011)(8936002)(45980500001)(43740500002);
	DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata: =?utf-8?B?Q1YzTTdOUTFjaHVVUlp1dTdvMnFSRWIyUFBaS3V3STc5MHk1SjhRdEFjQ2k1?=
	=?utf-8?B?V3VSb0FVTzJ2MGJYNE56M0RXSk51SjBRTjhNYU9lRit2UElQcnE2b3NPOEJw?=
	=?utf-8?B?a2EzTEdZaldjdU5WbXU5ek9Vd1JKa0VGMWxxcUtkZ3liclBleFBWYTNsU1dz?=
	=?utf-8?B?QW9FWUN6Y3VQbmI5WG91VCtFUWo2YkxzVWREQkk4NjMxaEdqMnZ3cVRVaUVh?=
	=?utf-8?B?Qmp0TFhuK2F2ZXAxRGNRcEVDL0NBQUsyUTRVcFgwZU5Ua1V1Zy81NUZ1ajZK?=
	=?utf-8?B?ZzJvSWpUL2d1K21TUXlPZzlBcDNnTGdka3hRQnRiVEx2YkFyU21jclBxakZl?=
	=?utf-8?B?cW9pZDhrbnJBWHdUQjBrRFp2TW9pdHZCeWdpaVhiQ3JtYXdoRzhoMCszbWRq?=
	=?utf-8?B?TXFkTlJTN2ZuNHd4Y3FvUDErNUFwL3Qzdmdtb2UzaTNBUWVET2tHcUdkWHZp?=
	=?utf-8?B?U1F5cGZRNlhTSVN6OFg4Z2d3bUhkR2k5OGZzTVBnZDdQQVBtc2ZrWFJyTVpV?=
	=?utf-8?B?ZWVseE9WZXRDRC95QWtUa214czdncno0NStCT3loQ2NzUXVjM2hVeVdhbi96?=
	=?utf-8?B?SWZRRzhrOFh2TkJLaHVHVWNmNmx0MXp0cFJ5ajZlLzBLY3lBaXI2QnQxWVZa?=
	=?utf-8?B?M2RKV0pLN2lyaE56T0xlK1QvbDQyU3lYa0tQc3hZWTJRZ1JzZmlreW1yU2Ex?=
	=?utf-8?B?TG9ZUHM3T2c0SjNydUlTVjZHNGJmREh3Mm5iMG56YVNJbVJBOU1lSnRJNzdH?=
	=?utf-8?B?Q3lxSFJjVEFsUER1a2pScXhORkVielJkSFhUZmZlbkV3MmlUczQyQjY1eXZO?=
	=?utf-8?B?NGRYRjlmMFhURFd2bXBoSk96aU1LU0V3WUh6Y3l0QWphYWJrRXdvSzlpY0sy?=
	=?utf-8?B?TGZRQTlKMDVvdm5RVWJaVG1XSHRod01veHZEQ1REWUlsUlVyVXZVNmFTQ1hl?=
	=?utf-8?B?VVpodHdVRktQdjN4MDE1d2NFd3dIWHZPQVN1bDFkcmVNOENzQ1pRb0FoUlA1?=
	=?utf-8?B?YUU4NlJpa2tEYU1CVy9XRzdUWG12TStRWC8vdGRubkpLa2xJdGlKdTVkajF6?=
	=?utf-8?B?OTI1K2h4VkdhK1lLeE4wUGxiVTkwWHBZcW5zUkZ1SkxMb3htYjRPM1pISXl6?=
	=?utf-8?B?TjZxZkdQb1JxYW9pbEdqeFRCSCtzVWNLdm4xZXFaRUdub2JkdVRNdXM5MTMz?=
	=?utf-8?B?L2lNZzdPY29iaGtvN09yTk5sK1dZbDBJcHFMbnFmVDJydkI5V1ZVZ29pczJW?=
	=?utf-8?B?a3NSMkxJQVh2dzVWYWNmSWtiQzJrcWtvaCtYbVYrek9tUElaYTNsY1gyaUFh?=
	=?utf-8?Q?ZYdnXwZBxB6JA=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DF4PR8401MB0347.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 45670adb-6e70-4875-98d3-08d89edb8018
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2020 20:21:25.6187 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3q9EkDs3VjCsJt419BN9xGG3dAL62DvvTXI1paH93OLsecTE4GAftYxjabHbEQCjEXtQ6CsyQ6Z963nxAQkQFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DF4PR8401MB0346
X-OriginatorOrg: hpe.com
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
	definitions=2020-12-12_08:2020-12-11,
	2020-12-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	mlxscore=0 spamscore=0
	impostorscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
	suspectscore=0 clxscore=1011 mlxlogscore=999 priorityscore=1501
	phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1
	engine=8.12.0-2009150000 definitions=main-2012120159
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0BCKONEq010293
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
Content-ID: <C10117BC4C4B904A9C2581A4790316DC@NAMPRD84.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgU3RldmUsCgpUaGFuayB5b3UgZm9yIHlvdXIgcHJvbXB0IHJlc3BvbnNlIGFuZCBmb3IgcG9p
bnRpbmcgdG8gYSBzb2x1dGlvbi4KClllcywgdGhpcyBwYXRjaCBpdCdzIGFwcGxpZWQgdG8gYXVk
aXQgdjIuNC4zLiBJdCdzIGFuIGVtYmVkZGVkIGRldmljZSwgCmFuZCBhdCB0aGUgbW9tZW50LCB3
ZSdyZSB1bmFibGUgdG8gdXBncmFkZSB0aGUgYXVkaXQgdG8gYSBoaWdoZXIgYXVkaXQgCnZlcnNp
b24uCgpJZiBhdWRpdCB2Mi40Lnkgd2VyZSBzdGlsbCBtYWludGFpbmFibGUsIHdvdWxkIHlvdSBh
Y2NlcHQgdGhpcyBwYXRjaCBmb3IgCmF1ZGl0IHYyLjQueT8KCi1KYXZpZXIKCk9uIDEyLzEyLzIw
IDE6NDUgUE0sIFN0ZXZlIEdydWJiIHdyb3RlOgo+IEhlbGxvLAo+IAo+IFRoYW5rcyBmb3IgdGhl
IHBhdGNoLiBCdXQgaWYgaXRzIHRydWUgdGhhdCB0aGlzIGlzIGFnYWluc3QgYXVkaXQtMi40LjMs
IHRoZW4KPiB0aGVyZSBpcyBhIGdvb2QgY2hhbmNlIHRoaXMgaXMgZml4ZWQgYnkgMi44LjUuIFRo
ZXJlIHdlcmUgYSBudW1iZXIgb2YgZml4ZXMgaW4KPiB0aGlzIGFyZWEgdGhhdCBmaXhlZCB2YXJp
b3VzIGlzc3VlcyB3aXRoIHBsdWdpbnMuCj4gCj4gQmVzdCBSZWdhcmRzLAo+IC1TdGV2ZQo+IAo+
IE9uIEZyaWRheSwgRGVjZW1iZXIgMTEsIDIwMjAgOToxMDo1MCBQTSBFU1QgSmF2aWVyIFRpw6Eg
d3JvdGU6Cj4+IE9uIEFSTSAzMi1CaXRzLCBhdWRpc3BkIGlzIGNyYXNoaW5nLiBCYWNrdHJhY2U6
Cj4+Cj4+IChnZGIpIGJ0Cj4+IDAgIDB4YjZlMjA5NTggaW4gX19HSV9yYWlzZSAoc2lnPXNpZ0Bl
bnRyeT02KQo+PiAgICAgYXQgL3Vzci9zcmMvZGVidWcvZ2xpYmMvMi4yMy1yMC9naXQvc3lzZGVw
cy91bml4L3N5c3YvbGludXgvcmFpc2UuYzo1NAo+PiAxICAweGI2ZTIxZTU4IGluIF9fR0lfYWJv
cnQgKCkKPj4gICAgIGF0IC91c3Ivc3JjL2RlYnVnL2dsaWJjLzIuMjMtcjAvZ2l0L3N0ZGxpYi9h
Ym9ydC5jOjExOAo+PiAyICAweGI2ZTU5ZDY0IGluIF9fbGliY19tZXNzYWdlIChkb19hYm9ydD1k
b19hYm9ydEBlbnRyeT0yLAo+PiAgICAgZm10PTB4YjZmMTExOWMgIioqKiBFcnJvciBpbiBgJXMn
OiAlczogMHglcyAqKipcbiIpCj4+ICAgICBhdCAvdXNyL3NyYy9kZWJ1Zy9nbGliYy8yLjIzLXIw
L2dpdC9zeXNkZXBzL3Bvc2l4L2xpYmNfZmF0YWwuYzoxNzUKPj4gMyAgMHhiNmU2MDEwOCBpbiBt
YWxsb2NfcHJpbnRlcnIgKGFjdGlvbj08b3B0aW1pemVkIG91dD4sCj4+ICAgICBzdHI9MHhiNmYx
MTM1NCAiZG91YmxlIGZyZWUgb3IgY29ycnVwdGlvbiAoZmFzdHRvcCkiLCBwdHI9PG9wdGltaXpl
ZAo+PiBvdXQ+LCBhcl9wdHI9PG9wdGltaXplZCBvdXQ+KQo+PiAgICAgYXQgL3Vzci9zcmMvZGVi
dWcvZ2xpYmMvMi4yMy1yMC9naXQvbWFsbG9jL21hbGxvYy5jOjUwMDcKPj4gNCAgMHhiNmU2MGE5
OCBpbiBfaW50X2ZyZWUgKGF2PTB4YjZmMmQ3OWMgPG1haW5fYXJlbmE+LCBwPTxvcHRpbWl6ZWQg
b3V0PiwKPj4gICAgIGhhdmVfbG9jaz08b3B0aW1pemVkIG91dD4pCj4+ICAgICBhdCAvdXNyL3Ny
Yy9kZWJ1Zy9nbGliYy8yLjIzLXIwL2dpdC9tYWxsb2MvbWFsbG9jLmM6Mzg2OAo+PiA1ICAweDAw
NDIzNGI4IGluIGZyZWVfcGNvbmZpZyAoY29uZmlnPTB4NDNiMzk4KQo+PiAgICAgYXQKPj4gL3Vz
ci9zcmMvZGVidWcvYXVkaXQvMi40LjMtcjgvYXVkaXQtMi40LjMvYXVkaXNwL2F1ZGlzcGQtcGNv
bmZpZy5jOjUxMyA2Cj4+IDB4MDA0MjEyNDQgaW4gbWFpbiAoYXJnYz08b3B0aW1pemVkIG91dD4s
IGFyZ3Y9PG9wdGltaXplZCBvdXQ+KSBhdAo+PiAvdXNyL3NyYy9kZWJ1Zy9hdWRpdC8yLjQuMy1y
OC9hdWRpdC0yLjQuMy9hdWRpc3AvYXVkaXNwZC5jOjQ2NAo+Pgo+PiAoZ2RiKSBmIDUKPj4gKGdk
YikgcCBjb25maWctPnBhdGgKPj4gJDIgPSAweDQzYjVmMCAiIgo+PiAoZ2RiKSBwIGNvbmZpZy0+
bmFtZQo+PiAkMyA9IDB4NDNiMzcwICJoXDI2NEMKPj4KPj4gQmUgcGFyYW5vaWQgYW5kIG92ZXJ3
cml0ZSBjb25maWctPnBhdGggd2l0aCB6ZXJvIGJ5dGVzIGJlZm9yZSBkb2luZyB0aGUKPj4gZnJl
ZSgpLgo+PiAtLS0KPj4gICBhdWRpc3AvYXVkaXNwZC1wY29uZmlnLmMgfCA0ICsrKysKPj4gICAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9hdWRpc3Av
YXVkaXNwZC1wY29uZmlnLmMgYi9hdWRpc3AvYXVkaXNwZC1wY29uZmlnLmMKPj4gaW5kZXggYThi
Nzg3OC4uYTEzZjY4MSAxMDA2NDQKPj4gLS0tIGEvYXVkaXNwL2F1ZGlzcGQtcGNvbmZpZy5jCj4+
ICsrKyBiL2F1ZGlzcC9hdWRpc3BkLXBjb25maWcuYwo+PiBAQCAtNTEwLDcgKzUxMCwxMSBAQCB2
b2lkIGZyZWVfcGNvbmZpZyhwbHVnaW5fY29uZl90ICpjb25maWcpCj4+ICAgCQljbG9zZShjb25m
aWctPnBsdWdfcGlwZVswXSk7Cj4+ICAgCWlmIChjb25maWctPnBsdWdfcGlwZVsxXSA+PSAwKQo+
PiAgIAkJY2xvc2UoY29uZmlnLT5wbHVnX3BpcGVbMV0pOwo+PiArCS8qIEJlIHBhcmFub2lkIGFu
ZCBvdmVyd3JpdGUgY29uZmlnLT5wYXRoIHdpdGggemVybyBieXRlcyBiZWZvcmUgZG9pbmcKPj4g
dGhlICsJICogZnJlZSgpICovCj4+ICsJbWVtc2V0KGNvbmZpZy0+cGF0aCwgMCwgc3RybGVuKGNv
bmZpZy0+cGF0aCkpOwo+PiAgIAlmcmVlKCh2b2lkICopY29uZmlnLT5wYXRoKTsKPj4gKwljb25m
aWctPnBhdGggPSBOVUxMOwo+PiAgIAlmcmVlKCh2b2lkICopY29uZmlnLT5uYW1lKTsKPj4gICB9
Cj4gCj4gCj4gCj4gCgotLQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QKTGludXgtYXVkaXRAcmVk
aGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtYXVk
aXQ=

