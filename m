Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7AA3E2DC277
	for <lists+linux-audit@lfdr.de>; Wed, 16 Dec 2020 15:52:33 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-G7YGhz85MZmKUgbeavo2Iw-1; Wed, 16 Dec 2020 09:52:29 -0500
X-MC-Unique: G7YGhz85MZmKUgbeavo2Iw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD0CD190B2A1;
	Wed, 16 Dec 2020 14:52:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 784B45D71B;
	Wed, 16 Dec 2020 14:52:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2DA3D180954D;
	Wed, 16 Dec 2020 14:52:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BGEf6VV026168 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 16 Dec 2020 09:41:06 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 88680B27B4; Wed, 16 Dec 2020 14:41:06 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 81CD1B3035
	for <linux-audit@redhat.com>; Wed, 16 Dec 2020 14:41:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28D91101A564
	for <linux-audit@redhat.com>; Wed, 16 Dec 2020 14:41:04 +0000 (UTC)
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com
	[148.163.147.86]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-571-Ua4uW1QUOja8vVzOrX-zpw-1; Wed, 16 Dec 2020 09:40:59 -0500
X-MC-Unique: Ua4uW1QUOja8vVzOrX-zpw-1
Received: from pps.filterd (m0148663.ppops.net [127.0.0.1])
	by mx0a-002e3701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
	0BGEcO9X005577; Wed, 16 Dec 2020 14:40:57 GMT
Received: from g2t2352.austin.hpe.com (g2t2352.austin.hpe.com [15.233.44.25])
	by mx0a-002e3701.pphosted.com with ESMTP id 35f4cvxeu1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 16 Dec 2020 14:40:57 +0000
