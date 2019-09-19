Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C09D9B73D1
	for <lists+linux-audit@lfdr.de>; Thu, 19 Sep 2019 09:13:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DF8693082E90;
	Thu, 19 Sep 2019 07:13:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11D66196AE;
	Thu, 19 Sep 2019 07:13:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EF12D180085A;
	Thu, 19 Sep 2019 07:12:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8J7Cnik030102 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 19 Sep 2019 03:12:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2DA68608A5; Thu, 19 Sep 2019 07:12:49 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27BA260872;
	Thu, 19 Sep 2019 07:12:46 +0000 (UTC)
Received: from baidu.com (mx20.baidu.com [111.202.115.85])
	by mx1.redhat.com (Postfix) with ESMTP id 79DD6307D868;
	Thu, 19 Sep 2019 07:12:43 +0000 (UTC)
Received: from BC-Mail-Ex15.internal.baidu.com (unknown [172.31.51.55])
	by Forcepoint Email with ESMTPS id 3871A7DD78825;
	Thu, 19 Sep 2019 15:12:39 +0800 (CST)
Received: from BJHW-Mail-Ex13.internal.baidu.com (10.127.64.36) by
	BC-Mail-Ex15.internal.baidu.com (172.31.51.55) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1531.3; Thu, 19 Sep 2019 15:12:40 +0800
Received: from BJHW-Mail-Ex13.internal.baidu.com ([100.100.100.36]) by
	BJHW-Mail-Ex13.internal.baidu.com ([100.100.100.36]) with mapi id
	15.01.1713.004; Thu, 19 Sep 2019 15:12:40 +0800
From: "Li,Rongqing" <lirongqing@baidu.com>
To: Steve Grubb <sgrubb@redhat.com>
Subject: =?gb2312?B?tPC4tDogW1BBVENIXVtSRkNdIGF1ZGl0OiBzZXQgd2FpdCB0aW1lIHRvIHpl?=
	=?gb2312?Q?ro_when_audit_failed?=
Thread-Topic: [PATCH][RFC] audit: set wait time to zero when audit failed
Thread-Index: AQHVaWpIwZPuSgS+uUKlaAzCHP+Gd6ctnETAgADNj4CAAKk2MIAArPYAgADmB1CAADi7AIABYr8w//+K3wCAANPo8A==
Date: Thu, 19 Sep 2019 07:12:40 +0000
Message-ID: <104dff43c31444088b7559a21d73d451@baidu.com>
References: <1568258385-10643-1-git-send-email-lirongqing@baidu.com>
	<CAHC9VhRXj2UpdijxpKgMROfNu9tETpXpHdboPqP=HvVF-GuBVQ@mail.gmail.com>
	<f0efb280c80342049d4c43c9acb42676@baidu.com>
	<CAHC9VhR79o8aSkORj0fU2XKfLUBipRtTO+xUHPAd+StfpzAV-g@mail.gmail.com>
	<fe43dc199f3949709828e1d96edf7556@baidu.com>
	<CAHC9VhTSBvZr0jFARoFQ2dBxQR6rsDxY6uOLaF35e9BVhNEvaA@mail.gmail.com>
	<dbfc8ea5cdc3413e829eb864430ed7dc@baidu.com>
	<CAHC9VhRQKcS2E-WwMoJ_GntXY6cKTCvaykRBF_FXG4ggvAiHLA@mail.gmail.com>
	<6fc9ae05851842ca9ea2cc2b01dccc4c@baidu.com>
	<20190918223344.3ec262cb@ivy-bridge>
In-Reply-To: <20190918223344.3ec262cb@ivy-bridge>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.198.17]
x-baidu-bdmsfe-datecheck: 1_BC-Mail-Ex15_2019-09-19 15:12:41:245
x-baidu-bdmsfe-viruscheck: BC-Mail-Ex15_GRAY_Inside_WithoutAtta_2019-09-19
	15:12:41:229
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.48]); Thu, 19 Sep 2019 07:12:45 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Thu, 19 Sep 2019 07:12:45 +0000 (UTC) for IP:'111.202.115.85'
	DOMAIN:'mx20.baidu.com' HELO:'baidu.com'
	FROM:'lirongqing@baidu.com' RCPT:''
X-RedHat-Spam-Score: -0.702  (RCVD_IN_DNSWL_LOW, SPF_HELO_PASS,
	SPF_PASS) 111.202.115.85 mx20.baidu.com 111.202.115.85
	mx20.baidu.com <lirongqing@baidu.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x8J7Cnik030102
X-loop: linux-audit@redhat.com
Cc: "linux-audit@redhat.com" <linux-audit@redhat.com>
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
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Thu, 19 Sep 2019 07:13:07 +0000 (UTC)

