Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D201DC7E1
	for <lists+linux-audit@lfdr.de>; Fri, 18 Oct 2019 16:56:27 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EA5A583F45;
	Fri, 18 Oct 2019 14:56:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE8C860A97;
	Fri, 18 Oct 2019 14:56:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AD5A94E58A;
	Fri, 18 Oct 2019 14:56:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9IEuDPi032122 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 18 Oct 2019 10:56:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9F86510002A2; Fri, 18 Oct 2019 14:56:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-117-28.phx2.redhat.com [10.3.117.28])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6238F10013A1;
	Fri, 18 Oct 2019 14:56:10 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: New field seen in audit.log
Date: Fri, 18 Oct 2019 10:56:09 -0400
Message-ID: <2506810.HO3NYBUXJ5@x2>
Organization: Red Hat
In-Reply-To: <CABD0H0vS3THc--rx2ZS=A_g8p-MvSX8EBzt7qa1R7or7ba3xNw@mail.gmail.com>
References: <mailman.103.1571328019.6486.linux-audit@redhat.com>
	<CABD0H0vS3THc--rx2ZS=A_g8p-MvSX8EBzt7qa1R7or7ba3xNw@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
Cc: Evelyn Mitchell <efmphone@gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Fri, 18 Oct 2019 14:56:25 +0000 (UTC)

On Friday, October 18, 2019 10:38:08 AM EDT Evelyn Mitchell wrote:
> For my own learning, I'm trying to understand what personality=40000 means.
> 
> In looking at /uapi/linux/personality.h where the
> personality types are defined, and manually converting 40000 to hex
> 0x9C40, it looks to me like the personality is set to enable:
> ADDR_LIMIT_3GB =        0x8000000
> SHORT_INODE =           0x1000000
> ADDR_LIMIT_32BIT =      0x0800000
> READ_IMPLIES_EXEC =     0x0400000
> ADDR_COMPAT_LAYOUT =    0x0200000
> MMAP_PAGE_ZERO =        0x0100000
> ADDR_NO_RANDOMIZE =     0x0040000
> 
> But, this looks unreasonable to me as a set of flags someone would
> deliberately pick, so I thought I'd ask if I'm interpreting this
> correctly.

I think so. The executable is gdb. It needs to disable ASLR so that it can 
reliably  map the symbols to addresses.

-Steve


> > You may never have seen it before because it appears you now have a
> > personality other than PER_LINUX for this event.  32-bit binary on 64
> > bit?  I assume your arch is x86 64 (LE)?
> > 
> > > type=SYSCALL msg=audit(1571245536.351:43593): arch=c000003e syscall=3
> > > *per=40000* success=yes exit=0 a0=5 a1=5 a2=556213b6d6bc
> > > a3=7f483b98bcc0
> > > items=0 ppid=2653 pid=2655 auid=1000 uid=1000 gid=1000 euid=1000
> > > suid=1000
> > > fsuid=1000 egid=1000 sgid=1000 fsgid=1000 tty=pts1 ses=3 comm="gdb"
> > > exe="/usr/bin/gdb" key=(null)
> > 
> > - RGB
> > 
> > --
> > Richard Guy Briggs <rgb@redhat.com>
> > Sr. S/W Engineer, Kernel Security, Base Operating Systems
> > Remote, Ottawa, Red Hat Canada
> > IRC: rgb, SunRaycer
> > Voice: +1.647.777.2635, Internal: (81) 32635
> > 
> > 
> > 
> > ------------------------------
> 
> --
> Linux-audit mailing list
> Linux-audit@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-audit




--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
