Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 980B9787045
	for <lists+linux-audit@lfdr.de>; Thu, 24 Aug 2023 15:30:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692883836;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tsIngsYGgrx+19m7Va4R2bq4aiDIk/5X4VhnkBkyjFk=;
	b=dCZNmcf1W9NpY9FMY/ktwaX3D8zuWvUPcO+bpnw+SZjT/23PPdVOhYZWfeTHG97gInKwiU
	HuEY4A8jkzY4SrYf+dzksBI0rqhLssIA1+D+dgH6om9y1xlUyvgacJ1HJnnSai5LqDqrrt
	VcwUol6VWxq0DGBh4RwOq3ZRNbGl6gQ=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-370-i8hO1J_jNweDemZa4byFFQ-1; Thu, 24 Aug 2023 09:30:34 -0400
X-MC-Unique: i8hO1J_jNweDemZa4byFFQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 345C41C08979;
	Thu, 24 Aug 2023 13:30:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 34DE1492C14;
	Thu, 24 Aug 2023 13:30:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 87C2019465A0;
	Thu, 24 Aug 2023 13:30:25 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 98DAD1946589 for <linux-audit@listman.corp.redhat.com>;
 Thu, 24 Aug 2023 13:30:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 85FFE2026D76; Thu, 24 Aug 2023 13:30:24 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E9AC2026D68
 for <linux-audit@redhat.com>; Thu, 24 Aug 2023 13:30:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 627658D40A8
 for <linux-audit@redhat.com>; Thu, 24 Aug 2023 13:30:24 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-50-EAwolHmVMPyAP6pF7s2mdg-1; Thu, 24 Aug 2023 09:30:21 -0400
X-MC-Unique: EAwolHmVMPyAP6pF7s2mdg-1
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-58df8cab1f2so70467217b3.3
 for <linux-audit@redhat.com>; Thu, 24 Aug 2023 06:30:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692883821; x=1693488621;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YP+QcejVj1IAxwt/Xnhj+6K+T+NnfjYzt0fpqA7S/o4=;
 b=DoFkf1kQnu2Bj/5QbtYEX8IgOSQFWqb78H04xkal5jQfaXHHCoU8CILoOuljczeCRo
 0eaxZp1vxvHYj0NfjMvNuC41wdElPEABzCuEJnClR63hslJmMaPzWxg/SJrhNyVaE00J
 PeAkjdo0OW4+UpJk1VaDAx+0LcbmJw6To7jWHnIjBdeCESQDBUxy1psZXuRZ7sCzEwuH
 ayyFUsG62aAft8JQerJ/y/psfS/ZbfoNYaLy7RAwARLvrg4qT0xst4r91xONNrPPZlEB
 eu0teD4IZzbshIszRQ4NeWWS0ONKh2ZJ8uzseLmrlwh9gfLTpdMxf5+KGFKP+jrXOZN+
 wmPg==
X-Gm-Message-State: AOJu0Yx5Pu+gTSo5Ysw4wrsBTWda8XTCgXUIRM+EHghKW4H/y0I+Oc8W
 9TwrHh/lbCj7lHKR8KZaCa0iZMMCQ5HERScyRgD0
X-Google-Smtp-Source: AGHT+IGhXeLeT7QW6e6J9ev3sEFUT8aGAQb0iEvFjSXa+8fyJqa7ZqC9qEX1fcy6QLTFlKAqAtx5f7yTabzzlf9ZYA8=
X-Received: by 2002:a0d:db4b:0:b0:589:a095:76ca with SMTP id
 d72-20020a0ddb4b000000b00589a09576camr15838898ywe.44.1692883820964; Thu, 24
 Aug 2023 06:30:20 -0700 (PDT)
MIME-Version: 1.0
References: <36b65eb1-ccbf-8b81-468f-b8d88c4be5a3@I-love.SAKURA.ne.jp>
 <CAHC9VhTLQjjQ0QMfBDHYCz9LOAuO=rJWSDEUqPsFE+dowFbN=Q@mail.gmail.com>
 <b06dbdd8-d2f6-b190-5635-948c0a966103@I-love.SAKURA.ne.jp>
 <CAHC9VhSz=3utr_CigGvkMEb6_avJUQq1Ak2smB7neSd76mzjFw@mail.gmail.com>
 <6957af54-16a2-4c28-56ff-dafe95f4e276@I-love.SAKURA.ne.jp>
 <CAHC9VhTj-PQ0qPTiphPLXyJx3bWeqgVS_GPCWNgjqFqBgH6Njg@mail.gmail.com>
 <b0b60fdc-4484-2265-7fdf-8367bf218d18@I-love.SAKURA.ne.jp>
 <CAHC9VhRaUxN=oEyKCOrfrGzJeXDGxv2EKbZH3qwAB6AhKcSfog@mail.gmail.com>
 <68a0ef90-b452-2096-3729-b5c208878ff9@I-love.SAKURA.ne.jp>
 <CAHC9VhTPgnzdn1tmEmufcbseN_Q1CyzxTEzfvZW7OCBTeAadmA@mail.gmail.com>
 <d2557f88-0cda-b0bf-5c76-7c18912798c9@I-love.SAKURA.ne.jp>
