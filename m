Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B7E2E868
	for <lists+linux-audit@lfdr.de>; Thu, 30 May 2019 00:40:58 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7DBA972665;
	Wed, 29 May 2019 22:40:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C90085DEC7;
	Wed, 29 May 2019 22:40:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 46B811806B16;
	Wed, 29 May 2019 22:40:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4TMeCFc010251 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 29 May 2019 18:40:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 72EED5DA62; Wed, 29 May 2019 22:40:12 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DF137A469
	for <linux-audit@redhat.com>; Wed, 29 May 2019 22:40:10 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C16C630C3192
	for <linux-audit@redhat.com>; Wed, 29 May 2019 22:40:01 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id z5so4111918lji.10
	for <linux-audit@redhat.com>; Wed, 29 May 2019 15:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WTgrsrN2kv//1St2pvsmjLA5iqBOgmifLWx+zhYVKFA=;
	b=dQA6HRvG3+wzV5eXemCHoKBPfsIFBFsv2wTeLNycaFR8OykyginbjbUIT+4Y+EKPbn
	66+our2twD97jFo/r1GvJljozn9a2WOhpNKWiSZxPrqe2x55z2gRDo/Hti9obvPDpCxy
	q0/82fxVtQ9NQbtPmOUGCIZVaSmj/O0i9tPpfbwg62BSmDBNpQ/ZDjb6CDHO0eIrG594
	2Khitp6zhlMlPIaB+DbmKsslk5i4gt0fMhdFLXDZTeSG56f4xmZu/LzKkptugoepqPLd
	VsHmw7z6pxW6mEdkM++TXegVXY3pcTca5WN1sgP/IqMPAQ40mQ/JCxGRX5nkVko7dOCt
	eIbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WTgrsrN2kv//1St2pvsmjLA5iqBOgmifLWx+zhYVKFA=;
	b=EcHTNN2ovvhrnU+AlPKrkpywOQT/dD+NdDek5nLiTVaVs/e9uDnVr2gsy9Q1VIsiyt
	Cv1Ju4aoIaT+eMt/nCn+YLhJ81iqvWIfktLrMQi4NwUkSwxgM+U5WAZwB8KdfGagKk7U
	MbGB1LgETrO57ptQ9u7jvQUXDlWNQEXHdDyPmyr9H9PJPyOdw7sEq1/gE/u3TK272Gjh
	oEelaSANqnvuRZJNYCr23ET9gzNt0aeXE8p4R7jI7khCB7KazV6g8pSJAPhp4wgwc5MV
	ik+n9Xm+H9KZne2ilwQ2Z1xNOW8jU5XATM3wKJ7W9lS5CwoDl8kTafo5QOaBmCgSvsjj
	6RfQ==
X-Gm-Message-State: APjAAAUd965tFwDTK1ZGpCVyl+F74GzHsiPFEDLwhI6/KoAcYZ/SXlkW
	k8bdeatYSZFF+MEZ21o/DdQo9oXx9mx/SHakMSNT
X-Google-Smtp-Source: APXvYqypWUt4sIdwbKkSaqf3h7Xd+EVdB693EwEA/QY8VSfiHNLm7NcciHkAOIz7+KuTVCkWgrvincEsQyEv7l6QF/g=
X-Received: by 2002:a2e:9a97:: with SMTP id p23mr173332lji.160.1559169600002; 
	Wed, 29 May 2019 15:40:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1554732921.git.rgb@redhat.com>
	<9edad39c40671fb53f28d76862304cc2647029c6.1554732921.git.rgb@redhat.com>
	<20190529145742.GA8959@cisco>
	<CAHC9VhR4fudQanvZGYWMvCf7k2CU3q7e7n1Pi7hzC3v_zpVEdw@mail.gmail.com>
	<20190529153427.GB8959@cisco>
	<CAHC9VhSF3AjErX37+eeusJ7+XRw8yuPsmqBTRwc9EVoRBh_3Tw@mail.gmail.com>
	<20190529222835.GD8959@cisco>
In-Reply-To: <20190529222835.GD8959@cisco>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 29 May 2019 18:39:48 -0400
Message-ID: <CAHC9VhRS66VGtug3fq3RTGHDvfGmBJG6yRJ+iMxm3cxnNF-zJw@mail.gmail.com>
Subject: Re: [PATCH ghak90 V6 02/10] audit: add container id
To: Tycho Andersen <tycho@tycho.ws>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Wed, 29 May 2019 22:40:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Wed, 29 May 2019 22:40:02 +0000 (UTC) for IP:'209.85.208.193'
	DOMAIN:'mail-lj1-f193.google.com'
	HELO:'mail-lj1-f193.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.008  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_NONE) 209.85.208.193 mail-lj1-f193.google.com 209.85.208.193
	mail-lj1-f193.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Wed, 29 May 2019 22:40:57 +0000 (UTC)

