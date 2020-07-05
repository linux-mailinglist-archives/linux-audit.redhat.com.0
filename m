Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4F541214D82
	for <lists+linux-audit@lfdr.de>; Sun,  5 Jul 2020 17:11:59 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-SdZLjQw0OfO4ys2R3o7BNQ-1; Sun, 05 Jul 2020 11:11:56 -0400
X-MC-Unique: SdZLjQw0OfO4ys2R3o7BNQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C9D5800403;
	Sun,  5 Jul 2020 15:11:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E386C19932;
	Sun,  5 Jul 2020 15:11:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BBAAD1809547;
	Sun,  5 Jul 2020 15:11:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 065FBo5U028645 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 5 Jul 2020 11:11:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E2A18208DD84; Sun,  5 Jul 2020 15:11:49 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AFBB3208DD80
	for <linux-audit@redhat.com>; Sun,  5 Jul 2020 15:11:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D951A101A525
	for <linux-audit@redhat.com>; Sun,  5 Jul 2020 15:11:46 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
	[209.85.218.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-349-zSmjTdXIOrKJR0OkEXj9VQ-1; Sun, 05 Jul 2020 11:11:45 -0400
X-MC-Unique: zSmjTdXIOrKJR0OkEXj9VQ-1
Received: by mail-ej1-f65.google.com with SMTP id w6so39781958ejq.6
	for <linux-audit@redhat.com>; Sun, 05 Jul 2020 08:11:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cTmMCRlwM4HQ8oiNse3u7FDYUgevd5poSx17KumY0vY=;
	b=CokV+i1+WHrK6NbEUJ8wLASp1PacScu8HGTgkzkRbrGHn/oIwPcKsXSS5rPDN7MJzW
	Hd7YrXuTNtQ9jBbomLKK9w2C/Jl9qxxyZRy+lCIoayBcTpjExAl0WCzsIEpzC9Up5Ouh
	YGUTmuMEQewPyFTuh6wt2vzu1n6nHX/H4x55O/Zjk638WHc1FUQrB2oGU2v+wzjmsXju
	g9oBCEz/VMPJHKqpbRGLfDiVZSHt//7DtX0F2ZeadTID7oxcs2a3ysYD7jUA/4yCBP0S
	3WZGurOc1c1OEc/AfxFOGPwPAvKly67DS1+J59h3VMHd3OvMNyMEqjYKdo+q7GsfDSla
	f1TA==
X-Gm-Message-State: AOAM532F4lBHsIhA5l+eVjT/khFmwz5H4CqGklVpI3Jvud/hTlc+5Yq3
	QNfy8JFxnwX6tiX/9Qe0B3luvAWSBub9RTCcLBfz
X-Google-Smtp-Source: ABdhPJzbzoqFDznCDtmzV+i8Jle6Pdv/RYrhTG0ZL3ik10sa7kBVeBjSG5XnXZVxMrvQrksvZHxq1jdy/wlvs+PxtLI=
X-Received: by 2002:a17:906:c1d8:: with SMTP id
	bw24mr30265666ejb.91.1593961903721; 
	Sun, 05 Jul 2020 08:11:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593198710.git.rgb@redhat.com>
	<01229b93733d9baf6ac9bb0cc243eeb08ad579cd.1593198710.git.rgb@redhat.com>
In-Reply-To: <01229b93733d9baf6ac9bb0cc243eeb08ad579cd.1593198710.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 5 Jul 2020 11:11:32 -0400
Message-ID: <CAHC9VhT6cLxxws_pYWcL=mWe786xPoTTFfPZ1=P4hx4V3nytXA@mail.gmail.com>
Subject: Re: [PATCH ghak90 V9 11/13] audit: contid check descendancy and
	nesting
To: Richard Guy Briggs <rgb@redhat.com>
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

On Sat, Jun 27, 2020 at 9:23 AM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> Require the target task to be a descendant of the container
> orchestrator/engine.
>
> You would only change the audit container ID from one set or inherited
> value to another if you were nesting containers.
>
> If changing the contid, the container orchestrator/engine must be a
> descendant and not same orchestrator as the one that set it so it is not
> possible to change the contid of another orchestrator's container.
>
> Since the task_is_descendant() function is used in YAMA and in audit,
> remove the duplication and pull the function into kernel/core/sched.c
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  include/linux/sched.h    |  3 +++
>  kernel/audit.c           | 23 +++++++++++++++++++++--
>  kernel/sched/core.c      | 33 +++++++++++++++++++++++++++++++++
>  security/yama/yama_lsm.c | 33 ---------------------------------
>  4 files changed, 57 insertions(+), 35 deletions(-)
>
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index 2213ac670386..06938d0b9e0c 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -2047,4 +2047,7 @@ static inline void rseq_syscall(struct pt_regs *regs)
>
>  const struct cpumask *sched_trace_rd_span(struct root_domain *rd);
>
> +extern int task_is_descendant(struct task_struct *parent,
> +                             struct task_struct *child);
> +
>  #endif
> diff --git a/kernel/audit.c b/kernel/audit.c
> index a862721dfd9b..efa65ec01239 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -2713,6 +2713,20 @@ int audit_signal_info(int sig, struct task_struct *t)
>         return audit_signal_info_syscall(t);
>  }
>
> +static bool audit_contid_isnesting(struct task_struct *tsk)
> +{
> +       bool isowner = false;
> +       bool ownerisparent = false;
> +
> +       rcu_read_lock();
> +       if (tsk->audit && tsk->audit->cont) {
> +               isowner = current == tsk->audit->cont->owner;
> +               ownerisparent = task_is_descendant(tsk->audit->cont->owner, current);

I want to make sure I'm understanding this correctly and I keep
mentally tripping over something: it seems like for a given audit
container ID a task is either the owner or a descendent, there is no
third state, is that correct?

Assuming that is true, can the descendent check simply be a negative
owner check given they both have the same audit container ID?

> +       }
> +       rcu_read_unlock();
> +       return !isowner && ownerisparent;
> +}
> +
>  /*
>   * audit_set_contid - set current task's audit contid
>   * @task: target task
> @@ -2755,8 +2769,13 @@ int audit_set_contid(struct task_struct *task, u64 contid)
>                 rc = -EBUSY;
>                 goto unlock;
>         }
> -       /* if contid is already set, deny */
> -       if (audit_contid_set(task))
> +       /* if task is not descendant, block */
> +       if (task == current || !task_is_descendant(current, task)) {

I'm also still fuzzy on why we can't let a task set it's own audit
container ID, assuming it meets all the criteria established in patch
2/13.  It somewhat made sense when you were tracking inherited vs
explicitly set audit container IDs, but that doesn't appear to be the
case so far in this patchset, yes?

> +               rc = -EXDEV;

I'm fairly confident we had a discussion about not using all these
different error codes, but that may be a moot point given my next
comment.

> +               goto unlock;
> +       }
> +       /* only allow contid setting again if nesting */
> +       if (audit_contid_set(task) && !audit_contid_isnesting(task))
>                 rc = -EEXIST;

It seems like what we need in audit_set_contid() is a check to ensure
that the task being modified is only modified by the owner of the
audit container ID, yes?  If so, I would think we could do this quite
easily with the following, or similar logic, (NOTE: assumes both
current and tsk are properly setup):

  if ((current->audit->cont != tsk->audit->cont) ||
(current->audit->cont->owner != current))
    return -EACCESS;

This is somewhat independent of the above issue, but we may also want
to add to the capability check.  Patch 2 adds a
"capable(CAP_AUDIT_CONTROL)" which is good, but perhaps we also need a
"ns_capable(CAP_AUDIT_CONTROL)" to allow a given audit container ID
orchestrator/owner the ability to control which of it's descendants
can change their audit container ID, for example:

  if (!capable(CAP_AUDIT_CONTROL) ||
      !ns_capable(current->nsproxy->user_ns, CAP_AUDIT_CONTROL))
    return -EPERM;

--
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

