Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 2540C145EF3
	for <lists+linux-audit@lfdr.de>; Thu, 23 Jan 2020 00:08:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579734488;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uW/NM1iDRteD14F1jGG7SgWrYiblE1xvhD7nFAYK0nk=;
	b=KTiaAwawtw99LJ36aOuuwHnjlJr7Agm+RlnVgtX20eNMLS6qoQi5kGfrjMRO4EJCyEWhcn
	Jx80vCR3RVl0HJOmGlRwuIjB2wozLfJCcD+LYoGoRWjtlWawruHLexsqQ8KppArCzTcL3i
	FKnwc5moNZKvwiZjqtj025b853y1rCU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-mDQbQfRxNBeP9GZOXxTNjQ-1; Wed, 22 Jan 2020 18:08:06 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11C0B800D54;
	Wed, 22 Jan 2020 23:08:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DAAC360BE0;
	Wed, 22 Jan 2020 23:08:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 40368180880C;
	Wed, 22 Jan 2020 23:07:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00MN7qXu009230 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 22 Jan 2020 18:07:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1F53C1CB; Wed, 22 Jan 2020 23:07:52 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-12.phx2.redhat.com [10.3.112.12])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6386A85735;
	Wed, 22 Jan 2020 23:07:45 +0000 (UTC)
Date: Wed, 22 Jan 2020 18:07:42 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak28 V4] audit: log audit netlink multicast bind and
	unbind events
Message-ID: <20200122230742.7vwtvmhhjerray5f@madcap2.tricolour.ca>
References: <ca70ee17d85860aa599e0001a75d639d819de7ae.1579292286.git.rgb@redhat.com>
	<CAHC9VhR9p+aOTzv7g-ujuMsMtLvOZKkoKJWsthZnj38rzJe1TA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhR9p+aOTzv7g-ujuMsMtLvOZKkoKJWsthZnj38rzJe1TA@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-audit@redhat.com
