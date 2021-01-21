Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0E9972FEC95
	for <lists+linux-audit@lfdr.de>; Thu, 21 Jan 2021 15:04:19 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-SIcIxKfROwKzqMGSU5ajUg-1; Thu, 21 Jan 2021 09:04:16 -0500
X-MC-Unique: SIcIxKfROwKzqMGSU5ajUg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E9FB8E0AC1;
	Thu, 21 Jan 2021 14:04:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B793B5D6AD;
	Thu, 21 Jan 2021 14:03:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 750A44BB7B;
	Thu, 21 Jan 2021 14:03:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10LDsYP8009968 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 21 Jan 2021 08:54:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7250FD7E04; Thu, 21 Jan 2021 13:54:34 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C2E2D7DFC
	for <linux-audit@redhat.com>; Thu, 21 Jan 2021 13:54:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFAA3858281
	for <linux-audit@redhat.com>; Thu, 21 Jan 2021 13:54:31 +0000 (UTC)
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.217.80.70]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-146-grNvoryvOqyaE74lFfh8vQ-1;
	Thu, 21 Jan 2021 08:54:29 -0500
X-MC-Unique: grNvoryvOqyaE74lFfh8vQ-1
Received: from mse-fl1.zte.com.cn (unknown [10.30.14.238])
	by Forcepoint Email with ESMTPS id 4C2FB36228A74BA4B671;
	Thu, 21 Jan 2021 21:54:26 +0800 (CST)
Received: from kjyxapp04.zte.com.cn ([10.30.12.203])
	by mse-fl1.zte.com.cn with SMTP id 10LDsLln026334;
	Thu, 21 Jan 2021 21:54:21 +0800 (GMT-8)
	(envelope-from yang.yang29@zte.com.cn)
Received: from mapi (kjyxapp01[null]) by mapi (Zmail) with MAPI id mid14;
	Thu, 21 Jan 2021 21:54:27 +0800 (CST)
Date: Thu, 21 Jan 2021 21:54:27 +0800 (CST)
X-Zmail-TransId: 2b03600987932206e7d9
Message-ID: <202101212154272626110@zte.com.cn>
References: 202101142125016321850@zte.com.cn,
	CAHC9VhS=FWMWeTmLHtpVOrjL=j-89cjH+rYktcUZd8rj_fSc=w@mail.gmail.com
Mime-Version: 1.0
From: <yang.yang29@zte.com.cn>
To: <paul@paul-moore.com>
Subject: =?UTF-8?B?W1JGQyx2MiwxLzFdIGF1ZGl0OiBzcGVlZCB1cCBzeXNjYWxsIHJ1bGUgbWF0Y2ggd2hpbGUgZXhpdGluZyBzeXNjYWxs?=
X-MAIL: mse-fl1.zte.com.cn 10LDsLln026334
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 21 Jan 2021 09:03:21 -0500
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

