Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id DC79B2311F1
	for <lists+linux-audit@lfdr.de>; Tue, 28 Jul 2020 20:47:58 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-rmsPyGvtNm-OkakrbYKq8g-1; Tue, 28 Jul 2020 14:47:55 -0400
X-MC-Unique: rmsPyGvtNm-OkakrbYKq8g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2328519057A4;
	Tue, 28 Jul 2020 18:47:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C2A210013D0;
	Tue, 28 Jul 2020 18:47:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 70E401809554;
	Tue, 28 Jul 2020 18:47:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06SIlTuX024777 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 28 Jul 2020 14:47:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E4CAF217B43F; Tue, 28 Jul 2020 18:47:28 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E08AE201B0C7
	for <linux-audit@redhat.com>; Tue, 28 Jul 2020 18:47:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 055BB10DD0BF
	for <linux-audit@redhat.com>; Tue, 28 Jul 2020 18:47:26 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
	[209.85.218.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-195-KLv7ygfJMxemqYIqXZ3_cA-1; Tue, 28 Jul 2020 14:47:23 -0400
X-MC-Unique: KLv7ygfJMxemqYIqXZ3_cA-1
Received: by mail-ej1-f68.google.com with SMTP id y10so21726493eje.1
	for <linux-audit@redhat.com>; Tue, 28 Jul 2020 11:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RHme3szJG57THviAFDtI8ALNUZE+ck40dQoU8yD9gs0=;
	b=uXbRK6JAdvdtN3iIUPfLVIEkCKa2SOA6S+K2WfCCq4gHcnLLppogM9a9XaQOOH/W6G
	WrEvPYXrd5tCQMvz52tBFEx+7O6RCKojJOQ2MYF58o51veelQOifkd66MxYtnL276eJa
	Kow+qziTvwX5d/FdKxluM2vEEDtbEYDfiFi0CGfsjmzOUWZlOiZus3zs0RrF2VRnIp6m
	WgnCdC8GyepSSXIQH0HpacE1vd7z4zWSK9bh8+74Mu3MALOIPATw8tWDQ647XpvGy+YT
	YzqdOTUQMl8WWHTcE3eKKvAPYnE7/YqVl62sMeowedh3B+8z9rBSL3G+HT4KRgNZAvgQ
	QQQA==
X-Gm-Message-State: AOAM531rNF/baO34EdAZOgdL0jfojrP1TzfvT1QZYDB8RloyBIDBmoNP
	pfDBHCnuzunLjzkafp64vzjBjL7KXARbW2B4RdvR
X-Google-Smtp-Source: ABdhPJzMSUS21e9OmTytEWDzRwGe3HaLZpFO96TYfJZTUwzZg7P/3tVoSea6CGOHTQuVwgT/Vi3m2QOdwfdPmTHyVQ8=
X-Received: by 2002:a17:906:c1d8:: with SMTP id
	bw24mr26107001ejb.91.1595962041256; 
	Tue, 28 Jul 2020 11:47:21 -0700 (PDT)
MIME-Version: 1.0
References: <e3e9c9da9115fd233c5a7895dbb4a698a365b1b0.1595884394.git.rgb@redhat.com>
	<CAHC9VhSx23JiN6GprskxdEcs9uftJOp03Svh7YJbQLOV91AMiQ@mail.gmail.com>
	<20200728162722.djvy3qyclj57wsfn@madcap2.tricolour.ca>
In-Reply-To: <20200728162722.djvy3qyclj57wsfn@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 28 Jul 2020 14:47:10 -0400
Message-ID: <CAHC9VhSDoi8QS3c6Wmx6agmmphja60cS3+aTKVx76xvdkxJ0DQ@mail.gmail.com>
Subject: Re: [PATCH V3fix ghak120] audit: initialize context values in case of
	mandatory events
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: Eric Paris <eparis@parisplace.org>,
	Linux Security Module list <linux-security-module@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 28, 2020 at 12:27 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-07-27 22:14, Paul Moore wrote:
> > On Mon, Jul 27, 2020 at 5:30 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > Issue ghak120 enabled syscall records to accompany required records when
> > > no rules are present to trigger the storage of syscall context.  A
> > > reported issue showed that the cwd was not always initialized.  That
> > > issue was already resolved ...
> >
> > Yes and no.  Yes, it appears to be resolved in v5.8-rc1 and above, but
> > the problematic commit is in v5.7 and I'm not sure backporting the fix
> > in v5.8-rcX plus this patch is the right thing to do for a released
> > kernel.  The lowest risk fix for v5.7 at this point is to do a revert;
>
> Ok, fair enough.  I don't understand why you didn't do the revert since
> it appears so trivial to you and this review and fix turned out to be
> marginally more work.  I didn't understand what you wanted when you
> referred to stable.

I held off on the revert because I thought you might want the chance
to submit the revert with your authorship.  I made an assumption that
it meant the same to you as it does to me; that's my mistake, I should
have known better.

I'll do the revert myself for stable-5.8 (which should trickle down to
v5.7.z with the right metadata), don't bother with it.

