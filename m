Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id D74B01F41E3
	for <lists+linux-audit@lfdr.de>; Tue,  9 Jun 2020 19:13:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591722830;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ChzXhy1LhUt6Xx2INQn0+M940pu2H97gPBJmOfJpVq8=;
	b=VUsfrFrX96R37qIjRTsqWS9ITT+vrlAxvh0cuEKWxGsP0cSFy4gS/6x/fG1tJ8uEJBJdNt
	ZYwsN7ABgDU/wnxh30MjpQ65fJ2hj8nPf0ZZrABSabIVCeq12RCaf8ssdZq9ybpsRuMF9m
	6mITTfdFE7Qw43+aaCPm3/9D6oaFEU0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-15Mml9LcOEWE1tPx2QjKCQ-1; Tue, 09 Jun 2020 13:13:48 -0400
X-MC-Unique: 15Mml9LcOEWE1tPx2QjKCQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87BE88015CB;
	Tue,  9 Jun 2020 17:13:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E95065D9E4;
	Tue,  9 Jun 2020 17:13:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C3E9BB349E;
	Tue,  9 Jun 2020 17:13:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 059H56rp029990 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 9 Jun 2020 13:05:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0C1B42156A3A; Tue,  9 Jun 2020 17:05:06 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0708D2156A2D
	for <linux-audit@redhat.com>; Tue,  9 Jun 2020 17:05:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9910B8007CB
	for <linux-audit@redhat.com>; Tue,  9 Jun 2020 17:05:03 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-105-0OmnVUACPeW1CWbpozycGA-1; Tue, 09 Jun 2020 13:05:00 -0400
X-MC-Unique: 0OmnVUACPeW1CWbpozycGA-1
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	059H2pio129178
	for <linux-audit@redhat.com>; Tue, 9 Jun 2020 13:04:59 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 31jayd7x5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT)
	for <linux-audit@redhat.com>; Tue, 09 Jun 2020 13:04:58 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 059H2uZd129877
	for <linux-audit@redhat.com>; Tue, 9 Jun 2020 13:04:58 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
	[169.51.49.98])
	by mx0a-001b2d01.pphosted.com with ESMTP id 31jayd7x4f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 09 Jun 2020 13:04:58 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id
	059GpPt1017646; Tue, 9 Jun 2020 17:04:56 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
	(d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma03ams.nl.ibm.com with ESMTP id 31g2s7xb8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 09 Jun 2020 17:04:56 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
	[9.149.105.59])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 059H4s9F64946398
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 9 Jun 2020 17:04:54 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E1FB9A4040;
	Tue,  9 Jun 2020 17:04:53 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 27BBDA404D;
	Tue,  9 Jun 2020 17:04:53 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.146.136])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue,  9 Jun 2020 17:04:53 +0000 (GMT)
Message-ID: <1591722292.5567.28.camel@linux.ibm.com>
Subject: Re: [PATCH v3] IMA: Add audit log for failure conditions
From: Mimi Zohar <zohar@linux.ibm.com>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>, paul@paul-moore.com
Date: Tue, 09 Jun 2020 13:04:52 -0400
In-Reply-To: <20200608215343.4491-1-nramas@linux.microsoft.com>
References: <20200608215343.4491-1-nramas@linux.microsoft.com>
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
	definitions=2020-06-09_10:2020-06-09,
	2020-06-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	mlxlogscore=999 spamscore=0
	priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0
	impostorscore=0 mlxscore=0 phishscore=0 adultscore=0
	cotscore=-2147483648
	malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.12.0-2004280000 definitions=main-2006090130
X-MIME-Autoconverted: from 8bit to quoted-printable by
	mx0a-001b2d01.pphosted.com id 059H2pio129178
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 059H56rp029990
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 09 Jun 2020 13:08:47 -0400
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

