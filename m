Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id EA6251FDABC
	for <lists+linux-audit@lfdr.de>; Thu, 18 Jun 2020 03:07:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592442433;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Gc1pRaTB7peydZAIbOUTSCAyI7cl0ao+61rGmKTH+54=;
	b=aIWlwNFZtmOxuluAawm4B7yvdqIvwVh4Y5LJVohqY8/JfkmCQga1lIqXl00aMHBJM/Uknt
	TyUhk8XBgZ9GX2QI/A/REqLO2xITG+qcKKUJkcpj4qgo8n0s4OCQCM0ARGNgPLPub24qMr
	YiII6+/BKn1WazGKN4OwXyzwKw+lIpE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-0v1zTMfqMHK4Ot2t2ibh8A-1; Wed, 17 Jun 2020 21:07:11 -0400
X-MC-Unique: 0v1zTMfqMHK4Ot2t2ibh8A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 696EF64ACA;
	Thu, 18 Jun 2020 01:07:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 908AA5D9D3;
	Thu, 18 Jun 2020 01:07:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 25D3C833C6;
	Thu, 18 Jun 2020 01:06:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05I16iDR030789 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 17 Jun 2020 21:06:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DA5711007A28; Thu, 18 Jun 2020 01:06:44 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D58C41007384
	for <linux-audit@redhat.com>; Thu, 18 Jun 2020 01:06:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 68EE6811E7A
	for <linux-audit@redhat.com>; Thu, 18 Jun 2020 01:06:42 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
	[209.85.218.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-146-M2_FdsX_MoWnwI3_iphH3w-1; Wed, 17 Jun 2020 21:06:39 -0400
X-MC-Unique: M2_FdsX_MoWnwI3_iphH3w-1
Received: by mail-ej1-f65.google.com with SMTP id f7so4594856ejq.6
	for <linux-audit@redhat.com>; Wed, 17 Jun 2020 18:06:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=RXMTnnzSFO+7XgQpDBPkrdXiUzf2tf1DUb3GgQ7kXSk=;
	b=Nq0PwQJbIvG+Y9WXT9tFzSqS1SRAmza35MazG/mXU2J4ERt03KJVnEVmnDafqTVvuH
	VYZ1F4lSyfra3zkwaoP0YDjOsGrb4n23NhbRQfuoCy+EEUaBEX780I/mc8rUjZTl3hcH
	N07JOc1zxmis/RIo8Ud5rY0d0dQjKNhK7nw+04xnECzkTbkNoGwaRkXYxBCuthWRVr7F
	zPIm/7LRTp3A9Dh+rcDEVnRNApn38e7STf7RO+fj7n75fzdOUyvXpjqTQ6oPyJJQu6jS
	K/Kj4OwxXG2sbfMEzXxRuTnm0iDXHt1lQtrnrBj9+J2BaC8CVcCwyJxdFWJK8pA+6SUd
	xdQA==
X-Gm-Message-State: AOAM532sxaUGVohQ/yLpkJHbUz8g/myt3wIY0pmngY+enRpmdLT25nCN
	T/KCqKsOppEOOlvi+KKddmJdYBLXj/j61Yvq37s6
X-Google-Smtp-Source: ABdhPJyDovi8yPWUT8BmU1O9VcQ7Wr2OzBLRAv59o2q1o1O3Q4aU3m65z+0B5rFQcLWyfk8lzdXhm/yY5YfdBR865Hc=
X-Received: by 2002:a17:906:19d3:: with SMTP id
	h19mr1721662ejd.106.1592442398311; 
	Wed, 17 Jun 2020 18:06:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200616045855.GA1699@linux-kernel-dev>
	<CAHC9VhSotFw2i7HzWrHUyc6VSbwTpv8ZBeP58H_mzi6bd=Uouw@mail.gmail.com>
	<20200617225416.GA2688@linux-kernel-dev>
In-Reply-To: <20200617225416.GA2688@linux-kernel-dev>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 17 Jun 2020 21:06:27 -0400
Message-ID: <CAHC9VhQYaZAm4oRg4h2TiuhPR+CWp8yU4Sviao64MWwVw6nigw@mail.gmail.com>
Subject: Re: [PATCH] audit: optionally print warning after waiting to enqueue
	record
To: Max Englander <max.englander@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05I16iDR030789
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
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
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCBKdW4gMTcsIDIwMjAgYXQgNjo1NCBQTSBNYXggRW5nbGFuZGVyIDxtYXguZW5nbGFu
ZGVyQGdtYWlsLmNvbT4gd3JvdGU6Cj4gT24gV2VkLCBKdW4gMTcsIDIwMjAgYXQgMDI6NDc6MTlQ
TSAtMDQwMCwgUGF1bCBNb29yZSB3cm90ZToKPiA+IE9uIFR1ZSwgSnVuIDE2LCAyMDIwIGF0IDEy
OjU4IEFNIE1heCBFbmdsYW5kZXIgPG1heC5lbmdsYW5kZXJAZ21haWwuY29tPiB3cm90ZToKPiA+
ID4KPiA+ID4gSW4gZW52aXJvbm1lbnRzIHdoZXJlIHNlY3VyaXR5IGlzIHByaW9yaXRpemVkLCB1
c2VycyBtYXkgc2V0Cj4gPiA+IC0tYmFja2xvZ193YWl0X3RpbWUgdG8gYSBoaWdoIHZhbHVlIGlu
IG9yZGVyIHRvIHJlZHVjZSB0aGUgbGlrZWxpaG9vZAo+ID4gPiB0aGF0IGFueSBhdWRpdCBldmVu
dCBpcyBsb3N0LCBldmVuIHRob3VnaCBkb2luZyBzbyBtYXkgcmVzdWx0IGluCj4gPiA+IHVucHJl
ZGljdGFibGUgcGVyZm9ybWFuY2UgaWYgdGhlIGtlcm5lbCBzY2hlZHVsZXMgYSB0aW1lb3V0IHdo
ZW4gdGhlCj4gPiA+IGJhY2tsb2cgbGltaXQgaXMgZXhjZWVkZWQuIEZvciB0aGVzZSB1c2Vycywg
dGhlIG5leHQgYmVzdCB0aGluZyB0bwo+ID4gPiBwcmVkaWN0YWJsZSBwZXJmb3JtYW5jZSBpcyB0
aGUgYWJpbGl0eSB0byBxdWlja2x5IGRldGVjdCBhbmQgcmVhY3QgdG8KPiA+ID4gZGVncmFkZWQg
cGVyZm9ybWFuY2UuIFRoaXMgcGF0Y2ggcHJvcG9zZXMgdG8gYWlkIHRoZSBkZXRlY3Rpb24gb2Yg
a2VybmVsCj4gPiA+IGF1ZGl0IHN1YnN5c3RlbSBwYXVzZXMgdGhyb3VnaCB0aGUgZm9sbG93aW5n
IGNoYW5nZXM6Cj4gPiA+Cj4gPiA+IEFkZCBhIHZhcmlhYmxlIG5hbWVkIGF1ZGl0X2JhY2tsb2df
d2Fybl90aW1lLiBFbmZvcmNlIHRoZSB2YWx1ZSBvZiB0aGlzCj4gPiA+IHZhcmlhYmxlIHRvIGJl
IG5vIGxlc3MgdGhhbiB6ZXJvLCBhbmQgbm8gbW9yZSB0aGFuIHRoZSB2YWx1ZSBvZgo+ID4gPiBh
dWRpdF9iYWNrbG9nX3dhaXRfdGltZS4KPiA+ID4KPiA+ID4gSWYgYXVkaXRfYmFja2xvZ193YXJu
X3RpbWUgaXMgZ3JlYXRlciB0aGFuIHplcm8gYW5kIGlmIHRoZSB0b3RhbCB0aW1lCj4gPiA+IHNw
ZW50IHdhaXRpbmcgdG8gZW5xdWV1ZSBhbiBhdWRpdCByZWNvcmQgaXMgZ3JlYXRlciB0aGFuIG9y
IGVxdWFsIHRvCj4gPiA+IGF1ZGl0X2JhY2tsb2dfd2Fybl90aW1lLCB0aGVuIHByaW50IGEgd2Fy
bmluZyB3aXRoIHRoZSB0b3RhbCB0aW1lCj4gPiA+IHNwZW50IHdhaXRpbmcuCj4gPiA+Cj4gPiA+
IEFuIGV4YW1wbGUgY29uZmlndXJhdGlvbjoKPiA+ID4KPiA+ID4gICAgICAgICBhdWRpdGN0bCAt
LWJhY2tsb2dfd2Fybl90aW1lIDUwCj4gPiA+Cj4gPiA+IEFuIGV4YW1wbGUgd2FybmluZyBtZXNz
YWdlOgo+ID4gPgo+ID4gPiAgICAgICAgIGF1ZGl0OiBzbGVlcF90aW1lPTUyID49IGF1ZGl0X2Jh
Y2tsb2dfd2Fybl90aW1lPTUwCj4gPiA+Cj4gPiA+IFRlc3RlZCBvbiBVYnVudHUgMTguMDQuMDQg
dXNpbmcgY29tcGxlbWVudGFyeSBjaGFuZ2VzIHRvIHRoZSBhdWRpdAo+ID4gPiB1c2Vyc3BhY2U6
IGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC1hdWRpdC9hdWRpdC11c2Vyc3BhY2UvcHVsbC8xMzEu
Cj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IE1heCBFbmdsYW5kZXIgPG1heC5lbmdsYW5kZXJA
Z21haWwuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGluY2x1ZGUvdWFwaS9saW51eC9hdWRpdC5oIHwg
IDcgKysrKysrLQo+ID4gPiAga2VybmVsL2F1ZGl0LmMgICAgICAgICAgICAgfCAzNSArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA0MSBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gSWYgYW4gYWRtaW4gaXMgcHJpb3Jp
dGl6aW5nIHNlY3VyaXR5LCBha2EgZG9uJ3QgbG9vc2UgYW55IGF1ZGl0Cj4gPiByZWNvcmRzLCBh
bmQgdGhlcmUgaXMgYSBjb25jZXJuIG92ZXIgdmFyaWFibGUgc3lzdGVtIGxhdGVuY3kgZHVlIHRv
IGFuCj4gPiBhdWRpdCBxdWV1ZSBiYWNrbG9nLCB3aHkgbm90IHNpbXBseSBkaXNhYmxlIHRoZSBi
YWNrbG9nIGxpbWl0Pwo+ID4KPiA+IC0tCj4gPiBwYXVsIG1vb3JlCj4gPiB3d3cucGF1bC1tb29y
ZS5jb20KPgo+IFRoYXTigJlzIGdvb2QgaW4gc29tZSBjYXNlcywgYnV0IGluIG90aGVyIGNhc2Vz
IHVuYm91bmRlZCBncm93dGggb2YgdGhlCj4gYmFja2xvZyBjb3VsZCByZXN1bHQgaW4gbWVtb3J5
IGlzc3Vlcy4gSWYgdGhlIGtlcm5lbCBydW5zIG91dCBvZiBtZW1vcnkKPiBpdCB3b3VsZCBkcm9w
IHRoZSBhdWRpdCBldmVudCBvciBwb3NzaWJseSBoYXZlIG90aGVyIHByb2JsZW1zLiBJdCBjb3Vs
ZAo+IGFsc28gYWxzbyBjb25zdW1lIG1lbW9yeSBpbiBhIHdheSB0aGF0IHN0YXJ2ZXMgdXNlciB3
b3JrbG9hZHMgb3IgY2F1c2VzCj4gdGhlbSB0byBiZSBraWxsZWQgYnkgdGhlIE9PTUtpbGxlci4K
Pgo+IFRvIHJlZmluZSBteSBtb3RpdmF0aW5nIHVzZSBjYXNlIGEgYml0LCBpZiBhIEt1YmVybmV0
ZXMgYWRtaW4gd2FudHMgdG8KPiBwcmlvcml0aXplIHNlY3VyaXR5LCBhbmQgYWxzbyBhdm9pZCB1
bmJvdW5kZWQgZ3Jvd3RoIG9mIHRoZSBhdWRpdAo+IGJhY2tsb2csIHRoZXkgbWF5IHNldCAtYiBh
bmQgLS1iYWNrbG9nX3dhaXRfdGltZSBpbiBhIHdheSB0aGF0IGxpbWl0cwo+IGtlcm5lbCBtZW1v
cnkgdXNhZ2UgYW5kIHJlZHVjZXMgdGhlIGxpa2VsaWhvb2QgdGhhdCBhbnkgYXVkaXQgZXZlbnQg
aXMKPiBsb3N0LiBPY2Nhc2lvbmFsIHBlcmZvcm1hbmNlIGRlZ3JhZGF0aW9uIG1heSBiZSBhY2Nl
cHRhYmxlIHRvIHRoZSBhZG1pbiwKPiBidXQgdGhleSB3b3VsZCBsaWtlIGEgd2F5IHRvIGJlIGFs
ZXJ0ZWQgdG8gcHJvbG9uZ2VkIGtlcm5lbCBwYXVzZXMsIHNvCj4gdGhhdCB0aGV5IGNhbiBpbnZl
c3RpZ2F0ZSBhbmQgdGFrZSBjb3JyZWN0aXZlIGFjdGlvbiAoaW5jcmVhc2UgYmFja2xvZywKPiBp
bmNyZWFzZSBzZXJ2ZXIgY2FwYWNpdHksIG1vdmUgc29tZSB3b3JrbG9hZHMgdG8gb3RoZXIgc2Vy
dmVycywgZXRjLikuCj4KPiBUbyBzdGF0ZSBhbm90aGVyIHdheS4gVGhlIGtlcm5lbCBjdXJyZW50
bHkgY2FuIGJlIGNvbmZpZ3VyZWQgdG8gcHJpbnQgYQo+IG1lc3NhZ2Ugd2hlbiB0aGUgYmFja2xv
ZyBsaW1pdCBpcyBleGNlZWRlZCBhbmQgaXQgbXVzdCBkaXNjYXJkIHRoZSBhdWRpdAo+IGV2ZW50
LiBUaGlzIGlzIGEgdXNlZnVsIG1lc3NhZ2UgZm9yIGFkbWlucywgd2hpY2ggdGhleSBjYW4gYWRk
cmVzcyB3aXRoCj4gY29ycmVjdGl2ZSBhY3Rpb24uIEkgdGhpbmsgYSBtZXNzYWdlIHNpbWlsYXIg
dG8gdGhlIG9uZSBwcm9wb3NlZCBieSB0aGlzCj4gcGF0Y2ggd291bGQgYmUgZXF1YWxseSB1c2Vm
dWwgd2hlbiB0aGUgYmFja2xvZyBsaW1pdCBpcyBleGNlZWRlZCBhbmQgdGhlCj4ga2VybmVsIGlz
IGNvbmZpZ3VyZWQgdG8gd2FpdCBmb3IgdGhlIGJhY2tsb2cgdG8gZHJhaW4uIEFkbWlucyBjb3Vs
ZAo+IGFkZHJlc3MgdGhhdCBtZXNzYWdlIGluIHRoZSBzYW1lIHdheSwgYnV0IHdpdGhvdXQgdGhl
IGNvc3Qgb2YgbG9zdCBhdWRpdAo+IGV2ZW50cy4KCkknbSBzdGlsbCBzdHJ1Z2dsaW5nIHRvIHVu
ZGVyc3RhbmQgaG93IHRoaXMgaXMgYW55IGJldHRlciB0aGFuCmRpc2FibGluZyB0aGUgYmFja2xv
ZyBsaW1pdCwgb3Igc2V0dGluZyBpdCB2ZXJ5IGhpZ2gsIGFuZCBzaW1wbHkKbW9uaXRvcmluZyB0
aGUgYXVkaXQgc2l6ZSBvZiB0aGUgYXVkaXQgYmFja2xvZy4gIFRoaXMgd2F5IHRoZSBhZG1pbgpk
b2Vzbid0IGhhdmUgdG8gd29ycnkgYWJvdXQgdGhlIGxhdGVuY3kgaXNzdWVzIG9mIGEgZnVsbCBi
YWNrbG9nLAp3aGlsZSBzdGlsbCBiZWluZyBhYmxlIHRvIHRyaWdnZXIgYWN0aW9ucyBiYXNlZCBv
biB0aGUgc3RhdGUgb2YgdGhlCmJhY2tsb2cuICBUaGUgdXNlcnNwYWNlIHRvb2xpbmcvc2NyaXB0
aW5nIHRvIHdhdGNoIHRoZSBiYWNrbG9nIHNpemUKd291bGQgYmUgdHJpdmlhbCwgYW5kIHdvdWxk
IGFyZ3VhYmx5IHByb3ZpZGUgbXVjaCBiZXR0ZXIgdmlzaWJpbGl0eQppbnRvIHRoZSBiYWNrbG9n
IHN0YXRlIHRoYW4gYSBzaW5nbGUgd2FybmluZyB0aHJlc2hvbGQgaW4gdGhlIGtlcm5lbC4KCi0t
IApwYXVsIG1vb3JlCnd3dy5wYXVsLW1vb3JlLmNvbQoKCi0tCkxpbnV4LWF1ZGl0IG1haWxpbmcg
bGlzdApMaW51eC1hdWRpdEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1hdWRpdA==

