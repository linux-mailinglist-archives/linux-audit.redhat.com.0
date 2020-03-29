Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 202F0196AC5
	for <lists+linux-audit@lfdr.de>; Sun, 29 Mar 2020 05:12:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585451563;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jq1re9n0xNCznYWnSCiV6M7qcBetaNXx94QbL/wKWsw=;
	b=VDDNHht08tQuqX0oxWgmVDiclXUGanvhykWhrqi64kO3gHV1bA5zvRkMqRnzR9T2ikm8K2
	MS7VPIpyf11HbTcJ5vw8UWy7921NLzygde/Drj6Y7T4ko2E8ZJpZ9PIPZSD2XcTtUpLhVb
	mfWjLmvLeO0TFG1bm/Fr8MgAYRnY6P4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-znuMquEWP9yxJnjPweGhdQ-1; Sat, 28 Mar 2020 23:12:41 -0400
X-MC-Unique: znuMquEWP9yxJnjPweGhdQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99185189F760;
	Sun, 29 Mar 2020 03:12:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 933CF19C4F;
	Sun, 29 Mar 2020 03:12:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1BE441809567;
	Sun, 29 Mar 2020 03:12:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02T3Bx3b024442 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 28 Mar 2020 23:11:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9772FA2898; Sun, 29 Mar 2020 03:11:59 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 925A2AF790
	for <linux-audit@redhat.com>; Sun, 29 Mar 2020 03:11:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DDA78F7827
	for <linux-audit@redhat.com>; Sun, 29 Mar 2020 03:11:57 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-316-rxpGe_-gNF6k1xbXJ8rDvA-1; Sat, 28 Mar 2020 23:11:54 -0400
X-MC-Unique: rxpGe_-gNF6k1xbXJ8rDvA-1
Received: by mail-ed1-f66.google.com with SMTP id i16so15744692edy.11
	for <linux-audit@redhat.com>; Sat, 28 Mar 2020 20:11:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QCNJAUmnzDN9FZcZL525t31JITbaUoqdlbI+Ngrcb2Q=;
	b=TNrMEvHKOUDLXzb05toMUVOoevKUFWtxi9PfpPamueHKG48Epwxb3gtw3YyGqo6yD6
	a2pxk4L1C/akuRJqFmBe1DXaQ6Rv+MYLtD4+w9q1Vaaln26pTD5H/k8CeriKsddYNeJU
	64n/+tlXljbqmKL7SsX2ozKkw7mJoTTa+ECGPHwT/Yv8LmQjP8H7PFckZSuWcVfO7Jga
	JPtsOZgIDCYVHUULHczmDMUcG2qhfz/GGxppz2S8GzuAD3lZH9UX/5R7cCgEgals7alX
	Gx2eoRWBPABzZoOThAAPtR2vHeJb8mcqrTp0donGdybXqwwNMKqL52jzWdD9D65EXs+8
	wHRg==
X-Gm-Message-State: ANhLgQ1tDGfM7sCkfYBrMleovUGm+8TQF+/7mRIm00M4ZhCTTGiTWoNq
	tjVCjSj81Fk3dNiYGps7lkONQd+Sj9Sthxqpy5VD
X-Google-Smtp-Source: ADFU+vsO3z8fR85BdzrdW8wO5Ic5j66UK7NtBXWnojiKMj/pMltL8hW55ibXGgej7CzgWStIAOOuND+xZVVbglX1ybU=
X-Received: by 2002:a17:906:1993:: with SMTP id
	g19mr5774145ejd.70.1585451512568; 
	Sat, 28 Mar 2020 20:11:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200312193037.2tb5f53yeisfq4ta@madcap2.tricolour.ca>
	<CAHC9VhQoVOzy_b9W6h+kmizKr1rPkC4cy5aYoKT2i0ZgsceNDg@mail.gmail.com>
	<20200313185900.y44yvrfm4zxa5lfk@madcap2.tricolour.ca>
	<CAHC9VhR2zCCE5bjH75rSwfLC7TJGFj4RBnrtcOoUiqVp9q5TaA@mail.gmail.com>
	<20200318212630.mw2geg4ykhnbtr3k@madcap2.tricolour.ca>
	<CAHC9VhRYvGAru3aOMwWKCCWDktS+2pGr+=vV4SjHW_0yewD98A@mail.gmail.com>
	<20200318215550.es4stkjwnefrfen2@madcap2.tricolour.ca>
	<CAHC9VhSdDDP7Ec-w61NhGxZG5ZiekmrBCAg=Y=VJvEZcgQh46g@mail.gmail.com>
	<20200319220249.jyr6xmwvflya5mks@madcap2.tricolour.ca>
	<CAHC9VhR84aN72yNB_j61zZgrQV1y6yvrBLNY7jp7BqQiEDL+cw@mail.gmail.com>
	<20200324210152.5uydf3zqi3dwshfu@madcap2.tricolour.ca>
In-Reply-To: <20200324210152.5uydf3zqi3dwshfu@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Sat, 28 Mar 2020 23:11:41 -0400
Message-ID: <CAHC9VhTQUnVhoN3JXTAQ7ti+nNLfGNVXhT6D-GYJRSpJHCwDRg@mail.gmail.com>
Subject: Re: [PATCH ghak90 V8 07/16] audit: add contid support for signalling
	the audit daemon
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02T3Bx3b024442
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	linux-audit@redhat.com, netfilter-devel@vger.kernel.org,
	ebiederm@xmission.com, simo@redhat.com, netdev@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, mpatel@redhat.com,
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
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 24, 2020 at 5:02 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-03-23 20:16, Paul Moore wrote:
> > On Thu, Mar 19, 2020 at 6:03 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > On 2020-03-18 18:06, Paul Moore wrote:
> >
> > ...
> >
> > > > I hope we can do better than string manipulations in the kernel.  I'd
> > > > much rather defer generating the ACID list (if possible), than
> > > > generating a list only to keep copying and editing it as the record is
> > > > sent.
> > >
> > > At the moment we are stuck with a string-only format.
> >
> > Yes, we are.  That is another topic, and another set of changes I've
> > been deferring so as to not disrupt the audit container ID work.
> >
> > I was thinking of what we do inside the kernel between when the record
> > triggering event happens and when we actually emit the record to
> > userspace.  Perhaps we collect the ACID information while the event is
> > occurring, but we defer generating the record until later when we have
> > a better understanding of what should be included in the ACID list.
> > It is somewhat similar (but obviously different) to what we do for
> > PATH records (we collect the pathname info when the path is being
> > resolved).
>
> Ok, now I understand your concern.
>
> In the case of NETFILTER_PKT records, the CONTAINER_ID record is the
> only other possible record and they are generated at the same time with
> a local context.
>
> In the case of any event involving a syscall, that CONTAINER_ID record
> is generated at the time of the rest of the event record generation at
> syscall exit.
>
> The others are only generated when needed, such as the sig2 reply.
>
> We generally just store the contobj pointer until we actually generate
> the CONTAINER_ID (or CONTAINER_OP) record.

Perhaps I'm remembering your latest spin of these patches incorrectly,
but there is still a big gap between when the record is generated and
when it is sent up to the audit daemon.  Most importantly in that gap
is the whole big queue/multicast/unicast mess.

You don't need to show me code, but I would like to see some sort of
plan for dealing with multiple nested audit daemons.  Basically I just
want to make sure we aren't painting ourselves into a corner with this
approach; and if for some horrible reason we are, I at least want us
to be aware of what we are getting ourselves into.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

