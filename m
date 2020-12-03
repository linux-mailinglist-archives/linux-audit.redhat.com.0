Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id B6A962CE2D6
	for <lists+linux-audit@lfdr.de>; Fri,  4 Dec 2020 00:44:13 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324--s6jlwIIN3qss0aNB_sEZQ-1; Thu, 03 Dec 2020 18:44:11 -0500
X-MC-Unique: -s6jlwIIN3qss0aNB_sEZQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D843E425C8;
	Thu,  3 Dec 2020 23:44:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B9BA60854;
	Thu,  3 Dec 2020 23:44:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4FA89180954D;
	Thu,  3 Dec 2020 23:44:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B3Nhddw018807 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 18:43:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 65FD82027144; Thu,  3 Dec 2020 23:43:39 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60C36202717E
	for <linux-audit@redhat.com>; Thu,  3 Dec 2020 23:43:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28F1B858EEC
	for <linux-audit@redhat.com>; Thu,  3 Dec 2020 23:43:37 +0000 (UTC)
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
	[209.85.218.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-491-XXKtV6tUNByCCh0g-lwb_w-1; Thu, 03 Dec 2020 18:43:24 -0500
X-MC-Unique: XXKtV6tUNByCCh0g-lwb_w-1
Received: by mail-ej1-f67.google.com with SMTP id lt17so6115838ejb.3
	for <linux-audit@redhat.com>; Thu, 03 Dec 2020 15:43:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=A02/3vc3a3bnDKbXrNRFquCVF15JsSACzg3ZKBCjbPg=;
	b=gl4Rtb5HKOny+qDp5EPSDNK9JSr5XPHOkGS5AoxFhMPnWF5h+V5BM+GDz8/CerWLxX
	3zpWaicCT7NRJ0L3mg3lUBWhwdc6xQmF+J8+/eBykvGjei8fJziif4kFv3wb1ajBLBj9
	zyhspkH0vDB+d57l74vq1VqRS1UwEUGo/LbwAgXv5lPOQxl2OcuXi8J//LBfQRJdV0tr
	sy8LRZbLhN5TW5UxjEPNhTVuK/v3YAJgGHd11419s88Gs8xIUhblyMVVXby8fjxFd61d
	YpdvTc7HHu+dkCrAcqixX0vRsOEpWonlbq3Ya75jvNH9g4BXBSsAlPvRLZnW7MHkVC7W
	V8jg==
X-Gm-Message-State: AOAM533xdEnlfpUCPyqld6JrD0H7FJKD3d8E+lXa7FgJ9ciI2pNH6cYO
	s19gXwlgvRIBH6jenVMCJjQkUbtM6xm2uJTRzEDl
X-Google-Smtp-Source: ABdhPJyzZEx05QrGL61E+/VjMtxV6hiRCkxJMuQeVPyk0wIsY3pzkCq7L1fuyrUjQI2xQLsceW9WoMesO8oIONWqTWw=
X-Received: by 2002:a17:906:c096:: with SMTP id
	f22mr4576615ejz.488.1607039002684; 
	Thu, 03 Dec 2020 15:43:22 -0800 (PST)
MIME-Version: 1.0
References: <20200701213244.GA1817@linux-kernel-dev>
	<CAHC9VhTctHCCrm4Q1cPdFX-6NXEtmjEPmw6rvUoxOq8UUmycxA@mail.gmail.com>
	<11647352.O9o76ZdvQC@x2>
	<CAHC9VhQzRP6Gyji83MEjQbdZxePLFn2Ai7Zo-Wd0D7MPqQ_Ekw@mail.gmail.com>
	<20201203123718.GK986374@madcap2.tricolour.ca>
	<CAHC9VhShyV7x552m01tkVyMqXQN1hrPRkE7ONJkmNWkFe2VqAQ@mail.gmail.com>
	<20201203231003.GK1762914@madcap2.tricolour.ca>
In-Reply-To: <20201203231003.GK1762914@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 3 Dec 2020 18:43:11 -0500
Message-ID: <CAHC9VhR91u2VKy3RwxB4_bs3GdZupyq6oWKg5hPvacssc6tuOQ@mail.gmail.com>
Subject: Re: [PATCH v2] audit: report audit wait metric in audit status reply
To: Richard Guy Briggs <rgb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 3, 2020 at 6:10 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-12-03 10:37, Paul Moore wrote:
> > On Thu, Dec 3, 2020 at 7:37 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > On 2020-12-02 23:12, Paul Moore wrote:
> > > > On Wed, Dec 2, 2020 at 10:52 PM Steve Grubb <sgrubb@redhat.com> wrote:
> > > > > We need this FEATURE_BITMAP to do anything in userspace. Max's instinct was
> > > > > right. Anything that changes the user space API needs to have a
> > > > > FEATURE_BITMAP so that user space can do the right thing. The lack of this is
> > > > > blocking acceptance of the pull request for the user space piece.
> > > >
> > > > I don't believe you need a new bitmap entry in this case, you should
> > > > be able to examine the size of the reply from the AUDIT_GET request
> > > > and make a determination from there.
> > >
> > > The danger I see is if another feature is added to the audit status and
> > > that is backported to a distro rather than this one.  It would be
> > > impossible to determine which feature it was from the size alone.
> > > Keying off specific fields in the kernel should be able to do
> > > this at build time if I understood correctly.
> >
> > ...
> >
> > On Thu, Dec 3, 2020 at 8:31 AM Steve Grubb <sgrubb@redhat.com> wrote:
> > > For the upstream kernel, this may be the case. But in the world where people
> > > backport patches, how do I know that the size is related to this patch and no
> > > other?
> >
> > We've discussed this in the past, and most of you should already know
> > my answer to this, but I'll repeat my stance on this again.
> >
> > My first priority is the upstream kernel, enterprise distribution
> > kernels are secondary.  The upstream kernels do not generally backport
> > features, backports are limited to fixes.  If an individual or a
> > distribution decides to backport kernel features they are responsible
> > for making things work; it is not upstream's responsibility to enable,
> > or support, arbitrary combinations of patches.  Any assistance we
> > provide here is "best effort" and not guaranteed.
> >
> > Bringing this back to the case at hand, the feature bitmap is a
> > limited resource and it is my opinion that we need to limit its use to
> > only those features which can not be determined through other means;
>
> So far there are only seven bits used out of 32, so it does not appear we are
> in danger of running out anytime soon.
>
> It was introduced with commit 0288d7183c41c0192d2963d44590f346f4aee917
>         Author:     Richard Guy Briggs <rgb@redhat.com>
>         AuthorDate: 2014-11-17 15:51:01 -0500
>         Commit:     Paul Moore <pmoore@redhat.com>
>         CommitDate: 2014-11-17 16:53:51 -0500
>         ("audit: convert status version to a feature bitmap")
> It was introduced specifically to enable distributions to selectively
> backport features.  It was converted away from AUDIT_VERSION.
>
> There are other ways to detect the presence of backlog_wait_time_actual
> as I mentioned above.

Let me be blunt - I honestly don't care what Steve's audit userspace
does to detect this.  I've got my own opinion, but Steve's audit
userspace is not my project to manage and I think we've established
over the years that Steve and I have very different views on what
constitutes good design.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

