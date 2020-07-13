Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id D415D21DF33
	for <lists+linux-audit@lfdr.de>; Mon, 13 Jul 2020 19:55:42 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-TN39j0znMJW9hIflI3dZjA-1; Mon, 13 Jul 2020 13:55:39 -0400
X-MC-Unique: TN39j0znMJW9hIflI3dZjA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AA681940921;
	Mon, 13 Jul 2020 17:55:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 78A875C1BB;
	Mon, 13 Jul 2020 17:55:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 89D8E180954D;
	Mon, 13 Jul 2020 17:55:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06DHtOLD006849 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 13:55:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AE2971003213; Mon, 13 Jul 2020 17:55:24 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A9829110F0D4
	for <linux-audit@redhat.com>; Mon, 13 Jul 2020 17:55:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A35B885A5B3
	for <linux-audit@redhat.com>; Mon, 13 Jul 2020 17:55:22 +0000 (UTC)
Received: from sonic303-27.consmr.mail.ne1.yahoo.com
	(sonic303-27.consmr.mail.ne1.yahoo.com [66.163.188.153]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-407-fMOf5jJfN4y7dXVUj1dDVA-1;
	Mon, 13 Jul 2020 13:55:20 -0400
X-MC-Unique: fMOf5jJfN4y7dXVUj1dDVA-1
X-YMail-OSG: bKnJmOMVM1my.jCawu6y_Lomj6dzXwFo8j6UHoF2tsIuUEQLfq1DktZ1Uo6IlyW
	2tZue4s.yyzkBBMQGWeDj4bRxuKgTXJKu95uIZ895HjnChr3j5FbIVQYCFflE6OSorTD7Ukvi46Q
	Z9jssANmpBDeteSUAGVw2uZdtnqcoA_.wPoNGQBwlShzeoMaWpFg6AeDreMXKbfrW_1A_snj40Lq
	JJT5vqN7tTpx0Sqf7Q1_re33Z6paExfp7ZMaGEyUR60K5ruhvchr7teCPyTupjcU33IgymNX4mrl
	bXi77c6XI7t.Si3FyymAL1vPuxou591NtJSO4JyCGiEMJt.2Tg.FbpBvcFqG30rOEcWOXFMpZorj
	AihkGeJL8blFB_Hl4IfxAtG90Q4tj6NDEjObxnozhyhmyHug2BPMsvhc7M2NM7ZDHiia7wlG25Js
	owh1qYYVy8s5Qy3rUx8dGBESYWgvty.Pei5YuHeClgdfKRTGGBSaavMkx8_Mo2vg.PuXyvoSCeqD
	LzuW7ZChtGW8_WKXxEXpWA6MtEBFwN5S6HSVlkJINDvdYX5Vq8asatnT5WX8Xh14b7ucjnTMfQ8j
	eOjCshJHf9_WprH1oqJMv5dQ3rpnVk3mygh2NXX2FHXdLRsDrVquJaZK4J7iSd752.KMXT9MKrMn
	sHPa6j9X8C3gIJGRibd.h0S0pWJZagivccea.kBTa5bS25DFQx1_ZBk1x3Jp9iVYKO_O9DHmSO9A
	RV.fZ600VUP4.Jnsu91H9FO8zyJclGXQoof3JnOfWjvnC2trd2BUWc8rTC18B7zZ2iJSm0dBlIuV
	uPz3fRS_gUqH6Nznr_aaXTZgOhhYZ6ywoGJw7tSYoymLqFXhkuduJM6IJ.gHrMCeZ_AMZqvohixO
	Td1XTDIkFH3Z82MS6HPg72.WXiShONdj_A0FIugVdX8GUD5runb9mSCF130L4deK3C1lc2.nVO7Y
	4Ulw7XlvE8SooflOZ38N2.heHANFrQWjOq6..U5L2xKkxqHilouXl6bSHltwBvORzW_xrT2BKS9Z
	rhp.MhZfkHbvup3uFGPNm2QQxaf4ZeZ1dgDaZpqr2mjquqpGfIMTV0SJH0HCzGZ91PP_QeBcoTHn
	BAkEO6wt.sWgYj4Qwz5hMNBOVaQuhAF3A5Gnut9en.ygOVI8.E5La5Q0WpxwMEp4Ump1fCwTas34
	Dlm4cLSH2Nx6bR2hq3ya.snswLmIIcl6XhPcQU9_5KnTBt6_3.seW8u9V8aRpD8VNWnvQiwCFx8O
	6OUPFxuhRtlw.yyHeDoZeYHqavon2TYWdkl8NCiNWfNw6XS28jB_WfaoeIRvaqzc5_vC1QJPR0ae
	BhG6nzwH9UY9v7AX6R6fvEmQfuNRwXscVAzF1_6L_A4lo_2hYM0U818RiPy.H_Oc.95uSIAC0i8C
	Vl7P3VgkBvJpg
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic303.consmr.mail.ne1.yahoo.com with HTTP;
	Mon, 13 Jul 2020 17:55:19 +0000
Received: by smtp417.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID bffaaba8296e76c3e8da4b6627fa77a8; 
	Mon, 13 Jul 2020 17:55:15 +0000 (UTC)
Subject: Re: [PATCH ghak122 v1] audit: store event sockaddr in case of no rules
To: Richard Guy Briggs <rgb@redhat.com>, Paul Moore <paul@paul-moore.com>
References: <b62d4388b488dedfa2758f32e6d1e5414179b4f2.1593796497.git.rgb@redhat.com>
	<CAHC9VhReURKRe63t7mudKpkW0aVNpCmF=UWHSof1uvRkmZ8HTQ@mail.gmail.com>
	<20200713174014.mjsdugomgjtl3kgz@madcap2.tricolour.ca>
From: Casey Schaufler <casey@schaufler-ca.com>
Autocrypt: addr=casey@schaufler-ca.com; keydata=
	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
	abzjfg==
Message-ID: <9ec00f40-e7e9-950e-4ed9-48533a9ee223@schaufler-ca.com>
Date: Mon, 13 Jul 2020 10:55:15 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200713174014.mjsdugomgjtl3kgz@madcap2.tricolour.ca>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
Cc: Eric Paris <eparis@parisplace.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>
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

On 7/13/2020 10:40 AM, Richard Guy Briggs wrote:
> On 2020-07-08 18:49, Paul Moore wrote:
>> On Fri, Jul 3, 2020 at 1:18 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>>> When there are no rules present, the event SOCKADDR record is not
>>> generated due to audit_dummy_context() generated at syscall entry from
>>> audit_n_rules.  Store this information if there is a context present to
>>> store it so that mandatory events are more complete (startup, LSMs...).

I don't know for sure, but this looks a lot like the issues
I have had to address for LSM stacking in

[PATCH v18 20/23] Audit: Add new record for multiple process LSM attributes

I don't know if the approach I took will help here, or be
acceptable at all for that matter. But it might be worth taking
a look.

>>>
>>> Please see the upstream issue
>>> https://github.com/linux-audit/audit-kernel/issues/122
>>>
>>> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
>>> ---
>>> Passes audit-testsuite.
>>>
>>>  include/linux/audit.h | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> Do we have any certification requirements driving this change?  I ask
>> because if we make this change, why not do the same for PATH records?
> I filed the issue because I noticed the SOCKADDR record missing from
> configuration events required for certification.
>
>> The problem of course is that doing this for both is going to be
>> costly, the PATH records in particular seem like they would raise a
>> performance regression.
> I had a minor concern about performance for SOCKADDR.  I filed SOCKADDR
> because I noticed it missing, but intended to file others as noticed.
>
> I agree the PATH records would have a larger performance concern, but if
> they are required to support event records that are required for
> certification then either we store them when the context is present or
> generate them retroactively once a required event record is generated.
>
> In the case of SOCKADDR it may be possible to store that information
> once the required record has been generated rather than whenever there
> is a valid audit context, but it is currently collected earlier than
> config records are emitted.
>
>> I agree it would be nice to have this information, but I fear that
>> gating this on audit_dummy_context() is the right thing to do unless
>> there is a strong requirement that we always record this information.
> That would have been great feedback when the issue was filed.
> However, there may be a middle ground as descirbed above.
>
>>> diff --git a/include/linux/audit.h b/include/linux/audit.h
>>> index 03c4035a532b..07fecd99741a 100644
>>> --- a/include/linux/audit.h
>>> +++ b/include/linux/audit.h
>>> @@ -448,7 +448,7 @@ static inline int audit_socketcall_compat(int nargs, u32 *args)
>>>
>>>  static inline int audit_sockaddr(int len, void *addr)
>>>  {
>>> -       if (unlikely(!audit_dummy_context()))
>>> +       if (audit_context())
>>>                 return __audit_sockaddr(len, addr);
>>>         return 0;
>>>  }
>> paul moore
> - RGB
>
> --
> Richard Guy Briggs <rgb@redhat.com>
> Sr. S/W Engineer, Kernel Security, Base Operating Systems
> Remote, Ottawa, Red Hat Canada
> IRC: rgb, SunRaycer
> Voice: +1.647.777.2635, Internal: (81) 32635
>
> --
> Linux-audit mailing list
> Linux-audit@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-audit
>

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

