Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E60D2DDF7
	for <lists+linux-audit@lfdr.de>; Wed, 29 May 2019 15:18:41 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 83A5B305D791;
	Wed, 29 May 2019 13:18:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF40C68429;
	Wed, 29 May 2019 13:18:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6D95219725;
	Wed, 29 May 2019 13:18:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4TDHmgn006350 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 29 May 2019 09:17:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8076E5D9E1; Wed, 29 May 2019 13:17:48 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 79C995D9D6
	for <linux-audit@redhat.com>; Wed, 29 May 2019 13:17:46 +0000 (UTC)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 830B330C1FE7
	for <linux-audit@redhat.com>; Wed, 29 May 2019 13:17:33 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id a9so619852lff.7
	for <linux-audit@redhat.com>; Wed, 29 May 2019 06:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=n6WwA4zk/EsZWyLmMz2aZvbV29nZ+j/GoKwFRPk91Ok=;
	b=VaEW0P5hpaTjmlBZCJfOuDnnKRyM32QMYxezcsjOyVnoVYhW27UH3bA0yPB14uCnm8
	d6tlPPbSEli4WyLUwUrT6Af2uF+lx7bxGKGmoQpy6nygRXB1RAlqDw49V/EC/UefyLAS
	V5AOjddkiAjg9f+0GvpxSvIoihKYmZdd6fHF0dTcE1wwwdW5tr2ya6gCdVnx9qV17H6j
	M4h7mt8SnLrfP/j7Xh+C9CJLUPWnxvm33kheunqaIOSjUWjKBJIKWfqR6xBUTSqUbF++
	F7UHQ3L5/JoQGwtak6oBzR1ZxY7vIk7D21+uK+44fUX7ULw4Xl5awm+avPU5QlsSwapC
	wSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=n6WwA4zk/EsZWyLmMz2aZvbV29nZ+j/GoKwFRPk91Ok=;
	b=b3AIn89QSf8lApzrFYaVTiWuU0AXZNXLzb6o+Wy6ErOSWrHH1DRIcPJkPk2Rdo6n1x
	7598+iz9xBnbdb6xlMmGdAldK9/7a0LTzWraAdm80a1zZBRafJ/TNRUkHWmPsNPbjDQ4
	zqB+EFK72bMbG8eDhntDTkAzW2aX4aGY894yKjPTjXisR8pYlMgdgCYMhiDhlahr0knh
	ozWVmuWXhTEr74E+mMNjWDbYUGWQLtQVS0tsb3omyFhOqlAUTi4KVYtOa3WNRtbwoVNN
	4kgf44OsEmrBK5a59c6o9cfQiNbLqb2daMwGtgdVVtIMOI1eCDhBRWvPDZpLQpmI74Ro
	oPkQ==
X-Gm-Message-State: APjAAAXlAxIG6RkA0NgpSTS2uL8rqnLyh4zJHJd3au/eG+YlPxOx9Vow
	ftb4fc1l7iag70fMkXk+wUyUfTS2BYGy+KEj7ruG
X-Google-Smtp-Source: APXvYqxwNJ2hrphH/eQEWYthKv8zwdiStt+rRGVE9lGQEZKevqFhuFcT1lynINU+dx1udh6C8bZFZeqDAxzvYCLlNC0=
X-Received: by 2002:ac2:4111:: with SMTP id b17mr7443993lfi.31.1559135851731; 
	Wed, 29 May 2019 06:17:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1554732921.git.rgb@redhat.com>
	<509ea6b0-1ac8-b809-98c2-37c34dd98ca3@redhat.com>
	<CAHC9VhRW9f6GbhvvfifbOzd9p=PgdB2gq1E7tACcaqvfb85Y8A@mail.gmail.com>
	<3299293.RYyUlNkVNy@x2>
	<20190529004352.vvicec7nnk6pvkwt@madcap2.tricolour.ca>
	<31804653-7518-1a9c-83af-f6ce6a6ce408@redhat.com>
In-Reply-To: <31804653-7518-1a9c-83af-f6ce6a6ce408@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 29 May 2019 09:17:20 -0400
Message-ID: <CAHC9VhT295iYu_uDcQ7eqVq8SSkYgEQAsoNrmpvbMR5ERcBzaA@mail.gmail.com>
Subject: Re: [PATCH ghak90 V6 00/10] audit: implement container identifier
To: Dan Walsh <dwalsh@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Wed, 29 May 2019 13:17:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Wed, 29 May 2019 13:17:33 +0000 (UTC) for IP:'209.85.167.66'
	DOMAIN:'mail-lf1-f66.google.com' HELO:'mail-lf1-f66.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.008  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_NONE) 209.85.167.66 mail-lf1-f66.google.com 209.85.167.66
	mail-lf1-f66.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-audit@redhat.com
Cc: Neil Horman <nhorman@tuxdriver.com>, Richard Guy Briggs <rgb@redhat.com>,
	linux-api@vger.kernel.org, containers@lists.linux-foundation.org,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Wed, 29 May 2019 13:18:40 +0000 (UTC)

