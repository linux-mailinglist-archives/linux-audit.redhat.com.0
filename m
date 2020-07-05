Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD2F214D68
	for <lists+linux-audit@lfdr.de>; Sun,  5 Jul 2020 17:11:13 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-TSSxpboSNfGHKd24CFmnjg-1; Sun, 05 Jul 2020 11:11:09 -0400
X-MC-Unique: TSSxpboSNfGHKd24CFmnjg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27C741005510;
	Sun,  5 Jul 2020 15:10:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 052E02DE81;
	Sun,  5 Jul 2020 15:10:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CAE546C9EC;
	Sun,  5 Jul 2020 15:10:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 065FAtgL028320 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 5 Jul 2020 11:10:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 90C16110DA0A; Sun,  5 Jul 2020 15:10:55 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 825F2110DA09
	for <linux-audit@redhat.com>; Sun,  5 Jul 2020 15:10:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 21C01101A525
	for <linux-audit@redhat.com>; Sun,  5 Jul 2020 15:10:53 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-268-33BjTxhDN66xMiAkmmzRSg-1; Sun, 05 Jul 2020 11:10:51 -0400
X-MC-Unique: 33BjTxhDN66xMiAkmmzRSg-1
Received: by mail-ed1-f66.google.com with SMTP id e15so32359972edr.2
	for <linux-audit@redhat.com>; Sun, 05 Jul 2020 08:10:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=K1GlTWNj6PD7+zx4y3mMqpOJYFliIY0lpaJ9WmnrGsw=;
	b=N1BtGQEbK7edMB0aj2JAUw+F2ypZayHbt+R15NKbJNWZ2m03LpGZkcS3n/AloMIn7c
	OYZxpcL6DaPDYr6/eiZcwq4WqDyMq6pGXxnE97n8MwocI6i4zDAtOrHJgOcAu6LX5ixQ
	/bv9E604PsBsci5BAy3Df5dGtw901f2ly8VqClIKy+9+urtQI/LntmqUAgyhGxXqTn8H
	teSlPXzppj1Gx1fWbf2D2DAxYmTPnYtzvPkvLFZXLa/rV+wwrinhndHm/W65t/uOY++T
	WF3E9yEm6PA3eyRz0C156fYOmu8MDEqIxJj82Obh6hFGsmSP7tATMMBvJfTPhShQKWD9
	uiJQ==
X-Gm-Message-State: AOAM532wZAF1r+aelEuZiweFknkgKjg8Qq5p1KsNcpFimMOvkf1VWAn5
	EyQhro4cJkSurJJl8UVk4eItYeJ90CWAMy2cQ7/F
X-Google-Smtp-Source: ABdhPJzPuOCZh7ofYNtUHCYMW3jBhuf1tPX7Hh6Nr+98EaJXJ76XW9p6lAoUkZaBiMUCY/jz5WPFypCksLJqOD5Wc9c=
X-Received: by 2002:aa7:cd52:: with SMTP id v18mr48740451edw.196.1593961849836;
	Sun, 05 Jul 2020 08:10:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593198710.git.rgb@redhat.com>
	<6e2e10432e1400f747918eeb93bf45029de2aa6c.1593198710.git.rgb@redhat.com>
In-Reply-To: <6e2e10432e1400f747918eeb93bf45029de2aa6c.1593198710.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 5 Jul 2020 11:10:38 -0400
Message-ID: <CAHC9VhSCm5eeBcyY8bBsnxr-hK4rkso9_NJHJec2OXLu4m5QTA@mail.gmail.com>
Subject: Re: [PATCH ghak90 V9 05/13] audit: log container info of syscalls
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 065FAtgL028320
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
> Create a new audit record AUDIT_CONTAINER_ID to document the audit
> container identifier of a process if it is present.
>
> Called from audit_log_exit(), syscalls are covered.
>
> Include target_cid references from ptrace and signal.
>
> A sample raw event:
> type=SYSCALL msg=audit(1519924845.499:257): arch=c000003e syscall=257 success=yes exit=3 a0=ffffff9c a1=56374e1cef30 a2=241 a3=1b6 items=2 ppid=606 pid=635 auid=0 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=pts0 ses=3 comm="bash" exe="/usr/bin/bash" subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key="tmpcontainerid"
> type=CWD msg=audit(1519924845.499:257): cwd="/root"
> type=PATH msg=audit(1519924845.499:257): item=0 name="/tmp/" inode=13863 dev=00:27 mode=041777 ouid=0 ogid=0 rdev=00:00 obj=system_u:object_r:tmp_t:s0 nametype= PARENT cap_fp=0 cap_fi=0 cap_fe=0 cap_fver=0
> type=PATH msg=audit(1519924845.499:257): item=1 name="/tmp/tmpcontainerid" inode=17729 dev=00:27 mode=0100644 ouid=0 ogid=0 rdev=00:00 obj=unconfined_u:object_r:user_tmp_t:s0 nametype=CREATE cap_fp=0 cap_fi=0 cap_fe=0 cap_fver=0
> type=PROCTITLE msg=audit(1519924845.499:257): proctitle=62617368002D6300736C65657020313B206563686F2074657374203E202F746D702F746D70636F6E7461696E65726964
> type=CONTAINER_ID msg=audit(1519924845.499:257): contid=123458
>
> Please see the github audit kernel issue for the main feature:
>   https://github.com/linux-audit/audit-kernel/issues/90
> Please see the github audit userspace issue for supporting additions:
>   https://github.com/linux-audit/audit-userspace/issues/51
> Please see the github audit testsuiite issue for the test case:
>   https://github.com/linux-audit/audit-testsuite/issues/64
> Please see the github audit wiki for the feature overview:
>   https://github.com/linux-audit/audit-kernel/wiki/RFE-Audit-Container-ID
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> Acked-by: Serge Hallyn <serge@hallyn.com>
> Acked-by: Steve Grubb <sgrubb@redhat.com>
> Acked-by: Neil Horman <nhorman@tuxdriver.com>
> Reviewed-by: Ondrej Mosnacek <omosnace@redhat.com>
> ---
>  include/linux/audit.h      |  7 +++++++
>  include/uapi/linux/audit.h |  1 +
>  kernel/audit.c             | 25 +++++++++++++++++++++++--
>  kernel/audit.h             |  4 ++++
>  kernel/auditsc.c           | 45 +++++++++++++++++++++++++++++++++++++++------
>  5 files changed, 74 insertions(+), 8 deletions(-)

