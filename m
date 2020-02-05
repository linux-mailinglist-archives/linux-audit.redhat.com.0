Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3B872153B26
	for <lists+linux-audit@lfdr.de>; Wed,  5 Feb 2020 23:41:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580942483;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LabfwLpt7KFZXpVXZ5p7p7aZPjfT1UlWlpj9CzDsnpw=;
	b=Eag7oEHGHProy6G/TUHTt2lcetQL/1VeGgfdo9iCdskeIWDgRwcd0kEUlpd6mCxBRqxipK
	FE9iZ74al6Vd/mQsGLTWnHaQJuz1xup6lB1B53n7IWb4IjTt03bu88GSFnwHwpOyOMvuSx
	cH/oG8SuOT0lO2diU6GJCvc19Vt9wF8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16--4O628m0NwGq3fAt9JCMlw-1; Wed, 05 Feb 2020 17:41:20 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C76C1800D54;
	Wed,  5 Feb 2020 22:41:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 157AEF6DE;
	Wed,  5 Feb 2020 22:41:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 00F2B85CD1;
	Wed,  5 Feb 2020 22:41:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 015MerPV028137 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 5 Feb 2020 17:40:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BD267F77B4; Wed,  5 Feb 2020 22:40:53 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8833F4975
	for <linux-audit@redhat.com>; Wed,  5 Feb 2020 22:40:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E531018AE95B
	for <linux-audit@redhat.com>; Wed,  5 Feb 2020 22:40:51 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-234-EybXzIQkPrGfqCAZo3Gv1w-1; Wed, 05 Feb 2020 17:40:49 -0500
Received: by mail-ed1-f65.google.com with SMTP id j17so3848938edp.3
	for <linux-audit@redhat.com>; Wed, 05 Feb 2020 14:40:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8xXG1QtEMIn8V9gNjRgmErq86awhNCCbmdyeTvn2xh4=;
	b=NgqDXW4LZ25ijXSjnx6PaVAAD87Aw78DKfW9emHhnNTbOEEIOm4uXNSV4Io6broUEP
	wqqwQEZOgoPY+RqerSfgift4vXLF3InRUr0TufQEPqt7JM4QXXrl3q/Tvs7bTDaV9rnM
	p7EPcPvecfYoiSBf7vY9EEZeB7Wd7ZrYeQDLqqo/Vm19gMcHQ7Jov1hH30S3ixnG4QAa
	2chk2zXtaBdYrQLQIdWNHRsgbkL788yQp1EheXjNJdrM4haVJBobSz68ANhejYdak8SV
	cDIGz0Z9Kjz+PRldu8lxA6OpXnPshj9WzTMxGUgOLG8abvFw23/nW0XA5OkowJC0X/uU
	r/gg==
X-Gm-Message-State: APjAAAVJlvsltdPGti9XeF0fsFyLgIYviw2k/t7UjjG4Pvm8/1x5vBUf
	a6+lsGLR5jhsvkPZIu8t2WLYcTTvaGNRKd2FpQx3
X-Google-Smtp-Source: APXvYqyVmzGVk7l0HXNY4hEqVOGOlb69aaI9jrvMLTASMwXkrAFjGVXWNm6juE48f6syGPPLenhCV6x6YfwAuvnC2Wk=
X-Received: by 2002:a50:a7a5:: with SMTP id i34mr396051edc.128.1580942447650; 
	Wed, 05 Feb 2020 14:40:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577736799.git.rgb@redhat.com>
	<a911acf0b209c05dc156fb6b57f9da45778747ce.1577736799.git.rgb@redhat.com>
	<CAHC9VhRRW2fFcgBs-R_BZ7ZWCP5wsXA9DB1RUM=QeKj2xZkS2Q@mail.gmail.com>
	<20200204225148.io3ayosk4efz2qii@madcap2.tricolour.ca>
In-Reply-To: <20200204225148.io3ayosk4efz2qii@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 5 Feb 2020 17:40:36 -0500
Message-ID: <CAHC9VhQSZDt4KyFmc9TtLvKgziMCkPzRWdwa71Juo=LZRygfVA@mail.gmail.com>
Subject: Re: [PATCH ghak90 V8 04/16] audit: convert to contid list to check
	for orch/engine ownership
To: Richard Guy Briggs <rgb@redhat.com>
X-MC-Unique: EybXzIQkPrGfqCAZo3Gv1w-1
X-MC-Unique: -4O628m0NwGq3fAt9JCMlw-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 015MerPV028137
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 4, 2020 at 5:52 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-01-22 16:28, Paul Moore wrote:
> > On Tue, Dec 31, 2019 at 2:50 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > >
> > > Store the audit container identifier in a refcounted kernel object that
> > > is added to the master list of audit container identifiers.  This will
> > > allow multiple container orchestrators/engines to work on the same
> > > machine without danger of inadvertantly re-using an existing identifier.
> > > It will also allow an orchestrator to inject a process into an existing
> > > container by checking if the original container owner is the one
> > > injecting the task.  A hash table list is used to optimize searches.
> > >
> > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > ---
> > >  include/linux/audit.h | 14 ++++++--
> > >  kernel/audit.c        | 98 ++++++++++++++++++++++++++++++++++++++++++++++++---
> > >  kernel/audit.h        |  8 +++++
> > >  3 files changed, 112 insertions(+), 8 deletions(-)

