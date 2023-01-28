Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C3567F9A6
	for <lists+linux-audit@lfdr.de>; Sat, 28 Jan 2023 17:48:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674924484;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pyiDnoL0Tk3x88xcPhsKGudH4h1zKf64SaZtwRr6Vho=;
	b=J7cW8WqbdzLb5OjtU6gx4UjUjveRHnfNmQ8Br1Nzr/w1UkuhwYAAM4w/x7U2j7/vAVsxf3
	46eHhqey4uDbcUohHxM8BU0nJxHm8mvak9q13N0DvsWw1Y2JOINsod7BjOaaKA/dgsmUXD
	OH5nlECTLH67Db23N/fFtP+Mh3vqQtY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-544-F_0qlNO2OPKXh4n0fqAH3w-1; Sat, 28 Jan 2023 11:48:03 -0500
X-MC-Unique: F_0qlNO2OPKXh4n0fqAH3w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D71B3C01DAC;
	Sat, 28 Jan 2023 16:48:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6E5BA492B06;
	Sat, 28 Jan 2023 16:48:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B7D1E1946597;
	Sat, 28 Jan 2023 16:47:59 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 761EA1946587 for <linux-audit@listman.corp.redhat.com>;
 Sat, 28 Jan 2023 16:47:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 33E4C400D795; Sat, 28 Jan 2023 16:47:58 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.8.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82425400F8F0;
 Sat, 28 Jan 2023 16:47:57 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Jens Axboe <axboe@kernel.dk>, Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v1 0/2] two suggested iouring op audit updates
Date: Sat, 28 Jan 2023 11:47:56 -0500
Message-ID: <12151218.O9o76ZdvQC@x2>
Organization: Red Hat
In-Reply-To: <CAHC9VhRpu7WZDqWKcLDj18A0Z5FJdUU=eUL3wbJH1CnEBWB4GA@mail.gmail.com>
References: <cover.1674682056.git.rgb@redhat.com>
 <d9da8035-ed81-fb28-bf3a-f98c8a1e044a@kernel.dk>
 <CAHC9VhRpu7WZDqWKcLDj18A0Z5FJdUU=eUL3wbJH1CnEBWB4GA@mail.gmail.com>
MIME-Version: 1.0
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
Cc: Christian Brauner <brauner@kernel.org>, Richard Guy Briggs <rgb@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, Pavel Begunkov <asml.silence@gmail.com>,
 Linux-Audit Mailing List <linux-audit@redhat.com>, Stefan Roesch <shr@fb.com>,
 Eric Paris <eparis@parisplace.org>, io-uring@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpZGF5LCBKYW51YXJ5IDI3LCAyMDIzIDU6NTM6MjQgUE0gRVNUIFBhdWwgTW9vcmUgd3Jv