Received: from G1W8106.americas.hpqcorp.net (g1w8106.austin.hp.com
	[16.193.72.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by g2t2352.austin.hpe.com (Postfix) with ESMTPS id AE2AF85;
	Wed, 16 Dec 2020 14:40:56 +0000 (UTC)
Received: from G9W8672.americas.hpqcorp.net (16.220.49.31) by
	G1W8106.americas.hpqcorp.net (16.193.72.61) with Microsoft SMTP Server
	(TLS) id 15.0.1497.2; Wed, 16 Dec 2020 14:40:45 +0000
Received: from G9W9210.americas.hpqcorp.net (2002:10dc:429b::10dc:429b) by
	G9W8672.americas.hpqcorp.net (2002:10dc:311f::10dc:311f) with Microsoft
	SMTP Server (TLS) id 15.0.1497.2; Wed, 16 Dec 2020 14:40:44 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (15.241.52.13) by
	G9W9210.americas.hpqcorp.net (16.220.66.155) with Microsoft SMTP
	Server (TLS)
	id 15.0.1497.2 via Frontend Transport; Wed, 16 Dec 2020 14:40:44 +0000
Received: from DF4PR8401MB0347.NAMPRD84.PROD.OUTLOOK.COM
	(2a01:111:e400:7606::14) by DF4PR8401MB0459.NAMPRD84.PROD.OUTLOOK.COM
	(2a01:111:e400:7608::12) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.15;
	Wed, 16 Dec 2020 14:40:43 +0000
Received: from DF4PR8401MB0347.NAMPRD84.PROD.OUTLOOK.COM
	([fe80::e4cc:4e9:c375:2b3d]) by
	DF4PR8401MB0347.NAMPRD84.PROD.OUTLOOK.COM
	([fe80::e4cc:4e9:c375:2b3d%5]) with mapi id 15.20.3654.025;
	Wed, 16 Dec 2020 14:40:43 +0000
From: "Tia, Javier" <javier.tia@hpe.com>
To: Steve Grubb <sgrubb@redhat.com>, "linux-audit@redhat.com"
	<linux-audit@redhat.com>
Subject: Re: [PATCH] Fix audispd crash on ARM 32-Bits
Thread-Topic: [PATCH] Fix audispd crash on ARM 32-Bits
Thread-Index: AQHW0CwH37E7K+oTnkmX2kw2+/Ph0Knz3mwAgAAJ9oCAAhwUAIADzg0A
Date: Wed, 16 Dec 2020 14:40:43 +0000
Message-ID: <3aad311f-a454-d32b-1374-e8040d1212cf@hpe.com>
References: <20201212021050.26656-1-javier.tia@hpe.com>
	<11696239.O9o76ZdvQC@x2> <f1c0ffd0-fbe0-5233-33e8-059a141ab55b@hpe.com>
	<1770439.tdWV9SEqCh@x2>
In-Reply-To: <1770439.tdWV9SEqCh@x2>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.5.0
x-originating-ip: [190.171.127.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 14ecb4fc-5cf4-411a-39fd-08d8a1d09116
x-ms-traffictypediagnostic: DF4PR8401MB0459:
x-microsoft-antispam-prvs: <DF4PR8401MB04599A31F24BDF9B04842AAC99C50@DF4PR8401MB0459.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: AflALAJGaPaXdNAQJJrCNyyBIGL2WSj9XrOM7safCwCWkdrmbwHOF7aLO9bNnssDPScwdQtnEI4rg2eL0EqwH/t9ZcpjahDPsxl4o4U0IkMurEXgTFDKby5i0G3rljVF8RG6jv+7Zx0HPRB7xJ4JAX6NoTMfzj8a5gJyAEJApSiCowzWVReQ8bTbk2RjAG5u4dvw3CCpgRJOjxT7ZzheO/53SE7gEE+z/CplFkkhDTpX56YLP2wkveoe4LQU698cUQDTEMsUSttJPobbdcJvGfYlp6NF0DXJaeXm3CNYe8pM3UDQwZ2apZIiiYZ9SGzImXbdsFd5DRmBdoyYx1vEErsjY3X+Yl/8OtYDUfXzf9b1leOp5QfLPBXKRzLsgEajI88/n9oYEdvOBMwfGHQiSAL2DCIKCWB6JRpZWW8rQVg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DF4PR8401MB0347.NAMPRD84.PROD.OUTLOOK.COM;
	PTR:; CAT:NONE;
	SFS:(366004)(396003)(39860400002)(346002)(376002)(136003)(53546011)(66556008)(5660300002)(76116006)(66946007)(36756003)(31696002)(64756008)(66446008)(316002)(86362001)(2616005)(6486002)(26005)(6512007)(450100002)(478600001)(83380400001)(110136005)(186003)(6506007)(2906002)(31686004)(8936002)(8676002)(71200400001)(66476007)(45980500001)(43740500002);
	DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata: =?utf-8?B?UDJnelNVQjJSU1JQQmg0THdSWFVsMW1UN25ZaGJYVG9QSnhzUTVEMUVlWXcz?=
	=?utf-8?B?YnV2clNveXBFYU9iUWxuZ0dQYmpJSWlEYWJKalMveUlmeGc0M2prVFF6Nlpi?=
	=?utf-8?B?bktNci9XTSs2b3BjQ01HNVNyb0FSb2llbGwyNkdtS2Mrc2FQUDFLRkNvY2dQ?=
	=?utf-8?B?VHJCbkZyalRSSTNBKzVxM3BZWmNJUnNMbjBVZWJsOTJ6SldlRlNtczFoYWZO?=
	=?utf-8?B?NDR4U2o4R2pHNE5URGd1RzRhRVpPbkU5MGtCY09sYkloQ0RkKzEydWlLeFZC?=
	=?utf-8?B?VFpiNEZTQTN3c1RwTXkvdkpiTVptWkJpS3JmcmwzWDIvVHIvL2VoNXlhS2do?=
	=?utf-8?B?dWtsQ01pUHI3RGN0V1M2azUreUNGQkNoZ3RHamlyQmVnK0RUWThtT3p0NCt2?=
	=?utf-8?B?Q3pLRWtwK1BTN25LSVRyZnl3RnpyOXI3MUxOTm4vbTBnMndYUEk0S3JScWoz?=
	=?utf-8?B?V1NYLzJmTVdhQnVDKzZGRnN1Wk1jNjhwT3luNVAzU2xXcjBkcHR3UjFWVGVN?=
	=?utf-8?B?UVdqTVlrNmFMUjA3dlJSdUoxcnpBRWFuR0wyMGoyRlF0UTFSMEJPYVNhUUkz?=
	=?utf-8?B?d25ra2VDZGgwdzNCeXRzOGF2KzZVU2dWZmd3RXlyY0k5eWJNQkZmRFVWalBt?=
	=?utf-8?B?d3JidjY2NzF5RWJmdHlzdnMyakNYeEZLdHBTWU9Ta28zb2Jsd0ErcnZjME9Y?=
	=?utf-8?B?SnJGNlhHd1poOXUyZ05VbUdvZE1xRnJZcFZGT09rRElDQ1RLKzhKNW43THEv?=
	=?utf-8?B?M2ZIRUFOYVF1T2hTVjRnVy9ZZFhPTGNCTWRqVXVENUhpMDdqYU50c0ZyVW1D?=
	=?utf-8?B?OHoyZVcrNHpDMGlQd3JmR2VjdzMveW9aQzA0bmpWQU1IMVpxVmdXaDZSOVcr?=
	=?utf-8?B?dVcrVUFVQzU0TzNTVUIvWjNNZlg1bXdCcnBuWUtLMnZ5eVFUUDVnb1N6VXJD?=
	=?utf-8?B?dlBQclpUQXFJbnpBdmpOcG94M2l5S2x2cC9YbnFuL1RLS0gwTGtFazk1dTdy?=
	=?utf-8?B?V041Y01ibURVTWlOSmg1MTVINU1jY2ZmWkxKYWZtQmlrWWozV0dqNGphdG5L?=
	=?utf-8?B?bWNMNUp0MkU0Rm1CZGRyTXhHUEFydE82WHpUajRqbDdMelY5OHg5dlIvYUxI?=
	=?utf-8?B?cGE5ZlJQL216YjM0d2VaT3VTOHBlMUM3V0xRZ2x6UmU3RUFvcktsQVgvVDdB?=
	=?utf-8?B?UDhRR3B2SEl0aWpJMDQ3NW52R3NNV0hSQVVXdmtxN2ZOYy91Y05rRDJlNG5O?=
	=?utf-8?B?aHpFMTVHczMzSjF0OWEweGZjWEhzbmxqUzFIUThqYjNJOEYwVGw3aCtqUit1?=
	=?utf-8?Q?qv8FEAb/qtL78=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DF4PR8401MB0347.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ecb4fc-5cf4-411a-39fd-08d8a1d09116
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2020 14:40:43.1635 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NSdACO9s5/mMjI/JOaXpQODAcZE4PB6v2C2C4d4J4Cork6jCZK69YvkZle2JLsVlnXXoPlhs8Kr2QWbn2TErDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DF4PR8401MB0459
X-OriginatorOrg: hpe.com
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
	definitions=2020-12-16_05:2020-12-15,
	2020-12-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	phishscore=0 adultscore=0
	suspectscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0
	priorityscore=1501 clxscore=1015 bulkscore=0 mlxlogscore=999
	malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.12.0-2009150000 definitions=main-2012160098
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0BGEf6VV026168
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <456E235526F6C144A4000CAA7857E03F@NAMPRD84.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgU3RldmUsCgpVbmRlcnN0b29kLiBUaGFuayB5b3UgZm9yIGFsbCB5b3VyIGNvbW1lbnRzIGFu
ZCBzdWdnZXN0aW9ucy4KCi1KYXZpZXIKCk9uIDEyLzEzLzIwIDEwOjM0IFBNLCBTdGV2ZSBHcnVi
YiB3cm90ZToKPiBPbiBTYXR1cmRheSwgRGVjZW1iZXIgMTIsIDIwMjAgMzoyMToyNSBQTSBFU1Qg
VGlhLCBKYXZpZXIgd3JvdGU6Cj4+IFRoYW5rIHlvdSBmb3IgeW91ciBwcm9tcHQgcmVzcG9uc2Ug
YW5kIGZvciBwb2ludGluZyB0byBhIHNvbHV0aW9uLgo+Pgo+PiBZZXMsIHRoaXMgcGF0Y2ggaXQn
cyBhcHBsaWVkIHRvIGF1ZGl0IHYyLjQuMy4gSXQncyBhbiBlbWJlZGRlZCBkZXZpY2UsCj4+IGFu
ZCBhdCB0aGUgbW9tZW50LCB3ZSdyZSB1bmFibGUgdG8gdXBncmFkZSB0aGUgYXVkaXQgdG8gYSBo
aWdoZXIgYXVkaXQKPj4gdmVyc2lvbi4KPiAKPiBUaGF0J3MgYSBzaGFtZS4gQnV0IGlmIHlvdSBo
YXZlIGEgcmVwcm9kdWNlciwgaXQgbWlnaHQgYmUgd29ydGggc2VlaW5nIGlmIGl0cwo+IGZpeGVk
IGluIDIuOC41IGFuZCBiaXNlY3RpbmcgYmFjayB0byBmaW5kIHRoZSBvZmZpY2lhbCBwYXRjaCBp
ZiBpdCB3ZXJlIGZpeGVkLgo+ICAgCj4+IElmIGF1ZGl0IHYyLjQueSB3ZXJlIHN0aWxsIG1haW50
YWluYWJsZSwKPiAKPiBJdCdzIG5vdAo+IAo+PiB3b3VsZCB5b3UgYWNjZXB0IHRoaXMgcGF0Y2gg
Zm9yIGF1ZGl0IHYyLjQueT8KPiAKPiBUaGF0IGRlcGVuZHMuIFlvdSBhcmUgemVyb2luZyBvdXQg
dGhlIHBhdGggYW5kIHRoZW4gc2V0dGluZyBpdCB0byBOVUxMLgo+IFNldHRpbmcgdGhlIHBvaW50
ZXIgdG8gTlVMTCBzaG91bGQgYmUgZW5vdWdoLiBJZiBub3QsIHNldHRpbmcgdGhlIGZpcnN0IGJ5
dGUKPiB0byAwIHNob3VsZCB3aXBlIG91dCB0aGUgd2hvbGUgc3RyaW5nIGZvciBhbnkgc3RyaW5n
IGZ1bmN0aW9uLiBCdXQgdXN1YWxseQo+IHRoaXMga2luZCBvZiBmaXh1cCBpcyBiZWNhdXNlIGl0
IGdldHMgdXNlZCBhZ2FpbiBzb21ld2hlcmUgYnkgYWNjaWRlbnQuIFRoYXQKPiB3b3VsZCBiZSBh
IHBsdWdpbiBsaWZlY3ljbGUgaXNzdWUgYW5kIHdvdWxkIGJlIHRoZSByb290IGNhdXNlLiBUaGUg
cGx1Z2luCj4gbGlmZWN5Y2xlIHdhcyByZXdvcmtlZCBzb21ldGltZSBhZnRlciB0aGUgcmVsZWFz
ZSB5b3UgaGF2ZS4KPiAKPiBTbywgbXkgZ3Vlc3MgKGFuZCBpdCdzIHB1cmUgc3BlY3VsYXRpb24g
d2l0aG91dCBhIHJlcHJvZHVjZXIpIGlzIHRoaXMgY292ZXJzCj4gdXAgd2hhdGV2ZXIgcHJvYmxl
bSB5b3UgYXJlIHNlZWluZy4gQnV0IHRoZXJlIG1heSBiZSBhIGRlZXBlciBpc3N1ZSBhYm91dCBh
Cj4gcGx1Z2luIG5vdCBiZWluZyBmdWxseSBkZWNvbW1pc3Npb25lZC4gSXQncyBhIGxvbmcgd2F5
IHRvIHNheSwgSSdkIGxvb2sKPiBkZWVwZXIgYXMgdG8gaG93IHRoaXMgZ29lcyB3cm9uZy4KPiAK
PiAtU3RldmUKPiAKPj4KPj4gLUphdmllcgo+Pgo+PiBPbiAxMi8xMi8yMCAxOjQ1IFBNLCBTdGV2
ZSBHcnViYiB3cm90ZToKPj4KPj4+IEhlbGxvLAo+Pj4KPj4+IFRoYW5rcyBmb3IgdGhlIHBhdGNo
LiBCdXQgaWYgaXRzIHRydWUgdGhhdCB0aGlzIGlzIGFnYWluc3QgYXVkaXQtMi40LjMsCj4+PiB0
aGVuCj4gICB0aGVyZSBpcyBhIGdvb2QgY2hhbmNlIHRoaXMgaXMgZml4ZWQgYnkgMi44LjUuIFRo
ZXJlIHdlcmUgYSBudW1iZXIKPj4+IG9mIGZpeGVzIGluIHRoaXMgYXJlYSB0aGF0IGZpeGVkIHZh
cmlvdXMgaXNzdWVzIHdpdGggcGx1Z2lucy4KPj4+Cj4+PiBCZXN0IFJlZ2FyZHMsCj4+PiAtU3Rl
dmUKPj4+Cj4+PiBPbiBGcmlkYXksIERlY2VtYmVyIDExLCAyMDIwIDk6MTA6NTAgUE0gRVNUIEph
dmllciBUacOhIHdyb3RlOgo+Pj4KPj4+PiBPbiBBUk0gMzItQml0cywgYXVkaXNwZCBpcyBjcmFz
aGluZy4gQmFja3RyYWNlOgo+Pj4+Cj4+Pj4KPj4+Pgo+Pj4+IChnZGIpIGJ0Cj4+Pj4gMCAgMHhi
NmUyMDk1OCBpbiBfX0dJX3JhaXNlIChzaWc9c2lnQGVudHJ5PTYpCj4+Pj4KPj4+PiAgICAgIGF0
Cj4+Pj4gICAgICAvdXNyL3NyYy9kZWJ1Zy9nbGliYy8yLjIzLXIwL2dpdC9zeXNkZXBzL3VuaXgv
c3lzdi9saW51eC9yYWlzZS5jOjU0Cj4+Pj4gICAgICAKPj4+Pgo+Pj4+IDEgIDB4YjZlMjFlNTgg
aW4gX19HSV9hYm9ydCAoKQo+Pj4+Cj4+Pj4gICAgICBhdCAvdXNyL3NyYy9kZWJ1Zy9nbGliYy8y
LjIzLXIwL2dpdC9zdGRsaWIvYWJvcnQuYzoxMTgKPj4+Pgo+Pj4+IDIgIDB4YjZlNTlkNjQgaW4g
X19saWJjX21lc3NhZ2UgKGRvX2Fib3J0PWRvX2Fib3J0QGVudHJ5PTIsCj4+Pj4KPj4+PiAgICAg
IGZtdD0weGI2ZjExMTljICIqKiogRXJyb3IgaW4gYCVzJzogJXM6IDB4JXMgKioqXG4iKQo+Pj4+
ICAgICAgYXQgL3Vzci9zcmMvZGVidWcvZ2xpYmMvMi4yMy1yMC9naXQvc3lzZGVwcy9wb3NpeC9s
aWJjX2ZhdGFsLmM6MTc1Cj4+Pj4KPj4+PiAzICAweGI2ZTYwMTA4IGluIG1hbGxvY19wcmludGVy
ciAoYWN0aW9uPTxvcHRpbWl6ZWQgb3V0PiwKPj4+Pgo+Pj4+ICAgICAgc3RyPTB4YjZmMTEzNTQg
ImRvdWJsZSBmcmVlIG9yIGNvcnJ1cHRpb24gKGZhc3R0b3ApIiwKPj4+PiAgICAgIHB0cj08b3B0
aW1pemVkCj4+Pj4KPj4+PiBvdXQ+LCBhcl9wdHI9PG9wdGltaXplZCBvdXQ+KQo+Pj4+Cj4+Pj4g
ICAgICBhdCAvdXNyL3NyYy9kZWJ1Zy9nbGliYy8yLjIzLXIwL2dpdC9tYWxsb2MvbWFsbG9jLmM6
NTAwNwo+Pj4+Cj4+Pj4gNCAgMHhiNmU2MGE5OCBpbiBfaW50X2ZyZWUgKGF2PTB4YjZmMmQ3OWMg
PG1haW5fYXJlbmE+LCBwPTxvcHRpbWl6ZWQKPj4+PiBvdXQ+LAo+Pj4KPj4+PiAgICAgIGhhdmVf
bG9jaz08b3B0aW1pemVkIG91dD4pCj4+Pj4gICAgICBhdCAvdXNyL3NyYy9kZWJ1Zy9nbGliYy8y
LjIzLXIwL2dpdC9tYWxsb2MvbWFsbG9jLmM6Mzg2OAo+Pj4+Cj4+Pj4gNSAgMHgwMDQyMzRiOCBp
biBmcmVlX3Bjb25maWcgKGNvbmZpZz0weDQzYjM5OCkKPj4+Pgo+Pj4+ICAgICAgYXQKPj4+Pgo+
Pj4+IC91c3Ivc3JjL2RlYnVnL2F1ZGl0LzIuNC4zLXI4L2F1ZGl0LTIuNC4zL2F1ZGlzcC9hdWRp
c3BkLXBjb25maWcuYzo1MTMKPj4+PiA2Cj4+Pj4gMHgwMDQyMTI0NCBpbiBtYWluIChhcmdjPTxv
cHRpbWl6ZWQgb3V0PiwgYXJndj08b3B0aW1pemVkIG91dD4pIGF0Cj4+Pj4gL3Vzci9zcmMvZGVi
dWcvYXVkaXQvMi40LjMtcjgvYXVkaXQtMi40LjMvYXVkaXNwL2F1ZGlzcGQuYzo0NjQKPj4+Pgo+
Pj4+Cj4+Pj4KPj4+PiAoZ2RiKSBmIDUKPj4+PiAoZ2RiKSBwIGNvbmZpZy0+cGF0aAo+Pj4+ICQy
ID0gMHg0M2I1ZjAgIiIKPj4+PiAoZ2RiKSBwIGNvbmZpZy0+bmFtZQo+Pj4+ICQzID0gMHg0M2Iz
NzAgImhcMjY0Qwo+Pj4+Cj4+Pj4KPj4+Pgo+Pj4+IEJlIHBhcmFub2lkIGFuZCBvdmVyd3JpdGUg
Y29uZmlnLT5wYXRoIHdpdGggemVybyBieXRlcyBiZWZvcmUgZG9pbmcgdGhlCj4+Pj4gZnJlZSgp
Lgo+Pj4+IC0tLQo+Pj4+Cj4+Pj4gICAgYXVkaXNwL2F1ZGlzcGQtcGNvbmZpZy5jIHwgNCArKysr
Cj4+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+Pj4+Cj4+Pj4KPj4+Pgo+
Pj4+IGRpZmYgLS1naXQgYS9hdWRpc3AvYXVkaXNwZC1wY29uZmlnLmMgYi9hdWRpc3AvYXVkaXNw
ZC1wY29uZmlnLmMKPj4+PiBpbmRleCBhOGI3ODc4Li5hMTNmNjgxIDEwMDY0NAo+Pj4+IC0tLSBh
L2F1ZGlzcC9hdWRpc3BkLXBjb25maWcuYwo+Pj4+ICsrKyBiL2F1ZGlzcC9hdWRpc3BkLXBjb25m
aWcuYwo+Pj4+IEBAIC01MTAsNyArNTEwLDExIEBAIHZvaWQgZnJlZV9wY29uZmlnKHBsdWdpbl9j
b25mX3QgKmNvbmZpZykKPj4+Pgo+Pj4+ICAgIAkJY2xvc2UoY29uZmlnLT5wbHVnX3BpcGVbMF0p
Owo+Pj4+ICAgIAkKPj4+PiAgICAJaWYgKGNvbmZpZy0+cGx1Z19waXBlWzFdID49IDApCj4+Pj4g
ICAgCQo+Pj4+ICAgIAkJY2xvc2UoY29uZmlnLT5wbHVnX3BpcGVbMV0pOwo+Pj4+Cj4+Pj4gKwkv
KiBCZSBwYXJhbm9pZCBhbmQgb3ZlcndyaXRlIGNvbmZpZy0+cGF0aCB3aXRoIHplcm8gYnl0ZXMg
YmVmb3JlCj4+Pj4gZG9pbmcKPj4+PiB0aGUgKwkgKiBmcmVlKCkgKi8KPj4+PiArCW1lbXNldChj
b25maWctPnBhdGgsIDAsIHN0cmxlbihjb25maWctPnBhdGgpKTsKPj4+Pgo+Pj4+ICAgIAlmcmVl
KCh2b2lkICopY29uZmlnLT5wYXRoKTsKPj4+Pgo+Pj4+ICsJY29uZmlnLT5wYXRoID0gTlVMTDsK
Pj4+Pgo+Pj4+ICAgIAlmcmVlKCh2b2lkICopY29uZmlnLT5uYW1lKTsKPj4+PiAgICAKPj4+PiAg
ICB9Cj4+Pgo+Pj4KPj4+Cj4+Pgo+Pj4KPiAKPiAKPiAKPiAKCi0tCkxpbnV4LWF1ZGl0IG1haWxp
bmcgbGlzdApMaW51eC1hdWRpdEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1hdWRpdA==

