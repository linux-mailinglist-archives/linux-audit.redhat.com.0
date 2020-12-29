Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9CFF92E756F
	for <lists+linux-audit@lfdr.de>; Wed, 30 Dec 2020 02:08:33 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-roX4Fm5LMwaVJXJnjlt4lg-1; Tue, 29 Dec 2020 20:08:29 -0500
X-MC-Unique: roX4Fm5LMwaVJXJnjlt4lg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF8B71005504;
	Wed, 30 Dec 2020 01:08:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 944EF27C28;
	Wed, 30 Dec 2020 01:08:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2A3A0180954D;
	Wed, 30 Dec 2020 01:08:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BT1rfDW007421 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 28 Dec 2020 20:53:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D37A81112864; Tue, 29 Dec 2020 01:53:41 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF560112132E
	for <linux-audit@redhat.com>; Tue, 29 Dec 2020 01:53:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3831B800B3B
	for <linux-audit@redhat.com>; Tue, 29 Dec 2020 01:53:39 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-235-cn-jRzpzOhy3JKA0stDLww-1; Mon, 28 Dec 2020 20:53:36 -0500
X-MC-Unique: cn-jRzpzOhy3JKA0stDLww-1
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	0BT1dBO1108237
	for <linux-audit@redhat.com>; Mon, 28 Dec 2020 20:53:35 -0500
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 35qts68f82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT)
	for <linux-audit@redhat.com>; Mon, 28 Dec 2020 20:53:35 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BT1f90K115092
	for <linux-audit@redhat.com>; Mon, 28 Dec 2020 20:53:35 -0500
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
	[149.81.74.106])
	by mx0a-001b2d01.pphosted.com with ESMTP id 35qts68f7j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 28 Dec 2020 20:53:34 -0500
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id
	0BT1fmM9020405; Tue, 29 Dec 2020 01:53:32 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
	(d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma04fra.de.ibm.com with ESMTP id 35nvt89920-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 29 Dec 2020 01:53:32 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
	[9.149.105.60])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 0BT1rUuk46530944
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 29 Dec 2020 01:53:30 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 455F242045;
	Tue, 29 Dec 2020 01:53:30 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F69642041;
	Tue, 29 Dec 2020 01:53:27 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown
	[9.160.72.172])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 29 Dec 2020 01:53:27 +0000 (GMT)
Message-ID: <e260e8c5bbbb488052cbe1f5b528d43461bc4258.camel@linux.ibm.com>
Subject: Re: [PATCH v23 02/23] LSM: Create and manage the lsmblob data
	structure.
From: Mimi Zohar <zohar@linux.ibm.com>
To: Casey Schaufler <casey@schaufler-ca.com>, casey.schaufler@intel.com,
	jmorris@namei.org, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org
