Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D146922EA
	for <lists+linux-audit@lfdr.de>; Fri, 10 Feb 2023 17:06:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676045215;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UdM+tM6PErN8utSU75pmTzNapN7u08srojINPZl15Hs=;
	b=O+AFjfiPk0I+HDL3xlZfp7rvMYsJ/v9d4GgoBTOp3AaOKJfEEU0ghgSkXzeJPeRTlbr36D
	gyZsxTUP5QRkWnoyynzFDzMUyCKb4JxIw15BcXoBsJXLr+OZBgExuD2cNvjtISegoSkUHG
	eyV789XS0ZBxielXklUSxxbKnnFDGHY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-408-KNt9X1rVMYSINCCN-ukcOw-1; Fri, 10 Feb 2023 11:06:52 -0500
X-MC-Unique: KNt9X1rVMYSINCCN-ukcOw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99A01100F906;
	Fri, 10 Feb 2023 16:06:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 71BEC492B00;
	Fri, 10 Feb 2023 16:06:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 06DF919465A3;
	Fri, 10 Feb 2023 16:06:48 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 728C0194658F for <linux-audit@listman.corp.redhat.com>;
 Fri, 10 Feb 2023 16:00:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4FEF32026D68; Fri, 10 Feb 2023 16:00:17 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 474392026D4B
 for <linux-audit@redhat.com>; Fri, 10 Feb 2023 16:00:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 251031C05155
 for <linux-audit@redhat.com>; Fri, 10 Feb 2023 16:00:17 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-247-NTTCrbdvMZOz84nETPS3-A-1; Fri, 10 Feb 2023 11:00:15 -0500
X-MC-Unique: NTTCrbdvMZOz84nETPS3-A-1
Received: by mail-io1-f41.google.com with SMTP id o1so2088960ioo.10
 for <linux-audit@redhat.com>; Fri, 10 Feb 2023 08:00:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cKCnbmHogXEmRbO0onTMSj4NA86gqgz0RX9mB07CwWE=;
 b=kElDve6oZrA9HGKYQMRoQWBEKUodGqoh9T8jSURtv1a5MaJ3NA5VRbzZ8vUBquXCAZ
 7CU9zIwR8BccLV2xLfDkJpfYUCbE2wuUA1p+td5lCEBdtGo7RoXgspOTnMdzi0WBSvg4
 fGGaIbpIdC7lkL3hICfXm6ddj0B7gBa9LHkdakR38l93YqQs9v9SmDCr34kLksXxaSL5
 Kkt96SRv4lRlA6Zbawlxaqd2yOV7CgDgzQpwuJQxgYEudkRP6KQ8XojJXcc7anU78hli
 71uMsePLKa0bquVTsW2D+WzKYiMdHlrNkgq+DugeB19W204KluokS630sjkvL4wkihfi
 86Tw==
X-Gm-Message-State: AO0yUKVrnsb95GTEaXyNEtXRb65+n+1Vb6dWebJ2Zxv0Kg2o5xNwyv3j
 vqhKmIUk2xQ8AgnXmOSe5GiLsA==
X-Google-Smtp-Source: AK7set/SjFI233Hr0PsxihtGJ1Amwm5e4Y73hxHeifCQOI2JIX5bo16OqRZP/ZRIrzu2zanedDEbxQ==
X-Received: by 2002:a5d:9492:0:b0:707:6808:45c0 with SMTP id
 v18-20020a5d9492000000b00707680845c0mr10394797ioj.1.1676044813908; 
 Fri, 10 Feb 2023 08:00:13 -0800 (PST)
Received: from [192.168.1.94] ([96.43.243.2]) by smtp.gmail.com with ESMTPSA id
 n10-20020a5ed90a000000b0073a312aaae5sm1392629iop.36.2023.02.10.08.00.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 08:00:13 -0800 (PST)
