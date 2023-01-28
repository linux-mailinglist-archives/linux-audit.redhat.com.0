Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 859BF67F9BC
	for <lists+linux-audit@lfdr.de>; Sat, 28 Jan 2023 18:04:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674925446;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0fVQbRqNGQF0DOQGzAPnt6D/4suwiqCcF8wNH7HFEGg=;
	b=SZLWV8OE9cgM1wwveSdrHg0YPe0IPjaU4CT8f7OZ2ObicW+597oEC7SOpeMUqWQRUutR2r
	DIo1Al/u9N3UT5wF04vYPmRrryMgnj9iokLNqpRDkpolaDiMoSMC7/F9j/4MvkCCy05ye4
	OvUswmd1AW+qXIfyk5gTz/cZJvRY3j8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-396-c55R913rPDmmu6fVpRJtRA-1; Sat, 28 Jan 2023 12:04:05 -0500
X-MC-Unique: c55R913rPDmmu6fVpRJtRA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93456800B30;
	Sat, 28 Jan 2023 17:04:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9EF58422AE;
	Sat, 28 Jan 2023 17:04:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E539C1946597;
	Sat, 28 Jan 2023 17:04:00 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 08289194658D for <linux-audit@listman.corp.redhat.com>;
 Sat, 28 Jan 2023 17:03:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7FD78C15BAE; Sat, 28 Jan 2023 17:03:54 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 788A2C15BAD
 for <linux-audit@redhat.com>; Sat, 28 Jan 2023 17:03:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5DCB3185A78B
 for <linux-audit@redhat.com>; Sat, 28 Jan 2023 17:03:54 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-252-vuP5ly1iPLKB7i75qQs7wA-1; Sat, 28 Jan 2023 12:03:52 -0500
X-MC-Unique: vuP5ly1iPLKB7i75qQs7wA-1
Received: by mail-pl1-f174.google.com with SMTP id g23so7781167plq.12
 for <linux-audit@redhat.com>; Sat, 28 Jan 2023 09:03:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FZB8lg0YeivU1JmY6qzB+xB0HCsqlxdwoCMFwmTxhGc=;
 b=bi0kRubagEuVYUodVFvMnCFxc68TDuqiUoBViRVZyDR9faXuJI2Ij6oBBB6We8uUQv
 Ol+en5IRjEzwGywWF5OpD86DI/GyJyFzDwzOhiE3LSX90BC7VvftqbPslf4Dr4f9aE8/
 zttK5ab4kaD1EBX96c3Se0EjI0xEoxUAX7zRqC9BVa9pSovtES7h9ofMwxGJkq2UyJnc
 TKoKU5nSBqtLKCpq0TM3RGAYG3AJPmxUR33gVw0pP5TZePZ3nKVe5fCY4iKM/RgqadLe
 7MBuSVYRkmXhOJeFU7+Ro3gheh6K94jtiv2dXxW49WDyDXZS60h3hkpLjYcJiTCK3aTA
 KLxg==
X-Gm-Message-State: AFqh2kpmODkorN/wl1vTpQtEsSPiPvbA9E/2SH/YatJkRZn1+vu+k8HT
 Tpftr8J4PGSFz5aFT47B40NUOGiHT6M8tz0ThJnt
X-Google-Smtp-Source: AMrXdXts3HgaSZ1OMsaBQlmOSyte1KDM2wha7k7fk7BHABCeqM3pzpwKqS0gOaF7QboopE3ejUebzS9ZE6jmFHPI+3w=
X-Received: by 2002:a17:902:c404:b0:194:954c:fb8 with SMTP id
 k4-20020a170902c40400b00194954c0fb8mr5105429plk.20.1674925431278; Sat, 28 Jan
 2023 09:03:51 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674682056.git.rgb@redhat.com>
 <d9da8035-ed81-fb28-bf3a-f98c8a1e044a@kernel.dk>
 <CAHC9VhRpu7WZDqWKcLDj18A0Z5FJdUU=eUL3wbJH1CnEBWB4GA@mail.gmail.com>
 <12151218.O9o76ZdvQC@x2>
