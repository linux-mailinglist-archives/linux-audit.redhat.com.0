Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 38CD21FBF89
	for <lists+linux-audit@lfdr.de>; Tue, 16 Jun 2020 22:01:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592337707;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NPvbigpU8TnJbPD/QV5rqo0ibL5wk1xbEkM7vMuoq9A=;
	b=e6sVJ2//5Vg7cR1Udi6MDFXUc5aFZBjlSIh0cRPT/u15Y6dri5PIeHxqo7BYf9J02VKjIn
	5J8LmgV662xH2SHrHJgeMTNT/oCAn1JmMAsoxklqnsqKbPvDDNN88bSwEYXPygKYD6GXkk
	NwadNTQZQb58+PvwKjddqxkcBZpWDqw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-ZuoSkZz8OL2PlsFwH2Qqkg-1; Tue, 16 Jun 2020 16:01:45 -0400
X-MC-Unique: ZuoSkZz8OL2PlsFwH2Qqkg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A5F3134CC;
	Tue, 16 Jun 2020 20:01:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EBA9B5D9D3;
	Tue, 16 Jun 2020 20:01:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B68B01809547;
	Tue, 16 Jun 2020 20:01:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05GJrtls029404 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 16 Jun 2020 15:53:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 74E8FB3028; Tue, 16 Jun 2020 19:53:55 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FD21B3509
	for <linux-audit@redhat.com>; Tue, 16 Jun 2020 19:53:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A1C65833B47
	for <linux-audit@redhat.com>; Tue, 16 Jun 2020 19:53:52 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-335-SJqHW5cANdybYpvyt8ge2A-1; Tue, 16 Jun 2020 15:53:48 -0400
X-MC-Unique: SJqHW5cANdybYpvyt8ge2A-1
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	05GJW5jD008726; Tue, 16 Jun 2020 15:53:47 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 31q1b1e3sh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 16 Jun 2020 15:53:46 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05GJohqI075593;
	Tue, 16 Jun 2020 15:53:46 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
	[169.51.49.99])
	by mx0a-001b2d01.pphosted.com with ESMTP id 31q1b1e3rx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 16 Jun 2020 15:53:46 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id
	05GJnhjp013450; Tue, 16 Jun 2020 19:53:44 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
	(d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma04ams.nl.ibm.com with ESMTP id 31mpe7wvcx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 16 Jun 2020 19:53:43 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 05GJrfI04063548
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 16 Jun 2020 19:53:41 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AA93E4203F;
	Tue, 16 Jun 2020 19:53:41 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C880642045;
	Tue, 16 Jun 2020 19:53:40 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.158.198])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 16 Jun 2020 19:53:40 +0000 (GMT)
Message-ID: <1592337220.11061.239.camel@linux.ibm.com>
Subject: Re: [PATCH 1/2] integrity: Add errno field in audit message
From: Mimi Zohar <zohar@linux.ibm.com>
To: Steve Grubb <sgrubb@redhat.com>, Lakshmi Ramasubramanian
	<nramas@linux.microsoft.com>
Date: Tue, 16 Jun 2020 15:53:40 -0400
In-Reply-To: <1717101.NiBDiG0Zly@x2>
References: <20200611000400.3771-1-nramas@linux.microsoft.com>
	<6643272.rC52FQZPYE@x2>
	<958966b6-9972-051f-a7d5-cd6d1beb3244@linux.microsoft.com>
	<1717101.NiBDiG0Zly@x2>
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
	definitions=2020-06-16_11:2020-06-16,
	2020-06-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	lowpriorityscore=0 phishscore=0 spamscore=0 mlxscore=0 malwarescore=0
	mlxlogscore=999 suspectscore=0 cotscore=-2147483648 adultscore=0
	bulkscore=0 clxscore=1015 impostorscore=0 classifier=spam adjust=0
	reason=mlx scancount=1 engine=8.12.0-2004280000
	definitions=main-2006160134
