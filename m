Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 88C52262F0D
	for <lists+linux-audit@lfdr.de>; Wed,  9 Sep 2020 15:21:20 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-abQOEaxcMlO0JL_3_W3Qiw-1; Wed, 09 Sep 2020 09:21:17 -0400
X-MC-Unique: abQOEaxcMlO0JL_3_W3Qiw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA0F4801FD7;
	Wed,  9 Sep 2020 13:21:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04C0027BCD;
	Wed,  9 Sep 2020 13:21:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 874A71826D2A;
	Wed,  9 Sep 2020 13:21:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 089DKsB4006793 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 9 Sep 2020 09:20:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D29082166BA4; Wed,  9 Sep 2020 13:20:54 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB98D2166B44
	for <linux-audit@redhat.com>; Wed,  9 Sep 2020 13:20:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D202811E76
	for <linux-audit@redhat.com>; Wed,  9 Sep 2020 13:20:52 +0000 (UTC)
Received: from mail-oo1-f67.google.com (mail-oo1-f67.google.com
	[209.85.161.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-488-xmT3TnI2MbaelSn1A1an_A-1; Wed, 09 Sep 2020 09:20:50 -0400
X-MC-Unique: xmT3TnI2MbaelSn1A1an_A-1
Received: by mail-oo1-f67.google.com with SMTP id z1so564567ooj.3
	for <linux-audit@redhat.com>; Wed, 09 Sep 2020 06:20:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=63PSCFxVUgf9cFtZOFDppeprHasPYk7KVkEdZRn0bLw=;
	b=pLmAikmGf58PxhJF3yG87qxjn8wh0Pkwcana7MkK2jHv4YhAeCSjj1FM6kzszxOhnQ
	x8GvdWzyCLCJxCUD7Li3Z7kWRgu3rEhnPVkJg3xWYIJi0jXI2lyxOfPcnzyLVovscZJX
	vwqsINKOFZe2xNhvi2x4qRRz5MC63DelWOfNbaoCUtra1uVjnsBW49SYEbDpxHfeKqao
	7us+BfWJCj4IR74oZ0ctVBLp/CC0uEfB2sLdheXLbvyLW++s1RwlT0wPvBYO1xLCTn/p
	JlwdfCQSRxSZB0WMfxAWjqxSsITMhPilWtbdA7LrbmThHMr8z8OLrILv/yaqB22J3E22
	24XQ==
X-Gm-Message-State: AOAM530WJGgTbG5DlAWhANDBWhEqUoy9dnqji0Y9QG4mZYGjVvwB5WpX
	nq/SPOUDcnt5Z5oxI9AWwbYDTTNvqBMJLKs22UM=
X-Google-Smtp-Source: ABdhPJzbXO7IXxWz8rasFqinds+vOSPYPPdDjmRVyVts6q7FAYoa/eJ4UHjV7ccel0e9l/ol8uS94rdkvmvRdOniqjg=
X-Received: by 2002:a4a:c541:: with SMTP id j1mr763455ooq.13.1599657649486;
	Wed, 09 Sep 2020 06:20:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200826145247.10029-1-casey@schaufler-ca.com>
	<20200826145247.10029-6-casey@schaufler-ca.com>
	<CAHC9VhSh=r4w_3mZOUwmKN0UxCMxPNGKd=_vr_iGV06rvCNbSA@mail.gmail.com>
	<1eeef766-405f-3800-c0cf-3eb008f9673e@schaufler-ca.com>
	<CAHC9VhSf8RWUnRPYLR6LLzbn-cvNg8J0wnZGwTOAe=dOqkvd0g@mail.gmail.com>
	<ef6a049a-c6b9-370b-c521-4594aa73e403@schaufler-ca.com>
	<CAHC9VhSu4qqKWsutm3=GF_pihUKpwjAtc9gAhfjGsGtKfz-Azw@mail.gmail.com>
	<585600d7-70fb-0982-1e6b-ffd7b7c33e32@schaufler-ca.com>
	<9a58d14c-eaff-3acf-4689-925cf08ba406@canonical.com>
	<CAEjxPJ7i5Ruy=NZ+sq3qCm8ux+sZXY5+XX_zJu3+OqFq3d_SLQ@mail.gmail.com>
	<CAEjxPJ5KudgTjhmXBNdCO_ctvioy5UA5PXcoKX4zc19NYKgHZA@mail.gmail.com>
	<c5bef71e-6d78-2058-bcaa-8497c76d7375@schaufler-ca.com>
	<b320f0f6-02db-95a5-acc5-cadd5dbb57dc@canonical.com>
In-Reply-To: <b320f0f6-02db-95a5-acc5-cadd5dbb57dc@canonical.com>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Wed, 9 Sep 2020 09:19:40 -0400
Message-ID: <CAEjxPJ6wFJz935RR_1u+-EjAw3VMv4nabo-Za_OqkZGJuNS5Sg@mail.gmail.com>
Subject: Re: [PATCH v20 05/23] net: Prepare UDS for security module stacking
To: John Johansen <john.johansen@canonical.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: SElinux list <selinux@vger.kernel.org>, James Morris <jmorris@namei.org>,
	Casey Schaufler <casey.schaufler@intel.com>,
	LSM List <linux-security-module@vger.kernel.org>,
	linux-audit@redhat.com, Stephen Smalley <sds@tycho.nsa.gov>
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Sep 8, 2020 at 8:21 PM John Johansen
<john.johansen@canonical.com> wrote:
>
> On 9/8/20 4:37 PM, Casey Schaufler wrote:
> > On 9/8/2020 6:35 AM, Stephen Smalley wrote:
> >> On Mon, Sep 7, 2020 at 9:28 PM Stephen Smalley
> >> <stephen.smalley.work@gmail.com> wrote:
> >>> On Sat, Sep 5, 2020 at 3:07 PM John Johansen
> >>> <john.johansen@canonical.com> wrote:
> >>>> On 9/5/20 11:13 AM, Casey Schaufler wrote:
> >>>>> On 9/5/2020 6:25 AM, Paul Moore wrote:
> >>>>>> On Fri, Sep 4, 2020 at 7:58 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> >>>>>>> On 9/4/2020 2:53 PM, Paul Moore wrote:
> >>>>>>>> On Fri, Sep 4, 2020 at 5:35 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> >>>>>>>>> On 9/4/2020 1:08 PM, Paul Moore wrote:
> >>>>>> ...
> >>>>>>
> >>>>>>>> I understand the concerns you mention, they are all valid as far as
> >>>>>>>> I'm concerned, but I think we are going to get burned by this code as
> >>>>>>>> it currently stands.
> >>>>>>> Yes, I can see that. We're getting burned by the non-extensibility
> >>>>>>> of secids. It will take someone smarter than me to figure out how to
> >>>>>>> fit N secids into 32bits without danger of either failure or memory
> >>>>>>> allocation.
> >>>>>> Sooo what are the next steps here?  It sounds like there is some
> >>>>>> agreement that the currently proposed unix_skb_params approach is a
> >>>>>> problem, but it also sounds like you just want to merge it anyway?
> >>>>> There are real problems with all the approaches. This is by far the
> >>>>> least invasive of the lot. If this is acceptable for now I will commit
> >>>>> to including the dynamic allocation version in the full stacking
> >>>>> (e.g. Smack + SELinux) stage. If it isn't, well, this stage is going
> >>>>> to take even longer than it already has. Sigh.
> >>>>>
> >>>>>
> >>>>>> I was sorta hoping for something a bit better.
> >>>>> I will be looking at alternatives. I am very much open to suggestions.
> >>>>> I'm not even 100% convinced that Stephen's objections to my separate
> >>>>> allocation strategy outweigh its advantages. If you have an opinion on
> >>>>> that, I'd love to hear it.
> >>>>>
> >>>> fwiw I prefer the separate allocation strategy, but as you have already
> >>>> said it trading off one set of problems for another. I would rather see
> >>>> this move forward and one set of trade offs isn't significantly worse
> >>>> than the other to me so, either wfm.
> >>> I remain unclear that AppArmor needs this patch at all even when
> >>> support for SO_PEERSEC lands.
> >>> Contrary to the patch description, it is about supporting SCM_SECURITY
> >>> for datagram not SO_PEERSEC.  And I don't know of any actual users of
> >>> SCM_SECURITY even for SELinux, just SO_PEERSEC.
> >> I remembered that systemd once tried using SCM_SECURITY but that was a
> >> bug since systemd was using it with stream sockets and that wasn't
> >> supported by the kernel at the time,
> >> https://bugzilla.redhat.com/show_bug.cgi?id=1224211, so systemd
> >> switched over to using SO_PEERSEC.  Subsequently I did fix
> >> SCM_SECURITY to work with stream sockets via kernel commit
> >> 37a9a8df8ce9de6ea73349c9ac8bdf6ba4ec4f70 but SO_PEERSEC is still
> >> preferred.  Looking around, I see that there is still one usage of
> >> SCM_SECURITY in systemd-journald but it doesn't seem to be required
> >> (if provided, journald will pass the label along but nothing seems to
> >> depend on it AFAICT).  In any event, I don't believe this patch is
> >> needed to support stacking AppArmor.
> >
> > Stephen is, as is so often the case, correct. AppArmor has a stub
> > socket_getpeersec_dgram() that gets removed in patch 23. If I remove
>
> right but as I said before this is coming, I have been playing with
> it and have code. So the series doesn't need it today but sooner than
> later it will be needed

I don't understand why.  Is there a userspace component that relies on
SCM_SECURITY today for anything real (more than just blindly passing
it along and maybe writing to a log somewhere)?  And this doesn't
provide support for a composite SCM_SECURITY or SCM_CONTEXT, so it
doesn't really solve the stacking problem for it anyway.  What am I
missing?  Why do you care about this patch?

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

