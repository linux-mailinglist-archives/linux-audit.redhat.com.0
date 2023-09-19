Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 191C07A6FD6
	for <lists+linux-audit@lfdr.de>; Wed, 20 Sep 2023 02:26:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695169565;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rHe0kxv7qPWWwQTXIMbebcHMOBqDfTi3E+7QMQmKsE0=;
	b=COMI1hurtpZfqtDwof4K2kOSdKxij+ojBkDysBHHDEwn5uIO3ElUPXZj0LVkn1Twco/Q8M
	mGFRqee0wMjI3YPk0m+fLgbdqX5u3LKruivrPFxvFIDQ3vjNGMcD6oqlwoajXBycefHMcw
	WHIW7JMH47nlHgQyhFjAEuupaCA0nSo=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-h3EXv4wRPYG9q6IO595nMw-1; Tue, 19 Sep 2023 20:26:03 -0400
X-MC-Unique: h3EXv4wRPYG9q6IO595nMw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D3FA3C02B78;
	Wed, 20 Sep 2023 00:26:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 55091140E950;
	Wed, 20 Sep 2023 00:25:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6077A19465B9;
	Wed, 20 Sep 2023 00:25:56 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3F879194658D for <linux-audit@listman.corp.redhat.com>;
 Tue, 19 Sep 2023 23:33:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2A982492B05; Tue, 19 Sep 2023 23:33:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.17.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EC6C5492C37;
 Tue, 19 Sep 2023 23:33:26 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com, Amjad Gabbar <amjadgabbar11@gmail.com>
Subject: Re: Sycall Rules vs Watch Rules
Date: Tue, 19 Sep 2023 19:12:14 -0400
Message-ID: <8295448.T7Z3S40VBb@x2>
Organization: Red Hat
In-Reply-To: <CAJcJf=TQ6R4zjNPX+TQyDBxtFz+QWQWDqT3t0PEXvzp9CvJS_g@mail.gmail.com>
References: <CAJcJf=Qb7muwWG4DyQtEcCKmCOETD4H3h1BoGrewJ5u26r6o=w@mail.gmail.com>
 <ZPjZ6py5vxdvKTY0@madcap2.tricolour.ca>
 <CAJcJf=TQ6R4zjNPX+TQyDBxtFz+QWQWDqT3t0PEXvzp9CvJS_g@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
