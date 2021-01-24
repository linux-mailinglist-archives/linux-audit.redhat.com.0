Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE1F3025FF
	for <lists+linux-audit@lfdr.de>; Mon, 25 Jan 2021 15:05:44 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-FInmgL0FNEqgv90fp1pVFw-1; Mon, 25 Jan 2021 09:05:41 -0500
X-MC-Unique: FInmgL0FNEqgv90fp1pVFw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 006888D82BC;
	Mon, 25 Jan 2021 14:03:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 258416F999;
	Mon, 25 Jan 2021 14:03:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 23B4F4BB7B;
	Mon, 25 Jan 2021 14:02:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10ODKI8e023692 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 24 Jan 2021 08:20:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id ABA3A2166B28; Sun, 24 Jan 2021 13:20:18 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5DC62166B2F
	for <linux-audit@redhat.com>; Sun, 24 Jan 2021 13:20:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 716A2800889
	for <linux-audit@redhat.com>; Sun, 24 Jan 2021 13:20:16 +0000 (UTC)
Received: from mxct.zte.com.cn (mx7.zte.com.cn [202.103.147.169]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-159-sRT-RBQmNcK8yYN5zrDBSw-1; Sun, 24 Jan 2021 08:20:12 -0500
X-MC-Unique: sRT-RBQmNcK8yYN5zrDBSw-1
Received: from mse-fl2.zte.com.cn (unknown [10.30.14.239])
	by Forcepoint Email with ESMTPS id 5C28DFB71A25118BDB46;
	Sun, 24 Jan 2021 21:04:06 +0800 (CST)
Received: from kjyxapp01.zte.com.cn ([10.30.12.200])
	by mse-fl2.zte.com.cn with SMTP id 10OD42Ts028216;
	Sun, 24 Jan 2021 21:04:02 +0800 (GMT-8)
	(envelope-from yang.yang29@zte.com.cn)
Received: from mapi (kjyxapp03[null]) by mapi (Zmail) with MAPI id mid14;
	Sun, 24 Jan 2021 21:04:01 +0800 (CST)
Date: Sun, 24 Jan 2021 21:04:01 +0800 (CST)
X-Zmail-TransId: 2b05600d704148435f53
Message-ID: <202101242104019221924@zte.com.cn>
Mime-Version: 1.0
From: <yang.yang29@zte.com.cn>
To: <paul@paul-moore.com>
Subject: =?UTF-8?B?W1JGQyx2MywxLzFdIGF1ZGl0OiBzcGVlZCB1cCBzeXNjYWxsIHJ1bGUgZmlsdGVyaW5n?=
X-MAIL: mse-fl2.zte.com.cn 10OD42Ts028216
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

RnJvbSA4NWIzZWNjZjdmMTJiMDkxYjc4Y2M1YmE4YWJmYWY3NTljZjAzMzRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBZYW5nIFlhbmcgPHlhbmcueWFuZzI5QHp0ZS5jb20uY24+CkRh
dGU6IFN1biwgMjQgSmFuIDIwMjEgMjA6NDA6NTAgKzA4MDAKU3ViamVjdDogW1BBVENIXSBhdWRp
dDogc3BlZWQgdXAgc3lzY2FsbCBydWxlIGZpbHRlcmluZwphdWRpdF9maWx0ZXJfc3lzY2FsbCgp
IHRyYXZlcnNlcyBzdHJ1Y3QgbGlzdF9oZWFkIGF1ZGl0X2ZpbHRlcl9saXN0IHRvIGZpbmQKb3V0
IHdoZXRoZXIgY3VycmVudCBzeXNjYWxsIG1hdGNoIG9uZSBydWxlLiBUaGlzIHRha2VzIG8obiks
IHdoaWNoIGlzIG5vdApuZWNlc3NhcnksIHNwZWNpYWxseSBmb3IgdXNlciB3aG8gYWRkIGEgdmVy
eSBmZXcgc3lzY2FsbCBydWxlcy4gT24gdGhlIG90aGVyCmhhbmQsIHVzZXIgbWF5IG5vdCBtdWNo
IGNhcmUgYWJvdXQgcnVsZSBhZGQvZGVsZXRlIHNwZWVkLiBTbyBkbyBvKG4pCmNhbGN1bGF0ZXMg
d2hlbiBydWxlIGNoYW5nZXMsIGFuZCBlYXNlIHRoZSBidXJkZW4gb2YgYXVkaXRfZmlsdGVyX3N5
c2NhbGwoKS4KCkRlZmluZSBhdWRpdF9ydWxlX3N5c2NhbGxfbWFza1tOUl9zeXNjYWxsc10sIGV2
ZXJ5IGVsZW1lbnQgc3RhbmRzIGZvcgpvbmUgc3lzY2FsbC5hdWRpdF9ydWxlX3N5c2NhbGxfbWFz
a1tuXSA9PSAwIGluZGljYXRlcyBubyBydWxlIGNhcmVzIGFib3V0CnN5c2NhbGwgbiwgc28gd2Ug
Y2FuIGF2b2lkIHVubmVjZXNzYXJ5IGNhbGxpbmcgYXVkaXRfZmlsdGVyX3N5c2NhbGwoKS4KYXVk
aXRfcnVsZV9zeXNjYWxsX21hc2tbbl0gPiAwIGluZGljYXRlcyBhdCBsZWFzdCBvbmUgcnVsZSBj
YXJlcyBhYm91dApzeXNjYWxsIG4sIHRoZW4gY2FsbHMgYXVkaXRfZmlsdGVyX3N5c2NhbGwoKS4g
VXBkYXRlCmF1ZGl0X3J1bGVfc3lzY2FsbF9tYXNrW25dIHdoZW4gc3lzY2FsbCBydWxlIGNoYW5n
ZXMuCgpTaWduZWQtb2ZmLWJ5OiBZYW5nIFlhbmcgPHlhbmcueWFuZzI5QHp0ZS5jb20uY24+Ci0t
LQogaW5jbHVkZS9saW51eC9hdWRpdC5oIHwgIDMgKysrCiBrZXJuZWwvYXVkaXRmaWx0ZXIuYyAg
fCAgNCArKysrCiBrZXJuZWwvYXVkaXRzYy5jICAgICAgfCAzNiArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKy0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2F1ZGl0LmggYi9pbmNsdWRl
L2xpbnV4L2F1ZGl0LmgKaW5kZXggODJiN2MxMS4uODY3Mjg0YyAxMDA2NDQKLS0tIGEvaW5jbHVk
ZS9saW51eC9hdWRpdC5oCisrKyBiL2luY2x1ZGUvbGludXgvYXVkaXQuaApAQCAtMzAyLDYgKzMw
Miw3IEBAIGV4dGVybiB2b2lkIGF1ZGl0X3NlY2NvbXAodW5zaWduZWQgbG9uZyBzeXNjYWxsLCBs
b25nIHNpZ25yLCBpbnQgY29kZSk7CiBleHRlcm4gdm9pZCBhdWRpdF9zZWNjb21wX2FjdGlvbnNf
bG9nZ2VkKGNvbnN0IGNoYXIgKm5hbWVzLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbnN0IGNoYXIgKm9sZF9uYW1lcywgaW50IHJlcyk7CiBleHRlcm4gdm9pZCBf
X2F1ZGl0X3B0cmFjZShzdHJ1Y3QgdGFza19zdHJ1Y3QgKnQpOworZXh0ZXJuIHZvaWQgYXVkaXRf
cnVsZV9zeXNjYWxsX21hc2tfdXBkYXRlKHN0cnVjdCBhdWRpdF9rcnVsZSBydWxlLCBib29sIGFk
ZCk7Cgogc3RhdGljIGlubGluZSB2b2lkIGF1ZGl0X3NldF9jb250ZXh0KHN0cnVjdCB0YXNrX3N0
cnVjdCAqdGFzaywgc3RydWN0IGF1ZGl0X2NvbnRleHQgKmN0eCkKIHsKQEAgLTU5OSw2ICs2MDAs
OCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgYXVkaXRfc2VjY29tcCh1bnNpZ25lZCBsb25nIHN5c2Nh
bGwsIGxvbmcgc2lnbnIsIGludCBjb2RlKQogc3RhdGljIGlubGluZSB2b2lkIGF1ZGl0X3NlY2Nv
bXBfYWN0aW9uc19sb2dnZWQoY29uc3QgY2hhciAqbmFtZXMsCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKm9sZF9uYW1lcywgaW50IHJl
cykKIHsgfQorc3RhdGljIGlubGluZSB2b2lkIGF1ZGl0X3J1bGVfc3lzY2FsbF9tYXNrX3VwZGF0
ZShzdHJ1Y3QgYXVkaXRfa3J1bGUgcnVsZSwgYm9vbCBhZGQpCit7fQogc3RhdGljIGlubGluZSB2
b2lkIGF1ZGl0X2lwY19vYmooc3RydWN0IGtlcm5faXBjX3Blcm0gKmlwY3ApCiB7IH0KIHN0YXRp
YyBpbmxpbmUgdm9pZCBhdWRpdF9pcGNfc2V0X3Blcm0odW5zaWduZWQgbG9uZyBxYnl0ZXMsIHVp
ZF90IHVpZCwKZGlmZiAtLWdpdCBhL2tlcm5lbC9hdWRpdGZpbHRlci5jIGIva2VybmVsL2F1ZGl0
ZmlsdGVyLmMKaW5kZXggMzMzYjNiYy4uMGIyYThkNSAxMDA2NDQKLS0tIGEva2VybmVsL2F1ZGl0
ZmlsdGVyLmMKKysrIGIva2VybmVsL2F1ZGl0ZmlsdGVyLmMKQEAgLTk1Nyw2ICs5NTcsOCBAQCBz
dGF0aWMgaW5saW5lIGludCBhdWRpdF9hZGRfcnVsZShzdHJ1Y3QgYXVkaXRfZW50cnkgKmVudHJ5
KQogICAgICAgICAgICAgICAgcmV0dXJuIGVycjsKICAgICAgICB9CgorICAgICAgIGF1ZGl0X3J1
bGVfc3lzY2FsbF9tYXNrX3VwZGF0ZShlbnRyeS0+cnVsZSwgdHJ1ZSk7CisKICAgICAgICBpZiAo
d2F0Y2gpIHsKICAgICAgICAgICAgICAgIC8qIGF1ZGl0X2ZpbHRlcl9tdXRleCBpcyBkcm9wcGVk
IGFuZCByZS10YWtlbiBkdXJpbmcgdGhpcyBjYWxsICovCiAgICAgICAgICAgICAgICBlcnIgPSBh
dWRpdF9hZGRfd2F0Y2goJmVudHJ5LT5ydWxlLCAmbGlzdCk7CkBAIC0xMDM1LDYgKzEwMzcsOCBA
QCBpbnQgYXVkaXRfZGVsX3J1bGUoc3RydWN0IGF1ZGl0X2VudHJ5ICplbnRyeSkKICAgICAgICAg
ICAgICAgIGdvdG8gb3V0OwogICAgICAgIH0KCisgICAgICAgYXVkaXRfcnVsZV9zeXNjYWxsX21h
c2tfdXBkYXRlKGUtPnJ1bGUsIGZhbHNlKTsKKwogICAgICAgIGlmIChlLT5ydWxlLndhdGNoKQog
ICAgICAgICAgICAgICAgYXVkaXRfcmVtb3ZlX3dhdGNoX3J1bGUoJmUtPnJ1bGUpOwoKZGlmZiAt
LWdpdCBhL2tlcm5lbC9hdWRpdHNjLmMgYi9rZXJuZWwvYXVkaXRzYy5jCmluZGV4IGNlOGM5ZTIu
LjFiOGZmNGUgMTAwNjQ0Ci0tLSBhL2tlcm5lbC9hdWRpdHNjLmMKKysrIGIva2VybmVsL2F1ZGl0
c2MuYwpAQCAtOTcsNiArOTcsOSBAQCBpbnQgYXVkaXRfbl9ydWxlczsKIC8qIGRldGVybWluZXMg
d2hldGhlciB3ZSBjb2xsZWN0IGRhdGEgZm9yIHNpZ25hbHMgc2VudCAqLwogaW50IGF1ZGl0X3Np
Z25hbHM7CgorLyogd2hldGhlciBvbmUgc3lzY2FsbCBuZWVkcyB0byBiZSBhdWRpdGVkICovCit1
MzIgYXVkaXRfcnVsZV9zeXNjYWxsX21hc2tbTlJfc3lzY2FsbHNdID0gezB9OworCiBzdHJ1Y3Qg
YXVkaXRfYXV4X2RhdGEgewogICAgICAgIHN0cnVjdCBhdWRpdF9hdXhfZGF0YSAgICpuZXh0Owog
ICAgICAgIGludCAgICAgICAgICAgICAgICAgICAgIHR5cGU7CkBAIC03OTksNiArODAyLDI5IEBA
IHN0YXRpYyBpbnQgYXVkaXRfaW5fbWFzayhjb25zdCBzdHJ1Y3QgYXVkaXRfa3J1bGUgKnJ1bGUs
IHVuc2lnbmVkIGxvbmcgdmFsKQogICAgICAgIHJldHVybiBydWxlLT5tYXNrW3dvcmRdICYgYml0
OwogfQoKKy8qKgorICogYXVkaXRfcnVsZV9zeXNjYWxsX21hc2tfdXBkYXRlIC0gdXBkYXRlIHN5
c2NhbGwgbWFzayB3aGVuIGF1ZGl0IHJ1bGUgY2hhbmdlcworICogQHJ1bGU6IGF1ZGl0IHJ1bGUK
KyAqIEBhZGQ6IGFkZCBydWxlIG9yIGRlbGV0ZQorICoKKyAqIENhbGxlciBtdXN0IGhvbGQgYXVk
aXRfZmlsdGVyX211dGV4IHRvIHByZXZlbnQgc3RhbGUgZGF0YS4KKyAqLwordm9pZCBhdWRpdF9y
dWxlX3N5c2NhbGxfbWFza191cGRhdGUoc3RydWN0IGF1ZGl0X2tydWxlIHJ1bGUsIGJvb2wgYWRk
KQoreworICAgICAgIGludCBpOworCisgICAgICAgaWYgKHJ1bGUubGlzdG5yID09IEFVRElUX0ZJ
TFRFUl9FWElUICYmICFydWxlLndhdGNoICYmICFydWxlLnRyZWUpIHsKKyAgICAgICAgICAgICAg
IGZvciAoaSA9IDA7IGkgPCBOUl9zeXNjYWxsczsgaSsrKSB7CisgICAgICAgICAgICAgICAgICAg
ICAgIGlmICh1bmxpa2VseShhdWRpdF9pbl9tYXNrKCZydWxlLCBpKSkpIHsKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBpZiAoYWRkID09IHRydWUpCisgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBhdWRpdF9ydWxlX3N5c2NhbGxfbWFza1tpXSsrOworICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGVsc2UKKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGF1ZGl0X3J1bGVfc3lzY2FsbF9tYXNrW2ldLS07CisgICAgICAgICAgICAg
ICAgICAgICAgIH0KKyAgICAgICAgICAgICAgIH0KKyAgICAgICB9Cit9CisKIC8qIEF0IHN5c2Nh
bGwgZW50cnkgYW5kIGV4aXQgdGltZSwgdGhpcyBmaWx0ZXIgaXMgY2FsbGVkIGlmIHRoZQogICog
YXVkaXRfc3RhdGUgaXMgbm90IGxvdyBlbm91Z2ggdGhhdCBhdWRpdGluZyBjYW5ub3QgdGFrZSBw
bGFjZSwgYnV0IGlzCiAgKiBhbHNvIG5vdCBoaWdoIGVub3VnaCB0aGF0IHdlIGFscmVhZHkga25v
dyB3ZSBoYXZlIHRvIHdyaXRlIGFuIGF1ZGl0CkBAIC0xNjI3LDggKzE2NTMsOSBAQCB2b2lkIF9f
YXVkaXRfZnJlZShzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRzaykKICAgICAgICAgICAgICAgIGNvbnRl
eHQtPnJldHVybl92YWxpZCA9IEFVRElUU0NfSU5WQUxJRDsKICAgICAgICAgICAgICAgIGNvbnRl
eHQtPnJldHVybl9jb2RlID0gMDsKCi0gICAgICAgICAgICAgICBhdWRpdF9maWx0ZXJfc3lzY2Fs
bCh0c2ssIGNvbnRleHQsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmYXVk
aXRfZmlsdGVyX2xpc3RbQVVESVRfRklMVEVSX0VYSVRdKTsKKyAgICAgICAgICAgICAgIGlmICh1
bmxpa2VseShhdWRpdF9ydWxlX3N5c2NhbGxfbWFza1tjb250ZXh0LT5tYWpvcl0pKQorICAgICAg
ICAgICAgICAgICAgICAgICBhdWRpdF9maWx0ZXJfc3lzY2FsbCh0c2ssIGNvbnRleHQsCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZhdWRpdF9maWx0ZXJfbGlz
dFtBVURJVF9GSUxURVJfRVhJVF0pOwogICAgICAgICAgICAgICAgYXVkaXRfZmlsdGVyX2lub2Rl
cyh0c2ssIGNvbnRleHQpOwogICAgICAgICAgICAgICAgaWYgKGNvbnRleHQtPmN1cnJlbnRfc3Rh
dGUgPT0gQVVESVRfUkVDT1JEX0NPTlRFWFQpCiAgICAgICAgICAgICAgICAgICAgICAgIGF1ZGl0
X2xvZ19leGl0KCk7CkBAIC0xNzM1LDggKzE3NjIsOSBAQCB2b2lkIF9fYXVkaXRfc3lzY2FsbF9l
eGl0KGludCBzdWNjZXNzLCBsb25nIHJldHVybl9jb2RlKQogICAgICAgICAgICAgICAgZWxzZQog
ICAgICAgICAgICAgICAgICAgICAgICBjb250ZXh0LT5yZXR1cm5fY29kZSAgPSByZXR1cm5fY29k
ZTsKCi0gICAgICAgICAgICAgICBhdWRpdF9maWx0ZXJfc3lzY2FsbChjdXJyZW50LCBjb250ZXh0
LAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmF1ZGl0X2ZpbHRlcl9saXN0
W0FVRElUX0ZJTFRFUl9FWElUXSk7CisgICAgICAgICAgICAgICBpZiAodW5saWtlbHkoYXVkaXRf
cnVsZV9zeXNjYWxsX21hc2tbY29udGV4dC0+bWFqb3JdKSkKKyAgICAgICAgICAgICAgICAgICAg
ICAgYXVkaXRfZmlsdGVyX3N5c2NhbGwoY3VycmVudCwgY29udGV4dCwKKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmF1ZGl0X2ZpbHRlcl9saXN0W0FVRElUX0ZJ
TFRFUl9FWElUXSk7CiAgICAgICAgICAgICAgICBhdWRpdF9maWx0ZXJfaW5vZGVzKGN1cnJlbnQs
IGNvbnRleHQpOwogICAgICAgICAgICAgICAgaWYgKGNvbnRleHQtPmN1cnJlbnRfc3RhdGUgPT0g
QVVESVRfUkVDT1JEX0NPTlRFWFQpCiAgICAgICAgICAgICAgICAgICAgICAgIGF1ZGl0X2xvZ19l
eGl0KCk7Ci0tCjIuMTUuMg==
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

