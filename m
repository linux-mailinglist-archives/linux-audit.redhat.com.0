Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 48083BCFC6
	for <lists+linux-audit@lfdr.de>; Tue, 24 Sep 2019 19:02:42 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1959B356C5;
	Tue, 24 Sep 2019 17:02:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC35760C5D;
	Tue, 24 Sep 2019 17:02:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6B99B4E58A;
	Tue, 24 Sep 2019 17:02:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8OH2K1O003724 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 24 Sep 2019 13:02:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8FB0419C58; Tue, 24 Sep 2019 17:02:20 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 867C8196AE
	for <linux-audit@redhat.com>; Tue, 24 Sep 2019 17:01:40 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 10B0730ADBA0
	for <linux-audit@redhat.com>; Tue, 24 Sep 2019 17:01:39 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id y127so1995519lfc.0
	for <linux-audit@redhat.com>; Tue, 24 Sep 2019 10:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3EOVspAXPFO/zP7zLE0+rol5UDYlko14RFhVFd10Q2Y=;
	b=ksxAq+zBjdwwrnH3JeNQN5NwYIoqkKJ/d3Bn9KLZgMkl+xH/Wm4Mm5cMg8qJgsyPbW
	u6ZxwQqSyJR4HbbXChiRgn9x1DEySEOmOO22P5jviHDghj4KHLKXg7YnjvYHWJ8WMCFg
	U+e34zrOhmCAcKeJ1Xrev6mNPqfboH+hGUcfH9qKyKlgQdr9Kga2ppE+DuwjujOhE0/F
	TiXRc6+/GtD2Xo0IWbH7Arqgbs/kx4APenttK+QHwOfzypNcikS9fNvWSKAyCNTSdLf5
	P82I40rA+irHnaP/YtEFRkI3RrfDhKf/8bjn+mKFWCmmfnRYDAZEInIDwErjLuufs8Hj
	biDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3EOVspAXPFO/zP7zLE0+rol5UDYlko14RFhVFd10Q2Y=;
	b=A3ZpxheVffivmra7ursOYD7hQhovP9I84uGH3NXNiX3t33LtI5AA7OotsGRqCQpbgN
	UYpAuxhDtU+qU82zCBraY+4cNh0d18qbcnBah9+2V1vMpUFCdyjbvoSr5gW8oPoX4OPU
	t5OXTDed04IItu8Apop/LPWEBbCRZ0gAVAgCAbxth5YcZetxTzFdOxnzLGaO5xaOSGBo
	GnShzyXNq7KYwU7SX8UwgCz169C8zJDDYI/ROh6aPRibMGoS22waGi3mb2waEGHRDdvK
	HsxQy0ZHInyyhe2KoEdjOB/D+tZNA+teyBdaFdMaBaIsS7KqsIgRtVoQCDOwhrN9A+Pt
	ctoQ==
X-Gm-Message-State: APjAAAXKWHkIx2imtQFqLNMSS8+S6QQj2jqk+z6D90p5OZMa9rxRw8NL
	gYr6pwscdK039wtkB6oDtKZkbTwtFePqpSTkJTyk
X-Google-Smtp-Source: APXvYqy/OZ/D54rGYNX1/ukfNHPhBFFMJ+yOSTZaOKPuXsMrieUkTSeTREvrtjq1r8xs3uTGM6icZeNhXfgyNLh3cbs=
X-Received: by 2002:a19:cc15:: with SMTP id c21mr2529427lfg.64.1569344497225; 
	Tue, 24 Sep 2019 10:01:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190923155041.GA14807@codemonkey.org.uk>
	<CAHC9VhTyz7fd+iQaymVXUGFe3ZA5Z_WkJeY_snDYiZ9GP6gCOA@mail.gmail.com>
	<2130348.JY4ctgmguH@x2>
In-Reply-To: <2130348.JY4ctgmguH@x2>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 24 Sep 2019 13:01:26 -0400
Message-ID: <CAHC9VhQBeb6V-RLad+Y92P_a=a_pcZi2b+_VAGzxpbqwBvURUg@mail.gmail.com>
Subject: Re: ntp audit spew.
To: Steve Grubb <sgrubb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Tue, 24 Sep 2019 17:01:39 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Tue, 24 Sep 2019 17:01:39 +0000 (UTC) for IP:'209.85.167.68'
	DOMAIN:'mail-lf1-f68.google.com' HELO:'mail-lf1-f68.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.167.68 mail-lf1-f68.google.com 209.85.167.68
	mail-lf1-f68.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Tue, 24 Sep 2019 17:02:41 +0000 (UTC)

On Tue, Sep 24, 2019 at 9:19 AM Steve Grubb <sgrubb@redhat.com> wrote:
> On Monday, September 23, 2019 12:14:14 PM EDT Paul Moore wrote:
> > On Mon, Sep 23, 2019 at 11:50 AM Dave Jones <davej@codemonkey.org.uk>
> wrote:
> > > I have some hosts that are constantly spewing audit messages like so:
> > >
> > > [46897.591182] audit: type=1333 audit(1569250288.663:220): op=offset
> > > old=2543677901372 new=2980866217213 [46897.591184] audit: type=1333
> > > audit(1569250288.663:221): op=freq old=-2443166611284 new=-2436281764244
> > > [48850.604005] audit: type=1333 audit(1569252241.675:222): op=offset
> > > old=1850302393317 new=3190241577926 [48850.604008] audit: type=1333
> > > audit(1569252241.675:223): op=freq old=-2436281764244 new=-2413071187316
> > > [49926.567270] audit: type=1333 audit(1569253317.638:224): op=offset
> > > old=2453141035832 new=2372389610455 [49926.567273] audit: type=1333
> > > audit(1569253317.638:225): op=freq old=-2413071187316 new=-2403561671476
> > >
> > > This gets emitted every time ntp makes an adjustment, which is apparently
> > > very frequent on some hosts.
> > >
> > >
> > > Audit isn't even enabled on these machines.
> > >
> > > # auditctl -l
> > > No rules
> >
> > [NOTE: added linux-audit to the CC line]
> >
> > There is an audit mailing list, please CC it when you have audit
> > concerns/questions/etc.
> >
> > What happens when you run 'auditctl -a never,task'?
>
> Actually, "-e 0" should turn it off. There is a general problem where systemd
> turns on auditing just because it can. The above rule just makes audit
> processes inauditable, but does not affect the kernel originating events.

The 'auditctl -s' output was lost when I trimmed/replied to DaveJ's
original email (sorry), but it appears that audit_enabled is already
'0':

> # auditctl -s
> enabled 0
> failure 1
> pid 0
> rate_limit 0
> backlog_limit 64
> lost 0
> backlog 0
> loginuid_immutable 0 unlocked

Original post from DaveJ:

* https://lore.kernel.org/lkml/20190923155041.GA14807@codemonkey.org.uk

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
