Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id D9C6D20DD29
	for <lists+linux-audit@lfdr.de>; Mon, 29 Jun 2020 23:38:51 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-n9SrcQRUNUSpHjXqfPoChA-1; Mon, 29 Jun 2020 17:38:48 -0400
X-MC-Unique: n9SrcQRUNUSpHjXqfPoChA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDD56107ACCA;
	Mon, 29 Jun 2020 21:38:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 68CF871665;
	Mon, 29 Jun 2020 21:38:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 210B887890;
	Mon, 29 Jun 2020 21:38:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05TLURdq005166 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 17:30:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 34994218CC03; Mon, 29 Jun 2020 21:30:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C87E2144B5D
	for <linux-audit@redhat.com>; Mon, 29 Jun 2020 21:30:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D591A8EF3A1
	for <linux-audit@redhat.com>; Mon, 29 Jun 2020 21:30:13 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-32-OBw2ejISMMSyte_vln9N_g-1; Mon, 29 Jun 2020 17:30:11 -0400
X-MC-Unique: OBw2ejISMMSyte_vln9N_g-1
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	05TL3oo4041094
	for <linux-audit@redhat.com>; Mon, 29 Jun 2020 17:30:10 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 31ydk9e64m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT)
	for <linux-audit@redhat.com>; Mon, 29 Jun 2020 17:30:10 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05TLTiJp191397
	for <linux-audit@redhat.com>; Mon, 29 Jun 2020 17:30:10 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
	[169.51.49.99])
	by mx0a-001b2d01.pphosted.com with ESMTP id 31ydk9e63h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 29 Jun 2020 17:30:09 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id
	05TLJIH4021282; Mon, 29 Jun 2020 21:30:07 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
	(b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma04ams.nl.ibm.com with ESMTP id 31wwr8atb6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 29 Jun 2020 21:30:07 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
	[9.149.105.59])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 05TLU51O55640508
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 29 Jun 2020 21:30:05 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A950A405D;
	Mon, 29 Jun 2020 21:30:05 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0B4A3A4040;
	Mon, 29 Jun 2020 21:30:04 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.137.220])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 29 Jun 2020 21:30:03 +0000 (GMT)
Message-ID: <1593466203.5085.62.camel@linux.ibm.com>
Subject: Re: [PATCH] ima: Rename internal audit rule functions
From: Mimi Zohar <zohar@linux.ibm.com>
To: Tyler Hicks <tyhicks@linux.microsoft.com>, Dmitry Kasatkin
	<dmitry.kasatkin@gmail.com>
Date: Mon, 29 Jun 2020 17:30:03 -0400
In-Reply-To: <20200629153037.337349-1-tyhicks@linux.microsoft.com>
References: <20200629153037.337349-1-tyhicks@linux.microsoft.com>
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
	definitions=2020-06-29_21:2020-06-29,
	2020-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	phishscore=0 mlxscore=0
	suspectscore=2 adultscore=0 mlxlogscore=999 lowpriorityscore=0
	clxscore=1015 bulkscore=0 malwarescore=0 cotscore=-2147483648
	impostorscore=0 spamscore=0 priorityscore=1501 classifier=spam adjust=0
	reason=mlx scancount=1 engine=8.12.0-2004280000
	definitions=main-2006290130
X-MIME-Autoconverted: from 8bit to quoted-printable by
	mx0a-001b2d01.pphosted.com id 05TL3oo4041094
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05TLURdq005166
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 29 Jun 2020 17:38:24 -0400
Cc: linux-kernel@vger.kernel.org, James Morris <jmorris@namei.org>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

