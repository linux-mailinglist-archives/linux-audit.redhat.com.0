Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id AA23F217CC1
	for <lists+linux-audit@lfdr.de>; Wed,  8 Jul 2020 03:45:50 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-ZPd3rldFPxunUP3L0TDe3g-1; Tue, 07 Jul 2020 21:45:47 -0400
X-MC-Unique: ZPd3rldFPxunUP3L0TDe3g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBDA4461;
	Wed,  8 Jul 2020 01:45:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2F547FE9C;
	Wed,  8 Jul 2020 01:45:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C376C72F76;
	Wed,  8 Jul 2020 01:45:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0681gluI005039 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 7 Jul 2020 21:42:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C67518288B; Wed,  8 Jul 2020 01:42:47 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C1B1182892
	for <linux-audit@redhat.com>; Wed,  8 Jul 2020 01:42:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE2068EF3A4
	for <linux-audit@redhat.com>; Wed,  8 Jul 2020 01:42:45 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-31-PmSFpjqVOwi_fwOoootulg-1; Tue, 07 Jul 2020 21:42:43 -0400
X-MC-Unique: PmSFpjqVOwi_fwOoootulg-1
Received: by mail-ed1-f66.google.com with SMTP id b15so40276461edy.7
	for <linux-audit@redhat.com>; Tue, 07 Jul 2020 18:42:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Vr0HrDNNXcQz20CPEZA0xNxAWROxrJKqR4BgLb+gX4s=;
	b=OzbPlHRlbGZqCIQgx0yPXq8v7LboDi07qrq/PBR5jcuU2xm09x/CnYOl6wAwXmZsxA
	SWI6TMMaBwAxBBHtn9npOjzrDQqDg5qAx/2G2lZDO9MxmIpb52VzMmund+GW+rxeUcw8
	uiMf8ZcYzLvtQHo0JE5OTbRnPAwZ9cM4aSLHSPEEj2UeIEJvRHRiaNtyK/7+mYiqyliD
	RCjluRfVQWhDecS9aSUTDK5lwUCg4xkgr/m0geb+3TFQ+Ur1Bsber259SVrM7Iqm6SPw
	F3gGLTWcptkdyVOnzPfezE4iBYOOX1dWuPHsxCfaPhLIscyG4MCJUluwc8Jyt5kHAVkH
	0kpg==
X-Gm-Message-State: AOAM532uKlWLBQDStuZJJxyL9HlKDrPzH8Le+u3tUkpTbOFa3SBG4Tns
	RmmO2z7YrgU11kqsGCjrCyl16/pHxS2Mw7ZIlip2
X-Google-Smtp-Source: ABdhPJwO+ZDB5KAHb6lbjzYaXLS3ryyhdLtNi06zlDHVmSwDEOn6n4tDRWttj6dBFy4xjaW4NpkPFMWLHPakgoFSOcQ=
X-Received: by 2002:aa7:d6cf:: with SMTP id x15mr62837018edr.164.1594172561943;
	Tue, 07 Jul 2020 18:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593198710.git.rgb@redhat.com>
	<6abeb26e64489fc29b00c86b60b501c8b7316424.1593198710.git.rgb@redhat.com>
	<CAHC9VhTx=4879F1MSXg4=Xd1i5rhEtyam6CakQhy=_ZjGtTaMA@mail.gmail.com>
	<20200707025014.x33eyxbankw2fbww@madcap2.tricolour.ca>
In-Reply-To: <20200707025014.x33eyxbankw2fbww@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 7 Jul 2020 21:42:31 -0400
Message-ID: <CAHC9VhTTGLf9MPS_FgL1ibUVoH+YzMtPK6+2dp_j8a5o9fzftA@mail.gmail.com>
Subject: Re: [PATCH ghak90 V9 01/13] audit: collect audit task parameters
To: Richard Guy Briggs <rgb@redhat.com>
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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

