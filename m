Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A5F4D1AE6D1
	for <lists+linux-audit@lfdr.de>; Fri, 17 Apr 2020 22:32:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587155534;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aLcAZrgPzDZDpqKi59TcnY7KO+33RyFwx87mDeP7baw=;
	b=NjF95T4e0wjk1Px3im/A1jUYlUIvJTZVpGJs4g1AzfR7Vk2N6KCOUzyUp+J5/Bp06uLWUG
	hjxlPlyjoFS21eC27sHwKWBU0I+ddoR+dJUyauL8mRUK3wEtSWkQrqNeVkFObcZXkKr+31
	3nAxLKXo695nsBEP5pdTO7n+pDQUvX8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-yjXz0phsOjaPS7g_39TJYA-1; Fri, 17 Apr 2020 16:32:12 -0400
X-MC-Unique: yjXz0phsOjaPS7g_39TJYA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 478F4801A25;
	Fri, 17 Apr 2020 20:32:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 88D3C19C4F;
	Fri, 17 Apr 2020 20:32:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0B07893397;
	Fri, 17 Apr 2020 20:32:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03HJLWWc027123 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 17 Apr 2020 15:21:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 16F482028CD5; Fri, 17 Apr 2020 19:21:32 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 129722028CD3
	for <linux-audit@redhat.com>; Fri, 17 Apr 2020 19:21:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 21561101A55D
	for <linux-audit@redhat.com>; Fri, 17 Apr 2020 19:21:29 +0000 (UTC)
Received: from gardel.0pointer.net (gardel.0pointer.net [85.214.157.71])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-28-y2YE9k0oMVmLCfCrKYWzyA-1; Fri, 17 Apr 2020 15:21:26 -0400
X-MC-Unique: y2YE9k0oMVmLCfCrKYWzyA-1
Received: from gardel-login.0pointer.net (gardel.0pointer.net
	[IPv6:2a01:238:43ed:c300:10c3:bcf3:3266:da74])
	by gardel.0pointer.net (Postfix) with ESMTP id D72B1E80D29;
	Fri, 17 Apr 2020 21:21:24 +0200 (CEST)
Received: by gardel-login.0pointer.net (Postfix, from userid 1000)
	id 7CBAB1618B7; Fri, 17 Apr 2020 21:21:24 +0200 (CEST)
Date: Fri, 17 Apr 2020 21:21:24 +0200
From: Lennart Poettering <lennart@poettering.net>
To: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: multicast listeners and audit events to kmsg
Message-ID: <20200417192124.GA55500@gardel-login>
References: <20200414092740.2fdf0f78@xantho>
	<20200415155355.qudqepcvvler55xs@madcap2.tricolour.ca>
	<20200416120612.GA52165@gardel-login>
	<20200417185742.2v7elrmjpi75w6mm@madcap2.tricolour.ca>
MIME-Version: 1.0
In-Reply-To: <20200417185742.2v7elrmjpi75w6mm@madcap2.tricolour.ca>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03HJLWWc027123
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 17 Apr 2020 16:31:04 -0400
Cc: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Content-Disposition: inline

T24gRnIsIDE3LjA0LjIwIDE0OjU3LCBSaWNoYXJkIEd1eSBCcmlnZ3MgKHJnYkByZWRoYXQuY29t
KSB3cm90ZToKCj4gPiBXZWxsLCB3ZSB0cnkgaGFyZCB0byBub3Qgc3RlcCBvbiB5b3VyIHRvZXMg
YW5kIGRvIG5vdCB1c2UgdGhlIHVuaWNhc3QKPiA+IHN0dWZmIGFuZCBkbyBub3QgcHJldGVuZCB0
byBiZSBhdWRpdGQsIHNvIHRoYXQgYXVkaXRkIGNhbiBiZSBpbnN0YWxsZWQKPiA+IGFuZCBydW4g
aW4gcGFyYWxsZWwgdG8gam91cm5hbGQgd2l0aCB1cyBiZWluZyBpbiB0aGUgYmFja3NlYXQuIEl0
J3MgbXkKPiA+IHVuZGVyc3RhbmRpbmcgdGhhdCB0aGUgbWNhc3Qgc3R1ZmYgd2FzIGFkZGVkIGZv
ciB0aGlzIGtpbmQgb2YgdGhpbmcsCj4gPiBleGNlcHQgdGhhdCBpdCBuZXZlciBiZWNhbWUgdXNl
ZnVsLCBzaW5jZSBpdCBhbHNvIG1lYW5zIHRoYXQga21zZyBpcwo+ID4gc3BhbW1lZCBieSBhdWRp
dC4KPgo+IFdoZXJlIHlvdXIgY2xhaW0gZmFsbHMgZmxhdCBpcyB0aGF0IHN5c3RlbWQvam91cm5h
bGQgaXMgc3RlcHBpbmcgb24KPiBhdWRpdGQncyB0b2VzIGJ5IGVuYWJsaW5nIGF1ZGl0LiAgRW5h
YmxpbmcgYXVkaXQgaXMgYXVkaXRkJ3Mgam9iLgoKQWdhaW4sIHdlIGFyZSBpbnRlcmVzdGVkIGlu
IHRoZSBhdWRpdCBpbmZvcm1hdGlvbiwgYmVjYXVzZSB3ZSB0aGluawppdCdzIHVzZWZ1bC4gSWYg
d2Ugd291bGRuJ3QgZW5hYmxlIGF1ZGl0IGluIHRoZSBrZXJuZWwgd2Ugd291bGRuJ3QgZ2V0Cml0
LiBIZW5jZSB3ZSBlbmFibGUgYXVkaXQuCgooQnV0IHNlZTogaHR0cHM6Ly9naXRodWIuY29tL3N5
c3RlbWQvc3lzdGVtZC9wdWxsLzE1NDQ0IOKAlCB3aXRoIHRoYXQKaXQncyBub3cgY29uZmlndXJh
YmxlLCBidXQgaXQgc3RpbGwgZGVmYXVsdHMgdG8gb24sIGJlY2F1c2Ugd2UKYWN0dWFsbHkgdGhp
bmsgdGhlIGRhdGEgaXMgdXNlZnVsLCBhbmQgd2UgdGhpbmsgaXQncyB1c2VmdWwgZXZlbnQKd2l0
aG91dCBhdWRpdGQgYXJvdW5kLCByZWdhcmRsZXNzIGlmIHRoYXQncyBiZWNhdXNlIHdlIHJ1biBp
biB0aGUKZWFybGllc3QgaW5pdHJkIHdoZXJlIHRoZXJlIG5ldmVyIGlzIGF1ZGl0ZCBhcm91bmQg
b3IgYmVjYXVzZSB3ZSBydW4KZHVyaW5nIG5vcm1hbCBvcGVyYXRpb24gYW5kIGF1ZGl0ZCBpcyBz
aW1wbHkgbm90IGluc3RhbGxlZC4pCgpMZW5uYXJ0CgotLQpMZW5uYXJ0IFBvZXR0ZXJpbmcsIEJl
cmxpbgoKCi0tCkxpbnV4LWF1ZGl0IG1haWxpbmcgbGlzdApMaW51eC1hdWRpdEByZWRoYXQuY29t
Cmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1hdWRpdA==

