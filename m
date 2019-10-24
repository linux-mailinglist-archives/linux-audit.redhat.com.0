Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id CB1F9E3ECE
	for <lists+linux-audit@lfdr.de>; Fri, 25 Oct 2019 00:08:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571954935;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iZXIL44ddWwVtlO2auo3BFEX7JUeqrM4AZL2yyEnBOc=;
	b=SO1Mnu6a1N7RYTVA54MKySjuSdy1uCqip/0tKaJOr2+orK9qpfwr0bLFjbUJRCQAD+/rUF
	jBLHRbcyWAnQsnzs6pXGO2OdJapNv5qT/1WFFIzXi6FFCcKERoyAynqE0jbpxK3h3R07Xp
	ynRfPZCQNJrdtLsedP7CZwkv6wGSGcw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-DJGm0lwcMf-dOIXUBWOwoA-1; Thu, 24 Oct 2019 18:08:50 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FC0347B;
	Thu, 24 Oct 2019 22:08:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E1A075D713;
	Thu, 24 Oct 2019 22:08:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A74914E58A;
	Thu, 24 Oct 2019 22:08:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9OM8Tl6022345 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 24 Oct 2019 18:08:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3FE7B5C223; Thu, 24 Oct 2019 22:08:29 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-19.phx2.redhat.com [10.3.112.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 961B05C1B5;
	Thu, 24 Oct 2019 22:08:17 +0000 (UTC)
Date: Thu, 24 Oct 2019 18:08:14 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak90 V7 14/21] audit: contid check descendancy and
	nesting
Message-ID: <20191024220814.pid5ql6kvyr4ianb@madcap2.tricolour.ca>
References: <cover.1568834524.git.rgb@redhat.com>
	<16abf1b2aafeb5f1b8dae20b9a4836e54f959ca5.1568834524.git.rgb@redhat.com>
	<CAHC9VhSRmn46DcazH4Q35vOSxVoEu8PsX79aurkHkFymRoMwag@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhSRmn46DcazH4Q35vOSxVoEu8PsX79aurkHkFymRoMwag@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: DJGm0lwcMf-dOIXUBWOwoA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On 2019-10-10 20:40, Paul Moore wrote:
> On Wed, Sep 18, 2019 at 9:26 PM Richard Guy Briggs <rgb@redhat.com> wrote=
:
> > ?fixup! audit: convert to contid list to check for orch/engine ownershi=
p
>=20
> ?
>=20
> > Require the target task to be a descendant of the container
> > orchestrator/engine.
> >
> > You would only change the audit container ID from one set or inherited
> > value to another if you were nesting containers.
> >
> > If changing the contid, the container orchestrator/engine must be a
> > descendant and not same orchestrator as the one that set it so it is no=
t
> > possible to change the contid of another orchestrator's container.
>=20
> Did you mean to say that the container orchestrator must be an
> ancestor of the target, and the same orchestrator as the one that set
> the target process' audit container ID?

Not quite, the first half yes, but the second half: if it was already
set by that orchestrator, it can't be set again.  If it is a different
orchestrator that is a descendant of the orchestrator that set it, then
allow the action.

> Or maybe I'm missing something about what you are trying to do?

Does that help clarify it?

> > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > ---
> >  kernel/audit.c | 70 ++++++++++++++++++++++++++++++++++++++++++++++++++=
+-------
> >  1 file changed, 62 insertions(+), 8 deletions(-)
> >
> > diff --git a/kernel/audit.c b/kernel/audit.c
> > index 9ce7a1ec7a92..69fe1e9af7cb 100644
> > --- a/kernel/audit.c
> > +++ b/kernel/audit.c
> > @@ -2560,6 +2560,39 @@ static struct task_struct *audit_cont_owner(stru=
ct task_struct *tsk)
> >  }
> >
> >  /*
> > + * task_is_descendant - walk up a process family tree looking for a ma=
tch
> > + * @parent: the process to compare against while walking up from child
> > + * @child: the process to start from while looking upwards for parent
> > + *
> > + * Returns 1 if child is a descendant of parent, 0 if not.
> > + */
> > +static int task_is_descendant(struct task_struct *parent,
> > +                             struct task_struct *child)
> > +{
> > +       int rc =3D 0;
> > +       struct task_struct *walker =3D child;
> > +
> > +       if (!parent || !child)
> > +               return 0;
> > +
> > +       rcu_read_lock();
> > +       if (!thread_group_leader(parent))
> > +               parent =3D rcu_dereference(parent->group_leader);
> > +       while (walker->pid > 0) {
> > +               if (!thread_group_leader(walker))
> > +                       walker =3D rcu_dereference(walker->group_leader=
);
> > +               if (walker =3D=3D parent) {
> > +                       rc =3D 1;
> > +                       break;
> > +               }
> > +               walker =3D rcu_dereference(walker->real_parent);
> > +       }
> > +       rcu_read_unlock();
> > +
> > +       return rc;
> > +}
> > +
> > +/*
> >   * audit_set_contid - set current task's audit contid
> >   * @task: target task
> >   * @contid: contid value
> > @@ -2587,22 +2620,43 @@ int audit_set_contid(struct task_struct *task, =
u64 contid)
> >         oldcontid =3D audit_get_contid(task);
> >         read_lock(&tasklist_lock);
> >         /* Don't allow the contid to be unset */
> > -       if (!audit_contid_valid(contid))
> > +       if (!audit_contid_valid(contid)) {
> >                 rc =3D -EINVAL;
> > +               goto unlock;
> > +       }
> >         /* Don't allow the contid to be set to the same value again */
> > -       else if (contid =3D=3D oldcontid) {
> > +       if (contid =3D=3D oldcontid) {
> >                 rc =3D -EADDRINUSE;
> > +               goto unlock;
> > +       }
> >         /* if we don't have caps, reject */
> > -       else if (!capable(CAP_AUDIT_CONTROL))
> > +       if (!capable(CAP_AUDIT_CONTROL)) {
> >                 rc =3D -EPERM;
> > -       /* if task has children or is not single-threaded, deny */
> > -       else if (!list_empty(&task->children))
> > +               goto unlock;
> > +       }
> > +       /* if task has children, deny */
> > +       if (!list_empty(&task->children)) {
> >                 rc =3D -EBUSY;
> > -       else if (!(thread_group_leader(task) && thread_group_empty(task=
)))
> > +               goto unlock;
> > +       }
> > +       /* if task is not single-threaded, deny */
> > +       if (!(thread_group_leader(task) && thread_group_empty(task))) {
> >                 rc =3D -EALREADY;
> > -       /* if contid is already set, deny */
> > -       else if (audit_contid_set(task))
> > +               goto unlock;
> > +       }
> > +       /* if task is not descendant, block */
> > +       if (task =3D=3D current) {
> > +               rc =3D -EBADSLT;
> > +               goto unlock;
> > +       }
> > +       if (!task_is_descendant(current, task)) {
> > +               rc =3D -EXDEV;
> > +               goto unlock;
> > +       }
> > +       /* only allow contid setting again if nesting */
> > +       if (audit_contid_set(task) && current =3D=3D audit_cont_owner(t=
ask))
> >                 rc =3D -ECHILD;
> > +unlock:
> >         read_unlock(&tasklist_lock);
> >         if (!rc) {
> >                 struct audit_cont *oldcont =3D audit_cont(task);
>=20
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

