Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABD830175
	for <lists+linux-audit@lfdr.de>; Thu, 30 May 2019 20:06:16 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 15AEB368E0;
	Thu, 30 May 2019 18:05:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7230D7E31B;
	Thu, 30 May 2019 18:05:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BF9E7E161;
	Thu, 30 May 2019 18:04:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4UHAEUa032052 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 30 May 2019 13:10:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 57A7F7ADA4; Thu, 30 May 2019 17:10:14 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 837937A54F;
	Thu, 30 May 2019 17:10:07 +0000 (UTC)
Received: from mail.hallyn.com (mail.hallyn.com [178.63.66.53])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9F17E7E42A;
	Thu, 30 May 2019 17:09:19 +0000 (UTC)
Received: by mail.hallyn.com (Postfix, from userid 1001)
	id 3568262D; Thu, 30 May 2019 12:09:13 -0500 (CDT)
Date: Thu, 30 May 2019 12:09:13 -0500
From: "Serge E. Hallyn" <serge@hallyn.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak90 V6 02/10] audit: add container id
Message-ID: <20190530170913.GA16722@mail.hallyn.com>
References: <cover.1554732921.git.rgb@redhat.com>
	<9edad39c40671fb53f28d76862304cc2647029c6.1554732921.git.rgb@redhat.com>
	<20190529145742.GA8959@cisco>
	<CAHC9VhR4fudQanvZGYWMvCf7k2CU3q7e7n1Pi7hzC3v_zpVEdw@mail.gmail.com>
	<20190529153427.GB8959@cisco>
	<CAHC9VhSF3AjErX37+eeusJ7+XRw8yuPsmqBTRwc9EVoRBh_3Tw@mail.gmail.com>
	<20190529222835.GD8959@cisco>
	<CAHC9VhRS66VGtug3fq3RTGHDvfGmBJG6yRJ+iMxm3cxnNF-zJw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHC9VhRS66VGtug3fq3RTGHDvfGmBJG6yRJ+iMxm3cxnNF-zJw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Greylist: Sender passed SPF test, ACL 242 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Thu, 30 May 2019 17:09:56 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Thu, 30 May 2019 17:09:56 +0000 (UTC) for IP:'178.63.66.53'
	DOMAIN:'mail.hallyn.com' HELO:'mail.hallyn.com'
	FROM:'serge@mail.hallyn.com' RCPT:''
X-RedHat-Spam-Score: 0.002  (SPF_HELO_NONE,
	SPF_NONE) 178.63.66.53 mail.hallyn.com 178.63.66.53
	mail.hallyn.com <serge@mail.hallyn.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 30 May 2019 14:04:06 -0400
Cc: Tycho Andersen <tycho@tycho.ws>, nhorman@tuxdriver.com,
	Richard Guy Briggs <rgb@redhat.com>, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Thu, 30 May 2019 18:06:14 +0000 (UTC)

