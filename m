Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id F3832233B44
	for <lists+linux-audit@lfdr.de>; Fri, 31 Jul 2020 00:23:16 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-PfJPOF8tNl2m0HG8kphUeA-1; Thu, 30 Jul 2020 18:23:13 -0400
X-MC-Unique: PfJPOF8tNl2m0HG8kphUeA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1342800685;
	Thu, 30 Jul 2020 22:23:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF94772AC9;
	Thu, 30 Jul 2020 22:23:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E1BAF1809554;
	Thu, 30 Jul 2020 22:23:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06UMMu1P021896 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 30 Jul 2020 18:22:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 51A2C111145E; Thu, 30 Jul 2020 22:22:56 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CFC9100BC9E
	for <linux-audit@redhat.com>; Thu, 30 Jul 2020 22:22:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3BE72857FAE
	for <linux-audit@redhat.com>; Thu, 30 Jul 2020 22:22:53 +0000 (UTC)
Received: from sonic314-27.consmr.mail.ne1.yahoo.com
	(sonic314-27.consmr.mail.ne1.yahoo.com [66.163.189.153]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-182-rb6NremTOR67p8cbeEAsPQ-1;
	Thu, 30 Jul 2020 18:22:50 -0400
X-MC-Unique: rb6NremTOR67p8cbeEAsPQ-1
X-YMail-OSG: 4plBhRQVM1lbyp3LLNF6A3_ESt0vectOzYucNmDPZebaUAzBMvhNSv7_IW1WB6C
	G5dmlbtwbt9Fh_J5boBwqfoaWEJJB2GHTzLbqPhjdAGrGdowczc7Ux5LBZy7XT6OOm62IuDkjqAH
	BNtXrR6HvN0ma0YomuABmuT7NfsV3nCN5WyGk44kuLxug_0SjdUAMkaqome.NsiWQrxAEcA4R.9q
	Zz2H4b1vTYuDvF_fpfTySEH7P6wViCSy8val1fLIemlQd7hhX9kkgFzUR84zPMNR.fvH1njz_iqJ
	Ms.Dn6UHh6Fx5vFPZ7rqcVUMOzvi.cj7ylDfGcTqez12WtAH5PSrSISjbRp8PJzy_XSIjlr86V0R
	ns.NwWuz3ptoCg49EQI5t2u1EfQ7eZNfVbltVrv.Rl11aDbr.9_r8QS_zkAQAhBtPvlCgrNCklWz
	MKGQTgUOYxts2B1fqYFKosTYxoj0OGGgw0c7.IUSNhrF7vTQrDknnHY.biv0chZd0rDP6Oql9s0i
	TVGI_DOnlyG3XYTLAjF7Dc1JBdpZ3FIEDlunT0usJOswMINn.UETxWq3_M3rn3r2mvyWUjZSMUU4
	2vouECHut0v7u5YXus_1R3CNgH3fWhasVDsDwIxCsrka33_z3HLL4GPOAcq.DwKrYgszlawYceql
	VIxAMYfROc9XpFyzXL9Le_M_gRXJE9GLGP08aSPrQEroFvTfhFFaBNbaeKBxAkaKTRErRKw3rvGs
	zjp_ShNHt20IgXDv5umyaoUSlbJeXEogMl4Et1aZ5wbz3pMHgcGy6rPCewfDlfY6oPtgGsuctrnd
	JxERN6KBoNI8ft9CxWLRwc8oVHycrOummrgWpx2iq.e2Vswkf8Kq1MKCADp6w.0qygQnOqVBdlr1
	Ym9t.4klJJg5NzfrWO4Wj8b05LM3A46DF6K5aF7MX05EIdDWaAyQSMXXk.qWZpllHyPULQRwh68e
	VZtLya368Ew9rQh34ZhP8QPMAk4sP75UkpflNir1CqQ_2GYCKeFvChqgVTxLDCEzOifirVQrH3GT
	dIuySrrwPJYcA1WZvyyxdQrh2cXaPy84g9K0NYUBbflW6_7I2JeT3bDf3N_AL2mocReX6prBPks.
	MJlf91FsxTbnhKH_4.lsPUIop00X8hwhF1dEKu8Xiax6DfAt.VGfEwoY9krIIVG4vioKCeETTzRu
	N9KFgTB3x1yzJNDVUndGcIoGayi6P3fpG4bzbVcausiWjIltyaKwcpDkpm0srYO2PQvRqi9ZLefE
	AxZHDWVuB_zRC.5o_RqoT2DH0MSLCPxY54N5yY5QwZ.8PZKWJkCHe6xIGO4Dub3_yQ9sAsSyxFc3
	9ONS3yrl2lJQPkGNaA6.j7uLLqOg.W.Sqr6serqLtDgOKzlnZnkwLK3wsycjOAQ--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic314.consmr.mail.ne1.yahoo.com with HTTP;
	Thu, 30 Jul 2020 22:22:50 +0000
Received: by smtp410.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 4ac6482c02314194467082833f946851; 
	Thu, 30 Jul 2020 22:22:48 +0000 (UTC)
Subject: Re: [PATCH v19 22/23] LSM: Add /proc attr entry for full LSM context
To: John Johansen <john.johansen@canonical.com>, casey.schaufler@intel.com,
	jmorris@namei.org, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org
References: <20200724203226.16374-1-casey@schaufler-ca.com>
	<20200724203226.16374-23-casey@schaufler-ca.com>
	<e885d90d-c873-5ab4-235d-6171f49f4ee4@canonical.com>
	<705fb82d-ad7a-2874-59ed-ba6bc7ae3722@schaufler-ca.com>
	<97330b2d-5447-cfef-b6d0-444249e671b7@canonical.com>
From: Casey Schaufler <casey@schaufler-ca.com>
Message-ID: <18fcf6b1-3ef6-bb8b-d2b2-e0fd45bdb68c@schaufler-ca.com>
Date: Thu, 30 Jul 2020 15:22:47 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <97330b2d-5447-cfef-b6d0-444249e671b7@canonical.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
Cc: linux-api@vger.kernel.org, linux-audit@redhat.com, sds@tycho.nsa.gov
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/30/2020 1:57 PM, John Johansen wrote:
> On 7/30/20 1:44 PM, Casey Schaufler wrote:
>> On 7/30/2020 3:03 AM, John Johansen wrote:
>>> On 7/24/20 1:32 PM, Casey Schaufler wrote:
>>>> Add an entry /proc/.../attr/context which displays the full
>>>> process security "context" in compound format:
>>>>         lsm1\0value\0lsm2\0value\0...
>>>> This entry is not writable.
>>>>
>>>> A security module may decide that its policy does not allow
>>>> this information to be displayed. In this case none of the
>>>> information will be displayed.
>>>>
>>>> Reviewed-by: Kees Cook <keescook@chromium.org>
>>>> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
>>>> Cc: linux-api@vger.kernel.org
>>>> ---
>>>>  Documentation/security/lsm.rst       | 28 +++++++++++
>>>>  fs/proc/base.c                       |  1 +
>>>>  include/linux/lsm_hooks.h            |  6 +++
>>>>  security/apparmor/include/procattr.h |  2 +-
>>>>  security/apparmor/lsm.c              |  8 +++-
>>>>  security/apparmor/procattr.c         | 22 +++++----
>>>>  security/security.c                  | 70 ++++++++++++++++++++++++++++
>>>>  security/selinux/hooks.c             |  2 +-
>>>>  security/smack/smack_lsm.c           |  2 +-
>>>>  9 files changed, 126 insertions(+), 15 deletions(-)
>> <snip>
>>
>>>>  
>>>>  /**
>>>> diff --git a/security/security.c b/security/security.c
>>>> index d35e578fa45b..bce6be720401 100644
>>>> --- a/security/security.c
>>>> +++ b/security/security.c
>>>> @@ -754,6 +754,48 @@ static void __init lsm_early_task(struct task_struct *task)
>>>>  		panic("%s: Early task alloc failed.\n", __func__);
>>>>  }
>>>>  
>>>> +/**
>>>> + * append_ctx - append a lsm/context pair to a compound context
>>>> + * @ctx: the existing compound context
>>>> + * @ctxlen: size of the old context, including terminating nul byte
>>>> + * @lsm: new lsm name, nul terminated
>>>> + * @new: new context, possibly nul terminated
>>>> + * @newlen: maximum size of @new
>>>> + *
>>>> + * replace @ctx with a new compound context, appending @newlsm and @new
>>>> + * to @ctx. On exit the new data replaces the old, which is freed.
>>>> + * @ctxlen is set to the new size, which includes a trailing nul byte.
>>>> + *
>>>> + * Returns 0 on success, -ENOMEM if no memory is available.
>>>> + */
>>>> +static int append_ctx(char **ctx, int *ctxlen, const char *lsm, char *new,
>>>> +		      int newlen)
>>>> +{
>>>> +	char *final;
>>>> +	size_t llen;
>>>> +
>>>> +	llen = strlen(lsm) + 1;
>>>> +	/*
>>>> +	 * A security module may or may not provide a trailing nul on
>>>> +	 * when returning a security context. There is no definition
>>>> +	 * of which it should be, and there are modules that do it
>>>> +	 * each way.
>>>> +	 */
>>>> +	newlen = strnlen(new, newlen) + 1;
>>>> +
>>>> +	final = kzalloc(*ctxlen + llen + newlen, GFP_KERNEL);
>>>> +	if (final == NULL)
>>>> +		return -ENOMEM;
>>>> +	if (*ctxlen)
>>>> +		memcpy(final, *ctx, *ctxlen);
>>>> +	memcpy(final + *ctxlen, lsm, llen);
>>>> +	memcpy(final + *ctxlen + llen, new, newlen);
>>> if @new doesn't have a newline appended at its end this will read 1 byte
>>> passed the end of the @new buffer. Nor will the result have a trailing
>>> \0 as expected unless we get lucky.
>> @new will never have a newline at the end. The trailing nul comes
>> from the allocation being done with kzalloc(). This function has to
>> be considered in the context of its caller.
>>
> ugh, sorry not trailing newline, I meant trailing \0. The problem isn't
> the kzalloc, the target has the space. It is the source @new. It is
> dangerous to assume that the @new buffer has a null byte after its
> declared length. Which is potentially what we are doing if @new
> doesn't have an embedded null byte. In that case strlen(new, newlen)
> will then return newlen and we add 1 to it.
>
> which means in the memcpy we are copying an extra byte beyond what
> was declared to exist in @new.

You're right. Good point. Fix coming.
??

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