W0NjJ2luZyB0aGUgYXVkaXQgbWFpbGluZyBsaXN0XQoKT24gTW9uLCAyMDIwLTA2LTI5IGF0IDEw
OjMwIC0wNTAwLCBUeWxlciBIaWNrcyB3cm90ZToKPiAKPiBkaWZmIC0tZ2l0IGEvc2VjdXJpdHkv
aW50ZWdyaXR5L2ltYS9pbWEuaCBiL3NlY3VyaXR5L2ludGVncml0eS9pbWEvaW1hLmgKPiBpbmRl
eCBmZjJiZjU3ZmYwYzcuLjVkNjJlZTgzMTlmNCAxMDA2NDQKPiAtLS0gYS9zZWN1cml0eS9pbnRl
Z3JpdHkvaW1hL2ltYS5oCj4gKysrIGIvc2VjdXJpdHkvaW50ZWdyaXR5L2ltYS9pbWEuaAo+IEBA
IC00MTksMjQgKzQxOSwyNCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgaW1hX2ZyZWVfbW9kc2lnKHN0
cnVjdCBtb2RzaWcgKm1vZHNpZykKPiAgLyogTFNNIGJhc2VkIHBvbGljeSBydWxlcyByZXF1aXJl
IGF1ZGl0ICovCj4gICNpZmRlZiBDT05GSUdfSU1BX0xTTV9SVUxFUwo+ICAKPiAtI2RlZmluZSBz
ZWN1cml0eV9maWx0ZXJfcnVsZV9pbml0IHNlY3VyaXR5X2F1ZGl0X3J1bGVfaW5pdAo+IC0jZGVm
aW5lIHNlY3VyaXR5X2ZpbHRlcl9ydWxlX2ZyZWUgc2VjdXJpdHlfYXVkaXRfcnVsZV9mcmVlCj4g
LSNkZWZpbmUgc2VjdXJpdHlfZmlsdGVyX3J1bGVfbWF0Y2ggc2VjdXJpdHlfYXVkaXRfcnVsZV9t
YXRjaAo+ICsjZGVmaW5lIGltYV9hdWRpdF9ydWxlX2luaXQgc2VjdXJpdHlfYXVkaXRfcnVsZV9p
bml0Cj4gKyNkZWZpbmUgaW1hX2F1ZGl0X3J1bGVfZnJlZSBzZWN1cml0eV9hdWRpdF9ydWxlX2Zy
ZWUKPiArI2RlZmluZSBpbWFfYXVkaXRfcnVsZV9tYXRjaCBzZWN1cml0eV9hdWRpdF9ydWxlX21h
dGNoCgpJbnN0ZWFkIG9mIGRlZmluaW5nIGFuIGVudGlyZWx5IG5ldyBtZXRob2Qgb2YgaWRlbnRp
ZnlpbmcgZmlsZXMsIElNQQpwaWdneWJhY2tzIG9uIHRvcCBvZiB0aGUgZXhpc3RpbmcgYXVkaXQg
cnVsZSBzeW50YXguIMKgSU1BIHBvbGljeSBydWxlcwoiZmlsdGVyIiBiYXNlZCBvbiB0aGlzIGlu
Zm9ybWF0aW9uLgoKSU1BIGFscmVhZHkgYXVkaXRzIHNlY3VyaXR5L2ludGVncml0eSByZWxhdGVk
IGV2ZW50cy4gwqBVc2luZyB0aGUgd29yZAoiYXVkaXQiIGhlcmUgd2lsbCBtYWtlIHRoaW5ncyBl
dmVuIG1vcmUgY29uZnVzaW5nIHRoYW4gdGhleSBjdXJyZW50bHkKYXJlLiDCoFJlbmFtaW5nIHRo
ZXNlIGZ1bmN0aW9ucyBhcyBpbWFfYXVkaXRfcnVsZV9YWFggcHJvdmlkZXMgbm8KYmVuZWZpdC4g
wqBBdCB0aGF0IHBvaW50LCBJTUEgbWlnaHQgYXMgd2VsbCBjYWxsIHRoZQpzZWN1cml0eV9hdWRp
dF9ydWxlIHByZWZpeGVkIGZ1bmN0aW9uIG5hbWVzIGRpcmVjdGx5LiDCoEFzIGEgcXVpY2sgZml4
LApyZW5hbWUgdGhlbSBhcyAiaW1hX2ZpbHRlcl9ydWxlIi4KClRoZSBjb3JyZWN0IHNvbHV0aW9u
IHdvdWxkIHByb2JhYmx5IGJlIHRvIHJlbmFtZSB0aGVzZSBwcmVmaXhlZAoic2VjdXJpdHlfYXVk
aXRfcnVsZSIgZnVuY3Rpb25zIGFzICJzZWN1cml0eV9maWx0ZXJfcnVsZSIsIHNvIHRoYXQKYm90
aCB0aGUgYXVkaXQgc3Vic3lzdGVtIGFuZCBJTUEgY291bGQgdXNlIHRoZW0uCgpNaW1pCgoKLS0K
TGludXgtYXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly93
d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0

