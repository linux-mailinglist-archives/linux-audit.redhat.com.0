Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D3AB6308
	for <lists+linux-audit@lfdr.de>; Wed, 18 Sep 2019 14:24:28 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B995A36955;
	Wed, 18 Sep 2019 12:24:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 990BE104812F;
	Wed, 18 Sep 2019 12:24:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2BB731808878;
	Wed, 18 Sep 2019 12:24:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8ICNUvP022977 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 18 Sep 2019 08:23:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CCF496012C; Wed, 18 Sep 2019 12:23:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C7D17600CC
	for <linux-audit@redhat.com>; Wed, 18 Sep 2019 12:23:30 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
	[209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 34554308FB9A
	for <linux-audit@redhat.com>; Wed, 18 Sep 2019 12:23:29 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id l21so5284610lje.4
	for <linux-audit@redhat.com>; Wed, 18 Sep 2019 05:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=gjfV++zqlJviQPTYj2W4ffyH0ZbgxLvP42MIZ2hsV10=;
	b=b2UvaTigkafm8+ND3WJkD2s7c63IauSHJ1r62S/epLsvm/pF/j4MznGnSZ1gxZOBc5
	Dpc7PvbvIYljaluR0d2/6XVQ6aPQ7SBWZHpYKljoizyRdsOX1ajBehIvL7mrIEnumHNP
	gKKd8odndCQAWoMNzZsh/s898QGvpYckgAl5pqch+9hZXJYmaAAvVF/QkRaeRVkOgV/n
	z+bJSfeO4F+fT7oCS7NKYSAglYv87ZQWcY0XJwGENF+34C8lbPzbphFSjgFRPL+9g4Jn
	bYmYxbALiu8JXdOff1fWM8OZ1zBl2zl28dlPFFbm27kYWntP+nyN4LmhvYQO1tK0HZ5y
	gPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=gjfV++zqlJviQPTYj2W4ffyH0ZbgxLvP42MIZ2hsV10=;
	b=ghgzNTXiX8ZU++7Z5twVxcML17xqIxuc3gvl6QfClwVFIdqq96tpjb1R8eSPG2s1Qc
	hDKlZQxdQasc+v9q+Q8JXBbb0/iqFaNu8IlTZkNu4OlV6enCPMnpNIG7uhRZLlqnoToZ
	M6WmSUnIsj7ca4gU0DI0dhbfC4Nq+KozXj2Y6wmbKc+nbm1D+jjxBF3Bh50F1c6Vn8gI
	gHeRuc7gSyAL4sxf4naNIfb9BL365IZEFZ5RhTUPMjJiQ8bEVi9wgxpTi77ZJguoZV2R
	NMmNzNfkBgWRhiOdOoFq/9Z3xkJQeqgjgP4fYFf/OvJAfRbcT54dQlRMLm0sXDe7z8Nd
	rZzQ==
X-Gm-Message-State: APjAAAWUOm2br3P3vX9lLqG+S4nWrAUJQBnsUTMby1XP2hYkFxFBRSfD
	IfJa4fYBl3gUXL7go6k9clDba+k1mr5V+n7FtAgK
X-Google-Smtp-Source: APXvYqxkwz4V7shWM3sj6eGDcBqRkybSVZZcivs34ssmHDayrALGKM+nVa6aGicey/PC8xK6gN/Ie/sPDuW/yJ3BGrQ=
X-Received: by 2002:a2e:6e18:: with SMTP id j24mr2062052ljc.158.1568809407431; 
	Wed, 18 Sep 2019 05:23:27 -0700 (PDT)
MIME-Version: 1.0
References: <1568258385-10643-1-git-send-email-lirongqing@baidu.com>
	<CAHC9VhRXj2UpdijxpKgMROfNu9tETpXpHdboPqP=HvVF-GuBVQ@mail.gmail.com>
	<f0efb280c80342049d4c43c9acb42676@baidu.com>
	<CAHC9VhR79o8aSkORj0fU2XKfLUBipRtTO+xUHPAd+StfpzAV-g@mail.gmail.com>
	<fe43dc199f3949709828e1d96edf7556@baidu.com>
	<CAHC9VhTSBvZr0jFARoFQ2dBxQR6rsDxY6uOLaF35e9BVhNEvaA@mail.gmail.com>
	<dbfc8ea5cdc3413e829eb864430ed7dc@baidu.com>
In-Reply-To: <dbfc8ea5cdc3413e829eb864430ed7dc@baidu.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 18 Sep 2019 08:23:16 -0400
Message-ID: <CAHC9VhRQKcS2E-WwMoJ_GntXY6cKTCvaykRBF_FXG4ggvAiHLA@mail.gmail.com>
Subject: Re: [PATCH][RFC] audit: set wait time to zero when audit failed
To: "Li,Rongqing" <lirongqing@baidu.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Wed, 18 Sep 2019 12:23:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Wed, 18 Sep 2019 12:23:29 +0000 (UTC) for IP:'209.85.208.182'
	DOMAIN:'mail-lj1-f182.google.com'
	HELO:'mail-lj1-f182.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.182 mail-lj1-f182.google.com 209.85.208.182
	mail-lj1-f182.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x8ICNUvP022977
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Wed, 18 Sep 2019 12:24:27 +0000 (UTC)

T24gVHVlLCBTZXAgMTcsIDIwMTkgYXQgOTowNyBQTSBMaSxSb25ncWluZyA8bGlyb25ncWluZ0Bi
YWlkdS5jb20+IHdyb3RlOgo+ID4gLS0tLS3pgq7ku7bljp/ku7YtLS0tLQo+ID4g5Y+R5Lu25Lq6
OiBQYXVsIE1vb3JlIFttYWlsdG86cGF1bEBwYXVsLW1vb3JlLmNvbV0KPiA+IOWPkemAgeaXtumX
tDogMjAxOeW5tDnmnIgxOOaXpSAzOjE3Cj4gPiDmlLbku7bkuro6IExpLFJvbmdxaW5nIDxsaXJv
bmdxaW5nQGJhaWR1LmNvbT4KPiA+IOaKhOmAgTogRXJpYyBQYXJpcyA8ZXBhcmlzQHJlZGhhdC5j
b20+OyBsaW51eC1hdWRpdEByZWRoYXQuY29tCj4gPiDkuLvpopg6IFJlOiBbUEFUQ0hdW1JGQ10g
YXVkaXQ6IHNldCB3YWl0IHRpbWUgdG8gemVybyB3aGVuIGF1ZGl0IGZhaWxlZAo+ID4KPiA+IE9u
IE1vbiwgU2VwIDE2LCAyMDE5IGF0IDk6MDggUE0gTGksUm9uZ3FpbmcgPGxpcm9uZ3FpbmdAYmFp
ZHUuY29tPiB3cm90ZToKPiA+ID4gPiAtLS0tLemCruS7tuWOn+S7ti0tLS0tCj4gPiA+ID4g5Y+R
5Lu25Lq6OiBQYXVsIE1vb3JlIFttYWlsdG86cGF1bEBwYXVsLW1vb3JlLmNvbV0KPiA+ID4gPiDl
j5HpgIHml7bpl7Q6IDIwMTnlubQ55pyIMTfml6UgNjo1Mgo+ID4gPiA+IOaUtuS7tuS6ujogTGks
Um9uZ3FpbmcgPGxpcm9uZ3FpbmdAYmFpZHUuY29tPgo+ID4gPiA+IOaKhOmAgTogRXJpYyBQYXJp
cyA8ZXBhcmlzQHJlZGhhdC5jb20+OyBsaW51eC1hdWRpdEByZWRoYXQuY29tCj4gPiA+ID4g5Li7
6aKYOiBSZTogW1BBVENIXVtSRkNdIGF1ZGl0OiBzZXQgd2FpdCB0aW1lIHRvIHplcm8gd2hlbiBh
dWRpdCBmYWlsZWQKCi4uLgoKPiA+ID4gSSBqdXN0IHdhbnQgdG8gaXQgYXMgYmVmb3JlIDMxOTc1
NDI0ODJkZiAoImF1ZGl0OiByZXdvcmsKPiA+ID4gYXVkaXRfbG9nX3N0YXJ0KCkiKSwgd2FpdCA2
MCBzZWNvbmRzIG9uY2UgaWYKPiA+ID4gYXVkaXRkL3JlYWRhaGVhYWQtY29sbGVjdG9yIGhhdmUg
c29tZSBwcm9ibGVtIHRvIGRyYWluIHRoZSBhdWRpdCBiYWNrbG9nLgo+ID4KPiA+IFRoZSBwYXRj
aCB5b3UgbWVudGlvbiBmaXhlZCB3aGF0IHdhcyBkZWVtZWQgdG8gYmUgYnVnZ3kgYmVoYXZpb3I7
IGFzCj4gPiBtZW50aW9uZWQgcHJldmlvdXNseSBpbiB0aGlzIHRocmVhZCBJIHNlZSBubyBnb29k
IHJlYXNvbiB0byBnbyBiYWNrIHRvIHRoZSBvbGQKPiA+IGJlaGF2aW9yLgo+ID4KPiA+ID4gPiBJ
ZiB5b3UgYXJlIG5vdCB1c2luZyBhdWRpdCwgeW91IGNhbiBhbHdheXMgZGlzYWJsZSBpdCB2aWEg
dGhlIGtlcm5lbAo+ID4gPiA+IGNvbW1hbmQgbGluZSwgb3IgYXQgcnVudGltZSAobG9vayBhdCB3
aGF0IEZlZG9yYSBkb2VzKS4KPiA+ID4gPgo+ID4gPiA+ID4gPiBZb3UgbWlnaHQgYWxzbyB3YW50
IHRvIGludmVzdGlnYXRlIHdoYXQgaXMgZ2VuZXJhdGluZyBzb21lIG1hbnkKPiA+ID4gPiA+ID4g
YXVkaXQgcmVjb3JkcyBwcmlvciB0byBzdGFydGluZyB0aGUgYXVkaXQgZGFlbW9uLgo+ID4gPiA+
ID4KPiA+ID4gPiA+IEl0IGlzIC9zYmluL3JlYWRhaGVhZC1jb2xsZWN0b3IsIGluIGZhY3QsIHdl
IHN0b3AgdGhlIGF1ZGl0ZDsgV2UKPiA+ID4gPiA+IGFyZSBkb2luZyBhCj4gPiA+ID4gcmVib290
IHRlc3QsIHdoaWNoIHJlYm9vdGluZyBtYWNoaW5lIGNvbnRpbnVlIHRvIHRlc3QgaGFyZHdhcmUv
c29mdHdhcmUuCj4gPiA+ID4gPgo+ID4gPiA+ID4gaXQgaXMgc2FtZSBhcyBiZWxvdzoKPiA+ID4g
PiA+IGF1ZGl0Y3RsIC1hIGFsd2F5cyxleGl0IC1TIGFsbCAtRiBwaWQ9J3h4eCcKPiA+ID4gPiA+
IGtpbGwgLXMgMTkgYHBpZG9mIGF1ZGl0ZGAKPiA+ID4gPiA+Cj4gPiA+ID4gPiB0aGVuIHRoZSBh
dWRpdGVkIHRhc2sgd2lsbCBiZSBodW5nCj4gPiA+ID4KPiA+ID4gPiBTbyB5b3UgYXJlIHNlZWlu
ZyB0aGlzIHByb2JsZW0gb25seSB3aGVuIHlvdSBydW4gYSB0ZXN0LCBvciBkaWQgeW91Cj4gPiA+
ID4gcHJvdmlkZSB0aGlzIGFzIGEgcmVwcm9kdWNlcj8KPiA+ID4KPiA+ID4gYXVkaXRjdGwgLWEg
YWx3YXlzLGV4aXQgLVMgYWxsIC1GIHBwaWQ9YHBpZG9mIHNzaGRgIGtpbGwgLXMgMTkgYHBpZG9m
Cj4gPiA+IGF1ZGl0ZGAgc3NoIHJvb3RAMTI3LjAuMC4xCj4gPiA+Cj4gPiA+IHRoZW4gc3NoIHdp
bGwgYmUgaHVuZyBmb3JldmVyCj4gPgo+ID4gVGhhdCBpcyBleHBlY3RlZCBiZWhhdmlvci4gIFlv
dSBhcmUgcHV0dGluZyBhIG1hc3NpdmUgYXVkaXQgbG9hZCBvbiB0aGUgc3lzdGVtCj4gPiBieSB0
ZWxsaW5nIHRoZSBrZXJuZWwgdG8gYXVkaXQgZXZlcnkgc3lzY2FsbCB0aGF0IHNzaGQgbWFrZXMs
IHRoZW4geW91IGFyZQo+ID4gaW50ZW50aW9uYWxseSBraWxsaW5nIHRoZSBhdWRpdCBkYWVtb24g
YW5kIGF0dGVtcHRpbmcgdG8gc3NoIGludG8gdGhlIHN5c3RlbS4KPiA+IFRoZSBwcm9wZXIgZml4
KGVzKSBoZXJlIHdvdWxkIGJlIHRvIDEpIHNldCByZWFzb25hYmxlIGF1ZGl0IHJ1bGVzIGFuZC9v
ciAyKSB1c2UKPiA+IGFuIGluaXQgc3lzdGVtIHRoYXQgbW9uaXRvcnMgYW5kIHJlc3RhcnRzIGF1
ZGl0ZCB3aGVuIGl0IGZhaWxzIChzeXN0ZW1kIGhhcyB0aGlzCj4gPiBjYXBhYmlsaXR5LCBJIGJl
bGlldmUgc29tZSBvdGhlcnMgZG8gYXMgd2VsbCkuCj4KPiBCb3RoIGFyZSBub3Qgd29ya2luZy4K
PiBUaGUgYXVkaXRkIGlzIG5vdCBkZWFkLCBpdCBpcyBpbiBzdG9wIHN0YXR1cyhraWxsIC1zIDE5
KS4gU28gc3lzdGVtZC9pbml0IHdpbGwgbm90IHJlc3RhcnQgaXQuCj4gRXZlbiBpZiB3aXRoIGxp
dHRsZSBhdWRpdCBydWxlcywgYWZ0ZXIgbXVsdGlwbGUgYWNjZXNzZXMsIHRoZSBiYWNrbG9nIHdp
bGwgZnVsbCBkdWUgdG8gbm8gcmVjZWl2ZXIKCkZhaXIgcG9pbnQsIGhvd2V2ZXIgSSBzdGlsbCBz
dGFuZCBieSBteSBwcmV2aW91cyBjb21tZW50cyB0aGF0IHRoZXJlCmFyZSBydW50aW1lIGNvbmZp
Z3VyYXRpb24ga25vYnMgd2hpY2ggY2FuIG1pdGlnYXRlIHRoaXMgcHJvYmxlbSBpZiBpdAppcyBz
b21ldGhpbmcgeW91IGFyZSBjb25jZXJuZWQgYWJvdXQuICBEZXBlbmRpbmcgb24gdGhlIHNpdHVh
dGlvbiwgeW91CmNhbiBlaXRoZXIgaW5jcmVhc2UgdGhlIGJhY2tsb2cgdG8gZGVhbCB3aXRoIHRy
YW5zaWVudCBwcm9ibGVtcywgb3IKZGVjcmVhc2UgdGhlIGJhY2tsb2cgd2FpdCB0aW1lIChwb3Nz
aWJseSB0byB6ZXJvKSB0byBwcmV2ZW50IGJsb2NraW5nCmVudGlyZWx5LgoKLS0gCnBhdWwgbW9v
cmUKd3d3LnBhdWwtbW9vcmUuY29tCgotLQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QKTGludXgt
YXVkaXRAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtYXVkaXQ=
