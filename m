Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A851429F584
	for <lists+linux-audit@lfdr.de>; Thu, 29 Oct 2020 20:45:15 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-otYyZ9LRMgK6KHEZOmVbng-1; Thu, 29 Oct 2020 15:45:12 -0400
X-MC-Unique: otYyZ9LRMgK6KHEZOmVbng-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74D63190A3E3;
	Thu, 29 Oct 2020 19:45:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AFE58100238E;
	Thu, 29 Oct 2020 19:45:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E7B56CF64;
	Thu, 29 Oct 2020 19:44:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09TIOIGq014799 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 29 Oct 2020 14:24:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D3AB2200E1F1; Thu, 29 Oct 2020 18:24:18 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CEB88200E214
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 18:24:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC9528007A4
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 18:24:09 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-554-pkX7ymfCOqmOcTV5HH8Wgg-1; Thu, 29 Oct 2020 14:24:06 -0400
X-MC-Unique: pkX7ymfCOqmOcTV5HH8Wgg-1
Received: from mail-lj1-f179.google.com ([209.85.208.179])
	by youngberry.canonical.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <stgraber@ubuntu.com>) id 1kYCI0-0003zN-W7
	for linux-audit@redhat.com; Thu, 29 Oct 2020 18:04:45 +0000
Received: by mail-lj1-f179.google.com with SMTP id x6so4123665ljd.3
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 11:04:44 -0700 (PDT)
X-Gm-Message-State: AOAM530sPEf0oo9ibVOio5/+1oBPnpnJEI8/x+3pbqQtpAe/sUyWDCpg
	jZx1KPf5luFX9Ev9fBiQ1ELzpgDD5fvzlQ8CJBXYpA==
X-Google-Smtp-Source: ABdhPJzOR+GvYdcxThjeYM4q+BnWieqIoL3kVTr7F9zyXSA8NyVuuYCL1zVggZkDC4pHflRK6EVUPiYtBnL0ZVxrdaQ=
X-Received: by 2002:ac2:5c49:: with SMTP id s9mr1955451lfp.14.1603994683268;
	Thu, 29 Oct 2020 11:04:43 -0700 (PDT)
MIME-Version: 1.0
References: <20201029003252.2128653-1-christian.brauner@ubuntu.com>
	<87pn51ghju.fsf@x220.int.ebiederm.org> <20201029161231.GA108315@cisco>
	<87blglc77y.fsf@x220.int.ebiederm.org>
In-Reply-To: <87blglc77y.fsf@x220.int.ebiederm.org>
From: =?UTF-8?Q?St=C3=A9phane_Graber?= <stgraber@ubuntu.com>
Date: Thu, 29 Oct 2020 14:04:31 -0400
X-Gmail-Original-Message-ID: <CA+enf=vn1TgdLx9TR3m=wdBzbZxRbxK4NFY4NdYn0v5gzewCyw@mail.gmail.com>
Message-ID: <CA+enf=vn1TgdLx9TR3m=wdBzbZxRbxK4NFY4NdYn0v5gzewCyw@mail.gmail.com>
Subject: Re: [PATCH 00/34] fs: idmapped mounts
To: "Eric W. Biederman" <ebiederm@xmission.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 09TIOIGq014799
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 29 Oct 2020 15:43:14 -0400
Cc: Andy Lutomirski <luto@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>,
	David Howells <dhowells@redhat.com>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Miklos Szeredi <miklos@szeredi.hu>, Stephen Barber <smbarber@chromium.org>,
	Christoph Hellwig <hch@infradead.org>,
	Alban Crequy <alban@kinvolk.io>, linux-ext4@vger.kernel.org,
	Mrunal Patel <mpatel@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
	Jann Horn <jannh@google.com>, selinux@vger.kernel.org,
	Josh Triplett <josh@joshtriplett.org>,
	Seth Forshee <seth.forshee@canonical.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Lennart Poettering <lennart@poettering.net>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Geoffrey Thomas <geofft@ldpreload.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	John Johansen <john.johansen@canonical.com>, Theodore Tso <tytso@mit.edu>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Linux Containers <containers@lists.linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	overlayfs <linux-unionfs@vger.kernel.org>,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	Linux API <linux-api@vger.kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-integrity@vger.kernel.org,
	Tycho Andersen <tycho@tycho.pizza>, Todd Kjos <tkjos@google.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCBPY3QgMjksIDIwMjAgYXQgMTI6NDUgUE0gRXJpYyBXLiBCaWVkZXJtYW4KPGViaWVk
