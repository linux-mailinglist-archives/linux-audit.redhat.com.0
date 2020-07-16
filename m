Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 36E482225FB
	for <lists+linux-audit@lfdr.de>; Thu, 16 Jul 2020 16:40:39 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-ZO-3uxfQO-mDOpuaVm9Jtg-1; Thu, 16 Jul 2020 10:40:36 -0400
X-MC-Unique: ZO-3uxfQO-mDOpuaVm9Jtg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD6DA1DE3;
	Thu, 16 Jul 2020 14:40:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AF9D19C4F;
	Thu, 16 Jul 2020 14:40:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C77091809547;
	Thu, 16 Jul 2020 14:40:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06GENGDv029145 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 16 Jul 2020 10:23:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 753B41012DBF; Thu, 16 Jul 2020 14:23:16 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D1F010BC2AC
	for <linux-audit@redhat.com>; Thu, 16 Jul 2020 14:23:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80F438007D6
	for <linux-audit@redhat.com>; Thu, 16 Jul 2020 14:23:13 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-214-GWaWDKXxM3mVGYz2D46V_g-1; Thu, 16 Jul 2020 10:23:11 -0400
X-MC-Unique: GWaWDKXxM3mVGYz2D46V_g-1
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	06GE5qsW029407
	for <linux-audit@redhat.com>; Thu, 16 Jul 2020 10:23:09 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 329uejmxah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT)
	for <linux-audit@redhat.com>; Thu, 16 Jul 2020 10:23:09 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06GE8SBD039225
	for <linux-audit@redhat.com>; Thu, 16 Jul 2020 10:23:08 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
	[149.81.74.107])
	by mx0a-001b2d01.pphosted.com with ESMTP id 329uejmx8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 16 Jul 2020 10:23:08 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id
	06GEFwkI008327; Thu, 16 Jul 2020 14:23:05 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
	(d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma03fra.de.ibm.com with ESMTP id 327527jw4b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 16 Jul 2020 14:23:05 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
	[9.149.105.58])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 06GEN3Nm53215382
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 16 Jul 2020 14:23:03 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E68414C064;
	Thu, 16 Jul 2020 14:23:02 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DE8B34C046;
	Thu, 16 Jul 2020 14:23:01 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.80.202.131])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 16 Jul 2020 14:23:01 +0000 (GMT)
Message-ID: <1594909381.12900.361.camel@linux.ibm.com>
Subject: Re: [PATCH] ima: Rename internal audit rule functions
From: Mimi Zohar <zohar@linux.ibm.com>
To: Tyler Hicks <tyhicks@linux.microsoft.com>
Date: Thu, 16 Jul 2020 10:23:01 -0400
In-Reply-To: <20200710194234.GA7254@sequoia>
References: <20200629153037.337349-1-tyhicks@linux.microsoft.com>
	<1593466203.5085.62.camel@linux.ibm.com>
	<20200710194234.GA7254@sequoia>
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
	definitions=2020-07-16_06:2020-07-16,
	2020-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	mlxscore=0 bulkscore=0
	malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0
	suspectscore=2 mlxlogscore=999 clxscore=1015 lowpriorityscore=0
	impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2007160105
