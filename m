Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 928352E7572
	for <lists+linux-audit@lfdr.de>; Wed, 30 Dec 2020 02:09:08 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-CRH8rAU2OwexruCaP9u0IQ-1; Tue, 29 Dec 2020 20:09:05 -0500
X-MC-Unique: CRH8rAU2OwexruCaP9u0IQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 214A1801817;
	Wed, 30 Dec 2020 01:09:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 03FD45D9C2;
	Wed, 30 Dec 2020 01:09:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C17425002C;
	Wed, 30 Dec 2020 01:09:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BSJOnnE031950 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 28 Dec 2020 14:24:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CF7159D473; Mon, 28 Dec 2020 19:24:49 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9D23518C
	for <linux-audit@redhat.com>; Mon, 28 Dec 2020 19:24:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3865800883
	for <linux-audit@redhat.com>; Mon, 28 Dec 2020 19:24:47 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-184-cm5R9Lo2MKOKwmCFIF4a_A-1; Mon, 28 Dec 2020 14:24:45 -0500
X-MC-Unique: cm5R9Lo2MKOKwmCFIF4a_A-1
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	0BSJ3H1s020570
	for <linux-audit@redhat.com>; Mon, 28 Dec 2020 14:24:44 -0500
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 35qn0h8m79-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT)
	for <linux-audit@redhat.com>; Mon, 28 Dec 2020 14:24:44 -0500
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BSJ3SPC021989
	for <linux-audit@redhat.com>; Mon, 28 Dec 2020 14:24:43 -0500
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
	[159.122.73.70])
	by mx0a-001b2d01.pphosted.com with ESMTP id 35qn0h8m6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 28 Dec 2020 14:24:43 -0500
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id
	0BSJHgUK017631; Mon, 28 Dec 2020 19:24:41 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
	(d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma01fra.de.ibm.com with ESMTP id 35nvt7s5b1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 28 Dec 2020 19:24:41 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
	[9.149.105.62])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 0BSJOcu329032788
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 28 Dec 2020 19:24:38 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B5023AE04D;
	Mon, 28 Dec 2020 19:24:38 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BBB5EAE045;
	Mon, 28 Dec 2020 19:24:35 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown
	[9.160.72.172])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 28 Dec 2020 19:24:35 +0000 (GMT)
Message-ID: <b0e154a0db21fcb42303c7549fd44135e571ab00.camel@linux.ibm.com>
Subject: Re: [PATCH v23 02/23] LSM: Create and manage the lsmblob data
	structure.
From: Mimi Zohar <zohar@linux.ibm.com>
To: Casey Schaufler <casey@schaufler-ca.com>, casey.schaufler@intel.com,
	jmorris@namei.org, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org
Date: Mon, 28 Dec 2020 14:24:34 -0500
In-Reply-To: <20201120201507.11993-3-casey@schaufler-ca.com>
References: <20201120201507.11993-1-casey@schaufler-ca.com>
	<20201120201507.11993-3-casey@schaufler-ca.com>
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
	definitions=2020-12-28_17:2020-12-28,
	2020-12-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	phishscore=0 clxscore=1015
	malwarescore=0 impostorscore=0 mlxscore=0 spamscore=0
	priorityscore=1501
	mlxlogscore=999 suspectscore=0 adultscore=0 bulkscore=0
	lowpriorityscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Casey,

On Fri, 2020-11-20 at 12:14 -0800, Casey Schaufler wrote:
> diff --git a/security/security.c b/security/security.c
> index 5da8b3643680..d01363cb0082 100644
> --- a/security/security.c
> +++ b/security/security.c
> 
> @@ -2510,7 +2526,24 @@ int security_key_getsecurity(struct key *key, char **_buffer)
> 
>  int security_audit_rule_init(u32 field, u32 op, char *rulestr, void **lsmrule)
>  {
> -       return call_int_hook(audit_rule_init, 0, field, op, rulestr, lsmrule);
> +       struct security_hook_list *hp;
> +       bool one_is_good = false;
> +       int rc = 0;
> +       int trc;
> +
> +       hlist_for_each_entry(hp, &security_hook_heads.audit_rule_init, list) {
> +               if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
> +                       continue;
> +               trc = hp->hook.audit_rule_init(field, op, rulestr,
> +                                              &lsmrule[hp->lsmid->slot]);
> +               if (trc == 0)
> +                       one_is_good = true;
> +               else
> +                       rc = trc;
> +       }
> +       if (one_is_good)
> +               return 0;
> +       return rc;
>  }

So the same string may be defined by multiple LSMs.
> 
>  int security_audit_rule_known(struct audit_krule *krule)
> @@ -2518,14 +2551,31 @@ int security_audit_rule_known(struct audit_krule *krule)
>         return call_int_hook(audit_rule_known, 0, krule);
>  }
> 
> -void security_audit_rule_free(void *lsmrule)
> +void security_audit_rule_free(void **lsmrule)
>  {
> -       call_void_hook(audit_rule_free, lsmrule);
> +       struct security_hook_list *hp;
> +
> +       hlist_for_each_entry(hp, &security_hook_heads.audit_rule_free, list) {
> +               if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
> +                       continue;
> +               hp->hook.audit_rule_free(lsmrule[hp->lsmid->slot]);
> +       }
>  }
> 

If one LSM frees the string, then the string is deleted from all LSMs. 
I don't understand how this safe.

> -int security_audit_rule_match(u32 secid, u32 field, u32 op, void *lsmrule)
> +int security_audit_rule_match(u32 secid, u32 field, u32 op, void **lsmrule)
>  {
> -       return call_int_hook(audit_rule_match, 0, secid, field, op, lsmrule);
> +       struct security_hook_list *hp;
> +       int rc;
> +
> +       hlist_for_each_entry(hp, &security_hook_heads.audit_rule_match, list) {
> +               if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
> +                       continue;
> +               rc = hp->hook.audit_rule_match(secid, field, op,
> +                                              &lsmrule[hp->lsmid->slot]);
> +               if (rc)
> +                       return rc;

Suppose that there is an IMA dont_measure or dont_appraise rule, if one
LSM matches, then this returns true, causing any measurement or
integrity verification to be skipped.  

Sample policy rules:
dont_measure obj_type=foo_log
dont_appraise obj_type=foo_log

Are there any plans to prevent label collisions or at least notify of a
label collision?

Mimi

> +       }
> +       return 0;
>  }
>  #endif /* CONFIG_AUDIT */

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

