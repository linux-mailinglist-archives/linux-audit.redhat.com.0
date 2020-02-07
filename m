Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D8C2E155E8B
	for <lists+linux-audit@lfdr.de>; Fri,  7 Feb 2020 20:15:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581102926;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ablPLezFxe4jfJFjo3NWiOaO59SgrHN2D5VAMLW7uzU=;
	b=Uf7n50MY0CQ40zq9jbSy8XoiphqltmhO3CVzhC4eIjhpEqmb1cBmimJ1UNfSpGnaYCU2dz
	kyVCNpypEaH9MLEqsxW34GGEuCGrFVgCCE9GErxcjyd5/lQju7tVHzfoHzVBfe9wwFreaS
	bjW8PvvPOU4FfPNlUxz6xohdXckv5DQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-IO4w4_AOMkCGyu42c9FqMg-1; Fri, 07 Feb 2020 14:15:24 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9193A1137842;
	Fri,  7 Feb 2020 19:15:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 84B6060BEC;
	Fri,  7 Feb 2020 19:15:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E57F21803C32;
	Fri,  7 Feb 2020 19:15:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 017JEuI0015804 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 7 Feb 2020 14:14:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1D51A84DB4; Fri,  7 Feb 2020 19:14:56 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-155.phx2.redhat.com [10.3.116.155])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A9AC089A9C;
	Fri,  7 Feb 2020 19:14:52 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: audisp-remote
