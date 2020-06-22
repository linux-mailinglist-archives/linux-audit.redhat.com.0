Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id EBE9B204757
	for <lists+linux-audit@lfdr.de>; Tue, 23 Jun 2020 04:36:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592879811;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YQvB28soo+D2XixASe72jq2AHUcSZZvpuhIs+1B2JGQ=;
	b=LK4gLKI+aczpoG6AulfngC7iRJK5uKHdy2T1b1w7rC+rWfegPP6LZh1HqaYm+KoeoiGXSt
	QkeX8qudqjSNNKof1G3VvkwACpujI/hz8VgNGEbLTxJsJ8p4zPctXiDkxqSEIR1sjV7UE0
	JtXG8FyviUqDdHEfjrdVjE9+gNOubHE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-FPXZsObTPyO7WTDaOMkRTA-1; Mon, 22 Jun 2020 22:36:47 -0400
X-MC-Unique: FPXZsObTPyO7WTDaOMkRTA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A846D107ACCA;
	Tue, 23 Jun 2020 02:36:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0312F19D61;
	Tue, 23 Jun 2020 02:36:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 821EA180954D;
	Tue, 23 Jun 2020 02:36:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05MMRr0a002236 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 22 Jun 2020 18:27:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3832D215688E; Mon, 22 Jun 2020 22:27:53 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 33D3C2156A54
	for <linux-audit@redhat.com>; Mon, 22 Jun 2020 22:27:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2BA9280028B
	for <linux-audit@redhat.com>; Mon, 22 Jun 2020 22:27:50 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-47-DidJV7N6MEuXrzj_Dr7gbQ-1; Mon, 22 Jun 2020 18:27:44 -0400
X-MC-Unique: DidJV7N6MEuXrzj_Dr7gbQ-1
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	05MM2Pui067897; Mon, 22 Jun 2020 18:27:44 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 31tytuhyg2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 22 Jun 2020 18:27:43 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05MMPkRY126086;
	Mon, 22 Jun 2020 18:27:43 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
	[169.51.49.99])
	by mx0a-001b2d01.pphosted.com with ESMTP id 31tytuhyfh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 22 Jun 2020 18:27:43 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id
	05MMOV2x029015; Mon, 22 Jun 2020 22:27:41 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
	(d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma04ams.nl.ibm.com with ESMTP id 31sa37v1wa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 22 Jun 2020 22:27:41 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
	[9.149.105.58])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 05MMRdQg63635496
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 22 Jun 2020 22:27:39 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4343B4C05A;
	Mon, 22 Jun 2020 22:27:39 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 338FF4C05E;
	Mon, 22 Jun 2020 22:27:38 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.80.202.125])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 22 Jun 2020 22:27:38 +0000 (GMT)
Message-ID: <1592864857.4987.48.camel@linux.ibm.com>
Subject: Re: [PATCH v3 1/2] integrity: Add errno field in audit message
From: Mimi Zohar <zohar@linux.ibm.com>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>, sgrubb@redhat.com,
	paul@paul-moore.com
Date: Mon, 22 Jun 2020 18:27:37 -0400
In-Reply-To: <20200618211012.2823-1-nramas@linux.microsoft.com>
References: <20200618211012.2823-1-nramas@linux.microsoft.com>
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
	definitions=2020-06-22_15:2020-06-22,
	2020-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	phishscore=0 adultscore=0
	mlxlogscore=999 impostorscore=0 cotscore=-2147483648 lowpriorityscore=0
	clxscore=1015 mlxscore=0 malwarescore=0 bulkscore=0 spamscore=0
	suspectscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.12.0-2004280000 definitions=main-2006220138