T24gTW9uLCAyMDIwLTA2LTA4IGF0IDE0OjUzIC0wNzAwLCBMYWtzaG1pIFJhbWFzdWJyYW1hbmlh
biB3cm90ZToKPiBUaGUgZmluYWwgbG9nIHN0YXRlbWVudCBpbiBwcm9jZXNzX2J1ZmZlcl9tZWFz
dXJlbWVudCgpIGZvciBmYWlsdXJlCj4gY29uZGl0aW9uIGlzIGF0IGRlYnVnIGxldmVsLiBUaGlz
IGRvZXMgbm90IGxvZyB0aGUgbWVzc2FnZSB1bmxlc3MKPiB0aGUgc3lzdGVtIGxvZyBsZXZlbCBp
cyByYWlzZWQgd2hpY2ggd291bGQgc2lnbmlmaWNhbnRseSBpbmNyZWFzZQo+IHRoZSBtZXNzYWdl
cyBpbiB0aGUgc3lzdGVtIGxvZy4gQ2hhbmdlIHRoaXMgbG9nIG1lc3NhZ2UgdG8gYW4gYXVkaXQK
PiBtZXNzYWdlIGZvciBiZXR0ZXIgdHJpYWdpbmcgZmFpbHVyZXMgaW4gdGhlIGZ1bmN0aW9uLgoK
V2UgbmVlZCB0byBkaWZmZXJlbnRpYXRlIGJldHdlZW4gZW1pdHRpbmcgdGhlIGVycm9yIG51bWJl
ciBmb3IKZGVidWdnaW5nIHB1cnBvc2VzIGFuZCBhdWRpdGluZyBpbnRlZ3JpdHkgZmFpbHVyZXMu
wqDCoFRoZSBwdXJwb3NlIG9mCnRoaXMgcGF0Y2ggc2hvdWxkIGJlIHRvIGF1ZGl0IGludGVncml0
eSBmYWlsdXJlcy4gwqBQbGVhc2UgdXBkYXRlIHRoZQpwYXRjaCBkZXNjcmlwdGlvbi4KCihJbmNs
dWRpbmcgdGhlICJlcnJubyIgYXMgU3RldmUgc3VnZ2VzdGVkIHdvdWxkIGJlIGZpbmUuKQoKPiAK
PiAgb3V0Ogo+IC0JaWYgKHJldCA8IDApCj4gLQkJcHJfZGV2ZWwoIiVzOiBmYWlsZWQsIHJlc3Vs
dDogJWRcbiIsIF9fZnVuY19fLCByZXQpOwo+ICsJaWYgKHJldCA8IDApIHsKPiArCQlzbnByaW50
ZihtZWFzdXJlbWVudF9hdWRpdF9jYXVzZSwgQVVESVRfQ0FVU0VfTEVOX01BWCwKPiArCQkJICIl
cyglZCkiLCBhdWRpdF9jYXVzZSwgcmV0KTsKClBsZWFzZSByZW1vdmUgdGhpcy4KCj4gKwo+ICsJ
CXN3aXRjaCAoZnVuYykgewo+ICsJCWNhc2UgS0VYRUNfQ01ETElORToKPiArCQkJb3AgPSAibWVh
c3VyaW5nX2tleGVjX2NtZGxpbmUiOwo+ICsJCQlicmVhazsKPiArCQljYXNlIEtFWV9DSEVDSzoK
PiArCQkJb3AgPSAibWVhc3VyaW5nX2tleXMiOwo+ICsJCQlicmVhazsKPiArCQlkZWZhdWx0Ogo+
ICsJCQlvcCA9ICJtZWFzdXJpbmdfYmxhY2tsaXN0ZWRfaGFzaCI7Cj4gKwkJCWJyZWFrOwo+ICsJ
CX0KCkluc3RlYWQgb2YgYSBzd2l0Y2gsIGRlZmluZSBhIHN0cmluZyBhcnJheSBiYXNlZCBvbiBm
dW5jLgoKPiArCj4gKwkJaW50ZWdyaXR5X2F1ZGl0X21zZyhBVURJVF9JTlRFR1JJVFlfUENSLCBO
VUxMLCBldmVudG5hbWUsCj4gKwkJCQkgICAgb3AsIG1lYXN1cmVtZW50X2F1ZGl0X2NhdXNlLCBy
ZXQsIDApOwoKVXNlICJhdWRpdF9jYXVzZSIuCgp0aGFua3MsCgpNaW1pCgo+ICsJfQoKCi0tCkxp
bnV4LWF1ZGl0IG1haWxpbmcgbGlzdApMaW51eC1hdWRpdEByZWRoYXQuY29tCmh0dHBzOi8vd3d3
LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1hdWRpdA==

