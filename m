Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 922C22E6A68
	for <lists+linux-audit@lfdr.de>; Mon, 28 Dec 2020 20:23:05 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-PnLvnAtvPlGLYJWKsLxq9Q-1; Mon, 28 Dec 2020 14:22:58 -0500
X-MC-Unique: PnLvnAtvPlGLYJWKsLxq9Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56F59801817;
	Mon, 28 Dec 2020 19:22:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 288871B469;
	Mon, 28 Dec 2020 19:22:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D1C371809C9F;
	Mon, 28 Dec 2020 19:22:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BSJMKZT031528 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 28 Dec 2020 14:22:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 83BFA2026D47; Mon, 28 Dec 2020 19:22:20 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EC5C2026DE4
	for <linux-audit@redhat.com>; Mon, 28 Dec 2020 19:22:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DF17811E76
	for <linux-audit@redhat.com>; Mon, 28 Dec 2020 19:22:18 +0000 (UTC)
Received: from sonic309-27.consmr.mail.ne1.yahoo.com
	(sonic309-27.consmr.mail.ne1.yahoo.com [66.163.184.153]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-567-f__OYPhTMaWKBBftDBL7Og-1;
	Mon, 28 Dec 2020 14:22:15 -0500
X-MC-Unique: f__OYPhTMaWKBBftDBL7Og-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1609183335; bh=7ihie2lXaLVBJCMe31qwLFQfVpfHoMK6i2yo0gbOQQ4=;
	h=Subject:To:From:Date:From:Subject;
	b=ulQMD6NGC7aps2AE5JjFCO4PgT3R+I0MF//yIEuO8NGOdCSCe9lvIom14dJHS9+E3tYjxjkDyM6rkQxoRPQ6SU3aqV8J9XBRNhWQ6LtU+T6Vtn7NWsCsrQbu8ysxFSOZfznFcyeiLlG1BwL9iuAohNBosxCYGgzQ4MdphedoawnqWnuFcaomjXdGIAgrxHEJol3XJXIm/XVzJ92+8h4jeeBH1DjSSPZyLUBPNR8YO/ixomlhp83AEnHs+rnSvhN0qO/rpJChiu61kOFpcKlEtVEGTIEbNnFdQW6QWmgc7JbrHykeL4IUvIUYmwVo7DTtPKO30ZIKYOexQhGuTMPSfA==
X-YMail-OSG: B.M6758VM1kCV9eHCEZRdR5rIzpNkfEQW1nUe8WxD7tCqiLHNcqfqpRwbt828Cx
	PTHF26yFpRgp70Md3KTJ_udD6gAwMm3klH.guu07YsDDQqglR2NrTUiIERkBCA94Drtt8p9iUgxw
	1j_Cd5IjXHxGvnnjG2_oeI4r1emq9oVqdWphEgqRbwXwzGgaJ3orMDOkZg8rGEE8R4jHeh4IXsWy
	ucdm85KnVIEFjAWLLUnzK9hHrCo5ByakLOGFI8T6Lt9k4fF4corX6YHSvOmqkIOYogHfgj9crcWF
	P4WaWErKjlUtdQS4dY1r.6WNTIIizkL3igKmx34cMke_JFdJMrkpsVs8nE8bJYtS3DceYLIqou3v
	XHUBD5.nB1OnPf1sQvN9OcmVQ8wLOAJqzysVhZXc3hDMDtlP1t1tw6i2iAIYsJ0fkMAofoHN4tyM
	Cx2KYdtJ4xyLOp4riZtk6MCWZ._jlttwfJVAn9sNjBNoaOZceKRX3HdYXQmkAmrak5YFPzHO_yp_
	Mjcv4d8VR3KgCWCJhCCIeZv1ERU7e8Lr1SNWR8FdJndC_VTVz1ZqGGMzGuRZl.IUQkepnRoqZy0z
	rsUW3LnIz2gzwT8BuJKqc4C7sj8r623e9evQ21ABTBVg4dYtPV9HYbeNFK1cnDrqzMyeOLQT4d..
	NQjvz2FbsydgFKqkuEFz6stIHo93lcXnZZIUHST3qIb396Ph_8kXqvX7Gcwc_nmIPvdU6cuHRO.L
	5EQjd5PmmG8VShf72zhXIkEBDcHMoaV6a7npcDdNJ3ofJQerXce1pNwY1Y_S6Ccxsb4u1A8g5NwR
	yFBHTu2RSV8VDSWNW02fI9C2BbEXw3J5DWi8O0CrP_JA6T.n.E4AcyrM_DkPrt9.d4fEbABYt0cr
	2PV1d9I91aW2uFpXUjdc1AkHGQVW2VXRA1zc2axfhcmaGq1P0lbDb_1kp2RkquAAyeELyYNtQSPa
	eh8.g2R.wltk0.F5NOis6gxmHNCElhCHMwgEXrcm20PTtLx7WwLmqoJ.fNyQZi7wVbicyv1jTXdY
	jWZr5ULqhyCy.9Gcs__n1kP.N8iMzYxQDgsDGuaVu4CWOCl8NdxdI1r_T09DSh91fvLjPuUtwBDo
	DXdFXj892.onGJJ8Xn1rdwOS7O9kUY74VarBQ1yqOlEdRHwPK1weBaLIH1SS4Fp6y9BnfDTgGdB_
	rb44y07RDIah2T0SQgupGn4E4zO3RuGzqcnbkn2WLxpF1qS8qOU5_bk6cb0dA9eFZzIey4sUyiZH
	PJKZP90X.CxUMyZWl14nblbt_sCM3lkPTMS3aMdewYYfOtrW3tcz2RnZe9ycxEM41MhfmEYTOqwe
	TYlESjoNHRzjhPKxDF6_yFaxAZSvB2RqHij46y.xOR7pKkvtVtXwlwFKAhMehEN_eCLc77Ctn_mF
	JWwcOA.BWZzr4.mUXNypn.POix_57XKqQ1IyrbkqhJkJMAs2AFt1IUWlJRIkdvuB_8L5i.S7RVwE
	bwR66_qLL3eJEILUpcXz7C4_rCSNSvWr2.KClSRLBe6O2h0SqbnaYjw9Zctexu9jlK62l2wgQZhp
	pZKPuBv20LcWIk8Rrx3eKsOon7dAJ25R7yJktWwbsITu80a5Gjks511MQkkKKzEcqjP_pR8956w6
	1UoQyIwrxCV17udE961IlJLCHS4Iddk3h74jng9jF5KKXUhUSFTpKtVdyC9m0xtF9j7RUkJUbuNt
	_1myRw4lcyDndEZJPbqWLHEivV1zPYGuACWhdZNy3nQLFI6PDANBDQfs3_0LnKMRyFjlJx9OnbvW
	q0W0Sd0LHWGNrgYGC8FU54XyVVT0N4EJbWctZ6ksqsG7DHceyIHm3ySIXH5gjnhAf2N81q0laZaR
	EaC_Mcsq0Ey5P7HIImzGuVZypK_p3glf1Bdfv1kenAchWc56zEP92Ut7GeoOT2rQzp4nXnqZPi9T
	Xl7TPcCec9f2aHbNAFhkUyCBUorcJ81EbswDjXFrFF3i7SqIRG7BfWUVyX.aZmahIWz.p74lFv.e
	b5SUAYAFm6oqns2pDPY4KOcxQk2IPpMzsVhrtOdsvxTUXTptcACq._ydnexEi0BO4Ez6i4E8dnNz
	gRnJH6CqPbjRUsotmlw09YNZY9Zye1WIUH8w_55uBIf1CJB1ueYPhu1fiMQzeQzwsVY8uleSTtTc
	25xqRO44XQl1m3FQ12xvw_iJgNqdPcMDgfJhkqyICMlBWt6sFUTaVG5llTMV5Vkm8Q6V0zbZktVQ
	8yx7TdIyVYpGLg5TO6Qr6nlKNlZ3t4wD129CLuDUC.pJXUe6FF4hosUc1haUbG8PWRiiQM32GnTL
	g_rJgHyIGckAZ17_5qNzSdWzTUDBv621_3O2Tai2n2RuiFqRpEfZKGEorYaORlOk407NtSscZSCa
	RTXv1SHomjMiZ6WmJFpvhyr0o_UYKWeo0htLhpa8yyaabYyNrfk0M6.L6qt1OzhfWgfo6_OtueBw
	8xgHS_n4et85hWGPUgk_ow8nSh3tCtzS4v6gftpWBSaUqDQfBUKRSWXUbeWIB80SZA7o8XDyqPiT
	oaNkMaYOwugl49Kp7.7EiasU7jOcDoTLzco0A8F4tFXCkr9Ij0qG63NZddgIHDNLdERHfc17_5VJ
	xqBfa6OZLjqH8bWBXNvGgK67rKYdo89iDU17niJ6M.1OhkZkfJxgL4.4c_fVvjtDRg4IqK.OBnQ9
	.82GPgPkK0fyi4Ct3mM.zCAxRTOu0gyZuRWQuzHvsp_.1rIF4YIF6MVpv7PKTtZllHvCmaGqF9Ta
	Lmd9ZzvS1ZZbUPbvIrizsKeoNo.OQVJoQRszfMdGzepNThl24E58n5F.ZspscZmdimdJ_18L3_cR
	kDqn1bi8aiY9LEmCrzPdcS_ou4lDRBgUZgqZ9vWPNGt2BDz0SXnNnhBofAUdSaNc3eRimRC27_D_
	yNJvy3gq4MD9t1dI7SLcMiJCObobiWkxnMU.F8Ow07X3jT9yGhXLlp.GVpK6VbajBqEjnA3X0HDU
	1XE_GzEmyH25YRwIoLNpfRN_xuK1yMeP0j5Z0qacqIUrwaFKcOEUebWPlpAbVN.1HKmTGAMoCtE5
	FB193AHJcGc3iEQPjfQ4BZlEjkJIZCzjb9Nx3uG27BW01ITjdU1UAvTFb4absB1.hnySzYNUx9p.
	yZA.NZvoaFA2SVnAC9qFZzj4UKbg_JpgLGg--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic309.consmr.mail.ne1.yahoo.com with HTTP;
	Mon, 28 Dec 2020 19:22:15 +0000
Received: by smtp408.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID a6826294e264b601a154bfa5fd362599; 
	Mon, 28 Dec 2020 19:22:12 +0000 (UTC)
Subject: Re: [PATCH v23 02/23] LSM: Create and manage the lsmblob data
	structure.
To: Mimi Zohar <zohar@linux.ibm.com>, casey.schaufler@intel.com,
	jmorris@namei.org, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org
References: <20201120201507.11993-1-casey@schaufler-ca.com>
	<20201120201507.11993-3-casey@schaufler-ca.com>
	<903c37e9036d167958165ab700e646c1622a9c40.camel@linux.ibm.com>
From: Casey Schaufler <casey@schaufler-ca.com>
Message-ID: <c88bc01f-3b65-f320-b42b-5ecde3e29448@schaufler-ca.com>
Date: Mon, 28 Dec 2020 11:22:09 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <903c37e9036d167958165ab700e646c1622a9c40.camel@linux.ibm.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0BSJMKZT031528
X-loop: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12/28/2020 9:54 AM, Mimi Zohar wrote:
> Hi Casey,
>
> On Fri, 2020-11-20 at 12:14 -0800, Casey Schaufler wrote:
>> When more than one security module is exporting data to
>> audit and networking sub-systems a single 32 bit integer
>> is no longer sufficient to represent the data. Add a
>> structure to be used instead.
>>
>> The lsmblob structure is currently an array of
>> u32 "secids". There is an entry for each of the
>> security modules built into the system that would
>> use secids if active. The system assigns the module
>> a "slot" when it registers hooks. If modules are
>> compiled in but not registered there will be unused
>> slots.
>>
>> A new lsm_id structure, which contains the name
>> of the LSM and its slot number, is created. There
>> is an instance for each LSM, which assigns the name
>> and passes it to the infrastructure to set the slot.
>>
>> The audit rules data is expanded to use an array of
>> security module data rather than a single instance.
>> Because IMA uses the audit rule functions it is
>> affected as well.
> This patch is quite large, even without the audit rule change.  I would
> limit this patch to the new lsm_id structure changes.  The audit rule
> change should be broken out as a separate patch so that the audit
> changes aren't hidden.

Breaking up the patch in any meaningful way would require
scaffolding code that is as extensive and invasive as the
final change. I can do that if you really need it, but it
won't be any easier to read.

> In addition, here are a few high level nits:
> - The (patch description) body of the explanation, line wrapped at 75
> columns, which will be copied to the permanent changelog to describe
> this patch. (Refer  Documentation/process/submitting-patches.rst.)

Will fix.

> - The brief kernel-doc descriptions should not have a trailing period. 
> Nor should kernel-doc variable definitions have a trailing period. 
> Example(s) inline below.  (The existing kernel-doc is mostly correct.)

Will fix.

> - For some reason existing comments that span multiple lines aren't
> formatted properly.   In those cases, where there is another change,
> please fix the comment and function description.

Can you give an example? There are multiple comment styles
used in the various components.

> thanks,
>
> Mimi

I don't see any comments on the ima code changes. I really
don't want to spin a new patch set that does nothing but change
two periods in comments only to find out two months from now
that the code changes are completely borked. I really don't
want to go through the process of breaking up the patch that has
been widely Acked if there's no reason to expect it would require
significant work otherwise.

>
>> Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
>> Acked-by: Paul Moore <paul@paul-moore.com>
>> Acked-by: John Johansen <john.johansen@canonical.com>
>> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
>> Cc: <bpf@vger.kernel.org>
>> Cc: linux-audit@redhat.com
>> Cc: linux-security-module@vger.kernel.org
>> Cc: selinux@vger.kernel.org
>> ---
>> diff --git a/include/linux/security.h b/include/linux/security.h
>> index bc2725491560..fdb6e95c98e8 100644
>> --- a/include/linux/security.h
>> +++ b/include/linux/security.h
>> @@ -132,6 +132,65 @@ enum lockdown_reason {
>>
>>  extern const char *const lockdown_reasons[LOCKDOWN_CONFIDENTIALITY_MAX+1];
>>
>> +/*
>> + * Data exported by the security modules
>> + *
>> + * Any LSM that provides secid or secctx based hooks must be included.
>> + */
>> +#define LSMBLOB_ENTRIES ( \
>> +	(IS_ENABLED(CONFIG_SECURITY_SELINUX) ? 1 : 0) + \
>> +	(IS_ENABLED(CONFIG_SECURITY_SMACK) ? 1 : 0) + \
>> +	(IS_ENABLED(CONFIG_SECURITY_APPARMOR) ? 1 : 0) + \
>> +	(IS_ENABLED(CONFIG_BPF_LSM) ? 1 : 0))
>> +
>> +struct lsmblob {
>> +	u32     secid[LSMBLOB_ENTRIES];
>> +};
>> +
>> +#define LSMBLOB_INVALID		-1	/* Not a valid LSM slot number */
>> +#define LSMBLOB_NEEDED		-2	/* Slot requested on initialization */
>> +#define LSMBLOB_NOT_NEEDED	-3	/* Slot not requested */
>> +
>> +/**
>> + * lsmblob_init - initialize an lsmblob structure.
> Only this kernel-doc brief description is suffixed with a period.  
> Please remove.
>
>> + * @blob: Pointer to the data to initialize
>> + * @secid: The initial secid value
>> + *
>> + * Set all secid for all modules to the specified value.
>> + */
>> +static inline void lsmblob_init(struct lsmblob *blob, u32 secid)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < LSMBLOB_ENTRIES; i++)
>> +		blob->secid[i] = secid;
>> +}
>> +
>> +/**
>> + * lsmblob_is_set - report if there is an value in the lsmblob
>> + * @blob: Pointer to the exported LSM data
>> + *
>> + * Returns true if there is a secid set, false otherwise
>> + */
>> +static inline bool lsmblob_is_set(struct lsmblob *blob)
>> +{
>> +	struct lsmblob empty = {};
>> +
>> +	return !!memcmp(blob, &empty, sizeof(*blob));
>> +}
>> +
>> +/**
>> + * lsmblob_equal - report if the two lsmblob's are equal
>> + * @bloba: Pointer to one LSM data
>> + * @blobb: Pointer to the other LSM data
>> + *
>> + * Returns true if all entries in the two are equal, false otherwise
>> + */
>> +static inline bool lsmblob_equal(struct lsmblob *bloba, struct lsmblob *blobb)
>> +{
>> +	return !memcmp(bloba, blobb, sizeof(*bloba));
>> +}
>> +
>>  /* These functions are in security/commoncap.c */
>>  extern int cap_capable(const struct cred *cred, struct user_namespace *ns,
>> diff --git a/security/integrity/ima/ima_policy.c b/security/integrity/ima/ima_policy.c
>> index 9b5adeaa47fc..cd393aaa17d5 100644
>> --- a/security/integrity/ima/ima_policy.c
>> +++ b/security/integrity/ima/ima_policy.c
>>  	} lsm[MAX_LSM_RULES];
>> @@ -88,6 +88,22 @@ struct ima_rule_entry {
>>  	struct ima_template_desc *template;
>>  };
>>
>> +/**
>> + * ima_lsm_isset - Is a rule set for any of the active security modules
>> + * @rules: The set of IMA rules to check.
> Nor do kernel-doc variable definitions have a trailing period.
>
>> + *
>> + * If a rule is set for any LSM return true, otherwise return false.
>> + */
>> +static inline bool ima_lsm_isset(void *rules[])
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < LSMBLOB_ENTRIES; i++)
>> +		if (rules[i])
>> +			return true;
>> +	return false;
>> +}
>> +
>>  /*
>>   * Without LSM specific knowledge, the default policy can only be
>>   * written in terms of .action, .func, .mask, .fsmagic, .uid, and .fowner


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

