Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCB82E872
	for <lists+linux-audit@lfdr.de>; Thu, 30 May 2019 00:46:39 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4D1BE8553A;
	Wed, 29 May 2019 22:46:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 902CB1724A;
	Wed, 29 May 2019 22:46:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DF42D1806B15;
	Wed, 29 May 2019 22:46:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4TMSlcb008750 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 29 May 2019 18:28:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 885F52E040; Wed, 29 May 2019 22:28:47 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 81A52643C1
	for <linux-audit@redhat.com>; Wed, 29 May 2019 22:28:45 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 13EE359441
	for <linux-audit@redhat.com>; Wed, 29 May 2019 22:28:39 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id gn7so1642415plb.10
	for <linux-audit@redhat.com>; Wed, 29 May 2019 15:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=tycho-ws.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=sxlc+0BZVMGJBkklhDGCMx7b3nCRFgQD29T89CaCav0=;
	b=uDH3DgbAe0Nn6uZaYSAgEAJNiDB6BDF/SuDggKMk+TzPiQYZumu8d83PNR+BSvvkjD
	Zqgy1VvS2JR173DGBaMMLDmuLhmKeQfKXMNlQBW4bysvH4ieNup9nkRjVZOnltvcIRfr
	Un/6jJdo23xTg/mEWqa20n0xKot6OMJNahZU8iLMCLL2z7ewLtQbJ+ax8N766OPUalEX
	LmOHsG+B+hAfQLAOa3r/719u+3/4C10vzjsXK8xSeC0B1qMmi7ercJginmJWLiQ/Du9O
	CdugUw32bHOBq8kpQNaof0wrf0z5h5vT0lQXg26TskQGxiFnhC9kzmnRUvkeCSa7Mkgu
	eDtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=sxlc+0BZVMGJBkklhDGCMx7b3nCRFgQD29T89CaCav0=;
	b=jVoY3OCiBWVgBnQeotWbmSlXjrrZjfp7wmFAsNW64JrZmXzwEGuNcm6EyzfA3m/0xy
	aw7/deleSghenjvhdLVgoBEPb1iYhEEMWArNDn0rlXYuqGj7/6mQ5ml+q/LgDciN3OP9
	miLY7htL97HDjNOb1ureS3nih1CjVpAdxGVsfjBdRgIs34dK/FYDCO1j5ybmDe0v5V7f
	d9BXSJSRskSgWORZXpnwpjCVeVvqOy1tkHZUzrpkhNJ1skseyEJetvd45wfbvJNdNheQ
	F88KyaX0K9LJnMsyxXVEAB6Gb3+Bl0pZpfMmF5qW4YVJWyD8Ma6WDBA7NnMlPen0UEA8
	0cgg==
X-Gm-Message-State: APjAAAW4ksF0gGnbbQTpAO9WAiU42jBH63Z0f9QOX+UIN3ph86zi7uzY
	Jzizw+KQdyusMdNPUyPNz4IdzQ==
X-Google-Smtp-Source: APXvYqx6u4nIn/AIcvxi8a5nOwft+8sm1j1THFLIGuymwboILKVpX0Iml7oLKuGzIYvIJUQMu6yW9g==
X-Received: by 2002:a17:902:24d:: with SMTP id 71mr340297plc.166.1559168918326;
	Wed, 29 May 2019 15:28:38 -0700 (PDT)
Received: from cisco ([2601:280:b:edbb:840:fa90:7243:7032])
	by smtp.gmail.com with ESMTPSA id
	w187sm690493pfw.20.2019.05.29.15.28.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 29 May 2019 15:28:37 -0700 (PDT)
Date: Wed, 29 May 2019 16:28:35 -0600
From: Tycho Andersen <tycho@tycho.ws>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak90 V6 02/10] audit: add container id
Message-ID: <20190529222835.GD8959@cisco>
References: <cover.1554732921.git.rgb@redhat.com>
	<9edad39c40671fb53f28d76862304cc2647029c6.1554732921.git.rgb@redhat.com>
	<20190529145742.GA8959@cisco>
	<CAHC9VhR4fudQanvZGYWMvCf7k2CU3q7e7n1Pi7hzC3v_zpVEdw@mail.gmail.com>
	<20190529153427.GB8959@cisco>
	<CAHC9VhSF3AjErX37+eeusJ7+XRw8yuPsmqBTRwc9EVoRBh_3Tw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHC9VhSF3AjErX37+eeusJ7+XRw8yuPsmqBTRwc9EVoRBh_3Tw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 29 May 2019 22:28:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Wed, 29 May 2019 22:28:40 +0000 (UTC) for IP:'209.85.214.196'
	DOMAIN:'mail-pl1-f196.google.com'
	HELO:'mail-pl1-f196.google.com' FROM:'tycho@tycho.ws' RCPT:''
