Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B797E31CCEB
	for <lists+linux-audit@lfdr.de>; Tue, 16 Feb 2021 16:27:35 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-JR1QmIr5OZC1td7KyU2mzQ-1; Tue, 16 Feb 2021 10:27:32 -0500
X-MC-Unique: JR1QmIr5OZC1td7KyU2mzQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21015192D787;
	Tue, 16 Feb 2021 15:27:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DFF2219D6C;
	Tue, 16 Feb 2021 15:27:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 043AD49;
	Tue, 16 Feb 2021 15:27:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11GFQeXj025080 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 16 Feb 2021 10:26:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5772DF49D1; Tue, 16 Feb 2021 15:26:40 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5174DF49D8
	for <linux-audit@redhat.com>; Tue, 16 Feb 2021 15:26:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D94F8919BF
	for <linux-audit@redhat.com>; Tue, 16 Feb 2021 15:26:38 +0000 (UTC)
Received: from sonic306-20.consmr.mail.gq1.yahoo.com
	(sonic306-20.consmr.mail.gq1.yahoo.com [98.137.68.83]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-397-tAfS7bJQPMaYuKUn2iqk4Q-1;
	Tue, 16 Feb 2021 10:26:35 -0500
X-MC-Unique: tAfS7bJQPMaYuKUn2iqk4Q-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1613489194; bh=9fcmK848gRdrSo0CtJht6cTIcysIkqcULNO5DR2Srji=;
	h=X-Sonic-MF:Subject:To:From:Date:From:Subject;
	b=iq6QL1VhbMcbHuv7hOznssEjlxRjHypKpdp1QnWRE5HkDQjzzk3y/OKqOFPHqjk+0vUlgPjYDre7rGFnbzh1bm8p3nj2ovVlDV6SjA/LvohzWmZ+MB1tyjyZbwkyQ7qN+ZGrjdw7gteuXuH25HqnrE2yiLXNQSyMxsO1/h5GcbJORpfIf13yOXRfopLSLZ1K8Dq5klzOTvCOMUqYP+OtYpIYRqMNPkPFkUhCsWg0hUpenLvIsa5QhC+H2tCBN2BqixzgmtcmkrZwcA/8XkCoAPhLY3ew9d46txUaspQQlQtOoA5tQcnTahayLlp/6HW5mD6nvjRnAR32t0Y16tKunw==
X-YMail-OSG: ZCNfqqkVM1lPukTTjpbByVKoh.k1QKLvNZ_EkZj_CZLTg6jrLyhwrQ5H28S1jaG
	9Cc6vNBVR6.NqaHrPlk2FmSJ.vhVXuUy3RrubPqgnjuu56iVJVxcOtd1x58ozmafrwXe4fgp8I7L
	AXOmVdF6.kSvMZZA5PJ60rOofNLHcTTsdb1HkqBX_aAY7zorwFTPfBRvOHFrmwtVTjT2L4Dz2tZT
	GAYKatqzXC_0SE0p90C_5MmYKMPD9sVrZs.b5tmyhRH6OJp4k9Xnk2cCzOfrTdF5J0qipqsyW46C
	WmYotAiIo2YAomr9JonfMmKyvNKfZsocbw94J8FuIo3A2QJpHrHhsPgzTpeplJoEuaTJKmt3_z5B
	7WDRvNLE0SmkgKar7RV.VArTmgOa.L81IobGhUFjKch4wJ9cRagNEscLi00MMRDSbWUN6L3WJ_rF
	vb4zc4dPL95Qkr7pFc7U5X8pxwesC4wEOz._EcuALUkZOCObdrnhNFTb4XOU.ddrDdO_aCPmO98m
	RGp40tcpnUR7vjLNNReBNTFk9TetrfnE4N4IVV8rKWP5JskDJvjy3jHyYoyvLJo1_lABbuwyn1m5
	G42Ck.2JV0uWCqhMMVPSUs0IRnOPjCiDkLtg0gln5ksRmoXhPw_iCboGAczGznuLtpKuvKSEoePQ
	Lem8oRq7F.vEa7WCKy3DCvb8hVB5sQvlMwdRS_dJTJZJRakWiuWPuKTL8gLfhkv0e9PZbcP7qAxi
	IJ9P06KzWYFIfmnbFxKdq9X0yR113B9_Tu4w..g4_sib8__mG1dvJESsUy885zk__lTxwnbQHyhn
	hRYOOIsesf1LQSa27qVespp_jJLSNrm7T59SyNRJR_X0XyAIMkXCkQ.tAO_ZKNWtcpO_qNXDLenG
	m.S7EfDWpiKPYn4FvbMbJd7n6m5BCl1WJ6V9tkLUfhJAzh9DFww0suBZLb2YOsUg_GEg4qGoAXO7
	T6xqNhPLlByBP7wkXYITQDhBUFT9iIkjfuQWFiHhhzjxdTozdzDV80LNvnUS0DUOkvCiQtnVp1E1
	YcfKweea2u7QRMX5j4pPPJvZyjWAlWnIo2SBLbfYhXeFDStRBULRPh9euMeeEI4tYU0exBRIFBvL
	kTpa640qMN0kelXw8QQc_gsFXReA6M2vB1GSTzeIgUKEkIFZC4_6mwDzLmfzrERy3xJCt07JEyYi
	Mvo9I.H9LqTOl7fq8oF_Jz3ShnuS6tk17z8lC1eew7Pk34VFnCmx.yXlYztBZ8AA0R_CRazLzWmf
	GuKu8SMS8buQSLahGwBV2g4yE4Ph91K9W73mDArS6e1iq4_mTDbaIOf2GS2sdKe70Gq1XVqtpPdK
	nMsiEb2GBvaJZ8FHnXDov1CivtG2.hzOU4FBFYMTH2dTyX5ZuEp0eb.KesjJXpeVEmSG1PrM8Dfi
	RkcSiLGs6fE3bt_rH3lxk5FLEo.LqMXwRHDNu2avxBZEEANu3.jPRNiZ9Ax_xem7abO6reABSTtJ
	ix9stwIXGmG6zkjb.s0kC_hOl7QtXJxuGleP9b.lsU9H24P1Mbt.B1G10ptd1dAI2jf4qN4oCLJT
	7udYOzZt3DtSJj3CuHJtTvfZJnbIrEXl96imL.hNMINDzXDbGhHZ7oYoPuQy1YvJIwdN9_aA66tC
	5c01UfNjoTbDjsGHkwLPLW4rUQfgTnoq5ZyZLn0kD71c.qCWiLI3LKr7NY_mgRlNJ3ex87ee0lyH
	FdOtTZzjvI3UKxadCCl3gjfUtJuOctDv7qjuIytK9oe_wki_n7BFhQHLmtrN1wSq1z8y0pehYR4W
	OI_OjvELZp0t_UicTWfio8KbKwph0vwhGaZ0XHa2UTcgXAOGECdv.EBQGYP_R27ykYjd4PRhjrSu
	rTHJhsy3SrpOjwcqMjoaYeoppdUpNfhUGZ8bUktEHs12xGh9rQTjWC4xdV38tv_koS2gStuSHvNZ
	tz.mjdkgFvmxB9p7Yd8xwFK7M9U.9mUXpi0MIzmsrCBKjo6kwydkDY4BU.AOZ4gYk0d8TNygZVXn
	r9L0227Rl3rLf_MPV.OnYjGhewMi0lZ_X3V9wDEaughsolORV.ZVqhRN4a5NB_L0BEK6c4kC34dM
	uk0e55oBODY7.IRv0hxZbE.HGFfu4GmRE1fOCFYHTxbZybF.YEMiZaV6M2WZogBwicbt2FONBWbe
	nVxhtqo_W0rxCzcyWRIoqSbVvcY8vL0Za2D.8VHZG6qzeuO01ckSy.xklseQ1Bg.Aw_00xf5o2jc
	_bZma2dh4CuF7IeoGOg.ZWQCHG6cmd96EN6MWOgZuA6Ep1yzRrgD5MpvKdzr_rvE9VqDwFhceQVV
	88qTE.5.G7N4Ji6HO8UVQb2mJDo7TsJkrhwTC6cL8T0TvCYyBBynHj3IZdmvuyA5I2rIS_0Jkddz
	xdOierW.NOEBTdfK7TbOBb7bf75oPfZjlMdJGq37I3UNqNkS.k7K.UMsulnRr0n39L8paWc9OCE8
	WoyST.5BnoliiOOkjoH5RtjvTvGVNlzqDzK2I1j2qfneScRsJXGSOJxNnoaCo5GpqX2wfjDMjffp
	CqGDOi7oynTK3uKtYddTKGEunmk29NvbkKKeyyphWyD4cimhHF8__PbslIF4N4bLobM_GlRPjso3
	2ZNu8IKbovSVeNybbGCj6CITQIU5ZyPKBjx.obUMR8IIXf.p0UZuhBp_2Tlk0f3eMpbml.kCai_L
	3XGj.6mGxg2LQN8MaSrg6jdRC1t75WplTGG91SisB1lneQq6sce5mDbkBfpmxNe3f56NtdRvv.sm
	_EqV3CK9ASwgn.UYa4ECDDnL1lEvovv1GFlscsIhB9Xuul2xd1e9s2TcsMr0povCi5U0mw.xWgsD
	Ba7PyuUYeQ.hfIu.e6pqdCcylORE266SMiih8MIvQxMMt8J1BH0gzTruPuaxZz4s4NJ0D0f8-
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic306.consmr.mail.gq1.yahoo.com with HTTP;
	Tue, 16 Feb 2021 15:26:34 +0000
Received: by smtp422.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 6f5b7ba32cd2d33c874cd26015b33c2b; 
	Tue, 16 Feb 2021 15:26:31 +0000 (UTC)
Subject: Re: [PATCH v24 04/25] IMA: avoid label collisions with stacked LSMs
To: Mimi Zohar <zohar@linux.ibm.com>, casey.schaufler@intel.com,
	jmorris@namei.org, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org
References: <20210126164108.1958-1-casey@schaufler-ca.com>
	<20210126164108.1958-5-casey@schaufler-ca.com>
	<693f81d9d2f50a920cafbbc8d1d634598b99081a.camel@linux.ibm.com>
From: Casey Schaufler <casey@schaufler-ca.com>
Message-ID: <ae6dcadf-57d5-cb29-a361-d020f6333f59@schaufler-ca.com>
Date: Tue, 16 Feb 2021 07:26:30 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <693f81d9d2f50a920cafbbc8d1d634598b99081a.camel@linux.ibm.com>
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
Cc: john.johansen@canonical.com, linux-kernel@vger.kernel.org,
	linux-audit@redhat.com, sds@tycho.nsa.gov
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
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2/14/2021 10:21 AM, Mimi Zohar wrote:
> Hi Casey,
>
> On Tue, 2021-01-26 at 08:40 -0800, Casey Schaufler wrote:
>> Integrity measurement may filter on security module information
>> and needs to be clear in the case of multiple active security
>> modules which applies. Provide a boot option ima_rules_lsm= to
>> allow the user to specify an active securty module to apply
>> filters to. If not specified, use the first registered module
>> that supports the audit_rule_match() LSM hook. Allow the user
>> to specify in the IMA policy an lsm= option to specify the
>> security module to use for a particular rule.
> Thanks, Casey.
>
> (This patch description line length seems short.)
>
>> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
>> To: Mimi Zohar <zohar@linux.ibm.com>
>> To: linux-integrity@vger.kernel.org
>> ---
>>  Documentation/ABI/testing/ima_policy |  8 +++-
>>  security/integrity/ima/ima_policy.c  | 64 ++++++++++++++++++++++------
>>  2 files changed, 57 insertions(+), 15 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/ima_policy b/Documentation/ABI/testing/ima_policy
>> index e35263f97fc1..a7943d40466f 100644
>> --- a/Documentation/ABI/testing/ima_policy
>> +++ b/Documentation/ABI/testing/ima_policy
>> @@ -25,7 +25,7 @@ Description:
>>  			base:	[[func=] [mask=] [fsmagic=] [fsuuid=] [uid=]
>>  				[euid=] [fowner=] [fsname=]]
>>  			lsm:	[[subj_user=] [subj_role=] [subj_type=]
>> -				 [obj_user=] [obj_role=] [obj_type=]]
>> +				 [obj_user=] [obj_role=] [obj_type=] [lsm=]]
> "[lsm=]" either requires all LSM rules types (e.g. {subj/obj}_user,
> role, type) to be exactly the same for multiple LSMs or all of the LSM
> rule types are applicable to only a single LSM.  Supporting multiple
> LSMs with exactly the same LSM labels doesn't seem worth the effort.  
> Keep it simple - a single rule, containing any LSM rule types, is
> applicable to a single LSM.

