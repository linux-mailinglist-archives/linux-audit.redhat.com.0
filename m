Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F887D364A
	for <lists+linux-audit@lfdr.de>; Fri, 11 Oct 2019 02:40:24 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B15C8307D88C;
	Fri, 11 Oct 2019 00:40:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AA815D772;
	Fri, 11 Oct 2019 00:40:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3FFF74E589;
	Fri, 11 Oct 2019 00:40:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9B0eJLq029006 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 10 Oct 2019 20:40:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 33FD45DC18; Fri, 11 Oct 2019 00:40:19 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx27.extmail.prod.ext.phx2.redhat.com
	[10.5.110.68])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F28D5DA8D
	for <linux-audit@redhat.com>; Fri, 11 Oct 2019 00:40:16 +0000 (UTC)
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D936888FFF7
	for <linux-audit@redhat.com>; Fri, 11 Oct 2019 00:40:15 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id r22so5746509lfm.1
	for <linux-audit@redhat.com>; Thu, 10 Oct 2019 17:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WruOl9m8rjj6B/eISV7ZrAuuDk2P1Av0bY+CVqaL58Q=;
	b=V4Xxbr0U3eWT6U16YQ3PdgJXfFSijS5xRPN5nuMN6zDdNiLlA8dHWQaXw0Yzr3J0GG
	jRh9YIrZ+DWce+KF5cgww4hLWK47rxojTThwR/zgSvMLAFygAJZkWRqj2iX38L3KwI8a
	8I1WdUsdx/j6CuBhFGYvw5LMxUP/iOf/nOVB405Wnz4NBTkrngUoYzEwv5G2EC8sUbzW
	8umuXVw1jEwxdYwwQY1tM0o6fLNk5h+gKKD1b6UGgzKcpmc1HiwzfF7qiFKwl/7qqXWI
	JgymE+NEGRdwv29QW/erS6VgnlAN5h0RSuumHCtPnB4wHvJox9JrE8jqfIDTC0rUqT73
	QlDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WruOl9m8rjj6B/eISV7ZrAuuDk2P1Av0bY+CVqaL58Q=;
	b=c9G5CJZYp0JUtzSvnNwV1VugarThdXaIvgis5H6U4VMSQ7Esvt8I9RkIU3rUGanhTX
	EQV4iPHnWVGQVP4Jy4VVeAFgau1qTGZJongz/T9PyS5sEXypyBYJip+BgFhhb1k83a4a
	VTF/r1CCTPiRhfO1XdwaegmtfxR0dPkCPY1MOKeu8otdZmmzP26u4cFYZKiM324tiQXQ
	uK0dZ+JZ5nlKSoJ1mzvismAyJduQ9VtZ4NGc7Q54SJoW5tLYkptOB721+871TB4ikBjQ
	y2ocaWAc6LzNtVdBWOg7DqtcmwmavqiIdDwR85c69b+SQgVS/UzmT3HfIJDKLtO118DQ
	BfrA==
X-Gm-Message-State: APjAAAUHLFM6ki4YyNeAhpMzDzNLkCfCFc1ZiQOnVMyS7PXsLQwfGI7p
	HRzWd2t3KDrkxvXxqJFe7jDY580R3kOwohGdsvg5p2g=
X-Google-Smtp-Source: APXvYqx4281+tmbi3ZlPDrW+JB0898oZIUJra8F7IZWiEF8jcqHh8UQR+dgmOr5eN7CEnXk9zl63wAZJvDvH7MBwJLo=
X-Received: by 2002:ac2:51b6:: with SMTP id f22mr7273869lfk.175.1570754414142; 
	Thu, 10 Oct 2019 17:40:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1568834524.git.rgb@redhat.com>
	<16abf1b2aafeb5f1b8dae20b9a4836e54f959ca5.1568834524.git.rgb@redhat.com>
