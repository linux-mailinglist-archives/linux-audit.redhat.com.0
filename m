Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFC82E873
	for <lists+linux-audit@lfdr.de>; Thu, 30 May 2019 00:46:44 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CE29A34CF;
	Wed, 29 May 2019 22:46:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F06C60C69;
	Wed, 29 May 2019 22:46:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8F4481806B16;
	Wed, 29 May 2019 22:46:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4TFYmGP030765 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 29 May 2019 11:34:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 47BCC5C64D; Wed, 29 May 2019 15:34:48 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4169B5C5DF
	for <linux-audit@redhat.com>; Wed, 29 May 2019 15:34:43 +0000 (UTC)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 32A4730ADC7A
	for <linux-audit@redhat.com>; Wed, 29 May 2019 15:34:32 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id d30so112722pgm.7
	for <linux-audit@redhat.com>; Wed, 29 May 2019 08:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=tycho-ws.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=QBTLnNOV7gK8Yksv7/ZayOzF1A/1p3r3qfTWQfsr+5k=;
	b=qPW3ofQ+wrfRG8qTvQ96ZGHSSch5H/W2ns+8WOCWmmGhii04PuKOPIFYj5Qzmezyrn
	XJylyTsK2Tr2TK/sawOqiMtam5VtSXWuPFXfFao86OwuyTL3pDo7LpJzXS9M6biwfUD8
	kMjSawwtTyHDM1KcUcq+i6aOaNRJs0GWSqjUm9LNY5k9+Epka2VjJBVnBvR6QSUeV5vs
	7e2WChPI0sOT3pRj16QXUNZKZKBw3vjTrviS+bfjuq3DJd2uOS6kjLlbmNTbnOuD+aZy
	fz+wyvVgHEtIFUPFMBc3NV9Lf5JFtJWrohfYsoC/I0uwHiWOeaTBy7Cz7bDA1B/dyud9
	R2tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=QBTLnNOV7gK8Yksv7/ZayOzF1A/1p3r3qfTWQfsr+5k=;
	b=DcadNBsuooYb45vew0xs353jaBrx3Z3YhfgD2enU68cimMecZENkcV1ym2d1Ro5YdO
	qb07pJ8vuwePziljxU9DxjEwKAJiHWz0oPTKPr1qBqkg1EVDW35S4wq248aeNPWH41XQ
	9FIvyX4B09grs+Pe4Dgea+Ro1bHsThPCaww/ZZ3/8muckY95AgCSODrAN3qj7A9DQ3wP
	2cr75pL0rfsRJ/0+SA0VccWmsJzo3qgkYXNR3qs4uE7slmFqIpz8y/XoLz0Fko1j02jP
	APSmE1QRrKaPWHzvkh5FqYxrogux+GiiFrM+L/QP41qw1eNpLj3Tk8eXhnCLAhB5C8U2
	rieg==
X-Gm-Message-State: APjAAAU11Bs/CTvPJ/aPsofUh4xUcVYIJRUoredTsQjdozX6jrHysnC3
	SxyMae8kff3jOgHeKTzaGBfi7A==
X-Google-Smtp-Source: APXvYqz9StBcZoB5Lg6+nM4qZaCfAQ8ekNwP4Ue16YfIsljxMfwjXEp4FnMnFD/1+Og2xj8d24Oitw==
X-Received: by 2002:a63:7d09:: with SMTP id y9mr119516427pgc.350.1559144071263;
	Wed, 29 May 2019 08:34:31 -0700 (PDT)
Received: from cisco ([2601:280:b:edbb:840:fa90:7243:7032])
	by smtp.gmail.com with ESMTPSA id
	f5sm19296566pfn.161.2019.05.29.08.34.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 29 May 2019 08:34:30 -0700 (PDT)