RnJvbSA3MmYzZWNkZTU4ZWRiMDNkNzZjYjM1OTYwN2ZlZjk4YzE2NjNkNDgxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBZYW5nIFlhbmcgPHlhbmcueWFuZzI5QHp0ZS5jb20uY24+CkRh
dGU6IFRodSwgMjEgSmFuIDIwMjEgMjE6MDU6MDQgKzA4MDAKU3ViamVjdDogW1BBVENIXSBbUkZD
LHYyLDEvMV0gc3BlZWQgdXAgc3lzY2FsbCBydWxlIG1hdGNoIHdoaWxlIGV4aXRpbmcgc3lzY2Fs
bAogYXVkaXRfZmlsdGVyX3N5c2NhbGwoKSB0cmF2ZXJzZXMgc3RydWN0IGxpc3RfaGVhZCBhdWRp
dF9maWx0ZXJfbGlzdCB0byBmaW5kCiBvdXQgd2hldGhlciBjdXJyZW50IHN5c2NhbGwgbWF0Y2gg
b25lIHJ1bGUuIFRoaXMgdGFrZXMgbyhuKSwgd2hpY2ggaXMgbm90CiBuZWNlc3NhcnksIHNwZWNp
YWxseSBmb3IgdXNlciB3aG8gYWRkIGEgdmVyeSBmZXcgc3lzY2FsbCBydWxlcy4gT24gdGhlIG90
aGVyCiBoYW5kLCB1c2VyIG1heSBub3QgbXVjaCBjYXJlIGFib3V0IHJ1bGUgYWRkL2RlbGV0ZSBz
cGVlZC4gU28gZG8gbyhuKQogY2FsY3VsYXRlIGF0IHJ1bGUgY2hhbmdpbmcsIGFuZCBlYXNlIHRo
ZSBidXJkZW4gb2YgYXVkaXRfZmlsdGVyX3N5c2NhbGwoKS4KCiBEZWZpbmUgYXVkaXRfc3lzY2Fs
bFtOUl9zeXNjYWxsc10sIGV2ZXJ5IGVsZW1lbnQgc3RhbmRzIGZvciBvbmUgc3lzY2FsbC4KIGF1
ZGl0X2ZpbHRlcl9zeXNjYWxsKCkgY2hlY2tzIGF1ZGl0X3N5c2NhbGxbTlJfc3lzY2FsbHNdLgog
YXVkaXRfc3lzY2FsbFtuXSA9PSAwIGluZGljYXRlcyBubyBydWxlIGF1ZGl0IHN5c2NhbGwgbiwg
ZG8gYSBxdWljayBleGl0LgogYXVkaXRfc3lzY2FsbFtuXSA+IDAgaW5kaWNhdGVzIGF0IGxlYXN0
IG9uZSBydWxlIGF1ZGl0IHN5c2NhbGwgbi4KIGF1ZGl0X3N5c2NhbGxbbl0gdXBkYXRlIHdoZW4g
c3lzY2FsbCBydWxlIGNoYW5nZXMuCgpTaWduZWQtb2ZmLWJ5OiBZYW5nIFlhbmcgPHlhbmcueWFu
ZzI5QHp0ZS5jb20uY24+Ci0tLQogaW5jbHVkZS9saW51eC9hdWRpdC5oIHwgIDIgKysKIGtlcm5l
bC9hdWRpdC5jICAgICAgICB8ICA0ICsrKysKIGtlcm5lbC9hdWRpdGZpbHRlci5jICB8IDMwICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwoga2VybmVsL2F1ZGl0c2MuYyAgICAgIHwgIDUg
KysrKy0KIDQgZmlsZXMgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvYXVkaXQuaCBiL2luY2x1ZGUvbGludXgvYXVkaXQu
aAppbmRleCA4MmI3YzExLi43ODg1NTMxIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2F1ZGl0
LmgKKysrIGIvaW5jbHVkZS9saW51eC9hdWRpdC5oCkBAIC01NDksNiArNTQ5LDggQEAgc3RhdGlj
IGlubGluZSB2b2lkIGF1ZGl0X2xvZ19uZmNmZyhjb25zdCBjaGFyICpuYW1lLCB1OCBhZiwKCiBl
eHRlcm4gaW50IGF1ZGl0X25fcnVsZXM7CiBleHRlcm4gaW50IGF1ZGl0X3NpZ25hbHM7CitleHRl
cm4gdTMyIGF1ZGl0aW5nX3N5c2NhbGxbTlJfc3lzY2FsbHNdOworZXh0ZXJuIGludCBhdWRpdF9p
bl9tYXNrKGNvbnN0IHN0cnVjdCBhdWRpdF9rcnVsZSAqcnVsZSwgdW5zaWduZWQgbG9uZyB2YWwp
OwogI2Vsc2UgLyogQ09ORklHX0FVRElUU1lTQ0FMTCAqLwogc3RhdGljIGlubGluZSBpbnQgYXVk
aXRfYWxsb2Moc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrKQogewpkaWZmIC0tZ2l0IGEva2VybmVs
L2F1ZGl0LmMgYi9rZXJuZWwvYXVkaXQuYwppbmRleCAxZmZjMmUwLi4wN2Y0NTkwIDEwMDY0NAot
LS0gYS9rZXJuZWwvYXVkaXQuYworKysgYi9rZXJuZWwvYXVkaXQuYwpAQCAtMjA4LDYgKzIwOCwx
MCBAQCBzdHJ1Y3QgYXVkaXRfcmVwbHkgewogCXN0cnVjdCBza19idWZmICpza2I7CiB9OwoKKyNp
ZmRlZiBDT05GSUdfQVVESVRTWVNDQUxMCit1MzIgYXVkaXRpbmdfc3lzY2FsbFtOUl9zeXNjYWxs
c10gPSB7MH07CisjZW5kaWYKKwogLyoqCiAgKiBhdWRpdGRfdGVzdF90YXNrIC0gQ2hlY2sgdG8g
c2VlIGlmIGEgZ2l2ZW4gdGFzayBpcyBhbiBhdWRpdCBkYWVtb24KICAqIEB0YXNrOiB0aGUgdGFz
ayB0byBjaGVjawpkaWZmIC0tZ2l0IGEva2VybmVsL2F1ZGl0ZmlsdGVyLmMgYi9rZXJuZWwvYXVk
aXRmaWx0ZXIuYwppbmRleCAzMzNiM2JjLi45ZDNlNzAzIDEwMDY0NAotLS0gYS9rZXJuZWwvYXVk
aXRmaWx0ZXIuYworKysgYi9rZXJuZWwvYXVkaXRmaWx0ZXIuYwpAQCAtOTI2LDYgKzkyNiwyOCBA
QCBzdGF0aWMgc3RydWN0IGF1ZGl0X2VudHJ5ICphdWRpdF9maW5kX3J1bGUoc3RydWN0IGF1ZGl0
X2VudHJ5ICplbnRyeSwKIHN0YXRpYyB1NjQgcHJpb19sb3cgPSB+MFVMTC8yOwogc3RhdGljIHU2
NCBwcmlvX2hpZ2ggPSB+MFVMTC8yIC0gMTsKCisjaWZkZWYgQ09ORklHX0FVRElUU1lTQ0FMTAor
c3RhdGljIGlubGluZSB2b2lkIHVwZGF0ZV9hdWRpdGluZ19zeXNjYWxsKHN0cnVjdCBhdWRpdF9r
cnVsZSBydWxlLCBib29sIGFkZCkKK3sKKyAgICBpbnQgaTsKKworICAgIC8qIHN5c2NhbGwgcnVs
ZSB3aXRoIHR5cGUgQVVESVRfRklMVEVSX0VYSVQgKi8KKyAgICBpZiAocnVsZS5saXN0bnIgPT0g
QVVESVRfRklMVEVSX0VYSVQgJiYgIXJ1bGUud2F0Y2ggJiYgIXJ1bGUudHJlZSkgeworICAgICAg
ICBmb3IgKGkgPSAwOyBpIDwgTlJfc3lzY2FsbHM7IGkrKykgeworICAgICAgICAgICAgLyogd2hl
dGhlciB0aGlzIHJ1bGUgaW5jbHVkZSBvbmUgc3lzY2FsbCAqLworICAgICAgICAgICAgaWYgKHVu
bGlrZWx5KGF1ZGl0X2luX21hc2soJnJ1bGUsIGkpKSkgeworICAgICAgICAgICAgICAgIGlmIChh
ZGQgPT0gdHJ1ZSkKKyAgICAgICAgICAgICAgICAgICAgYXVkaXRpbmdfc3lzY2FsbFtpXSsrOwor
ICAgICAgICAgICAgICAgIGVsc2UKKyAgICAgICAgICAgICAgICAgICAgYXVkaXRpbmdfc3lzY2Fs
bFtpXS0tOworICAgICAgICAgICAgfQorICAgICAgICB9CisgICAgfSAKKworICAgIHJldHVybjsK
K30KKyNlbmRpZgorCiAvKiBBZGQgcnVsZSB0byBnaXZlbiBmaWx0ZXJsaXN0IGlmIG5vdCBhIGR1
cGxpY2F0ZS4gKi8KIHN0YXRpYyBpbmxpbmUgaW50IGF1ZGl0X2FkZF9ydWxlKHN0cnVjdCBhdWRp
dF9lbnRyeSAqZW50cnkpCiB7CkBAIC05NTcsNiArOTc5LDEwIEBAIHN0YXRpYyBpbmxpbmUgaW50
IGF1ZGl0X2FkZF9ydWxlKHN0cnVjdCBhdWRpdF9lbnRyeSAqZW50cnkpCiAJCXJldHVybiBlcnI7
CiAJfQoKKyNpZmRlZiBDT05GSUdfQVVESVRTWVNDQUxMCisgICAgdXBkYXRlX2F1ZGl0aW5nX3N5
c2NhbGwoZW50cnktPnJ1bGUsIHRydWUpOworI2VuZGlmCisKIAlpZiAod2F0Y2gpIHsKIAkJLyog
YXVkaXRfZmlsdGVyX211dGV4IGlzIGRyb3BwZWQgYW5kIHJlLXRha2VuIGR1cmluZyB0aGlzIGNh
bGwgKi8KIAkJZXJyID0gYXVkaXRfYWRkX3dhdGNoKCZlbnRyeS0+cnVsZSwgJmxpc3QpOwpAQCAt
MTAzNSw2ICsxMDYxLDEwIEBAIGludCBhdWRpdF9kZWxfcnVsZShzdHJ1Y3QgYXVkaXRfZW50cnkg
KmVudHJ5KQogCQlnb3RvIG91dDsKIAl9CgorI2lmZGVmIENPTkZJR19BVURJVFNZU0NBTEwKKyAg
ICB1cGRhdGVfYXVkaXRpbmdfc3lzY2FsbChlLT5ydWxlLCBmYWxzZSk7CisjZW5kaWYKKwogCWlm
IChlLT5ydWxlLndhdGNoKQogCQlhdWRpdF9yZW1vdmVfd2F0Y2hfcnVsZSgmZS0+cnVsZSk7Cgpk
aWZmIC0tZ2l0IGEva2VybmVsL2F1ZGl0c2MuYyBiL2tlcm5lbC9hdWRpdHNjLmMKaW5kZXggY2U4
YzllMi4uOTA0OTBhYSAxMDA2NDQKLS0tIGEva2VybmVsL2F1ZGl0c2MuYworKysgYi9rZXJuZWwv
YXVkaXRzYy5jCkBAIC03ODMsNyArNzgzLDcgQEAgc3RhdGljIGVudW0gYXVkaXRfc3RhdGUgYXVk
aXRfZmlsdGVyX3Rhc2soc3RydWN0IHRhc2tfc3RydWN0ICp0c2ssIGNoYXIgKiprZXkpCiAJcmV0
dXJuIEFVRElUX0JVSUxEX0NPTlRFWFQ7CiB9Cgotc3RhdGljIGludCBhdWRpdF9pbl9tYXNrKGNv
bnN0IHN0cnVjdCBhdWRpdF9rcnVsZSAqcnVsZSwgdW5zaWduZWQgbG9uZyB2YWwpCitpbnQgYXVk
aXRfaW5fbWFzayhjb25zdCBzdHJ1Y3QgYXVkaXRfa3J1bGUgKnJ1bGUsIHVuc2lnbmVkIGxvbmcg
dmFsKQogewogCWludCB3b3JkLCBiaXQ7CgpAQCAtODE0LDYgKzgxNCw5IEBAIHN0YXRpYyBlbnVt
IGF1ZGl0X3N0YXRlIGF1ZGl0X2ZpbHRlcl9zeXNjYWxsKHN0cnVjdCB0YXNrX3N0cnVjdCAqdHNr
LAogCWlmIChhdWRpdGRfdGVzdF90YXNrKHRzaykpCiAJCXJldHVybiBBVURJVF9ESVNBQkxFRDsK
CisJaWYgKCFhdWRpdGluZ19zeXNjYWxsW2N0eC0+bWFqb3JdKQorCQlyZXR1cm4gQVVESVRfQlVJ
TERfQ09OVEVYVDsKKwogCXJjdV9yZWFkX2xvY2soKTsKIAlsaXN0X2Zvcl9lYWNoX2VudHJ5X3Jj
dShlLCBsaXN0LCBsaXN0KSB7CiAJCWlmIChhdWRpdF9pbl9tYXNrKCZlLT5ydWxlLCBjdHgtPm1h
am9yKSAmJgotLSAKMi4xNS4y
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

