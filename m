Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id BA360154446
	for <lists+linux-audit@lfdr.de>; Thu,  6 Feb 2020 13:52:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580993544;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=daFitTaeJ99C6oBpIuVpnAXCi5f6HZA1UTawhFCq4QU=;
	b=dmu6J7v9wMk9w82eVyUPhlntnDZGrI/l5sVQUyer9RfHQR8c21e6eWGfs1Mr6bAnIvcMR4
	m+yfnJac3tiXtLPQtUo0AEtjcCCblATl8sWoc5yC3IdQgOW+EfhvZB8wzQpncvzflAIWok
	iEQDodza4U4g5q1miJGBWHmOLudyFkE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-_0aKHaRqP0GvKSgN0lmHUg-1; Thu, 06 Feb 2020 07:52:23 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A40C61005513;
	Thu,  6 Feb 2020 12:52:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C67A5C1B0;
	Thu,  6 Feb 2020 12:52:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 12EB9866A5;
	Thu,  6 Feb 2020 12:52:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 016Cpojh020398 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 6 Feb 2020 07:51:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 919BB5C3F8; Thu,  6 Feb 2020 12:51:50 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-16.rdu2.redhat.com
	[10.10.112.16])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4ACB65C1B0;
	Thu,  6 Feb 2020 12:51:37 +0000 (UTC)
Date: Thu, 6 Feb 2020 07:51:35 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak90 V8 16/16] audit: add capcontid to set contid
	outside init_user_ns
Message-ID: <20200206125135.u4dmybkmvxfgui2b@madcap2.tricolour.ca>
References: <cover.1577736799.git.rgb@redhat.com>
	<5941671b6b6b5de28ab2cc80e72f288cf83291d5.1577736799.git.rgb@redhat.com>
	<CAHC9VhQYXQp+C0EHwLuW50yUenfH4KF1xKQdS=bn_OzHfnFmmg@mail.gmail.com>
	<20200205003930.2efpm4tvrisgmj4t@madcap2.tricolour.ca>
	<CAHC9VhSsfBbfYmqLoR=QBgF5_VwbA8Dqqz97MjqwwJ6Jq6fHwA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhSsfBbfYmqLoR=QBgF5_VwbA8Dqqz97MjqwwJ6Jq6fHwA@mail.gmail.com>
