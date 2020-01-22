Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id D86BD145DE0
	for <lists+linux-audit@lfdr.de>; Wed, 22 Jan 2020 22:28:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579728526;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=b/pajJMLil8NFllVZYRPVjdmcpBHo+qCKIqg7btXWJ8=;
	b=ZqJpHKFtvA1wGezra09a/hTDinh1VPNm9IgGmv/5bdMgZRW+oDHR5tQnHf/Jiy1+4bkFFG
	1WE3NmvJUe3Esc8Yd4zDI7TzYDBQlCAnyZ1k2UQDa1ArHUE59UdgcBM4ayS1t/DgRcENPg
	HxLCsYDT0y0VF+HX/3dNnngTXHfmHW4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-xEhvZ-gEP1-ERAPoVBFu7w-1; Wed, 22 Jan 2020 16:28:44 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8DEB8017CC;
	Wed, 22 Jan 2020 21:28:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 340FA845A5;
	Wed, 22 Jan 2020 21:28:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C0A1B870B4;
	Wed, 22 Jan 2020 21:28:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00MLSXLt003495 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 22 Jan 2020 16:28:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D4AED2026D67; Wed, 22 Jan 2020 21:28:33 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CFC692037E43
	for <linux-audit@redhat.com>; Wed, 22 Jan 2020 21:28:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FDFF1800F29
	for <linux-audit@redhat.com>; Wed, 22 Jan 2020 21:28:31 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-104-lPUyRBuJO8aFzGk48iFy9A-1; Wed, 22 Jan 2020 16:28:28 -0500
Received: by mail-lj1-f196.google.com with SMTP id q8so678169ljj.11
	for <linux-audit@redhat.com>; Wed, 22 Jan 2020 13:28:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yryeoDudvvVBVjLIWUT7Qspa9cODolKNnOJTJo0W59s=;
	b=MBzOs8TG36f5GdwLKjUJ9UvdHBowsu99DqqYP1r76yEHT7D1/oBWS8iBbHP+bLm4PP
	YLKU5BHKqeBsCjCuGM93ddt0eZ1dRFV9Y2Y3glmYMOvtp1YmBtM6C6oIC6evMx2G+Bu1
	hYpeE8Q85hzrMMczbYci+rwPokbPMLqlwgOMqk0waDh5lHfddCvD21GUTIjMJDiCthvI
	BSxbDwpa5drUnlVII3/jr95h5IlgupVGq2HfDM7g8WrWOb93ug/ieycO8Ups396RSqLL
	RI4Ieq9yfEoWnYrmCtnSjk36G9oVK45GBrLfkt70ay/oHXF7pc6xm03d2d05aXpOjfPQ
	t2iw==
X-Gm-Message-State: APjAAAUDU92umD1W3aWFOB3IjTea4j/VblZGFeRD3OABUih1vuTLsoTI
	/r0VUYN/vJI00QYfnXCvsQGQ/FRct+GLZsfeytnQ
X-Google-Smtp-Source: APXvYqytpK2WymEiSfK8I2a6UuKsyuVHMmGosxklKTzxBk+yqkYU0o/zTyXD7HwnnsZGXSRkCPgx2ifkK/nPI1GIE80=
X-Received: by 2002:a2e:5357:: with SMTP id t23mr21084406ljd.227.1579728507143;
	Wed, 22 Jan 2020 13:28:27 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577736799.git.rgb@redhat.com>
	<a911acf0b209c05dc156fb6b57f9da45778747ce.1577736799.git.rgb@redhat.com>
In-Reply-To: <a911acf0b209c05dc156fb6b57f9da45778747ce.1577736799.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 22 Jan 2020 16:28:16 -0500
Message-ID: <CAHC9VhRRW2fFcgBs-R_BZ7ZWCP5wsXA9DB1RUM=QeKj2xZkS2Q@mail.gmail.com>
Subject: Re: [PATCH ghak90 V8 04/16] audit: convert to contid list to check
	for orch/engine ownership
