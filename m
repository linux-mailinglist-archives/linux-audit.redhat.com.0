Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 77E081F18CA
	for <lists+linux-audit@lfdr.de>; Mon,  8 Jun 2020 14:32:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591619563;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4yK5STOSaDkBNDCsN6fc0OyfDGSoF1y8yf4E45Ks0ks=;
	b=Mb8nI+ZiXwgTjjcfK5/iYagKhpgfPyeOFcpkpvL5SBuvu0xFcM1smNjKqVCLVNuwhyrDSh
	3VoZxULmQEwjXbCD2UTnbDkWS8xMA42TmrKVPA3LXfeMv7AfYUewQROkBxXlwxXENucpg1
	HT9sWdN4LqfDxFAHMLyCFUL3XJnwH1M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-7TFswP1xPraUjWR4yg9MVg-1; Mon, 08 Jun 2020 08:32:41 -0400
X-MC-Unique: 7TFswP1xPraUjWR4yg9MVg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82ED5100A8EB;
	Mon,  8 Jun 2020 12:32:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A33C7F4ED;
	Mon,  8 Jun 2020 12:32:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 399BBADABD;
	Mon,  8 Jun 2020 12:32:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0571q2OZ029015 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 6 Jun 2020 21:52:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AF2E22026D67; Sun,  7 Jun 2020 01:52:02 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB1D62026D69
	for <linux-audit@redhat.com>; Sun,  7 Jun 2020 01:51:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B58D80CDB0
	for <linux-audit@redhat.com>; Sun,  7 Jun 2020 01:51:59 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-284-ooey94OQMH6Ana3vpLaTKw-1; Sat, 06 Jun 2020 21:51:57 -0400
X-MC-Unique: ooey94OQMH6Ana3vpLaTKw-1
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	0571VRrk085957
	for <linux-audit@redhat.com>; Sat, 6 Jun 2020 21:51:56 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com with ESMTP id 31g42r3raq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT)
	for <linux-audit@redhat.com>; Sat, 06 Jun 2020 21:51:56 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0571n6wT131293
	for <linux-audit@redhat.com>; Sat, 6 Jun 2020 21:51:55 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
	[149.81.74.108])
	by mx0b-001b2d01.pphosted.com with ESMTP id 31g42r3rad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sat, 06 Jun 2020 21:51:55 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id
	0571pAWX009322; Sun, 7 Jun 2020 01:51:54 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
	(d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma05fra.de.ibm.com with ESMTP id 31g2s7rkjh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sun, 07 Jun 2020 01:51:54 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
	(b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 0571pp2M30015578
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Sun, 7 Jun 2020 01:51:52 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E2113A4062;
	Sun,  7 Jun 2020 01:51:51 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5AB4BA4060;
	Sun,  7 Jun 2020 01:51:51 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.80.196.163])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Sun,  7 Jun 2020 01:51:51 +0000 (GMT)
Message-ID: <1591494710.4615.49.camel@linux.ibm.com>
Subject: Re: result logged in integrity audit message
From: Mimi Zohar <zohar@linux.ibm.com>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Date: Sat, 06 Jun 2020 21:51:50 -0400
In-Reply-To: <4c41ce1e-3f97-5b14-8152-5411a3debb57@linux.microsoft.com>
References: <4c41ce1e-3f97-5b14-8152-5411a3debb57@linux.microsoft.com>
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
	definitions=2020-06-06_20:2020-06-04,
	2020-06-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 impostorscore=0
	clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
	mlxlogscore=999 suspectscore=0 cotscore=-2147483648 lowpriorityscore=0
	adultscore=0 mlxscore=0 phishscore=0 classifier=spam adjust=0
	reason=mlx
	scancount=1 engine=8.12.0-2004280000 definitions=main-2006070005
X-MIME-Autoconverted: from 8bit to quoted-printable by
	mx0b-001b2d01.pphosted.com id 0571VRrk085957
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0571q2OZ029015
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 08 Jun 2020 08:32:21 -0400
Cc: linux-integrity@vger.kernel.org, linux-audit@redhat.com
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

SGkgTGFrc2htaSwKCk9uIEZyaSwgMjAyMC0wNi0wNSBhdCAyMDoxMyAtMDcwMCwgTGFrc2htaSBS
YW1hc3VicmFtYW5pYW4gd3JvdGU6Cj4gSGkgTWltaSwKPiAKPiBJbiBpbnRlZ3JpdHkgYXVkaXQg
bWVzc2FnZSBmdW5jdGlvbiB0aGUgaW52ZXJzZSBvZiAicmVzdWx0IiBpcyBiZWluZyAKPiBsb2dn
ZWQgZm9yICJyZXM9Ii4gUGxlYXNlIHNlZSBiZWxvdy4gSXMgdGhpcyBpbnRlbnRpb25hbD8KPiAK
PiB2b2lkIGludGVncml0eV9hdWRpdF9tc2coaW50IGF1ZGl0X21zZ25vLCBzdHJ1Y3QgaW5vZGUg
Kmlub2RlLAo+IAkJCSBjb25zdCB1bnNpZ25lZCBjaGFyICpmbmFtZSwgY29uc3QgY2hhciAqb3As
Cj4gCQkJIGNvbnN0IGNoYXIgKmNhdXNlLCBpbnQgcmVzdWx0LCBpbnQgYXVkaXRfaW5mbykKPiB7
Cj4gCj4gICAuLi4KPiAgIGF1ZGl0X2xvZ19mb3JtYXQoYWIsICIgcmVzPSVkIiwgIXJlc3VsdCk7
Cj4gfQo+IAo+IFRoZSBjYWxsZXJzIG9mIHRoaXMgZnVuY3Rpb24gYXJlIHBhc3NpbmcgYW4gZXJy
b3IgY29kZSAoLUVOT01FTSwgCj4gLUVJTlZBTCwgZXRjLikgaW4gdGhlICJyZXN1bHQiIHBhcmFt
ZXRlci4gQnV0IHRoYXQgZXJyb3IgY29kZSBpcyBsb3N0IC0gCj4gaW5zdGVhZCAicmVzIiBpcyBz
ZXQgdG8gMC4KPiAKPiBGb3IgZXhhbXBsZSwKPiAKPiBhdWRpdDogdHlwZT0xODA0IGF1ZGl0KDE1
OTE0MTE3MzcuNjMxOjMpOiBwaWQ9MSB1aWQ9MCBhdWlkPTQyOTQ5NjcyOTUgCj4gc2VzPTQyOTQ5
NjcyOTUgc3Viaj1rZXJuZWwgb3A9aW1hX2FsbG9jX2tleV9lbnRyeSBjYXVzZT1FTk9NRU0gCj4g
Y29tbT0ic3dhcHBlci8wIiBuYW1lPSIuYnVpbHRpbl90cnVzdGVkX2tleXMiIHJlcz0wCgpUaGUg
Y29tbWl0IG1lc3NhZ2UgcHJvdmlkZXMgYW4gZXhwbGFuYXRpb24uIMKgTG9vayBhdCBiMGQ1ZGU0
ZDU4ODAgKCJJTUE6IGZpeAphdWRpdCByZXMgZmllbGQgdG8gaW5kaWNhdGUgMSBmb3Igc3VjY2Vz
cyBhbmQgMCBmb3IgZmFpbHVyZSIpLgoKTWltaQoKCi0tCkxpbnV4LWF1ZGl0IG1haWxpbmcgbGlz
dApMaW51eC1hdWRpdEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hdWRpdA==

