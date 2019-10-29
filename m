Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id C9E92E8835
	for <lists+linux-audit@lfdr.de>; Tue, 29 Oct 2019 13:30:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572352229;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1mXJJW9Y5r/f2AGA23nUMPHeS0f0No4Uw6Ig5kPVjyI=;
	b=ZQWAzyMjwVrNSH0f2UdKdv5Qh1Xh1240prrQ1LoECBvHNxTkg92WJG25VkP/tOzDtKZVOI
	XrLOJL/8UOPP4j+UnD69g62+F4KWhsr86rr9oXYSHIWD/waXLjMRBwJrcO68P0dVxeF1BL
	5BRI+HNDBPamCp/rY7DL9rwf76t9XoE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-CDAtSco_PKyWg_9GWzJLkQ-1; Tue, 29 Oct 2019 08:30:27 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39F411005509;
	Tue, 29 Oct 2019 12:30:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB73460863;
	Tue, 29 Oct 2019 12:30:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9EEB118034EA;
	Tue, 29 Oct 2019 12:30:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9TCU8hh004676 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 29 Oct 2019 08:30:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3349C5C21E; Tue, 29 Oct 2019 12:30:08 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-19.phx2.redhat.com [10.3.112.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E41265C222;
	Tue, 29 Oct 2019 12:30:01 +0000 (UTC)
Date: Tue, 29 Oct 2019 08:29:58 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: =?utf-8?B?5p2o5rW3?= <hai.yang@magic-shield.com>
Subject: Re: "echo" not logged in auditd
Message-ID: <20191029122958.r7wojwetkrblz76q@madcap2.tricolour.ca>
References: <tencent_0693B7A4459F8B8652881558@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_0693B7A4459F8B8652881558@qq.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: CDAtSco_PKyWg_9GWzJLkQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Content-Disposition: inline

T24gMjAxOS0xMC0yOSAxMToyNywg5p2o5rW3IHdyb3RlOgo+IEhpIAo+IAo+IFdlIGFyZSBleHBl
cmllbmNpbmcgdGhlIHNhbWUgaXNzdWUgYmVsb3csIHRoYXQgImVjaG8iIGNhbm5vdCBiZSBsb2dn
ZWQgaW4gYXVkaXRkLiBXb3VsZCBsaWtlIHRvIGtub3cgc29tZSBkZXRhaWxlZCBleHBsYW5hdGlv
biBoZXJlLCBhbmQgdW5kZXJzdGFuZCBpbiBnZW5lcmFsIHdoYXQgd291bGQgTk9UIGJlIGluIHRo
ZSBzY29wZSBvZiBhdWRpdGQgbG9nLgo+IAo+IGh0dHBzOi8vc2VydmVyZmF1bHQuY29tL3F1ZXN0
aW9ucy84NzEzNDMvd2h5LWRvZXMtYXVkaXRkLW9ubHktbG9nLWVjaG8td2hlbi1pLXVzZS10aGUt
YWJzb2x1dGUtcGF0aAoKVGhpcyBleHBsYW5hdGlvbiBpcyBwcmV0dHkgY2xlYXIuCgpUaGUgInNo
ZWxsIGJ1aWx0aW4iIG1lYW5zIHRoYXQgd2hhdGV2ZXIgc2hlbGwgeW91IGFyZSBhbHJlYWR5IHVz
aW5nCihiYXNoLCBzaCwgYXNoLCBkYXNoLCB6c2gsIC4uLikgaXMgdGhlIG9uZSBydW5uaW5nIHRo
aXMgY29tbWFuZCBpbiB0aGUKYWxyZWFkeS1leGVjdXRpbmcgc2hlbGwgcmF0aGVyIHRoYW4gc3Rh
cnRpbmcgYSBuZXcga2VybmVsLXRyYWNrZWQKcHJvY2VzcyAodGFzaykuICBUaGlzIHdvdWxkIGJl
IHNpbWlsYXIgdG8gcnVubmluZyBweXRob24gb3IgcGVybCBpbgppbnRlcmFjdGl2ZSBtb2RlIGFu
ZCB0eXBpbmcgY29tbWFuZHMgdG8gb25lIG9mIHRob3NlIHByb21wdHMuICBPbmNlIHlvdQpoYXZl
IHNlZW4gcHl0aG9uIG9yIHBlcmwgc3RhcnRlZCBhcyBhIG5ldyB0YXNrLCBhbnkgY29tbWFuZHMg
bmF0aXZlIHRvCmVpdGhlciBvZiB0aG9zZSB0d28gaW50ZXJwcmV0ZXJzIHdvdWxkIG5vdCBzdGFy
dCBhIG5ldyBrZXJuZWwtdHJhY2tlZAp0YXNrLgoKVG8gdHJ5IHRvIHNvbHZlIHlvdXIgaXNzdWUg
eW91IHdvdWxkIG5lZWQgdG8gdHJhY2sgdGhlIGludm9jYXRpb24gb2YKZXZlcnkgc2hlbGwgYnV0
IG5vdCBrbm93IHdoYXQncyBydW5uaW5nIGluc2lkZSBpdCwgb3IgdXNlIHBhbV90dHlfYXVkaXQK
dG8gdHJhY2sgdGhlIGtleXN0cm9rZXMgb2YgdGhhdCBzaGVsbC4gIFlvdSBtaWdodCBhbHNvIGJl
IGFibGUgdG8KbW9uaXRvciAuYmFzaF9oaXN0b3J5IGZvciB0aGF0IGFjY291bnQsIGJ1dCBzaW5j
ZSB0aGUgdXNlciBpcyBhYmxlIHRvCmluZmx1ZW5jZSB0aGUgY29uZmlndXJhdGlvbiBvZiBiYXNo
IGhpc3RvcnksIGl0IHdvdWxkIG5vdCBiZSByZWxpYWJsZS4KCj4gUmVnYXJkcwo+IEhhaQoKLSBS
R0IKCi0tClJpY2hhcmQgR3V5IEJyaWdncyA8cmdiQHJlZGhhdC5jb20+ClNyLiBTL1cgRW5naW5l
ZXIsIEtlcm5lbCBTZWN1cml0eSwgQmFzZSBPcGVyYXRpbmcgU3lzdGVtcwpSZW1vdGUsIE90dGF3
YSwgUmVkIEhhdCBDYW5hZGEKSVJDOiByZ2IsIFN1blJheWNlcgpWb2ljZTogKzEuNjQ3Ljc3Ny4y
NjM1LCBJbnRlcm5hbDogKDgxKSAzMjYzNQoKLS0KTGludXgtYXVkaXQgbWFpbGluZyBsaXN0Ckxp
bnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWF1ZGl0

