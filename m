Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F5E6FDE93
	for <lists+linux-audit@lfdr.de>; Wed, 10 May 2023 15:30:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683725451;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3+fKGEugiwm5BYRXSvED5qEjRcDq1cIQyayMHT8cixg=;
	b=jJLah8puf32ymLV3L21QwzxoVCpzo6tWE7PS5EgQKyVBpMl0z3nXiENlVb10xymKHIUwM4
	wlSWJus1+1XTpZoXNsR6DUrT2OwMCHnudDdAuMYzyMVFCZ+Rhyt2Z6zZtlfg//0Yo9yW7U
	jyjVKz1ysphri9sBCJNkUPVS1INwFXw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-P_8hxItqNX-4jPhH5KNvBQ-1; Wed, 10 May 2023 09:30:48 -0400
X-MC-Unique: P_8hxItqNX-4jPhH5KNvBQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B59B299E754;
	Wed, 10 May 2023 13:30:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8D5D514171BD;
	Wed, 10 May 2023 13:30:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id ADC5F19451C3;
	Wed, 10 May 2023 13:30:31 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DEA111946A45 for <linux-audit@listman.corp.redhat.com>;
 Wed, 10 May 2023 13:30:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 887BA4078907; Wed, 10 May 2023 13:30:29 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 814584078906
 for <linux-audit@redhat.com>; Wed, 10 May 2023 13:30:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C54B38184E6
 for <linux-audit@redhat.com>; Wed, 10 May 2023 13:30:29 +0000 (UTC)
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-gjTylRX_Nyycd73507RNgA-1; Wed, 10 May 2023 09:30:26 -0400
X-MC-Unique: gjTylRX_Nyycd73507RNgA-1
Received: from fsav413.sakura.ne.jp (fsav413.sakura.ne.jp [133.242.250.112])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 34ADUJIN040673;
 Wed, 10 May 2023 22:30:19 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav413.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav413.sakura.ne.jp);
 Wed, 10 May 2023 22:30:19 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav413.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 34ADUJhr040670
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 10 May 2023 22:30:19 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <f2c12d41-95bb-6e56-4d68-8a4b50ca59fd@I-love.SAKURA.ne.jp>
Date: Wed, 10 May 2023 22:30:19 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: Can AUDIT_LIST_RULES causes kthreadd-spam?
To: Rinat Gadelshin <rgadelsh@gmail.com>, Paul Moore <paul@paul-moore.com>
References: <ecd4bf68-3bf1-a1d8-4da5-5fbd28c51a6b@gmail.com>
 <CAHC9VhTXHLS7bsDJ8-dSp4dQSQRcKRLiTMRYJOJVCY11G5D85A@mail.gmail.com>
 <e5713a91-37b0-d32f-a0d2-eb668122c9e4@gmail.com>
 <9ae2c1df-1f20-a40b-35ed-1dc76b122a4f@I-love.SAKURA.ne.jp>
 <CAHC9VhTfxqrWaJrBccDY9LJR+Fggr__zufD-Wd=0VZwN5bBU6g@mail.gmail.com>
 <415a4871-4d84-a31f-5417-e850a98bbffd@I-love.SAKURA.ne.jp>
 <7c4caf66-a0ae-4999-172e-437d6cfc8ff3@gmail.com>
 <0e748195-d3ba-88c5-1b1e-5a9c447bea57@I-love.SAKURA.ne.jp>
 <dcb7759f-ffd9-b414-f68b-44707a879312@gmail.com>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <dcb7759f-ffd9-b414-f68b-44707a879312@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
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
X-Mimecast-Originator: i-love.sakura.ne.jp
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2023/05/10 21:12, Rinat Gadelshin wrote:
>> Please try to find who is calling audit_send_reply_thread for many times.
>>
> I've rebuilt the kernel with 'dump stack()'.

Oops, I thought dump_stack() shows pid and comm name, but
it is dump_stack_print_info() that shows pid and comm name.

> As far as I can see, it's the exit of `sendto` syscall.
> It seems that the kernel just creates a new kthreadd for each sendto syscall.
> But I think that I'm wrong and just missing something.

Yes, sendto() on netlink socket calls netlink_sendmsg().
For some reason, audit_send_reply() is called for many times.
audit_send_reply() is called by audit_receive_msg() for the following types.

  AUDIT_GET
  AUDIT_SIGNAL_INFO
  AUDIT_TTY_GET
  AUDIT_GET_FEATURE

Would you re-caputure with

-	dump_stack();
+	pr_info("%s %s:%d type=%d\n", __func__, current->comm, current->pid, type);

?

Regardless of the result of re-caputure, it seems there is no switch that can
prevent audit_send_reply() from calling kthread_run(audit_send_reply_thread).

But since kthreadd runs with PID=2 and PPID=0, you might be able to use
PID=2 and/or PPID=0 in your rules in order to let kernel audit subsystem
ignore kthreadd. (I can't test because I haven't found how to reproduce
audit_receive_msg() in my environment...)

# cat /proc/2/status
Name:   kthreadd
Umask:  0000
State:  S (sleeping)
Tgid:   2
Ngid:   0
Pid:    2
PPid:   0

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

