Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9F4783596
	for <lists+linux-audit@lfdr.de>; Tue, 22 Aug 2023 00:25:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692656738;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Evw94oLXPwXmV8HM0ULaYm8Xx/jbaiWpPWjYjk4Vq8U=;
	b=cteQ6B6/dJqkQkLTBt4MDC5+5Pa1rWkp4yRgm0nh2bhF89iUnmef8MgU8+FSgleTBd5p+y
	MPYFxGpqIg/D9dbrtu1syptZlOjPEeYD6wl63KPMOsBQvLk03T6N6EaDz6GfzmOp4sKJeV
	N09gxkJNjphv5CQXR3YHr8hj5ipZuv4=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-84-DXmbFoTJMFe5LTucS2oo-g-1; Mon, 21 Aug 2023 18:25:34 -0400
X-MC-Unique: DXmbFoTJMFe5LTucS2oo-g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 696183803505;
	Mon, 21 Aug 2023 22:25:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9C9A7C15BC0;
	Mon, 21 Aug 2023 22:25:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D7998194658F;
	Mon, 21 Aug 2023 22:25:07 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D99C81946587 for <linux-audit@listman.corp.redhat.com>;
 Mon, 21 Aug 2023 22:23:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B46E563F6C; Mon, 21 Aug 2023 22:23:38 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACED764687
 for <linux-audit@redhat.com>; Mon, 21 Aug 2023 22:23:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F4503C0C49C
 for <linux-audit@redhat.com>; Mon, 21 Aug 2023 22:23:38 +0000 (UTC)
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-270-Pcl0XIviMLKWXFtou6yKjQ-1; Mon, 21 Aug 2023 18:23:33 -0400
X-MC-Unique: Pcl0XIviMLKWXFtou6yKjQ-1
Received: from fsav414.sakura.ne.jp (fsav414.sakura.ne.jp [133.242.250.113])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 37LMNKLF047450;
 Tue, 22 Aug 2023 07:23:20 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav414.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav414.sakura.ne.jp);
 Tue, 22 Aug 2023 07:23:20 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav414.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 37LMNKC8047447
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 22 Aug 2023 07:23:20 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <5db92f8f-44c6-b6da-edeb-d7edf86d7ad3@I-love.SAKURA.ne.jp>
Date: Tue, 22 Aug 2023 07:23:16 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] audit: add task history record
To: "Serge E. Hallyn" <serge@hallyn.com>
References: <36b65eb1-ccbf-8b81-468f-b8d88c4be5a3@I-love.SAKURA.ne.jp>
 <CAHC9VhTLQjjQ0QMfBDHYCz9LOAuO=rJWSDEUqPsFE+dowFbN=Q@mail.gmail.com>
 <b06dbdd8-d2f6-b190-5635-948c0a966103@I-love.SAKURA.ne.jp>
 <CAHC9VhSz=3utr_CigGvkMEb6_avJUQq1Ak2smB7neSd76mzjFw@mail.gmail.com>
 <6957af54-16a2-4c28-56ff-dafe95f4e276@I-love.SAKURA.ne.jp>
 <CAHC9VhTj-PQ0qPTiphPLXyJx3bWeqgVS_GPCWNgjqFqBgH6Njg@mail.gmail.com>
 <b0b60fdc-4484-2265-7fdf-8367bf218d18@I-love.SAKURA.ne.jp>
 <20230821160446.GA1317178@mail.hallyn.com>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <20230821160446.GA1317178@mail.hallyn.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

On 2023/08/22 1:04, Serge E. Hallyn wrote:
> On Sat, Aug 19, 2023 at 04:09:46PM +0900, Tetsuo Handa wrote:
>> Anyway, enabling TOMOYO in Fedora/RHEL kernels won't solve the problem
>> this patch is trying to solve, for TOMOYO cannot utilize TOMOYO's process
>> history information because LSM hook for sending signals does not allow
>> TOMOYO to sleep...
> 
> Hang on a tick - I think perhaps you should have led with this.  The
> main argument against this has been (iiuc) that it is a subset of
> tomoyo functionality.  In that case, I'm on the fence about whether it
> should be included.
> 
> But here you say that tomoyo cannot do this.  If that's the case, and
> this is simply completely new functionality, that changes things.

This information is duplicated upon fork() and updated upon execve().
That is how TOMOYO defines TOMOYO's process history information.
Therefore, I'm saying "TOMOYO-like task history information".
But this information provided by this patch is different from TOMOYO's
process history information provided by TOMOYO in two ways.

One is that TOMOYO embeds pathname of a program passed to execve() into
TOMOYO's task history information because it is used for describing access
control rules, whereas this patch embeds comm name and pid and time of execve()
into task history information because it is used for helping administrators
understand system events.

The other is that TOMOYO can check and generate logs with TOMOYO's task history
information for only operations that can sleep (e.g. open()/execve()), whereas
this patch can check and generate logs with task history information for both
sleepable (e.g. open()/execve()) and non-sleepable (e.g. kill()) operations.

Since one of use cases of this task history information is to identify who sent
a signal that caused an unexpected process termination, TOMOYO cannot be do it.

Also, system calls are not the only source of sending signals. There are signals
delivered without security checks via LSM modules. In that case, inserting a
SystemTap script helps catching such signals. But SystemTap scripts are loaded
too late to emulate task history information from boot.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

