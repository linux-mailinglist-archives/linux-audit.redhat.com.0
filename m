Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A64C6C3E7
	for <lists+linux-audit@lfdr.de>; Thu, 18 Jul 2019 02:52:23 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EA494308FE8D;
	Thu, 18 Jul 2019 00:52:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DB3960C5F;
	Thu, 18 Jul 2019 00:52:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4BE4754D3D;
	Thu, 18 Jul 2019 00:52:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6I0q0oO001578 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 17 Jul 2019 20:52:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CD75B5D720; Thu, 18 Jul 2019 00:52:00 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-14.phx2.redhat.com [10.3.112.14])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CCA60544F3;
	Thu, 18 Jul 2019 00:51:48 +0000 (UTC)
Date: Wed, 17 Jul 2019 20:51:45 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak90 V6 02/10] audit: add container id
Message-ID: <20190718005145.eshekqfr3navqqiy@madcap2.tricolour.ca>
References: <20190529153427.GB8959@cisco>
	<CAHC9VhSF3AjErX37+eeusJ7+XRw8yuPsmqBTRwc9EVoRBh_3Tw@mail.gmail.com>
	<20190529222835.GD8959@cisco>
	<CAHC9VhRS66VGtug3fq3RTGHDvfGmBJG6yRJ+iMxm3cxnNF-zJw@mail.gmail.com>
	<20190530170913.GA16722@mail.hallyn.com>
	<CAHC9VhThLiQzGYRUWmSuVfOC6QCDmA75BDB7Eg7V8HX4x7ymQg@mail.gmail.com>
	<20190708180558.5bar6ripag3sdadl@madcap2.tricolour.ca>
	<CAHC9VhRTT7JWqNnynvK04wKerjc-3UJ6R1uPtjCAPVr_tW-7MA@mail.gmail.com>
	<20190716220320.sotbfqplgdructg7@madcap2.tricolour.ca>
	<CAHC9VhScHizB2r5q3T5s0P3jkYdvzBPPudDksosYFp_TO7W9-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHC9VhScHizB2r5q3T5s0P3jkYdvzBPPudDksosYFp_TO7W9-Q@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-audit@redhat.com
Cc: Tycho Andersen <tycho@tycho.ws>, nhorman@tuxdriver.com,
	linux-api@vger.kernel.org, containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, "Serge E. Hallyn" <serge@hallyn.com>
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Thu, 18 Jul 2019 00:52:22 +0000 (UTC)

On 2019-07-16 19:30, Paul Moore wrote:
> On Tue, Jul 16, 2019 at 6:03 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > On 2019-07-15 17:04, Paul Moore wrote:
> > > On Mon, Jul 8, 2019 at 2:06 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> 
> ...
> 
> > > > If we can't trust ns_capable() then why are we passing on
> > > > CAP_AUDIT_CONTROL?  It is being passed down and not stripped purposely
> > > > by the orchestrator/engine.  If ns_capable() isn't inherited how is it
> > > > gained otherwise?  Can it be inserted by cotainer image?  I think the
> > > > answer is "no".  Either we trust ns_capable() or we have audit
> > > > namespaces (recommend based on user namespace) (or both).
> > >
> > > My thinking is that since ns_capable() checks the credentials with
> > > respect to the current user namespace we can't rely on it to control
> > > access since it would be possible for a privileged process running
> > > inside an unprivileged container to manipulate the audit container ID
> > > (containerized process has CAP_AUDIT_CONTROL, e.g. running as root in
> > > the container, while the container itself does not).
> >
> > What makes an unprivileged container unprivileged?  "root", or "CAP_*"?
> 
> My understanding is that when most people refer to an unprivileged
> container they are referring to a container run without capabilities
> or a container run by a user other than root.  I'm sure there are
> better definitions out there, by folks much smarter than me on these
> things, but that's my working definition.

Close enough to my understanding...

> > If CAP_AUDIT_CONTROL is granted, does "root" matter?
> 
> Our discussions here have been about capabilities, not UIDs.  The only
> reason root might matter is that it generally has the full capability
> set.

Good, that's my understanding.

> > Does it matter what user namespace it is in?
> 
> What likely matters is what check is called: capable() or
> ns_capable().  Those can yield very different results.

Ok, I finally found what I was looking for to better understand the
challenge with trusting ns_capable().  Sorry for being so dense and slow
on this one.  I thought I had gone through the code carefully enough,
but this time I finally found it.  set_cred_user_ns() sets a full set of
capabilities rather than inheriting them from the parent user_ns, called
from userns_install() or create_userns().  Even if the container
orchestrator/engine restricts those capabilities on its own containers,
they could easily unshare a userns and get a full set unless it also
restricted CAP_SYS_ADMIN, which is used too many other places to be
practical to restrict.

> > I understand that root is *gained* in an
> > unprivileged user namespace, but capabilities are inherited or permitted
> > and that process either has it or it doesn't and an unprivileged user
> > namespace can't gain a capability that has been rescinded.  Different
> > subsystems use the userid or capabilities or both to determine
> > privileges.
> 
> Once again, I believe the important thing to focus on here is
> capable() vs ns_capable().  We can't safely rely on ns_capable() for
> the audit container ID policy since that is easily met inside the
> container regardless of the process' creds which started the
> container.

Agreed.

> > In this case, is the userid relevant?
> 
> We don't do UID checks, we do capability checks, so yes, the UID is irrelevant.

Agreed.

> > > > At this point I would say we are at an impasse unless we trust
> > > > ns_capable() or we implement audit namespaces.
> > >
> > > I'm not sure how we can trust ns_capable(), but if you can think of a
> > > way I would love to hear it.  I'm also not sure how namespacing audit
> > > is helpful (see my above comments), but if you think it is please
> > > explain.
> >
> > So if we are not namespacing, why do we not trust capabilities?
> 
> We can trust capable(CAP_AUDIT_CONTROL) for enforcing audit container
> ID policy, we can not trust ns_capable(CAP_AUDIT_CONTROL).

Ok.  So does a process in a non-init user namespace have two (or more)
sets of capabilities stored in creds, one in the init_user_ns, and one
in current_user_ns?  Or does it get stripped of all its capabilities in
init_user_ns once it has its own set in current_user_ns?  If the former,
then we can use capable().  If the latter, we need another mechanism, as
you have suggested might be needed.

If some random unprivileged user wants to fire up a container
orchestrator/engine in his own user namespace, then audit needs to be
namespaced.  Can we safely discard this scenario for now?  That user can
use a VM.

> paul moore

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
