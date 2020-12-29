Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 364EC2E7310
	for <lists+linux-audit@lfdr.de>; Tue, 29 Dec 2020 19:47:30 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-l5MWps8qP4WQSCyd6t1iFQ-1; Tue, 29 Dec 2020 13:47:27 -0500
X-MC-Unique: l5MWps8qP4WQSCyd6t1iFQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EC9A180A094;
	Tue, 29 Dec 2020 18:47:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 683C260BE5;
	Tue, 29 Dec 2020 18:47:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D81A2180954D;
	Tue, 29 Dec 2020 18:47:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BTIkYKs031442 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 29 Dec 2020 13:46:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B0B5E100296D; Tue, 29 Dec 2020 18:46:34 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC7C61111C84
	for <linux-audit@redhat.com>; Tue, 29 Dec 2020 18:46:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7059D101A561
	for <linux-audit@redhat.com>; Tue, 29 Dec 2020 18:46:32 +0000 (UTC)
Received: from sonic309-27.consmr.mail.ne1.yahoo.com
	(sonic309-27.consmr.mail.ne1.yahoo.com [66.163.184.153]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-381-G2iq9NSkNm2Zn4wdTq9yqw-1;
	Tue, 29 Dec 2020 13:46:26 -0500
X-MC-Unique: G2iq9NSkNm2Zn4wdTq9yqw-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1609267586; bh=0k2eQPy+Wl8A6fedCgrE9BQisF8wHqpc9W3iu+Jrzmz=;
	h=Subject:To:From:Date:From:Subject;
	b=CzWl883ZmC/kPUUajWnMzsAYzpBRGB4CcRWclKSTDFdl4FrNrEbYhSLtP1VoRVxjr2kfNnMWdrNAMT2P1THIi2Zom07lU2ImVkIRkFhUAXIi8wSd5fiyTLHMqrx1MYcknDzoKcHITTM3UJFTey6pm5UEmRSRb72vzF3qS1vV6GJEB76EvYJI4koVGUgAwJq6HcVvwQkBCInEVS0Udt/JakWZxpLsUhWDWh8GH36XEvOYAZ1FftZy+GN8DSGJEKQTahrrsDH4wBHuMU8J29A5nFDpQrHwLFpVqpHBvMlsUQpglDb/fPP2/q8DmUw44A55XO1XTTlQcKSCyruFt+gsnA==
X-YMail-OSG: HHq2XCkVM1lJ4Jo1k7ADTmQYnIGeYiQeeCwq9sCu_FX30cfAqDA1y6HuQQwHF6F
	S_EGvMUY4xE4XAIkbPLU9wtgjuAzQZIkjpE08LMZ6XZiidsPwj8faG2AxBz3XME6Jk2fZ6MWYQeh
	ns0Q_5ou2ODxJ3oCBGA2WKNSPCmcTrUL1JAqDomPwLYSduOEHfic5yfPmAgVHyGfEMWlgftrPxZ2
	7Wke4LEznfd7kjVRO8hhE0LNkHAebnkS9oRpYXpLBDNiUukwNUK4SQF10fZ56_CCxjfGlX2fdlTK
	NQfa1LpeSeQBwzhf5yyDXZx7efQ8Iq155BVvPnwCUJ2.xjkGFm37odO0LiYhajRSfLbKzBkOiAVs
	c6eHSoZ8KKD4hEqRD9h_RFJr8uJ5ORHwy8ofrR.jeKpms3G1I2gOZ9FE.SAf8CNmakJAOB6pQwzx
	lAuVJ5L50.R0JkBmBzWQQjwcjBn.JL4cjKuOr6uyYvn3RWsnYYEjkIuftzrFdOG07dJZ3AJxLmi6
	m4x8egoBWsn9LF06KLREJeRqKW5FJFDj5OtlyA9P27SDjIsP_04HahCdkkTSB2cB9OTV7zKrwTF6
	Sihr5p2XvftPkJ.sHbq7kxvz1Ue6.woETuNaHoUV7GrQs2sdbshY9xLyYoWObG9KYGEouGjUKn16
	XIQ6SvtDzSJhAOIuB2cHmRbX.2w00J0POVK9nmOqvA5jORXv31UpbuVHPOaR8EcSUhyGKP37.ybq
	sH_UeW0LUuaExH0g0dV8qKmr5s_mL.N.bjH7YLUZx2JRXsNvtWTZQHhpBmNluI2ajonlhXrjt_sR
	KqHV.6gErqiONhRf4rgs9yrrLVjXM4kRsabBU9t4Nbf23HLgHZxBCnFd.o1Ns2EsRRh79wkbFcTZ
	Q1wIOXsxoyqX0YgjOp7aN9eF79OmDnBNaH9EqqZsn2s2_K3tTvf7mZeqSHAH_h_tIf_kfyu.LcXh
	kMUFJEIOzhFirlDbi0yNsLvKyLeXQiuGrfmOumxrOpIDJ_L4CjeZH34_.AsFrYYnu0jgdVheQ7z8
	6SFscuIEC8bcKHd3tL6sAdrh5fuxCfUI96Nfnl7XnlpoNKl3hh8bPIhhWo_uS7Wbp4R_KPn.ukB5
	OL4HuJdN7pLv8PedQKugxWE8mCIUDhb3uMJ1LrWGheHqmklkEubhjz.hhQ64p.Lm_RpS21JRJzxZ
	A6drZ_q8_mUUfEZhbgNN1fL.4.Pv7uBEVw5Hdr5XgjBMYRu5t4ItEjHb3xpJXhBf4w.FBr7mXEYX
	7xzZCV08l.Nx6qAXI4_15WlWKEWA7J7Anj_N19qzlK9jnbHjzKmzT7D.d3_zvSWoydy.j76SHm6D
	XLqRdCpnUtDgfZM6ekIky39F0S7uVSLDjfr8aNROgEYk2GlMTMkpI5K.p3Qk.rFFe7lLl7mtFGVw
	8d9TTAf0l2mmQjZSRVeLheE7Wqly0sg9MTdQvZ8Dyl8VBfG1Pkp83CK_iYy97pMOEs3.3Vo0pg67
	Jyc9h3hrPf3g4FbViX8W3kF4DsV6LtIdSRK8Cozw_exGhV52SrghSIPRdb0HyL__BVPq9n63izfT
	ZfsCuiOSlTfM_Hvgx46PBwD6bF1D..6esbb.NQZPKOiL0kdXlUFwht7ZtAEWXWKkY0Olk5YSg1k1
	eNNTOS3fyzOb_2zo5h6cxq.D_wJT0q1D9_MmglXc7Ctu67iRl_6AoP9s_fSGXXQcH306Iqt7NgS8
	eJVUstELwIOnsgUAFDGTdZOLf7Q40JNa8SKPUntMWQX10l8k5XkIGu0TCkA.Wz5jhBMIPqTK3znb
	GZ6owjOqkPMAaDNt_6uUQmricLBw0_YBagSECs4v3tNlmeKWxt_Zt2IYa9wMyssTZIRyGdI2_jAq
	mzDqhf76HGEN6HKQtM5PnX5fxPg3RqvcF2X8Bie2DOzE9xCFGy9T9by7Du5lWRq94_CiPK9ZwTu6
	IRFWrYyJFYMgd.2_K3CiES._Rmn1OjKJNYARlOSCMwIViDbn.oG9g.TUaGO0xAt6GRb2xTCbj4cD
	gUED0JMCOFg8iY86QbL4o3gNU6ZxNTMPip2kMfQlYM5oDNdzJPJsVILJgMB3yDKhxAU3WdjmIfHB
	pmeFDueNign.xTFPoECFoOKJEkQPU..CzQaTChtO7BMYHnEyaMxl9gHPTfEfctphOaqgOVJ2uRE6
	s3vO1Qgq5s0NJBjoU6mf66C0J5SNU3ZqIeoMzfQqS7HiiqZlTB6k7godcsnr0vN4KuNqt5UP3thk
	nwcQp2o0qW8E1T6LpEI8K25IiDj19SoSAW8pT5A.z.34RBnhb078hfPpwBPYyHo4AFSatla0DesN
	AlJfho0WHT3fuLax1Q8brgKMyOj8snCHpYI.LtIJH3k.OLDDoElVzu6cTOg0rm6bX7ELzEbJhNHD
	d1ncWjCK6_vJ4NkmW61jOOEvx4d8whR0IX6zgYsqhPGlAA4GxOs6mf53bfa807ZEaAkbLRCI3FzT
	7bBGbEmYXtlTDPE5pk6KPhQqnwScEiqM2MXnT2hAjkHEt6pp7RF0v3JBlEOEp1g2qfrCvhY4XRQp
	PPXCyh4z_V4z4ktWSdJOjmOccCE.Hi76WVDBPqrQqyh8dSS0gnXEuqyEPTr8Gqoslm7U6eKVL1pE
	qZfgfPYtsyDGp2dBNxV_6xBxvMd0m.aPgMJHKNEJSU05tLiLyFz_PvhCObct91YyryPGtgfvPvaQ
	v._jX0bkf7gzAoIpcfBLHKZm5QNmvp71WbZucokB0YUqiGBbnnusD6ZyqIvWR4zo0lELLwzLQ.dj
	Hpu5G8oNn12vi7h4l6XTEjWYTEZm.WRRlZk7vMLdMD0lu2.gG3YKcO4ap_mdldOJ5bSZYm3ul5Yg
	lfPGLq3Wz90ckC3zWFv5kC9708vvGjdSTSwjnJ.C3IcM923uo2XBmJqkHLEa94NdPonynGkHk1cl
	NO6xMVzWptPujGoO8eHZGmlfHNKY1w2KQkZcTLSpG1kmgbclHX_8OD6984LrwJVBNDhAvOmC_8Fu
	UDeZiFig39_74qAkUNDNETdD7haQgsSeV6obf1o96ZdDhfX9800M8wcjBiiN7wYO.jH3OfPR.WMs
	b642TVw9fpsRrWRFqmGAS0HmJbAG5F0sRERjRZHgMHn1uO5ltZN1bNI8hN79c77hk2JiHp76.dbp
	6nqaM4VyLpXxTwwNRsRdJd2BoxL.lbCGJhNY-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic309.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 29 Dec 2020 18:46:26 +0000
Received: by smtp413.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID ed250a7138f96ccb37d03a31fdb1f256; 
	Tue, 29 Dec 2020 18:46:21 +0000 (UTC)
Subject: Re: [PATCH v23 02/23] LSM: Create and manage the lsmblob data
	structure.
To: Mimi Zohar <zohar@linux.ibm.com>, casey.schaufler@intel.com,
	jmorris@namei.org, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org
References: <20201120201507.11993-1-casey@schaufler-ca.com>
	<20201120201507.11993-3-casey@schaufler-ca.com>
	<b0e154a0db21fcb42303c7549fd44135e571ab00.camel@linux.ibm.com>
	<886fcd04-6a08-d78c-dc82-301c991e5ad8@schaufler-ca.com>
	<07784164969d0c31debd9defaedb46d89409ad78.camel@linux.ibm.com>
	<8f11964c-fa7e-21d1-ea60-7d918cfaabe0@schaufler-ca.com>
	<e260e8c5bbbb488052cbe1f5b528d43461bc4258.camel@linux.ibm.com>
From: Casey Schaufler <casey@schaufler-ca.com>
Message-ID: <10442dd5-f16e-3ca4-c233-7394a11cbbad@schaufler-ca.com>
Date: Tue, 29 Dec 2020 10:46:20 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <e260e8c5bbbb488052cbe1f5b528d43461bc4258.camel@linux.ibm.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0BTIkYKs031442
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12/28/2020 5:53 PM, Mimi Zohar wrote:
> On Mon, 2020-12-28 at 15:20 -0800, Casey Schaufler wrote:
>> On 12/28/2020 2:14 PM, Mimi Zohar wrote:
>>> On Mon, 2020-12-28 at 12:06 -0800, Casey Schaufler wrote:
>>>> On 12/28/2020 11:24 AM, Mimi Zohar wrote:
>>>>> Hi Casey,
>>>>>
>>>>> On Fri, 2020-11-20 at 12:14 -0800, Casey Schaufler wrote:
>>>>>> diff --git a/security/security.c b/security/security.c
>>>>>> index 5da8b3643680..d01363cb0082 100644
>>>>>> --- a/security/security.c
>>>>>> +++ b/security/security.c
>>>>>>
>>>>>> @@ -2510,7 +2526,24 @@ int security_key_getsecurity(struct key *key, char **_buffer)
>>>>>>
>>>>>>  int security_audit_rule_init(u32 field, u32 op, char *rulestr, void **lsmrule)
>>>>>>  {
>>>>>> -       return call_int_hook(audit_rule_init, 0, field, op, rulestr, lsmrule);
>>>>>> +       struct security_hook_list *hp;
>>>>>> +       bool one_is_good = false;
>>>>>> +       int rc = 0;
>>>>>> +       int trc;
>>>>>> +
>>>>>> +       hlist_for_each_entry(hp, &security_hook_heads.audit_rule_init, list) {
>>>>>> +               if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
>>>>>> +                       continue;
>>>>>> +               trc = hp->hook.audit_rule_init(field, op, rulestr,
>>>>>> +                                              &lsmrule[hp->lsmid->slot]);
>>>>>> +               if (trc == 0)
>>>>>> +                       one_is_good = true;
>>>>>> +               else
>>>>>> +                       rc = trc;
>>>>>> +       }
>>>>>> +       if (one_is_good)
>>>>>> +               return 0;
>>>>>> +       return rc;
>>>>>>  }
>>>>> So the same string may be defined by multiple LSMs.
>>>> Yes. Any legal AppArmor label would also be a legal Smack label.
>>>>
>>>>>>  int security_audit_rule_known(struct audit_krule *krule)
>>>>>> @@ -2518,14 +2551,31 @@ int security_audit_rule_known(struct audit_krule *krule)
>>>>>>         return call_int_hook(audit_rule_known, 0, krule);
>>>>>>  }
>>>>>>
>>>>>> -void security_audit_rule_free(void *lsmrule)
>>>>>> +void security_audit_rule_free(void **lsmrule)
>>>>>>  {
>>>>>> -       call_void_hook(audit_rule_free, lsmrule);
>>>>>> +       struct security_hook_list *hp;
>>>>>> +
>>>>>> +       hlist_for_each_entry(hp, &security_hook_heads.audit_rule_free, list) {
>>>>>> +               if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
>>>>>> +                       continue;
>>>>>> +               hp->hook.audit_rule_free(lsmrule[hp->lsmid->slot]);
>>>>>> +       }
>>>>>>  }
>>>>>>
>>>>> If one LSM frees the string, then the string is deleted from all LSMs. 
>>>>> I don't understand how this safe.
>>>> The audit system doesn't have a way to specify which LSM
>>>> a watched label is associated with. Even if we added one,
>>>> we'd still have to address the current behavior. Assigning
>>>> the watch to all modules means that seeing the string
>>>> in any module is sufficient to generate the event.
>>> I originally thought loading a new LSM policy could not delete existing
>>> LSM labels, but that isn't true.  If LSM labels can come and go based
>>> on policy, with this code, could loading a new policy for one LSM
>>> result in deleting labels of another LSM?
>> No. I could imagine a situation where changing policy on
>> a system where audit rules have been set could result in
>> confusion, but that would be true in the single LSM case.
>> It would require that secids used in the old policy be
>> used for different labels in the new policy. That would
>> not be sane behavior. I know it's impossible for Smack.
>>
>> This is one of the reasons I'm switching from a single secid
>> to a collection of secids. You don't want unnatural behavior
>> of one LSM to impact the behavior of another.
>>
>>
>>>>>> -int security_audit_rule_match(u32 secid, u32 field, u32 op, void *lsmrule)
>>>>>> +int security_audit_rule_match(u32 secid, u32 field, u32 op, void **lsmrule)
>>>>>>  {
>>>>>> -       return call_int_hook(audit_rule_match, 0, secid, field, op, lsmrule);
>>>>>> +       struct security_hook_list *hp;
>>>>>> +       int rc;
>>>>>> +
>>>>>> +       hlist_for_each_entry(hp, &security_hook_heads.audit_rule_match, list) {
>>>>>> +               if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
>>>>>> +                       continue;
>>>>>> +               rc = hp->hook.audit_rule_match(secid, field, op,
>>>>>> +                                              &lsmrule[hp->lsmid->slot]);
>>>>>> +               if (rc)
>>>>>> +                       return rc;
>>>>> Suppose that there is an IMA dont_measure or dont_appraise rule, if one
>>>>> LSM matches, then this returns true, causing any measurement or
>>>>> integrity verification to be skipped.
>>>> Yes, that is correct. Like the audit system, you're doing a string based
>>>> lookup, which pretty well has to work this way. I have proposed compound
>>>> label specifications in the past, but even if we accepted something like
>>>> "apparmor=dates,selinux=figs" we'd still have to be compatible with the
>>>> old style inputs.
>>>>
>>>>> Sample policy rules:
>>>>> dont_measure obj_type=foo_log
>>>>> dont_appraise obj_type=foo_log
>>> IMA could extend the existing policy rules like "lsm=[selinux] |
>>> [smack] | [apparmor]", but that assumes that the underlying
>>> infrastructure supports it.
>> Yes, but you would still need rational behavior in the
>> case where someone has old IMA policy rules.
> From an IMA perspective, allowing multiple LSMs to define the same
> policy label is worse than requiring the label be constrained to a
> particular LSM.

Just to be sure we're talking about the same thing,
the case I'm referring to is something like a file with
two extended attributes:

	security.apparmor MacAndCheese
	security.SMACK64 MacAndCheese

and an IMA rule that says

	dont_measure obj_type=MacAndCheese

In this case the dont_measure will be applied to both.
On the other hand,

	security.apparmor MacAndCheese
	security.SMACK64 FranksAndBeans

would also apply the rule to both, which is not
what you want. Unfortunately, there is no way to
differentiate which LSM hit the rule.

So now I'm a little confused. The case where both LSMs
use the same label looks like it works right, where the
case where they're different doesn't.

I'm beginning to think that identifying which LSMs matched
a rule (it may be none, either or both) is the right solution.
I don't think that audit is as sensitive to this.


>
>>>>> Are there any plans to prevent label collisions or at least notify of a
>>>>> label collision?
>>>> What would that look like? You can't say that Smack isn't allowed
>>>> to use valid AppArmor labels. How would Smack know? If the label is
>>>> valid to both, how would you decide which LSM gets to use it?
> Unfortunately, unless audit supports per LSM labels, the infrastructure
> needs to detect and prevent the label collision.

That would be a massive performance hit.

>
>>> As this is a runtime issue, when loading a new policy at least flag the
>>> collision.  When removing the label, when it is defined by multiple
>>> LSMs, at least flag the removal.
>> To what end would the collision be flagged? What would you do with
>> the information?
> LSM label collision is probably an example of kernel integrity critical
> data (yet to be upstreamed).
>
>>>>>> +       }
>>>>>> +       return 0;
>>>>>>  }
>>>>>>  #endif /* CONFIG_AUDIT */
>


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

