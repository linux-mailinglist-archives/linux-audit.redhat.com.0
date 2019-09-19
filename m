Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 878A5B7139
	for <lists+linux-audit@lfdr.de>; Thu, 19 Sep 2019 03:50:27 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CD5864E4E6;
	Thu, 19 Sep 2019 01:50:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B7DC600C8;
	Thu, 19 Sep 2019 01:50:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 45CBC1803B37;
	Thu, 19 Sep 2019 01:50:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8J1oEb6012232 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 18 Sep 2019 21:50:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C7F035C22F; Thu, 19 Sep 2019 01:50:14 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx28.extmail.prod.ext.phx2.redhat.com
	[10.5.110.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 35CF55C226;
	Thu, 19 Sep 2019 01:50:12 +0000 (UTC)
Received: from baidu.com (mx21.baidu.com [220.181.3.85])
	by mx1.redhat.com (Postfix) with ESMTP id C83A58A1C87;
	Thu, 19 Sep 2019 01:50:08 +0000 (UTC)
Received: from BC-Mail-Ex14.internal.baidu.com (unknown [172.31.51.54])
	by Forcepoint Email with ESMTPS id DE65EBF739A14;
	Thu, 19 Sep 2019 09:50:03 +0800 (CST)
Received: from BJHW-Mail-Ex13.internal.baidu.com (10.127.64.36) by
	BC-Mail-Ex14.internal.baidu.com (172.31.51.54) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1531.3; Thu, 19 Sep 2019 09:50:05 +0800
Received: from BJHW-Mail-Ex13.internal.baidu.com ([100.100.100.36]) by
	BJHW-Mail-Ex13.internal.baidu.com ([100.100.100.36]) with mapi id
	15.01.1713.004; Thu, 19 Sep 2019 09:50:05 +0800
From: "Li,Rongqing" <lirongqing@baidu.com>
To: Paul Moore <paul@paul-moore.com>
Subject: =?utf-8?B?562U5aSNOiBbUEFUQ0hdW1JGQ10gYXVkaXQ6IHNldCB3YWl0IHRpbWUgdG8g?=
	=?utf-8?Q?zero_when_audit_failed?=
Thread-Topic: [PATCH][RFC] audit: set wait time to zero when audit failed
Thread-Index: AQHVaWpIwZPuSgS+uUKlaAzCHP+Gd6ctnETAgADNj4CAAKk2MIAArPYAgADmB1CAADi7AIABYr8w
Date: Thu, 19 Sep 2019 01:50:05 +0000
Message-ID: <6fc9ae05851842ca9ea2cc2b01dccc4c@baidu.com>
References: <1568258385-10643-1-git-send-email-lirongqing@baidu.com>
	<CAHC9VhRXj2UpdijxpKgMROfNu9tETpXpHdboPqP=HvVF-GuBVQ@mail.gmail.com>
	<f0efb280c80342049d4c43c9acb42676@baidu.com>
	<CAHC9VhR79o8aSkORj0fU2XKfLUBipRtTO+xUHPAd+StfpzAV-g@mail.gmail.com>
	<fe43dc199f3949709828e1d96edf7556@baidu.com>
	<CAHC9VhTSBvZr0jFARoFQ2dBxQR6rsDxY6uOLaF35e9BVhNEvaA@mail.gmail.com>
	<dbfc8ea5cdc3413e829eb864430ed7dc@baidu.com>
	<CAHC9VhRQKcS2E-WwMoJ_GntXY6cKTCvaykRBF_FXG4ggvAiHLA@mail.gmail.com>
In-Reply-To: <CAHC9VhRQKcS2E-WwMoJ_GntXY6cKTCvaykRBF_FXG4ggvAiHLA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.198.17]
x-baidu-bdmsfe-datecheck: 1_BC-Mail-Ex14_2019-09-19 09:50:05:975
x-baidu-bdmsfe-viruscheck: BC-Mail-Ex14_GRAY_Inside_WithoutAtta_2019-09-19
	09:50:05:959
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.69]); Thu, 19 Sep 2019 01:50:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.69]);
	Thu, 19 Sep 2019 01:50:11 +0000 (UTC) for IP:'220.181.3.85'
	DOMAIN:'mx21.baidu.com' HELO:'baidu.com'
	FROM:'lirongqing@baidu.com' RCPT:''
