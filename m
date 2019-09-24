Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AFFBC928
	for <lists+linux-audit@lfdr.de>; Tue, 24 Sep 2019 15:51:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 971ED307BCC4;
	Tue, 24 Sep 2019 13:51:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C587A5D9E1;
	Tue, 24 Sep 2019 13:51:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EA24E24F30;
	Tue, 24 Sep 2019 13:51:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8ODouIp021806 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 24 Sep 2019 09:50:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 51B96608C0; Tue, 24 Sep 2019 13:50:56 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-19.phx2.redhat.com [10.3.112.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 83A07608C2;
	Tue, 24 Sep 2019 13:50:49 +0000 (UTC)
Date: Tue, 24 Sep 2019 09:50:46 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: ntp audit spew.
Message-ID: <20190924135046.kkt5hntbjpcampwr@madcap2.tricolour.ca>
References: <20190923155041.GA14807@codemonkey.org.uk>
	<CAHC9VhTyz7fd+iQaymVXUGFe3ZA5Z_WkJeY_snDYiZ9GP6gCOA@mail.gmail.com>
	<20190923210021.5vfc2fo4wopennj5@madcap2.tricolour.ca>
	<CAHC9VhQPvS7mfmeomRLJ+SyXk=tZprSJQ9Ays3qr=+rqd=L16Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHC9VhQPvS7mfmeomRLJ+SyXk=tZprSJQ9Ays3qr=+rqd=L16Q@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
Cc: Dave Jones <davej@codemonkey.org.uk>, linux-audit@redhat.com,
	Linux Kernel <linux-kernel@vger.kernel.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Tue, 24 Sep 2019 13:51:07 +0000 (UTC)

On 2019-09-23 23:01, Paul Moore wrote:
> On Mon, Sep 23, 2019 at 5:00 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > On 2019-09-23 12:14, Paul Moore wrote:
> > > On Mon, Sep 23, 2019 at 11:50 AM Dave Jones <davej@codemonkey.org.uk> wrote:
> > > >
> > > > I have some hosts that are constantly spewing audit messages like so:
> > > >
> > > > [46897.591182] audit: type=1333 audit(1569250288.663:220): op=offset old=2543677901372 new=2980866217213
> > > > [46897.591184] audit: type=1333 audit(1569250288.663:221): op=freq old=-2443166611284 new=-2436281764244
> >
> > Odd.  It appears these two above should have the same serial number and
> > should be accompanied by a syscall record.  It appears that it has no
> > context to update to connect the two records.  Is it possible it is not
> > being called in a task context?  If that were the case though, I'd
> > expect audit_dummy_context() to return 1...
> 
> Yeah, I'm a little confused with these messages too.  As you pointed
> out, the different serial numbers imply that the audit_context is NULL
> and if the audit_context is NULL I would have expected it to fail the
> audit_dummy_context() check in audit_ntp_log().  I'm looking at this
> with tired eyes at the moment, so I'm likely missing something, but I
> just don't see it right now ...
> 
> What is even more confusing is that I don't see this issue on my test systems.
> 
> > Checking audit_enabled should not be necessary but might fix the
> > problem, but still not explain why we're getting these records.
> 
> I'd like to understand why this is happening before we start changing the code.

Absolutely.

This looks like a similar issue to the AUDIT_NETFILTER_CFG issue where
we get a lone record unconnected to a syscall when one of the netfilter
table initialization (ipv4 filter) is linked into the kernel rather than
compiled as a module, so it is run in kernel context at boot rather than
in user context as a module load later.  This is why I ask if it is
being run by a kernel thread rather than a user task, perhaps using a
syscall function call internally.

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
