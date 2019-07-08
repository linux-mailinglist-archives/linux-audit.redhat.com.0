Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1DB627AF
	for <lists+linux-audit@lfdr.de>; Mon,  8 Jul 2019 19:53:46 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E5373308402A;
	Mon,  8 Jul 2019 17:53:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A3D61001B02;
	Mon,  8 Jul 2019 17:53:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CF866206D2;
	Mon,  8 Jul 2019 17:53:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x68HpWoi007397 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 8 Jul 2019 13:51:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6D723579A8; Mon,  8 Jul 2019 17:51:32 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-14.phx2.redhat.com [10.3.112.14])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E42FD608A4;
	Mon,  8 Jul 2019 17:51:08 +0000 (UTC)
Date: Mon, 8 Jul 2019 13:51:05 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak90 V6 02/10] audit: add container id
Message-ID: <20190708175105.7zb6mikjw2wmnwln@madcap2.tricolour.ca>
References: <cover.1554732921.git.rgb@redhat.com>
	<9edad39c40671fb53f28d76862304cc2647029c6.1554732921.git.rgb@redhat.com>
	<20190529145742.GA8959@cisco>
	<CAHC9VhR4fudQanvZGYWMvCf7k2CU3q7e7n1Pi7hzC3v_zpVEdw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHC9VhR4fudQanvZGYWMvCf7k2CU3q7e7n1Pi7hzC3v_zpVEdw@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
Cc: Tycho Andersen <tycho@tycho.ws>, nhorman@tuxdriver.com,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Mon, 08 Jul 2019 17:53:40 +0000 (UTC)

On 2019-05-29 11:29, Paul Moore wrote:
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
> compromise).  We did consider allowing for a chain of nested audit
> container IDs, but the implications of doing so are significant
> (implementation mess, runtime cost, etc.) so we are leaving that out
> of this effort.

We had previously discussed the idea of restricting
orchestrators/engines from only being able to set the audit container
identifier on their own descendants, but it was discarded.  I've added a
check to ensure this is now enforced.

I've also added a check to ensure that a process can't set its own audit
container identifier and that if the identifier is already set, then the
orchestrator/engine must be in a descendant user namespace from the
orchestrator that set the previously inherited audit container
identifier.

> From a practical perspective, un-setting the audit container ID is
> pretty much the same as changing it from one set value to another so
> most of the above applies to that case as well.
> 
> -- 
> paul moore
> www.paul-moore.com

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
