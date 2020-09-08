Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 471D026080E
	for <lists+linux-audit@lfdr.de>; Tue,  8 Sep 2020 03:29:49 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-emlT4mulPmGFJ_wIk946gQ-1; Mon, 07 Sep 2020 21:29:46 -0400
X-MC-Unique: emlT4mulPmGFJ_wIk946gQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5ABC618B9ED9;
	Tue,  8 Sep 2020 01:29:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F10A060C0F;
	Tue,  8 Sep 2020 01:29:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 29E91181A06B;
	Tue,  8 Sep 2020 01:29:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0881TBuc029280 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 7 Sep 2020 21:29:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2E56A8A4D8; Tue,  8 Sep 2020 01:29:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A0EB2EF8E
	for <linux-audit@redhat.com>; Tue,  8 Sep 2020 01:29:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFB13811E78
	for <linux-audit@redhat.com>; Tue,  8 Sep 2020 01:29:07 +0000 (UTC)
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-384-FPMdpLrpPyaudiWmLLcEHQ-1; Mon, 07 Sep 2020 21:29:04 -0400
X-MC-Unique: FPMdpLrpPyaudiWmLLcEHQ-1
Received: by mail-oi1-f194.google.com with SMTP id 11so6678948oiq.6
	for <linux-audit@redhat.com>; Mon, 07 Sep 2020 18:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3ds7NBB5D8yNeSFpML1Am6nIqrtrtVTsNXCIDzWTSpI=;
	b=VwsnEhSoWN4ZboXkqTA0WYw6WrOYOxJc4koZwTXlDe6YxWHSX79Drzs7NZLobOqW3/
	62IUszp8vJGn/v86DQn/otJQ5ERNURaaUvJsfxJAcwWm3C9yFZ8rIV/eBp+6RNL/2WLn
	V9D4BLV29jX2NlweoNTlWwkslkm7HCBPrWkvgc6FjDIYiwMCRpqMTdERF/bHdaVyY4m5
	MYG8MKpQdhjHWhvPDBVOT5fTlgrtwF2L0fKTYnpSRST+/S88cyrkMWVZy7jzc7kEmvGH
	6UXUkIw3PpjYkeQE7yRrWbOd5AnJsFZT7SD309RRouSSsBTLR32OdNFgY8AiJ0jYm1zE
	F9eA==
X-Gm-Message-State: AOAM531970BikcZLqYLhMRZwD0KCvCC8REPkJGaqTrXir4IE7CAIGOL8
	cmDaQzbKA/h9mZ9UlbNw5XI7L9zZY6F/ZU9qi4w=
X-Google-Smtp-Source: ABdhPJxiNwbBIzk86VbxsQS0ccfWr2VIdmSp3TwKoSS/frmmsoNKpzEp61FnarhD2g5NIXET4J3qx0lCGIUsG5c5Xx0=
X-Received: by 2002:a54:4f9b:: with SMTP id g27mr1260255oiy.140.1599528542891; 
	Mon, 07 Sep 2020 18:29:02 -0700 (PDT)
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
In-Reply-To: <9a58d14c-eaff-3acf-4689-925cf08ba406@canonical.com>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Mon, 7 Sep 2020 21:28:51 -0400
Message-ID: <CAEjxPJ7i5Ruy=NZ+sq3qCm8ux+sZXY5+XX_zJu3+OqFq3d_SLQ@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Sep 5, 2020 at 3:07 PM John Johansen
<john.johansen@canonical.com> wrote:
>
> On 9/5/20 11:13 AM, Casey Schaufler wrote:
> > On 9/5/2020 6:25 AM, Paul Moore wrote:
> >> On Fri, Sep 4, 2020 at 7:58 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> >>> On 9/4/2020 2:53 PM, Paul Moore wrote:
> >>>> On Fri, Sep 4, 2020 at 5:35 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> >>>>> On 9/4/2020 1:08 PM, Paul Moore wrote:
> >> ...
> >>
> >>>> I understand the concerns you mention, they are all valid as far as
> >>>> I'm concerned, but I think we are going to get burned by this code as
> >>>> it currently stands.
> >>> Yes, I can see that. We're getting burned by the non-extensibility
> >>> of secids. It will take someone smarter than me to figure out how to
> >>> fit N secids into 32bits without danger of either failure or memory
> >>> allocation.
> >> Sooo what are the next steps here?  It sounds like there is some
> >> agreement that the currently proposed unix_skb_params approach is a
> >> problem, but it also sounds like you just want to merge it anyway?
> >
> > There are real problems with all the approaches. This is by far the
> > least invasive of the lot. If this is acceptable for now I will commit
> > to including the dynamic allocation version in the full stacking
> > (e.g. Smack + SELinux) stage. If it isn't, well, this stage is going
> > to take even longer than it already has. Sigh.
> >
> >
> >> I was sorta hoping for something a bit better.
> >
> > I will be looking at alternatives. I am very much open to suggestions.
> > I'm not even 100% convinced that Stephen's objections to my separate
> > allocation strategy outweigh its advantages. If you have an opinion on
> > that, I'd love to hear it.
> >
>
> fwiw I prefer the separate allocation strategy, but as you have already
> said it trading off one set of problems for another. I would rather see
> this move forward and one set of trade offs isn't significantly worse
> than the other to me so, either wfm.

I remain unclear that AppArmor needs this patch at all even when
support for SO_PEERSEC lands.
Contrary to the patch description, it is about supporting SCM_SECURITY
for datagram not SO_PEERSEC.  And I don't know of any actual users of
SCM_SECURITY even for SELinux, just SO_PEERSEC.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

