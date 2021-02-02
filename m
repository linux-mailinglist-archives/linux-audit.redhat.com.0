Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 422A830CE53
	for <lists+linux-audit@lfdr.de>; Tue,  2 Feb 2021 22:57:55 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-N92hlD07OES7Zp9VHGxHww-1; Tue, 02 Feb 2021 16:57:51 -0500
X-MC-Unique: N92hlD07OES7Zp9VHGxHww-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A834192CC44;
	Tue,  2 Feb 2021 21:57:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14E996F139;
	Tue,  2 Feb 2021 21:57:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B8BB918095CD;
	Tue,  2 Feb 2021 21:57:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 112LuPx8018561 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 2 Feb 2021 16:56:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A6D982026D47; Tue,  2 Feb 2021 21:56:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A07AA2026D49
	for <linux-audit@redhat.com>; Tue,  2 Feb 2021 21:56:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 414AF101A53F
	for <linux-audit@redhat.com>; Tue,  2 Feb 2021 21:56:23 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com
	[173.37.142.91]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-60-iBMJ8MboPqmcnw9g_o-zfA-1; Tue, 02 Feb 2021 16:56:20 -0500
X-MC-Unique: iBMJ8MboPqmcnw9g_o-zfA-1
X-IPAS-Result: =?us-ascii?q?A0DlAQCHyRlgmIcNJK1iHAEBAQEBAQcBARIBAQQEAQGCD?=
	=?us-ascii?q?4FTUYFXMjGEQINIA44KA5QmhHOCUwNUCwEBAQ0BAS0CBAEBhEoCF4FlAiU4E?=
	=?us-ascii?q?wIDAQEBAwIDAQEBAQUBAQECAQYEFAEBAQEBAQEBhjYNhXMBAQEDASMdAQE3A?=
	=?us-ascii?q?QQLAgEIFSoDAgICMBQRAgQBDQUZgw2Bf1cDDiABpTECiiV2gTKDBQEBBoURG?=
	=?us-ascii?q?IISCRSBJIJ3hAUBhkImG4IAgiWCBT6EVYMCgmCCS4EPS4EsNjcsD48+gwNAh?=
	=?us-ascii?q?zuDO4kHkUUKgnicAiKjHJQvoW4CBAIEBQIOAQEGgW0hgVlwFYMkUBcCDY4hD?=
	=?us-ascii?q?A4Jg06KWHQ3AgYKAQEDCXyLGQEB?=
IronPort-PHdr: =?us-ascii?q?9a23=3AqjHWlhQalHRpeMW5ri46aJzaZ9psv++ubAcI9p?=
	=?us-ascii?q?oqja5Pea2//pPkeVbS/uhpkESQB9mJ8/tZj6/TtKf6VCoL5pPS+HwBcZkZUR?=
	=?us-ascii?q?gDhI1WmgE7G8eKBAX9K+KidC01GslOFToHt3G2OERYAoDyMlvVpHDh9TcPHl?=
	=?us-ascii?q?D6Mg1vK6L+HYuBx8iy3vq5rpvUZQgAjTGhYLR0eROxqwiZtsQfjYZ4bKgrzR?=
	=?us-ascii?q?6cqXpTcOMQzmRtdl8=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.79,396,1602547200"; 
	d="scan'208,217";a="639861965"
Received: from alln-core-2.cisco.com ([173.36.13.135])
	by alln-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
	02 Feb 2021 21:55:16 +0000
Received: from XCH-RCD-004.cisco.com (xch-rcd-004.cisco.com [173.37.102.14])
	by alln-core-2.cisco.com (8.15.2/8.15.2) with ESMTPS id 112LtFfM004699
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 2 Feb 2021 21:55:16 GMT
Received: from xhs-rcd-002.cisco.com (173.37.227.247) by XCH-RCD-004.cisco.com
	(173.37.102.14) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Tue, 2 Feb 2021 15:55:15 -0600
Received: from xhs-rtp-003.cisco.com (64.101.210.230) by xhs-rcd-002.cisco.com
	(173.37.227.247) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Tue, 2 Feb 2021 15:55:15 -0600
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (64.101.32.56) by
	xhs-rtp-003.cisco.com (64.101.210.230) with Microsoft SMTP Server
	(TLS) id
	15.0.1497.2 via Frontend Transport; Tue, 2 Feb 2021 16:55:14 -0500
Received: from BYAPR11MB2744.namprd11.prod.outlook.com (2603:10b6:a02:c8::10)
	by BY5PR11MB3880.namprd11.prod.outlook.com (2603:10b6:a03:184::16)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17;
	Tue, 2 Feb 2021 21:55:12 +0000
Received: from BYAPR11MB2744.namprd11.prod.outlook.com
	([fe80::1831:4b15:d094:806]) by BYAPR11MB2744.namprd11.prod.outlook.com
	([fe80::1831:4b15:d094:806%7]) with mapi id 15.20.3805.024;
	Tue, 2 Feb 2021 21:55:12 +0000
