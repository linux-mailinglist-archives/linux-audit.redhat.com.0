Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 916AE2CDA32
	for <lists+linux-audit@lfdr.de>; Thu,  3 Dec 2020 16:38:36 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-K9z_BPqmOSmGwk7lK6Sclw-1; Thu, 03 Dec 2020 10:38:33 -0500
X-MC-Unique: K9z_BPqmOSmGwk7lK6Sclw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1E1110054FF;
	Thu,  3 Dec 2020 15:38:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6FBB5D6D7;
	Thu,  3 Dec 2020 15:38:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1CC8D4BB40;
	Thu,  3 Dec 2020 15:38:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B3FbsUf025530 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 10:37:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 773AC202717E; Thu,  3 Dec 2020 15:37:54 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C09B2027179
	for <linux-audit@redhat.com>; Thu,  3 Dec 2020 15:37:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4482185A794
	for <linux-audit@redhat.com>; Thu,  3 Dec 2020 15:37:49 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
	[209.85.218.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-547-7PWLnbllNLusdXZMK28onw-1; Thu, 03 Dec 2020 10:37:47 -0500
X-MC-Unique: 7PWLnbllNLusdXZMK28onw-1
Received: by mail-ej1-f65.google.com with SMTP id 7so4145357ejm.0
	for <linux-audit@redhat.com>; Thu, 03 Dec 2020 07:37:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kBV94ZfZ/TPHwrGjGXqES2IwWedpdr/0XKYqgJJVtrU=;
	b=k8CzztM4IMwjtKGBxGlZPYi7yck9CDLxAb4I7qbl+SvqaMpaxpQb5TlHQS0tFeTXIR
	FYV4dlzLTD0GwFhXNgCB8c/5vPzDldpHXvfnS/Npky+XrSV0WVSDxn9+CkNbDmP/ae89
	a1lObM8TKZ05gRi4T0yzKVUdmafDiCPxDOFVJgiHiwQl1cqSE6m/9IjnRZzZxGlchLDk
	BivYbaa0k+bmlSok8inFs2ylfwvVBVboDIlF1eRzGAANSsrdR6aKoUeaz4HcyP5hWvfq
	dlYDQ2uAcBznsHKUJKEP1O+BbeBZTSGRm+27U10t8x10e5AK72e/3mn6xTMcqfCRahuL
	CIrQ==
X-Gm-Message-State: AOAM533/p4agGkR+ITGKIYEpgSBba7nwRyT6xMNKJiwfThBImRjJzwr3
	Jz/9fdpSRqyk9I1VFrkZOfhwto6sSYveoF0Or8fB
X-Google-Smtp-Source: ABdhPJyHUDh2m9AUnE/sTHxJE1wkrXdqgKQM6bXynJt/6SiNkxdWFv6i5L2pwbpKkE7d17MiRnxuM4+nNx4Efv7AvkU=
X-Received: by 2002:a17:906:c096:: with SMTP id
	f22mr2938380ejz.488.1607009866148; 
	Thu, 03 Dec 2020 07:37:46 -0800 (PST)
MIME-Version: 1.0
References: <20200701213244.GA1817@linux-kernel-dev>
	<CAHC9VhTctHCCrm4Q1cPdFX-6NXEtmjEPmw6rvUoxOq8UUmycxA@mail.gmail.com>
	<11647352.O9o76ZdvQC@x2>
	<CAHC9VhQzRP6Gyji83MEjQbdZxePLFn2Ai7Zo-Wd0D7MPqQ_Ekw@mail.gmail.com>
	<20201203123718.GK986374@madcap2.tricolour.ca>
In-Reply-To: <20201203123718.GK986374@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 3 Dec 2020 10:37:35 -0500
Message-ID: <CAHC9VhShyV7x552m01tkVyMqXQN1hrPRkE7ONJkmNWkFe2VqAQ@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 3, 2020 at 7:37 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-12-02 23:12, Paul Moore wrote:
> > On Wed, Dec 2, 2020 at 10:52 PM Steve Grubb <sgrubb@redhat.com> wrote:
> > > We need this FEATURE_BITMAP to do anything in userspace. Max's instinct was
> > > right. Anything that changes the user space API needs to have a
> > > FEATURE_BITMAP so that user space can do the right thing. The lack of this is
> > > blocking acceptance of the pull request for the user space piece.
> >
> > I don't believe you need a new bitmap entry in this case, you should
> > be able to examine the size of the reply from the AUDIT_GET request
> > and make a determination from there.
>
> The danger I see is if another feature is added to the audit status and
> that is backported to a distro rather than this one.  It would be
> impossible to determine which feature it was from the size alone.
> Keying off specific fields in the kernel should be able to do
> this at build time if I understood correctly.

...

On Thu, Dec 3, 2020 at 8:31 AM Steve Grubb <sgrubb@redhat.com> wrote:
> For the upstream kernel, this may be the case. But in the world where people
> backport patches, how do I know that the size is related to this patch and no
> other?

We've discussed this in the past, and most of you should already know
my answer to this, but I'll repeat my stance on this again.

My first priority is the upstream kernel, enterprise distribution
kernels are secondary.  The upstream kernels do not generally backport
features, backports are limited to fixes.  If an individual or a
distribution decides to backport kernel features they are responsible
for making things work; it is not upstream's responsibility to enable,
or support, arbitrary combinations of patches.  Any assistance we
provide here is "best effort" and not guaranteed.

Bringing this back to the case at hand, the feature bitmap is a
limited resource and it is my opinion that we need to limit its use to
only those features which can not be determined through other means;
in this case this feature can be determine by the size of the
AUDIT_GET reply buffer (the audit_status struct).  Of course if more
care and thought had been put into the audit kernel/userspace API in
the first place we would not be in this situation, but we are and we
need to deal with it as best we can.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

