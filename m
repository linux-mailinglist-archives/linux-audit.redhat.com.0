Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6247A8B98
	for <lists+linux-audit@lfdr.de>; Wed, 20 Sep 2023 20:23:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695234200;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QLLw9Oou2NlXletDUbzqGDhA5+hV9gVahZkVNWZS4o0=;
	b=Pk/bsLE1PrXxmo3/x2JaTyBNJE2d1JU8lsBv2hfX4GE8zblbfac56Dk4dRmefRGxKpGuIA
	XgD55Oe1J9PaAfQSeaRQp3S0qe0p8jq8Y4Vxm3lEWH7S+ceWriC3quMzib4bNIy7OTvTCM
	C08Y7RtpOR1/lKD7Bp3c3oW6/xGOWCw=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-kYvSPhsUMYeoGvZTyKGT7g-1; Wed, 20 Sep 2023 14:23:17 -0400
X-MC-Unique: kYvSPhsUMYeoGvZTyKGT7g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B2D0293248A;
	Wed, 20 Sep 2023 18:23:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E3363C15BB8;
	Wed, 20 Sep 2023 18:23:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6AFAB19466E5;
	Wed, 20 Sep 2023 18:22:46 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BCE4519466E7 for <linux-audit@listman.corp.redhat.com>;
 Wed, 20 Sep 2023 18:21:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9887728FB; Wed, 20 Sep 2023 18:21:22 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 90D6251E3
 for <linux-audit@redhat.com>; Wed, 20 Sep 2023 18:21:22 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-inbound-delivery-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F4D0800969
 for <linux-audit@redhat.com>; Wed, 20 Sep 2023 18:21:22 +0000 (UTC)
Received: from aplegw01.jhuapl.edu (aplegw01.jhuapl.edu [128.244.251.168])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-92-G-mZ3FbkPq2e9TLTibWXDg-1; Wed, 20 Sep 2023 14:21:20 -0400
X-MC-Unique: G-mZ3FbkPq2e9TLTibWXDg-1
Received: from pps.filterd (aplegw01.jhuapl.edu [127.0.0.1])
 by aplegw01.jhuapl.edu (8.17.1.19/8.17.1.19) with ESMTP id 38KBfRKl024497;
 Wed, 20 Sep 2023 14:11:35 -0400
Received: from aplex20.dom1.jhuapl.edu (aplex20.dom1.jhuapl.edu [10.114.162.5])
 by aplegw01.jhuapl.edu (PPS) with ESMTPS id 3t55d8kr3a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Sep 2023 14:11:35 -0400
Received: from APLEX26.dom1.jhuapl.edu (10.114.162.11) by
 APLEX20.dom1.jhuapl.edu (10.114.162.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.37; Wed, 20 Sep 2023 14:11:34 -0400
Received: from APLEX26.dom1.jhuapl.edu ([fe80::8b67:5cb8:8fbe:fd18]) by
 APLEX26.dom1.jhuapl.edu ([fe80::8b67:5cb8:8fbe:fd18%12]) with mapi id
 15.02.1118.037; Wed, 20 Sep 2023 14:11:34 -0400
From: "Wieprecht, Karen M." <Karen.Wieprecht@jhuapl.edu>
To: 'Steve Grubb' <sgrubb@redhat.com>, "linux-audit@redhat.com"
 <linux-audit@redhat.com>
Subject: RE: [EXT] Re: 128 Character limit on proctitle field?
Thread-Topic: [EXT] Re: 128 Character limit on proctitle field?
Thread-Index: Adnn7XCv4G5FhuKUT3CiGEqUr+p2zgDhaAgAAB6pD5A=
Date: Wed, 20 Sep 2023 18:11:34 +0000
Message-ID: <4f6baa4aac334527b0f0380a18a2d718@jhuapl.edu>
References: <f04d10f4d94c4c2295031fee26dc8082@jhuapl.edu>
 <3785033.kQq0lBPeGt@x2>
In-Reply-To: <3785033.kQq0lBPeGt@x2>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.114.162.18]
MIME-Version: 1.0
X-CrossPremisesHeadersFilteredBySendConnector: APLEX20.dom1.jhuapl.edu
X-OrganizationHeadersPreserved: APLEX20.dom1.jhuapl.edu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-20_08,2023-09-20_01,2023-05-22_02
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: jhuapl.edu
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

