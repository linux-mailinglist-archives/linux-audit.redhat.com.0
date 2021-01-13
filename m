Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A7FA32F4C8B
	for <lists+linux-audit@lfdr.de>; Wed, 13 Jan 2021 14:55:34 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-lme6KU2SOJ67wNCDud_Btw-1; Wed, 13 Jan 2021 08:55:31 -0500
X-MC-Unique: lme6KU2SOJ67wNCDud_Btw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 943D89CC15;
	Wed, 13 Jan 2021 13:55:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E12E19C47;
	Wed, 13 Jan 2021 13:55:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E74C34BB7B;
	Wed, 13 Jan 2021 13:55:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10DCtchn032469 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 13 Jan 2021 07:55:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 17FC4CF622; Wed, 13 Jan 2021 12:55:38 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 12A4ECF63A
	for <linux-audit@redhat.com>; Wed, 13 Jan 2021 12:55:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A775D101A560
	for <linux-audit@redhat.com>; Wed, 13 Jan 2021 12:55:35 +0000 (UTC)
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.217.80.70]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-155-M5bt3lvCNC-dEKG-mxUxew-1;
	Wed, 13 Jan 2021 07:55:31 -0500
X-MC-Unique: M5bt3lvCNC-dEKG-mxUxew-1
Received: from mse-fl2.zte.com.cn (unknown [10.30.14.239])
	by Forcepoint Email with ESMTPS id D4E24E08903843536C6F;
	Wed, 13 Jan 2021 20:39:44 +0800 (CST)
Received: from kjyxapp01.zte.com.cn ([10.30.12.200])
	by mse-fl2.zte.com.cn with SMTP id 10DCcfAS057588;
	Wed, 13 Jan 2021 20:38:41 +0800 (GMT-8)
	(envelope-from yang.yang29@zte.com.cn)
Received: from mapi (kjyxapp03[null]) by mapi (Zmail) with MAPI id mid14;
	Wed, 13 Jan 2021 20:38:40 +0800 (CST)
Date: Wed, 13 Jan 2021 20:38:40 +0800 (CST)
X-Zmail-TransId: 2b055ffee9d06f8a126a
Message-ID: <202101132038409309743@zte.com.cn>
Mime-Version: 1.0
From: <yang.yang29@zte.com.cn>
To: <paul@paul-moore.com>, <eparis@redhat.com>, <linux-audit@redhat.com>
Subject: =?UTF-8?B?W1JGQyx2MSwxLzFdIGF1ZGl0OiBzcGVlZCB1cCBzeXNjYWxsIHJ1bGUgbWF0Y2ggd2hpbGUgZXhpdGluZyBzeXNjYWxs?=
X-MAIL: mse-fl2.zte.com.cn 10DCcfAS057588
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
X-Mailman-Approved-At: Wed, 13 Jan 2021 08:55:18 -0500
Cc: linux-kernel@vger.kernel.org
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