dGU6Cj4gT24gRnJpLCBKYW4gMjcsIDIwMjMgYXQgNTo0NiBQTSBKZW5zIEF4Ym9lIDxheGJvZUBr
ZXJuZWwuZGs+IHdyb3RlOgo+ID4gT24gMS8yNy8yMyAzOjM44oCvUE0sIFBhdWwgTW9vcmUgd3Jv
dGU6Cj4gPiA+IE9uIEZyaSwgSmFuIDI3LCAyMDIzIGF0IDI6NDMgUE0gSmVucyBBeGJvZSA8YXhi
b2VAa2VybmVsLmRrPiB3cm90ZToKPiA+ID4+IE9uIDEvMjcvMjMgMTI6NDLigK9QTSwgUGF1bCBN
b29yZSB3cm90ZToKPiA+ID4+PiBPbiBGcmksIEphbiAyNywgMjAyMyBhdCAxMjo0MCBQTSBKZW5z
IEF4Ym9lIDxheGJvZUBrZXJuZWwuZGs+IHdyb3RlOgo+ID4gPj4+PiBPbiAxLzI3LzIzIDEwOjIz
4oCvQU0sIFJpY2hhcmQgR3V5IEJyaWdncyB3cm90ZToKPiA+ID4+Pj4+IEEgY291cGxlIG9mIHVw
ZGF0ZXMgdG8gdGhlIGlvdXJpbmcgb3BzIGF1ZGl0IGJ5cGFzcyBzZWxlY3Rpb25zCj4gPiA+Pj4+
PiBzdWdnZXN0ZWQgaW4gY29uc3VsdGF0aW9uIHdpdGggU3RldmUgR3J1YmIuCj4gPiA+Pj4+PiAK
PiA+ID4+Pj4+IFJpY2hhcmQgR3V5IEJyaWdncyAoMik6Cj4gPiA+Pj4+PiAgIGlvX3VyaW5nLGF1
ZGl0OiBhdWRpdCBJT1JJTkdfT1BfRkFEVklTRSBidXQgbm90IElPUklOR19PUF9NQURWSVNFCj4g
PiA+Pj4+PiAgIGlvX3VyaW5nLGF1ZGl0OiBkbyBub3QgbG9nIElPUklOR19PUF8qR0VUWEFUVFIK
PiA+ID4+Pj4+ICAKPiA+ID4+Pj4+ICBpb191cmluZy9vcGRlZi5jIHwgNCArKystCj4gPiA+Pj4+
PiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4gPj4+
PiAKPiA+ID4+Pj4gTG9vayBmaW5lIHRvIG1lIC0gd2Ugc2hvdWxkIHByb2JhYmx5IGFkZCBzdGFi
bGUgdG8gYm90aCBvZiB0aGVtLAo+ID4gPj4+PiBqdXN0IHRvIGtlZXAgdGhpbmdzIGNvbnNpc3Rl
bnQgYWNyb3NzIHJlbGVhc2VzLiBJIGNhbiBxdWV1ZSB0aGVtIHVwCj4gPiA+Pj4+IGZvciA2LjMu
Cj4gPiA+Pj4gCj4gPiA+Pj4gUGxlYXNlIGhvbGQgb2ZmIHVudGlsIEkndmUgaGFkIGEgY2hhbmNl
IHRvIGxvb2sgdGhlbSBvdmVyIC4uLgo+ID4gPj4gCj4gPiA+PiBJIGhhdmVuJ3QgdGFrZW4gYW55
dGhpbmcgeWV0LCBmb3IgdGhpbmdzIGxpa2UgdGhpcyBJIGFsd2F5cyBsZXQgaXQKPiA+ID4+IHNp
bW1lciB1bnRpbCBwZW9wbGUgaGF2ZSBoYWQgYSBjaGFuY2UgdG8gZG8gc28uCj4gPiA+IAo+ID4g
PiBUaGFua3MuICBGV0lXLCB0aGF0IHNvdW5kcyB2ZXJ5IHJlYXNvbmFibGUgdG8gbWUsIGJ1dCBJ
J3ZlIHNlZW4gbG90cwo+ID4gPiBvZiBkaWZmZXJlbnQgYmVoYXZpb3JzIGFjcm9zcyBzdWJzeXN0
ZW1zIGFuZCB3YW50ZWQgdG8gbWFrZSBzdXJlIHdlCj4gPiA+IHdlcmUgb24gdGhlIHNhbWUgcGFn
ZS4KPiA+IAo+ID4gU291bmRzIGZhaXIuIEJUVywgY2FuIHdlIHN0b3AgQ0MnaW5nIGNsb3NlZCBs
aXN0cyBvbiBwYXRjaAo+ID4gc3VibWlzc2lvbnM/IEdldHRpbmcgdGhlc2U6Cj4gPiAKPiA+IFlv
dXIgbWVzc2FnZSB0byBMaW51eC1hdWRpdCBhd2FpdHMgbW9kZXJhdG9yIGFwcHJvdmFsCj4gPiAK
PiA+IG9uIGV2ZXJ5IHJlcGx5IGlzIHJlYWxseSBhbm5veWluZy4KPiAKPiBXZSBraW5kYSBuZWVk
IGF1ZGl0IHJlbGF0ZWQgc3R1ZmYgb24gdGhlIGxpbnV4LWF1ZGl0IGxpc3QsIHRoYXQncyBvdXIK
PiBtYWlsaW5nIGxpc3QgZm9yIGF1ZGl0IHN0dWZmLgo+IAo+IEhvd2V2ZXIsIEkgYWdyZWUgdGhh
dCBpdCBpcyBjcmFwIHRoYXQgdGhlIGxpbnV4LWF1ZGl0IGxpc3QgaXMKPiBtb2RlcmF0ZWQsIGJ1
dCB1bmZvcnR1bmF0ZWx5IHRoYXQgaXNuJ3Qgc29tZXRoaW5nIEkgY29udHJvbCAoSSBoYXZlbid0
Cj4gd29ya2VkIGZvciBSSCBpbiB5ZWFycywgYW5kIGV2ZW4gdGhlbiB0aGUgbGlzdCBvd25lciB3
YXMgcmVhbGx5IHdlaXJkCj4gYWJvdXQgbWFuYWdpbmcgdGhlIGxpc3QpLiAgT2NjYXNpb25hbGx5
IEkgZ3J1bWJsZSBhYm91dCBtb3ZpbmcgdGhlCj4ga2VybmVsIGF1ZGl0IGRldmVsb3BtZW50IHRv
IGEgbGludXgtYXVkaXQgbGlzdCBvbiB2Z2VyIGJ1dCBoYXZlbid0Cj4gYm90aGVyZWQgeWV0LCBw
ZXJoYXBzIHRoaXMgaXMgYXMgZ29vZCBhIHJlYXNvbiBhcyBhbnkuCj4gCj4gUmljaGFyZCwgU3Rl
dmUgLSBhbnkgY2hhbmNlIG9mIG9wZW5pbmcgdGhlIGxpbnV4LWF1ZGl0IGxpc3Q/CgpVbmZvcnR1
bmF0ZWx5LCBpdCByZWFsbHkgaGFzIHRvIGJlIHRoaXMgd2F5LiBJIGRlbGV0ZWQgMTAgc3BhbSBl
bWFpbHMgCnllc3RlcmRheS4gSXQgc2VlbXMgbGlrZSBzb21lIHBlb3BsZSBzdWJzY3JpYmVkIHRv
IHRoaXMgbGlzdCBhcmUgY29tcHJvbWlzZWQuIApCZWNhdXNlIGV2ZXJ5dGltZSB0aGVyZSBpcyBh
IGxlZ2l0IGVtYWlsLCBpdCdzIGZvbGxvd2VkIGluIGEgZmV3IHNlY29uZHMgYnkgYSAKc3BhbSBl
bWFpbC4KCkFueXdheXMsIGFsbCBsZWdpdCBlbWFpbCB3aWxsIGJlIGFwcHJvdmVkIHdpdGhvdXQg
bmVlZGluZyB0byBiZSBzdWJzY3JpYmVkLgoKLVN0ZXZlCgoKLS0KTGludXgtYXVkaXQgbWFpbGlu
ZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1hdWRpdAo=