From: "Phil Zhang (xuanyzha)" <xuanyzha@cisco.com>
To: "paul@paul-moore.com" <paul@paul-moore.com>, "Daniel Walker (danielwa)"
	<danielwa@cisco.com>
Subject: Re: [PATCH 2/2] audit: show (grand)parents information of an audit
	context
Thread-Topic: [PATCH 2/2] audit: show (grand)parents information of an audit
	context
Thread-Index: AQHW+aqHV28JclAf1k2Lsv3wiLeyMKpFZeuAgAAC6QA=
Date: Tue, 2 Feb 2021 21:55:12 +0000
Message-ID: <6c8ba313f01ad7205176b33bb35e066e21c85936.camel@cisco.com>
References: <20210202212930.18845-2-danielwa@cisco.com>
	<CAHC9VhTo_aTTsS5W-+AJe+RrNG4yL3_TbfOKZhZfpjg0QkkZUQ@mail.gmail.com>
In-Reply-To: <CAHC9VhTo_aTTsS5W-+AJe+RrNG4yL3_TbfOKZhZfpjg0QkkZUQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.4-0ubuntu1
x-originating-ip: [2001:420:c0c8:1006::87f]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a8206175-70cf-4910-23b5-08d8c7c537aa
x-ms-traffictypediagnostic: BY5PR11MB3880:
x-ld-processed: 5ae1af62-9505-4097-a69a-c1553ef7840e,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB38805F7E891952DAA1E3F9FBC8B59@BY5PR11MB3880.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: bxOsCiogwCROwe/gJdmqIuCqVhUbI5tgkBIPjhPWH02auOL68+q9M9loZFJRJYN4TkTLnKCms4mWqw69HWIEEPtPXEb0tRB9mY4wTs01OGt1oMumIQyEFP/jzbHQvjJxvARg72IuYU1PorZ0wnjrL6wWtgpSMSjyIsAmHS4DYsKJ70+9UDihTwlPX4ceG7rw2TVs35iEBtaU/jToc9sCpKjXBbbK7J52WsrkltRW4fLqP86l0sw65JNvek4s5mTh6aQ5EguU/zvGJuQh7pk/vcz2dle2QTx1JkTAIzRDW7GIUgnqkOzTx3sm4KUVrMrCh4WByJO9BVlLkptuFn7bNncs2tfdDk8j1SslYqTAS6TyJNg103anJYCer886v7PbMLoTkvIoyMvOYK/svqxAxbBoVkDUcwIAJ2pDzEQcayOBGwZI9GWgjoOWZlkYZ3lopm01wJnNNuXpD2KC4eT3KObTaf/mWbe5qrpZrcIw2Z+bD0vyhQiAAHv4Rqk9G1S3KHgUf3voP7XL1JPgjFbFEg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BYAPR11MB2744.namprd11.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(376002)(39860400002)(346002)(136003)(366004)(396003)(86362001)(4326008)(5660300002)(8936002)(36756003)(2906002)(64756008)(6512007)(8676002)(478600001)(66946007)(76116006)(316002)(53546011)(83380400001)(6636002)(6486002)(66476007)(110136005)(54906003)(107886003)(186003)(66446008)(6506007)(2616005)(66556008)(71200400001);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata: =?utf-8?B?cnZuUWpYZ2d5YTkvbXRtTXpqbDN1WjNZNnNTSzFtQzNPM2hROHZMVzRDalJG?=
	=?utf-8?B?KzN1cUliQlFmU2NxM3FlaXE0YWNWRkhJbWVoRlZSSWhCUFMxSGM4WmRhWW0v?=
	=?utf-8?B?WW9jbEZzZHBCK3Q5TndUQkhCMFU0Q3FRVWw4V09nbEJKZ1oxWCsrMUJNR1VH?=
	=?utf-8?B?eU9jV0ljd3doWGU4eHpva2NYRHpaVUJxV2kxS3BpSGF6UmJNalBmVDRJQmR4?=
	=?utf-8?B?R3lyL3lJeHFCK3I2WnFSb09Mb1BwUmUwVlVkYTVjRlM0NmNReHZxY2F5NnhG?=
	=?utf-8?B?S0RRczJRc0Z5OXhyVWlnczJHNW9ybWhzMnJtZzFlVTVBUWVDUzcySGJMZlF1?=
	=?utf-8?B?NHVGSXRTZkJXQ0Z1dUlyVmRpdjhGSVIrT0doOHVPcTc2N3MxSTJJZzJ5RDJG?=
	=?utf-8?B?c3pXT1gyTDJkOFdBYlM4R3BOdjRzZnNSMWEyQ3FlTUliTG5wakpZL1p2WEs5?=
	=?utf-8?B?R29yemVOQUhXclE5bDNJa2VoV2tjN29ybDVpQTFCMEpOOGxtR0hDQUt6a2kr?=
	=?utf-8?B?RktlS25PYVh0QW4veE5zZFhJcG8xeVd5TXRvR1lLUDh0bS93N2N1OHNLb05l?=
	=?utf-8?B?QjNUbFF3dTUzZkVYWDJiU2gzWlNIU0xWLzM5a3RXVjhZYitmbUswNmRpN1dU?=
	=?utf-8?B?MThVb1gyZUE3N3NTSTQ0NnpId3l0NDdkNW5xQmQvRUZUTEZ6eWhtUWNFTnh1?=
	=?utf-8?B?ZFhzUUNRRGxLdTBxTTJrNlMwTnM1N3BYS0pnQmNpbHptaklrUUR5TVdwbkg1?=
	=?utf-8?B?NUN3WTQ5TVdBenE3bkpiWE4rWUJTdVVWM0JwZEp2cmFXQlA0NjdoZVJKOUFs?=
	=?utf-8?B?Tko4aXhoUmZOS2pqVFhwbzVNTXJNSXJWSUs0Ym1OWUszSzN1aEhZSUlTSHNo?=
	=?utf-8?B?RjhBTnpRRWN6bWVnVFdRZ0I0MGVhaHo2R3JvUWF6R3M4c1pMdDV3Rmp0eEJC?=
	=?utf-8?B?UzJjZ3BoRDRXVEhMM2YzK0dOV1VNMDhvUUdQSlhpM2t3ZzNpTE85b0JNMGN3?=
	=?utf-8?B?Mjk0VWVzOEtqTVNYV0NqYTdKRWVieWVVSUVodmVWdlE3Z3U3TmRqUk1nVDFQ?=
	=?utf-8?B?QmZwK25IVVhveWxSYTJWN1oyeVRBS0JUZUFMRGZaN09jUnY0OGYyWC9RWUR4?=
	=?utf-8?B?ajN5VU5mUTkrQjRtVG5rN2Y5QmM1ME8rUTZGQllEUVpqcjIxTVNlNzBoMHJ5?=
	=?utf-8?B?NlU4KzJmQUNGWjdnSm5CZWsxaVZTa2I1L3Fpa1BTSUV4OUtIK1JXR0NDekZC?=
	=?utf-8?B?UFVZQVhMZUJoSDBpRTNYTSt2WlBzaUZveVh2b1RveWlwREU2QWRlY3ZXay8v?=
	=?utf-8?B?cmZBMlUwaVcwa1M5U2NhR3lnMXhuVytPWGNEY08wR3YxWHlIMkFBSHBKVDZT?=
	=?utf-8?B?OXFQZzFWemk2WHNsaUtVWU5vY1NlYjlXUkZXelhaRk1vWkIwdEEzVWpTTm11?=
	=?utf-8?B?d3FvSDN5V2NJdy9JUjRDSFl0Mjl2TE1MZEtYNEFkWWRFREJPYjNzNnU3b1dR?=
	=?utf-8?B?akQvUHlqR2pVMlZrSGlaenNEMC9MVEU1eUpDaFpHbkZOd3IzSmZzWjV1blo5?=
	=?utf-8?B?TnlweldaanJLVU5xNzF6bEFHUlRsS1Y1WlY2dlFMbW82d0toRk05bCtWNkw4?=
	=?utf-8?B?Q1pwLzE2TWg3NDdKb3dHRUtWWGl4WHEzRTl5enkvYytiRmFwRFJBMXpKa3Vm?=
	=?utf-8?B?M0RET25MU0hYejk5Mi91ZUgxVitrRlVGeHVqdGJyZXoyOERGdEJFcHYrdXQv?=
	=?utf-8?B?c0pMaFR5a3M1UlJVY1ZsZ3ZvTjB2dlJEOStXNkM0eEtiemNHV0NhNEFYNVZB?=
	=?utf-8?Q?krlQeAMVxoyVGgkWgXGag0ulssQj+G2T4nFtk=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2744.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8206175-70cf-4910-23b5-08d8c7c537aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2021 21:55:12.8247 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D8hxBQno0Y35XzpukMmIXU4AHIiXB0al8DaKPRkvojC689c5r51LFdeGXxCUj/nMz0dFPPBCaCaqDfjwecBE3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3880
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.14, xch-rcd-004.cisco.com
X-Outbound-Node: alln-core-2.cisco.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 02 Feb 2021 16:57:02 -0500
Cc: "polaris-selinux-dev\(mailer list\)" <polaris-selinux-dev@cisco.com>,
	"linux-audit@redhat.com" <linux-audit@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"xe-linux-external\(mailer list\)" <xe-linux-external@cisco.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: multipart/mixed; boundary="===============4114980424324010469=="

