Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8F9785A45
	for <lists+linux-audit@lfdr.de>; Wed, 23 Aug 2023 16:21:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692800467;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=InEdb+4Hf4z7T+OpSf9Ty1gIfa2FVkFmA6GBtVB3M4w=;
	b=GNEhPRq7SegbCWqwGLyYzOHUyRiXPBfJJRwmfh6/tZCtP8VCaWgXzGtHjQoqCjfy4aFaVr
	Mt2du+h6tnP3yf+HS6xzzooiMpvGxJkn8EGiELyFXO8l5cAnryt0y7uIuNRXb9oJxmW8Tu
	KQVnRTpA/akWhU3GGJlVgUt/oFKBH/M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-Qo20SllHMHWAjZZvQ3m5MQ-1; Wed, 23 Aug 2023 10:21:01 -0400
X-MC-Unique: Qo20SllHMHWAjZZvQ3m5MQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71CED853065;
	Wed, 23 Aug 2023 14:20:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2CD03492C14;
	Wed, 23 Aug 2023 14:20:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2D6241946597;
	Wed, 23 Aug 2023 14:20:42 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 522B61946589 for <linux-audit@listman.corp.redhat.com>;
 Wed, 23 Aug 2023 14:19:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2DB36403161; Wed, 23 Aug 2023 14:19:02 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 23F74492C13
 for <linux-audit@redhat.com>; Wed, 23 Aug 2023 14:19:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06D4D101A5BD
 for <linux-audit@redhat.com>; Wed, 23 Aug 2023 14:19:02 +0000 (UTC)
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-81-79hwH5ogO8e7MZN9bGWDxQ-3; Wed, 23 Aug 2023 10:18:59 -0400
X-MC-Unique: 79hwH5ogO8e7MZN9bGWDxQ-3
Received: from fsav120.sakura.ne.jp (fsav120.sakura.ne.jp [27.133.134.247])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 37NEIqtU083525;
 Wed, 23 Aug 2023 23:18:52 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav120.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav120.sakura.ne.jp);
 Wed, 23 Aug 2023 23:18:52 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav120.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 37NEIjCs083510
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 23 Aug 2023 23:18:52 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <68a0ef90-b452-2096-3729-b5c208878ff9@I-love.SAKURA.ne.jp>
Date: Wed, 23 Aug 2023 23:18:43 +0900
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
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <CAHC9VhRaUxN=oEyKCOrfrGzJeXDGxv2EKbZH3qwAB6AhKcSfog@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: i-love.sakura.ne.jp
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2023/08/22 1:35, Paul Moore wrote:
>>   "auditctl -D" must not clear rules for tracing fork()/execve()/exit()
>>   system calls. This is impossible because this change will break userspace
>>   programs expecting that "auditctl -D" clears all rules.
> 
> It's a good thing that 'audtictl -d ...' exists so that one can
> selectively delete audit rules from the kernel.  If someone wants to
> preserve specific audit rules, that is the way to do it; 'auditctl -D'
> is a very coarse tool and not something that is likely very useful for
> users with strict auditing requirements.

In most systems, "auditctl -D" is the first command done via /etc/audit/audit.rules file.
You are asking all administrators who want to emulate this patch's functionality using
auditd to customize that line. We can't afford asking such administrators to become
specialist of strict auditing configurations, as well as we can't afford asking
every administrator to become specialist of strict SELinux policy configurations.

Like Steve Grubb mentions, technically possible and practically affordable are
different. The audit subsystem could handle the load, but the system administrator 
can't handle the load. That's why I said

  That is a "No LSM modules other than SELinux is needed because SELinux can do
  everything" assertion.

and your response

  Except we are not talking SELinux or LSMs here, we are talking about
  audit and the audit subsystem is very different from the LSM layer.
  The LSM layer is designed to be pluggable with support for multiple
  individual LSMs, whereas the audit subsystem is designed to support a
  single audit implementation.

is totally missing the point.

For example, doing

  auditctl -a exit,always -F arch=b64 -S exit,exit_group

(in order to allow userspace daemon which tries to emulate this patch's
functionality) will let auditd to generate process termination logs via exit()
system call. This command alone can generate too much stress on a busy system
(performance DoS and storage DoS). And moreover, this command will not let
auditd to generate process termination logs via kill() system call.

  kill -9 $$

Auditing kill system call may generate more stress than auditing exit system call.
Too much noisy logs for catching the exact one event we want to know.

Also, despite too much logs, system calls are not the only source of sending
signals. There are signals delivered without security checks via LSM modules.



The requirements for emulating functionality provided by this patch will be

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

. Simply we can't emulate functionality provided by this patch using audit rules.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

