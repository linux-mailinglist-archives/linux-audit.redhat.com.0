Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4CB752E7574
	for <lists+linux-audit@lfdr.de>; Wed, 30 Dec 2020 02:10:35 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-Pw4lYaTZNGyI0MS3mWJwNQ-1; Tue, 29 Dec 2020 20:10:31 -0500
X-MC-Unique: Pw4lYaTZNGyI0MS3mWJwNQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8E9A18C89DC;
	Wed, 30 Dec 2020 01:10:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A33A5F7D8;
	Wed, 30 Dec 2020 01:10:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5CC93180954D;
	Wed, 30 Dec 2020 01:10:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BSJi9kT002481 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 28 Dec 2020 14:44:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0ADC09D482; Mon, 28 Dec 2020 19:44:09 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0530A7C27
	for <linux-audit@redhat.com>; Mon, 28 Dec 2020 19:44:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D6E99858EEC
	for <linux-audit@redhat.com>; Mon, 28 Dec 2020 19:44:06 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-240-Yt8scxChPpKynIvnOCm09w-1; Mon, 28 Dec 2020 14:44:04 -0500
X-MC-Unique: Yt8scxChPpKynIvnOCm09w-1
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	0BSJWlTh087180
	for <linux-audit@redhat.com>; Mon, 28 Dec 2020 14:44:04 -0500
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com with ESMTP id 35qmwts064-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT)
	for <linux-audit@redhat.com>; Mon, 28 Dec 2020 14:44:04 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BSJWmJi087289
	for <linux-audit@redhat.com>; Mon, 28 Dec 2020 14:44:03 -0500
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
	[149.81.74.106])
	by mx0b-001b2d01.pphosted.com with ESMTP id 35qmwts05k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 28 Dec 2020 14:44:03 -0500
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id
	0BSJfdFM019890; Mon, 28 Dec 2020 19:44:02 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
	(b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma04fra.de.ibm.com with ESMTP id 35nvt895fp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 28 Dec 2020 19:44:02 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
	(b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 0BSJhv9X28639742
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 28 Dec 2020 19:43:57 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA7C7A405C;
	Mon, 28 Dec 2020 19:43:59 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A9390A405F;
	Mon, 28 Dec 2020 19:43:56 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown
	[9.160.72.172])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 28 Dec 2020 19:43:56 +0000 (GMT)
Message-ID: <564953d7ffb847365236a37639b81cbb7bca2aa6.camel@linux.ibm.com>
Subject: Re: [PATCH v23 02/23] LSM: Create and manage the lsmblob data
	structure.
From: Mimi Zohar <zohar@linux.ibm.com>
To: Casey Schaufler <casey@schaufler-ca.com>, casey.schaufler@intel.com,
	jmorris@namei.org, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org
Date: Mon, 28 Dec 2020 14:43:55 -0500
In-Reply-To: <c88bc01f-3b65-f320-b42b-5ecde3e29448@schaufler-ca.com>
References: <20201120201507.11993-1-casey@schaufler-ca.com>
	<20201120201507.11993-3-casey@schaufler-ca.com>
	<903c37e9036d167958165ab700e646c1622a9c40.camel@linux.ibm.com>
	<c88bc01f-3b65-f320-b42b-5ecde3e29448@schaufler-ca.com>
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
	definitions=2020-12-28_17:2020-12-28,
	2020-12-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	malwarescore=0 bulkscore=0
	adultscore=0 clxscore=1015 mlxscore=0 suspectscore=0 impostorscore=0
	spamscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501
	lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2009150000 definitions=main-2012280115
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 29 Dec 2020 20:07:45 -0500
Cc: john.johansen@canonical.com, linux-kernel@vger.kernel.org,
	linux-audit@redhat.com, bpf@vger.kernel.org, sds@tycho.nsa.gov
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2020-12-28 at 11:22 -0800, Casey Schaufler wrote:
> On 12/28/2020 9:54 AM, Mimi Zohar wrote:
> > Hi Casey,
> >
> > On Fri, 2020-11-20 at 12:14 -0800, Casey Schaufler wrote:
> >> When more than one security module is exporting data to
> >> audit and networking sub-systems a single 32 bit integer
> >> is no longer sufficient to represent the data. Add a
> >> structure to be used instead.
> >>
> >> The lsmblob structure is currently an array of
> >> u32 "secids". There is an entry for each of the
> >> security modules built into the system that would
> >> use secids if active. The system assigns the module
> >> a "slot" when it registers hooks. If modules are
> >> compiled in but not registered there will be unused
> >> slots.
> >>
> >> A new lsm_id structure, which contains the name
> >> of the LSM and its slot number, is created. There
> >> is an instance for each LSM, which assigns the name
> >> and passes it to the infrastructure to set the slot.
> >>
> >> The audit rules data is expanded to use an array of
> >> security module data rather than a single instance.
> >> Because IMA uses the audit rule functions it is
> >> affected as well.
> > This patch is quite large, even without the audit rule change.  I would
> > limit this patch to the new lsm_id structure changes.  The audit rule
> > change should be broken out as a separate patch so that the audit
> > changes aren't hidden.
> 
> Breaking up the patch in any meaningful way would require
> scaffolding code that is as extensive and invasive as the
> final change. I can do that if you really need it, but it
> won't be any easier to read.

Hidden in this patch is the new behavior of security_audit_rule_init(),
security_audit_rule_free(), and security_audit_rule_match().  My
concern is with label collision.  Details are in a subsequent post. 
Can an LSM prevent label collision?

> 
> > In addition, here are a few high level nits:
> > - The (patch description) body of the explanation, line wrapped at 75
> > columns, which will be copied to the permanent changelog to describe
> > this patch. (Refer  Documentation/process/submitting-patches.rst.)
> 
> Will fix.
> 
> > - The brief kernel-doc descriptions should not have a trailing period. 
> > Nor should kernel-doc variable definitions have a trailing period. 
> > Example(s) inline below.  (The existing kernel-doc is mostly correct.)
> 
> Will fix.
> 
> > - For some reason existing comments that span multiple lines aren't
> > formatted properly.   In those cases, where there is another change,
> > please fix the comment and function description.
> 
> Can you give an example? There are multiple comment styles
> used in the various components.

Never mind.  All three examples are in tomoyo.

> I don't see any comments on the ima code changes. I really
> don't want to spin a new patch set that does nothing but change
> two periods in comments only to find out two months from now
> that the code changes are completely borked. I really don't
> want to go through the process of breaking up the patch that has
> been widely Acked if there's no reason to expect it would require
> significant work otherwise.

Understood.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

