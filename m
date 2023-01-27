Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEFD67F206
	for <lists+linux-audit@lfdr.de>; Sat, 28 Jan 2023 00:08:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674860895;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PuGmFSl+atgmwHqI/evRMN2pPvG/KPLZdu7VAQIw0E4=;
	b=L4qjY9hmppiiU6Jk36QNabMMad+n3mH6ElzwpVEyJ3lrk2J5nm6ghLYJRpc773F8pSWsEx
	BRPxEmDrTpQZeT2PFO9cOLXyIZ09ZsojXEGnGPEuLensPBy5j6dKAaxEhHHUXV7U6OadJz
	vgHNQrvou2AkUutmqYILRnK//pbt0MQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-29-rNW1Ki9NMNyHgGk00SkB6w-1; Fri, 27 Jan 2023 18:08:12 -0500
X-MC-Unique: rNW1Ki9NMNyHgGk00SkB6w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2EA2E101B429;
	Fri, 27 Jan 2023 23:08:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 13BAF2166B26;
	Fri, 27 Jan 2023 23:08:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A72D219465A3;
	Fri, 27 Jan 2023 23:08:08 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 85BB1194658C for <linux-audit@listman.corp.redhat.com>;
 Fri, 27 Jan 2023 23:08:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 67EDA40C945A; Fri, 27 Jan 2023 23:08:07 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-0-3.rdu2.redhat.com [10.22.0.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D3902400F8F1;
 Fri, 27 Jan 2023 23:08:05 +0000 (UTC)
Date: Fri, 27 Jan 2023 18:08:03 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH v1 1/2] io_uring,audit: audit IORING_OP_FADVISE but not
 IORING_OP_MADVISE
Message-ID: <Y9RZU4InKURO/yGP@madcap2.tricolour.ca>
References: <cover.1674682056.git.rgb@redhat.com>
 <68eb0c2dd50bca1af91203669f7f1f8312331f38.1674682056.git.rgb@redhat.com>
 <CAHC9VhSZNGs+SQU7WCD+ObMcwv-=1ZkBts8oHn40qWsQ=n0pXA@mail.gmail.com>
 <6d3f76ae-9f86-a96e-d540-cfd45475e288@kernel.dk>
 <Y9RYFHucRL5TrsDh@madcap2.tricolour.ca>
 <68b599bb-2329-3125-1859-cf529fbeea00@kernel.dk>
MIME-Version: 1.0
In-Reply-To: <68b599bb-2329-3125-1859-cf529fbeea00@kernel.dk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
Cc: Christian Brauner <brauner@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Pavel Begunkov <asml.silence@gmail.com>,
 Linux-Audit Mailing List <linux-audit@redhat.com>, Stefan Roesch <shr@fb.com>,
 Eric Paris <eparis@parisplace.org>, io-uring@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMjAyMy0wMS0yNyAxNjowMywgSmVucyBBeGJvZSB3cm90ZToKPiBPbiAxLzI3LzIzIDQ6MDLi
