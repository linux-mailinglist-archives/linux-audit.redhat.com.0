Return-Path: <linux-audit-bounces@listman.redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-44.mimecast.com (us-smtp-delivery-44.mimecast.com [207.211.30.44])
	by mail.lfdr.de (Postfix) with ESMTP id A131731CFED
	for <lists+linux-audit@lfdr.de>; Tue, 16 Feb 2021 19:12:59 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-xFHtfNUOOlG_JYpnrvSn1Q-1; Tue, 16 Feb 2021 13:12:54 -0500
X-MC-Unique: xFHtfNUOOlG_JYpnrvSn1Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66947189DF58;
	Tue, 16 Feb 2021 18:12:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4201410016DB;
	Tue, 16 Feb 2021 18:12:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EA1AC18095CE;
	Tue, 16 Feb 2021 18:12:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11EILvfw024703 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 14 Feb 2021 13:21:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5E4B849B0C; Sun, 14 Feb 2021 18:21:57 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 587B249C2B
	for <linux-audit@redhat.com>; Sun, 14 Feb 2021 18:21:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EBF82101A53A
	for <linux-audit@redhat.com>; Sun, 14 Feb 2021 18:21:53 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-421-7nFNagRcOa2jIMXLUQzKcg-1; Sun, 14 Feb 2021 13:21:51 -0500
X-MC-Unique: 7nFNagRcOa2jIMXLUQzKcg-1
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	11EI21gH026794
	for <linux-audit@redhat.com>; Sun, 14 Feb 2021 13:21:50 -0500
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 36q82bry0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT)
	for <linux-audit@redhat.com>; Sun, 14 Feb 2021 13:21:50 -0500
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11EILnh5129569
	for <linux-audit@redhat.com>; Sun, 14 Feb 2021 13:21:49 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
	[169.51.49.99])
	by mx0a-001b2d01.pphosted.com with ESMTP id 36q82bry05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sun, 14 Feb 2021 13:21:49 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id
	11EIHZeS012548; Sun, 14 Feb 2021 18:21:47 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
	(d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma04ams.nl.ibm.com with ESMTP id 36p6d895sf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sun, 14 Feb 2021 18:21:47 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
	[9.149.105.232])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 11EILj4I12648826
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Sun, 14 Feb 2021 18:21:45 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0AB955204F;
	Sun, 14 Feb 2021 18:21:45 +0000 (GMT)
Received: from sig-9-65-223-148.ibm.com (unknown [9.65.223.148])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 30F985204E;
	Sun, 14 Feb 2021 18:21:42 +0000 (GMT)
Message-ID: <693f81d9d2f50a920cafbbc8d1d634598b99081a.camel@linux.ibm.com>
Subject: Re: [PATCH v24 04/25] IMA: avoid label collisions with stacked LSMs
From: Mimi Zohar <zohar@linux.ibm.com>
To: Casey Schaufler <casey@schaufler-ca.com>, casey.schaufler@intel.com,
	jmorris@namei.org, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org
Date: Sun, 14 Feb 2021 13:21:41 -0500
In-Reply-To: <20210126164108.1958-5-casey@schaufler-ca.com>
References: <20210126164108.1958-1-casey@schaufler-ca.com>
	<20210126164108.1958-5-casey@schaufler-ca.com>
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
	definitions=2021-02-14_04:2021-02-12,
	2021-02-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	clxscore=1011 malwarescore=0
	phishscore=0 impostorscore=0 spamscore=0 mlxscore=0 bulkscore=0
	adultscore=0 mlxlogscore=999 suspectscore=0 lowpriorityscore=0
	priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2009150000 definitions=main-2102140151
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
X-Mailman-Approved-At: Tue, 16 Feb 2021 13:11:57 -0500
Cc: john.johansen@canonical.com, linux-kernel@vger.kernel.org,
	linux-audit@redhat.com, sds@tycho.nsa.gov
X-BeenThere: linux-audit@listman.redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.listman.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@listman.redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@listman.redhat.com>
List-Help: <mailto:linux-audit-request@listman.redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@listman.redhat.com?subject=subscribe>
Sender: linux-audit-bounces@listman.redhat.com
Errors-To: linux-audit-bounces@listman.redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@listman.redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: listman.redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Casey,

On Tue, 2021-01-26 at 08:40 -0800, Casey Schaufler wrote:
> Integrity measurement may filter on security module information
> and needs to be clear in the case of multiple active security
> modules which applies. Provide a boot option ima_rules_lsm= to
> allow the user to specify an active securty module to apply
> filters to. If not specified, use the first registered module
> that supports the audit_rule_match() LSM hook. Allow the user
> to specify in the IMA policy an lsm= option to specify the
> security module to use for a particular rule.

Thanks, Casey.

(This patch description line length seems short.)

