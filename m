Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECFA2DFDD
	for <lists+linux-audit@lfdr.de>; Wed, 29 May 2019 16:35:25 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B3C9D8831E;
	Wed, 29 May 2019 14:34:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC8145DA62;
	Wed, 29 May 2019 14:34:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5CD801806B14;
	Wed, 29 May 2019 14:34:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4TEXU78019436 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 29 May 2019 10:33:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2B8A9785D2; Wed, 29 May 2019 14:33:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23BF577D45
	for <linux-audit@redhat.com>; Wed, 29 May 2019 14:33:27 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 67BCE30BC592
	for <linux-audit@redhat.com>; Wed, 29 May 2019 14:33:17 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id m15so2661183ljg.13
	for <linux-audit@redhat.com>; Wed, 29 May 2019 07:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+R6XaSKmT7xaRS0PcdGGsrsnwtHF1c1yRvMeuqxIEMc=;
	b=MvYOvm5pwBKuyss3lJ6TE7VXLupq/2ZOCPa5DZASqR7QOGGzwge6SQyavJFxXXyzLA
	yDESrMvd4fx9bZlF+oVXYSeD8yneLh8ANjGV3aP3xsoRysr4iOXivQBIJMJt0X4vE5Mp
	mASEtmgbN/gWD74uKgNhVTeVj4vNZbUBv5hrUeYDi9t+0MGIllcot2KPdCXjmQwtgejL
	HiKKHU9Juhi5xa44ZEwDCXg12DZscPt3cKs2QUmzSfYXZ1o4uP21flqN3RNXu921L2Vc
	juzSuSf92xuNAsaUl+oW+2heZ7oru2cnl91CAVZb4Yh1cYY2svao/t3dlz/aWtQVysf1
	etOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+R6XaSKmT7xaRS0PcdGGsrsnwtHF1c1yRvMeuqxIEMc=;
	b=NxCBZMjzInN0BG2HZg+1o4PXhY/Iw8VdIqm4xM/XHk2UstCSK4w32yciZDR1Z9SCC6
	IfSrc6tMkg4Fl++WqYuhNA/c3imma9v9aMLDCm4biQbMPpspHmSBzg15h4YcNL+vtq9V
	EYBD5SwZjGcjLIBa2h3jx3AIrqHxymgmSIeyiyVvWVHb994F55u94/dy12Og3cwPNCq5
	7dDABzU/3H3B0NKLw8APxNY+JlWTud2TGkrZy2wKvLA7AKKFbkYxlF/xOAYXahfO7cSr
	6UVIa5YpfiWoGe61qlclkauBWqj6w9DaI6J+VtefJAuPIoDGSWFfK3ZxRHmGODJIpjzR
	nASw==
X-Gm-Message-State: APjAAAUhkNFOErVOEj/vwpaV6XtT3/j8t/Wk1N10tfKYL45zv05lDYIX
	pSBiNKlQdbecXKUR666bEl4V/Bqa0/U+w3OR3sVM
X-Google-Smtp-Source: APXvYqwrTy7sYfpXbbmBYsaCl06LIUUm9Pjs4xGEgOjj99u9kMAv34QYfOKCYsQNfcmOZR8Qv/vYo84yQYc6sseRHGM=
X-Received: by 2002:a2e:9106:: with SMTP id m6mr2792242ljg.164.1559140394914; 
	Wed, 29 May 2019 07:33:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1554732921.git.rgb@redhat.com>
	<509ea6b0-1ac8-b809-98c2-37c34dd98ca3@redhat.com>
	<CAHC9VhRW9f6GbhvvfifbOzd9p=PgdB2gq1E7tACcaqvfb85Y8A@mail.gmail.com>
	<3299293.RYyUlNkVNy@x2>
	<20190529004352.vvicec7nnk6pvkwt@madcap2.tricolour.ca>
	<31804653-7518-1a9c-83af-f6ce6a6ce408@redhat.com>
	<CAHC9VhT295iYu_uDcQ7eqVq8SSkYgEQAsoNrmpvbMR5ERcBzaA@mail.gmail.com>
	<9a9ccb28-3cbc-c0b1-71b2-26df08105b4a@redhat.com>
In-Reply-To: <9a9ccb28-3cbc-c0b1-71b2-26df08105b4a@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 29 May 2019 10:33:03 -0400
Message-ID: <CAHC9VhRWXfYhCA-x+U3STw2FO+wqQ1EFx1wA_zoQVisuqR4oYw@mail.gmail.com>
Subject: Re: [PATCH ghak90 V6 00/10] audit: implement container identifier
To: Dan Walsh <dwalsh@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Wed, 29 May 2019 14:33:17 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Wed, 29 May 2019 14:33:17 +0000 (UTC) for IP:'209.85.208.196'
	DOMAIN:'mail-lj1-f196.google.com'
	HELO:'mail-lj1-f196.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.316  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,
	SPF_NONE) 209.85.208.196 mail-lj1-f196.google.com 209.85.208.196
	mail-lj1-f196.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Wed, 29 May 2019 14:35:24 +0000 (UTC)

