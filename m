Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 00671BF637
	for <lists+linux-audit@lfdr.de>; Thu, 26 Sep 2019 17:50:44 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C7530309B145;
	Thu, 26 Sep 2019 15:50:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA1535D6B0;
	Thu, 26 Sep 2019 15:50:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BB80D18089C8;
	Thu, 26 Sep 2019 15:50:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8QFoQ5l000598 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 26 Sep 2019 11:50:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9DC0660F88; Thu, 26 Sep 2019 15:50:26 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 97A9D60E1C
	for <linux-audit@redhat.com>; Thu, 26 Sep 2019 15:50:21 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AF22C3DE04
	for <linux-audit@redhat.com>; Thu, 26 Sep 2019 15:50:20 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id y3so2708823ljj.6
	for <linux-audit@redhat.com>; Thu, 26 Sep 2019 08:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KC2Nd1YvSxVp+ypAR2gexRbTcYIPCDvOfmcETC4TvmY=;
	b=MD/lsc1PmexES60c5rwL/OcBjrXwSz+Zd/Dyiw/BmhqrVGdAPVejWwpWFQZCxnohBY
	sKYYSS7tPVopGEri512NtdRXaUfp7jscCaKwH2AQ5qLtTH6twvJCi3MTYUnuxv8BvoCC
	+daFYXmUTObudzykh3SlU6XWdXdXFfXFAo7x+0wszhIsJ+763FC5SCikMynoiMKhlcOc
	MPgqEn3P6uPJxR1dCT6z24WKbo8twiPXl5Qps05rbju6prC3YWZe2/qSm8ZVOOR+voDU
	AT1glNxlOWUPILa45m4wCMjQpzTb8PR1MLnMTAkcRXF2tqKzRjr88Qy5sSJ0fdEGZYSn
	ubpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KC2Nd1YvSxVp+ypAR2gexRbTcYIPCDvOfmcETC4TvmY=;
	b=RmIixsJGGwWhRSOCKTnql061FBTuwKlcJ6Us+Joh67nxKuPscthoagOROecLSjp0KD
	datuA599WtIpB5d+wT8gmilPcgEKT4aVJ3RywDczjpLqH0hmlK20WIvyTc2JkFct3ewn
	jXMJG2QsjUMe8PDctCY5DXFeqvDfmihGsJ7WrG5RJr6VjunTbNkXxwrxD/De2MCQupSq
	2PstYng8ZG+G3FnXR6qpHvQQ+9leBKV9eTCtthMY9Cmnk+totjRMl1L1EFJ9XlhoA96S
	9BrK77TBR+EMqU0O8rhc/xefvHAjHs98VqSjjUgnuuEK+vc/UayQ7CQ40aSlszddIsTn
	WB3Q==
X-Gm-Message-State: APjAAAWqbw1zSG3UgdzHJAYYlS3sjjHdxC2satTvD1aUj7vxgNhQe1VD
	5NWfJQB/UdMXZRn8pTPx6jVBNz9oqTjsRS7WYxMo
X-Google-Smtp-Source: APXvYqwKu4fciwYEt6TOg/srlHAm83IQFpaVp2G+beVrOZfwuEzktvoUMGhPu3LUbb6KCfuBRjg4qp7vZ/wj1k2Hq7o=
X-Received: by 2002:a2e:9b5a:: with SMTP id o26mr3112055ljj.158.1569513018927; 
	Thu, 26 Sep 2019 08:50:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190923155041.GA14807@codemonkey.org.uk>
	<CAHC9VhTyz7fd+iQaymVXUGFe3ZA5Z_WkJeY_snDYiZ9GP6gCOA@mail.gmail.com>
	<20190923210021.5vfc2fo4wopennj5@madcap2.tricolour.ca>
	<CAHC9VhQPvS7mfmeomRLJ+SyXk=tZprSJQ9Ays3qr=+rqd=L16Q@mail.gmail.com>
	<20190924135046.kkt5hntbjpcampwr@madcap2.tricolour.ca>
	<CAHC9VhTJ53OSpNDLHMMrv65NFv7MK1XQt1zXPwd7nnAPo3rG0Q@mail.gmail.com>
