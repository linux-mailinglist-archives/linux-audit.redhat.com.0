Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C60288440
	for <lists+linux-audit@lfdr.de>; Fri,  9 Aug 2019 22:49:13 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3CB1D3CA14;
	Fri,  9 Aug 2019 20:49:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C4AC5C205;
	Fri,  9 Aug 2019 20:49:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7F5D82551C;
	Fri,  9 Aug 2019 20:48:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x79Kmp7e023827 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 9 Aug 2019 16:48:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A8CB45D6A9; Fri,  9 Aug 2019 20:48:51 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-117-12.phx2.redhat.com [10.3.117.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6CEF05D6A5;
	Fri,  9 Aug 2019 20:48:48 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: Number of TTY events vs Number of USER_TTY events
Date: Fri, 09 Aug 2019 16:48:47 -0400
Message-ID: <2798894.CVzZM77eHU@x2>
Organization: Red Hat
In-Reply-To: <AC213336-71F2-4FC4-9712-AFB7E62EB07B@pnnl.gov>
References: <AC213336-71F2-4FC4-9712-AFB7E62EB07B@pnnl.gov>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x79Kmp7e023827
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Fri, 09 Aug 2019 20:49:12 +0000 (UTC)

T24gV2VkbmVzZGF5LCBBdWd1c3QgNywgMjAxOSA2OjEzOjE5IFBNIEVEVCBTbWl0aCwgR2FyeSBS
IHdyb3RlOgo+IEkgaGF2ZSBUVFkgYXVkaXRpbmcgc2V0IHVwIG9uIGEgbnVtYmVyIG9mIGhvc3Rz
IHVzaW5nIHBhbV90dHlfYXVkaXQgZm9yIHRoZQo+IHJvb3QgYWNjb3VudC4gSSBoYXZlIHRoaXMg
bGluZSBpbiBhIFBBTSBmaWxlIHRvIGVuYWJsZSBpdDoKIAo+IHNlc3Npb24gICByZXF1aXJlZCBw
YW1fdHR5X2F1ZGl0LnNvIGRpc2FibGU9KiBlbmFibGU9cm9vdAo+IAo+IEluIGxvb2tpbmcgYXQg
dGhlIHJlcG9ydHMgZnJvbSBhdXJlcG9ydCBhbmQgYXVzZWFyY2gsIHRoZSBudW1iZXIgb2YgVFRZ
Cj4gZXZlbnRzIGlzIGFsd2F5cyBlcXVhbCB0byB0aGUgbnVtYmVyIG9mIFVTRVJfVFRZIGV2ZW50
cy4gRm9yIGluc3RhbmNlOgogCj4gIyBhdXNlYXJjaCAtaSAtbSBUVFkgLXRzIHRvZGF5IHwgd2Mg
LWwgOyBhdXNlYXJjaCAtaSAtbSBVU0VSX1RUWSAtdHMgdG9kYXkKPiB8IHdjIC1sCj4gMjAKPiAy
MAo+IAo+IEkgc3RhcnRlZCB3b25kZXJpbmcsIOKAnEFyZSB0aGVyZSBhbHdheXMgdGhlIHNhbWUg
bnVtYmVyIG9mIHRoZXNlIHR3byBldmVudAo+IHR5cGVzP+KAnSBJIHRyaWVkIGNvbnN0cnVjdGlu
ZyBzb21lIHN5bnRoZXRpYyBjYXNlcyB0byBzZWUgaWYgdGhlcmUgaXMgYQo+IGNhc2Ugd2hlcmUg
dGhlcmUgaXNu4oCZdCBhbiBlcXVhbCBudW1iZXIgb2YgdGhlIHR3byBldmVudHMuIEkgY291bGRu
4oCZdAo+IGNvbnN0cnVjdCBzdWNoIGEgY2FzZS4gIElzIHRoZXJlIGEgY2FzZSBvZiBjYXNlcyB3
aGVyZSB0aGUgdHdvIHR5cGUgZXZlbnQKPiB0eXBlcyBhcmVu4oCZdCBvZiBlcXVhbCBudW1iZXI/
CgpJIHRoaW5rIHRoYXQgaXMganVzdCBhIGNvaW5jaWRlbmNlLiBJIGRvbid0IHRoaW5rIHRoZXJl
IGlzIGFueSBhdHRlbXB0IHRvIAprZWVwIHRoZW0gaW4gc3luYy4gRm9yIGV4YW1wbGUsIGlmIHlv
dSBvcGVuIGEgZG9jdW1lbnQgYW5kIGVkaXQgaXQgZm9yIGEgbG9uZyAKdGltZSwgeW91IHdpbGwg
cHJvYmFibHkgZ2V0IHRoZW0gb3V0IG9mIHN5bmMgYmVjYXVzZSB0aGUgYmFzaCBiYXNlZCBvbmUg
bG9zZXMgCnZpc2liaWxpdHkgb2Ygd2hhdCdzIGhhcHBlbmluZyBpbiB0aGUgZG9jdW1lbnQgZWRp
dG9yLiBNZWFud2hpbGUgdGhlIGtlcm5lbCAKc3RpbGwgc2VlcyBldmVyeXRoaW5nLgoKLVN0ZXZl
CgoKCi0tCkxpbnV4LWF1ZGl0IG1haWxpbmcgbGlzdApMaW51eC1hdWRpdEByZWRoYXQuY29tCmh0
dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1hdWRpdA==