To: Richard Guy Briggs <rgb@redhat.com>
X-MC-Unique: lPUyRBuJO8aFzGk48iFy9A-1
X-MC-Unique: xEhvZ-gEP1-ERAPoVBFu7w-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00MLSXLt003495
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 31, 2019 at 2:50 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> Store the audit container identifier in a refcounted kernel object that
> is added to the master list of audit container identifiers.  This will
> allow multiple container orchestrators/engines to work on the same
> machine without danger of inadvertantly re-using an existing identifier.
> It will also allow an orchestrator to inject a process into an existing
> container by checking if the original container owner is the one
> injecting the task.  A hash table list is used to optimize searches.
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  include/linux/audit.h | 14 ++++++--
>  kernel/audit.c        | 98 ++++++++++++++++++++++++++++++++++++++++++++++++---
>  kernel/audit.h        |  8 +++++
>  3 files changed, 112 insertions(+), 8 deletions(-)

...

> diff --git a/include/linux/audit.h b/include/linux/audit.h
> index a045b34ecf44..0e6dbe943ae4 100644
> --- a/include/linux/audit.h
> +++ b/include/linux/audit.h
> @@ -94,10 +94,18 @@ struct audit_ntp_data {
>  struct audit_ntp_data {};
>  #endif
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
> -       u64                     contid;
> +       struct audit_contobj    *cont;
>  #ifdef CONFIG_AUDITSYSCALL
>         struct audit_context    *ctx;
>  #endif
> @@ -203,9 +211,9 @@ static inline unsigned int audit_get_sessionid(struct task_struct *tsk)
>
>  static inline u64 audit_get_contid(struct task_struct *tsk)
>  {
> -       if (!tsk->audit)
> +       if (!tsk->audit || !tsk->audit->cont)
>                 return AUDIT_CID_UNSET;
> -       return tsk->audit->contid;
> +       return tsk->audit->cont->id;
>  }
>
>  extern u32 audit_enabled;
> diff --git a/kernel/audit.c b/kernel/audit.c
> index 2d7707426b7d..4bab20f5f781 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -212,6 +218,31 @@ void __init audit_task_init(void)
>                                              0, SLAB_PANIC, NULL);
>  }
>
> +static struct audit_contobj *_audit_contobj(struct task_struct *tsk)
> +{
> +       if (!tsk->audit)
> +               return NULL;
> +       return tsk->audit->cont;

It seems like it would be safer to grab a reference here (e.g.
_audit_contobj_hold(...)), yes?  Or are you confident we will never
have tsk go away while the caller is holding on to the returned audit
container ID object?

> +}
> +
> +/* audit_contobj_list_lock must be held by caller unless new */
> +static void _audit_contobj_hold(struct audit_contobj *cont)
> +{
> +       refcount_inc(&cont->refcount);
> +}

If we are going to call the matching decrement function "_put" it
seems like we might want to call the function about "_get".  Further,
we can also have it return an audit_contobj pointer in case the caller
needs to do an assignment as well (which seems typical if you need to
bump the refcount):

  _audit_contobj_get(audit_contobj *cont)
  {
    if (cont)
      refcount_inc(cont);
    return cont;
  }

> +/* audit_contobj_list_lock must be held by caller */
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
> @@ -232,7 +263,11 @@ int audit_alloc(struct task_struct *tsk)
>         }
>         info->loginuid = audit_get_loginuid(current);
>         info->sessionid = audit_get_sessionid(current);
> -       info->contid = audit_get_contid(current);
> +       spin_lock(&audit_contobj_list_lock);
> +       info->cont = _audit_contobj(current);
> +       if (info->cont)
> +               _audit_contobj_hold(info->cont);
> +       spin_unlock(&audit_contobj_list_lock);

If we are taking a spinlock in order to bump the refcount, does it
really need to be a refcount_t or can we just use a normal integer?
In RCU protected lists a spinlock is usually used to protect
adds/removes to the list, not the content of individual list items.

My guess is you probably want to use the spinlock as described above
(list add/remove protection) and manipulate the refcount_t inside a
RCU read lock protected region.

>         tsk->audit = info;
>
>         ret = audit_alloc_syscall(tsk);
> @@ -267,6 +302,9 @@ void audit_free(struct task_struct *tsk)
>         /* Freeing the audit_task_info struct must be performed after
>          * audit_log_exit() due to need for loginuid and sessionid.
>          */
> +       spin_lock(&audit_contobj_list_lock);
> +       _audit_contobj_put(tsk->audit->cont);
> +       spin_unlock(&audit_contobj_list_lock);

This is another case of refcount_t vs normal integer in a spinlock
protected region.

