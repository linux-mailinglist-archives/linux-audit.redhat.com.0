Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 0CAEF17E5F3
	for <lists+linux-audit@lfdr.de>; Mon,  9 Mar 2020 18:45:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583775929;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post:autocrypt:autocrypt;
	bh=R83f4LxFy9pacBIdyR1c21gAPQcdyyRMkacLybXuwko=;
	b=c4CSqV//hkUoXgL81zpoaQZP0lVFe4DKE7syGONrGH1mGXX4dp8MhBOe3WXgMJdRCUH7dS
	zz+UJKfdEOa6VsQ88XRMh2lwgem1hdqZKTaHzjn/AyX+KQM2M/RlmECJf6LnpbV9TOIFWz
	ZaiO+4G2hUnfpOgB4YiAlaStms/Zu/Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-G54HE7cxOreIESMLGKEpYQ-1; Mon, 09 Mar 2020 13:45:26 -0400
X-MC-Unique: G54HE7cxOreIESMLGKEpYQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DA4E107ACCC;
	Mon,  9 Mar 2020 17:45:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E67535C28D;
	Mon,  9 Mar 2020 17:45:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0022C18089CD;
	Mon,  9 Mar 2020 17:45:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 029HjBBN023812 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 9 Mar 2020 13:45:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5166F2028CD3; Mon,  9 Mar 2020 17:45:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C8E12026D67
	for <linux-audit@redhat.com>; Mon,  9 Mar 2020 17:45:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C28D1017E54
	for <linux-audit@redhat.com>; Mon,  9 Mar 2020 17:45:07 +0000 (UTC)
