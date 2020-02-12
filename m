Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0088F15B3FF
	for <lists+linux-audit@lfdr.de>; Wed, 12 Feb 2020 23:39:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581547166;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zZEYtwZr8Vhwd0vl2YigpkAaGdahvWr5jJh4Ani1zYA=;
	b=aJelj/ZX15UY8BuQF4qYHGnVS/xT2Pr2MqDlKeI06IGok3DoG5x4Jpl0HxpXx+zCoyASQY
	Yy1RwRXf6QvrAo0IlZw1jijxCyIgads18k+cqE32k7+4Ymd0eYrqZo8syJAdCzMVW8cIj7
	ZZZ4KJrxitpsRptPXyGwrN4x7mDdTbk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-LdBiR8M_OKyCr7ssNEUGTw-1; Wed, 12 Feb 2020 17:39:23 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BC811800D6B;
	Wed, 12 Feb 2020 22:39:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A8B919C7F;
	Wed, 12 Feb 2020 22:39:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 16D028B2A7;
	Wed, 12 Feb 2020 22:39:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01CMcu2F020786 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 12 Feb 2020 17:38:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0EDB619C7F; Wed, 12 Feb 2020 22:38:56 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-254.phx2.redhat.com [10.3.116.254])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2713A19C6A;
	Wed, 12 Feb 2020 22:38:46 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: [PATCH ghak90 V8 07/16] audit: add contid support for signalling
	the audit daemon
Date: Wed, 12 Feb 2020 17:38:45 -0500
Message-ID: <3142237.YMNxv0uec1@x2>
Organization: Red Hat
In-Reply-To: <CAHC9VhQquokw+7UOU=G0SsD35UdgmfysVKCGCE87JVaoTkbisg@mail.gmail.com>
References: <cover.1577736799.git.rgb@redhat.com>
	<20200204231454.oxa7pyvuxbj466fj@madcap2.tricolour.ca>
	<CAHC9VhQquokw+7UOU=G0SsD35UdgmfysVKCGCE87JVaoTkbisg@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, Richard Guy Briggs <rgb@redhat.com>,
	linux-api@vger.kernel.org, containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
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
X-MC-Unique: LdBiR8M_OKyCr7ssNEUGTw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wednesday, February 5, 2020 5:50:28 PM EST Paul Moore wrote:
> > > > > ... When we record the audit container ID in audit_signal_info() we
> > > > > take an extra reference to the audit container ID object so that it
> > > > > will not disappear (and get reused) until after we respond with an
> > > > > AUDIT_SIGNAL_INFO2.  In audit_receive_msg() when we do the
> > > > > AUDIT_SIGNAL_INFO2 processing we drop the extra reference we took
> > > > > in
> > > > > audit_signal_info().  Unless I'm missing some other change you
> > > > > made,
> > > > > this *shouldn't* affect the syscall records, all it does is
> > > > > preserve
> > > > > the audit container ID object in the kernel's ACID store so it
> > > > > doesn't
> > > > > get reused.
> > > > 
> > > > This is exactly what I had understood.  I hadn't considered the extra
> > > > details below in detail due to my original syscall concern, but they
> > > > make sense.
> > > > 
> > > > The syscall I refer to is the one connected with the drop of the
> > > > audit container identifier by the last process that was in that
> > > > container in patch 5/16.  The production of this record is contingent
> > > > on
> > > > the last ref in a contobj being dropped.  So if it is due to that ref
> > > > being maintained by audit_signal_info() until the AUDIT_SIGNAL_INFO2
> > > > record it fetched, then it will appear that the fetch action closed
> > > > the
> > > > container rather than the last process in the container to exit.
> > > > 
> > > > Does this make sense?
> > > 
> > > More so than your original reply, at least to me anyway.
> > > 
> > > It makes sense that the audit container ID wouldn't be marked as
> > > "dead" since it would still be very much alive and available for use
> > > by the orchestrator, the question is if that is desirable or not.  I
> > > think the answer to this comes down the preserving the correctness of
> > > the audit log.
> > > 
> > > If the audit container ID reported by AUDIT_SIGNAL_INFO2 has been
> > > reused then I think there is a legitimate concern that the audit log
> > > is not correct, and could be misleading.  If we solve that by grabbing
> > > an extra reference, then there could also be some confusion as
> > > userspace considers a container to be "dead" while the audit container
> > > ID still exists in the kernel, and the kernel generated audit
> > > container ID death record will not be generated until much later (and
> > > possibly be associated with a different event, but that could be
> > > solved by unassociating the container death record).
> > 
> > How does syscall association of the death record with AUDIT_SIGNAL_INFO2
> > possibly get associated with another event?  Or is the syscall
> > association with the fetch for the AUDIT_SIGNAL_INFO2 the other event?
> 
> The issue is when does the audit container ID "die".  If it is when
> the last task in the container exits, then the death record will be
> associated when the task's exit.  If the audit container ID lives on
> until the last reference of it in the audit logs, including the
> SIGNAL_INFO2 message, the death record will be associated with the
> related SIGNAL_INFO2 syscalls, or perhaps unassociated depending on
> the details of the syscalls/netlink.
> 
> > Another idea might be to bump the refcount in audit_signal_info() but
> > mark tht contid as dead so it can't be reused if we are concerned that
> > the dead contid be reused?
> 
> Ooof.  Yes, maybe, but that would be ugly.
> 
> > There is still the problem later that the reported contid is incomplete
> > compared to the rest of the contid reporting cycle wrt nesting since
> > AUDIT_SIGNAL_INFO2 will need to be more complex w/2 variable length
> > fields to accommodate a nested contid list.
> 
> Do we really care about the full nested audit container ID list in the
> SIGNAL_INFO2 record?
> 
> > > Of the two
> > > approaches, I think the latter is safer in that it preserves the
> > > correctness of the audit log, even though it could result in a delay
> > > of the container death record.
> > 
> > I prefer the former since it strongly indicates last task in the
> > container.  The AUDIT_SIGNAL_INFO2 msg has the pid and other subject
> > attributes and the contid to strongly link the responsible party.
> 
> Steve is the only one who really tracks the security certifications
> that are relevant to audit, see what the certification requirements
> have to say and we can revisit this.

Sever Virtualization Protection Profile is the closest applicable standard

https://www.niap-ccevs.org/Profile/Info.cfm?PPID=408&id=408

It is silent on audit requirements for the lifecycle of a VM. I assume that 
all that is needed is what the orchestrator says its doing at the high level. 
So, if an orchestrator wants to shutdown a container, the orchestrator must 
log that intent and its results. In a similar fashion, systemd logs that it's 
killing a service and we don't actually hook the exit syscall of the service 
to record that.

Now, if a container was being used as a VPS, and it had a fully functioning 
userspace, it's own services, and its very own audit daemon, then in this 
case it would care who sent a signal to its auditd. The tenant of that 
container may have to comply with PCI-DSS or something else. It would log the 
audit service is being terminated and systemd would record that its tearing 
down the environment. The OS doesn't need to do anything.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

