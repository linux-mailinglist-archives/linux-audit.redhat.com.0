Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id F39C31FFBBF
	for <lists+linux-audit@lfdr.de>; Thu, 18 Jun 2020 21:24:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592508277;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PxEpo3sFrBGhsNngqXkgvZ034yecQPPdJcPnxWeNT5Y=;
	b=E9VCqBrv61XuWchJszTYKdBYoJG6cOaQceQr83x2y4xix6iNBJM7+OM49Es9T/qFCR77Rw
	/k3VCVBFUE2m85PHdKb+dzRDOdHwjtRkR1eKYjuvNbo6WMoflw45jcCpiNlQ1EsoT3wYg+
	3Wl1dhoHSq6x5ecVB3k0ZH+pT8pUBQk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-pg5NWBfgN8CdWDm2cuWO-A-1; Thu, 18 Jun 2020 15:24:35 -0400
X-MC-Unique: pg5NWBfgN8CdWDm2cuWO-A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7961F184D146;
	Thu, 18 Jun 2020 19:24:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 071B871666;
	Thu, 18 Jun 2020 19:24:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 63F1E1809542;
	Thu, 18 Jun 2020 19:24:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05IHfsbl007598 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 18 Jun 2020 13:41:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4D7C82156A2D; Thu, 18 Jun 2020 17:41:54 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 481D72156A3A
	for <linux-audit@redhat.com>; Thu, 18 Jun 2020 17:41:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA783101A526
	for <linux-audit@redhat.com>; Thu, 18 Jun 2020 17:41:47 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-20-yOjF7UBuPlKCgy4oZ85i8Q-1; Thu, 18 Jun 2020 13:41:45 -0400
X-MC-Unique: yOjF7UBuPlKCgy4oZ85i8Q-1
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	05IH2ASi004724; Thu, 18 Jun 2020 13:41:44 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 31r560g2n4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 18 Jun 2020 13:41:44 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05IHAnhU036160;
	Thu, 18 Jun 2020 13:41:43 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
	[169.51.49.98])
	by mx0a-001b2d01.pphosted.com with ESMTP id 31r560g2m3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 18 Jun 2020 13:41:43 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id
	05IHdpFs029860; Thu, 18 Jun 2020 17:41:41 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
	(b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma03ams.nl.ibm.com with ESMTP id 31quax9fk6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 18 Jun 2020 17:41:40 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
	(b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 05IHfbrE59703556
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 18 Jun 2020 17:41:37 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 33C3CA405B;
	Thu, 18 Jun 2020 17:41:37 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 23E07A4054;
	Thu, 18 Jun 2020 17:41:36 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.80.230.246])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 18 Jun 2020 17:41:36 +0000 (GMT)
Message-ID: <1592502095.4615.42.camel@linux.ibm.com>
Subject: Re: [PATCH 2/2] integrity: Add errno field in audit message
From: Mimi Zohar <zohar@linux.ibm.com>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
	bauerman@linux.ibm.com, nayna@linux.ibm.com, sgrubb@redhat.com,
	paul@paul-moore.com
Date: Thu, 18 Jun 2020 13:41:35 -0400
In-Reply-To: <20200617204436.2226-2-nramas@linux.microsoft.com>
References: <20200617204436.2226-1-nramas@linux.microsoft.com>
	<20200617204436.2226-2-nramas@linux.microsoft.com>
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
	definitions=2020-06-18_14:2020-06-18,
	2020-06-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	phishscore=0 clxscore=1015
	adultscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
	lowpriorityscore=0
	bulkscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
	suspectscore=0
	cotscore=-2147483648 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2004280000 definitions=main-2006180125