X-RedHat-Spam-Score: -0.006  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_NONE) 209.85.214.196 mail-pl1-f196.google.com 209.85.214.196
	mail-pl1-f196.google.com <tycho@tycho.ws>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Wed, 29 May 2019 22:46:38 +0000 (UTC)

On Wed, May 29, 2019 at 12:03:58PM -0400, Paul Moore wrote:
> On Wed, May 29, 2019 at 11:34 AM Tycho Andersen <tycho@tycho.ws> wrote:
> >
> > On Wed, May 29, 2019 at 11:29:05AM -0400, Paul Moore wrote:
> > > On Wed, May 29, 2019 at 10:57 AM Tycho Andersen <tycho@tycho.ws> wrote:
> > > >
> > > > On Mon, Apr 08, 2019 at 11:39:09PM -0400, Richard Guy Briggs wrote:
> > > > > It is not permitted to unset the audit container identifier.
> > > > > A child inherits its parent's audit container identifier.
> > > >
> > > > ...
> > > >
> > > > >  /**
> > > > > + * audit_set_contid - set current task's audit contid
> > > > > + * @contid: contid value
> > > > > + *
> > > > > + * Returns 0 on success, -EPERM on permission failure.
> > > > > + *
> > > > > + * Called (set) from fs/proc/base.c::proc_contid_write().
> > > > > + */
> > > > > +int audit_set_contid(struct task_struct *task, u64 contid)
> > > > > +{
> > > > > +     u64 oldcontid;
> > > > > +     int rc = 0;
> > > > > +     struct audit_buffer *ab;
> > > > > +     uid_t uid;
> > > > > +     struct tty_struct *tty;
> > > > > +     char comm[sizeof(current->comm)];
> > > > > +
> > > > > +     task_lock(task);
> > > > > +     /* Can't set if audit disabled */
> > > > > +     if (!task->audit) {
> > > > > +             task_unlock(task);
> > > > > +             return -ENOPROTOOPT;
> > > > > +     }
> > > > > +     oldcontid = audit_get_contid(task);
> > > > > +     read_lock(&tasklist_lock);
> > > > > +     /* Don't allow the audit containerid to be unset */
> > > > > +     if (!audit_contid_valid(contid))
> > > > > +             rc = -EINVAL;
> > > > > +     /* if we don't have caps, reject */
> > > > > +     else if (!capable(CAP_AUDIT_CONTROL))
> > > > > +             rc = -EPERM;
> > > > > +     /* if task has children or is not single-threaded, deny */
> > > > > +     else if (!list_empty(&task->children))
> > > > > +             rc = -EBUSY;
> > > > > +     else if (!(thread_group_leader(task) && thread_group_empty(task)))
> > > > > +             rc = -EALREADY;
> > > > > +     read_unlock(&tasklist_lock);
> > > > > +     if (!rc)
> > > > > +             task->audit->contid = contid;
> > > > > +     task_unlock(task);
> > > > > +
> > > > > +     if (!audit_enabled)
> > > > > +             return rc;
> > > >
> > > > ...but it is allowed to change it (assuming
> > > > capable(CAP_AUDIT_CONTROL), of course)? Seems like this might be more
> > > > immediately useful since we still live in the world of majority
> > > > privileged containers if we didn't allow changing it, in addition to
> > > > un-setting it.
> > >
> > > The idea is that only container orchestrators should be able to
> > > set/modify the audit container ID, and since setting the audit
> > > container ID can have a significant effect on the records captured
> > > (and their routing to multiple daemons when we get there) modifying
> > > the audit container ID is akin to modifying the audit configuration
> > > which is why it is gated by CAP_AUDIT_CONTROL.  The current thinking
> > > is that you would only change the audit container ID from one
> > > set/inherited value to another if you were nesting containers, in
> > > which case the nested container orchestrator would need to be granted
> > > CAP_AUDIT_CONTROL (which everyone to date seems to agree is a workable
> > > compromise).
> >
> > But then don't you want some kind of ns_capable() instead (probably
> > not the obvious one, though...)? With capable(), you can't really nest
> > using the audit-id and user namespaces together.
> 
> You want capable() and not ns_capable() because you want to ensure
> that the orchestrator has the rights in the init_ns as changes to the
> audit container ID could have an auditing impact that spans the entire
> system.

Ok but,

> > > The current thinking
> > > is that you would only change the audit container ID from one
> > > set/inherited value to another if you were nesting containers, in
> > > which case the nested container orchestrator would need to be granted
> > > CAP_AUDIT_CONTROL (which everyone to date seems to agree is a workable
> > > compromise).

won't work in user namespaced containers, because they will never be
capable(CAP_AUDIT_CONTROL); so I don't think this will work for
nesting as is. But maybe nobody cares :)

Tycho

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
