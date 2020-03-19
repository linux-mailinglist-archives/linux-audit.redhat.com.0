Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 4104A18C28E
	for <lists+linux-audit@lfdr.de>; Thu, 19 Mar 2020 22:48:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584654534;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nFo7MCftxY+1rbeb9n6bqh1h+j3KFjHfTE23DckBCDs=;
	b=fLJCewpFmF1E++FwhLhrXWsC21E1s2YMPDhbcVBWYi2VDnJXidfvMfQwSyH41DcDiSHqtz
	0mfQkwb6qwBlo6N/24ctMbenPmPmn2DHdoHAXpwwNCn2hK0YQvuK3MSbdawQpjPK1VTUHy
	onuvKOcRK2wr9dGSz0P6iR0t4Rb3eL8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-09yOMdE9PjO8FPWkEfx7Rw-1; Thu, 19 Mar 2020 17:48:52 -0400
X-MC-Unique: 09yOMdE9PjO8FPWkEfx7Rw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 065B1108BD0D;
	Thu, 19 Mar 2020 21:48:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9643D5C1A4;
	Thu, 19 Mar 2020 21:48:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E30B618089C8;
	Thu, 19 Mar 2020 21:48:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02JLmKqO025021 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 19 Mar 2020 17:48:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 264CDBBBD7; Thu, 19 Mar 2020 21:48:20 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.36.110.5])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A40CBBBF3;
	Thu, 19 Mar 2020 21:48:03 +0000 (UTC)
Date: Thu, 19 Mar 2020 17:47:59 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak90 V8 07/16] audit: add contid support for signalling
	the audit daemon
Message-ID: <20200319214759.qgxt2sfkmd6srdol@madcap2.tricolour.ca>
References: <20200204231454.oxa7pyvuxbj466fj@madcap2.tricolour.ca>
	<CAHC9VhQquokw+7UOU=G0SsD35UdgmfysVKCGCE87JVaoTkbisg@mail.gmail.com>
	<3142237.YMNxv0uec1@x2>
	<CAHC9VhTiCHQbp2SwK0Xb1QgpUZxOQ26JKKPsVGT0ZvMqx28oPQ@mail.gmail.com>
	<20200312202733.7kli64zsnqc4mrd2@madcap2.tricolour.ca>
	<CAHC9VhS9DtxJ4gvOfMRnzoo6ccGJVKL+uZYe6qqH+SPqD8r01Q@mail.gmail.com>
	<20200313192306.wxey3wn2h4htpccm@madcap2.tricolour.ca>
	<CAHC9VhQKOpVWxDg-tWuCWV22QRu8P_NpFKme==0Ot1RQKa_DWA@mail.gmail.com>
	<20200318214154.ycxy5dl4pxno6fvi@madcap2.tricolour.ca>
	<CAHC9VhSuMnd3-ci2Bx-xJ0yscQ=X8ZqFAcNPKpbh_ZWN3FJcuQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhSuMnd3-ci2Bx-xJ0yscQ=X8ZqFAcNPKpbh_ZWN3FJcuQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-03-18 17:47, Paul Moore wrote:
> On Wed, Mar 18, 2020 at 5:42 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > On 2020-03-18 17:01, Paul Moore wrote:
> > > On Fri, Mar 13, 2020 at 3:23 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > > On 2020-03-13 12:42, Paul Moore wrote:
> > >
> > > ...
> > >
> > > > > The thread has had a lot of starts/stops, so I may be repeating a
> > > > > previous suggestion, but one idea would be to still emit a "death
> > > > > record" when the final task in the audit container ID does die, but
> > > > > block the particular audit container ID from reuse until it the
> > > > > SIGNAL2 info has been reported.  This gives us the timely ACID death
> > > > > notification while still preventing confusion and ambiguity caused by
> > > > > potentially reusing the ACID before the SIGNAL2 record has been sent;
> > > > > there is a small nit about the ACID being present in the SIGNAL2
> > > > > *after* its death, but I think that can be easily explained and
> > > > > understood by admins.
> > > >
> > > > Thinking quickly about possible technical solutions to this, maybe it
> > > > makes sense to have two counters on a contobj so that we know when the
> > > > last process in that container exits and can issue the death
> > > > certificate, but we still block reuse of it until all further references
> > > > to it have been resolved.  This will likely also make it possible to
> > > > report the full contid chain in SIGNAL2 records.  This will eliminate
> > > > some of the issues we are discussing with regards to passing a contobj
> > > > vs a contid to the audit_log_contid function, but won't eliminate them
> > > > all because there are still some contids that won't have an object
> > > > associated with them to make it impossible to look them up in the
> > > > contobj lists.
> > >
> > > I'm not sure you need a full second counter, I imagine a simple flag
> > > would be okay.  I think you just something to indicate that this ACID
> > > object is marked as "dead" but it still being held for sanity reasons
> > > and should not be reused.
> >
> > Ok, I see your point.  This refcount can be changed to a flag easily
> > enough without change to the api if we can be sure that more than one
> > signal can't be delivered to the audit daemon *and* collected by sig2.
> > I'll have a more careful look at the audit daemon code to see if I can
> > determine this.
> 
> Maybe I'm not understanding your concern, but this isn't really
> different than any of the other things we track for the auditd signal
> sender, right?  If we are worried about multiple signals being sent
> then it applies to everything, not just the audit container ID.

Yes, you are right.  In all other cases the information is simply
overwritten.  In the case of the audit container identifier any
previous value is put before a new one is referenced, so only the last
signal is kept.  So, we only need a flag.  Does a flag implemented with
a rcu-protected refcount sound reasonable to you?

> > Another question occurs to me is that what if the audit daemon is sent a
> > signal and it cannot or will not collect the sig2 information from the
> > kernel (SIGKILL?)?  Does that audit container identifier remain dead
> > until reboot, or do we institute some other form of reaping, possibly
> > time-based?
> 
> In order to preserve the integrity of the audit log that ACID value
> would need to remain unavailable until the ACID which contains the
> associated auditd is "dead" (no one can request the signal sender's
> info if that container is dead).

I don't understand why it would be associated with the contid of the
audit daemon process rather than with the audit daemon process itself.
How does the signal collection somehow get transferred or delegated to
another member of that audit daemon's container?

Thinking aloud here, the audit daemon's exit when it calls audit_free()
needs to ..._put_sig and cancel that audit_sig_cid (which in the future
will be allocated per auditd rather than the global it is now since
there is only one audit daemon).

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

