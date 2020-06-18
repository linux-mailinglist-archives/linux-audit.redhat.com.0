Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 2F3EB1FFE61
	for <lists+linux-audit@lfdr.de>; Fri, 19 Jun 2020 00:58:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592521088;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kCWYrO5/JTDTtJwc3DRrdhUV4Zm/aYpY6j6e2O+5l58=;
	b=D32/0Gq4jAHAFMSuaH+NWKa1KGwESfZ5tj7WJpvRgsYGf704YB0eadY9OEtE/xnVKajwug
	YEKC/fFU6c7ysZkPrFS1gMprCug0y6YuCC+QP+o6e2iQk33CR3GjBdYnvMH1C9rD2mMcHI
	zx0D0UvOd39woXL5PWpeCEejMVDYt58=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-Ay0-Vx-8Nf2kRfmhBDbm4w-1; Thu, 18 Jun 2020 18:58:06 -0400
X-MC-Unique: Ay0-Vx-8Nf2kRfmhBDbm4w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A9398005AD;
	Thu, 18 Jun 2020 22:57:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B42965BAC3;
	Thu, 18 Jun 2020 22:57:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A2947833C8;
	Thu, 18 Jun 2020 22:57:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05IMvVpV016208 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 18 Jun 2020 18:57:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5DF65F8A10; Thu, 18 Jun 2020 22:57:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59AFCFED3C
	for <linux-audit@redhat.com>; Thu, 18 Jun 2020 22:57:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CAA71033644
	for <linux-audit@redhat.com>; Thu, 18 Jun 2020 22:57:28 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-479-KlzkmhPGN76E9xDRoJmh-A-1; Thu, 18 Jun 2020 18:57:24 -0400
X-MC-Unique: KlzkmhPGN76E9xDRoJmh-A-1
Received: by mail-qk1-f196.google.com with SMTP id b4so7249522qkn.11;
	Thu, 18 Jun 2020 15:57:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=iYsYwG4XtAfQjw8izBPPxry1ubQDcO5cUSGYql7FGBE=;
	b=H018Qgm64VBCjhyM/UXklhZ9xgvVmEC40ykI/CSleg0Sjn2M7fCpeU3auZ/CV6g4zH
	jmX7VG9OLfC/6bxlyLGwUcxtmbufHnEwhTDTfsOzbjRprecysjn+eqQ6HfKH84UwAaw0
	wqB1p7aLeWK7xD0pPM4FJYQsKswHJwljPYpryu/jCLRb773OeYsRUarrazvDkR0oWvmB
	88G44ZdlZT3Yp/zpIGTSUFIjDer79BCFMZZsSHLUsWQGC2NHh8Y9ZkUOT1FciD1Tz0TE
	eHaSdMZCTAUTK/3JTpk10MNdWXKm5FSJHtb43xU3OFLzphwDtvJ4/uE9xmKuLtZJzrk+
	a07w==
X-Gm-Message-State: AOAM530KLXfTcGZoUsXeneEb17D5kwxROHK1RjN2pI+sgbAcU94CI2WK
	mh5nHxel4QqnBHo0tBF8o78YwBSoIK0=
X-Google-Smtp-Source: ABdhPJxVxTuvme0thXLVoioBL11s9HXSlR4h18s0MRmKa7weNVvkcO+TjNKWDNYw6f1BmaoVzT/FPw==
X-Received: by 2002:a37:9204:: with SMTP id u4mr756847qkd.115.1592521043235;
	Thu, 18 Jun 2020 15:57:23 -0700 (PDT)
Received: from linux-kernel-dev (ool-182c9054.dyn.optonline.net.
	[24.44.144.84]) by smtp.gmail.com with ESMTPSA id
	h50sm4893552qte.25.2020.06.18.15.57.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 18 Jun 2020 15:57:22 -0700 (PDT)
Date: Thu, 18 Jun 2020 22:57:21 +0000
From: Max Englander <max.englander@gmail.com>
To: Steve Grubb <sgrubb@redhat.com>
Subject: Re: [PATCH] audit: optionally print warning after waiting to enqueue
	record
