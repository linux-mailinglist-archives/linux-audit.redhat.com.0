Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 352CF70F456
	for <lists+linux-audit@lfdr.de>; Wed, 24 May 2023 12:38:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684924700;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SIoFsWb6C09y/NSY6NFkRDIRjnGa9ATxw2JUgFE8anY=;
	b=eSUsdGieSyVih2aOJdmQ3kwzUcfGXhWIYF40qLZkvnO3hUuxQJ25DPGzdrg+EKbiT3s5nM
	BSnI5COGGobF+5DPD29fzUgxNiR5cWA/LZTnTh4zxH6W5HZi4t+p4StA0TNwBjWUOMkSdM
	I357H0VhAZC6P8DjcX3V6OGWo8UV6r0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-390-FHte1iH7Mg6_rStiY6UHjw-1; Wed, 24 May 2023 06:38:16 -0400
X-MC-Unique: FHte1iH7Mg6_rStiY6UHjw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C5B5101A53B;
	Wed, 24 May 2023 10:38:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 053F220296C8;
	Wed, 24 May 2023 10:38:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5EA4519465B9;
	Wed, 24 May 2023 10:38:08 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2E01419465A0 for <linux-audit@listman.corp.redhat.com>;
 Wed, 24 May 2023 10:38:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 126DF400F17; Wed, 24 May 2023 10:38:07 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A5B9492B00
 for <linux-audit@redhat.com>; Wed, 24 May 2023 10:38:07 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E145A3C14AAB
 for <linux-audit@redhat.com>; Wed, 24 May 2023 10:38:06 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-363-njYRHGC1Mhyf5Bph1M6wtQ-1; Wed, 24 May 2023 06:38:05 -0400
X-MC-Unique: njYRHGC1Mhyf5Bph1M6wtQ-1
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-4f004cc54f4so730392e87.3
 for <linux-audit@redhat.com>; Wed, 24 May 2023 03:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684924683; x=1687516683;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8aIc+W4jRozyQKjGPCOdblhKfCTo6UqCtNr9GJSvrD0=;
 b=FPTBL9xsAWqnb7WCTZdOqt4mXI9MYSm7ixgugIdYx0uvSAVIwcOPiikHR3fJkApKi1
 s+xU+POfuer7/hU04XhzqfBs2C+M6h2jnPN1aoS45NXtabH8MlGWymRuylcAGDYHOYGh
 jEMYJ0roqctahpWOjmQIjQPENcQjzBzwxdcM3sDKjxZRHt4wlempBr1R7i9z5PO1Fm07
 zhJAWIobjCXuAh7rITScAGVpmlu1f8I72zJ/fbZw2SyxQVVrWoZj7rj+ksLpM1G6Zq23
 yM7LP9jhU6dHf/gu21+Mosfxy4m2IIOHnWeQfI15ShfxA34ruAEY6lkCAsQ6Lf51Uu6R
 Bnjg==
X-Gm-Message-State: AC+VfDyQDRTokjkYkU0QNelQzUS1ASBU3gJfLe+AXFvSxWygOSM9rz7y
 cYF5SB8BKwhvZNvnzYbDLCo=
X-Google-Smtp-Source: ACHHUZ7g7cPceUMikyYVFWz/WlBSc4fZEWypRDBoGCo+aCDkVp8a3751hHLICOTYJfkAW8YcXV1isQ==
X-Received: by 2002:a05:6512:489:b0:4f2:7c91:93f with SMTP id
 v9-20020a056512048900b004f27c91093fmr5649928lfq.21.1684924683061; 
 Wed, 24 May 2023 03:38:03 -0700 (PDT)
Received: from [192.168.0.31] ([94.242.171.185])
 by smtp.gmail.com with ESMTPSA id
 z4-20020ac25de4000000b004efee5841b9sm1656965lfq.290.2023.05.24.03.38.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 May 2023 03:38:02 -0700 (PDT)
Message-ID: <8406cb9d-0654-b41c-64f9-01aba486b849@gmail.com>
Date: Wed, 24 May 2023 13:38:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Can AUDIT_LIST_RULES causes kthreadd-spam?
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
References: <ecd4bf68-3bf1-a1d8-4da5-5fbd28c51a6b@gmail.com>
 <CAHC9VhTXHLS7bsDJ8-dSp4dQSQRcKRLiTMRYJOJVCY11G5D85A@mail.gmail.com>
 <e5713a91-37b0-d32f-a0d2-eb668122c9e4@gmail.com>
 <9ae2c1df-1f20-a40b-35ed-1dc76b122a4f@I-love.SAKURA.ne.jp>
 <CAHC9VhTfxqrWaJrBccDY9LJR+Fggr__zufD-Wd=0VZwN5bBU6g@mail.gmail.com>
 <415a4871-4d84-a31f-5417-e850a98bbffd@I-love.SAKURA.ne.jp>
 <7c4caf66-a0ae-4999-172e-437d6cfc8ff3@gmail.com>
 <0e748195-d3ba-88c5-1b1e-5a9c447bea57@I-love.SAKURA.ne.jp>
 <dcb7759f-ffd9-b414-f68b-44707a879312@gmail.com>
 <f2c12d41-95bb-6e56-4d68-8a4b50ca59fd@I-love.SAKURA.ne.jp>
From: Rinat Gadelshin <rgadelsh@gmail.com>
In-Reply-To: <f2c12d41-95bb-6e56-4d68-8a4b50ca59fd@I-love.SAKURA.ne.jp>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
Cc: audit@vger.kernel.org, linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Language: en-US, ru-RU
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Hi Tetsuo.

Sorry for my log absence.
The kthread-spam problem has gone when I've switched to using 
unicast-netlink connection (like auditd does).

Do we need to make another test with the additional pr_info() ?

On 10.05.2023 16:30, Tetsuo Handa wrote:
> On 2023/05/10 21:12, Rinat Gadelshin wrote:
>>> Please try to find who is calling audit_send_reply_thread for many times.
>>>
>> I've rebuilt the kernel with 'dump stack()'.
> Oops, I thought dump_stack() shows pid and comm name, but
> it is dump_stack_print_info() that shows pid and comm name.
>
>> As far as I can see, it's the exit of `sendto` syscall.
>> It seems that the kernel just creates a new kthreadd for each sendto syscall.
>> But I think that I'm wrong and just missing something.
> Yes, sendto() on netlink socket calls netlink_sendmsg().
> For some reason, audit_send_reply() is called for many times.
> audit_send_reply() is called by audit_receive_msg() for the following types.
>
>    AUDIT_GET
>    AUDIT_SIGNAL_INFO
>    AUDIT_TTY_GET
>    AUDIT_GET_FEATURE
>
> Would you re-caputure with
>
> -	dump_stack();
> +	pr_info("%s %s:%d type=%d\n", __func__, current->comm, current->pid, type);
>
> ?
>
> Regardless of the result of re-caputure, it seems there is no switch that can
> prevent audit_send_reply() from calling kthread_run(audit_send_reply_thread).
>
> But since kthreadd runs with PID=2 and PPID=0, you might be able to use
> PID=2 and/or PPID=0 in your rules in order to let kernel audit subsystem
> ignore kthreadd. (I can't test because I haven't found how to reproduce
> audit_receive_msg() in my environment...)
>
> # cat /proc/2/status
> Name:   kthreadd
> Umask:  0000
> State:  S (sleeping)
> Tgid:   2
> Ngid:   0
> Pid:    2
> PPid:   0
>

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

