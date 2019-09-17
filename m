Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AD8B5607
	for <lists+linux-audit@lfdr.de>; Tue, 17 Sep 2019 21:17:40 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 165584ACDF;
	Tue, 17 Sep 2019 19:17:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C422B5D6A5;
	Tue, 17 Sep 2019 19:17:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 42A484EE68;
	Tue, 17 Sep 2019 19:17:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8HJHDun029446 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 17 Sep 2019 15:17:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 88A6B19C70; Tue, 17 Sep 2019 19:17:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx23.extmail.prod.ext.phx2.redhat.com
	[10.5.110.64])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 829A419C6A
	for <linux-audit@redhat.com>; Tue, 17 Sep 2019 19:17:10 +0000 (UTC)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6EE19105786E
	for <linux-audit@redhat.com>; Tue, 17 Sep 2019 19:17:09 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id 72so3783457lfh.6
	for <linux-audit@redhat.com>; Tue, 17 Sep 2019 12:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=lrarqvVtmhshyY2u2GGfhpk8j6/EoZFGqYSkc+o/+2w=;
	b=bBt1dh9jsxwGQ01IVfBdyykqlXNzPd5actTzASkN4mC7k8zbfm97Ow8CGCYvVl3lhs
	27UupDyeQrM5MOTuCSzSUKfXwqRyR0M6xM9ppgRv0Nbmz+wuhHZ+i9MPW7SYSOgh5rNa
	OukwNir6fZNgMCL0EbqPyGjgVrx1+IsVhSqwws7mNvXa9mW0eW+pywTnH0UQf6YhTFlu
	ye0dFJXVydvv+ntSqFXF4zv0xA+F8XZ/n/UqBunuAkendv9bPSDOjyCqIlGNMNiTiBmG
	3ogbH5/dtFQxdDcYib+PIXJ2WSzAl5RYX3OuTbc3H5gFuzrmyThgTGM6kp5YpkfzaYsv
	67GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=lrarqvVtmhshyY2u2GGfhpk8j6/EoZFGqYSkc+o/+2w=;
	b=hcmHqVZtKdUcCgtRXzztTHN7NOYFBVEL+gUuU9SMvBfZe0Ay9MvzdYGaEQbeF3ehly
	jBMUhJuYlBakt3CFVKFf4uGKnQ8UE6g04n025kdARcAPczlyYQJPJ87iwkdo9qlwSlwc
	QdjCRuhc99/8culk4vaAo59kYMx394e9IVp+SV0PRzXFtxFouiFyX9reKvtbM8Zq0w6v
	XVz7juTTCMo+MNOpEdvWSucoTJz3Kw9qcY3KH09hUbPEmp9cFtbff3RRZI38gzsGk3ZM
	htztdtkCniQV0i+IFB0WN3sbqReoZAa2O+BFuAIaFkOVmapcWPc/aJ777DHyCibFK/KB
	tMoQ==
X-Gm-Message-State: APjAAAXppjA+mlrnkLuBTXy/zRfFE7nkAZ9lhUSA0xX/PMesM89cLiRi
	cikdz/lbb5rzv97GIBU6nos+XMzaD3IVjaW+1Yffq8UuFQ==
X-Google-Smtp-Source: APXvYqybyHTmktx3ErPHpua6YEl73k/vxFOOkKKFNhT+ZbwkKscqL2UuFa9EHgzwa+qVecVxmeihughC0m7B3Iq5mtQ=
X-Received: by 2002:ac2:51a7:: with SMTP id f7mr2847503lfk.119.1568747827475; 
	Tue, 17 Sep 2019 12:17:07 -0700 (PDT)
MIME-Version: 1.0
References: <1568258385-10643-1-git-send-email-lirongqing@baidu.com>
	<CAHC9VhRXj2UpdijxpKgMROfNu9tETpXpHdboPqP=HvVF-GuBVQ@mail.gmail.com>
	<f0efb280c80342049d4c43c9acb42676@baidu.com>
	<CAHC9VhR79o8aSkORj0fU2XKfLUBipRtTO+xUHPAd+StfpzAV-g@mail.gmail.com>
	<fe43dc199f3949709828e1d96edf7556@baidu.com>
In-Reply-To: <fe43dc199f3949709828e1d96edf7556@baidu.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 17 Sep 2019 15:16:56 -0400
Message-ID: <CAHC9VhTSBvZr0jFARoFQ2dBxQR6rsDxY6uOLaF35e9BVhNEvaA@mail.gmail.com>
Subject: Re: [PATCH][RFC] audit: set wait time to zero when audit failed
To: "Li,Rongqing" <lirongqing@baidu.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.64]);
	Tue, 17 Sep 2019 19:17:10 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]);
	Tue, 17 Sep 2019 19:17:10 +0000 (UTC) for IP:'209.85.167.66'
	DOMAIN:'mail-lf1-f66.google.com' HELO:'mail-lf1-f66.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.167.66 mail-lf1-f66.google.com 209.85.167.66
	mail-lf1-f66.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.64
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x8HJHDun029446
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Tue, 17 Sep 2019 19:17:39 +0000 (UTC)