RnJvbSA4MmViY2Y0MzQ4MWJlMjFlZTNlMzJlYzE3NDliNDJmNjUxNzM3ODgwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBZYW5nIFlhbmcgPHlhbmcueWFuZzI5QHp0ZS5jb20uY24+CkRh
dGU6IFdlZCwgMTMgSmFuIDIwMjEgMjA6MTg6MDQgKzA4MDAKU3ViamVjdDogW1BBVENIXSBbUkZD
LHYxLDEvMV0gc3BlZWQgdXAgc3lzY2FsbCBydWxlIG1hdGNoIHdoaWxlIGV4aXRpbmcgc3lzY2Fs
bAogSWYgdXNlciBhZGQgYW55IHN5c2NhbGwgcnVsZSwgaW4gYWxsIHN5c2NhbGxzLCBhdWRpdF9m
aWx0ZXJfc3lzY2FsbCgpCiB0cmF2ZXJzZXMgc3RydWN0IGxpc3RfaGVhZCBhdWRpdF9maWx0ZXJf
bGlzdCB0byBmaW5kIG91dCB3aGV0aGVyIGN1cnJlbnQKIHN5c2NhbGwgbWF0Y2ggb25lIHJ1bGUu
IFRoaXMgdGFrZXMgbyhuKSwgd2hpY2ggaXMgbm90IG5lY2Vzc2FyeSwgc3BlY2lhbGx5CiBmb3Ig
dXNlciB3aG8gYWRkIGEgdmVyeSBmZXcgc3lzY2FsbCBydWxlcy4gT24gdGhlIG90aGVyIGhhbmQs
IHVzZXIgbWF5IG5vdAogbXVjaCBjYXJlIGFib3V0IHJ1bGUgYWRkL2RlbGV0ZSBzcGVlZC4gU28g
ZG8gbyhuKSBjYWxjdWxhdGUgYXQgcnVsZSBjaGFuZ2luZywKIGFuZCBlYXNlIHRoZSBidXJkZW4g
b2YgYXVkaXRfZmlsdGVyX3N5c2NhbGwoKS4KCiBEZWZpbmUgYXVkaXRfc3lzY2FsbFtOUl9zeXNj
YWxsc10sIGV2ZXJ5IGVsZW1lbnQgc3RhbmRzIGZvciBvbmUgc3lzY2FsbC4KIGF1ZGl0X2ZpbHRl
cl9zeXNjYWxsKCkgY2hlY2tzIGF1ZGl0X3N5c2NhbGxbTlJfc3lzY2FsbHNdLgogYXVkaXRfc3lz
Y2FsbFtuXSA9PSAwIGluZGljYXRlcyBubyBydWxlIGF1ZGl0IHN5c2NhbGwgbiwgZG8gYSBxdWlj
ayBleGl0LgogYXVkaXRfc3lzY2FsbFtuXSA+IDAgaW5kaWNhdGVzIGF0IGxlYXN0IG9uZSBydWxl
IGF1ZGl0IHN5c2NhbGwgbi4KIGF1ZGl0X3N5c2NhbGxbbl0gdXBkYXRlIHdoZW4gc3lzY2FsbCBy
dWxlIGNoYW5nZXMuCgpTaWduZWQtb2ZmLWJ5OiBZYW5nIFlhbmcgPHlhbmcueWFuZzI5QHp0ZS5j
b20uY24+Ci0tLQogaW5jbHVkZS9saW51eC9hdWRpdC5oIHwgIDIgKysKIGtlcm5lbC9hdWRpdC5j
ICAgICAgICB8ICAyICsrCiBrZXJuZWwvYXVkaXRmaWx0ZXIuYyAgfCAxNiArKysrKysrKysrKysr
KysrCiBrZXJuZWwvYXVkaXRzYy5jICAgICAgfCAgOSArKysrKysrKy0KIDQgZmlsZXMgY2hhbmdl
ZCwgMjggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUv
bGludXgvYXVkaXQuaCBiL2luY2x1ZGUvbGludXgvYXVkaXQuaAppbmRleCA4MmI3YzExLi41NmE4
YzYxIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2F1ZGl0LmgKKysrIGIvaW5jbHVkZS9saW51
eC9hdWRpdC5oCkBAIC01NDksNiArNTQ5LDggQEAgc3RhdGljIGlubGluZSB2b2lkIGF1ZGl0X2xv
Z19uZmNmZyhjb25zdCBjaGFyICpuYW1lLCB1OCBhZiwKCiBleHRlcm4gaW50IGF1ZGl0X25fcnVs
ZXM7CiBleHRlcm4gaW50IGF1ZGl0X3NpZ25hbHM7CitleHRlcm4gdTMyIGF1ZGl0X3N5c2NhbGxb
TlJfc3lzY2FsbHNdOworZXh0ZXJuIGludCBhdWRpdF9pbl9tYXNrKGNvbnN0IHN0cnVjdCBhdWRp
dF9rcnVsZSAqcnVsZSwgdW5zaWduZWQgbG9uZyB2YWwpOwogI2Vsc2UgLyogQ09ORklHX0FVRElU
U1lTQ0FMTCAqLwogc3RhdGljIGlubGluZSBpbnQgYXVkaXRfYWxsb2Moc3RydWN0IHRhc2tfc3Ry
dWN0ICp0YXNrKQogewpkaWZmIC0tZ2l0IGEva2VybmVsL2F1ZGl0LmMgYi9rZXJuZWwvYXVkaXQu
YwppbmRleCAxZmZjMmUwLi5kMjMzYTk1IDEwMDY0NAotLS0gYS9rZXJuZWwvYXVkaXQuYworKysg
Yi9rZXJuZWwvYXVkaXQuYwpAQCAtMjA4LDYgKzIwOCw4IEBAIHN0cnVjdCBhdWRpdF9yZXBseSB7
CiAgICAgICAgc3RydWN0IHNrX2J1ZmYgKnNrYjsKIH07CgordTMyIGF1ZGl0X3N5c2NhbGxbTlJf
c3lzY2FsbHNdID0gezB9OworCiAvKioKICAqIGF1ZGl0ZF90ZXN0X3Rhc2sgLSBDaGVjayB0byBz
ZWUgaWYgYSBnaXZlbiB0YXNrIGlzIGFuIGF1ZGl0IGRhZW1vbgogICogQHRhc2s6IHRoZSB0YXNr
IHRvIGNoZWNrCmRpZmYgLS1naXQgYS9rZXJuZWwvYXVkaXRmaWx0ZXIuYyBiL2tlcm5lbC9hdWRp
dGZpbHRlci5jCmluZGV4IDMzM2IzYmMuLmM3ZTYwY2QgMTAwNjQ0Ci0tLSBhL2tlcm5lbC9hdWRp
dGZpbHRlci5jCisrKyBiL2tlcm5lbC9hdWRpdGZpbHRlci5jCkBAIC05MzYsNiArOTM2LDcgQEAg
c3RhdGljIGlubGluZSBpbnQgYXVkaXRfYWRkX3J1bGUoc3RydWN0IGF1ZGl0X2VudHJ5ICplbnRy
eSkKICAgICAgICBpbnQgZXJyID0gMDsKICNpZmRlZiBDT05GSUdfQVVESVRTWVNDQUxMCiAgICAg
ICAgaW50IGRvbnRfY291bnQgPSAwOworICAgICAgIGludCBpID0gMDsKCiAgICAgICAgLyogSWYg
YW55IG9mIHRoZXNlLCBkb24ndCBjb3VudCB0b3dhcmRzIHRvdGFsICovCiAgICAgICAgc3dpdGNo
KGVudHJ5LT5ydWxlLmxpc3RucikgewpAQCAtOTU3LDYgKzk1OCwxMyBAQCBzdGF0aWMgaW5saW5l
IGludCBhdWRpdF9hZGRfcnVsZShzdHJ1Y3QgYXVkaXRfZW50cnkgKmVudHJ5KQogICAgICAgICAg
ICAgICAgcmV0dXJuIGVycjsKICAgICAgICB9CgorI2lmZGVmIENPTkZJR19BVURJVFNZU0NBTEwK
KyAgICAgICBpZiAoZW50cnktPnJ1bGUubGlzdG5yID09IEFVRElUX0ZJTFRFUl9FWElUICYmICF3
YXRjaCAmJiAhdHJlZSkgeworICAgICAgICAgICAgICAgZm9yIChpID0gMDsgaSA8IE5SX3N5c2Nh
bGxzOyBpKyspCisgICAgICAgICAgICAgICAgICAgICAgIGF1ZGl0X3N5c2NhbGxbaV0gKz0gISgh
YXVkaXRfaW5fbWFzaygmZW50cnktPnJ1bGUsIGkpKTsKKyAgICAgICB9CisjZW5kaWYKKwogICAg
ICAgIGlmICh3YXRjaCkgewogICAgICAgICAgICAgICAgLyogYXVkaXRfZmlsdGVyX211dGV4IGlz
IGRyb3BwZWQgYW5kIHJlLXRha2VuIGR1cmluZyB0aGlzIGNhbGwgKi8KICAgICAgICAgICAgICAg
IGVyciA9IGF1ZGl0X2FkZF93YXRjaCgmZW50cnktPnJ1bGUsICZsaXN0KTsKQEAgLTEwMTgsNiAr
MTAyNiw3IEBAIGludCBhdWRpdF9kZWxfcnVsZShzdHJ1Y3QgYXVkaXRfZW50cnkgKmVudHJ5KQog
ICAgICAgIGludCByZXQgPSAwOwogI2lmZGVmIENPTkZJR19BVURJVFNZU0NBTEwKICAgICAgICBp
bnQgZG9udF9jb3VudCA9IDA7CisgICAgICAgaW50IGkgPSAwOwoKICAgICAgICAvKiBJZiBhbnkg
b2YgdGhlc2UsIGRvbid0IGNvdW50IHRvd2FyZHMgdG90YWwgKi8KICAgICAgICBzd2l0Y2goZW50
cnktPnJ1bGUubGlzdG5yKSB7CkBAIC0xMDM1LDYgKzEwNDQsMTMgQEAgaW50IGF1ZGl0X2RlbF9y
dWxlKHN0cnVjdCBhdWRpdF9lbnRyeSAqZW50cnkpCiAgICAgICAgICAgICAgICBnb3RvIG91dDsK
ICAgICAgICB9CgorI2lmZGVmIENPTkZJR19BVURJVFNZU0NBTEwKKyAgICAgICBpZiAoZW50cnkt
PnJ1bGUubGlzdG5yID09IEFVRElUX0ZJTFRFUl9FWElUICYmICFlLT5ydWxlLndhdGNoICYmICFl
LT5ydWxlLnRyZWUpIHsKKyAgICAgICAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBOUl9zeXNjYWxs
czsgaSsrKQorICAgICAgICAgICAgICAgICAgICAgICBhdWRpdF9zeXNjYWxsW2ldIC09ICEoIWF1
ZGl0X2luX21hc2soJmVudHJ5LT5ydWxlLCBpKSk7CisgICAgICAgfQorI2VuZGlmCisKICAgICAg
ICBpZiAoZS0+cnVsZS53YXRjaCkKICAgICAgICAgICAgICAgIGF1ZGl0X3JlbW92ZV93YXRjaF9y
dWxlKCZlLT5ydWxlKTsKCmRpZmYgLS1naXQgYS9rZXJuZWwvYXVkaXRzYy5jIGIva2VybmVsL2F1
ZGl0c2MuYwppbmRleCBjZThjOWUyLi4yYTc0NDM2IDEwMDY0NAotLS0gYS9rZXJuZWwvYXVkaXRz
Yy5jCisrKyBiL2tlcm5lbC9hdWRpdHNjLmMKQEAgLTc4Myw3ICs3ODMsNyBAQCBzdGF0aWMgZW51
bSBhdWRpdF9zdGF0ZSBhdWRpdF9maWx0ZXJfdGFzayhzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRzaywg
Y2hhciAqKmtleSkKICAgICAgICByZXR1cm4gQVVESVRfQlVJTERfQ09OVEVYVDsKIH0KCi1zdGF0
aWMgaW50IGF1ZGl0X2luX21hc2soY29uc3Qgc3RydWN0IGF1ZGl0X2tydWxlICpydWxlLCB1bnNp
Z25lZCBsb25nIHZhbCkKK2ludCBhdWRpdF9pbl9tYXNrKGNvbnN0IHN0cnVjdCBhdWRpdF9rcnVs
ZSAqcnVsZSwgdW5zaWduZWQgbG9uZyB2YWwpCiB7CiAgICAgICAgaW50IHdvcmQsIGJpdDsKCkBA
IC04MTQsNiArODE0LDEzIEBAIHN0YXRpYyBlbnVtIGF1ZGl0X3N0YXRlIGF1ZGl0X2ZpbHRlcl9z
eXNjYWxsKHN0cnVjdCB0YXNrX3N0cnVjdCAqdHNrLAogICAgICAgIGlmIChhdWRpdGRfdGVzdF90
YXNrKHRzaykpCiAgICAgICAgICAgICAgICByZXR1cm4gQVVESVRfRElTQUJMRUQ7CgorICAgICAg
IG11dGV4X2xvY2soJmF1ZGl0X2ZpbHRlcl9tdXRleCk7CisgICAgICAgaWYgKCFhdWRpdF9zeXNj
YWxsW2N0eC0+bWFqb3JdKSB7CisgICAgICAgICAgICAgICBtdXRleF91bmxvY2soJmF1ZGl0X2Zp
bHRlcl9tdXRleCk7CisgICAgICAgICAgICAgICByZXR1cm4gQVVESVRfQlVJTERfQ09OVEVYVDsK
KyAgICAgICB9CisgICAgICAgbXV0ZXhfdW5sb2NrKCZhdWRpdF9maWx0ZXJfbXV0ZXgpOworCiAg
ICAgICAgcmN1X3JlYWRfbG9jaygpOwogICAgICAgIGxpc3RfZm9yX2VhY2hfZW50cnlfcmN1KGUs
IGxpc3QsIGxpc3QpIHsKICAgICAgICAgICAgICAgIGlmIChhdWRpdF9pbl9tYXNrKCZlLT5ydWxl
LCBjdHgtPm1ham9yKSAmJgotLQoyLjE1LjI=
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