On Wed, May 29, 2019 at 10:07 AM Daniel Walsh <dwalsh@redhat.com> wrote:
> On 5/29/19 9:17 AM, Paul Moore wrote:
> > On Wed, May 29, 2019 at 8:03 AM Daniel Walsh <dwalsh@redhat.com> wrote:
> >> On 5/28/19 8:43 PM, Richard Guy Briggs wrote:
> >>> On 2019-05-28 19:00, Steve Grubb wrote:
> >>>> On Tuesday, May 28, 2019 6:26:47 PM EDT Paul Moore wrote:
> >>>>> On Tue, May 28, 2019 at 5:54 PM Daniel Walsh <dwalsh@redhat.com> wrote:
> >>>>>> On 4/22/19 9:49 AM, Paul Moore wrote:
> >>>>>>> On Mon, Apr 22, 2019 at 7:38 AM Neil Horman <nhorman@tuxdriver.com>
> >>>> wrote:
> >>>>>>>> On Mon, Apr 08, 2019 at 11:39:07PM -0400, Richard Guy Briggs wrote:
> >>>>>>>>> Implement kernel audit container identifier.
> >>>>>>>> I'm sorry, I've lost track of this, where have we landed on it? Are we
> >>>>>>>> good for inclusion?
> >>>>>>> I haven't finished going through this latest revision, but unless
> >>>>>>> Richard made any significant changes outside of the feedback from the
> >>>>>>> v5 patchset I'm guessing we are "close".
> >>>>>>>
> >>>>>>> Based on discussions Richard and I had some time ago, I have always
> >>>>>>> envisioned the plan as being get the kernel patchset, tests, docs
> >>>>>>> ready (which Richard has been doing) and then run the actual
> >>>>>>> implemented API by the userland container folks, e.g. cri-o/lxc/etc.,
> >>>>>>> to make sure the actual implementation is sane from their perspective.
> >>>>>>> They've already seen the design, so I'm not expecting any real
> >>>>>>> surprises here, but sometimes opinions change when they have actual
> >>>>>>> code in front of them to play with and review.
> >>>>>>>
> >>>>>>> Beyond that, while the cri-o/lxc/etc. folks are looking it over,
> >>>>>>> whatever additional testing we can do would be a big win.  I'm
> >>>>>>> thinking I'll pull it into a separate branch in the audit tree
> >>>>>>> (audit/working-container ?) and include that in my secnext kernels
> >>>>>>> that I build/test on a regular basis; this is also a handy way to keep
> >>>>>>> it based against the current audit/next branch.  If any changes are
> >>>>>>> needed Richard can either chose to base those changes on audit/next or
> >>>>>>> the separate audit container ID branch; that's up to him.  I've done
> >>>>>>> this with other big changes in other trees, e.g. SELinux, and it has
> >>>>>>> worked well to get some extra testing in and keep the patchset "merge
> >>>>>>> ready" while others outside the subsystem look things over.
> >>>>>> Mrunal Patel (maintainer of CRI-O) and I have reviewed the API, and
> >>>>>> believe this is something we can work on in the container runtimes team
> >>>>>> to implement the container auditing code in CRI-O and Podman.
> >>>>> Thanks Dan.  If I pulled this into a branch and built you some test
> >>>>> kernels to play with, any idea how long it might take to get a proof
> >>>>> of concept working on the cri-o side?
> >>>> We'd need to merge user space patches and let them use that instead of the
> >>>> raw interface. I'm not going to merge user space until we are pretty sure the
> >>>> patch is going into the kernel.
> >>> I have an f29 test rpm of the userspace bits if that helps for testing:
> >>>       http://people.redhat.com/~rbriggs/ghak90/git-1db7e21/
> >>>
> >>> Here's what it contains (minus the last patch):
> >>>       https://github.com/linux-audit/audit-userspace/compare/master...rgbriggs:ghau40-containerid-filter.v7.0
> >>>
> >>>> -Steve
> >>>>
> >>>>> FWIW, I've also reached out to some of the LXC folks I know to get
> >>>>> their take on the API.  I think if we can get two different container
> >>>>> runtimes to give the API a thumbs-up then I think we are in good shape
> >>>>> with respect to the userspace interface.
> >>>>>
> >>>>> I just finished looking over the last of the pending audit kernel
> >>>>> patches that were queued waiting for the merge window to open so this
> >>>>> is next on my list to look at.  I plan to start doing that
> >>>>> tonight/tomorrow, and as long as the changes between v5/v6 are not
> >>>>> that big, it shouldn't take too long.
> >>> - RGB
> >>>
> >>> --
> >>> Richard Guy Briggs <rgb@redhat.com>
> >>> Sr. S/W Engineer, Kernel Security, Base Operating Systems
> >>> Remote, Ottawa, Red Hat Canada
> >>> IRC: rgb, SunRaycer
> >>> Voice: +1.647.777.2635, Internal: (81) 32635
> >> Our current thoughts are to put the setting of the ID inside of conmon,
> >> and then launching the OCI Runtime.  In a perfect world this would
> >> happen in the OCI Runtime, but we have no controls over different OCI
> >> Runtimes.
> >>
> >> By putting it into conmon, then CRI-O and Podman will automatically get
> >> the container id support.  After we have this we have to plumb it back
> >> up through the contianer engines to be able to easily report the link
> >> between the Container UUID and The Kernel Container Audit ID.
> > I'm glad you guys have a plan, that's encouraging, but sadly I have no
> > idea about the level of complexity/difficulty involved in modifying
> > the various container bits for a proof-of-concept?  Are we talking a
> > week or two?  A month?  More?
> >
> If we had the kernel and the libaudit api, it would involve a small
> effort in conmon,  I would figure a few days for a POC.  Getting the
> hole wiring into CRI-O and Podman, would be a little more effort.

That's great.  Stay tuned ...

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
