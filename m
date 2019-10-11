Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 343A6D3655
	for <lists+linux-audit@lfdr.de>; Fri, 11 Oct 2019 02:40:39 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 99BD859455;
	Fri, 11 Oct 2019 00:40:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 77DE36017E;
	Fri, 11 Oct 2019 00:40:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3AFDA4E58A;
	Fri, 11 Oct 2019 00:40:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9B0eX1I029086 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 10 Oct 2019 20:40:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A19C36017E; Fri, 11 Oct 2019 00:40:33 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C03C600C4
	for <linux-audit@redhat.com>; Fri, 11 Oct 2019 00:40:31 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2D82D7FDC9
	for <linux-audit@redhat.com>; Fri, 11 Oct 2019 00:40:30 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id r2so5721397lfn.8
	for <linux-audit@redhat.com>; Thu, 10 Oct 2019 17:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LCEP7qB3GzqBwKUjXrPpebibZKO1XQqLNLbhlrB2o3E=;
	b=Ode2StGqxHsnxHEGGTE3HLNMobXIF5IZ/OqxGpl8IF35NIz+jdNAY4QmhCTeZt7bzf
	RIouuQ5ZFY9iPPPH6W+K/p/hXGh4cgkT0H7toCQy7pVdb68g3Z4YUM9zznH9VgEl21VC
	XzFbi3oO9JsfFbBfkQV5GyaSud7A0V8C75pIKhGNO43vlfbqDiWVkDN78XfMVcsJxpkT
	uWX+QkjYEo6I8kcxtCgFJfmzpIeQoHkwHpG2iQnCFeHE6uu2dpDnWEIYBfJubRp3kgZ4
	MDFwyruRud7cN3h62qeSkmLZgf58oqDvxgGRlvkFbA3m2Wge2p8u4totjJ9iUBQVeSwQ
	iH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LCEP7qB3GzqBwKUjXrPpebibZKO1XQqLNLbhlrB2o3E=;
	b=CGciJNMeToiIWSgidniimOQ4I681hRQPSPLC9ncmib5+UKMysz2+qUaebs10ykJwDC
	82hRyKj7VPSix+y3XiRBhXc8fY4AP7F7kad9FYxBc68XOzPniwpcqzusNuX1RefUauwC
	EdIeXNxRCL/ZCtCxCqWK2yLpUaCp8OTHkkOqCPXQb39Q2gwkDFfjAq5UN/Dw/NBiJ0sP
	Nk/MjSUhofe8qUVeUFU1vXuflme9pZE0l2UwtE8NjI30FEpsufJasjhp39PsymUDNYM5
	db3cj2ssOjHihBmtMCPp0Pct8nMSRW5y0zm8G+MTE0M5Es1vl34LXoos+4ID3v8Q6B23
	BIaA==
X-Gm-Message-State: APjAAAXzhtXHuXrB5FDAZgntrwuK0GH9Lulr4gtPwKfYKho4lCKmEuBv
	Vm7Kvsu7ggJaM+25tWryseLZD947lyvGl53yXKbF
X-Google-Smtp-Source: APXvYqz16bFvgvk/JkcjSMw56nSPRPd44/zVDjOFHMxgu5aRVm+fbiLkj2RCNM3iXc/7qoqooc4/nPHxYsWCtiTm0X8=
X-Received: by 2002:ac2:428b:: with SMTP id m11mr7385787lfh.64.1570754428347; 
	Thu, 10 Oct 2019 17:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1568834524.git.rgb@redhat.com>
	<ff8a73c7841ef788c60f13f90d036b321af0e431.1568834524.git.rgb@redhat.com>
In-Reply-To: <ff8a73c7841ef788c60f13f90d036b321af0e431.1568834524.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 10 Oct 2019 20:40:17 -0400
Message-ID: <CAHC9VhRSpuNZTFvFmZ50M4bQS8raAJb_mX5qvnPWdPM71YqUwg@mail.gmail.com>
Subject: Re: [PATCH ghak90 V7 15/21] sched: pull task_is_descendant into
	kernel/sched/core.c
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 11 Oct 2019 00:40:30 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Fri, 11 Oct 2019 00:40:30 +0000 (UTC) for IP:'209.85.167.68'
	DOMAIN:'mail-lf1-f68.google.com' HELO:'mail-lf1-f68.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.167.68 mail-lf1-f68.google.com 209.85.167.68
	mail-lf1-f68.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, mpatel@redhat.com,
	Serge Hallyn <serge@hallyn.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Fri, 11 Oct 2019 00:40:38 +0000 (UTC)

On Wed, Sep 18, 2019 at 9:26 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> Since the task_is_descendant() function is used in YAMA and in audit,
> pull the function into kernel/core/sched.c
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  include/linux/sched.h    |  3 +++
>  kernel/audit.c           | 33 ---------------------------------
>  kernel/sched/core.c      | 33 +++++++++++++++++++++++++++++++++
>  security/yama/yama_lsm.c | 33 ---------------------------------
>  4 files changed, 36 insertions(+), 66 deletions(-)

