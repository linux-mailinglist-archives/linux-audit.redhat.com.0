Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4615E214D60
	for <lists+linux-audit@lfdr.de>; Sun,  5 Jul 2020 17:10:52 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-E11PafG3PVam4LJZ4tLtDA-1; Sun, 05 Jul 2020 11:10:46 -0400
X-MC-Unique: E11PafG3PVam4LJZ4tLtDA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 332C9185B3AD;
	Sun,  5 Jul 2020 15:10:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DFB855D9E7;
	Sun,  5 Jul 2020 15:10:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BF897180954D;
	Sun,  5 Jul 2020 15:10:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 065FAGVg028046 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 5 Jul 2020 11:10:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3C6A92156A54; Sun,  5 Jul 2020 15:10:16 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F28652156A4B
	for <linux-audit@redhat.com>; Sun,  5 Jul 2020 15:09:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 011E38EF3A5
	for <linux-audit@redhat.com>; Sun,  5 Jul 2020 15:09:59 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
	[209.85.218.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-37-cFG6hCjQMIG0Y1FKvNCy4Q-1; Sun, 05 Jul 2020 11:09:56 -0400
X-MC-Unique: cFG6hCjQMIG0Y1FKvNCy4Q-1
Received: by mail-ej1-f68.google.com with SMTP id ga4so39703441ejb.11
	for <linux-audit@redhat.com>; Sun, 05 Jul 2020 08:09:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+a+NkZk/z82sUmwa8lAR9nOo6EtZay2vAebfwkhsk6k=;
	b=fgR96aZeLNY89rZa+KXxVQ9CJnWXA9gqxOuV0MWh2DJ/3FLCWll9bzx+u7J71fq1Ui
	rdQxPKvvLZUQ4LziI14vdvlztqXLHPlZwDUZ4B3VWmZVbnfE3dQ4IhcSU9R67AXqZYA4
	kd4sg2nk+k+kQRpA3nl1DMEuRAZfJ5XVmHRxZHC0+Cg2Hj7S6vyddNZPWCAy/ENmGzpo
	OnU/tbmAqHb3z3tvk8UAdpdpHYjSgYB4y/I2Eal65XUvNaLQu0UNMXZRdGC64ACRAd21
	fFurIuV+RDcySqnc5j88we2JJGmkBT4YqnQqsw2TkzZ/dX233/AH8ihSHPUJF99bvUHm
	3DcQ==
X-Gm-Message-State: AOAM533U+lIW2WoJpNQCe2gx9Yj1s6UtdQSEIUuAzgG1WL5fvAzEdBNy
	hgyhrfMMDrlr1+zXdmJ82I40NbAssEazWz4V/IOo9TU=
X-Google-Smtp-Source: ABdhPJzoaJJDK0x6hHKY5IxkG2I5cD4JeTPSKb1HFyRKKxTq3fNryDZXuEZTaO6XoOjUl+x6NLfxACNsUd1JYOUwikw=
X-Received: by 2002:a17:906:7d86:: with SMTP id
	v6mr38973801ejo.542.1593961794741; 
	Sun, 05 Jul 2020 08:09:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593198710.git.rgb@redhat.com>
	<6abeb26e64489fc29b00c86b60b501c8b7316424.1593198710.git.rgb@redhat.com>
In-Reply-To: <6abeb26e64489fc29b00c86b60b501c8b7316424.1593198710.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 5 Jul 2020 11:09:43 -0400
Message-ID: <CAHC9VhTx=4879F1MSXg4=Xd1i5rhEtyam6CakQhy=_ZjGtTaMA@mail.gmail.com>
Subject: Re: [PATCH ghak90 V9 01/13] audit: collect audit task parameters
To: Richard Guy Briggs <rgb@redhat.com>
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jun 27, 2020 at 9:21 AM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> The audit-related parameters in struct task_struct should ideally be
> collected together and accessed through a standard audit API.
>
> Collect the existing loginuid, sessionid and audit_context together in a
> new struct audit_task_info called "audit" in struct task_struct.
>
> Use kmem_cache to manage this pool of memory.
> Un-inline audit_free() to be able to always recover that memory.
>
> Please see the upstream github issue
> https://github.com/linux-audit/audit-kernel/issues/81
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> Acked-by: Neil Horman <nhorman@tuxdriver.com>
> Reviewed-by: Ondrej Mosnacek <omosnace@redhat.com>
> ---
>  include/linux/audit.h | 49 +++++++++++++++++++++++------------
>  include/linux/sched.h |  7 +----
>  init/init_task.c      |  3 +--
>  init/main.c           |  2 ++
>  kernel/audit.c        | 71 +++++++++++++++++++++++++++++++++++++++++++++++++--
>  kernel/audit.h        |  5 ++++
>  kernel/auditsc.c      | 26 ++++++++++---------
>  kernel/fork.c         |  1 -
>  8 files changed, 124 insertions(+), 40 deletions(-)
>
> diff --git a/include/linux/audit.h b/include/linux/audit.h
> index 3fcd9ee49734..c2150415f9df 100644
> --- a/include/linux/audit.h
> +++ b/include/linux/audit.h
> @@ -100,6 +100,16 @@ enum audit_nfcfgop {
>         AUDIT_XT_OP_UNREGISTER,
>  };
>
> +struct audit_task_info {
> +       kuid_t                  loginuid;
> +       unsigned int            sessionid;
> +#ifdef CONFIG_AUDITSYSCALL
> +       struct audit_context    *ctx;
> +#endif
> +};
> +
> +extern struct audit_task_info init_struct_audit;
> +
>  extern int is_audit_feature_set(int which);
>
>  extern int __init audit_register_class(int class, unsigned *list);

...

> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index b62e6aaf28f0..2213ac670386 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -34,7 +34,6 @@
>  #include <linux/kcsan.h>
>
>  /* task_struct member predeclarations (sorted alphabetically): */
> -struct audit_context;
>  struct backing_dev_info;
>  struct bio_list;
>  struct blk_plug;
> @@ -946,11 +945,7 @@ struct task_struct {
>         struct callback_head            *task_works;
>
>  #ifdef CONFIG_AUDIT
> -#ifdef CONFIG_AUDITSYSCALL
> -       struct audit_context            *audit_context;
> -#endif
> -       kuid_t                          loginuid;
> -       unsigned int                    sessionid;
> +       struct audit_task_info          *audit;
>  #endif
>         struct seccomp                  seccomp;

In the early days of this patchset we talked a lot about how to handle
the task_struct and the changes that would be necessary, ultimately
deciding that encapsulating all of the audit fields into an
audit_task_info struct.  However, what is puzzling me a bit at this
moment is why we are only including audit_task_info in task_info by
reference *and* making it a build time conditional (via CONFIG_AUDIT).

If audit is enabled at build time it would seem that we are always
going to allocate an audit_task_info struct, so I have to wonder why
we don't simply embed it inside the task_info struct (similar to the
seccomp struct in the snippet above?  Of course the audit_context
struct needs to remain as is, I'm talking only about the
task_info/audit_task_info struct.

Richard, I'm sure you can answer this off the top of your head, but
I'd have to go digging through the archives to pull out the relevant
discussions so I figured I would just ask you for a reminder ... ?  I
imagine it's also possible things have changed a bit since those early
discussions and the solution we arrived at then no longer makes as
much sense as it did before.

> diff --git a/init/init_task.c b/init/init_task.c
> index 15089d15010a..92d34c4b7702 100644
> --- a/init/init_task.c
> +++ b/init/init_task.c
> @@ -130,8 +130,7 @@ struct task_struct init_task
>         .thread_group   = LIST_HEAD_INIT(init_task.thread_group),
>         .thread_node    = LIST_HEAD_INIT(init_signals.thread_head),
>  #ifdef CONFIG_AUDIT
> -       .loginuid       = INVALID_UID,
> -       .sessionid      = AUDIT_SID_UNSET,
> +       .audit          = &init_struct_audit,
>  #endif
>  #ifdef CONFIG_PERF_EVENTS
>         .perf_event_mutex = __MUTEX_INITIALIZER(init_task.perf_event_mutex),
> diff --git a/init/main.c b/init/main.c
> index 0ead83e86b5a..349470ad7458 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -96,6 +96,7 @@
>  #include <linux/jump_label.h>
>  #include <linux/mem_encrypt.h>
>  #include <linux/kcsan.h>
> +#include <linux/audit.h>
>
>  #include <asm/io.h>
>  #include <asm/bugs.h>
> @@ -1028,6 +1029,7 @@ asmlinkage __visible void __init start_kernel(void)
>         nsfs_init();
>         cpuset_init();
>         cgroup_init();
> +       audit_task_init();
>         taskstats_init_early();
>         delayacct_init();
>
> diff --git a/kernel/audit.c b/kernel/audit.c
> index 8c201f414226..5d8147a29291 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -203,6 +203,73 @@ struct audit_reply {
>         struct sk_buff *skb;
>  };
>
> +static struct kmem_cache *audit_task_cache;
> +
> +void __init audit_task_init(void)
> +{
> +       audit_task_cache = kmem_cache_create("audit_task",
> +                                            sizeof(struct audit_task_info),
> +                                            0, SLAB_PANIC, NULL);
> +}
> +
> +/**
> + * audit_alloc - allocate an audit info block for a task
> + * @tsk: task
> + *
> + * Call audit_alloc_syscall to filter on the task information and
> + * allocate a per-task audit context if necessary.  This is called from
> + * copy_process, so no lock is needed.
> + */
> +int audit_alloc(struct task_struct *tsk)
> +{
> +       int ret = 0;
> +       struct audit_task_info *info;
> +
> +       info = kmem_cache_alloc(audit_task_cache, GFP_KERNEL);
> +       if (!info) {
> +               ret = -ENOMEM;
> +               goto out;
> +       }
> +       info->loginuid = audit_get_loginuid(current);
> +       info->sessionid = audit_get_sessionid(current);
> +       tsk->audit = info;
> +
> +       ret = audit_alloc_syscall(tsk);
> +       if (ret) {
> +               tsk->audit = NULL;
> +               kmem_cache_free(audit_task_cache, info);
> +       }
> +out:
> +       return ret;
> +}

This is a big nitpick, and I'm only mentioning this in the case you
need to respin this patchset: the "out" label is unnecessary in the
function above.  Simply return the error code, there is no need to
jump to "out" only to immediately return the error code there and
nothing more.

> +struct audit_task_info init_struct_audit = {
> +       .loginuid = INVALID_UID,
> +       .sessionid = AUDIT_SID_UNSET,
> +#ifdef CONFIG_AUDITSYSCALL
> +       .ctx = NULL,
> +#endif
> +};
> +
> +/**
> + * audit_free - free per-task audit info
> + * @tsk: task whose audit info block to free
> + *
> + * Called from copy_process and do_exit
> + */
> +void audit_free(struct task_struct *tsk)
> +{
> +       struct audit_task_info *info = tsk->audit;
> +
> +       audit_free_syscall(tsk);
> +       /* Freeing the audit_task_info struct must be performed after
> +        * audit_log_exit() due to need for loginuid and sessionid.
> +        */
> +       info = tsk->audit;
> +       tsk->audit = NULL;
> +       kmem_cache_free(audit_task_cache, info);

Another nitpick, and this one may even become a moot point given the
question posed above.  However, is there any reason we couldn't get
rid of "info" and simplify this a bit?

  audit_free_syscall(tsk);
  kmem_cache_free(audit_task_cache, tsk->audit);
  tsk->audit = NULL;

> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index 468a23390457..f00c1da587ea 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -1612,7 +1615,6 @@ void __audit_free(struct task_struct *tsk)
>                 if (context->current_state == AUDIT_RECORD_CONTEXT)
>                         audit_log_exit();
>         }
> -
>         audit_set_context(tsk, NULL);
>         audit_free_context(context);
>  }

This nitpick is barely worth the time it is taking me to write this,
but the whitespace change above isn't strictly necessary.


--
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

