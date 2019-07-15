Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B93AB69B86
	for <lists+linux-audit@lfdr.de>; Mon, 15 Jul 2019 21:37:43 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 16F362F8BCA;
	Mon, 15 Jul 2019 19:37:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4466B5D9D2;
	Mon, 15 Jul 2019 19:37:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B77BF4EA6C;
	Mon, 15 Jul 2019 19:37:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6FJbDPe003122 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 15 Jul 2019 15:37:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2C18D600C1; Mon, 15 Jul 2019 19:37:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 25F4B600C4
	for <linux-audit@redhat.com>; Mon, 15 Jul 2019 19:37:10 +0000 (UTC)
Received: from sonic309-22.consmr.mail.bf2.yahoo.com
	(sonic309-22.consmr.mail.bf2.yahoo.com [74.6.129.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 66D1C3DE0D
	for <linux-audit@redhat.com>; Mon, 15 Jul 2019 19:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1563219428; bh=p+kdicZkgZ3YRTzBry1pw1pvyob4NJ3XEL0BQs+e2Go=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From:Subject;
	b=iMBwdilbWHkl8BEFHY+d5k1l1geMk4nwSrEFJnPUM4qTU7dqHhjEwnoN+5At9vCd1NCtomW4o75RW7aaRmNMpjXj/ELBxelFQkQtC5yLmhQhqLEZaDBOA02aYph/GkXMetlOVTVcHLrNbtzijcBg7KvQNks7cqklCftSo6KBnGeRCh5RaivvmkTAKxdUjWCU6Od/pviPrMtQrriXdco53lqnjptDpm5QEyY139huIrDdSPt7WkOwI4TQBU0U+80q2h6zTSUlq+rIjX0JY7dMd31ToU+2l/0jHZhNuAfHg4jazzu33f5b+Jrgoz8OfpGeaX/cubzXqeXj7ZBo6DxbOQ==
X-YMail-OSG: jhxF86EVM1kNdWYr9RHBa8zu0Ia1MzfZAv.gZjI_rq0gNR6arvyCtFdSeTLpfDi
	T0KjX.s7tBH5sZJ_kxew5GTRNnGkw2KuBqGGER3aaRcilKuYaUAoll_QtSER.HTd0axdX1o15iP9
	O05zL0_QnWiPSJu0fwnjIvQDmCtXeub45NLnw70F2d1sikSCK5SPO4vRIZp89tEms7TYI2nQt1ch
	WQyDn0MbmJPOmxghzAC7S5YCUJsNR8CZOWaydiBp_LICDUt05jiJ9VJa2BfgTtZvu1r5g20Q0GjL
	ZGgO8xF.o2qlQpCIocqNX5dHA4D7MYBr1cSVVUdHHRJL_84Iqoz8iMXFqwhVQVT21uNHXlcS6R7o
	ZH5mYPOIE1gh0E8pagpqNWGF1Frg1ctHBkzvv8j46crK6fCD0wT5y7m2fyKQyvW4ZNNwhZJHrQu.
	.1ND1CFHQyUE4tHR7_6M8gnN_YzkBuxbTpvjkWA5uxkeloV0UQMDHIs5JaE_uXqioyHbggpck19i
	R3rnhaA1ia7Dnw2SaZE6iCGU4C5I3ndkF6MC98yt4j5CxXSNRzUh56txKZSZO35yjoLHC6kVE1SV
	c6SwfunHR81wKZua9AFVHcJZj34dRRFzLrDJdpVujRjX9pthH_qF3Xj4_vpFcjJJvSUhAe0swwPn
	YcWTRmJfg5CJGyG12El0zwlPtfGf.7gGTTzyW85dT4l2pjt.OdvWMtkneGOqqPxfMoHxmhGCdddz
	PDRhkoyse4KxP7pt5fjrPFMvBBKfcsNtXMi4qrLcd41OMX6Av37ySomprPvXnGueY.iCKr9ezYr3
	byqeJUJXtVBTqX9l6rtQERxNu5JXjZj7oWllPxXDeuWCqQkRFW2EaE82bH6TLZ0F85F3FZ8jhZEx
	zWU.44w2qV7hsheXqHYLjA90ltlCc0fdxooOI.lNqmrGk4iT6foIW4Biv7mX.lRJzvALR.1N4QYi
	z7JHK5kKPKenjhWKCRQQB.lI_lwZ45nMvRrKhPTFF0m08gFUC.8QFFgPlyNDzKqGZmX7Vl3HHTSr
	yiKLkTI8IIVSRB705NEBHgRF5BZ3zYDmG8NQhLq8DYc7OeV.hJthrGqo9WxLA1xhV8ts8y3GkTSO
	Kx5uj7med7e2CY8yU8.29x_2DARjjZ7DOkoaUJ1ZZtkzT412TILCcIzUV_gceiilQir88yG0IxGC
	V0rDM9z_8CMnFMI4eddVwbdL2ZzJ3BnUsg1Pk8jG7OH.uxapzg.yufaAXmDnMkFun15J7TodGH1D
	kJw3RCuxDu7fjNQ--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic309.consmr.mail.bf2.yahoo.com with HTTP;
	Mon, 15 Jul 2019 19:37:08 +0000
Received: by smtp430.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 2a1c485c3f8ac2c42f226940fa6a9d15; 
	Mon, 15 Jul 2019 19:37:06 +0000 (UTC)
Subject: Re: Preferred subj= with multiple LSMs
To: Richard Guy Briggs <rgb@redhat.com>, Steve Grubb <sgrubb@redhat.com>
References: <f824828c-5c9d-b91e-5cec-70ee7a45e760@schaufler-ca.com>
	<2268017.8MBUnBNn7u@x2>
	<20190715190457.pqlaxjcxhdcosdsz@madcap2.tricolour.ca>
From: Casey Schaufler <casey@schaufler-ca.com>
Openpgp: preference=signencrypt
Autocrypt: addr=casey@schaufler-ca.com; keydata=
	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
	abzjfg==
Message-ID: <c46932ec-e38e-ba15-7ceb-70e0fe0ef5dc@schaufler-ca.com>
Date: Mon, 15 Jul 2019 12:37:06 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190715190457.pqlaxjcxhdcosdsz@madcap2.tricolour.ca>
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.29]); Mon, 15 Jul 2019 19:37:09 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Mon, 15 Jul 2019 19:37:09 +0000 (UTC) for IP:'74.6.129.196'
	DOMAIN:'sonic309-22.consmr.mail.bf2.yahoo.com'
	HELO:'sonic309-22.consmr.mail.bf2.yahoo.com'
	FROM:'casey@schaufler-ca.com' RCPT:''
