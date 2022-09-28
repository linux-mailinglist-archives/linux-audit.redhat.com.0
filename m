Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E403D5EE95F
	for <lists+linux-audit@lfdr.de>; Thu, 29 Sep 2022 00:32:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664404347;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cWBnGFzFffyOc31lcVSo9yMzPdhVJwgzlXE5XUORU/I=;
	b=LzyUBZv1NRxC+hI11adJuHuJCpwOX5cvDu+SPvZfgb1ZjDmiTpnw9L2Li561oXuqNDVjH3
	TIX968XNHG0AG5rlfyA4Ak6tjnHUj+Tp/tOn1uAILfZnIImJQco09eB45bjU53MV3T7iqy
	48oGuila1Df62KZ/GU/q0viBbRRT0wE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-442-9AZACbHhOvytdCts1uk5hQ-1; Wed, 28 Sep 2022 18:32:24 -0400
X-MC-Unique: 9AZACbHhOvytdCts1uk5hQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C309D1C0512B;
	Wed, 28 Sep 2022 22:32:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7847A40C6EC2;
	Wed, 28 Sep 2022 22:32:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4DBD51946A4C;
	Wed, 28 Sep 2022 22:32:12 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BF5B1194658F for <linux-audit@listman.corp.redhat.com>;
 Wed, 28 Sep 2022 22:03:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 40C6E1731B; Wed, 28 Sep 2022 22:03:23 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 37A1F7AE5
 for <linux-audit@redhat.com>; Wed, 28 Sep 2022 22:03:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1621E833941
 for <linux-audit@redhat.com>; Wed, 28 Sep 2022 22:03:23 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-157-gkvHhF0LN9iQ8Fb7ZEWmRg-1; Wed, 28 Sep 2022 18:03:20 -0400
X-MC-Unique: gkvHhF0LN9iQ8Fb7ZEWmRg-1
Received: by mail-oi1-f170.google.com with SMTP id v130so16949268oie.2
 for <linux-audit@redhat.com>; Wed, 28 Sep 2022 15:03:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=tmCcbs8t+TQBW8BCIw+S4lYW0IEH6zSrzGu/chcwJpI=;
 b=VSM3vM1QwU7W6eHbDmEl7GsZtsVTPvam9VsrAtWEIBumOP6jG/ORIYXdAGLDgj1wu5
 H8w45Q0hoGpUXds5Bc3lNw0TmD5eqBQRJ28EouM+PmqcQMp8Fi0UXHik96A8JIgn9YQX
 J6I/W2luWyYLi9e3quhCLMeFVrimMSWjamUus/y5SF0Xck0Gl6sC03bialLcWjJwtaqI
 WZ3U7wT1FHLfFHnBdRNdGWDVbpoFjxfOaHNQMHDbuFJhBkZNvWC834cldnSfPCMt18HN
 A8HnzCyUJkr7r6Wefewu3wUs6ypdloJNJnECuIUawNhJqgcEnb0tFgeecmK4m+fvCQyW
 NKPQ==
X-Gm-Message-State: ACrzQf1QONWHXvZu3cVjMOn0dBLOGsezGpdRojEr4aAR7CXbl/9unxcY
 QEtiIuLwhDwzmo9N3ikBacmoVZo8Otyz1t41oO61sRLTsQ==
X-Google-Smtp-Source: AMsMyM7yraCRKe46aRwmI9LtrdinymR7eUbk9FXRY518o7VvX+F9EPUgAsWp7aY4T3LbWqtLiDYplu5zlOe9jziyOnQ=
X-Received: by 2002:a05:6808:144b:b0:350:a06a:f8cb with SMTP id
 x11-20020a056808144b00b00350a06af8cbmr5507250oiv.51.1664402599405; Wed, 28
 Sep 2022 15:03:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220927225944.2254360-1-ankur.a.arora@oracle.com>
 <20220927225944.2254360-2-ankur.a.arora@oracle.com>
In-Reply-To: <20220927225944.2254360-2-ankur.a.arora@oracle.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 28 Sep 2022 18:03:08 -0400
Message-ID: <CAHC9VhRZzU5-+65AFOK826rA0xo-nbgRK_pP05Q_zjvAQvLnRw@mail.gmail.com>
Subject: Re: [PATCH 1/3] audit: cache ctx->major in audit_filter_syscall()
To: Ankur Arora <ankur.a.arora@oracle.com>
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
Cc: boris.ostrovsky@oracle.com, linux-audit@redhat.com,
 linux-kernel@vger.kernel.org, eparis@redhat.com, konrad.wilk@oracle.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Sep 27, 2022 at 6:59 PM Ankur Arora <ankur.a.arora@oracle.com> wrote:
>
> ctx->major contains the current syscall number. This is, of course, a
> constant for the duration of the syscall. Unfortunately, GCC's alias
> analysis cannot prove that it is not modified via a pointer in the
> audit_filter_syscall() loop, and so always loads it from memory.
>
> ...
>
> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
> ---
>  kernel/auditsc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

This looks pretty trivial to me, but it's too late in the current -rc
cycle for this to be merged, I'll queue it up for after the upcoming
merge window closes.  Thanks.

> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index 79a5da1bc5bb..533b087c3c02 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -843,13 +843,14 @@ static void audit_filter_syscall(struct task_struct *tsk,
>  {
>         struct audit_entry *e;
>         enum audit_state state;
> +       unsigned long major = ctx->major;
>
>         if (auditd_test_task(tsk))
>                 return;
>
>         rcu_read_lock();
>         list_for_each_entry_rcu(e, &audit_filter_list[AUDIT_FILTER_EXIT], list) {
> -               if (audit_in_mask(&e->rule, ctx->major) &&
> +               if (audit_in_mask(&e->rule, major) &&
>                     audit_filter_rules(tsk, &e->rule, ctx, NULL,
>                                        &state, false)) {
>                         rcu_read_unlock();
> --
> 2.31.1

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

