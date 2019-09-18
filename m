Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2E3B592F
	for <lists+linux-audit@lfdr.de>; Wed, 18 Sep 2019 03:09:01 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7C2A18553D;
	Wed, 18 Sep 2019 01:08:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E2BF460C05;
	Wed, 18 Sep 2019 01:08:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BD4D84EE68;
	Wed, 18 Sep 2019 01:08:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8I17duF017725 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 17 Sep 2019 21:07:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3ACD41001B23; Wed, 18 Sep 2019 01:07:39 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE93810018FF;
	Wed, 18 Sep 2019 01:07:36 +0000 (UTC)
Received: from baidu.com (mx21.baidu.com [220.181.3.85])
	by mx1.redhat.com (Postfix) with ESMTP id 151478553D;
	Wed, 18 Sep 2019 01:07:34 +0000 (UTC)
Received: from BC-Mail-Ex14.internal.baidu.com (unknown [172.31.51.54])
	by Forcepoint Email with ESMTPS id D785DC8C8B1CC;
	Wed, 18 Sep 2019 09:07:27 +0800 (CST)
Received: from BJHW-Mail-Ex13.internal.baidu.com (10.127.64.36) by
	BC-Mail-Ex14.internal.baidu.com (172.31.51.54) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1531.3; Wed, 18 Sep 2019 09:07:29 +0800
Received: from BJHW-Mail-Ex13.internal.baidu.com ([100.100.100.36]) by
	BJHW-Mail-Ex13.internal.baidu.com ([100.100.100.36]) with mapi id
	15.01.1713.004; Wed, 18 Sep 2019 09:07:29 +0800
From: "Li,Rongqing" <lirongqing@baidu.com>
To: Paul Moore <paul@paul-moore.com>
Subject: =?utf-8?B?562U5aSNOiBbUEFUQ0hdW1JGQ10gYXVkaXQ6IHNldCB3YWl0IHRpbWUgdG8g?=
	=?utf-8?Q?zero_when_audit_failed?=
Thread-Topic: [PATCH][RFC] audit: set wait time to zero when audit failed
Thread-Index: AQHVaWpIwZPuSgS+uUKlaAzCHP+Gd6ctnETAgADNj4CAAKk2MIAArPYAgADmB1A=
Date: Wed, 18 Sep 2019 01:07:28 +0000
Message-ID: <dbfc8ea5cdc3413e829eb864430ed7dc@baidu.com>
References: <1568258385-10643-1-git-send-email-lirongqing@baidu.com>
	<CAHC9VhRXj2UpdijxpKgMROfNu9tETpXpHdboPqP=HvVF-GuBVQ@mail.gmail.com>
	<f0efb280c80342049d4c43c9acb42676@baidu.com>
	<CAHC9VhR79o8aSkORj0fU2XKfLUBipRtTO+xUHPAd+StfpzAV-g@mail.gmail.com>
	<fe43dc199f3949709828e1d96edf7556@baidu.com>
	<CAHC9VhTSBvZr0jFARoFQ2dBxQR6rsDxY6uOLaF35e9BVhNEvaA@mail.gmail.com>
In-Reply-To: <CAHC9VhTSBvZr0jFARoFQ2dBxQR6rsDxY6uOLaF35e9BVhNEvaA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.198.3]
x-baidu-bdmsfe-datecheck: 1_BC-Mail-Ex14_2019-09-18 09:07:29:290
x-baidu-bdmsfe-viruscheck: BC-Mail-Ex14_GRAY_Inside_WithoutAtta_2019-09-18
	09:07:29:274
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.28]); Wed, 18 Sep 2019 01:07:35 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Wed, 18 Sep 2019 01:07:35 +0000 (UTC) for IP:'220.181.3.85'
	DOMAIN:'mx21.baidu.com' HELO:'baidu.com'
	FROM:'lirongqing@baidu.com' RCPT:''
X-RedHat-Spam-Score: -0.702  (RCVD_IN_DNSWL_LOW, SPF_HELO_PASS,
	SPF_PASS) 220.181.3.85 mx21.baidu.com 220.181.3.85
	mx21.baidu.com <lirongqing@baidu.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x8I17duF017725
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Wed, 18 Sep 2019 01:09:00 +0000 (UTC)