ZXJtQHhtaXNzaW9uLmNvbT4gd3JvdGU6Cj4KPiBUeWNobyBBbmRlcnNlbiA8dHljaG9AdHljaG8u
cGl6emE+IHdyaXRlczoKPgo+ID4gSGkgRXJpYywKPiA+Cj4gPiBPbiBUaHUsIE9jdCAyOSwgMjAy
MCBhdCAxMDo0Nzo0OUFNIC0wNTAwLCBFcmljIFcuIEJpZWRlcm1hbiB3cm90ZToKPiA+PiBDaHJp
c3RpYW4gQnJhdW5lciA8Y2hyaXN0aWFuLmJyYXVuZXJAdWJ1bnR1LmNvbT4gd3JpdGVzOgo+ID4+
Cj4gPj4gPiBIZXkgZXZlcnlvbmUsCj4gPj4gPgo+ID4+ID4gSSB2YW5pc2hlZCBmb3IgYSBsaXR0
bGUgd2hpbGUgdG8gZm9jdXMgb24gdGhpcyB3b3JrIGhlcmUgc28gc29ycnkgZm9yCj4gPj4gPiBu
b3QgYmVpbmcgYXZhaWxhYmxlIGJ5IG1haWwgZm9yIGEgd2hpbGUuCj4gPj4gPgo+ID4+ID4gU2lu
Y2UgcXVpdGUgYSBsb25nIHRpbWUgd2UgaGF2ZSBpc3N1ZXMgd2l0aCBzaGFyaW5nIG1vdW50cyBi
ZXR3ZWVuCj4gPj4gPiBtdWx0aXBsZSB1bnByaXZpbGVnZWQgY29udGFpbmVycyB3aXRoIGRpZmZl
cmVudCBpZCBtYXBwaW5ncywgc2hhcmluZyBhCj4gPj4gPiByb290ZnMgYmV0d2VlbiBtdWx0aXBs
ZSBjb250YWluZXJzIHdpdGggZGlmZmVyZW50IGlkIG1hcHBpbmdzLCBhbmQgYWxzbwo+ID4+ID4g
c2hhcmluZyByZWd1bGFyIGRpcmVjdG9yaWVzIGFuZCBmaWxlc3lzdGVtcyBiZXR3ZWVuIHVzZXJz
IHdpdGggZGlmZmVyZW50Cj4gPj4gPiB1aWRzIGFuZCBnaWRzLiBUaGUgbGF0dGVyIHVzZS1jYXNl
cyBoYXZlIGJlY29tZSBldmVuIG1vcmUgaW1wb3J0YW50IHdpdGgKPiA+PiA+IHRoZSBhdmFpbGFi
aWxpdHkgYW5kIGFkb3B0aW9uIG9mIHN5c3RlbWQtaG9tZWQgKGNmLiBbMV0pIHRvIGltcGxlbWVu
dAo+ID4+ID4gcG9ydGFibGUgaG9tZSBkaXJlY3Rvcmllcy4KPiA+Pgo+ID4+IENhbiB5b3Ugd2Fs
ayB1cyB0aHJvdWdoIHRoZSBtb3RpdmF0aW5nIHVzZSBjYXNlPwo+ID4+Cj4gPj4gQXMgb2YgdGhp
cyB5ZWFyJ3MgTFBDIEkgaGFkIHRoZSBkaXN0aW5jdCBpbXByZXNzaW9uIHRoYXQgdGhlIHByaW1h
cnkgdXNlCj4gPj4gY2FzZSBmb3Igc3VjaCBhIGZlYXR1cmUgd2FzIGR1ZSB0byB0aGUgUkxJTUlU
X05QUk9DIHByb2JsZW0gd2hlcmUgdHdvCj4gPj4gY29udGFpbmVycyB3aXRoIHRoZSBzYW1lIHVz
ZXJzIHN0aWxsIHdhbnRlZCBkaWZmZXJlbnQgdWlkIG1hcHBpbmdzIHRvCj4gPj4gdGhlIGRpc2sg
YmVjYXVzZSB0aGUgdXNlcnMgd2VyZSBjb25mbGljdGluZyB3aXRoIGVhY2ggb3RoZXIgYmVjYXVz
ZSBvZgo+ID4+IHRoZSBwZXIgdXNlciBybGltaXRzLgo+ID4+Cj4gPj4gRml4aW5nIHJsaW1pdHMg
aXMgc3RyYWlnaHQgZm9yd2FyZCB0byBpbXBsZW1lbnQsIGFuZCBlYXNpZXIgdG8gbWFuYWdlCj4g
Pj4gZm9yIGltcGxlbWVudGF0aW9ucyBhbmQgYWRtaW5pc3RyYXRvcnMuCj4gPgo+ID4gT3VyIHVz
ZSBjYXNlIGlzIHRvIGhhdmUgdGhlIHNhbWUgZGlyZWN0b3J5IGV4cG9zZWQgdG8gc2V2ZXJhbAo+
ID4gZGlmZmVyZW50IGNvbnRhaW5lcnMgd2hpY2ggZWFjaCBoYXZlIGRpc2pvaW50IElEIG1hcHBp
bmdzLgo+Cj4gV2h5IGRvIHRoZSB5b3UgaGF2ZSBkaXNqb2ludCBJRCBtYXBwaW5ncyBmb3IgdGhl
IHVzZXJzIHRoYXQgYXJlIHdyaXRpbmcKPiB0byBkaXNrIHdpdGggdGhlIHNhbWUgSUQ/Cj4KPiA+
PiBSZWFkaW5nIHVwIG9uIHN5c3RlbWQtaG9tZWQgaXQgYXBwZWFycyB0byBiZSBhIHdheSB0byBo
YXZlIGVuY3J5cHRlZAo+ID4+IGhvbWUgZGlyZWN0b3JpZXMuICBUaG9zZSBob21lIGRpcmVjdG9y
aWVzIGNhbiBlaXRoZXIgYmUgZW5jcnlwdGVkIGF0IHRoZQo+ID4+IGZzIG9yIGF0IHRoZSBibG9j
ayBsZXZlbC4gIFRob3NlIGhvbWUgZGlyZWN0b3JpZXMgYXBwZWFyIHRvIGhhdmUgdGhlCj4gPj4g
Z29hbCBvZiBiZWluZyBsdWdnYWJsZSBiZXR3ZWVuIHN5c3RlbXMuICBJZiB0aGUgc3lzdGVtcyBp
biBxdWVzdGlvbgo+ID4+IGRvbid0IGhhdmUgY29tbW9uIGFkbWluaXN0cmF0aW9uIG9mIHVpZHMg
YW5kIGdpZHMgYWZ0ZXIgbHVnZ2luZyB5b3VyCj4gPj4gZW5jcnlwdGVkIGhvbWUgZGlyZWN0b3J5
IHRvIGFub3RoZXIgc3lzdGVtIGNob3duaW5nIHRoZSBmaWxlcyBpcwo+ID4+IHJlcXVpcmVkLgo+
ID4+Cj4gPj4gSXMgdGhhdCB0aGUgdXNlIGNhc2UgeW91IGFyZSBsb29raW5nIGF0IHJlbW92aW5n
IHRoZSBuZWVkIGZvcgo+ID4+IHN5c3RlbWQtaG9tZWQgdG8gYXZvaWQgY2hvd25pbmcgYWZ0ZXIg
bHVnZ2luZyBlbmNyeXB0ZWQgaG9tZSBkaXJlY3Rvcmllcwo+ID4+IGZyb20gb25lIHN5c3RlbSB0
byBhbm90aGVyPyAgV2h5IHdvdWxkIGl0IGJlIGRlc2lyYWJsZSB0byBhdm9pZCB0aGUKPiA+PiBj
aG93bj8KPiA+Cj4gPiBOb3QganVzdCBzeXN0ZW1kLWhvbWVkLCBidXQgTFhEIGhhcyB0byBkbyB0
aGlzLAo+Cj4gSSBhc2tlZCB3aHkgdGhlIHNhbWUgZGlzayB1c2VycyBhcmUgYXNzaWduZWQgZGlm
ZmVyZW50IGt1aWRzIGFuZCB0aGUKPiBvbmx5IHJlYXNvbiBJIGhhdmUgaGVhcmQgdGhhdCBMWEQg
ZG9lcyB0aGlzIGlzIHRoZSBSTElNSVRfTlBST0MgcHJvYmxlbS4KPgo+IFBlcmhhcHMgdGhlcmUg
aXMgYW5vdGhlciByZWFzb24uCj4KPiBJbiBwYXJ0IHRoaXMgaXMgd2h5IEkgYW0gZWFnZXIgdG8g
aGVhciBwZW9wbGVzIHVzZSBjYXNlLCBhbmQgd2h5IEkgd2FzCj4gdHJ5aW5nIHZlcnkgaGFyZCB0
byBtYWtlIGNlcnRhaW4gd2UgZ2V0IHRoZSByZXF1aXJlbWVudHMuCj4KPiBJIHdhbnQgdGhlIHJl
YWwgcmVxdWlyZW1lbnRzIHRob3VnaCBhbmQgc29tZSB0aG91Z2h0LCBub3QganVzdCB3ZSBkaWQK
PiB0aGlzIGFuZCBpdCBodXJ0cy4gIENoYW5nbmluZyB0aGUgdWlkcyBvbiB3cml0ZSBpcyBhIHZl
cnkgaGFyZCBwcm9ibGVtLAo+IGFuZCBub3QganVzdCBpbiBpbXBsZW1lbnRhdGluZyBpdCBidXQg
YWxzbyBpbiBtYWludGFpbmluZyBhbmQKPiB1bmRlcnN0YW5kaW5nIHdoYXQgaXMgZ29pbmcgb24u
CgpUaGUgbW9zdCBjb21tb24gY2FzZXMgd2hlcmUgc2hpZnRmcyBpcyB1c2VkIG9yIHdoZXJlIGZv
bGtzIHdvdWxkIGxpa2UKdG8gdXNlIGl0IHRvZGF5IGFyZSAoYnkgaW1wb3J0YW5jZSk6CiAtIEZh
c3QgY29udGFpbmVyIGNyZWF0aW9uIChieSBub3QgaGF2aW5nIHRvIHVpZC9naWQgc2hpZnQgYWxs
IGZpbGVzCmluIHRoZSBkb3dubG9hZGVkIGltYWdlKQogLSBTaGFyaW5nIGRhdGEgYmV0d2VlbiB0
aGUgaG9zdCBzeXN0ZW0gYW5kIGEgY29udGFpbmVyIChzb21lIHBhdGhzCnVuZGVyIC9ob21lIGJl
aW5nIHRoZSBtb3N0IGNvbW1vbikKIC0gU2hhcmluZyBkYXRhIGJldHdlZW4gdW5wcml2aWxlZ2Vk
IGNvbnRhaW5lcnMgd2l0aCBhIGRpc2pvaW50ZWQgbWFwCiAtIFNoYXJpbmcgZGF0YSBiZXR3ZWVu
IG11bHRpcGxlIGNvbnRhaW5lcnMsIHNvbWUgcHJpdmlsZWdlZCwgc29tZSB1bnByaXZpbGVnZWQK
CkZpeGluZyB0aGUgdWxpbWl0IGlzc3VlIG9ubHkgdGFrZXMgY2FyZSBvZiBvbmUgb2YgdGhvc2Ug
KDNyZCBpdGVtKSwgaXQKZG9lcyBub3Qgc29sdmUgYW55IG9mIHRoZSBvdGhlciBjYXNlcy4KClRo
ZSBmaXJzdCBpdGVtIG9uIHRoZXJlIGFsb25lIGNhbiBiZSBxdWl0ZSBzaWduaWZpY2FudC4gQ3Jl
YXRpb24gYW5kCnN0YXJ0dXAgb2YgYSByZWd1bGFyIERlYmlhbiBjb250YWluZXIgb24gbXkgc3lz
dGVtIHRha2VzIGFyb3VuZCA1MDBtcwp3aGVuIHNoaWZ0ZnMgaXMgdXNlZCAoYnRyZnMvbHZtL3pm
cyBjb3B5LW9uLXdyaXRlIGNsb25lIG9mIHRoZSBpbWFnZSwKc2V0dXAgc2hpZnRmcywgc3RhcnQg
Y29udGFpbmVyKSBjb21wYXJlZCB0byAyLTNzIHdoZW4gcnVubmluZyB3aXRob3V0Cml0IChzYW1l
IGNsb25lLCBmb2xsb3dlZCBieSByZXdyaXRlIG9mIGFsbCB1aWQvZ2lkIHByZXNlbnQgb24gdGhl
IGZzLAppbmNsdWRpbmcgYWNscyBhbmQgY2FwYWJpbGl0aWVzLCB0aGVuIHN0YXJ0IGNvbnRhaW5l
cikuIEFuZCB0aGF0J3Mgb24KYSBmYXN0IHN5c3RlbSB3aXRoIGFuIE5WTUUgU1NEIGFuZCBhIHNt
YWxsIHJvb3Rmcy4gV2UgaGF2ZSBoYWQgcmVwb3J0cwpvZiBhIGZldyB1c2VycyBydW5uaW5nIG9u
IHNsb3cgc3Bpbm5pbmcgcnVzdCB3aXRoIGxhcmdlIGNvbnRhaW5lcnMKd2hlcmUgc2hpZnRpbmcg
Y2FuIHRha2Ugc2V2ZXJhbCBtaW51dGVzLgoKVGhlIHNlY29uZCBpdGVtIGNhbiB0ZWNobmljYWxs
eSBiZSB3b3JrZWQgYXJvdW5kIHdpdGhvdXQgc2hpZnRlZApiaW5kLW1vdW50cyBieSBkb2luZyB1
c2VybnMgbWFwIGhvbGUgcHVuY2hpbmcsIG1hcHBpbmcgdGhlIHVzZXIncwp1aWQvZ2lkIGZyb20g
dGhlIGhvc3Qgc3RyYWlnaHQgaW50byB0aGUgY29udGFpbmVyLiBUaGUgZG93bnNpZGUgdG8KdGhp
cyBpcyB0aGF0IGFub3RoZXIgc2hpZnRpbmcgcGFzcyBiZWNvbWVzIG5lZWRlZCBmb3IgYW55IGZp
bGUgb3V0c2lkZQpvZiB0aGUgYmluZC1tb3VudGVkIHBhdGggKG9yIGl0IHdvdWxkIGJlY29tZSBv
d25lZCBieSAtMS8tMSkgYW5kIGl0J3MKdmVyeSBtdWNoIG5vdCBkeW5hbWljLCByZXF1aXJpbmcg
dGhlIGNvbnRhaW5lciBiZSBzdG9wcGVkLCBjb25maWcKdXBkYXRlZCBieSB0aGUgdXNlciwgL2V0
Yy9zdWJ1aWQgYW5kIHN1YmdpZCBtYXBzIGJlaW5nIHVwZGF0ZWQgYW5kCmNvbnRhaW5lciBzdGFy
dGVkIGJhY2sgdXAuIElmIHlvdSBuZWVkIGFub3RoZXIgdXNlci9ncm91cCBiZSBleHBvc2VkLApz
dGFydCBhbGwgb3ZlciBhZ2Fpbi4uLgpUaGlzIGlzIGZhciBtb3JlIGNvbXBsZXgsIHNsb3cgYW5k
IGRpc3J1cHRpdmUgdGhhbiB0aGUgc2hpZnRlZAphcHByb2FjaCB3aGVyZSB3ZSBqdXN0IG5lZWQg
dG8gZG86CiAgIGx4YyBjb25maWcgZGV2aWNlIGFkZCBNWS1DT05UQUlORVIgaG9tZSBkaXNrIHNv
dXJjZT0vaG9tZQpwYXRoPS9ob21lIHNoaWZ0PXRydWUKVG8gaW5qZWN0IGEgbmV3IG1vdW50IG9m
IC9ob21lIGZyb20gdGhlIGhvc3QgaW50byB0aGUgY29udGFpbmVyIHdpdGggYQpzaGlmdGluZyBs
YXllciBpbiBwbGFjZSwgbm8gbmVlZCB0byByZWNvbmZpZyBzdWJ1aWQvc3ViZ2lkLCBubyBuZWVk
IHRvCnJlLWNyZWF0ZSB0aGUgdXNlcm5zIHRvIHVwZGF0ZSB0aGUgbWFwcGluZyBhbmQgbm8gbmVl
ZCB0byBnbyB0aHJvdWdoCnRoZSBjb250YWluZXIncyByb290ZnMgZm9yIGFueSBmaWxlIHdoaWNo
IG1heSBub3cgbmVlZCByZW1hcHBpbmcKYmVjYXVzZSBvZiB0aGUgbWFwIGNoYW5nZS4KClN0w6lw
aGFuZQoKPiBFcmljCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBDb250YWluZXJzIG1haWxpbmcgbGlzdAo+IENvbnRhaW5lcnNAbGlzdHMubGludXgt
Zm91bmRhdGlvbi5vcmcKPiBodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1h
bi9saXN0aW5mby9jb250YWluZXJzCgoKLS0KTGludXgtYXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4
LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWF1ZGl0