Thank you. I will add this.

>
>>  			option:	[[appraise_type=]] [template=] [permit_directio]
>>  				[appraise_flag=] [keyrings=]
>>  		  base:
>> @@ -114,6 +114,12 @@ Description:
>>
>>  			measure subj_user=_ func=FILE_CHECK mask=MAY_READ
>>
>> +		It is possible to explicitly specify which security
>> +		module a rule applies to using lsm=.  If the security
>> +		modules specified is not active on the system the rule
>> +		will be rejected.  If lsm= is not specified the first
>> +		security module registered on the system will be assumed.
>> +
>>  		Example of measure rules using alternate PCRs::
>>
>>  			measure func=KEXEC_KERNEL_CHECK pcr=4
>> diff --git a/security/integrity/ima/ima_policy.c b/security/integrity/ima/ima_policy.c
>> index 8002683003e6..de72b719c90c 100644
>> --- a/security/integrity/ima/ima_policy.c
>> +++ b/security/integrity/ima/ima_policy.c
>> @@ -82,6 +82,7 @@ struct ima_rule_entry {
>>  		void *rules[LSMBLOB_ENTRIES]; /* LSM file metadata specific */
>>  		char *args_p;	/* audit value */
>>  		int type;	/* audit type */
>> +		int which_lsm; /* which of the rules to use */
>>  	} lsm[MAX_LSM_RULES];
> Even if we wanted to support multiple LSMs within the same rule having
> both "rules[LSMBLOB_ENTRIES]" and "which_lsm" shouldn't be necessary.  
> The LSMBLOB_ENTRIES should already identify the LSM.
>
> To support a single LSM per policy rule, "which_lsm" should be defined
> outside of lsm[MAX_LSM_RULES].  This will simplify the rest of the code
> (e.g. matching/freeing rules).
>
> 	int which_lsm;          /* which of the rules to use */
> 	struct {
>                 void *rule;        /* LSM file metadata specific */
>                 char *args_p;   /* audit value */
>                 int type;       /* audit type */
>         } lsm[MAX_LSM_RULES];

