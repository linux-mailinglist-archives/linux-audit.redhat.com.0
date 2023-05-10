Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EE66FE22B
	for <lists+linux-audit@lfdr.de>; Wed, 10 May 2023 18:12:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683735133;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Z51MMIWxQXE6BgRQqk/lLBQK5dEbhUQwDAK+8G/MQXE=;
	b=X0MImtYjybyjVepKnAZSMGwwFSQ0H37xeC2n6gGVH8Xa/s87M5Io5OaYbLgn7rOLKyx5Yh
	lppYlVY4f9dTmIGMEPr1muxFENrqUaxh5nzb4dca01QS2kXLf7nrc9r/O7F0OCrXpI7YWR
	uChqONpFrINKS0Vk6avQJ2nxWAgtWjU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-341-W28_xjoDMZu_W5PJC7f0BQ-1; Wed, 10 May 2023 12:12:08 -0400
X-MC-Unique: W28_xjoDMZu_W5PJC7f0BQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C8F63C1CF29;
	Wed, 10 May 2023 16:11:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 92C1C2024CDC;
	Wed, 10 May 2023 16:11:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CFF8E19451C3;
	Wed, 10 May 2023 16:11:42 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 673501946A45 for <linux-audit@listman.corp.redhat.com>;
 Wed, 10 May 2023 16:11:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3C2D52026D3C; Wed, 10 May 2023 16:11:41 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.17.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F69F2026D16;
 Wed, 10 May 2023 16:11:41 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: kathy lyons <kathy.lyons@zayo.com>
Subject: Re: sending audit logs only to audit.log via rsyslog
Date: Wed, 10 May 2023 12:11:40 -0400
Message-ID: <5977529.lOV4Wx5bFT@x2>
Organization: Red Hat
In-Reply-To: <CAN-5jM9GMjCpV6K-sFnsaJUK_AXFaytWz0mB9rAzEVHHqt05Zw@mail.gmail.com>
References: <CAN-5jM-V+J5aZTnu86NzgKw3LGSZ76LyTusrF-MF+V_LjV3u7A@mail.gmail.com>
 <4838148.31r3eYUQgx@x2>
 <CAN-5jM9GMjCpV6K-sFnsaJUK_AXFaytWz0mB9rAzEVHHqt05Zw@mail.gmail.com>