...

> > > @@ -232,7 +263,11 @@ int audit_alloc(struct task_struct *tsk)
> > >         }
> > >         info->loginuid = audit_get_loginuid(current);
> > >         info->sessionid = audit_get_sessionid(current);
> > > -       info->contid = audit_get_contid(current);
> > > +       spin_lock(&audit_contobj_list_lock);
> > > +       info->cont = _audit_contobj(current);
> > > +       if (info->cont)
> > > +               _audit_contobj_hold(info->cont);
> > > +       spin_unlock(&audit_contobj_list_lock);
> >
> > If we are taking a spinlock in order to bump the refcount, does it
> > really need to be a refcount_t or can we just use a normal integer?
> > In RCU protected lists a spinlock is usually used to protect
> > adds/removes to the list, not the content of individual list items.
> >
> > My guess is you probably want to use the spinlock as described above
> > (list add/remove protection) and manipulate the refcount_t inside a
> > RCU read lock protected region.
>
> Ok, I guess it could be an integer if it were protected by the spinlock,
> but I think you've guessed my intent, so let us keep it as a refcount
> and tighten the spinlock scope and use rcu read locking to protect _get
> and _put in _alloc, _free, and later on when protecting the network
> namespace contobj lists.  This should reduce potential contention for
> the spinlock to one location over fewer lines of code in that place
> while speeding up updates and slightly simplifying code in the others.

If it helps, you should be able to find plenty of rcu/spinlock
protected list examples in the kernel code.  It might be a good idea
if you spent some time looking at those implementations first to get
an idea of how it is usually done.

> > > @@ -2381,9 +2425,12 @@ int audit_set_contid(struct task_struct *task, u64 contid)
> > >         }
> > >         oldcontid = audit_get_contid(task);
> > >         read_lock(&tasklist_lock);
> > > -       /* Don't allow the audit containerid to be unset */
> > > +       /* Don't allow the contid to be unset */
> > >         if (!audit_contid_valid(contid))
> > >                 rc = -EINVAL;
> > > +       /* Don't allow the contid to be set to the same value again */
> > > +       else if (contid == oldcontid) {
> > > +               rc = -EADDRINUSE;
> >
> > First, is that brace a typo?  It looks like it.  Did this compile?
>
> Yes, it was fixed in the later patch that restructured the if
> statements.

Generic reminder that each patch should compile and function on it's
own without the need for any follow-up patches.  I know Richard is
already aware of that, and this was a mistake that slipped through the
cracks; this reminder is more for those who may be lurking on the
list.

> > Second, can you explain why (re)setting the audit container ID to the
> > same value is something we need to prohibit?  I'm guessing it has
> > something to do with explicitly set vs inherited, but I don't want to
> > assume too much about your thinking behind this.
>
> It made the refcounting more complicated later, and besides, the
> prohibition on setting the contid again if it is already set would catch
> this case, so I'll remove it in this patch and ensure this action
> doesn't cause a problem in later patches.
>
> > If it is "set vs inherited", would allowing an orchestrator to
> > explicitly "set" an inherited audit container ID provide some level or
> > protection against moving the task?
>
> I can't see it helping prevent this since later descendancy checks will
> stop this move anyways.

That's what I thought, but I was just trying to think of any reason
why you felt this might have been useful since it was in the patch.
If it's in the patch I tend to fall back on the idea that it must have
served a purpose ;)

> > > @@ -2396,8 +2443,49 @@ int audit_set_contid(struct task_struct *task, u64 contid)
> > >         else if (audit_contid_set(task))
> > >                 rc = -ECHILD;
> > >         read_unlock(&tasklist_lock);
> > > -       if (!rc)
> > > -               task->audit->contid = contid;
> > > +       if (!rc) {
> > > +               struct audit_contobj *oldcont = _audit_contobj(task);
> > > +               struct audit_contobj *cont = NULL, *newcont = NULL;
> > > +               int h = audit_hash_contid(contid);
> > > +
> > > +               rcu_read_lock();
> > > +               list_for_each_entry_rcu(cont, &audit_contid_hash[h], list)
> > > +                       if (cont->id == contid) {
> > > +                               /* task injection to existing container */
> > > +                               if (current == cont->owner) {
> >
> > Do we have any protection against the task pointed to by cont->owner
> > going away and a new task with the same current pointer value (no
> > longer the legitimate audit container ID owner) manipulating the
> > target task's audit container ID?
>
> Yes, the get_task_struct() call below.

Gotcha.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