Received: from sonic305-27.consmr.mail.ne1.yahoo.com
	(sonic305-27.consmr.mail.ne1.yahoo.com [66.163.185.153]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-302-RCERhzSiPaOoyHQiv8j-GA-1;
	Mon, 09 Mar 2020 13:45:04 -0400
X-MC-Unique: RCERhzSiPaOoyHQiv8j-GA-1
X-YMail-OSG: manLEVcVM1k0quxk2NWzUvs5vXBUxuHZ2wkt7CjT.Ua1jXIPl_KZS.R7E1EBhHd
	4zcfL8yx3KVXlGwq8nhfCfr37tbAt0zPuBXHslLe4NiIhxVaC_J0oW0McZUAnE.2gBDHlDhpBMDX
	_QQyEDkdgLq58EuABTse3ObfWjdwSkJeSG4RKmBDem4IhJ.qrTwFuNyuNs74XWSyxk6aVt8PGMNL
	DsHO.sRSR0kTOVo13rmrE6VipWixDmJVxq96OJmfp2nuXyBI0WW58nqfgSPf0ZvE5zGzz8J49FC6
	tGMPV.JvNknJmSugIt9gP9rDotctKL7tmbq9VL8KE4QNNDeBaa_7vxivfACdnX6k1P94_yPV.EDx
	q27R0gyioq.gWwEBjH1hGmd3LbILOzS8A2dGPFNzGj1TisZkjd7qFpks6cREecSQ3N95Tm5wd0RR
	sjJoPisSclMHtZVxSEKjmUjvR0.Ktr1a0gRIBn8piY5m8NAucmd2fHgeA3tLVvOw5qoPB7QPRcMW
	rPyeLjlPqHQ8j1nX_nH8i9FaQc4t0zOFZSk_dOTonGdZAw669FrVlDeJUcf8d6oznqxCbHxvetU0
	7NYOBi4SugW9498ymPJUiNTaQ7a9z.5pfn9d_SbDY08HprENVCkjcwPWFAY8iKmF7ykrifjTn.w8
	JYXrCo95lfGKLaMs9kSh4a47Nc9UyNYmJdUjGEbb74tpvyUNasBs0BcSHjqDQYdm2PCrlS9pdnh5
	fLSzt433TDl3jtnaIpWEFzkjLIdCGH3lnr8s_zeFt5nk8lfLVp_vIPVkgYz.t4OoW43TgJxI0Vmk
	xjiwH4ZsC5Wd3iV8VjCd8kb7SyWztCqqJiknnCheSggE8T7qcU1JjSbbdQcgd53OWlZ6S5pSRGT8
	SSRQpZQCBYtTvLw4VmXOynRR1n36BsFNAh8D5ccmysEu9pbKkWXpVwk14HMbBnWLMQPyTTE1qHWX
	IFVZHpJnK1eVyjJIrHqgo4CIhuULw3iYe0dhRhHGamV1vv4.TAsjyj1WL_x6iEhkx37Cy9rFbyRM
	LpQt6jWHe5eow9dKrcwskDEUQgBaweGgwqSsZHTry1SqFrFEqZYq4qNQqzTn2W6MZFuhuilyzXgU
	Hhq0Ks4x7rBTwRlU_5CMiPOjOBmA3br091a4cpUVCDRpg6naLJ8KGO.GOgkhbExXuwUtLv0qKoce
	ZOvUuUZ_eBa7hwcFjzmDw6kq5yEil7J6lPpgINn89nXVBiQK5ZgLlhBXUvqR.Lc_eJ790m9P0fwB
	JMf5l6PKZnGHmEgKzRYxMbVypHijGtdq2iqwHmah5RiUjy_V2ix.3un5OZv0OscP0VhyJQ7jRpfC
	s3LBzuxE5vJVrD6o7P4I2ZadmTm19BepVza2g0aYGC7dZzeq51f_5T9oo6.AZ8OAEXDW.nmvN4Wl
	thlg2B0tZj_k-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic305.consmr.mail.ne1.yahoo.com with HTTP;
	Mon, 9 Mar 2020 17:45:03 +0000
Received: by smtp424.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 3393403a0913e246791ff146289b7117; 
	Mon, 09 Mar 2020 17:45:01 +0000 (UTC)
Subject: Re: [PATCH v15 21/23] Audit: Include object data for all security
	modules
To: Paul Moore <paul@paul-moore.com>
References: <20200222000407.110158-1-casey@schaufler-ca.com>
	<20200222000407.110158-14-casey@schaufler-ca.com>
	<CAHC9VhSrjdzL_4s1kPvuc6PxOQi5LmsxRaW10pYjDM2_nbstJw@mail.gmail.com>
From: Casey Schaufler <casey@schaufler-ca.com>
Autocrypt: addr=casey@schaufler-ca.com; keydata=
	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
	abzjfg==
Message-ID: <42b3a4f0-c6ee-516a-7d10-726222c42b78@schaufler-ca.com>
Date: Mon, 9 Mar 2020 10:45:00 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAHC9VhSrjdzL_4s1kPvuc6PxOQi5LmsxRaW10pYjDM2_nbstJw@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 029HjBBN023812
X-loop: linux-audit@redhat.com
Cc: casey.schaufler@intel.com, linux-audit@redhat.com
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 3/6/2020 6:31 PM, Paul Moore wrote:
> On Fri, Feb 21, 2020 at 7:06 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>> When there is more than one context displaying security
>> module extend what goes into the audit record by supplimenting
>> the "obj=" with an "obj_<lsm>=" for each such security
>> module.
>>
>> Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
>> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
>> Cc:linux-audit@redhat.com
>> ---
>>  kernel/audit.h   |   4 +-
>>  kernel/auditsc.c | 106 ++++++++++++++++++++++++-----------------------
>>  2 files changed, 56 insertions(+), 54 deletions(-)
> ...
>
>> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
>> index 68ae5fa843c1..7dab48661e31 100644
>> --- a/kernel/auditsc.c
>> +++ b/kernel/auditsc.c
>> @@ -956,13 +953,57 @@ static inline void audit_free_context(struct audit_context *context)
>>         kfree(context);
>>  }
>>
>> +static int audit_log_object_context(struct audit_buffer *ab,
>> +                                   struct lsmblob *blob)
>> +{
>> +       struct lsmcontext context;
>> +       const char *lsm;
>> +       int i;
>> +
>> +       /*
>> +        * None of the installed modules have object labels.
>> +        */
>> +       if (security_lsm_slot_name(0) == NULL)
>> +               return 0;
>> +
>> +       if (blob->secid[0] != 0) {
>> +               if (security_secid_to_secctx(blob, &context, 0)) {
>> +                       audit_log_format(ab, " obj=?");
>> +                       return 1;
>> +               }
>> +               audit_log_format(ab, " obj=%s", context.context);
>> +               security_release_secctx(&context);
>> +       }
>> +
>> +       /*
>> +        * Don't do anything more unless there is more than one LSM
>> +        * with a security context to report.
>> +        */
>> +       if (security_lsm_slot_name(1) == NULL)
>> +               return 0;
>> +
>> +       for (i = 0; i < LSMBLOB_ENTRIES; i++) {
>> +               lsm = security_lsm_slot_name(i);
>> +               if (lsm == NULL)
>> +                       break;
>> +               if (blob->secid[i] == 0)
>> +                       continue;
>> +               if (security_secid_to_secctx(blob, &context, i)) {
>> +                       audit_log_format(ab, " obj_%s=?", lsm);
>> +                       continue;
>> +               }
>> +               audit_log_format(ab, " obj_%s=%s", lsm, context.context);
>> +               security_release_secctx(&context);
>> +       }
>> +       return 0;
>> +}
>> +
>>  static int audit_log_pid_context(struct audit_context *context, pid_t pid,
>>                                  kuid_t auid, kuid_t uid,
>>                                  unsigned int sessionid,
>>                                  struct lsmblob *blob, char *comm)
>>  {
>>         struct audit_buffer *ab;
>> -       struct lsmcontext lsmctx;
>>         int rc = 0;
>>
>>         ab = audit_log_start(context, GFP_KERNEL, AUDIT_OBJ_PID);
>> @@ -972,15 +1013,7 @@ static int audit_log_pid_context(struct audit_context *context, pid_t pid,
>>         audit_log_format(ab, "opid=%d oauid=%d ouid=%d oses=%d", pid,
>>                          from_kuid(&init_user_ns, auid),
>>                          from_kuid(&init_user_ns, uid), sessionid);
>> -       if (lsmblob_is_set(blob)) {
>> -               if (security_secid_to_secctx(blob, &lsmctx, LSMBLOB_FIRST)) {
>> -                       audit_log_format(ab, " obj=(none)");
>> -                       rc = 1;
>> -               } else {
>> -                       audit_log_format(ab, " obj=%s", lsmctx.context);
>> -                       security_release_secctx(&lsmctx);
>> -               }
>> -       }
>> +       rc = audit_log_object_context(ab, blob);
>>         audit_log_format(ab, " ocomm=");
>>         audit_log_untrustedstring(ab, comm);
>>         audit_log_end(ab);
> I realized you don't hang around linux-audit

I do, but having implemented audit systems in the past
I try not to interfere with someone else's approach for
fear of getting sucked in to working on it.

>  (why would anyone want to do that?!)

Keeping an eye on trends or possible Smack impact.

> so let me tell you one of my most hated mantras: "new audit
> fields MUST go at the end of the audit record".  The "MUST" is in all
> caps because either I'm being clever and reusing some IETF RFC
> concepts, or I'm tired of arguing this point and feel like
> capitalization is the best I can do for stress relief; maybe it is a
> combination of the two.  Feel free to pick whichever reason you find
> most pleasing.

I'll go with stress relief. Glad to be helpful. ;)

> Either way, the "obj=" field should stay where it is, but the
> "obj_XXX=" fields need to find their way to the end of the record.

As Steve pointed out, there may be a bigger issue here. If the additional
fields aren't going to fit in MAX_AUDIT_MESSAGE_LENGTH bytes another
format may be required. I had hoped that perhaps obj_selinux= might count
as a refinement to obj= and hence not be considered a new field, but
it looks like that's not flying.



--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

