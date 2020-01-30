Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3093914E048
	for <lists+linux-audit@lfdr.de>; Thu, 30 Jan 2020 18:54:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580406874;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=noeh0LlgMY9+zClNF3+wpQcim4raQonpL5XrI+ptp6w=;
	b=O24Du4rlu1i1MMO4qhNlFKIRT35EOVKo1Ye/3s1TI6Y3bccjF4T2zzbwIrFClunaEzfgPn
	u9ZXbVfdhQaY0Gs6Kneu3YJqTemYqKXzf5u3zk00RfnmR6yUtU3iWPqC4huIuXrU1Y0l57
	ruVilK7rHbkFLULGAk3Mxh7hJ+yXXtE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-nxs91AviOXeAkehhmltjpw-1; Thu, 30 Jan 2020 12:54:31 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE0061005510;
	Thu, 30 Jan 2020 17:54:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 67C26CFCF;
	Thu, 30 Jan 2020 17:54:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8A73518089C8;
	Thu, 30 Jan 2020 17:54:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00UHs0XZ003988 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 30 Jan 2020 12:54:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 328195C557; Thu, 30 Jan 2020 17:54:00 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-16.rdu2.redhat.com
	[10.10.112.16])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AE0B5C1B2;
	Thu, 30 Jan 2020 17:53:48 +0000 (UTC)
Date: Thu, 30 Jan 2020 12:53:46 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak90 V8 02/16] audit: add container id
Message-ID: <20200130175346.4ds4dursrarwv4x6@madcap2.tricolour.ca>
References: <cover.1577736799.git.rgb@redhat.com>
	<70ad50e69185c50843d5e14462f1c4f03655d503.1577736799.git.rgb@redhat.com>
	<CAHC9VhTKE_3bOXs+UcpKDQhatKH92uY3Hy=JA4sXXVGOC0ek8A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhTKE_3bOXs+UcpKDQhatKH92uY3Hy=JA4sXXVGOC0ek8A@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: nxs91AviOXeAkehhmltjpw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-01-22 16:28, Paul Moore wrote:
