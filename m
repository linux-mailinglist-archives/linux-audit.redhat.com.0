Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id E313C147359
	for <lists+linux-audit@lfdr.de>; Thu, 23 Jan 2020 22:48:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579816096;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dqujWZK2pV+x8Mpz+85BZmqxA1xONXAGQ3C1EShN9u0=;
	b=NQmHejQnIm53tOWmuq7XC5WdzljMHYrzHq/94dfPmg/C0qwS+12FDB+7HovO2qzMeRPzoC
	5utHicyu8Y0dVD8Czq6XjJePmLCuFBvD9xXlePG/S2UNWlajtXbuZoAnBPZBwW1pwerrS0
	JqlXwClRnJNCs6kBRhbY8A7hLFahJAM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-MTn8H1eaNkmLgEfn1N9fkQ-1; Thu, 23 Jan 2020 16:48:14 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 062E4100550E;
	Thu, 23 Jan 2020 21:48:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 99E6586448;
	Thu, 23 Jan 2020 21:48:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C131185951;
	Thu, 23 Jan 2020 21:48:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00NLm1iU003760 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 23 Jan 2020 16:48:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CABAB10065D0; Thu, 23 Jan 2020 21:48:01 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E1F91094ABE
	for <linux-audit@redhat.com>; Thu, 23 Jan 2020 21:47:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8A3A803B24
	for <linux-audit@redhat.com>; Thu, 23 Jan 2020 21:47:59 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-413-_p-pV9bBNJqb9EhtJrWyqQ-1; Thu, 23 Jan 2020 16:47:51 -0500
Received: by mail-lj1-f193.google.com with SMTP id w1so8191ljh.5
	for <linux-audit@redhat.com>; Thu, 23 Jan 2020 13:47:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YhdQmzKcBNrdoLI54N+iRiz95hS2N5V9TEIVZsNwGUQ=;
	b=svkD94kFgNLDZJkFHckuqndph3rLUsXNhbxieXsZD1ISx7ZjXRUjDKmSmlu5WoV/fu
	x5OpdVDOohTbyRCNYQSYtDLrDZ5aaaqBMh9DryrZ3IoDseLW6EhHhimzKWvfNowA7rvY
	yDFT0FVy4iXltIwH3leyB8lbmMoTFucuPm65nKJUCTK+0qKIBnrgRWXqDOYOFQ692gkv
	0Qsn+zz0pxsWjDwCDLPhelc7H+uZBW42MG2faOVl+TmVywBKgw8b0qTMbsUIKYPPK5AH
	BJvP7xY1KdKPNPxswHi8D72rEKx7TxGL1XcyrHCB+zeG5kNX+QeARbFy46xDQWdwDRkC
	agPA==
X-Gm-Message-State: APjAAAWfH9iZwmQtWuL3XxAl0mUKgcPr5yignlo6fcIH6LlzZ0ubuoSJ
	Y6bQAvUny4mGS06wcvp5jxL6iWiaO+ZSCErjii9t
X-Google-Smtp-Source: APXvYqztFa7vAl8EvjnBAbXT/Sxp3LD4cPaFKrc0PnFsn1Bc8BoDdWYI9cS1dXL0IglZHlYX5t78xA0hNpmBE5LAkJ0=
X-Received: by 2002:a05:651c:204f:: with SMTP id
	t15mr251303ljo.240.1579816069696; 
	Thu, 23 Jan 2020 13:47:49 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577736799.git.rgb@redhat.com>
	<cfbb80a08fc770dd0dcf6dac6ff307a80d877c3f.1577736799.git.rgb@redhat.com>
	<CAHC9VhT1+mx_tVzyXD=UBqagqYgAFjZ=X1A6oBiMvjVCn8=V-w@mail.gmail.com>
	<20200123210240.sq64tptjm3ds7xss@madcap2.tricolour.ca>
