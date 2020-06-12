Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 237361F9835
	for <lists+linux-audit@lfdr.de>; Mon, 15 Jun 2020 15:21:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592227264;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AfDtQq3owpVDvSRJ9BeDR8fNPOI+a0g6AY390wwR3fE=;
	b=D/BqNk8EBLCx4o3YbhwInlWUNRHYvF7+KkNvl6Obg7bn1mSgGWDwHUJC8QQpsRooJxBHAG
	tVMhQVu7j1VcAPsr0Zw99qH2b+tF0Conf6sU0po6WrjA5mSHvcyF7vCrXbpil27wfFJxMm
	AZQMcR6/Yof1Brn/ToAn0Wc5MxA88aI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-ozWV6FgkPP-l4AzUEhJlTg-1; Mon, 15 Jun 2020 09:21:02 -0400
X-MC-Unique: ozWV6FgkPP-l4AzUEhJlTg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECA8D18A8235;
	Mon, 15 Jun 2020 13:20:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E6CC7CADC;
	Mon, 15 Jun 2020 13:20:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 217B4180954D;
	Mon, 15 Jun 2020 13:20:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05CKOGaX020283 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 12 Jun 2020 16:24:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 17D32F5AC0; Fri, 12 Jun 2020 20:24:16 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 13365F5AF6
	for <linux-audit@redhat.com>; Fri, 12 Jun 2020 20:24:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 008A21859160
	for <linux-audit@redhat.com>; Fri, 12 Jun 2020 20:24:13 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-432-cREBsW6JM2mw3b1DWbeBeg-1; Fri, 12 Jun 2020 16:24:01 -0400
X-MC-Unique: cREBsW6JM2mw3b1DWbeBeg-1
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	05CJaKkq143035; Fri, 12 Jun 2020 16:23:58 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 31mg0v96ws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 12 Jun 2020 16:23:58 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05CKLMwr178341;
	Fri, 12 Jun 2020 16:23:57 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
	[169.51.49.99])
	by mx0a-001b2d01.pphosted.com with ESMTP id 31mg0v96vx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 12 Jun 2020 16:23:57 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id
	05CKLTIr027621; Fri, 12 Jun 2020 20:23:55 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
	(b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma04ams.nl.ibm.com with ESMTP id 31g2s83w5f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 12 Jun 2020 20:23:55 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
	[9.149.105.232])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 05CKMacX64160150
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Fri, 12 Jun 2020 20:22:36 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 33B3452050;
	Fri, 12 Jun 2020 20:23:53 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.133.187])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 4D0675204F;
	Fri, 12 Jun 2020 20:23:52 +0000 (GMT)
Message-ID: <1591993431.11061.116.camel@linux.ibm.com>
Subject: Re: [PATCH 2/2] IMA: Add audit log for failure conditions
From: Mimi Zohar <zohar@linux.ibm.com>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>, sgrubb@redhat.com,
	paul@paul-moore.com
Date: Fri, 12 Jun 2020 16:23:51 -0400
In-Reply-To: <20200611000400.3771-2-nramas@linux.microsoft.com>
References: <20200611000400.3771-1-nramas@linux.microsoft.com>
	<20200611000400.3771-2-nramas@linux.microsoft.com>
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
	definitions=2020-06-11_23:2020-06-11,
	2020-06-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	mlxscore=0 impostorscore=0
	adultscore=0 cotscore=-2147483648 malwarescore=0 phishscore=0
	clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
	mlxlogscore=999 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.12.0-2004280000 definitions=main-2006110174
