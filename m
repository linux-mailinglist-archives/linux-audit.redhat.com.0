Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1A667F204
	for <lists+linux-audit@lfdr.de>; Sat, 28 Jan 2023 00:07:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674860869;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8YH/dZ9rjrYIARXW4a3cejw8hZQXthfvCgL8OP5k/eE=;
	b=bTBu0SKy8cE2s621i3jXEqnsLWeu+ghmSu8/se2abAgrh5KdIgAM60nkHIQhrbMQ/28cVo
	XvCqEvyNsH2opzWBGefEl3Q179z4A0T7qvuZNbGsK2jDwH4GrxOpmIzCXK6N0u4YR6NRDk
	atHOICCW0nwq/uc9wraRuCjYtD2udbE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-zg2y_JEXPpKgkcBL47QJLA-1; Fri, 27 Jan 2023 18:07:47 -0500
X-MC-Unique: zg2y_JEXPpKgkcBL47QJLA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB3AA857F82;
	Fri, 27 Jan 2023 23:07:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 254921121315;
	Fri, 27 Jan 2023 23:07:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B5B6A19465A3;
	Fri, 27 Jan 2023 23:07:44 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2AD0C194658C for <linux-audit@listman.corp.redhat.com>;
 Fri, 27 Jan 2023 23:07:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1E380400F8C0; Fri, 27 Jan 2023 23:07:44 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-0-3.rdu2.redhat.com [10.22.0.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D68A40C945A;
 Fri, 27 Jan 2023 23:07:42 +0000 (UTC)
Date: Fri, 27 Jan 2023 18:07:40 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH v1 0/2] two suggested iouring op audit updates
Message-ID: <Y9RZPFTA8UUam12R@madcap2.tricolour.ca>
References: <cover.1674682056.git.rgb@redhat.com>
 <da695bf4-bd9b-a03d-3fbc-686724a7b602@kernel.dk>
 <CAHC9VhSRbay5bEUMJngpj+6Ss=WLeRoyJaNNMip+TyTkTJ6=Lg@mail.gmail.com>
 <24fbe6cb-ee80-f726-b260-09f394ead764@kernel.dk>
 <CAHC9VhRuvV9vjhmTM4eGJkWmpZmSkgVaoQ=L6g3cahej-F52tQ@mail.gmail.com>
 <d9da8035-ed81-fb28-bf3a-f98c8a1e044a@kernel.dk>
 <CAHC9VhRpu7WZDqWKcLDj18A0Z5FJdUU=eUL3wbJH1CnEBWB4GA@mail.gmail.com>
 <7904e869-f885-e406-9fe6-495a6e9790e4@kernel.dk>
