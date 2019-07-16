Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F6A6AC67
	for <lists+linux-audit@lfdr.de>; Tue, 16 Jul 2019 18:00:28 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4337D87620;
	Tue, 16 Jul 2019 16:00:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 33E8060C4C;
	Tue, 16 Jul 2019 16:00:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9106D4EA30;
	Tue, 16 Jul 2019 16:00:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6GG0CN6023888 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 16 Jul 2019 12:00:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 813E85DA34; Tue, 16 Jul 2019 16:00:12 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B7DB5E7A9
	for <linux-audit@redhat.com>; Tue, 16 Jul 2019 16:00:10 +0000 (UTC)
Received: from sonic310-22.consmr.mail.bf2.yahoo.com
	(sonic310-22.consmr.mail.bf2.yahoo.com [74.6.135.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CFC6E30832C3
	for <linux-audit@redhat.com>; Tue, 16 Jul 2019 16:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1563292807; bh=lsTNqO4ZbSbpqr3b+ACcP7YQ3iZrtuAjKoioE1itz30=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From:Subject;
	b=p9T4aB6yx0D3raLeVMmvMuEF0N2eRqKujfv8FspMcs7i7WyWHhqXLr/jHSY55DAe84mdusL3p1SmhAG0NpDa+kZ0UFyIhXTNFNwG7PSyK7lpekSNjMZTiE5uMdFWhcHAR7KekQfJGbf2tyjWkjZVUJQXJ0V2I7v+dvjEQKM1E0jeZylxKlZzDRBwZ2YUbJhoOnEDyXPZCsdYr/pfGEdFZgR8KKt+4qdAzBs2UGpQzZn5trLxnf0ySZnrXC4YUHONIp4Go8I/zGzq214CsjDzrG7n07gBbh47UkKV75VFxmKnUnmvN4ExvYXZMwj8/6TzDN5sLWHYwOPmnDAcQ/klZw==
X-YMail-OSG: 75ClDKYVM1lrqnnvVv5g6VFVRoFcOIR7OgnmlQlb3TIOThkenJhtKu349ObBVkK
	AMHbiq0nmYZ_T7evRpMwpqRaz7XmnpO3k7EpqfL3MuiCxTHtlI.e_MwNyChGc8CiKHtdJsIdXyQK
	qzx.qt1QLFwp7Kcxlql79qIO80E554W0xOcp5idMV1YT93SCNF2yd6f9vowfo0_27QekxLBbp7OU
	a1Meura7xWNACi0FS9kPX0FBBufX.hQHmcKsoBl2dj3C5s41LzF80b3Sc0c41QiMw3pL3Wy3jIbf
	rCAMgDMlmVEgUD_h3OSDf4.cn3MFSUYygYNQ0wdEwUPL7Q_O57d9YX48iV0GpTNuyO.E.OVRlafP
	.C3w87OKhOpQJaf3vVCLJFKBhuUrZxXx2_PJIceF1XNjk6ZRP7MoufxmG94sNacu4R67jn2pr3q3
	ZDkXHVn67JsEiFolgVb9aoHCxMJIUFbjlulrGkL2PC88FU6.18SYyU07Bn40xGQ_5XsKdWxbwmCH
	AkkkAunts72Ec0bR70SOoRzCFK3r_nqJCa_P5q7teJIJYZWmp2OOIhwsqwqSbdBnQZJ2gUHH63je
	xLwxToTSEWUsE9Z1173IWWeKum3MX.XNNBL9e23Pve532XvJnln3ySwkAI__91hhmCpW.2aG_k1Z
	J2aCgrRm.pArPmECJ.h1OhRRUiJ9tru3dqg3lEdEm4fzby.7oE9fueibZx5xDAYDzvCYLx_66Wyl
	UNUgCGs_neeJZSz1J_6Lv0_UHjEUhXLpvpkyf23Yuhlca4QsxwHiTC9PPwqveIkPg0JRp1bB2yJM
	WtjHtGoFMaLtNWknIDkywsSRHiowROSn9Rh50aGwUmLC8bFFv9XVSi_.ssxcKfYIt769nesJES4x
	gFwVMnUNdVwmfMz72ebA5bYNTHRu9N68oj16_VnP_alIW5RKi6W1j0KvlpUFhP4B6agUB8NDihwG
	_piso23Yx85sHV4Uzf4jbmKJhLWwm4HcH93dYTGXKfYQlnmfn_PUvXp2QvaPgOldEqJ8ziJaIEP5
	ln12qXKq9EF3ko04bKqNhXnNiqw8yW0YrCO4CCp5dwm4LxcT1SCGvuP3FrALDQzEL9212B22mcZn
	kClQ8QIKNQa8MLyx9.U8GDPowTTnYd7928SZTJQaDV.24tQIyVmktATNPvWg4iogBFT8W3sxn2xU
	ojP47eRHRmYlP62qrCNq6RsNO3o2yyj8PBBf678xaVJ7qyiNwmIpyXGlysfz_wbOwRmxHICGH_jv
	a5zVq0H6GtvXBB879Zw7frvCESBs.XkWH1An228gv4Q--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic310.consmr.mail.bf2.yahoo.com with HTTP;
	Tue, 16 Jul 2019 16:00:07 +0000
Received: by smtp404.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 5e63835f3adfd931dfe793216aed4ade; 
	Tue, 16 Jul 2019 16:00:06 +0000 (UTC)
Subject: Re: Preferred subj= with multiple LSMs
To: Steve Grubb <sgrubb@redhat.com>, Paul Moore <paul@paul-moore.com>
References: <f824828c-5c9d-b91e-5cec-70ee7a45e760@schaufler-ca.com>
	<c46932ec-e38e-ba15-7ceb-70e0fe0ef5dc@schaufler-ca.com>
	<CAHC9VhQ08LKUmYS8ho_0-uDUFakPPq1bvR6JwWiLUrnwaRV6Aw@mail.gmail.com>
	<1979804.kRvuSoDnao@x2>
From: Casey Schaufler <casey@schaufler-ca.com>
Openpgp: preference=signencrypt
Autocrypt: addr=casey@schaufler-ca.com; keydata=
	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
	abzjfg==
Message-ID: <2802ddee-b621-c2eb-9ff3-ea15c4f19d0c@schaufler-ca.com>
Date: Tue, 16 Jul 2019 09:00:05 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1979804.kRvuSoDnao@x2>
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.44]); Tue, 16 Jul 2019 16:00:09 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Tue, 16 Jul 2019 16:00:09 +0000 (UTC) for IP:'74.6.135.196'
	DOMAIN:'sonic310-22.consmr.mail.bf2.yahoo.com'
	HELO:'sonic310-22.consmr.mail.bf2.yahoo.com'
	FROM:'casey@schaufler-ca.com' RCPT:''