Date: Wed, 29 May 2019 09:34:27 -0600
From: Tycho Andersen <tycho@tycho.ws>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak90 V6 02/10] audit: add container id
Message-ID: <20190529153427.GB8959@cisco>
References: <cover.1554732921.git.rgb@redhat.com>
	<9edad39c40671fb53f28d76862304cc2647029c6.1554732921.git.rgb@redhat.com>
	<20190529145742.GA8959@cisco>
	<CAHC9VhR4fudQanvZGYWMvCf7k2CU3q7e7n1Pi7hzC3v_zpVEdw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHC9VhR4fudQanvZGYWMvCf7k2CU3q7e7n1Pi7hzC3v_zpVEdw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Wed, 29 May 2019 15:34:32 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Wed, 29 May 2019 15:34:32 +0000 (UTC) for IP:'209.85.215.195'
	DOMAIN:'mail-pg1-f195.google.com'
	HELO:'mail-pg1-f195.google.com' FROM:'tycho@tycho.ws' RCPT:''
X-RedHat-Spam-Score: -0.008  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_NONE) 209.85.215.195 mail-pg1-f195.google.com 209.85.215.195
	mail-pg1-f195.google.com <tycho@tycho.ws>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Wed, 29 May 2019 18:45:57 -0400
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Wed, 29 May 2019 22:46:43 +0000 (UTC)

On Wed, May 29, 2019 at 11:29:05AM -0400, Paul Moore wrote:
> On Wed, May 29, 2019 at 10:57 AM Tycho Andersen <tycho@tycho.ws> wrote:
> >
> > On Mon, Apr 08, 2019 at 11:39:09PM -0400, Richard Guy Briggs wrote:
> > > It is not permitted to unset the audit container identifier.
> > > A child inherits its parent's audit container identifier.
> >
> > ...
> >
> > >  /**
> > > + * audit_set_contid - set current task's audit contid
> > > + * @contid: contid value
> > > + *
> > > + * Returns 0 on success, -EPERM on permission failure.
> > > + *
> > > + * Called (set) from fs/proc/base.c::proc_contid_write().
> > > + */
> > > +int audit_set_contid(struct task_struct *task, u64 contid)
> > > +{
> > > +     u64 oldcontid;
> > > +     int rc = 0;
> > > +     struct audit_buffer *ab;
> > > +     uid_t uid;
> > > +     struct tty_struct *tty;
> > > +     char comm[sizeof(current->comm)];
> > > +
> > > +     task_lock(task);
> > > +     /* Can't set if audit disabled */
> > > +     if (!task->audit) {
> > > +             task_unlock(task);
> > > +             return -ENOPROTOOPT;
> > > +     }
> > > +     oldcontid = audit_get_contid(task);
> > > +     read_lock(&tasklist_lock);
> > > +     /* Don't allow the audit containerid to be unset */
> > > +     if (!audit_contid_valid(contid))
> > > +             rc = -EINVAL;
> > > +     /* if we don't have caps, reject */
> > > +     else if (!capable(CAP_AUDIT_CONTROL))
> > > +             rc = -EPERM;
> > > +     /* if task has children or is not single-threaded, deny */
> > > +     else if (!list_empty(&task->children))
> > > +             rc = -EBUSY;
> > > +     else if (!(thread_group_leader(task) && thread_group_empty(task)))
> > > +             rc = -EALREADY;
> > > +     read_unlock(&tasklist_lock);
> > > +     if (!rc)
> > > +             task->audit->contid = contid;
> > > +     task_unlock(task);
> > > +
> > > +     if (!audit_enabled)
> > > +             return rc;
> >
> > ...but it is allowed to change it (assuming
> > capable(CAP_AUDIT_CONTROL), of course)? Seems like this might be more
> > immediately useful since we still live in the world of majority
> > privileged containers if we didn't allow changing it, in addition to
> > un-setting it.
> 
> The idea is that only container orchestrators should be able to
> set/modify the audit container ID, and since setting the audit
> container ID can have a significant effect on the records captured
> (and their routing to multiple daemons when we get there) modifying
> the audit container ID is akin to modifying the audit configuration
> which is why it is gated by CAP_AUDIT_CONTROL.  The current thinking
> is that you would only change the audit container ID from one
> set/inherited value to another if you were nesting containers, in
> which case the nested container orchestrator would need to be granted
> CAP_AUDIT_CONTROL (which everyone to date seems to agree is a workable
> compromise).

But then don't you want some kind of ns_capable() instead (probably
not the obvious one, though...)? With capable(), you can't really nest
using the audit-id and user namespaces together.

Tycho

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
