Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2886F789412
	for <lists+linux-audit@lfdr.de>; Sat, 26 Aug 2023 08:39:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693031954;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9gxm5fz6FYtwnEk9vWTT0Atqr2bfMWRASwKQJ3gPBJo=;
	b=ff+XE26/jnoYPnLAOcg53U0odlBdX6UgG1qqbigkCapxpdAOJV+hf/CRB+gOhRgbXXnw2K
	KCYhO8XrAtE1ENj0uvzGovngh8E4NHnFYFtsQSjOXSf12HHP5dsyO1Z92AHA9r0KMU+mKY
	ZwfMqDy0Lpei47lLhDuVKQTZAg3ZUmg=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-I4-asyTkPUimBGmVrFBdtA-1; Sat, 26 Aug 2023 02:39:11 -0400
X-MC-Unique: I4-asyTkPUimBGmVrFBdtA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E89D1C04B5C;
	Sat, 26 Aug 2023 06:39:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AE8BB2166B26;
	Sat, 26 Aug 2023 06:39:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 287C119465B8;
	Sat, 26 Aug 2023 06:39:00 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 80F9719465A8 for <linux-audit@listman.corp.redhat.com>;
 Sat, 26 Aug 2023 06:38:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5A8DA140E963; Sat, 26 Aug 2023 06:38:59 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5321D140E962
 for <linux-audit@redhat.com>; Sat, 26 Aug 2023 06:38:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3460B1C04B5C
 for <linux-audit@redhat.com>; Sat, 26 Aug 2023 06:38:59 +0000 (UTC)
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-g4vB9qigOLKU7MlZ_RvJIA-3; Sat, 26 Aug 2023 02:38:56 -0400
X-MC-Unique: g4vB9qigOLKU7MlZ_RvJIA-3
Received: from fsav119.sakura.ne.jp (fsav119.sakura.ne.jp [27.133.134.246])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 37Q6cnLU006839;
 Sat, 26 Aug 2023 15:38:49 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav119.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav119.sakura.ne.jp);
 Sat, 26 Aug 2023 15:38:49 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav119.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 37Q6cnSX006836
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 26 Aug 2023 15:38:49 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <6e4603ea-3ce8-5b9e-0ddf-9ec893ddd32e@I-love.SAKURA.ne.jp>
Date: Sat, 26 Aug 2023 15:38:49 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] audit: add task history record
To: Paul Moore <paul@paul-moore.com>
References: <36b65eb1-ccbf-8b81-468f-b8d88c4be5a3@I-love.SAKURA.ne.jp>
 <CAHC9VhSz=3utr_CigGvkMEb6_avJUQq1Ak2smB7neSd76mzjFw@mail.gmail.com>
 <6957af54-16a2-4c28-56ff-dafe95f4e276@I-love.SAKURA.ne.jp>
 <CAHC9VhTj-PQ0qPTiphPLXyJx3bWeqgVS_GPCWNgjqFqBgH6Njg@mail.gmail.com>
 <b0b60fdc-4484-2265-7fdf-8367bf218d18@I-love.SAKURA.ne.jp>
 <CAHC9VhRaUxN=oEyKCOrfrGzJeXDGxv2EKbZH3qwAB6AhKcSfog@mail.gmail.com>
 <68a0ef90-b452-2096-3729-b5c208878ff9@I-love.SAKURA.ne.jp>
 <CAHC9VhTPgnzdn1tmEmufcbseN_Q1CyzxTEzfvZW7OCBTeAadmA@mail.gmail.com>
 <d2557f88-0cda-b0bf-5c76-7c18912798c9@I-love.SAKURA.ne.jp>
 <CAHC9VhTZE2BinivPRLJ9S_21YcmXA6tMdDtAm5w3nk0dbZ0j1w@mail.gmail.com>
 <e9c593d9-6369-2987-ce20-5832dbebd027@I-love.SAKURA.ne.jp>
 <e56ed3a6-9d82-a181-bbc7-e322ea47cb98@I-love.SAKURA.ne.jp>
 <CAHC9VhRTVsoMWhP1+j7RcUqy2EiV=Z7W_00h55PE-WezzLg=Ew@mail.gmail.com>
 <693f623f-76dd-a709-4916-6d78fe29c9b4@I-love.SAKURA.ne.jp>
 <18a2ac400f8.28a4.85c95baa4474aabc7814e68940a78392@paul-moore.com>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <18a2ac400f8.28a4.85c95baa4474aabc7814e68940a78392@paul-moore.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
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
Cc: audit@vger.kernel.org,
 linux-security-module <linux-security-module@vger.kernel.org>,
 linux-audit@redhat.com, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: i-love.sakura.ne.jp
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2023/08/25 12:36, Paul Moore wrote:
>> It is unfortunate that you continue ignoring the
>>
>>  How can auditd generate logs that are not triggered via syscalls?
>>
>> line. I know how to configure syscall rules using "-S" option. But I do
>> not know how to configure non syscall rules (such as process creation via
>> kthread_create(), process termination due to tty hangup or OOM killer).
> 
> At this point you've exhausted my goodwill so I would suggest simply reading
> the audit code, manages, and experimenting with a running system to understand
> how things work, especially for non-syscall records.

