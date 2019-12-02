Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8F0DA10F2B1
	for <lists+linux-audit@lfdr.de>; Mon,  2 Dec 2019 23:07:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575324459;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zUTjbrmDV1v9u5yWqDBZFRcprbYsyq6F5T5Dybw2qeg=;
	b=ggbw573I8m/6NsmS7jm/PlY0LXir3mJ9PNguUfhsGJovsQJ2ukNmDgg2Kd3qE7dy90rkUm
	STgP1M3i6h7kZ3Go3yeIDizI2/arcnSPronqIYGhjohuuIjbD+z7udZYEjTghPagl2bLTj
	7abJK99mvBc7LNZtDI1wyXfT8fPIEc0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-ucdFWKhUOBGwUsyCIPfwfA-1; Mon, 02 Dec 2019 17:07:37 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 585CF1005502;
	Mon,  2 Dec 2019 22:07:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1D325D6A7;
	Mon,  2 Dec 2019 22:07:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D11944EDAD;
	Mon,  2 Dec 2019 22:07:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB2M5BQS019998 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 2 Dec 2019 17:05:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4DFDB5D6B7; Mon,  2 Dec 2019 22:05:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-205.phx2.redhat.com [10.3.116.205])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0602A5D6A7;
	Mon,  2 Dec 2019 22:05:08 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: Typo in /audit-userspace/src/ausearch-options.c on line 228.
	'starting data' instead of 'starting date'
Date: Mon, 02 Dec 2019 17:05:08 -0500
Message-ID: <3181947.7tOSp0y6D7@x2>
Organization: Red Hat
In-Reply-To: <CAGf2o_fyGovSEOGcqOm8XfuWuyz82fpRg-fSCE=+t2SFaGRz8A@mail.gmail.com>
References: <69A96564-7961-4A2E-AABD-F1C254A0BEB1@me.com>
	<CAGf2o_fyGovSEOGcqOm8XfuWuyz82fpRg-fSCE=+t2SFaGRz8A@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB2M5BQS019998
X-loop: linux-audit@redhat.com
Cc: Harold-Owen Wilke <harywilke@me.com>
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
X-MC-Unique: ucdFWKhUOBGwUsyCIPfwfA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uZGF5LCBEZWNlbWJlciAyLCAyMDE5IDQ6NTk6NDUgUE0gRVNUIE9uZHJlaiBNb3JpcyB3
cm90ZToKPiBIaSBIYXJ5LCB0aGlzIGlzIGFjdHVhbGx5IG5vdCBhIGJhZCB3YXkgdG8gcmVwb3J0
IGlzc3VlcyBhbmQgdGhhbmtzCj4gZm9yIHRoZSBjYXRjaCEKClllcy4KCj4gT24gTW9uLCBEZWMg
MiwgMjAxOSBhdCAxMDo1NyBQTSBIYXJvbGQtT3dlbiBXaWxrZSA8aGFyeXdpbGtlQG1lLmNvbT4g
d3JvdGU6Cj4gPiBBcyB0aGUgc3ViamVjdCBzYXlzLgo+ID4gQXBvbG9naWVzIGZvciB0aGUgaW5j
b3JyZWN0IHdheSBvZiByZXBvcnRpbmcgdGhpcyBidWcsIHRoZSBHaXRIdWIgcGFnZQo+ID4gc2Fp
ZCBpdOKAmXMgbm90IHJlYWxseSBtb25pdG9yZWQsIEkgZ290IGZydXN0cmF0ZWQgd2l0aCB0aGUg
YnVnemlsbGEKPiA+IHBvcnRhbCwgZGlkbuKAmXQgd2FudCB0byBtaXNmaWxlIGl0IGFuZCBpdOKA
mXMgcmVhbGx5IG1pbm9yLgo+ID4gCj4gPiBodHRwczovL2dpdGh1Yi5jb20vbGludXgtYXVkaXQv
YXVkaXQtdXNlcnNwYWNlL2Jsb2IvbWFzdGVyL3NyYy9hdXNlYXJjaC1vCj4gPiBwdGlvbnMuYwoK
SSBmaXhlZCB0aGlzIHR5cG8gYW5kIGNoZWNrZWQgaXQgaW4uIFRoYW5rcyBmb3IgcmVwb3J0aW5n
IGl0LgoKLVN0ZXZlCgoKCi0tCkxpbnV4LWF1ZGl0IG1haWxpbmcgbGlzdApMaW51eC1hdWRpdEBy
ZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1h
dWRpdA==