U3BvdHRlZCB0aGUgRVhFQ1ZFIGFyZ3VtZW50cyBhcyB3ZWxsLCAgSSdsbCBkZWZpbml0ZWx5IG5l
ZWQgdG8gbG9vayBoZXJlIHNpbmNlIHRoZSBwcm9jdGl0bGUgaXMgbGltaXRlZCB0byAxMjggY2hh
cnMuICAgQXBwcmVjaWF0ZSB0aGUgZmVlZGJhY2sgYW5kIGluZm8sIHRoYW5rcyENCg0KLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFN0ZXZlIEdydWJiIDxzZ3J1YmJAcmVkaGF0LmNv
bT4gDQpTZW50OiBUdWVzZGF5LCBTZXB0ZW1iZXIgMTksIDIwMjMgNzozMiBQTQ0KVG86IGxpbnV4
LWF1ZGl0QHJlZGhhdC5jb20NCkNjOiBXaWVwcmVjaHQsIEthcmVuIE0uIDxLYXJlbi5XaWVwcmVj
aHRAamh1YXBsLmVkdT4NClN1YmplY3Q6IFtFWFRdIFJlOiAxMjggQ2hhcmFjdGVyIGxpbWl0IG9u
IHByb2N0aXRsZSBmaWVsZD8NCg0KQVBMIGV4dGVybmFsIGVtYWlsIHdhcm5pbmc6IFZlcmlmeSBz
ZW5kZXIgc2dydWJiQHJlZGhhdC5jb20gYmVmb3JlIGNsaWNraW5nIGxpbmtzIG9yIGF0dGFjaG1l
bnRzwqANCg0KT24gRnJpZGF5LCBTZXB0ZW1iZXIgMTUsIDIwMjMgMTI6MTU6MTIgUE0gRURUIFdp
ZXByZWNodCwgS2FyZW4gTS4gd3JvdGU6DQo+IFdlJ3JlIHdvcmtpbmcgd2l0aCBEb2NrZXIgYW5k
IHBvZG1hbiwgYW5kIEknbSB3b3JraW5nIG9uIHBhcnNpbmcgdGhlIA0KPiBhdWRpdCBkYXRhIHdl
IGdldCB0byBmbGFnIHByb2hpYml0ZWQgYW5kIG1pc3NpbmcgY29tbWFuZCBvcHRpb25zIGJhc2Vk
IG9uIFNUSUcNCj4gZ3VpZGVsaW5lcy4gICBJIG5vcm1hbGx5IGV4dHJhY3QgdGhlIHByb2N0aXRs
ZSBmcm9tIHRoZSByYXcgYXVkaXRkIGRhdGEgLA0KPiBidXQgdGhlc2UgY29tbWFuZHMgYXJlIHZl
cnkgbG9uZyB3aXRoIHNvbWV0aW1lcyAyMyBvciBtb3JlIGNvbW1hbmQgDQo+IGxpbmUgcGFyYW1l
dGVycyAsICBhbmQgSSBub3RpY2VkIHRoYXQgYWxsIG9mIHRoZSBhdWRpdGQgcHJvY3RpdGxlIGRh
dGEgDQo+IGZvciB0aGUgbGVuZ3RoaWVyIGNvbW1hbmRzIGlzIGJlaW5nIGN1dCBvZmYgYXQgMTI4
IGNoYXJhY3RlcnMuDQoNClRoZSBwcm9jdGl0bGUgZXZlbnQgY29tbWl0IG1lc3NhZ2UgZXhwbGFp
bnMgd2h5IGl0IHdhcyBjcmVhdGVkOg0KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vYXJjaGl2
ZXMvbGludXgtYXVkaXQvMjAxNC1GZWJydWFyeS8wMDg3NzguaHRtbA0KDQpUaGUgY29tbSBmaWVs
ZCBpcyBvbmx5IDE2IGNoYXJhY3RlcnMgbG9uZy4gU28sIGl0IHRyaWVzIHRvIGNhcHR1cmUgdGhl
IGZpcnN0DQoxMjggYnl0ZXMgc28gdGhhdCBhdCBsZWFzdCBhbmRyb2lkIGNvbW0gZmllbGRzIGNh
biBiZSBkZWR1Y2VkIHNpbmNlIHRoZXkgYXJlIGFsbW9zdCBhbHdheXMgbGFyZ2VyIHRoYW4gMTYg
Ynl0ZXMuDQoNCj4gSSdtIGJyaW5naW5nIHRoaXMgdXAgIGZvciB0d28gcmVhc29uczoNCj4gDQo+
ICAgICAgT25lLCAgbm90IGV2ZXJ5b25lIHdvcmtpbmcgd2l0aCB0aGlzIGRhdGEgbWF5IHJlYWxp
emUgdGhhdCB0aGVyZSANCj4gc2VlbXMgdG8gYmUgYSBjaGFyYWN0ZXIgbGltaXQsIGFuZCBzZWNv
bmQsIGlmIHRoaXMgaXMgYnkgY2hhbmNlIGEgYnVnIA0KPiBhcyBvcHBvc2VkIHRvIGludGVudGlv
bmFsLCAgdGhlbiBJJ20gaG9waW5nIHdlIGNhbiBnZXQgYSBmaXggY29va2luZyBmb3IgaXQ/DQoN
ClRoZSByZWNvcmQgdGhhdCBjb250YWlucyBhbGwgb2YgdGhlIGNvbW1hbmQgbGluZSBpcyB0aGUg
ZXhlY3ZlIHJlY29yZC4gSXQgaGFzIGFsbCBwYXJhbWV0ZXJzIGV2ZW4gaWYgaXQncyAxMCwwMDAu
IFNvLCB5b3UgbWF5IHdhbnQgdG8gdHJ5IGF1ZGl0aW5nIGJ5IGV4ZWMgb2Ygc3BlY2lmaWMgYXBw
bGljYXRpb25zIHRvIGdldCBldmVyeXRoaW5nLg0KDQpBbHNvLCBhcyBtZW50aW9uZWQgaW4gdGhl
IGNvbW1pdCwgcHJvY3RpdGxlIGlzIGJhc2VkIG9mZiBvZiBjb21tLiBUaGlzIGNhbiBiZSBjb250
cm9sbGVkIGJ5IHVzZXIgc3BhY2UgdG8gbWlzZGlyZWN0IGF0dGVudGlvbiBieSBzcG9vZiB0aGUg
cHJvZ3JhbSBuYW1lLg0KDQo+IEluIHRoZSBtZWFudGltZSwgIEkgbWF5IGJlIGFibGUgdG8gd29y
ayBhcm91bmQgdGhpcyBieSBwaWVjaW5nIA0KPiB0b2dldGhlciB0aGUgZnVsbCBjb21tYW5kIGZy
b20gdGhlICJhIz0gIiAgZmllbGRzLCBidXQgaXQgd291bGQgYmUgDQo+IG11Y2ggZWFzaWVyIGlm
IHByb2N0aXRsZSB3YXNuJ3QgY3V0IG9mZiBhZnRlciAxMjggY2hhcnMuDQo+IA0KPiBUaGFua3Ms
IGFueSBpbmZvIHlvdSBjYW4gc2hhcmUgd291bGQgYmUgbXVjaCBhcHByZWNpYXRlZCwNCg0KVGhp
cyB3YXMgaW50ZW50aW9uYWwuIFRoZXJlIHdhcyBhIGxvbmcgZGlzY3Vzc2lvbiBvZiB0aGlzIGlu
IEphbnVhcnkgYW5kIEZlYnJ1YXJ5IG9mIDIwMTQgaWYgeW91IHdhbnQgbW9yZSBiYWNrZ3JvdW5k
Lg0KDQotU3RldmUNCg0KDQotLQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QKTGludXgtYXVkaXRA
cmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWF1ZGl0Cg==

