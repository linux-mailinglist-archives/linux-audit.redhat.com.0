Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id F1650214619
	for <lists+linux-audit@lfdr.de>; Sat,  4 Jul 2020 15:29:52 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-zGz_vUroPAqq1kOQypzbaw-1; Sat, 04 Jul 2020 09:29:49 -0400
X-MC-Unique: zGz_vUroPAqq1kOQypzbaw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B774D800401;
	Sat,  4 Jul 2020 13:29:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E1661A921;
	Sat,  4 Jul 2020 13:29:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D715F6C9D3;
	Sat,  4 Jul 2020 13:29:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 064DTJQx031918 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 4 Jul 2020 09:29:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1BDA620316D6; Sat,  4 Jul 2020 13:29:19 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0984920316D5
	for <linux-audit@redhat.com>; Sat,  4 Jul 2020 13:29:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A8168EF3A7
	for <linux-audit@redhat.com>; Sat,  4 Jul 2020 13:29:16 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-181-j9h-bkgqOkGWYnMFPv4CuA-1; Sat, 04 Jul 2020 09:29:13 -0400
X-MC-Unique: j9h-bkgqOkGWYnMFPv4CuA-1
Received: by mail-ed1-f68.google.com with SMTP id h28so30307560edz.0
	for <linux-audit@redhat.com>; Sat, 04 Jul 2020 06:29:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8IRJl7J7RNznaeWdhi2pz+TO0Qae9LLFxbo2SwQ1/yU=;
	b=UJcaiDksxdAG70h75G2Aq+O8FZEdJ7wZ2WvldBcmZlBTEPk1n2WvkiNCVOYR4Wh9VK
	JPJWaCaFpBNOC8EKwybKeOWx44CXuENfRVgyl8JCmHzXShtrCb0VPXybjauhHjUTcBSe
	wPVRXA+0sjGLrfLKh/1IoUU1m8nEqM0PmLAjc4JvKg07CTbqKZVP9vu4WuXwRNWvlK1y
	vCw6BYk8rTLR7di1/ijp6IULbSN1cvcsOKEnDmY2NT5yvGAiGRU7u01G+bIqaB84V4Yc
	+hVsd1wr9808cyy+AujwKUj3jJu4IBsj9/ji/LN/h44iIrnBEGTitx6GptjBh4JODkLN
	ZX2Q==
X-Gm-Message-State: AOAM530D5I6OLMVrZPm/o3PfEBWP8sPexW6Qf1jSJDGIe5DQljdqttl/
	cZtggVzAxHNOIL1OfiDXRHnh3LtdO57YJl1FWN3e
X-Google-Smtp-Source: ABdhPJx94SMJzFxdRPe8MFmpQPE6GdQuK/fWkpI5heYGNo1aaq14PzbQzgKLgznv10JgFp8bt4kwdsVe3sCwAuBceac=
X-Received: by 2002:a05:6402:1d89:: with SMTP id
	dk9mr34213847edb.31.1593869352317; 
	Sat, 04 Jul 2020 06:29:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593198710.git.rgb@redhat.com>
	<e5a1ab6955c565743372b392a93f7d1ac98478a2.1593198710.git.rgb@redhat.com>
