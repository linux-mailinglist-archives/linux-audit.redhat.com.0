Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id A81161361DE
	for <lists+linux-audit@lfdr.de>; Thu,  9 Jan 2020 21:36:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578602178;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DyODycdB3/pJDuQ822i0qwwT+kE5WKdNgeEAR9l1Ky0=;
	b=HNDt7KRDU4rQAWQmuIY8Lw2fzsZy8OpuAsG9QS4ADHs6xdNx4FCfzkNgfmM+4n3AxG4TbC
	bi82TZzZc+f/oOZq5GQj4SdBJ1wO0aRj201lLXbdbiXE8FhDxJHFbRKXGSPngHgzxTEWrI
	kgpRbSyf/eNknif4rZPj0X3aeGfW3BY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-G3svYH2tPn-BlGo6ks7-yg-1; Thu, 09 Jan 2020 15:36:16 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 717BC911A4;
	Thu,  9 Jan 2020 20:36:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C71560C85;
	Thu,  9 Jan 2020 20:36:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1AC06503C2;
	Thu,  9 Jan 2020 20:35:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 009GXg1s012790 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 9 Jan 2020 11:33:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5F9DF2166B2B; Thu,  9 Jan 2020 16:33:42 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59F602166B28
	for <linux-audit@redhat.com>; Thu,  9 Jan 2020 16:33:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F23DE8E6820
	for <linux-audit@redhat.com>; Thu,  9 Jan 2020 16:33:39 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-319-Q-NQEFNjPnSER_1buW-lMg-1; Thu, 09 Jan 2020 11:33:38 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	009GNSO7096612
	for <linux-audit@redhat.com>; Thu, 9 Jan 2020 11:33:37 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2xe3j8ueaj-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-audit@redhat.com>; Thu, 09 Jan 2020 11:33:37 -0500
Received: from localhost
	by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <linux-audit@redhat.com> from <zohar@linux.ibm.com>;
	Thu, 9 Jan 2020 16:33:36 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
	by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Thu, 9 Jan 2020 16:33:30 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
	[9.149.105.59])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 009GXT0b40698010
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 9 Jan 2020 16:33:29 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A49CBA4055;
	Thu,  9 Jan 2020 16:33:29 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 52DFFA404D;
	Thu,  9 Jan 2020 16:33:28 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.153.42])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu,  9 Jan 2020 16:33:28 +0000 (GMT)
Subject: Re: [PATCH v13 26/25] Audit: Multiple LSM support in audit rules
From: Mimi Zohar <zohar@linux.ibm.com>
To: Casey Schaufler <casey@schaufler-ca.com>, casey.schaufler@intel.com,
	jmorris@namei.org, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org
Date: Thu, 09 Jan 2020 11:33:27 -0500
In-Reply-To: <ee5e4cea-b6c1-fa12-30de-8fc9007d69e9@schaufler-ca.com>
References: <20191224235939.7483-1-casey.ref@schaufler-ca.com>
	<20191224235939.7483-1-casey@schaufler-ca.com>
	<ee5e4cea-b6c1-fa12-30de-8fc9007d69e9@schaufler-ca.com>
Mime-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 20010916-0012-0000-0000-0000037BF9E3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20010916-0013-0000-0000-000021B81BDA
Message-Id: <1578587607.5147.63.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
	definitions=2020-01-09_03:2020-01-09,
	2020-01-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	clxscore=1011
	priorityscore=1501 mlxscore=0 phishscore=0 adultscore=0 bulkscore=0
	lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
	suspectscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.12.0-1910280000 definitions=main-2001090140
X-MIME-Autoconverted: from 8bit to quoted-printable by
	mx0a-001b2d01.pphosted.com id 009GNSO7096612
X-MC-Unique: Q-NQEFNjPnSER_1buW-lMg-1
X-MC-Unique: G3svYH2tPn-BlGo6ks7-yg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 009GXg1s012790
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 09 Jan 2020 15:35:44 -0500
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQ2FzZXksCgpPbiBGcmksIDIwMjAtMDEtMDMgYXQgMTA6NTMgLTA4MDAsIENhc2V5IFNjaGF1
ZmxlciB3cm90ZToKPiBXaXRoIG11bHRpcGxlIHBvc3NpYmxlIHNlY3VyaXR5IG1vZHVsZXMgc3Vw
cG9ydGluZyBhdWRpdCBydWxlCj4gaXQgaXMgbmVjZXNzYXJ5IHRvIGtlZXAgc2VwYXJhdGUgZGF0
YSBmb3IgZWFjaCBtb2R1bGUgaW4gdGhlCj4gYXVkaXQgcnVsZXMuIFRoaXMgYWZmZWN0cyBJTUEg
YXMgd2VsbCwgYXMgaXQgcmUtdXNlcyB0aGUgYXVkaXQKPiBydWxlIGxpc3QgbWVjaGFuaXNtcy4K
CldoaWxlIHJldmlld2luZyB0aGlzIHBhdGNoLCBJIHJlYWxpemVkIHRoZXJlIHdhcyBhIGJ1ZyBp
biB0aGUgYmFzZSBJTUEKY29kZS4gwqBXaXRoIEphbm5lJ3MgYnVnIGZpeCwgdGhhdCBoZSBqdXN0
IHBvc3RlZCwgSSB0aGluayB0aGlzIHBhdGNoCmNhbiBub3cgYmUgc2ltcGxpZmllZC4KCk15IG1h
aW4gY29uY2VybiBpcyB0aGUgbnVtYmVyIG9mIHdhcm5pbmcgbWVzc2FnZXMgdGhhdCB3aWxsIGJl
CmdlbmVyYXRlZC4gwqBBbnkgdGltZSBhIG5ldyBMU00gcG9saWN5IGlzIGxvYWRlZCwgdGhlIGxh
YmVscyB3aWxsIGJlCnJlLWV2YXVsYXRlZCB3aGV0aGVyIG9yIG5vdCB0aGV5IGFyZSBhcHBsaWNh
YmxlIHRvIHRoZSBwYXJ0aWN1bGFyIExTTSwKY2F1c2luZyB1bm5lY2Vzc2FyeSB3YXJuaW5ncy4K
Ck1pbWkKCgotLQpMaW51eC1hdWRpdCBtYWlsaW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNv
bQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtYXVkaXQ=