X-MIME-Autoconverted: from 8bit to quoted-printable by
	mx0a-001b2d01.pphosted.com id 05GJW5jD008726
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05GJrtls029404
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 16 Jun 2020 16:00:38 -0400
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDIwLTA2LTE2IGF0IDExOjU1IC0wNDAwLCBTdGV2ZSBHcnViYiB3cm90ZToKPiBP
biBUdWVzZGF5LCBKdW5lIDE2LCAyMDIwIDExOjQzOjMxIEFNIEVEVCBMYWtzaG1pIFJhbWFzdWJy
YW1hbmlhbiB3cm90ZToKPiA+IE9uIDYvMTYvMjAgODoyOSBBTSwgU3RldmUgR3J1YmIgd3JvdGU6
Cj4gPiA+Pj4+PiBUaGUgaWRlYSBpcyBhIGdvb2QgaWRlYSwgYnV0IHlvdSdyZSBhc3N1bWluZyB0
aGF0ICJyZXN1bHQiIGlzIGFsd2F5cwo+ID4gPj4+Pj4gZXJybm8uICBUaGF0IHdhcyBwcm9iYWJs
eSB0cnVlIG9yaWdpbmFsbHksIGJ1dCBpc24ndCBub3cuICBGb3IKPiA+ID4+Pj4+IGV4YW1wbGUs
IGltYV9hcHByYWlzZV9tZWFzdXJlbWVudCgpIGNhbGxzIHhhdHRyX3ZlcmlmeSgpLCB3aGljaAo+
ID4gPj4+Pj4gY29tcGFyZXMgdGhlIHNlY3VyaXR5LmltYSBoYXNoIHdpdGggdGhlIGNhbGN1bGF0
ZWQgZmlsZSBoYXNoLiAgT24KPiA+ID4+Pj4+IGZhaWx1cmUsIGl0IHJldHVybnMgdGhlIHJlc3Vs
dCBvZiBtZW1jbXAoKS4gIEVhY2ggYW5kIGV2ZXJ5IGNvZGUgcGF0aAo+ID4gPj4+Pj4gd2lsbCBu
ZWVkIHRvIGJlIGNoZWNrZWQuCj4gPiA+Pj4+IAo+ID4gPj4+PiBHb29kIGNhdGNoIE1pbWkuCj4g
PiA+Pj4+IAo+ID4gPj4+PiBJbnN0ZWFkIG9mICJlcnJubyIgc2hvdWxkIHdlIGp1c3QgdXNlICJy
ZXN1bHQiIGFuZCBsb2cgdGhlIHZhbHVlIGdpdmVuCj4gPiA+Pj4+IGluIHRoZSByZXN1bHQgcGFy
YW1ldGVyPwo+ID4gPj4+IAo+ID4gPj4+IFRoYXQgd291bGQgbGlrZWx5IGNvbGxpZGUgd2l0aCBh
bm90aGVyIGZpZWxkIG9mIHRoZSBzYW1lIG5hbWUgd2hpY2ggaXMKPiA+ID4+PiB0aGUKPiA+ID4+
PiBvcGVyYXRpb24ncyByZXN1bHRzLiBJZiBpdCByZWFsbHkgaXMgZXJybm8sIHRoZSBuYW1lIGlz
IGZpbmUuIEl0J3MKPiA+ID4+PiBnZW5lcmljCj4gPiA+Pj4gZW5vdWdoIHRoYXQgaXQgY2FuIGJl
IHJldXNlZCBvbiBvdGhlciBldmVudHMgaWYgdGhhdCBtYXR0ZXJlZC4KPiA+ID4+IAo+ID4gPj4g
U3RldmUsIHdoYXQgaXMgdGhlIGhpc3RvcmljYWwgcmVhc29uIHdoeSB3ZSBoYXZlIGJvdGggInJl
cyIgYW5kCj4gPiA+PiAicmVzdWx0IiBmb3IgaW5kaWNhdGluZyBhIGJvb2xlYW4gc3VjY2Vzcy9m
YWlsPyAgSSdtIGp1c3QgY3VyaW91cyBob3cKPiA+ID4+IHdlIGVuZGVkIHVwIHRoaXMgd2F5LCBh
bmQgd2hvIG1heSBzdGlsbCBiZSB1c2luZyAicmVzdWx0Ii4KPiA+ID4gCj4gPiA+IEkgdGhpbmsg
aXRzIHBhbSBhbmQgc29tZSBvdGhlciB1c2VyIHNwYWNlIHRoaW5ncyBkaWQgdGhpcy4gQnV0IGJl
Y2F1c2Ugb2YKPiA+ID4gbWl4ZWQgbWFjaGluZXMgaW4gZGF0YWNlbnRlcnMgc3VwcG9ydGluZyBt
dWx0aXBsZSB2ZXJzaW9ucyBvZiBPUywgd2UgaGF2ZQo+ID4gPiB0byBsZWF2ZSByZXN1bHQgYWxv
bmUuIEl0IGhhcyB0byBiZSAwLDEgb3Igc3VjY2Vzcy9mYWlsLiBXZSBjYW5ub3QgdXNlCj4gPiA+
IGl0IGZvciBlcnJuby4KPiA+IAo+ID4gQXMgTWltaSBoYWQgcG9pbnRlZCBvdXQsIHNpbmNlIHRo
ZSB2YWx1ZSBwYXNzZWQgaW4gcmVzdWx0IHBhcmFtZXRlciBpcwo+ID4gbm90IGFsd2F5cyBhbiBl
cnJvciBjb2RlLCAiZXJybm8iIGlzIG5vdCBhbiBhcHByb3ByaWF0ZSBuYW1lLgo+ID4gCj4gPiBD
YW4gd2UgYWRkIGEgbmV3IGZpZWxkLCBzYXksICJvcF9yZXN1bHQiIHRvIHJlcG9ydCB0aGUgcmVz
dWx0IG9mIHRoZQo+ID4gc3BlY2lmaWVkIG9wZXJhdGlvbj8KPiAKPiBTdXJlLiBCdXQgc2luY2Ug
aXQgaXMgZXJybm8gc29tZXRpbWVzLCBob3cgd291bGQgd2Uga25vdyB3aGVuIHRvIHRyYW5zbGF0
ZSAKPiBpdD8KClBlcmhhcHMgdGhlIHNvbHV0aW9uIGlzIG5vdCB0byBpbXBseSAicmVzIiBpcyAi
ZXJybm8iLCBidXQgcGFzcyBpdCBhcwphIHNlcGFyYXRlICJlcnJubyIgZmllbGQuIMKgVGhlbiBv
bmx5IGluY2x1ZGUgImVycm5vIiBpbiB0aGUgYXVkaXQKbWVzc2FnZSB3aGVuIGl0IGlzbid0IHpl
cm8uIMKgVGhpcyBhc3N1bWVzIHRoYXQgc29tZSBhdWRpdCBtZXNzYWdlcyBmb3IKdGhlIHNhbWUg
YXVkaXQgbnVtYmVyIGluY2x1ZGUgZXJybm8sIHdoaWxlIG90aGVycyBkbyBub3QuCgpXaXRoIHRo
aXMgc29sdXRpb24sIHRoZSBleGlzdGluZyBpbnRlZ3JpdHlfYXVkaXRfbXNnKCkgY291bGQgYmVj
b21lIGEKd3JhcHBlciBmb3IgdGhlIG5ldyBmdW5jdGlvbi4KCk1pbWkKCgotLQpMaW51eC1hdWRp
dCBtYWlsaW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQu
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtYXVkaXQ=

