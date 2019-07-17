Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 686E26BF54
	for <lists+linux-audit@lfdr.de>; Wed, 17 Jul 2019 17:50:14 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5D83B81F0E;
	Wed, 17 Jul 2019 15:50:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 729855B689;
	Wed, 17 Jul 2019 15:50:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5906A18089C8;
	Wed, 17 Jul 2019 15:50:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6HFnMDC032003 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 17 Jul 2019 11:49:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1E936608A6; Wed, 17 Jul 2019 15:49:22 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 15E4060D7C
	for <linux-audit@redhat.com>; Wed, 17 Jul 2019 15:49:19 +0000 (UTC)
Received: from sonic310-22.consmr.mail.bf2.yahoo.com
	(sonic310-22.consmr.mail.bf2.yahoo.com [74.6.135.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B41748665F
	for <linux-audit@redhat.com>; Wed, 17 Jul 2019 15:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1563378558; bh=cKMuyrJOs38L5WHbs2Zjc6QRAhzFW8Bxd5JXNpzMVUQ=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From:Subject;
	b=TW1LrtcdeuvSDq3sOCdlrhUi9wXsz0E1jLh7GDO/SqmCGbfw+5admlIAYhH2qKx8VwMlotfYermdIO0bJpOSmTi+dmIEXbFsvzIqBB8WIK9xoYF69eUaQDZZOhv3UP2gzC2PHcr3bEJqKUBuW3T2govbIzHKTUrZLL5YE8szyfZdM6cegluiWtIBAl+O8JWt4nyqvfIEdZtdWAt3K0fj5fHRn3PVRABhKG87ka19Zsr5yD/NPrIhq7h/14HlWjSuusUyGeP32I7r+JCPEF3/uAIgZlqCcZZ2aOWT0S/T92vHPiMn1hfxBKkPc/2oaOha7xA0b0O7+YIj1y9vtJy20w==
X-YMail-OSG: 6I7m91cVM1nXsJMpjDLYPUUN8iUCnjOm_mgayqyCOjsITPRb5k5wRA0FN.z8239
	Ab4.DB.JeLVBw5jDKMgxb7D25irxspvceafJ93mGesyea04EdknvpJvUGYaeT3B3nWlBFszhmpEK
	xYQcuDCSv9DlDSApkc.Me8lv6X87dKiiAMUBMiAKx2wHl99AJLAzovRn9B2PjOuyGb8xmohFYEgq
	VXcvPYQ7gsMNuSO5nCC33Vvj3hxweii1WHopftFmyKQxGpN8eU7ngvL_5QxACLZ2D23WWYg9uBRY
	LUsaW20CvzNgjIw7eVx15a.B9KNFZgqeYi02WjY1PECm2Aq0gvdCmKlKoqIl0G2_GfOqGQQTr63P
	yb0PPAcAWVHzg5P3lS2NUMtNk7rEzDE31CODAletIGzgQvYU7XNajvFJdsFK8C4_On6TTrA8E3Rn
	C3FJkcJIPugveMDJ26rhzk6uhv5KbEBAjW63IntMr1Fak_RZeJgGDgVHsBH8NdEGVcjsWl0DpWx8
	LvEO86eU5UUls2vuiwHDoaEKJ.Pbsc5KfzrRUv4ldmHb11Mr4kOxx6IyHYnWJdgqtYDr6H_HAlpI
	_FgZlUrGrsn4xrYFnOlN4LnbL7foKk6CSf5AXGnSqQz1sLFx8rlppOqQ06FqRoHPIRHzpp.ZntwE
	Ovmghtx0GUKDkvPzli0pFeFET7JD5E1eTwYP4_vTEduDMJfrxifMqzgpARTXZTeOCP2M_96tdJUA
	WQkHg46dSPdMiFD8XfbfFB.d8V47IbvIdsgx3T83UoTB1jnTymheAg74vioNU.C0BMZOLshPDYZf
	fcr_71XWX.yjfT59I9GlMUjzpdCfHYlqL8arJ28pCb4g9py6zdKAEgLidt0j_CkkMd_970zKhCbY
	z3BfUnwQXw2TLcj68BiuuqbJ4aSeY0nFveO5o23t0KVDV.1t.IO7TQNhCHpygSR8Q0g8uwxF6Qhb
	BzB4VDMV8ytkagXsmpd7O4C3TY.g2YDB3lguacQtZcUdmDCuUlVT.Zj.CiL1sh1aRoFPSZXd81bO
	yfwzZPIdQiG_7U7xOCusUAabEE72_u_iKs20txZJh1_L8.sCY1C_iaxjgzktC_eP0w14iI7_Avbw
	ryxW.BvKKi9.rLEeDcepVyxOYgtpJQDKpfBqE8Fdl_vGquHzHQanES8jyHhoAE39I2.B6IKk1o_w
	yjaGAmzLp4BDhhCRW5U4Ztd7NDhD83U4Nye_FIOUDC17CybosHprnxAOdIXz72402zsR10au0Ubh
	iCuAZoAyGbgwaQmooqWtjLemr
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic310.consmr.mail.bf2.yahoo.com with HTTP;
	Wed, 17 Jul 2019 15:49:18 +0000
Received: by smtp412.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 1ce16050596ffeca4a2bbb7314ec3577; 
	Wed, 17 Jul 2019 15:49:15 +0000 (UTC)
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
From: Casey Schaufler <casey@schaufler-ca.com>
Openpgp: preference=signencrypt
Autocrypt: addr=casey@schaufler-ca.com; keydata=
	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
	abzjfg==
Message-ID: <e9cf875a-0d0f-a56f-71dd-c22c67bdcc2d@schaufler-ca.com>
Date: Wed, 17 Jul 2019 08:49:15 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAHC9VhQ9MSh5zCkhMja4r9j0RT952LwKSaG5dR-BqXzXrtEAUw@mail.gmail.com>
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.26]); Wed, 17 Jul 2019 15:49:19 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]);
	Wed, 17 Jul 2019 15:49:19 +0000 (UTC) for IP:'74.6.135.196'
	DOMAIN:'sonic310-22.consmr.mail.bf2.yahoo.com'
	HELO:'sonic310-22.consmr.mail.bf2.yahoo.com'
	FROM:'casey@schaufler-ca.com' RCPT:''
