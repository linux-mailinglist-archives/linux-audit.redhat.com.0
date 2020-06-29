Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0640320D067
	for <lists+linux-audit@lfdr.de>; Mon, 29 Jun 2020 19:35:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593452124;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=S/o11jRXiPbNlUS2bpyKUvU7ZO1QjuckKZAmc0Tb7Fc=;
	b=ZYQuP17KTx4wRLWaYReTC01DNjj7eWB5D8T618bWiFqp5W1BxikiqWNJpzV8UJPXH/CLG8
	ngSq6yuTc55NnDbd+Ez52e1cpp/leI+jtPkpB6gUbTHQbMaBMoaLeCpkQk/aQcboc1IERK
	UfYuE29036x0yiRo5F4Iq05Puhlx3NY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-6wh3U6hkMGmG6ePzEgZUUg-1; Mon, 29 Jun 2020 13:35:20 -0400
X-MC-Unique: 6wh3U6hkMGmG6ePzEgZUUg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 412E5107B789;
	Mon, 29 Jun 2020 17:35:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A66617418F;
	Mon, 29 Jun 2020 17:35:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4791487890;
	Mon, 29 Jun 2020 17:35:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05TGvu6C002797 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 12:57:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7395D2156A4E; Mon, 29 Jun 2020 16:57:56 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F3B62157F25
	for <linux-audit@redhat.com>; Mon, 29 Jun 2020 16:57:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A1E5805C1E
	for <linux-audit@redhat.com>; Mon, 29 Jun 2020 16:57:53 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-502-aZiSe1xTPzGAgIj-ia-U5Q-1; Mon, 29 Jun 2020 12:57:46 -0400
X-MC-Unique: aZiSe1xTPzGAgIj-ia-U5Q-1
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	05TGXgPx147505; Mon, 29 Jun 2020 12:57:45 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 31ydjwpppm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 29 Jun 2020 12:57:45 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05TGYWfN152459;
	Mon, 29 Jun 2020 12:57:44 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
	[159.122.73.72])
	by mx0a-001b2d01.pphosted.com with ESMTP id 31ydjwppnf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 29 Jun 2020 12:57:44 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id
	05TGexbZ020434; Mon, 29 Jun 2020 16:57:42 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
	(d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma06fra.de.ibm.com with ESMTP id 31wwcgs7qb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 29 Jun 2020 16:57:42 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
	[9.149.105.61])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 05TGveue39518286
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 29 Jun 2020 16:57:40 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 31AA811C04C;
	Mon, 29 Jun 2020 16:57:40 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 57B4411C04A;
	Mon, 29 Jun 2020 16:57:39 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.137.220])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 29 Jun 2020 16:57:39 +0000 (GMT)
Message-ID: <1593449858.5085.24.camel@linux.ibm.com>
Subject: Re: [PATCH v3 2/2] IMA: Add audit log for failure conditions
From: Mimi Zohar <zohar@linux.ibm.com>
To: Paul Moore <paul@paul-moore.com>, Lakshmi Ramasubramanian
	<nramas@linux.microsoft.com>
Date: Mon, 29 Jun 2020 12:57:38 -0400
In-Reply-To: <CAHC9VhRQru30WtA-CMeqq=0GBtZ-Ut20ecHwpYfbEu5qCFqgDg@mail.gmail.com>
References: <20200618211012.2823-1-nramas@linux.microsoft.com>
	<20200618211012.2823-2-nramas@linux.microsoft.com>
	<1592942295.5389.9.camel@linux.ibm.com>
	<39d66bdc-55be-984a-42a0-34d0a011e0fb@linux.microsoft.com>
	<CAHC9VhRQru30WtA-CMeqq=0GBtZ-Ut20ecHwpYfbEu5qCFqgDg@mail.gmail.com>
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
	definitions=2020-06-29_18:2020-06-29,
	2020-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	lowpriorityscore=0
	adultscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
	malwarescore=0
	priorityscore=1501 spamscore=0 mlxscore=0 cotscore=-2147483648
	bulkscore=0
	suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.12.0-2004280000 definitions=main-2006290106
X-MIME-Autoconverted: from 8bit to quoted-printable by
	mx0a-001b2d01.pphosted.com id 05TGXgPx147505
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05TGvu6C002797
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 29 Jun 2020 13:34:49 -0400
Cc: rgb@redhat.com, linux-integrity@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-audit@redhat.com
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