> On Tue, Dec 31, 2019 at 2:49 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> >
> > Implement the proc fs write to set the audit container identifier of a
> > process, emitting an AUDIT_CONTAINER_OP record to document the event.
> >
> > This is a write from the container orchestrator task to a proc entry of
> > the form /proc/PID/audit_containerid where PID is the process ID of the
> > newly created task that is to become the first task in a container, or
> > an additional task added to a container.
> >
> > The write expects up to a u64 value (unset: 18446744073709551615).
> >
> > The writer must have capability CAP_AUDIT_CONTROL.
> >
> > This will produce a record such as this:
> >   type=CONTAINER_OP msg=audit(2018-06-06 12:39:29.636:26949) : op=set opid=2209 contid=123456 old-contid=18446744073709551615
> >
> > The "op" field indicates an initial set.  The "opid" field is the
> > object's PID, the process being "contained".  New and old audit
> > container identifier values are given in the "contid" fields.
> >
> > It is not permitted to unset the audit container identifier.
> > A child inherits its parent's audit container identifier.
> >
> > Please see the github audit kernel issue for the main feature:
> >   https://github.com/linux-audit/audit-kernel/issues/90
> > Please see the github audit userspace issue for supporting additions:
> >   https://github.com/linux-audit/audit-userspace/issues/51
> > Please see the github audit testsuiite issue for the test case:
> >   https://github.com/linux-audit/audit-testsuite/issues/64
> > Please see the github audit wiki for the feature overview:
> >   https://github.com/linux-audit/audit-kernel/wiki/RFE-Audit-Container-ID
> >
> > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > Acked-by: Serge Hallyn <serge@hallyn.com>
> > Acked-by: Steve Grubb <sgrubb@redhat.com>
> > Acked-by: Neil Horman <nhorman@tuxdriver.com>
> > Reviewed-by: Ondrej Mosnacek <omosnace@redhat.com>
> > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > ---
> >  fs/proc/base.c             | 36 ++++++++++++++++++++++++++++
> >  include/linux/audit.h      | 25 ++++++++++++++++++++
> >  include/uapi/linux/audit.h |  2 ++
> >  kernel/audit.c             | 58 ++++++++++++++++++++++++++++++++++++++++++++++
> >  kernel/audit.h             |  1 +
> >  kernel/auditsc.c           |  4 ++++
> >  6 files changed, 126 insertions(+)
> 
> ...
> 
> > diff --git a/kernel/audit.c b/kernel/audit.c
> > index 397f8fb4836a..2d7707426b7d 100644
> > --- a/kernel/audit.c
> > +++ b/kernel/audit.c
> > @@ -2356,6 +2358,62 @@ int audit_signal_info(int sig, struct task_struct *t)
> >         return audit_signal_info_syscall(t);
> >  }
> >
> > +/*
> > + * audit_set_contid - set current task's audit contid
> > + * @task: target task
> > + * @contid: contid value
> > + *
> > + * Returns 0 on success, -EPERM on permission failure.
> > + *
> > + * Called (set) from fs/proc/base.c::proc_contid_write().
> > + */
> > +int audit_set_contid(struct task_struct *task, u64 contid)
> > +{
> > +       u64 oldcontid;
> > +       int rc = 0;
> > +       struct audit_buffer *ab;
> > +
> > +       task_lock(task);
> > +       /* Can't set if audit disabled */
> > +       if (!task->audit) {
> > +               task_unlock(task);
> > +               return -ENOPROTOOPT;
> > +       }
> > +       oldcontid = audit_get_contid(task);
> > +       read_lock(&tasklist_lock);
> > +       /* Don't allow the audit containerid to be unset */
> > +       if (!audit_contid_valid(contid))
> > +               rc = -EINVAL;
> > +       /* if we don't have caps, reject */
> > +       else if (!capable(CAP_AUDIT_CONTROL))
> > +               rc = -EPERM;
> > +       /* if task has children or is not single-threaded, deny */
> > +       else if (!list_empty(&task->children))
> > +               rc = -EBUSY;
> > +       else if (!(thread_group_leader(task) && thread_group_empty(task)))
> > +               rc = -EALREADY;
> 
> [NOTE: there is a bigger issue below which I think is going to require
> a respin/fixup of this patch so I'm going to take the opportunity to
> do a bit more bikeshedding ;)]
> 
> It seems like we could combine both the thread/children checks under a
> single -EBUSY return value.  In both cases the caller should be able
> to determine if the target process is multi-threaded for has spawned
> children, yes?  FWIW, my motivation for this question is that
> -EALREADY seems like a poor choice here.

Fair enough.

> > +       /* if contid is already set, deny */
> > +       else if (audit_contid_set(task))
> > +               rc = -ECHILD;
> 
> Does -EEXIST make more sense here?

Perhaps.  I don't feel strongly about it, but none of these error codes
were intended for this use and should not overlap with other errors from
writing to /proc.

> > +       read_unlock(&tasklist_lock);
> > +       if (!rc)
> > +               task->audit->contid = contid;
> > +       task_unlock(task);
> > +
> > +       if (!audit_enabled)
> > +               return rc;
> > +
> > +       ab = audit_log_start(audit_context(), GFP_KERNEL, AUDIT_CONTAINER_OP);
> > +       if (!ab)
> > +               return rc;
> > +
> > +       audit_log_format(ab,
> > +                        "op=set opid=%d contid=%llu old-contid=%llu",
> > +                        task_tgid_nr(task), contid, oldcontid);
> > +       audit_log_end(ab);
> 
> Assuming audit is enabled we always emit the record above, even if we
> were not actually able to set the Audit Container ID (ACID); this
> seems wrong to me.  I think the proper behavior would be to either add
> a "res=" field to indicate success/failure or only emit the record
> when we actually change a task's ACID.  Considering the impact that
> the ACID value will potentially have on the audit stream, it seems
> like always logging the record and including a "res=" field may be the
> safer choice.

This record should be accompanied by a syscall record (and eventually
possibly a CONTAINER_ID record of the orchestrator, if it is already in
a container).  The syscall record has a res= field that already gives
this result.

> > +       return rc;
> > +}
> > +
> >  /**
> >   * audit_log_end - end one audit record
> >   * @ab: the audit_buffer
> 
> --
> paul moore
> www.paul-moore.com
> 

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

