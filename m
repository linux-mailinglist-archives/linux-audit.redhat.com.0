Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6AE2D22B04F
	for <lists+linux-audit@lfdr.de>; Thu, 23 Jul 2020 15:20:00 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-4H3KAQfxNS-qb9pbvSh_3A-1; Thu, 23 Jul 2020 09:19:56 -0400
X-MC-Unique: 4H3KAQfxNS-qb9pbvSh_3A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E78BD102C7ED;
	Thu, 23 Jul 2020 13:19:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F042661983;
	Thu, 23 Jul 2020 13:19:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 20541730F4;
	Thu, 23 Jul 2020 13:19:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06NDAgwM027325 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 23 Jul 2020 09:10:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5148F208DD9D; Thu, 23 Jul 2020 13:10:42 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3483C208DD8A
	for <linux-audit@redhat.com>; Thu, 23 Jul 2020 13:10:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD8B71012444
	for <linux-audit@redhat.com>; Thu, 23 Jul 2020 13:10:39 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-225-1Wz95TVwOOGsgFgK2vv2GQ-1; Thu, 23 Jul 2020 09:10:31 -0400
X-MC-Unique: 1Wz95TVwOOGsgFgK2vv2GQ-1
Received: by mail-wr1-f66.google.com with SMTP id r12so5075409wrj.13;
	Thu, 23 Jul 2020 06:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:references:autocrypt:subject
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=2mKowhmdueO3ybGKatO8QxD836CqL1itmXbKt0pJShw=;
	b=NVu4o/jcoOYWLhAewRNO2St39x08+U4P7+AMbOVjd7miPmxtvFMsoYtr61zRvwiLcy
	UDP8TBkJ/S8HgKdxRM6tzjjVFd8tS6fc01L3NXoI5wA4mqfbKkS7w1RyXXur+vh+KOqQ
	YiIUHMPRU4yuVAVubGzOPqq/4rcKuiR+MTTLh/QDCSA+3M2CM5zgUVXYLxmTs6pcLXss
	5JRZYzJaxyUfCuwHyGjFST+opRTJyQV90QLtwC+ojXx9HC0lZ9saBNAH2ix6FFXLoFUs
	5Sw17hlh8ZTJ6ZarLDXOO0VdUrVvZ1GcAyteJn35atIuhpk0RkD/wOvfhSgH0pF3JqSq
	rj9w==
X-Gm-Message-State: AOAM530PgYmrDQCfp6QvM/g08Q/92Igs6S7VuMUVya00bGFghCQmZ79E
	HkRqSdNIe4g7nD0Zc5DfGuIb78pgNdc=
X-Google-Smtp-Source: ABdhPJymqmcmJd37nBYEnfHH/tGLEuZ1mJODAsIOIEx/63xMFpzZbuyJVf3aWf6JLXOeRSZNDerNeg==
X-Received: by 2002:adf:f608:: with SMTP id t8mr4118401wrp.308.1595509829819; 
	Thu, 23 Jul 2020 06:10:29 -0700 (PDT)
Received: from ?IPv6:2a02:810d:4bc0:8098:a226:5056:b008:9621?
	([2a02:810d:4bc0:8098:a226:5056:b008:9621])
	by smtp.gmail.com with ESMTPSA id x4sm4474801wru.81.2020.07.23.06.10.28
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 23 Jul 2020 06:10:29 -0700 (PDT)
From: bauen1 <j2468h@googlemail.com>
X-Google-Original-From: bauen1 <j2468h@gmail.com>
To: Dominick Grift <dominick.grift@defensec.nl>,
	Richard Guy Briggs <rgb@redhat.com>
References: <9c8f1fc6-2b8e-e9e3-37bf-2d1d6bedace1@gmail.com>
	<360c7a62-fd39-ad02-60b8-87fb18022eeb@defensec.nl>
	<20200722194740.qqz7iya3nrqs3a3w@madcap2.tricolour.ca>
	<dedbf8ae-bc44-ab03-b7d4-2f724e516210@defensec.nl>
	<20200723124703.3upv2dykfekxbb3w@madcap2.tricolour.ca>
	<f724ccc0-5cee-abbc-b44c-d8574fba988e@defensec.nl>
Autocrypt: addr=j2468h@gmail.com; keydata=
	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
	MzTZEAm15uwFxq66
