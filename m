Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A19D82E7570
	for <lists+linux-audit@lfdr.de>; Wed, 30 Dec 2020 02:08:49 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-GzX6_Ji9NzOpppA_vdOxBA-1; Tue, 29 Dec 2020 20:08:46 -0500
X-MC-Unique: GzX6_Ji9NzOpppA_vdOxBA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1C6218C89DA;
	Wed, 30 Dec 2020 01:08:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 96A362C167;
	Wed, 30 Dec 2020 01:08:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4DD0A4E58E;
	Wed, 30 Dec 2020 01:08:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BSHtDG9025140 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 28 Dec 2020 12:55:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 011212026D48; Mon, 28 Dec 2020 17:55:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F05312026D47
	for <linux-audit@redhat.com>; Mon, 28 Dec 2020 17:55:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C79D1101A53F
	for <linux-audit@redhat.com>; Mon, 28 Dec 2020 17:55:10 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-513-d3uYAJusNlG7qZgxHLfvLA-1; Mon, 28 Dec 2020 12:55:08 -0500
X-MC-Unique: d3uYAJusNlG7qZgxHLfvLA-1
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	0BSHVB2W181305
	for <linux-audit@redhat.com>; Mon, 28 Dec 2020 12:55:08 -0500
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com with ESMTP id 35qkcjgyvk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT)
	for <linux-audit@redhat.com>; Mon, 28 Dec 2020 12:55:07 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BSHYUW5194223
	for <linux-audit@redhat.com>; Mon, 28 Dec 2020 12:55:07 -0500
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
	[149.81.74.108])
	by mx0b-001b2d01.pphosted.com with ESMTP id 35qkcjgyuv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 28 Dec 2020 12:55:07 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id
	0BSHbhF5020741; Mon, 28 Dec 2020 17:55:05 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
	(d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma05fra.de.ibm.com with ESMTP id 35qfp6g3bk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 28 Dec 2020 17:55:05 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
	[9.149.105.58])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 0BSHt3sR47055324
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 28 Dec 2020 17:55:03 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4007C4C046;
	Mon, 28 Dec 2020 17:55:03 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5171D4C040;
	Mon, 28 Dec 2020 17:55:00 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown
	[9.160.72.172])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 28 Dec 2020 17:55:00 +0000 (GMT)
Message-ID: <903c37e9036d167958165ab700e646c1622a9c40.camel@linux.ibm.com>
Subject: Re: [PATCH v23 02/23] LSM: Create and manage the lsmblob data
	structure.
From: Mimi Zohar <zohar@linux.ibm.com>
To: Casey Schaufler <casey@schaufler-ca.com>, casey.schaufler@intel.com,
	jmorris@namei.org, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org
Date: Mon, 28 Dec 2020 12:54:59 -0500
In-Reply-To: <20201120201507.11993-3-casey@schaufler-ca.com>
References: <20201120201507.11993-1-casey@schaufler-ca.com>
	<20201120201507.11993-3-casey@schaufler-ca.com>
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
	definitions=2020-12-28_15:2020-12-28,
	2020-12-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	lowpriorityscore=0
	suspectscore=0 adultscore=0 spamscore=0 clxscore=1011 mlxscore=0
	impostorscore=0 mlxlogscore=999 malwarescore=0 phishscore=0 bulkscore=0
	priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2009150000 definitions=main-2012280107
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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

Hi Casey,

On Fri, 2020-11-20 at 12:14 -0800, Casey Schaufler wrote:
> When more than one security module is exporting data to
> audit and networking sub-systems a single 32 bit integer
> is no longer sufficient to represent the data. Add a
> structure to be used instead.
> 
> The lsmblob structure is currently an array of
> u32 "secids". There is an entry for each of the
> security modules built into the system that would
> use secids if active. The system assigns the module
> a "slot" when it registers hooks. If modules are
> compiled in but not registered there will be unused
> slots.
> 
> A new lsm_id structure, which contains the name
> of the LSM and its slot number, is created. There
> is an instance for each LSM, which assigns the name
> and passes it to the infrastructure to set the slot.
> 
> The audit rules data is expanded to use an array of
> security module data rather than a single instance.
> Because IMA uses the audit rule functions it is
> affected as well.

This patch is quite large, even without the audit rule change.  I would
limit this patch to the new lsm_id structure changes.  The audit rule
change should be broken out as a separate patch so that the audit
changes aren't hidden.

In addition, here are a few high level nits:
- The (patch description) body of the explanation, line wrapped at 75
columns, which will be copied to the permanent changelog to describe
this patch. (Refer  Documentation/process/submitting-patches.rst.)

