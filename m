Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7F596308958
	for <lists+linux-audit@lfdr.de>; Fri, 29 Jan 2021 14:32:52 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-hptH1JcHMPKmqACccV4Xyg-1; Fri, 29 Jan 2021 08:32:49 -0500
X-MC-Unique: hptH1JcHMPKmqACccV4Xyg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EA1A10054FF;
	Fri, 29 Jan 2021 13:32:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7281219C66;
	Fri, 29 Jan 2021 13:32:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 337521809C9F;
	Fri, 29 Jan 2021 13:32:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10TBT7Ik009149 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 29 Jan 2021 06:29:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6DA2C2026D15; Fri, 29 Jan 2021 11:29:07 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 68B1F2026D14
	for <linux-audit@redhat.com>; Fri, 29 Jan 2021 11:29:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E17C9800140
	for <linux-audit@redhat.com>; Fri, 29 Jan 2021 11:29:04 +0000 (UTC)
Received: from mxct.zte.com.cn (mx7.zte.com.cn [202.103.147.169]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-306-Q9p-94vjNb-fLajwg3xynA-1; Fri, 29 Jan 2021 06:29:02 -0500
X-MC-Unique: Q9p-94vjNb-fLajwg3xynA-1
Received: from mse-fl1.zte.com.cn (unknown [10.30.14.238])
	by Forcepoint Email with ESMTPS id 4F02DAF4C2A4DE1E2306;
	Fri, 29 Jan 2021 19:28:58 +0800 (CST)
Received: from kjyxapp05.zte.com.cn ([10.30.12.204])
	by mse-fl1.zte.com.cn with SMTP id 10TBSqSr000663;
	Fri, 29 Jan 2021 19:28:52 +0800 (GMT-8)
	(envelope-from yang.yang29@zte.com.cn)
Received: from mapi (kjyxapp03[null]) by mapi (Zmail) with MAPI id mid14;
	Fri, 29 Jan 2021 19:28:51 +0800 (CST)
Date: Fri, 29 Jan 2021 19:28:51 +0800 (CST)
X-Zmail-TransId: 2b056013f1731cc0a1ef
Message-ID: <202101291928518869829@zte.com.cn>
References: 202101242104019221924@zte.com.cn,
	CAHC9VhQR2+Zz8pzaCp4YJ-r8Tk-RBOuUhXNU=VJaWOw3sbeN+w@mail.gmail.com
Mime-Version: 1.0
From: <yang.yang29@zte.com.cn>
To: <paul@paul-moore.com>
Subject: =?UTF-8?B?Rnc6UmU6W1JGQyx2MywxLzFdIGF1ZGl0OiBzcGVlZCB1cCBzeXNjYWxsIHJ1bGUgZmlsdGVyaW5n?=
X-MAIL: mse-fl1.zte.com.cn 10TBSqSr000663
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 29 Jan 2021 08:32:02 -0500
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

TGV0IG1lIGtub3cgaWYgeW91IGFyZSBnb2luZyB0byBwdXJzdWUgdGhlIHN1Z2dlc3Rpb24gYWJv
dmUgYWJvdXQKcmVvcmRlcmluZyB0aGUgYXVkaXRfZmlsdGVyXyooKSBmdW5jdGlvbnMgYXMgSSds
bCBob2xkIG9mZiBvbiB0aGUKb3RoZXIgY2hhbmdlcy4KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpJIHdpbGwgZm9sbG93IGFsbCB5b3VyIHN1Z2dl
c3Rpb25zLCBkbyB0aGUgbmVjZXNzYXJ5IHRlc3RzLgoKQW5kIGFzIHlvdSBzYWlkLCBmb3IgcmVv
cmRlcmluZyB0aGUgYXVkaXRfZmlsdGVyXyooKSwgdGhlIHBlcmZvcm1hbmNlIAp3b3VsZCBiZSBy
b3VnaGx5IHRoZSBzYW1lIHdoZW4gdGhlcmUgaXMgbm8gbWF0Y2hpbmcgcnVsZS4KU28gSSB0aGlu
a3MgaXQncyBhbm90aGVyIHdheSB0byAgcHJvbW90ZSBwZXJmb3JtYW5jZSwgZGlmZmVyZW50IGZy
b20gCnBhdGNoICJbUkZDLHYzLDEvMV0gYXVkaXQ6IHNwZWVkIHVwIHN5c2NhbGwgcnVsZSBmaWx0
ZXJpbmciLkkgd2lsbCB0cnkgdG8gZml4CiJ3YXN0ZWZ1bCBhbmQgaW5lbGVnYW50ICIgcHJvYmxl
bXMuCgpHcmVhdCB0aGFua3MhCgoKCi0tLS0tLS0tLS0tLS0tLS0tLU9yaWdpbmFsIE1haWwtLS0t
LS0tLS0tLS0tLS0tLS0KU2VuZGVyOiBQYXVsTW9vcmUKVG86IHlhbmcgeWFuZzEwMTkyMDIxOwpD
QzogbGludXgtYXVkaXRAcmVkaGF0LmNvbTtsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOwpE
YXRlOiAyMDIxLzAxLzI4IDEwOjUyClN1YmplY3Q6IFJlOltSRkMsdjMsMS8xXSBhdWRpdDogc3Bl
ZWQgdXAgc3lzY2FsbCBydWxlIGZpbHRlcmluZwpPbiBTdW4sIEphbiAyNCwgMjAyMSBhdCA4OjA0
IEFNIDx5YW5nLnlhbmcyOUB6dGUuY29tLmNuPiB3cm90ZToKPgo+IEZyb20gODViM2VjY2Y3ZjEy
YjA5MWI3OGNjNWJhOGFiZmFmNzU5Y2YwMzM0ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiBG
cm9tOiBZYW5nIFlhbmcgPHlhbmcueWFuZzI5QHp0ZS5jb20uY24+Cj4gRGF0ZTogU3VuLCAyNCBK
YW4gMjAyMSAyMDo0MDo1MCArMDgwMAo+IFN1YmplY3Q6IFtQQVRDSF0gYXVkaXQ6IHNwZWVkIHVw
IHN5c2NhbGwgcnVsZSBmaWx0ZXJpbmcKPiBhdWRpdF9maWx0ZXJfc3lzY2FsbCgpIHRyYXZlcnNl
cyBzdHJ1Y3QgbGlzdF9oZWFkIGF1ZGl0X2ZpbHRlcl9saXN0IHRvIGZpbmQKPiBvdXQgd2hldGhl
ciBjdXJyZW50IHN5c2NhbGwgbWF0Y2ggb25lIHJ1bGUuIFRoaXMgdGFrZXMgbyhuKSwgd2hpY2gg
aXMgbm90Cj4gbmVjZXNzYXJ5LCBzcGVjaWFsbHkgZm9yIHVzZXIgd2hvIGFkZCBhIHZlcnkgZmV3
IHN5c2NhbGwgcnVsZXMuIE9uIHRoZSBvdGhlcgo+IGhhbmQsIHVzZXIgbWF5IG5vdCBtdWNoIGNh
cmUgYWJvdXQgcnVsZSBhZGQvZGVsZXRlIHNwZWVkLiBTbyBkbyBvKG4pCj4gY2FsY3VsYXRlcyB3
aGVuIHJ1bGUgY2hhbmdlcywgYW5kIGVhc2UgdGhlIGJ1cmRlbiBvZiBhdWRpdF9maWx0ZXJfc3lz
Y2FsbCgpLgo+Cj4gRGVmaW5lIGF1ZGl0X3J1bGVfc3lzY2FsbF9tYXNrW05SX3N5c2NhbGxzXSwg
ZXZlcnkgZWxlbWVudCBzdGFuZHMgZm9yCj4gb25lIHN5c2NhbGwuYXVkaXRfcnVsZV9zeXNjYWxs
X21hc2tbbl0gPT0gMCBpbmRpY2F0ZXMgbm8gcnVsZSBjYXJlcyBhYm91dAo+IHN5c2NhbGwgbiwg
c28gd2UgY2FuIGF2b2lkIHVubmVjZXNzYXJ5IGNhbGxpbmcgYXVkaXRfZmlsdGVyX3N5c2NhbGwo
KS4KPiBhdWRpdF9ydWxlX3N5c2NhbGxfbWFza1tuXSA+IDAgaW5kaWNhdGVzIGF0IGxlYXN0IG9u
ZSBydWxlIGNhcmVzIGFib3V0Cj4gc3lzY2FsbCBuLCB0aGVuIGNhbGxzIGF1ZGl0X2ZpbHRlcl9z
eXNjYWxsKCkuIFVwZGF0ZQo+IGF1ZGl0X3J1bGVfc3lzY2FsbF9tYXNrW25dIHdoZW4gc3lzY2Fs
bCBydWxlIGNoYW5nZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBZYW5nIFlhbmcgPHlhbmcueWFuZzI5
QHp0ZS5jb20uY24+Cj4gLS0tCj4gIGluY2x1ZGUvbGludXgvYXVkaXQuaCB8ICAzICsrKwo+ICBr
ZXJuZWwvYXVkaXRmaWx0ZXIuYyAgfCAgNCArKysrCj4gIGtlcm5lbC9hdWRpdHNjLmMgICAgICB8
IDM2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLQo+ICAzIGZpbGVzIGNoYW5n
ZWQsIDM5IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCi4uLi4KPiBkaWZmIC0tZ2l0IGEv
a2VybmVsL2F1ZGl0c2MuYyBiL2tlcm5lbC9hdWRpdHNjLmMKPiBpbmRleCBjZThjOWUyLi4xYjhm
ZjRlIDEwMDY0NAo+IC0tLSBhL2tlcm5lbC9hdWRpdHNjLmMKPiArKysgYi9rZXJuZWwvYXVkaXRz
Yy5jCj4gQEAgLTE2MjcsOCArMTY1Myw5IEBAIHZvaWQgX19hdWRpdF9mcmVlKHN0cnVjdCB0YXNr
X3N0cnVjdCAqdHNrKQo+ICAgICAgICAgICAgICAgICBjb250ZXh0LT5yZXR1cm5fdmFsaWQgPSBB
VURJVFNDX0lOVkFMSUQ7Cj4gICAgICAgICAgICAgICAgIGNvbnRleHQtPnJldHVybl9jb2RlID0g
MDsKPgo+IC0gICAgICAgICAgICAgICBhdWRpdF9maWx0ZXJfc3lzY2FsbCh0c2ssIGNvbnRleHQs
Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZhdWRpdF9maWx0ZXJfbGlz
dFtBVURJVF9GSUxURVJfRVhJVF0pOwo+ICsgICAgICAgICAgICAgICBpZiAodW5saWtlbHkoYXVk
aXRfcnVsZV9zeXNjYWxsX21hc2tbY29udGV4dC0+bWFqb3JdKSkKPiArICAgICAgICAgICAgICAg
ICAgICAgICBhdWRpdF9maWx0ZXJfc3lzY2FsbCh0c2ssIGNvbnRleHQsCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmF1ZGl0X2ZpbHRlcl9saXN0W0FVRElU
X0ZJTFRFUl9FWElUXSk7Cj4gICAgICAgICAgICAgICAgIGF1ZGl0X2ZpbHRlcl9pbm9kZXModHNr
LCBjb250ZXh0KTsKPiAgICAgICAgICAgICAgICAgaWYgKGNvbnRleHQtPmN1cnJlbnRfc3RhdGUg
PT0gQVVESVRfUkVDT1JEX0NPTlRFWFQpCj4gICAgICAgICAgICAgICAgICAgICAgICAgYXVkaXRf
bG9nX2V4aXQoKTsKPiBAQCAtMTczNSw4ICsxNzYyLDkgQEAgdm9pZCBfX2F1ZGl0X3N5c2NhbGxf
ZXhpdChpbnQgc3VjY2VzcywgbG9uZyByZXR1cm5fY29kZSkKPiAgICAgICAgICAgICAgICAgZWxz
ZQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRleHQtPnJldHVybl9jb2RlICA9IHJldHVy
bl9jb2RlOwo+Cj4gLSAgICAgICAgICAgICAgIGF1ZGl0X2ZpbHRlcl9zeXNjYWxsKGN1cnJlbnQs
IGNvbnRleHQsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZhdWRpdF9m
aWx0ZXJfbGlzdFtBVURJVF9GSUxURVJfRVhJVF0pOwo+ICsgICAgICAgICAgICAgICBpZiAodW5s
aWtlbHkoYXVkaXRfcnVsZV9zeXNjYWxsX21hc2tbY29udGV4dC0+bWFqb3JdKSkKPiArICAgICAg
ICAgICAgICAgICAgICAgICBhdWRpdF9maWx0ZXJfc3lzY2FsbChjdXJyZW50LCBjb250ZXh0LAo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZhdWRpdF9maWx0
ZXJfbGlzdFtBVURJVF9GSUxURVJfRVhJVF0pOwo+ICAgICAgICAgICAgICAgICBhdWRpdF9maWx0
ZXJfaW5vZGVzKGN1cnJlbnQsIGNvbnRleHQpOwo+ICAgICAgICAgICAgICAgICBpZiAoY29udGV4
dC0+Y3VycmVudF9zdGF0ZSA9PSBBVURJVF9SRUNPUkRfQ09OVEVYVCkKPiAgICAgICAgICAgICAg
ICAgICAgICAgICBhdWRpdF9sb2dfZXhpdCgpOwpMb29raW5nIGF0IHRoaXMgcmV2aXNpb24gSSBi
ZWxpZXZlIEkgbWF5IG5vdCBoYXZlIGJlZW4gYXMgY2xlYXIgYXMgSQpzaG91bGQgaGF2ZSBiZWVu
IHdpdGggbXkgbGFzdCBzdWdnZXN0aW9uLiAgTGV0IG1lIHRyeSB0byBkbyBiZXR0ZXIKaGVyZS4K
VGh1cyBmYXIgSSdtIG5vdCB2ZXJ5IGhhcHB5IHdpdGggdGhlIGF1ZGl0X3J1bGVfc3lzY2FsbF9t
YXNrW10KYWRkaXRpb25zOyBpdCBsb29rcyBib3RoIHdhc3RlZnVsIGFuZCBpbmVsZWdhbnQgdG8g
bWUgYXQgdGhlIG1vbWVudC4KSSB3b3VsZCBtdWNoIHJhdGhlciBzZWUgaWYgd2UgY2FuIGltcHJv
dmUgdGhlIGV4aXN0aW5nIGNvZGUgYnkgZml4aW5nCmluZWZmaWNpZW5jaWVzIGluIGhvdyB3ZSBo
YW5kbGUgdGhlIHJ1bGUgZmlsdGVyaW5nLiAgVGhpcyBpcyB3aHkgbXkKcHJldmlvdXMgY29tbWVu
dHMgc3VnZ2VzdGVkIGxvb2tpbmcgYXQgdGhlIGF1ZGl0X2ZpbHRlcl9zeXNjYWxsKCkgYW5kCmF1
ZGl0X2ZpbHRlcl9pbm9kZXMoKSBjYWxscyBpbiBfX2F1ZGl0X2ZyZWUoKSBhbmQKX19hdWRpdF9z
eXNjYWxsX2V4aXQoKSwgdGhlIGxhdHRlciBvZiBjb3Vyc2UgYmVpbmcgbW9yZSBpbXBvcnRhbnQg
ZHVlCnRvIGl0cyBmcmVxdWVuY3kuCkluIGJvdGggY2FzZXMgYW4gYXVkaXRfZmlsdGVyX2lub2Rl
KCkgQVVESVRfUkVDT1JEX0NPTlRFWFQgZGVjaXNpb24KdGFrZXMgcHJlY2VkZW5jZSBvdmVyIGFu
eSBhdWRpdF9maWx0ZXJfc3lzY2FsbCgpIGRlY2lzaW9uIGR1ZSB0byB0aGUKY29kZSBiZWluZyBz
dHJ1Y3R1cmVkIGFzIHNvOgphdWRpdF9maWx0ZXJfc3lzY2FsbCguLi4pOwphdWRpdF9maWx0ZXJf
aW5vZGVzKC4uLik7CmlmIChzdGF0ZSA9PSBBVURJVF9SRUNPUkRfQ09OVEVYVCkKYXVkaXRfbG9n
X2V4aXQoKTsKLi4uLiBteSBzdWdnZXN0aW9uIGlzIHRvIGludmVzdGlnYXRlIHdoYXQgcGVyZm9y
bWFuY2UgYmVuZWZpdHMgbWlnaHQgYmUKaGFkIGJ5IGxldmVyYWdpbmcgdGhpcyBwcmVjZWRlbmNl
LCBmb3IgZXhhbXBsZToKYXVkaXRfZmlsdGVyX2lub2RlcyguLi4pOwppZiAoc3RhdGUgIT0gQVVE
SVRfUkVDT1JEX0NPTlRFWFQpCmF1ZGl0X2ZpbHRlcl9zeXNjYWxsKC4uLik7CmlmIChzdGF0ZSA9
PSBBVURJVF9SRUNPUkRfQ09OVEVYVCkKYXVkaXRfbG9nX2V4aXQoKTsKLi4uLiBvZiBjb3Vyc2Ug
SSB3b3VsZCBleHBlY3QgdGhlIHBlcmZvcm1hbmNlIHRvIGJlIHJvdWdobHkgdGhlIHNhbWUKd2hl
biB0aGVyZSBpcyBubyBtYXRjaGluZyBydWxlLCBidXQgSSB0aGluayB0aGVyZSB3b3VsZCBiZSBh
CnBlcmZvcm1hbmNlIHdoZW4gaW4gdGhvc2UgY2FzZXMgd2hlcmUgYSB3YXRjaGVkIGlub2RlIHRy
aWdnZXJzIGFuCmF1ZGl0IHJ1bGUuCkJleW9uZCB0aGF0LCB0aGVyZSBpcyBwcm9iYWJseSB3b3Jr
IHdlIGNvdWxkIGRvIHRvIGNvbWJpbmUgc29tZQphc3BlY3RzIG9mIGF1ZGl0X2ZpbHRlcl9zeXNj
YWxsKCkgYW5kIGF1ZGl0X2ZpbHRlcl9pbm9kZXMoKSB0bwplbGltaW5hdGUgc29tZSByZWR1bmRh
bmN5LCBlLmcuIHJlZHVjZSB0aGUgbnVtYmVyIG9mIGF1ZGl0X2luX21hc2soKQpjYWxscy4gIEFj
dHVhbGx5IGxvb2tpbmcgYSBiaXQgY2xvc2VyIHRoZXJlIGFyZSBhIG51bWJlciBvZgppbXByb3Zl
bWVudHMgdGhhdCBjb3VsZCBsaWtlbHkgYmUgbWFkZSwgc29tZSBtaWdodCBoYXZlIHNvbWUKcGVy
Zm9ybWFuY2UgaW1wYWN0cy4KTGV0IG1lIGtub3cgaWYgeW91IGFyZSBnb2luZyB0byBwdXJzdWUg
dGhlIHN1Z2dlc3Rpb24gYWJvdmUgYWJvdXQKcmVvcmRlcmluZyB0aGUgYXVkaXRfZmlsdGVyXyoo
KSBmdW5jdGlvbnMgYXMgSSdsbCBob2xkIG9mZiBvbiB0aGUKb3RoZXIgY2hhbmdlcy4KLS0KcGF1
bCBtb29yZQp3d3cucGF1bC1tb29yZS5jb20=
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