In-Reply-To: <20200123210240.sq64tptjm3ds7xss@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 23 Jan 2020 16:47:38 -0500
Message-ID: <CAHC9VhQtAfW-+sK3Gb6y=jPYOkyXnopO94k+u_6UKAAaACg44Q@mail.gmail.com>
Subject: Re: [PATCH ghak90 V8 12/16] audit: contid check descendancy and
	nesting
To: Richard Guy Briggs <rgb@redhat.com>
X-MC-Unique: _p-pV9bBNJqb9EhtJrWyqQ-1
X-MC-Unique: MTn8H1eaNkmLgEfn1N9fkQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00NLm1iU003760
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 23, 2020 at 4:03 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-01-22 16:29, Paul Moore wrote:
> > On Tue, Dec 31, 2019 at 2:51 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > >
> > > Require the target task to be a descendant of the container
> > > orchestrator/engine.
> > >
> > > You would only change the audit container ID from one set or inherited
> > > value to another if you were nesting containers.
> > >
> > > If changing the contid, the container orchestrator/engine must be a
> > > descendant and not same orchestrator as the one that set it so it is not
> > > possible to change the contid of another orchestrator's container.
> > >
> > > Since the task_is_descendant() function is used in YAMA and in audit,
> > > remove the duplication and pull the function into kernel/core/sched.c
> > >
> > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > ---
> > >  include/linux/sched.h    |  3 +++
> > >  kernel/audit.c           | 44 ++++++++++++++++++++++++++++++++++++--------
> > >  kernel/sched/core.c      | 33 +++++++++++++++++++++++++++++++++
> > >  security/yama/yama_lsm.c | 33 ---------------------------------
> > >  4 files changed, 72 insertions(+), 41 deletions(-)
> >
> > ...
> >
> > > diff --git a/kernel/audit.c b/kernel/audit.c
> > > index f7a8d3288ca0..ef8e07524c46 100644
> > > --- a/kernel/audit.c
> > > +++ b/kernel/audit.c
> > > @@ -2603,22 +2610,43 @@ int audit_set_contid(struct task_struct *task, u64 contid)
> > >         oldcontid = audit_get_contid(task);
> > >         read_lock(&tasklist_lock);
> > >         /* Don't allow the contid to be unset */
> > > -       if (!audit_contid_valid(contid))
> > > +       if (!audit_contid_valid(contid)) {
> > >                 rc = -EINVAL;
> > > +               goto unlock;
> > > +       }
> > >         /* Don't allow the contid to be set to the same value again */
> > > -       else if (contid == oldcontid) {
> > > +       if (contid == oldcontid) {
> > >                 rc = -EADDRINUSE;
> > > +               goto unlock;
> > > +       }
> > >         /* if we don't have caps, reject */
> > > -       else if (!capable(CAP_AUDIT_CONTROL))
> > > +       if (!capable(CAP_AUDIT_CONTROL)) {
> > >                 rc = -EPERM;
> > > -       /* if task has children or is not single-threaded, deny */
> > > -       else if (!list_empty(&task->children))
> > > +               goto unlock;
> > > +       }
> > > +       /* if task has children, deny */
> > > +       if (!list_empty(&task->children)) {
> > >                 rc = -EBUSY;
> > > -       else if (!(thread_group_leader(task) && thread_group_empty(task)))
> > > +               goto unlock;
> > > +       }
> > > +       /* if task is not single-threaded, deny */
> > > +       if (!(thread_group_leader(task) && thread_group_empty(task))) {
> > >                 rc = -EALREADY;
> > > -       /* if contid is already set, deny */
> > > -       else if (audit_contid_set(task))
> > > +               goto unlock;
> > > +       }
> >
> > It seems like the if/else-if conversion above should be part of an
> > earlier patchset.
>
> I had considered that, but it wasn't obvious where that conversion
> should happen since it wasn't necessary earlier and is now.  I can move
> it earlier if you feel strongly about it.

Not particularly.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

