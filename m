Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E160369520
	for <lists+linux-audit@lfdr.de>; Mon, 15 Jul 2019 16:56:54 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D504730C0DCF;
	Mon, 15 Jul 2019 14:56:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A04E19698;
	Mon, 15 Jul 2019 14:56:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5DE9E149E1;
	Mon, 15 Jul 2019 14:56:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6FEuZkV015173 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 15 Jul 2019 10:56:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 54EB2608C6; Mon, 15 Jul 2019 14:56:35 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-117-145.phx2.redhat.com [10.3.117.145])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B29FD6085B;
	Mon, 15 Jul 2019 14:56:31 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: =?utf-8?B?5p2o5rW3?= <hai.yang@magic-shield.com>
Subject: Re: overhead of auditd
Date: Mon, 15 Jul 2019 10:56:30 -0400
Message-ID: <3117481.ooqTYu3AtQ@x2>
Organization: Red Hat
In-Reply-To: <tencent_426F741872D994171406DF95@qq.com>
References: <tencent_5FA425C1329B32126C1D89F1@qq.com> <9307307.NKOEW2x8Z6@x2>
	<tencent_426F741872D994171406DF95@qq.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x6FEuZkV015173
X-loop: linux-audit@redhat.com
Cc: linux-audit <linux-audit@redhat.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Mon, 15 Jul 2019 14:56:53 +0000 (UTC)

T24gTW9uZGF5LCBKdWx5IDE1LCAyMDE5IDY6MjE6MTEgQU0gRURUIOadqOa1tyB3cm90ZToKPiBJ
IGV2ZXIgcmVhZCB0aGUgZG9jdW1lbnQgeW91IHdyb3RlIGFib3V0IGxheWluZyBJRFMgb24gdG9w
IG9mIGF1ZGl0ZC4gQW5kIEkKPiBzdXBwb3NlIGlub3RpZnkgY291bGQgYmUgbGlnaHR3ZWlnaHQg
Zm9yIElEUy4gQW55IGNvbW1lbnQ/CgpZZXMsIGF1ZGl0IHdvcmtzIGZpbmUgZm9yIElEUyB3b3Jr
LiBCdXQgb25lIHdvdWxkIG5vdCBhdWRpdCBhbGwgc3lzY2FsbHMgZm9yIApldmVyeSBwcm9ncmFt
LiBUaGF0IHdpbGwga2lsbCB5b3VyIHN5c3RlbS4gWW91IGhhdmUgdG8gYmUgc2VsZWN0aXZlIGFi
b3V0IAp3aGF0IHlvdSBhcmUgYXVkaXRpbmcuCgotU3RldmUKIAo+IC0tLS0tLS0tLS0tLS0tLS0t
LSBPcmlnaW5hbCAtLS0tLS0tLS0tLS0tLS0tLS0KPiBGcm9tOiAgIlN0ZXZlIEdydWJiIjxzZ3J1
YmJAcmVkaGF0LmNvbT47Cj4gRGF0ZTogIEZyaSwgSnVsIDEyLCAyMDE5IDA4OjE0IFBNCj4gVG86
ICAibGludXgtYXVkaXQiPGxpbnV4LWF1ZGl0QHJlZGhhdC5jb20+OyAKPiBDYzogICLmnajmtbci
PGhhaS55YW5nQG1hZ2ljLXNoaWVsZC5jb20+OyAKPiBTdWJqZWN0OiAgUmU6IG92ZXJoZWFkIG9m
IGF1ZGl0ZAo+IAo+IEhlbGxvLAo+IAo+IE9uIFRodXJzZGF5LCBKdWx5IDExLCAyMDE5IDExOjIz
OjQ1IFBNIEVEVCDmnajmtbcgd3JvdGU6Cj4gCj4gPiBUdXJuaW5nIG9uIGFsbCBzeXN0ZW0gY2Fs
bHMgaW4gYXVkaXQucnVsZXMsIGFuZCB0cmFuc2ZlcnJpbmcgYSB0YXIgZmlsZQo+ID4gdG8gdGhl
IHRhcmdldCBzeXN0ZW0gKENlbnRPUyA3LCA0IGNvcmVzKSwgSSBmb3VuZCAiYXVkaXRkIiBjb25z
dW1lcwo+ID4gaGlnaCBDUFUgdXNhZ2UuIElzIGl0IGV4cGVjdGVkPwo+IAo+IEl0IHdvdWxkIG5v
dCBiZSBzdXJwcmlzaW5nLiBTb21lIHN5c3RlbSBjYWxscyBoYXZlIG1vcmUgb3ZlcmhlYWQgdGhh
bgo+IG90aGVycy4gIFNvLCBkZXBlbmRpbmcgb24gZXZlcnl0aGluZyB0aGF0IGlzIHJ1bm5pbmcs
IHlvdSBjYW4ga2lsbCB5b3VyCj4gc3lzdGVtLiAKPiAKPiA+IEJUVywgYWZ0ZXIgdHVybmluZyB3
cml0ZS1sb2dzIG9mZiwgYW5kIGFkZCBkaXNwYXRjaGVyLCBib3RoICJhdWRpc3BkIgo+ID4gYW5k
ICAiYXVkaXRkIiBhcmUgY29uc3VtaW5nIGhpZ2ggQ1BVLgo+IAo+IFRoZXkgaGF2ZSBhIGxvdCBv
ZiBldmVudHMgdG8gaGFuZGxlLgoKCgoKLS0KTGludXgtYXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4
LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWF1ZGl0