> 
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> To: Mimi Zohar <zohar@linux.ibm.com>
> To: linux-integrity@vger.kernel.org
> ---
>  Documentation/ABI/testing/ima_policy |  8 +++-
>  security/integrity/ima/ima_policy.c  | 64 ++++++++++++++++++++++------
>  2 files changed, 57 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/ima_policy b/Documentation/ABI/testing/ima_policy
> index e35263f97fc1..a7943d40466f 100644
> --- a/Documentation/ABI/testing/ima_policy
> +++ b/Documentation/ABI/testing/ima_policy
> @@ -25,7 +25,7 @@ Description:
>  			base:	[[func=] [mask=] [fsmagic=] [fsuuid=] [uid=]
>  				[euid=] [fowner=] [fsname=]]
>  			lsm:	[[subj_user=] [subj_role=] [subj_type=]
> -				 [obj_user=] [obj_role=] [obj_type=]]
> +				 [obj_user=] [obj_role=] [obj_type=] [lsm=]]

"[lsm=]" either requires all LSM rules types (e.g. {subj/obj}_user,
role, type) to be exactly the same for multiple LSMs or all of the LSM
rule types are applicable to only a single LSM.  Supporting multiple
LSMs with exactly the same LSM labels doesn't seem worth the effort.  
Keep it simple - a single rule, containing any LSM rule types, is
applicable to a single LSM.

>  			option:	[[appraise_type=]] [template=] [permit_directio]
>  				[appraise_flag=] [keyrings=]
>  		  base:
> @@ -114,6 +114,12 @@ Description:
> 
>  			measure subj_user=_ func=FILE_CHECK mask=MAY_READ
> 
> +		It is possible to explicitly specify which security
> +		module a rule applies to using lsm=.  If the security
> +		modules specified is not active on the system the rule
> +		will be rejected.  If lsm= is not specified the first
> +		security module registered on the system will be assumed.
> +
>  		Example of measure rules using alternate PCRs::
> 
>  			measure func=KEXEC_KERNEL_CHECK pcr=4
> diff --git a/security/integrity/ima/ima_policy.c b/security/integrity/ima/ima_policy.c
> index 8002683003e6..de72b719c90c 100644
> --- a/security/integrity/ima/ima_policy.c
> +++ b/security/integrity/ima/ima_policy.c
> @@ -82,6 +82,7 @@ struct ima_rule_entry {
>  		void *rules[LSMBLOB_ENTRIES]; /* LSM file metadata specific */
>  		char *args_p;	/* audit value */
>  		int type;	/* audit type */
> +		int which_lsm; /* which of the rules to use */
>  	} lsm[MAX_LSM_RULES];

Even if we wanted to support multiple LSMs within the same rule having
both "rules[LSMBLOB_ENTRIES]" and "which_lsm" shouldn't be necessary.  
The LSMBLOB_ENTRIES should already identify the LSM.

To support a single LSM per policy rule, "which_lsm" should be defined
outside of lsm[MAX_LSM_RULES].  This will simplify the rest of the code
(e.g. matching/freeing rules).

	int which_lsm;          /* which of the rules to use */
	struct {
                void *rule;        /* LSM file metadata specific */
                char *args_p;   /* audit value */
                int type;       /* audit type */
        } lsm[MAX_LSM_RULES];


>  	char *fsname;
>  	struct ima_rule_opt_list *keyrings; /* Measure keys added to these keyrings */
> @@ -90,17 +91,15 @@ struct ima_rule_entry {
> 
>  /**
>   * ima_lsm_isset - Is a rule set for any of the active security modules
> - * @rules: The set of IMA rules to check
> + * @entry: the rule entry to examine
> + * @lsm_rule: the specific rule type in question
>   *
> - * If a rule is set for any LSM return true, otherwise return false.
> + * If a rule is set return true, otherwise return false.
>   */
> -static inline bool ima_lsm_isset(void *rules[])
> +static inline bool ima_lsm_isset(struct ima_rule_entry *entry, int lsm_rule)
>  {
> -	int i;
> -
> -	for (i = 0; i < LSMBLOB_ENTRIES; i++)
> -		if (rules[i])
> -			return true;
> +	if (entry->lsm[lsm_rule].rules[entry->lsm[lsm_rule].which_lsm])
> +		return true;

If each IMA policy rule is limited to a specific LSM, then the test
would be "entry->which_lsm".

>  	return false;
>  }
> 
> @@ -273,6 +272,20 @@ static int __init default_appraise_policy_setup(char *str)
>  }
>  __setup("ima_appraise_tcb", default_appraise_policy_setup);
> 
> +static int ima_rule_lsm __ro_after_init;
> +
> +static int __init ima_rule_lsm_init(char *str)
> +{
> +	ima_rule_lsm = lsm_name_to_slot(str);
> +	if (ima_rule_lsm < 0) {
> +		ima_rule_lsm = 0;
> +		pr_err("rule lsm \"%s\" not registered", str);
> +	}
> +
> +	return 1;
> +}
> +__setup("ima_rule_lsm=", ima_rule_lsm_init);

The patch description refers to "ima_rules_lsm=".  Please update one or
the other.

thanks,

Mimi

--
Linux-audit mailing list
Linux-audit@listman.redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

