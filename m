Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 4AB501F0448
	for <lists+linux-audit@lfdr.de>; Sat,  6 Jun 2020 04:51:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591411907;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=R1kvuOHrHGQA1IMvG7hQDIHb5EXxaICET1ao5/1rxWs=;
	b=g/xp4o8iUvtQj23LUT82avNHgigrL+Bp34LFmkFCVhyswRsRu7g9Y3C/LPWsGgu5znJ2jr
	eM9rZkiXLvFO9yYI7nQvIUB8J3VpnPwo0gc8fw086fjfUNaBCtcb9GAPbLuAI+BINW9226
	HKOzYCsrNQvCpWonfdhs8OPxg5stKmU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-S9fIoW6wMMOQTxDYx59dmQ-1; Fri, 05 Jun 2020 22:51:05 -0400
X-MC-Unique: S9fIoW6wMMOQTxDYx59dmQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E84711009441;
	Sat,  6 Jun 2020 02:50:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 56E6F5D9C5;
	Sat,  6 Jun 2020 02:50:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C3AB71809554;
	Sat,  6 Jun 2020 02:50:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 055LYoUE011219 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 5 Jun 2020 17:34:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 20FFA42AB2; Fri,  5 Jun 2020 21:34:50 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B9A16351C
	for <linux-audit@redhat.com>; Fri,  5 Jun 2020 21:34:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C952F801019
	for <linux-audit@redhat.com>; Fri,  5 Jun 2020 21:34:47 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-171-XPlLPw4KNz-tSkGmRpQwmg-1; Fri, 05 Jun 2020 17:34:41 -0400
X-MC-Unique: XPlLPw4KNz-tSkGmRpQwmg-1
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	055LWdZF154505
	for <linux-audit@redhat.com>; Fri, 5 Jun 2020 17:34:40 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 31fr7rta5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT)
	for <linux-audit@redhat.com>; Fri, 05 Jun 2020 17:34:40 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 055LWs8q156433
	for <linux-audit@redhat.com>; Fri, 5 Jun 2020 17:34:39 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
	[169.51.49.99])
	by mx0a-001b2d01.pphosted.com with ESMTP id 31fr7rta52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 05 Jun 2020 17:34:39 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id
	055LGgRe006768; Fri, 5 Jun 2020 21:34:37 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
	(d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma04ams.nl.ibm.com with ESMTP id 31bf484xr4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 05 Jun 2020 21:34:37 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
	[9.149.105.62])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 055LYZij65536072
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Fri, 5 Jun 2020 21:34:35 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F38F8AE045;
	Fri,  5 Jun 2020 21:34:34 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 11EE5AE055;
	Fri,  5 Jun 2020 21:34:34 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.80.234.64])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri,  5 Jun 2020 21:34:33 +0000 (GMT)
Message-ID: <1591392867.4615.20.camel@linux.ibm.com>
Subject: Re: [PATCH] IMA: Add log statements for failure conditions
From: Mimi Zohar <zohar@linux.ibm.com>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>, Paul Moore
	<paul@paul-moore.com>
Date: Fri, 05 Jun 2020 17:34:27 -0400
In-Reply-To: <48ff60f1-df93-5ce7-a254-8bfd1dba2ade@linux.microsoft.com>
References: <20200604163243.2575-1-nramas@linux.microsoft.com>
	<1591382782.5816.36.camel@linux.ibm.com>
	<CAHC9VhS-EP=Kk3GKRzAGAYa5mqupkLQCHz_m_DgoAKRWcSTgLA@mail.gmail.com>
	<8dfb3fa6-5c1f-d644-7d21-72a9448c52cc@linux.microsoft.com>
	<CAHC9VhS8gmrWxt75aHAE16PWAay7sUrffZiT0A8VLugwexK4Uw@mail.gmail.com>
	<48ff60f1-df93-5ce7-a254-8bfd1dba2ade@linux.microsoft.com>
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
	definitions=2020-06-05_07:2020-06-04,
	2020-06-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999
	clxscore=1011 phishscore=0 bulkscore=0 cotscore=-2147483648
	suspectscore=0
	spamscore=0 mlxscore=0 impostorscore=0 classifier=spam adjust=0
	reason=mlx
	scancount=1 engine=8.12.0-2004280000 definitions=main-2006050157
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 05 Jun 2020 22:50:43 -0400
Cc: tusharsu@linux.microsoft.com, linux-integrity@vger.kernel.org,
	linux-audit@redhat.com, linux-kernel@vger.kernel.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2020-06-05 at 14:09 -0700, Lakshmi Ramasubramanian wrote:
> On 6/5/20 1:49 PM, Paul Moore wrote:
> 
> > 
> >> Since a pr_xyz() call was already present, I just wanted to change the
> >> log level to keep the code change to the minimum. But if audit log is
> >> the right approach for this case, I'll update.
> > 
> > Generally we reserve audit for things that are required for various
> > security certifications and/or "security relevant".  From what you
> > mentioned above, it seems like this would fall into the second
> > category if not the first.
> > 
> > Looking at your patch it doesn't look like you are trying to record
> > anything special so you may be able to use the existing
> > integrity_audit_msg(...) helper.  Of course then the question comes
> > down to the audit record type (the audit_msgno argument), the
> > operation (op), and the comm/cause (cause).
> > 
> > Do you feel that any of the existing audit record types are a good fit for this?
> > 
> 
> Maybe I can use the audit_msgno "AUDIT_INTEGRITY_PCR" with appropriate 
> strings for "op" and "cause".
> 
> Mimi - please let me know if you think this audit_msgno would be ok to 
> use. I see this code used, for instance, for boot aggregate measurement.
> 
> integrity_audit_msg(AUDIT_INTEGRITY_PCR, NULL, boot_aggregate_name, op,
> 		    audit_cause, result, 0);

Yes, AUDIT_INTEGRITY_PCR is also used for failures to add to the
measurement list.

thanks,

Mimi

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