Subject: Re: null pointer dereference regression in 5.7
Message-ID: <4bee5a4a-cb1b-6db7-6c41-fb5221b5363c@gmail.com>
Date: Thu, 23 Jul 2020 15:10:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f724ccc0-5cee-abbc-b44c-d8574fba988e@defensec.nl>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 23 Jul 2020 09:12:19 -0400
Cc: bauen1 <j2468h@googlemail.com>, linux-audit@redhat.com
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

On 7/23/20 2:58 PM, Dominick Grift wrote:
> 
> 
> On 7/23/20 2:47 PM, Richard Guy Briggs wrote:
>> On 2020-07-22 22:04, Dominick Grift wrote:
>>> On 7/22/20 9:47 PM, Richard Guy Briggs wrote:
>>>> On 2020-07-18 20:56, Dominick Grift wrote:
>>>>> On 7/18/20 8:40 PM, bauen1 wrote:
>>>>>> Hi,
>>>>>> After upgrading from linux 5.6 to 5.7 on my debian machines with selinux I've started seeing this null pointer dereference in the audit system. I've included shortened logs for 5.6 without the error and from 5.7 with the error from my laptop. I've also seen it happen in a VM and a server, but don't have the logs anymore. Grift was able to reproduced (presumably) the same issue on fedora with 5.8-rc4.
>>>>>>
>>>>>> Steps to reproduce:
>>>>>> Write an selinux policy with a domain for systemd-user-runtime-dir and audit all permissions of the dir class. E.g. `(auditallow systemd_user_runtime_dir_t all_types (dir (all)))`
>>>>>> Switch to permissive mode.
>>>>>> Create a new user and login, log out and wait a few seconds for systemd to stop user-runtime-dir@<uid>.service
>>>>>
>>>>> This should be a reproducer:
>>>>>
>>>>> echo "(auditallow systemd_logind_t file_type (dir (all)))" > mytest.cil
>>>>> && sudo semodule -i mytest.cil
>>>>> reboot
>>>>
>>>> Is this recipe complete?  Is permissive mode needed?  Is the user
>>>> create/login/logout needed?
>>>
>>> Are you saying you can't reproduce it?
>>
>> Not yet.  This run caused a queue overflow but no pointer dereference.
>>
>>> It *should* be complete yes. with kernel 5.7/5.8 it should oops when you
>>> reboot.
>>
>> I don't understand what this test does to cause an AVC.  I assume we
>> want the smiplest test that produces the smallest amount of output but
>> certain to trigger the event.
> 
> Yes that is the idea, my test was a bit broader but i based this
> conversion of the test on bauen1's test which is a bit more narrow ( i
> think he managed to narrow it down a bit). Maybe this test is a bit to
> narrow and a bit broader version triggers i>>
>> Since this test is in place on reboot, how do I remove this test for
>> subsequent reboots?
>>
> 
> You would boot with selinux=0 and then run as root `semodule -n -r
> mytest' to unload the offending mytest module without trying to reload.
> 
> then reboot with selinux enforcing/permissive (you might end up with
> some mis and/or unlabeled files)
> 
>>> I will admit though that I adjusted the reproducer a little bit in an
>>> attempt to make it fit fedora.
>>
>> I'm running the test on f32.  I have 5 kernels that should blow up and
>> two that might be fine with the ghak96 LSM_AUDIT_DATA_* audit_getpwd() fix.
>>
>>> So if it doesnt oops for you and if you use 5.7/5.8 then maybe the
>>> reproducer got mangled in the conversion.
>>
>> Can you explain the mechanism and the conversion?
> 
> I use my own selinux security policy with different identifiers, so to
> make my test work on Fedora I figured I just needed to translate the
> identifiers applicable in my policy to the identifiers applicable in Fedora.
> 
> Basically it boils down to this:
> The event was triggered by systemd-user-runtime-dir (which in fedora is
> associated with type identifier systemd_logind_t) on particual (i
> suspect) directory operations (like i guess "traverse"), when the event
> is logged even if its granted. So I tried to express that scenario using
> fedora identifiers rather than the ones I use.
> 

The actual permission checks that cause the audit event are probably (dir (search remove_name rmdir)), in refpolicy syntax `dir { search remove_name rmdir };`.
It doesn't really matter how the audit event is generated (permissive mode and denying access or enforcing and auditing allows).
I've reproduced it with systemd version 245.6-1 on a debian system with gnupg installed. Having something like gnupg installed is important as it creates its own directory under /run/user/uid that is accessed by systemd-user-runtime-dir after log out.

-- 
bauen1
https://dn42.bauen1.xyz/

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