On Mon, Jul 6, 2020 at 10:50 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-07-05 11:09, Paul Moore wrote:
> > On Sat, Jun 27, 2020 at 9:21 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> > >
> > > The audit-related parameters in struct task_struct should ideally be
> > > collected together and accessed through a standard audit API.
> > >
> > > Collect the existing loginuid, sessionid and audit_context together in a
> > > new struct audit_task_info called "audit" in struct task_struct.
> > >
> > > Use kmem_cache to manage this pool of memory.
> > > Un-inline audit_free() to be able to always recover that memory.
> > >
> > > Please see the upstream github issue
> > > https://github.com/linux-audit/audit-kernel/issues/81
> > >
> > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > Acked-by: Neil Horman <nhorman@tuxdriver.com>
> > > Reviewed-by: Ondrej Mosnacek <omosnace@redhat.com>
> > > ---
> > >  include/linux/audit.h | 49 +++++++++++++++++++++++------------
> > >  include/linux/sched.h |  7 +----
> > >  init/init_task.c      |  3 +--
> > >  init/main.c           |  2 ++
> > >  kernel/audit.c        | 71 +++++++++++++++++++++++++++++++++++++++++++++++++--
> > >  kernel/audit.h        |  5 ++++
> > >  kernel/auditsc.c      | 26 ++++++++++---------
> > >  kernel/fork.c         |  1 -
> > >  8 files changed, 124 insertions(+), 40 deletions(-)
> > >
> > > diff --git a/include/linux/audit.h b/include/linux/audit.h
> > > index 3fcd9ee49734..c2150415f9df 100644
> > > --- a/include/linux/audit.h
> > > +++ b/include/linux/audit.h
> > > @@ -100,6 +100,16 @@ enum audit_nfcfgop {
> > >         AUDIT_XT_OP_UNREGISTER,
> > >  };
> > >
> > > +struct audit_task_info {
> > > +       kuid_t                  loginuid;
> > > +       unsigned int            sessionid;
> > > +#ifdef CONFIG_AUDITSYSCALL
> > > +       struct audit_context    *ctx;
> > > +#endif
> > > +};
> > > +
> > > +extern struct audit_task_info init_struct_audit;
> > > +
> > >  extern int is_audit_feature_set(int which);
> > >
> > >  extern int __init audit_register_class(int class, unsigned *list);
> >
> > ...
> >
> > > diff --git a/include/linux/sched.h b/include/linux/sched.h
> > > index b62e6aaf28f0..2213ac670386 100644
> > > --- a/include/linux/sched.h
> > > +++ b/include/linux/sched.h
> > > @@ -34,7 +34,6 @@
> > >  #include <linux/kcsan.h>
> > >
> > >  /* task_struct member predeclarations (sorted alphabetically): */
> > > -struct audit_context;
> > >  struct backing_dev_info;
> > >  struct bio_list;
> > >  struct blk_plug;
> > > @@ -946,11 +945,7 @@ struct task_struct {
> > >         struct callback_head            *task_works;
> > >
> > >  #ifdef CONFIG_AUDIT
> > > -#ifdef CONFIG_AUDITSYSCALL
> > > -       struct audit_context            *audit_context;
> > > -#endif
> > > -       kuid_t                          loginuid;
> > > -       unsigned int                    sessionid;
> > > +       struct audit_task_info          *audit;
> > >  #endif
> > >         struct seccomp                  seccomp;
> >
> > In the early days of this patchset we talked a lot about how to handle
> > the task_struct and the changes that would be necessary, ultimately
> > deciding that encapsulating all of the audit fields into an
> > audit_task_info struct.  However, what is puzzling me a bit at this
> > moment is why we are only including audit_task_info in task_info by
> > reference *and* making it a build time conditional (via CONFIG_AUDIT).
> >
> > If audit is enabled at build time it would seem that we are always
> > going to allocate an audit_task_info struct, so I have to wonder why
> > we don't simply embed it inside the task_info struct (similar to the
> > seccomp struct in the snippet above?  Of course the audit_context
> > struct needs to remain as is, I'm talking only about the
> > task_info/audit_task_info struct.
>
> I agree that including the audit_task_info struct in the struct
> task_struct would have been preferred to simplify allocation and free,
> but the reason it was included by reference instead was to make the
> task_struct size independent of audit so that future changes would not
> cause as many kABI challenges.  This first change will cause kABI
> challenges regardless, but it was future ones that we were trying to
> ease.
>
> Does that match with your recollection?

I guess, sure.  I suppose what I was really asking was if we had a
"good" reason for not embedding the audit_task_info struct.
Regardless, thanks for the explanation, that was helpful.

>From an upstream perspective, I think embedding the audit_task_info
struct is the Right Thing To Do.  The code is cleaner and more robust
if we embed the struct.

> > Richard, I'm sure you can answer this off the top of your head, but
> > I'd have to go digging through the archives to pull out the relevant
> > discussions so I figured I would just ask you for a reminder ... ?  I
> > imagine it's also possible things have changed a bit since those early
> > discussions and the solution we arrived at then no longer makes as
> > much sense as it did before.
>
> Agreed, it doesn't make as much sense now as it did when proposed, but
> will make more sense in the future depending on when this change gets
> accepted upstream.  This is why I wanted this patch to go through as
> part of ghak81 at the time the rest of it did so that future kABI issues
> would be easier to handle, but that ship has long sailed.

To be clear, kABI issues with task_struct really aren't an issue with
the upstream kernel.  I know that you know all of this already
Richard, I'm mostly talking to everyone else on the To/CC line in case
they are casually watching this discussion.

While I'm sympathetic to long-lifetime enterprise distros such as
RHEL, my responsibility is to ensure the upstream kernel is as good as
we can make it, and in this case I believe that means embedding
audit_task_info into the task_struct.

> I didn't make
> that argument then and I regret it now that I realize and recall some of
> the thinking behind the change.  Your reasons at the time were that
> contid was the only user of that change but there have been some
> CONFIG_AUDIT and CONFIG_AUDITSYSCALL changes since that were related.

Agreed that there are probably some common goals and benefits with
those changes and the audit container ID work, however, I believe that
discussion quickly goes back to upstream vs RHEL.

> > > diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> > > index 468a23390457..f00c1da587ea 100644
> > > --- a/kernel/auditsc.c
> > > +++ b/kernel/auditsc.c
> > > @@ -1612,7 +1615,6 @@ void __audit_free(struct task_struct *tsk)
> > >                 if (context->current_state == AUDIT_RECORD_CONTEXT)
> > >                         audit_log_exit();
> > >         }
> > > -
> > >         audit_set_context(tsk, NULL);
> > >         audit_free_context(context);
> > >  }
> >
> > This nitpick is barely worth the time it is taking me to write this,
> > but the whitespace change above isn't strictly necessary.
>
> Sure, it is a harmless but noisy cleanup when the function was being
> cleaned up and renamed.  It wasn't an accident, but a style preference.
> Do you prefer a vertical space before cleanup actions at the end of
> functions and more versus less vertical whitespace in general?

As I mentioned above, this really was barely worth mentioning, but I
made the comment simply because I feel this patchset is going to draw
a lot of attention once it is merged and I feel keeping the patchset
as small, and as focused, as possible is a good thing.

However, I'm not going to lose even a second of sleep over a single
blank line gone missing ;)

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

