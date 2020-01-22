Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 1EBE3145F51
	for <lists+linux-audit@lfdr.de>; Thu, 23 Jan 2020 00:45:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579736730;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qKEgtL7QD0BRKdOU5OkkBUJiUUzkd6oFxeII2C/tqLA=;
	b=CUN7QnUOsVLYXo6uomAnCf7WbuWaPkzthTzJKaY2llLfJC8HjEawOoCmx9Pgf0bCSTDq6J
	jqZXB54QsZO3MYi5RafCeoeZxfj+5Koih8KeUjduy/JgoxmL9NaqKg6N/D2NT//eufDOv5
	2gwikUUa0iaT8ZPNgt5LCE1sr1pm1bM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-QS-TmI2aOeynoGu21bNh5w-1; Wed, 22 Jan 2020 18:45:28 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1129DB63;
	Wed, 22 Jan 2020 23:45:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FB9E5D9C9;
	Wed, 22 Jan 2020 23:45:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4C62781998;
	Wed, 22 Jan 2020 23:45:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00MNj4sK011294 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 22 Jan 2020 18:45:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4B82C8CCDB; Wed, 22 Jan 2020 23:45:04 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-12.phx2.redhat.com [10.3.112.12])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06CD089D02;
	Wed, 22 Jan 2020 23:44:57 +0000 (UTC)
Date: Wed, 22 Jan 2020 18:44:55 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Steve Grubb <sgrubb@redhat.com>
Subject: Re: [PATCH ghak28 V4] audit: log audit netlink multicast bind and
	unbind events
Message-ID: <20200122234455.jg7bxrazrjpiqpe7@madcap2.tricolour.ca>
References: <ca70ee17d85860aa599e0001a75d639d819de7ae.1579292286.git.rgb@redhat.com>
	<CAHC9VhR9p+aOTzv7g-ujuMsMtLvOZKkoKJWsthZnj38rzJe1TA@mail.gmail.com>
	<1907590.3WuaD5rAFU@x2>
