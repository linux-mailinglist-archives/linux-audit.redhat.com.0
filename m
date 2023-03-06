Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC856ACFA7
	for <lists+linux-audit@lfdr.de>; Mon,  6 Mar 2023 21:58:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678136327;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vwkgmfi/zWPc/JWWY9n9jLcwylhWA/hBwE9sLD4M7Dg=;
	b=KXjxHMTvW9IIZra4+B9gVNiZ0neotZ4pM58P5v3b5IKls4l8GsP9lMJAYi6cH0Lj3Zu8Lj
	4C+CK30SqlJe1Cu0AundR5/vfYIMFQ0DXc2UpTodGXrkytGVWEPJBJ5MJjymOKN0T3E7gj
	U92ZxZbA2426rb1QdJr96/iP2Q9ESd8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-y8dOLHy-OL6bBbXNMssWvA-1; Mon, 06 Mar 2023 15:58:45 -0500
X-MC-Unique: y8dOLHy-OL6bBbXNMssWvA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF64C857A88;
	Mon,  6 Mar 2023 20:58:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 12C96492B01;
	Mon,  6 Mar 2023 20:58:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 12C0319465A3;
	Mon,  6 Mar 2023 20:58:40 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9FB541946589 for <linux-audit@listman.corp.redhat.com>;
 Mon,  6 Mar 2023 20:58:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8C81D2166B2B; Mon,  6 Mar 2023 20:58:38 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.9.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 67EC52166B26;
 Mon,  6 Mar 2023 20:58:38 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com, Paul Moore <paul@paul-moore.com>
Subject: Re: audit userspace problems with io_uring async ops
Date: Mon, 06 Mar 2023 15:58:37 -0500
Message-ID: <2143990.irdbgypaU6@x2>
Organization: Red Hat
In-Reply-To: <CAHC9VhRUGKcJrOh4G_aUk3B9xZxZfjwZYDDsDfvF3pcxAjp_uA@mail.gmail.com>
References: <CAHC9VhRMJq1gJPoR79AxM1JphmGtxhGMYBkd=Ptuaq3WBjX2Bw@mail.gmail.com>
 <CAHC9VhRUGKcJrOh4G_aUk3B9xZxZfjwZYDDsDfvF3pcxAjp_uA@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8gUGF1bCwKCk9uIE1vbmRheSwgTWFyY2ggNiwgMjAyMyAzOjA3OjM3IFBNIEVTVCBQYXVs
IE1vb3JlIHdyb3RlOgo+IE9uIFR1ZSwgRmViIDI4LCAyMDIzIGF0IDU6MDTigK9QTSBQYXVsIE1v
b3JlIDxwYXVsQHBhdWwtbW9vcmUuY29tPiB3cm90ZToKPiA+IEhpIGFsbCwKPiA+IAo+ID4gV2Ug
anVzdCByZWNlbnRseSBzdGFydGVkIHBpY2tpbmcgdXAgYXVkaXQtdGVzdHN1aXRlIGZhaWx1cmVz
IHdpdGggdGhlCj4gPiBsYXRlc3QgdXBzdHJlYW0ga2VybmVscyBhbmQgSSB0cmFja2VkIGl0IGRv
d24gdG8gYSBjaGFuZ2UgaW4gaG93IHRoZQo+ID4gSU9SSU5HX09QX09QRU5BVCBvcGVyYXRpb24g
aXMgaGFuZGxlZCwgYW5kIGhvdyBTdGV2ZSdzIGF1ZGl0IHVzZXJzcGFjZQo+ID4gZGlzcGxheXMg
YXN5bmMgaW9fdXJpbmcgb3BzLiAgSXQgYXBwZWFycyB0aGF0IHdoZW4gYXVzZWFyY2ggaXMgdXNl
ZCB0bwo+ID4gbG9vayBmb3IgZXZlbnRzIGl0IGRvZXNuJ3QgZGlzcGxheSBhc3luYyBpb191cmlu
ZyBldmVudHMgKFVSSU5HT1AKPiA+IHJlY29yZHMvZXZlbnRzIHdpdGhvdXQgYW4gYXNzb2NpYXRl
ZCBTWVNDQUxMIHJlY29yZC9ldmVudCkuICBUYWtlIHRoZQo+ID4gZm9sbG93aW5nIHNuaXBwZXQg
ZnJvbSAvdmFyL2xvZy9hdWRpdC9hdWRpdC5sb2cgLi4uCj4gCj4gSGkgU3RldmUsCj4gCj4gQmVm
b3JlIEkgc3RhcnQgd29ya2luZyBhcm91bmQgdGhpcyBpbiB0aGUgYXVkaXQtdGVzdHN1aXRlIEkg
anVzdAo+IHdhbnRlZCB0byBjaGVjayBhbmQgc2VlIGlmIHlvdSBhbHJlYWR5IGhhZCBhIGZpeCBm
b3IgYXVzZWFyY2g/CgpUaGFua3MgZm9yIHRoZSBidWcgcmVwb3J0LiBJIGhhdmUgYmVlbiBvdXQg
Zm9yIHRoZSBsYXN0IDggZGF5cyBhbmQgbm93IGhhdmUgCn4zNjAwIHVucmVhZCBlbWFpbHMuIEkg
d2lsbCB0cnkgbG9vayBpbnRvIHRoaXMgdG9tb3Jyb3cuCgotU3RldmUKCgotLQpMaW51eC1hdWRp
dCBtYWlsaW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVk
aGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0Cg==