X-MIME-Autoconverted: from 8bit to quoted-printable by
	mx0a-001b2d01.pphosted.com id 06GE5qsW029407
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06GENGDv029145
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 16 Jul 2020 10:38:01 -0400
Cc: Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	James Morris <jmorris@namei.org>, linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	linux-integrity@vger.kernel.org, "Serge E . Hallyn" <serge@hallyn.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDIwLTA3LTEwIGF0IDE0OjQyIC0wNTAwLCBUeWxlciBIaWNrcyB3cm90ZToKPiBP
biAyMDIwLTA2LTI5IDE3OjMwOjAzLCBNaW1pIFpvaGFyIHdyb3RlOgo+ID4gW0NjJ2luZyB0aGUg
YXVkaXQgbWFpbGluZyBsaXN0XQo+ID4gCj4gPiBPbiBNb24sIDIwMjAtMDYtMjkgYXQgMTA6MzAg
LTA1MDAsIFR5bGVyIEhpY2tzIHdyb3RlOgo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL3NlY3Vy
aXR5L2ludGVncml0eS9pbWEvaW1hLmggYi9zZWN1cml0eS9pbnRlZ3JpdHkvaW1hL2ltYS5oCj4g
PiA+IGluZGV4IGZmMmJmNTdmZjBjNy4uNWQ2MmVlODMxOWY0IDEwMDY0NAo+ID4gPiAtLS0gYS9z
ZWN1cml0eS9pbnRlZ3JpdHkvaW1hL2ltYS5oCj4gPiA+ICsrKyBiL3NlY3VyaXR5L2ludGVncml0
eS9pbWEvaW1hLmgKPiA+ID4gQEAgLTQxOSwyNCArNDE5LDI0IEBAIHN0YXRpYyBpbmxpbmUgdm9p
ZCBpbWFfZnJlZV9tb2RzaWcoc3RydWN0IG1vZHNpZyAqbW9kc2lnKQo+ID4gPiAgLyogTFNNIGJh
c2VkIHBvbGljeSBydWxlcyByZXF1aXJlIGF1ZGl0ICovCj4gPiA+ICAjaWZkZWYgQ09ORklHX0lN
QV9MU01fUlVMRVMKPiA+ID4gIAo+ID4gPiAtI2RlZmluZSBzZWN1cml0eV9maWx0ZXJfcnVsZV9p
bml0IHNlY3VyaXR5X2F1ZGl0X3J1bGVfaW5pdAo+ID4gPiAtI2RlZmluZSBzZWN1cml0eV9maWx0
ZXJfcnVsZV9mcmVlIHNlY3VyaXR5X2F1ZGl0X3J1bGVfZnJlZQo+ID4gPiAtI2RlZmluZSBzZWN1
cml0eV9maWx0ZXJfcnVsZV9tYXRjaCBzZWN1cml0eV9hdWRpdF9ydWxlX21hdGNoCj4gPiA+ICsj
ZGVmaW5lIGltYV9hdWRpdF9ydWxlX2luaXQgc2VjdXJpdHlfYXVkaXRfcnVsZV9pbml0Cj4gPiA+
ICsjZGVmaW5lIGltYV9hdWRpdF9ydWxlX2ZyZWUgc2VjdXJpdHlfYXVkaXRfcnVsZV9mcmVlCj4g
PiA+ICsjZGVmaW5lIGltYV9hdWRpdF9ydWxlX21hdGNoIHNlY3VyaXR5X2F1ZGl0X3J1bGVfbWF0
Y2gKPiA+IAo+ID4gSW5zdGVhZCBvZiBkZWZpbmluZyBhbiBlbnRpcmVseSBuZXcgbWV0aG9kIG9m
IGlkZW50aWZ5aW5nIGZpbGVzLCBJTUEKPiA+IHBpZ2d5YmFja3Mgb24gdG9wIG9mIHRoZSBleGlz
dGluZyBhdWRpdCBydWxlIHN5bnRheC4gwqBJTUEgcG9saWN5IHJ1bGVzCj4gPiAiZmlsdGVyIiBi
YXNlZCBvbiB0aGlzIGluZm9ybWF0aW9uLgo+ID4gCj4gPiBJTUEgYWxyZWFkeSBhdWRpdHMgc2Vj
dXJpdHkvaW50ZWdyaXR5IHJlbGF0ZWQgZXZlbnRzLiDCoFVzaW5nIHRoZSB3b3JkCj4gPiAiYXVk
aXQiIGhlcmUgd2lsbCBtYWtlIHRoaW5ncyBldmVuIG1vcmUgY29uZnVzaW5nIHRoYW4gdGhleSBj
dXJyZW50bHkKPiA+IGFyZS4gwqBSZW5hbWluZyB0aGVzZSBmdW5jdGlvbnMgYXMgaW1hX2F1ZGl0
X3J1bGVfWFhYIHByb3ZpZGVzIG5vCj4gPiBiZW5lZml0LiDCoEF0IHRoYXQgcG9pbnQsIElNQSBt
aWdodCBhcyB3ZWxsIGNhbGwgdGhlCj4gPiBzZWN1cml0eV9hdWRpdF9ydWxlIHByZWZpeGVkIGZ1
bmN0aW9uIG5hbWVzIGRpcmVjdGx5LiDCoEFzIGEgcXVpY2sgZml4LAo+ID4gcmVuYW1lIHRoZW0g
YXMgImltYV9maWx0ZXJfcnVsZSIuCj4gPiAKPiA+IFRoZSBjb3JyZWN0IHNvbHV0aW9uIHdvdWxk
IHByb2JhYmx5IGJlIHRvIHJlbmFtZSB0aGVzZSBwcmVmaXhlZAo+ID4gInNlY3VyaXR5X2F1ZGl0
X3J1bGUiIGZ1bmN0aW9ucyBhcyAic2VjdXJpdHlfZmlsdGVyX3J1bGUiLCBzbyB0aGF0Cj4gPiBi
b3RoIHRoZSBhdWRpdCBzdWJzeXN0ZW0gYW5kIElNQSBjb3VsZCB1c2UgdGhlbS4KPiAKPiBUaGVy
ZSBkb2Vzbid0IHNlZW0gdG8gYmUgYW55IGludGVyZXN0LCBmcm9tIHRoZSBhdWRpdCBzaWRlLCBp
biByZS11c2luZwo+IHRoZXNlLiBJIGRvbid0IHF1aXRlIHVuZGVyc3RhbmQgd2h5IHRoZXkgd291
bGQgd2FudCB0byB1c2UgdGhlbSBzaW5jZQo+IHRoZXkncmUganVzdCBzaW1wbGUgd3JhcHBlcnMg
YXJvdW5kIHRoZSBzZWN1cml0eV9hdWRpdF9ydWxlXyooKQo+IGZ1bmN0aW9ucy4KClRoZSBzZWN1
cml0eV9maWx0ZXJfcnVsZV8qIHdhc24ndCBtZWFudCB0byBiZSBpbiBhZGRpdGlvbiwgYnV0IGFz
IGEKcmVwbGFjZW1lbnQgZm9yIHNlY3VyaXR5X2F1ZGl0X3J1bGVfKgo+IAo+IEknbGwgZ28gdGhl
ICJxdWljayBmaXgiIHJvdXRlIG9mIHJlbmFtaW5nIHRoZW0gYXMgaW1hX2ZpbHRlcl9ydWxlXyoo
KS4KClRoYXQncyBmaW5lLgoKTWltaQoKCi0tCkxpbnV4LWF1ZGl0IG1haWxpbmcgbGlzdApMaW51
eC1hdWRpdEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1hdWRpdA==

