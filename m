Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CA261BBC6F
	for <lists+linux-audit@lfdr.de>; Mon, 23 Sep 2019 21:50:07 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7EDF118C8919;
	Mon, 23 Sep 2019 19:50:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC61B5C1B5;
	Mon, 23 Sep 2019 19:50:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BE6F16B49D;
	Mon, 23 Sep 2019 19:50:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8NJntBQ028479 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 23 Sep 2019 15:49:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1116A10018F8; Mon, 23 Sep 2019 19:49:55 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from localhost.localdomain (unknown [10.11.216.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4CD911001B05;
	Mon, 23 Sep 2019 19:49:52 +0000 (UTC)
Message-ID: <d5d92540ca5aab8916ac4d93f6b5677ab52d2e7d.camel@redhat.com>
Subject: Re: ntp audit spew.
From: Eric Paris <eparis@redhat.com>
To: Dave Jones <davej@codemonkey.org.uk>, Paul Moore <paul@paul-moore.com>
Date: Mon, 23 Sep 2019 15:49:52 -0400
In-Reply-To: <20190923194901.GA2787@codemonkey.org.uk>
References: <20190923155041.GA14807@codemonkey.org.uk>
	<CAHC9VhTyz7fd+iQaymVXUGFe3ZA5Z_WkJeY_snDYiZ9GP6gCOA@mail.gmail.com>
	<20190923165806.GA21466@codemonkey.org.uk>
	<CAHC9VhTh+cD5pkb8JAHnG1wa9-UgivSb7+-yjjYaD+6vhyYKjA@mail.gmail.com>
	<20190923194901.GA2787@codemonkey.org.uk>
User-Agent: Evolution 3.34.0 (3.34.0-1.fc31) 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com, Linux Kernel <linux-kernel@vger.kernel.org>
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]); Mon, 23 Sep 2019 19:50:06 +0000 (UTC)

Is this the thing where systemd is listening on the multicast netlink
socket and causes everything to come out kmesg as well?

On Mon, 2019-09-23 at 15:49 -0400, Dave Jones wrote:
> On Mon, Sep 23, 2019 at 02:57:08PM -0400, Paul Moore wrote:
>  > On Mon, Sep 23, 2019 at 12:58 PM Dave Jones <
> davej@codemonkey.org.uk> wrote:
>  > > On Mon, Sep 23, 2019 at 12:14:14PM -0400, Paul Moore wrote:
>  > >  > On Mon, Sep 23, 2019 at 11:50 AM Dave Jones <
> davej@codemonkey.org.uk> wrote:
>  > >  > >
>  > >  > > I have some hosts that are constantly spewing audit
> messages like so:
>  > >  > >
>  > >  > > [46897.591182] audit: type=1333 audit(1569250288.663:220):
> op=offset old=2543677901372 new=2980866217213
>  > >  > > [46897.591184] audit: type=1333 audit(1569250288.663:221):
> op=freq old=-2443166611284 new=-2436281764244
>  > >  > > [48850.604005] audit: type=1333 audit(1569252241.675:222):
> op=offset old=1850302393317 new=3190241577926
>  > >  > > [48850.604008] audit: type=1333 audit(1569252241.675:223):
> op=freq old=-2436281764244 new=-2413071187316
>  > >  > > [49926.567270] audit: type=1333 audit(1569253317.638:224):
> op=offset old=2453141035832 new=2372389610455
>  > >  > > [49926.567273] audit: type=1333 audit(1569253317.638:225):
> op=freq old=-2413071187316 new=-2403561671476
>  > >  > >
>  > >  > > This gets emitted every time ntp makes an adjustment, which
> is apparently very frequent on some hosts.
>  > >  > >
>  > >  > >
>  > >  > > Audit isn't even enabled on these machines.
>  > >  > >
>  > >  > > # auditctl -l
>  > >  > > No rules
>  > >  >
>  > >  > What happens when you run 'auditctl -a never,task'?  That
> *should*
>  > >  > silence those messages as the audit_ntp_log() function has
> the
>  > >  > requisite audit_dummy_context() check.
>  > >
>  > > They still get emitted.
>  > >
>  > >  > FWIW, this is the distro
>  > >  > default for many (most? all?) distros; for example, check
>  > >  > /etc/audit/audit.rules on a stock Fedora system.
>  > >
>  > > As these machines aren't using audit, they aren't running auditd
> either.
>  > > Essentially: nothing enables audit, but the kernel side
> continues to log
>  > > ntp regardless (no other audit messages seem to do this).
>  > 
>  > What does your kernel command line look like?  Do you have
> "audit=1"
>  > somewhere in there?
> 
> nope.
> 
> ro root=LABEL=/ biosdevname=0 net.ifnames=0 fsck.repair=yes
> systemd.gpt_auto=0 pcie_pme=nomsi ipv6.autoconf=0 erst_disable
> crashkernel=128M console=tty0 console=ttyS1,57600
> intel_iommu=tboot_noforce
> 
> 	Dave
> 

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