Are we on the same page that non-syscall records include process creation via
kthread_create() and process termination via send_sig() ?

I tried "make M=audit_test/" with below example.

audit_test/audit_test.c
----------------------------------------
#include <linux/module.h>
#include <linux/kthread.h>
#include <linux/sched/signal.h>

static int test_kthread(void *unused)
{
	char *argv[3] = { "/bin/sleep", "10", NULL };
	char *envp[1] = { NULL };
	struct task_struct *p;
	
	printk("test_kthread is running with PID=%d\n", current->pid);
	call_usermodehelper(argv[0], argv, envp, UMH_WAIT_EXEC);
	rcu_read_lock();
	for_each_process(p) {
		if (!(p->flags & PF_KTHREAD) && !strcmp(p->comm, "sleep")) {
			printk("Sending signal to PID=%d\n", p->pid);
			send_sig(SIGKILL, p, 1);
		}
	}
	rcu_read_unlock();
	return 0;
}

static int __init test_init(void)
{
	struct task_struct *task = kthread_create(test_kthread, NULL, "test_kthread");

	if (!IS_ERR(task)) {
		wake_up_process(task);
		schedule_timeout_uninterruptible(5 * HZ);
	}
	return -EINVAL;
}

module_init(test_init);
MODULE_LICENSE("GPL");
----------------------------------------

audit_test/Makefile
----------------------------------------
obj-m += audit_test.o
----------------------------------------

I tried below steps in order to generate all possible records using auditd.

----------------------------------------
# auditctl -D
No rules
# auditctl -a exit,always
# auditctl -a task,always
# insmod audit_test/audit_test.ko
insmod: ERROR: could not insert module audit_test/audit_test.ko: Invalid parameters
# auditctl -D
No rules
# dmesg
[  219.826840] test_kthread is running with PID=4044
[  219.832367] Sending signal to PID=4045
# ausearch -p 4044
<no matches>
# ausearch -p 4045 | sed -e 's/ /\n/g' | grep syscall= | sort -uV
syscall=0
syscall=2
syscall=3
syscall=5
syscall=9
syscall=10
syscall=11
syscall=12
syscall=21
syscall=35
syscall=158
----------------------------------------

Only records issued by system calls (read(),open(),close(),fstat(),mmap(),
mprotect(),munmap(),brk(),access(),nanosleep(),arch_prctl()) are generated.
Neither records issued by process creation via kthread_create() nor records
issued by process termination via send_sig() are generated.

Are you confident that auditd is already capable of generating records for e.g.
process creation via kthread_create() and process termination via send_sig() ?

> If you find a place in the code where you believe there should be an audit record,
> post a patch and we can discuss it.

I believe that auditd needs to be able to generate records for e.g. process creation
via kthread_create() and process termination via send_sig(), if you insist that we can
emulate process history information offered by this patch from user space using records
generated by auditd. (That sounds beyond CONFIG_AUDITSYSCALL=y though...)

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