Cgo+IC0tLS0t6YKu5Lu25Y6f5Lu2LS0tLS0KPiDlj5Hku7bkuro6IFBhdWwgTW9vcmUgW21haWx0
bzpwYXVsQHBhdWwtbW9vcmUuY29tXQo+IOWPkemAgeaXtumXtDogMjAxOeW5tDnmnIgxOOaXpSAz
OjE3Cj4g5pS25Lu25Lq6OiBMaSxSb25ncWluZyA8bGlyb25ncWluZ0BiYWlkdS5jb20+Cj4g5oqE
6YCBOiBFcmljIFBhcmlzIDxlcGFyaXNAcmVkaGF0LmNvbT47IGxpbnV4LWF1ZGl0QHJlZGhhdC5j
b20KPiDkuLvpopg6IFJlOiBbUEFUQ0hdW1JGQ10gYXVkaXQ6IHNldCB3YWl0IHRpbWUgdG8gemVy
byB3aGVuIGF1ZGl0IGZhaWxlZAo+IAo+IE9uIE1vbiwgU2VwIDE2LCAyMDE5IGF0IDk6MDggUE0g
TGksUm9uZ3FpbmcgPGxpcm9uZ3FpbmdAYmFpZHUuY29tPiB3cm90ZToKPiA+ID4gLS0tLS3pgq7k
u7bljp/ku7YtLS0tLQo+ID4gPiDlj5Hku7bkuro6IFBhdWwgTW9vcmUgW21haWx0bzpwYXVsQHBh
dWwtbW9vcmUuY29tXQo+ID4gPiDlj5HpgIHml7bpl7Q6IDIwMTnlubQ55pyIMTfml6UgNjo1Mgo+
ID4gPiDmlLbku7bkuro6IExpLFJvbmdxaW5nIDxsaXJvbmdxaW5nQGJhaWR1LmNvbT4KPiA+ID4g
5oqE6YCBOiBFcmljIFBhcmlzIDxlcGFyaXNAcmVkaGF0LmNvbT47IGxpbnV4LWF1ZGl0QHJlZGhh
dC5jb20KPiA+ID4g5Li76aKYOiBSZTogW1BBVENIXVtSRkNdIGF1ZGl0OiBzZXQgd2FpdCB0aW1l
IHRvIHplcm8gd2hlbiBhdWRpdCBmYWlsZWQKPiA+ID4KPiA+ID4gT24gU3VuLCBTZXAgMTUsIDIw
MTkgYXQgMTA6NTUgUE0gTGksUm9uZ3FpbmcgPGxpcm9uZ3FpbmdAYmFpZHUuY29tPgo+IHdyb3Rl
Ogo+ID4gPiA+ID4gPiBpZiBhdWRpdF9sb2dfc3RhcnQgZmFpbGVkIGJlY2F1c2UgcXVldWUgaXMg
ZnVsbCwga2F1ZGl0ZCBpcwo+ID4gPiA+ID4gPiB3YWl0aW5nIHRoZSByZWNlaXZpbmcgcXVldWUg
ZW1wdHksIGJ1dCBubyByZWNlaXZlciwgYSB0YXNrCj4gPiA+ID4gPiA+IHdpbGwgYmUgZm9yY2Vk
IHRvIHdhaXQgNjAgc2Vjb25kcyBmb3IgZWFjaCBhdWRpdGVkIHN5c2NhbGwsCj4gPiA+ID4gPiA+
IGFuZCBpdCB3aWxsIGJlIGhhbmcgZm9yIGEgdmVyeSBsb25nIHRpbWUKPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gc28gYXQgdGhpcyBjb25kaXRpb24sIHNldCB0aGUgd2FpdCB0aW1lIHRvIHplcm8g
dG8gcmVkdWNlCj4gPiA+ID4gPiA+IHdhaXQsIGFuZCByZXN0b3JlIHdhaXQgdGltZSB3aGVuIGF1
ZGl0IHdvcmtzIGFnYWluCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IGl0IHBhcnRpYWxseSByZXN0
b3JlIHRoZSBjb21taXQgMzE5NzU0MjQ4MmRmICgiYXVkaXQ6IHJld29yawo+ID4gPiA+ID4gPiBh
dWRpdF9sb2dfc3RhcnQoKSIpCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6
IExpIFJvbmdRaW5nIDxsaXJvbmdxaW5nQGJhaWR1LmNvbT4KPiA+ID4gPiA+ID4gU2lnbmVkLW9m
Zi1ieTogTGlhbmcgWmhpQ2hlbmcgPGxpYW5nemhpY2hlbmdAYmFpZHUuY29tPgo+ID4gPiA+ID4g
PiAtLS0KPiA+ID4gPiA+ID4gcmVib290IGlzIHRha2luZyBhIHZlcnkgbG9uZyB0aW1lIG9uIG15
IG1hY2hpbmUoY2VudG9zIDZ1NAo+ID4gPiA+ID4gPiAra2VybmVsCj4gPiA+ID4gPiA+IDUuMykg
c2luY2UgVElGX1NZU0NBTExfQVVESVQgaXMgc2V0IGJ5IGRlZmF1bHQsIGFuZCB3aGVuCj4gPiA+
ID4gPiA+IHJlYm9vdCwgdXNlcnNwYWNlIHByb2Nlc3Mgd2hpY2ggcmVjZWl2ZXIgYXVkaXQgbWVz
c2FnZSAsIHdpbGwKPiA+ID4gPiA+ID4gYmUga2lsbGVkLCBhbmQgbGVhZCB0byB0aGF0IG5vIHVz
ZXIgZHJhaW4gdGhlIGF1ZGl0IHF1ZXVlCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IGdpdCBiaXRz
ZWN0IHNob3cgaXQgaXMgY2F1c2VkIGJ5IDMxOTc1NDI0ODJkZiAoImF1ZGl0OiByZXdvcmsKPiA+
ID4gPiA+ID4gYXVkaXRfbG9nX3N0YXJ0KCkiKQo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiAga2Vy
bmVsL2F1ZGl0LmMgfCA5ICsrKysrKystLQo+ID4gPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDcg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGlzIGlz
IHR5cGljYWxseSBzb2x2ZWQgYnkgaW5jcmVhc2luZyB0aGUgYmFja2xvZyB1c2luZyB0aGUKPiA+
ID4gImF1ZGl0X2JhY2tsb2dfbGltaXQiCj4gPiA+ID4gPiBrZXJuZWwgcGFyYW1ldGVyIChsaW5r
IHRvIHRoZSBkb2NzIGJlbG93KS4KPiA+ID4gPgo+ID4gPiA+IEl0IHNob3VsZCBiZSBhYmxlIHRv
IGF2b2lkIG15IGlzc3VlLCBidXQgdGhlIGRlZmF1bHQgYmVoYXZpb3JzCj4gPiA+ID4gZG9lcyBu
b3QKPiA+ID4gd29ya2luZyBmb3IgbWU7IEFuZCBub3QgYWxsIGhhdmUgZW5vdWdoIGtub3dsZWRn
ZSBhYm91dCBhdWRpdCwgd2hvCj4gPiA+IG1heWJlIHNwZW5kIGxvdHMgb2YgZWZmb3J0IHRvIGZp
bmQgdGhlIHJvb3QgY2F1c2UsIGFuZCBlc3RpbWF0ZSBob3cKPiA+ID4gbGFyZ2Ugc2hvdWxkIGJl
ICJhdWRpdF9iYWNrbG9nX2xpbWl0Igo+ID4gPgo+ID4gPiBUaGUgcGF1c2Uvc2xlZXAgYmVoYXZp
b3IgaXMgZGVzaXJlZCBiZWhhdmlvciBhbmQgaXMgaW50ZW5kZWQgdG8gaGVscAo+ID4gPiBrYXVk
aXRkL2F1ZGl0ZCBwcm9jZXNzIHRoZSBhdWRpdCBiYWNrbG9nIG9uIGEgYnVzeSBzeXN0ZW0uICBJ
ZiB3ZQo+ID4gPiBkaWRuJ3Qgc2xlZXAgdGhlIGN1cnJlbnQgcHJvY2VzcyBhbmQgZ2l2ZSBrYXVk
aXRkL2F1ZGl0ZCBhIGNoYW5jZSB0bwo+ID4gPiBmbHVzaCB0aGUgYmFja2xvZyB3aGVuIGl0IHdh
cyBmdWxsLCBhIGxvdCBvZiBiYWQgdGhpbmdzIGNvdWxkIGhhcHBlbgo+ID4gPiB3aXRoIHJlc3Bl
Y3QgdG8gYXVkaXQuICBXZSBnZW5lcmFsbHkgc2VsZWN0IHRoZSBiYWNrbG9nIGxpbWl0IHNvCj4g
PiA+IHRoYXQgdGhpcyBpcyBub3QgYSBwcm9ibGVtIGZvciBtb3N0IHN5c3RlbXMsIGFsdGhvdWdo
IHRoZXJlIHdpbGwKPiA+ID4gYWx3YXlzIGJlIGVkZ2UgY2FzZXMgd2hlcmUgdGhlIGRlZmF1bHQg
ZG9lcyBub3Qgd29yayB3ZWxsOyBpdCBpcyBpbXBvc3NpYmxlCj4gdG8gcGljayBkZWZhdWx0cyB0
aGF0IHdvcmsgd2VsbCBmb3IgZXZlcnkgY2FzZS4KPiA+ID4KPiA+Cj4gPiBJIGp1c3Qgd2FudCB0
byBpdCBhcyBiZWZvcmUgMzE5NzU0MjQ4MmRmICgiYXVkaXQ6IHJld29yawo+ID4gYXVkaXRfbG9n
X3N0YXJ0KCkiKSwgd2FpdCA2MCBzZWNvbmRzIG9uY2UgaWYKPiA+IGF1ZGl0ZC9yZWFkYWhlYWFk
LWNvbGxlY3RvciBoYXZlIHNvbWUgcHJvYmxlbSB0byBkcmFpbiB0aGUgYXVkaXQgYmFja2xvZy4K
PiAKPiBUaGUgcGF0Y2ggeW91IG1lbnRpb24gZml4ZWQgd2hhdCB3YXMgZGVlbWVkIHRvIGJlIGJ1
Z2d5IGJlaGF2aW9yOyBhcwo+IG1lbnRpb25lZCBwcmV2aW91c2x5IGluIHRoaXMgdGhyZWFkIEkg
c2VlIG5vIGdvb2QgcmVhc29uIHRvIGdvIGJhY2sgdG8gdGhlIG9sZAo+IGJlaGF2aW9yLgo+IAo+
ID4gPiBJZiB5b3UgYXJlIG5vdCB1c2luZyBhdWRpdCwgeW91IGNhbiBhbHdheXMgZGlzYWJsZSBp
dCB2aWEgdGhlIGtlcm5lbAo+ID4gPiBjb21tYW5kIGxpbmUsIG9yIGF0IHJ1bnRpbWUgKGxvb2sg
YXQgd2hhdCBGZWRvcmEgZG9lcykuCj4gPiA+Cj4gPiA+ID4gPiBZb3UgbWlnaHQgYWxzbyB3YW50
IHRvIGludmVzdGlnYXRlIHdoYXQgaXMgZ2VuZXJhdGluZyBzb21lIG1hbnkKPiA+ID4gPiA+IGF1
ZGl0IHJlY29yZHMgcHJpb3IgdG8gc3RhcnRpbmcgdGhlIGF1ZGl0IGRhZW1vbi4KPiA+ID4gPgo+
ID4gPiA+IEl0IGlzIC9zYmluL3JlYWRhaGVhZC1jb2xsZWN0b3IsIGluIGZhY3QsIHdlIHN0b3Ag
dGhlIGF1ZGl0ZDsgV2UKPiA+ID4gPiBhcmUgZG9pbmcgYQo+ID4gPiByZWJvb3QgdGVzdCwgd2hp
Y2ggcmVib290aW5nIG1hY2hpbmUgY29udGludWUgdG8gdGVzdCBoYXJkd2FyZS9zb2Z0d2FyZS4K
PiA+ID4gPgo+ID4gPiA+IGl0IGlzIHNhbWUgYXMgYmVsb3c6Cj4gPiA+ID4gYXVkaXRjdGwgLWEg
YWx3YXlzLGV4aXQgLVMgYWxsIC1GIHBpZD0neHh4Jwo+ID4gPiA+IGtpbGwgLXMgMTkgYHBpZG9m
IGF1ZGl0ZGAKPiA+ID4gPgo+ID4gPiA+IHRoZW4gdGhlIGF1ZGl0ZWQgdGFzayB3aWxsIGJlIGh1
bmcKPiA+ID4KPiA+ID4gU28geW91IGFyZSBzZWVpbmcgdGhpcyBwcm9ibGVtIG9ubHkgd2hlbiB5
b3UgcnVuIGEgdGVzdCwgb3IgZGlkIHlvdQo+ID4gPiBwcm92aWRlIHRoaXMgYXMgYSByZXByb2R1
Y2VyPwo+ID4KPiA+IGF1ZGl0Y3RsIC1hIGFsd2F5cyxleGl0IC1TIGFsbCAtRiBwcGlkPWBwaWRv
ZiBzc2hkYCBraWxsIC1zIDE5IGBwaWRvZgo+ID4gYXVkaXRkYCBzc2ggcm9vdEAxMjcuMC4wLjEK
PiA+Cj4gPiB0aGVuIHNzaCB3aWxsIGJlIGh1bmcgZm9yZXZlcgo+IAo+IFRoYXQgaXMgZXhwZWN0
ZWQgYmVoYXZpb3IuICBZb3UgYXJlIHB1dHRpbmcgYSBtYXNzaXZlIGF1ZGl0IGxvYWQgb24gdGhl
IHN5c3RlbQo+IGJ5IHRlbGxpbmcgdGhlIGtlcm5lbCB0byBhdWRpdCBldmVyeSBzeXNjYWxsIHRo
YXQgc3NoZCBtYWtlcywgdGhlbiB5b3UgYXJlCj4gaW50ZW50aW9uYWxseSBraWxsaW5nIHRoZSBh
dWRpdCBkYWVtb24gYW5kIGF0dGVtcHRpbmcgdG8gc3NoIGludG8gdGhlIHN5c3RlbS4KPiBUaGUg
cHJvcGVyIGZpeChlcykgaGVyZSB3b3VsZCBiZSB0byAxKSBzZXQgcmVhc29uYWJsZSBhdWRpdCBy
dWxlcyBhbmQvb3IgMikgdXNlCj4gYW4gaW5pdCBzeXN0ZW0gdGhhdCBtb25pdG9ycyBhbmQgcmVz
dGFydHMgYXVkaXRkIHdoZW4gaXQgZmFpbHMgKHN5c3RlbWQgaGFzIHRoaXMKPiBjYXBhYmlsaXR5
LCBJIGJlbGlldmUgc29tZSBvdGhlcnMgZG8gYXMgd2VsbCkuCj4gCgpCb3RoIGFyZSBub3Qgd29y
a2luZy4KVGhlIGF1ZGl0ZCBpcyBub3QgZGVhZCwgaXQgaXMgaW4gc3RvcCBzdGF0dXMoa2lsbCAt
cyAxOSkuIFNvIHN5c3RlbWQvaW5pdCB3aWxsIG5vdCByZXN0YXJ0IGl0LgpFdmVuIGlmIHdpdGgg
bGl0dGxlIGF1ZGl0IHJ1bGVzLCBhZnRlciBtdWx0aXBsZSBhY2Nlc3NlcywgdGhlIGJhY2tsb2cg
d2lsbCBmdWxsIGR1ZSB0byBubyByZWNlaXZlcgoKd2hldGhlciwgSSB0aGluaywgdGhlIG9yaWdp
bmFsIGJlaGF2aW9yIG1heWJlIGJldHRlcgoKY29tbWl0IGFjNGNlYzQ0M2E4MGJmZGU4Mjk1MTZl
N2E3ZGIxMGY3MzI1YWE1MjgKQXV0aG9yOiBEYXZpZCBXb29kaG91c2UgPGR3bXcyQHNoaW55Ym9v
ay5pbmZyYWRlYWQub3JnPgpEYXRlOiAgIFNhdCBKdWwgMiAxNDowODo0OCAyMDA1ICswMTAwCgog
ICAgQVVESVQ6IFN0b3Agd2FpdGluZyBmb3IgYmFja2xvZyBhZnRlciBhdWRpdF9wYW5pYygpIGhh
cHBlbnMKICAgIAogICAgV2UgZm9yY2UgYSByYXRlLWxpbWl0IG9uIGF1ZGl0YWJsZSBldmVudHMg
YnkgbWFraW5nIHRoZW0gd2FpdCBmb3Igc3BhY2UKICAgIG9uIHRoZSBiYWNrbG9nIHF1ZXVlLiBI
b3dldmVyLCBpZiBhdWRpdGQgcmVhbGx5IGlzIEFXT0wgdGhlbiB0aGlzIGNvdWxkCiAgICBwb3Rl
bnRpYWxseSBicmluZyB0aGUgZW50aXJlIHN5c3RlbSB0byBhIGhhbHQsIGRlcGVuZGluZyBvbiB0
aGUgYXVkaXQKICAgIHJ1bGVzIGluIGVmZmVjdC4KICAgIAogICAgRmlyc3RseSwgbWFrZSBzdXJl
IHRoZSB3YWl0IHRpbWUgaXMgaG9ub3VyZWQgY29ycmVjdGx5IC0tIGl0J3MgdGhlCiAgICBtYXhp
bXVtIHRpbWUgdGhlIHByb2Nlc3Mgc2hvdWxkIHdhaXQsIHJhdGhlciB0aGFuIHRoZSB0aW1lIHRv
IHdhaXQKICAgIF9lYWNoXyB0aW1lIHJvdW5kIHRoZSBsb29wLiBXZSB3ZXJlIGdldHRpbmcgcmUt
d29rZW4gX2VhY2hfIHRpbWUgYQogICAgcGFja2V0IHdhcyBkZXF1ZXVlZCwgYW5kIHRoZSB0aW1l
b3V0IHdhcyBiZWluZyByZXN0YXJ0ZWQgZWFjaCB0aW1lLgogICAgCiAgICBTZWNvbmRseSwgcmVz
ZXQgdGhlIHdhaXQgdGltZSBhZnRlciBhdWRpdF9wYW5pYygpIGlzIGNhbGxlZC4gSW4gZ2VuZXJh
bAogICAgdGhpcyB3aWxsIGJlIHJlc2V0IHRvIHplcm8sIHRvIGFsbG93IHByb2dyZXNzIHRvIGJl
IG1hZGUuIElmIHRoZSBzeXN0ZW0KICAgIGlzIGNvbmZpZ3VyZWQgdG8gX2FjdHVhbGx5XyBwYW5p
YyBvbiBhdWRpdF9wYW5pYygpIHRoZW4gdGhhdCB3aWxsCiAgICBhbHJlYWR5IGhhdmUgaGFwcGVu
ZWQ7IG90aGVyd2lzZSB3ZSBrbm93IHRoYXQgYXVkaXQgcmVjb3JkcyBhcmUgYmVpbmcKICAgIGxv
c3QgYW55d2F5LgogICAgCiAgICBUaGVzZSB0d28gdHVuYWJsZXMgY2FuJ3QgYmUgZXhwb3NlZCB2
aWEgQVVESVRfR0VUIGFuZCBBVURJVF9TRVQgYmVjYXVzZQogICAgdGhvc2UgYXJlbid0IHBhcnRp
Y3VsYXJseSB3ZWxsLWRlc2lnbmVkLiBJdCBwcm9iYWJseSBzaG91bGQgaGF2ZSBiZWVuCiAgICBk
b25lIGJ5IHN5c2N0bHMgb3Igc3lzZnMgYW55d2F5IC0tIG9uZSBmb3IgYSBsYXRlciBwYXRjaC4K
ClRoYW5rcwoKLVJvbmdRaW5nCj4gLS0KPiBwYXVsIG1vb3JlCj4gd3d3LnBhdWwtbW9vcmUuY29t
CgotLQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRw
czovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtYXVkaXQ=
