Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 37E3FF5380
	for <lists+linux-audit@lfdr.de>; Fri,  8 Nov 2019 19:26:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573237612;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dOVuT5b3hM/wCVj5nh0QXnL50mSEPfanErcwx0tVt9w=;
	b=F/MByVsZ7g6XWtfkimVgJpOCKfSkU5s/K4aM5r7gziK9F74S2v5GeXOLCJVC2sFzD2hcUz
	AUM+CEdZpG8RoCr+tJUNfzXG7C4Y50PZATcfVptTVnTVfhucshwJqykw475xMb7e9tgL+A
	OZxW7F+v3XzRJO+8OXnEVyYmKGe5zzQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-sjQkPEbtNj27_pVysS0J3Q-1; Fri, 08 Nov 2019 13:26:50 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 518558017E0;
	Fri,  8 Nov 2019 18:26:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 46BC35D6BB;
	Fri,  8 Nov 2019 18:26:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 191181803C32;
	Fri,  8 Nov 2019 18:26:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA8IQZl0025836 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 8 Nov 2019 13:26:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A3AE55C557; Fri,  8 Nov 2019 18:26:35 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D87C5C554
	for <linux-audit@redhat.com>; Fri,  8 Nov 2019 18:26:33 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A27B237F73
	for <linux-audit@redhat.com>; Fri,  8 Nov 2019 18:26:31 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id e9so7179794ljp.13
	for <linux-audit@redhat.com>; Fri, 08 Nov 2019 10:26:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yfrqk4oAZSRdxNXU7NWHV3s/qknksusoqMId/97+bh8=;
	b=LSHMUL/YrMgHbns87XhIxLalGhbOsHKXrjw5TQWXg6uDkFjLnHUop2moxE8lYAR0ep
	J4rmvHl5PWMyRdBlVXpYLoTPEyrLwWV5nSn2b2VaEmLVqoF72jaX3lsHPOoQzb7HgPKr
	2d9fmFDPwlNnqrhM9y0UmWVW7qHP99oDZutT3WT5oyOdLiv4OIjbYI+lpchiDixK1TPg
	mY92OkmLLe6h9/uwiz9woPyEWzFunyp38tLCVKGPq5y4WysyZXU7+t3dLQ1v3Ui9H5gI
	5Gh1pYuM/FEnN5SHEgIrSzbP63aL3npGI0YQ5Rc2dJeNCz3GWGKZCW0JGbkKpysFIMh+
	/YZg==
X-Gm-Message-State: APjAAAWhPNDRXPSkHBFYYYI79NuvKNDR3q288mZ6VQmYhv7jYn+PIgsb
	kc2ulcX93K0taQwtMX3+A3tLax6IweHhUNNfzrPk
X-Google-Smtp-Source: APXvYqw1CojLXlLXhi44VGUdhNOsRF4p9i8B7yLeQIjTFUXYF7RTFSwfHA6RC+gtdGcnk7X56NGlBF0xrTDt5/lxnqc=
X-Received: by 2002:a2e:85d5:: with SMTP id h21mr7824291ljj.243.1573237589836; 
	Fri, 08 Nov 2019 10:26:29 -0800 (PST)
MIME-Version: 1.0
References: <cover.1568834524.git.rgb@redhat.com>
	<6fb4e270bfafef3d0477a06b0365fdcc5a5305b5.1568834524.git.rgb@redhat.com>
	<CAHC9VhS2111YTQ_rbHKe6+n9coPNbcTJqf5wnBx9LYHSf69THA@mail.gmail.com>
	<20191025210004.jzkenjg6jrka22ak@madcap2.tricolour.ca>
