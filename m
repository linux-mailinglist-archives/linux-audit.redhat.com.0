Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 915BB1F18CB
	for <lists+linux-audit@lfdr.de>; Mon,  8 Jun 2020 14:32:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591619563;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uob+4dQUXMY/BFkM1gIcicVE7V2epky9DUeq7gtY/CE=;
	b=LEQGjQrF63AuMWjtRSsJ4+DnVi2b9Wmk8kaB4ccVI2pB5U1EdjaA7kh+3RtWmaHZHunKuE
	blPhRCnKnjh4CCWkYccfIc1PRQ/rLy+1FKvT6NUweECGaEq4D4UyK1ITemic2Lkxu1s9in
	jafn1CQjkTDfrNG1DaEQkC29qoccE84=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-g-RQrJhEPRW2Zy-ATERtsA-1; Mon, 08 Jun 2020 08:32:41 -0400
X-MC-Unique: g-RQrJhEPRW2Zy-ATERtsA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 983EC805723;
	Mon,  8 Jun 2020 12:32:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 299565D9DD;
	Mon,  8 Jun 2020 12:32:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1A003180954D;
	Mon,  8 Jun 2020 12:32:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 058Br37H011802 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 8 Jun 2020 07:53:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1E93A10F2715; Mon,  8 Jun 2020 11:53:03 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D0AA1003211
	for <linux-audit@redhat.com>; Mon,  8 Jun 2020 11:53:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7FDC8101A526
	for <linux-audit@redhat.com>; Mon,  8 Jun 2020 11:53:00 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-415-eVpvruYRPyS7bo1TGo5-WA-1; Mon, 08 Jun 2020 07:52:58 -0400
X-MC-Unique: eVpvruYRPyS7bo1TGo5-WA-1
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	058BWKAC100250
	for <linux-audit@redhat.com>; Mon, 8 Jun 2020 07:52:57 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com with ESMTP id 31g59rbqjm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT)
	for <linux-audit@redhat.com>; Mon, 08 Jun 2020 07:52:57 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 058BWJgk100209
	for <linux-audit@redhat.com>; Mon, 8 Jun 2020 07:52:57 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
	[169.51.49.98])
	by mx0b-001b2d01.pphosted.com with ESMTP id 31g59rbqj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 08 Jun 2020 07:52:56 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id
	058BjE7m014959; Mon, 8 Jun 2020 11:52:55 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
	(d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma03ams.nl.ibm.com with ESMTP id 31g2s7uvm7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 08 Jun 2020 11:52:55 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
	[9.149.105.59])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 058Bqr3X6685134
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 8 Jun 2020 11:52:53 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 02110A405B;
	Mon,  8 Jun 2020 11:52:53 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5CF67A4051;
	Mon,  8 Jun 2020 11:52:52 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.178.150])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon,  8 Jun 2020 11:52:52 +0000 (GMT)
Message-ID: <1591617171.4638.33.camel@linux.ibm.com>
Subject: Re: [PATCH v2] IMA: Add audit log for failure conditions
From: Mimi Zohar <zohar@linux.ibm.com>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>, paul@paul-moore.com
Date: Mon, 08 Jun 2020 07:52:51 -0400
In-Reply-To: <20200607221449.2837-1-nramas@linux.microsoft.com>
References: <20200607221449.2837-1-nramas@linux.microsoft.com>
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
	definitions=2020-06-08_07:2020-06-08,
	2020-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	lowpriorityscore=0 mlxscore=0
	impostorscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
	malwarescore=0 mlxlogscore=999 cotscore=-2147483648 bulkscore=0
	suspectscore=2 priorityscore=1501 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.12.0-2004280000 definitions=main-2006080084
X-MIME-Autoconverted: from 8bit to quoted-printable by
	mx0b-001b2d01.pphosted.com id 058BWKAC100250
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 058Br37H011802
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 08 Jun 2020 08:32:21 -0400
Cc: linux-integrity@vger.kernel.org, linux-audit@redhat.com,
	linux-kernel@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgTGFrc2htaSwKCk9uIFN1biwgMjAyMC0wNi0wNyBhdCAxNToxNCAtMDcwMCwgTGFrc2htaSBS