X-MIME-Autoconverted: from 8bit to quoted-printable by
	mx0a-001b2d01.pphosted.com id 05IH2ASi004724
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05IHfsbl007598
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 18 Jun 2020 15:24:15 -0400
Cc: rgb@redhat.com, linux-integrity@vger.kernel.org, linux-audit@redhat.com,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDIwLTA2LTE3IGF0IDEzOjQ0IC0wNzAwLCBMYWtzaG1pIFJhbWFzdWJyYW1hbmlh
biB3cm90ZToKPiBFcnJvciBjb2RlIGlzIG5vdCBpbmNsdWRlZCBpbiB0aGUgYXVkaXQgbWVzc2Fn
ZXMgbG9nZ2VkIGJ5Cj4gdGhlIGludGVncml0eSBzdWJzeXN0ZW0uIEFkZCAiZXJybm8iIGZpZWxk
IGluIHRoZSBhdWRpdCBtZXNzYWdlcwo+IGxvZ2dlZCBieSB0aGUgaW50ZWdyaXR5IHN1YnN5c3Rl
bSBhbmQgc2V0IHRoZSB2YWx1ZSB0byB0aGUgZXJyb3IgY29kZQo+IHBhc3NlZCB0byBpbnRlZ3Jp
dHlfYXVkaXRfbXNnKCkgaW4gdGhlICJyZXN1bHQiIHBhcmFtZXRlci4KPiAKPiBTYW1wbGUgYXVk
aXQgbWVzc2FnZXM6Cj4gCj4gWyAgICA2LjI4NDMyOV0gYXVkaXQ6IHR5cGU9MTgwNCBhdWRpdCgx
NTkxNzU2NzIzLjYyNzoyKTogcGlkPTEgdWlkPTAgYXVpZD00Mjk0OTY3Mjk1IHNlcz00Mjk0OTY3
Mjk1IHN1Ymo9a2VybmVsIG9wPWFkZF9ib290X2FnZ3JlZ2F0ZSBjYXVzZT1hbGxvY19lbnRyeSBj
b21tPSJzd2FwcGVyLzAiIG5hbWU9ImJvb3RfYWdncmVnYXRlIiByZXM9MCBlcnJubz0tMTIKPiAK
PiBbICAgIDguMDg1NDU2XSBhdWRpdDogdHlwZT0xODAyIGF1ZGl0KDE1OTIwMDU5NDcuMjk3Ojkp
OiBwaWQ9MSB1aWQ9MCBhdWlkPTQyOTQ5NjcyOTUgc2VzPTQyOTQ5NjcyOTUgc3Viaj1zeXN0ZW1f
dTpzeXN0ZW1fcjppbml0X3Q6czAgb3A9cG9saWN5X3VwZGF0ZSBjYXVzZT1jb21wbGV0ZWQgY29t
bT0ic3lzdGVtZCIgcmVzPTEgZXJybm89MAo+IAo+IFNpZ25lZC1vZmYtYnk6IExha3NobWkgUmFt
YXN1YnJhbWFuaWFuIDxucmFtYXNAbGludXgubWljcm9zb2Z0LmNvbT4KPiBTdWdnZXN0ZWQtYnk6
IFN0ZXZlIEdydWJiIDxzZ3J1YmJAcmVkaGF0LmNvbT4KPiAtLS0KPiAgc2VjdXJpdHkvaW50ZWdy
aXR5L2ludGVncml0eV9hdWRpdC5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvc2VjdXJpdHkvaW50ZWdyaXR5
L2ludGVncml0eV9hdWRpdC5jIGIvc2VjdXJpdHkvaW50ZWdyaXR5L2ludGVncml0eV9hdWRpdC5j
Cj4gaW5kZXggNTEwOTE3MzgzOWNjLi5hMjY1MDI0ZjgyZjMgMTAwNjQ0Cj4gLS0tIGEvc2VjdXJp
dHkvaW50ZWdyaXR5L2ludGVncml0eV9hdWRpdC5jCj4gKysrIGIvc2VjdXJpdHkvaW50ZWdyaXR5
L2ludGVncml0eV9hdWRpdC5jCj4gQEAgLTUzLDYgKzUzLDYgQEAgdm9pZCBpbnRlZ3JpdHlfYXVk
aXRfbXNnKGludCBhdWRpdF9tc2dubywgc3RydWN0IGlub2RlICppbm9kZSwKPiAgCQlhdWRpdF9s
b2dfdW50cnVzdGVkc3RyaW5nKGFiLCBpbm9kZS0+aV9zYi0+c19pZCk7Cj4gIAkJYXVkaXRfbG9n
X2Zvcm1hdChhYiwgIiBpbm89JWx1IiwgaW5vZGUtPmlfaW5vKTsKPiAgCX0KPiAtCWF1ZGl0X2xv
Z19mb3JtYXQoYWIsICIgcmVzPSVkIiwgIXJlc3VsdCk7Cj4gKwlhdWRpdF9sb2dfZm9ybWF0KGFi
LCAiIHJlcz0lZCBlcnJubz0lZCIsICFyZXN1bHQsIHJlc3VsdCk7Cj4gIAlhdWRpdF9sb2dfZW5k
KGFiKTsKPiAgfQoKRm9yIHRoZSByZWFzb25zIHRoYXQgSSBtZW50aW9uZWQgcHJldmlvdXNseSwg
dW5sZXNzIG90aGVycyBhcmUgd2lsbGluZwp0byBhZGQgdGhlaXIgUmV2aWV3ZWQtYnkgdGFnIG5v
dCBmb3IgdGhlIGF1ZGl0IGFzcGVjdCBpbiBwYXJ0aWN1bGFyLApidXQgSU1BIGl0c2VsZiwgSSdt
IG5vdCBjb21mb3J0YWJsZSBtYWtpbmcgdGhpcyBjaGFuZ2UgYWxsIGF0IG9uY2UuCgpQcmV2aW91
c2x5IEkgc3VnZ2VzdGVkIG1ha2luZyB0aGUgZXhpc3RpbmcgaW50ZWdyaXR5X2F1ZGl0X21zZygp
IGEKd3JhcHBlciBmb3IgYSBuZXcgZnVuY3Rpb24gd2l0aCBlcnJuby4gwqBTdGV2ZSBzYWlkLCAi
V2Ugbm9ybWFsbHkgZG8Kbm90IGxpa2UgdG8gaGF2ZSBmaWVsZHMgdGhhdCBzd2luZyBpbiBhbmQg
b3V0IC4uLiIsIGJ1dCBzYWlkIHNldHRpbmcKZXJybm8gdG8gMCBpcyBmaW5lLiDCoFRoZSBvcmln
aW5hbCBpbnRlZ3JpdHlfYXVkaXRfbXNnKCkgZnVuY3Rpb24gd291bGQKY2FsbCB0aGUgbmV3IGZ1
bmN0aW9uIHdpdGggZXJybm8gc2V0IHRvIDAuCgpNaW1pCgoKLS0KTGludXgtYXVkaXQgbWFpbGlu
ZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0

