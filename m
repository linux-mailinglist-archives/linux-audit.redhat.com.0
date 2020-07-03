Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 8A829214195
	for <lists+linux-audit@lfdr.de>; Sat,  4 Jul 2020 00:34:14 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-He-HyUGrOa6TKFKDrOQh2g-1; Fri, 03 Jul 2020 18:34:11 -0400
X-MC-Unique: He-HyUGrOa6TKFKDrOQh2g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D6E5BFC0;
	Fri,  3 Jul 2020 22:34:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7270210013D9;
	Fri,  3 Jul 2020 22:34:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E596296592;
	Fri,  3 Jul 2020 22:33:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 063MVT1v004522 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 3 Jul 2020 18:31:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 56BB210BFD62; Fri,  3 Jul 2020 22:31:29 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 522C410BFD61
	for <linux-audit@redhat.com>; Fri,  3 Jul 2020 22:31:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38CD3800296
	for <linux-audit@redhat.com>; Fri,  3 Jul 2020 22:31:27 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-271-A39UtM2wO02zFdf54r_i6w-1; Fri, 03 Jul 2020 18:31:24 -0400
X-MC-Unique: A39UtM2wO02zFdf54r_i6w-1
Received: by mail-qk1-f195.google.com with SMTP id b185so19441127qkg.1;
	Fri, 03 Jul 2020 15:31:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=z43O41PoWtbJSDDL1YF3juci6+KJgJKkzG4Dhe6Cuxc=;
	b=VhuELm4EN/eav56gZ7UWzmbDNcLBWwwZUZKd4OzL06pl5XEwWyKCGPqn76Z9T/I8cW
	dOSf3FsjyDlCOvOViWDNnmvrWfsw154cRNR1idm8ZiTIpHitMnrpM+oPJ/P9cjgArllW
	L6zUy/TwIYES3HjxmomZqL9MJGgfS4cKvfH13Zg4qxGYE1m07RGdSXgT8gPqmRb1gOGn
	KCfISL/42rtEo1Oc0QJ8KwnI5D5je5UeYY4g3ZYFaAVHk7LvBV0ZrsxYmsLIWsC7HxOA
	VKQomYWKL0joWadZ2av8h0vJjvblcuzev/dT49dSqNtT4JoKbnyOQWOgEA2XDSllQFlf
	s6aA==
X-Gm-Message-State: AOAM5302iGejMdsd4BTPYoeR3a3B2HWSi/AUb7OxN/elElbMdqmuUElo
	Xi4xdJg16owD9WQ7k8GyoEta72rP8nM=
X-Google-Smtp-Source: ABdhPJzLQO2sz99FCvUc2ipqn/ufGrtVDYXSSR9aDGc9zCCvnJL4lBjrLNjbBalz4g5BARWqjOrcmw==
X-Received: by 2002:a05:620a:211a:: with SMTP id
	l26mr37646305qkl.408.1593815483768; 
	Fri, 03 Jul 2020 15:31:23 -0700 (PDT)
Received: from linux-kernel-dev (ool-182c9054.dyn.optonline.net.
	[24.44.144.84]) by smtp.gmail.com with ESMTPSA id
	f18sm12628020qtc.28.2020.07.03.15.31.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 03 Jul 2020 15:31:23 -0700 (PDT)
Date: Fri, 3 Jul 2020 22:31:22 +0000
From: Max Englander <max.englander@gmail.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v2] audit: report audit wait metric in audit status reply
Message-ID: <20200703223121.GA10378@linux-kernel-dev>
References: <20200701213244.GA1817@linux-kernel-dev>
	<CAHC9VhTctHCCrm4Q1cPdFX-6NXEtmjEPmw6rvUoxOq8UUmycxA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhTctHCCrm4Q1cPdFX-6NXEtmjEPmw6rvUoxOq8UUmycxA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Jul 02, 2020 at 04:42:13PM -0400, Paul Moore wrote:
