Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A8AB7214D63
	for <lists+linux-audit@lfdr.de>; Sun,  5 Jul 2020 17:10:53 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-OMkR06F3MCSuV3rLr-jHfw-1; Sun, 05 Jul 2020 11:10:46 -0400
X-MC-Unique: OMkR06F3MCSuV3rLr-jHfw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32ECC185B386;
	Sun,  5 Jul 2020 15:10:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C4C32B3A61;
	Sun,  5 Jul 2020 15:10:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 18BC81809554;
	Sun,  5 Jul 2020 15:10:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 065FAHTe028053 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 5 Jul 2020 11:10:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 78FD52141812; Sun,  5 Jul 2020 15:10:17 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C97772156A4A
	for <linux-audit@redhat.com>; Sun,  5 Jul 2020 15:10:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99E761859177
	for <linux-audit@redhat.com>; Sun,  5 Jul 2020 15:10:16 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
	[209.85.218.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-289-ffb9AVfwPwm8tZ62Kz7D0w-1; Sun, 05 Jul 2020 11:10:12 -0400
X-MC-Unique: ffb9AVfwPwm8tZ62Kz7D0w-1
Received: by mail-ej1-f66.google.com with SMTP id rk21so39775374ejb.2
	for <linux-audit@redhat.com>; Sun, 05 Jul 2020 08:10:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eesGq1spu54ggqtQAUupSk7Lp+Mlv7/qhf/cclrycog=;
	b=dQqeP1Wq2Wkyil0lC9sbEvH/s8neubI7plDFc4pzl6+F8oFxNV4h5DJO2pv9q6++z7
	bDk8jZ3z+NI444fXY6gK9mLj0TaienrGex7/5LsVIDpv8FrlnxX40oJM2gjoP9gxCQRQ
	bZvunz7lpqDu/G/5hT+E1Yipn1Ku9AuLF+Qh6opqoITJ79UYK/R88G58SmFfcrnJoPhz
	CQCvQQhNc0PFEjAIQAUDxTEqpyrfWQ6DdXBlGGucSwJJ/9cOLaYrVmgxR1xiedfV8L/K
	qKqRDCbtWkic5+C9N7ED4a1KuIb1VctJAhMcIgjjHGWHgp9bkxONgVzfBP7jlYGH1VxR
	LWvQ==
X-Gm-Message-State: AOAM532flVZCIvdXWxX/eDnsk799gOXKHQOxiiI1hW92ZFJdgDF015Lo
	WZ/lyNpm3IfJT/8/Ii5KLqYeidvNS1SPTvPAxjL4
X-Google-Smtp-Source: ABdhPJy1E1Sw8Q5iWjt1KirrkFfpdSSt03aZwQ3uEENdmgYg7qspnLgZBziKDdWK7V2u1s7OqdWElZwK8p9Dttmc30Q=
X-Received: by 2002:a17:906:4757:: with SMTP id
	j23mr13638397ejs.431.1593961810932; 
	Sun, 05 Jul 2020 08:10:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593198710.git.rgb@redhat.com>
	<e5a1ab6955c565743372b392a93f7d1ac98478a2.1593198710.git.rgb@redhat.com>
In-Reply-To: <e5a1ab6955c565743372b392a93f7d1ac98478a2.1593198710.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 5 Jul 2020 11:09:59 -0400
Message-ID: <CAHC9VhSgcOS79spSuFDMukw2TnLZfBh2p4BWGfoV_CGUS8b77w@mail.gmail.com>
Subject: Re: [PATCH ghak90 V9 02/13] audit: add container id
To: Richard Guy Briggs <rgb@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jun 27, 2020 at 9:22 AM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> Implement the proc fs write to set the audit container identifier of a
> process, emitting an AUDIT_CONTAINER_OP record to document the event.
>
> This is a write from the container orchestrator task to a proc entry of
> the form /proc/PID/audit_containerid where PID is the process ID of the
> newly created task that is to become the first task in a container, or
> an additional task added to a container.
>
> The write expects up to a u64 value (unset: 18446744073709551615).
>
> The writer must have capability CAP_AUDIT_CONTROL.
>
> This will produce a record such as this:
>   type=CONTAINER_OP msg=audit(2018-06-06 12:39:29.636:26949) : op=set opid=2209 contid=123456 old-contid=18446744073709551615
>
> The "op" field indicates an initial set.  The "opid" field is the
> object's PID, the process being "contained".  New and old audit
> container identifier values are given in the "contid" fields.
>
> It is not permitted to unset the audit container identifier.
> A child inherits its parent's audit container identifier.
>
> Store the audit container identifier in a refcounted kernel object that
> is added to the master list of audit container identifiers.  This will
> allow multiple container orchestrators/engines to work on the same
> machine without danger of inadvertantly re-using an existing identifier.
> It will also allow an orchestrator to inject a process into an existing
> container by checking if the original container owner is the one
> injecting the task.  A hash table list is used to optimize searches.
>
> Please see the github audit kernel issue for the main feature:
>   https://github.com/linux-audit/audit-kernel/issues/90
> Please see the github audit userspace issue for supporting additions:
>   https://github.com/linux-audit/audit-userspace/issues/51
> Please see the github audit testsuiite issue for the test case:
>   https://github.com/linux-audit/audit-testsuite/issues/64
> Please see the github audit wiki for the feature overview:
>   https://github.com/linux-audit/audit-kernel/wiki/RFE-Audit-Container-ID
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> Acked-by: Serge Hallyn <serge@hallyn.com>
> Acked-by: Steve Grubb <sgrubb@redhat.com>
> Acked-by: Neil Horman <nhorman@tuxdriver.com>
> Reviewed-by: Ondrej Mosnacek <omosnace@redhat.com>
> ---
>  fs/proc/base.c             |  36 +++++++++++
>  include/linux/audit.h      |  33 ++++++++++
>  include/uapi/linux/audit.h |   2 +
>  kernel/audit.c             | 148 +++++++++++++++++++++++++++++++++++++++++++++
>  kernel/audit.h             |   8 +++
>  5 files changed, 227 insertions(+)

...

> diff --git a/include/linux/audit.h b/include/linux/audit.h
> index c2150415f9df..2800d4f1a2a8 100644
> --- a/include/linux/audit.h
> +++ b/include/linux/audit.h
> @@ -692,6 +715,16 @@ static inline bool audit_loginuid_set(struct task_struct *tsk)
>         return uid_valid(audit_get_loginuid(tsk));
>  }
>
> +static inline bool audit_contid_valid(u64 contid)
> +{
> +       return contid != AUDIT_CID_UNSET;
> +}
> +
> +static inline bool audit_contid_set(struct task_struct *tsk)
> +{
> +       return audit_contid_valid(audit_get_contid(tsk));
> +}

