Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C010E6966DC
	for <lists+linux-audit@lfdr.de>; Tue, 14 Feb 2023 15:29:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676384963;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ErJJdHsOe2XH2fbvs9MNs2aOolU46sXqyayGoKKybfU=;
	b=CB+3/y9Lb3fXG9kntjFhDgm4f9e5i/H7pk8iIuGWsZLuvXx80+3QzR1lQhrkCijYbmDHYR
	PLyGyZfGjvF0W5M32oSD6/FUdR+dgqFVyvwhII3crqncTK7yOz/y4kqKf7st7EpcSB61y6
	i3XN3LgfVn9YsZTX2x0ionMWcSoQfy4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-287-jqDeztAYNOyuFE38mlr66g-1; Tue, 14 Feb 2023 09:29:20 -0500
X-MC-Unique: jqDeztAYNOyuFE38mlr66g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43B7A3815F6A;
	Tue, 14 Feb 2023 14:29:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 19B511121318;
	Tue, 14 Feb 2023 14:29:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C15A519465A4;
	Tue, 14 Feb 2023 14:29:04 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E278B1946588 for <linux-audit@listman.corp.redhat.com>;
 Tue, 14 Feb 2023 14:29:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CE5C91415108; Tue, 14 Feb 2023 14:29:03 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.9.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A8A94140EBF6;
 Tue, 14 Feb 2023 14:29:03 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: Clarification Around File System Auditing
Date: Tue, 14 Feb 2023 09:29:03 -0500
Message-ID: <4814542.31r3eYUQgx@x2>
Organization: Red Hat
In-Reply-To: <CAJcJf=TSvQxtFxNTkizfk_B1Y2WxE60Ct8HzHkt8RWhKMLnpUQ@mail.gmail.com>
References: <CAJcJf=TSvQxtFxNTkizfk_B1Y2WxE60Ct8HzHkt8RWhKMLnpUQ@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
Cc: Amjad Gabbar <amjadgabbar11@gmail.com>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

On Monday, February 13, 2023 4:24:02 PM EST Amjad Gabbar wrote:
> I wanted some help in better understanding the workflow of file system
> auditing(watch rules) vs Syscall Auditing(syscall rules). I know in general
> file system auditing does not have the same performance impact as syscall
> auditing, even though both make use of syscall exits for their evaluation.
> 
> 
> From the manpage - "Unlike most syscall auditing rules, watches do not
> impact performance based on the number of rules sent to the kernel."
> 
> From a previous thread, I found this excerpt regarding file watch rules vs
> sycall rules -
>
> "The reason it doesn't have performance impact like normal syscall rules is
> because it gets moved to a list that is not evaluated every syscall. A
> normal syscall rule will get evaluated for every syscall because it has to
> see if the syscall number is of interest and then it checks the next
> rule."
> 
> Based on this I had a couple of questions:
> 
> For normal syscall rules, the evaluation happens as __audit_syscall_exit
> <https://elixir.bootlin.com/linux/v6.1.10/C/ident/__audit_syscall_exit>
> calls audit_filter_syscall
> (https://elixir.bootlin.com/linux/v6.1.10/source/kernel/auditsc.c#L841)
> 
> Here, we check if the syscall is of interest or not in the audit_in_mask
> <https://elixir.bootlin.com/linux/v6.1.10/C/ident/audit_in_mask> function.
> Only if the syscall is of interest do we proceed with examining the task
> and return on the first rule match.
> 
> 1. What is the process or code path for watch rules? audit_filter_syscall
> <https://elixir.bootlin.com/linux/v6.1.10/C/ident/audit_filter_syscall> is
> called for watch rules as well. Then how is it that these are not called
> for every syscall? Could you point me to the code where the evaluation
> happens only once?

There is a file, kernel/audit_watch.c, that implements the interface between 
audit and fsnotify. You would want to learn how fsnotify works to understand 
how it avoids the syscall filter.

> 2. Also, do file watches only involve the open system call family (open,
> openat etc). The man page implies the same, so just wanted to confirm.
> 
> I assume -w /etc -p wa is the same as -a always,exit -S open -S openat -F
> dir=/etc?

It depends on the flag passed for perm as to what syscall it wants. See:

include/asm-generic/audit_*.h

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

