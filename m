Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0ACDB142F49
	for <lists+linux-audit@lfdr.de>; Mon, 20 Jan 2020 17:08:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579536517;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hO0fhSxGa0bRiePFakmLpREYUG7aK19UOKKrbuPA+FQ=;
	b=UAgctXKvzZ+K4UiHKRRLzGHQUHlGFWpXnUmz2bmy2UzS8Cbcj2FEpD2QYjYlqJmoXCXyG7
	dyuq+L/BZo0cmDdOHdOB/w7jUDmk7RW/AUD8/f4kYVZFjFdA6Rfly0uv+nznN9qABPxBPY
	vaDMeQyxmBfsv4h6D4GDpKfumH6sIpI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-On-zoshqObOOBWsPmpzgCA-1; Mon, 20 Jan 2020 11:08:35 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4B7E800D41;
	Mon, 20 Jan 2020 16:08:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11108860E9;
	Mon, 20 Jan 2020 16:08:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A704318089CD;
	Mon, 20 Jan 2020 16:08:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00KFcG07021381 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 20 Jan 2020 10:38:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 858912166B2C; Mon, 20 Jan 2020 15:38:16 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 808D72166B29
	for <linux-audit@redhat.com>; Mon, 20 Jan 2020 15:38:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5285801E87
	for <linux-audit@redhat.com>; Mon, 20 Jan 2020 15:38:11 +0000 (UTC)
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
	[209.85.221.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-170-J2H9DIcnOHuj723S2i1XIg-1; Mon, 20 Jan 2020 10:38:09 -0500
Received: by mail-vk1-f196.google.com with SMTP id i78so41397vke.0
	for <linux-audit@redhat.com>; Mon, 20 Jan 2020 07:38:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ohrFgzASyayQ6l75b0fiKkJYEPp6wBkc4PSpwIJEmZ0=;
	b=j9uIoIv9CHEfQMehlXq8Vy7L33yLyi8zt23n2cpD750VbBo6VY+A2sghchI+ASrF/D
	j33GXuzjz9uoRT8fbZx7p4Y/tTfZ56na3Urz8y6yWSsVUABisr4tH5wP4wNgd/IuxRKX
	s8tugyxw3Q8dguPMCKdZEM+3XJQy8DM8epzYX8pYQNfQbRqZv2NxzPFyCLWYNzzVrPDx
	M/0s7TBbNWW7mRx3hTEMGFFu6lk7ft1eCk1ph7YXHHpi8ZA3ZC25yzk+6lyoHAbudAI/
	zPUY3y3E2Ly6SCiuRfr4uFE3fzIrmzrwQf286GBOGOYLiEyihTliYOl7XEj2Q3YaPeNZ
	uaiA==
X-Gm-Message-State: APjAAAVFMDVK1iCkswSWDDdxavhWGyCTRKRBVwXKRJBKi0qaOUIvQQJn
	MJMfLYK9iz4GOKTHpQR0z+3gtoNOevA=
X-Google-Smtp-Source: APXvYqz/lPZRkutiREwrpAM3VcwJLPGbV3ySB38ETRGGe5CXKDOMbmOwjsIPTpliJlIH/LEtNz4HCg==
X-Received: by 2002:a1f:3ac9:: with SMTP id h192mr112325vka.55.1579534688657; 
	Mon, 20 Jan 2020 07:38:08 -0800 (PST)
Received: from [192.168.1.55] (c-73-217-142-143.hsd1.sc.comcast.net.
	[73.217.142.143])
	by smtp.gmail.com with ESMTPSA id b6sm8335976vsb.0.2020.01.20.07.38.07
	for <linux-audit@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 20 Jan 2020 07:38:08 -0800 (PST)
Subject: Re: Duplicate settings?
To: linux-audit@redhat.com
References: <725ed78a-f8e8-d73a-486a-13e821567752@gmail.com>
	<29812992.164tRMTlZt@x2>
	<bb281668-ee20-5c23-684e-5e397136956c@gmail.com>
	<1620604.diqz4lFvfc@x2>
From: Leam Hall <leamhall@gmail.com>
Message-ID: <ad4ef2f6-b44c-4026-fc47-51f36d25bd83@gmail.com>
Date: Mon, 20 Jan 2020 10:38:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1620604.diqz4lFvfc@x2>
Content-Language: en-US
X-MC-Unique: J2H9DIcnOHuj723S2i1XIg-1
X-MC-Unique: On-zoshqObOOBWsPmpzgCA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00KFcG07021381
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 20 Jan 2020 11:08:13 -0500
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

CgpPbiAxLzIwLzIwIDEwOjI4IEFNLCBTdGV2ZSBHcnViYiB3cm90ZToKPiBPbiBNb25kYXksIEph
bnVhcnkgMjAsIDIwMjAgMTA6MTk6NTkgQU0gRVNUIExlYW0gSGFsbCB3cm90ZToKPj4gT24gMS8y
MC8yMCAxMDoxNCBBTSwgU3RldmUgR3J1YmIgd3JvdGU6Cj4+PiBPbiBNb25kYXksIEphbnVhcnkg
MjAsIDIwMjAgMTA6MDQ6MjQgQU0gRVNUIExlYW0gSGFsbCB3cm90ZToKPj4+PiBPbiAxLzIwLzIw
IDk6MzcgQU0sIFN0ZXZlIEdydWJiIHdyb3RlOgo+Pj4+PiBPbiBNb25kYXksIEphbnVhcnkgMjAs
IDIwMjAgOToyNDo1NiBBTSBFU1QgTGVhbSBIYWxsIHdyb3RlOgo+Pj4+Pj4gSWYgL2V0Yy9hdWRp
dC9hdWRpdGQuY29uZiBlbmNvdW50ZXJzIGNvbmZsaWN0aW5nIGR1cGxpY2F0ZSBzZXR0aW5ncywK
Pj4+Pj4+IHdoYXQgaGFwcGVucz8gVGFrZXMgdGhlIGZpcnN0LCB0YWtlcyB0aGUgbGFzdCwgb3Ig
d2hhdD8gRm9yIGV4YW1wbGU6Cj4+Pj4+Pgo+Pj4+Pj4gc3BhY2VfbGVmdCA9IDI1Cj4+Pj4+PiBz
cGFjZV9sZWZ0ID0gMTAwCj4+Pj4+Cj4+Pj4+IEl0IG92ZXJ3cml0ZXMgdGhlIGZpcnN0IHZhbHVl
IHdpdGggdGhlIHNlY29uZCBvbmUuIFlvdSBjYW4gYWxzbyBydW46Cj4+Pj4+Cj4+Pj4+ICMgc2Vy
dmljZSBhdWRpdGQgc3RhdGUKPj4+Pj4KPj4+Pj4gdG8gc2VlIHdoYXQgdGhlIGN1cnJlbnQgdmFs
dWUgaXMgaWYgeW91ciBhdWRpdCBkYWVtb24gaXMgc29tZXdoYXQKPj4+Pj4gcmVjZW50Lgo+Pj4+
Cj4+Pj4gSGV5IFN0ZXZlLCBhIGZvbGxvdyB1cC4gSXMgdGhlIG1hbiBwYWdlIGZvciBhdWRpdGQu
Y29uZiB3cm9uZz8gTXkgYXVkaXRkCj4+Pj4gZmFpbGVkIHRvIHN0YXJ0IHdoZW4gZ2l2aW5nIHNw
YWNlX2xlZnQgd2l0aCBhICclJyBzaWduLgo+Pj4KPj4+IFVzdWFsbHkgaXQgd3JpdGVzIHRoZSBy
ZWFzb24gd2h5IGluIHN5c2xvZy4gRG9lcyBpdCBzYXkgYW55dGhpbmcgdGhlcmU/Cj4+Cj4+IEkg
ZG9uJ3QgZ3JvayBzeXN0ZW1kLCBzbyBoZXJlJ3MgdGhlIHdob2xlIHJlc3BvbnNlOgo+Pgo+PiBS
ZWRpcmVjdGluZyB0byAvYmluL3N5c3RlbWN0bCBzdGF0dXMgYXVkaXRkLnNlcnZpY2UKPj4g4peP
IGF1ZGl0ZC5zZXJ2aWNlIC0gU2VjdXJpdHkgQXVkaXRpbmcgU2VydmljZQo+PiAgICAgIExvYWRl
ZDogbG9hZGVkICgvdXNyL2xpYi9zeXN0ZW1kL3N5c3RlbS9hdWRpdGQuc2VydmljZTsgZW5hYmxl
ZDsKPj4gdmVuZG9yIHByZXNldDogZW5hYmxlZCkKPj4gICAgICBBY3RpdmU6IGZhaWxlZCAoUmVz
dWx0OiBleGl0LWNvZGUpIHNpbmNlIE1vbiAyMDIwLTAxLTIwIDA5OjI3OjM3Cj4+IEVTVDsgMTlt
aW4gYWdvCj4+ICAgICAgICBEb2NzOiBtYW46YXVkaXRkKDgpCj4+ICAgICAgICAgICAgICBodHRw
czovL2dpdGh1Yi5jb20vbGludXgtYXVkaXQvYXVkaXQtZG9jdW1lbnRhdGlvbgo+PiAgICAgUHJv
Y2VzczogMjY5NSBFeGVjU3RhcnQ9L3NiaW4vYXVkaXRkIChjb2RlPWV4aXRlZCwgc3RhdHVzPTYp
Cj4+Cj4+IEphbiAyMCAwOToyNzozNiBsZWFtX2M3IHN5c3RlbWRbMV06IFN0YXJ0aW5nIFNlY3Vy
aXR5IEF1ZGl0aW5nIFNlcnZpY2UuLi4KPj4gSmFuIDIwIDA5OjI3OjM3IGxlYW1fYzcgYXVkaXRk
WzI2OTVdOiBWYWx1ZSAyNSUgc2hvdWxkIG9ubHkgYmUgbnVtYmVycyAtCj4+IGxpbmUgMjAKPiAK
PiBUaGUgaXNzdWUgaXMgaGVyZSBeXl4gIFRvIHVzZSBwZXJjZW50YWdlcywgeW91IGhhdmUgdG8g
YmUgb24gMi44LjUgb3IgbGF0ZXIuCgpBaCwgZ290Y2hhISBJIHdhcyB1c2luZyBhIHJlYnVpbGRh
YmxlIFZNIGZvciB0ZXN0aW5nLCBhbmQgaGFkbid0IAp1cGRhdGVkLiBUaGFua3MhCgpMZWFtCgoK
LS0KTGludXgtYXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6
Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0