In-Reply-To: <20191025210004.jzkenjg6jrka22ak@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 8 Nov 2019 13:26:18 -0500
Message-ID: <CAHC9VhRMJkeC7HkAMr1TwymtT7eHOB_B=_28R6zVfQQk-gW-DA@mail.gmail.com>
Subject: Re: [PATCH ghak90 V7 04/21] audit: convert to contid list to check
	for orch/engine ownership
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 08 Nov 2019 18:26:32 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Fri, 08 Nov 2019 18:26:32 +0000 (UTC) for IP:'209.85.208.196'
	DOMAIN:'mail-lj1-f196.google.com'
	HELO:'mail-lj1-f196.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.196 mail-lj1-f196.google.com 209.85.208.196
	mail-lj1-f196.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-MC-Unique: sjQkPEbtNj27_pVysS0J3Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2019 at 5:00 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2019-10-10 20:38, Paul Moore wrote:
> > On Wed, Sep 18, 2019 at 9:24 PM Richard Guy Briggs <rgb@redhat.com> wro=
te:
> > > Store the audit container identifier in a refcounted kernel object th=
at
> > > is added to the master list of audit container identifiers.  This wil=
l
> > > allow multiple container orchestrators/engines to work on the same
> > > machine without danger of inadvertantly re-using an existing identifi=
er.
> > > It will also allow an orchestrator to inject a process into an existi=
ng
> > > container by checking if the original container owner is the one
> > > injecting the task.  A hash table list is used to optimize searches.
> > >
> > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > ---
> > >  include/linux/audit.h | 26 ++++++++++++++--
> > >  kernel/audit.c        | 86 +++++++++++++++++++++++++++++++++++++++++=
+++++++---
> > >  kernel/audit.h        |  8 +++++
> > >  3 files changed, 112 insertions(+), 8 deletions(-)
> >
> > One general comment before we go off into the weeds on this ... I can
> > understand why you wanted to keep this patch separate from the earlier
> > patches, but as we get closer to having mergeable code this should get
> > folded into the previous patches.  For example, there shouldn't be a
> > change in audit_task_info where you change the contid field from a u64
> > to struct pointer, it should be a struct pointer from the start.
>
> I should have marked this patchset as RFC even though it was v7 due to a
> lot of new ideas/code that was added with uncertainties needing comment
> and direction.
>
> > It's also disappointing that idr appears to only be for 32-bit ID
> > values, if we had a 64-bit idr I think we could simplify this greatly.
>
> Perhaps.  I do still see value in letting the orchestrator choose the
> value.

Agreed.  I was just thinking out loud that it seems like much of what
we need could be a generic library mechanism similar to, but not quite
like, the existing idr code.

> > > diff --git a/include/linux/audit.h b/include/linux/audit.h
> > > index f2e3b81f2942..e317807cdd3e 100644
> > > --- a/include/linux/audit.h
> > > +++ b/include/linux/audit.h
> > > @@ -95,10 +95,18 @@ struct audit_ntp_data {
> > >  struct audit_ntp_data {};
> > >  #endif
> > >
> > > +struct audit_cont {
> > > +       struct list_head        list;
> > > +       u64                     id;
> > > +       struct task_struct      *owner;
> > > +       refcount_t              refcount;
> > > +       struct rcu_head         rcu;
> > > +};
> >
> > It seems as though in most of the code you are using "contid", any
> > reason why didn't stick with that naming scheme here, e.g. "struct
> > audit_contid"?
>
> I was using contid to refer to the value itself and cont to refer to the
> refcounted object.  I find cont a bit too terse, so I'm still thinking
> of changing it.  Perhaps contobj?

Yes, just "cont" is a bit too ambiguous considering we have both
integer values and structures being passed around.  Whatever you
decide on, a common base with separate suffixes seems like a good
idea.

FWIW, I still think the "audit container ID" : "ACID" thing is kinda funny =
;)

