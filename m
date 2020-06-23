Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 76C5E205E49
	for <lists+linux-audit@lfdr.de>; Tue, 23 Jun 2020 22:22:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592943750;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ge77L91USQymJiLfWQS3LnBr4Zal/rs7jTH1Yag1QBk=;
	b=ge+uNWlns/9xjEuDC6vhl0EKdFX3gwoF7teTH0DxSkB0qhHAjZDTVUqg/cV52FswRAMAlJ
	6HGk0nRaHOlky3DaC74TIXDu4shgxB8zviFxdmyBwa2rq3PQ3Mox1GyrPY8kguArSZCXUL
	ZEW8C+69+0DO1vXnZY0lPd3JWaLyYf0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-IT521-NQMmW7JbM6JNaUTA-1; Tue, 23 Jun 2020 16:22:28 -0400
X-MC-Unique: IT521-NQMmW7JbM6JNaUTA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B4B464AD0;
	Tue, 23 Jun 2020 20:22:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E67FC60C80;
	Tue, 23 Jun 2020 20:22:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2C7C5833CB;
	Tue, 23 Jun 2020 20:22:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05NJwRGE019999 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 23 Jun 2020 15:58:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BA0BA2156720; Tue, 23 Jun 2020 19:58:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B59C22156A59
	for <linux-audit@redhat.com>; Tue, 23 Jun 2020 19:58:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F310858EFE
	for <linux-audit@redhat.com>; Tue, 23 Jun 2020 19:58:25 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-447-EI8JeY5VOwuZEEAJkUXUYA-1; Tue, 23 Jun 2020 15:58:22 -0400
X-MC-Unique: EI8JeY5VOwuZEEAJkUXUYA-1
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	05NJWUMI167937; Tue, 23 Jun 2020 15:58:22 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 31ukknsf56-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 23 Jun 2020 15:58:22 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05NJWYml168386;
	Tue, 23 Jun 2020 15:58:21 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
	[169.51.49.102])
	by mx0a-001b2d01.pphosted.com with ESMTP id 31ukknsf4j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 23 Jun 2020 15:58:21 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id
	05NJpGPC015998; Tue, 23 Jun 2020 19:58:19 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
	(d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma06ams.nl.ibm.com with ESMTP id 31uk3308nn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 23 Jun 2020 19:58:19 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
	(b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 05NJwHUE64159924
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 23 Jun 2020 19:58:17 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 900DCA405F;
	Tue, 23 Jun 2020 19:58:17 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 52A79A405B;
	Tue, 23 Jun 2020 19:58:16 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.163.175])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 23 Jun 2020 19:58:16 +0000 (GMT)
Message-ID: <1592942295.5389.9.camel@linux.ibm.com>
Subject: Re: [PATCH v3 2/2] IMA: Add audit log for failure conditions
From: Mimi Zohar <zohar@linux.ibm.com>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>, sgrubb@redhat.com,
	paul@paul-moore.com
Date: Tue, 23 Jun 2020 15:58:15 -0400
In-Reply-To: <20200618211012.2823-2-nramas@linux.microsoft.com>
References: <20200618211012.2823-1-nramas@linux.microsoft.com>
	<20200618211012.2823-2-nramas@linux.microsoft.com>
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
	definitions=2020-06-23_12:2020-06-23,
	2020-06-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	lowpriorityscore=0
	suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
	mlxlogscore=999 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
	impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1
	engine=8.12.0-2006120000 definitions=main-2006230130
X-MIME-Autoconverted: from 8bit to quoted-printable by
	mx0a-001b2d01.pphosted.com id 05NJWUMI167937
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05NJwRGE019999
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 23 Jun 2020 16:22:06 -0400
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDIwLTA2LTE4IGF0IDE0OjEwIC0wNzAwLCBMYWtzaG1pIFJhbWFzdWJyYW1hbmlh
biB3cm90ZToKPiBwcm9jZXNzX2J1ZmZlcl9tZWFzdXJlbWVudCgpIGFuZCBpbWFfYWxsb2Nfa2V5
X2VudHJ5KCkgZnVuY3Rpb25zIG5lZWQgdG8KPiBsb2cgYW4gYXVkaXQgbWVzc2FnZSBmb3IgYXVk
aXRpbmcgaW50ZWdyaXR5IG1lYXN1cmVtZW50IGZhaWx1cmVzLgo+IAo+IEFkZCBhdWRpdCBtZXNz
YWdlIGluIHRoZXNlIHR3byBmdW5jdGlvbnMuIFJlbW92ZSAicHJfZGV2ZWwiIGxvZyBtZXNzYWdl
Cj4gaW4gcHJvY2Vzc19idWZmZXJfbWVhc3VyZW1lbnQoKS4KPiAKPiBTYW1wbGUgYXVkaXQgbWVz
c2FnZXM6Cj4gCj4gWyAgICA2LjMwMzA0OF0gYXVkaXQ6IHR5cGU9MTgwNCBhdWRpdCgxNTkyNTA2
MjgxLjYyNzoyKTogcGlkPTEgdWlkPTAKPiBhdWlkPTQyOTQ5NjcyOTUgc2VzPTQyOTQ5NjcyOTUg
c3Viaj1rZXJuZWwgb3A9bWVhc3VyaW5nX2tleQo+IGNhdXNlPUVOT01FTSBjb21tPSJzd2FwcGVy
LzAiIG5hbWU9Ii5idWlsdGluX3RydXN0ZWRfa2V5cyIgcmVzPTAKPiBlcnJubz0tMTIKCk15IG9u
bHkgY29uY2VybiBpcyB0aGF0IGF1ZGl0aW5nIC1FTk9NRU0gd2lsbCBwdXQgYWRkaXRpb25hbCBt
ZW1vcnkKcHJlc3N1cmUgb24gdGhlIHN5c3RlbS4gwqBJJ20gbm90IHN1cmUgaWYgdGhpcyBpcyBh
IGNvbmNlcm4gYW5kLCBpZiBzbywKaG93IGl0IHNob3VsZCBiZSBoYW5kbGVkLgoKPiAKPiBbICAg
IDguMDE5NDMyXSBhdWRpdDogdHlwZT0xODA0IGF1ZGl0KDE1OTI1MDYyODMuMzQ0OjEwKTogcGlk
PTEKPiB1aWQ9MCBhdWlkPTQyOTQ5NjcyOTUgc2VzPTQyOTQ5NjcyOTUKPiBzdWJqPXN5c3RlbV91
OnN5c3RlbV9yOmluaXRfdDpzMCBvcD1tZWFzdXJpbmdfa2V4ZWNfY21kbGluZQo+IGNhdXNlPWhh
c2hpbmdfZXJyb3IgY29tbT0ic3lzdGVtZCIgbmFtZT0ia2V4ZWMtY21kbGluZSIgcmVzPTAKPiBl
cnJubz0tMjIKPiAKPiBTaWduZWQtb2ZmLWJ5OiBMYWtzaG1pIFJhbWFzdWJyYW1hbmlhbiA8bnJh
bWFzQGxpbnV4Lm1pY3Jvc29mdC5jb20+CgpSZXZpZXdlZC1ieTogTWltaSBab2hhciA8em9oYXJA
bGludXguaWJtLmNvbT4KCgotLQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QKTGludXgtYXVkaXRA
cmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
YXVkaXQ=

