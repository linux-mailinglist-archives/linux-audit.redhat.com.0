Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7BC787025
	for <lists+linux-audit@lfdr.de>; Thu, 24 Aug 2023 15:21:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692883306;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=q9LyK0qHl3I/jjQF8+++FDDkdskvjJZswiw1rB3wWuc=;
	b=EzwKS7+zYaIiq6JF+6Af7p7ZalZiLcKT4aWfoSuM1mWw4nTQerEyLpz9GJXu/0g+BD23Jz
	okTKueBnOE2RsMOPDc+ssOGj9Lzn/wIv6I0LWvE/jlTTA1od/9rl5oWVPOSXoc3C6E1ACE
	gqHSSSJPQiEWEjK1HH7xxBs6fvrztqg=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-684-SBAgJ3mBNxiQf7a9nVqB4g-1; Thu, 24 Aug 2023 09:21:43 -0400
X-MC-Unique: SBAgJ3mBNxiQf7a9nVqB4g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A54F61C0CCA3;
	Thu, 24 Aug 2023 13:21:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BCD85C1602E;
	Thu, 24 Aug 2023 13:21:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AE4211946597;
	Thu, 24 Aug 2023 13:21:33 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BA6051946589 for <linux-audit@listman.corp.redhat.com>;
 Thu, 24 Aug 2023 13:21:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A944F2166B28; Thu, 24 Aug 2023 13:21:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0EDC2166B26
 for <linux-audit@redhat.com>; Thu, 24 Aug 2023 13:21:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 850B3856F67
 for <linux-audit@redhat.com>; Thu, 24 Aug 2023 13:21:31 +0000 (UTC)
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-RoDvnsXWMH6nQlmdRWxquw-3; Thu, 24 Aug 2023 09:21:29 -0400
X-MC-Unique: RoDvnsXWMH6nQlmdRWxquw-3
Received: from fsav113.sakura.ne.jp (fsav113.sakura.ne.jp [27.133.134.240])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 37ODLMiX042500;
 Thu, 24 Aug 2023 22:21:22 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav113.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav113.sakura.ne.jp);
 Thu, 24 Aug 2023 22:21:22 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav113.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 37ODLLoD042496
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 24 Aug 2023 22:21:22 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <d2557f88-0cda-b0bf-5c76-7c18912798c9@I-love.SAKURA.ne.jp>
Date: Thu, 24 Aug 2023 22:21:21 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] audit: add task history record
To: Paul Moore <paul@paul-moore.com>
References: <36b65eb1-ccbf-8b81-468f-b8d88c4be5a3@I-love.SAKURA.ne.jp>
 <CAHC9VhTLQjjQ0QMfBDHYCz9LOAuO=rJWSDEUqPsFE+dowFbN=Q@mail.gmail.com>
 <b06dbdd8-d2f6-b190-5635-948c0a966103@I-love.SAKURA.ne.jp>
 <CAHC9VhSz=3utr_CigGvkMEb6_avJUQq1Ak2smB7neSd76mzjFw@mail.gmail.com>
 <6957af54-16a2-4c28-56ff-dafe95f4e276@I-love.SAKURA.ne.jp>
 <CAHC9VhTj-PQ0qPTiphPLXyJx3bWeqgVS_GPCWNgjqFqBgH6Njg@mail.gmail.com>
 <b0b60fdc-4484-2265-7fdf-8367bf218d18@I-love.SAKURA.ne.jp>
 <CAHC9VhRaUxN=oEyKCOrfrGzJeXDGxv2EKbZH3qwAB6AhKcSfog@mail.gmail.com>
 <68a0ef90-b452-2096-3729-b5c208878ff9@I-love.SAKURA.ne.jp>
 <CAHC9VhTPgnzdn1tmEmufcbseN_Q1CyzxTEzfvZW7OCBTeAadmA@mail.gmail.com>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <CAHC9VhTPgnzdn1tmEmufcbseN_Q1CyzxTEzfvZW7OCBTeAadmA@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
Cc: audit@vger.kernel.org,
 linux-security-module <linux-security-module@vger.kernel.org>,
 linux-audit@redhat.com, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: i-love.sakura.ne.jp
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2023/08/23 23:48, Paul Moore wrote:
> We've already discussed this both from a kernel load perspective (it
> should be able to handle the load, if not that is a separate problem
> to address) as well as the human perspective (if you want auditing,
> you need to be able to handle auditing).

No. You haven't shown us audit rules that can satisfy requirements shown below.

  (1) Catch _all_ process creations (both via fork()/clone() system calls and
      kthread_create() from the kernel), and duplicate the history upon process
      creation.

  (2) Catch _all_ execve(), and update the history upon successful execve().

  (3) Catch _all_ process terminations (both exit()/exit_group()/kill() system
      calls and internal reasons such as OOM killer), and erase the history upon
      process termination.

  (4) Do the above things without asking administrators to become a specialist of
      system management and without asking administrators to drastically change
      system configurations and without consuming too much CPU and storage.

We know we can't satisfy requirements shown above using audit rules. That's why
this patch maintains process history information without using audit rules.

> 
> Tetsuo, as should be apparent at this point, I'm finding your
> arguments unconvincing at best, and confusing at worst.  If you or
> someone else wants to take a different approach towards arguing for
> this patch I'll entertain the discussion further, but please do not
> reply back with the same approach; it simply isn't constructive at
> this point.

Although it will be nice if we can fetch this process history information
directly from "current", I can live with fetching this process history
information from "current->security" (that is, moving what you call "the
support burden" from audit subsystem to LSM module authors).

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

