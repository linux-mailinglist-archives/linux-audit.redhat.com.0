Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 92EBB1F9836
	for <lists+linux-audit@lfdr.de>; Mon, 15 Jun 2020 15:21:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592227265;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9wKcisCgjQeHRikwushf4Osza48M+eFYc9TA8tebau8=;
	b=eoNLMPhxT3e5RhB2FumzKNDobNDqtlySAf/0HocPDewezgYlvFjSEyiHfFtf2zFXqtyRWL
	WaV0N6C30/AvDsHG28sk5YZhrckgnfKQqRXkY7T5a1BoZqoIT1BVZKHmWcV05NKtYK0m7s
	mnPvQgAbEhKfXqnUAH6gg5eYF8TfQkI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-aVBhdkFePr-bwA6eHW7rDw-1; Mon, 15 Jun 2020 09:21:03 -0400
X-MC-Unique: aVBhdkFePr-bwA6eHW7rDw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E03F318A8234;
	Mon, 15 Jun 2020 13:20:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 936635C1C5;
	Mon, 15 Jun 2020 13:20:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 217B5833A9;
	Mon, 15 Jun 2020 13:20:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05CJPeH3015229 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 12 Jun 2020 15:25:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5A2032156A3B; Fri, 12 Jun 2020 19:25:40 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 559282157F23
	for <linux-audit@redhat.com>; Fri, 12 Jun 2020 19:25:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DA9F858EE8
	for <linux-audit@redhat.com>; Fri, 12 Jun 2020 19:25:38 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-120-wdlWz52XPWSlg80XPyoE4g-1; Fri, 12 Jun 2020 15:25:28 -0400
X-MC-Unique: wdlWz52XPWSlg80XPyoE4g-1
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	05CIXt2b114953; Fri, 12 Jun 2020 15:25:27 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com with ESMTP id 31m1vc0ptw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 12 Jun 2020 15:25:27 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05CIg3gv142032;
	Fri, 12 Jun 2020 15:25:26 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
	[169.51.49.98])
	by mx0b-001b2d01.pphosted.com with ESMTP id 31m1vc0pth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 12 Jun 2020 15:25:26 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id
	05CJLhMt029152; Fri, 12 Jun 2020 19:25:24 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
	(d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma03ams.nl.ibm.com with ESMTP id 31g2s83t5x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 12 Jun 2020 19:25:24 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
	[9.149.105.232])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 05CJPMuI63373472
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Fri, 12 Jun 2020 19:25:22 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0B6B652051;
	Fri, 12 Jun 2020 19:25:22 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.133.187])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 3569F5204F;
	Fri, 12 Jun 2020 19:25:21 +0000 (GMT)
Message-ID: <1591989920.11061.90.camel@linux.ibm.com>
Subject: Re: [PATCH 1/2] integrity: Add errno field in audit message
From: Mimi Zohar <zohar@linux.ibm.com>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>, sgrubb@redhat.com,
	paul@paul-moore.com
Date: Fri, 12 Jun 2020 15:25:20 -0400
In-Reply-To: <20200611000400.3771-1-nramas@linux.microsoft.com>
References: <20200611000400.3771-1-nramas@linux.microsoft.com>
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
	definitions=2020-06-11_23:2020-06-11,
	2020-06-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	malwarescore=0 mlxscore=0
	lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015
	phishscore=0
	mlxlogscore=999 cotscore=-2147483648 adultscore=0 spamscore=0
	suspectscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.12.0-2004280000 definitions=main-2006110174