On Wed, May 29, 2019 at 6:28 PM Tycho Andersen <tycho@tycho.ws> wrote:
> On Wed, May 29, 2019 at 12:03:58PM -0400, Paul Moore wrote:
> > On Wed, May 29, 2019 at 11:34 AM Tycho Andersen <tycho@tycho.ws> wrote:
> > >
> > > On Wed, May 29, 2019 at 11:29:05AM -0400, Paul Moore wrote:
> > > > On Wed, May 29, 2019 at 10:57 AM Tycho Andersen <tycho@tycho.ws> wrote:
> > > > >
> > > > > On Mon, Apr 08, 2019 at 11:39:09PM -0400, Richard Guy Briggs wrote:
> > > > > > It is not permitted to unset the audit container identifier.
> > > > > > A child inherits its parent's audit container identifier.
> > > > >
> > > > > ...
> > > > >
> > > > > >  /**
> > > > > > + * audit_set_contid - set current task's audit contid
> > > > > > + * @contid: contid value
> > > > > > + *
> > > > > > + * Returns 0 on success, -EPERM on permission failure.
> > > > > > + *
> > > > > > + * Called (set) from fs/proc/base.c::proc_contid_write().
> > > > > > + */
> > > > > > +int audit_set_contid(struct task_struct *task, u64 contid)
> > > > > > +{
> > > > > > +     u64 oldcontid;
> > > > > > +     int rc = 0;
> > > > > > +     struct audit_buffer *ab;
> > > > > > +     uid_t uid;
> > > > > > +     struct tty_struct *tty;
> > > > > > +     char comm[sizeof(current->comm)];
> > > > > > +
> > > > > > +     task_lock(task);
> > > > > > +     /* Can't set if audit disabled */
> > > > > > +     if (!task->audit) {
> > > > > > +             task_unlock(task);
> > > > > > +             return -ENOPROTOOPT;
> > > > > > +     }
> > > > > > +     oldcontid = audit_get_contid(task);
> > > > > > +     read_lock(&tasklist_lock);
> > > > > > +     /* Don't allow the audit containerid to be unset */
> > > > > > +     if (!audit_contid_valid(contid))
> > > > > > +             rc = -EINVAL;
> > > > > > +     /* if we don't have caps, reject */
> > > > > > +     else if (!capable(CAP_AUDIT_CONTROL))
> > > > > > +             rc = -EPERM;
> > > > > > +     /* if task has children or is not single-threaded, deny */
> > > > > > +     else if (!list_empty(&task->children))
> > > > > > +             rc = -EBUSY;
> > > > > > +     else if (!(thread_group_leader(task) && thread_group_empty(task)))
> > > > > > +             rc = -EALREADY;
> > > > > > +     read_unlock(&tasklist_lock);
> > > > > > +     if (!rc)
> > > > > > +             task->audit->contid = contid;
> > > > > > +     task_unlock(task);
> > > > > > +
> > > > > > +     if (!audit_enabled)
> > > > > > +             return rc;
> > > > >
> > > > > ...but it is allowed to change it (assuming
> > > > > capable(CAP_AUDIT_CONTROL), of course)? Seems like this might be more
> > > > > immediately useful since we still live in the world of majority
> > > > > privileged containers if we didn't allow changing it, in addition to
> > > > > un-setting it.
> > > >
> > > > The idea is that only container orchestrators should be able to
> > > > set/modify the audit container ID, and since setting the audit
> > > > container ID can have a significant effect on the records captured
> > > > (and their routing to multiple daemons when we get there) modifying
> > > > the audit container ID is akin to modifying the audit configuration
> > > > which is why it is gated by CAP_AUDIT_CONTROL.  The current thinking
> > > > is that you would only change the audit container ID from one
> > > > set/inherited value to another if you were nesting containers, in
> > > > which case the nested container orchestrator would need to be granted
> > > > CAP_AUDIT_CONTROL (which everyone to date seems to agree is a workable
> > > > compromise).
> > >
> > > But then don't you want some kind of ns_capable() instead (probably
> > > not the obvious one, though...)? With capable(), you can't really nest
> > > using the audit-id and user namespaces together.
> >
> > You want capable() and not ns_capable() because you want to ensure
> > that the orchestrator has the rights in the init_ns as changes to the
> > audit container ID could have an auditing impact that spans the entire
> > system.
>
> Ok but,
>
> > > > The current thinking
> > > > is that you would only change the audit container ID from one
> > > > set/inherited value to another if you were nesting containers, in
> > > > which case the nested container orchestrator would need to be granted
> > > > CAP_AUDIT_CONTROL (which everyone to date seems to agree is a workable
> > > > compromise).
>
> won't work in user namespaced containers, because they will never be
> capable(CAP_AUDIT_CONTROL); so I don't think this will work for
> nesting as is. But maybe nobody cares :)

That's fun :)

To be honest, I've never been a big fan of supporting nested
containers from an audit perspective, so I'm not really too upset
about this.  The k8s/cri-o folks seem okay with this, or at least I
haven't heard any objections; lxc folks, what do you have to say?

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