X-RedHat-Spam-Score: 0.002  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_NONE) 74.6.129.196 sonic309-22.consmr.mail.bf2.yahoo.com
	74.6.129.196 sonic309-22.consmr.mail.bf2.yahoo.com
	<casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-audit@redhat.com
Cc: "linux-audit@redhat.com" <linux-audit@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Mon, 15 Jul 2019 19:37:42 +0000 (UTC)

On 7/15/2019 12:04 PM, Richard Guy Briggs wrote:
> On 2019-07-13 11:08, Steve Grubb wrote:
>> Hello,
>>
>> On Friday, July 12, 2019 12:33:55 PM EDT Casey Schaufler wrote:
>>> Which of these options would be preferred for audit records
>>> when there are multiple active security modules?
>> I'd like to start out with what is the underlying problem that results in 
>> this? For example, we have pam. It has multiple modules each having a vote. 
>> If a module votes no, then we need to know who voted no and maybe why. We 
>> normally do not need to know who voted yes.
>>
>> So, in a stacked situation, shouldn't each module make its own event, if 
>> required, just like pam? And then log the attributes as it knows them? Also, 
>> what model is being used? Does first module voting no end access voting? Or 
>> does each module get a vote even if one has already said no?
>>
>> Also, we try to keep LSM subsystems separated by record type numbers. So, 
>> apparmour and selinux events are entirely different record numbers and 
>> formats. Combining everything into one record is going to be problematic for 
>> reporting.
> I was wrestling with the options below and was uncomfortable with all of
> them because none of them was guaranteed not to break existing parsers.

I too, am uncomfortable regarding record parsing.

> Steve's answer is the obvious one, ideally allocating a seperate range
> to each LSM with each message type having its own well defined format.

It doesn't address the issue of success records, or records
generated outside the security modules.

>
>> -Steve
>>
>>> I'm not asking
>>> if we should do it, I'm asking which of these options I should
>>> implement when I do do it. I've prototyped #1 and #2. #4 is a
>>> minor variant of #1 that is either better for compatibility or
>>> worse, depending on how you want to look at it. I understand
>>> that each of these offer challenges. If I've missed something
>>> obvious, I'd be delighted to consider #5.
>>>
>>> Thank you.
>>>
>>> Option 1:
>>>
>>> 	subj=selinux='x:y:z:s:c',apparmor='a'
>>>
>>> Option 2:
>>>
>>> 	subj=x:y:z:s:c subj=a
>>>
>>> Option 3:
>>>
>>> 	lsms=selinux,apparmor subj=x:y:z:s:c subj=a
>>>
>>> Option 4:
>>>
>>> 	subjs=selinux='x:y:z:s:c',apparmor='a'
>>>
>>> Option 5:
>>>
>>> 	Something else.
> - RGB
>
> --
> Richard Guy Briggs <rgb@redhat.com>
> Sr. S/W Engineer, Kernel Security, Base Operating Systems
> Remote, Ottawa, Red Hat Canada
> IRC: rgb, SunRaycer
> Voice: +1.647.777.2635, Internal: (81) 32635

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
