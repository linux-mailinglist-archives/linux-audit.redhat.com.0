Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7B44A41A
	for <lists+linux-audit@lfdr.de>; Tue, 18 Jun 2019 16:37:42 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B5F2830872F9;
	Tue, 18 Jun 2019 14:37:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 037064D1;
	Tue, 18 Jun 2019 14:37:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BF6F71833002;
	Tue, 18 Jun 2019 14:37:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5IEaXaE003270 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 18 Jun 2019 10:36:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1B36A17985; Tue, 18 Jun 2019 14:36:33 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-122-238.rdu2.redhat.com [10.10.122.238])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9689C611AC;
	Tue, 18 Jun 2019 14:36:29 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: audit-3.0
Date: Tue, 18 Jun 2019 10:36:22 -0400
Message-ID: <2131118.IeVxGuMqAv@x2>
Organization: Red Hat
In-Reply-To: <5F4EE10832231F4F921A255C1D95429807F871@DEERLM99EX7MSX.ww931.my-it-solutions.net>
References: <5F4EE10832231F4F921A255C1D95429807F871@DEERLM99EX7MSX.ww931.my-it-solutions.net>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
Cc: "MAUPERTUIS, PHILIPPE" <philippe.maupertuis@equensworldline.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Tue, 18 Jun 2019 14:37:41 +0000 (UTC)

Hello Philippe,

On Tuesday, June 18, 2019 9:34:08 AM EDT MAUPERTUIS, PHILIPPE wrote:
> On the mailing list a few days ago, it was announce that Audit-3.0 alpha8 
> was available. I am a little bit confused because on a RHEL 8 server I get
> :
> rpm -q audit
> audit-3.0-0.10.20180831git0047a6c.el8.x86_64
> What are the link between the Rhel 8 rpm and the version audit-3.0
> announced. 

The RHEL 8 rpm is an earlier git snapshot from August 31, 2018 + patches. The 
package version should be a clue that this is a git snapshot. The Fedora 
packaging guidelines say that if it is a pre-release git snapshot, version 
must start with 0 so it can be overridden in the future, and the date + git + 
last commit hash must be included so that anyone can identify exactly what 
this is.

> I can't imagine RHEL8 using an alpha version.

Why? Anything put into RHEL is carefully tested. (Fedora has also been 
running on alpha/git snapshots for about a year, too.) Also, I stopped 
feature development in audit-3.0 around August of last year. Everything going 
in since then has been bugs reported or discovered or at most small patches 
to support new kernel features. So, audit userspace should be considered as 
becoming mature, stable code that will not be developed at the same pace as 
before.

I expect that when container support lands, there will be a couple rounds of 
development to make it nice to use. But then its back to listening for bug 
reports.

To be honest, I think at this point anything of value is really higher up the 
stack. IOW, visualizing, aggregating, or alerting at scale.

-Steve


> As the side note the Rhel 8 rpm has the following description
> rpm -qi audit
> Name        : audit
> Version     : 3.0
> Release     : 0.10.20180831git0047a6c.el8
> Architecture: x86_64
> Install Date: Mon 17 Jun 2019 05:55:23 PM CEST
> Group       : Unspecified
> Size        : 678098
> License     : GPLv2+
> Signature   : RSA/SHA256, Wed 09 Jan 2019 07:26:49 PM CET, Key ID
> 199e2f91fd431d51 Source RPM  :
> audit-3.0-0.10.20180831git0047a6c.el8.src.rpm
> Build Date  : Wed 09 Jan 2019 06:26:29 PM CET
> Build Host  : x86-vm-06.build.eng.bos.redhat.com
> Relocations : (not relocatable)
> Packager    : Red Hat, Inc. <http://bugzilla.redhat.com/bugzilla>
> Vendor      : Red Hat, Inc.
> URL         : http://people.redhat.com/sgrubb/audit/
> Summary     : User space tools for 2.6 kernel auditing
> 
> Of course the kernel for REHL8 is :
> rpm -q kernel
> kernel-4.18.0-80.el8.x86_64
> 
> Any clarification is welcome



--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
