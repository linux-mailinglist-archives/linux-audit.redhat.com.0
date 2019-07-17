Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7359E6C364
	for <lists+linux-audit@lfdr.de>; Thu, 18 Jul 2019 01:02:46 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BB84B86679;
	Wed, 17 Jul 2019 23:02:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 42AB2611DB;
	Wed, 17 Jul 2019 23:02:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BDBF01800202;
	Wed, 17 Jul 2019 23:02:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6HN2PPx018274 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 17 Jul 2019 19:02:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 94B4219C65; Wed, 17 Jul 2019 23:02:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E0AD19C59
	for <linux-audit@redhat.com>; Wed, 17 Jul 2019 23:02:23 +0000 (UTC)
Received: from sonic314-22.consmr.mail.bf2.yahoo.com
	(sonic314-22.consmr.mail.bf2.yahoo.com [74.6.132.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ACF04C055673
	for <linux-audit@redhat.com>; Wed, 17 Jul 2019 23:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1563404540; bh=q7E0xITt7RksiuSIhV2dxvFsSmhDxM3OJ5+cCYgIOow=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From:Subject;
	b=ZLlJFwaqyoGuTExuDSDwMoxMsojGgQNeOgb50rYwmyFNcZrBAR4RRTX9rV1zNoKKsSoXXcytODos5P1KESBru8Tl51wBdLrn2sY54iFMRHIZxIgEBAnpe7wDaBeiTjhn5ijdjVXfugl5ZGrPdm8AUtt8AaPx3/M7xKO+flemNw9nc1RpUIJbHr06L2L2f6cxo3B4xCkpcidTXhTxjv9FTI+ZIR4VtQNxHT5mAGl0p1qGWLUPva/Kd4Ut1ZQEEyWyOC8t1RZ38l8V9b5YArX4BEU/M5DdoHYhcVl8rN4o9JgNEUKnIFXrxbJC2zkt3nugMjJtHrE2UTF6e2b2HV5A2g==
X-YMail-OSG: AZqrjzoVM1mLh0fNzdQmiLZ6HGmIgrl.r0U8Gx6ue4i8okSH41QCsmsbZAE_JsX
	.jXg_UH4p1kv66gF7RKPdlCQVSjYcyyk9RXLAeU7zDdvi3dMq5LKXJ4IPtiI5tOyQJ0G14kv7NLO
	FHBi1KHsiKiXfzXdsA1gNaTXdytwqxE0H6TCiAD4jtTOtl0J3QmBza2vmiBQ0tkaYoUYRnjYXPIp
	oBeXyZdrnPcrGfFPwP9UjCJOjx6lPT7LVm32RY3N0fZHsrgUaCPj0Oin6EMxB2FbvvDYWSfDGUt6
	0wrl6B0lVBXmF5XQKZYJo99PtEjO22FcOWh9fx36yt9OocrmfP9ei5l5izdH0zBqtNWOl9VXIgGR
	albNr.XbyiyUSV_YJ0HUoSuEQ0ZhHe4cEeF1b37ihSu5oYl9lZ5o_h3HU5LkD.Oco0Q4aH9j29jD
	urg9k8aakl_nFq2naT2yZXlJbJazWkZ8R0C9Nf2NFO4eUmLsq1GtAgLptnbobuaHVvHA03o.bIUW
	waXmKmE4nFfsBxK.xfXUYOljd8J0du6ZXVARM2yr9.ZvbIR0Gp.zvyA6TKBS3DNmUS6auDZpQMcH
	WzHA_H5ZPfVZwquP5m95c4I7V88UnxWtit.CF1F_2cxvE4EB9QumAJIPM0RPM2tOPXhPcsXKfUIy
	1a.xYkaQNW7nrUuA5iHPTPT0jGKRjgcmdlgNme0LsJpOfnUxltprgDtyehYoKUoxD32o.4PzCzKH
	dU2vtivHxurKj2nsEBwyyxxEqhGtJAzsuI6C4iMoQ1.da0EfVp82EMRgKRHoFjax.DlnPihwJgF6
	6wG7m75qpknXj.oDpWVxXG8nfO6ZSlln_l0E6vEVWrqJymYd.2q696CBMd4A5sXRJlbUqtoRy7Sd
	EZniT8cmnzMm9j0sBCoAI9NBRMk4dx2AUJiFKeE2JULnfp3VXVHIrXpoFn8LhmSO5rFHgySgPsAp
	LO_yH4DTWnFmPwccv3Xck2muG5C2jxDcDcBODNBO3I7m83gOfaXzEIRy2wm3p5wbWs4bXOpzM0AT
	1KJbYvAEUPZmYgSBtQc6GRxobT8Q8Za12Lnayb0hG0baALlIncPLGLLNzdvRChETUOYcU6ymR7Ac
	q3L5EA0sY9UxI4vxfzeKMn.KIq.6J65Rke_68v2QE.V85NF7TEVFrVsDuB28Kf1JRXltcsMGZCHv
	PF2C5.BzkbhmmZnijpor4Om.VXZrCDtdZuh4z9uA1kViTRRrvssv1vNplwlsMKAepKUkTsuXvb67
	Ij4A.v2mmhPoLS4LtNlbtFBxvdS._
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic314.consmr.mail.bf2.yahoo.com with HTTP;
	Wed, 17 Jul 2019 23:02:20 +0000
Received: by smtp427.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 02a50f2dbf8f00fd54f8af302cb9df4b; 
	Wed, 17 Jul 2019 23:02:16 +0000 (UTC)
Subject: Re: Preferred subj= with multiple LSMs
To: Paul Moore <paul@paul-moore.com>
References: <f824828c-5c9d-b91e-5cec-70ee7a45e760@schaufler-ca.com>
	<d1a237d3-4b72-48b0-27d6-fb168354ad31@schaufler-ca.com>
	<CAHC9VhTQLihNQ1iGjJB=LAn=C6BQokFsjsRcj8O_O9AjqQ7HBg@mail.gmail.com>
	<2517266.eHZzEmjMsX@x2>
	<27e2c710-efe6-d9cd-d4f9-bc217df5ede3@schaufler-ca.com>
	<CAHC9VhTpcnyGg5j3b6Z7Yi0Ob01JETRiBmz1AuLqPWqP9tEAnA@mail.gmail.com>
	<5ea2a25b-364f-3c30-79c6-cfb18515d7ba@schaufler-ca.com>
	<CAHC9VhQ9MSh5zCkhMja4r9j0RT952LwKSaG5dR-BqXzXrtEAUw@mail.gmail.com>
	<e9cf875a-0d0f-a56f-71dd-c22c67bdcc2d@schaufler-ca.com>
	<CAHC9VhQS9We1TNqRfuR_E-kV4aZddx9euaiv5Gzd5B5AkiDAUQ@mail.gmail.com>
From: Casey Schaufler <casey@schaufler-ca.com>
Openpgp: preference=signencrypt
Autocrypt: addr=casey@schaufler-ca.com; keydata=
	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
	abzjfg==
Message-ID: <f375c23c-29e6-dc98-d71c-328db91117bc@schaufler-ca.com>
Date: Wed, 17 Jul 2019 16:02:16 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAHC9VhQS9We1TNqRfuR_E-kV4aZddx9euaiv5Gzd5B5AkiDAUQ@mail.gmail.com>
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.32]); Wed, 17 Jul 2019 23:02:22 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Wed, 17 Jul 2019 23:02:22 +0000 (UTC) for IP:'74.6.132.196'
	DOMAIN:'sonic314-22.consmr.mail.bf2.yahoo.com'
	HELO:'sonic314-22.consmr.mail.bf2.yahoo.com'
	FROM:'casey@schaufler-ca.com' RCPT:''