X-MIME-Autoconverted: from 8bit to quoted-printable by
	mx0a-001b2d01.pphosted.com id 05MM2Pui067897
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05MMRr0a002236
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 22 Jun 2020 22:36:20 -0400
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDIwLTA2LTE4IGF0IDE0OjEwIC0wNzAwLCBMYWtzaG1pIFJhbWFzdWJyYW1hbmlh
biB3cm90ZToKPiBFcnJvciBjb2RlIGlzIG5vdCBpbmNsdWRlZCBpbiB0aGUgYXVkaXQgbWVzc2Fn
ZXMgbG9nZ2VkIGJ5Cj4gdGhlIGludGVncml0eSBzdWJzeXN0ZW0uCj4gCj4gRGVmaW5lIGEgbmV3
IGZ1bmN0aW9uIGludGVncml0eV9hdWRpdF9tZXNzYWdlKCkgdGhhdCB0YWtlcyBlcnJvciBjb2Rl
Cj4gaW4gdGhlICJlcnJubyIgcGFyYW1ldGVyLiBBZGQgImVycm5vIiBmaWVsZCBpbiB0aGUgYXVk
aXQgbWVzc2FnZXMgbG9nZ2VkCj4gYnkgdGhlIGludGVncml0eSBzdWJzeXN0ZW0gYW5kIHNldCB0
aGUgdmFsdWUgcGFzc2VkIGluIHRoZSAiZXJybm8iCj4gcGFyYW1ldGVyLgo+IAo+IFsgICAgNi4z
MDMwNDhdIGF1ZGl0OiB0eXBlPTE4MDQgYXVkaXQoMTU5MjUwNjI4MS42Mjc6Mik6IHBpZD0xIHVp
ZD0wIGF1aWQ9NDI5NDk2NzI5NSBzZXM9NDI5NDk2NzI5NSBzdWJqPWtlcm5lbCBvcD1tZWFzdXJp
bmdfa2V5IGNhdXNlPUVOT01FTSBjb21tPSJzd2FwcGVyLzAiIG5hbWU9Ii5idWlsdGluX3RydXN0
ZWRfa2V5cyIgcmVzPTAgZXJybm89LTEyCj4gCj4gWyAgICA3Ljk4NzY0N10gYXVkaXQ6IHR5cGU9
MTgwMiBhdWRpdCgxNTkyNTA2MjgzLjMxMjo5KTogcGlkPTEgdWlkPTAgYXVpZD00Mjk0OTY3Mjk1
IHNlcz00Mjk0OTY3Mjk1IHN1Ymo9c3lzdGVtX3U6c3lzdGVtX3I6aW5pdF90OnMwIG9wPXBvbGlj
eV91cGRhdGUgY2F1c2U9Y29tcGxldGVkIGNvbW09InN5c3RlbWQiIHJlcz0xIGVycm5vPTAKPiAK
PiBbICAgIDguMDE5NDMyXSBhdWRpdDogdHlwZT0xODA0IGF1ZGl0KDE1OTI1MDYyODMuMzQ0OjEw
KTogcGlkPTEgdWlkPTAgYXVpZD00Mjk0OTY3Mjk1IHNlcz00Mjk0OTY3Mjk1IHN1Ymo9c3lzdGVt
X3U6c3lzdGVtX3I6aW5pdF90OnMwIG9wPW1lYXN1cmluZ19rZXhlY19jbWRsaW5lIGNhdXNlPWhh
c2hpbmdfZXJyb3IgY29tbT0ic3lzdGVtZCIgbmFtZT0ia2V4ZWMtY21kbGluZSIgcmVzPTAgZXJy
bm89LTIyCj4gCj4gU2lnbmVkLW9mZi1ieTogTGFrc2htaSBSYW1hc3VicmFtYW5pYW4gPG5yYW1h
c0BsaW51eC5taWNyb3NvZnQuY29tPgo+IFN1Z2dlc3RlZC1ieTogU3RldmUgR3J1YmIgPHNncnVi
YkByZWRoYXQuY29tPgo+IFN1Z2dlc3RlZC1ieTogTWltaSBab2hhciA8em9oYXJAbGludXguaWJt
LmNvbT4KClRoYW5rcywgTGFrc2htaS4gwqBTdGV2ZSwgUGF1bCwgYmVjYXVzZSBvZiB0aGUgY29k
ZSBjaGFuZ2VzLCB5b3VyIHRhZ3MKd2VyZSBkcm9wcGVkLgoKTWltacKgCgoKLS0KTGludXgtYXVk
aXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0

