Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 7450FE945E
	for <lists+linux-audit@lfdr.de>; Wed, 30 Oct 2019 02:04:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572397489;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RfN3f1LXimDkRutj9O6hjQhcCrctBPZjmwT72vah8No=;
	b=OGoqUjhbvmShju2a+QpQ+pKXoQFm7/1HHy/0NFtPALI4Zak1z9tVqLulYOA9nJ38G+hu+Z
	GtYGFwL8behRRr5ujYjD0ir4LU0LRyF9PWmCcu/6rjonP6G3GtDJRX8/N1OoYx3Yge/zpb
	xXUDrJkAESVNYJGpfu5HX1j8W+swIUY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-uFJfau7kMCyKz7omCCLysw-1; Tue, 29 Oct 2019 21:04:46 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5BED107AD28;
	Wed, 30 Oct 2019 01:04:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB3691001902;
	Wed, 30 Oct 2019 01:04:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6C4121802213;
	Wed, 30 Oct 2019 01:04:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9U14NW2022442 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 29 Oct 2019 21:04:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7605B60876; Wed, 30 Oct 2019 01:04:23 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-69.phx2.redhat.com [10.3.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 182EE60870;
	Wed, 30 Oct 2019 01:04:20 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: "echo" not logged in auditd
Date: Tue, 29 Oct 2019 21:04:19 -0400
Message-ID: <2357109.mxJeOg4E2H@x2>
Organization: Red Hat
In-Reply-To: <tencent_0693B7A4459F8B8652881558@qq.com>
References: <tencent_0693B7A4459F8B8652881558@qq.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9U14NW2022442
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: uFJfau7kMCyKz7omCCLysw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGVsbG8sCgpPbiBNb25kYXksIE9jdG9iZXIgMjgsIDIwMTkgMTE6Mjc6NDQgUE0gRURUIOadqOa1
tyB3cm90ZToKPiBXZSBhcmUgZXhwZXJpZW5jaW5nIHRoZSBzYW1lIGlzc3VlIGJlbG93LCB0aGF0
ICJlY2hvIiBjYW5ub3QgYmUgbG9nZ2VkIGluCj4gYXVkaXRkLiBXb3VsZCBsaWtlIHRvIGtub3cg
c29tZSBkZXRhaWxlZCBleHBsYW5hdGlvbiBoZXJlLCBhbmQgdW5kZXJzdGFuZAo+IGluIGdlbmVy
YWwgd2hhdCB3b3VsZCBOT1QgYmUgaW4gdGhlIHNjb3BlIG9mIGF1ZGl0ZCBsb2cuCgpJZiB0aGUg
cnVsZSBpcyBvbiBleGVjdmUsIHRoZW4gaXQgb25seSB0cmlnZ2VycyBvbiBleGVjdmUuIElmIHRo
ZSBzaGVsbCAKaGFuZGxlcyBpdCBpbnRlcm5hbGx5IGFuZCBuZXZlciBjYWxscyBleGVjdmUsIHRo
ZW4gaXQgY2Fubm90IGJlIGF1ZGl0ZWQgYnkgYW4gCmV4ZWN2ZSBydWxlLgoKTm90ZSB0aGF0IHN0
cmFjZSB3aWxsIGFsd2F5cyBjYWxsIGV4ZWN2ZSBhbmQgdGh1cyBzZWFyY2ggZm9yIC91c3IvYmlu
L2VjaG8uIApXaGVyZWFzIGJhc2ggd2lsbCBzZWUgaXQgYXMgYW4gaW50ZXJuYWwgZnVuY3Rpb24g
YW5kIGhhbmRsZSBpdCBhbGwgYnkgaXRzZWxmLiAKU28sIGJlIGF3YXJlIHN0cmFjZSBjYW4gbGll
IHRvIHlvdS4gVGhlcmUgYXJlIGEgY291cGxlIG90aGVyIGNvbW1hbmRzIGxpa2UgCiJraWxsIiB3
aGljaCBiYXNoIHdpbGwgaGFuZGxlIGluc3RlYWQgb2YgdXNpbmcgdGhlIGFwcC4KCi1TdGV2ZQoK
CgotLQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRw
czovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtYXVkaXQ=