X-RedHat-Spam-Score: 0.002  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_NONE) 74.6.135.196 sonic310-22.consmr.mail.bf2.yahoo.com
	74.6.135.196 sonic310-22.consmr.mail.bf2.yahoo.com
	<casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x6GG0CN6023888
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Tue, 16 Jul 2019 16:00:27 +0000 (UTC)

On 7/15/2019 3:55 PM, Steve Grubb wrote:
> On Monday, July 15, 2019 5:28:56 PM EDT Paul Moore wrote:
>> On Mon, Jul 15, 2019 at 3:37 PM Casey Schaufler <casey@schaufler-ca.com> 
> wrote:
>>> On 7/15/2019 12:04 PM, Richard Guy Briggs wrote:
>>>> On 2019-07-13 11:08, Steve Grubb wrote:
>>>>> Hello,
>>>>>
>>>>> On Friday, July 12, 2019 12:33:55 PM EDT Casey Schaufler wrote:
>>>>>> Which of these options would be preferred for audit records
>>>>>> when there are multiple active security modules?
>>>>> I'd like to start out with what is the underlying problem that results
>>>>> in this? For example, we have pam. It has multiple modules each having
>>>>> a vote. If a module votes no, then we need to know who voted no and
>>>>> maybe why. We normally do not need to know who voted yes.
>>>>>
>>>>> So, in a stacked situation, shouldn't each module make its own event,
>>>>> if required, just like pam? And then log the attributes as it knows
>>>>> them? Also, what model is being used? Does first module voting no end
>>>>> access voting? Or does each module get a vote even if one has already
>>>>> said no?
>>>>>
>>>>> Also, we try to keep LSM subsystems separated by record type numbers.
>>>>> So, apparmour and selinux events are entirely different record numbers
>>>>> and formats. Combining everything into one record is going to be
>>>>> problematic for reporting.
>>>> I was wrestling with the options below and was uncomfortable with all
>>>> of them because none of them was guaranteed not to break existing
>>>> parsers.
>>> I too, am uncomfortable regarding record parsing.
> The record parsing for this is good as long as we are smart about it. We have 
> to be able to do searches on subject and object labels. By default, ausearch 
> uses strstr() to find a fragment of a label. That would still work the same 
> with multiple labels if done right.
>
>
>> If you can find me someone who is happy and comfortable with the
>> current state of the audit record and/or formatting I would love to
>> see them :)
>>
>>>> Steve's answer is the obvious one, ideally allocating a seperate range
>>>> to each LSM with each message type having its own well defined format.
>>> It doesn't address the issue of success records, or records
>>> generated outside the security modules.
>> Yes, exactly.  The individual LSM will presumably will continue to
>> generate their own audit records as they do today and I would imagine
>> that the subject and object fields could remain as they do today for
>> the LSM specific records.
>>
>> The trick is the other records which are not LSM specific but still
>> want to include subject and/or object information.  Unfortunately we
>> are stuck with some tough limitations given the current audit record
>> format and Steve's audit userspace tools; 
> Not really. We just need to approach the problem thinking about how to make 
> it work based on how things currently work. For example Casey had a list of 
> possible formats. Like this one:
>
> Option 3:
>         lsms=selinux,apparmor subj=x:y:z:s:c subj=a
>
> I'd suggest something almost like that. The first field could be a map to 
> decipher the labels. Then we could have a comma separated list of labels.
>
> lsms=selinux,apparmor subj=x:y:z:s:c,a

Unless there's an objection I will use this format with
a slight modification. Smack allows commas in labels, so
using a bare comma can lead to ambiguity.

lsms=smack,apparmor subj="TS/Alpha,Beta","a"

It's more code change than some of the other options,
but if it has the best chance of working with user space
I'm game.

Thank you.

>
> Since ausearch uses strstr(), this will still work. 
>
>> I can toss out some suggestions but it would be nice to hear what Steve's
>> tools would support with respect to LSM subject/object value formats. 
>> Steve, are these values interpreted at all by your tools, or are the opaque
>> values?
> subject label attributes are treat as strings. There is no attempt to 
> interpret portions of the strings to have any meaning. The main requirement 
> is that they have to be searchable.
>
> -Steve
>
>


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