gK9QTSwgUmljaGFyZCBHdXkgQnJpZ2dzIHdyb3RlOgo+ID4gT24gMjAyMy0wMS0yNyAxNTo0NSwg
SmVucyBBeGJvZSB3cm90ZToKPiA+PiBPbiAxLzI3LzIzIDM6MzU/UE0sIFBhdWwgTW9vcmUgd3Jv
dGU6Cj4gPj4+IE9uIEZyaSwgSmFuIDI3LCAyMDIzIGF0IDEyOjI0IFBNIFJpY2hhcmQgR3V5IEJy
aWdncyA8cmdiQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4+Pj4KPiA+Pj4+IFNpbmNlIEZBRFZJU0Ug
Y2FuIHRydW5jYXRlIGZpbGVzIGFuZCBNQURWSVNFIG9wZXJhdGVzIG9uIG1lbW9yeSwgcmV2ZXJz
ZQo+ID4+Pj4gdGhlIGF1ZGl0X3NraXAgdGFncy4KPiA+Pj4+Cj4gPj4+PiBGaXhlczogNWJkMjE4
MmQ1OGU5ICgiYXVkaXQsaW9fdXJpbmcsaW8td3E6IGFkZCBzb21lIGJhc2ljIGF1ZGl0IHN1cHBv
cnQgdG8gaW9fdXJpbmciKQo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogUmljaGFyZCBHdXkgQnJpZ2dz
IDxyZ2JAcmVkaGF0LmNvbT4KPiA+Pj4+IC0tLQo+ID4+Pj4gIGlvX3VyaW5nL29wZGVmLmMgfCAy
ICstCj4gPj4+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Cj4gPj4+Pgo+ID4+Pj4gZGlmZiAtLWdpdCBhL2lvX3VyaW5nL29wZGVmLmMgYi9pb191cmluZy9v
cGRlZi5jCj4gPj4+PiBpbmRleCAzYWEwZDY1YzUwZTMuLmEyYmY1M2I0YTM4YSAxMDA2NDQKPiA+
Pj4+IC0tLSBhL2lvX3VyaW5nL29wZGVmLmMKPiA+Pj4+ICsrKyBiL2lvX3VyaW5nL29wZGVmLmMK
PiA+Pj4+IEBAIC0zMDYsMTIgKzMwNiwxMiBAQCBjb25zdCBzdHJ1Y3QgaW9fb3BfZGVmIGlvX29w
X2RlZnNbXSA9IHsKPiA+Pj4+ICAgICAgICAgfSwKPiA+Pj4+ICAgICAgICAgW0lPUklOR19PUF9G
QURWSVNFXSA9IHsKPiA+Pj4+ICAgICAgICAgICAgICAgICAubmVlZHNfZmlsZSAgICAgICAgICAg
ICA9IDEsCj4gPj4+PiAtICAgICAgICAgICAgICAgLmF1ZGl0X3NraXAgICAgICAgICAgICAgPSAx
LAo+ID4+Pj4gICAgICAgICAgICAgICAgIC5uYW1lICAgICAgICAgICAgICAgICAgID0gIkZBRFZJ
U0UiLAo+ID4+Pj4gICAgICAgICAgICAgICAgIC5wcmVwICAgICAgICAgICAgICAgICAgID0gaW9f
ZmFkdmlzZV9wcmVwLAo+ID4+Pj4gICAgICAgICAgICAgICAgIC5pc3N1ZSAgICAgICAgICAgICAg
ICAgID0gaW9fZmFkdmlzZSwKPiA+Pj4+ICAgICAgICAgfSwKPiA+Pj4KPiA+Pj4gSSd2ZSBuZXZl
ciB1c2VkIHBvc2l4X2ZhZHZpc2UoKSBvciB0aGUgYXNzb2NpYXRlZCBmYWR2aXNlNjQqKCkKPiA+
Pj4gc3lzY2FsbHMsIGJ1dCBmcm9tIHF1aWNrbHkgcmVhZGluZyB0aGUgbWFucGFnZXMgYW5kIHRo
ZQo+ID4+PiBnZW5lcmljX2ZhZHZpc2UoKSBmdW5jdGlvbiBpbiB0aGUga2VybmVsIEknbSBtaXNz
aW5nIHdoZXJlIHRoZSBmYWR2aXNlCj4gPj4+IGZhbWlseSBvZiBmdW5jdGlvbnMgY291bGQgYmUg
dXNlZCB0byB0cnVuY2F0ZSBhIGZpbGUsIGNhbiB5b3Ugc2hvdyBtZQo+ID4+PiB3aGVyZSB0aGlz
IGhhcHBlbnM/ICBUaGUgY2xvc2VzdCBJIGNhbiBzZWUgaXMgdGhlIG1hbmlwdWxhdGlvbiBvZiB0
aGUKPiA+Pj4gcGFnZSBjYWNoZSwgYnV0IHRoYXQgc2hvdWxkbid0IGFjdHVhbGx5IG1vZGlmeSB0
aGUgZmlsZSAuLi4gcmlnaHQ/Cj4gPj4KPiA+PiBZZWFoLCBob25lc3RseSBub3Qgc3VyZSB3aGVy
ZSB0aGF0IGNhbWUgZnJvbS4gTWF5YmUgaXQncyBiZWluZyBtaXhlZCB1cAo+ID4+IHdpdGggZmFs
bG9jYXRlPyBBbGwgZmFkdmlzZSAob3IgbWFkdmlzZSwgZm9yIHRoYXQgbWF0dGVyKSBkb2VzIGlz
Cj4gPj4gcHJvdmlkZSBoaW50cyBvbiB0aGUgY2FjaGluZyBvciBhY2Nlc3MgcGF0dGVybi4gT24g
c2Vjb25kIHRob3VnaHQsIGJvdGgKPiA+PiBvZiB0aGVzZSBzaG91bGQgYmUgYWJsZSB0byBzZXQg
YXVkaXRfc2tpcCBhcyBmYXIgYXMgSSBjYW4gdGVsbC4KPiA+IAo+ID4gVGhhdCB3YXMgb25lIHN1
c3BpY2lvbiBJIGhhZC4gIElmIHRoaXMgaXMgdGhlIGNhc2UsIEknZCBhZ3JlZSBib3RoIGNvdWxk
Cj4gPiBiZSBza2lwcGVkLgo+IAo+IEknZCBiZSBzdXJwcmlzZWQgaWYgU3RldmUgZGlkbid0IG1p
eCB0aGVtIHVwLiBPbmNlIGhlIHJlc3BvbmRzLCBjYW4geW91Cj4gc2VuZCBhIHYyIHdpdGggdGhl
IGNvcnJlY3Rpb24/CgpHbGFkbHkuCgo+IEplbnMgQXhib2UKCi0gUkdCCgotLQpSaWNoYXJkIEd1
eSBCcmlnZ3MgPHJnYkByZWRoYXQuY29tPgpTci4gUy9XIEVuZ2luZWVyLCBLZXJuZWwgU2VjdXJp
dHksIEJhc2UgT3BlcmF0aW5nIFN5c3RlbXMKUmVtb3RlLCBPdHRhd2EsIFJlZCBIYXQgQ2FuYWRh
CklSQzogcmdiLCBTdW5SYXljZXIKVm9pY2U6ICsxLjY0Ny43NzcuMjYzNSwgSW50ZXJuYWw6ICg4
MSkgMzI2MzUKLS0KTGludXgtYXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5j
b20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1hdWRp
dAo=

