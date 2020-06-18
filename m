Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC971FF350
	for <lists+linux-audit@lfdr.de>; Thu, 18 Jun 2020 15:39:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592487584;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WZIdVjs2L6pMMUEdfrMgL++Lq8PiATpP+QpTFmIEvSI=;
	b=UT5Dqb3E+m33Dae89q9Vg6Vf/SgmzbgqaZ6rRAgiZPjgqYfSRdFobZ6Mv2VuWLqvhtmjpu
	4WiMzILHXW1V6VSwmYYt1DmtT1AWJgLSU8SgbLlJmZFc+JzTPRV8bNYF2ccoE3EM/ru2WV
	JR37Bvuw6m67U5kqpK556uHmedXzsvY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-qok1G5V4Mm2vGwzK6-7Jpw-1; Thu, 18 Jun 2020 09:39:41 -0400
X-MC-Unique: qok1G5V4Mm2vGwzK6-7Jpw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A5388005AD;
	Thu, 18 Jun 2020 13:39:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 414B55D9D3;
	Thu, 18 Jun 2020 13:39:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E54BB833C8;
	Thu, 18 Jun 2020 13:39:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05IDdCnv005971 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 18 Jun 2020 09:39:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B24345D9EF; Thu, 18 Jun 2020 13:39:12 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-113-148.phx2.redhat.com [10.3.113.148])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7C4475D9E8;
	Thu, 18 Jun 2020 13:39:08 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: [PATCH] audit: optionally print warning after waiting to enqueue
	record
Date: Thu, 18 Jun 2020 09:39:08 -0400
Message-ID: <1648649.cZYg8c8PMo@x2>
Organization: Red Hat
In-Reply-To: <20200617225416.GA2688@linux-kernel-dev>
References: <20200616045855.GA1699@linux-kernel-dev>
	<CAHC9VhSotFw2i7HzWrHUyc6VSbwTpv8ZBeP58H_mzi6bd=Uouw@mail.gmail.com>
	<20200617225416.GA2688@linux-kernel-dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05IDdCnv005971
X-loop: linux-audit@redhat.com
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

