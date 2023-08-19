Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7E47817F4
	for <lists+linux-audit@lfdr.de>; Sat, 19 Aug 2023 09:10:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692429019;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nHTUSuctAV4bSwTmqur0t7xqyZ0Q42j81pWqj6PSE28=;
	b=Xsx6WvMKKpdYenR9AM46HzPg63X8bFE4wNk63tNNk/bldIraRQMnnEj4cNPMduuCXBh3gB
	jCiCprO/RXZ9wPiK4GHSOiL0frs1vDpqdQm6DCnX1Es4eJJtqfxIu14Z/E5Tf0lp38ynet
	+v08tg8nGGRauws5d63b596e6yY9GCU=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-136-A_9qPYMHPA6_VneG3pAkug-1; Sat, 19 Aug 2023 03:10:16 -0400
X-MC-Unique: A_9qPYMHPA6_VneG3pAkug-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50845380201E;
	Sat, 19 Aug 2023 07:10:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 61A672026D68;
	Sat, 19 Aug 2023 07:10:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0F4221946594;
	Sat, 19 Aug 2023 07:10:00 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7C6701946587 for <linux-audit@listman.corp.redhat.com>;
 Sat, 19 Aug 2023 07:09:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 69D3E4021AD; Sat, 19 Aug 2023 07:09:59 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 61D04492C13
 for <linux-audit@redhat.com>; Sat, 19 Aug 2023 07:09:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A7633C00120
 for <linux-audit@redhat.com>; Sat, 19 Aug 2023 07:09:59 +0000 (UTC)
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-B6T1BtOJMgqmz2NIHItucg-3; Sat, 19 Aug 2023 03:09:56 -0400
X-MC-Unique: B6T1BtOJMgqmz2NIHItucg-3
Received: from fsav114.sakura.ne.jp (fsav114.sakura.ne.jp [27.133.134.241])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 37J79m2c075496;
 Sat, 19 Aug 2023 16:09:48 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav114.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav114.sakura.ne.jp);
 Sat, 19 Aug 2023 16:09:48 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav114.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 37J79mSQ075493
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 19 Aug 2023 16:09:48 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <b0b60fdc-4484-2265-7fdf-8367bf218d18@I-love.SAKURA.ne.jp>
Date: Sat, 19 Aug 2023 16:09:46 +0900
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
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <CAHC9VhTj-PQ0qPTiphPLXyJx3bWeqgVS_GPCWNgjqFqBgH6Njg@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: i-love.sakura.ne.jp
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2023/08/18 23:59, Paul Moore wrote:
> Except we are not talking SELinux or LSMs here, we are talking about
> audit and the audit subsystem is very different from the LSM layer.
> The LSM layer is designed to be pluggable with support for multiple
> individual LSMs, whereas the audit subsystem is designed to support a
> single audit implementation.  It is my opinion that the audit patch
> you have proposed here does not provide an audit administrator with
> any new capabilities that they do not currently have as an option.

Before explaining why an audit administrator cannot afford emulating
this patch, I explain what this patch will do.



There are three system calls for managing a process: fork()/execve()/exit().

  https://I-love.SAKURA.ne.jp/tomoyo/fork.gif
  https://I-love.SAKURA.ne.jp/tomoyo/execve.gif
  https://I-love.SAKURA.ne.jp/tomoyo/exit.gif

As a result, history of a process can be represented as a tree, where the
root of the tree is the kernel thread which is started by the boot loader.

  https://I-love.SAKURA.ne.jp/tomoyo/railway.gif

This fundamental mechanism cannot be changed as long as Linux remains as a
Unix-like OS. That is, adding this information will not cause what you call
"the support burden".



Currently, a "struct task_struct" has comm field and pid field, and
people use these fields like

  printk("[%s:%d] some msg comes here\n", current->comm, current->pid);

for giving hints for identifying a process.

What this patch does is to allow people do like

  printk("[%s] some msg comes here\n", current->comm_history);

for giving hints for identifying a process more precisely.
That is, users of this information is not limited to audit. For example,
an LSM module can use this information, an audit record can use this
information, a SystemTap script can use this information, and so on...



> 
> There are also concerns around field formatting, record length, etc.,
> but those are secondary issues compared to the more important issue of
> redundant functionality.

If someone tries to emulate this patch, we need to be able to trace all
fork()/execve()/exit() system calls. Or, the history tree will be broken.

