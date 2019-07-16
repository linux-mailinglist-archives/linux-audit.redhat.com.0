Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 870846AED7
	for <lists+linux-audit@lfdr.de>; Tue, 16 Jul 2019 20:41:46 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3B7DBC06512D;
	Tue, 16 Jul 2019 18:41:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 53E1F60C67;
	Tue, 16 Jul 2019 18:41:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 639121800207;
	Tue, 16 Jul 2019 18:41:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6GIfYTU024299 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 16 Jul 2019 14:41:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1395E5C232; Tue, 16 Jul 2019 18:41:34 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C4745C221
	for <linux-audit@redhat.com>; Tue, 16 Jul 2019 18:41:30 +0000 (UTC)
Received: from sonic314-27.consmr.mail.ne1.yahoo.com
	(sonic314-27.consmr.mail.ne1.yahoo.com [66.163.189.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BBD5D300CB0D
	for <linux-audit@redhat.com>; Tue, 16 Jul 2019 18:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1563302487; bh=oQzXufq0A4fnwT9LvL4ujD3WuLQSy9q04/vtoreOqFs=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From:Subject;
	b=p3noKv+C+sDDoxpqULvVOOdj8g10emVghshkaQhsjJn1jnnSXESmoZyN3Wb9YcRb8pmlzpLqAyDHneQ/2k6yEXdQelDHGHQR82EAtedD5ldg0Jla2mffMksFuCsv+tztHa3PIoPTz8XPRRse5c9Imy/S84831ZMPK6foOOLxDLVYjwqX+707elSQ3ImzsxN2H8QfEGC5HM0a1CKNLn91Ng7gwVw0dDQczgBgEB/em1WgS5zqdk+bLeLA7g9AvFRa8vGMt3Cq8ZIXuOF1lZee+y3x2incyXdMeWfz9jhcil3kiCVzJ0s+d1f0jvSwBfVbqb9g4mUb5/Qjvz8Iy5fLbA==
X-YMail-OSG: TivdUqMVM1kfgw1pgckwfqldNR3sVUEnJ4aRCbQF2v4qlbFbZqD6klsxl5mDdNM
	bKovYVDQXdaOkInkiaq5yXDoqhHssO8oWg1dZehy3xW4kYF6GuGIyYtVaqvb1vsxnW.cm1zLZP9a
	zY1ASulNRNsq63mT09xIrq4imE99mF3NbpuVIC.tbn50iwrFOHScvZ9cEiXwXZhhuIWiB9KPPAON
	YoXeqRsI1.WVflm.xGOnFWQDdWN7aRRiJjQiPdID.bHZShtbyq31F7c6s31eblr0HVJ0k7KlH_av
	XnbwBirAoqB_7GtlFze0qQEp.SfSJu_X_wNr8YMwznzl2u86WuWcN8nLchhJWDUwpqivxLQW9dHp
	m9FmK7t8In00u_i4Ittt0y2m7qaWt4YZlFoTMulDENpVeyuqlsncoZ7mbROis62rsUsYpnHEnjaP
	Zi6rnCwcRtedbVO01z.m9HmjFPK9JvHh2CdDx3FLUtNwOt5M7wvcdLil6vYdfeXugEqilc3yQthy
	ZSy2G5kiyEzZ5IOXGtEFEZxcI_9TjNaD9seFkiGoc7b6c8EckNv1WETQb7D__i0Eqh_kwHjt35pg
	9z34ZsXw3Ym2sbUroQojyheZE3jbVjxLI3bjsZvY7jqf0OonGpIipxR96YT7WUhLGlzLkvX61WQg
	s.4SmZ2.sIz5oTUkDeHDb6QqrAusVX8EC3BzWwtw2bv0ANR9USQ3pdhk1qIHXkvisLzHJS.GjawP
	su_By284ROmdkjXBrBahGDSeXXGa8ozXeJUTeeWG1PVleU.7W8bTpW9bbdkJoCX1tDHoO9qka8sk
	Og22Yj0H0k6ojnt8pVU4a6UwaxFzNx5KOyWxjLzVM6mGARM1u2L1C_.5QY6LzFEGqfCwuyrZzaqG
	Nn5z5o8QYW5h_4zyB8q9dgbRej.hZ.fDb4odZyMv.YoG61jnLfb4nT8Gz83OCunmccwPc0F2AvxE
	QNJWWrnCOLs3_Nf7RYacxVXCLUdYWMr7JEsJSRat7UtI9_NtzXPcMtZg_9XAbVeYT0xZ6kmcWx4s
	BKpoLIVzanNIwWCtM0igwRDmplPLOn6.M2d1R6x.BR14EJsq14ZI.fACxmJ7aAe3fsNplFJpTWzW
	7Ht3tiF5QoJkFKzkkDOzQW.RFzsO7XgJcxClQZJwOMlYqBTxuPADtT4sU395GbzSRUjU.jeZVNdN
	S8mOR.MRpueRxs4zCVLFeHEQ6rG3gGp6yF0gmxHdfzGKyNZQbIIjpUp7NOtFbmv6PjEjFs91YBQT
	XTHFqsbLbMcvyvw--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic314.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 16 Jul 2019 18:41:27 +0000
Received: by smtp428.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 2c3fea2cf828d5259066c778e8bf7540; 
	Tue, 16 Jul 2019 18:41:23 +0000 (UTC)
Subject: Re: Preferred subj= with multiple LSMs
To: Steve Grubb <sgrubb@redhat.com>, Paul Moore <paul@paul-moore.com>
References: <f824828c-5c9d-b91e-5cec-70ee7a45e760@schaufler-ca.com>
	<c993f63a-7c2d-c6c8-cfa6-3cfba410770d@schaufler-ca.com>
	<CAHC9VhSTwvueKcK2yhckwayh9YGou7gt2Gny36DOTaNkrck+Mg@mail.gmail.com>
	<2477603.130G60v5SE@x2>
From: Casey Schaufler <casey@schaufler-ca.com>
Openpgp: preference=signencrypt
Autocrypt: addr=casey@schaufler-ca.com; keydata=
	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
	abzjfg==
Message-ID: <d1a237d3-4b72-48b0-27d6-fb168354ad31@schaufler-ca.com>
Date: Tue, 16 Jul 2019 11:41:21 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2477603.130G60v5SE@x2>
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.47]); Tue, 16 Jul 2019 18:41:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Tue, 16 Jul 2019 18:41:29 +0000 (UTC) for IP:'66.163.189.153'
	DOMAIN:'sonic314-27.consmr.mail.ne1.yahoo.com'
	HELO:'sonic314-27.consmr.mail.ne1.yahoo.com'
	FROM:'casey@schaufler-ca.com' RCPT:''