On Wed, May 29, 2019 at 06:39:48PM -0400, Paul Moore wrote:
> On Wed, May 29, 2019 at 6:28 PM Tycho Andersen <tycho@tycho.ws> wrote:
> > On Wed, May 29, 2019 at 12:03:58PM -0400, Paul Moore wrote:
> > > On Wed, May 29, 2019 at 11:34 AM Tycho Andersen <tycho@tycho.ws> wrote:
> > > >
> > > > On Wed, May 29, 2019 at 11:29:05AM -0400, Paul Moore wrote:
> > > > > On Wed, May 29, 2019 at 10:57 AM Tycho Andersen <tycho@tycho.ws> wrote:
> > > > > >
> > > > > > On Mon, Apr 08, 2019 at 11:39:09PM -0400, Richard Guy Briggs wrote:
> > > > > > > It is not permitted to unset the audit container identifier.
> > > > > > > A child inherits its parent's audit container identifier.
> > > > > >
> > > > > > ...
> > > > > >
> > > > > > >  /**
> > > > > > > + * audit_set_contid - set current task's audit contid
> > > > > > > + * @contid: contid value
> > > > > > > + *
> > > > > > > + * Returns 0 on success, -EPERM on permission failure.
> > > > > > > + *
> > > > > > > + * Called (set) from fs/proc/base.c::proc_contid_write().
> > > > > > > + */
> > > > > > > +int audit_set_contid(struct task_struct *task, u64 contid)
> > > > > > > +{
> > > > > > > +     u64 oldcontid;
> > > > > > > +     int rc = 0;
> > > > > > > +     struct audit_buffer *ab;
> > > > > > > +     uid_t uid;
> > > > > > > +     struct tty_struct *tty;
> > > > > > > +     char comm[sizeof(current->comm)];
> > > > > > > +
> > > > > > > +     task_lock(task);
> > > > > > > +     /* Can't set if audit disabled */
> > > > > > > +     if (!task->audit) {
> > > > > > > +             task_unlock(task);
> > > > > > > +             return -ENOPROTOOPT;
> > > > > > > +     }
> > > > > > > +     oldcontid = audit_get_contid(task);
> > > > > > > +     read_lock(&tasklist_lock);
> > > > > > > +     /* Don't allow the audit containerid to be unset */
> > > > > > > +     if (!audit_contid_valid(contid))
> > > > > > > +             rc = -EINVAL;
> > > > > > > +     /* if we don't have caps, reject */
> > > > > > > +     else if (!capable(CAP_AUDIT_CONTROL))
> > > > > > > +             rc = -EPERM;
> > > > > > > +     /* if task has children or is not single-threaded, deny */
> > > > > > > +     else if (!list_empty(&task->children))
> > > > > > > +             rc = -EBUSY;
> > > > > > > +     else if (!(thread_group_leader(task) && thread_group_empty(task)))
> > > > > > > +             rc = -EALREADY;
> > > > > > > +     read_unlock(&tasklist_lock);
> > > > > > > +     if (!rc)
> > > > > > > +             task->audit->contid = contid;
> > > > > > > +     task_unlock(task);
> > > > > > > +
> > > > > > > +     if (!audit_enabled)
> > > > > > > +             return rc;
> > > > > >
> > > > > > ...but it is allowed to change it (assuming
> > > > > > capable(CAP_AUDIT_CONTROL), of course)? Seems like this might be more
> > > > > > immediately useful since we still live in the world of majority
> > > > > > privileged containers if we didn't allow changing it, in addition to
> > > > > > un-setting it.
> > > > >
> > > > > The idea is that only container orchestrators should be able to
> > > > > set/modify the audit container ID, and since setting the audit
> > > > > container ID can have a significant effect on the records captured
> > > > > (and their routing to multiple daemons when we get there) modifying
> > > > > the audit container ID is akin to modifying the audit configuration
> > > > > which is why it is gated by CAP_AUDIT_CONTROL.  The current thinking
> > > > > is that you would only change the audit container ID from one
> > > > > set/inherited value to another if you were nesting containers, in
> > > > > which case the nested container orchestrator would need to be granted
> > > > > CAP_AUDIT_CONTROL (which everyone to date seems to agree is a workable
> > > > > compromise).
> > > >
> > > > But then don't you want some kind of ns_capable() instead (probably
> > > > not the obvious one, though...)? With capable(), you can't really nest
> > > > using the audit-id and user namespaces together.
> > >
> > > You want capable() and not ns_capable() because you want to ensure
> > > that the orchestrator has the rights in the init_ns as changes to the
> > > audit container ID could have an auditing impact that spans the entire
> > > system.
> >
> > Ok but,
> >
> > > > > The current thinking
> > > > > is that you would only change the audit container ID from one
> > > > > set/inherited value to another if you were nesting containers, in
> > > > > which case the nested container orchestrator would need to be granted
> > > > > CAP_AUDIT_CONTROL (which everyone to date seems to agree is a workable
> > > > > compromise).
> >
> > won't work in user namespaced containers, because they will never be
> > capable(CAP_AUDIT_CONTROL); so I don't think this will work for
> > nesting as is. But maybe nobody cares :)
> 
> That's fun :)
> 
> To be honest, I've never been a big fan of supporting nested
> containers from an audit perspective, so I'm not really too upset
> about this.  The k8s/cri-o folks seem okay with this, or at least I
> haven't heard any objections; lxc folks, what do you have to say?

I actually thought the answer to this (when last I looked, "some time" ago)
was that userspace should track an audit message saying "task X in
container Y is changing its auditid to Z", and then decide to also track Z.
This should be doable, but a lot of extra work in userspace.

Per-userns containerids would also work.  So task X1 is in containerid
1 on the host and creates a new task Y in new userns;  it continues to
be reported in init_user_ns as containerid 1 forever;  but in its own
userns it can request to be known as some other containerid.  Audit
socks would be per-userns, allowing root in a container to watch for
audit events in its own (and descendent) namespaces.

But again I'm sure we've gone over all this in the last few years.

I suppose we can look at this as a "first step", and talk about
making it user-ns-nestable later.  But agreed it's not useful in a
lot of situations as is.

-serge

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