>         info = tsk->audit;
>         tsk->audit = NULL;
>         kmem_cache_free(audit_task_cache, info);
> @@ -2365,6 +2406,9 @@ int audit_signal_info(int sig, struct task_struct *t)
>   *
>   * Returns 0 on success, -EPERM on permission failure.
>   *
> + * If the original container owner goes away, no task injection is
> + * possible to an existing container.
> + *
>   * Called (set) from fs/proc/base.c::proc_contid_write().
>   */
>  int audit_set_contid(struct task_struct *task, u64 contid)
> @@ -2381,9 +2425,12 @@ int audit_set_contid(struct task_struct *task, u64 contid)
>         }
>         oldcontid = audit_get_contid(task);
>         read_lock(&tasklist_lock);
> -       /* Don't allow the audit containerid to be unset */
> +       /* Don't allow the contid to be unset */
>         if (!audit_contid_valid(contid))
>                 rc = -EINVAL;
> +       /* Don't allow the contid to be set to the same value again */
> +       else if (contid == oldcontid) {
> +               rc = -EADDRINUSE;

First, is that brace a typo?  It looks like it.  Did this compile?

Second, can you explain why (re)setting the audit container ID to the
same value is something we need to prohibit?  I'm guessing it has
something to do with explicitly set vs inherited, but I don't want to
assume too much about your thinking behind this.

If it is "set vs inherited", would allowing an orchestrator to
explicitly "set" an inherited audit container ID provide some level or
protection against moving the task?

>         /* if we don't have caps, reject */
>         else if (!capable(CAP_AUDIT_CONTROL))
>                 rc = -EPERM;
> @@ -2396,8 +2443,49 @@ int audit_set_contid(struct task_struct *task, u64 contid)
>         else if (audit_contid_set(task))
>                 rc = -ECHILD;
>         read_unlock(&tasklist_lock);
> -       if (!rc)
> -               task->audit->contid = contid;
> +       if (!rc) {
> +               struct audit_contobj *oldcont = _audit_contobj(task);
> +               struct audit_contobj *cont = NULL, *newcont = NULL;
> +               int h = audit_hash_contid(contid);
> +
> +               rcu_read_lock();
> +               list_for_each_entry_rcu(cont, &audit_contid_hash[h], list)
> +                       if (cont->id == contid) {
> +                               /* task injection to existing container */
> +                               if (current == cont->owner) {

Do we have any protection against the task pointed to by cont->owner
going away and a new task with the same current pointer value (no
longer the legitimate audit container ID owner) manipulating the
target task's audit container ID?

> +                                       spin_lock(&audit_contobj_list_lock);
> +                                       _audit_contobj_hold(cont);
> +                                       spin_unlock(&audit_contobj_list_lock);

More of the recount_t vs integer/spinlock question.

> +                                       newcont = cont;
> +                               } else {
> +                                       rc = -ENOTUNIQ;
> +                                       goto conterror;
> +                               }
> +                               break;
> +                       }
> +               if (!newcont) {
> +                       newcont = kmalloc(sizeof(*newcont), GFP_ATOMIC);
> +                       if (newcont) {
> +                               INIT_LIST_HEAD(&newcont->list);
> +                               newcont->id = contid;
> +                               get_task_struct(current);
> +                               newcont->owner = current;

newcont->owner = get_task_struct(current);

(This is what I was talking about above with returning the struct
pointer in the _get/_hold function)

> +                               refcount_set(&newcont->refcount, 1);
> +                               spin_lock(&audit_contobj_list_lock);
> +                               list_add_rcu(&newcont->list, &audit_contid_hash[h]);
> +                               spin_unlock(&audit_contobj_list_lock);

I think we might have a problem where multiple tasks could race adding
the same audit container ID and since there is no check inside the
spinlock protected region we could end up adding multiple instances of
the same audit container ID, yes?

> +                       } else {
> +                               rc = -ENOMEM;
> +                               goto conterror;
> +                       }
> +               }
> +               task->audit->cont = newcont;
> +               spin_lock(&audit_contobj_list_lock);
> +               _audit_contobj_put(oldcont);
> +               spin_unlock(&audit_contobj_list_lock);

More of the refcount_t/integer/spinlock question.


> +conterror:
> +               rcu_read_unlock();
> +       }
>         task_unlock(task);
>
>         if (!audit_enabled)

--
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