This is quasi-nitpicky, but it seems like audit_contid_valid() and
audit_contid_set() should be moved to kernel/audit.h if possible
(possibly even kernel/audit.c).  Maybe I'll see something later in the
patchset, but right now I'm struggling to think of why anyone outside
of audit would need to call these functions.

> diff --git a/kernel/audit.c b/kernel/audit.c
> index 5d8147a29291..6d387793f702 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -138,6 +138,13 @@ struct auditd_connection {
>
>  /* Hash for inode-based rules */
>  struct list_head audit_inode_hash[AUDIT_INODE_BUCKETS];
> +/* Hash for contid object lists */
> +struct list_head audit_contid_hash[AUDIT_CONTID_BUCKETS];
> +/* Lock all additions and deletions to the contid hash lists, assignment
> + * of container objects to tasks.  There should be no need for
> + * interaction with tasklist_lock
> + */
> +static DEFINE_SPINLOCK(audit_contobj_list_lock);
>
>  static struct kmem_cache *audit_buffer_cache;
>
> @@ -212,6 +219,33 @@ void __init audit_task_init(void)
>                                              0, SLAB_PANIC, NULL);
>  }
>
> +/* rcu_read_lock must be held by caller unless new */
> +static struct audit_contobj *_audit_contobj_hold(struct audit_contobj *cont)
> +{
> +       if (cont)
> +               refcount_inc(&cont->refcount);
> +       return cont;
> +}
> +
> +static struct audit_contobj *_audit_contobj_get(struct task_struct *tsk)
> +{
> +       if (!tsk->audit)
> +               return NULL;
> +       return _audit_contobj_hold(tsk->audit->cont);
> +}
> +
> +/* rcu_read_lock must be held by caller */
> +static void _audit_contobj_put(struct audit_contobj *cont)
> +{
> +       if (!cont)
> +               return;
> +       if (refcount_dec_and_test(&cont->refcount)) {
> +               put_task_struct(cont->owner);
> +               list_del_rcu(&cont->list);

You should check your locking; I'm used to seeing exclusive locks
(e.g. the spinlock) around list adds/removes, it just reads/traversals
that can be done with just the RCU lock held.

> +               kfree_rcu(cont, rcu);
> +       }
> +}