> > regardless of what happens with this patch and v5.8-rcX please post a
> > revert for the audit/stable-5.7 tree as soon as you can.
>
> (more below...)
>
> > > ... but a review of all other records that could
> > > be triggered at the time of a syscall record revealed other potential
> > > values that could be missing or misleading.  Initialize them.
> > >
> > > The fds array is reset to -1 after the first syscall to indicate it
> > > isn't valid any more, but was never set to -1 when the context was
> > > allocated to indicate it wasn't yet valid.
> > >
> > > The audit_inode* functions can be called without going through
> > > getname_flags() or getname_kernel() that sets audit_names and cwd, so
> > > set the cwd if it has not already been done so due to audit_names being
> > > valid.
> > >
> > > The LSM dump_common_audit_data() LSM_AUDIT_DATA_NET:AF_UNIX case was
> > > missed with the ghak96 patch, so add that case here.
> > >
> > > Please see issue https://github.com/linux-audit/audit-kernel/issues/120
> > > Please see issue https://github.com/linux-audit/audit-kernel/issues/96
> > > Passes audit-testsuite.
> > >
> > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > ---
> > >  kernel/auditsc.c     | 3 +++
> > >  security/lsm_audit.c | 1 +
> > >  2 files changed, 4 insertions(+)
> > >
> > > diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> > > index 6884b50069d1..2f97618e6a34 100644
> > > --- a/kernel/auditsc.c
> > > +++ b/kernel/auditsc.c
> > > @@ -929,6 +929,7 @@ static inline struct audit_context *audit_alloc_context(enum audit_state state)
> > >         context->prio = state == AUDIT_RECORD_CONTEXT ? ~0ULL : 0;
> > >         INIT_LIST_HEAD(&context->killed_trees);
> > >         INIT_LIST_HEAD(&context->names_list);
> > > +       context->fds[0] = -1;
> > >         return context;
> > >  }
> > >
> > > @@ -2076,6 +2077,7 @@ void __audit_inode(struct filename *name, const struct dentry *dentry,
> > >         }
> > >         handle_path(dentry);
> > >         audit_copy_inode(n, dentry, inode, flags & AUDIT_INODE_NOEVAL);
> > > +       _audit_getcwd(context);
> > >  }
> > >
> > >  void __audit_file(const struct file *file)
> > > @@ -2194,6 +2196,7 @@ void __audit_inode_child(struct inode *parent,
> > >                 audit_copy_inode(found_child, dentry, inode, 0);
> > >         else
> > >                 found_child->ino = AUDIT_INO_UNSET;
> > > +       _audit_getcwd(context);
> > >  }
> > >  EXPORT_SYMBOL_GPL(__audit_inode_child);
> > >
> > > diff --git a/security/lsm_audit.c b/security/lsm_audit.c
> > > index 53d0d183db8f..e93077612246 100644
> > > --- a/security/lsm_audit.c
> > > +++ b/security/lsm_audit.c
> > > @@ -369,6 +369,7 @@ static void dump_common_audit_data(struct audit_buffer *ab,
> > >                                         audit_log_untrustedstring(ab, p);
> > >                                 else
> > >                                         audit_log_n_hex(ab, p, len);
> > > +                               audit_getcwd();
> > >                                 break;
> > >                         }
> > >                 }
> >
> > I understand the "fds[0] = -1" fix in audit_alloc_context()
> > (ironically, the kzalloc() which is supposed to help with cases like
> > this, hurts us with this particular field), but I'm still not quite
> > seeing why we need to sprinkle audit_getcwd() calls everywhere to fix
> > this bug (this seems more like a feature add than a bigfix).  Yes,
> > they may fix the problem but it seems like simply adding a
> > context->pwd test in audit_log_name() similar to what we do in
> > audit_log_exit() is the correct fix.
>
> Well, considering that ghak96 ended up being a bugfix (that wasn't its
> intent), I figured these audit_getcwd() were also bugfixes to prevent
> the same BUG under different calling conditions.
>
> > We are currently at -rc7 and this really needs to land before v5.8 is
> > released, presumably this weekend; this means a small and limited bug
> > fix patch is what is needed.
>
> Ok, so it sounds like rather than just fix it now, it would be better to
> revert it, then submit *one* patch for ghak120 plus this fix that will
> go tentatively upstream in 3 months, fully in 5.  Arguably the last
> chunk above should be added to ghak96, so that should be reverted too,
> then resubmitted with this added chunk (or it could be a fixup chunk
> that would need to be sequenced with ghak120).  As for the middle two
> chunks, they could either be resubmitted with a resubmitted ghak96, or
> with a resubmitted ghak120.  As for the timing of all of these, ghak96
> should be in place before the ghak120 patch, so even resubmitting one
> patch for the combined ghak120 and ghak96 might make more sense.

Sigh.

I can't even reply to that paragraph above without going to GH and
looking up all those different ghak references, which is annoying, and
right now it seems like my time is better spent cleaning up this mess.
I'm not exactly sure what you mean by "one patch", but right now we
are at -rc7 and we've/I've got broken kernels to fix; submit whatever
you want and we'll deal with it when it's posted.

> I know you like only really minimal fixes this late, but this seemed
> pretty minimal to me...

Minimal is a one (two?) line NULL check in audit_log_name(), this
patch is not that.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