MIME-Version: 1.0
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
Cc: linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkbmVzZGF5LCBNYXkgMTAsIDIwMjMgMTE6NTE6MDQgQU0gRURUIGthdGh5IGx5b25zIHdy
b3RlOgo+IEdyZWF0IC0gc28gSSBkb24ndCBuZWVkIHRoZSBsaW5lIGJlbG93IGluIG15IHJzeXNs
b2cuY29uZiBmaWxlPwo+IAo+ICAgICAgICAgICAgICAgICAgYXVkaXQuKiAgICAgICAgICAgICAg
IH4vdmFyL2xvZy9hdWRpdC9hdWRpdC5sb2cKCk5vIHRoYXQncyBub3QgbmVlZGVkLiBUaGUgd2hv
bGUgcHJvYmxlbSBpcyBjYXVzZWQgYnkgam91cm5hbGQuIEl0IGNvbm5lY3RzIHRvIAphIGJlc3Qg
ZWZmb3J0IG11bHRpY2FzdCBzb2NrZXQgdG8gZ2V0IGF1ZGl0IGV2ZW50cy4gSXQgdGhlbiB3cml0
ZXMgdGhlbSB0byAKcnN5c2xvZyBpbiBhZGRpdGlvbiB0byB0aGUgam91cm5hbC4gTWVhbndoaWxl
LCBhdWRpdGQgY29ubmVjdHMgdG8gdGhlIHJlYWwgCm5ldGxpbmsgaW50ZXJmYWNlIGFuZCBncmFi
cyBldmVudHMgZnJvbSB0aGUga2VybmVsIGFuZCB3cml0ZXMgdGhlbSB0byBkaXNrIAppdHNlbGYu
IE5vIG9uZSBuZWVkcyAzIHNlcGFyYXRlIGF1ZGl0IGxvZ3MuCgpBZnRlciBtYXNraW5nIGpvdXJu
YWxkJ3MgYXVkaXQgc29ja2V0LCBhbGwgbmVlZCB0byBkbyBpcyBoYXZlIHRoZSBhdWRpdCAKZGFl
bW9uIGVuYWJsZWQuIFRoZW4gZXZlcnl0aGluZyBzaG91bGQgd29yayBvdXQuIEFuZCB5b3Ugc2hv
dWxkIGZpbmQgdGhhdCAKYXVkaXQgZXZlbnRzIHdyaXR0ZW4gYnkgYXVkaXRkIGhhdmUgc2xpZ2h0
bHkgYmV0dGVyIGluZm9ybWF0aW9uLgoKLVN0ZXZlCgo+IE9uIFdlZCwgTWF5IDEwLCAyMDIzIGF0
IDk6NTHigK9BTSBTdGV2ZSBHcnViYiA8c2dydWJiQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4gT24g
V2VkbmVzZGF5LCBNYXkgMTAsIDIwMjMgOTo0MzowNCBBTSBFRFQga2F0aHkgbHlvbnMgd3JvdGU6
Cj4gPiA+ICBHb29kIG1vcm5pbmcuICBJIGFtIHRyeWluZyB0byBnZXQgdGhlIGF1ZGl0IGxvZ3Mg
dG8gYmUgd3JpdHRlbiBvbmx5IHRvCj4gPiA+IAo+ID4gPiBhdWRpdC5sb2cuICBDdXJyZW50bHkg
dGhleSBhcmUgd3JpdHRlbiB0byBhdWRpdC5sb2cgYXMgd2VsbCBhcyBzeXNsb2cuCj4gPiA+IEhl
cmUgaXMgbXkgcnN5c2xvZy5jb25mIGZpbGUgLSB3aGF0IGFtIEkgZG9pbmcgd3Jvbmc/Cj4gPiA+
IAo+ID4gPiAgICAgbW9kdWxlKGxvYWQ9ImltZmlsZSIpCj4gPiA+ICAgICBtb2R1bGUobG9hZD0i
aW1rbG9nIikKPiA+ID4gICAgIG1vZHVsZShsb2FkPSJpbWpvdXJuYWwiKQo+ID4gPiAgICAgCj4g
PiA+ICAgICBnbG9iYWwobmV0LmVuYWJsZUROUz0ib2ZmIiB3b3JrRGlyZWN0b3J5PS92YXIvc3Bv
b2wvcnN5c2xvZyIKPiA+ID4gCj4gPiA+IG1heE1lc3NhZ2VTaXplPSIxMjhrIikKPiA+ID4gCj4g
PiA+ICAgICRJbmNsdWRlQ29uZmlnIC9ldGMvcnN5c2xvZy5kLyouY29uZgo+ID4gPiAgICAkQWN0
aW9uRmlsZURlZmF1bHRUZW1wbGF0ZSBSU1lTTE9HX1RyYWRpdGlvbmFsRmlsZUZvcm1hdAo+ID4g
PiAgIAo+ID4gPiAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyBydWxlcwo+ID4gPiAgIAo+ID4gPiAg
ICAgYXVkaXQuKiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH4vdmFyL2xvZy9hdWRp
dC9hdWRpdC5sb2cKPiA+ID4gICAgIGF1dGgud2FybmluZzthdXRocHJpdi5pbmZvICAgfi92YXIv
bG9nL2F1dGgubG9nCj4gPiA+ICAgICAqLio7YXV0aCxhdXRocHJpdi5ub25lICAgICAgICAgICB+
L3Zhci9sb2cvc3lzbG9nCj4gPiA+ICAgICBjcm9uLmluZm8gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfi92YXIvbG9nL2Nyb24ubG9nCj4gPiA+ICAgICBkYWVtb24uaW5mbyAgICAgICAg
ICAgICAgICAgICAgICAgIH4vdmFyL2xvZy9kYWVtb24ubG9nCj4gPiA+ICAgICBrZXJuLiogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfi92YXIvbG9nL2tlcm4ubG9nCj4gPiA+ICAg
ICB1c2VyLmluZm8gICAgICAgICAgICAgICAgICAgICAgICAgICAgIH4vdmFyL2xvZy91c2VyLmxv
Zwo+ID4gCj4gPiBUaGUgdGhpbmcgdGhhdCBpcyB3cml0aW5nIHRoZW0gdG8gcnN5c2xvZyBpcyBz
eXN0ZW1kLWpvdXJuYWxkLiBZb3UgY2FuCj4gPiBzdG9wCj4gPiB0aGlzIGJ5IHJ1bm5pbmc6Cj4g
PiAKPiA+IHN5c3RlbWN0bCBtYXNrIHN5c3RlbWQtam91cm5hbGQtYXVkaXQuc29ja2V0Cj4gPiBz
eXN0ZW1jdGwgc3RvcCBzeXN0ZW1kLWpvdXJuYWxkLWF1ZGl0LnNvY2tldAo+ID4gCj4gPiBUaGVu
IHlvdSB3aWxsIG9ubHkgaGF2ZSBsb2dzIHdyaXR0ZW4gdG8gdGhlIGF1ZGl0IGxvZy4KPiA+IAo+
ID4gLVN0ZXZlCgoKCgotLQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QKTGludXgtYXVkaXRAcmVk
aGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWF1ZGl0Cg==

