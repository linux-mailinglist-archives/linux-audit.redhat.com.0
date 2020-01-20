Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9856E142EC4
	for <lists+linux-audit@lfdr.de>; Mon, 20 Jan 2020 16:28:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579534118;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Tde0zDHODJ1fTKL/34KO0JOhhSnI/iUnP/WZOQNmimQ=;
	b=P/1yFvEhtExTwsXfo6xOHL+XoZ9NV1sDnISYIhgQJr0MStK8jKRZ0fvbUaXg+yYgUr5xIc
	u9am6H0ipmab093kTc1yUqCvYa3UwgNFa+Dm9fg0GudXMBqulWQuXUydm4zk18H5Iy5DHC
	cfQAalYsvx7ZMLKCL2nOss6D05rRur8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-vwQDX3PPMzGaoQv1sbtQ7Q-1; Mon, 20 Jan 2020 10:28:37 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 190358010DD;
	Mon, 20 Jan 2020 15:28:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5EDE28984;
	Mon, 20 Jan 2020 15:28:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F089818089C8;
	Mon, 20 Jan 2020 15:28:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00KFSQRb020741 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 20 Jan 2020 10:28:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4177D5C299; Mon, 20 Jan 2020 15:28:26 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-179.phx2.redhat.com [10.3.116.179])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0B30E5C3FA;
	Mon, 20 Jan 2020 15:28:23 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: Duplicate settings?
Date: Mon, 20 Jan 2020 10:28:22 -0500
Message-ID: <1620604.diqz4lFvfc@x2>
Organization: Red Hat
In-Reply-To: <bb281668-ee20-5c23-684e-5e397136956c@gmail.com>
References: <725ed78a-f8e8-d73a-486a-13e821567752@gmail.com>
	<29812992.164tRMTlZt@x2>
	<bb281668-ee20-5c23-684e-5e397136956c@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00KFSQRb020741
X-loop: linux-audit@redhat.com
Cc: Leam Hall <leamhall@gmail.com>
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
X-MC-Unique: vwQDX3PPMzGaoQv1sbtQ7Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uZGF5LCBKYW51YXJ5IDIwLCAyMDIwIDEwOjE5OjU5IEFNIEVTVCBMZWFtIEhhbGwgd3Jv
dGU6Cj4gT24gMS8yMC8yMCAxMDoxNCBBTSwgU3RldmUgR3J1YmIgd3JvdGU6Cj4gPiBPbiBNb25k
YXksIEphbnVhcnkgMjAsIDIwMjAgMTA6MDQ6MjQgQU0gRVNUIExlYW0gSGFsbCB3cm90ZToKPiA+
PiBPbiAxLzIwLzIwIDk6MzcgQU0sIFN0ZXZlIEdydWJiIHdyb3RlOgo+ID4+PiBPbiBNb25kYXks
IEphbnVhcnkgMjAsIDIwMjAgOToyNDo1NiBBTSBFU1QgTGVhbSBIYWxsIHdyb3RlOgo+ID4+Pj4g
SWYgL2V0Yy9hdWRpdC9hdWRpdGQuY29uZiBlbmNvdW50ZXJzIGNvbmZsaWN0aW5nIGR1cGxpY2F0
ZSBzZXR0aW5ncywKPiA+Pj4+IHdoYXQgaGFwcGVucz8gVGFrZXMgdGhlIGZpcnN0LCB0YWtlcyB0
aGUgbGFzdCwgb3Igd2hhdD8gRm9yIGV4YW1wbGU6Cj4gPj4+PiAKPiA+Pj4+IHNwYWNlX2xlZnQg
PSAyNQo+ID4+Pj4gc3BhY2VfbGVmdCA9IDEwMAo+ID4+PiAKPiA+Pj4gSXQgb3ZlcndyaXRlcyB0
aGUgZmlyc3QgdmFsdWUgd2l0aCB0aGUgc2Vjb25kIG9uZS4gWW91IGNhbiBhbHNvIHJ1bjoKPiA+
Pj4gCj4gPj4+ICMgc2VydmljZSBhdWRpdGQgc3RhdGUKPiA+Pj4gCj4gPj4+IHRvIHNlZSB3aGF0
IHRoZSBjdXJyZW50IHZhbHVlIGlzIGlmIHlvdXIgYXVkaXQgZGFlbW9uIGlzIHNvbWV3aGF0Cj4g
Pj4+IHJlY2VudC4KPiA+PiAKPiA+PiBIZXkgU3RldmUsIGEgZm9sbG93IHVwLiBJcyB0aGUgbWFu
IHBhZ2UgZm9yIGF1ZGl0ZC5jb25mIHdyb25nPyBNeSBhdWRpdGQKPiA+PiBmYWlsZWQgdG8gc3Rh
cnQgd2hlbiBnaXZpbmcgc3BhY2VfbGVmdCB3aXRoIGEgJyUnIHNpZ24uCj4gPiAKPiA+IFVzdWFs
bHkgaXQgd3JpdGVzIHRoZSByZWFzb24gd2h5IGluIHN5c2xvZy4gRG9lcyBpdCBzYXkgYW55dGhp
bmcgdGhlcmU/Cj4gCj4gSSBkb24ndCBncm9rIHN5c3RlbWQsIHNvIGhlcmUncyB0aGUgd2hvbGUg
cmVzcG9uc2U6Cj4gCj4gUmVkaXJlY3RpbmcgdG8gL2Jpbi9zeXN0ZW1jdGwgc3RhdHVzIGF1ZGl0
ZC5zZXJ2aWNlCj4g4pePIGF1ZGl0ZC5zZXJ2aWNlIC0gU2VjdXJpdHkgQXVkaXRpbmcgU2Vydmlj
ZQo+ICAgICBMb2FkZWQ6IGxvYWRlZCAoL3Vzci9saWIvc3lzdGVtZC9zeXN0ZW0vYXVkaXRkLnNl
cnZpY2U7IGVuYWJsZWQ7Cj4gdmVuZG9yIHByZXNldDogZW5hYmxlZCkKPiAgICAgQWN0aXZlOiBm
YWlsZWQgKFJlc3VsdDogZXhpdC1jb2RlKSBzaW5jZSBNb24gMjAyMC0wMS0yMCAwOToyNzozNwo+
IEVTVDsgMTltaW4gYWdvCj4gICAgICAgRG9jczogbWFuOmF1ZGl0ZCg4KQo+ICAgICAgICAgICAg
IGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC1hdWRpdC9hdWRpdC1kb2N1bWVudGF0aW9uCj4gICAg
UHJvY2VzczogMjY5NSBFeGVjU3RhcnQ9L3NiaW4vYXVkaXRkIChjb2RlPWV4aXRlZCwgc3RhdHVz
PTYpCj4gCj4gSmFuIDIwIDA5OjI3OjM2IGxlYW1fYzcgc3lzdGVtZFsxXTogU3RhcnRpbmcgU2Vj
dXJpdHkgQXVkaXRpbmcgU2VydmljZS4uLgo+IEphbiAyMCAwOToyNzozNyBsZWFtX2M3IGF1ZGl0
ZFsyNjk1XTogVmFsdWUgMjUlIHNob3VsZCBvbmx5IGJlIG51bWJlcnMgLQo+IGxpbmUgMjAKClRo
ZSBpc3N1ZSBpcyBoZXJlIF5eXiAgVG8gdXNlIHBlcmNlbnRhZ2VzLCB5b3UgaGF2ZSB0byBiZSBv
biAyLjguNSBvciBsYXRlci4KCi1TdGV2ZQoKCgotLQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QK
TGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtYXVkaXQ=

