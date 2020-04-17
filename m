Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id EBEAE1AE551
	for <lists+linux-audit@lfdr.de>; Fri, 17 Apr 2020 20:58:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587149906;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=btO4rlL9kAZGUXgAGWjJMRcLC+YZU2vAeaoJj1ZluaU=;
	b=F5GAeA0PPJ1OOW5Up+YvGgDu9iphR8adDa8FqxhIJJ6Hpn2NlKUO2SQZuVeQvLcja1P4tO
	UUYccMg4QvF/CnZd5p6GajvFM5PhdV2+dtHR0ID9QMREpvFQdw/vqO/+3e5QuijG86S1ul
	Ff7qMMKe2XAqQ5G6Kk6c/vkFHfWU8Fg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-GzftZ4bONrywn70DcrsUWw-1; Fri, 17 Apr 2020 14:58:25 -0400
X-MC-Unique: GzftZ4bONrywn70DcrsUWw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF9DD19057AC;
	Fri, 17 Apr 2020 18:58:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0771560BF7;
	Fri, 17 Apr 2020 18:58:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8289693512;
	Fri, 17 Apr 2020 18:58:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03HIvp6K025489 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 17 Apr 2020 14:57:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 693DE19C4F; Fri, 17 Apr 2020 18:57:51 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.3.128.9])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E129196AE;
	Fri, 17 Apr 2020 18:57:45 +0000 (UTC)
Date: Fri, 17 Apr 2020 14:57:42 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Lennart Poettering <lennart@poettering.net>
Subject: Re: multicast listeners and audit events to kmsg
Message-ID: <20200417185742.2v7elrmjpi75w6mm@madcap2.tricolour.ca>
References: <20200414092740.2fdf0f78@xantho>
	<20200415155355.qudqepcvvler55xs@madcap2.tricolour.ca>
	<20200416120612.GA52165@gardel-login>
MIME-Version: 1.0
In-Reply-To: <20200416120612.GA52165@gardel-login>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
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
Content-Disposition: inline

On 2020-04-16 14:06, Lennart Poettering wrote:
> On Mi, 15.04.20 11:53, Richard Guy Briggs (rgb@redhat.com) wrote:
> 
> > On 2020-04-14 09:27, Luca BRUNO wrote:
> > > Hi all,
> > > I'm trying to re-spin a very old thread related to multicast listeners
> > > and audit events to kmsg.
> > >
> > > One surprising kernel behavior when using only a multicast listener
> > > to collect audit events (in this case, systemd-journald) is that
> > > audit events end up spamming the console [0].
> > >
> > > [0] https://github.com/systemd/systemd/issues/15324
> >
> > This is not surprising, since the multicast audit socket is not
> > considered a reliable sink for the audit log and thus cannot be relied
> > upon to key the decision to forward potentially lost messages to the
> > system log.
> 
> kmsg is not reliable either, it aggressively and silently drops
> messages if the log buffer runs full, which it does pretty quickly.
> 
> hence there's really no difference here if data is written to the
> mcast socket or to kmsg, in both cases messages are dropped when the
> buffer limits are hit, hence it should be entirely fine to do only one
> of the twoif the unicast client to audit is not running.
> 
> > > Apparently there isn't a clear consensus on how this should be
> > > approached. Looking at the github and bugzilla tickets, it seems to me
> > > that Eric and Paul initially had in mind some logic based on multicast
> > > listener detection, while Richard doesn't deem that reliable and
> > > suggests an explicit configuration.
> >
> > I'm regretting having developped this feature due to the problems it has
> > caused the audit developpers and innocent bystanders.  Instead, an audit
> > daemon plugin should have been used to direct log records to
> > journald.
> 
> I am sorry, but this doesn't work for us. We do not want to do IPC to
> some audit daemon (journald runs during early boot and in the initrd,
> it has a very special relationship with early boot stuff and PID1, and
> thus being a client to other daemons is highly problematic, if those
> other daemons are managed by systemd as well, and run only during later
> boot). In fact we don't even want the dependency on the audit
> userspace package at all.
> 
> In systemd we just think that audit information is pretty interesting
> even if you don't want to buy into the whole government regulation
> stuff, even if you don't want the auditd to run, and the full audit
> package installed. i.e. we want to collect the data as one of our
> various data streams, as a secondary consumer of it, and leave it to
> the audit package itself to do everything else and be the primary
> consumer of it.
> 
> Using the multicast group is our way of saying: "we don't want to own
> the audit stream, you can keep it; we just want to have a look
> too".
> 
> I believe that there are plenty of systems where audit logs should be
> collected but the whole auditd daemon should not be around, i.e. where
> the usefulness of the data is acknowledged without acknowledging that
> government regulations matter or the audit package should exist on
> every single system.
> 
> > Well, Steve, Paul and myself are all fairly firmly on the side of the
> > problem being in systemd and its overreach.
> 
> We explicitly don#t want to own the audit stream, that's why we don#t
> use the unicast stuff, but only subscribe via the mcast stuff, so that
> we don't interfere with auditd's own processing if it is running, and
> we don't exlcude auditd from running. we want a mode where audit is
> collected, just like that without any auditd package installed, but if
> you decide to install auditd things just work too.
> 
> > > For Richard and the "explicit configuration" approach in particular, I'm
> > > missing some further details:
> > >  * Is the current behavior considered buggy, or is that intended to be
> > >    kept as the default?
> >
> > The current systemd behaviour of unilatterally enabling audit logging is
> > considered buggy.  The current audit kernel behaviour is considered
> > intentional.
> 
> Well, we try hard to not step on your toes and do not use the unicast
> stuff and do not pretend to be auditd, so that auditd can be installed
> and run in parallel to journald with us being in the backseat. It's my
> understanding that the mcast stuff was added for this kind of thing,
> except that it never became useful, since it also means that kmsg is
> spammed by audit.

Where your claim falls flat is that systemd/journald is stepping on
auditd's toes by enabling audit.  Enabling audit is auditd's job.

> THere's a usecase for collecting audit but not running the whole audit
> userspace suite, can't you see that? i.e. i for one am interested in
> selinux audit msgs, but I am not interested in the audit toolchain I
> must say, I really am not, and I am pretty sure there are many others
> like me. But you basically tell us to go away, or buy into the whole
> audit userspace.
> 
> > >  * Would this be tweaked via a (boolean?) sysctl, and what would be the
> > >    semantics of flipping it?
> >
> > It would be controlled via a new audit unicast netlink message similar
> > to the one that enabled auditing in the first place by systemd that
> > would explicitly disable klog when a multicast client is connected.
> 
> It would be excellent to have an option to turn off the kmsg
> forwarding.
> 
> Lennart

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

