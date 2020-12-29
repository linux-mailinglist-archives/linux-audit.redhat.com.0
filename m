Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A2C6D2E7573
	for <lists+linux-audit@lfdr.de>; Wed, 30 Dec 2020 02:09:09 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-hqBTmw8OO6Wh_7bkzc3nVg-1; Tue, 29 Dec 2020 20:09:06 -0500
X-MC-Unique: hqBTmw8OO6Wh_7bkzc3nVg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCD115708E;
	Wed, 30 Dec 2020 01:09:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 664A260CEF;
	Wed, 30 Dec 2020 01:09:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 35A735002E;
	Wed, 30 Dec 2020 01:09:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BTJGuO7000772 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 29 Dec 2020 14:16:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DC36A1002972; Tue, 29 Dec 2020 19:16:55 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7C2F1111C89
	for <linux-audit@redhat.com>; Tue, 29 Dec 2020 19:16:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9D92800883
	for <linux-audit@redhat.com>; Tue, 29 Dec 2020 19:16:53 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-69-XVm98MLjOc6rH47IReYO5Q-1; Tue, 29 Dec 2020 14:16:51 -0500
X-MC-Unique: XVm98MLjOc6rH47IReYO5Q-1
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	0BTJ1Xj1102758
	for <linux-audit@redhat.com>; Tue, 29 Dec 2020 14:16:50 -0500
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com with ESMTP id 35r9h613bg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT)
	for <linux-audit@redhat.com>; Tue, 29 Dec 2020 14:16:50 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BTJDWg9152743
	for <linux-audit@redhat.com>; Tue, 29 Dec 2020 14:16:50 -0500
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
	[149.81.74.107])
	by mx0b-001b2d01.pphosted.com with ESMTP id 35r9h613b1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 29 Dec 2020 14:16:49 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id
	0BTJDfRL011467; Tue, 29 Dec 2020 19:16:48 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
	(b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma03fra.de.ibm.com with ESMTP id 35nvt89ns7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 29 Dec 2020 19:16:47 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
	[9.149.105.58])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 0BTJGhJr29295046
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 29 Dec 2020 19:16:43 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9A1884C040;
	Tue, 29 Dec 2020 19:16:45 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D21C04C046;
	Tue, 29 Dec 2020 19:16:42 +0000 (GMT)
Received: from sig-9-65-200-189.ibm.com (unknown [9.65.200.189])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 29 Dec 2020 19:16:42 +0000 (GMT)
Message-ID: <ed9e0dbb48b712a371d3ca4ea5dfa5121d2f98df.camel@linux.ibm.com>
Subject: Re: [PATCH v23 02/23] LSM: Create and manage the lsmblob data
	structure.
From: Mimi Zohar <zohar@linux.ibm.com>
To: Casey Schaufler <casey@schaufler-ca.com>, casey.schaufler@intel.com,
	jmorris@namei.org, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org
Date: Tue, 29 Dec 2020 14:16:41 -0500
In-Reply-To: <10442dd5-f16e-3ca4-c233-7394a11cbbad@schaufler-ca.com>
References: <20201120201507.11993-1-casey@schaufler-ca.com>
	<20201120201507.11993-3-casey@schaufler-ca.com>
	<b0e154a0db21fcb42303c7549fd44135e571ab00.camel@linux.ibm.com>
	<886fcd04-6a08-d78c-dc82-301c991e5ad8@schaufler-ca.com>
	<07784164969d0c31debd9defaedb46d89409ad78.camel@linux.ibm.com>
	<8f11964c-fa7e-21d1-ea60-7d918cfaabe0@schaufler-ca.com>
	<e260e8c5bbbb488052cbe1f5b528d43461bc4258.camel@linux.ibm.com>
	<10442dd5-f16e-3ca4-c233-7394a11cbbad@schaufler-ca.com>
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
	definitions=2020-12-29_13:2020-12-28,
	2020-12-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	impostorscore=0
	lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
	phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
	mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1
	engine=8.12.0-2009150000 definitions=main-2012290117
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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

On Tue, 2020-12-29 at 10:46 -0800, Casey Schaufler wrote:
> >>>>>> -int security_audit_rule_match(u32 secid, u32 field, u32 op, void *lsmrule)
> >>>>>> +int security_audit_rule_match(u32 secid, u32 field, u32 op, void **lsmrule)
> >>>>>>  {
> >>>>>> -       return call_int_hook(audit_rule_match, 0, secid, field, op, lsmrule);
> >>>>>> +       struct security_hook_list *hp;
> >>>>>> +       int rc;
> >>>>>> +
> >>>>>> +       hlist_for_each_entry(hp, &security_hook_heads.audit_rule_match, list) {
> >>>>>> +               if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
> >>>>>> +                       continue;
> >>>>>> +               rc = hp->hook.audit_rule_match(secid, field, op,
> >>>>>> +                                              &lsmrule[hp->lsmid->slot]);
> >>>>>> +               if (rc)
> >>>>>> +                       return rc;
> >>>>> Suppose that there is an IMA dont_measure or dont_appraise rule, if one
> >>>>> LSM matches, then this returns true, causing any measurement or
> >>>>> integrity verification to be skipped.
> >>>> Yes, that is correct. Like the audit system, you're doing a string based
> >>>> lookup, which pretty well has to work this way. I have proposed compound
> >>>> label specifications in the past, but even if we accepted something like
> >>>> "apparmor=dates,selinux=figs" we'd still have to be compatible with the
> >>>> old style inputs.
> >>>>
> >>>>> Sample policy rules:
> >>>>> dont_measure obj_type=foo_log
> >>>>> dont_appraise obj_type=foo_log
> >>> IMA could extend the existing policy rules like "lsm=[selinux] |
> >>> [smack] | [apparmor]", but that assumes that the underlying
> >>> infrastructure supports it.
> >> Yes, but you would still need rational behavior in the
> >> case where someone has old IMA policy rules.
> > From an IMA perspective, allowing multiple LSMs to define the same
> > policy label is worse than requiring the label be constrained to a
> > particular LSM.
> 
> Just to be sure we're talking about the same thing,
> the case I'm referring to is something like a file with
> two extended attributes:
> 
> 	security.apparmor MacAndCheese
> 	security.SMACK64 MacAndCheese
> 
> and an IMA rule that says
> 
> 	dont_measure obj_type=MacAndCheese
> 
> In this case the dont_measure will be applied to both.
> On the other hand,
> 
> 	security.apparmor MacAndCheese
> 	security.SMACK64 FranksAndBeans
> 
> would also apply the rule to both, which is not
> what you want. Unfortunately, there is no way to
> differentiate which LSM hit the rule.
> 
> So now I'm a little confused. The case where both LSMs
> use the same label looks like it works right, where the
> case where they're different doesn't.

I'm more concerned about multiple LSMs using the same label.  The
label's meaning is LSM specific.

> 
> I'm beginning to think that identifying which LSMs matched
> a rule (it may be none, either or both) is the right solution.
> I don't think that audit is as sensitive to this.

If the label's meaning is LSM specific, then the rule needs to be LSM
specific.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

