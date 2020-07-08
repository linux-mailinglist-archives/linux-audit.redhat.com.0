Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id CE382219436
	for <lists+linux-audit@lfdr.de>; Thu,  9 Jul 2020 01:18:17 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-1nRWgqLDMZWu4ZVwK49UMA-1; Wed, 08 Jul 2020 19:18:14 -0400
X-MC-Unique: 1nRWgqLDMZWu4ZVwK49UMA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 101B319057D0;
	Wed,  8 Jul 2020 23:18:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 55DD07735E;
	Wed,  8 Jul 2020 23:18:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6BD5F180954D;
	Wed,  8 Jul 2020 23:18:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 068NDUkQ021627 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 8 Jul 2020 19:13:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 06AE7111F6; Wed,  8 Jul 2020 23:13:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 022AE3325C
	for <linux-audit@redhat.com>; Wed,  8 Jul 2020 23:13:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94FB8185A797
	for <linux-audit@redhat.com>; Wed,  8 Jul 2020 23:13:27 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
	[209.85.218.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-136-L2Cd2huhPbCTbqaEq78W-g-1; Wed, 08 Jul 2020 19:13:21 -0400
X-MC-Unique: L2Cd2huhPbCTbqaEq78W-g-1
Received: by mail-ej1-f68.google.com with SMTP id y10so255499eje.1
	for <linux-audit@redhat.com>; Wed, 08 Jul 2020 16:13:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=75UC0jV3VxPmPOGr0QdxTNJUAKFn7JZifXOJVDfako4=;
	b=b9vYP4PHmMbzg++fPhlG2f2Zbg30XpvJnmpiBMUg90yTv42qYnCuqt1dWZxcYR+L3Q
	MCygiceoaJdT5Djrklds4Sf2XNWef3TTN2TTRq6XvpbOt65jfbK4NE7wcz45TGQnVxA6
	65KP1ItCCHgZB9aL3aMYWlyoHelmF7mn+06EF09dblC4Nd6cx5pum5Jm6udg5Ik2p8VY
	jySOdmpClcHj1wTqaD37JfuPvSSHEu645I2XfKmyG89rbjfug0nTmUyHmY+VJMDLosfX
	IY1VrlXSCNb8RRRlwGTQrKSOyHd8RqTfsHRpOSCOQAuaxh8h90vc0Ufwd5D17iwitaSU
	Mtmg==
X-Gm-Message-State: AOAM533mWOqNOuSiqvBGMPvVLi+zTBmnpZm3iAejMxvVcfCzmu6rK/DW
	m+KsVMmPsWLTD5jWqQG+BXL67HmOExNEaLb9LfxR
X-Google-Smtp-Source: ABdhPJzjiOdMbBcOdTEE/1b1M65bbsya44JwvZ9tvjyxeS6g+rG8BnF5TPekhXTl7pqx5wRmpeRyNhiXAN13JcKNQH4=
X-Received: by 2002:a17:906:aac9:: with SMTP id
	kt9mr49860435ejb.488.1594249999748; 
	Wed, 08 Jul 2020 16:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200704151526.GA62112@linux-kernel-dev>
In-Reply-To: <20200704151526.GA62112@linux-kernel-dev>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 8 Jul 2020 19:13:08 -0400
Message-ID: <CAHC9VhTObG-=cbASnXwXiyM-1CCJXZ-4YGFCHozSVBn4Qjp=MQ@mail.gmail.com>
Subject: Re: [PATCH v3] audit: report audit wait metric in audit status reply
To: Max Englander <max.englander@gmail.com>, sgrubb@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jul 4, 2020 at 11:15 AM Max Englander <max.englander@gmail.com> wrote:
>
> In environments where the preservation of audit events and predictable
> usage of system memory are prioritized, admins may use a combination of
> --backlog_wait_time and -b options at the risk of degraded performance
> resulting from backlog waiting. In some cases, this risk may be
> preferred to lost events or unbounded memory usage. Ideally, this risk
> can be mitigated by making adjustments when backlog waiting is detected.
>
> However, detection can be difficult using the currently available
> metrics. For example, an admin attempting to debug degraded performance
> may falsely believe a full backlog indicates backlog waiting. It may
> turn out the backlog frequently fills up but drains quickly.
>
> To make it easier to reliably track degraded performance to backlog
> waiting, this patch makes the following changes:
>
> Add a new field backlog_wait_time_total to the audit status reply.
> Initialize this field to zero. Add to this field the total time spent
> by the current task on scheduled timeouts while the backlog limit is
> exceeded. Reset field to zero upon request via AUDIT_SET.
>
> Tested on Ubuntu 18.04 using complementary changes to the
> audit-userspace and audit-testsuite:
> - https://github.com/linux-audit/audit-userspace/pull/134
> - https://github.com/linux-audit/audit-testsuite/pull/97
>
> Signed-off-by: Max Englander <max.englander@gmail.com>
> ---
> Patch changelogs between v1 and v2:
>   - Instead of printing a warning when backlog waiting occurs, add
>     duration of backlog waiting to cumulative sum, and report this
>     sum in audit status reply.
>
> Patch changelogs between v2 and v3:
>  - Rename backlog_wait_sum to backlog_wait_time_actual.
>  - Drop unneeded and unwanted header flags
>    AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_SUM and
>    AUDIT_VERSION_BACKLOG_WAIT_SUM.
>  - Increment backlog_wait_time_actual counter after every call to
>    schedule_timeout rather than once after enqueuing (or losing) an
>    audit record.
>  - Add support for resetting backlog_wait_time_actual counter to zero
>    upon request via AUDIT_SET.
>
>  include/uapi/linux/audit.h | 18 +++++++++++-------
>  kernel/audit.c             | 35 +++++++++++++++++++++++++----------
>  2 files changed, 36 insertions(+), 17 deletions(-)

This looks okay to me, thanks for the fixes Max.

Steve, does the associated userspace patch look okay to you?

> diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
> index a534d71e689a..92d72965ad44 100644
> --- a/include/uapi/linux/audit.h
> +++ b/include/uapi/linux/audit.h
> @@ -332,14 +332,15 @@ enum {
>  };
>
>  /* Status symbols */
> -                               /* Mask values */
> -#define AUDIT_STATUS_ENABLED           0x0001
> -#define AUDIT_STATUS_FAILURE           0x0002
> -#define AUDIT_STATUS_PID               0x0004
> +                                               /* Mask values */
> +#define AUDIT_STATUS_ENABLED                   0x0001
> +#define AUDIT_STATUS_FAILURE                   0x0002
> +#define AUDIT_STATUS_PID                       0x0004
>  #define AUDIT_STATUS_RATE_LIMIT                0x0008
> -#define AUDIT_STATUS_BACKLOG_LIMIT     0x0010
> -#define AUDIT_STATUS_BACKLOG_WAIT_TIME 0x0020
> -#define AUDIT_STATUS_LOST              0x0040
> +#define AUDIT_STATUS_BACKLOG_LIMIT             0x0010
> +#define AUDIT_STATUS_BACKLOG_WAIT_TIME         0x0020
> +#define AUDIT_STATUS_LOST                      0x0040
> +#define AUDIT_STATUS_BACKLOG_WAIT_TIME_ACTUAL  0x0080
>
>  #define AUDIT_FEATURE_BITMAP_BACKLOG_LIMIT     0x00000001
>  #define AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_TIME 0x00000002
> @@ -466,6 +467,9 @@ struct audit_status {
>                 __u32   feature_bitmap; /* bitmap of kernel audit features */
>         };
>         __u32           backlog_wait_time;/* message queue wait timeout */
> +       __u32           backlog_wait_time_actual;/* time spent waiting while
> +                                                 * message limit exceeded
> +                                                 */
>  };
>
>  struct audit_features {
> diff --git a/kernel/audit.c b/kernel/audit.c
> index 87f31bf1f0a0..33c640fdacf7 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -136,6 +136,11 @@ u32                audit_sig_sid = 0;
>  */
>  static atomic_t        audit_lost = ATOMIC_INIT(0);
>
> +/* Monotonically increasing sum of time the kernel has spent
> + * waiting while the backlog limit is exceeded.
> + */
> +static atomic_t audit_backlog_wait_time_actual = ATOMIC_INIT(0);
> +
>  /* Hash for inode-based rules */
>  struct list_head audit_inode_hash[AUDIT_INODE_BUCKETS];
>
> @@ -1193,17 +1198,18 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
>         case AUDIT_GET: {
>                 struct audit_status     s;
>                 memset(&s, 0, sizeof(s));
> -               s.enabled               = audit_enabled;
> -               s.failure               = audit_failure;
> +               s.enabled                  = audit_enabled;
> +               s.failure                  = audit_failure;
>                 /* NOTE: use pid_vnr() so the PID is relative to the current
>                  *       namespace */
> -               s.pid                   = auditd_pid_vnr();
> -               s.rate_limit            = audit_rate_limit;
> -               s.backlog_limit         = audit_backlog_limit;
> -               s.lost                  = atomic_read(&audit_lost);
> -               s.backlog               = skb_queue_len(&audit_queue);
> -               s.feature_bitmap        = AUDIT_FEATURE_BITMAP_ALL;
> -               s.backlog_wait_time     = audit_backlog_wait_time;
> +               s.pid                      = auditd_pid_vnr();
> +               s.rate_limit               = audit_rate_limit;
> +               s.backlog_limit            = audit_backlog_limit;
> +               s.lost                     = atomic_read(&audit_lost);
> +               s.backlog                  = skb_queue_len(&audit_queue);
> +               s.feature_bitmap           = AUDIT_FEATURE_BITMAP_ALL;
> +               s.backlog_wait_time        = audit_backlog_wait_time;
> +               s.backlog_wait_time_actual = atomic_read(&audit_backlog_wait_time_actual);
>                 audit_send_reply(skb, seq, AUDIT_GET, 0, 0, &s, sizeof(s));
>                 break;
>         }
> @@ -1307,6 +1313,12 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
>                         audit_log_config_change("lost", 0, lost, 1);
>                         return lost;
>                 }
> +               if (s.mask == AUDIT_STATUS_BACKLOG_WAIT_TIME_ACTUAL) {
> +                       u32 actual = atomic_xchg(&audit_backlog_wait_time_actual, 0);
> +
> +                       audit_log_config_change("backlog_wait_time_actual", 0, actual, 1);
> +                       return actual;
> +               }
>                 break;
>         }
>         case AUDIT_GET_FEATURE:
> @@ -1778,12 +1790,15 @@ struct audit_buffer *audit_log_start(struct audit_context *ctx, gfp_t gfp_mask,
>                         /* sleep if we are allowed and we haven't exhausted our
>                          * backlog wait limit */
>                         if (gfpflags_allow_blocking(gfp_mask) && (stime > 0)) {
> +                               long rtime = stime;
> +
>                                 DECLARE_WAITQUEUE(wait, current);
>
>                                 add_wait_queue_exclusive(&audit_backlog_wait,
>                                                          &wait);
>                                 set_current_state(TASK_UNINTERRUPTIBLE);
> -                               stime = schedule_timeout(stime);
> +                               stime = schedule_timeout(rtime);
> +                               atomic_add(rtime - stime, &audit_backlog_wait_time_actual);
>                                 remove_wait_queue(&audit_backlog_wait, &wait);
>                         } else {
>                                 if (audit_rate_check() && printk_ratelimit())
> --
> 2.17.1
>


-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

