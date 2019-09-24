Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B73BC040
	for <lists+linux-audit@lfdr.de>; Tue, 24 Sep 2019 04:40:31 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CE2D9308FEC1;
	Tue, 24 Sep 2019 02:40:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 62C6660923;
	Tue, 24 Sep 2019 02:40:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B70841803B37;
	Tue, 24 Sep 2019 02:40:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8O2dVbI012600 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 23 Sep 2019 22:39:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5E5705D721; Tue, 24 Sep 2019 02:39:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 594495D71C
	for <linux-audit@redhat.com>; Tue, 24 Sep 2019 02:39:28 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 79C4EC049E17
	for <linux-audit@redhat.com>; Tue, 24 Sep 2019 02:39:27 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id m13so219739ljj.11
	for <linux-audit@redhat.com>; Mon, 23 Sep 2019 19:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=69FsbDk3UWzV2ado0kISftXd4Dxcwqhctiepyrz5wa4=;
	b=C6mIDqbf80FLU0LnPzHEgkLF483jKLHXlK521PxkYT8ynqbV8+qmaX6hC6QUZLK6Ci
	R6R+o+sG1tbtfrFryoHmi1EJos8bldXIMSa0fnKH7XvXPkaidzC8TDamUykQp6mp2fR+
	P5vkgc4xkx8IisaqRFW0opFHrBXIkoqspri95omg2fzp7dlBMRk7unyLy/eoinDeFGai
	089zZb9QVFMHJDN7P8t1LLLtUnwG+Eofl9yVuoMVWorWBYzyxsmn3GNti20ZnjAuQmf3
	4ZaRgIWUEaVdRWDjFZ5DHwztxESROQWBJHXO16bzJZlfRSpcgLk0SO+HPIsB13HYjQlj
	rn5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=69FsbDk3UWzV2ado0kISftXd4Dxcwqhctiepyrz5wa4=;
	b=eRKVlZfQP3OWZO+Fw2LbFllfd8zMqjIQm50aiq+jFUFHRqmxYKEhhV6uzrK32XoQuz
	wu1dtSWYz/quTGXU5Uj2orDXvTpoyDv0HV/jpubwomIprX8vOVXLv13atvY8y4fExhs+
	dcU1YUjpcP7/ad6EjVvjpTLOEbWFTtY/lgCOBXRczsTKeJ96qly69QGoDuV5YGK5tzaM
	Eb5QdyI5kzm9UHPCxjf4fd1jTR319wqMrh/9vH+oOWTvAZLMV7qhUeSCrtHOv6WY4pG5
	Gue+xw1jp+uI6vPcJnkyGqeMA0hVDEb95g/BxsG2PdMxhYB+weM9R+xep8rfRiTmkDUa
	98eQ==
X-Gm-Message-State: APjAAAXMw2BXQkmMkds14v4kCd55Bk7ZMSZOQrQSkAiO2f/FsZggbv2y
	JdFq0sbfqecbiNxIEY5VHhstq8dJeGHgorIe2sgf
X-Google-Smtp-Source: APXvYqw9Hua23+qq2hsh3uzAjoZt49lXUPzD6s52CvB4ggcm8e3fEjygRKpDpy8RUBGqKckGHwPovNGUeUR0Y9CRNz4=
X-Received: by 2002:a2e:9615:: with SMTP id v21mr282460ljh.46.1569292765707;
	Mon, 23 Sep 2019 19:39:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190923155041.GA14807@codemonkey.org.uk>
	<CAHC9VhTyz7fd+iQaymVXUGFe3ZA5Z_WkJeY_snDYiZ9GP6gCOA@mail.gmail.com>
	<20190923165806.GA21466@codemonkey.org.uk>
	<CAHC9VhTh+cD5pkb8JAHnG1wa9-UgivSb7+-yjjYaD+6vhyYKjA@mail.gmail.com>
	<20190923194901.GA2787@codemonkey.org.uk>
	<d5d92540ca5aab8916ac4d93f6b5677ab52d2e7d.camel@redhat.com>
