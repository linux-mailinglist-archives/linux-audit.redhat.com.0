Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 886EE1AE685
	for <lists+linux-audit@lfdr.de>; Fri, 17 Apr 2020 22:09:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587154179;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/jJ5IDj8wh+ssuGZ1Er2g5oewrttz1PGQ3Ccf6x9tCY=;
	b=E2JfDEZWZiAVyOaUAMIJu2KeNVUeCpC89V16WdmyWVEzh43WPyc4x8uuYUxugeI5l+VeQc
	nd5JbOyCFGVp5amZmO6zsrblA/hi2u5Xp2BZCWGRu+gTxCIAWlauZPTiaBW+Uepme+HaAx
	rfHojy6hWNmiHss5KOrHG09HidtBeFI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-Cd6eSs4JPois4A97xY_Ncg-1; Fri, 17 Apr 2020 16:09:37 -0400
X-MC-Unique: Cd6eSs4JPois4A97xY_Ncg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 342A813F9;
	Fri, 17 Apr 2020 20:09:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 948FE60BE0;
	Fri, 17 Apr 2020 20:09:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4040C1809567;
	Fri, 17 Apr 2020 20:09:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03HK98ak029610 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 17 Apr 2020 16:09:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 13987101D480; Fri, 17 Apr 2020 20:09:08 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.3.128.9])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0ABB010027B4;
	Fri, 17 Apr 2020 20:09:01 +0000 (UTC)
Date: Fri, 17 Apr 2020 16:08:59 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Lennart Poettering <lennart@poettering.net>
Subject: Re: multicast listeners and audit events to kmsg
Message-ID: <20200417200858.wxfqvhnqo7od5aom@madcap2.tricolour.ca>
References: <20200414092740.2fdf0f78@xantho>
	<20200415155355.qudqepcvvler55xs@madcap2.tricolour.ca>
	<20200416120612.GA52165@gardel-login>
	<20200417185742.2v7elrmjpi75w6mm@madcap2.tricolour.ca>
	<20200417192124.GA55500@gardel-login>
MIME-Version: 1.0
In-Reply-To: <20200417192124.GA55500@gardel-login>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Content-Disposition: inline

T24gMjAyMC0wNC0xNyAyMToyMSwgTGVubmFydCBQb2V0dGVyaW5nIHdyb3RlOgo+IE9uIEZyLCAx
Ny4wNC4yMCAxNDo1NywgUmljaGFyZCBHdXkgQnJpZ2dzIChyZ2JAcmVkaGF0LmNvbSkgd3JvdGU6
Cj4gCj4gPiA+IFdlbGwsIHdlIHRyeSBoYXJkIHRvIG5vdCBzdGVwIG9uIHlvdXIgdG9lcyBhbmQg
ZG8gbm90IHVzZSB0aGUgdW5pY2FzdAo+ID4gPiBzdHVmZiBhbmQgZG8gbm90IHByZXRlbmQgdG8g
YmUgYXVkaXRkLCBzbyB0aGF0IGF1ZGl0ZCBjYW4gYmUgaW5zdGFsbGVkCj4gPiA+IGFuZCBydW4g
aW4gcGFyYWxsZWwgdG8gam91cm5hbGQgd2l0aCB1cyBiZWluZyBpbiB0aGUgYmFja3NlYXQuIEl0
J3MgbXkKPiA+ID4gdW5kZXJzdGFuZGluZyB0aGF0IHRoZSBtY2FzdCBzdHVmZiB3YXMgYWRkZWQg
Zm9yIHRoaXMga2luZCBvZiB0aGluZywKPiA+ID4gZXhjZXB0IHRoYXQgaXQgbmV2ZXIgYmVjYW1l
IHVzZWZ1bCwgc2luY2UgaXQgYWxzbyBtZWFucyB0aGF0IGttc2cgaXMKPiA+ID4gc3BhbW1lZCBi
eSBhdWRpdC4KPiA+Cj4gPiBXaGVyZSB5b3VyIGNsYWltIGZhbGxzIGZsYXQgaXMgdGhhdCBzeXN0
ZW1kL2pvdXJuYWxkIGlzIHN0ZXBwaW5nIG9uCj4gPiBhdWRpdGQncyB0b2VzIGJ5IGVuYWJsaW5n
IGF1ZGl0LiAgRW5hYmxpbmcgYXVkaXQgaXMgYXVkaXRkJ3Mgam9iLgo+IAo+IEFnYWluLCB3ZSBh
cmUgaW50ZXJlc3RlZCBpbiB0aGUgYXVkaXQgaW5mb3JtYXRpb24sIGJlY2F1c2Ugd2UgdGhpbmsK
PiBpdCdzIHVzZWZ1bC4gSWYgd2Ugd291bGRuJ3QgZW5hYmxlIGF1ZGl0IGluIHRoZSBrZXJuZWwg
d2Ugd291bGRuJ3QgZ2V0Cj4gaXQuIEhlbmNlIHdlIGVuYWJsZSBhdWRpdC4KCkJ1dCB5b3UgYXJl
IGdldHRpbmcgaXQgdmlhIGtsb2cuICBUaGlzIGlzIHdoYXQgaXMgY2F1c2luZyB0aGUgcHJvYmxl
bS4KCj4gKEJ1dCBzZWU6IGh0dHBzOi8vZ2l0aHViLmNvbS9zeXN0ZW1kL3N5c3RlbWQvcHVsbC8x
NTQ0NCDigJQgd2l0aCB0aGF0Cj4gaXQncyBub3cgY29uZmlndXJhYmxlLCBidXQgaXQgc3RpbGwg
ZGVmYXVsdHMgdG8gb24sIGJlY2F1c2Ugd2UKPiBhY3R1YWxseSB0aGluayB0aGUgZGF0YSBpcyB1
c2VmdWwsIGFuZCB3ZSB0aGluayBpdCdzIHVzZWZ1bCBldmVudAo+IHdpdGhvdXQgYXVkaXRkIGFy
b3VuZCwgcmVnYXJkbGVzcyBpZiB0aGF0J3MgYmVjYXVzZSB3ZSBydW4gaW4gdGhlCj4gZWFybGll
c3QgaW5pdHJkIHdoZXJlIHRoZXJlIG5ldmVyIGlzIGF1ZGl0ZCBhcm91bmQgb3IgYmVjYXVzZSB3
ZSBydW4KPiBkdXJpbmcgbm9ybWFsIG9wZXJhdGlvbiBhbmQgYXVkaXRkIGlzIHNpbXBseSBub3Qg
aW5zdGFsbGVkLikKPiAKPiBMZW5uYXJ0CgotIFJHQgoKLS0KUmljaGFyZCBHdXkgQnJpZ2dzIDxy
Z2JAcmVkaGF0LmNvbT4KU3IuIFMvVyBFbmdpbmVlciwgS2VybmVsIFNlY3VyaXR5LCBCYXNlIE9w
ZXJhdGluZyBTeXN0ZW1zClJlbW90ZSwgT3R0YXdhLCBSZWQgSGF0IENhbmFkYQpJUkM6IHJnYiwg
U3VuUmF5Y2VyClZvaWNlOiArMS42NDcuNzc3LjI2MzUsIEludGVybmFsOiAoODEpIDMyNjM1Cgot
LQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczov
L3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtYXVkaXQ=

