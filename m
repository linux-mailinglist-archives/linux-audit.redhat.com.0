Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB867C508
	for <lists+linux-audit@lfdr.de>; Wed, 31 Jul 2019 16:37:02 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6EF7130C75D4;
	Wed, 31 Jul 2019 14:37:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8907660920;
	Wed, 31 Jul 2019 14:36:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F262B41F53;
	Wed, 31 Jul 2019 14:36:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6VEap6h031507 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 31 Jul 2019 10:36:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DA52A614D8; Wed, 31 Jul 2019 14:36:50 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-117-39.phx2.redhat.com [10.3.117.39])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 25F356A02C;
	Wed, 31 Jul 2019 14:36:49 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: Linux Audit userspace query
Date: Wed, 31 Jul 2019 10:36:48 -0400
Message-ID: <3098173.AB4Qcg4CNO@x2>
Organization: Red Hat
In-Reply-To: <CAAUqJDvcWcmaC5MTEEni6BDJfBN0HCR=K6wB7+kpPpuEuZWM6A@mail.gmail.com>
References: <DB7PR07MB551327DB6DFB72921559C9839FC00@DB7PR07MB5513.eurprd07.prod.outlook.com>
	<CAAUqJDvcWcmaC5MTEEni6BDJfBN0HCR=K6wB7+kpPpuEuZWM6A@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x6VEap6h031507
X-loop: linux-audit@redhat.com
Cc: Muhammad Adil Inam <20100180@lums.edu.pk>, Ali Ahad <20100284@lums.edu.pk>,
	Ondrej =?utf-8?B?TW9zbsOhxI1law==?= <omosnacek@gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Wed, 31 Jul 2019 14:37:01 +0000 (UTC)

T24gV2VkbmVzZGF5LCBKdWx5IDMxLCAyMDE5IDc6MDY6NTMgQU0gRURUIE9uZHJlaiBNb3Nuw6HE
jWVrIHdyb3RlOgo+ID4gQmFzaWNhbGx5LCBJIGFtIHVuYWJsZSB0byBmaWd1cmUgb3V0IHdoZXJl
IGFuIGF1ZGl0X2V2ZW50IGlzIGJlaW5nCj4gPiBwb3B1bGF0ZWQgd2l0aCB0aGUgcmVsZXZhbnQg
ZGF0YSBzdWNoIGFzIHRoZSBhdWRpdF9hcmdzIChhMCxhMSxhMikgc28KPiA+IHRoYXQgSSBjYW4g
Y2hhbmdlIGFuZCBwbGF5IGFyb3VuZCB3aXRoIHRoZSBhcmd1bWVudHMgdGhhdCAgYXJlIGJlaW5n
Cj4gPiByZWNvcmRlZCBhbmQgcG9wdWxhdGVkIGF0IHRoZSBzb3VyY2UuCj4KPiBBZ2FpbiwgdG8g
Y2hhbmdlIHRoZSB3YXkgdmFsdWVzIGFyZSBiZWluZyByZWNvcmRlZCBpbnRvIHRoZSByZWNvcmQs
Cj4geW91J2QgbmVlZCB0byBtb2RpZnkgdGhlIGtlcm5lbC4KClJpZ2h0LiBFdmVyeXRoaW5nIGNv
bWVzIGZyb20gdGhlIGtlcm5lbC4gQXVkaXQgdXNlcnNwYWNlIGp1c3Qgc3RvcmVzIGl0IHRvIApk
aXNrIGFuZCB0aGF0IGlzIHdoeSB5b3UgZG9uJ3Qgc2VlIGFueSBjb2RlIGRlYWxpbmcgd2l0aCB0
aGUgYXJncy4KIAo+ID4gS2luZGx5IGxldCBtZSBrbm93IGlmIHlvdSBjYW4gc2xpZ2h0bHkgZ3Vp
ZGUgbWUgaW4gdGhpcyByZWdhcmQuIEkgd291bGQKPiA+IGJlIHJlYWxseSBncmF0ZWZ1bC4gQWxz
byBraW5kbHkgbGV0IG1lIGtub3cgb2YgdGhlIGZlYXNpYmlsaXR5IG9mIHRoZQo+ID4gcHJvYmxl
bS4gCgpZb3Ugd291bGQgbmVlZCB0byBsZWFybiB0byBidWlsZCwgbW9kaWZ5LCBhbmQgZGVidWcg
a2VybmVscy4KCj4gPiBTbyBiYXNpY2FsbHkgdGhlIGFyZ3VtZW50IGExIG9mIHRoZSB3cml0ZSBz
eXNjYWxsIHJlY29yZHMgdGhlCj4gPiBwb2ludGVyIHRvIGEgYnVmZmVyLiBJcyBpdCBwb3NzaWJs
ZSB0byBzdG9yZSB0aGUgZGVyZWZlcmVuY2VkIGNvbXBsZXRlCj4gPiBidWZmZXIgYXMgdGhlIGFy
Z3VtZW50IGluc3RlYWQ/CgpXcml0ZXMgY2FuIGJlIGh1Z2UgYW5kIGNvdWxkIGNvbnRhaW4gc2Vx
dWVuY2VzIGRlc2lnbmVkIHRvIHRyaWNrIHBhcnNlcnMuIApUaGF0IG1lYW5zIGl0IHdvdWxkIG5l
ZWQgdG8gYmUgZW5jb2RlZCB3aGljaCBkb3VibGVzIHRoZSBzaXplIG9mIHRoZSB3cml0ZSAKZGF0
YSBiZWluZyBjb2xsZWN0ZWQuIEFsc28sIEkgdGhpbmsgdGhlcmUgYXJlIGZpbGUgc3lzdGVtcyB0
aGF0IGFyZSAKam91cm5hbGxpbmcgbWVhbmluZyB0aGF0IHRoZWlyIG1ldGFkYXRhIGNvbnRhaW5z
IHdoYXQgdGhlIGNoYW5nZXMgYXJlIGluIGNhc2UgCml0IGhhcyB0byByZWNvdmVyLiBUaGF0IG1p
Z2h0IGJlIGFub3RoZXIgYXZlbnVlIHRvIGludmVzdGlnYXRlLgoKLVN0ZXZlCgoKCi0tCkxpbnV4
LWF1ZGl0IG1haWxpbmcgbGlzdApMaW51eC1hdWRpdEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJl
ZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1hdWRpdA==