Cgo+IC0tLS0t08q8/tStvP4tLS0tLQo+ILeivP7IyzogU3RldmUgR3J1YmIgW21haWx0bzpzZ3J1
YmJAcmVkaGF0LmNvbV0KPiC3osvNyrG85DogMjAxOcTqOdTCMTnI1SAxMDozNAo+IMrVvP7Iyzog
TGksUm9uZ3FpbmcgPGxpcm9uZ3FpbmdAYmFpZHUuY29tPgo+ILOty806IFBhdWwgTW9vcmUgPHBh
dWxAcGF1bC1tb29yZS5jb20+OyBsaW51eC1hdWRpdEByZWRoYXQuY29tCj4g1vfM4jogUmU6IFtQ
QVRDSF1bUkZDXSBhdWRpdDogc2V0IHdhaXQgdGltZSB0byB6ZXJvIHdoZW4gYXVkaXQgZmFpbGVk
Cj4gCj4gT24gVGh1LCAxOSBTZXAgMjAxOSAwMTo1MDowNSArMDAwMAo+ICJMaSxSb25ncWluZyIg
PGxpcm9uZ3FpbmdAYmFpZHUuY29tPiB3cm90ZToKPiAKPiA+IE5vIG5lZWQga25vYnMsIGF1ZGl0
Y3RsIGNhbiBjaGFuZ2UgdGhlIGJhY2tsb2cgbGVuZ3RoIGFuZCB3YWl0IHRpbWUuCj4gPiBBbmQg
aXQgaXMgaGVscGxlc3MgdG8gY2hhbmdlIHRoZSBiYWNrbG9nIGxlbmd0aCBpZiBhdWRpdGQgaXMg
aHVuZwo+ID4gZm9yZXZlciwgYXMgYSB0YXNrIGNhbiBiZSBodW5nIGZvcmV2ZXIgZHVlIHRvIGRp
c2svZmlsZXN5c3RlbSdzCj4gPiBhYm5vcm1hbCwgZXRjCj4gPgo+ID4gSSBhbSBzYXlpbmcgdGhl
IGF1ZGl0IGRlZmF1bHQgYmVoYXZpb3JzIHdoaWNoIGlzIGNoYW5nZWQsIEkgdHJ1bHkgbWVldAo+
ID4gdGhlIGlzc3VlIGFzIGRlc2NyaXB0aW9uIG9mIHRoZSBiZWxvdyBjb21taXQsIGlmIHdlIGNh
biBtYWtlIGNoYW5nZSwKPiA+IG90aGVyIGNhbiBhdm9pZCB0aGlzIGlzc3VlLgo+IAo+IEknZCBs
aWtlIHRvIG9mZmVyIGFuIG9waW5pb24gYmVjYXVzZSB0aGlzIGEgbG9uZyB0ZXJtIGlzc3VlIHRo
YXQgd2UgaGF2ZSBmYWNlZAo+IGFuZCB3aGF0IGV4aXN0cyBpcyB0aGUgcmVzdWx0IG9mIGhhdmlu
ZyB0byBtZWV0IGNlcnRhaW4gcmVxdWlyZW1lbnRzLgo+IAo+IElmIHRoZSBtYWNoaW5lIGJvb3Rz
IHdpdGggYXVkaXQ9MCwgd2hpY2ggSSB0aGluayBpcyBkZWZhdWx0LCB0aGVuIHRoZSBlbmQgdXNl
cgo+IGhhcyBubyBleHBlY3RhdGlvbiBvZiBhdWRpdCBldmVyIGJlaW5nIGluIHVzZS4gQXVkaXQg
ZXZlbnRzIG1heSBiZSBkaXNjYXJkZWQgaWYKPiB0aGUgYmFja2xvZyBmaWxscyB1cC4KPiAKPiBJ
ZiBob3dldmVyIHRoZSBtYWNoaW5lIGJvb3RzIHdpdGggYXVkaXQ9MSwgdGhlbiB0aGUgdXNlciBp
cyBleHBlY3RpbmcgdGhhdAo+IHRoZXJlIHdpbGwgZXZlbnR1YWxseSBiZSBhbiBhdWRpdCBkYWVt
b24gYW5kIHRoZXkgd2FudCBhbGwgZXZlbnRzLgo+IEFsbCBvZiB0aGVtIHdpdGhvdXQgZmFpbC4g
U28sIHdlIGhhdmUgdG8gdGFrZSBhbGwgbWVhc3VyZXMgdG8gZGVsaXZlciB0aG9zZQo+IGV2ZW50
cyBiZWNhdXNlIHRoaXMgaXMgcmVxdWlyZWQgYnkgY29tbW9uIGNyaXRlcmlhIGFzIHdlbGwgYXMg
b3RoZXIgc2VjdXJpdHkKPiBzdGFuZGFyZHMgc3VjaCBhcyBQQ0ktRFNTLgo+IAoKT2ssIEkgc2Vl
CgpUaGFua3MKCi1Sb25nUWluZwoKCj4gU28sIHRoZXJlIGFyZSAyIHBhdGhzLiBPbmUgd2hpY2gg
ZG9lcyBub3QgY2FyZSBhYm91dCBhdWRpdCBhbmQgb25lIHRoYXQgZG9lcy4KPiBUaGUgb3JpZ2lu
YWwgYmVoYXZpb3IgZGlkIG5vdCBtZWV0IHJlcXVpcmVtZW50cy4gSWYgdGhlcmUgaXMgYW55IHBh
dGNoIHRoYXQgZml4ZXMKPiB0aGlzLCBpdCB3b3VsZCBiZSB0byBub3QgaGF2ZSBhbiBhdWRpdCBi
YWNrbG9nIHdhaXQgdGltZSBpZiBhdWRpdCBoYXMgbmV2ZXIgYmVlbgo+IGVuYWJsZWQuIFdlIGhh
dmUgdG8gYmUgY2FyZWZ1bCB0byBjb25zaWRlciBhdWRpdCBuZXZlciBlbmFibGVkLCBhdWRpdCBk
aXNhYmxlZAo+IGJ1dCBwcmV2aW91c2x5IGVuYWJsZWQsIGFuZCBhdWRpdCBlbmFibGVkLgo+IAo+
IEhUSC4uLgo+IAo+IC1TdGV2ZQoKLS0KTGludXgtYXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1
ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWF1ZGl0
