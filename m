Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id A669822AFDD
	for <lists+linux-audit@lfdr.de>; Thu, 23 Jul 2020 15:01:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595509310;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iJjlEd65ji+2zdClvS+feIy4GsDQrfi3ac0/gWbugP4=;
	b=hdaA+RT1uGpLvVJeWJkcFJI5NAA7oSadCLe3lYwCl2D4S+hHivl/thL/BW+j4Bn5sjZcZt
	zuTF7Ex4r6O7W9LmivWtSnCKafuIqalA/t/t6MVtgPJIaAnBpOqMHYSxaEA/MDx83xEdss
	rpSbf9NwSiB+y1TgSuIa3NyzSGqJb3M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-EVhXyDPEP_S72vmNMC07pA-1; Thu, 23 Jul 2020 09:01:48 -0400
X-MC-Unique: EVhXyDPEP_S72vmNMC07pA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9621C800685;
	Thu, 23 Jul 2020 13:01:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E8D5319D81;
	Thu, 23 Jul 2020 13:01:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AE9DA730F4;
	Thu, 23 Jul 2020 13:01:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06NCutfV026055 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 23 Jul 2020 08:56:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4AC5F69316; Thu, 23 Jul 2020 12:56:55 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.3])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E6BD5FC3B;
	Thu, 23 Jul 2020 12:56:47 +0000 (UTC)
Date: Thu, 23 Jul 2020 08:56:45 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: null pointer dereference regression in 5.7
Message-ID: <20200723125645.mfvuss2m2b6bou3s@madcap2.tricolour.ca>
References: <9c8f1fc6-2b8e-e9e3-37bf-2d1d6bedace1@gmail.com>
	<360c7a62-fd39-ad02-60b8-87fb18022eeb@defensec.nl>
	<CAHC9VhRGJ4EwFYpRtoHe=m_GNB6WAt3cDCf7pd4YbvydEPpy3w@mail.gmail.com>
	<CAHC9VhTbMB==FaxwUDviw9D5-M6wUGnYwwHz7wCDMYSOUw07dA@mail.gmail.com>
	<20200722020100.tigrpqzoxj6pqf52@madcap2.tricolour.ca>
	<CAHC9VhT6A0mo4FozQV9G1+U7F=8B6ApjxonTtXXEBCnSy4ikgw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhT6A0mo4FozQV9G1+U7F=8B6ApjxonTtXXEBCnSy4ikgw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
Cc: bauen1 <j2468h@googlemail.com>, linux-audit@redhat.com,
	Dominick Grift <dominick.grift@defensec.nl>
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-07-22 21:01, Paul Moore wrote:
> On Tue, Jul 21, 2020 at 10:01 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > On 2020-07-21 18:45, Paul Moore wrote:
> > > On Tue, Jul 21, 2020 at 6:30 PM Paul Moore <paul@paul-moore.com> wrote:
> > > > Richard, you broke it, you bought it :)  Did you want to take a closer
> > > > look at this?  If you can't let me know.  Based on a quick look, my
> > > > gut feeling is that either context->pwd is never set properly or it is
> > > > getting free'd prematurely; I'm highly suspicious of the latter but
> > > > the former seems like it might be a reasonable place to start.
> > >
> > > Actually, yes, I'm pretty certain the problem is that context->pwd is
> > > never set in this case.
> >
> > Does the ghak96 upstream patch in audit/next on 5.8-rc1 fix it?
> >         d7481b24b816 ("audit: issue CWD record to accompany LSM_AUDIT_DATA_* records")
> >
> > The avc is generated by common_lsm_audit() which calls
> > dump_common_audit_data() that now calls audit_getcwd() on the 5
> > LSM_AUDIT_DATA_* types that deal with paths.
> 
> I would expect that it would resolve the problem being reported, which
> is good, but I'm not sure it is a general solution to the problem.  I
> suspect there is bigger problem of context->pwd not always having a
> "safe" value when the task exits or the syscall returns to userspace.

Agreed.  The easiest way to prevent this is to check for a null
ctx->pwd, but if it has a random unset or scribbled non-NULL (0x60)
invalid value, that won't help.

> > > Normally context->pwd would be set by a call to
> > > audit_getname()/__audit_getname(), but if there audit context is a
> > > dummy context, that is skipped and context->pwd is never set.
> > > Normally that is fine, expect with Richard's patch if the kernel
> > > explicitly calls audit_log_start() we mark the context as ... not a
> > > dummy?  smart?  I'm not sure of the right term here ... which then
> > > triggers all the usual logging one would expect.  In this particular
> > > case, a SELinux AVC, the audit_log_start() happens *after* the
> > > pathname has been resolved and the audit_getname() calls are made;
> > > thus in this case context->pwd is not valid when the normal audit
> > > logging takes place on exit and things explode in predictable fashion.
> >
> > The first two AVCs that were accompanied by syscalls had "items=0" but
> > the one that blew up had "items=2" so it appears the paths were already
> > present in the context, but missing the pwd.
> 
> Yes, the issue is with context->pwd, although I suppose other fields
> could also be suspect.
> 
> > > Unfortunately, it is beginning to look like 1320a4052ea1 ("audit:
> > > trigger accompanying records when no rules present") may be more
> > > dangerous than initially thought.  I'm borderline tempted to just
> > > revert this patch, but I'll leave this open for discussion ...
> > > Richard, I think you need to go through the code and audit all of the
> > > functions that store data in an audit context that are skipped when
> > > there is a dummy context to see which fields are potentially unset,
> > > and then look at all the end of task/syscall code to make sure the
> > > necessary set/unset checks are in place.
> >
> > Auditing all the callers is not a small task, but I agree it may be
> > necessary.
> 
> Do you have a rough idea as to how long it would take to chase down
> all the code paths?  I'm asking not to rush you, but to figure out if
> we should revert the patch now to resolve the problem and restore it
> later once we are confident there are no additional issues lurking.

I figure 2-3 days.

I'm trying to remember the name of the tool to build a function calling
tree, either up or down.  Was it cscope?  Or is there something more
modern?  It will have some limitations due to op function pointers.

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