MIME-Version: 1.0
In-Reply-To: <1907590.3WuaD5rAFU@x2>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
Cc: Eric Paris <eparis@parisplace.org>, nhorman@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
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
X-MC-Unique: QS-TmI2aOeynoGu21bNh5w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-01-22 18:12, Steve Grubb wrote:
> On Wednesday, January 22, 2020 5:40:10 PM EST Paul Moore wrote:
> > On Fri, Jan 17, 2020 at 3:21 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > Log information about programs connecting to and disconnecting from the
> > > audit netlink multicast socket. This is needed so that during
> > > investigations a security officer can tell who or what had access to the
> > > audit trail.  This helps to meet the FAU_SAR.2 requirement for Common
> > > Criteria.  Here is the systemd startup event:
> > > 
> > > type=UNKNOWN[1335] msg=audit(2020-01-17 10:30:33.731:6) : pid=1 uid=root
> > > auid=unset tty=(none) ses=unset subj=kernel comm=systemd
> > > exe=/usr/lib/systemd/systemd nl-mcgrp=1 op=connect res=yes
> > > 
> > > And the events from the test suite:
> > > 
> > > type=PROCTITLE msg=audit(2020-01-17 10:36:24.050:294) :
> > > proctitle=/usr/bin/perl -w amcast_joinpart/test type=SOCKADDR
> > > msg=audit(2020-01-17 10:36:24.050:294) : saddr={ saddr_fam=netlink
> > > nlnk-fam=16 nlnk-pid=0 } type=SYSCALL msg=audit(2020-01-17
> > > 10:36:24.050:294) : arch=x86_64 syscall=bind success=yes exit=0 a0=0x7
> > > a1=0x55d65cb79090 a2=0xc a3=0x0 items=0 ppid=671 pid=674 auid=root
> > > uid=root gid=root euid=root suid=root fsuid=root egid=root sgid=root
> > > fsgid=root tty=ttyS0 ses=3 comm=perl exe=/usr/bin/perl
> > > subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=(null)
> > > type=UNKNOWN[1335] msg=audit(2020-01-17 10:36:24.050:294) : pid=674
> > > uid=root auid=root tty=ttyS0 ses=3
> > > subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 comm=perl
> > > exe=/usr/bin/perl nl-mcgrp=1 op=connect res=yes
> > > 
> > > type=UNKNOWN[1335] msg=audit(2020-01-17 10:36:24.051:295) : pid=674
> > > uid=root auid=root tty=ttyS0 ses=3
> > > subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 comm=perl
> > > exe=/usr/bin/perl nl-mcgrp=1 op=disconnect res=yes> 
> > > Please see the upstream issue tracker:
> > >   https://github.com/linux-audit/audit-kernel/issues/28
> > >   https://github.com/linux-audit/audit-kernel/wiki/RFE-Audit-Multicast-So
> > >   cket-Join-Part
> > >   https://github.com/rgbriggs/audit-testsuite/compare/ghak28-mcast-part-> >   join> 
> > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > 
> > > ---
> > > Note: msg type 1334 was skipped due to BPF accepted in another tree.
> > > Note: v5 due to previous 2014-10-07, 2015-07-23, 2016-11-30, 2017-10-13
> > > Note: subj attrs included due to missing syscall record for systemd
> > > (audit=1) Note: tried refactor of subj attrs, but this is yet another
> > > new order. ---
> > > 
> > >  include/uapi/linux/audit.h |  1 +
> > >  kernel/audit.c             | 48
> > >  ++++++++++++++++++++++++++++++++++++++++++---- 2 files changed, 45
> > >  insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
> > > index 3ad935527177..67fb24472dc2 100644
> > > --- a/include/uapi/linux/audit.h
> > > +++ b/include/uapi/linux/audit.h
> > > @@ -116,6 +116,7 @@
> > > 
> > >  #define AUDIT_FANOTIFY         1331    /* Fanotify access decision */
> > >  #define AUDIT_TIME_INJOFFSET   1332    /* Timekeeping offset injected */
> > >  #define AUDIT_TIME_ADJNTPVAL   1333    /* NTP value adjustment */
> > > 
> > > +#define AUDIT_EVENT_LISTENER   1335    /* Task joined multicast read
> > > socket */> 
> > >  #define AUDIT_AVC              1400    /* SE Linux avc denial or grant
> > >  */
> > >  #define AUDIT_SELINUX_ERR      1401    /* Internal SE Linux Errors */
> > > 
> > > diff --git a/kernel/audit.c b/kernel/audit.c
> > > index 17b0d523afb3..478259f3fa53 100644
> > > --- a/kernel/audit.c
> > > +++ b/kernel/audit.c
> > > @@ -1520,20 +1520,60 @@ static void audit_receive(struct sk_buff  *skb)
> > > 
> > >         audit_ctl_unlock();
> > >  
> > >  }
> > > 
> > > +/* Log information about who is connecting to the audit multicast socket
> > > */ +static void audit_log_multicast_bind(int group, const char *op, int
> > > err) +{
> > > +       const struct cred *cred;
> > > +       struct tty_struct *tty;
> > > +       char comm[sizeof(current->comm)];
> > > +       struct audit_buffer *ab;
> > > +
> > > +       if (!audit_enabled)
> > > +               return;
> > > +
> > > +       ab = audit_log_start(audit_context(), GFP_KERNEL,
> > > AUDIT_EVENT_LISTENER); +       if (!ab)
> > > +               return;
> > > +
> > > +       cred = current_cred();
> > > +       tty = audit_get_tty();
> > > +       audit_log_format(ab, "pid=%u uid=%u auid=%u tty=%s ses=%u",
> > > +                        task_pid_nr(current),
> > > +                        from_kuid(&init_user_ns, cred->uid),
> > > +                        from_kuid(&init_user_ns,
> > > audit_get_loginuid(current)), +                        tty ?
> > > tty_name(tty) : "(none)",
> > > +                        audit_get_sessionid(current));
> > 
> > Don't we already get all of that information as part of the syscall record?
> 
> We don't want or need a syscall record. It doesn't add anything to the 
> necessary information. Also, when we have syscall records, people expect that 
> they obey the syscall auditing. Especially wrt "never" audit rules.

Did both of you see the 4 "Note:" lines between the description and the
patch?  I'm caught in the middle here.

> > > +       audit_put_tty(tty);
> > > +       audit_log_task_context(ab); /* subj= */
> > 
> > Also part of the syscall record.
> > 
> > > +       audit_log_format(ab, " comm=");
> > > +       audit_log_untrustedstring(ab, get_task_comm(comm, current));
> > 
> > Again.
> > 
> > > +       audit_log_d_path_exe(ab, current->mm); /* exe= */
> > 
> > Again.
> > 
> > > +       audit_log_format(ab, " nl-mcgrp=%d op=%s res=%d", group, op,
> > > !err);
> > This part is new ;)
> > 
> > > +       audit_log_end(ab);
> > > +}
> > 
> > I'm pretty sure these are the same arguments I made when Steve posted
> > a prior version of this patch.
> 
> No. You didn't mind it then. What you objected to was that I wrote a helper 
> function that could be used by future audit events to start a format 
> standardization process.

Again, see the 4 notes.  I was not able to refactor any of the subject
attributes since this is yet another audit subject attributes order
(YAASAO) that hasn't been seen yet.  Why are we creatting YAASAO?

> The event looks good to me. Ack for the format being acceptable to existing 
> tools.
> 
> -Steve

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

