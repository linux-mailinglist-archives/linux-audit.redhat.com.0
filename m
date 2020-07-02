Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C8554212E13
	for <lists+linux-audit@lfdr.de>; Thu,  2 Jul 2020 22:47:31 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-r5lHqmtvPiGkUkT6_eWq7Q-1; Thu, 02 Jul 2020 16:47:28 -0400
X-MC-Unique: r5lHqmtvPiGkUkT6_eWq7Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81417107ACCD;
	Thu,  2 Jul 2020 20:47:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 018C97554F;
	Thu,  2 Jul 2020 20:47:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C8BCE1809547;
	Thu,  2 Jul 2020 20:47:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 062KgVUD016039 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 2 Jul 2020 16:42:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B6EF1F567F; Thu,  2 Jul 2020 20:42:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B2965F5671
	for <linux-audit@redhat.com>; Thu,  2 Jul 2020 20:42:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 112C1800260
	for <linux-audit@redhat.com>; Thu,  2 Jul 2020 20:42:28 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
	[209.85.218.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-113-ao-wFDrzNMScBWwrMJukRQ-1; Thu, 02 Jul 2020 16:42:25 -0400
X-MC-Unique: ao-wFDrzNMScBWwrMJukRQ-1
Received: by mail-ej1-f68.google.com with SMTP id w16so31345368ejj.5
	for <linux-audit@redhat.com>; Thu, 02 Jul 2020 13:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BfIrEAu9qUgQPhFDPWeH9dvksded/nSP4A34rF1nOwA=;
	b=RVzweL0biZ8gVHza596X/SSMhfFtrOilkL/G33Br4rkoojF74daT3iiGX2WOOSRnv/
	rNPh/fdUE0gW9WUBChwcOausRFEHs0uEcvEINw2M3ITW0pcAaAf0BueTFmnNCE06xkXr
	vkTAeEi7R09gmrS5eW3+HHn7cKNb0OY4w1iRlI3n1EEfoveQLvEil97PX61JVGXYgqUB
	aD8nwP7ZSupk40IBlLFnnvkjlskiSfa7TwE15efQfBIcsx8uDP+Q/kb/ZOZ31plq5BbG
	UmVDgtsuVf6HBjxdkmFIn+JQuPv1/cgCOQEmM8vp9HTSkwdAP9NzylUz5SEYbVB+Lfx8
	7Lag==
X-Gm-Message-State: AOAM530Mo2S78UOWHZMpRRJcxNtu9JvcZNRm5MWRlQzlsQWCBEo0yTX6
	Bpzm7SeTWYBau3c+2RJkTrOUwi0dSmms3k509ttagJG6Pw==
X-Google-Smtp-Source: ABdhPJzcEKHKkU03Bhi9OvGdLdHimLv9gxLDMCrjtypNFB/OnzRhjKl9cfjCxTwTEGJZ7loISkesg6837LySzUtds5w=
X-Received: by 2002:a17:906:c1d8:: with SMTP id
	bw24mr19654717ejb.91.1593722544325; 
	Thu, 02 Jul 2020 13:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200701213244.GA1817@linux-kernel-dev>
In-Reply-To: <20200701213244.GA1817@linux-kernel-dev>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 2 Jul 2020 16:42:13 -0400
Message-ID: <CAHC9VhTctHCCrm4Q1cPdFX-6NXEtmjEPmw6rvUoxOq8UUmycxA@mail.gmail.com>
Subject: Re: [PATCH v2] audit: report audit wait metric in audit status reply
To: Max Englander <max.englander@gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 1, 2020 at 5:32 PM Max Englander <max.englander@gmail.com> wrote:
>
> In environments where the preservation of audit events and predictable
> usage of system memory are prioritized, admins may use a combination of
> --backlog_wait_time and -b options at the risk of degraded performance
> resulting from backlog waiting. In some cases, this risk may be
> preferred to lost events or unbounded memory usage. Ideally, this risk
> can be mitigated by making adjustments when backlog waiting is detected.
>
> However, detection can be diffult using the currently available metrics.
> For example, an admin attempting to debug degraded performance may
> falsely believe a full backlog indicates backlog waiting. It may turn
> out the backlog frequently fills up but drains quickly.
>
> To make it easier to reliably track degraded performance to backlog
> waiting, this patch makes the following changes:
>
> Add a new field backlog_wait_sum to the audit status reply. Initialize
> this field to zero. Add to this field the total time spent by the
> current task on scheduled timeouts while the backlog limit is exceeded.
>
> Tested on Ubuntu 18.04 using complementary changes to the audit
> userspace: https://github.com/linux-audit/audit-userspace/pull/134.
>
> Signed-off-by: Max Englander <max.englander@gmail.com>
> ---
>  Patch changelogs between v1 and v2:
>  - Instead of printing a warning when backlog waiting occurs, add
>    duration of backlog waiting to cumulative sum, and report this
>    sum in audit status reply.
>
>  include/uapi/linux/audit.h | 7 ++++++-
>  kernel/audit.c             | 9 +++++++++
>  2 files changed, 15 insertions(+), 1 deletion(-)

Hi Max,

In general this looks better than the previous approach, but I do have
a few specific comments (inline).  It also important that in addition
to the requisite userspace patch, we also need a test added to the
audit-testsuite project so we can verify this functionality in the
future.

* https://github.com/linux-audit/audit-testsuite

> diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
> index a534d71e689a..ea0cc364beca 100644
> --- a/include/uapi/linux/audit.h
> +++ b/include/uapi/linux/audit.h
> @@ -340,6 +340,7 @@ enum {
>  #define AUDIT_STATUS_BACKLOG_LIMIT     0x0010
>  #define AUDIT_STATUS_BACKLOG_WAIT_TIME 0x0020
>  #define AUDIT_STATUS_LOST              0x0040
> +#define AUDIT_STATUS_BACKLOG_WAIT_SUM  0x0080

Sooo ... you've defined this, but I don't see any of the corresponding
AUDIT_SET code that I would expect, was that an oversight?  If not, it
is something we should support in the kernel as I'm sure admins will
want to reset this value at some point.

>  #define AUDIT_FEATURE_BITMAP_BACKLOG_LIMIT     0x00000001
>  #define AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_TIME 0x00000002
> @@ -348,6 +349,7 @@ enum {
>  #define AUDIT_FEATURE_BITMAP_SESSIONID_FILTER  0x00000010
>  #define AUDIT_FEATURE_BITMAP_LOST_RESET                0x00000020
>  #define AUDIT_FEATURE_BITMAP_FILTER_FS         0x00000040
> +#define AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_SUM  0x00000080

In an effort not to exhaust the feature bitmap too quickly, I've been
restricting it to only those features that would cause breakage with
userspace.  I haven't looked closely at Steve's userspace in quite a
while, but I'm guessing it can key off the structure size and doesn't
need this entry in the bitmap, right?  Let me rephrase, if userspace
needs to key off anything, it *should* key off the structure size and
not a new flag in the bitmask ;)

Also, I'm assuming that older userspace doesn't blow-up if it sees the
larger structure size?  That's even more important.

>  #define AUDIT_FEATURE_BITMAP_ALL (AUDIT_FEATURE_BITMAP_BACKLOG_LIMIT | \
>                                   AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_TIME | \
> @@ -355,12 +357,14 @@ enum {
>                                   AUDIT_FEATURE_BITMAP_EXCLUDE_EXTEND | \
>                                   AUDIT_FEATURE_BITMAP_SESSIONID_FILTER | \
>                                   AUDIT_FEATURE_BITMAP_LOST_RESET | \
> -                                 AUDIT_FEATURE_BITMAP_FILTER_FS)
> +                                 AUDIT_FEATURE_BITMAP_FILTER_FS | \
> +                                 AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_SUM)
>
>  /* deprecated: AUDIT_VERSION_* */
>  #define AUDIT_VERSION_LATEST           AUDIT_FEATURE_BITMAP_ALL
>  #define AUDIT_VERSION_BACKLOG_LIMIT    AUDIT_FEATURE_BITMAP_BACKLOG_LIMIT
>  #define AUDIT_VERSION_BACKLOG_WAIT_TIME        AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_TIME
> +#define AUDIT_VERSION_BACKLOG_WAIT_SUM AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_SUM
>
>                                 /* Failure-to-log actions */
>  #define AUDIT_FAIL_SILENT      0
> @@ -466,6 +470,7 @@ struct audit_status {
>                 __u32   feature_bitmap; /* bitmap of kernel audit features */
>         };
>         __u32           backlog_wait_time;/* message queue wait timeout */
> +       __u32           backlog_wait_sum;/* time spent waiting while message limit exceeded */

This is very nitpicky, but how about a rename to 'backlog_wait_time_actual'?

> diff --git a/kernel/audit.c b/kernel/audit.c
> index 87f31bf1f0a0..301ea4f3d750 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -136,6 +136,11 @@ u32                audit_sig_sid = 0;
>  */
>  static atomic_t        audit_lost = ATOMIC_INIT(0);
>
> +/* Monotonically increasing sum of time the kernel has spent
> + * waiting while the backlog limit is exceeded.
> + */
> +static atomic_t audit_backlog_wait_sum = ATOMIC_INIT(0);

Needless to say, this should be renamed too so we don't go crazy.

>  /* Hash for inode-based rules */
>  struct list_head audit_inode_hash[AUDIT_INODE_BUCKETS];
>
> @@ -1204,6 +1209,7 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
>                 s.backlog               = skb_queue_len(&audit_queue);
>                 s.feature_bitmap        = AUDIT_FEATURE_BITMAP_ALL;
>                 s.backlog_wait_time     = audit_backlog_wait_time;
> +               s.backlog_wait_sum      = atomic_read(&audit_backlog_wait_sum);
>                 audit_send_reply(skb, seq, AUDIT_GET, 0, 0, &s, sizeof(s));
>                 break;
>         }
> @@ -1794,6 +1800,9 @@ struct audit_buffer *audit_log_start(struct audit_context *ctx, gfp_t gfp_mask,
>                                 return NULL;
>                         }
>                 }
> +
> +               if (stime != audit_backlog_wait_time)
> +                       atomic_add(audit_backlog_wait_time - stime, &audit_backlog_wait_sum);

Since stime can only be different in one place in the code above
(after the schedule_timeout() call), why not move the atomic_add() up
there and drop the "if"?  Yes there is the potential of calling
atomic_add() multiple times in this case, but the thread is waiting
anyway and this way we don't impact other code paths.

>         }
>
>         ab = audit_buffer_alloc(ctx, gfp_mask, type);
> --
> 2.17.1

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