In-Reply-To: <d5d92540ca5aab8916ac4d93f6b5677ab52d2e7d.camel@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 23 Sep 2019 22:39:14 -0400
Message-ID: <CAHC9VhSpZ0_oGgdFzM=ZCdh-Z1MfBb4Eruado-Dx52WFcO16ug@mail.gmail.com>
Subject: Re: ntp audit spew.
To: Eric Paris <eparis@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 24 Sep 2019 02:39:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Tue, 24 Sep 2019 02:39:27 +0000 (UTC) for IP:'209.85.208.196'
	DOMAIN:'mail-lj1-f196.google.com'
	HELO:'mail-lj1-f196.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.196 mail-lj1-f196.google.com 209.85.208.196
	mail-lj1-f196.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Tue, 24 Sep 2019 02:40:25 +0000 (UTC)

On Mon, Sep 23, 2019 at 3:49 PM Eric Paris <eparis@redhat.com> wrote:
> Is this the thing where systemd is listening on the multicast netlink
> socket and causes everything to come out kmesg as well?

I don't think so, but I'm still a little confused as to why DaveJ is
seeing these records, so I'll go with a weak "maybe" ;)

> On Mon, 2019-09-23 at 15:49 -0400, Dave Jones wrote:
> > On Mon, Sep 23, 2019 at 02:57:08PM -0400, Paul Moore wrote:
> >  > On Mon, Sep 23, 2019 at 12:58 PM Dave Jones <
> > davej@codemonkey.org.uk> wrote:
> >  > > On Mon, Sep 23, 2019 at 12:14:14PM -0400, Paul Moore wrote:
> >  > >  > On Mon, Sep 23, 2019 at 11:50 AM Dave Jones <
> > davej@codemonkey.org.uk> wrote:
> >  > >  > >
> >  > >  > > I have some hosts that are constantly spewing audit
> > messages like so:
> >  > >  > >
> >  > >  > > [46897.591182] audit: type=1333 audit(1569250288.663:220):
> > op=offset old=2543677901372 new=2980866217213
> >  > >  > > [46897.591184] audit: type=1333 audit(1569250288.663:221):
> > op=freq old=-2443166611284 new=-2436281764244
> >  > >  > > [48850.604005] audit: type=1333 audit(1569252241.675:222):
> > op=offset old=1850302393317 new=3190241577926
> >  > >  > > [48850.604008] audit: type=1333 audit(1569252241.675:223):
> > op=freq old=-2436281764244 new=-2413071187316
> >  > >  > > [49926.567270] audit: type=1333 audit(1569253317.638:224):
> > op=offset old=2453141035832 new=2372389610455
> >  > >  > > [49926.567273] audit: type=1333 audit(1569253317.638:225):
> > op=freq old=-2413071187316 new=-2403561671476
> >  > >  > >
> >  > >  > > This gets emitted every time ntp makes an adjustment, which
> > is apparently very frequent on some hosts.
> >  > >  > >
> >  > >  > >
> >  > >  > > Audit isn't even enabled on these machines.
> >  > >  > >
> >  > >  > > # auditctl -l
> >  > >  > > No rules
> >  > >  >
> >  > >  > What happens when you run 'auditctl -a never,task'?  That
> > *should*
> >  > >  > silence those messages as the audit_ntp_log() function has
> > the
> >  > >  > requisite audit_dummy_context() check.
> >  > >
> >  > > They still get emitted.
> >  > >
> >  > >  > FWIW, this is the distro
> >  > >  > default for many (most? all?) distros; for example, check
> >  > >  > /etc/audit/audit.rules on a stock Fedora system.
> >  > >
> >  > > As these machines aren't using audit, they aren't running auditd
> > either.
> >  > > Essentially: nothing enables audit, but the kernel side
> > continues to log
> >  > > ntp regardless (no other audit messages seem to do this).
> >  >
> >  > What does your kernel command line look like?  Do you have
> > "audit=1"
> >  > somewhere in there?
> >
> > nope.
> >
> > ro root=LABEL=/ biosdevname=0 net.ifnames=0 fsck.repair=yes
> > systemd.gpt_auto=0 pcie_pme=nomsi ipv6.autoconf=0 erst_disable
> > crashkernel=128M console=tty0 console=ttyS1,57600
> > intel_iommu=tboot_noforce
> >
> >       Dave
> >
>


-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