> > > @@ -203,11 +211,15 @@ static inline unsigned int audit_get_sessionid(=
struct task_struct *tsk)
> > >
> > >  static inline u64 audit_get_contid(struct task_struct *tsk)
> > >  {
> > > -       if (!tsk->audit)
> > > +       if (!tsk->audit || !tsk->audit->cont)
> > >                 return AUDIT_CID_UNSET;
> > > -       return tsk->audit->contid;
> > > +       return tsk->audit->cont->id;
> > >  }
> >
> > Assuming for a moment that we implement an audit_contid_get() (see
> > Neil's comment as well as mine below), we probably need to name this
> > something different so we don't all lose our minds when we read this
> > code.  On the plus side we can probably preface it with an underscore
> > since it is a static, in which case _audit_contid_get() might be okay,
> > but I'm open to suggestions.
>
> I'm fine with the "_" prefix, can you point to precedent or convention?

Generally kernel functions which are "special"/private/unsafe/etc.
have a one, or two, underscore prefix.  If you don't want to add the
prefix, that's fine, but please change the name as mentioned
previously.

> > > @@ -231,7 +235,9 @@ int audit_alloc(struct task_struct *tsk)
> > >         }
> > >         info->loginuid =3D audit_get_loginuid(current);
> > >         info->sessionid =3D audit_get_sessionid(current);
> > > -       info->contid =3D audit_get_contid(current);
> > > +       info->cont =3D audit_cont(current);
> > > +       if (info->cont)
> > > +               refcount_inc(&info->cont->refcount);
> >
> > See the other comments about a "get" function, but I think we need a
> > RCU read lock around the above, no?
>
> The rcu read lock is to protect the list rather than the cont object
> itself, the latter of which is protected by its refcount.

What protects you from info->cont going away between when you fetch
the pointer via audit_cont() to when you dereference it in
refcount_inc()?

> > > @@ -2397,8 +2438,43 @@ int audit_set_contid(struct task_struct *task,=
 u64 contid)
> > >         else if (audit_contid_set(task))
> > >                 rc =3D -ECHILD;
> > >         read_unlock(&tasklist_lock);
> > > -       if (!rc)
> > > -               task->audit->contid =3D contid;
> > > +       if (!rc) {
> > > +               struct audit_cont *oldcont =3D audit_cont(task);
> >
> > Previously we held the tasklist_lock to protect the audit container ID
> > associated with the struct, should we still be holding it here?
>
> We held the tasklist_lock to protect access to the target task's
> child/parent/thread relationships.

What protects us in the case of simultaneous calls to audit_set_contid()?

> > Regardless, I worry that the lock dependencies between the
> > tasklist_lock and the audit_contid_list_lock are going to be tricky.
> > It might be nice to document the relationship in a comment up near
> > where you declare audit_contid_list_lock.
>
> I don't think there should be a conflict between the two.
>
> The contid_list_lock doesn't care if the cont object is associated to a
> particular task.

Please document the relationship between the two, I worry we could
easily run into lockdep problems without a clearly defined ordering.

> > > +               struct audit_cont *cont =3D NULL;
> > > +               struct audit_cont *newcont =3D NULL;
> > > +               int h =3D audit_hash_contid(contid);
> > > +
> > > +               spin_lock(&audit_contid_list_lock);
> > > +               list_for_each_entry_rcu(cont, &audit_contid_hash[h], =
list)
> > > +                       if (cont->id =3D=3D contid) {
> > > +                               /* task injection to existing contain=
er */
> > > +                               if (current =3D=3D cont->owner) {
> >
> > I understand the desire to limit a given audit container ID to the
> > orchestrator that created it, but are we certain that we can track
> > audit container ID "ownership" via a single instance of a task_struct?
>
> Are you suggesting that a task_struct representing a task may be
> replaced for a specific task?  I don't believe that will ever happen.
>
> >  What happens when the orchestrator stops/restarts/crashes?  Do we
> > even care?
>
> Reap all of its containers?

These were genuine questions, I'm not suggesting anything in
particular, I'm just curious about how we handle an orchestrator that
isn't continuously running ... is this possible?  Do we care?

--=20
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

