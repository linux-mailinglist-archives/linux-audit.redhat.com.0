Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 928DB302600
	for <lists+linux-audit@lfdr.de>; Mon, 25 Jan 2021 15:06:13 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-21M1GNvrOX657y2_BAVVDQ-1; Mon, 25 Jan 2021 09:06:07 -0500
X-MC-Unique: 21M1GNvrOX657y2_BAVVDQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAFAD1052A1B;
	Mon, 25 Jan 2021 14:03:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 053341045D02;
	Mon, 25 Jan 2021 14:03:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1D4F74A7C6;
	Mon, 25 Jan 2021 14:03:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10OEJo1p000559 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 24 Jan 2021 09:19:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7B1F31111C78; Sun, 24 Jan 2021 14:19:50 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 772F91111C74
	for <linux-audit@redhat.com>; Sun, 24 Jan 2021 14:19:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58B3F1875040
	for <linux-audit@redhat.com>; Sun, 24 Jan 2021 14:19:48 +0000 (UTC)
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.217.80.70]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-159-D8cszPv5OiaiaM2Ccso42A-1;
	Sun, 24 Jan 2021 09:19:45 -0500
X-MC-Unique: D8cszPv5OiaiaM2Ccso42A-1
Received: from mse-fl2.zte.com.cn (unknown [10.30.14.239])
	by Forcepoint Email with ESMTPS id 2D3ACCEA8216117E0417;
	Sun, 24 Jan 2021 22:19:42 +0800 (CST)
Received: from kjyxapp01.zte.com.cn ([10.30.12.200])
	by mse-fl2.zte.com.cn with SMTP id 10OEJeJQ044383;
	Sun, 24 Jan 2021 22:19:40 +0800 (GMT-8)
	(envelope-from yang.yang29@zte.com.cn)
Received: from mapi (kjyxapp03[null]) by mapi (Zmail) with MAPI id mid14;
	Sun, 24 Jan 2021 22:19:40 +0800 (CST)
Date: Sun, 24 Jan 2021 22:19:40 +0800 (CST)
X-Zmail-TransId: 2b05600d81fc88d6d325
Message-ID: <202101242219402832418@zte.com.cn>
References: 202101212225030936472@zte.com.cn,
	CAHC9VhSawMHjRsEuHCDhSq2JEpLxvQZ1u1tEg=cy4y9Ays4ogg@mail.gmail.com
Mime-Version: 1.0
From: <yang.yang29@zte.com.cn>
To: <paul@paul-moore.com>
Subject: =?UTF-8?B?Rnc6UmU6Rnc6UmU6Rnc6UmU6W1JGQyx2MSwxLzFdIGF1ZGl0OiBzcGVlZCB1cCBzeXNjYWxsIHJ1bGUgbWF0Y2ggd2hpbGUgZXhpdGluZyBzeXNjYWxs?=
X-MAIL: mse-fl2.zte.com.cn 10OEJeJQ044383
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 25 Jan 2021 09:02:25 -0500
Cc: linux-audit@redhat.com, linux-kernel@vger.kernel.org
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
Content-Type: multipart/mixed;
	boundary="=====_001_next====="

--=====_001_next=====
Content-Type: multipart/alternative;
	boundary="=====_003_next====="

--=====_003_next=====
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