User-Agent: NeoMutt/20180716
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: _0aKHaRqP0GvKSgN0lmHUg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-02-05 17:56, Paul Moore wrote:
> On Tue, Feb 4, 2020 at 7:39 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > On 2020-01-22 16:29, Paul Moore wrote:
> > > On Tue, Dec 31, 2019 at 2:51 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > >
> > > > Provide a mechanism similar to CAP_AUDIT_CONTROL to explicitly give a
> > > > process in a non-init user namespace the capability to set audit
> > > > container identifiers.
> > > >
> > > > Provide /proc/$PID/audit_capcontid interface to capcontid.
> > > > Valid values are: 1==enabled, 0==disabled
> > >
> > > It would be good to be more explicit about "enabled" and "disabled" in
> > > the commit description.  For example, which setting allows the target
> > > task to set audit container IDs of it's children processes?
> >
> > Ok...
> >
> > > > Report this action in message type AUDIT_SET_CAPCONTID 1022 with fields
> > > > opid= capcontid= old-capcontid=
> > > >
> > > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > > ---
> > > >  fs/proc/base.c             | 55 ++++++++++++++++++++++++++++++++++++++++++++++
> > > >  include/linux/audit.h      | 14 ++++++++++++
> > > >  include/uapi/linux/audit.h |  1 +
> > > >  kernel/audit.c             | 35 +++++++++++++++++++++++++++++
> > > >  4 files changed, 105 insertions(+)
> 
> ...
> 
> > > > diff --git a/kernel/audit.c b/kernel/audit.c
> > > > index 1287f0b63757..1c22dd084ae8 100644
> > > > --- a/kernel/audit.c
> > > > +++ b/kernel/audit.c
> > > > @@ -2698,6 +2698,41 @@ static bool audit_contid_isowner(struct task_struct *tsk)
> > > >         return false;
> > > >  }
> > > >
> > > > +int audit_set_capcontid(struct task_struct *task, u32 enable)
> > > > +{
> > > > +       u32 oldcapcontid;
> > > > +       int rc = 0;
> > > > +       struct audit_buffer *ab;
> > > > +
> > > > +       if (!task->audit)
> > > > +               return -ENOPROTOOPT;
> > > > +       oldcapcontid = audit_get_capcontid(task);
> > > > +       /* if task is not descendant, block */
> > > > +       if (task == current)
> > > > +               rc = -EBADSLT;
> > > > +       else if (!task_is_descendant(current, task))
> > > > +               rc = -EXDEV;
> > >
> > > See my previous comments about error code sanity.
> >
> > I'll go with EXDEV.
> >
> > > > +       else if (current_user_ns() == &init_user_ns) {
> > > > +               if (!capable(CAP_AUDIT_CONTROL) && !audit_get_capcontid(current))
> > > > +                       rc = -EPERM;
> > >
> > > I think we just want to use ns_capable() in the context of the current
> > > userns to check CAP_AUDIT_CONTROL, yes?  Something like this ...
> >
> > I thought we had firmly established in previous discussion that
> > CAP_AUDIT_CONTROL in anything other than init_user_ns was completely irrelevant
> > and untrustable.
> 
> In the case of a container with multiple users, and multiple
> applications, one being a nested orchestrator, it seems relevant to
> allow that container to control which of it's processes are able to
> exercise CAP_AUDIT_CONTROL.  Granted, we still want to control it
> within the overall host, e.g. the container in question must be
> allowed to run a nested orchestrator, but allowing the container
> itself to provide it's own granularity seems like the right thing to
> do.

Looking back to discussion on the v6 patch 2/10 (2019-05-30 15:29 Paul
Moore[1], 2019-07-08 14:05 RGB[2]) , it occurs to me that the
ns_capable(CAP_AUDIT_CONTROL) application was dangerous since there was
no parental accountability in storage or reporting.  Now that is in
place, it does seem a bit more reasonable to allow it, but I'm still not
clear on why we would want both mechanisms now.  I don't understand what
the last line in that email meant: "We would probably still want a
ns_capable(CAP_AUDIT_CONTROL) restriction in this case."  Allow
ns_capable(CAP_AUDIT_CONTROL) to govern these actions, or restrict
ns_capable(CAP_AUDIT_CONTROL) from being used to govern these actions?

If an unprivileged user has been given capcontid to be able run their
own container orchestrator/engine and spawns a user namespace with
CAP_AUDIT_CONTROL, what matters is capcontid, and not CAP_AUDIT_CONTROL.
I could see needing CAP_AUDIT_CONTROL *in addition* to capcontid to give
it finer grained control, but since capcontid would have to be given to
each process explicitly anways, I don't see the point.

If that unprivileged user had not been given capcontid,
giving itself or one of its descendants CAP_AUDIT_CONTROL should not let
it jump into the game all of a sudden unless the now chained audit
container identifiers are deemed accountable enough.  And then now we
need those hard limits on container depth and network namespace
container membership.

> > >   if (current_user_ns() != &init_user_ns) {
> > >     if (!ns_capable(CAP_AUDIT_CONTROL) || !audit_get_capcontid())
> > >       rc = -EPERM;
> > >   } else if (!capable(CAP_AUDIT_CONTROL))
> > >     rc = -EPERM;
> > >
> 
> paul moore

[1] https://www.redhat.com/archives/linux-audit/2019-May/msg00085.html
	https://lkml.org/lkml/2019/5/30/1380
[2] https://www.redhat.com/archives/linux-audit/2019-July/msg00003.html
	https://lkml.org/lkml/2019/7/8/1051

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