X-RedHat-Spam-Score: 0.002  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_NONE) 74.6.132.196 sonic314-22.consmr.mail.bf2.yahoo.com
	74.6.132.196 sonic314-22.consmr.mail.bf2.yahoo.com
	<casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.32
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x6HN2PPx018274
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>,
	Linux Security Module list <linux-security-module@vger.kernel.org>,
	"linux-audit@redhat.com" <linux-audit@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Wed, 17 Jul 2019 23:02:45 +0000 (UTC)

On 7/17/2019 9:23 AM, Paul Moore wrote:
> On Wed, Jul 17, 2019 at 11:49 AM Casey Schaufler <casey@schaufler-ca.com> wrote:
>> On 7/17/2019 5:14 AM, Paul Moore wrote:
>>> On Tue, Jul 16, 2019 at 7:47 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>>>> On 7/16/2019 4:13 PM, Paul Moore wrote:
>>>>> On Tue, Jul 16, 2019 at 6:18 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>>>>>> It sounds as if some variant of the Hideous format:
>>>>>>
>>>>>>         subj=selinux='a:b:c:d',apparmor='z'
>>>>>>         subj=selinux/a:b:c:d/apparmor/z
>>>>>>         subj=(selinux)a:b:c:d/(apparmor)z
>>>>>>
>>>>>> would meet Steve's searchability requirements, but with significant
>>>>>> parsing performance penalties.
>>>>> I think "hideous format" sums it up nicely.  Whatever we choose here
>>>>> we are likely going to be stuck with for some time and I'm near to
>>>>> 100% that multiplexing the labels onto a single field is going to be a
>>>>> disaster.
>>>> If the requirement is that subj= be searchable I don't see much of
>>>> an alternative to a Hideous format. If we can get past that, and say
>>>> that all subj_* have to be searchable we can avoid that set of issues.
>>>> Instead of:
>>>>
>>>>         s = strstr(source, "subj=")
>>>>         search_after_subj(s, ...);
>>> This example does a lot of hand waving in search_after_subj(...)
>>> regarding parsing the multiplexed LSM label.  Unless we restrict the
>>> LSM label formats (which seems both wrong, and too late IMHO)
>> I don't think it's too late, and I think it would be healthy
>> to restrict LSM "contexts" to character sets that make command
>> line specification possible. Embedded newlines? Ewwww.
> That would imply that the delimiter you would choose for the
> multiplexed approach would be something odd (I think you suggested
> 0x02, or similar, earlier) which would likely require the multiplexed
> subj field to become a hex encoded field which would be very
> unfortunate in my opinion and would technically break with the current
> subj/obj field format spec.  Picking a normal-ish delimiter, and
> restricting its use by LSMs seems wrong to me.