Message-ID: <20200618225720.GA3975@linux-kernel-dev>
References: <20200616045855.GA1699@linux-kernel-dev>
	<CAHC9VhSotFw2i7HzWrHUyc6VSbwTpv8ZBeP58H_mzi6bd=Uouw@mail.gmail.com>
	<20200617225416.GA2688@linux-kernel-dev> <1648649.cZYg8c8PMo@x2>
MIME-Version: 1.0
In-Reply-To: <1648649.cZYg8c8PMo@x2>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Content-Disposition: inline

T24gVGh1LCBKdW4gMTgsIDIwMjAgYXQgMDk6Mzk6MDhBTSAtMDQwMCwgU3RldmUgR3J1YmIgd3Jv
dGU6Cj4gT24gV2VkbmVzZGF5LCBKdW5lIDE3LCAyMDIwIDY6NTQ6MTYgUE0gRURUIE1heCBFbmds
YW5kZXIgd3JvdGU6Cj4gPiBPbiBXZWQsIEp1biAxNywgMjAyMCBhdCAwMjo0NzoxOVBNIC0wNDAw
LCBQYXVsIE1vb3JlIHdyb3RlOgo+ID4gPiBPbiBUdWUsIEp1biAxNiwgMjAyMCBhdCAxMjo1OCBB
TSBNYXggRW5nbGFuZGVyIDxtYXguZW5nbGFuZGVyQGdtYWlsLmNvbT4gCj4gd3JvdGU6Cj4gPiA+
ID4gSW4gZW52aXJvbm1lbnRzIHdoZXJlIHNlY3VyaXR5IGlzIHByaW9yaXRpemVkLCB1c2VycyBt
YXkgc2V0Cj4gPiA+ID4gLS1iYWNrbG9nX3dhaXRfdGltZSB0byBhIGhpZ2ggdmFsdWUgaW4gb3Jk
ZXIgdG8gcmVkdWNlIHRoZSBsaWtlbGlob29kCj4gPiA+ID4gdGhhdCBhbnkgYXVkaXQgZXZlbnQg
aXMgbG9zdCwgZXZlbiB0aG91Z2ggZG9pbmcgc28gbWF5IHJlc3VsdCBpbgo+ID4gPiA+IHVucHJl
ZGljdGFibGUgcGVyZm9ybWFuY2UgaWYgdGhlIGtlcm5lbCBzY2hlZHVsZXMgYSB0aW1lb3V0IHdo
ZW4gdGhlCj4gPiA+ID4gYmFja2xvZyBsaW1pdCBpcyBleGNlZWRlZC4gRm9yIHRoZXNlIHVzZXJz
LCB0aGUgbmV4dCBiZXN0IHRoaW5nIHRvCj4gPiA+ID4gcHJlZGljdGFibGUgcGVyZm9ybWFuY2Ug
aXMgdGhlIGFiaWxpdHkgdG8gcXVpY2tseSBkZXRlY3QgYW5kIHJlYWN0IHRvCj4gPiA+ID4gZGVn
cmFkZWQgcGVyZm9ybWFuY2UuIFRoaXMgcGF0Y2ggcHJvcG9zZXMgdG8gYWlkIHRoZSBkZXRlY3Rp
b24gb2YKPiA+ID4gPiBrZXJuZWwKPiA+ID4gPiBhdWRpdCBzdWJzeXN0ZW0gcGF1c2VzIHRocm91
Z2ggdGhlIGZvbGxvd2luZyBjaGFuZ2VzOgo+ID4gPiA+IAo+ID4gPiA+IEFkZCBhIHZhcmlhYmxl
IG5hbWVkIGF1ZGl0X2JhY2tsb2dfd2Fybl90aW1lLiBFbmZvcmNlIHRoZSB2YWx1ZSBvZiB0aGlz
Cj4gPiA+ID4gdmFyaWFibGUgdG8gYmUgbm8gbGVzcyB0aGFuIHplcm8sIGFuZCBubyBtb3JlIHRo
YW4gdGhlIHZhbHVlIG9mCj4gPiA+ID4gYXVkaXRfYmFja2xvZ193YWl0X3RpbWUuCj4gPiA+ID4g
Cj4gPiA+ID4gSWYgYXVkaXRfYmFja2xvZ193YXJuX3RpbWUgaXMgZ3JlYXRlciB0aGFuIHplcm8g
YW5kIGlmIHRoZSB0b3RhbCB0aW1lCj4gPiA+ID4gc3BlbnQgd2FpdGluZyB0byBlbnF1ZXVlIGFu
IGF1ZGl0IHJlY29yZCBpcyBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8KPiA+ID4gPiBhdWRpdF9i
YWNrbG9nX3dhcm5fdGltZSwgdGhlbiBwcmludCBhIHdhcm5pbmcgd2l0aCB0aGUgdG90YWwgdGlt
ZQo+ID4gPiA+IHNwZW50IHdhaXRpbmcuCj4gPiA+ID4gCj4gPiA+ID4gQW4gZXhhbXBsZSBjb25m
aWd1cmF0aW9uOgo+ID4gPiA+ICAgICAgICAgYXVkaXRjdGwgLS1iYWNrbG9nX3dhcm5fdGltZSA1
MAo+ID4gPiA+IAo+ID4gPiA+IEFuIGV4YW1wbGUgd2FybmluZyBtZXNzYWdlOgo+ID4gPiA+ICAg
ICAgICAgYXVkaXQ6IHNsZWVwX3RpbWU9NTIgPj0gYXVkaXRfYmFja2xvZ193YXJuX3RpbWU9NTAK
PiA+ID4gPiAKPiA+ID4gPiBUZXN0ZWQgb24gVWJ1bnR1IDE4LjA0LjA0IHVzaW5nIGNvbXBsZW1l
bnRhcnkgY2hhbmdlcyB0byB0aGUgYXVkaXQKPiA+ID4gPiB1c2Vyc3BhY2U6IGh0dHBzOi8vZ2l0
aHViLmNvbS9saW51eC1hdWRpdC9hdWRpdC11c2Vyc3BhY2UvcHVsbC8xMzEuCj4gPiA+ID4gCj4g
PiA+ID4gU2lnbmVkLW9mZi1ieTogTWF4IEVuZ2xhbmRlciA8bWF4LmVuZ2xhbmRlckBnbWFpbC5j
b20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gCj4gPiA+ID4gIGluY2x1ZGUvdWFwaS9saW51eC9hdWRp
dC5oIHwgIDcgKysrKysrLQo+ID4gPiA+ICBrZXJuZWwvYXVkaXQuYyAgICAgICAgICAgICB8IDM1
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiA+ID4gIDIgZmlsZXMgY2hh
bmdlZCwgNDEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4gPiAKPiA+ID4gSWYgYW4g
YWRtaW4gaXMgcHJpb3JpdGl6aW5nIHNlY3VyaXR5LCBha2EgZG9uJ3QgbG9vc2UgYW55IGF1ZGl0
Cj4gPiA+IHJlY29yZHMsIGFuZCB0aGVyZSBpcyBhIGNvbmNlcm4gb3ZlciB2YXJpYWJsZSBzeXN0
ZW0gbGF0ZW5jeSBkdWUgdG8gYW4KPiA+ID4gYXVkaXQgcXVldWUgYmFja2xvZywgd2h5IG5vdCBz
aW1wbHkgZGlzYWJsZSB0aGUgYmFja2xvZyBsaW1pdD8KPiA+IAo+ID4gVGhhdOKAmXMgZ29vZCBp
biBzb21lIGNhc2VzLCBidXQgaW4gb3RoZXIgY2FzZXMgdW5ib3VuZGVkIGdyb3d0aCBvZiB0aGUK
PiA+IGJhY2tsb2cgY291bGQgcmVzdWx0IGluIG1lbW9yeSBpc3N1ZXMuIElmIHRoZSBrZXJuZWwg
cnVucyBvdXQgb2YgbWVtb3J5Cj4gPiBpdCB3b3VsZCBkcm9wIHRoZSBhdWRpdCBldmVudCBvciBw
b3NzaWJseSBoYXZlIG90aGVyIHByb2JsZW1zLiBJdCBjb3VsZAo+ID4gYWxzbyBhbHNvIGNvbnN1
bWUgbWVtb3J5IGluIGEgd2F5IHRoYXQgc3RhcnZlcyB1c2VyIHdvcmtsb2FkcyBvciBjYXVzZXMK
PiA+IHRoZW0gdG8gYmUga2lsbGVkIGJ5IHRoZSBPT01LaWxsZXIuCj4gCj4gVGhlIGtlcm5lbCBj
YW5ub3QgZ3JvdyB0aGUgYmFja2xvZyB1bmJvdW5kZWQuIElmIHlvdSBkbyBub3RoaW5nLCB0aGUg
YmFja2xvZyAKPiBpcyA2NCAtIHdoaWNoIGlzIHRvbyBzbWFsbCB0byByZWFsbHkgdXNlLiBPdGhl
cndpc2UsIHlvdSBzZXQgdGhlIGJhY2tsb2cgdG8gYSAKPiBmaW5pdGUgbnVtYmVyIHdpdGggdGhl
IC1iIG9wdGlvbi4KPiAKPiA+IFRvIHJlZmluZSBteSBtb3RpdmF0aW5nIHVzZSBjYXNlIGEgYml0
LCBpZiBhIEt1YmVybmV0ZXMgYWRtaW4gd2FudHMgdG8KPiA+IHByaW9yaXRpemUgc2VjdXJpdHks
IGFuZCBhbHNvIGF2b2lkIHVuYm91bmRlZCBncm93dGggb2YgdGhlIGF1ZGl0Cj4gPiBiYWNrbG9n
LCB0aGV5IG1heSBzZXQgLWIgYW5kIC0tYmFja2xvZ193YWl0X3RpbWUgaW4gYSB3YXkgdGhhdCBs
aW1pdHMKPiA+IGtlcm5lbCBtZW1vcnkgdXNhZ2UgYW5kIHJlZHVjZXMgdGhlIGxpa2VsaWhvb2Qg
dGhhdCBhbnkgYXVkaXQgZXZlbnQgaXMKPiA+IGxvc3QuIE9jY2FzaW9uYWwgcGVyZm9ybWFuY2Ug
ZGVncmFkYXRpb24gbWF5IGJlIGFjY2VwdGFibGUgdG8gdGhlIGFkbWluLAo+ID4gYnV0IHRoZXkg
d291bGQgbGlrZSBhIHdheSB0byBiZSBhbGVydGVkIHRvIHByb2xvbmdlZCBrZXJuZWwgcGF1c2Vz
LCBzbwo+ID4gdGhhdCB0aGV5IGNhbiBpbnZlc3RpZ2F0ZSBhbmQgdGFrZSBjb3JyZWN0aXZlIGFj
dGlvbiAoaW5jcmVhc2UgYmFja2xvZywKPiA+IGluY3JlYXNlIHNlcnZlciBjYXBhY2l0eSwgbW92
ZSBzb21lIHdvcmtsb2FkcyB0byBvdGhlciBzZXJ2ZXJzLCBldGMuKS4KPiA+IAo+ID4gVG8gc3Rh
dGUgYW5vdGhlciB3YXkuIFRoZSBrZXJuZWwgY3VycmVudGx5IGNhbiBiZSBjb25maWd1cmVkIHRv
IHByaW50IGEKPiA+IG1lc3NhZ2Ugd2hlbiB0aGUgYmFja2xvZyBsaW1pdCBpcyBleGNlZWRlZCBh
bmQgaXQgbXVzdCBkaXNjYXJkIHRoZSBhdWRpdAo+ID4gZXZlbnQuIFRoaXMgaXMgYSB1c2VmdWwg
bWVzc2FnZSBmb3IgYWRtaW5zLCB3aGljaCB0aGV5IGNhbiBhZGRyZXNzIHdpdGgKPiA+IGNvcnJl
Y3RpdmUgYWN0aW9uLiBJIHRoaW5rIGEgbWVzc2FnZSBzaW1pbGFyIHRvIHRoZSBvbmUgcHJvcG9z
ZWQgYnkgdGhpcwo+ID4gcGF0Y2ggd291bGQgYmUgZXF1YWxseSB1c2VmdWwgd2hlbiB0aGUgYmFj
a2xvZyBsaW1pdCBpcyBleGNlZWRlZCBhbmQgdGhlCj4gPiBrZXJuZWwgaXMgY29uZmlndXJlZCB0
byB3YWl0IGZvciB0aGUgYmFja2xvZyB0byBkcmFpbi4gQWRtaW5zIGNvdWxkCj4gPiBhZGRyZXNz
IHRoYXQgbWVzc2FnZSBpbiB0aGUgc2FtZSB3YXksIGJ1dCB3aXRob3V0IHRoZSBjb3N0IG9mIGxv
c3QgYXVkaXQKPiA+IGV2ZW50cy4KPiAKPiBJZiBiYWNrbG9nIHdhaXQgdGltZSBpcyBleGNlZWRl
ZCwgdGhhdCBjb3VsZCBiZSBhIHVzZWZ1bCB3YXJuaW5nIGlmIHRoYXQgZG9lcyAKPiBub3QgZXhp
c3QuIEkgZG9uJ3Qga25vdyBob3cgb2Z0ZW4gdGhhdCBjb3VsZCBoYXBwZW4uLi5hbmQgb2YgY291
cnNlIHdpdGhvdXQgYSAKPiB3YXJuaW5nIHdlIGRvbid0IGtub3cgaWYgaXQgaGFwcGVucyBvciB3
aHkgaXQgaGFwcGVucy4KICAKV2hhdCB5b3XigJlyZSBkZXNjcmliaW5nIGFscmVhZHkgZXhpc3Rz
LCBpZiBJ4oCZbSByZWFkaW5nIHlvdXIgd29yZHMgcmlnaHQuCkluIHRoZSBldmVudCB0aGF0IHRo
ZSBiYWNrbG9nIHdhaXQgdGltZSBsaW1pdCBpcyBleGNlZWRlZCwgdGhlIC1mIGZsYWcKaXMgY29u
c3VsdGVkLCBhbmQsIGlmIHRoZSB2YWx1ZSBvZiAtZiBpcyAxLCB0aGVuIGFuIGVycm9yIG1lc3Nh
Z2UKc3RhdGluZyB0aGF0IHRoZSBiYWNrbG9nIGxpbWl0IGlzIGV4Y2VlZGVkIGlzIHByaW50ZWQu
IFRoaXMgaXMgYWxzbyB0cnVlCndoZW4gdGhlIGJhY2tsb2cgd2FpdCB0aW1lIGlzIHplcm8uCgpX
aGF0IEkgYW0gc3VnZ2VzdGluZyBpcyB0aGF0IGV2ZW4gaWYgdGhlIHRoZSBiYWNrbG9nIHdhaXQg
dGltZSBpcyBub3QKZXhjZWVkZWQsIGl0IHdvdWxkIGJlIHVzZWZ1bCBmb3IgdGhlIGtlcm5lbCB0
byByZXBvcnQgd2hlbiBiYWNrbG9nCndhaXRpbmcgb2NjdXJzIGFzIGEgd2F5IHRvIGhlbHAgaWRl
bnRpZnkgZGVncmFkZWQga2VybmVsIHBlcmZvcm1hbmNlLgoKPiBJIGFsc28gd2lzaGVkIHdlIGhh
ZCBtZXRyaWNzIG9uIHRoZSBiYWNrbG9nIHN1Y2ggYXMgbWF4IHVzZWQuIFRoYXQgbWlnaHQgaGVs
cCAKPiBhZG1pbnMgdHVuZSB0aGUgc2l6ZSBvZiB0aGUgYmFja2xvZy4KPiAKPiAtU3RldmUKPiAK
PiAKCi0tCkxpbnV4LWF1ZGl0IG1haWxpbmcgbGlzdApMaW51eC1hdWRpdEByZWRoYXQuY29tCmh0
dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1hdWRpdA==