- The brief kernel-doc descriptions should not have a trailing period. 
Nor should kernel-doc variable definitions have a trailing period. 
Example(s) inline below.  (The existing kernel-doc is mostly correct.)

- For some reason existing comments that span multiple lines aren't
formatted properly.   In those cases, where there is another change,
please fix the comment and function description.

thanks,

Mimi

> 
> Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
> Acked-by: Paul Moore <paul@paul-moore.com>
> Acked-by: John Johansen <john.johansen@canonical.com>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>

> Cc: <bpf@vger.kernel.org>
> Cc: linux-audit@redhat.com
> Cc: linux-security-module@vger.kernel.org
> Cc: selinux@vger.kernel.org
> ---

> diff --git a/include/linux/security.h b/include/linux/security.h
> index bc2725491560..fdb6e95c98e8 100644
> --- a/include/linux/security.h
> +++ b/include/linux/security.h
> @@ -132,6 +132,65 @@ enum lockdown_reason {
> 
>  extern const char *const lockdown_reasons[LOCKDOWN_CONFIDENTIALITY_MAX+1];
> 
> +/*
> + * Data exported by the security modules
> + *
> + * Any LSM that provides secid or secctx based hooks must be included.
> + */
> +#define LSMBLOB_ENTRIES ( \
> +	(IS_ENABLED(CONFIG_SECURITY_SELINUX) ? 1 : 0) + \
> +	(IS_ENABLED(CONFIG_SECURITY_SMACK) ? 1 : 0) + \
> +	(IS_ENABLED(CONFIG_SECURITY_APPARMOR) ? 1 : 0) + \
> +	(IS_ENABLED(CONFIG_BPF_LSM) ? 1 : 0))
> +
> +struct lsmblob {
> +	u32     secid[LSMBLOB_ENTRIES];
> +};
> +
> +#define LSMBLOB_INVALID		-1	/* Not a valid LSM slot number */
> +#define LSMBLOB_NEEDED		-2	/* Slot requested on initialization */
> +#define LSMBLOB_NOT_NEEDED	-3	/* Slot not requested */
> +
> +/**
> + * lsmblob_init - initialize an lsmblob structure.

Only this kernel-doc brief description is suffixed with a period.  
Please remove.

> + * @blob: Pointer to the data to initialize
> + * @secid: The initial secid value
> + *
> + * Set all secid for all modules to the specified value.
> + */
> +static inline void lsmblob_init(struct lsmblob *blob, u32 secid)
> +{
> +	int i;
> +
> +	for (i = 0; i < LSMBLOB_ENTRIES; i++)
> +		blob->secid[i] = secid;
> +}
> +
> +/**
> + * lsmblob_is_set - report if there is an value in the lsmblob
> + * @blob: Pointer to the exported LSM data
> + *
> + * Returns true if there is a secid set, false otherwise
> + */
> +static inline bool lsmblob_is_set(struct lsmblob *blob)
> +{
> +	struct lsmblob empty = {};
> +
> +	return !!memcmp(blob, &empty, sizeof(*blob));
> +}
> +
> +/**
> + * lsmblob_equal - report if the two lsmblob's are equal
> + * @bloba: Pointer to one LSM data
> + * @blobb: Pointer to the other LSM data
> + *
> + * Returns true if all entries in the two are equal, false otherwise
> + */
> +static inline bool lsmblob_equal(struct lsmblob *bloba, struct lsmblob *blobb)
> +{
> +	return !memcmp(bloba, blobb, sizeof(*bloba));
> +}
> +
>  /* These functions are in security/commoncap.c */
>  extern int cap_capable(const struct cred *cred, struct user_namespace *ns,

> diff --git a/security/integrity/ima/ima_policy.c b/security/integrity/ima/ima_policy.c
> index 9b5adeaa47fc..cd393aaa17d5 100644
> --- a/security/integrity/ima/ima_policy.c
> +++ b/security/integrity/ima/ima_policy.c
>  	} lsm[MAX_LSM_RULES];
> @@ -88,6 +88,22 @@ struct ima_rule_entry {
>  	struct ima_template_desc *template;
>  };
> 
> +/**
> + * ima_lsm_isset - Is a rule set for any of the active security modules
> + * @rules: The set of IMA rules to check.

Nor do kernel-doc variable definitions have a trailing period.

> + *
> + * If a rule is set for any LSM return true, otherwise return false.
> + */
> +static inline bool ima_lsm_isset(void *rules[])
> +{
> +	int i;
> +
> +	for (i = 0; i < LSMBLOB_ENTRIES; i++)
> +		if (rules[i])
> +			return true;
> +	return false;
> +}
> +
>  /*
>   * Without LSM specific knowledge, the default policy can only be
>   * written in terms of .action, .func, .mask, .fsmagic, .uid, and .fowner

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

