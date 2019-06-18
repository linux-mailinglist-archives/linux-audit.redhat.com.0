Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 072C84A74E
	for <lists+linux-audit@lfdr.de>; Tue, 18 Jun 2019 18:45:58 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E1A2B30833C2;
	Tue, 18 Jun 2019 16:45:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 69C1D84E4;
	Tue, 18 Jun 2019 16:45:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9F93454D3D;
	Tue, 18 Jun 2019 16:45:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5IGXVlc029924 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 18 Jun 2019 12:33:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2357D52D1; Tue, 18 Jun 2019 16:33:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-122-238.rdu2.redhat.com [10.10.122.238])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 557905F1B9;
	Tue, 18 Jun 2019 16:33:28 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: "Boyce, Kevin P [US] (AS)" <Kevin.Boyce@ngc.com>
Subject: Re: EXT :Re: audit-3.0
Date: Tue, 18 Jun 2019 12:33:26 -0400
Message-ID: <6481257.BRVGXvehui@x2>
Organization: Red Hat
In-Reply-To: <64d415ae04d24717aa10ed18c011ebbb@XCGVAG30.northgrum.com>
References: <5F4EE10832231F4F921A255C1D95429807F871@DEERLM99EX7MSX.ww931.my-it-solutions.net>
	<2131118.IeVxGuMqAv@x2>
	<64d415ae04d24717aa10ed18c011ebbb@XCGVAG30.northgrum.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
Cc: "linux-audit@redhat.com" <linux-audit@redhat.com>, "MAUPERTUIS,
	PHILIPPE" <philippe.maupertuis@equensworldline.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Tue, 18 Jun 2019 16:45:56 +0000 (UTC)

On Tuesday, June 18, 2019 11:59:05 AM EDT Boyce, Kevin P [US] (AS) wrote:
> Maybe what Philippe means is a carefully tested auditd shouldn't be
> considered "alpha" anymore?

That's a fair point. :-)  

I've considered it Alpha because it's missing container support. IOW, it's 
not feature complete. Container support was listed as the main benefit for 
calling this 3.0. There probably won't be a beta release. It will probably 
just go straight to release after initial testing and then cleanup problems/
round out support on a 3.0.1 release.

-Steve

> -----Original Message-----
> From: linux-audit-bounces@redhat.com <linux-audit-bounces@redhat.com> On
> Behalf Of Steve Grubb Sent: Tuesday, June 18, 2019 10:36 AM
> To: linux-audit@redhat.com
> Cc: MAUPERTUIS, PHILIPPE <philippe.maupertuis@equensworldline.com>
> Subject: EXT :Re: audit-3.0
> 
> Hello Philippe,
> 
> On Tuesday, June 18, 2019 9:34:08 AM EDT MAUPERTUIS, PHILIPPE wrote:
> > On the mailing list a few days ago, it was announce that Audit-3.0
> > alpha8 was available. I am a little bit confused because on a RHEL 8
> > server I get
> > 
> > rpm -q audit
> > audit-3.0-0.10.20180831git0047a6c.el8.x86_64
> > What are the link between the Rhel 8 rpm and the version audit-3.0
> > announced.
> 
> The RHEL 8 rpm is an earlier git snapshot from August 31, 2018 + patches.
> The package version should be a clue that this is a git snapshot. The
> Fedora packaging guidelines say that if it is a pre-release git snapshot,
> version must start with 0 so it can be overridden in the future, and the
> date + git + last commit hash must be included so that anyone can identify
> exactly what this is.
> > I can't imagine RHEL8 using an alpha version.
> 
> Why? Anything put into RHEL is carefully tested. (Fedora has also been
> running on alpha/git snapshots for about a year, too.) Also, I stopped
> feature development in audit-3.0 around August of last year. Everything
> going in since then has been bugs reported or discovered or at most small
> patches to support new kernel features. So, audit userspace should be
> considered as becoming mature, stable code that will not be developed at
> the same pace as before.
> 
> I expect that when container support lands, there will be a couple rounds
> of development to make it nice to use. But then its back to listening for
> bug reports.
> 
> To be honest, I think at this point anything of value is really higher up
> the stack. IOW, visualizing, aggregating, or alerting at scale.
> 
> -Steve
> 
> > As the side note the Rhel 8 rpm has the following description rpm -qi
> > audit
> > Name        : audit
> > Version     : 3.0
> > Release     : 0.10.20180831git0047a6c.el8
> > Architecture: x86_64
> > Install Date: Mon 17 Jun 2019 05:55:23 PM CEST
> > Group       : Unspecified
> > Size        : 678098
> > License     : GPLv2+
> > Signature   : RSA/SHA256, Wed 09 Jan 2019 07:26:49 PM CET, Key ID
> > 199e2f91fd431d51 Source RPM  :
> > audit-3.0-0.10.20180831git0047a6c.el8.src.rpm
> > Build Date  : Wed 09 Jan 2019 06:26:29 PM CET Build Host  :
> > x86-vm-06.build.eng.bos.redhat.com
> > Relocations : (not relocatable)
> > Packager    : Red Hat, Inc. <http://bugzilla.redhat.com/bugzilla>
> > Vendor      : Red Hat, Inc.
> > URL         : http://people.redhat.com/sgrubb/audit/
> > Summary     : User space tools for 2.6 kernel auditing
> > 
> > Of course the kernel for REHL8 is :
> > rpm -q kernel
> > kernel-4.18.0-80.el8.x86_64
> > 
> > Any clarification is welcome
> 
> --
> Linux-audit mailing list
> Linux-audit@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-audit




--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
