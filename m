Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id F169023386F
	for <lists+linux-audit@lfdr.de>; Thu, 30 Jul 2020 20:36:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596134219;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FbpUxKACRBnUi2utfBk/DRm/Y6pZZ5coSA3ZXFnJt/c=;
	b=JB585DL6OhY6Nj9fgQ1z3kxuGQ2lyB+JS+KorsN3A/HrCVqu+2zDbJabFNWvxneN5Uu8PL
	ACDspyEpYHORX6JjzZtUlOTP4yzCvmZHWcVw4Apc9fdyO/UBJUFHxvEuYxF8r5r3nnpDr7
	C3UeOBgHjDY2K4E5wy2ms/MVslgJ8C8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-CnE8vKl9PE20muRKT7ulXw-1; Thu, 30 Jul 2020 14:36:55 -0400
X-MC-Unique: CnE8vKl9PE20muRKT7ulXw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CC1879EC3;
	Thu, 30 Jul 2020 18:36:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 652668A177;
	Thu, 30 Jul 2020 18:36:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C4A0495A71;
	Thu, 30 Jul 2020 18:36:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06UITCgp022374 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 30 Jul 2020 14:29:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 63B2D19D7B; Thu, 30 Jul 2020 18:29:12 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-113-125.phx2.redhat.com [10.3.113.125])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 09B881992D;
	Thu, 30 Jul 2020 18:29:02 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: httpd auid = -1
Date: Thu, 30 Jul 2020 14:29:02 -0400
Message-ID: <1740602.XSbsyeiCUq@x2>
Organization: Red Hat
In-Reply-To: <68DC7FD9-D7FA-4D7D-BE40-0636059BD9D2@mac.com>
References: <68DC7FD9-D7FA-4D7D-BE40-0636059BD9D2@mac.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06UITCgp022374
X-loop: linux-audit@redhat.com
Cc: Linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1cnNkYXksIEp1bHkgMzAsIDIwMjAgMTo1NDowOSBQTSBFRFQgVG9kZCBIZWJlcmxlaW4g
d3JvdGU6Cj4gSeKAmXZlIG5vdGljZWQgdGhhdCB0aGUgaHR0cGQgcHJvY2VzcyBvbiBhIENlbnRP
UyA3Ljcgc3lzdGVtIEkgYW0gd29ya2luZwo+IHdpdGggaXMgcnVubmluZyB3aXRoIGFuIEF1ZGl0
IElEIG9mIC0xLiBFeGFtcGxlIElEIHZhbHVlcyBhcmU6Cj4gCj4gICAgICAgICBhdWlkPTQyOTQ5
NjcyOTUKPiAgICAgICAgIHVpZD00OAo+ICAgICAgICAgZ2lkPTQ4Cj4gICAgICAgICAuLi4KPiAK
PiBTbyBpZiB1c2UgdGhlIHN0YW5kYXJkIGZpbHRlciAiLUYgYXVpZCE9LTHigJ0gaW4gdGhlIGF1
ZGl0IHJ1bGVzIEkgZG8gbm90IHNlZQo+IGh0dHBkIGFjdGl2aXR5Lgo+IAo+IElzIHRoaXMgY29t
bW9uPwoKWWVzLCB0aGlzIGlzIGNvbW1vbi4gTW9zdCBwZW9wbGUgYXJlIGludGVyZXN0ZWQgaW4g
dGhlIGFjdGlvbnMgdGhhdCBwZW9wbGUKdGFrZSBvbiB0aGUgbWFjaGluZSByYXRoZXIgdGhhbiBu
b3JtYWwgc3lzdGVtIGZ1bmN0aW9uaW5nLgoKPiBIb3cgZG8gSSBjaGFuZ2UgdGhlIGF1aWQgdG8g
c29tZXRoaW5nIGVsc2UsIHNvIEkgY2FuIGNhcHR1cmUgdGhlIGh0dHBkCj4gYWN0aXZpdHkgaW4g
dGhlIGF1ZGl0IGxvZz8KCkEgY291cGxlIG9mIHdheXMuIAoxKSByZW1vdmUgdGhlIGF1aWQhPS0x
LiBUaGF0IHdpbGwgZ2V0IHlvdSBhbGwgZGFlbW9ucy4KMikgVXNlIGF1ZGl0IGJ5IGV4ZWN1dGFi
bGUgcnVsZXM6Ci1hIGFsd2F5cyxleGl0IC1GIGFyY2g9YjY0IC1TIGV4ZWN2ZSAtRiBleGU9L3Vz
ci9zYmluL2h0dHBkIC1GIGtleT1odHRwZC1leGVjCgotU3RldmUgCgo+IEV4YW1wbGUgYXVkaXQg
bGluZToKPiAKPiB0eXBlPVNZU0NBTEwgbXNnPWF1ZGl0KDE1OTYwNjU1NjYuNzIxOjMxMzU3KTog
YXJjaD1jMDAwMDAzZSBzeXNjYWxsPTIKPiBzdWNjZXNzPXllcyBleGl0PTE1IGEwPTU1YTBhMmQ5
YjNjMCBhMT04MDAwMCBhMj0wIGEzPTdmZmU1ZDRkNjcyMCBpdGVtcz0xCj4gcHBpZD0xMTMwIHBp
ZD0xMjUzIGF1aWQ9NDI5NDk2NzI5NSB1aWQ9NDggZ2lkPTQ4IGV1aWQ9NDggc3VpZD00OCBmc3Vp
ZD00OAo+IGVnaWQ9NDggc2dpZD00OCBmc2dpZD00OCB0dHk9KG5vbmUpIHNlcz00Mjk0OTY3Mjk1
IGNvbW09Imh0dHBkIgo+IGV4ZT0iL3Vzci9zYmluL2h0dHBkIiBrZXk9KG51bGwpCgoKCgoKLS0K
TGludXgtYXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly93
d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0

