Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FED794419
	for <lists+linux-audit@lfdr.de>; Wed,  6 Sep 2023 21:58:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694030328;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3qplPb6hMvJyio77jUV8VZwMYFvFAN6rEdkmmPuTvyc=;
	b=LlG4ctRIWa8LLWxOlpl/MM/EC0QZtidqJScUrSI32vB5uFX3RIbrZ6mOyq2WRF6wCgeqkK
	vDycUwO4uNWWGBzmM4ZpT6Thqp6hrW0T96h0Djjz4eqQOGQj+Uq+j62RziUll5CjJ6iAxs
	fdLwgXpsrsDBpaJxArwJ+EKjjb99PWk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-7Zh05EWjMGaY-lKvqQV2tQ-1; Wed, 06 Sep 2023 15:58:46 -0400
X-MC-Unique: 7Zh05EWjMGaY-lKvqQV2tQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B65751C04B59;
	Wed,  6 Sep 2023 19:58:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 56B8CC03295;
	Wed,  6 Sep 2023 19:58:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2339019465A2;
	Wed,  6 Sep 2023 19:58:38 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3D24D194658C for <linux-audit@listman.corp.redhat.com>;
 Wed,  6 Sep 2023 19:58:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0C00710EA0; Wed,  6 Sep 2023 19:58:37 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.22.48.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7689D5CC05;
 Wed,  6 Sep 2023 19:58:36 +0000 (UTC)
Date: Wed, 6 Sep 2023 15:58:34 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Amjad Gabbar <amjadgabbar11@gmail.com>
Subject: Re: Sycall Rules vs Watch Rules
Message-ID: <ZPjZ6py5vxdvKTY0@madcap2.tricolour.ca>
References: <CAJcJf=Qb7muwWG4DyQtEcCKmCOETD4H3h1BoGrewJ5u26r6o=w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJcJf=Qb7muwWG4DyQtEcCKmCOETD4H3h1BoGrewJ5u26r6o=w@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMjAyMy0wOS0wNiAxMDo1NiwgQW1qYWQgR2FiYmFyIHdyb3RlOgo+IEhpLAo+IAo+IEkgaGF2
ZSBkb25lIHNvbWUgYW5hbHlzaXMgYW5kIGRpZ2dpbmcgaW50byBob3cgYm90aCB0aGUgd2F0Y2gg
cnVsZXMgYW5kCj4gc3lzY2FsbCBydWxlcyBhcmUgdHJhbnNsYXRlZC4KPiAKPiBGcm9tIG15IHVu
ZGVyc3RhbmRpbmcsIGluIHRlcm1zIG9mIGxvZ2dpbmcsIGJvdGggdGhlIGJlbG93IHJ1bGVzIGFy
ZQo+IHNpbWlsYXIuIFRoZXJlIGlzIG5vIGRpZmZlcmVuY2UgaW4gZWl0aGVyIG9mIHRoZSBydWxl
cy4KPiAKPiAxLiAtdyAvZXRjIC1wIHdhIC1rIEVUQ19XQVRDSAoKVGhleSBhcmUgc2ltaWxhciBp
biB0aGlzIGNhc2UuCi13IGJlaGF2ZXMgZGlmZmVyZW50bHkgZGVwZW5kaW5nIG9uIHRoZSBleGlz
dGFuY2Ugb2YgdGhlIHdhdGNoZWQgZW50aXR5CmFuZCB0aGUgcHJlc2VuY2Ugb2YgYSB0cmFpbGlu
ZyAiLyIuICBUaGlzIGlzIHdoeSB0aGUgZm9ybSBhYm92ZSBpcwpkZXByZWNhdGVkLgoKPiAyLiAt
YSBhbHdheXMsZXhpdCAtRiBhcmNoPWI2NCAtUyA8YWxsIHN5c2NhbGxzIHBhcnQgb2YgdGhlIHdy
aXRlIGFuZCBhdHRyCj4gY2xhc3Nlcz4gLUYgZGlyPS9ldGMgIC1GIHBlcm09d2EgLWsgRVRDX1dB
VENICj4gCj4gVGhlIHdyaXRlIGFuZCBhdHRyIGNsYXNzZXMgY29uc2lzdCBvZiBzeXNjYWxscyBp
bgo+IOKAnGluY2x1ZGUvYXNtLWdlbmVyaWMvYXVkaXRfKi5o4oCcLgo+IAo+ICBUaGUgcGVybSBm
bGFnIGlzIG5lZWRlZCBpbiB0aGUgc2Vjb25kIGNhc2UgZm9yIGluY2x1ZGluZyBvcGVuL29wZW5h
dAo+IHN5c2NhbGxzIHdoaWNoIGFyZSBub3QgYSBwYXJ0IG9mIHRoZSB3cml0ZSBhbmQgYXR0ciBz
eXNjYWxsIGxpc3QuCj4gCj4gSSdkIGxpa2UgdG8gdmVyaWZ5IGlmIHdoYXQgSSBtZW50aW9uZWQg
ZWFybGllciBpcyBhY2N1cmF0ZSwgYW5kIEkgaGF2ZSBhbgo+IGFkZGl0aW9uYWwgcG9pbnQgYnV0
IGRlcGVuZHMgb24gd2hldGhlciB0aGlzIGlzIGFjY3VyYXRlLgo+IAo+IEFsaQoKLSBSR0IKCi0t
ClJpY2hhcmQgR3V5IEJyaWdncyA8cmdiQHJlZGhhdC5jb20+ClNyLiBTL1cgRW5naW5lZXIsIEtl
cm5lbCBTZWN1cml0eSwgQmFzZSBPcGVyYXRpbmcgU3lzdGVtcwpSZW1vdGUsIE90dGF3YSwgUmVk
IEhhdCBDYW5hZGEKVXBzdHJlYW0gSVJDOiBTdW5SYXljZXIKVm9pY2U6ICsxLjYxMy44NjAgMjM1
NCBTTVM6ICsxLjYxMy41MTguNjU3MAotLQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QKTGludXgt
YXVkaXRAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWF1ZGl0Cg==