T24gTW9uLCBTZXAgMTYsIDIwMTkgYXQgOTowOCBQTSBMaSxSb25ncWluZyA8bGlyb25ncWluZ0Bi
YWlkdS5jb20+IHdyb3RlOgo+ID4gLS0tLS3pgq7ku7bljp/ku7YtLS0tLQo+ID4g5Y+R5Lu25Lq6
OiBQYXVsIE1vb3JlIFttYWlsdG86cGF1bEBwYXVsLW1vb3JlLmNvbV0KPiA+IOWPkemAgeaXtumX
tDogMjAxOeW5tDnmnIgxN+aXpSA2OjUyCj4gPiDmlLbku7bkuro6IExpLFJvbmdxaW5nIDxsaXJv
bmdxaW5nQGJhaWR1LmNvbT4KPiA+IOaKhOmAgTogRXJpYyBQYXJpcyA8ZXBhcmlzQHJlZGhhdC5j
b20+OyBsaW51eC1hdWRpdEByZWRoYXQuY29tCj4gPiDkuLvpopg6IFJlOiBbUEFUQ0hdW1JGQ10g
YXVkaXQ6IHNldCB3YWl0IHRpbWUgdG8gemVybyB3aGVuIGF1ZGl0IGZhaWxlZAo+ID4KPiA+IE9u
IFN1biwgU2VwIDE1LCAyMDE5IGF0IDEwOjU1IFBNIExpLFJvbmdxaW5nIDxsaXJvbmdxaW5nQGJh
aWR1LmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiBpZiBhdWRpdF9sb2dfc3RhcnQgZmFpbGVkIGJlY2F1
c2UgcXVldWUgaXMgZnVsbCwga2F1ZGl0ZCBpcwo+ID4gPiA+ID4gd2FpdGluZyB0aGUgcmVjZWl2
aW5nIHF1ZXVlIGVtcHR5LCBidXQgbm8gcmVjZWl2ZXIsIGEgdGFzayB3aWxsIGJlCj4gPiA+ID4g
PiBmb3JjZWQgdG8gd2FpdCA2MCBzZWNvbmRzIGZvciBlYWNoIGF1ZGl0ZWQgc3lzY2FsbCwgYW5k
IGl0IHdpbGwgYmUKPiA+ID4gPiA+IGhhbmcgZm9yIGEgdmVyeSBsb25nIHRpbWUKPiA+ID4gPiA+
Cj4gPiA+ID4gPiBzbyBhdCB0aGlzIGNvbmRpdGlvbiwgc2V0IHRoZSB3YWl0IHRpbWUgdG8gemVy
byB0byByZWR1Y2Ugd2FpdCwKPiA+ID4gPiA+IGFuZCByZXN0b3JlIHdhaXQgdGltZSB3aGVuIGF1
ZGl0IHdvcmtzIGFnYWluCj4gPiA+ID4gPgo+ID4gPiA+ID4gaXQgcGFydGlhbGx5IHJlc3RvcmUg
dGhlIGNvbW1pdCAzMTk3NTQyNDgyZGYgKCJhdWRpdDogcmV3b3JrCj4gPiA+ID4gPiBhdWRpdF9s
b2dfc3RhcnQoKSIpCj4gPiA+ID4gPgo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTGkgUm9uZ1Fp
bmcgPGxpcm9uZ3FpbmdAYmFpZHUuY29tPgo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTGlhbmcg
WmhpQ2hlbmcgPGxpYW5nemhpY2hlbmdAYmFpZHUuY29tPgo+ID4gPiA+ID4gLS0tCj4gPiA+ID4g
PiByZWJvb3QgaXMgdGFraW5nIGEgdmVyeSBsb25nIHRpbWUgb24gbXkgbWFjaGluZShjZW50b3Mg
NnU0ICtrZXJuZWwKPiA+ID4gPiA+IDUuMykgc2luY2UgVElGX1NZU0NBTExfQVVESVQgaXMgc2V0
IGJ5IGRlZmF1bHQsIGFuZCB3aGVuIHJlYm9vdCwKPiA+ID4gPiA+IHVzZXJzcGFjZSBwcm9jZXNz
IHdoaWNoIHJlY2VpdmVyIGF1ZGl0IG1lc3NhZ2UgLCB3aWxsIGJlIGtpbGxlZCwKPiA+ID4gPiA+
IGFuZCBsZWFkIHRvIHRoYXQgbm8gdXNlciBkcmFpbiB0aGUgYXVkaXQgcXVldWUKPiA+ID4gPiA+
Cj4gPiA+ID4gPiBnaXQgYml0c2VjdCBzaG93IGl0IGlzIGNhdXNlZCBieSAzMTk3NTQyNDgyZGYg
KCJhdWRpdDogcmV3b3JrCj4gPiA+ID4gPiBhdWRpdF9sb2dfc3RhcnQoKSIpCj4gPiA+ID4gPgo+
ID4gPiA+ID4gIGtlcm5lbC9hdWRpdC5jIHwgOSArKysrKysrLS0KPiA+ID4gPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gPiA+Cj4gPiA+ID4g
VGhpcyBpcyB0eXBpY2FsbHkgc29sdmVkIGJ5IGluY3JlYXNpbmcgdGhlIGJhY2tsb2cgdXNpbmcg
dGhlCj4gPiAiYXVkaXRfYmFja2xvZ19saW1pdCIKPiA+ID4gPiBrZXJuZWwgcGFyYW1ldGVyIChs
aW5rIHRvIHRoZSBkb2NzIGJlbG93KS4KPiA+ID4KPiA+ID4gSXQgc2hvdWxkIGJlIGFibGUgdG8g
YXZvaWQgbXkgaXNzdWUsIGJ1dCB0aGUgZGVmYXVsdCBiZWhhdmlvcnMgZG9lcyBub3QKPiA+IHdv
cmtpbmcgZm9yIG1lOyBBbmQgbm90IGFsbCBoYXZlIGVub3VnaCBrbm93bGVkZ2UgYWJvdXQgYXVk
aXQsIHdobyBtYXliZQo+ID4gc3BlbmQgbG90cyBvZiBlZmZvcnQgdG8gZmluZCB0aGUgcm9vdCBj
YXVzZSwgYW5kIGVzdGltYXRlIGhvdyBsYXJnZSBzaG91bGQgYmUKPiA+ICJhdWRpdF9iYWNrbG9n
X2xpbWl0Igo+ID4KPiA+IFRoZSBwYXVzZS9zbGVlcCBiZWhhdmlvciBpcyBkZXNpcmVkIGJlaGF2
aW9yIGFuZCBpcyBpbnRlbmRlZCB0byBoZWxwCj4gPiBrYXVkaXRkL2F1ZGl0ZCBwcm9jZXNzIHRo
ZSBhdWRpdCBiYWNrbG9nIG9uIGEgYnVzeSBzeXN0ZW0uICBJZiB3ZSBkaWRuJ3Qgc2xlZXAKPiA+
IHRoZSBjdXJyZW50IHByb2Nlc3MgYW5kIGdpdmUga2F1ZGl0ZC9hdWRpdGQgYSBjaGFuY2UgdG8g
Zmx1c2ggdGhlIGJhY2tsb2cgd2hlbgo+ID4gaXQgd2FzIGZ1bGwsIGEgbG90IG9mIGJhZCB0aGlu
Z3MgY291bGQgaGFwcGVuIHdpdGggcmVzcGVjdCB0byBhdWRpdC4gIFdlCj4gPiBnZW5lcmFsbHkg
c2VsZWN0IHRoZSBiYWNrbG9nIGxpbWl0IHNvIHRoYXQgdGhpcyBpcyBub3QgYSBwcm9ibGVtIGZv
ciBtb3N0IHN5c3RlbXMsCj4gPiBhbHRob3VnaCB0aGVyZSB3aWxsIGFsd2F5cyBiZSBlZGdlIGNh
c2VzIHdoZXJlIHRoZSBkZWZhdWx0IGRvZXMgbm90IHdvcmsgd2VsbDsKPiA+IGl0IGlzIGltcG9z
c2libGUgdG8gcGljayBkZWZhdWx0cyB0aGF0IHdvcmsgd2VsbCBmb3IgZXZlcnkgY2FzZS4KPiA+
Cj4KPiBJIGp1c3Qgd2FudCB0byBpdCBhcyBiZWZvcmUgMzE5NzU0MjQ4MmRmICgiYXVkaXQ6IHJl
d29yayBhdWRpdF9sb2dfc3RhcnQoKSIpLAo+IHdhaXQgNjAgc2Vjb25kcyBvbmNlIGlmIGF1ZGl0
ZC9yZWFkYWhlYWFkLWNvbGxlY3RvciBoYXZlIHNvbWUgcHJvYmxlbSB0bwo+IGRyYWluIHRoZSBh
dWRpdCBiYWNrbG9nLgoKVGhlIHBhdGNoIHlvdSBtZW50aW9uIGZpeGVkIHdoYXQgd2FzIGRlZW1l
ZCB0byBiZSBidWdneSBiZWhhdmlvcjsgYXMKbWVudGlvbmVkIHByZXZpb3VzbHkgaW4gdGhpcyB0
aHJlYWQgSSBzZWUgbm8gZ29vZCByZWFzb24gdG8gZ28gYmFjayB0bwp0aGUgb2xkIGJlaGF2aW9y
LgoKPiA+IElmIHlvdSBhcmUgbm90IHVzaW5nIGF1ZGl0LCB5b3UgY2FuIGFsd2F5cyBkaXNhYmxl
IGl0IHZpYSB0aGUga2VybmVsIGNvbW1hbmQgbGluZSwKPiA+IG9yIGF0IHJ1bnRpbWUgKGxvb2sg
YXQgd2hhdCBGZWRvcmEgZG9lcykuCj4gPgo+ID4gPiA+IFlvdSBtaWdodCBhbHNvIHdhbnQgdG8g
aW52ZXN0aWdhdGUKPiA+ID4gPiB3aGF0IGlzIGdlbmVyYXRpbmcgc29tZSBtYW55IGF1ZGl0IHJl
Y29yZHMgcHJpb3IgdG8gc3RhcnRpbmcgdGhlCj4gPiA+ID4gYXVkaXQgZGFlbW9uLgo+ID4gPgo+
ID4gPiBJdCBpcyAvc2Jpbi9yZWFkYWhlYWQtY29sbGVjdG9yLCBpbiBmYWN0LCB3ZSBzdG9wIHRo
ZSBhdWRpdGQ7IFdlIGFyZSBkb2luZyBhCj4gPiByZWJvb3QgdGVzdCwgd2hpY2ggcmVib290aW5n
IG1hY2hpbmUgY29udGludWUgdG8gdGVzdCBoYXJkd2FyZS9zb2Z0d2FyZS4KPiA+ID4KPiA+ID4g
aXQgaXMgc2FtZSBhcyBiZWxvdzoKPiA+ID4gYXVkaXRjdGwgLWEgYWx3YXlzLGV4aXQgLVMgYWxs
IC1GIHBpZD0neHh4Jwo+ID4gPiBraWxsIC1zIDE5IGBwaWRvZiBhdWRpdGRgCj4gPiA+Cj4gPiA+
IHRoZW4gdGhlIGF1ZGl0ZWQgdGFzayB3aWxsIGJlIGh1bmcKPiA+Cj4gPiBTbyB5b3UgYXJlIHNl
ZWluZyB0aGlzIHByb2JsZW0gb25seSB3aGVuIHlvdSBydW4gYSB0ZXN0LCBvciBkaWQgeW91IHBy
b3ZpZGUgdGhpcwo+ID4gYXMgYSByZXByb2R1Y2VyPwo+Cj4gYXVkaXRjdGwgLWEgYWx3YXlzLGV4
aXQgLVMgYWxsIC1GIHBwaWQ9YHBpZG9mIHNzaGRgCj4ga2lsbCAtcyAxOSBgcGlkb2YgYXVkaXRk
YAo+IHNzaCByb290QDEyNy4wLjAuMQo+Cj4gdGhlbiBzc2ggd2lsbCBiZSBodW5nIGZvcmV2ZXIK
ClRoYXQgaXMgZXhwZWN0ZWQgYmVoYXZpb3IuICBZb3UgYXJlIHB1dHRpbmcgYSBtYXNzaXZlIGF1
ZGl0IGxvYWQgb24KdGhlIHN5c3RlbSBieSB0ZWxsaW5nIHRoZSBrZXJuZWwgdG8gYXVkaXQgZXZl
cnkgc3lzY2FsbCB0aGF0IHNzaGQKbWFrZXMsIHRoZW4geW91IGFyZSBpbnRlbnRpb25hbGx5IGtp
bGxpbmcgdGhlIGF1ZGl0IGRhZW1vbiBhbmQKYXR0ZW1wdGluZyB0byBzc2ggaW50byB0aGUgc3lz
dGVtLiAgVGhlIHByb3BlciBmaXgoZXMpIGhlcmUgd291bGQgYmUKdG8gMSkgc2V0IHJlYXNvbmFi
bGUgYXVkaXQgcnVsZXMgYW5kL29yIDIpIHVzZSBhbiBpbml0IHN5c3RlbSB0aGF0Cm1vbml0b3Jz
IGFuZCByZXN0YXJ0cyBhdWRpdGQgd2hlbiBpdCBmYWlscyAoc3lzdGVtZCBoYXMgdGhpcwpjYXBh
YmlsaXR5LCBJIGJlbGlldmUgc29tZSBvdGhlcnMgZG8gYXMgd2VsbCkuCgotLSAKcGF1bCBtb29y
ZQp3d3cucGF1bC1tb29yZS5jb20KCi0tCkxpbnV4LWF1ZGl0IG1haWxpbmcgbGlzdApMaW51eC1h
dWRpdEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hdWRpdA==