If an audit administrator tries to emulate this patch using system call
auditing functionality, we need to make sure that

  "auditctl -D" must not clear rules for tracing fork()/execve()/exit()
  system calls. This is impossible because this change will break userspace
  programs expecting that "auditctl -D" clears all rules.

  Rules for tracing fork()/execve()/exit() system calls must be enabled
  when the kernel thread which is started by the boot loader starts.
  How can we embed such system call auditing rules into the kernel and
  tell whether to enable these rules using the kernel command line options?

  In order to avoid possibility of loosing fork()/execve()/exit() records,
  auditd must not be stopped even temporarily. Who wants to enforce such
  requirement in order to be able to obtain process history information?

It seems that Linux kernel also offers "proc connector" mechanism. But is that
reliable enough to guarantee that all fork()/execve()/exit() histories are
kept up-to-dated? Any emulation done by userspace programs is unreliable,
for programs for emulating this patch are started too late to trace all.
Only the built-in kernel code can trace all fork()/execve()/exit() events
and guarantee that all fork()/execve()/exit() histories are kept up-to-dated.



The tracing implemented by this patch needs to be done using the kernel code.

https://www.intellilink.co.jp/column/oss/2014/093001.aspx (sorry, this article
is written in Japanese language) explains 4 survey methods for finding locations
affected by CVE-2014-6271 (also known as "ShellShock"). This article was based on
https://I-love.SAKURA.ne.jp/tomoyo/LCJ2014-en.pdf . Copying P43 and P44 of this
PDF file here:

  Is SystemTap good at everything?

    SystemTap can be used for not only measuring performance
    of functionality but also tracing functionality.

      LSM interface allows probing at only locations where LSM
      callback hooks are provided, for it is designed for making
      security decision and auditing.

    SystemTap allows probing at almost everywhere (not only the
    start/end of a function but also any line number in a function in
    the source code).

      For example, you can find out the exact location in the
      source code where the errno the system call auditing would
      record was set, by writing a SystemTap script which probes
      at specific line number

    Unfortunately, SystemTap is not a tool designed for monitoring
    throughout years.

      LSM modules do not skip events nor stop working until
      shutdown, but SystemTap might skip events or stop working
      due to SystemTap's safety mechanism (and/or external
      factors like SIGKILL) before the event you want to record
      occurs.

    Please check whether SystemTap is suitable for solving your
    problem.

      There will be cases where system call auditing is better.
      There will be cases where single function LSM modules
      explained later is better.

P100, P101, P102 of this PDF file demonstrates a SystemTap script
which tries to emulate subset of what this patch can do. The difficult
part of such emulation is mainly managing the process history tree.
If the built-in kernel code offers the process history tree, writing
SystemTap scripts will become much easier. 

But I can't propose this code as a patch for SystemTap, for SystemTap
is not a in-tree kernel code. I need to propose this code as a patch
for in-tree kernel code. LSM and system call auditing are users who
can utilize this code. But you don't want this code as a patch for
audit due to unknown "the support burden".



> 
>> People propose different approaches/implementations because
>> they can't afford utilizing/configuring existing approaches/implementations.
> 
> From what I've seen, both in this thread as well as the other related
> threads from you, these recent efforts are due to a lack of TOMOYO
> support in mainstream Linux distributions.  My advice is to stop
> trying to duplicate the TOMOYO functionality in other subsystems/LSMs
> and start working with the distributions to better understand why they
> are not supporting TOMOYO.  I believe that if you can determine why
> the distributions are not enabling TOMOYO, you should be able to
> develop a plan to address those issues and eventually gain
> distribution support for TOMOYO.  I understand that such an approach
> will likely be time consuming and difficult, but I think that is your
> best option for success.

https://bugzilla.redhat.com/show_bug.cgi?id=542986 was the request for
enabling TOMOYO in Fedora. But Red Hat people do not want to support
TOMOYO due to unknown "the support burden" like you say.

TOMOYO is tested by syzbot, and quite few bugs have been found in TOMOYO.
I think that enabling TOMOYO in Fedora/RHEL kernels won't cause "the support
burden.". But I can't determine why Red Hat people do not enable TOMOYO.
How can I convince Red Hat people afraiding unprovable, unexplainable,
unknown "the support burden" ?



Anyway, enabling TOMOYO in Fedora/RHEL kernels won't solve the problem
this patch is trying to solve, for TOMOYO cannot utilize TOMOYO's process
history information because LSM hook for sending signals does not allow
TOMOYO to sleep...

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

