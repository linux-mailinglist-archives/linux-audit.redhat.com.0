Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 08B9D1AC1A9
	for <lists+linux-audit@lfdr.de>; Thu, 16 Apr 2020 14:45:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587041136;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/vyTBUmNNucgbREMUcb6JKAegC/MjUJf+Thj35GpkVQ=;
	b=erl//9WoGkHvj2+awKDDGyDOpHmtL/6vDgejzDZoPPjrKRDunms19hSXwajCLXsAAjIjrt
	l0c2QHpSvG23Q/EVXjsmsV5oIRm024XUs+I7sGdq6dDriRX/53pHJoC5pAiH1NywJIW2QH
	4vL5Kz3Mgox30r7kkK6CNDO8MTeI6d0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-277n-UspMi-d-BzScwduDQ-1; Thu, 16 Apr 2020 08:45:33 -0400
X-MC-Unique: 277n-UspMi-d-BzScwduDQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA2DE8010F0;
	Thu, 16 Apr 2020 12:45:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F4075DA2C;
	Thu, 16 Apr 2020 12:45:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7E2EC18089CD;
	Thu, 16 Apr 2020 12:45:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03GC6Mnv027553 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 16 Apr 2020 08:06:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 404852166B2F; Thu, 16 Apr 2020 12:06:22 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C47A2166B2C
	for <linux-audit@redhat.com>; Thu, 16 Apr 2020 12:06:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E6CF8056C2
	for <linux-audit@redhat.com>; Thu, 16 Apr 2020 12:06:20 +0000 (UTC)
Received: from gardel.0pointer.net (gardel.0pointer.net [85.214.157.71])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-402-8c1wwiDYPQeXh3Rv-VStLw-1; Thu, 16 Apr 2020 08:06:15 -0400
X-MC-Unique: 8c1wwiDYPQeXh3Rv-VStLw-1
Received: from gardel-login.0pointer.net (gardel.0pointer.net
	[IPv6:2a01:238:43ed:c300:10c3:bcf3:3266:da74])
	by gardel.0pointer.net (Postfix) with ESMTP id 77F39E80CCB;
	Thu, 16 Apr 2020 14:06:13 +0200 (CEST)
Received: by gardel-login.0pointer.net (Postfix, from userid 1000)
	id 0B8B5161537; Thu, 16 Apr 2020 14:06:12 +0200 (CEST)
Date: Thu, 16 Apr 2020 14:06:12 +0200
From: Lennart Poettering <lennart@poettering.net>
To: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: multicast listeners and audit events to kmsg
Message-ID: <20200416120612.GA52165@gardel-login>
References: <20200414092740.2fdf0f78@xantho>
	<20200415155355.qudqepcvvler55xs@madcap2.tricolour.ca>
MIME-Version: 1.0
In-Reply-To: <20200415155355.qudqepcvvler55xs@madcap2.tricolour.ca>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03GC6Mnv027553
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 16 Apr 2020 08:44:26 -0400
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mi, 15.04.20 11:53, Richard Guy Briggs (rgb@redhat.com) wrote:

> On 2020-04-14 09:27, Luca BRUNO wrote:
> > Hi all,
> > I'm trying to re-spin a very old thread related to multicast listeners
> > and audit events to kmsg.
> >
> > One surprising kernel behavior when using only a multicast listener
> > to collect audit events (in this case, systemd-journald) is that
> > audit events end up spamming the console [0].
> >
> > [0] https://github.com/systemd/systemd/issues/15324
>
> This is not surprising, since the multicast audit socket is not
> considered a reliable sink for the audit log and thus cannot be relied
> upon to key the decision to forward potentially lost messages to the
> system log.

kmsg is not reliable either, it aggressively and silently drops
messages if the log buffer runs full, which it does pretty quickly.

hence there's really no difference here if data is written to the
mcast socket or to kmsg, in both cases messages are dropped when the
buffer limits are hit, hence it should be entirely fine to do only one
of the twoif the unicast client to audit is not running.

> > Apparently there isn't a clear consensus on how this should be
> > approached. Looking at the github and bugzilla tickets, it seems to me
> > that Eric and Paul initially had in mind some logic based on multicast
> > listener detection, while Richard doesn't deem that reliable and
> > suggests an explicit configuration.
>
> I'm regretting having developped this feature due to the problems it has
> caused the audit developpers and innocent bystanders.  Instead, an audit
> daemon plugin should have been used to direct log records to
> journald.

I am sorry, but this doesn't work for us. We do not want to do IPC to
some audit daemon (journald runs during early boot and in the initrd,
it has a very special relationship with early boot stuff and PID1, and
thus being a client to other daemons is highly problematic, if those
other daemons are managed by systemd as well, and run only during later
boot). In fact we don't even want the dependency on the audit
userspace package at all.

In systemd we just think that audit information is pretty interesting
even if you don't want to buy into the whole government regulation
stuff, even if you don't want the auditd to run, and the full audit
package installed. i.e. we want to collect the data as one of our
various data streams, as a secondary consumer of it, and leave it to
the audit package itself to do everything else and be the primary
consumer of it.

Using the multicast group is our way of saying: "we don't want to own
the audit stream, you can keep it; we just want to have a look
too".

I believe that there are plenty of systems where audit logs should be
collected but the whole auditd daemon should not be around, i.e. where
the usefulness of the data is acknowledged without acknowledging that
government regulations matter or the audit package should exist on
every single system.

> Well, Steve, Paul and myself are all fairly firmly on the side of the
> problem being in systemd and its overreach.

We explicitly don#t want to own the audit stream, that's why we don#t
use the unicast stuff, but only subscribe via the mcast stuff, so that
we don't interfere with auditd's own processing if it is running, and
we don't exlcude auditd from running. we want a mode where audit is
collected, just like that without any auditd package installed, but if
you decide to install auditd things just work too.

> > For Richard and the "explicit configuration" approach in particular, I'm
> > missing some further details:
> >  * Is the current behavior considered buggy, or is that intended to be
> >    kept as the default?
>
> The current systemd behaviour of unilatterally enabling audit logging is
> considered buggy.  The current audit kernel behaviour is considered
> intentional.

Well, we try hard to not step on your toes and do not use the unicast
stuff and do not pretend to be auditd, so that auditd can be installed
and run in parallel to journald with us being in the backseat. It's my
understanding that the mcast stuff was added for this kind of thing,
except that it never became useful, since it also means that kmsg is
spammed by audit.

THere's a usecase for collecting audit but not running the whole audit
userspace suite, can't you see that? i.e. i for one am interested in
selinux audit msgs, but I am not interested in the audit toolchain I
must say, I really am not, and I am pretty sure there are many others
like me. But you basically tell us to go away, or buy into the whole
audit userspace.

> >  * Would this be tweaked via a (boolean?) sysctl, and what would be the
> >    semantics of flipping it?
>
> It would be controlled via a new audit unicast netlink message similar
> to the one that enabled auditing in the first place by systemd that
> would explicitly disable klog when a multicast client is connected.

It would be excellent to have an option to turn off the kmsg
forwarding.

Lennart

--
Lennart Poettering, Berlin


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