T24gVGh1LCAyMDIwLTA2LTI1IGF0IDE1OjE0IC0wNDAwLCBQYXVsIE1vb3JlIHdyb3RlOgo+IE9u
IFdlZCwgSnVuIDI0LCAyMDIwIGF0IDE6MjUgUE0gTGFrc2htaSBSYW1hc3VicmFtYW5pYW4KPiA8
bnJhbWFzQGxpbnV4Lm1pY3Jvc29mdC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIDYvMjMvMjAgMTI6
NTggUE0sIE1pbWkgWm9oYXIgd3JvdGU6Cj4gPgo+ID4gSGkgU3RldmVcUGF1bCwKPiA+Cj4gPiA+
PiBTYW1wbGUgYXVkaXQgbWVzc2FnZXM6Cj4gPiA+Pgo+ID4gPj4gWyAgICA2LjMwMzA0OF0gYXVk
aXQ6IHR5cGU9MTgwNCBhdWRpdCgxNTkyNTA2MjgxLjYyNzoyKTogcGlkPTEgdWlkPTAKPiA+ID4+
IGF1aWQ9NDI5NDk2NzI5NSBzZXM9NDI5NDk2NzI5NSBzdWJqPWtlcm5lbCBvcD1tZWFzdXJpbmdf
a2V5Cj4gPiA+PiBjYXVzZT1FTk9NRU0gY29tbT0ic3dhcHBlci8wIiBuYW1lPSIuYnVpbHRpbl90
cnVzdGVkX2tleXMiIHJlcz0wCj4gPiA+PiBlcnJubz0tMTIKPiA+ID4KPiA+ID4gTXkgb25seSBj
b25jZXJuIGlzIHRoYXQgYXVkaXRpbmcgLUVOT01FTSB3aWxsIHB1dCBhZGRpdGlvbmFsIG1lbW9y
eQo+ID4gPiBwcmVzc3VyZSBvbiB0aGUgc3lzdGVtLiAgSSdtIG5vdCBzdXJlIGlmIHRoaXMgaXMg
YSBjb25jZXJuIGFuZCwgaWYgc28sCj4gPiA+IGhvdyBpdCBzaG91bGQgYmUgaGFuZGxlZC4KPiA+
Cj4gPiBEbyB5b3UgaGF2ZSBhbnkgY29uY2VybnMgd2l0aCByZXNwZWN0IHRvIGFkZGluZyBhdWRp
dCBtZXNzYWdlcyBpbiBsb3cKPiA+IG1lbW9yeSBjb25kaXRpb25zPwo+IAo+IEFzc3VtaW5nIHRo
ZSBzeXN0ZW0gaXMgbm90IGNvbXBsZXRlbHkgdG9hc3QsIHRoZSBhbGxvY2F0aW9uIGZhaWx1cmUK
PiBjb3VsZCBiZSBhIHZlcnkgdHJhbnNpZW50IGlzc3VlOyBJIHdvdWxkbid0IHdvcnJ5IHRvbyBt
dWNoIGFib3V0IGl0LgoKVGhlcmUgd2FzIGEgbWFqb3IgY2xlYW4gdXAgb2YgcmVtb3ZpbmcgRU5P
TUVNIGVycm9yIG1lc3NhZ2VzIHRocm91Z2gKb3V0IHRoZSBrZXJuZWwgYSB3aGlsZSBhZ28gYnkg
V29sZnJhbSBTYW5nLiDCoFRoZSBzdWJqZWN0IGxpbmVzCmluY2x1ZGVkICJkb24ndCBwcmludCBl
cnJvciB3aGVuIGFsbG9jYXRpbmcgWFhYIGZhaWxzIi4gwqBBcyBpdCB0dXJucwpvdXQsIHRoZXkg
d2VyZSBiZWluZyByZW1vdmVkIGJlY2F1c2UgImttYWxsb2Mgd2lsbCBwcmludCBlbm91Z2gKaW5m
b3JtYXRpb24gaW4gY2FzZSBvZiBmYWlsdXJlLiIgwqBJdCBoYWQgbm90aGluZyB0byBkbyB3aXRo
IG1lbW9yeQpwcmVzc3VyZSBvbiB0aGUgc3lzdGVtLgoKVGhhbmtzLCBQYXVsLiDCoEkgdGhpbmsg
d2UncmUgZ29vZC4KCk1pbWkKCgotLQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QKTGludXgtYXVk
aXRAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYXVkaXQ=

