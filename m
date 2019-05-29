Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAB32DDE1
	for <lists+linux-audit@lfdr.de>; Wed, 29 May 2019 15:16:31 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 92C08305D791;
	Wed, 29 May 2019 13:15:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E48D6B8C9;
	Wed, 29 May 2019 13:15:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A150519725;
	Wed, 29 May 2019 13:15:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4TDFDOF005660 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 29 May 2019 09:15:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 69EF91A7D9; Wed, 29 May 2019 13:15:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 64F0480BB
	for <linux-audit@redhat.com>; Wed, 29 May 2019 13:15:10 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 229D8C079901
	for <linux-audit@redhat.com>; Wed, 29 May 2019 13:15:02 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id y13so2015389lfh.9
	for <linux-audit@redhat.com>; Wed, 29 May 2019 06:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zo8/tL88lhYZ8ZmjXhe5I0ivQ63AMHIIXfJiG0SngrI=;
	b=WcqJPV36GoYCJyCKWssunS/8jjCOcm7506dwRBLhvYgsNR0UdI2bR6S+PaChd3NF+e
	P+/GUrP8I1gxdIuXwHh6CxrPM6FsQK897PtueXW2sc688u6UEVtahdPaDHpbLdURczG/
	exuh5TP/Fn7NuWWJubwb5BOU06YIqB0/o8baMnCRHH/ihY5uaT1si7LXcC8p9MWXL18d
	oOzuzN3xy5AjXeHWyQmqeSM1pM2ZeR9RQEvA5xn86EDD7CpzITSwgBRLK8NSiZHIhZG2
	4dGKz3NjhIgq/QlLySTSs2ZLnXWGPjQaDD2AF5PW0kac6rHkp3GF9xtJmzZ2Gi7XnFzZ
	e6Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zo8/tL88lhYZ8ZmjXhe5I0ivQ63AMHIIXfJiG0SngrI=;
	b=YSOF74NSGqVCBGNxMhYDRzBM9De4K3Xx/sRSexfK29itS529fQjSWz35qFm/U5vf4h
	nsCELyHfgowVziWywnwYbUw6bfaq0VLzeka+lkw8kiWilURp645aRYPewx1fBTu2JL/f
	0r0MyqDTV+3TZj3X8gcwDN5c38nlstPqix3sloKXUFvxQAjP7QZscU6R39no8PycS8tc
	mb+Mf1IdPjSmLbnXyOlXTRVKbHjZu+kKL0GhJxf2ICpC7Fm8W+8wSS8oOd1mc57Wyj6C
	IEQa9Q7Bd5n6c5IcAg+/YY0OzH2re5JJ3zRcfCp9Q8CoSf+AD4vinLvFxMgj7a0I9kzk
	uFiw==
X-Gm-Message-State: APjAAAXtw/2/zQGUl20VWZhsD6J7iwtXZ3CgBMJvAuMnBR4xt9toJCdh
	WyOOPluRktgMjfEcI0nbvBjwZlIDM5nqCrTXqHWD
X-Google-Smtp-Source: APXvYqw1iYjVpziXjswrmlU2rI862bFdoZ/LKvGEmuAIzGxOxKMlkrc2fuaVbN9QOa1jFVN2h6hTKGffJR8WNirL26o=
X-Received: by 2002:ac2:4358:: with SMTP id o24mr5608001lfl.13.1559135695377; 
	Wed, 29 May 2019 06:14:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1554732921.git.rgb@redhat.com>
	<509ea6b0-1ac8-b809-98c2-37c34dd98ca3@redhat.com>
	<CAHC9VhRW9f6GbhvvfifbOzd9p=PgdB2gq1E7tACcaqvfb85Y8A@mail.gmail.com>
	<3299293.RYyUlNkVNy@x2>
	<20190529004352.vvicec7nnk6pvkwt@madcap2.tricolour.ca>
In-Reply-To: <20190529004352.vvicec7nnk6pvkwt@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 29 May 2019 09:14:44 -0400
Message-ID: <CAHC9VhScO5yfnM2tn=_6OKtuU5P_LukPfmnE06E0hVE-2e++uw@mail.gmail.com>
Subject: Re: [PATCH ghak90 V6 00/10] audit: implement container identifier
To: Richard Guy Briggs <rgb@redhat.com>, Steve Grubb <sgrubb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 29 May 2019 13:15:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Wed, 29 May 2019 13:15:02 +0000 (UTC) for IP:'209.85.167.68'
	DOMAIN:'mail-lf1-f68.google.com' HELO:'mail-lf1-f68.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.008  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_NONE) 209.85.167.68 mail-lf1-f68.google.com 209.85.167.68
	mail-lf1-f68.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
Cc: Neil Horman <nhorman@tuxdriver.com>, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, Mrunal Patel <mpatel@redhat.com>,
	Serge Hallyn <serge@hallyn.com>
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Wed, 29 May 2019 13:16:30 +0000 (UTC)

On Tue, May 28, 2019 at 8:44 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2019-05-28 19:00, Steve Grubb wrote:
> > On Tuesday, May 28, 2019 6:26:47 PM EDT Paul Moore wrote:
> > > On Tue, May 28, 2019 at 5:54 PM Daniel Walsh <dwalsh@redhat.com> wrote:

...

> > > > Mrunal Patel (maintainer of CRI-O) and I have reviewed the API, and
> > > > believe this is something we can work on in the container runtimes team
> > > > to implement the container auditing code in CRI-O and Podman.
> > >
> > > Thanks Dan.  If I pulled this into a branch and built you some test
> > > kernels to play with, any idea how long it might take to get a proof
> > > of concept working on the cri-o side?
> >
> > We'd need to merge user space patches and let them use that instead of the
> > raw interface. I'm not going to merge user space until we are pretty sure the
> > patch is going into the kernel.
>
> I have an f29 test rpm of the userspace bits if that helps for testing:
>         http://people.redhat.com/~rbriggs/ghak90/git-1db7e21/
>
> Here's what it contains (minus the last patch):
>         https://github.com/linux-audit/audit-userspace/compare/master...rgbriggs:ghau40-containerid-filter.v7.0

Yes, exactly.  Just as I plan to start making some test kernels for
people to play with (assuming v6 looks okay), I think it would be good
if Steve could make a test build of the latest audit userspace with
the audit container ID patches.  It really shouldn't be that hard, and
the benefits should far outweigh any time spent generating the
tree/builds.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
