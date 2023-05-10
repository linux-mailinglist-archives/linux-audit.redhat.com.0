Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E776FDF06
	for <lists+linux-audit@lfdr.de>; Wed, 10 May 2023 15:48:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683726518;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=48hb6rB/xU6WwqJ1aQkKIr5beGWn5OdjG4gp0PaXr0M=;
	b=QANvFmuNxGXIxTJ4jxYA5KTDJ0yzavz4G6tcpQMZ5EWGdT8Vr5/Lx/n3/AbbRiYABOSSeD
	tksQqqfCKwtw7yjA9swK64C0AGFMIgBMqrg1bSoSTySTfqRf8z7vLceqJkw24d0c2cwg8/
	b4oLipyasQY2jw5/dmSPH4PBNvq2+n8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-BpoheRzJP1CrRVYcjjZdTA-1; Wed, 10 May 2023 09:48:35 -0400
X-MC-Unique: BpoheRzJP1CrRVYcjjZdTA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 441AD805F58;
	Wed, 10 May 2023 13:48:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 86F151410DD5;
	Wed, 10 May 2023 13:48:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E517119451C3;
	Wed, 10 May 2023 13:48:28 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 29B621946A45 for <linux-audit@listman.corp.redhat.com>;
 Wed, 10 May 2023 13:48:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E2E184078907; Wed, 10 May 2023 13:48:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.17.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B3874078908;
 Wed, 10 May 2023 13:48:27 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Rinat Gadelshin <rgadelsh@gmail.com>, Paul Moore <paul@paul-moore.com>,
 linux-audit@redhat.com
Subject: Re: Can AUDIT_LIST_RULES causes kthreadd-spam?
Date: Wed, 10 May 2023 09:48:26 -0400
Message-ID: <12214633.O9o76ZdvQC@x2>
Organization: Red Hat
In-Reply-To: <f2c12d41-95bb-6e56-4d68-8a4b50ca59fd@I-love.SAKURA.ne.jp>
References: <ecd4bf68-3bf1-a1d8-4da5-5fbd28c51a6b@gmail.com>
 <dcb7759f-ffd9-b414-f68b-44707a879312@gmail.com>
 <f2c12d41-95bb-6e56-4d68-8a4b50ca59fd@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wednesday, May 10, 2023 9:30:19 AM EDT Tetsuo Handa wrote:
> On 2023/05/10 21:12, Rinat Gadelshin wrote:
> >> Please try to find who is calling audit_send_reply_thread for many
> >> times.
> > 
> > I've rebuilt the kernel with 'dump stack()'.
> 
> Oops, I thought dump_stack() shows pid and comm name, but
> it is dump_stack_print_info() that shows pid and comm name.
> 
> > As far as I can see, it's the exit of `sendto` syscall.
> > It seems that the kernel just creates a new kthreadd for each sendto
> > syscall. But I think that I'm wrong and just missing something.
> 
> Yes, sendto() on netlink socket calls netlink_sendmsg().
> For some reason, audit_send_reply() is called for many times.
> audit_send_reply() is called by audit_receive_msg() for the following
> types.
> 
>   AUDIT_GET
>   AUDIT_SIGNAL_INFO
>   AUDIT_TTY_GET
>   AUDIT_GET_FEATURE

The audit userspace always adds NLM_F_ACK to any netlink communication to 
make sure it did not get discarded before it arrived. It has done this since 
before I started working on audit code.

-Steve

> Would you re-caputure with
> 
> -	dump_stack();
> +	pr_info("%s %s:%d type=%d\n", __func__, current->comm, current->pid,
> type);
> 
> ?
> 
> Regardless of the result of re-caputure, it seems there is no switch that
> can prevent audit_send_reply() from calling
> kthread_run(audit_send_reply_thread).
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
> --
> Linux-audit mailing list
> Linux-audit@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-audit




--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