Message-ID: <56ef99e4-f9de-0634-ce53-3bc2f1fa6665@kernel.dk>
Date: Fri, 10 Feb 2023 09:00:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] io_uring,audit: don't log IORING_OP_MADVISE
To: Paul Moore <paul@paul-moore.com>
References: <b5dfdcd541115c86dbc774aa9dd502c964849c5f.1675282642.git.rgb@redhat.com>
 <Y+VrSLZKZoAGikUS@madcap2.tricolour.ca>
 <CAHC9VhTNb4gOpk9=49-ABtYs1DFKqqwXPSc-2bhJX7wcZ82o=g@mail.gmail.com>
 <13293926.uLZWGnKmhe@x2> <6939adfb-ce2c-1911-19ee-af32f7d9a5ca@kernel.dk>
 <CAHC9VhTGmGJ81M2CZWsTf1kNf8XNz2WsYFAP=5VAVSUfUiu1yQ@mail.gmail.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CAHC9VhTGmGJ81M2CZWsTf1kNf8XNz2WsYFAP=5VAVSUfUiu1yQ@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Fri, 10 Feb 2023 16:06:46 +0000
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: Christian Brauner <brauner@kernel.org>, Richard Guy Briggs <rgb@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux-Audit Mailing List <linux-audit@redhat.com>, Stefan Roesch <shr@fb.com>,
 Eric Paris <eparis@parisplace.org>, io-uring@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2/10/23 8:39?AM, Paul Moore wrote:
> On Thu, Feb 9, 2023 at 7:15 PM Jens Axboe <axboe@kernel.dk> wrote:
>> On 2/9/23 3:54?PM, Steve Grubb wrote:
>>> On Thursday, February 9, 2023 5:37:22 PM EST Paul Moore wrote:
>>>> On Thu, Feb 9, 2023 at 4:53 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>>>>> On 2023-02-01 16:18, Paul Moore wrote:
>>>>>> On Wed, Feb 1, 2023 at 3:34 PM Richard Guy Briggs <rgb@redhat.com>
>>> wrote:
>>>>>>> fadvise and madvise both provide hints for caching or access pattern
>>>>>>> for file and memory respectively.  Skip them.
>>>>>>
>>>>>> You forgot to update the first sentence in the commit description :/
>>>>>
>>>>> I didn't forget.  I updated that sentence to reflect the fact that the
>>>>> two should be treated similarly rather than differently.
>>>>
>>>> Ooookay.  Can we at least agree that the commit description should be
>>>> rephrased to make it clear that the patch only adjusts madvise?  Right
>>>> now I read the commit description and it sounds like you are adjusting
>>>> the behavior for both fadvise and madvise in this patch, which is not
>>>> true.
>>>>
>>>>>> I'm still looking for some type of statement that you've done some
>>>>>> homework on the IORING_OP_MADVISE case to ensure that it doesn't end
>>>>>> up calling into the LSM, see my previous emails on this.  I need more
>>>>>> than "Steve told me to do this".
>>>>>>
>>>>>> I basically just want to see that some care and thought has gone into
>>>>>> this patch to verify it is correct and good.
>>>>>
>>>>> Steve suggested I look into a number of iouring ops.  I looked at the
>>>>> description code and agreed that it wasn't necessary to audit madvise.
>>>>> The rationale for fadvise was detemined to have been conflated with
>>>>> fallocate and subsequently dropped.  Steve also suggested a number of
>>>>> others and after investigation I decided that their current state was
>>>>> correct.  *getxattr you've advised against, so it was dropped.  It
>>>>> appears fewer modifications were necessary than originally suspected.
>>>>
>>>> My concern is that three of the four changes you initially proposed
>>>> were rejected, which gives me pause about the fourth.  You mention
>>>> that based on your reading of madvise's description you feel auditing
>>>> isn't necessary - and you may be right - but based on our experience
>>>> so far with this patchset I would like to hear that you have properly
>>>> investigated all of the madvise code paths, and I would like that in
>>>> the commit description.
>>>
>>> I think you're being unnecessarily hard on this. Yes, the commit message
>>> might be touched up. But madvise is advisory in nature. It is not security
>>> relevant. And a grep through the security directory doesn't turn up any
>>> hooks.
>>
>> Agree, it's getting a bit anal... FWIW, patch looks fine to me.
> 
> Call it whatever you want, but the details are often important at this
> level of code, and when I see a patch author pushing back on verifying
> that their patch is correct it makes me very skeptical.

Maybe it isn't intended, but the replies have generally had a pretty
condescending tone to them. That's not the best way to engage folks, and
may very well be why people just kind of give up on it. Nobody likes
debating one-liners forever, particularly not if it isn't inviting.

> I really would have preferred that you held off from merging this
> until this was resolved and ACK'd ... oh well.

It's still top of tree. If you want to ack it, let me know and I'll add
it. If you want to nak it, give me something concrete to work off of.

-- 
Jens Axboe

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