Cc: nhorman@redhat.com, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	Eric Paris <eparis@parisplace.org>
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
X-MC-Unique: mDQbQfRxNBeP9GZOXxTNjQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-01-22 17:40, Paul Moore wrote:
> On Fri, Jan 17, 2020 at 3:21 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> >
> > Log information about programs connecting to and disconnecting from the
> > audit netlink multicast socket. This is needed so that during
> > investigations a security officer can tell who or what had access to the
> > audit trail.  This helps to meet the FAU_SAR.2 requirement for Common
> > Criteria.  Here is the systemd startup event:
> >
> > type=UNKNOWN[1335] msg=audit(2020-01-17 10:30:33.731:6) : pid=1 uid=root auid=unset tty=(none) ses=unset subj=kernel comm=systemd exe=/usr/lib/systemd/systemd nl-mcgrp=1 op=connect res=yes
> >
> > And the events from the test suite:
> >
> > type=PROCTITLE msg=audit(2020-01-17 10:36:24.050:294) : proctitle=/usr/bin/perl -w amcast_joinpart/test
> > type=SOCKADDR msg=audit(2020-01-17 10:36:24.050:294) : saddr={ saddr_fam=netlink nlnk-fam=16 nlnk-pid=0 }
> > type=SYSCALL msg=audit(2020-01-17 10:36:24.050:294) : arch=x86_64 syscall=bind success=yes exit=0 a0=0x7 a1=0x55d65cb79090 a2=0xc a3=0x0 items=0 ppid=671 pid=674 auid=root uid=root gid=root euid=root suid=root fsuid=root egid=root sgid=root fsgid=root tty=ttyS0 ses=3 comm=perl exe=/usr/bin/perl subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=(null)
> > type=UNKNOWN[1335] msg=audit(2020-01-17 10:36:24.050:294) : pid=674 uid=root auid=root tty=ttyS0 ses=3 subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 comm=perl exe=/usr/bin/perl nl-mcgrp=1 op=connect res=yes
> >
> > type=UNKNOWN[1335] msg=audit(2020-01-17 10:36:24.051:295) : pid=674 uid=root auid=root tty=ttyS0 ses=3 subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 comm=perl exe=/usr/bin/perl nl-mcgrp=1 op=disconnect res=yes
> >
> > Please see the upstream issue tracker:
> >   https://github.com/linux-audit/audit-kernel/issues/28
> >   https://github.com/linux-audit/audit-kernel/wiki/RFE-Audit-Multicast-Socket-Join-Part
> >   https://github.com/rgbriggs/audit-testsuite/compare/ghak28-mcast-part-join
> >
> > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> >
> > ---
> > Note: msg type 1334 was skipped due to BPF accepted in another tree.
> > Note: v5 due to previous 2014-10-07, 2015-07-23, 2016-11-30, 2017-10-13
> > Note: subj attrs included due to missing syscall record for systemd (audit=1)
> > Note: tried refactor of subj attrs, but this is yet another new order.
> > ---
> >  include/uapi/linux/audit.h |  1 +
> >  kernel/audit.c             | 48 ++++++++++++++++++++++++++++++++++++++++++----
> >  2 files changed, 45 insertions(+), 4 deletions(-)
> >
> > diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
> > index 3ad935527177..67fb24472dc2 100644
> > --- a/include/uapi/linux/audit.h
> > +++ b/include/uapi/linux/audit.h
> > @@ -116,6 +116,7 @@
> >  #define AUDIT_FANOTIFY         1331    /* Fanotify access decision */
> >  #define AUDIT_TIME_INJOFFSET   1332    /* Timekeeping offset injected */
> >  #define AUDIT_TIME_ADJNTPVAL   1333    /* NTP value adjustment */
> > +#define AUDIT_EVENT_LISTENER   1335    /* Task joined multicast read socket */
> >
> >  #define AUDIT_AVC              1400    /* SE Linux avc denial or grant */
> >  #define AUDIT_SELINUX_ERR      1401    /* Internal SE Linux Errors */
> > diff --git a/kernel/audit.c b/kernel/audit.c
> > index 17b0d523afb3..478259f3fa53 100644
> > --- a/kernel/audit.c
> > +++ b/kernel/audit.c
> > @@ -1520,20 +1520,60 @@ static void audit_receive(struct sk_buff  *skb)
> >         audit_ctl_unlock();
> >  }
> >
> > +/* Log information about who is connecting to the audit multicast socket */
> > +static void audit_log_multicast_bind(int group, const char *op, int err)
> > +{
> > +       const struct cred *cred;
> > +       struct tty_struct *tty;
> > +       char comm[sizeof(current->comm)];
> > +       struct audit_buffer *ab;
> > +
> > +       if (!audit_enabled)
> > +               return;
> > +
> > +       ab = audit_log_start(audit_context(), GFP_KERNEL, AUDIT_EVENT_LISTENER);
> > +       if (!ab)
> > +               return;
> > +
> > +       cred = current_cred();
> > +       tty = audit_get_tty();
> > +       audit_log_format(ab, "pid=%u uid=%u auid=%u tty=%s ses=%u",
> > +                        task_pid_nr(current),
> > +                        from_kuid(&init_user_ns, cred->uid),
> > +                        from_kuid(&init_user_ns, audit_get_loginuid(current)),
> > +                        tty ? tty_name(tty) : "(none)",
> > +                        audit_get_sessionid(current));
> 
> Don't we already get all of that information as part of the syscall record?

Yes.  However, the syscall record isn't always present.  One example is
systemd, shown above.  The other is the disconnect record, shown above,
which may be asynchronous, or an unmonitored syscall (It could only be
setsockopt, close, shutdown.).

> > +       audit_put_tty(tty);
> > +       audit_log_task_context(ab); /* subj= */
> 
> Also part of the syscall record.
> 
> > +       audit_log_format(ab, " comm=");
> > +       audit_log_untrustedstring(ab, get_task_comm(comm, current));
> 
> Again.
> 
> > +       audit_log_d_path_exe(ab, current->mm); /* exe= */
> 
> Again.
> 
> > +       audit_log_format(ab, " nl-mcgrp=%d op=%s res=%d", group, op, !err);
> 
> This part is new ;)
> 
> > +       audit_log_end(ab);
> > +}
> 
> I'm pretty sure these are the same arguments I made when Steve posted
> a prior version of this patch.

You did.  I would really like to have dropped them, but they aren't
reliably available.

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