> On Wed, Jul 1, 2020 at 5:32 PM Max Englander <max.englander@gmail.com> wrote:
> >
> > In environments where the preservation of audit events and predictable
> > usage of system memory are prioritized, admins may use a combination of
> > --backlog_wait_time and -b options at the risk of degraded performance
> > resulting from backlog waiting. In some cases, this risk may be
> > preferred to lost events or unbounded memory usage. Ideally, this risk
> > can be mitigated by making adjustments when backlog waiting is detected.
> >
> > However, detection can be diffult using the currently available metrics.
> > For example, an admin attempting to debug degraded performance may
> > falsely believe a full backlog indicates backlog waiting. It may turn
> > out the backlog frequently fills up but drains quickly.
> >
> > To make it easier to reliably track degraded performance to backlog
> > waiting, this patch makes the following changes:
> >
> > Add a new field backlog_wait_sum to the audit status reply. Initialize
> > this field to zero. Add to this field the total time spent by the
> > current task on scheduled timeouts while the backlog limit is exceeded.
> >
> > Tested on Ubuntu 18.04 using complementary changes to the audit
> > userspace: https://github.com/linux-audit/audit-userspace/pull/134.
> >
> > Signed-off-by: Max Englander <max.englander@gmail.com>
> > ---
> >  Patch changelogs between v1 and v2:
> >  - Instead of printing a warning when backlog waiting occurs, add
> >    duration of backlog waiting to cumulative sum, and report this
> >    sum in audit status reply.
> >
> >  include/uapi/linux/audit.h | 7 ++++++-
> >  kernel/audit.c             | 9 +++++++++
> >  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> Hi Max,
> 
> In general this looks better than the previous approach, but I do have
> a few specific comments (inline).  It also important that in addition

Thanks for your feedback and comments, Paul. I've prepared a v3 patch
addressing all of your comments, with corresponding changes to the
audit-userspace, which I'll submit once I get a working change to
the test suite. I'll use this thread to respond to some things and ask
a question.

> to the requisite userspace patch, we also need a test added to the
> audit-testsuite project so we can verify this functionality in the
> future.
> 
> * https://github.com/linux-audit/audit-testsuite
> 

I downloaded this test suite and attempted to run it on Ubuntu 18.04,
with the latest audit kernel tree and latest audit-userspace. Many tests
were failing, I assume because I have some issues with my environment.
May I ask what environment (OS, tree, commit) you recommend for running
the test suite? Happy to move this question over to GitHub if that's a
better venue.

> > diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
> > index a534d71e689a..ea0cc364beca 100644
> > --- a/include/uapi/linux/audit.h
> > +++ b/include/uapi/linux/audit.h
> > @@ -340,6 +340,7 @@ enum {
> >  #define AUDIT_STATUS_BACKLOG_LIMIT     0x0010
> >  #define AUDIT_STATUS_BACKLOG_WAIT_TIME 0x0020
> >  #define AUDIT_STATUS_LOST              0x0040
> > +#define AUDIT_STATUS_BACKLOG_WAIT_SUM  0x0080
> 
> Sooo ... you've defined this, but I don't see any of the corresponding
> AUDIT_SET code that I would expect, was that an oversight?  If not, it
> is something we should support in the kernel as I'm sure admins will
> want to reset this value at some point.

To be honest I had based this patch off v1 which included a flag for
setting the backlog warn time threshold, but didn't remove it from the
v2 patch (an oversight). I wasn't thinking about admins' need to reset
the value, but since you suggested it I've included support for that in
the v3 patch.

> 
> >  #define AUDIT_FEATURE_BITMAP_BACKLOG_LIMIT     0x00000001
> >  #define AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_TIME 0x00000002
> > @@ -348,6 +349,7 @@ enum {
> >  #define AUDIT_FEATURE_BITMAP_SESSIONID_FILTER  0x00000010
> >  #define AUDIT_FEATURE_BITMAP_LOST_RESET                0x00000020
> >  #define AUDIT_FEATURE_BITMAP_FILTER_FS         0x00000040
> > +#define AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_SUM  0x00000080
> 
> In an effort not to exhaust the feature bitmap too quickly, I've been
> restricting it to only those features that would cause breakage with
> userspace.  I haven't looked closely at Steve's userspace in quite a
> while, but I'm guessing it can key off the structure size and doesn't
> need this entry in the bitmap, right?  Let me rephrase, if userspace
> needs to key off anything, it *should* key off the structure size and
> not a new flag in the bitmask ;)

I've removed this flag from the v3 patch, but if it's alright with
you I'll key off the absence/presence of
AUDIT_STATUS_BACKLOG_WAIT_TIME_ACTUAL, which follows the pattern
currently used throughout the audit-userspace, and which Richard suggests
in separate message.

> 
> Also, I'm assuming that older userspace doesn't blow-up if it sees the
> larger structure size?  That's even more important.
> 
> >  #define AUDIT_FEATURE_BITMAP_ALL (AUDIT_FEATURE_BITMAP_BACKLOG_LIMIT | \
> >                                   AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_TIME | \
> > @@ -355,12 +357,14 @@ enum {
> >                                   AUDIT_FEATURE_BITMAP_EXCLUDE_EXTEND | \
> >                                   AUDIT_FEATURE_BITMAP_SESSIONID_FILTER | \
> >                                   AUDIT_FEATURE_BITMAP_LOST_RESET | \
> > -                                 AUDIT_FEATURE_BITMAP_FILTER_FS)
> > +                                 AUDIT_FEATURE_BITMAP_FILTER_FS | \
> > +                                 AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_SUM)
> >
> >  /* deprecated: AUDIT_VERSION_* */
> >  #define AUDIT_VERSION_LATEST           AUDIT_FEATURE_BITMAP_ALL
> >  #define AUDIT_VERSION_BACKLOG_LIMIT    AUDIT_FEATURE_BITMAP_BACKLOG_LIMIT
> >  #define AUDIT_VERSION_BACKLOG_WAIT_TIME        AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_TIME
> > +#define AUDIT_VERSION_BACKLOG_WAIT_SUM AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_SUM
> >
> >                                 /* Failure-to-log actions */
> >  #define AUDIT_FAIL_SILENT      0
> > @@ -466,6 +470,7 @@ struct audit_status {
> >                 __u32   feature_bitmap; /* bitmap of kernel audit features */
> >         };
> >         __u32           backlog_wait_time;/* message queue wait timeout */
> > +       __u32           backlog_wait_sum;/* time spent waiting while message limit exceeded */
> 
> This is very nitpicky, but how about a rename to 'backlog_wait_time_actual'?

