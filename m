Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 5F05E1CB98F
	for <lists+linux-audit@lfdr.de>; Fri,  8 May 2020 23:13:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588972402;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ROEo1SIORKse1vbIf//cc12w7b2HvOEffFBoJ8eL4Xg=;
	b=KpoBXVjCjjKY2XZLve5X6xJldhcaJ8bQjdcQfvDLEMuHx4PXvIO7ic0u9Z6v2WRl1JLXLi
	mw9orsoXLq36p8nlDOTTWWCPEhKpiqlf80VhzPNQDRpOCjEBZbR07XfBerHwuP0sM6olQL
	w4jIEZHx7i/bF1d2Vcz9H7GYhGeFjYc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-LrrK5Gy0MbyfGmoJXEfjRw-1; Fri, 08 May 2020 17:13:20 -0400
X-MC-Unique: LrrK5Gy0MbyfGmoJXEfjRw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41C918730BF;
	Fri,  8 May 2020 21:13:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 43A381D4;
	Fri,  8 May 2020 21:13:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 80ECB1809543;
	Fri,  8 May 2020 21:13:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 048LB9uB018224 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 8 May 2020 17:11:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 74E5C10548C7; Fri,  8 May 2020 21:11:09 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 70A931054897
	for <linux-audit@redhat.com>; Fri,  8 May 2020 21:11:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3FDAA80CDB0
	for <linux-audit@redhat.com>; Fri,  8 May 2020 21:11:07 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-119-OUsn193oOAil2rIVAD-pfA-1;
	Fri, 08 May 2020 17:10:58 -0400
X-MC-Unique: OUsn193oOAil2rIVAD-pfA-1
Received: from embeddedor (unknown [189.207.59.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 31DCB2173E;
	Fri,  8 May 2020 21:10:57 +0000 (UTC)
Date: Fri, 8 May 2020 16:15:25 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH] audit: mark expected switch fall-through
Message-ID: <20200508211525.GE23375@embeddedor>
References: <20190212204600.GA24049@embeddedor>
	<CAHC9VhQfru298ZbEDwEqj0+YRAYoAGhAVHEtSo3KBW1kKLputw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhQfru298ZbEDwEqj0+YRAYoAGhAVHEtSo3KBW1kKLputw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 048LB9uB018224
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 08 May 2020 17:12:51 -0400
Cc: linux-audit@redhat.com, linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Content-Disposition: inline

T24gVHVlLCBGZWIgMTIsIDIwMTkgYXQgMDg6MTk6NDRQTSAtMDUwMCwgUGF1bCBNb29yZSB3cm90
ZToKPiBPbiBUdWUsIEZlYiAxMiwgMjAxOSBhdCAzOjQ2IFBNIEd1c3Rhdm8gQS4gUi4gU2lsdmEK
PiA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNvbT4gd3JvdGU6Cj4gPiBJbiBwcmVwYXJhdGlvbiB0byBl
bmFibGluZyAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoLCBtYXJrIHN3aXRjaAo+ID4gY2FzZXMgd2hl
cmUgd2UgYXJlIGV4cGVjdGluZyB0byBmYWxsIHRocm91Z2guCj4gPgo+ID4gVGhpcyBwYXRjaCBm
aXhlcyB0aGUgZm9sbG93aW5nIHdhcm5pbmc6Cj4gPgo+ID4ga2VybmVsL2F1ZGl0ZmlsdGVyLmM6
IEluIGZ1bmN0aW9uIOKAmGF1ZGl0X2tydWxlX3RvX2RhdGHigJk6Cj4gPiBrZXJuZWwvYXVkaXRm
aWx0ZXIuYzo2Njg6Nzogd2FybmluZzogdGhpcyBzdGF0ZW1lbnQgbWF5IGZhbGwgdGhyb3VnaCBb
LVdpbXBsaWNpdC1mYWxsdGhyb3VnaD1dCj4gPiAgICAgaWYgKGtydWxlLT5wZmxhZ3MgJiBBVURJ
VF9MT0dJTlVJRF9MRUdBQ1kgJiYgIWYtPnZhbCkgewo+ID4gICAgICAgIF4KPiA+IGtlcm5lbC9h
dWRpdGZpbHRlci5jOjY3NDozOiBub3RlOiBoZXJlCj4gPiAgICBkZWZhdWx0Ogo+ID4gICAgXn5+
fn5+fgo+ID4KPiA+IFdhcm5pbmcgbGV2ZWwgMyB3YXMgdXNlZDogLVdpbXBsaWNpdC1mYWxsdGhy
b3VnaD0zCj4gPgo+ID4gTm90aWNlIHRoYXQsIGluIHRoaXMgcGFydGljdWxhciBjYXNlLCB0aGUg
Y29kZSBjb21tZW50IGlzIG1vZGlmaWVkCj4gPiBpbiBhY2NvcmRhbmNlIHdpdGggd2hhdCBHQ0Mg
aXMgZXhwZWN0aW5nIHRvIGZpbmQuCj4gPgo+ID4gVGhpcyBwYXRjaCBpcyBwYXJ0IG9mIHRoZSBv
bmdvaW5nIGVmZm9ydHMgdG8gZW5hYmxlCj4gPiAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoLgo+ID4K
PiA+IFNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8gQS4gUi4gU2lsdmEgPGd1c3Rhdm9AZW1iZWRkZWRv
ci5jb20+Cj4gPiAtLS0KPiA+ICBrZXJuZWwvYXVkaXRmaWx0ZXIuYyB8IDIgKy0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBNZXJnZWQgaW50
byBhdWRpdC9uZXh0LCB0aGFua3MuCj4gCgpUaGFua3MsIFBhdWwuCgotLQpHdXN0YXZvCgoKLS0K
TGludXgtYXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly93
d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0