On Wed, May 29, 2019 at 8:03 AM Daniel Walsh <dwalsh@redhat.com> wrote:
>
> On 5/28/19 8:43 PM, Richard Guy Briggs wrote:
> > On 2019-05-28 19:00, Steve Grubb wrote:
> >> On Tuesday, May 28, 2019 6:26:47 PM EDT Paul Moore wrote:
> >>> On Tue, May 28, 2019 at 5:54 PM Daniel Walsh <dwalsh@redhat.com> wrote:
> >>>> On 4/22/19 9:49 AM, Paul Moore wrote:
> >>>>> On Mon, Apr 22, 2019 at 7:38 AM Neil Horman <nhorman@tuxdriver.com>
> >> wrote:
> >>>>>> On Mon, Apr 08, 2019 at 11:39:07PM -0400, Richard Guy Briggs wrote:
> >>>>>>> Implement kernel audit container identifier.
> >>>>>> I'm sorry, I've lost track of this, where have we landed on it? Are we
> >>>>>> good for inclusion?
> >>>>> I haven't finished going through this latest revision, but unless
> >>>>> Richard made any significant changes outside of the feedback from the
> >>>>> v5 patchset I'm guessing we are "close".
> >>>>>
> >>>>> Based on discussions Richard and I had some time ago, I have always
> >>>>> envisioned the plan as being get the kernel patchset, tests, docs
> >>>>> ready (which Richard has been doing) and then run the actual
> >>>>> implemented API by the userland container folks, e.g. cri-o/lxc/etc.,
> >>>>> to make sure the actual implementation is sane from their perspective.
> >>>>> They've already seen the design, so I'm not expecting any real
> >>>>> surprises here, but sometimes opinions change when they have actual
> >>>>> code in front of them to play with and review.
> >>>>>
> >>>>> Beyond that, while the cri-o/lxc/etc. folks are looking it over,
> >>>>> whatever additional testing we can do would be a big win.  I'm
> >>>>> thinking I'll pull it into a separate branch in the audit tree
> >>>>> (audit/working-container ?) and include that in my secnext kernels
> >>>>> that I build/test on a regular basis; this is also a handy way to keep
> >>>>> it based against the current audit/next branch.  If any changes are
> >>>>> needed Richard can either chose to base those changes on audit/next or
> >>>>> the separate audit container ID branch; that's up to him.  I've done
> >>>>> this with other big changes in other trees, e.g. SELinux, and it has
> >>>>> worked well to get some extra testing in and keep the patchset "merge
> >>>>> ready" while others outside the subsystem look things over.
> >>>> Mrunal Patel (maintainer of CRI-O) and I have reviewed the API, and
> >>>> believe this is something we can work on in the container runtimes team
> >>>> to implement the container auditing code in CRI-O and Podman.
> >>> Thanks Dan.  If I pulled this into a branch and built you some test
> >>> kernels to play with, any idea how long it might take to get a proof
> >>> of concept working on the cri-o side?
> >> We'd need to merge user space patches and let them use that instead of the
> >> raw interface. I'm not going to merge user space until we are pretty sure the
> >> patch is going into the kernel.
> > I have an f29 test rpm of the userspace bits if that helps for testing:
> >       http://people.redhat.com/~rbriggs/ghak90/git-1db7e21/
> >
> > Here's what it contains (minus the last patch):
> >       https://github.com/linux-audit/audit-userspace/compare/master...rgbriggs:ghau40-containerid-filter.v7.0
> >
> >> -Steve
> >>
> >>> FWIW, I've also reached out to some of the LXC folks I know to get
> >>> their take on the API.  I think if we can get two different container
> >>> runtimes to give the API a thumbs-up then I think we are in good shape
> >>> with respect to the userspace interface.
> >>>
> >>> I just finished looking over the last of the pending audit kernel
> >>> patches that were queued waiting for the merge window to open so this
> >>> is next on my list to look at.  I plan to start doing that
> >>> tonight/tomorrow, and as long as the changes between v5/v6 are not
> >>> that big, it shouldn't take too long.
> > - RGB
> >
> > --
> > Richard Guy Briggs <rgb@redhat.com>
> > Sr. S/W Engineer, Kernel Security, Base Operating Systems
> > Remote, Ottawa, Red Hat Canada
> > IRC: rgb, SunRaycer
> > Voice: +1.647.777.2635, Internal: (81) 32635
>
> Our current thoughts are to put the setting of the ID inside of conmon,
> and then launching the OCI Runtime.  In a perfect world this would
> happen in the OCI Runtime, but we have no controls over different OCI
> Runtimes.
>
> By putting it into conmon, then CRI-O and Podman will automatically get
> the container id support.  After we have this we have to plumb it back
> up through the contianer engines to be able to easily report the link
> between the Container UUID and The Kernel Container Audit ID.

I'm glad you guys have a plan, that's encouraging, but sadly I have no
idea about the level of complexity/difficulty involved in modifying
the various container bits for a proof-of-concept?  Are we talking a
week or two?  A month?  More?

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
