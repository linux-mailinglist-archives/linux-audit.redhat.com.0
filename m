Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF462FCF0
	for <lists+linux-audit@lfdr.de>; Thu, 30 May 2019 16:09:45 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D5BC130C0DE2;
	Thu, 30 May 2019 14:09:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 75D7F10027CA;
	Thu, 30 May 2019 14:09:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 83368206D2;
	Thu, 30 May 2019 14:09:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4UE8Q6Z019715 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 30 May 2019 10:08:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9F31D7A4A7; Thu, 30 May 2019 14:08:26 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-16.phx2.redhat.com [10.3.112.16])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 110EF7A504;
	Thu, 30 May 2019 14:08:14 +0000 (UTC)
Date: Thu, 30 May 2019 10:08:12 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak90 V6 00/10] audit: implement container identifier
Message-ID: <20190530140812.zyosx6ee2m3zhuua@madcap2.tricolour.ca>
References: <cover.1554732921.git.rgb@redhat.com>
	<CAHC9VhQYPF2ma_W+hySbQtfTztf=K1LTFnxnyVK0y9VYxj-K=w@mail.gmail.com>
	<CAHC9VhTQ0gDZoWUh1QB4b7h3AgbpkhS40jrPVpCfJb11GT_FzQ@mail.gmail.com>
	<1674888.6UpDe63hFX@x2>
	<CAHC9VhQqiaHRxZkOZO2c5UzMOQ_NNu1pEsc4fQDX=Hj-HnGUoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHC9VhQqiaHRxZkOZO2c5UzMOQ_NNu1pEsc4fQDX=Hj-HnGUoQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-audit@redhat.com
Cc: Neil Horman <nhorman@tuxdriver.com>, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, Serge Hallyn <serge@hallyn.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Thu, 30 May 2019 14:09:44 +0000 (UTC)

On 2019-05-30 09:35, Paul Moore wrote:
> On Thu, May 30, 2019 at 9:08 AM Steve Grubb <sgrubb@redhat.com> wrote:
> > On Wednesday, May 29, 2019 6:26:12 PM EDT Paul Moore wrote:
> > > On Mon, Apr 22, 2019 at 9:49 AM Paul Moore <paul@paul-moore.com> wrote:
> > > > On Mon, Apr 22, 2019 at 7:38 AM Neil Horman <nhorman@tuxdriver.com>
> > wrote:
> > > > > On Mon, Apr 08, 2019 at 11:39:07PM -0400, Richard Guy Briggs wrote:
> > > > > > Implement kernel audit container identifier.
> > > > >
> > > > > I'm sorry, I've lost track of this, where have we landed on it? Are we
> > > > > good for inclusion?
> > > >
> > > > I haven't finished going through this latest revision, but unless
> > > > Richard made any significant changes outside of the feedback from the
> > > > v5 patchset I'm guessing we are "close".
> > > >
> > > > Based on discussions Richard and I had some time ago, I have always
> > > > envisioned the plan as being get the kernel patchset, tests, docs
> > > > ready (which Richard has been doing) and then run the actual
> > > > implemented API by the userland container folks, e.g. cri-o/lxc/etc.,
> > > > to make sure the actual implementation is sane from their perspective.
> > > > They've already seen the design, so I'm not expecting any real
> > > > surprises here, but sometimes opinions change when they have actual
> > > > code in front of them to play with and review.
> > > >
> > > > Beyond that, while the cri-o/lxc/etc. folks are looking it over,
> > > > whatever additional testing we can do would be a big win.  I'm
> > > > thinking I'll pull it into a separate branch in the audit tree
> > > > (audit/working-container ?) and include that in my secnext kernels
> > > > that I build/test on a regular basis; this is also a handy way to keep
> > > > it based against the current audit/next branch.  If any changes are
> > > > needed Richard can either chose to base those changes on audit/next or
> > > > the separate audit container ID branch; that's up to him.  I've done
> > > > this with other big changes in other trees, e.g. SELinux, and it has
> > > > worked well to get some extra testing in and keep the patchset "merge
> > > > ready" while others outside the subsystem look things over.
> > >
> > > I just sent my feedback on the v6 patchset, and it's small: basically
> > > three patches with "one-liner" changes needed.
> > >
> > > Richard, it's your call on how you want to proceed from here.  You can
> > > post a v7 incorporating the feedback, or since the tweaks are so
> > > minor, you can post fixup patches; the former being more
> > > comprehensive, the later being quicker to review and digest.
> > > Regardless of that, while we are waiting on a prototype from the
> > > container folks, I think it would be good to pull this into a working
> > > branch in the audit repo (as mentioned above), unless you would prefer
> > > to keep it as a patchset on the mailing list?
> >
> > Personally, I'd like to see this on a branch so that it's easier to build a
> > kernel locally for testing.
> 
> FWIW, if Richard does prefer for me to pull it into a working branch I
> plan to include it in my secnext builds both to make it easier to test
> regularly and to make the changes available to people who don't want
> to build their own kernel.

Sure, let's do a working branch.  I'll answer the issues in respective
threads...

> * http://www.paul-moore.com/blog/d/2019/04/kernel_secnext_repo.html
> 
> -- 
> paul moore
> www.paul-moore.com
> 
> --
> Linux-audit mailing list
> Linux-audit@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-audit

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