Just say "no" to hex encoding! BTW, keys are not hex encoded.

We've never had to think about having general rules on
what security modules do before, because with only one
active each could do whatever it wanted without fear of
conflict. If there is already a character that none of
the existing modules use, how would it be wrong to
reserve it?

Smack disallows the four characters '"/\ because quoting
is too important to ignore and the likelyhood that someone
would confuse labels with paths seemed great. I sniffed
around a little, but couldn't find the sets for SELinux or
AppArmor.

> It's also worth noting that if you were to move subj/obj to hex
> encoded fields, in addition to causing a backwards compatibility
> problem, you completely kill the ability to look at the raw log data
> and make sense of the fields ... well, unless you can do the ascii hex
> conversion in your head on the fly.

Agreed, even though there was a time when I could do
hex decoding in both ASCII and EBCDIC on the fly.

>>>  we have
>>> a parsing nightmare; can you write a safe multiplexed LSM label parser
>>> without knowledge of each LSM label format?  Can you do that for each
>>> LSM without knowing their loaded policy?  What happens when the policy
>>> and/or label format changes?  What happens in a few years when another
>>> LSM is added to the kernel?
>> I was intentionally hand-wavy because of those very issues.
> Then you should already realize why this is a terrible idea ;)

Unfortunately, I'm facing two options, one of which the
kernel maintainer thinks is a bad idea and the other the
user space maintainer thinks is a bad idea. Plus, I'm not
very happy with either, either.

>> Steve says that parsing is limited to "strstr()", so looking for
>> ":s7:" in the subject should work just as well with a Hideous
>> format as it does today, with the exception of false positives
>> where LSMs have label string overlaps.
> Today when you go to search through your audit log you know that a
> single LSM is providing subj labels, and you also know which LSM that
> happens to be, so searching on a given string, or substring, is easy
> and generally safe.  In a multiplexed approach this becomes much more
> difficult, and depending on the search being done it could be
> misleading, perhaps even dangerous with complicated searches that
> exclude label substrings.

I'm aware of this issue, which is one of the reasons I'm
asking about the preferred approach.

> It's important to remember that Steve's strstr() comment only reflects
> his set of userspace tools.  When you start talking about log
> aggregation and analytics, it seems very likely that there are other
> tools in use, likely with their own parsers that do much more
> complicated searches than a simple strstr() call.

Point. But long term, they'll have to be updated to accommodate
whatever we decide on. Which makes the "simple" case, where one
security module is in use all the more important.

>> Where is the need to use a module specific label parser coming
>> from? Does the audit code parse SELinux contexts now?
> If you can't pick a "safe" delimiter that isn't included in any of the
> LSM label formats, how else do you know how to parse the multiplexed
> mess?

Ah, but if we can ...

>>>> we have
>>>>
>>>>         s = source
>>>>         for (i = 0; i < lsm_slots ; i++) {
>>>>                 s = strstr(s, "subj_")
>>>>                 if (!s)
>>>>                         break;
>>>>                 s = search_after_subj_(s, lsm_slot_name[i], ...)
>>> The hand waving here in search_after_subj_(...) is much less;
>>> essentially you just match "subj_X" and then you can take the field
>>> value as the LSM's label without having to know the format, the policy
>>> loaded, etc.  It is both safer and doesn't require knowledge of the
>>> LSMs (the LSM "name" can be specified as a parameter to the search
>>> tool).
>> You can do that with the Hideous format as well. I wouldn't
>> say which would be easier without delving into the audit user
>> space.
> No, you can't.  You still need to parse the multiplexed mess, that's
> the problem.

You move the parsing problem to the record, where you have to
look for subj_selinux= instead of having the parsing problem in
the subj= field, where you look for something like selinux=
within the field. Neither looks like the work of an afternoon to
get right.

It probably looks like I'm arguing for the Hideous format option.
That would require less work and code disruption, so it is tempting
to push for it. But I would have to know the user space side a
whole lot better than I do to feel good about pushing anything that
isn't obviously a good choice. I kind of prefer Paul's "subj=?"
approach, but as it's harder, I don't want to spend too much time
on it if it gets me a big, juicy, well deserved NAK.



--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