X-MIME-Autoconverted: from 8bit to quoted-printable by
	mx0b-001b2d01.pphosted.com id 05CIXt2b114953
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05CJPeH3015229
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 15 Jun 2020 09:20:43 -0400
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDIwLTA2LTEwIGF0IDE3OjAzIC0wNzAwLCBMYWtzaG1pIFJhbWFzdWJyYW1hbmlh
biB3cm90ZToKPiBFcnJvciBjb2RlIGlzIG5vdCBpbmNsdWRlZCBpbiB0aGUgYXVkaXQgbWVzc2Fn
ZXMgbG9nZ2VkIGJ5Cj4gdGhlIGludGVncml0eSBzdWJzeXN0ZW0uIEFkZCBhIG5ldyBmaWVsZCBu
YW1lbHkgImVycm5vIiBpbgo+IHRoZSBhdWRpdCBtZXNzYWdlIGFuZCBzZXQgdGhlIHZhbHVlIHRv
IHRoZSBlcnJvciBjb2RlIHBhc3NlZAo+IHRvIGludGVncml0eV9hdWRpdF9tc2coKSBpbiB0aGUg
InJlc3VsdCIgcGFyYW1ldGVyLgo+IAo+IFNhbXBsZSBhdWRpdCBtZXNzYWdlOgo+IAo+IFsgICAg
Ni4yODQzMjldIGF1ZGl0OiB0eXBlPTE4MDQgYXVkaXQoMTU5MTc1NjcyMy42Mjc6Mik6IHBpZD0x
IHVpZD0wIGF1aWQ9NDI5NDk2NzI5NSBzZXM9NDI5NDk2NzI5NSBzdWJqPWtlcm5lbCBvcD1hZGRf
Ym9vdF9hZ2dyZWdhdGUgY2F1c2U9YWxsb2NfZW50cnkgZXJybm89LTEyIGNvbW09InN3YXBwZXIv
MCIgbmFtZT0iYm9vdF9hZ2dyZWdhdGUiIHJlcz0wCj4gCj4gU2lnbmVkLW9mZi1ieTogTGFrc2ht
aSBSYW1hc3VicmFtYW5pYW4gPG5yYW1hc0BsaW51eC5taWNyb3NvZnQuY29tPgo+IFN1Z2dlc3Rl
ZC1ieTogU3RldmUgR3J1YmIgPHNncnViYkByZWRoYXQuY29tPgotLS0KPiAgc2VjdXJpdHkvaW50
ZWdyaXR5L2ludGVncml0eV9hdWRpdC5jIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9zZWN1cml0eS9pbnRl
Z3JpdHkvaW50ZWdyaXR5X2F1ZGl0LmMgYi9zZWN1cml0eS9pbnRlZ3JpdHkvaW50ZWdyaXR5X2F1
ZGl0LmMKPiBpbmRleCA1MTA5MTczODM5Y2MuLjhjYmY0MTViYjk3NyAxMDA2NDQKPiAtLS0gYS9z
ZWN1cml0eS9pbnRlZ3JpdHkvaW50ZWdyaXR5X2F1ZGl0LmMKPiArKysgYi9zZWN1cml0eS9pbnRl
Z3JpdHkvaW50ZWdyaXR5X2F1ZGl0LmMKPiBAQCAtNDIsNyArNDIsOCBAQCB2b2lkIGludGVncml0
eV9hdWRpdF9tc2coaW50IGF1ZGl0X21zZ25vLCBzdHJ1Y3QgaW5vZGUgKmlub2RlLAo+ICAJCQkg
ZnJvbV9rdWlkKCZpbml0X3VzZXJfbnMsIGF1ZGl0X2dldF9sb2dpbnVpZChjdXJyZW50KSksCj4g
IAkJCSBhdWRpdF9nZXRfc2Vzc2lvbmlkKGN1cnJlbnQpKTsKPiAgCWF1ZGl0X2xvZ190YXNrX2Nv
bnRleHQoYWIpOwo+IC0JYXVkaXRfbG9nX2Zvcm1hdChhYiwgIiBvcD0lcyBjYXVzZT0lcyBjb21t
PSIsIG9wLCBjYXVzZSk7Cj4gKwlhdWRpdF9sb2dfZm9ybWF0KGFiLCAiIG9wPSVzIGNhdXNlPSVz
IGVycm5vPSVkIGNvbW09IiwKPiArCQkJIG9wLCBjYXVzZSwgcmVzdWx0KTsKClRoZSBpZGVhIGlz
IGEgZ29vZCBpZGVhLCBidXQgeW91J3JlIGFzc3VtaW5nIHRoYXQgInJlc3VsdCIgaXMgYWx3YXlz
CmVycm5vLiDCoFRoYXQgd2FzIHByb2JhYmx5IHRydWUgb3JpZ2luYWxseSwgYnV0IGlzbid0IG5v
dy4gwqBGb3IKZXhhbXBsZSwgaW1hX2FwcHJhaXNlX21lYXN1cmVtZW50KCkgY2FsbHMgeGF0dHJf
dmVyaWZ5KCksIHdoaWNoCmNvbXBhcmVzIHRoZSBzZWN1cml0eS5pbWEgaGFzaCB3aXRoIHRoZSBj
YWxjdWxhdGVkIGZpbGUgaGFzaC4gwqBPbgpmYWlsdXJlLCBpdCByZXR1cm5zIHRoZSByZXN1bHQg
b2YgbWVtY21wKCkuIMKgRWFjaCBhbmQgZXZlcnkgY29kZSBwYXRoCndpbGwgbmVlZCB0byBiZSBj
aGVja2VkLgoKPiAgCWF1ZGl0X2xvZ191bnRydXN0ZWRzdHJpbmcoYWIsIGdldF90YXNrX2NvbW0o
bmFtZSwgY3VycmVudCkpOwo+ICAJaWYgKGZuYW1lKSB7Cj4gIAkJYXVkaXRfbG9nX2Zvcm1hdChh
YiwgIiBuYW1lPSIpOwoKCi0tCkxpbnV4LWF1ZGl0IG1haWxpbmcgbGlzdApMaW51eC1hdWRpdEBy
ZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1h
dWRpdA==