X-MIME-Autoconverted: from 8bit to quoted-printable by
	mx0a-001b2d01.pphosted.com id 05CJaKkq143035
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05CKOGaX020283
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgTGFrc2htaSwKCkkgaGF2ZW4ndCB5ZXQgdGVzdGVkIHRoZSBwYXRjaC4gwqBCZWxvdyBhcmUg
YSBjb3VwbGUgb2YgY29tbWVudHMuCgpPbiBXZWQsIDIwMjAtMDYtMTAgYXQgMTc6MDQgLTA3MDAs
IExha3NobWkgUmFtYXN1YnJhbWFuaWFuIHdyb3RlOgo+IFRoZSBmaW5hbCBsb2cgc3RhdGVtZW50
IGluIHByb2Nlc3NfYnVmZmVyX21lYXN1cmVtZW50KCkgZm9yIGZhaWx1cmUKPiBjb25kaXRpb24g
aXMgYXQgZGVidWcgbGV2ZWwuIFRoaXMgZG9lcyBub3QgbG9nIHRoZSBtZXNzYWdlIHVubGVzcwo+
IHRoZSBzeXN0ZW0gbG9nIGxldmVsIGlzIHJhaXNlZCB3aGljaCB3b3VsZCBzaWduaWZpY2FudGx5
IGluY3JlYXNlCj4gdGhlIG1lc3NhZ2VzIGluIHRoZSBzeXN0ZW0gbG9nLiBDaGFuZ2UgdGhpcyB0
byBhbiBhdWRpdCBtZXNzYWdlIHRvCj4gYXVkaXQgaW50ZWdyaXR5IGZhaWx1cmVzIHdpdGggdGhl
ICJvcCIgZmllbGQgb2YgdGhlIGF1ZGl0IG1lc3NhZ2UKPiBzZXQgdG8gaW5kaWNhdGUgdGhlIG1l
YXN1cmVtZW50IG9wZXJhdGlvbiB0aGF0IGZhaWxlZC4KClRoZSBwcm9ibGVtIHdpdGggdGhlIGV4
aXN0aW5nICJwciIgbGV2ZWwgaXMga2luZCBvZiBpcnJlbGV2YW50LiDCoCBZb3UKY291bGQga2Vl
cCB0aGUgZXhpc3RpbmcgcHJfZGVidWcoKSBzdGF0ZW1lbnQsIGlmIHlvdSB3YW50ZWQgdG8uIMKg
VGhlCnJlYXNvbiBmb3IgYXVkaXRpbmcgYSBmYWlsdXJlIGlzIGJlY2F1c2UgaXQgaXMgImludGVn
cml0eSIgcmVsZXZhbnQgb3IKbW9yZSBnZW5lcmljYWxseSAic2VjdXJpdHkiIHJlbGV2YW50LiDC
oFRoZSBmaXJzdCBwYXRjaCBhZGRyZXNzZXMgdGhlCmNoYW5nZSBpbiB0aGUgYXVkaXQgbWVzc2Fn
ZSBmb3JtYXQuCgo+IAo+IEFsc28sIGFkZCBhbiBhdWRpdCBtZXNzYWdlIGZvciBmYWlsdXJlcyBp
biBpbWFfYWxsb2Nfa2V5X2VudHJ5KCkuCj4gCj4gU2FtcGxlIGF1ZGl0IG1lc3NhZ2VzOgo+IAo+
IFsgICAgNi4yODQzMjldIGF1ZGl0OiB0eXBlPTE4MDQgYXVkaXQoMTU5MTc1NjcyMy42Mjc6Mik6
IHBpZD0xIHVpZD0wCj4gYXVpZD00Mjk0OTY3Mjk1IHNlcz00Mjk0OTY3Mjk1IHN1Ymo9a2VybmVs
Cj4gb3A9bWVhc3VyaW5nX2tleGVjX2NtZGxpbmUgY2F1c2U9YWxsb2NfZW50cnkgZXJybm89LTEy
Cj4gY29tbT0ic3dhcHBlci8wIiBuYW1lPSJrZXhlYy1jbWRsaW5lIiByZXM9MAo+IAo+IFsgICAg
OC4wMTcxMjZdIGF1ZGl0OiB0eXBlPTE4MDQgYXVkaXQoMTU5MTc1NjcyNS4zNjA6MTApOiBwaWQ9
MQo+IHVpZD0wIGF1aWQ9NDI5NDk2NzI5NSBzZXM9NDI5NDk2NzI5NQo+IHN1Ymo9c3lzdGVtX3U6
c3lzdGVtX3I6aW5pdF90OnMwIG9wPW1lYXN1cmluZ19rZXkKPiBjYXVzZT1oYXNoaW5nX2Vycm9y
IGVycm5vPS0yMiBjb21tPSJzeXN0ZW1kIgo+IG5hbWU9Ii5idWlsdGluX3RydXN0ZWRfa2V5cyIg
cmVzPTAKPiAKPiBTaWduZWQtb2ZmLWJ5OiBMYWtzaG1pIFJhbWFzdWJyYW1hbmlhbiA8bnJhbWFz
QGxpbnV4Lm1pY3Jvc29mdC5jb20+Cj4gU3VnZ2VzdGVkLWJ5OiBNaW1pIFpvaGFyIDx6b2hhckBs
aW51eC5pYm0uY29tPgo+IC0tLQo+ICBzZWN1cml0eS9pbnRlZ3JpdHkvaW1hL2ltYS5oICAgICAg
ICAgICAgfCA0OCArKysrKysrKysrKysrKysrLS0tLS0tLS0tCj4gIHNlY3VyaXR5L2ludGVncml0
eS9pbWEvaW1hX21haW4uYyAgICAgICB8IDE4ICsrKysrKystLS0KPiAgc2VjdXJpdHkvaW50ZWdy
aXR5L2ltYS9pbWFfcG9saWN5LmMgICAgIHwgIDIgKy0KPiAgc2VjdXJpdHkvaW50ZWdyaXR5L2lt
YS9pbWFfcXVldWVfa2V5cy5jIHwgIDUgKysrCj4gIDQgZmlsZXMgY2hhbmdlZCwgNTEgaW5zZXJ0
aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3NlY3VyaXR5L2ludGVn
cml0eS9pbWEvaW1hLmggYi9zZWN1cml0eS9pbnRlZ3JpdHkvaW1hL2ltYS5oCj4gaW5kZXggZGY5
M2FjMjU4ZTAxLi5lNDIxMDFlZWJkNjkgMTAwNjQ0Cj4gLS0tIGEvc2VjdXJpdHkvaW50ZWdyaXR5
L2ltYS9pbWEuaAo+ICsrKyBiL3NlY3VyaXR5L2ludGVncml0eS9pbWEvaW1hLmgKPiBAQCAtMTg2
LDI3ICsxODYsNDMgQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBpbnQgaW1hX2hhc2hfa2V5KHU4
ICpkaWdlc3QpCj4gIAlyZXR1cm4gKGRpZ2VzdFswXSB8IGRpZ2VzdFsxXSA8PCA4KSAlIElNQV9N
RUFTVVJFX0hUQUJMRV9TSVpFOwo+ICB9Cj4gIAo+IC0jZGVmaW5lIF9faW1hX2hvb2tzKGhvb2sp
CQlcCj4gLQlob29rKE5PTkUpCQkJXAo+IC0JaG9vayhGSUxFX0NIRUNLKQkJXAo+IC0JaG9vayhN
TUFQX0NIRUNLKQkJXAo+IC0JaG9vayhCUFJNX0NIRUNLKQkJXAo+IC0JaG9vayhDUkVEU19DSEVD
SykJCVwKPiAtCWhvb2soUE9TVF9TRVRBVFRSKQkJXAo+IC0JaG9vayhNT0RVTEVfQ0hFQ0spCQlc
Cj4gLQlob29rKEZJUk1XQVJFX0NIRUNLKQkJXAo+IC0JaG9vayhLRVhFQ19LRVJORUxfQ0hFQ0sp
CVwKPiAtCWhvb2soS0VYRUNfSU5JVFJBTUZTX0NIRUNLKQlcCj4gLQlob29rKFBPTElDWV9DSEVD
SykJCVwKPiAtCWhvb2soS0VYRUNfQ01ETElORSkJCVwKPiAtCWhvb2soS0VZX0NIRUNLKQkJCVwK
PiAtCWhvb2soTUFYX0NIRUNLKQo+IC0jZGVmaW5lIF9faW1hX2hvb2tfZW51bWlmeShFTlVNKQlF
TlVNLAo+ICsjZGVmaW5lIF9faW1hX2hvb2tzKGhvb2spCQkJCVwKPiArCWhvb2soTk9ORSwgbm9u
ZSkJCQkJXAo+ICsJaG9vayhGSUxFX0NIRUNLLCBmaWxlKQkJCQlcCj4gKwlob29rKE1NQVBfQ0hF
Q0ssIG1tYXApCQkJCVwKPiArCWhvb2soQlBSTV9DSEVDSywgYnBybSkJCQkJXAo+ICsJaG9vayhD
UkVEU19DSEVDSywgY3JlZHMpCQkJXAo+ICsJaG9vayhQT1NUX1NFVEFUVFIsIHBvc3Rfc2V0YXR0
cikJCVwKPiArCWhvb2soTU9EVUxFX0NIRUNLLCBtb2R1bGUpCQkJXAo+ICsJaG9vayhGSVJNV0FS
RV9DSEVDSywgZmlybXdhcmUpCQkJXAo+ICsJaG9vayhLRVhFQ19LRVJORUxfQ0hFQ0ssIGtleGVj
X2tlcm5lbCkJCVwKPiArCWhvb2soS0VYRUNfSU5JVFJBTUZTX0NIRUNLLCBrZXhlY19pbml0cmFt
ZnMpCVwKPiArCWhvb2soUE9MSUNZX0NIRUNLLCBwb2xpY3kpCQkJXAo+ICsJaG9vayhLRVhFQ19D
TURMSU5FLCBrZXhlY19jbWRsaW5lKQkJXAo+ICsJaG9vayhLRVlfQ0hFQ0ssIGtleSkJCQkJXAo+
ICsJaG9vayhNQVhfQ0hFQ0ssIG5vbmUpCj4gKwo+ICsjZGVmaW5lIF9faW1hX2hvb2tfZW51bWlm
eShFTlVNLCBzdHIpCUVOVU0sCj4gKyNkZWZpbmUgX19pbWFfc3RyaW5naWZ5KGFyZykgKCNhcmcp
Cj4gKyNkZWZpbmUgX19pbWFfaG9va19tZWFzdXJpbmdfc3RyaW5naWZ5KEVOVU0sIHN0cikgXAo+
ICsJCShfX2ltYV9zdHJpbmdpZnkobWVhc3VyaW5nXyAjI3N0cikpLAo+ICAKPiAgZW51bSBpbWFf
aG9va3Mgewo+ICAJX19pbWFfaG9va3MoX19pbWFfaG9va19lbnVtaWZ5KQo+ICB9Owo+ICAKPiAr
c3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCBpbWFfaG9va3NfbWVhc3VyZV9zdHJbXSA9IHsKPiAr
CV9faW1hX2hvb2tzKF9faW1hX2hvb2tfbWVhc3VyaW5nX3N0cmluZ2lmeSkKPiArfTsKPiArCj4g
K3N0YXRpYyBpbmxpbmUgY29uc3QgY2hhciAqaW1hX2hvb2tzX2Z1bmNfbWVhc3VyZV9zdHIoZW51
bSBpbWFfaG9va3MgZnVuYykKCiJpbWFfaG9va3NfZnVuY19tZWFzdXJlX3N0ciIgaXMgYSBiaXQg
bG9uZy4gwqBUaGVyZSdzIG5vIHJlYXNvbiBmb3IKaGF2aW5nIGJvdGggImhvb2tzIiBhbmQgImZ1
bmMiIGluIHRoZSBuYW1lLiDCoEFsc28gdGhpcyBpcyBhIHN0YXRpYwpmdW5jdGlvbiwgc28gaXQg
ZG9lc24ndCByZWFsbHkgbmVlZCB0byBiZSBwcmVmaXhlZCB3aXRoICJpbWFfIi4gwqBNYXliZQp0
cnVuY2F0ZSBpdCB0byAiZnVuY19tZWFzdXJlX3N0cigpIiwgc2ltaWxhciB0byAiZnVuY190b2tl
biIuCgpNaW1pCgo+ICt7Cj4gKwlpZiAoZnVuYyA+PSBNQVhfQ0hFQ0spCj4gKwkJcmV0dXJuIGlt
YV9ob29rc19tZWFzdXJlX3N0cltOT05FXTsKPiArCj4gKwlyZXR1cm4gaW1hX2hvb2tzX21lYXN1
cmVfc3RyW2Z1bmNdOwo+ICt9Cj4gKwo+ICBleHRlcm4gY29uc3QgY2hhciAqY29uc3QgZnVuY190
b2tlbnNbXTsKCgotLQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0
LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtYXVkaXQ=