I'm not really reviewing this as I'm still a little confused from
patch 14/21, but if 14/21 works out as correct this patch should be
squashed into that one.

> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index a936d162513a..b251f018f4db 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -1988,4 +1988,7 @@ static inline void rseq_syscall(struct pt_regs *regs)
>
>  const struct cpumask *sched_trace_rd_span(struct root_domain *rd);
>
> +extern int task_is_descendant(struct task_struct *parent,
> +                             struct task_struct *child);
> +
>  #endif
> diff --git a/kernel/audit.c b/kernel/audit.c
> index 69fe1e9af7cb..4fe7678304dd 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -2560,39 +2560,6 @@ static struct task_struct *audit_cont_owner(struct task_struct *tsk)
>  }
>
>  /*
> - * task_is_descendant - walk up a process family tree looking for a match
> - * @parent: the process to compare against while walking up from child
> - * @child: the process to start from while looking upwards for parent
> - *
> - * Returns 1 if child is a descendant of parent, 0 if not.
> - */
> -static int task_is_descendant(struct task_struct *parent,
> -                             struct task_struct *child)
> -{
> -       int rc = 0;
> -       struct task_struct *walker = child;
> -
> -       if (!parent || !child)
> -               return 0;
> -
> -       rcu_read_lock();
> -       if (!thread_group_leader(parent))
> -               parent = rcu_dereference(parent->group_leader);
> -       while (walker->pid > 0) {
> -               if (!thread_group_leader(walker))
> -                       walker = rcu_dereference(walker->group_leader);
> -               if (walker == parent) {
> -                       rc = 1;
> -                       break;
> -               }
> -               walker = rcu_dereference(walker->real_parent);
> -       }
> -       rcu_read_unlock();
> -
> -       return rc;
> -}
> -
> -/*
>   * audit_set_contid - set current task's audit contid
>   * @task: target task
>   * @contid: contid value
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 2b037f195473..7ba9e07381fa 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -7509,6 +7509,39 @@ void dump_cpu_task(int cpu)
>  }
>
>  /*
> + * task_is_descendant - walk up a process family tree looking for a match
> + * @parent: the process to compare against while walking up from child
> + * @child: the process to start from while looking upwards for parent
> + *
> + * Returns 1 if child is a descendant of parent, 0 if not.
> + */
> +int task_is_descendant(struct task_struct *parent,
> +                             struct task_struct *child)
> +{
> +       int rc = 0;
> +       struct task_struct *walker = child;
> +
> +       if (!parent || !child)
> +               return 0;
> +
> +       rcu_read_lock();
> +       if (!thread_group_leader(parent))
> +               parent = rcu_dereference(parent->group_leader);
> +       while (walker->pid > 0) {
> +               if (!thread_group_leader(walker))
> +                       walker = rcu_dereference(walker->group_leader);
> +               if (walker == parent) {
> +                       rc = 1;
> +                       break;
> +               }
> +               walker = rcu_dereference(walker->real_parent);
> +       }
> +       rcu_read_unlock();
> +
> +       return rc;
> +}
> +
> +/*
>   * Nice levels are multiplicative, with a gentle 10% change for every
>   * nice level changed. I.e. when a CPU-bound task goes from nice 0 to
>   * nice 1, it will get ~10% less CPU time than another CPU-bound task
> diff --git a/security/yama/yama_lsm.c b/security/yama/yama_lsm.c
> index 94dc346370b1..25eae205eae8 100644
> --- a/security/yama/yama_lsm.c
> +++ b/security/yama/yama_lsm.c
> @@ -263,39 +263,6 @@ static int yama_task_prctl(int option, unsigned long arg2, unsigned long arg3,
>  }
>
>  /**
> - * task_is_descendant - walk up a process family tree looking for a match
> - * @parent: the process to compare against while walking up from child
> - * @child: the process to start from while looking upwards for parent
> - *
> - * Returns 1 if child is a descendant of parent, 0 if not.
> - */
> -static int task_is_descendant(struct task_struct *parent,
> -                             struct task_struct *child)
> -{
> -       int rc = 0;
> -       struct task_struct *walker = child;
> -
> -       if (!parent || !child)
> -               return 0;
> -
> -       rcu_read_lock();
> -       if (!thread_group_leader(parent))
> -               parent = rcu_dereference(parent->group_leader);
> -       while (walker->pid > 0) {
> -               if (!thread_group_leader(walker))
> -                       walker = rcu_dereference(walker->group_leader);
> -               if (walker == parent) {
> -                       rc = 1;
> -                       break;
> -               }
> -               walker = rcu_dereference(walker->real_parent);
> -       }
> -       rcu_read_unlock();
> -
> -       return rc;
> -}
> -
> -/**
>   * ptracer_exception_found - tracer registered as exception for this tracee
>   * @tracer: the task_struct of the process attempting ptrace
>   * @tracee: the task_struct of the process to be ptraced

--
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