X-RedHat-Spam-Score: 0.002  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_NONE) 74.6.135.196 sonic310-22.consmr.mail.bf2.yahoo.com
	74.6.135.196 sonic310-22.consmr.mail.bf2.yahoo.com
	<casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.26
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x6HFnMDC032003
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Wed, 17 Jul 2019 15:50:13 +0000 (UTC)

On 7/17/2019 5:14 AM, Paul Moore wrote:
> On Tue, Jul 16, 2019 at 7:47 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>> On 7/16/2019 4:13 PM, Paul Moore wrote:
>>> On Tue, Jul 16, 2019 at 6:18 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>>>> It sounds as if some variant of the Hideous format:
>>>>
>>>>         subj=selinux='a:b:c:d',apparmor='z'
>>>>         subj=selinux/a:b:c:d/apparmor/z
>>>>         subj=(selinux)a:b:c:d/(apparmor)z
>>>>
>>>> would meet Steve's searchability requirements, but with significant
>>>> parsing performance penalties.
>>> I think "hideous format" sums it up nicely.  Whatever we choose here
>>> we are likely going to be stuck with for some time and I'm near to
>>> 100% that multiplexing the labels onto a single field is going to be a
>>> disaster.
>> If the requirement is that subj= be searchable I don't see much of
>> an alternative to a Hideous format. If we can get past that, and say
>> that all subj_* have to be searchable we can avoid that set of issues.
>> Instead of:
>>
>>         s = strstr(source, "subj=")
>>         search_after_subj(s, ...);
> This example does a lot of hand waving in search_after_subj(...)
> regarding parsing the multiplexed LSM label.  Unless we restrict the
> LSM label formats (which seems both wrong, and too late IMHO)

I don't think it's too late, and I think it would be healthy
to restrict LSM "contexts" to character sets that make command
line specification possible. Embedded newlines? Ewwww.

>  we have
> a parsing nightmare; can you write a safe multiplexed LSM label parser
> without knowledge of each LSM label format?  Can you do that for each
> LSM without knowing their loaded policy?  What happens when the policy
> and/or label format changes?  What happens in a few years when another
> LSM is added to the kernel?

I was intentionally hand-wavy because of those very issues.
Steve says that parsing is limited to "strstr()", so looking for
":s7:" in the subject should work just as well with a Hideous
format as it does today, with the exception of false positives
where LSMs have label string overlaps.

Where is the need to use a module specific label parser coming
from? Does the audit code parse SELinux contexts now? 

>> we have
>>
>>         s = source
>>         for (i = 0; i < lsm_slots ; i++) {
>>                 s = strstr(s, "subj_")
>>                 if (!s)
>>                         break;
>>                 s = search_after_subj_(s, lsm_slot_name[i], ...)
> The hand waving here in search_after_subj_(...) is much less;
> essentially you just match "subj_X" and then you can take the field
> value as the LSM's label without having to know the format, the policy
> loaded, etc.  It is both safer and doesn't require knowledge of the
> LSMs (the LSM "name" can be specified as a parameter to the search
> tool).

You can do that with the Hideous format as well. I wouldn't
say which would be easier without delving into the audit user
space.

>> There's enough ugly to go around either way.
>> And I'm not partial to either approach, but do would very
>> much like to get the code done so I can get on to the next
>> set of amazing challenges.
>>
>> Oh, and I don't want to pick on subj= as obj= has the exact same issues.
> Yes, I stopped talking about both subj and obj some time ago in this
> thread because I figure we can use the same approach for both.
>


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
