Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id AED8A2E1DE
	for <lists+linux-audit@lfdr.de>; Wed, 29 May 2019 18:05:10 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 62BF86EB9F;
	Wed, 29 May 2019 16:04:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DFEC65DE4E;
	Wed, 29 May 2019 16:04:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0C547206D3;
	Wed, 29 May 2019 16:04:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4TG4Mv0006186 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 29 May 2019 12:04:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 559B919736; Wed, 29 May 2019 16:04:22 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 504291972E
	for <linux-audit@redhat.com>; Wed, 29 May 2019 16:04:19 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DD899C07EFDD
	for <linux-audit@redhat.com>; Wed, 29 May 2019 16:04:11 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id l26so2518896lfh.13
	for <linux-audit@redhat.com>; Wed, 29 May 2019 09:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fB+cE1ut8lOVdr24ZDohYBT90Ji3/h8bhXQdn1faj1w=;
	b=C5m+Zu7u/SeSHtGLhmMKET9XoxgFL4mD6irfr1OzHmPMiWJG4UfEnieyQSYkdsDMbz
	NztjNr31dmPXfzZ3lzJfnhB89ckJVnCG+7h6ahdNAD3nNBS4e5GBGT7Q1FfvYy9A/d2t
	0el6ltxCkWdty489akWnO7C/D56fRp/QK9Gq1MjwNH7leTwcZQjo+IlSUGIig8cFaTMj
	0L15j3WZSxzF3+3o5zoKI9TCExfFDg6cBQTBs9JTWpIB8kHa3JpZKusP6gcb+AMIQUQC
	eUDOdkdjk2raExQ1k92WIgMi99ke3kB6JhKgkKl6aj9SVPgmPG4HF7X1pZT7PQ+Y3nOE
	WAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fB+cE1ut8lOVdr24ZDohYBT90Ji3/h8bhXQdn1faj1w=;
	b=tqiBSyR+/ZASfR8tQS+VuAmrCpXd0DcRj2V62diqQ/4IGWl72ng9urTpuRBcSo8R1J
	SVN28ZWK0+dPru47CkLfyvq4JIMnWEI8cHWrBq3T9yh3TvvO1t6X78TZQ1T+PE7Nexr8
	5soLfiICj+TZN/z+5hM9lwd1K9Ke21qnwD/LgS5vXF7d5nVdDhy+DUliBqGa+TC9LH3z
	WWaUYmbKeR80iPJRA4jajy4do9JNr8teGGmnThHK6s2FQeHhvSajU3QvUyO9s6TiPKfH
	G9ukhZ6b1MyaqdWyZmOXBLp3vQM9XKBVHs/Llrh4VATEiq1NdyEUT2pCSiln7F6FcUCx
	ZbcQ==
X-Gm-Message-State: APjAAAUATo+0V9CPC1CuDYCk1NrLoKG026nOJD9T5e4I4C/o92b571Wz
	TJdSG0BrR4oK+gMpWSNtt6XZiohpI7Hfrl8p4rOpiOs=
X-Google-Smtp-Source: APXvYqyArKmcXTpF9obffp6rqvd9jlGrddtztE9fceghduTlG/S8zQkl5yFpMpSrjd7E8vT35Mvy/bolgsx3MCM9V/0=
X-Received: by 2002:a19:c301:: with SMTP id t1mr4444303lff.137.1559145850119; 
	Wed, 29 May 2019 09:04:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1554732921.git.rgb@redhat.com>
	<9edad39c40671fb53f28d76862304cc2647029c6.1554732921.git.rgb@redhat.com>
	<20190529145742.GA8959@cisco>
	<CAHC9VhR4fudQanvZGYWMvCf7k2CU3q7e7n1Pi7hzC3v_zpVEdw@mail.gmail.com>
	<20190529153427.GB8959@cisco>
In-Reply-To: <20190529153427.GB8959@cisco>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 29 May 2019 12:03:58 -0400
Message-ID: <CAHC9VhSF3AjErX37+eeusJ7+XRw8yuPsmqBTRwc9EVoRBh_3Tw@mail.gmail.com>
Subject: Re: [PATCH ghak90 V6 02/10] audit: add container id
To: Tycho Andersen <tycho@tycho.ws>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 29 May 2019 16:04:12 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Wed, 29 May 2019 16:04:12 +0000 (UTC) for IP:'209.85.167.68'
	DOMAIN:'mail-lf1-f68.google.com' HELO:'mail-lf1-f68.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.316  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE) 209.85.167.68 mail-lf1-f68.google.com 209.85.167.68
	mail-lf1-f68.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, Richard Guy Briggs <rgb@redhat.com>,
	linux-api@vger.kernel.org, containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, Serge Hallyn <serge@hallyn.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Wed, 29 May 2019 16:05:09 +0000 (UTC)

