Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4EEC02852E0
	for <lists+linux-audit@lfdr.de>; Tue,  6 Oct 2020 22:05:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602014755;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fmb4ItK3xu7do3Dwb6SKD1h2I9U+3J0PZ+z6wQQa2DA=;
	b=gOutYsCWLC157PzuPC89souso7LdxGfLxC4K5rfdsJgtVAhGk5kb5xi85iCts60GMQpHms
	ZfK0sGq9OxMrImjUwwv1GaIxGpSl8tqAHWW+QEMjbvzkxuIgs30QVyFz8vWoMv+pBHqH7+
	vSd1HYMMDuQwBsphVOjXujyMlW5zJPA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-ZQNX4Q9uOHu7fqcj1ftc5w-1; Tue, 06 Oct 2020 16:05:52 -0400
X-MC-Unique: ZQNX4Q9uOHu7fqcj1ftc5w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18493104D400;
	Tue,  6 Oct 2020 20:05:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D96F01002D42;
	Tue,  6 Oct 2020 20:05:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 83115181A050;
	Tue,  6 Oct 2020 20:05:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 096K48PS022072 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 6 Oct 2020 16:04:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9B9955D993; Tue,  6 Oct 2020 20:04:08 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 767315D9CD;
	Tue,  6 Oct 2020 20:03:50 +0000 (UTC)
Date: Tue, 6 Oct 2020 16:03:47 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak90 V9 11/13] audit: contid check descendancy and
	nesting
Message-ID: <20201006200347.GI2882171@madcap2.tricolour.ca>
References: <cover.1593198710.git.rgb@redhat.com>
	<01229b93733d9baf6ac9bb0cc243eeb08ad579cd.1593198710.git.rgb@redhat.com>
	<CAHC9VhT6cLxxws_pYWcL=mWe786xPoTTFfPZ1=P4hx4V3nytXA@mail.gmail.com>
	<20200807171025.523i2sxfyfl7dfjy@madcap2.tricolour.ca>
	<CAHC9VhQ3MVUY8Zs4GNXdaqhiPJBzHW_YcCe=DghAgo7g6yrNBw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhQ3MVUY8Zs4GNXdaqhiPJBzHW_YcCe=DghAgo7g6yrNBw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org, aris@redhat.com,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020-08-21 16:13, Paul Moore wrote:
> On Fri, Aug 7, 2020 at 1:10 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > On 2020-07-05 11:11, Paul Moore wrote:
> > > On Sat, Jun 27, 2020 at 9:23 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > > Require the target task to be a descendant of the container
> > > > orchestrator/engine.
> 
> If you want to get formal about this, you need to define "target" in
> the sentence above.  Target of what?

The target is the task having its audit container identifier modified by
the orchestrator current task.

> FWIW, I read the above to basically mean that a task can only set the
> audit container ID of processes which are beneath it in the "process
> tree" where the "process tree" is defined as the relationship between
> a parent and children processes such that the children processes are
> branches below the parent process.

Yes.

> I have no problem with that, with the understanding that nesting
> complicates it somewhat.  For example, this isn't true when one of the
> children is a nested orchestrator, is it?

It should still be true if that child is a nested orchestrator that has
not yet spawned any children or threads (or they have all died off).

It does get more complicated when we consider the scenario outlined
below about perceived layer violations...

> > > > You would only change the audit container ID from one set or inherited
> > > > value to another if you were nesting containers.
> 
> I thought we decided we were going to allow an orchestrator to move a
> process between audit container IDs, yes?  no?

We did?  I don't remember anything about that.  Has this been requested?
This seems to violate the rule that we can't change the audit container
identifier once it has been set (other than nesting).  Can you suggest a
use case?

> > > > If changing the contid, the container orchestrator/engine must be a
> > > > descendant and not same orchestrator as the one that set it so it is not
> > > > possible to change the contid of another orchestrator's container.
> 
> Try rephrasing the above please, it isn't clear to me what you are
> trying to say.

This is harder than I expected to rephrase...  It also makes it clear
that there are some scenarios that have not been considered that may
need to be restricted.

Orchestrator A spawned task B which is itself an orchestrator without
chidren yet.  Orchestrator A sets the audit container identifier of B.
Neither A, nor B, nor any other child of A (or any of their
descendants), nor any orchestrator outside the tree of A (uncles, aunts
and cousins are outside), can change the audit container identifier of
B.

Orchestrator B spawns task C.  Here's where it gets tricky.  It seems
like a layer violation for B to spawn a child C and have A reach over B
to set the audit container identifier of C, especially if B is also an
orchestrator.  This all will be especially hard to police if we don't
limit the ability of an orchestrator task to set an audit container
identifier to that orchestrator's immediate children, only once.

> > Are we able to agree on the premises above?  Is anything asserted that
> > should not be and is there anything missing?
> 
> See above.
> 
> If you want to go back to the definitions/assumptions stage, it
> probably isn't worth worrying about the other comments until we get
> the above sorted.

I don't want to.  I'm trying to confirm that we are on the same page.

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