MIME-Version: 1.0
In-Reply-To: <7904e869-f885-e406-9fe6-495a6e9790e4@kernel.dk>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMjAyMy0wMS0yNyAxNjowMiwgSmVucyBBeGJvZSB3cm90ZToKPiBPbiAxLzI3LzIzIDM6NTPi
gK9QTSwgUGF1bCBNb29yZSB3cm90ZToKPiA+IE9uIEZyaSwgSmFuIDI3LCAyMDIzIGF0IDU6NDYg
UE0gSmVucyBBeGJvZSA8YXhib2VAa2VybmVsLmRrPiB3cm90ZToKPiA+PiBPbiAxLzI3LzIzIDM6
MzjigK9QTSwgUGF1bCBNb29yZSB3cm90ZToKPiA+Pj4gT24gRnJpLCBKYW4gMjcsIDIwMjMgYXQg
Mjo0MyBQTSBKZW5zIEF4Ym9lIDxheGJvZUBrZXJuZWwuZGs+IHdyb3RlOgo+ID4+Pj4gT24gMS8y
Ny8yMyAxMjo0MuKAr1BNLCBQYXVsIE1vb3JlIHdyb3RlOgo+ID4+Pj4+IE9uIEZyaSwgSmFuIDI3
LCAyMDIzIGF0IDEyOjQwIFBNIEplbnMgQXhib2UgPGF4Ym9lQGtlcm5lbC5kaz4gd3JvdGU6Cj4g
Pj4+Pj4+IE9uIDEvMjcvMjMgMTA6MjPigK9BTSwgUmljaGFyZCBHdXkgQnJpZ2dzIHdyb3RlOgo+
ID4+Pj4+Pj4gQSBjb3VwbGUgb2YgdXBkYXRlcyB0byB0aGUgaW91cmluZyBvcHMgYXVkaXQgYnlw
YXNzIHNlbGVjdGlvbnMgc3VnZ2VzdGVkIGluCj4gPj4+Pj4+PiBjb25zdWx0YXRpb24gd2l0aCBT
dGV2ZSBHcnViYi4KPiA+Pj4+Pj4+Cj4gPj4+Pj4+PiBSaWNoYXJkIEd1eSBCcmlnZ3MgKDIpOgo+
ID4+Pj4+Pj4gICBpb191cmluZyxhdWRpdDogYXVkaXQgSU9SSU5HX09QX0ZBRFZJU0UgYnV0IG5v
dCBJT1JJTkdfT1BfTUFEVklTRQo+ID4+Pj4+Pj4gICBpb191cmluZyxhdWRpdDogZG8gbm90IGxv
ZyBJT1JJTkdfT1BfKkdFVFhBVFRSCj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4gIGlvX3VyaW5nL29wZGVm
LmMgfCA0ICsrKy0KPiA+Pj4+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4gPj4+Pj4+Cj4gPj4+Pj4+IExvb2sgZmluZSB0byBtZSAtIHdlIHNob3Vs
ZCBwcm9iYWJseSBhZGQgc3RhYmxlIHRvIGJvdGggb2YgdGhlbSwganVzdAo+ID4+Pj4+PiB0byBr
ZWVwIHRoaW5ncyBjb25zaXN0ZW50IGFjcm9zcyByZWxlYXNlcy4gSSBjYW4gcXVldWUgdGhlbSB1
cCBmb3IgNi4zLgo+ID4+Pj4+Cj4gPj4+Pj4gUGxlYXNlIGhvbGQgb2ZmIHVudGlsIEkndmUgaGFk
IGEgY2hhbmNlIHRvIGxvb2sgdGhlbSBvdmVyIC4uLgo+ID4+Pj4KPiA+Pj4+IEkgaGF2ZW4ndCB0
YWtlbiBhbnl0aGluZyB5ZXQsIGZvciB0aGluZ3MgbGlrZSB0aGlzIEkgYWx3YXlzIGxldCBpdAo+
ID4+Pj4gc2ltbWVyIHVudGlsIHBlb3BsZSBoYXZlIGhhZCBhIGNoYW5jZSB0byBkbyBzby4KPiA+
Pj4KPiA+Pj4gVGhhbmtzLiAgRldJVywgdGhhdCBzb3VuZHMgdmVyeSByZWFzb25hYmxlIHRvIG1l
LCBidXQgSSd2ZSBzZWVuIGxvdHMKPiA+Pj4gb2YgZGlmZmVyZW50IGJlaGF2aW9ycyBhY3Jvc3Mg
c3Vic3lzdGVtcyBhbmQgd2FudGVkIHRvIG1ha2Ugc3VyZSB3ZQo+ID4+PiB3ZXJlIG9uIHRoZSBz
YW1lIHBhZ2UuCj4gPj4KPiA+PiBTb3VuZHMgZmFpci4gQlRXLCBjYW4gd2Ugc3RvcCBDQydpbmcg
Y2xvc2VkIGxpc3RzIG9uIHBhdGNoCj4gPj4gc3VibWlzc2lvbnM/IEdldHRpbmcgdGhlc2U6Cj4g
Pj4KPiA+PiBZb3VyIG1lc3NhZ2UgdG8gTGludXgtYXVkaXQgYXdhaXRzIG1vZGVyYXRvciBhcHBy
b3ZhbAo+ID4+Cj4gPj4gb24gZXZlcnkgcmVwbHkgaXMgcmVhbGx5IGFubm95aW5nLgo+ID4gCj4g
PiBXZSBraW5kYSBuZWVkIGF1ZGl0IHJlbGF0ZWQgc3R1ZmYgb24gdGhlIGxpbnV4LWF1ZGl0IGxp
c3QsIHRoYXQncyBvdXIKPiA+IG1haWxpbmcgbGlzdCBmb3IgYXVkaXQgc3R1ZmYuCj4gCj4gU3Vy
ZSwgYnV0IHRoZW4gaXQgc2hvdWxkIGJlIG9wZW4uIE9yIGRvIHNlcGFyYXRlIHBvc3RpbmdzIG9y
IHNvbWV0aGluZy4KPiBDQydpbmcgYSBjbG9zZWQgbGlzdCB3aXRoIG9wZW4gbGlzdHMgYW5kIHNl
bmRpbmcgZW1haWwgdG8gcGVvcGxlIHRoYXQKPiBhcmUgbm90IG9uIHRoYXQgY2xvc2VkIGxpc3Qg
aXMgYmFkIGZvcm0uCgpJJ3ZlIG1hZGUgYW4gaW5xdWlyeS4KCj4gSmVucyBBeGJvZQoKLSBSR0IK
Ci0tClJpY2hhcmQgR3V5IEJyaWdncyA8cmdiQHJlZGhhdC5jb20+ClNyLiBTL1cgRW5naW5lZXIs
IEtlcm5lbCBTZWN1cml0eSwgQmFzZSBPcGVyYXRpbmcgU3lzdGVtcwpSZW1vdGUsIE90dGF3YSwg
UmVkIEhhdCBDYW5hZGEKSVJDOiByZ2IsIFN1blJheWNlcgpWb2ljZTogKzEuNjQ3Ljc3Ny4yNjM1
LCBJbnRlcm5hbDogKDgxKSAzMjYzNQotLQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QKTGludXgt
YXVkaXRAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWF1ZGl0Cg==

