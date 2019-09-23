Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F7FBC8AD
	for <lists+linux-audit@lfdr.de>; Tue, 24 Sep 2019 15:16:45 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0C23E307D844;
	Tue, 24 Sep 2019 13:16:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BDF819C70;
	Tue, 24 Sep 2019 13:16:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ED2CA1803518;
	Tue, 24 Sep 2019 13:16:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8NJn7NW028445 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 23 Sep 2019 15:49:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2CC7319D70; Mon, 23 Sep 2019 19:49:07 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx30.extmail.prod.ext.phx2.redhat.com
	[10.5.110.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4683B19C77;
	Mon, 23 Sep 2019 19:49:04 +0000 (UTC)
Received: from scorn.kernelslacker.org (scorn.kernelslacker.org
	[45.56.101.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 154E41DA3;
	Mon, 23 Sep 2019 19:49:03 +0000 (UTC)
Received: from [2601:196:4600:6634:ae9e:17ff:feb7:72ca]
	(helo=wopr.kernelslacker.org)
	by scorn.kernelslacker.org with esmtp (Exim 4.92)
	(envelope-from <davej@codemonkey.org.uk>)
	id 1iCUKU-0003vq-1Z; Mon, 23 Sep 2019 15:49:02 -0400
Received: by wopr.kernelslacker.org (Postfix, from userid 1026)
	id 9B7E3560162; Mon, 23 Sep 2019 15:49:01 -0400 (EDT)
Date: Mon, 23 Sep 2019 15:49:01 -0400
From: Dave Jones <davej@codemonkey.org.uk>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: ntp audit spew.
Message-ID: <20190923194901.GA2787@codemonkey.org.uk>
Mail-Followup-To: Dave Jones <davej@codemonkey.org.uk>,
	Paul Moore <paul@paul-moore.com>,
	Linux Kernel <linux-kernel@vger.kernel.org>,
	Eric Paris <eparis@redhat.com>, linux-audit@redhat.com
References: <20190923155041.GA14807@codemonkey.org.uk>
	<CAHC9VhTyz7fd+iQaymVXUGFe3ZA5Z_WkJeY_snDYiZ9GP6gCOA@mail.gmail.com>
	<20190923165806.GA21466@codemonkey.org.uk>
	<CAHC9VhTh+cD5pkb8JAHnG1wa9-UgivSb7+-yjjYaD+6vhyYKjA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHC9VhTh+cD5pkb8JAHnG1wa9-UgivSb7+-yjjYaD+6vhyYKjA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Note: SpamAssassin invocation failed
X-Greylist: Sender passed SPF test, ACL 264 matched, not delayed by
	milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]);
	Mon, 23 Sep 2019 19:49:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]);
	Mon, 23 Sep 2019 19:49:03 +0000 (UTC) for IP:'45.56.101.199'
	DOMAIN:'scorn.kernelslacker.org' HELO:'scorn.kernelslacker.org'
	FROM:'davej@codemonkey.org.uk' RCPT:''
X-RedHat-Spam-Score: 0  (SPF_HELO_NONE,
	SPF_PASS) 45.56.101.199 scorn.kernelslacker.org
	45.56.101.199 scorn.kernelslacker.org <davej@codemonkey.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.71
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 24 Sep 2019 09:16:18 -0400
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Tue, 24 Sep 2019 13:16:44 +0000 (UTC)

On Mon, Sep 23, 2019 at 02:57:08PM -0400, Paul Moore wrote:
 > On Mon, Sep 23, 2019 at 12:58 PM Dave Jones <davej@codemonkey.org.uk> wrote:
 > > On Mon, Sep 23, 2019 at 12:14:14PM -0400, Paul Moore wrote:
 > >  > On Mon, Sep 23, 2019 at 11:50 AM Dave Jones <davej@codemonkey.org.uk> wrote:
 > >  > >
 > >  > > I have some hosts that are constantly spewing audit messages like so:
 > >  > >
 > >  > > [46897.591182] audit: type=1333 audit(1569250288.663:220): op=offset old=2543677901372 new=2980866217213
 > >  > > [46897.591184] audit: type=1333 audit(1569250288.663:221): op=freq old=-2443166611284 new=-2436281764244
 > >  > > [48850.604005] audit: type=1333 audit(1569252241.675:222): op=offset old=1850302393317 new=3190241577926
 > >  > > [48850.604008] audit: type=1333 audit(1569252241.675:223): op=freq old=-2436281764244 new=-2413071187316
 > >  > > [49926.567270] audit: type=1333 audit(1569253317.638:224): op=offset old=2453141035832 new=2372389610455
 > >  > > [49926.567273] audit: type=1333 audit(1569253317.638:225): op=freq old=-2413071187316 new=-2403561671476
 > >  > >
 > >  > > This gets emitted every time ntp makes an adjustment, which is apparently very frequent on some hosts.
 > >  > >
 > >  > >
 > >  > > Audit isn't even enabled on these machines.
 > >  > >
 > >  > > # auditctl -l
 > >  > > No rules
 > >  >
 > >  > What happens when you run 'auditctl -a never,task'?  That *should*
 > >  > silence those messages as the audit_ntp_log() function has the
 > >  > requisite audit_dummy_context() check.
 > >
 > > They still get emitted.
 > >
 > >  > FWIW, this is the distro
 > >  > default for many (most? all?) distros; for example, check
 > >  > /etc/audit/audit.rules on a stock Fedora system.
 > >
 > > As these machines aren't using audit, they aren't running auditd either.
 > > Essentially: nothing enables audit, but the kernel side continues to log
 > > ntp regardless (no other audit messages seem to do this).
 > 
 > What does your kernel command line look like?  Do you have "audit=1"
 > somewhere in there?

nope.

ro root=LABEL=/ biosdevname=0 net.ifnames=0 fsck.repair=yes systemd.gpt_auto=0 pcie_pme=nomsi ipv6.autoconf=0 erst_disable crashkernel=128M console=tty0 console=ttyS1,57600 intel_iommu=tboot_noforce

	Dave

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