In-Reply-To: <12151218.O9o76ZdvQC@x2>
From: Paul Moore <paul@paul-moore.com>
Date: Sat, 28 Jan 2023 12:03:40 -0500
Message-ID: <CAHC9VhRoJRRcsXWOMkBQWKOUkCdJEL5mkb+w196rZPJn0KuFtw@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] two suggested iouring op audit updates
To: Steve Grubb <sgrubb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
Cc: Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Richard Guy Briggs <rgb@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 Pavel Begunkov <asml.silence@gmail.com>,
 Linux-Audit Mailing List <linux-audit@redhat.com>, Stefan Roesch <shr@fb.com>,
 Eric Paris <eparis@parisplace.org>, io-uring@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gU2F0LCBKYW4gMjgsIDIwMjMgYXQgMTE6NDggQU0gU3RldmUgR3J1YmIgPHNncnViYkByZWRo
YXQuY29tPiB3cm90ZToKPiBPbiBGcmlkYXksIEphbnVhcnkgMjcsIDIwMjMgNTo1MzoyNCBQTSBF
U1QgUGF1bCBNb29yZSB3cm90ZToKPiA+IE9uIEZyaSwgSmFuIDI3LCAyMDIzIGF0IDU6NDYgUE0g
SmVucyBBeGJvZSA8YXhib2VAa2VybmVsLmRrPiB3cm90ZToKPiA+ID4gT24gMS8yNy8yMyAzOjM4
4oCvUE0sIFBhdWwgTW9vcmUgd3JvdGU6Cj4gPiA+ID4gT24gRnJpLCBKYW4gMjcsIDIwMjMgYXQg
Mjo0MyBQTSBKZW5zIEF4Ym9lIDxheGJvZUBrZXJuZWwuZGs+IHdyb3RlOgo+ID4gPiA+PiBPbiAx
LzI3LzIzIDEyOjQy4oCvUE0sIFBhdWwgTW9vcmUgd3JvdGU6Cj4gPiA+ID4+PiBPbiBGcmksIEph
biAyNywgMjAyMyBhdCAxMjo0MCBQTSBKZW5zIEF4Ym9lIDxheGJvZUBrZXJuZWwuZGs+IHdyb3Rl
Ogo+ID4gPiA+Pj4+IE9uIDEvMjcvMjMgMTA6MjPigK9BTSwgUmljaGFyZCBHdXkgQnJpZ2dzIHdy
b3RlOgo+ID4gPiA+Pj4+PiBBIGNvdXBsZSBvZiB1cGRhdGVzIHRvIHRoZSBpb3VyaW5nIG9wcyBh
dWRpdCBieXBhc3Mgc2VsZWN0aW9ucwo+ID4gPiA+Pj4+PiBzdWdnZXN0ZWQgaW4gY29uc3VsdGF0
aW9uIHdpdGggU3RldmUgR3J1YmIuCj4gPiA+ID4+Pj4+Cj4gPiA+ID4+Pj4+IFJpY2hhcmQgR3V5
IEJyaWdncyAoMik6Cj4gPiA+ID4+Pj4+ICAgaW9fdXJpbmcsYXVkaXQ6IGF1ZGl0IElPUklOR19P
UF9GQURWSVNFIGJ1dCBub3QgSU9SSU5HX09QX01BRFZJU0UKPiA+ID4gPj4+Pj4gICBpb191cmlu
ZyxhdWRpdDogZG8gbm90IGxvZyBJT1JJTkdfT1BfKkdFVFhBVFRSCj4gPiA+ID4+Pj4+Cj4gPiA+
ID4+Pj4+ICBpb191cmluZy9vcGRlZi5jIHwgNCArKystCj4gPiA+ID4+Pj4+ICAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+ID4+Pj4KPiA+ID4gPj4+
PiBMb29rIGZpbmUgdG8gbWUgLSB3ZSBzaG91bGQgcHJvYmFibHkgYWRkIHN0YWJsZSB0byBib3Ro
IG9mIHRoZW0sCj4gPiA+ID4+Pj4ganVzdCB0byBrZWVwIHRoaW5ncyBjb25zaXN0ZW50IGFjcm9z
cyByZWxlYXNlcy4gSSBjYW4gcXVldWUgdGhlbSB1cAo+ID4gPiA+Pj4+IGZvciA2LjMuCj4gPiA+
ID4+Pgo+ID4gPiA+Pj4gUGxlYXNlIGhvbGQgb2ZmIHVudGlsIEkndmUgaGFkIGEgY2hhbmNlIHRv
IGxvb2sgdGhlbSBvdmVyIC4uLgo+ID4gPiA+Pgo+ID4gPiA+PiBJIGhhdmVuJ3QgdGFrZW4gYW55
dGhpbmcgeWV0LCBmb3IgdGhpbmdzIGxpa2UgdGhpcyBJIGFsd2F5cyBsZXQgaXQKPiA+ID4gPj4g
c2ltbWVyIHVudGlsIHBlb3BsZSBoYXZlIGhhZCBhIGNoYW5jZSB0byBkbyBzby4KPiA+ID4gPgo+
ID4gPiA+IFRoYW5rcy4gIEZXSVcsIHRoYXQgc291bmRzIHZlcnkgcmVhc29uYWJsZSB0byBtZSwg
YnV0IEkndmUgc2VlbiBsb3RzCj4gPiA+ID4gb2YgZGlmZmVyZW50IGJlaGF2aW9ycyBhY3Jvc3Mg
c3Vic3lzdGVtcyBhbmQgd2FudGVkIHRvIG1ha2Ugc3VyZSB3ZQo+ID4gPiA+IHdlcmUgb24gdGhl
IHNhbWUgcGFnZS4KPiA+ID4KPiA+ID4gU291bmRzIGZhaXIuIEJUVywgY2FuIHdlIHN0b3AgQ0Mn
aW5nIGNsb3NlZCBsaXN0cyBvbiBwYXRjaAo+ID4gPiBzdWJtaXNzaW9ucz8gR2V0dGluZyB0aGVz
ZToKPiA+ID4KPiA+ID4gWW91ciBtZXNzYWdlIHRvIExpbnV4LWF1ZGl0IGF3YWl0cyBtb2RlcmF0
b3IgYXBwcm92YWwKPiA+ID4KPiA+ID4gb24gZXZlcnkgcmVwbHkgaXMgcmVhbGx5IGFubm95aW5n
Lgo+ID4KPiA+IFdlIGtpbmRhIG5lZWQgYXVkaXQgcmVsYXRlZCBzdHVmZiBvbiB0aGUgbGludXgt
YXVkaXQgbGlzdCwgdGhhdCdzIG91cgo+ID4gbWFpbGluZyBsaXN0IGZvciBhdWRpdCBzdHVmZi4K
PiA+Cj4gPiBIb3dldmVyLCBJIGFncmVlIHRoYXQgaXQgaXMgY3JhcCB0aGF0IHRoZSBsaW51eC1h
dWRpdCBsaXN0IGlzCj4gPiBtb2RlcmF0ZWQsIGJ1dCB1bmZvcnR1bmF0ZWx5IHRoYXQgaXNuJ3Qg
c29tZXRoaW5nIEkgY29udHJvbCAoSSBoYXZlbid0Cj4gPiB3b3JrZWQgZm9yIFJIIGluIHllYXJz
LCBhbmQgZXZlbiB0aGVuIHRoZSBsaXN0IG93bmVyIHdhcyByZWFsbHkgd2VpcmQKPiA+IGFib3V0
IG1hbmFnaW5nIHRoZSBsaXN0KS4gIE9jY2FzaW9uYWxseSBJIGdydW1ibGUgYWJvdXQgbW92aW5n
IHRoZQo+ID4ga2VybmVsIGF1ZGl0IGRldmVsb3BtZW50IHRvIGEgbGludXgtYXVkaXQgbGlzdCBv
biB2Z2VyIGJ1dCBoYXZlbid0Cj4gPiBib3RoZXJlZCB5ZXQsIHBlcmhhcHMgdGhpcyBpcyBhcyBn
b29kIGEgcmVhc29uIGFzIGFueS4KPiA+Cj4gPiBSaWNoYXJkLCBTdGV2ZSAtIGFueSBjaGFuY2Ug
b2Ygb3BlbmluZyB0aGUgbGludXgtYXVkaXQgbGlzdD8KPgo+IFVuZm9ydHVuYXRlbHksIGl0IHJl
YWxseSBoYXMgdG8gYmUgdGhpcyB3YXkuIEkgZGVsZXRlZCAxMCBzcGFtIGVtYWlscwo+IHllc3Rl
cmRheS4gSXQgc2VlbXMgbGlrZSBzb21lIHBlb3BsZSBzdWJzY3JpYmVkIHRvIHRoaXMgbGlzdCBh
cmUgY29tcHJvbWlzZWQuCj4gQmVjYXVzZSBldmVyeXRpbWUgdGhlcmUgaXMgYSBsZWdpdCBlbWFp
bCwgaXQncyBmb2xsb3dlZCBpbiBhIGZldyBzZWNvbmRzIGJ5IGEKPiBzcGFtIGVtYWlsLgo+Cj4g
QW55d2F5cywgYWxsIGxlZ2l0IGVtYWlsIHdpbGwgYmUgYXBwcm92ZWQgd2l0aG91dCBuZWVkaW5n
IHRvIGJlIHN1YnNjcmliZWQuCgpUaGUgcHJvYmxlbSBpcyB0aGF0IG90aGVyIHN1YnN5c3RlbSBk
ZXZlbG9wZXJzIHdobyBhcmVuJ3Qgc3Vic2NyaWJlZAp0byB0aGUgbGludXgtYXVkaXQgbGlzdCBl
bmQgdXAgZ2V0dGluZyBoZWxkIG1haWwgbm90aWNlcyAoc2VlIHRoZQpjb21tZW50cyBmcm9tIEpl
bnMpLiAgVGhlIG1vZGVyYXRpb24gb2YgbGludXgtYXVkaXQsIGFzIHBlcm1pc3NpdmUgYXMKaXQg
bWF5IGJlIGZvciBwcm9wZXIgZW1haWxzLCBpcyBhIHByb2JsZW0gZm9yIHVwc3RyZWFtIGxpbnV4
IGF1ZGl0CmRldmVsb3BtZW50LCBJIHdvdWxkIHNheSBtdWNoIG1vcmUgc28gdGhhbiAxMC9kYXkg
bWFpbHMuCgpJZiB5b3UgYXJlIHVuYWJsZS91bndpbGxpbmcgdG8gc3dpdGNoIGxpbnV4LWF1ZGl0
IG92ZXIgdG8gYW4gb3BlbgptYWlsaW5nIGxpc3Qgd2Ugc2hvdWxkIHJldmlzaXQgbW92aW5nIG92
ZXIgdG8gYSB2Z2VyIGxpc3Q7IGF0IGxlYXN0CmZvciB1cHN0cmVhbSBrZXJuZWwgZGV2ZWxvcG1l
bnQsIHlvdSBhcmUgd2VsY29tZSB0byBzdGljayB3aXRoIHRoZQpleGlzdGluZyByZWRoYXQuY29t
IGxpc3QgZm9yIGRpc2N1c3Npb24gb2YgeW91ciB1c2Vyc3BhY2UgdG9vbHMuCgotLSAKcGF1bC1t
b29yZS5jb20KCi0tCkxpbnV4LWF1ZGl0IG1haWxpbmcgbGlzdApMaW51eC1hdWRpdEByZWRoYXQu
Y29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtYXVk
aXQK