X-RedHat-Spam-Score: 0.002  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_NONE) 66.163.189.153 sonic314-27.consmr.mail.ne1.yahoo.com
	66.163.189.153 sonic314-27.consmr.mail.ne1.yahoo.com
	<casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x6GIfYTU024299
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Tue, 16 Jul 2019 18:41:45 +0000 (UTC)

On 7/16/2019 11:06 AM, Steve Grubb wrote:
> On Tuesday, July 16, 2019 1:43:18 PM EDT Paul Moore wrote:
>> On Tue, Jul 16, 2019 at 1:30 PM Casey Schaufler <casey@schaufler-ca.com> 
> wrote:
>>> On 7/16/2019 10:12 AM, Paul Moore wrote:
>>>> On Mon, Jul 15, 2019 at 6:56 PM Steve Grubb <sgrubb@redhat.com> wrote:
>>>>> On Monday, July 15, 2019 5:28:56 PM EDT Paul Moore wrote:
>>>>>> On Mon, Jul 15, 2019 at 3:37 PM Casey Schaufler
>>>>>> <casey@schaufler-ca.com>
>>>>> wrote:
>>>>>>> On 7/15/2019 12:04 PM, Richard Guy Briggs wrote:
>>>>>>>> On 2019-07-13 11:08, Steve Grubb wrote:
>>>> ...
>>>>
>>>>>>>> Steve's answer is the obvious one, ideally allocating a seperate
>>>>>>>> range
>>>>>>>> to each LSM with each message type having its own well defined
>>>>>>>> format.
>>>>>>> It doesn't address the issue of success records, or records
>>>>>>> generated outside the security modules.
>>>>>> Yes, exactly.  The individual LSM will presumably will continue to
>>>>>> generate their own audit records as they do today and I would imagine
>>>>>> that the subject and object fields could remain as they do today for
>>>>>> the LSM specific records.
>>>>>>
>>>>>> The trick is the other records which are not LSM specific but still
>>>>>> want to include subject and/or object information.  Unfortunately we
>>>>>> are stuck with some tough limitations given the current audit record
>>>>>> format and Steve's audit userspace tools;
>>>>> Not really. We just need to approach the problem thinking about how to
>>>>> make it work based on how things currently work.
>>>> I suppose it is all somewhat "subjective" - bad joke fully intended :)
>>>> - with respect to what one considers good/bad/limiting.  My personal
>>>> view is that an ideal solution would allow for multiple independent
>>>> subj/obj labels without having to multiplex on a single subj/obj
>>>> field.  My gut feeling is that this would confuse your tools, yes?
>>>>
>>>>> For example Casey had a list of possible formats. Like this one:
>>>>>
>>>>> Option 3:
>>>>>         lsms=selinux,apparmor subj=x:y:z:s:c subj=a
>>>>>
>>>>> I'd suggest something almost like that. The first field could be a map
>>>>> to
>>>>> decipher the labels. Then we could have a comma separated list of
>>>>> labels.
>>>>>
>>>>> lsms=selinux,apparmor subj=x:y:z:s:c,a
>>>> Some quick comments:
>>>>
>>>> * My usual reminder that new fields for existing audit records must be
>>>> added to the end of the record.
>>>>
>>>> * If we are going to multiplex the labels on a single field (more on
>>>> that below) I might suggest using "subj_lsms" instead of "lsms" so we
>>>> leave ourself some wiggle room in the future.
>>>>
>>>> * Multiplexing on a single "subj" field is going to be difficult
>>>> because picking the label delimiter is going to be a pain.  For
>>>> example, in the example above a comma is used, which at the very least
>>>> is a valid part of a SELinux label and I suspect for Smack as well
>>>> (I'm not sure about the other LSMs).  I suspect the only way to parse
>>>> out the component labels would be to have knowledge of the LSMs in
>>>> use, as well as the policies loaded at the time the audit record was
>>>> generated.
>>>>
>>>> This may be a faulty assumption, but assuming your tools will fall
>>>> over if they see multiple "subj" fields, could we do something like
>>>>
>>>> the following (something between option #2 and #3):
>>>>   subj1_lsm=smack subj1=<smack_label> subj2_lsm=selinux
>>>>
>>>> subj2=<selinux_label> ...
>>> If it's not a subj= field why use the indirection?
>>>
>>>         subj_smack=<smack_label> subj_selinux=<selinux_label>
>>>
>>> would be easier.
>> Good point, that looks reasonable to me.
> But doing something like this will totally break all parsers. To be honest, I 
> don't know if I'll ever see more than one labeled security system running at 
> the same time. And this would be a big penalty to pay for the flexibility that 
> someone, somewhere just might possibly do this.

While I have never seen multiple-LSM plans from RedHat/IBM I
have seen them from Ubuntu. This isn't hypothetical. I know that
it's a hard problem, which is why we need to get it as right as
possible.



--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
