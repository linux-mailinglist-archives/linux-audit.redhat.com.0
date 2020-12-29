Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 06A362E7571
	for <lists+linux-audit@lfdr.de>; Wed, 30 Dec 2020 02:08:49 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-KJTlg9iKNea7GzuCtbJ4Iw-1; Tue, 29 Dec 2020 20:08:47 -0500
X-MC-Unique: KJTlg9iKNea7GzuCtbJ4Iw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25E888049C2;
	Wed, 30 Dec 2020 01:08:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 090D82C169;
	Wed, 30 Dec 2020 01:08:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CAD981809C9F;
	Wed, 30 Dec 2020 01:08:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BTDrbco004151 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 29 Dec 2020 08:53:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D50392166B29; Tue, 29 Dec 2020 13:53:37 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF5DC2166B28
	for <linux-audit@redhat.com>; Tue, 29 Dec 2020 13:53:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6AEE7185A794
	for <linux-audit@redhat.com>; Tue, 29 Dec 2020 13:53:34 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-328-EJrq5PE-P6y0EILH4of6YQ-1; Tue, 29 Dec 2020 08:53:32 -0500
X-MC-Unique: EJrq5PE-P6y0EILH4of6YQ-1
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	0BTD2rTj011789
	for <linux-audit@redhat.com>; Tue, 29 Dec 2020 08:53:31 -0500
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 35r5060yq8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT)
	for <linux-audit@redhat.com>; Tue, 29 Dec 2020 08:53:31 -0500
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BTDqhDO013464
	for <linux-audit@redhat.com>; Tue, 29 Dec 2020 08:53:31 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
	[169.51.49.98])
	by mx0a-001b2d01.pphosted.com with ESMTP id 35r5060ypy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 29 Dec 2020 08:53:31 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id
	0BTDpobY024917; Tue, 29 Dec 2020 13:53:29 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
	(d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma03ams.nl.ibm.com with ESMTP id 35qbk3s7p0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 29 Dec 2020 13:53:29 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 0BTDrRP237486888
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 29 Dec 2020 13:53:27 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1FBC142045;
	Tue, 29 Dec 2020 13:53:27 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0B4D14203F;
	Tue, 29 Dec 2020 13:53:24 +0000 (GMT)
Received: from sig-9-65-200-189.ibm.com (unknown [9.65.200.189])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 29 Dec 2020 13:53:23 +0000 (GMT)
Message-ID: <e2cb6f887a68495163ea2e0c3ffa06177ad2792f.camel@linux.ibm.com>
Subject: Re: [PATCH v23 02/23] LSM: Create and manage the lsmblob data
	structure.
From: Mimi Zohar <zohar@linux.ibm.com>
To: Casey Schaufler <casey@schaufler-ca.com>, casey.schaufler@intel.com,
	jmorris@namei.org, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org
Date: Tue, 29 Dec 2020 08:53:23 -0500
In-Reply-To: <e260e8c5bbbb488052cbe1f5b528d43461bc4258.camel@linux.ibm.com>
References: <20201120201507.11993-1-casey@schaufler-ca.com>
	<20201120201507.11993-3-casey@schaufler-ca.com>
	<b0e154a0db21fcb42303c7549fd44135e571ab00.camel@linux.ibm.com>
	<886fcd04-6a08-d78c-dc82-301c991e5ad8@schaufler-ca.com>
	<07784164969d0c31debd9defaedb46d89409ad78.camel@linux.ibm.com>
	<8f11964c-fa7e-21d1-ea60-7d918cfaabe0@schaufler-ca.com>
	<e260e8c5bbbb488052cbe1f5b528d43461bc4258.camel@linux.ibm.com>
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
	definitions=2020-12-29_09:2020-12-28,
	2020-12-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	mlxscore=0 adultscore=0
	mlxlogscore=999 priorityscore=1501 clxscore=1015 lowpriorityscore=0
	spamscore=0 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
	impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2009150000 definitions=main-2012290081
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2020-12-28 at 20:53 -0500, Mimi Zohar wrote:
> On Mon, 2020-12-28 at 15:20 -0800, Casey Schaufler wrote:
> > On 12/28/2020 2:14 PM, Mimi Zohar wrote:
> > > On Mon, 2020-12-28 at 12:06 -0800, Casey Schaufler wrote:
> > >> On 12/28/2020 11:24 AM, Mimi Zohar wrote:

> > >>>> -int security_audit_rule_match(u32 secid, u32 field, u32 op, void *lsmrule)
> > >>>> +int security_audit_rule_match(u32 secid, u32 field, u32 op, void **lsmrule)
> > >>>>  {
> > >>>> -       return call_int_hook(audit_rule_match, 0, secid, field, op, lsmrule);
> > >>>> +       struct security_hook_list *hp;
> > >>>> +       int rc;
> > >>>> +
> > >>>> +       hlist_for_each_entry(hp, &security_hook_heads.audit_rule_match, list) {
> > >>>> +               if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
> > >>>> +                       continue;
> > >>>> +               rc = hp->hook.audit_rule_match(secid, field, op,
> > >>>> +                                              &lsmrule[hp->lsmid->slot]);
> > >>>> +               if (rc)
> > >>>> +                       return rc;
> > >>> Suppose that there is an IMA dont_measure or dont_appraise rule, if one
> > >>> LSM matches, then this returns true, causing any measurement or
> > >>> integrity verification to be skipped.
> > >> Yes, that is correct. Like the audit system, you're doing a string based
> > >> lookup, which pretty well has to work this way. I have proposed compound
> > >> label specifications in the past, but even if we accepted something like
> > >> "apparmor=dates,selinux=figs" we'd still have to be compatible with the
> > >> old style inputs.
> > >>
> > >>> Sample policy rules:
> > >>> dont_measure obj_type=foo_log
> > >>> dont_appraise obj_type=foo_log
> > > IMA could extend the existing policy rules like "lsm=[selinux] |
> > > [smack] | [apparmor]", but that assumes that the underlying
> > > infrastructure supports it.
> > 
> > Yes, but you would still need rational behavior in the
> > case where someone has old IMA policy rules.
> 
> From an IMA perspective, allowing multiple LSMs to define the same
> policy label is worse than requiring the label be constrained to a
> particular LSM.

If allowing multiple LSMs to define the same label is only an IMA
issue, then have security_audit_rule_init() return the number of LSMs
which define the label.   IMA is already emitting a warning when an LSM
rule is not defined.   Emitting an additional warning would be the
first step.

In addition, ima_parse_rule() could detect policy rules containing non
LSM specific labels.  Based on policy, IMA would decide how to handle
it.

thanks,

Mimi

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