In-Reply-To: <CAHC9VhTJ53OSpNDLHMMrv65NFv7MK1XQt1zXPwd7nnAPo3rG0Q@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 26 Sep 2019 11:50:07 -0400
Message-ID: <CAHC9VhR+iWur_0T06=Y0Cxn6HG16NOLUiNo3yyyNo_6bkCNFXQ@mail.gmail.com>
Subject: Re: ntp audit spew.
To: Dave Jones <davej@codemonkey.org.uk>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 26 Sep 2019 15:50:21 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Thu, 26 Sep 2019 15:50:21 +0000 (UTC) for IP:'209.85.208.195'
	DOMAIN:'mail-lj1-f195.google.com'
	HELO:'mail-lj1-f195.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.195 mail-lj1-f195.google.com 209.85.208.195
	mail-lj1-f195.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, linux-audit@redhat.com,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Thu, 26 Sep 2019 15:50:43 +0000 (UTC)

On Tue, Sep 24, 2019 at 1:05 PM Paul Moore <paul@paul-moore.com> wrote:
> On Tue, Sep 24, 2019 at 9:50 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> > On 2019-09-23 23:01, Paul Moore wrote:
> > > On Mon, Sep 23, 2019 at 5:00 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > > On 2019-09-23 12:14, Paul Moore wrote:
> > > > > On Mon, Sep 23, 2019 at 11:50 AM Dave Jones <davej@codemonkey.org.uk> wrote:
> > > > > >
> > > > > > I have some hosts that are constantly spewing audit messages like so:
> > > > > >
> > > > > > [46897.591182] audit: type=1333 audit(1569250288.663:220): op=offset old=2543677901372 new=2980866217213
> > > > > > [46897.591184] audit: type=1333 audit(1569250288.663:221): op=freq old=-2443166611284 new=-2436281764244
> > > >
> > > > Odd.  It appears these two above should have the same serial number and
> > > > should be accompanied by a syscall record.  It appears that it has no
> > > > context to update to connect the two records.  Is it possible it is not
> > > > being called in a task context?  If that were the case though, I'd
> > > > expect audit_dummy_context() to return 1...
> > >
> > > Yeah, I'm a little confused with these messages too.  As you pointed
> > > out, the different serial numbers imply that the audit_context is NULL
> > > and if the audit_context is NULL I would have expected it to fail the
> > > audit_dummy_context() check in audit_ntp_log().  I'm looking at this
> > > with tired eyes at the moment, so I'm likely missing something, but I
> > > just don't see it right now ...
> > >
> > > What is even more confusing is that I don't see this issue on my test systems.
> > >
> > > > Checking audit_enabled should not be necessary but might fix the
> > > > problem, but still not explain why we're getting these records.
> > >
> > > I'd like to understand why this is happening before we start changing the code.
> >
> > Absolutely.
> >
> > This looks like a similar issue to the AUDIT_NETFILTER_CFG issue where
> > we get a lone record unconnected to a syscall when one of the netfilter
> > table initialization (ipv4 filter) is linked into the kernel rather than
> > compiled as a module, so it is run in kernel context at boot rather than
> > in user context as a module load later.  This is why I ask if it is
> > being run by a kernel thread rather than a user task, perhaps using a
> > syscall function call internally.
>
> I don't see where in the code that could happen, but I agree that it
> looks like it; maybe I'm just missing a code path somewhere.
>
> Is anyone else seeing these records?  Granted my audit test systems
> are running chrony, not ntp, but the syscalls/behaviors should be
> similar and I can't seem to recreate this.

Dave, can you provide any additional information on the systems where
you are seeing this?  Kernel, userspace, distro, relevant configs,
etc.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