Sure, will do.

> 
> > diff --git a/kernel/audit.c b/kernel/audit.c
> > index 87f31bf1f0a0..301ea4f3d750 100644
> > --- a/kernel/audit.c
> > +++ b/kernel/audit.c
> > @@ -136,6 +136,11 @@ u32                audit_sig_sid = 0;
> >  */
> >  static atomic_t        audit_lost = ATOMIC_INIT(0);
> >
> > +/* Monotonically increasing sum of time the kernel has spent
> > + * waiting while the backlog limit is exceeded.
> > + */
> > +static atomic_t audit_backlog_wait_sum = ATOMIC_INIT(0);
> 
> Needless to say, this should be renamed too so we don't go crazy.

Of course :)

> 
> >  /* Hash for inode-based rules */
> >  struct list_head audit_inode_hash[AUDIT_INODE_BUCKETS];
> >
> > @@ -1204,6 +1209,7 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
> >                 s.backlog               = skb_queue_len(&audit_queue);
> >                 s.feature_bitmap        = AUDIT_FEATURE_BITMAP_ALL;
> >                 s.backlog_wait_time     = audit_backlog_wait_time;
> > +               s.backlog_wait_sum      = atomic_read(&audit_backlog_wait_sum);
> >                 audit_send_reply(skb, seq, AUDIT_GET, 0, 0, &s, sizeof(s));
> >                 break;
> >         }
> > @@ -1794,6 +1800,9 @@ struct audit_buffer *audit_log_start(struct audit_context *ctx, gfp_t gfp_mask,
> >                                 return NULL;
> >                         }
> >                 }
> > +
> > +               if (stime != audit_backlog_wait_time)
> > +                       atomic_add(audit_backlog_wait_time - stime, &audit_backlog_wait_sum);
> 
> Since stime can only be different in one place in the code above
> (after the schedule_timeout() call), why not move the atomic_add() up
> there and drop the "if"?  Yes there is the potential of calling
> atomic_add() multiple times in this case, but the thread is waiting
> anyway and this way we don't impact other code paths.

My concern was calling atomic_add() more than necessary, but happy to
move it up as you suggest.

> 
> >         }
> >
> >         ab = audit_buffer_alloc(ctx, gfp_mask, type);
> > --
> > 2.17.1
> 
> -- 
> paul moore
> www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

