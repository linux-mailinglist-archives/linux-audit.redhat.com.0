Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id ED13324E0BB
	for <lists+linux-audit@lfdr.de>; Fri, 21 Aug 2020 21:37:32 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-PgQnBh9MPhGZc4XlLYZwLg-1; Fri, 21 Aug 2020 15:37:28 -0400
X-MC-Unique: PgQnBh9MPhGZc4XlLYZwLg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C65B80733E;
	Fri, 21 Aug 2020 19:37:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 30B627C53A;
	Fri, 21 Aug 2020 19:37:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 61C5C662BD;
	Fri, 21 Aug 2020 19:37:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07LJb6RB013770 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 15:37:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DC13E2022795; Fri, 21 Aug 2020 19:37:06 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D795820110C9
	for <linux-audit@redhat.com>; Fri, 21 Aug 2020 19:37:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 892DC1815DC4
	for <linux-audit@redhat.com>; Fri, 21 Aug 2020 19:37:04 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
	[209.85.218.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-141-BOKQiZ3SNbW39XW9UVG6kQ-1; Fri, 21 Aug 2020 15:37:02 -0400
X-MC-Unique: BOKQiZ3SNbW39XW9UVG6kQ-1
Received: by mail-ej1-f68.google.com with SMTP id m22so3668880eje.10
	for <linux-audit@redhat.com>; Fri, 21 Aug 2020 12:37:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jQURKxDjRWMiMTxRUVV2iQZ2ZeobDW7AH50DwoJj7f8=;
	b=MStiPkGrodYMl2QM8uckGl+gm3urgAqaCbBl/dMqtxzT7c8Hn/zpY8v1tfZERAIVPp
	IG7TxO3ovEQMaY5m68poaHyfXw9UdLaXecEjkxYllz67d11VPCwhz91nsJmgNlvV3mIp
	hjAZRsH7vtRHNXep+J6rTVie5/IPhVc6LAYLskMpBEZiSkJZYFedUNqEFQlmZCu/Hiay
	u0lcg8cO1wRPisA178ee/kZoSkmNzJjBc9fIp+iCJSAeC6YV530tZQldwU04q9BQHb4h
	3Uufdu1dLOc2/5K2vV2ej8VYmkOm1MdPaWyTV/lRqsgEI2K/qTq67wEkQJzxiF315svK
	+1tg==
X-Gm-Message-State: AOAM533A7Xex8m8kVO5E+r0bMN0UgM79f/7z4t2wHdMLp4VRdN+fak1f
	2yElf9367PChB9L5ezKvUtdRm/JTC9iSnR9cOTAp
X-Google-Smtp-Source: ABdhPJxv9ljf/EC5lZy/k36EEbz/l4zL+9SOFpsYjODOPjAFI0K0Ji1ACIURRzkOqqw0PrvW8Opqs3fti74vNH7Daus=
X-Received: by 2002:a17:906:43c9:: with SMTP id
	j9mr4383574ejn.542.1598038620869; 
	Fri, 21 Aug 2020 12:37:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593198710.git.rgb@redhat.com>
	<e5a1ab6955c565743372b392a93f7d1ac98478a2.1593198710.git.rgb@redhat.com>
	<CAHC9VhSgcOS79spSuFDMukw2TnLZfBh2p4BWGfoV_CGUS8b77w@mail.gmail.com>
	<20200729200545.5apwc7fashwsnglj@madcap2.tricolour.ca>
In-Reply-To: <20200729200545.5apwc7fashwsnglj@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 21 Aug 2020 15:36:49 -0400
Message-ID: <CAHC9VhQTiu+yY6cY8tvBf-1ZtZrre3Ljs+Zd6Jf9ZM766bhUYQ@mail.gmail.com>
Subject: Re: [PATCH ghak90 V9 02/13] audit: add container id
To: Richard Guy Briggs <rgb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 29, 2020 at 4:06 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-07-05 11:09, Paul Moore wrote:
> > On Sat, Jun 27, 2020 at 9:22 AM Richard Guy Briggs <rgb@redhat.com> wrote:

...

> > > @@ -212,6 +219,33 @@ void __init audit_task_init(void)
> > >                                              0, SLAB_PANIC, NULL);
> > >  }
> > >
> > > +/* rcu_read_lock must be held by caller unless new */
> > > +static struct audit_contobj *_audit_contobj_hold(struct audit_contobj *cont)
> > > +{
> > > +       if (cont)
> > > +               refcount_inc(&cont->refcount);
> > > +       return cont;
> > > +}
> > > +
> > > +static struct audit_contobj *_audit_contobj_get(struct task_struct *tsk)
> > > +{
> > > +       if (!tsk->audit)
> > > +               return NULL;
> > > +       return _audit_contobj_hold(tsk->audit->cont);
> > > +}
> > > +
> > > +/* rcu_read_lock must be held by caller */
> > > +static void _audit_contobj_put(struct audit_contobj *cont)
> > > +{
> > > +       if (!cont)
> > > +               return;
> > > +       if (refcount_dec_and_test(&cont->refcount)) {
> > > +               put_task_struct(cont->owner);
> > > +               list_del_rcu(&cont->list);
> >
> > You should check your locking; I'm used to seeing exclusive locks
> > (e.g. the spinlock) around list adds/removes, it just reads/traversals
> > that can be done with just the RCU lock held.
>
> Ok, I've redone the locking yet again.  I knew this on one level but
> that didn't translate consistently to code...
>
> > > +               kfree_rcu(cont, rcu);
> > > +       }
> > > +}
> >
> > Another nitpick, but it might be nice to have similar arguments to the
> > _get() and _put() functions, e.g. struct audit_contobj, but that is
> > some serious bikeshedding (basically rename _hold() to _get() and
> > rename _hold to audit_task_contid_hold() or similar).
>
> I have some idea what you are trying to say, but I think you misspoke.
> Did you mean rename _hold to _get, rename _get to
> audit_task_contobj_hold()?

It reads okay to me, but I know what I'm intending here :)  I agree it
could be a bit confusing.  Let me try to put my suggestion into some
quick pseudo-code function prototypes to make things a bit more
concrete.

The _audit_contobj_hold() function would become:
   struct audit_contobj *_audit_contobj_hold(struct task_struct *tsk);

The _audit_contobj_get() function would become:
   struct audit_contobj *_audit_contobj_get(struct audit_contobj *cont);

The _audit_contobj_put() function would become:
   void _audit_contobj_put(struct audit_contobj *cont);

Basically swap the _get() and _hold() function names so that the
arguments are the same for both the _get() and _set() functions.  Does
this make more sense?

> > >  /**
> > >   * audit_alloc - allocate an audit info block for a task
> > >   * @tsk: task
> > > @@ -232,6 +266,9 @@ int audit_alloc(struct task_struct *tsk)
> > >         }
> > >         info->loginuid = audit_get_loginuid(current);
> > >         info->sessionid = audit_get_sessionid(current);
> > > +       rcu_read_lock();
> > > +       info->cont = _audit_contobj_get(current);
> > > +       rcu_read_unlock();
> >
> > The RCU locks aren't strictly necessary here, are they?  In fact I
> > suppose we could probably just replace the _get() call with a
> > refcount_set(1) just as we do in audit_set_contid(), yes?
>
> I don't understand what you are getting at here.  It needs a *contobj,
> along with bumping up the refcount of the existing contobj.

Sorry, you can disregard.  My mental definition for audit_alloc() is
permanently messed up; I usually double check myself before commenting
on related code, but I must have forgotten here.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