--===============4114980424324010469==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_6c8ba313f01ad7205176b33bb35e066e21c85936camelciscocom_"

--_000_6c8ba313f01ad7205176b33bb35e066e21c85936camelciscocom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

RGFuaWVsLA0KDQpBcyBmYXIgYXMgSSBrbm93IFZpY3RvciBkaWQgbm90IGF0dGVtcHQgdG8gdXBz
dHJlYW0gaGlzIFVCQUNLVFJBQ0UgZmVhdHVyZSBmb3IgYXVkaXQuDQpGb2xsb3dpbmcgUGF1bCdz
IHBvaW50LCBtYXliZSB0aGlzIGlzIG9ubHkgdXNlZnVsIGluIG91ciBpbnRlcm5hbCB1c2UuICBU
cmFjaW5nIGZvcmsvZXhlYw0KaW4gdXNlcmxhbmQoYXVkaXRjdGwpIGhhcyBiZWVuIHRoZSB3YXkg
d2UgYXJlIGRvaW5nIGl0LiBidXQgd2UgY2Fubm90IGFmZm9yZCB0byBydW4gaXQgaW4NCnJlZ3Jl
c3Npb24gdGVzdHMgYW5kIHZhbHVlYWJsZSBpbmZvcm1hdGlvbiB3YXMgdGh1cyBub3QgY2FwdHVy
ZWQgYW5kICBpdCdzIGRpZmZpY3VsdCBmb3INCmZvbGtzIHRvIHJlcHJvZHVjZSB0aGUgaXNzdWUu
DQoNClBoaWwNCg0KDQpPbiBUdWUsIDIwMjEtMDItMDIgYXQgMTY6NDQgLTA1MDAsIFBhdWwgTW9v
cmUgd3JvdGU6DQoNCk9uIFR1ZSwgRmViIDIsIDIwMjEgYXQgNDoyOSBQTSBEYW5pZWwgV2Fsa2Vy
IDwNCg0KPG1haWx0bzpkYW5pZWx3YUBjaXNjby5jb20+DQoNCmRhbmllbHdhQGNpc2NvLmNvbQ0K
DQo+IHdyb3RlOg0KDQpGcm9tOiBQaGlsIFpoYW5nIDwNCg0KPG1haWx0bzp4dWFueXpoYUBjaXNj
by5jb20+DQoNCnh1YW55emhhQGNpc2NvLmNvbQ0KDQo+DQoNCg0KVG8gZWFzZSB0aGUgcm9vdCBj
YXVzZSBhbmFseXNpcyBvZiBTRUxpbnV4IEFWQ3MsIHRoaXMgbmV3IGZlYXR1cmUNCg0KdHJhdmVy
c2VzIHRhc2sgc3RydWN0cyB0byBpdGVyYXRpdmVseSBmaW5kIGFsbCBwYXJlbnQgcHJvY2Vzc2Vz
DQoNCnN0YXJ0aW5nIHdpdGggdGhlIGRlbmllZCBwcm9jZXNzIGFuZCBlbmRpbmcgYXQgdGhlIGtl
cm5lbC4gTWVhbndoaWxlLA0KDQppdCBwcmludHMgb3V0IHRoZSBjb21tYW5kIGxpbmVzIGFuZCBz
dWJqZWN0IGNvbnRleHRzIG9mIHRob3NlIHBhcmVudHMuDQoNCg0KVGhpcyBwcm92aWRlcyBkZXZl
bG9wZXJzIGEgY2xlYXIgdmlldyBvZiBob3cgcHJvY2Vzc2VzIHdlcmUgc3Bhd25lZA0KDQphbmQg
d2hlcmUgdHJhbnNpdGlvbnMgaGFwcGVuZWQsIHdpdGhvdXQgdGhlIG5lZWQgdG8gcmVwcm9kdWNl
IHRoZQ0KDQppc3N1ZSBhbmQgbWFudWFsbHkgYXVkaXQgaW50ZXJlc3RpbmcgZXZlbnRzLg0KDQoN
CkV4YW1wbGUgb24gYmFzaCBvdmVyIHNzaDoNCg0KICAgICQgcnVuY29uIC11IHN5c3RlbV91IC1y
IHN5c3RlbV9yIC10IHBvbGFyaXNfaG1fdCBscw0KDQogICAgLi4uDQoNCiAgICB0eXBlPVBBUkVO
VCBtc2c9YXVkaXQoMTYxMDU0ODI0MS4wMzM6MjU1KTogc3Viaj1yb290OnVuY29uZmluZWRfcjp1
bmNvbmZpbmVkX3Q6czAtczA6YzAuYzEwMjMgIGNtZGxpbmU9Ii1iYXNoIg0KDQogICAgdHlwZT1Q
QVJFTlQgbXNnPWF1ZGl0KDE2MTA1NDgyNDEuMDMzOjI1NSk6IHN1Ymo9c3lzdGVtX3U6c3lzdGVt
X3I6c3NoZF90OnMwLXMwOmMwLmMxMDIzICAgICAgICBjbWRsaW5lPSJzc2hkOiByb290QHB0cy8w
Ig0KDQogICAgdHlwZT1QQVJFTlQgbXNnPWF1ZGl0KDE2MTA1NDgyNDEuMDMzOjI1NSk6IHN1Ymo9
c3lzdGVtX3U6c3lzdGVtX3I6c3NoZF90OnMwLXMwOmMwLmMxMDIzICAgICAgICBjbWRsaW5lPSIv
dG1wL3N3L3JwLzAvMC9ycF9zZWN1cml0eS9tb3VudC91c3Ivc2Jpbi9zc2hkDQoNCiAgICB0eXBl
PVBBUkVOVCBtc2c9YXVkaXQoMTYxMDU0ODI0MS4wMzM6MjU1KTogc3Viaj1zeXN0ZW1fdTpzeXN0
ZW1fcjppbml0X3Q6czAgICAgICAgICAgICAgICAgICAgIGNtZGxpbmU9Ii9pbml0Ig0KDQogICAg
dHlwZT1QQVJFTlQgbXNnPWF1ZGl0KDE2MTA1NDgyNDEuMDMzOjI1NSk6IHN1Ymo9c3lzdGVtX3U6
c3lzdGVtX3I6a2VybmVsX3Q6czANCg0KICAgIC4uLg0KDQoNCkNjOg0KDQo8bWFpbHRvOnhlLWxp
bnV4LWV4dGVybmFsQGNpc2NvLmNvbT4NCg0KeGUtbGludXgtZXh0ZXJuYWxAY2lzY28uY29tDQoN
Cg0KU2lnbmVkLW9mZi1ieTogUGhpbCBaaGFuZyA8DQoNCjxtYWlsdG86eHVhbnl6aGFAY2lzY28u
Y29tPg0KDQp4dWFueXpoYUBjaXNjby5jb20NCg0KPg0KDQpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwg
V2Fsa2VyIDwNCg0KPG1haWx0bzpkYW5pZWx3YUBjaXNjby5jb20+DQoNCmRhbmllbHdhQGNpc2Nv
LmNvbQ0KDQo+DQoNCi0tLQ0KDQogaW5jbHVkZS91YXBpL2xpbnV4L2F1ZGl0LmggfCAgNSArKy0N
Cg0KIGluaXQvS2NvbmZpZyAgICAgICAgICAgICAgIHwgIDcgKysrKysNCg0KIGtlcm5lbC9hdWRp
dC5jICAgICAgICAgICAgIHwgIDMgKy0NCg0KIGtlcm5lbC9hdWRpdHNjLmMgICAgICAgICAgIHwg
NjQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCg0KIDQgZmlsZXMgY2hh
bmdlZCwgNzcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCg0KDQpUaGlzIGlzIGp1c3Qg
Zm9yIGRldmVsb3BtZW50L3Rlc3Rpbmcgb2YgU0VMaW51eCBwb2xpY3ksIHJpZ2h0PyAgSXQNCg0K
c2VlbXMgbGlrZSB0aGlzIGlzIGJldHRlciBkb25lIGluIHVzZXJzcGFjZSB0byBtZSB0aHJvdWdo
IGENCg0KY29tYmluYXRpb24gb2YgcG9saWN5IGFuYWx5c2lzIGFuZCBqdXN0IHVuZGVyc3RhbmRp
bmcgb2YgaG93IHlvdXINCg0Kc3lzdGVtIGlzIHB1dCB0b2dldGhlci4NCg0KDQpJZiB5b3UgcmVh
bGx5IG5lZWQgdGhpcyBpbmZvcm1hdGlvbiBpbiB0aGUgYXVkaXQgbG9nIGZvciBzb21lDQoNCnBy
b2R1Y3Rpb24gdXNlLCBpdCBzZWVtcyBsaWtlIHlvdSBjb3VsZCBhdWRpdCB0aGUgdmFyaW91cw0K
DQpmb3JrKCkvZXhlYygpIHN5c2NhbGxzIHRvIGdldCBhbiB1bmRlcnN0YW5kaW5nIG9mIHRoZSB2
YXJpb3VzIHByb2Nlc3MNCg0KKHN1Yil0cmVlcyBvbiB0aGUgc3lzdGVtLiAgSXQgd291bGQgcmVx
dWlyZSBhIGJpdCBvZiB3b3JrIHRvIHNpZnQNCg0KdGhyb3VnaCB0aGUgYXVkaXQgbG9nIGFuZCBy
ZWNvbnN0cnVjdCB0aGUgZXZlbnRzIHRoYXQgbGVkIHRvIGEgcHJvY2Vzcw0KDQpiZWluZyBzdGFy
dGVkLCBhbmQgZ2VuZXJhdGluZyB0aGUgQVZDIHlvdSBhcmUgaW50ZXJlc3RlZCBpbiBkZWJ1Z2dp
bmcsDQoNCmJ1dCBmb2xrcyB3aG8gbGl2ZSBUaGUgQXVkaXQgTGlmZSBzdXBwb3NlZGx5IGRvIHRo
aXMgc29ydCBvZiB0aGluZyBhDQoNCmxvdCAodGhpcyBzb3J0IG9mIHRoaW5nIGJlaW5nIHRyYWNp
bmcgYSBwcm9jZXNzL3Nlc3Npb24pLg0KDQo=
--_000_6c8ba313f01ad7205176b33bb35e066e21c85936camelciscocom_
Content-Type: text/html; charset="utf-8"
Content-ID: <4FB170AB69A98245B76F6FBB8EF0DEBA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgZGlyPSJsdHIiPg0KPGhlYWQ+DQo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUi
IGNvbnRlbnQ9InRleHQvaHRtbDsgY2hhcnNldD11dGYtOCI+DQo8L2hlYWQ+DQo8Ym9keSBzdHls
ZT0idGV4dC1hbGlnbjpsZWZ0OyBkaXJlY3Rpb246bHRyOyI+DQo8ZGl2PkRhbmllbCw8L2Rpdj4N
CjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2PkFzIGZhciBhcyBJIGtub3cgVmljdG9yIGRpZCBub3Qg
YXR0ZW1wdCB0byB1cHN0cmVhbSBoaXMgVUJBQ0tUUkFDRSBmZWF0dXJlIGZvciBhdWRpdC48L2Rp
dj4NCjxkaXY+Rm9sbG93aW5nIFBhdWwncyBwb2ludCwgbWF5YmUgdGhpcyBpcyBvbmx5IHVzZWZ1
bCBpbiBvdXIgaW50ZXJuYWwgdXNlLiAmbmJzcDtUcmFjaW5nIGZvcmsvZXhlYyZuYnNwOzwvZGl2
Pg0KPGRpdj5pbiB1c2VybGFuZChhdWRpdGN0bCkgaGFzIGJlZW4gdGhlIHdheSB3ZSBhcmUgZG9p
bmcgaXQuIGJ1dCB3ZSBjYW5ub3QgYWZmb3JkIHRvIHJ1biBpdCBpbiZuYnNwOzwvZGl2Pg0KPGRp
dj5yZWdyZXNzaW9uIHRlc3RzIGFuZCB2YWx1ZWFibGUgaW5mb3JtYXRpb24gd2FzIHRodXMgbm90
IGNhcHR1cmVkIGFuZCAmbmJzcDtpdCdzIGRpZmZpY3VsdCBmb3ImbmJzcDs8L2Rpdj4NCjxkaXY+
Zm9sa3MgdG8gcmVwcm9kdWNlIHRoZSBpc3N1ZS48L2Rpdj4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8
ZGl2PlBoaWw8L2Rpdj4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2Pjxicj4NCjwvZGl2Pg0KPGRp
dj5PbiBUdWUsIDIwMjEtMDItMDIgYXQgMTY6NDQgLTA1MDAsIFBhdWwgTW9vcmUgd3JvdGU6PC9k
aXY+DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7IGJv
cmRlci1sZWZ0OjJweCAjNzI5ZmNmIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPg0KPHByZT5PbiBU
dWUsIEZlYiAyLCAyMDIxIGF0IDQ6MjkgUE0gRGFuaWVsIFdhbGtlciAmbHQ7PC9wcmU+DQo8YSBo
cmVmPSJtYWlsdG86ZGFuaWVsd2FAY2lzY28uY29tIj4NCjxwcmU+ZGFuaWVsd2FAY2lzY28uY29t
PC9wcmU+DQo8L2E+DQo8cHJlPiZndDsgd3JvdGU6PC9wcmU+DQo8YmxvY2txdW90ZSB0eXBlPSJj
aXRlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7IGJvcmRlci1sZWZ0OjJweCAjNzI5ZmNmIHNv
bGlkO3BhZGRpbmctbGVmdDoxZXgiPg0KPHByZT5Gcm9tOiBQaGlsIFpoYW5nICZsdDs8L3ByZT4N
CjxhIGhyZWY9Im1haWx0bzp4dWFueXpoYUBjaXNjby5jb20iPg0KPHByZT54dWFueXpoYUBjaXNj
by5jb208L3ByZT4NCjwvYT4NCjxwcmU+Jmd0OzwvcHJlPg0KPHByZT48YnI+PC9wcmU+DQo8cHJl
PlRvIGVhc2UgdGhlIHJvb3QgY2F1c2UgYW5hbHlzaXMgb2YgU0VMaW51eCBBVkNzLCB0aGlzIG5l
dyBmZWF0dXJlPC9wcmU+DQo8cHJlPnRyYXZlcnNlcyB0YXNrIHN0cnVjdHMgdG8gaXRlcmF0aXZl
bHkgZmluZCBhbGwgcGFyZW50IHByb2Nlc3NlczwvcHJlPg0KPHByZT5zdGFydGluZyB3aXRoIHRo
ZSBkZW5pZWQgcHJvY2VzcyBhbmQgZW5kaW5nIGF0IHRoZSBrZXJuZWwuIE1lYW53aGlsZSw8L3By
ZT4NCjxwcmU+aXQgcHJpbnRzIG91dCB0aGUgY29tbWFuZCBsaW5lcyBhbmQgc3ViamVjdCBjb250
ZXh0cyBvZiB0aG9zZSBwYXJlbnRzLjwvcHJlPg0KPHByZT48YnI+PC9wcmU+DQo8cHJlPlRoaXMg
cHJvdmlkZXMgZGV2ZWxvcGVycyBhIGNsZWFyIHZpZXcgb2YgaG93IHByb2Nlc3NlcyB3ZXJlIHNw
YXduZWQ8L3ByZT4NCjxwcmU+YW5kIHdoZXJlIHRyYW5zaXRpb25zIGhhcHBlbmVkLCB3aXRob3V0
IHRoZSBuZWVkIHRvIHJlcHJvZHVjZSB0aGU8L3ByZT4NCjxwcmU+aXNzdWUgYW5kIG1hbnVhbGx5
IGF1ZGl0IGludGVyZXN0aW5nIGV2ZW50cy48L3ByZT4NCjxwcmU+PGJyPjwvcHJlPg0KPHByZT5F
eGFtcGxlIG9uIGJhc2ggb3ZlciBzc2g6PC9wcmU+DQo8cHJlPiAgICAkIHJ1bmNvbiAtdSBzeXN0
ZW1fdSAtciBzeXN0ZW1fciAtdCBwb2xhcmlzX2htX3QgbHM8L3ByZT4NCjxwcmU+ICAgIC4uLjwv
cHJlPg0KPHByZT4gICAgdHlwZT1QQVJFTlQgbXNnPWF1ZGl0KDE2MTA1NDgyNDEuMDMzOjI1NSk6
IHN1Ymo9cm9vdDp1bmNvbmZpbmVkX3I6dW5jb25maW5lZF90OnMwLXMwOmMwLmMxMDIzICBjbWRs
aW5lPSZxdW90Oy1iYXNoJnF1b3Q7PC9wcmU+DQo8cHJlPiAgICB0eXBlPVBBUkVOVCBtc2c9YXVk
aXQoMTYxMDU0ODI0MS4wMzM6MjU1KTogc3Viaj1zeXN0ZW1fdTpzeXN0ZW1fcjpzc2hkX3Q6czAt
czA6YzAuYzEwMjMgICAgICAgIGNtZGxpbmU9JnF1b3Q7c3NoZDogcm9vdEBwdHMvMCZxdW90Ozwv
cHJlPg0KPHByZT4gICAgdHlwZT1QQVJFTlQgbXNnPWF1ZGl0KDE2MTA1NDgyNDEuMDMzOjI1NSk6
IHN1Ymo9c3lzdGVtX3U6c3lzdGVtX3I6c3NoZF90OnMwLXMwOmMwLmMxMDIzICAgICAgICBjbWRs
aW5lPSZxdW90Oy90bXAvc3cvcnAvMC8wL3JwX3NlY3VyaXR5L21vdW50L3Vzci9zYmluL3NzaGQ8
L3ByZT4NCjxwcmU+ICAgIHR5cGU9UEFSRU5UIG1zZz1hdWRpdCgxNjEwNTQ4MjQxLjAzMzoyNTUp
OiBzdWJqPXN5c3RlbV91OnN5c3RlbV9yOmluaXRfdDpzMCAgICAgICAgICAgICAgICAgICAgY21k
bGluZT0mcXVvdDsvaW5pdCZxdW90OzwvcHJlPg0KPHByZT4gICAgdHlwZT1QQVJFTlQgbXNnPWF1
ZGl0KDE2MTA1NDgyNDEuMDMzOjI1NSk6IHN1Ymo9c3lzdGVtX3U6c3lzdGVtX3I6a2VybmVsX3Q6
czA8L3ByZT4NCjxwcmU+ICAgIC4uLjwvcHJlPg0KPHByZT48YnI+PC9wcmU+DQo8cHJlPkNjOiA8
L3ByZT4NCjxhIGhyZWY9Im1haWx0bzp4ZS1saW51eC1leHRlcm5hbEBjaXNjby5jb20iPg0KPHBy
ZT54ZS1saW51eC1leHRlcm5hbEBjaXNjby5jb208L3ByZT4NCjwvYT4NCjxwcmU+PGJyPjwvcHJl
Pg0KPHByZT5TaWduZWQtb2ZmLWJ5OiBQaGlsIFpoYW5nICZsdDs8L3ByZT4NCjxhIGhyZWY9Im1h
aWx0bzp4dWFueXpoYUBjaXNjby5jb20iPg0KPHByZT54dWFueXpoYUBjaXNjby5jb208L3ByZT4N
CjwvYT4NCjxwcmU+Jmd0OzwvcHJlPg0KPHByZT5TaWduZWQtb2ZmLWJ5OiBEYW5pZWwgV2Fsa2Vy
ICZsdDs8L3ByZT4NCjxhIGhyZWY9Im1haWx0bzpkYW5pZWx3YUBjaXNjby5jb20iPg0KPHByZT5k
YW5pZWx3YUBjaXNjby5jb208L3ByZT4NCjwvYT4NCjxwcmU+Jmd0OzwvcHJlPg0KPHByZT4tLS08
L3ByZT4NCjxwcmU+IGluY2x1ZGUvdWFwaS9saW51eC9hdWRpdC5oIHwgIDUgKystPC9wcmU+DQo8
cHJlPiBpbml0L0tjb25maWcgICAgICAgICAgICAgICB8ICA3ICsrKysrPC9wcmU+DQo8cHJlPiBr
ZXJuZWwvYXVkaXQuYyAgICAgICAgICAgICB8ICAzICstPC9wcmU+DQo8cHJlPiBrZXJuZWwvYXVk
aXRzYy5jICAgICAgICAgICB8IDY0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrPC9wcmU+DQo8cHJlPiA0IGZpbGVzIGNoYW5nZWQsIDc3IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pPC9wcmU+DQo8L2Jsb2NrcXVvdGU+DQo8cHJlPjxicj48L3ByZT4NCjxwcmU+VGhp
cyBpcyBqdXN0IGZvciBkZXZlbG9wbWVudC90ZXN0aW5nIG9mIFNFTGludXggcG9saWN5LCByaWdo
dD8gIEl0PC9wcmU+DQo8cHJlPnNlZW1zIGxpa2UgdGhpcyBpcyBiZXR0ZXIgZG9uZSBpbiB1c2Vy
c3BhY2UgdG8gbWUgdGhyb3VnaCBhPC9wcmU+DQo8cHJlPmNvbWJpbmF0aW9uIG9mIHBvbGljeSBh
bmFseXNpcyBhbmQganVzdCB1bmRlcnN0YW5kaW5nIG9mIGhvdyB5b3VyPC9wcmU+DQo8cHJlPnN5
c3RlbSBpcyBwdXQgdG9nZXRoZXIuPC9wcmU+DQo8cHJlPjxicj48L3ByZT4NCjxwcmU+SWYgeW91
IHJlYWxseSBuZWVkIHRoaXMgaW5mb3JtYXRpb24gaW4gdGhlIGF1ZGl0IGxvZyBmb3Igc29tZTwv
cHJlPg0KPHByZT5wcm9kdWN0aW9uIHVzZSwgaXQgc2VlbXMgbGlrZSB5b3UgY291bGQgYXVkaXQg
dGhlIHZhcmlvdXM8L3ByZT4NCjxwcmU+Zm9yaygpL2V4ZWMoKSBzeXNjYWxscyB0byBnZXQgYW4g
dW5kZXJzdGFuZGluZyBvZiB0aGUgdmFyaW91cyBwcm9jZXNzPC9wcmU+DQo8cHJlPihzdWIpdHJl
ZXMgb24gdGhlIHN5c3RlbS4gIEl0IHdvdWxkIHJlcXVpcmUgYSBiaXQgb2Ygd29yayB0byBzaWZ0
PC9wcmU+DQo8cHJlPnRocm91Z2ggdGhlIGF1ZGl0IGxvZyBhbmQgcmVjb25zdHJ1Y3QgdGhlIGV2
ZW50cyB0aGF0IGxlZCB0byBhIHByb2Nlc3M8L3ByZT4NCjxwcmU+YmVpbmcgc3RhcnRlZCwgYW5k
IGdlbmVyYXRpbmcgdGhlIEFWQyB5b3UgYXJlIGludGVyZXN0ZWQgaW4gZGVidWdnaW5nLDwvcHJl
Pg0KPHByZT5idXQgZm9sa3Mgd2hvIGxpdmUgVGhlIEF1ZGl0IExpZmUgc3VwcG9zZWRseSBkbyB0
aGlzIHNvcnQgb2YgdGhpbmcgYTwvcHJlPg0KPHByZT5sb3QgKHRoaXMgc29ydCBvZiB0aGluZyBi
ZWluZyB0cmFjaW5nIGEgcHJvY2Vzcy9zZXNzaW9uKS48L3ByZT4NCjxwcmU+PGJyPjwvcHJlPg0K
PC9ibG9ja3F1b3RlPg0KPC9ib2R5Pg0KPC9odG1sPg0K
--_000_6c8ba313f01ad7205176b33bb35e066e21c85936camelciscocom_--

--===============4114980424324010469==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============4114980424324010469==--