You're right, that is better. I'll incorporate the change.

>
>
>>  	char *fsname;
>>  	struct ima_rule_opt_list *keyrings; /* Measure keys added to these keyrings */
>> @@ -90,17 +91,15 @@ struct ima_rule_entry {
>>
>>  /**
>>   * ima_lsm_isset - Is a rule set for any of the active security modules
>> - * @rules: The set of IMA rules to check
>> + * @entry: the rule entry to examine
>> + * @lsm_rule: the specific rule type in question
>>   *
>> - * If a rule is set for any LSM return true, otherwise return false.
>> + * If a rule is set return true, otherwise return false.
>>   */
>> -static inline bool ima_lsm_isset(void *rules[])
>> +static inline bool ima_lsm_isset(struct ima_rule_entry *entry, int lsm_rule)
>>  {
>> -	int i;
>> -
>> -	for (i = 0; i < LSMBLOB_ENTRIES; i++)
>> -		if (rules[i])
>> -			return true;
>> +	if (entry->lsm[lsm_rule].rules[entry->lsm[lsm_rule].which_lsm])
>> +		return true;
> If each IMA policy rule is limited to a specific LSM, then the test
> would be "entry->which_lsm".

Which would be an improvement.

>
>>  	return false;
>>  }
>>
>> @@ -273,6 +272,20 @@ static int __init default_appraise_policy_setup(char *str)
>>  }
>>  __setup("ima_appraise_tcb", default_appraise_policy_setup);
>>
>> +static int ima_rule_lsm __ro_after_init;
>> +
>> +static int __init ima_rule_lsm_init(char *str)
>> +{
>> +	ima_rule_lsm = lsm_name_to_slot(str);
>> +	if (ima_rule_lsm < 0) {
>> +		ima_rule_lsm = 0;
>> +		pr_err("rule lsm \"%s\" not registered", str);
>> +	}
>> +
>> +	return 1;
>> +}
>> +__setup("ima_rule_lsm=", ima_rule_lsm_init);
> The patch description refers to "ima_rules_lsm=".  Please update one or
> the other.

ima_rules_lsm seem to be more accurate. I'll fix it.

>
> thanks,
>
> Mimi

Thanks for the review and recommendations.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