Cc: Richard Guy Briggs <rgb@redhat.com>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8sCgpPbiBUdWVzZGF5LCBTZXB0ZW1iZXIgMTIsIDIwMjMgNToyMDo1NCBQTSBFRFQgQW1q
YWQgR2FiYmFyIHdyb3RlOgo+IEJhc2VkIG9uIHRoaXMgYW5kIHNvbWUgZXhwZXJpbWVudHMgSSBo
YXZlIGJlZW4gcGVyZm9ybWluZywgSSB3b3VsZCBzdWdnZXN0Cj4gY2hhbmdpbmcgaG93IGEgbG90
IG9mIHRoZSBGaWxlU3lzdGVtIHJ1bGVzIGFyZSB3cml0dGVuIGFuZCBpbGx1c3RyYXRlZC4KPiBF
eCAtCj4gaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LWF1ZGl0L2F1ZGl0LXVzZXJzcGFjZS9ibG9i
L21hc3Rlci9ydWxlcy8zMC1wY2ktZHNzCj4gLXYzMS5ydWxlcyNMMzQtTDM1Cj4gCj4gVGhlIHJ1
bGUgaW4gdGhlIHJlcG9zaXRvcnkgaXMKPiAtYSBhbHdheXMsZXhpdCAtRiBwYXRoPS9ldGMvc3Vk
b2VycyAtRiBwZXJtPXdhIC1GCj4ga2V5PTEwLjIuMi1wcml2LWNvbmZpZy1jaGFuZ2VzCj4gCj4g
TXkgc3VnZ2VzdGlvbiBpcyB0byBpbnN0ZWFkIGNoYW5nZSB0aGUgcnVsZSBiYXNlZCBvbiB0aGUg
cGVybWlzc2lvbnMKPiBkZWZpbmVkLiBUaGUgYWJvdmUgcnVsZSB3b3VsZCBjaGFuZ2UgdG8gdGhl
IGZvbGxvd2luZyBiYXNlZCBvbiB0aGUga2VybmVsCj4gYmVpbmcgdXNlZC4KPiAtYSBhbHdheXMs
ZXhpdCAtUyA8bGlzdCBvZiBzeXNjYWxscyBpbiBhdWRpdF93cml0ZS5oIGFuZCBhdWRpdF9yZWFk
LmgKPiArb3BlbixvcGVuYXQ+IC1GIHBhdGg9L2V0Yy9zdWRvZXJzIC1GIHBlcm09d2EgLUYKPiBr
ZXk9MTAuMi4yLXByaXYtY29uZmlnLWNoYW5nZXMKClRoYXQgc2hvdWxkIGJlIGV4YWN0bHkgd2hh
dCB0aGUga2VybmVsIGRvZXMgd2l0aCB0aGUgcGVybSBmaWVsZHMuIFRoZSBwZXJtIApmaWVsZHMg
c2VsZWN0IHRoZSByaWdodCBzeXN0ZW0gY2FsbHMgdGhhdCBzaG91bGQgYmUgcmVwb3J0ZWQgb24u
CiAKPiBUaGlzIGlzIGhpZ2hlciBwZXJmb3JtYW5jZSBiZWNhdXNlIHdlIGFyZSBsaW1pdGluZyB0
aGUgc3lzY2FsbHMgaW5zdGVhZCBvZgo+IG1ha2luZyB1c2Ugb2YgLVMgYWxsIHdoaWNoIGhhcyBt
b3JlIHBhdGhzIG9mIGV2YWx1YXRpb24gZm9yIGVhY2ggYW5kIGV2ZXJ5Cj4gc3lzY2FsbC4KPiAK
PiBTYW1lIHRoaW5nIGZvciB3YXRjaGVzLiBXYXRjaGVzIGFyZSBpbmhlcmVudGx5IC1TIGFsbCBy
dWxlcyB3aGljaCBhcmUgdmVyeQo+IHBlcmZvcm1hbmNlIGludGVuc2l2ZS4KPiBodHRwczovL2dp
dGh1Yi5jb20vbGludXgtYXVkaXQvYXVkaXQtdXNlcnNwYWNlL2Jsb2IvMTQ4MmNlYzc0ZjJkOTQ3
MmY4MWRkNGYKPiAwNTMzNDg0YmQwYzI2ZGVjZC9saWIvbGliYXVkaXQuYyNMODA1CgpUaGVyZSBz
aG91bGQgYmUgbm8gZGlmZmVyZW5jZSBpbiBwZXJmb3JtYW5jZSBiZXR3ZWVuIHdhdGNoZXMgYW5k
IHN5c2NhbGwgCmJhc2VkIGZpbGUgYXVkaXRpbmcuCgo+IElkZWFsbHkgd2Ugc2hvdWxkIGxpbWl0
IHRoZSBzeXNjYWxscyBiYXNlZCBvbiB0aGUgcGVybWlzc2lvbnMgYmVpbmcgdXNlZC4KPiAKPiBJ
IGhhdmUgaW1wbGVtZW50ZWQgdGhlIHNhbWUgaW4gbXkgZW52aXJvbm1lbnQgcnVsZXMgYW5kIGhh
dmUgbm90aWNlZCBhCj4gbWFzc2l2ZSBwZXJmb3JtYW5jZSBkaWZmZXJlbmNlIHdpdGggbm8gZGlm
ZmVyZW5jZSBpbiB0aGUgZXZlbnRzIGJlaW5nCj4gbG9nZ2VkIHNpbmNlIHdlIGFueXdheXMgZmls
dGVyIGV2ZW50dWFsbHkgYmFzZWQgb24gdGhlIHBlcm1pc3Npb25zLgo+IAo+IExldCBtZSBrbm93
IHdoYXQgeW91IGFsbCB0aGluay4KCkknbSBsb29raW5nIGludG8gdGhpcyBtb3JlLiBJIHNlZSBh
IDEgbGluZSBjaGFuZ2UgdGhhdCBJIGFtIHRlc3RpbmcuCgotU3RldmUKCj4gT24gV2VkLCBTZXAg
NiwgMjAyMyBhdCAyOjU4IFBNIFJpY2hhcmQgR3V5IEJyaWdncyA8cmdiQHJlZGhhdC5jb20+IHdy
b3RlOgo+ID4gT24gMjAyMy0wOS0wNiAxMDo1NiwgQW1qYWQgR2FiYmFyIHdyb3RlOgo+ID4gPiBI
aSwKPiA+ID4gCj4gPiA+IEkgaGF2ZSBkb25lIHNvbWUgYW5hbHlzaXMgYW5kIGRpZ2dpbmcgaW50
byBob3cgYm90aCB0aGUgd2F0Y2ggcnVsZXMgYW5kCj4gPiA+IHN5c2NhbGwgcnVsZXMgYXJlIHRy
YW5zbGF0ZWQuCj4gPiA+IAo+ID4gPiBGcm9tIG15IHVuZGVyc3RhbmRpbmcsIGluIHRlcm1zIG9m
IGxvZ2dpbmcsIGJvdGggdGhlIGJlbG93IHJ1bGVzIGFyZQo+ID4gPiBzaW1pbGFyLiBUaGVyZSBp
cyBubyBkaWZmZXJlbmNlIGluIGVpdGhlciBvZiB0aGUgcnVsZXMuCj4gPiA+IAo+ID4gPiAxLiAt
dyAvZXRjIC1wIHdhIC1rIEVUQ19XQVRDSAo+ID4gCj4gPiBUaGV5IGFyZSBzaW1pbGFyIGluIHRo
aXMgY2FzZS4KPiA+IC13IGJlaGF2ZXMgZGlmZmVyZW50bHkgZGVwZW5kaW5nIG9uIHRoZSBleGlz
dGFuY2Ugb2YgdGhlIHdhdGNoZWQgZW50aXR5Cj4gPiBhbmQgdGhlIHByZXNlbmNlIG9mIGEgdHJh
aWxpbmcgIi8iLiAgVGhpcyBpcyB3aHkgdGhlIGZvcm0gYWJvdmUgaXMKPiA+IGRlcHJlY2F0ZWQu
Cj4gPiAKPiA+ID4gMi4gLWEgYWx3YXlzLGV4aXQgLUYgYXJjaD1iNjQgLVMgPGFsbCBzeXNjYWxs
cyBwYXJ0IG9mIHRoZSB3cml0ZSBhbmQKPiA+ID4gYXR0cgo+ID4gPiBjbGFzc2VzPiAtRiBkaXI9
L2V0YyAgLUYgcGVybT13YSAtayBFVENfV0FUQ0gKPiA+ID4gCj4gPiA+IFRoZSB3cml0ZSBhbmQg
YXR0ciBjbGFzc2VzIGNvbnNpc3Qgb2Ygc3lzY2FsbHMgaW4KPiA+ID4g4oCcaW5jbHVkZS9hc20t
Z2VuZXJpYy9hdWRpdF8qLmjigJwuCj4gPiA+IAo+ID4gPiAgVGhlIHBlcm0gZmxhZyBpcyBuZWVk
ZWQgaW4gdGhlIHNlY29uZCBjYXNlIGZvciBpbmNsdWRpbmcgb3Blbi9vcGVuYXQKPiA+ID4gCj4g
PiA+IHN5c2NhbGxzIHdoaWNoIGFyZSBub3QgYSBwYXJ0IG9mIHRoZSB3cml0ZSBhbmQgYXR0ciBz
eXNjYWxsIGxpc3QuCj4gPiA+IAo+ID4gPiBJJ2QgbGlrZSB0byB2ZXJpZnkgaWYgd2hhdCBJIG1l
bnRpb25lZCBlYXJsaWVyIGlzIGFjY3VyYXRlLCBhbmQgSSBoYXZlCj4gPiA+IGFuCj4gPiA+IGFk
ZGl0aW9uYWwgcG9pbnQgYnV0IGRlcGVuZHMgb24gd2hldGhlciB0aGlzIGlzIGFjY3VyYXRlLgo+
ID4gPiAKPiA+ID4gQWxpCj4gPiAKPiA+IC0gUkdCCj4gPiAKPiA+IC0tCj4gPiBSaWNoYXJkIEd1
eSBCcmlnZ3MgPHJnYkByZWRoYXQuY29tPgo+ID4gU3IuIFMvVyBFbmdpbmVlciwgS2VybmVsIFNl
Y3VyaXR5LCBCYXNlIE9wZXJhdGluZyBTeXN0ZW1zCj4gPiBSZW1vdGUsIE90dGF3YSwgUmVkIEhh
dCBDYW5hZGEKPiA+IFVwc3RyZWFtIElSQzogU3VuUmF5Y2VyCj4gPiBWb2ljZTogKzEuNjEzLjg2
MCAyMzU0IFNNUzogKzEuNjEzLjUxOC42NTcwCgoKCgotLQpMaW51eC1hdWRpdCBtYWlsaW5nIGxp
c3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0Cg==

