Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 980E815B5B6
	for <lists+linux-audit@lfdr.de>; Thu, 13 Feb 2020 01:12:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581552749;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uLrzVaZTYFEE0Gqlr70oVocg1BHXWsoaQAUYPa5SYtA=;
	b=HDUtJiMc5XhMnxnFxUYmX9znRa1UV0jCetYDPoD5J6IJolHW90GP5sog1QPXtMt2jbAEiC
	NYXxp+63AVtRfA+59B0fDW8xDHrkx5IPesoK8YTtsjF4S4la6bPT5ybo7Hv6hlqiunD8k9
	UtG0XHeaObe8tLHEPaRrcGlfF7y6whE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-nYdR9OgdMZaw96-4hvVvGg-1; Wed, 12 Feb 2020 19:12:26 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86222800D50;
	Thu, 13 Feb 2020 00:12:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 754F560BF4;
	Thu, 13 Feb 2020 00:12:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0FC831809567;
	Thu, 13 Feb 2020 00:12:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01D09q4Q025438 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 12 Feb 2020 19:09:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B4C172093CFC; Thu, 13 Feb 2020 00:09:52 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF8902026D67
	for <linux-audit@redhat.com>; Thu, 13 Feb 2020 00:09:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C75F8E685B
	for <linux-audit@redhat.com>; Thu, 13 Feb 2020 00:09:50 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-409-mrvHJ0BmPVuX5xhvH7IpuA-1; Wed, 12 Feb 2020 19:09:47 -0500
Received: by mail-ed1-f66.google.com with SMTP id g19so4544406eds.11
	for <linux-audit@redhat.com>; Wed, 12 Feb 2020 16:09:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HglMhRV1r3SlCbyh50p8XWXMifi0DbV0medDPmHPWIY=;
	b=mfVKGBYskHiY+CV/tZ30HnRW8PQE+iN+wdVp8DQOICaxOjJxVeYJwcdS5reaAOpmgZ
	oF56sn2Jc8iRLSqsXYfD4zo5D7nFqOQs1k4vKuAwaUK+JbgdWvRHQj76PrVhQGosdU+1
	I9wJPWs/4127/90M43REkKbVy2e7g4AtmttU+c9jTpctgn/MhCWmxm/s0vT65tD7pGkt
	+HeOKW764ea0pqqfTpi1nVc1g5qLjoCH9c+ZetmkgfjYVDK0Gw7UM17hgthK0N8PyefC
	LBUHV3wAHAG3XoI8q40WsTFc84kHOtFfUxOk0K1akvo0FYv4ja6ervuASfGncnnBseQq
	vNTQ==
X-Gm-Message-State: APjAAAWfOcIu8/774tck+5wSz5ERl4fqueR76jiYwh8l2+kp+GIlYp1Z
	088qXY5L7n7Riylv2YyaxxPyQamibXeJzl04VrzV
X-Google-Smtp-Source: APXvYqxZzJWTQkF0MyAR/0hvazcgtPMpLBtZbyavM6j8WQ0AcCQg2H9RMuC42u9/Eg9eKGj3MTNxtdWkgRhqZAMYJww=
X-Received: by 2002:a50:e108:: with SMTP id h8mr11996848edl.196.1581552586354; 
	Wed, 12 Feb 2020 16:09:46 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577736799.git.rgb@redhat.com>
	<20200204231454.oxa7pyvuxbj466fj@madcap2.tricolour.ca>
	<CAHC9VhQquokw+7UOU=G0SsD35UdgmfysVKCGCE87JVaoTkbisg@mail.gmail.com>
	<3142237.YMNxv0uec1@x2>
In-Reply-To: <3142237.YMNxv0uec1@x2>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 12 Feb 2020 19:09:35 -0500
Message-ID: <CAHC9VhTiCHQbp2SwK0Xb1QgpUZxOQ26JKKPsVGT0ZvMqx28oPQ@mail.gmail.com>
Subject: Re: [PATCH ghak90 V8 07/16] audit: add contid support for signalling
	the audit daemon
To: Steve Grubb <sgrubb@redhat.com>
X-MC-Unique: mrvHJ0BmPVuX5xhvH7IpuA-1
X-MC-Unique: nYdR9OgdMZaw96-4hvVvGg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01D09q4Q025438
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, Richard Guy Briggs <rgb@redhat.com>,
	linux-api@vger.kernel.org, containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	linux-audit@redhat.com, netfilter-devel@vger.kernel.org,
	ebiederm@xmission.com, simo@redhat.com, netdev@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 12, 2020 at 5:39 PM Steve Grubb <sgrubb@redhat.com> wrote:
> On Wednesday, February 5, 2020 5:50:28 PM EST Paul Moore wrote:
> > > > > > ... When we record the audit container ID in audit_signal_info() we
> > > > > > take an extra reference to the audit container ID object so that it
> > > > > > will not disappear (and get reused) until after we respond with an
> > > > > > AUDIT_SIGNAL_INFO2.  In audit_receive_msg() when we do the
> > > > > > AUDIT_SIGNAL_INFO2 processing we drop the extra reference we took
> > > > > > in
> > > > > > audit_signal_info().  Unless I'm missing some other change you
> > > > > > made,
> > > > > > this *shouldn't* affect the syscall records, all it does is
> > > > > > preserve
> > > > > > the audit container ID object in the kernel's ACID store so it
> > > > > > doesn't
> > > > > > get reused.
> > > > >
> > > > > This is exactly what I had understood.  I hadn't considered the extra
> > > > > details below in detail due to my original syscall concern, but they
> > > > > make sense.
> > > > >
> > > > > The syscall I refer to is the one connected with the drop of the
> > > > > audit container identifier by the last process that was in that
> > > > > container in patch 5/16.  The production of this record is contingent
> > > > > on
> > > > > the last ref in a contobj being dropped.  So if it is due to that ref
> > > > > being maintained by audit_signal_info() until the AUDIT_SIGNAL_INFO2
> > > > > record it fetched, then it will appear that the fetch action closed
> > > > > the
> > > > > container rather than the last process in the container to exit.
> > > > >
> > > > > Does this make sense?
> > > >
> > > > More so than your original reply, at least to me anyway.
> > > >
> > > > It makes sense that the audit container ID wouldn't be marked as
> > > > "dead" since it would still be very much alive and available for use
> > > > by the orchestrator, the question is if that is desirable or not.  I
> > > > think the answer to this comes down the preserving the correctness of
> > > > the audit log.
> > > >
> > > > If the audit container ID reported by AUDIT_SIGNAL_INFO2 has been
> > > > reused then I think there is a legitimate concern that the audit log
> > > > is not correct, and could be misleading.  If we solve that by grabbing
> > > > an extra reference, then there could also be some confusion as
> > > > userspace considers a container to be "dead" while the audit container
> > > > ID still exists in the kernel, and the kernel generated audit
> > > > container ID death record will not be generated until much later (and
> > > > possibly be associated with a different event, but that could be
> > > > solved by unassociating the container death record).
> > >
> > > How does syscall association of the death record with AUDIT_SIGNAL_INFO2
> > > possibly get associated with another event?  Or is the syscall
> > > association with the fetch for the AUDIT_SIGNAL_INFO2 the other event?
> >
> > The issue is when does the audit container ID "die".  If it is when
> > the last task in the container exits, then the death record will be
> > associated when the task's exit.  If the audit container ID lives on
> > until the last reference of it in the audit logs, including the
> > SIGNAL_INFO2 message, the death record will be associated with the
> > related SIGNAL_INFO2 syscalls, or perhaps unassociated depending on
> > the details of the syscalls/netlink.
> >
> > > Another idea might be to bump the refcount in audit_signal_info() but
> > > mark tht contid as dead so it can't be reused if we are concerned that
> > > the dead contid be reused?
> >
> > Ooof.  Yes, maybe, but that would be ugly.
> >
> > > There is still the problem later that the reported contid is incomplete
> > > compared to the rest of the contid reporting cycle wrt nesting since
> > > AUDIT_SIGNAL_INFO2 will need to be more complex w/2 variable length
> > > fields to accommodate a nested contid list.
> >
> > Do we really care about the full nested audit container ID list in the
> > SIGNAL_INFO2 record?
> >
> > > > Of the two
> > > > approaches, I think the latter is safer in that it preserves the
> > > > correctness of the audit log, even though it could result in a delay
> > > > of the container death record.
> > >
> > > I prefer the former since it strongly indicates last task in the
> > > container.  The AUDIT_SIGNAL_INFO2 msg has the pid and other subject
> > > attributes and the contid to strongly link the responsible party.
> >
> > Steve is the only one who really tracks the security certifications
> > that are relevant to audit, see what the certification requirements
> > have to say and we can revisit this.
>
> Sever Virtualization Protection Profile is the closest applicable standard
>
> https://www.niap-ccevs.org/Profile/Info.cfm?PPID=408&id=408
>
> It is silent on audit requirements for the lifecycle of a VM. I assume that
> all that is needed is what the orchestrator says its doing at the high level.
> So, if an orchestrator wants to shutdown a container, the orchestrator must
> log that intent and its results. In a similar fashion, systemd logs that it's
> killing a service and we don't actually hook the exit syscall of the service
> to record that.
>
> Now, if a container was being used as a VPS, and it had a fully functioning
> userspace, it's own services, and its very own audit daemon, then in this
> case it would care who sent a signal to its auditd. The tenant of that
> container may have to comply with PCI-DSS or something else. It would log the
> audit service is being terminated and systemd would record that its tearing
> down the environment. The OS doesn't need to do anything.

This latter case is the case of interest here, since the host auditd
should only be killed from a process on the host itself, not a process
running in a container.  If we work under the assumption (and this may
be a break in our approach to not defining "container") that an auditd
instance is only ever signaled by a process with the same audit
container ID (ACID), is this really even an issue?  Right now it isn't
as even with this patchset we will still really only support one
auditd instance, presumably on the host, so this isn't a significant
concern.  Moving forward, once we add support for multiple auditd
instances we will likely need to move the signal info into
(potentially) s per-ACID struct, a struct whose lifetime would match
that of the associated container by definition; as the auditd
container died, the struct would die, the refcounts dropped, and any
ACID held only the signal info refcount would be dropped/killed.

However, making this assumption would mean that we are expecting a
"container" to provide some level of isolation such that processes
with a different audit container ID do not signal each other.  From a
practical perspective I think that fits with the most (all?)
definitions of "container", but I can't say that for certain.  In
those cases where the assumption is not correct and processes can
signal each other across audit container ID boundaries, perhaps it is
enough to explain that an audit container ID may not fully disappear
until it has been fetched with a SIGNAL_INFO2 message.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