...

> diff --git a/kernel/audit.c b/kernel/audit.c
> index 9e0b38ce1ead..a09f8f661234 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -2211,6 +2211,27 @@ void audit_log_session_info(struct audit_buffer *ab)
>         audit_log_format(ab, "auid=%u ses=%u", auid, sessionid);
>  }
>
> +/*
> + * audit_log_container_id - report container info
> + * @context: task or local context for record
> + * @cont: container object to report
> + */
> +void audit_log_container_id(struct audit_context *context,
> +                           struct audit_contobj *cont)
> +{
> +       struct audit_buffer *ab;
> +
> +       if (!cont)
> +               return;
> +       /* Generate AUDIT_CONTAINER_ID record with container ID */
> +       ab = audit_log_start(context, GFP_KERNEL, AUDIT_CONTAINER_ID);
> +       if (!ab)
> +               return;
> +       audit_log_format(ab, "contid=%llu", contid);

Did this patch compile?  Where is "contid" coming from?  I'm guessing
you mean to get it from "cont", but that isn't what appears to be
happening; likely a casualty of the object vs token discussion we had
during the last review cycle.

I'm assuming this code gets modified later in this patchset and you
only compiled tested the patchset as a whole.  Please make sure the
patchset compiles at each patch along the way to applying them all;
this helps ensure that git bisect remains useful and it fits better
with the general idea that individual patches must have merit on their
own.

... and yes, I do check for this when merging patchsets, it isn't just
a visual inspection, I compile test each patch.

If nothing else, at least this answers the question of if it is worth
respinning or not (this alone requires a respin).

> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index f03d3eb0752c..9e79645e5c0e 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -1458,6 +1466,7 @@ static void audit_log_exit(void)
>         struct audit_buffer *ab;
>         struct audit_aux_data *aux;
>         struct audit_names *n;
> +       struct audit_contobj *cont;
>
>         context->personality = current->personality;
>
> @@ -1541,7 +1550,7 @@ static void audit_log_exit(void)
>         for (aux = context->aux_pids; aux; aux = aux->next) {
>                 struct audit_aux_data_pids *axs = (void *)aux;
>
> -               for (i = 0; i < axs->pid_count; i++)
> +               for (i = 0; i < axs->pid_count; i++) {
>                         if (audit_log_pid_context(context, axs->target_pid[i],
>                                                   axs->target_auid[i],
>                                                   axs->target_uid[i],
> @@ -1549,14 +1558,20 @@ static void audit_log_exit(void)
>                                                   axs->target_sid[i],
>                                                   axs->target_comm[i]))
>                                 call_panic = 1;
> +                       audit_log_container_id(context, axs->target_cid[i]);
> +               }

It might be nice to see an audit event example including the
ptrace/signal information.  I'm concerned there may be some confusion
about associating the different audit container IDs with the correct
information in the event.

>         }
>
> -       if (context->target_pid &&
> -           audit_log_pid_context(context, context->target_pid,
> -                                 context->target_auid, context->target_uid,
> -                                 context->target_sessionid,
> -                                 context->target_sid, context->target_comm))
> +       if (context->target_pid) {
> +               if (audit_log_pid_context(context, context->target_pid,
> +                                         context->target_auid,
> +                                         context->target_uid,
> +                                         context->target_sessionid,
> +                                         context->target_sid,
> +                                         context->target_comm))
>                         call_panic = 1;
> +               audit_log_container_id(context, context->target_cid);
> +       }
>
>         if (context->pwd.dentry && context->pwd.mnt) {
>                 ab = audit_log_start(context, GFP_KERNEL, AUDIT_CWD);
> @@ -1575,6 +1590,14 @@ static void audit_log_exit(void)
>
>         audit_log_proctitle();
>
> +       rcu_read_lock();
> +       cont = _audit_contobj_get(current);
> +       rcu_read_unlock();
> +       audit_log_container_id(context, cont);
> +       rcu_read_lock();
> +       _audit_contobj_put(cont);
> +       rcu_read_unlock();

Do we need to grab an additional reference for the audit container
object here?  We don't create any additional references here that
persist beyond the lifetime of this function, right?


>         audit_log_container_drop();
>
>         /* Send end of event record to help user space know we are finished */

--
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

