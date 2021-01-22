Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4D19F300932
	for <lists+linux-audit@lfdr.de>; Fri, 22 Jan 2021 18:03:42 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-t0U6lmpAP3W07cOYSQCiMQ-1; Fri, 22 Jan 2021 12:03:39 -0500
X-MC-Unique: t0U6lmpAP3W07cOYSQCiMQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 805E7190B2A2;
	Fri, 22 Jan 2021 17:03:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E8FDB19C59;
	Fri, 22 Jan 2021 17:03:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B4E65180954D;
	Fri, 22 Jan 2021 17:03:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10MH2qM8006828 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 22 Jan 2021 12:02:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8C3662166B33; Fri, 22 Jan 2021 17:02:52 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 862B12166B32
	for <linux-audit@redhat.com>; Fri, 22 Jan 2021 17:02:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C5B580391A
	for <linux-audit@redhat.com>; Fri, 22 Jan 2021 17:02:50 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
	[209.85.208.41]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-231-6z0ks28KPRStNinWj9NDRQ-1; Fri, 22 Jan 2021 12:02:48 -0500
X-MC-Unique: 6z0ks28KPRStNinWj9NDRQ-1
Received: by mail-ed1-f41.google.com with SMTP id g24so7325043edw.9
	for <linux-audit@redhat.com>; Fri, 22 Jan 2021 09:02:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ke/qn9TuTwdPR0BXfRRkVX3tOOEqzWWEt/5038rSsL8=;
	b=BhZQXaE7ZDqUcrugVRXy/+y6NEyAbWZLje9NBAdqnHeTNWhYLJTRAkjb+aQYFlmHTN
	0eZ0wpcPqi+q+xrJ6OHdaYSZXfgZJX5yiOvOiJAQjgTciAhZJ9MjVyMmOk3hffWlAdX3
	Mha7L9HXjDbuIy3EsmGjczvcwpmA1j5mMiqaj1Q5Kdy6fgl7j2ckSvuM+vU9zm7YRO0Z
	Soi2Gr54jWHmrkVDBIo7EPGRwOqCPwYLvxir03nygOeUQX2+6tagCNJwTGZLh9KI204Z
	C6vrs6I7cvnfGKErr2yiDnottJE2le5DH3zW7wKRSVCumXpsMUA4gO00zKrtQKb1pNIx
	Dvdw==
X-Gm-Message-State: AOAM530HJWhZY8uWsMOrDUaUElJ+0MWtgW63QWpHW7vkljd8Klfhi9lE
	CWcu/d08jDFophoIeC3hi8OUeXvJ7aOesTY/lyaS
X-Google-Smtp-Source: ABdhPJybDZzkx9A9kmPqgORexS85AdcYmlb17I2eS1sUIlOqyFmXdWgBdx1uneSguKJ/EwhMThDbPIiu+Bx0ORFpKeo=
X-Received: by 2002:a05:6402:4391:: with SMTP id
	o17mr3982066edc.196.1611334966855; 
	Fri, 22 Jan 2021 09:02:46 -0800 (PST)
MIME-Version: 1.0
References: <202101212154272626110@zte.com.cn>
In-Reply-To: <202101212154272626110@zte.com.cn>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 22 Jan 2021 12:02:35 -0500
Message-ID: <CAHC9VhQuBFv83G05QQJLuOV903sFX7ijqjgpCvWH-dk7cbJCjg@mail.gmail.com>
Subject: Re: [RFC, v2,
	1/1] audit: speed up syscall rule match while exiting syscall
To: yang.yang29@zte.com.cn
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com, linux-kernel@vger.kernel.org
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 21, 2021 at 8:54 AM <yang.yang29@zte.com.cn> wrote:
>
> From 72f3ecde58edb03d76cb359607fef98c1663d481 Mon Sep 17 00:00:00 2001
> From: Yang Yang <yang.yang29@zte.com.cn>
> Date: Thu, 21 Jan 2021 21:05:04 +0800
> Subject: [PATCH] [RFC,v2,1/1] speed up syscall rule match while exiting syscall
>  audit_filter_syscall() traverses struct list_head audit_filter_list to find
>  out whether current syscall match one rule. This takes o(n), which is not
>  necessary, specially for user who add a very few syscall rules. On the other
>  hand, user may not much care about rule add/delete speed. So do o(n)
>  calculate at rule changing, and ease the burden of audit_filter_syscall().
>
>  Define audit_syscall[NR_syscalls], every element stands for one syscall.
>  audit_filter_syscall() checks audit_syscall[NR_syscalls].
>  audit_syscall[n] == 0 indicates no rule audit syscall n, do a quick exit.
>  audit_syscall[n] > 0 indicates at least one rule audit syscall n.
>  audit_syscall[n] update when syscall rule changes.
>
> Signed-off-by: Yang Yang <yang.yang29@zte.com.cn>
> ---
>  include/linux/audit.h |  2 ++
>  kernel/audit.c        |  4 ++++
>  kernel/auditfilter.c  | 30 ++++++++++++++++++++++++++++++
>  kernel/auditsc.c      |  5 ++++-
>  4 files changed, 40 insertions(+), 1 deletion(-)

...

> diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
> index 333b3bc..9d3e703 100644
> --- a/kernel/auditfilter.c
> +++ b/kernel/auditfilter.c
> @@ -926,6 +926,28 @@ static struct audit_entry *audit_find_rule(struct audit_entry *entry,
>  static u64 prio_low = ~0ULL/2;
>  static u64 prio_high = ~0ULL/2 - 1;
>
> +#ifdef CONFIG_AUDITSYSCALL
> +static inline void update_auditing_syscall(struct audit_krule rule, bool add)
> +{
> +    int i;
> +
> +    /* syscall rule with type AUDIT_FILTER_EXIT */
> +    if (rule.listnr == AUDIT_FILTER_EXIT && !rule.watch && !rule.tree) {
> +        for (i = 0; i < NR_syscalls; i++) {
> +            /* whether this rule include one syscall */
> +            if (unlikely(audit_in_mask(&rule, i))) {
> +                if (add == true)
> +                    auditing_syscall[i]++;
> +                else
> +                    auditing_syscall[i]--;
> +            }
> +        }
> +    }
> +
> +    return;
> +}
> +#endif
> +
>  /* Add rule to given filterlist if not a duplicate. */
>  static inline int audit_add_rule(struct audit_entry *entry)
>  {
> @@ -957,6 +979,10 @@ static inline int audit_add_rule(struct audit_entry *entry)
>                 return err;
>         }
>
> +#ifdef CONFIG_AUDITSYSCALL
> +    update_auditing_syscall(entry->rule, true);
> +#endif

I'm going to reply to your other email where we are discussing the
performance of this patch, but I wanted to make one comment about the
approach you've taken with the update_auditing_syscall() here.

First, naming things is hard, but the chosen name is not a good one in
my opinion.  Something like audit_rule_syscall_mask_update() would
probably be a better fit.

Second, in order to minimize preprocessor clutter, it is better to use
the following pattern:

  #ifdef CONFIG_FOO
  int func(int arg)
  {
    /* important stuff */
  }
  #else
  int func(int arg)
  {
    return 0; /* appropriate return value */
  }
  #endif

There are probably a few other comments on this patch, but I want us
to discuss the performance impacts of this first as I'm not convinced
this is a solution we want upstream.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