Date: Mon, 28 Dec 2020 20:53:26 -0500
In-Reply-To: <8f11964c-fa7e-21d1-ea60-7d918cfaabe0@schaufler-ca.com>
References: <20201120201507.11993-1-casey@schaufler-ca.com>
	<20201120201507.11993-3-casey@schaufler-ca.com>
	<b0e154a0db21fcb42303c7549fd44135e571ab00.camel@linux.ibm.com>
	<886fcd04-6a08-d78c-dc82-301c991e5ad8@schaufler-ca.com>
	<07784164969d0c31debd9defaedb46d89409ad78.camel@linux.ibm.com>
	<8f11964c-fa7e-21d1-ea60-7d918cfaabe0@schaufler-ca.com>
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
	definitions=2020-12-28_20:2020-12-28,
	2020-12-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	adultscore=0 phishscore=0
	lowpriorityscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
	clxscore=1015
	suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
	bulkscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2009150000 definitions=main-2012290002
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2020-12-28 at 15:20 -0800, Casey Schaufler wrote:
> On 12/28/2020 2:14 PM, Mimi Zohar wrote:
> > On Mon, 2020-12-28 at 12:06 -0800, Casey Schaufler wrote:
> >> On 12/28/2020 11:24 AM, Mimi Zohar wrote:
> >>> Hi Casey,
> >>>
> >>> On Fri, 2020-11-20 at 12:14 -0800, Casey Schaufler wrote:
> >>>> diff --git a/security/security.c b/security/security.c
> >>>> index 5da8b3643680..d01363cb0082 100644
> >>>> --- a/security/security.c
> >>>> +++ b/security/security.c
> >>>>
> >>>> @@ -2510,7 +2526,24 @@ int security_key_getsecurity(struct key *key, char **_buffer)
> >>>>
> >>>>  int security_audit_rule_init(u32 field, u32 op, char *rulestr, void **lsmrule)
> >>>>  {
> >>>> -       return call_int_hook(audit_rule_init, 0, field, op, rulestr, lsmrule);
> >>>> +       struct security_hook_list *hp;
> >>>> +       bool one_is_good = false;
> >>>> +       int rc = 0;
> >>>> +       int trc;
> >>>> +
> >>>> +       hlist_for_each_entry(hp, &security_hook_heads.audit_rule_init, list) {
> >>>> +               if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
> >>>> +                       continue;
> >>>> +               trc = hp->hook.audit_rule_init(field, op, rulestr,
> >>>> +                                              &lsmrule[hp->lsmid->slot]);
> >>>> +               if (trc == 0)
> >>>> +                       one_is_good = true;
> >>>> +               else
> >>>> +                       rc = trc;
> >>>> +       }
> >>>> +       if (one_is_good)
> >>>> +               return 0;
> >>>> +       return rc;
> >>>>  }
> >>> So the same string may be defined by multiple LSMs.
> >> Yes. Any legal AppArmor label would also be a legal Smack label.
> >>
> >>>>  int security_audit_rule_known(struct audit_krule *krule)
> >>>> @@ -2518,14 +2551,31 @@ int security_audit_rule_known(struct audit_krule *krule)
> >>>>         return call_int_hook(audit_rule_known, 0, krule);
> >>>>  }
> >>>>
> >>>> -void security_audit_rule_free(void *lsmrule)
> >>>> +void security_audit_rule_free(void **lsmrule)
> >>>>  {
> >>>> -       call_void_hook(audit_rule_free, lsmrule);
> >>>> +       struct security_hook_list *hp;
> >>>> +
> >>>> +       hlist_for_each_entry(hp, &security_hook_heads.audit_rule_free, list) {
> >>>> +               if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
> >>>> +                       continue;
> >>>> +               hp->hook.audit_rule_free(lsmrule[hp->lsmid->slot]);
> >>>> +       }
> >>>>  }
> >>>>
> >>> If one LSM frees the string, then the string is deleted from all LSMs. 
> >>> I don't understand how this safe.
> >> The audit system doesn't have a way to specify which LSM
> >> a watched label is associated with. Even if we added one,
> >> we'd still have to address the current behavior. Assigning
> >> the watch to all modules means that seeing the string
> >> in any module is sufficient to generate the event.
> > I originally thought loading a new LSM policy could not delete existing
> > LSM labels, but that isn't true.  If LSM labels can come and go based
> > on policy, with this code, could loading a new policy for one LSM
> > result in deleting labels of another LSM?
> 
> No. I could imagine a situation where changing policy on
> a system where audit rules have been set could result in
> confusion, but that would be true in the single LSM case.
> It would require that secids used in the old policy be
> used for different labels in the new policy. That would
> not be sane behavior. I know it's impossible for Smack.
> 
> This is one of the reasons I'm switching from a single secid
> to a collection of secids. You don't want unnatural behavior
> of one LSM to impact the behavior of another.
> 
> 
> >
> >>>> -int security_audit_rule_match(u32 secid, u32 field, u32 op, void *lsmrule)
> >>>> +int security_audit_rule_match(u32 secid, u32 field, u32 op, void **lsmrule)
> >>>>  {
> >>>> -       return call_int_hook(audit_rule_match, 0, secid, field, op, lsmrule);
> >>>> +       struct security_hook_list *hp;
> >>>> +       int rc;
> >>>> +
> >>>> +       hlist_for_each_entry(hp, &security_hook_heads.audit_rule_match, list) {
> >>>> +               if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
> >>>> +                       continue;
> >>>> +               rc = hp->hook.audit_rule_match(secid, field, op,
> >>>> +                                              &lsmrule[hp->lsmid->slot]);
> >>>> +               if (rc)
> >>>> +                       return rc;
> >>> Suppose that there is an IMA dont_measure or dont_appraise rule, if one
> >>> LSM matches, then this returns true, causing any measurement or
> >>> integrity verification to be skipped.
> >> Yes, that is correct. Like the audit system, you're doing a string based
> >> lookup, which pretty well has to work this way. I have proposed compound
> >> label specifications in the past, but even if we accepted something like
> >> "apparmor=dates,selinux=figs" we'd still have to be compatible with the
> >> old style inputs.
> >>
> >>> Sample policy rules:
> >>> dont_measure obj_type=foo_log
> >>> dont_appraise obj_type=foo_log
> > IMA could extend the existing policy rules like "lsm=[selinux] |
> > [smack] | [apparmor]", but that assumes that the underlying
> > infrastructure supports it.
> 
> Yes, but you would still need rational behavior in the
> case where someone has old IMA policy rules.

>From an IMA perspective, allowing multiple LSMs to define the same
policy label is worse than requiring the label be constrained to a
particular LSM.

> 
> >
> >>> Are there any plans to prevent label collisions or at least notify of a
> >>> label collision?
> >> What would that look like? You can't say that Smack isn't allowed
> >> to use valid AppArmor labels. How would Smack know? If the label is
> >> valid to both, how would you decide which LSM gets to use it?

Unfortunately, unless audit supports per LSM labels, the infrastructure
needs to detect and prevent the label collision.

> > As this is a runtime issue, when loading a new policy at least flag the
> > collision.  When removing the label, when it is defined by multiple
> > LSMs, at least flag the removal.
> 
> To what end would the collision be flagged? What would you do with
> the information?

LSM label collision is probably an example of kernel integrity critical
data (yet to be upstreamed).

> 
> >
> >>>> +       }
> >>>> +       return 0;
> >>>>  }
> >>>>  #endif /* CONFIG_AUDIT */
> 


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

