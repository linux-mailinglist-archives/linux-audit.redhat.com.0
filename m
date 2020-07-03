Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0DDC72140E7
	for <lists+linux-audit@lfdr.de>; Fri,  3 Jul 2020 23:34:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593812054;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6QXpxXdDGOs5BnuqJIOmjW2fl9xO1dQ7/QRhf0jdShI=;
	b=Ot2ZfWLeX0HteoqldNfMXNRcSdmxvQUWnWkSBTXbETmIIIJgqhS2/e/BrRMHFb/YjcZaIK
	QbmMB52HLDMTsUz/4Hha7wf/oTAF4CJZjgCbc1mjoH03B6Kqbdn6q4I4Vte2JDWfp3M3d0
	FImPYvOhjpMGk5as5KTL6hTdUzJiikU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-I2NLazIlNWeiJUGL0Y3HlA-1; Fri, 03 Jul 2020 17:34:11 -0400
X-MC-Unique: I2NLazIlNWeiJUGL0Y3HlA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6640107ACCA;
	Fri,  3 Jul 2020 21:34:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7657F5C1C3;
	Fri,  3 Jul 2020 21:33:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 482E21809543;
	Fri,  3 Jul 2020 21:33:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 063LTwnE030484 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 3 Jul 2020 17:29:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AADFE10013C2; Fri,  3 Jul 2020 21:29:58 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.3])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1170F1053B1B;
	Fri,  3 Jul 2020 21:29:51 +0000 (UTC)
Date: Fri, 3 Jul 2020 17:29:49 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v2] audit: report audit wait metric in audit status reply
Message-ID: <20200703212949.4na3nk23b62s3yjr@madcap2.tricolour.ca>
References: <20200701213244.GA1817@linux-kernel-dev>
	<CAHC9VhTctHCCrm4Q1cPdFX-6NXEtmjEPmw6rvUoxOq8UUmycxA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhTctHCCrm4Q1cPdFX-6NXEtmjEPmw6rvUoxOq8UUmycxA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-07-02 16:42, Paul Moore wrote:
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
> to the requisite userspace patch, we also need a test added to the
> audit-testsuite project so we can verify this functionality in the
> future.
> 
> * https://github.com/linux-audit/audit-testsuite
> 
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

Have a look at the lost reset code as an example.  It is tricky since it
does an atomic reset while delivering a value back up the control plane
and issuing a record.  There were some fallout bug fixes because it
wasn't as obvious as it looked.

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

It could key solely off the existance of AUDIT_STATUS_BACKLOG_WAIT_SUM
via HAVE_DECL_AUDIT_STATUS_BACKLOG_WAIT_SUM which would be defined in
configure.ac similar to AUDIT_STATUS_BACKLOG_WAIT_TIME as has already
been done in Max' userspace patch.

It should be possible to drop AUDIT_VERSION_BACKLOG_WAIT_SUM in
userspace and have it work.

> Also, I'm assuming that older userspace doesn't blow-up if it sees the
> larger structure size?  That's even more important.

I believe it won't even notice, but this should be tested.

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

How about 'backlog_wait_time_cumul' (or 'backlog_wait_time_cumulative')?

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
> 
> >         }
> >
> >         ab = audit_buffer_alloc(ctx, gfp_mask, type);
> 
> paul moore

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