In-Reply-To: <e5a1ab6955c565743372b392a93f7d1ac98478a2.1593198710.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sat, 4 Jul 2020 09:29:01 -0400
Message-ID: <CAHC9VhTcFrPDSmvBBXevo-atCnxy4WK2YQ0WOeg4M1Sfz0qPgA@mail.gmail.com>
Subject: Re: [PATCH ghak90 V9 02/13] audit: add container id
To: Richard Guy Briggs <rgb@redhat.com>
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
>
> diff --git a/fs/proc/base.c b/fs/proc/base.c
> index d86c0afc8a85..6c17ab32e71b 100644
> --- a/fs/proc/base.c
> +++ b/fs/proc/base.c
> @@ -1317,6 +1317,40 @@ static ssize_t proc_sessionid_read(struct file * file, char __user * buf,
>         .read           = proc_sessionid_read,
>         .llseek         = generic_file_llseek,
>  };
> +
> +static ssize_t proc_contid_write(struct file *file, const char __user *buf,
> +                                  size_t count, loff_t *ppos)
> +{
> +       struct inode *inode = file_inode(file);
> +       u64 contid;
> +       int rv;
> +       struct task_struct *task = get_proc_task(inode);
> +
> +       if (!task)
> +               return -ESRCH;
> +       if (*ppos != 0) {
> +               /* No partial writes. */
> +               put_task_struct(task);
> +               return -EINVAL;
> +       }
> +
> +       rv = kstrtou64_from_user(buf, count, 10, &contid);
> +       if (rv < 0) {
> +               put_task_struct(task);
> +               return rv;
> +       }
> +
> +       rv = audit_set_contid(task, contid);
> +       put_task_struct(task);
> +       if (rv < 0)
> +               return rv;
> +       return count;
> +}
> +
> +static const struct file_operations proc_contid_operations = {
> +       .write          = proc_contid_write,
> +       .llseek         = generic_file_llseek,
> +};
>  #endif
>
>  #ifdef CONFIG_FAULT_INJECTION
> @@ -3219,6 +3253,7 @@ static int proc_stack_depth(struct seq_file *m, struct pid_namespace *ns,
>  #ifdef CONFIG_AUDIT
>         REG("loginuid",   S_IWUSR|S_IRUGO, proc_loginuid_operations),
>         REG("sessionid",  S_IRUGO, proc_sessionid_operations),
> +       REG("audit_containerid", S_IWUSR, proc_contid_operations),
>  #endif
>  #ifdef CONFIG_FAULT_INJECTION
>         REG("make-it-fail", S_IRUGO|S_IWUSR, proc_fault_inject_operations),
> @@ -3558,6 +3593,7 @@ static int proc_tid_comm_permission(struct inode *inode, int mask)
>  #ifdef CONFIG_AUDIT
>         REG("loginuid",  S_IWUSR|S_IRUGO, proc_loginuid_operations),
>         REG("sessionid",  S_IRUGO, proc_sessionid_operations),
> +       REG("audit_containerid", S_IWUSR, proc_contid_operations),
>  #endif
>  #ifdef CONFIG_FAULT_INJECTION
>         REG("make-it-fail", S_IRUGO|S_IWUSR, proc_fault_inject_operations),
> diff --git a/include/linux/audit.h b/include/linux/audit.h
> index c2150415f9df..2800d4f1a2a8 100644
> --- a/include/linux/audit.h
> +++ b/include/linux/audit.h
> @@ -100,9 +100,18 @@ enum audit_nfcfgop {
>         AUDIT_XT_OP_UNREGISTER,
>  };
>
> +struct audit_contobj {
> +       struct list_head        list;
> +       u64                     id;
> +       struct task_struct      *owner;
> +       refcount_t              refcount;
> +       struct rcu_head         rcu;
> +};
> +
>  struct audit_task_info {
>         kuid_t                  loginuid;
>         unsigned int            sessionid;
> +       struct audit_contobj    *cont;
>  #ifdef CONFIG_AUDITSYSCALL
>         struct audit_context    *ctx;
>  #endif
> @@ -204,6 +213,15 @@ static inline unsigned int audit_get_sessionid(struct task_struct *tsk)
>         return tsk->audit->sessionid;
>  }
>
> +extern int audit_set_contid(struct task_struct *tsk, u64 contid);
> +
> +static inline u64 audit_get_contid(struct task_struct *tsk)
> +{
> +       if (!tsk->audit || !tsk->audit->cont)
> +               return AUDIT_CID_UNSET;
> +       return tsk->audit->cont->id;
> +}
> +
>  extern u32 audit_enabled;
>
>  extern int audit_signal_info(int sig, struct task_struct *t);
> @@ -268,6 +286,11 @@ static inline unsigned int audit_get_sessionid(struct task_struct *tsk)
>         return AUDIT_SID_UNSET;
>  }
>
> +static inline u64 audit_get_contid(struct task_struct *tsk)
> +{
> +       return AUDIT_CID_UNSET;
> +}
> +
>  #define audit_enabled AUDIT_OFF
>
>  static inline int audit_signal_info(int sig, struct task_struct *t)
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
> +
>  static inline void audit_log_string(struct audit_buffer *ab, const char *buf)
>  {
>         audit_log_n_string(ab, buf, strlen(buf));
> diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
> index 9b6a973f4cc3..859382527210 100644
> --- a/include/uapi/linux/audit.h
> +++ b/include/uapi/linux/audit.h
> @@ -71,6 +71,7 @@
>  #define AUDIT_TTY_SET          1017    /* Set TTY auditing status */
>  #define AUDIT_SET_FEATURE      1018    /* Turn an audit feature on or off */
>  #define AUDIT_GET_FEATURE      1019    /* Get which features are enabled */
> +#define AUDIT_CONTAINER_OP     1020    /* Define the container id and info */
>
>  #define AUDIT_FIRST_USER_MSG   1100    /* Userspace messages mostly uninteresting to kernel */
>  #define AUDIT_USER_AVC         1107    /* We filter this differently */
> @@ -491,6 +492,7 @@ struct audit_tty_status {
>
>  #define AUDIT_UID_UNSET (unsigned int)-1
>  #define AUDIT_SID_UNSET ((unsigned int)-1)
> +#define AUDIT_CID_UNSET ((u64)-1)
>
>  /* audit_rule_data supports filter rules with both integer and string
>   * fields.  It corresponds with AUDIT_ADD_RULE, AUDIT_DEL_RULE and
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
> +               kfree_rcu(cont, rcu);
> +       }
> +}
> +
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
> +
>  /**
>   * audit_log_end - end one audit record
>   * @ab: the audit_buffer
> diff --git a/kernel/audit.h b/kernel/audit.h
> index 9bee09757068..182fc76ea276 100644
> --- a/kernel/audit.h
> +++ b/kernel/audit.h
> @@ -210,6 +210,14 @@ static inline int audit_hash_ino(u32 ino)
>         return (ino & (AUDIT_INODE_BUCKETS-1));
>  }
>
> +#define AUDIT_CONTID_BUCKETS   32
> +extern struct list_head audit_contid_hash[AUDIT_CONTID_BUCKETS];
> +
> +static inline int audit_hash_contid(u64 contid)
> +{
> +       return (contid & (AUDIT_CONTID_BUCKETS-1));
> +}
> +
>  /* Indicates that audit should log the full pathname. */
>  #define AUDIT_NAME_FULL -1
>
> --
> 1.8.3.1
>


-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

