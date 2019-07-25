Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB03751CB
	for <lists+linux-audit@lfdr.de>; Thu, 25 Jul 2019 16:51:50 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 28C8F30842AC;
	Thu, 25 Jul 2019 14:51:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A79221017E3B;
	Thu, 25 Jul 2019 14:51:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B06501800206;
	Thu, 25 Jul 2019 14:51:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6PEpQHQ016707 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 25 Jul 2019 10:51:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 445721001281; Thu, 25 Jul 2019 14:51:26 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-117-28.phx2.redhat.com [10.3.117.28])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AC8AC1001B09;
	Thu, 25 Jul 2019 14:51:23 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: =?utf-8?B?5p2o5rW3?= <hai.yang@magic-shield.com>
Subject: Re: How to filter PROCTITLE events
Date: Thu, 25 Jul 2019 10:51:22 -0400
Message-ID: <1899046.JkZJ7mvpU2@x2>
Organization: Red Hat
In-Reply-To: <tencent_51B48DB510141AD94C0292D1@qq.com>
References: <tencent_2653C64E6532CFFE233BCDFC@qq.com> <1846383.7Xiv5u5QpR@x2>
	<tencent_51B48DB510141AD94C0292D1@qq.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x6PEpQHQ016707
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Thu, 25 Jul 2019 14:51:49 +0000 (UTC)

T24gVGh1cnNkYXksIEp1bHkgMjUsIDIwMTkgMTo0NDowNyBBTSBFRFQg5p2o5rW3IHdyb3RlOgo+
IFRoYW5rcyBTdGV2ZS4gSXQgd29ya3MgOi0pCj4gTWVhbndoaWxlLCBmb3IgcmVhZC93cml0ZSBz
eXN0ZW0gY2FsbCwgaWYgdGhleSBiZWxvbmdzIHRvIHNhbWUgcGlkIGFuZCBzYW1lCj4gZmQsIHdl
IGFyZSB0cnlpbmcgdG8gc3VwcHJlc3MgdGhlbSBpbnRvIG9uZSBtc2cuIEkgZ3Vlc3MgaXQgd291
bGQgbm90IGJlCj4gYWJsZSB0byBmaWx0ZXIgdXNpbmcgYXVkaXRjdGwsIGlzIHRoYXQgcmlnaHQ/
CgpUZWNobmljYWxseSB5b3UgY291bGQgc3VwcHJlc3MgdGhlbS4gSW4gcHJhY3RpY2UsIGl0J3Mg
bm90IGZlYXNpYmxlLiBZb3UgCndvdWxkIG5lZWQgdG8gaGF2ZSBhcHBsaWNhdGlvbiBzcGVjaWZp
YyBydWxlcyB0byBzdXBwcmVzcy4gVGhlIG1vcmUgcnVsZXMgeW91IApoYXZlIHRoZSBtb3JlIHBl
cmZvcm1hbmNlIHlvdSBsb3NlLgoKQnV0IEkgd291bGQgc3RhcnQgYnkgcXVlc3Rpb25pbmcgd2hl
dGhlciB5b3UgcmVhbGx5IG5lZWQgdG8gbW9uaXRvciByZWFkcyBhbmQgCndyaXRlcz8gSWYgYSBm
aWxlIGlzIG9wZW5lZCB3aXRoIE9fV1JPTkxZIG9yIE9fUkRXUiwgY2FuIGl0IGp1c3QgYmUgYXNz
dW1lZCAKdGhhdCB0aGUgZmlsZSB3YXMgd3JpdHRlbiB0bz8KCi1TdGV2ZQoKCgotLQpMaW51eC1h
dWRpdCBtYWlsaW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRo
YXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtYXVkaXQ=
