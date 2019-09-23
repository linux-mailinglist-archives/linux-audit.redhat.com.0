Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF80BBD7C
	for <lists+linux-audit@lfdr.de>; Mon, 23 Sep 2019 23:00:51 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 24EB03082B02;
	Mon, 23 Sep 2019 21:00:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B5851001947;
	Mon, 23 Sep 2019 21:00:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 790664EE68;
	Mon, 23 Sep 2019 21:00:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8NL0VCw000482 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 23 Sep 2019 17:00:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 34D5219D70; Mon, 23 Sep 2019 21:00:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-19.phx2.redhat.com [10.3.112.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BB55194BB;
	Mon, 23 Sep 2019 21:00:24 +0000 (UTC)
Date: Mon, 23 Sep 2019 17:00:21 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: ntp audit spew.
Message-ID: <20190923210021.5vfc2fo4wopennj5@madcap2.tricolour.ca>
References: <20190923155041.GA14807@codemonkey.org.uk>
	<CAHC9VhTyz7fd+iQaymVXUGFe3ZA5Z_WkJeY_snDYiZ9GP6gCOA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHC9VhTyz7fd+iQaymVXUGFe3ZA5Z_WkJeY_snDYiZ9GP6gCOA@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Mon, 23 Sep 2019 21:00:49 +0000 (UTC)

On 2019-09-23 12:14, Paul Moore wrote:
> On Mon, Sep 23, 2019 at 11:50 AM Dave Jones <davej@codemonkey.org.uk> wrote:
> >
> > I have some hosts that are constantly spewing audit messages like so:
> >
> > [46897.591182] audit: type=1333 audit(1569250288.663:220): op=offset old=2543677901372 new=2980866217213
> > [46897.591184] audit: type=1333 audit(1569250288.663:221): op=freq old=-2443166611284 new=-2436281764244

Odd.  It appears these two above should have the same serial number and
should be accompanied by a syscall record.  It appears that it has no
context to update to connect the two records.  Is it possible it is not
being called in a task context?  If that were the case though, I'd
expect audit_dummy_context() to return 1...

Checking audit_enabled should not be necessary but might fix the
problem, but still not explain why we're getting these records.

> > [48850.604005] audit: type=1333 audit(1569252241.675:222): op=offset old=1850302393317 new=3190241577926
> > [48850.604008] audit: type=1333 audit(1569252241.675:223): op=freq old=-2436281764244 new=-2413071187316
> > [49926.567270] audit: type=1333 audit(1569253317.638:224): op=offset old=2453141035832 new=2372389610455
> > [49926.567273] audit: type=1333 audit(1569253317.638:225): op=freq old=-2413071187316 new=-2403561671476
> >
> > This gets emitted every time ntp makes an adjustment, which is apparently very frequent on some hosts.
> >
> >
> > Audit isn't even enabled on these machines.
> >
> > # auditctl -l
> > No rules
> 
> [NOTE: added linux-audit to the CC line]
> 
> There is an audit mailing list, please CC it when you have audit
> concerns/questions/etc.
> 
> What happens when you run 'auditctl -a never,task'?  That *should*
> silence those messages as the audit_ntp_log() function has the
> requisite audit_dummy_context() check.  FWIW, this is the distro
> default for many (most? all?) distros; for example, check
> /etc/audit/audit.rules on a stock Fedora system.  A more selective
> configuration could simply exclude the TIME_ADJNTPVAL record (type
> 1333) from the records that the kernel emits.
> 
> We could also add a audit_enabled check at the top of
> audit_ntp_log()/__audit_ntp_log(), but I imagine some of that depends
> on the various security requirements (they can be bizzare and I can't
> say I'm up to date on all those - Steve Grubb should be able to
> comment on that).
> 
> -- 
> paul moore
> www.paul-moore.com
> 
> --
> Linux-audit mailing list
> Linux-audit@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-audit

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
