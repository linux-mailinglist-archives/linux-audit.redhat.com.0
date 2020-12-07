Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B4D972D1BE9
	for <lists+linux-audit@lfdr.de>; Mon,  7 Dec 2020 22:21:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607376084;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nMVbPV3xkZhqN+n8h/t9MUYnZUD7UD5r98Jglq8rRjI=;
	b=Qe6LCEZU6ADmOOgKAc+EPKH84bXAOcmtd/DnxZ7I9bGEO2naLrssUn4Q/s1KU8f+1J21DV
	WEjF8/JlClwjCB1PnK44zte6eaOqItL95BR38bAvVz1Gpfo/gtLT57H5PMSNX2vs7kkd9x
	QVwKGVllrbRCJY31x9OesqdlBn1sGcU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-pjPd652eMKuPqsC5qrhHmQ-1; Mon, 07 Dec 2020 16:21:22 -0500
X-MC-Unique: pjPd652eMKuPqsC5qrhHmQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E137EC1AA;
	Mon,  7 Dec 2020 21:21:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B3D4919C59;
	Mon,  7 Dec 2020 21:21:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D84EA180954D;
	Mon,  7 Dec 2020 21:21:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B7LLAeW025070 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 7 Dec 2020 16:21:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BEEFD2BFF1; Mon,  7 Dec 2020 21:21:10 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E7EE39A4B;
	Mon,  7 Dec 2020 21:21:03 +0000 (UTC)
Date: Mon, 7 Dec 2020 16:21:00 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Max Englander <max.englander@gmail.com>
Subject: Re: [PATCH v2] audit: report audit wait metric in audit status reply
Message-ID: <20201207212100.GN986374@madcap2.tricolour.ca>
References: <20200701213244.GA1817@linux-kernel-dev> <20883376.EfDdHjke4D@x2>
	<CAHC9VhQyMD3XiP91u__SwOH-toAa=YBaCrwtvE8dVRVdh-wA0g@mail.gmail.com>
	<5413598.DvuYhMxLoT@x2>
	<CAHC9VhSF7BynebKq0o0Dec7qB5D0CNWLt9uj=Ky_72W0C-BJcg@mail.gmail.com>
	<CAK50otVNjgLM+_Sn4-i2tz0GGNOcW2fK-YHHayZWZhks4XNmUg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK50otVNjgLM+_Sn4-i2tz0GGNOcW2fK-YHHayZWZhks4XNmUg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
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
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020-12-07 16:13, Max Englander wrote:
> On Fri, Dec 4, 2020 at 3:41 PM Paul Moore <paul@paul-moore.com> wrote:
> 
> > On Thu, Dec 3, 2020 at 9:47 PM Steve Grubb <sgrubb@redhat.com> wrote:
> > > On Thursday, December 3, 2020 9:16:52 PM EST Paul Moore wrote:
> > > > > > > Author:     Richard Guy Briggs <rgb@redhat.com>
> > > > > > > AuthorDate: 2014-11-17 15:51:01 -0500
> > > > > > > Commit:     Paul Moore <pmoore@redhat.com>
> > > > > > > CommitDate: 2014-11-17 16:53:51 -0500
> > > > > > > ("audit: convert status version to a feature bitmap")
> > > > > > > It was introduced specifically to enable distributions to
> > selectively
> > > > > > > backport features.  It was converted away from AUDIT_VERSION.
> > > > > > >
> > > > > > > There are other ways to detect the presence of
> > > > > > > backlog_wait_time_actual
> > > > > > > as I mentioned above.
> > > > > >
> > > > > > Let me be blunt - I honestly don't care what Steve's audit
> > userspace
> > > > > > does to detect this.  I've got my own opinion, but Steve's audit
> > > > > > userspace is not my project to manage and I think we've established
> > > > > > over the years that Steve and I have very different views on what
> > > > > > constitutes good design.
> > > > >
> > > > > And guessing what might be in buffers of different sizes is good
> > design?
> > > > > The FEATURE_BITMAP was introduced to get rid of this ambiguity.
> > > >
> > > > There is just soo much to unpack in your comment Steve, but let me
> > > > keep it short ...
> > > >
> > > > - This is an enterprise distro problem, not an upstream problem.  The
> > > > problems you are talking about are not a problem for upstream.
> > >
> > > You may look at it that way. I do not. Audit -userspace is also an
> > upstream
> > > for a lot of distros and I need to make this painless for them. So,
> > while you
> > > may think of this being a backport problem for Red Hat to solve, I think
> > of
> > > this as a generic problem that I'd like to solve for Debian, Suse,
> > Ubuntu,
> > > Arch, Gentoo, anyone using audit. We both are upstream.
> >
> > I intentionally said "enterprise Linux distributions", I never singled
> > out RH/IBM.  Contrary to what RH/IBM marketing may have me believe, I
> > don't consider RHEL to be the only "enterprise Linux distribution" :)
> >
> > Beyond that, while I haven't looked at all of the distros you list
> > above, I know a few of them typically only backport fixes, not new
> > features.  Further, as I mentioned previously in this thread, there is
> > a way to backport this feature in a safe manner without using the
> > feature bits.  Eeeeeven further, if there wasn't a way to backport
> > this feature safely (and let me stress agai that you can backport this
> > safely), I would still consider that to be a distro problem and not an
> > upstream kernel problem.  The upstream kernel is not responsible for
> > enabling or supporting arbitrary combinations of patches.
> >
> > --
> > paul moore
> > www.paul-moore.com
> >
> > --
> > Linux-audit mailing list
> > Linux-audit@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-audit
> >
> >
> Hi Steve, Paul,
> 
> I'm replying with the Gmail UI since I don't have my Mutt setup handy, so
> apologies for any formatting which doesn't align with the mailing list best
>  practices!
> 
> First off, my apologies for being late to the thread, and for submitting
> code
> to the kernel and user space which aren't playing nicely with each other.
> 
> It sounds like there's a decision to be made around whether or not to use
> the bitmap feature flags which I probably am probably not in a position to
> help decide. However, I'm more than happy to fix my userspace PR so
> that it does not rely on the feature flag space using the approach Paul
> outlined, in spite of the drawbacks, if that ends up being the decision.
> 
> Steve, I understand your preference to rely on the feature bitmap since it
> is a more reliable way to determine the availability of a feature than
> key size, but if you're open to Paul's recommendations in spite of the
> drawbacks, I'll make the changes to my patch as soon as I can to unblock
> your work.
> 
> Separately, since there is tension between these two approaches
> (structure size and bitmap), I wonder if Paul/Steve you would be open
> to a third way.

Max, Steve: have you looked at my reply in this thread from 2020-12-03 18:10?

There are two solutions in there that should work without relying on the
unreliable test for structure size that work without changing the
currently commited kernel code.  Or have I missed something?

> For example, I can imagine adding additional bitmap
> spaces (FEATURE_BITMAP_2, FEATURE_BITMAP_3, etc.).
> Alternately, I can imagine each feature being assigned a unique u64
> ID, and user space programs querying the kernel to see whether a
> a particular feature is enabled.
> 
> I'm not familiar enough with the kernel to be able to judge how sound
> either idea is (or if these have been considered and rejected in the past)
> but if you all think a third way is viable, I'd be happy to start a separate
> mailing thread to try to thread the competing requirements of the kernel
> and userspace, and contribute code if we can find a solution.
> 
> Max

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

