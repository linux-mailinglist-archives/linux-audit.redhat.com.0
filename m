Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5BB131FFBC0
	for <lists+linux-audit@lfdr.de>; Thu, 18 Jun 2020 21:24:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592508279;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xDpBFOFMXdjh+8CIrCkO5pHLgljKZuCZEg/gOMKPWTg=;
	b=iBhFrafmuIfMNeOETRECdUsfQUevUzQIbEDA36SehHVogwB7lFFFb94OPe0G/wv0vhKvw/
	bpFx++3I8RL4bd59SXi1d7ra1cs51Kc3VwkIzbPf3MscWQ+U/nCJ9olpxbs14Q5B9b6BEx
	CE95ePz6PJAjxda6wUlIFYvKL/aKlKA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-Mlvk2kTzMYWmf0-1_BPL3A-1; Thu, 18 Jun 2020 15:24:37 -0400
X-MC-Unique: Mlvk2kTzMYWmf0-1_BPL3A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A61398018AC;
	Thu, 18 Jun 2020 19:24:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 87A5C5EE0E;
	Thu, 18 Jun 2020 19:24:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 37D56833C6;
	Thu, 18 Jun 2020 19:24:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05IIAIud012055 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 18 Jun 2020 14:10:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 606212029F62; Thu, 18 Jun 2020 18:10:18 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AD0E2026E1C
	for <linux-audit@redhat.com>; Thu, 18 Jun 2020 18:10:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EAAED82A6F6
	for <linux-audit@redhat.com>; Thu, 18 Jun 2020 18:10:15 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-153-HXYknQE4OP-qn5RWnSD9qA-1; Thu, 18 Jun 2020 14:10:13 -0400
X-MC-Unique: HXYknQE4OP-qn5RWnSD9qA-1
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	05II1c1Q055669; Thu, 18 Jun 2020 14:10:12 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 31ra0vy1dd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 18 Jun 2020 14:10:12 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05II2fnZ058528;
	Thu, 18 Jun 2020 14:10:11 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
	[169.51.49.99])
	by mx0a-001b2d01.pphosted.com with ESMTP id 31ra0vy1c1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 18 Jun 2020 14:10:11 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id
	05IIA7wM007860; Thu, 18 Jun 2020 18:10:10 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
	(b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma04ams.nl.ibm.com with ESMTP id 31qur61fm0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 18 Jun 2020 18:10:09 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
	[9.149.105.62])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 05IIA6PO61210882
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 18 Jun 2020 18:10:06 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7B6AAAE06A;
	Thu, 18 Jun 2020 18:10:06 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E2B4AE05F;
	Thu, 18 Jun 2020 18:10:05 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.80.230.246])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 18 Jun 2020 18:10:05 +0000 (GMT)
Message-ID: <1592503804.4615.47.camel@linux.ibm.com>
Subject: Re: [PATCH 2/2] integrity: Add errno field in audit message
From: Mimi Zohar <zohar@linux.ibm.com>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
	bauerman@linux.ibm.com, nayna@linux.ibm.com, sgrubb@redhat.com,
	paul@paul-moore.com
Date: Thu, 18 Jun 2020 14:10:04 -0400
In-Reply-To: <8b3c99b9-6691-5ae2-a287-a22a2c801c59@linux.microsoft.com>
References: <20200617204436.2226-1-nramas@linux.microsoft.com>
	<20200617204436.2226-2-nramas@linux.microsoft.com>
	<1592502095.4615.42.camel@linux.ibm.com>
	<8b3c99b9-6691-5ae2-a287-a22a2c801c59@linux.microsoft.com>
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
	definitions=2020-06-18_14:2020-06-18,
	2020-06-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	mlxlogscore=999 clxscore=1015
	impostorscore=0 bulkscore=0 cotscore=-2147483648 lowpriorityscore=0
	mlxscore=0 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0
	phishscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.12.0-2004280000 definitions=main-2006180134