In-Reply-To: <16abf1b2aafeb5f1b8dae20b9a4836e54f959ca5.1568834524.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 10 Oct 2019 20:40:03 -0400
Message-ID: <CAHC9VhSRmn46DcazH4Q35vOSxVoEu8PsX79aurkHkFymRoMwag@mail.gmail.com>
Subject: Re: [PATCH ghak90 V7 14/21] audit: contid check descendancy and
	nesting
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.68]);
	Fri, 11 Oct 2019 00:40:16 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]);
	Fri, 11 Oct 2019 00:40:16 +0000 (UTC) for IP:'209.85.167.65'
	DOMAIN:'mail-lf1-f65.google.com' HELO:'mail-lf1-f65.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.167.65 mail-lf1-f65.google.com 209.85.167.65
	mail-lf1-f65.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.68
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Fri, 11 Oct 2019 00:40:23 +0000 (UTC)

On Wed, Sep 18, 2019 at 9:26 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> ?fixup! audit: convert to contid list to check for orch/engine ownership

?

> Require the target task to be a descendant of the container
> orchestrator/engine.
>
> You would only change the audit container ID from one set or inherited
> value to another if you were nesting containers.
>
> If changing the contid, the container orchestrator/engine must be a
> descendant and not same orchestrator as the one that set it so it is not
> possible to change the contid of another orchestrator's container.

Did you mean to say that the container orchestrator must be an
ancestor of the target, and the same orchestrator as the one that set
the target process' audit container ID?

Or maybe I'm missing something about what you are trying to do?

> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  kernel/audit.c | 70 +++++++++++++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 62 insertions(+), 8 deletions(-)
>
> diff --git a/kernel/audit.c b/kernel/audit.c
> index 9ce7a1ec7a92..69fe1e9af7cb 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -2560,6 +2560,39 @@ static struct task_struct *audit_cont_owner(struct task_struct *tsk)
>  }
>
>  /*
> + * task_is_descendant - walk up a process family tree looking for a match
> + * @parent: the process to compare against while walking up from child
> + * @child: the process to start from while looking upwards for parent
> + *
> + * Returns 1 if child is a descendant of parent, 0 if not.
> + */
> +static int task_is_descendant(struct task_struct *parent,
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
>   * audit_set_contid - set current task's audit contid
>   * @task: target task
>   * @contid: contid value
> @@ -2587,22 +2620,43 @@ int audit_set_contid(struct task_struct *task, u64 contid)
>         oldcontid = audit_get_contid(task);
>         read_lock(&tasklist_lock);
>         /* Don't allow the contid to be unset */
> -       if (!audit_contid_valid(contid))
> +       if (!audit_contid_valid(contid)) {
>                 rc = -EINVAL;
> +               goto unlock;
> +       }
>         /* Don't allow the contid to be set to the same value again */
> -       else if (contid == oldcontid) {
> +       if (contid == oldcontid) {
>                 rc = -EADDRINUSE;
> +               goto unlock;
> +       }
>         /* if we don't have caps, reject */
> -       else if (!capable(CAP_AUDIT_CONTROL))
> +       if (!capable(CAP_AUDIT_CONTROL)) {
>                 rc = -EPERM;
> -       /* if task has children or is not single-threaded, deny */
> -       else if (!list_empty(&task->children))
> +               goto unlock;
> +       }
> +       /* if task has children, deny */
> +       if (!list_empty(&task->children)) {
>                 rc = -EBUSY;
> -       else if (!(thread_group_leader(task) && thread_group_empty(task)))
> +               goto unlock;
> +       }
> +       /* if task is not single-threaded, deny */
> +       if (!(thread_group_leader(task) && thread_group_empty(task))) {
>                 rc = -EALREADY;
> -       /* if contid is already set, deny */
> -       else if (audit_contid_set(task))
> +               goto unlock;
> +       }
> +       /* if task is not descendant, block */
> +       if (task == current) {
> +               rc = -EBADSLT;
> +               goto unlock;
> +       }
> +       if (!task_is_descendant(current, task)) {
> +               rc = -EXDEV;
> +               goto unlock;
> +       }
> +       /* only allow contid setting again if nesting */
> +       if (audit_contid_set(task) && current == audit_cont_owner(task))
>                 rc = -ECHILD;
> +unlock:
>         read_unlock(&tasklist_lock);
>         if (!rc) {
>                 struct audit_cont *oldcont = audit_cont(task);

--
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
