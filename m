Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0E8B7195
	for <lists+linux-audit@lfdr.de>; Thu, 19 Sep 2019 04:31:02 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DA221C04AC50;
	Thu, 19 Sep 2019 02:30:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D73819D7A;
	Thu, 19 Sep 2019 02:30:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0EDD84E589;
	Thu, 19 Sep 2019 02:30:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8J2UgU0014850 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 18 Sep 2019 22:30:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 52ABF5C21E; Thu, 19 Sep 2019 02:30:42 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C9A75C21A
	for <linux-audit@redhat.com>; Thu, 19 Sep 2019 02:30:40 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
	[209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8D907307D853
	for <linux-audit@redhat.com>; Thu, 19 Sep 2019 02:30:38 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id q64so1881903ljb.12
	for <linux-audit@redhat.com>; Wed, 18 Sep 2019 19:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=M0lzxpKurylhcX3SEU2fjE4jxxtrhEIRSpmUVU3FAQg=;
	b=ugIoSm6kueh5XV+Mhe0jyGp6Bm7kQgXz2cQGJ6zlLiLLmCBstsZv6tGh+BspG7mpMN
	ZoW5pipCKmqNeVuWiz+xg1Pjo/6BINfL9wl4e6qtOabtAyfW7PXSOUx4Hkl/FR+dkJWt
	J0wYJTtswSnkE/i+T8zDwRYFquuyLJrSDUNTaLOctPPpYK4bfY476gHZeOVbRJ/sjv8E
	2E5cTcHIHv/5rbYGIUk4LpwVYUXXdLfgCpcdY6avnn55TvLml8ifk8nidkT056NeHmgS
	NT9n1WhsoZYqUXS4AHVx8pVCvYAZTQ1YXEHk1jTfsYfaIH7/s6wQtuMa6+wY5/EqoTmt
	6gOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=M0lzxpKurylhcX3SEU2fjE4jxxtrhEIRSpmUVU3FAQg=;
	b=rjs9qrrzfDr1KM/bceLrEKYtafZauCOQadOucVLqnFYEKOolGZyQyJFnUSgNgKHDiJ
	wwTaahOyYeqOAq9P+83MYahMoP+XeuhG2+HtEzTuyJMis+srlEKTx7Kcn+2U0q0stHO1
	PEGT9+QXP3HGG7csOXCMoRbNorYrFTdbupyOtevxwSHYui8wgAimuyETzObajD0oPRUZ
	EFUVc9NDaYd8vYgaO8BbvDVSJBYu6AKKuocdPHd9PFiEIUZ9ixGA560KipU8Kl8OIRqY
	vrGL6FRPhHtHUzlzCq6W4J02IXQm8+zIXLMS+XA8EjLSHvVXg6mz9LPZ9wkydI6yA8Fj
	LSDw==
X-Gm-Message-State: APjAAAUckqoO196mOFqpEZbYBrEYCJd++W2sC+MsY+4CmcoB7TucX6RS
	7uogps/JpgXEPX3wIEsPShtev+GjDLpFjzAsHTuopJpF8w==
X-Google-Smtp-Source: APXvYqwaTov53u9ayhkEPHe+vFKb1tklrgKm5gUpyySbYehDPLBE6HfeddsQf1f4zHp3C7hZVoMsoNMg5uxVy0Ew7Qo=
X-Received: by 2002:a2e:9a45:: with SMTP id k5mr3804444ljj.87.1568860236676;
	Wed, 18 Sep 2019 19:30:36 -0700 (PDT)
MIME-Version: 1.0
References: <1568258385-10643-1-git-send-email-lirongqing@baidu.com>
	<CAHC9VhRXj2UpdijxpKgMROfNu9tETpXpHdboPqP=HvVF-GuBVQ@mail.gmail.com>
	<f0efb280c80342049d4c43c9acb42676@baidu.com>
	<CAHC9VhR79o8aSkORj0fU2XKfLUBipRtTO+xUHPAd+StfpzAV-g@mail.gmail.com>
	<fe43dc199f3949709828e1d96edf7556@baidu.com>
	<CAHC9VhTSBvZr0jFARoFQ2dBxQR6rsDxY6uOLaF35e9BVhNEvaA@mail.gmail.com>
	<dbfc8ea5cdc3413e829eb864430ed7dc@baidu.com>
	<CAHC9VhRQKcS2E-WwMoJ_GntXY6cKTCvaykRBF_FXG4ggvAiHLA@mail.gmail.com>
	<6fc9ae05851842ca9ea2cc2b01dccc4c@baidu.com>
In-Reply-To: <6fc9ae05851842ca9ea2cc2b01dccc4c@baidu.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 18 Sep 2019 22:30:25 -0400
Message-ID: <CAHC9VhRETngJ4r8p-xF=wPNGc0pFAavBmvmzWw4oY2H43BAPUw@mail.gmail.com>
Subject: Re: [PATCH][RFC] audit: set wait time to zero when audit failed
To: "Li,Rongqing" <lirongqing@baidu.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Thu, 19 Sep 2019 02:30:39 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Thu, 19 Sep 2019 02:30:39 +0000 (UTC) for IP:'209.85.208.177'
	DOMAIN:'mail-lj1-f177.google.com'
	HELO:'mail-lj1-f177.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.177 mail-lj1-f177.google.com 209.85.208.177
	mail-lj1-f177.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x8J2UgU0014850
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Thu, 19 Sep 2019 02:31:01 +0000 (UTC)

T24gV2VkLCBTZXAgMTgsIDIwMTkgYXQgOTo1MCBQTSBMaSxSb25ncWluZyA8bGlyb25ncWluZ0Bi
YWlkdS5jb20+IHdyb3RlOgo+ID4gLS0tLS3pgq7ku7bljp/ku7YtLS0tLQo+ID4g5Y+R5Lu25Lq6
OiBQYXVsIE1vb3JlIFttYWlsdG86cGF1bEBwYXVsLW1vb3JlLmNvbV0KPiA+IOWPkemAgeaXtumX
tDogMjAxOeW5tDnmnIgxOOaXpSAyMDoyMwo+ID4g5pS25Lu25Lq6OiBMaSxSb25ncWluZyA8bGly
b25ncWluZ0BiYWlkdS5jb20+Cj4gPiDmioTpgIE6IEVyaWMgUGFyaXMgPGVwYXJpc0ByZWRoYXQu
Y29tPjsgbGludXgtYXVkaXRAcmVkaGF0LmNvbQo+ID4g5Li76aKYOiBSZTogW1BBVENIXVtSRkNd
IGF1ZGl0OiBzZXQgd2FpdCB0aW1lIHRvIHplcm8gd2hlbiBhdWRpdCBmYWlsZWQKPiA+Cj4gPiBP
biBUdWUsIFNlcCAxNywgMjAxOSBhdCA5OjA3IFBNIExpLFJvbmdxaW5nIDxsaXJvbmdxaW5nQGJh
aWR1LmNvbT4gd3JvdGU6Cj4gPiA+ID4gLS0tLS3pgq7ku7bljp/ku7YtLS0tLQo+ID4gPiA+IOWP
keS7tuS6ujogUGF1bCBNb29yZSBbbWFpbHRvOnBhdWxAcGF1bC1tb29yZS5jb21dCj4gPiA+ID4g
5Y+R6YCB5pe26Ze0OiAyMDE55bm0OeaciDE45pelIDM6MTcKPiA+ID4gPiDmlLbku7bkuro6IExp
LFJvbmdxaW5nIDxsaXJvbmdxaW5nQGJhaWR1LmNvbT4KPiA+ID4gPiDmioTpgIE6IEVyaWMgUGFy
aXMgPGVwYXJpc0ByZWRoYXQuY29tPjsgbGludXgtYXVkaXRAcmVkaGF0LmNvbQo+ID4gPiA+IOS4
u+mimDogUmU6IFtQQVRDSF1bUkZDXSBhdWRpdDogc2V0IHdhaXQgdGltZSB0byB6ZXJvIHdoZW4g
YXVkaXQgZmFpbGVkCj4gPiA+ID4KPiA+ID4gPiBPbiBNb24sIFNlcCAxNiwgMjAxOSBhdCA5OjA4
IFBNIExpLFJvbmdxaW5nIDxsaXJvbmdxaW5nQGJhaWR1LmNvbT4KPiA+IHdyb3RlOgo+ID4gPiA+
ID4gPiAtLS0tLemCruS7tuWOn+S7ti0tLS0tCj4gPiA+ID4gPiA+IOWPkeS7tuS6ujogUGF1bCBN
b29yZSBbbWFpbHRvOnBhdWxAcGF1bC1tb29yZS5jb21dCj4gPiA+ID4gPiA+IOWPkemAgeaXtumX
tDogMjAxOeW5tDnmnIgxN+aXpSA2OjUyCj4gPiA+ID4gPiA+IOaUtuS7tuS6ujogTGksUm9uZ3Fp
bmcgPGxpcm9uZ3FpbmdAYmFpZHUuY29tPgo+ID4gPiA+ID4gPiDmioTpgIE6IEVyaWMgUGFyaXMg
PGVwYXJpc0ByZWRoYXQuY29tPjsgbGludXgtYXVkaXRAcmVkaGF0LmNvbQo+ID4gPiA+ID4gPiDk
uLvpopg6IFJlOiBbUEFUQ0hdW1JGQ10gYXVkaXQ6IHNldCB3YWl0IHRpbWUgdG8gemVybyB3aGVu
IGF1ZGl0Cj4gPiA+ID4gPiA+IGZhaWxlZAo+ID4KPiA+IC4uLgo+ID4KPiA+ID4gPiA+IEkganVz
dCB3YW50IHRvIGl0IGFzIGJlZm9yZSAzMTk3NTQyNDgyZGYgKCJhdWRpdDogcmV3b3JrCj4gPiA+
ID4gPiBhdWRpdF9sb2dfc3RhcnQoKSIpLCB3YWl0IDYwIHNlY29uZHMgb25jZSBpZgo+ID4gPiA+
ID4gYXVkaXRkL3JlYWRhaGVhYWQtY29sbGVjdG9yIGhhdmUgc29tZSBwcm9ibGVtIHRvIGRyYWlu
IHRoZSBhdWRpdAo+ID4gYmFja2xvZy4KPiA+ID4gPgo+ID4gPiA+IFRoZSBwYXRjaCB5b3UgbWVu
dGlvbiBmaXhlZCB3aGF0IHdhcyBkZWVtZWQgdG8gYmUgYnVnZ3kgYmVoYXZpb3I7IGFzCj4gPiA+
ID4gbWVudGlvbmVkIHByZXZpb3VzbHkgaW4gdGhpcyB0aHJlYWQgSSBzZWUgbm8gZ29vZCByZWFz
b24gdG8gZ28gYmFjawo+ID4gPiA+IHRvIHRoZSBvbGQgYmVoYXZpb3IuCj4gPiA+ID4KPiA+ID4g
PiA+ID4gSWYgeW91IGFyZSBub3QgdXNpbmcgYXVkaXQsIHlvdSBjYW4gYWx3YXlzIGRpc2FibGUg
aXQgdmlhIHRoZQo+ID4gPiA+ID4gPiBrZXJuZWwgY29tbWFuZCBsaW5lLCBvciBhdCBydW50aW1l
IChsb29rIGF0IHdoYXQgRmVkb3JhIGRvZXMpLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4g
WW91IG1pZ2h0IGFsc28gd2FudCB0byBpbnZlc3RpZ2F0ZSB3aGF0IGlzIGdlbmVyYXRpbmcgc29t
ZQo+ID4gPiA+ID4gPiA+ID4gbWFueSBhdWRpdCByZWNvcmRzIHByaW9yIHRvIHN0YXJ0aW5nIHRo
ZSBhdWRpdCBkYWVtb24uCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBJdCBpcyAvc2Jpbi9y
ZWFkYWhlYWQtY29sbGVjdG9yLCBpbiBmYWN0LCB3ZSBzdG9wIHRoZSBhdWRpdGQ7Cj4gPiA+ID4g
PiA+ID4gV2UgYXJlIGRvaW5nIGEKPiA+ID4gPiA+ID4gcmVib290IHRlc3QsIHdoaWNoIHJlYm9v
dGluZyBtYWNoaW5lIGNvbnRpbnVlIHRvIHRlc3QKPiA+IGhhcmR3YXJlL3NvZnR3YXJlLgo+ID4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gaXQgaXMgc2FtZSBhcyBiZWxvdzoKPiA+ID4gPiA+ID4g
PiBhdWRpdGN0bCAtYSBhbHdheXMsZXhpdCAtUyBhbGwgLUYgcGlkPSd4eHgnCj4gPiA+ID4gPiA+
ID4ga2lsbCAtcyAxOSBgcGlkb2YgYXVkaXRkYAo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4g
dGhlbiB0aGUgYXVkaXRlZCB0YXNrIHdpbGwgYmUgaHVuZwo+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiBTbyB5b3UgYXJlIHNlZWluZyB0aGlzIHByb2JsZW0gb25seSB3aGVuIHlvdSBydW4gYSB0ZXN0
LCBvciBkaWQKPiA+ID4gPiA+ID4geW91IHByb3ZpZGUgdGhpcyBhcyBhIHJlcHJvZHVjZXI/Cj4g
PiA+ID4gPgo+ID4gPiA+ID4gYXVkaXRjdGwgLWEgYWx3YXlzLGV4aXQgLVMgYWxsIC1GIHBwaWQ9
YHBpZG9mIHNzaGRgIGtpbGwgLXMgMTkKPiA+ID4gPiA+IGBwaWRvZiBhdWRpdGRgIHNzaCByb290
QDEyNy4wLjAuMQo+ID4gPiA+ID4KPiA+ID4gPiA+IHRoZW4gc3NoIHdpbGwgYmUgaHVuZyBmb3Jl
dmVyCj4gPiA+ID4KPiA+ID4gPiBUaGF0IGlzIGV4cGVjdGVkIGJlaGF2aW9yLiAgWW91IGFyZSBw
dXR0aW5nIGEgbWFzc2l2ZSBhdWRpdCBsb2FkIG9uCj4gPiA+ID4gdGhlIHN5c3RlbSBieSB0ZWxs
aW5nIHRoZSBrZXJuZWwgdG8gYXVkaXQgZXZlcnkgc3lzY2FsbCB0aGF0IHNzaGQKPiA+ID4gPiBt
YWtlcywgdGhlbiB5b3UgYXJlIGludGVudGlvbmFsbHkga2lsbGluZyB0aGUgYXVkaXQgZGFlbW9u
IGFuZCBhdHRlbXB0aW5nCj4gPiB0byBzc2ggaW50byB0aGUgc3lzdGVtLgo+ID4gPiA+IFRoZSBw
cm9wZXIgZml4KGVzKSBoZXJlIHdvdWxkIGJlIHRvIDEpIHNldCByZWFzb25hYmxlIGF1ZGl0IHJ1
bGVzCj4gPiA+ID4gYW5kL29yIDIpIHVzZSBhbiBpbml0IHN5c3RlbSB0aGF0IG1vbml0b3JzIGFu
ZCByZXN0YXJ0cyBhdWRpdGQgd2hlbgo+ID4gPiA+IGl0IGZhaWxzIChzeXN0ZW1kIGhhcyB0aGlz
IGNhcGFiaWxpdHksIEkgYmVsaWV2ZSBzb21lIG90aGVycyBkbyBhcyB3ZWxsKS4KPiA+ID4KPiA+
ID4gQm90aCBhcmUgbm90IHdvcmtpbmcuCj4gPiA+IFRoZSBhdWRpdGQgaXMgbm90IGRlYWQsIGl0
IGlzIGluIHN0b3Agc3RhdHVzKGtpbGwgLXMgMTkpLiBTbyBzeXN0ZW1kL2luaXQgd2lsbCBub3QK
PiA+IHJlc3RhcnQgaXQuCj4gPiA+IEV2ZW4gaWYgd2l0aCBsaXR0bGUgYXVkaXQgcnVsZXMsIGFm
dGVyIG11bHRpcGxlIGFjY2Vzc2VzLCB0aGUgYmFja2xvZwo+ID4gPiB3aWxsIGZ1bGwgZHVlIHRv
IG5vIHJlY2VpdmVyCj4gPgo+ID4gRmFpciBwb2ludCwgaG93ZXZlciBJIHN0aWxsIHN0YW5kIGJ5
IG15IHByZXZpb3VzIGNvbW1lbnRzIHRoYXQgdGhlcmUgYXJlCj4gPiBydW50aW1lIGNvbmZpZ3Vy
YXRpb24ga25vYnMgd2hpY2ggY2FuIG1pdGlnYXRlIHRoaXMgcHJvYmxlbSBpZiBpdCBpcyBzb21l
dGhpbmcKPiA+IHlvdSBhcmUgY29uY2VybmVkIGFib3V0LiAgRGVwZW5kaW5nIG9uIHRoZSBzaXR1
YXRpb24sIHlvdSBjYW4gZWl0aGVyIGluY3JlYXNlCj4gPiB0aGUgYmFja2xvZyB0byBkZWFsIHdp
dGggdHJhbnNpZW50IHByb2JsZW1zLCBvciBkZWNyZWFzZSB0aGUgYmFja2xvZyB3YWl0IHRpbWUK
PiA+IChwb3NzaWJseSB0byB6ZXJvKSB0byBwcmV2ZW50IGJsb2NraW5nIGVudGlyZWx5Lgo+ID4K
Pgo+IE5vIG5lZWQga25vYnMsIGF1ZGl0Y3RsIGNhbiBjaGFuZ2UgdGhlIGJhY2tsb2cgbGVuZ3Ro
IGFuZCB3YWl0IHRpbWUuCgpUaGF0IGlzIHdoYXQgSSBtZWFudCBieSAia25vYnMiLiAgVGhlIHRl
cm0gImtub2JzIiBpcyBjb21tb25seSB1c2VkIHRvCnJlZmVyZW5jZSBzb21lIG1ldGhvZCBvZiBj
aGFuZ2luZyB0aGUgY29uZmlndXJhdGlvbi4KCj4gQW5kIGl0IGlzIGhlbHBsZXNzIHRvIGNoYW5n
ZSB0aGUgYmFja2xvZyBsZW5ndGggaWYgYXVkaXRkIGlzIGh1bmcgZm9yZXZlciwgYXMgYSB0YXNr
IGNhbiBiZSBodW5nIGZvcmV2ZXIgZHVlIHRvIGRpc2svZmlsZXN5c3RlbSdzIGFibm9ybWFsLCBl
dGMKCkluIHRoaXMgY2FzZSBjaGFuZ2luZyB0aGUgd2FpdCB0aW1lIHdvdWxkIHdvcmsgKGFzIHBy
ZXZpb3VzbHkKbWVudGlvbmVkKS4gIEl0IGlzIHdvcnRoIG5vdGluZyB0aGF0IHRoZSBjdXJyZW50
IGNvZGUgZG9lcyBub3Qgc3VmZmVyCmZyb20gYSAiaHVuZyBmb3JldmVyIiBwcm9ibGVtIGlmIHRo
ZSBhdWRpdCBxdWV1ZSBpcyBibG9ja2VkLCBpdCBtYXkKc2xvdyBkb3duIHF1aXRlIGEgYml0IChk
ZXBlbmRlbnQgb24gdGhlIGF1ZGl0X2JhY2tsb2dfd2FpdF90aW1lCnZhcmlhYmxlKSwgYnV0IGl0
IHNob3VsZCBzdGlsbCBtYWtlIGZvcndhcmQgcHJvZ3Jlc3MuCgo+IEkgYW0gc2F5aW5nIHRoZSBh
dWRpdCBkZWZhdWx0IGJlaGF2aW9ycyB3aGljaCBpcyBjaGFuZ2VkLCBJIHRydWx5IG1lZXQgdGhl
IGlzc3VlIGFzIGRlc2NyaXB0aW9uIG9mIHRoZSBiZWxvdyBjb21taXQsIGlmIHdlIGNhbiBtYWtl
IGNoYW5nZSwgb3RoZXIgY2FuIGF2b2lkIHRoaXMgaXNzdWUuCgpJZiB3ZSB3ZXJlIGhlYXJpbmcg
bW9yZSByZXBvcnRzIG9mIHByb2JsZW1zIHdpdGggdGhlIGN1cnJlbnQgZGVmYXVsdHMKSSB3b3Vs
ZCBiZSBpbmNsaW5lZCB0byBjaGFuZ2UgdGhlbSwgYnV0IHRvIHRoZSBiZXN0IG9mIG15IGtub3ds
ZWRnZQp5b3UgYXJlIHRoZSBvbmx5IG9uZSB3aG8gaGFzIHJ1biBpbnRvIHRoaXMgcHJvYmxlbSwg
c28gSSB3b3VsZCByYXRoZXIKeW91IHNpbXBseSB1cGRhdGUgeW91ciBhdWRpdCBjb25maWd1cmF0
aW9uLgoKLS0gCnBhdWwgbW9vcmUKd3d3LnBhdWwtbW9vcmUuY29tCgotLQpMaW51eC1hdWRpdCBt
YWlsaW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtYXVkaXQ=
