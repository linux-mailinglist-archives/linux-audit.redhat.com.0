Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id F0024139257
	for <lists+linux-audit@lfdr.de>; Mon, 13 Jan 2020 14:40:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578922852;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+SYWwSMxTu6a3U1UzdRQdqkivWMy9btXcwdh+tfCPP0=;
	b=SpSa3F+mixgu43rgMSCLyMKGXQ0nQ3Efv1iEROpeNq21eixirDo84EijXsWzToUKOPhhoK
	2ueGYycmBJpkclMQfNy8UVhtqVWQljkz/+PSV6njliJUJZAT8WRPsSqtsY1zYsjWUPB7EX
	bijob5++udkiYr5ibz1cWgPykw5VK7o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-vLrtR4BBPyi0thhNlRKO1A-1; Mon, 13 Jan 2020 08:40:50 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C149A8024D4;
	Mon, 13 Jan 2020 13:40:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE99E7BA50;
	Mon, 13 Jan 2020 13:40:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5FB0118089CD;
	Mon, 13 Jan 2020 13:40:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00CFbQao023175 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 12 Jan 2020 10:37:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1D5421003208; Sun, 12 Jan 2020 15:37:26 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 182521003207
	for <linux-audit@redhat.com>; Sun, 12 Jan 2020 15:37:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 01C27185A7B4
	for <linux-audit@redhat.com>; Sun, 12 Jan 2020 15:37:24 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-256-bruC_kqHOb620tNvKDXqvw-1; Sun, 12 Jan 2020 10:37:21 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	00CFb7WH057962
	for <linux-audit@redhat.com>; Sun, 12 Jan 2020 10:37:20 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2xfvaxb5tn-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-audit@redhat.com>; Sun, 12 Jan 2020 10:37:20 -0500
Received: from localhost
	by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <linux-audit@redhat.com> from <zohar@linux.ibm.com>;
	Sun, 12 Jan 2020 15:37:18 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
	by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Sun, 12 Jan 2020 15:37:13 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
	[9.149.105.62])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 00CFbCcO11862282
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Sun, 12 Jan 2020 15:37:12 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3D9F4AE045;
	Sun, 12 Jan 2020 15:37:12 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E23E4AE051;
	Sun, 12 Jan 2020 15:37:10 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.200.88])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Sun, 12 Jan 2020 15:37:10 +0000 (GMT)
Subject: Re: [PATCH v13 26/25] Audit: Multiple LSM support in audit rules
From: Mimi Zohar <zohar@linux.ibm.com>
To: Casey Schaufler <casey@schaufler-ca.com>, casey.schaufler@intel.com,
	jmorris@namei.org, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org
Date: Sun, 12 Jan 2020 10:37:10 -0500
In-Reply-To: <e6945c33-a540-9d0a-ba71-3602b8e38154@schaufler-ca.com>
References: <20191224235939.7483-1-casey.ref@schaufler-ca.com>
	<20191224235939.7483-1-casey@schaufler-ca.com>
	<ee5e4cea-b6c1-fa12-30de-8fc9007d69e9@schaufler-ca.com>
	<1578587607.5147.63.camel@linux.ibm.com>
	<e6945c33-a540-9d0a-ba71-3602b8e38154@schaufler-ca.com>
Mime-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 20011215-0008-0000-0000-00000348B768
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20011215-0009-0000-0000-00004A690461
Message-Id: <1578843430.4546.45.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
	definitions=2020-01-12_05:2020-01-10,
	2020-01-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	bulkscore=0 mlxlogscore=999
	phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
	priorityscore=1501 clxscore=1015 spamscore=0 mlxscore=0 malwarescore=0
	suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-1910280000 definitions=main-2001120148
X-MIME-Autoconverted: from 8bit to quoted-printable by
	mx0a-001b2d01.pphosted.com id 00CFb7WH057962
X-MC-Unique: bruC_kqHOb620tNvKDXqvw-1
X-MC-Unique: vLrtR4BBPyi0thhNlRKO1A-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00CFbQao023175
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 13 Jan 2020 08:40:19 -0500
Cc: john.johansen@canonical.com,
	"linux-audit@redhat.com" <linux-audit@redhat.com>,
	linux-integrity@vger.kernel.org, sds@tycho.nsa.gov
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDIwLTAxLTEwIGF0IDExOjQwIC0wODAwLCBDYXNleSBTY2hhdWZsZXIgd3JvdGU6
Cj4gT24gMS85LzIwMjAgODozMyBBTSwgTWltaSBab2hhciB3cm90ZToKPiA+IEhpIENhc2V5LAo+
ID4KPiA+IE9uIEZyaSwgMjAyMC0wMS0wMyBhdCAxMDo1MyAtMDgwMCwgQ2FzZXkgU2NoYXVmbGVy
IHdyb3RlOgo+ID4+IFdpdGggbXVsdGlwbGUgcG9zc2libGUgc2VjdXJpdHkgbW9kdWxlcyBzdXBw
b3J0aW5nIGF1ZGl0IHJ1bGUKPiA+PiBpdCBpcyBuZWNlc3NhcnkgdG8ga2VlcCBzZXBhcmF0ZSBk
YXRhIGZvciBlYWNoIG1vZHVsZSBpbiB0aGUKPiA+PiBhdWRpdCBydWxlcy4gVGhpcyBhZmZlY3Rz
IElNQSBhcyB3ZWxsLCBhcyBpdCByZS11c2VzIHRoZSBhdWRpdAo+ID4+IHJ1bGUgbGlzdCBtZWNo
YW5pc21zLgo+ID4gV2hpbGUgcmV2aWV3aW5nIHRoaXMgcGF0Y2gsIEkgcmVhbGl6ZWQgdGhlcmUg
d2FzIGEgYnVnIGluIHRoZSBiYXNlIElNQQo+ID4gY29kZS4gwqBXaXRoIEphbm5lJ3MgYnVnIGZp
eCwgdGhhdCBoZSBqdXN0IHBvc3RlZCwgSSB0aGluayB0aGlzIHBhdGNoCj4gPiBjYW4gbm93IGJl
IHNpbXBsaWZpZWQuCj4gCj4gSG93IGFuZCB3aGVuIGRvIHlvdSBwbGFuIHRvIGdldCBKYW5uZSdz
IGZpeCBpbj8gSXQncyBsb29raW5nIGxpa2UKPiBzdGFja2luZyB3b24ndCBiZSBpbiBmb3IgNS42
LgoKVGhlIHBhdGNoIGlzIG5vdyBpbiB0aGUgbmV4dC1pbnRlZ3JpdHktdGVzdGluZyBicmFuY2gu
IMKgV2UnbGwgc2VlIGhvdwppdCBnb2VzLgoKPiAKPiA+IE15IG1haW4gY29uY2VybiBpcyB0aGUg
bnVtYmVyIG9mIHdhcm5pbmcgbWVzc2FnZXMgdGhhdCB3aWxsIGJlCj4gPiBnZW5lcmF0ZWQuIMKg
QW55IHRpbWUgYSBuZXcgTFNNIHBvbGljeSBpcyBsb2FkZWQsIHRoZSBsYWJlbHMgd2lsbCBiZQo+
ID4gcmUtZXZhdWxhdGVkIHdoZXRoZXIgb3Igbm90IHRoZXkgYXJlIGFwcGxpY2FibGUgdG8gdGhl
IHBhcnRpY3VsYXIgTFNNLAo+ID4gY2F1c2luZyB1bm5lY2Vzc2FyeSB3YXJuaW5ncy4KPiAKPiBV
aGcuCgoKLS0KTGludXgtYXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20K
aHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0