T24gV2VkbmVzZGF5LCBKdW5lIDE3LCAyMDIwIDY6NTQ6MTYgUE0gRURUIE1heCBFbmdsYW5kZXIg
d3JvdGU6Cj4gT24gV2VkLCBKdW4gMTcsIDIwMjAgYXQgMDI6NDc6MTlQTSAtMDQwMCwgUGF1bCBN
b29yZSB3cm90ZToKPiA+IE9uIFR1ZSwgSnVuIDE2LCAyMDIwIGF0IDEyOjU4IEFNIE1heCBFbmds
YW5kZXIgPG1heC5lbmdsYW5kZXJAZ21haWwuY29tPiAKd3JvdGU6Cj4gPiA+IEluIGVudmlyb25t
ZW50cyB3aGVyZSBzZWN1cml0eSBpcyBwcmlvcml0aXplZCwgdXNlcnMgbWF5IHNldAo+ID4gPiAt
LWJhY2tsb2dfd2FpdF90aW1lIHRvIGEgaGlnaCB2YWx1ZSBpbiBvcmRlciB0byByZWR1Y2UgdGhl
IGxpa2VsaWhvb2QKPiA+ID4gdGhhdCBhbnkgYXVkaXQgZXZlbnQgaXMgbG9zdCwgZXZlbiB0aG91
Z2ggZG9pbmcgc28gbWF5IHJlc3VsdCBpbgo+ID4gPiB1bnByZWRpY3RhYmxlIHBlcmZvcm1hbmNl
IGlmIHRoZSBrZXJuZWwgc2NoZWR1bGVzIGEgdGltZW91dCB3aGVuIHRoZQo+ID4gPiBiYWNrbG9n
IGxpbWl0IGlzIGV4Y2VlZGVkLiBGb3IgdGhlc2UgdXNlcnMsIHRoZSBuZXh0IGJlc3QgdGhpbmcg
dG8KPiA+ID4gcHJlZGljdGFibGUgcGVyZm9ybWFuY2UgaXMgdGhlIGFiaWxpdHkgdG8gcXVpY2ts
eSBkZXRlY3QgYW5kIHJlYWN0IHRvCj4gPiA+IGRlZ3JhZGVkIHBlcmZvcm1hbmNlLiBUaGlzIHBh
dGNoIHByb3Bvc2VzIHRvIGFpZCB0aGUgZGV0ZWN0aW9uIG9mCj4gPiA+IGtlcm5lbAo+ID4gPiBh
dWRpdCBzdWJzeXN0ZW0gcGF1c2VzIHRocm91Z2ggdGhlIGZvbGxvd2luZyBjaGFuZ2VzOgo+ID4g
PiAKPiA+ID4gQWRkIGEgdmFyaWFibGUgbmFtZWQgYXVkaXRfYmFja2xvZ193YXJuX3RpbWUuIEVu
Zm9yY2UgdGhlIHZhbHVlIG9mIHRoaXMKPiA+ID4gdmFyaWFibGUgdG8gYmUgbm8gbGVzcyB0aGFu
IHplcm8sIGFuZCBubyBtb3JlIHRoYW4gdGhlIHZhbHVlIG9mCj4gPiA+IGF1ZGl0X2JhY2tsb2df
d2FpdF90aW1lLgo+ID4gPiAKPiA+ID4gSWYgYXVkaXRfYmFja2xvZ193YXJuX3RpbWUgaXMgZ3Jl
YXRlciB0aGFuIHplcm8gYW5kIGlmIHRoZSB0b3RhbCB0aW1lCj4gPiA+IHNwZW50IHdhaXRpbmcg
dG8gZW5xdWV1ZSBhbiBhdWRpdCByZWNvcmQgaXMgZ3JlYXRlciB0aGFuIG9yIGVxdWFsIHRvCj4g
PiA+IGF1ZGl0X2JhY2tsb2dfd2Fybl90aW1lLCB0aGVuIHByaW50IGEgd2FybmluZyB3aXRoIHRo
ZSB0b3RhbCB0aW1lCj4gPiA+IHNwZW50IHdhaXRpbmcuCj4gPiA+IAo+ID4gPiBBbiBleGFtcGxl
IGNvbmZpZ3VyYXRpb246Cj4gPiA+ICAgICAgICAgYXVkaXRjdGwgLS1iYWNrbG9nX3dhcm5fdGlt
ZSA1MAo+ID4gPiAKPiA+ID4gQW4gZXhhbXBsZSB3YXJuaW5nIG1lc3NhZ2U6Cj4gPiA+ICAgICAg
ICAgYXVkaXQ6IHNsZWVwX3RpbWU9NTIgPj0gYXVkaXRfYmFja2xvZ193YXJuX3RpbWU9NTAKPiA+
ID4gCj4gPiA+IFRlc3RlZCBvbiBVYnVudHUgMTguMDQuMDQgdXNpbmcgY29tcGxlbWVudGFyeSBj
aGFuZ2VzIHRvIHRoZSBhdWRpdAo+ID4gPiB1c2Vyc3BhY2U6IGh0dHBzOi8vZ2l0aHViLmNvbS9s
aW51eC1hdWRpdC9hdWRpdC11c2Vyc3BhY2UvcHVsbC8xMzEuCj4gPiA+IAo+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBNYXggRW5nbGFuZGVyIDxtYXguZW5nbGFuZGVyQGdtYWlsLmNvbT4KPiA+ID4gLS0t
Cj4gPiA+IAo+ID4gPiAgaW5jbHVkZS91YXBpL2xpbnV4L2F1ZGl0LmggfCAgNyArKysrKystCj4g
PiA+ICBrZXJuZWwvYXVkaXQuYyAgICAgICAgICAgICB8IDM1ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCj4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDQxIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gSWYgYW4gYWRtaW4gaXMgcHJpb3JpdGl6aW5nIHNlY3Vy
aXR5LCBha2EgZG9uJ3QgbG9vc2UgYW55IGF1ZGl0Cj4gPiByZWNvcmRzLCBhbmQgdGhlcmUgaXMg
YSBjb25jZXJuIG92ZXIgdmFyaWFibGUgc3lzdGVtIGxhdGVuY3kgZHVlIHRvIGFuCj4gPiBhdWRp
dCBxdWV1ZSBiYWNrbG9nLCB3aHkgbm90IHNpbXBseSBkaXNhYmxlIHRoZSBiYWNrbG9nIGxpbWl0
Pwo+IAo+IFRoYXTigJlzIGdvb2QgaW4gc29tZSBjYXNlcywgYnV0IGluIG90aGVyIGNhc2VzIHVu
Ym91bmRlZCBncm93dGggb2YgdGhlCj4gYmFja2xvZyBjb3VsZCByZXN1bHQgaW4gbWVtb3J5IGlz
c3Vlcy4gSWYgdGhlIGtlcm5lbCBydW5zIG91dCBvZiBtZW1vcnkKPiBpdCB3b3VsZCBkcm9wIHRo
ZSBhdWRpdCBldmVudCBvciBwb3NzaWJseSBoYXZlIG90aGVyIHByb2JsZW1zLiBJdCBjb3VsZAo+
IGFsc28gYWxzbyBjb25zdW1lIG1lbW9yeSBpbiBhIHdheSB0aGF0IHN0YXJ2ZXMgdXNlciB3b3Jr
bG9hZHMgb3IgY2F1c2VzCj4gdGhlbSB0byBiZSBraWxsZWQgYnkgdGhlIE9PTUtpbGxlci4KClRo
ZSBrZXJuZWwgY2Fubm90IGdyb3cgdGhlIGJhY2tsb2cgdW5ib3VuZGVkLiBJZiB5b3UgZG8gbm90
aGluZywgdGhlIGJhY2tsb2cgCmlzIDY0IC0gd2hpY2ggaXMgdG9vIHNtYWxsIHRvIHJlYWxseSB1
c2UuIE90aGVyd2lzZSwgeW91IHNldCB0aGUgYmFja2xvZyB0byBhIApmaW5pdGUgbnVtYmVyIHdp
dGggdGhlIC1iIG9wdGlvbi4KCj4gVG8gcmVmaW5lIG15IG1vdGl2YXRpbmcgdXNlIGNhc2UgYSBi
aXQsIGlmIGEgS3ViZXJuZXRlcyBhZG1pbiB3YW50cyB0bwo+IHByaW9yaXRpemUgc2VjdXJpdHks
IGFuZCBhbHNvIGF2b2lkIHVuYm91bmRlZCBncm93dGggb2YgdGhlIGF1ZGl0Cj4gYmFja2xvZywg
dGhleSBtYXkgc2V0IC1iIGFuZCAtLWJhY2tsb2dfd2FpdF90aW1lIGluIGEgd2F5IHRoYXQgbGlt
aXRzCj4ga2VybmVsIG1lbW9yeSB1c2FnZSBhbmQgcmVkdWNlcyB0aGUgbGlrZWxpaG9vZCB0aGF0
IGFueSBhdWRpdCBldmVudCBpcwo+IGxvc3QuIE9jY2FzaW9uYWwgcGVyZm9ybWFuY2UgZGVncmFk
YXRpb24gbWF5IGJlIGFjY2VwdGFibGUgdG8gdGhlIGFkbWluLAo+IGJ1dCB0aGV5IHdvdWxkIGxp
a2UgYSB3YXkgdG8gYmUgYWxlcnRlZCB0byBwcm9sb25nZWQga2VybmVsIHBhdXNlcywgc28KPiB0
aGF0IHRoZXkgY2FuIGludmVzdGlnYXRlIGFuZCB0YWtlIGNvcnJlY3RpdmUgYWN0aW9uIChpbmNy
ZWFzZSBiYWNrbG9nLAo+IGluY3JlYXNlIHNlcnZlciBjYXBhY2l0eSwgbW92ZSBzb21lIHdvcmts
b2FkcyB0byBvdGhlciBzZXJ2ZXJzLCBldGMuKS4KPiAKPiBUbyBzdGF0ZSBhbm90aGVyIHdheS4g
VGhlIGtlcm5lbCBjdXJyZW50bHkgY2FuIGJlIGNvbmZpZ3VyZWQgdG8gcHJpbnQgYQo+IG1lc3Nh
Z2Ugd2hlbiB0aGUgYmFja2xvZyBsaW1pdCBpcyBleGNlZWRlZCBhbmQgaXQgbXVzdCBkaXNjYXJk
IHRoZSBhdWRpdAo+IGV2ZW50LiBUaGlzIGlzIGEgdXNlZnVsIG1lc3NhZ2UgZm9yIGFkbWlucywg
d2hpY2ggdGhleSBjYW4gYWRkcmVzcyB3aXRoCj4gY29ycmVjdGl2ZSBhY3Rpb24uIEkgdGhpbmsg
YSBtZXNzYWdlIHNpbWlsYXIgdG8gdGhlIG9uZSBwcm9wb3NlZCBieSB0aGlzCj4gcGF0Y2ggd291
bGQgYmUgZXF1YWxseSB1c2VmdWwgd2hlbiB0aGUgYmFja2xvZyBsaW1pdCBpcyBleGNlZWRlZCBh
bmQgdGhlCj4ga2VybmVsIGlzIGNvbmZpZ3VyZWQgdG8gd2FpdCBmb3IgdGhlIGJhY2tsb2cgdG8g
ZHJhaW4uIEFkbWlucyBjb3VsZAo+IGFkZHJlc3MgdGhhdCBtZXNzYWdlIGluIHRoZSBzYW1lIHdh
eSwgYnV0IHdpdGhvdXQgdGhlIGNvc3Qgb2YgbG9zdCBhdWRpdAo+IGV2ZW50cy4KCklmIGJhY2ts
b2cgd2FpdCB0aW1lIGlzIGV4Y2VlZGVkLCB0aGF0IGNvdWxkIGJlIGEgdXNlZnVsIHdhcm5pbmcg
aWYgdGhhdCBkb2VzIApub3QgZXhpc3QuIEkgZG9uJ3Qga25vdyBob3cgb2Z0ZW4gdGhhdCBjb3Vs
ZCBoYXBwZW4uLi5hbmQgb2YgY291cnNlIHdpdGhvdXQgYSAKd2FybmluZyB3ZSBkb24ndCBrbm93
IGlmIGl0IGhhcHBlbnMgb3Igd2h5IGl0IGhhcHBlbnMuCgpJIGFsc28gd2lzaGVkIHdlIGhhZCBt
ZXRyaWNzIG9uIHRoZSBiYWNrbG9nIHN1Y2ggYXMgbWF4IHVzZWQuIFRoYXQgbWlnaHQgaGVscCAK
YWRtaW5zIHR1bmUgdGhlIHNpemUgb2YgdGhlIGJhY2tsb2cuCgotU3RldmUKCgoKLS0KTGludXgt
YXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVk
aGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0

