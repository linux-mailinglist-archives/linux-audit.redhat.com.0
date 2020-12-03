Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1FB812CE264
	for <lists+linux-audit@lfdr.de>; Fri,  4 Dec 2020 00:11:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607037061;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Yflnz7/rz7NtAsSfxajAsRaesO/A29kcd4a8h5DUhVg=;
	b=cnFt9UmaTJNZQ1sgdGa8wiwdARFuKNBVo3nEip77sDDgrK7j0bcKyf1zjckcO6aAqxwQIT
	txfQhfoDIbKTHaUxDcylS3wixp60jinyKNoSqlc+9AwxvRPOBnjJuIz7DaI4rRGcHxZ/9x
	Rw2iMzMfBiNlFYh83RgYH78C02chOJQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224--t3L5p-lPee1TXucRBQUlw-1; Thu, 03 Dec 2020 18:10:56 -0500
X-MC-Unique: -t3L5p-lPee1TXucRBQUlw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1CAF107ACE3;
	Thu,  3 Dec 2020 23:10:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4585960BFA;
	Thu,  3 Dec 2020 23:10:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CDCE94A7C6;
	Thu,  3 Dec 2020 23:10:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B3NAHmd016140 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 18:10:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5FB8D5D6BA; Thu,  3 Dec 2020 23:10:17 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D8A915D6AC;
	Thu,  3 Dec 2020 23:10:05 +0000 (UTC)
Date: Thu, 3 Dec 2020 18:10:03 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v2] audit: report audit wait metric in audit status reply
Message-ID: <20201203231003.GK1762914@madcap2.tricolour.ca>
References: <20200701213244.GA1817@linux-kernel-dev>
	<CAHC9VhTctHCCrm4Q1cPdFX-6NXEtmjEPmw6rvUoxOq8UUmycxA@mail.gmail.com>
	<11647352.O9o76ZdvQC@x2>
	<CAHC9VhQzRP6Gyji83MEjQbdZxePLFn2Ai7Zo-Wd0D7MPqQ_Ekw@mail.gmail.com>
	<20201203123718.GK986374@madcap2.tricolour.ca>
	<CAHC9VhShyV7x552m01tkVyMqXQN1hrPRkE7ONJkmNWkFe2VqAQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhShyV7x552m01tkVyMqXQN1hrPRkE7ONJkmNWkFe2VqAQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020-12-03 10:37, Paul Moore wrote:
> On Thu, Dec 3, 2020 at 7:37 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> > On 2020-12-02 23:12, Paul Moore wrote:
> > > On Wed, Dec 2, 2020 at 10:52 PM Steve Grubb <sgrubb@redhat.com> wrote:
> > > > We need this FEATURE_BITMAP to do anything in userspace. Max's instinct was
> > > > right. Anything that changes the user space API needs to have a
> > > > FEATURE_BITMAP so that user space can do the right thing. The lack of this is
> > > > blocking acceptance of the pull request for the user space piece.
> > >
> > > I don't believe you need a new bitmap entry in this case, you should
> > > be able to examine the size of the reply from the AUDIT_GET request
> > > and make a determination from there.
> >
> > The danger I see is if another feature is added to the audit status and
> > that is backported to a distro rather than this one.  It would be
> > impossible to determine which feature it was from the size alone.
> > Keying off specific fields in the kernel should be able to do
> > this at build time if I understood correctly.
> 
> ...
> 
> On Thu, Dec 3, 2020 at 8:31 AM Steve Grubb <sgrubb@redhat.com> wrote:
> > For the upstream kernel, this may be the case. But in the world where people
> > backport patches, how do I know that the size is related to this patch and no
> > other?
> 
> We've discussed this in the past, and most of you should already know
> my answer to this, but I'll repeat my stance on this again.
> 
> My first priority is the upstream kernel, enterprise distribution
> kernels are secondary.  The upstream kernels do not generally backport
> features, backports are limited to fixes.  If an individual or a
> distribution decides to backport kernel features they are responsible
> for making things work; it is not upstream's responsibility to enable,
> or support, arbitrary combinations of patches.  Any assistance we
> provide here is "best effort" and not guaranteed.
> 
> Bringing this back to the case at hand, the feature bitmap is a
> limited resource and it is my opinion that we need to limit its use to
> only those features which can not be determined through other means;

So far there are only seven bits used out of 32, so it does not appear we are
in danger of running out anytime soon.

It was introduced with commit 0288d7183c41c0192d2963d44590f346f4aee917
	Author:     Richard Guy Briggs <rgb@redhat.com>
	AuthorDate: 2014-11-17 15:51:01 -0500
	Commit:     Paul Moore <pmoore@redhat.com>
	CommitDate: 2014-11-17 16:53:51 -0500
	("audit: convert status version to a feature bitmap")
It was introduced specifically to enable distributions to selectively
backport features.  It was converted away from AUDIT_VERSION.

There are other ways to detect the presence of backlog_wait_time_actual
as I mentioned above.

configure.ac already has these:
	AC_CHECK_DECLS([AUDIT_FEATURE_VERSION], [], [], [[#include <linux/audit.h>]])
	AC_CHECK_MEMBERS([struct audit_status.feature_bitmap], [], [], [[#include <linux/audit.h>]])
	AC_CHECK_DECLS([AUDIT_VERSION_BACKLOG_WAIT_TIME], [], [], [[#include <linux/audit.h>]])
	AC_CHECK_DECLS([AUDIT_STATUS_BACKLOG_WAIT_TIME], [], [], [[#include <linux/audit.h>]])

Max' userspace patch already has provisions to check for the existance of the
macro AUDIT_STATUS_BACKLOG_WAIT_TIME_ACTUAL, so while it doesn't actually check
for the struct audit_status member backlog_wait_time_actual, it does check
something that should only be present if that member is present, so I believe
we are fine as it currently stands.  If you want to be really paranoid, then
add a check for HAVE_STRUCT_AUDIT_STATUS_BACKLOG_WAIT_TIME_ACTUAL with:

	AC_CHECK_MEMBERS([struct audit_status.backlog_wait_time_actual], [], [], [[#include <linux/audit.h>]])


Don't look at audit_set_feature() since it has an outstanding issue
filed against it to untangle the unfortunately named FEATURE_VERSION vs
FEATURE_BITMAP.
	https://github.com/linux-audit/audit-userspace/issues/10

> in this case this feature can be determine by the size of the
> AUDIT_GET reply buffer (the audit_status struct).  Of course if more
> care and thought had been put into the audit kernel/userspace API in
> the first place we would not be in this situation, but we are and we
> need to deal with it as best we can.
> 
> paul moore

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

