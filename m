Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D50137A3F7B
	for <lists+linux-audit@lfdr.de>; Mon, 18 Sep 2023 04:39:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695004772;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RIBKBHDEaolJ1IS4jHbVUaRBZn8J48ujoulfKA+AoPo=;
	b=epEP9mcwievZd4t1gg8TgTMIWE6QSh4a0XRgBxMjMjwDI5dMuVZVAQcKjHLUgl+1xzamhT
	QvFuOyr2A6PmnzvACfoyrt5PnJDAho/DzKal2Z+iJpe+IYpJFssnOXx1RUQ1UtFY6ic87g
	X/DuZ0CA7R0f1mimCKnbEuehKSBhr9M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-547-48f35vLZNoS2INBUgYIpsA-1; Sun, 17 Sep 2023 22:39:28 -0400
X-MC-Unique: 48f35vLZNoS2INBUgYIpsA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E374F85A5A8;
	Mon, 18 Sep 2023 02:39:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0225D40C6EBF;
	Mon, 18 Sep 2023 02:39:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7D4D119465A2;
	Mon, 18 Sep 2023 02:39:15 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 59E1F194658C for <linux-audit@listman.corp.redhat.com>;
 Mon, 18 Sep 2023 02:39:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1E95D40C2070; Mon, 18 Sep 2023 02:39:14 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 175B840C2064
 for <linux-audit@redhat.com>; Mon, 18 Sep 2023 02:39:14 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE305800883
 for <linux-audit@redhat.com>; Mon, 18 Sep 2023 02:39:13 +0000 (UTC)
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-301-6BXPguw9O8-nJiQ-N1NN2A-1; Sun, 17 Sep 2023 22:39:10 -0400
X-MC-Unique: 6BXPguw9O8-nJiQ-N1NN2A-1
Received: from fsav412.sakura.ne.jp (fsav412.sakura.ne.jp [133.242.250.111])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 38I2d0km071323;
 Mon, 18 Sep 2023 11:39:01 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav412.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav412.sakura.ne.jp);
 Mon, 18 Sep 2023 11:39:00 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav412.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 38I2ct0o071303
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 18 Sep 2023 11:39:00 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <8ef14c37-2a75-5755-d074-fd4bcfc9e574@I-love.SAKURA.ne.jp>
Date: Mon, 18 Sep 2023 11:38:55 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: 128 Character limit on proctitle field?
To: "Wieprecht, Karen M." <Karen.Wieprecht@jhuapl.edu>
References: <f04d10f4d94c4c2295031fee26dc8082@jhuapl.edu>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <f04d10f4d94c4c2295031fee26dc8082@jhuapl.edu>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
Cc: "linux-audit@redhat.com" <linux-audit@redhat.com>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: i-love.sakura.ne.jp
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2023/09/16 1:15, Wieprecht, Karen M. wrote:
> All,
> 
> We're working with Docker and podman, and I'm working on parsing the audit data
> we get to flag prohibited and missing command options based on STIG guidelines.
> I normally extract the proctitle from the raw auditd data , but these commands
> are very long with sometimes 23 or more command line parameters ,  and I noticed
> that all of the auditd proctitle data for the lengthier commands is being cut off
> at 128 characters.

This limitation is intentional
( https://elixir.bootlin.com/linux/v6.6-rc2/source/kernel/auditsc.c#L81 ).

Since each argv[]/envp[] value passed to execve() can go up to 128KB
( https://elixir.bootlin.com/linux/v6.6-rc2/source/include/uapi/linux/binfmts.h#L15 )
and number of arguments is effectively unlimited
( https://elixir.bootlin.com/linux/v6.6-rc2/source/include/uapi/linux/binfmts.h#L16 ),
trying to audit full command line can exhaust storage.

> 
> I'm bringing this up  for two reasons:
> 
>      One,  not everyone working with this data may realize that there seems to be
>      a character limit,
>      and second, if this is by chance a bug as opposed to intentional,  then I'm
>      hoping we can get a fix cooking for it?
> 
> In the meantime,  I may be able to work around this by piecing together the full
> command from the "a#= "  fields, but it would be much easier if proctitle wasn't
> cut off after 128 chars.

If you can use an out-of-tree LSM, you can use execute_handler feature available in
TOMOYO and CaitSith, which replaces any execve() request with a specific execve()
request in order to allow userspace to examine and audit (and optionally sanitize)
full command line before executing the originally requested program.

https://tomoyo.osdn.jp/1.8/policy-specification/domain-policy-syntax.html.en#task_auto_execute_handler
https://en.osdn.net/projects/tomoyo/scm/svn/blobs/head/trunk/1.8.x/ccs-tools/examples/env_chk.c

If you think execute_handler feature is helpful for you, I can make a dedicated LSM
which implements only execute_handler feature.

> 
> Thanks, any info you can share would be much appreciated,
> 
> Karen Wieprecht

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