R3JlYXQgdGhhbmtzIGZvciB5b3VyIHN1Z2dlc3RpbmdzLCBwYXRjaCB2MyBoYXMgYSBiZXR0ZXIg
cGVyZm9ybWFuY2UuCgpOZXcgZGF0YTogClN5c2NhbGwgYWJzb2x1dGUgdGltZQpUZXN0IG1ldGhv
ZDogClVzZSBrdGltZV9nZXRfcmVhbF90czY0KCkgaW4gZG9fc3lzY2FsbF82NCgpIHRvIGNhbGN1
bGF0ZSB0aW1lLgpSdW4gY29tbWFuZCAiY2htb2QgNzc3IC9ldGMvZnN0YWIiIHdpdGggY2hvd24g
cnVsZXMuIEVhY2ggdGVzdCAxMHRpbWVzIGFuZCBnZXQgYXZlcmFnZS4KCmRvX3N5c2NhbGxfNjQo
KSB0aW1lIHdpdGggMTAwIHJ1bGVzOgpiZWZvcmUgdGhpcyBwYXRjaDogNzYwNG5zCmFmdGVyIHRo
aXMgcGF0Y2g6IDUyNDRucywgcmVkdWNlIDIzNjBucy4KCmRvX3N5c2NhbGxfNjQoKSB0aW1lIHdp
dGggQ0lTIHJ1bGVzOgpiZWZvcmUgdGhpcyBwYXRjaDogNjcxMG5zCmFmdGVyIHRoaXMgcGF0Y2g6
IDcxOTBucywgaW5jcmVhc2UgNDgwbnMuCgpkb19zeXNjYWxsXzY0KCkgdGltZSB3aXRoIENJUyBy
dWxlcyB3aXRob3V0IGNobW9kIHJ1bGU6CmJlZm9yZSB0aGlzIHBhdGNoOiA2NzEwbnMKYWZ0ZXIg
dGhpcyBwYXRjaDogNTMxMm5zLCByZWR1Y2UgMTM5OG5zLgoKZG9fc3lzY2FsbF82NCgpIHRpbWUg
d2l0aCAxMCBydWxlczoKYmVmb3JlIHRoaXMgcGF0Y2g6IDUzODJucwphZnRlciB0aGlzIHBhdGNo
OiA1MjE3bnMsIHJlZHVjZSAxNjVucy4KCmRvX3N5c2NhbGxfNjQoKSB0aW1lIHdpdGggMSBydWxl
OgpiZWZvcmUgdGhpcyBwYXRjaDogNTM2MW5zCmFmdGVyIHRoaXMgcGF0Y2g6IDUyNDJucywgcmVk
dWNlIDExOW5zLgoKZG9fc3lzY2FsbF82NCgpIHRpbWUgd2l0aCBubyBydWxlczoKYmVmb3JlIHRo
aXMgcGF0Y2g6IDQ3MzVucwphZnRlciB0aGlzIHBhdGNoOiA0ODA0bnMsIGluY3JlYXNlIDY5bnMK
CkFuYWx5c2U6CldpdGggbm8gcnVsZSwgdGhpcyBwYXRjaCBoYXMgbm8gZWZmZWN0LiBUaGUgZGlm
ZmVyZW5jZSBkYXRhIGlzIGJlY2F1c2Ugb2Ygc3lzdGVtIGppdHRlci4KQW5kIEkgZmluZ2VyIG91
dCB3aHkgd2l0aCBDSVMgcnVsZXMgdGhpcyBwYXRjaCBoYXMgbmVnYXRpdmUgaW1wYWN0LiAKQmVj
YXVzZSBDSVMgcnVsZXMgYXVkaXQgc3lzY2FsbCBjaG1vZCwgYW5kIEkgdGVzdCB3aXRoICJjaG1v
ZCBzeXNjYWxsIi4gCkFuZCBhZnRlciBJIGRlbGV0ZSB0aGUgMiBjaG1vZCBydWxlcyBpbiBDSVMs
IHBlcmZvcm1hbmNlIGlzIG11Y2ggYmV0dGVyLgoKU3VtbWFyaXplOiAKSWYgc3lzdGVtIHNwZW5k
IG11Y2ggbW9yZSB0aW1lIG9uIHN5c2NhbGxzIHRoYXQgZG9uJ3QgbmVlZCB0byBiZSBhdWRpdGVk
IHRoYW4gc3lzY2FsbHMgbmVlZCB0byBiZSwgdGhpcyBwYXRjaCBoYXMgb2J2aW91c2x5IGltcHJv
dmVtZW50LgoKLS0tLS0tLS0tLS0tLS0tLS0tT3JpZ2luYWwgTWFpbC0tLS0tLS0tLS0tLS0tLS0t
LQpTZW5kZXI6IFBhdWxNb29yZQpUbzogeWFuZyB5YW5nMTAxOTIwMjE7CkNDOiBsaW51eC1hdWRp
dEByZWRoYXQuY29tO2xpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7CkRhdGU6IDIwMjEvMDEv
MjMgMDE6MzEKU3ViamVjdDogUmU6Rnc6UmU6Rnc6UmU6W1JGQyx2MSwxLzFdIGF1ZGl0OiBzcGVl
ZCB1cCBzeXNjYWxsIHJ1bGUgbWF0Y2ggd2hpbGUgZXhpdGluZyBzeXNjYWxsCk9uIFRodSwgSmFu
IDIxLCAyMDIxIGF0IDk6MjUgQU0gPHlhbmcueWFuZzI5QHp0ZS5jb20uY24+IHdyb3RlOgo+Cj4g
VGhhbmtzIGZvciByZXBseSwgSSBoYXZlIHNlbnQgYSBuZXcgcGF0Y2ggd2l0aCBiZXR0ZXIgcGVy
Zm9ybWFuY2UuCj4gVGhlIHYxIHBhdGNoIHVzZXMgbXV0ZXgoKSBpcyBub3QgbmVjZXNzYXJ5Lgo+
Cj4gUGVyZm9ybWFuY2UgbWVhc3VyZW1lbnRzOgo+IDEuRW52aXJvbm1lbnQKPiBDUFU6IEludGVs
KFIpIENvcmUoVE0pIGk3LTY3MDAgQ1BVIEAgMy40MEdIego+IExpbnV4IGtlcm5lbCB2ZXJzaW9u
OiA1LjExLXJjMwo+IEF1ZGl0IHZlcnNpb246IDIuOC40CgouLi4uCgo+IDIuMiBTeXNjYWxsIGFi
c29sdXRlIHRpbWUKPiBUZXN0IG1ldGhvZDoKPiBVc2Uga3RpbWVfZ2V0X3JlYWxfdHM2NCgpIGlu
IGRvX3N5c2NhbGxfNjQoKSB0byBjYWxjdWxhdGUgdGltZS4KPiBSdW4gY29tbWFuZCAiY2htb2Qg
Nzc3IC9ldGMvZnN0YWIiIHdpdGggY2hvd24gcnVsZXMuIEVhY2ggdGVzdCAxMHRpbWVzIGFuZCBn
ZXQgYXZlcmFnZS4KPgo+IGRvX3N5c2NhbGxfNjQoKSB0aW1lIHdpdGggMTAwIHJ1bGVzOgo+IGJl
Zm9yZSB0aGlzIHBhdGNoOiA3NjA0bnMKPiBhZnRlciB0aGlzIHBhdGNoOiA1MjQ0bnMsIHJlZHVj
ZSAyMzYwbnMuCj4KPiBkb19zeXNjYWxsXzY0KCkgdGltZSB3aXRoIENJUyBydWxlczoKPiBiZWZv
cmUgdGhpcyBwYXRjaDogNjcxMG5zCj4gYWZ0ZXIgdGhpcyBwYXRjaDogNzI5M25zLCBpbmNyZWFz
ZSA1ODNucy4KPgo+IGRvX3N5c2NhbGxfNjQoKSB0aW1lIHdpdGggMTAgcnVsZXM6Cj4gYmVmb3Jl
IHRoaXMgcGF0Y2g6IDUzODJucwo+IGFmdGVyIHRoaXMgcGF0Y2g6IDUxNzFucywgcmVkdWNlIDIx
MW5zLgo+Cj4gZG9fc3lzY2FsbF82NCgpIHRpbWUgd2l0aCAxIHJ1bGU6Cj4gYmVmb3JlIHRoaXMg
cGF0Y2g6IDUzNjFucwo+IGFmdGVyIHRoaXMgcGF0Y2g6IDUzNzVucywgaW5jcmVhc2UgMTRucy4K
Pgo+IGRvX3N5c2NhbGxfNjQoKSB0aW1lIHdpdGggbm8gcnVsZXM6Cj4gYmVmb3JlIHRoaXMgcGF0
Y2g6IDQ3MzVucwo+IGFmdGVyIHRoaXMgcGF0Y2g6IDQ4MDRucywgaW5jcmVhc2UgNjlucy4KPgo+
IEFuYWx5c2U6Cj4gV2l0aCBhIGZldyBydWxlcywgcGVyZm9ybWFuY2UgaXMgY2xvc2UuCj4gV2l0
aCAxMDAgcnVsZXMsIHBlcmZvcm1hbmNlIGlzIGJldHRlciwgYnV0IHdpdGggQ0lTIHJ1bGVzIHBl
cmZvcm1hbmNlIHJlZ3Jlc3MuIE1heWJlIHJlbGV2YW50IHRvIGNlcnRhaW4gc3lzY2FsbC4KClRo
ZXNlIG51bWJlcnMgYXJlbid0IHBhcnRpY3VsYXJseSBnb29kIGluIG15IG9waW5pb24sIHRoZSBu
ZWdhdGl2ZQppbXBhY3Qgb2YgdGhlIGNoYW5nZSB0byBhIHNtYWxsIG51bWJlciBvZiBydWxlcyBh
bmQgdG8gdGhlIENJUyBydWxlc2V0CmlzIG5vdCBhIGdvb2QgdGhpbmcuICBJdCBhbHNvIHNob3Vs
ZCBiZSBzYWlkIHRoYXQgeW91IGFyZSBpbmNyZWFzaW5nCnRoZSBtZW1vcnkgZm9vdHByaW50LCBl
dmVuIGlmIGl0IGlzIHJlbGF0aXZlbHkgc21hbGwuCgpIb3dldmVyLCBpZiB3ZSB0YWtlIGEgc3Rl
cCBiYWNrIGFuZCBsb29rIGF0IHRoZSBtb3RpdmF0aW9uIGZvciB0aGlzCndvcmsgSSB3b25kZXIg
aWYgdGhlcmUgYXJlIHNvbWUgdGhpbmdzIHdlIGNhbiBkbyB0byBpbXByb3ZlIHRoZQpwZXItc3lz
Y2FsbCBydWxlIHByb2Nlc3NpbmcgcGVyZm9ybWFuY2UuICBPbiB0aGluZyB0aGF0IGp1bXBlZCBv
dXQKanVzdCBub3cgd2FzIHRoaXMgY29kZSBpbiBfX2F1ZGl0X3N5c2NhbGxfZXhpdCgpOgoKdm9p
ZCBfX2F1ZGl0X3N5c2NhbGxfZXhpdChpbnQgc3VjY2VzcywgbG9uZyByZXR1cm5fY29kZSkKewoK
LyogLi4uICovCgovKgoqIHdlIG5lZWQgdG8gZml4IHVwIHRoZSByZXR1cm4gY29kZSBpbiB0aGUg
YXVkaXQgbG9ncyBpZiB0aGUKKiBhY3R1YWwgcmV0dXJuIGNvZGVzIGFyZSBsYXRlciBnb2luZyB0
byBiZSBmaXhlZCB1cCBieSB0aGUKKiBhcmNoIHNwZWNpZmljIHNpZ25hbCBoYW5kbGVycyAuLi4g
Ki8KaWYgKHVubGlrZWx5KHJldHVybl9jb2RlIDw9IC1FUkVTVEFSVFNZUykgJiYKKHJldHVybl9j
b2RlID49IC1FUkVTVEFSVF9SRVNUQVJUQkxPQ0spICYmCihyZXR1cm5fY29kZSAhPSAtRU5PSU9D
VExDTUQpKQpjb250ZXh0LT5yZXR1cm5fY29kZSA9IC1FSU5UUjsKZWxzZQpjb250ZXh0LT5yZXR1
cm5fY29kZSAgPSByZXR1cm5fY29kZTsKCmF1ZGl0X2ZpbHRlcl9zeXNjYWxsKGN1cnJlbnQsIGNv
bnRleHQsCiZhdWRpdF9maWx0ZXJfbGlzdFtBVURJVF9GSUxURVJfRVhJVF0pOwphdWRpdF9maWx0
ZXJfaW5vZGVzKGN1cnJlbnQsIGNvbnRleHQpOwppZiAoY29udGV4dC0+Y3VycmVudF9zdGF0ZSA9
PSBBVURJVF9SRUNPUkRfQ09OVEVYVCkKYXVkaXRfbG9nX2V4aXQoKTsKfQoKLi4uLiBpbiB0aGUg
c25pcHBldCBhYm92ZSB0aGUgYXVkaXRfZmlsdGVyX2lub2RlcygpIGZ1bmN0aW9uL3J1bGVzIGFy
ZQpnaXZlbiBwcmlvcml0eSBvdmVyIHRoZSBzeXNjYWxsIHJ1bGVzIGluCmF1ZGl0X2ZpbHRlcl9z
eXNjYWxsKEFVRElUX0ZJTFRFUl9FWElUKSwgc28gd2h5IG5vdCBmaXJzdCBleGVjdXRlCmF1ZGl0
X2ZpbHRlcl9pbm9kZXMoKSBhbmQgb25seSBleGVjdXRlCmF1ZGl0X2ZpbHRlcl9zeXNjYWxsKEFV
RElUX0ZJTFRFUl9FWElUKSBpZiBuZWNlc3Nhcnk/ICBJdCBtYXkgYmUgdGhhdApJJ20gbWlzc2lu
ZyBzb21ldGhpbmcgb24gdGhpcyBxdWljayBsb29rIGF0IHRoZSBjb2RlLCBidXQgSSB0aGluayBp
dAppcyB3b3J0aCBpbnZlc3RpZ2F0aW5nLiAgSXQncyBhbHNvIHBvc3NpYmxlIHRoZXJlIGFyZSBv
dGhlciBzaW1pbGFyCmltcHJvdmVtZW50cyB0byBtYWRlLgoKVGhlcmUgaXMgc2ltaWxhciBjb2Rl
IGluIF9fYXVkaXRfZnJlZSgpIGJ1dCB0aGF0IHNob3VsZCBiZSBsZXNzCnBlcmZvcm1hbmNlIGNy
aXRpY2FsLgoKLS0KcGF1bCBtb29yZQp3d3cucGF1bC1tb29yZS5jb20=
--=====_003_next=====--

--=====_001_next=====
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--=====_001_next=====--