YW1hc3VicmFtYW5pYW4gd3JvdGU6Cj4gVGhlIGZpbmFsIGxvZyBzdGF0ZW1lbnQgaW4gcHJvY2Vz
c19idWZmZXJfbWVhc3VyZW1lbnQoKSBmb3IgZmFpbHVyZQo+IGNvbmRpdGlvbiBpcyBhdCBkZWJ1
ZyBsZXZlbC4gVGhpcyBkb2VzIG5vdCBsb2cgdGhlIG1lc3NhZ2UgdW5sZXNzCj4gdGhlIHN5c3Rl
bSBsb2cgbGV2ZWwgaXMgcmFpc2VkIHdoaWNoIHdvdWxkIHNpZ25pZmljYW50bHkgaW5jcmVhc2UK
PiB0aGUgbWVzc2FnZXMgaW4gdGhlIHN5c3RlbSBsb2cuIENoYW5nZSB0aGlzIGxvZyBtZXNzYWdl
IHRvIGFuIGF1ZGl0Cj4gbWVzc2FnZSBmb3IgYmV0dGVyIHRyaWFnaW5nIGZhaWx1cmVzIGluIHRo
ZSBmdW5jdGlvbi4KPiAKPiBpbWFfYWxsb2Nfa2V5X2VudHJ5KCkgZG9lcyBub3QgbG9nIGEgbWVz
c2FnZSBmb3IgZmFpbHVyZSBjb25kaXRpb24uCj4gQWRkIGFuIGF1ZGl0IG1lc3NhZ2UgZm9yIGZh
aWx1cmUgY29uZGl0aW9uIGluIHRoaXMgZnVuY3Rpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogTGFr
c2htaSBSYW1hc3VicmFtYW5pYW4gPG5yYW1hc0BsaW51eC5taWNyb3NvZnQuY29tPgoKQXVkaXQg
bWVzc2FnZXMgc2hvdWxkIGJlIGF0IGEgaGlnaGVyIGxldmVsLiDCoEZvciBleGFtcGxlLAoiaGFz
aGluZ19lcnJvciIsICJjb2xsZWN0X2RhdGEiLCAiaW52YWxpZF9wY3IiLiDCoEluIHRoZSAiaW52
YWxpZF9wY3IiCmNhc2UsIHRoZSBhdWRpdCBsb2cgY29udGFpbnMgdGhlIHJlYXNvbiAtICJUb01U
b1UiIG9yICJvcGVuX3dyaXRlcnMiIC0KYXMgdG8gd2h5IHRoZSBtZWFzdXJlbWVudCBsaXN0IGRv
ZXNuJ3QgbWF0Y2ggdGhlIFBDUi4KCkhlcmUgeW91IHdvdWxkIHdhbnQgIm1lYXN1cmluZ19rZXlz
IiwgIm1lYXN1cmluZ19ib290X2NtZGxpbmUiIHdpdGgKdGhlIHJlYXNvbiBpdCBmYWlsZWQsIG5v
dCB0aGUgZnVuY3Rpb24gbmFtZQoicHJvY2Vzc19idWZmZXJfbWVhc3VyZW1lbnQiLgoKVXNlcnNw
YWNlIG5lZWRzIHRvIGJlIGF3YXJlIG9mIHRoZSBuZXcgYXVkaXQgbWVzc2FnZXMuIMKgTWF5YmUg
aW5jbHVkZQpzYW1wbGVzIG9mIHRoZW0gaW4gdGhlIGNvdmVyIGxldHRlci4KCnRoYW5rcywKCk1p
bWkKCj4gLS0tCj4gIHNlY3VyaXR5L2ludGVncml0eS9pbWEvaW1hX21haW4uYyAgICAgICB8IDE3
ICsrKysrKysrKysrKy0tLS0tCj4gIHNlY3VyaXR5L2ludGVncml0eS9pbWEvaW1hX3F1ZXVlX2tl
eXMuYyB8ICA0ICsrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA1IGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9zZWN1cml0eS9pbnRlZ3JpdHkvaW1hL2ltYV9t
YWluLmMgYi9zZWN1cml0eS9pbnRlZ3JpdHkvaW1hL2ltYV9tYWluLmMKPiBpbmRleCA4MDBmYjNi
YmE0MTguLjEyMjUxOThmY2ViMSAxMDA2NDQKPiAtLS0gYS9zZWN1cml0eS9pbnRlZ3JpdHkvaW1h
L2ltYV9tYWluLmMKPiArKysgYi9zZWN1cml0eS9pbnRlZ3JpdHkvaW1hL2ltYV9tYWluLmMKPiBA
QCAtNzM5LDYgKzczOSw3IEBAIHZvaWQgcHJvY2Vzc19idWZmZXJfbWVhc3VyZW1lbnQoY29uc3Qg
dm9pZCAqYnVmLCBpbnQgc2l6ZSwKPiAgCQkJCWludCBwY3IsIGNvbnN0IGNoYXIgKmtleXJpbmcp
Cj4gIHsKPiAgCWludCByZXQgPSAwOwo+ICsJY29uc3QgY2hhciAqYXVkaXRfY2F1c2UgPSAiRU5P
TUVNIjsKPiAgCXN0cnVjdCBpbWFfdGVtcGxhdGVfZW50cnkgKmVudHJ5ID0gTlVMTDsKPiAgCXN0
cnVjdCBpbnRlZ3JpdHlfaWludF9jYWNoZSBpaW50ID0ge307Cj4gIAlzdHJ1Y3QgaW1hX2V2ZW50
X2RhdGEgZXZlbnRfZGF0YSA9IHsuaWludCA9ICZpaW50LAo+IEBAIC03OTMsMjEgKzc5NCwyNyBA
QCB2b2lkIHByb2Nlc3NfYnVmZmVyX21lYXN1cmVtZW50KGNvbnN0IHZvaWQgKmJ1ZiwgaW50IHNp
emUsCj4gIAlpaW50LmltYV9oYXNoLT5sZW5ndGggPSBoYXNoX2RpZ2VzdF9zaXplW2ltYV9oYXNo
X2FsZ29dOwo+ICAKPiAgCXJldCA9IGltYV9jYWxjX2J1ZmZlcl9oYXNoKGJ1Ziwgc2l6ZSwgaWlu
dC5pbWFfaGFzaCk7Cj4gLQlpZiAocmV0IDwgMCkKPiArCWlmIChyZXQgPCAwKSB7Cj4gKwkJYXVk
aXRfY2F1c2UgPSAiY2FsY19idWZmZXJfaGFzaCI7Cj4gIAkJZ290byBvdXQ7Cj4gKwl9Cj4gIAo+
ICAJcmV0ID0gaW1hX2FsbG9jX2luaXRfdGVtcGxhdGUoJmV2ZW50X2RhdGEsICZlbnRyeSwgdGVt
cGxhdGUpOwo+IC0JaWYgKHJldCA8IDApCj4gKwlpZiAocmV0IDwgMCkgewo+ICsJCWF1ZGl0X2Nh
dXNlID0gImFsbG9jX2luaXRfdGVtcGxhdGUiOwo+ICAJCWdvdG8gb3V0Owo+ICsJfQo+ICAKPiAg
CXJldCA9IGltYV9zdG9yZV90ZW1wbGF0ZShlbnRyeSwgdmlvbGF0aW9uLCBOVUxMLCBidWYsIHBj
cik7Cj4gLQo+IC0JaWYgKHJldCA8IDApCj4gKwlpZiAocmV0IDwgMCkgewo+ICsJCWF1ZGl0X2Nh
dXNlID0gInN0b3JlX3RlbXBsYXRlIjsKPiAgCQlpbWFfZnJlZV90ZW1wbGF0ZV9lbnRyeShlbnRy
eSk7Cj4gKwl9Cj4gIAo+ICBvdXQ6Cj4gIAlpZiAocmV0IDwgMCkKPiAtCQlwcl9kZXZlbCgiJXM6
IGZhaWxlZCwgcmVzdWx0OiAlZFxuIiwgX19mdW5jX18sIHJldCk7Cj4gKwkJaW50ZWdyaXR5X2F1
ZGl0X21zZyhBVURJVF9JTlRFR1JJVFlfUENSLCBOVUxMLCBldmVudG5hbWUsCj4gKwkJCQkgICAg
X19mdW5jX18sIGF1ZGl0X2NhdXNlLCByZXQsIDApOwo+ICAKPiAgCXJldHVybjsKPiAgfQo+IGRp
ZmYgLS1naXQgYS9zZWN1cml0eS9pbnRlZ3JpdHkvaW1hL2ltYV9xdWV1ZV9rZXlzLmMgYi9zZWN1
cml0eS9pbnRlZ3JpdHkvaW1hL2ltYV9xdWV1ZV9rZXlzLmMKPiBpbmRleCBjYjNlM2Y1MDE1OTMu
LmZhNjA2Y2U2OGY4NyAxMDA2NDQKPiAtLS0gYS9zZWN1cml0eS9pbnRlZ3JpdHkvaW1hL2ltYV9x
dWV1ZV9rZXlzLmMKPiArKysgYi9zZWN1cml0eS9pbnRlZ3JpdHkvaW1hL2ltYV9xdWV1ZV9rZXlz
LmMKPiBAQCAtNjgsNiArNjgsNyBAQCBzdGF0aWMgc3RydWN0IGltYV9rZXlfZW50cnkgKmltYV9h
bGxvY19rZXlfZW50cnkoc3RydWN0IGtleSAqa2V5cmluZywKPiAgCQkJCQkJIHNpemVfdCBwYXls
b2FkX2xlbikKPiAgewo+ICAJaW50IHJjID0gMDsKPiArCWNvbnN0IGNoYXIgKmF1ZGl0X2NhdXNl
ID0gIkVOT01FTSI7Cj4gIAlzdHJ1Y3QgaW1hX2tleV9lbnRyeSAqZW50cnk7Cj4gIAo+ICAJZW50
cnkgPSBremFsbG9jKHNpemVvZigqZW50cnkpLCBHRlBfS0VSTkVMKTsKPiBAQCAtODgsNiArODks
OSBAQCBzdGF0aWMgc3RydWN0IGltYV9rZXlfZW50cnkgKmltYV9hbGxvY19rZXlfZW50cnkoc3Ry
dWN0IGtleSAqa2V5cmluZywKPiAgCj4gIG91dDoKPiAgCWlmIChyYykgewo+ICsJCWludGVncml0
eV9hdWRpdF9tc2coQVVESVRfSU5URUdSSVRZX1BDUiwgTlVMTCwKPiArCQkJCSAgICBrZXlyaW5n
LT5kZXNjcmlwdGlvbiwgX19mdW5jX18sCj4gKwkJCQkgICAgYXVkaXRfY2F1c2UsIHJjLCAwKTsK
PiAgCQlpbWFfZnJlZV9rZXlfZW50cnkoZW50cnkpOwo+ICAJCWVudHJ5ID0gTlVMTDsKPiAgCX0K
CgotLQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRw
czovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtYXVkaXQ=