On Wed, May 29, 2019 at 11:34 AM Tycho Andersen <tycho@tycho.ws> wrote:
>
> On Wed, May 29, 2019 at 11:29:05AM -0400, Paul Moore wrote:
> > On Wed, May 29, 2019 at 10:57 AM Tycho Andersen <tycho@tycho.ws> wrote:
> > >
> > > On Mon, Apr 08, 2019 at 11:39:09PM -0400, Richard Guy Briggs wrote:
> > > > It is not permitted to unset the audit container identifier.
> > > > A child inherits its parent's audit container identifier.
> > >
> > > ...
> > >
> > > >  /**
> > > > + * audit_set_contid - set current task's audit contid
> > > > + * @contid: contid value
> > > > + *
> > > > + * Returns 0 on success, -EPERM on permission failure.
> > > > + *
> > > > + * Called (set) from fs/proc/base.c::proc_contid_write().
> > > > + */
> > > > +int audit_set_contid(struct task_struct *task, u64 contid)
> > > > +{
> > > > +     u64 oldcontid;
> > > > +     int rc = 0;
> > > > +     struct audit_buffer *ab;
> > > > +     uid_t uid;
> > > > +     struct tty_struct *tty;
> > > > +     char comm[sizeof(current->comm)];
> > > > +
> > > > +     task_lock(task);
> > > > +     /* Can't set if audit disabled */
> > > > +     if (!task->audit) {
> > > > +             task_unlock(task);
> > > > +             return -ENOPROTOOPT;
> > > > +     }
> > > > +     oldcontid = audit_get_contid(task);
> > > > +     read_lock(&tasklist_lock);
> > > > +     /* Don't allow the audit containerid to be unset */
> > > > +     if (!audit_contid_valid(contid))
> > > > +             rc = -EINVAL;
> > > > +     /* if we don't have caps, reject */
> > > > +     else if (!capable(CAP_AUDIT_CONTROL))
> > > > +             rc = -EPERM;
> > > > +     /* if task has children or is not single-threaded, deny */
> > > > +     else if (!list_empty(&task->children))
> > > > +             rc = -EBUSY;
> > > > +     else if (!(thread_group_leader(task) && thread_group_empty(task)))
> > > > +             rc = -EALREADY;
> > > > +     read_unlock(&tasklist_lock);
> > > > +     if (!rc)
> > > > +             task->audit->contid = contid;
> > > > +     task_unlock(task);
> > > > +
> > > > +     if (!audit_enabled)
> > > > +             return rc;
> > >
> > > ...but it is allowed to change it (assuming
> > > capable(CAP_AUDIT_CONTROL), of course)? Seems like this might be more
> > > immediately useful since we still live in the world of majority
> > > privileged containers if we didn't allow changing it, in addition to
> > > un-setting it.
> >
> > The idea is that only container orchestrators should be able to
> > set/modify the audit container ID, and since setting the audit
> > container ID can have a significant effect on the records captured
> > (and their routing to multiple daemons when we get there) modifying
> > the audit container ID is akin to modifying the audit configuration
> > which is why it is gated by CAP_AUDIT_CONTROL.  The current thinking
> > is that you would only change the audit container ID from one
> > set/inherited value to another if you were nesting containers, in
> > which case the nested container orchestrator would need to be granted
> > CAP_AUDIT_CONTROL (which everyone to date seems to agree is a workable
> > compromise).
>
> But then don't you want some kind of ns_capable() instead (probably
> not the obvious one, though...)? With capable(), you can't really nest
> using the audit-id and user namespaces together.

You want capable() and not ns_capable() because you want to ensure
that the orchestrator has the rights in the init_ns as changes to the
audit container ID could have an auditing impact that spans the entire
system.  Setting the audit container ID is equivalent to munging the
kernel's audit configuration, and the audit configuration is not
"namespaced" in any way.  The audit container ID work is about
providing the right "container context" (as defined by userspace) with
the audit records so that admins have a better understanding about
what is going on in the system; it is very explicitly not creating an
audit namespace.

At some point in the future we will want to support running multiple
audit daemons, and have a configurable way of routing audit records
based on the audit container ID, which will blur the line regarding
audit namespaces, but even then I would argue we are not creating an
audit namespace.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