In-Reply-To: <d2557f88-0cda-b0bf-5c76-7c18912798c9@I-love.SAKURA.ne.jp>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 24 Aug 2023 09:30:10 -0400
Message-ID: <CAHC9VhTZE2BinivPRLJ9S_21YcmXA6tMdDtAm5w3nk0dbZ0j1w@mail.gmail.com>
Subject: Re: [PATCH] audit: add task history record
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
Cc: audit@vger.kernel.org,
 linux-security-module <linux-security-module@vger.kernel.org>,
 linux-audit@redhat.com, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: paul-moore.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCBBdWcgMjQsIDIwMjMgYXQgOToyMeKAr0FNIFRldHN1byBIYW5kYQo8cGVuZ3Vpbi1r
ZXJuZWxAaS1sb3ZlLnNha3VyYS5uZS5qcD4gd3JvdGU6Cj4KPiBPbiAyMDIzLzA4LzIzIDIzOjQ4
LCBQYXVsIE1vb3JlIHdyb3RlOgo+ID4gV2UndmUgYWxyZWFkeSBkaXNjdXNzZWQgdGhpcyBib3Ro
IGZyb20gYSBrZXJuZWwgbG9hZCBwZXJzcGVjdGl2ZSAoaXQKPiA+IHNob3VsZCBiZSBhYmxlIHRv
IGhhbmRsZSB0aGUgbG9hZCwgaWYgbm90IHRoYXQgaXMgYSBzZXBhcmF0ZSBwcm9ibGVtCj4gPiB0
byBhZGRyZXNzKSBhcyB3ZWxsIGFzIHRoZSBodW1hbiBwZXJzcGVjdGl2ZSAoaWYgeW91IHdhbnQg
YXVkaXRpbmcsCj4gPiB5b3UgbmVlZCB0byBiZSBhYmxlIHRvIGhhbmRsZSBhdWRpdGluZykuCj4K
PiBOby4gWW91IGhhdmVuJ3Qgc2hvd24gdXMgYXVkaXQgcnVsZXMgdGhhdCBjYW4gc2F0aXNmeSBy
ZXF1aXJlbWVudHMgc2hvd24gYmVsb3cuCj4KPiAgICgxKSBDYXRjaCBfYWxsXyBwcm9jZXNzIGNy
ZWF0aW9ucyAoYm90aCB2aWEgZm9yaygpL2Nsb25lKCkgc3lzdGVtIGNhbGxzIGFuZAo+ICAgICAg
IGt0aHJlYWRfY3JlYXRlKCkgZnJvbSB0aGUga2VybmVsKSwgYW5kIGR1cGxpY2F0ZSB0aGUgaGlz
dG9yeSB1cG9uIHByb2Nlc3MKPiAgICAgICBjcmVhdGlvbi4KCkNyZWF0ZSBhbiBhdWRpdCBmaWx0
ZXIgcnVsZSB0byByZWNvcmQgdGhlIHN5c2NhbGxzIHlvdSBhcmUgaW50ZXJlc3RlZAppbiBsb2dn
aW5nLgoKPiAgICgyKSBDYXRjaCBfYWxsXyBleGVjdmUoKSwgYW5kIHVwZGF0ZSB0aGUgaGlzdG9y
eSB1cG9uIHN1Y2Nlc3NmdWwgZXhlY3ZlKCkuCgpDcmVhdGUgYW4gYXVkaXQgZmlsdGVyIHJ1bGUg
dG8gcmVjb3JkIHRoZSBzeXNjYWxscyB5b3UgYXJlIGludGVyZXN0ZWQKaW4gbG9nZ2luZy4KCj4g
ICAoMykgQ2F0Y2ggX2FsbF8gcHJvY2VzcyB0ZXJtaW5hdGlvbnMgKGJvdGggZXhpdCgpL2V4aXRf
Z3JvdXAoKS9raWxsKCkgc3lzdGVtCj4gICAgICAgY2FsbHMgYW5kIGludGVybmFsIHJlYXNvbnMg
c3VjaCBhcyBPT00ga2lsbGVyKSwgYW5kIGVyYXNlIHRoZSBoaXN0b3J5IHVwb24KPiAgICAgICBw
cm9jZXNzIHRlcm1pbmF0aW9uLgoKQ3JlYXRlIGFuIGF1ZGl0IGZpbHRlciBydWxlIHRvIHJlY29y
ZCB0aGUgZXZlbnRzIHlvdSBhcmUgaW50ZXJlc3RlZCBpbgpsb2dnaW5nLCBpZiB0aGVyZSBpcyBh
biBldmVudCB3aGljaCBpc24ndCBiZWluZyByZWNvcmRlZCBmZWVsIGZyZWUgdG8Kc3VibWl0IGEg
cGF0Y2ggdG8gZ2VuZXJhdGUgYW4gYXVkaXQgcmVjb3JkLgoKLS0gCnBhdWwtbW9vcmUuY29tCgot
LQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczov
L2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0Cg==