Date: Fri, 07 Feb 2020 14:14:52 -0500
Message-ID: <2537219.Lru4QqDhYW@x2>
Organization: Red Hat
In-Reply-To: <5F4EE10832231F4F921A255C1D95429829B091@DEERLM99EX7MSX.ww931.my-it-solutions.net>
References: <5F4EE10832231F4F921A255C1D95429829B091@DEERLM99EX7MSX.ww931.my-it-solutions.net>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 017JEuI0015804
X-loop: linux-audit@redhat.com
Cc: "MAUPERTUIS, PHILIPPE" <philippe.maupertuis@equensworldline.com>
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
X-MC-Unique: IO4w4_AOMkCGyu42c9FqMg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpZGF5LCBGZWJydWFyeSA3LCAyMDIwIDU6MDI6MDEgQU0gRVNUIE1BVVBFUlRVSVMsIFBI
SUxJUFBFIHdyb3RlOgo+IEFwYXJ0IHRoZSBtYW4gcGFnZXMsIEkgZGlkbuKAmXQgZmluZCBhbnl0
aGluZyB1c2VmdWwgcmVsYXRpbmcgdG8KPiBhdWRpc3AtcmVtb3RlLiBJIGFtIHNlYXJjaGluZyBp
bmZvcm1hdGlvbiBvbiBob3cgaXQgc2NhbGVzID8gSXMgdGhlcmUgYW55Cj4gcGVyZm9ybWFuY2Ug
aXNzdWUgPyBIb3cgdG8gdXNlIGl0IGluIGEgbGFyZ2UgZW52aXJvbm1lbnQgPwoKSXQgaXMgcmVh
bGx5IGRlc2lnbmVkIGZvciBzbWFsbGVyIGRlcGxveW1lbnRzLiBJZiB5b3UgaGF2ZSAxMCBvciBz
byBzeXN0ZW1zLCAKaXQgc2hvdWxkIGRvIE9LLiBJIGhhdmUgbm90IHRlc3RlZCBsb2FkIGhhbmRs
aW5nIG9mIHRoZSBkYWVtb24gdmlhIG5ldHdvcmsgCnNvdXJjZXMuIEJ1dCBoYXZlIHRlc3RlZCB0
aGUgYWJpbGl0eSB0byB3cml0ZSBsb2dzIGFuZCBpdHMgdmVyeSBmYXN0LiBGYXN0IAplbm91Z2gg
dG8gZmlsbCB5b3VyIGhhcmQgZHJpdmUgaW4gYSBtaW51dGUgb3Igc28uCgo+IE1vc3Qgb2Ygd2hh
dCBJIGZvdW5kIGRhdGVkIGEgbG9uZyB0aW1lIGFnbyBhbmQgbWFpbmx5IHNhaWQgdXNlIHJzeXNs
b2cKPiBpbnN0ZWFkLiBJdCBzZWVtcyB0aGF0IGNlbnRyYWxpemluZyB0aGUgbWVzc2FnZXMgdGhy
b3VnaCByc3lzbG9nIGlzIGZhcgo+IG1vcmUgcG9wdWxhci4gSXMgYXVkaXNwLXJlbW90ZSByZWFs
bHkgdXNlZCA/CgpGb3Igc21hbGwgZGVwbG95bWVudHMgc3VyZS4gSWYgeW91IHJlYWxseSBoYXZl
IGEgbG90LCB0aGVuIHlvdSBwcm9iYWJseSAKc2hvdWxkIHVzZSBzb21lIGtpbmQgb2Ygc3Vic3lz
dGVtIGRlc2lnbmVkIHRvIGhhbmRsZSBsYXJnZSBhbW91bnRzIG9mIGRhdGEuIApFTEssIGdyYXls
b2csIHNwbHVuayBhcmUgYWxsIGEgY291cGxlIHRoYXQgY29tZSB0byBtaW5kLiBJIGFsc28gc3Vz
cGVjdCB5b3UgCndhbnQgYXVkaXQgZGF0YSBjb3JyZWxhdGVkIHdpdGggb3RoZXIgYXBwbGljYXRp
b24gaW5mb3JtYXRpb24uCgpUaGUgbWFpbiBpc3N1ZXMgYXQgc2NhbGUgYXJlIGxvZyBtYW5hZ2Vt
ZW50LCBzZWFyY2hpbmcsIGFuZCBhbGVydGluZy4gVGhlc2UgCmFyZSBhbGwgcHJvYmxlbXMgdGhh
dCBvbmUgcGVyc29uIGhhY2tpbmcgb24gc3BhcmUgdGltZSBjYW4ndCByZWFsbHkgYWNoaWV2ZSAK
d2VsbC4gSWYgd2UgaGFkIGEgc3Ryb25nZXIgY29tbXVuaXR5IHdpdGggbW9yZSBwYXJ0aWNpcGFu
dHMsIHdlIHByb2JhYmx5IAp3b3VsZCBoYXZlIGJldHRlciBhbmQgbmljZXIgdG9vbHMuCgo+IFRo
ZSBtYW4gcGFnZSByZWFkIDoKPiAgICAgICAgdGNwX21heF9wZXJfYWRkcgo+ICAgICAgICAgICAg
ICAgVGhpcyAgaXMgIGEgIG51bWVyaWMgIHZhbHVlICB3aGljaCAgaW5kaWNhdGVzICBob3cgbWFu
eQo+IGNvbmN1cnJlbnQgY29ubmVjdGlvbnMgZnJvbSBvbmUgSVAgYWRkcmVzcyBpcyBhbGxvd2Vk
LiAgVGhlIGRlZmF1bHQgaXMgMQo+IGFuZCB0aGUgbWF4aW11bSBpcyAxMDI0LiBTZXR0aW5nIHRo
aXMgdG9vIGxhcmdlIG1heSBhbGxvdyBmb3IgYSBEZW5pYWwgb2YKPiBTZXJ2aWNlIGF0dGFjayBv
biAgdGhlICBsb2figJAgZ2luZyAgc2VydmVyLiAgQWxzbyAgbm90ZSAgdGhhdCB0aGUga2VybmVs
Cj4gaGFzIGFuIGludGVybmFsIG1heGltdW0gdGhhdCB3aWxsIGV2ZW50dWFsbHkgcHJldmVudCB0
aGlzIGV2ZW4gaWYgYXVkaXRkCj4gYWxsb3dzIGl0IGJ5IGNvbmZpZy4gVGhlIGRlZmF1bHQgc2hv
dWxkIGJlIGFkZXF1YXRlIGluIG1vc3QgY2FzZXMgdW5sZXNzIGEKPiBjdXN0b20gd3JpdHRlbiBy
ZWNvdmVyeSBzY3JpcHQgIHJ1bnMgIHRvIGZvcndhcmQgdW5zZW50IGV2ZW50cy4gSW4gdGhpcwo+
IGNhc2UgeW91IHdvdWxkIGluY3JlYXNlIHRoZSBudW1iZXIgb25seSBsYXJnZSBlbm91Z2ggdG8g
bGV0IGl0IGluIHRvby4KPiBXaGVyZSBjb3VsZCBJIGZpbmQgYW4gZXhhbXBsZSBvZiByZWNvdmVy
eSBzY3JpcHQgPwo+IENvdWxkIGl0IGJlIGEgd2F5IHRvIGluamVjdCB0aGUgYXVkaXQgbWVzc2Fn
ZSBpbiBhdWRpdGQgYWZ0ZXIgaGF2aW5nCj4gcmVjZWl2aW5nIHRoZW0gdmlhIHJzeXNsb2cgPyBU
aGlzIG1pZ2h0IGJlIHVzZWZ1bCBqdXN0IGJlY2F1c2UsIGJ5IGRlZmF1bHQKPiBhdXNlYXJjaCBp
biBhbGwgYXZhaWxhYmxlIGxvZ3MgYW5kIHRoZSAtaWYgcGFyYW1ldGVyIGFjY2VwdHMgb25seSBv
bmUKPiBmaWxlLgoKSSB0aGluayB5b3UgY2FuIGluamVjdCBsb2dzIGJ5IAoKYXVzZWFyY2ggLS1z
dGFydCBYWFggLS1yYXcgfCBhdWRpc3AtcmVtb3RlCgoKPiBNYXliZSBteSBsYWNrIG9mIGtub3ds
ZWRnZSBhYm91dCBhdWRpdGQgbGVhZHMgbWUgdG8gd3JpdGUgcnViYmlzaC4KPiBJZiBzbywgcGxl
YXNlIGRpcmVjdCBtZSB0byB3aGVyZSBJIGNhbiBmaW5kIGhvdyB0byBtYW5hZ2UgYW5kIHVzZSBh
dWRpdAo+IGxvZ3MgYWZ0ZXIgY2VudHJhbGl6aW5nIHRoZW0uIE5vdCBvbmx5IGtlZXBpbmcgdGhl
bSBidXQgIGFjdXR1YWxseSB1c2luZwo+IHRoZW0uCgpUaGVyZSBtYXkgYmUgb3RoZXJzIGluIHRo
ZSBjb21tdW5pdHkgdGhhdCBjYW4gb2ZmZXIgc29tZSBpbnNpZ2h0IGhlcmUuCgotU3RldmUKCgoK
LS0KTGludXgtYXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6
Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0