X-MIME-Autoconverted: from 8bit to quoted-printable by
	mx0a-001b2d01.pphosted.com id 05II1c1Q055669
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05IIAIud012055
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDIwLTA2LTE4IGF0IDExOjA1IC0wNzAwLCBMYWtzaG1pIFJhbWFzdWJyYW1hbmlh
biB3cm90ZToKPiBPbiA2LzE4LzIwIDEwOjQxIEFNLCBNaW1pIFpvaGFyIHdyb3RlOgo+IAo+ID4g
Cj4gPiBGb3IgdGhlIHJlYXNvbnMgdGhhdCBJIG1lbnRpb25lZCBwcmV2aW91c2x5LCB1bmxlc3Mg
b3RoZXJzIGFyZSB3aWxsaW5nCj4gPiB0byBhZGQgdGhlaXIgUmV2aWV3ZWQtYnkgdGFnIG5vdCBm
b3IgdGhlIGF1ZGl0IGFzcGVjdCBpbiBwYXJ0aWN1bGFyLAo+ID4gYnV0IElNQSBpdHNlbGYsIEkn
bSBub3QgY29tZm9ydGFibGUgbWFraW5nIHRoaXMgY2hhbmdlIGFsbCBhdCBvbmNlLgo+ID4gCj4g
PiBQcmV2aW91c2x5IEkgc3VnZ2VzdGVkIG1ha2luZyB0aGUgZXhpc3RpbmcgaW50ZWdyaXR5X2F1
ZGl0X21zZygpIGEKPiA+IHdyYXBwZXIgZm9yIGEgbmV3IGZ1bmN0aW9uIHdpdGggZXJybm8uIMKg
U3RldmUgc2FpZCwgIldlIG5vcm1hbGx5IGRvCj4gPiBub3QgbGlrZSB0byBoYXZlIGZpZWxkcyB0
aGF0IHN3aW5nIGluIGFuZCBvdXQgLi4uIiwgYnV0IHNhaWQgc2V0dGluZwo+ID4gZXJybm8gdG8g
MCBpcyBmaW5lLiDCoFRoZSBvcmlnaW5hbCBpbnRlZ3JpdHlfYXVkaXRfbXNnKCkgZnVuY3Rpb24g
d291bGQKPiA+IGNhbGwgdGhlIG5ldyBmdW5jdGlvbiB3aXRoIGVycm5vIHNldCB0byAwLgo+IAo+
IElmIHRoZSBvcmlnaW5hbCBpbnRlZ3JpdHlfYXVkaXRfbXNnKCkgYWx3YXlzIGNhbGxzIHRoZSBu
ZXcgZnVuY3Rpb24gd2l0aCAKPiBlcnJubyBzZXQgdG8gMCwgdGhlcmUgd291bGQgYmUgYXVkaXQg
bWVzc2FnZXMgd2hlcmUgInJlcyIgZmllbGQgaXMgc2V0IAo+IHRvICIwIiAoZmFpbCkgYmVjYXVz
ZSAicmVzdWx0IiB3YXMgbm9uLXplcm8sIGJ1dCBlcnJubyBzZXQgdG8gIjAiIAo+IChzdWNjZXNz
KS4gV291bGRuJ3QgdGhpcyBiZSBjb25mdXNpbmc/Cj4gCj4gSW4gUEFUQ0ggMS8yIEkndmUgbWFk
ZSBjaGFuZ2VzIHRvIG1ha2UgdGhlICJyZXN1bHQiIHBhcmFtZXRlciB0byAKPiBpbnRlZ3JpdHlf
YXVkaXRfbXNnKCkgY29uc2lzdGVudCAtIGkuZS4sIGl0IGlzIGFsd2F5cyBhbiBlcnJvciBjb2Rl
ICgwIAo+IGZvciBzdWNjZXNzIGFuZCBhIG5lZ2F0aXZlIHZhbHVlIGZvciBlcnJvcikuIFdvdWxk
IHRoYXQgYWRkcmVzcyB5b3VyIAo+IGNvbmNlcm5zPwoKWW91J3JlIG92ZXJsb2FkaW5nICJyZXMi
IHRvIGltcGx5IGVycm5vLiDCoERlZmluZSBhIG5ldyBwYXJhbWV0ZXIKc3BlY2lmaWNhbGx5IGZv
ciBlcnJuby4KCk1pbWkKCgotLQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QKTGludXgtYXVkaXRA
cmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
YXVkaXQ=