Another nitpick, but it might be nice to have similar arguments to the
_get() and _put() functions, e.g. struct audit_contobj, but that is
some serious bikeshedding (basically rename _hold() to _get() and
rename _hold to audit_task_contid_hold() or similar).

>  /**
>   * audit_alloc - allocate an audit info block for a task
>   * @tsk: task
> @@ -232,6 +266,9 @@ int audit_alloc(struct task_struct *tsk)
>         }
>         info->loginuid = audit_get_loginuid(current);
>         info->sessionid = audit_get_sessionid(current);
> +       rcu_read_lock();
> +       info->cont = _audit_contobj_get(current);
> +       rcu_read_unlock();

The RCU locks aren't strictly necessary here, are they?  In fact I
suppose we could probably just replace the _get() call with a
refcount_set(1) just as we do in audit_set_contid(), yes?

>         tsk->audit = info;
>
>         ret = audit_alloc_syscall(tsk);
> @@ -246,6 +283,7 @@ int audit_alloc(struct task_struct *tsk)
>  struct audit_task_info init_struct_audit = {
>         .loginuid = INVALID_UID,
>         .sessionid = AUDIT_SID_UNSET,
> +       .cont = NULL,
>  #ifdef CONFIG_AUDITSYSCALL
>         .ctx = NULL,
>  #endif
> @@ -262,6 +300,9 @@ void audit_free(struct task_struct *tsk)
>         struct audit_task_info *info = tsk->audit;
>
>         audit_free_syscall(tsk);
> +       rcu_read_lock();
> +       _audit_contobj_put(tsk->audit->cont);
> +       rcu_read_unlock();
>         /* Freeing the audit_task_info struct must be performed after
>          * audit_log_exit() due to need for loginuid and sessionid.
>          */
> @@ -1709,6 +1750,9 @@ static int __init audit_init(void)
>         for (i = 0; i < AUDIT_INODE_BUCKETS; i++)
>                 INIT_LIST_HEAD(&audit_inode_hash[i]);
>
> +       for (i = 0; i < AUDIT_CONTID_BUCKETS; i++)
> +               INIT_LIST_HEAD(&audit_contid_hash[i]);
> +
>         mutex_init(&audit_cmd_mutex.lock);
>         audit_cmd_mutex.owner = NULL;
>
> @@ -2410,6 +2454,110 @@ int audit_signal_info(int sig, struct task_struct *t)
>         return audit_signal_info_syscall(t);
>  }
>
> +/*
> + * audit_set_contid - set current task's audit contid
> + * @task: target task
> + * @contid: contid value
> + *
> + * Returns 0 on success, -EPERM on permission failure.
> + *
> + * If the original container owner goes away, no task injection is
> + * possible to an existing container.
> + *
> + * Called (set) from fs/proc/base.c::proc_contid_write().
> + */
> +int audit_set_contid(struct task_struct *task, u64 contid)
> +{
> +       int rc = 0;
> +       struct audit_buffer *ab;
> +       struct audit_contobj *oldcont = NULL;
> +
> +       task_lock(task);
> +       /* Can't set if audit disabled */
> +       if (!task->audit) {
> +               task_unlock(task);
> +               return -ENOPROTOOPT;
> +       }

See my question/comment in patch 1/13; this check may not be needed or
it may need to be changed to something other than "!task->audit".

> +       read_lock(&tasklist_lock);
> +       /* Don't allow the contid to be unset */
> +       if (!audit_contid_valid(contid)) {
> +               rc = -EINVAL;
> +               goto unlock;
> +       }
> +       /* if we don't have caps, reject */
> +       if (!capable(CAP_AUDIT_CONTROL)) {
> +               rc = -EPERM;
> +               goto unlock;
> +       }
> +       /* if task has children or is not single-threaded, deny */
> +       if (!list_empty(&task->children) ||
> +           !(thread_group_leader(task) && thread_group_empty(task))) {
> +               rc = -EBUSY;
> +               goto unlock;
> +       }
> +       /* if contid is already set, deny */
> +       if (audit_contid_set(task))
> +               rc = -EEXIST;
> +unlock:

Can we move the "unlock" target to the end of the function where it
just handles the unlocking and returns an error, including the
AUDIT_CONTAINER_OP record if necessary?  From what I can see we only
jump to "unlock" in case of error where we are not going to set the
audit container ID, yet the "unlock" target is placed in a misleading
location in the middle of the function.  It may be that everything
works correctly, but I would argue this is a bad practice that
increases the likelihood of buggy behavior in future code changes.

If you can't find way to arrange the code nicely, just duplicate the
"tasklist_lock" unlock operation in the error handlers before jumping
down to the end of the function.  It isn't perfect, but I believe it
will be a lot less fragile than the current approach.


> +       read_unlock(&tasklist_lock);
> +       rcu_read_lock();
> +       oldcont = _audit_contobj_get(task);
> +       if (!rc) {
> +               struct audit_contobj *cont = NULL, *newcont = NULL;
> +               int h = audit_hash_contid(contid);
> +
> +               spin_lock(&audit_contobj_list_lock);
> +               list_for_each_entry_rcu(cont, &audit_contid_hash[h], list)
> +                       if (cont->id == contid) {
> +                               /* task injection to existing container */
> +                               if (current == cont->owner) {
> +                                       _audit_contobj_hold(cont);
> +                                       newcont = cont;
> +                               } else {
> +                                       rc = -ENOTUNIQ;
> +                                       spin_unlock(&audit_contobj_list_lock);
> +                                       goto conterror;
> +                               }
> +                               break;
> +                       }
> +               if (!newcont) {
> +                       newcont = kmalloc(sizeof(*newcont), GFP_ATOMIC);
> +                       if (newcont) {
> +                               INIT_LIST_HEAD(&newcont->list);
> +                               newcont->id = contid;
> +                               newcont->owner = get_task_struct(current);
> +                               refcount_set(&newcont->refcount, 1);
> +                               list_add_rcu(&newcont->list,
> +                                            &audit_contid_hash[h]);
> +                       } else {
> +                               rc = -ENOMEM;
> +                               spin_unlock(&audit_contobj_list_lock);
> +                               goto conterror;
> +                       }
> +               }
> +               spin_unlock(&audit_contobj_list_lock);
> +               task->audit->cont = newcont;
> +               _audit_contobj_put(oldcont);
> +       }
> +conterror:
> +       task_unlock(task);
> +
> +       if (!audit_enabled)
> +               return rc;
> +
> +       ab = audit_log_start(audit_context(), GFP_KERNEL, AUDIT_CONTAINER_OP);
> +       if (!ab)
> +               return rc;
> +
> +       audit_log_format(ab,
> +                        "op=set opid=%d contid=%llu old-contid=%llu",
> +                        task_tgid_nr(task), contid, oldcont ? oldcont->id : -1);
> +       _audit_contobj_put(oldcont);
> +       rcu_read_unlock();
> +       audit_log_end(ab);
> +       return rc;
> +}

--
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

