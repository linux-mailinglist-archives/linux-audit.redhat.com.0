Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE122D18D
	for <lists+linux-audit@lfdr.de>; Wed, 29 May 2019 00:27:16 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6B530883D7;
	Tue, 28 May 2019 22:27:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 304E917C4F;
	Tue, 28 May 2019 22:27:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B80BC1806B16;
	Tue, 28 May 2019 22:27:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4SMR9wX000601 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 28 May 2019 18:27:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 795531972B; Tue, 28 May 2019 22:27:09 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 71A061972A
	for <linux-audit@redhat.com>; Tue, 28 May 2019 22:27:07 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4AFA13D953
	for <linux-audit@redhat.com>; Tue, 28 May 2019 22:27:00 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id q62so437751ljq.7
	for <linux-audit@redhat.com>; Tue, 28 May 2019 15:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ktt9gYykDzHpqn8jF4Qn7x/F6J4TOsbrfkkqyFVpV5w=;
	b=n+HTPMYY03EsfqfMQMiANp2md/hDS/jlVuamukt0nOAU7xPknfYtDemk0kZgZuFTHv
	bRRyBB/UYNm0BKOmBOfzzowydINpzWcs+zehMLezF9i+fjo7UBomNhnCVNZY0EjYJ+5y
	LmKd1wAWg/jiTQEzLus3rLiA0eqqVE5BX5YSZA2T3ue0t+KGYzatINIK83DcRmdhPCJD
	VYpI6oVq4rK33VxUzojZ7YDWOJpYL64PE5qMqe7J+W/bnibjK9Pf7iJOmD0adHosNm20
	IPQPZcunlCxBbtuQ16uU5TccmfLXarLNDZojREYCYpTIyI/q+PK5X7zIKyD4V82AbhxR
	4d5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ktt9gYykDzHpqn8jF4Qn7x/F6J4TOsbrfkkqyFVpV5w=;
	b=Ja+UpvtaI1lLzSjCxlLDvvKFODSy8Ycg+rfRUX97sO9OTty+XCebwxYZeMce+dyorl
	+O1+pMIK0BtXdd2hAFUh+Aqv+H+BFn54wAfrdlgukBKvseGxWBeDTsRJw0Uaf/kdGW0M
	1xrZ92E6bgmw1AS6u7YQ3EzWkq4uPYer3Ee+GNQu7A2PZ2m3Mj31Yhnr+zuNRzWnmOFF
	6Yyttr1vi3EEDCQoZEPLhcLTAN0IvbsYEo/YZ36QKkJSfWubOVD66S6/IrHqC6ZvcTDs
	1bQ71AXYotJBeILPUofMS55KD+YI8QgxIxZ70zurh9Oe16f4tzJ4i4InjcLt6QHdiGqt
	L//Q==
X-Gm-Message-State: APjAAAWSsbTwWHphkdWMwN3ATojXl+9qqOnwKF9LyJfU8xXHNI5ReC/6
	C7zosupaNHuLN487gUNV7aX/g7kudoHX+uuyLnYu
X-Google-Smtp-Source: APXvYqxDbW1InkCBbmSLm8KlqXmvlXu3oe3jcdB9CqBRbawDuAW8nu9Cieu8BrGQMf+AwTidy9xNra96kS1tITFYFCY=
X-Received: by 2002:a2e:9106:: with SMTP id m6mr425785ljg.164.1559082418552;
	Tue, 28 May 2019 15:26:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1554732921.git.rgb@redhat.com>
	<20190422113810.GA27747@hmswarspite.think-freely.org>
	<CAHC9VhQYPF2ma_W+hySbQtfTztf=K1LTFnxnyVK0y9VYxj-K=w@mail.gmail.com>
	<509ea6b0-1ac8-b809-98c2-37c34dd98ca3@redhat.com>
In-Reply-To: <509ea6b0-1ac8-b809-98c2-37c34dd98ca3@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 28 May 2019 18:26:47 -0400
Message-ID: <CAHC9VhRW9f6GbhvvfifbOzd9p=PgdB2gq1E7tACcaqvfb85Y8A@mail.gmail.com>
Subject: Re: [PATCH ghak90 V6 00/10] audit: implement container identifier
To: Dan Walsh <dwalsh@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 28 May 2019 22:27:00 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]);
	Tue, 28 May 2019 22:27:00 +0000 (UTC) for IP:'209.85.208.196'
	DOMAIN:'mail-lj1-f196.google.com'
	HELO:'mail-lj1-f196.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.316  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.196 mail-lj1-f196.google.com 209.85.208.196
	mail-lj1-f196.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.30
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Tue, 28 May 2019 22:27:15 +0000 (UTC)

On Tue, May 28, 2019 at 5:54 PM Daniel Walsh <dwalsh@redhat.com> wrote:
>
> On 4/22/19 9:49 AM, Paul Moore wrote:
> > On Mon, Apr 22, 2019 at 7:38 AM Neil Horman <nhorman@tuxdriver.com> wrote:
> >> On Mon, Apr 08, 2019 at 11:39:07PM -0400, Richard Guy Briggs wrote:
> >>> Implement kernel audit container identifier.
> >> I'm sorry, I've lost track of this, where have we landed on it? Are we good for
> >> inclusion?
> > I haven't finished going through this latest revision, but unless
> > Richard made any significant changes outside of the feedback from the
> > v5 patchset I'm guessing we are "close".
> >
> > Based on discussions Richard and I had some time ago, I have always
> > envisioned the plan as being get the kernel patchset, tests, docs
> > ready (which Richard has been doing) and then run the actual
> > implemented API by the userland container folks, e.g. cri-o/lxc/etc.,
> > to make sure the actual implementation is sane from their perspective.
> > They've already seen the design, so I'm not expecting any real
> > surprises here, but sometimes opinions change when they have actual
> > code in front of them to play with and review.
> >
> > Beyond that, while the cri-o/lxc/etc. folks are looking it over,
> > whatever additional testing we can do would be a big win.  I'm
> > thinking I'll pull it into a separate branch in the audit tree
> > (audit/working-container ?) and include that in my secnext kernels
> > that I build/test on a regular basis; this is also a handy way to keep
> > it based against the current audit/next branch.  If any changes are
> > needed Richard can either chose to base those changes on audit/next or
> > the separate audit container ID branch; that's up to him.  I've done
> > this with other big changes in other trees, e.g. SELinux, and it has
> > worked well to get some extra testing in and keep the patchset "merge
> > ready" while others outside the subsystem look things over.
> >
> Mrunal Patel (maintainer of CRI-O) and I have reviewed the API, and
> believe this is something we can work on in the container runtimes team
> to implement the container auditing code in CRI-O and Podman.

Thanks Dan.  If I pulled this into a branch and built you some test
kernels to play with, any idea how long it might take to get a proof
of concept working on the cri-o side?

FWIW, I've also reached out to some of the LXC folks I know to get
their take on the API.  I think if we can get two different container
runtimes to give the API a thumbs-up then I think we are in good shape
with respect to the userspace interface.

I just finished looking over the last of the pending audit kernel
patches that were queued waiting for the merge window to open so this
is next on my list to look at.  I plan to start doing that
tonight/tomorrow, and as long as the changes between v5/v6 are not
that big, it shouldn't take too long.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