X-RedHat-Spam-Score: -0.702  (RCVD_IN_DNSWL_LOW, SPF_HELO_PASS,
	SPF_PASS) 220.181.3.85 mx21.baidu.com 220.181.3.85
	mx21.baidu.com <lirongqing@baidu.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.69
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x8J1oEb6012232
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Thu, 19 Sep 2019 01:50:26 +0000 (UTC)

Cgo+IC0tLS0t6YKu5Lu25Y6f5Lu2LS0tLS0KPiDlj5Hku7bkuro6IFBhdWwgTW9vcmUgW21haWx0
bzpwYXVsQHBhdWwtbW9vcmUuY29tXQo+IOWPkemAgeaXtumXtDogMjAxOeW5tDnmnIgxOOaXpSAy
MDoyMwo+IOaUtuS7tuS6ujogTGksUm9uZ3FpbmcgPGxpcm9uZ3FpbmdAYmFpZHUuY29tPgo+IOaK
hOmAgTogRXJpYyBQYXJpcyA8ZXBhcmlzQHJlZGhhdC5jb20+OyBsaW51eC1hdWRpdEByZWRoYXQu
Y29tCj4g5Li76aKYOiBSZTogW1BBVENIXVtSRkNdIGF1ZGl0OiBzZXQgd2FpdCB0aW1lIHRvIHpl
cm8gd2hlbiBhdWRpdCBmYWlsZWQKPiAKPiBPbiBUdWUsIFNlcCAxNywgMjAxOSBhdCA5OjA3IFBN
IExpLFJvbmdxaW5nIDxsaXJvbmdxaW5nQGJhaWR1LmNvbT4gd3JvdGU6Cj4gPiA+IC0tLS0t6YKu
5Lu25Y6f5Lu2LS0tLS0KPiA+ID4g5Y+R5Lu25Lq6OiBQYXVsIE1vb3JlIFttYWlsdG86cGF1bEBw
YXVsLW1vb3JlLmNvbV0KPiA+ID4g5Y+R6YCB5pe26Ze0OiAyMDE55bm0OeaciDE45pelIDM6MTcK
PiA+ID4g5pS25Lu25Lq6OiBMaSxSb25ncWluZyA8bGlyb25ncWluZ0BiYWlkdS5jb20+Cj4gPiA+
IOaKhOmAgTogRXJpYyBQYXJpcyA8ZXBhcmlzQHJlZGhhdC5jb20+OyBsaW51eC1hdWRpdEByZWRo
YXQuY29tCj4gPiA+IOS4u+mimDogUmU6IFtQQVRDSF1bUkZDXSBhdWRpdDogc2V0IHdhaXQgdGlt
ZSB0byB6ZXJvIHdoZW4gYXVkaXQgZmFpbGVkCj4gPiA+Cj4gPiA+IE9uIE1vbiwgU2VwIDE2LCAy
MDE5IGF0IDk6MDggUE0gTGksUm9uZ3FpbmcgPGxpcm9uZ3FpbmdAYmFpZHUuY29tPgo+IHdyb3Rl
Ogo+ID4gPiA+ID4gLS0tLS3pgq7ku7bljp/ku7YtLS0tLQo+ID4gPiA+ID4g5Y+R5Lu25Lq6OiBQ
YXVsIE1vb3JlIFttYWlsdG86cGF1bEBwYXVsLW1vb3JlLmNvbV0KPiA+ID4gPiA+IOWPkemAgeaX
tumXtDogMjAxOeW5tDnmnIgxN+aXpSA2OjUyCj4gPiA+ID4gPiDmlLbku7bkuro6IExpLFJvbmdx
aW5nIDxsaXJvbmdxaW5nQGJhaWR1LmNvbT4KPiA+ID4gPiA+IOaKhOmAgTogRXJpYyBQYXJpcyA8
ZXBhcmlzQHJlZGhhdC5jb20+OyBsaW51eC1hdWRpdEByZWRoYXQuY29tCj4gPiA+ID4gPiDkuLvp
opg6IFJlOiBbUEFUQ0hdW1JGQ10gYXVkaXQ6IHNldCB3YWl0IHRpbWUgdG8gemVybyB3aGVuIGF1
ZGl0Cj4gPiA+ID4gPiBmYWlsZWQKPiAKPiAuLi4KPiAKPiA+ID4gPiBJIGp1c3Qgd2FudCB0byBp
dCBhcyBiZWZvcmUgMzE5NzU0MjQ4MmRmICgiYXVkaXQ6IHJld29yawo+ID4gPiA+IGF1ZGl0X2xv
Z19zdGFydCgpIiksIHdhaXQgNjAgc2Vjb25kcyBvbmNlIGlmCj4gPiA+ID4gYXVkaXRkL3JlYWRh
aGVhYWQtY29sbGVjdG9yIGhhdmUgc29tZSBwcm9ibGVtIHRvIGRyYWluIHRoZSBhdWRpdAo+IGJh
Y2tsb2cuCj4gPiA+Cj4gPiA+IFRoZSBwYXRjaCB5b3UgbWVudGlvbiBmaXhlZCB3aGF0IHdhcyBk
ZWVtZWQgdG8gYmUgYnVnZ3kgYmVoYXZpb3I7IGFzCj4gPiA+IG1lbnRpb25lZCBwcmV2aW91c2x5
IGluIHRoaXMgdGhyZWFkIEkgc2VlIG5vIGdvb2QgcmVhc29uIHRvIGdvIGJhY2sKPiA+ID4gdG8g
dGhlIG9sZCBiZWhhdmlvci4KPiA+ID4KPiA+ID4gPiA+IElmIHlvdSBhcmUgbm90IHVzaW5nIGF1
ZGl0LCB5b3UgY2FuIGFsd2F5cyBkaXNhYmxlIGl0IHZpYSB0aGUKPiA+ID4gPiA+IGtlcm5lbCBj
b21tYW5kIGxpbmUsIG9yIGF0IHJ1bnRpbWUgKGxvb2sgYXQgd2hhdCBGZWRvcmEgZG9lcykuCj4g
PiA+ID4gPgo+ID4gPiA+ID4gPiA+IFlvdSBtaWdodCBhbHNvIHdhbnQgdG8gaW52ZXN0aWdhdGUg
d2hhdCBpcyBnZW5lcmF0aW5nIHNvbWUKPiA+ID4gPiA+ID4gPiBtYW55IGF1ZGl0IHJlY29yZHMg
cHJpb3IgdG8gc3RhcnRpbmcgdGhlIGF1ZGl0IGRhZW1vbi4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gSXQgaXMgL3NiaW4vcmVhZGFoZWFkLWNvbGxlY3RvciwgaW4gZmFjdCwgd2Ugc3RvcCB0aGUg
YXVkaXRkOwo+ID4gPiA+ID4gPiBXZSBhcmUgZG9pbmcgYQo+ID4gPiA+ID4gcmVib290IHRlc3Qs
IHdoaWNoIHJlYm9vdGluZyBtYWNoaW5lIGNvbnRpbnVlIHRvIHRlc3QKPiBoYXJkd2FyZS9zb2Z0
d2FyZS4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gaXQgaXMgc2FtZSBhcyBiZWxvdzoKPiA+ID4g
PiA+ID4gYXVkaXRjdGwgLWEgYWx3YXlzLGV4aXQgLVMgYWxsIC1GIHBpZD0neHh4Jwo+ID4gPiA+
ID4gPiBraWxsIC1zIDE5IGBwaWRvZiBhdWRpdGRgCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IHRo
ZW4gdGhlIGF1ZGl0ZWQgdGFzayB3aWxsIGJlIGh1bmcKPiA+ID4gPiA+Cj4gPiA+ID4gPiBTbyB5
b3UgYXJlIHNlZWluZyB0aGlzIHByb2JsZW0gb25seSB3aGVuIHlvdSBydW4gYSB0ZXN0LCBvciBk
aWQKPiA+ID4gPiA+IHlvdSBwcm92aWRlIHRoaXMgYXMgYSByZXByb2R1Y2VyPwo+ID4gPiA+Cj4g
PiA+ID4gYXVkaXRjdGwgLWEgYWx3YXlzLGV4aXQgLVMgYWxsIC1GIHBwaWQ9YHBpZG9mIHNzaGRg
IGtpbGwgLXMgMTkKPiA+ID4gPiBgcGlkb2YgYXVkaXRkYCBzc2ggcm9vdEAxMjcuMC4wLjEKPiA+
ID4gPgo+ID4gPiA+IHRoZW4gc3NoIHdpbGwgYmUgaHVuZyBmb3JldmVyCj4gPiA+Cj4gPiA+IFRo
YXQgaXMgZXhwZWN0ZWQgYmVoYXZpb3IuICBZb3UgYXJlIHB1dHRpbmcgYSBtYXNzaXZlIGF1ZGl0
IGxvYWQgb24KPiA+ID4gdGhlIHN5c3RlbSBieSB0ZWxsaW5nIHRoZSBrZXJuZWwgdG8gYXVkaXQg
ZXZlcnkgc3lzY2FsbCB0aGF0IHNzaGQKPiA+ID4gbWFrZXMsIHRoZW4geW91IGFyZSBpbnRlbnRp
b25hbGx5IGtpbGxpbmcgdGhlIGF1ZGl0IGRhZW1vbiBhbmQgYXR0ZW1wdGluZwo+IHRvIHNzaCBp
bnRvIHRoZSBzeXN0ZW0uCj4gPiA+IFRoZSBwcm9wZXIgZml4KGVzKSBoZXJlIHdvdWxkIGJlIHRv
IDEpIHNldCByZWFzb25hYmxlIGF1ZGl0IHJ1bGVzCj4gPiA+IGFuZC9vciAyKSB1c2UgYW4gaW5p
dCBzeXN0ZW0gdGhhdCBtb25pdG9ycyBhbmQgcmVzdGFydHMgYXVkaXRkIHdoZW4KPiA+ID4gaXQg
ZmFpbHMgKHN5c3RlbWQgaGFzIHRoaXMgY2FwYWJpbGl0eSwgSSBiZWxpZXZlIHNvbWUgb3RoZXJz
IGRvIGFzIHdlbGwpLgo+ID4KPiA+IEJvdGggYXJlIG5vdCB3b3JraW5nLgo+ID4gVGhlIGF1ZGl0
ZCBpcyBub3QgZGVhZCwgaXQgaXMgaW4gc3RvcCBzdGF0dXMoa2lsbCAtcyAxOSkuIFNvIHN5c3Rl
bWQvaW5pdCB3aWxsIG5vdAo+IHJlc3RhcnQgaXQuCj4gPiBFdmVuIGlmIHdpdGggbGl0dGxlIGF1
ZGl0IHJ1bGVzLCBhZnRlciBtdWx0aXBsZSBhY2Nlc3NlcywgdGhlIGJhY2tsb2cKPiA+IHdpbGwg
ZnVsbCBkdWUgdG8gbm8gcmVjZWl2ZXIKPiAKPiBGYWlyIHBvaW50LCBob3dldmVyIEkgc3RpbGwg
c3RhbmQgYnkgbXkgcHJldmlvdXMgY29tbWVudHMgdGhhdCB0aGVyZSBhcmUKPiBydW50aW1lIGNv
bmZpZ3VyYXRpb24ga25vYnMgd2hpY2ggY2FuIG1pdGlnYXRlIHRoaXMgcHJvYmxlbSBpZiBpdCBp
cyBzb21ldGhpbmcKPiB5b3UgYXJlIGNvbmNlcm5lZCBhYm91dC4gIERlcGVuZGluZyBvbiB0aGUg
c2l0dWF0aW9uLCB5b3UgY2FuIGVpdGhlciBpbmNyZWFzZQo+IHRoZSBiYWNrbG9nIHRvIGRlYWwg
d2l0aCB0cmFuc2llbnQgcHJvYmxlbXMsIG9yIGRlY3JlYXNlIHRoZSBiYWNrbG9nIHdhaXQgdGlt
ZQo+IChwb3NzaWJseSB0byB6ZXJvKSB0byBwcmV2ZW50IGJsb2NraW5nIGVudGlyZWx5Lgo+IAoK
Tm8gbmVlZCBrbm9icywgYXVkaXRjdGwgY2FuIGNoYW5nZSB0aGUgYmFja2xvZyBsZW5ndGggYW5k
IHdhaXQgdGltZS4gQW5kIGl0IGlzIGhlbHBsZXNzIHRvIGNoYW5nZSB0aGUgYmFja2xvZyBsZW5n
dGggaWYgYXVkaXRkIGlzIGh1bmcgZm9yZXZlciwgYXMgYSB0YXNrIGNhbiBiZSBodW5nIGZvcmV2
ZXIgZHVlIHRvIGRpc2svZmlsZXN5c3RlbSdzIGFibm9ybWFsLCBldGMKCkkgYW0gc2F5aW5nIHRo
ZSBhdWRpdCBkZWZhdWx0IGJlaGF2aW9ycyB3aGljaCBpcyBjaGFuZ2VkLCBJIHRydWx5IG1lZXQg
dGhlIGlzc3VlIGFzIGRlc2NyaXB0aW9uIG9mIHRoZSBiZWxvdyBjb21taXQsIGlmIHdlIGNhbiBt
YWtlIGNoYW5nZSwgb3RoZXIgY2FuIGF2b2lkIHRoaXMgaXNzdWUuCgpjb21taXQgYWM0Y2VjNDQz
YTgwYmZkZTgyOTUxNmU3YTdkYjEwZjczMjVhYTUyOApBdXRob3I6IERhdmlkIFdvb2Rob3VzZSA8
ZHdtdzJAc2hpbnlib29rLmluZnJhZGVhZC5vcmc+CkRhdGU6ICAgU2F0IEp1bCAyIDE0OjA4OjQ4
IDIwMDUgKzAxMDAKCiAgICBBVURJVDogU3RvcCB3YWl0aW5nIGZvciBiYWNrbG9nIGFmdGVyIGF1
ZGl0X3BhbmljKCkgaGFwcGVucwogICAgCiAgICBXZSBmb3JjZSBhIHJhdGUtbGltaXQgb24gYXVk
aXRhYmxlIGV2ZW50cyBieSBtYWtpbmcgdGhlbSB3YWl0IGZvciBzcGFjZQogICAgb24gdGhlIGJh
Y2tsb2cgcXVldWUuIEhvd2V2ZXIsIGlmIGF1ZGl0ZCByZWFsbHkgaXMgQVdPTCB0aGVuIHRoaXMg
Y291bGQKICAgIHBvdGVudGlhbGx5IGJyaW5nIHRoZSBlbnRpcmUgc3lzdGVtIHRvIGEgaGFsdCwg
ZGVwZW5kaW5nIG9uIHRoZSBhdWRpdAogICAgcnVsZXMgaW4gZWZmZWN0LgoKCk90aGVyIG1ldGhv
ZCB0byBhdm9pZCB0aGlzIGlzc3VlIHRvIG1ha2UgYXVkaXRfYmFja2xvZ193YWl0X3RpbWUgYXMg
MCBieSBkZWZhdWx0CgpkaWZmIC0tZ2l0IGEva2VybmVsL2F1ZGl0LmMgYi9rZXJuZWwvYXVkaXQu
YwppbmRleCBkYThkYzBkYjViZDMuLjBhN2Y3YzI5MDY0NCAxMDA2NDQKLS0tIGEva2VybmVsL2F1
ZGl0LmMKKysrIGIva2VybmVsL2F1ZGl0LmMKQEAgLTExOSw3ICsxMTksNyBAQCBzdGF0aWMgdTMy
ICBhdWRpdF9yYXRlX2xpbWl0OwogICogV2hlbiBzZXQgdG8gemVybywgdGhpcyBtZWFucyB1bmxp
bWl0ZWQuICovCiBzdGF0aWMgdTMyICAgICBhdWRpdF9iYWNrbG9nX2xpbWl0ID0gNjQ7CiAjZGVm
aW5lIEFVRElUX0JBQ0tMT0dfV0FJVF9USU1FICg2MCAqIEhaKQotc3RhdGljIHUzMiAgICAgYXVk
aXRfYmFja2xvZ193YWl0X3RpbWUgPSBBVURJVF9CQUNLTE9HX1dBSVRfVElNRTsKK3N0YXRpYyB1
MzIgICAgIGF1ZGl0X2JhY2tsb2dfd2FpdF90aW1lID0gMDsKIAogLyogVGhlIGlkZW50aXR5IG9m
IHRoZSB1c2VyIHNodXR0aW5nIGRvd24gdGhlIGF1ZGl0IHN5c3RlbS4gKi8KIGt1aWRfdCAgICAg
ICAgIGF1ZGl0X3NpZ191aWQgPSBJTlZBTElEX1VJRDsKCgotUm9uZ1FpbmcKCgo+IC0tCj4gcGF1
bCBtb29yZQo+IHd3dy5wYXVsLW1vb3JlLmNvbQoKLS0KTGludXgtYXVkaXQgbWFpbGluZyBsaXN0
CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWF1ZGl0
