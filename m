Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id C38FE261207
	for <lists+linux-audit@lfdr.de>; Tue,  8 Sep 2020 15:35:42 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-yZvMZF2DPye_gWjOTQf8zw-1; Tue, 08 Sep 2020 09:35:39 -0400
X-MC-Unique: yZvMZF2DPye_gWjOTQf8zw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1A9B801AE4;
	Tue,  8 Sep 2020 13:35:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF2F260DA0;
	Tue,  8 Sep 2020 13:35:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B54F77A002;
	Tue,  8 Sep 2020 13:35:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 088DZMiD022384 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 8 Sep 2020 09:35:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 259E5110E9A0; Tue,  8 Sep 2020 13:35:22 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A730110E9A3
	for <linux-audit@redhat.com>; Tue,  8 Sep 2020 13:35:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC69D811E82
	for <linux-audit@redhat.com>; Tue,  8 Sep 2020 13:35:19 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-39-XiINYxIpPYWrwAc5NNq2Bw-1; Tue, 08 Sep 2020 09:35:17 -0400
X-MC-Unique: XiINYxIpPYWrwAc5NNq2Bw-1
Received: by mail-ot1-f68.google.com with SMTP id c10so14821001otm.13
	for <linux-audit@redhat.com>; Tue, 08 Sep 2020 06:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gar4BreDCQ/72P6bchhSRHNsc6Zc5dSSb5ZIWUFYbnU=;
	b=OpcH2Sj8DZEuSYVFluYnV55AoQy4sHNU9L+qSaX+oUXhAXzu2c7i2NBmUnGTMTOEe4
	sG4g4pw4+v+83iCoMjv+Pq/ftLrLlV6Q6LLUpop0GnZroqFbvVg2U76FhpsFJ5e4MouP
	kmRjo+Adzuz52HTawBl5cJ1zFbxp4XD7x4PjQSkP7E3Y4DQA3895SImD43Gl/k8+wDPy
	tDHYk1Vufuuz9M0KFEukY9vJRrFZ0jFzXMR2mZNW4cnfeFYkYtgdKPScVJzQBNXLH7VR
	qUUeJBqFLWHJ+ZfGMAPMKEkkJ4ksbZj5NMIB3DMNs3o1goKGTCcfme9/mlgBfzP8LPBz
	jTqQ==
X-Gm-Message-State: AOAM531Sx6Q/6mPf3nTKJg1th2cZ0MFJ8E9hbb703Xd4Lb6BRzs+lyi6
	dBwHWZUXXyqjmukEKm+r95vhsDaiPSU97XJoVWU=
X-Google-Smtp-Source: ABdhPJyWhiQ0vShLlXuCv5fr448BVDeWmqjkRs6wxP3IGO8/JwS7/Gyogf/s6MDSZT/XRrzVYfRpZoeMQH4wTkN0STE=
X-Received: by 2002:a9d:185:: with SMTP id e5mr18471022ote.135.1599572116933; 
	Tue, 08 Sep 2020 06:35:16 -0700 (PDT)
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
In-Reply-To: <CAEjxPJ7i5Ruy=NZ+sq3qCm8ux+sZXY5+XX_zJu3+OqFq3d_SLQ@mail.gmail.com>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Tue, 8 Sep 2020 09:35:05 -0400
Message-ID: <CAEjxPJ5KudgTjhmXBNdCO_ctvioy5UA5PXcoKX4zc19NYKgHZA@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Sep 7, 2020 at 9:28 PM Stephen Smalley
<stephen.smalley.work@gmail.com> wrote:
>
> On Sat, Sep 5, 2020 at 3:07 PM John Johansen
> <john.johansen@canonical.com> wrote:
> >
> > On 9/5/20 11:13 AM, Casey Schaufler wrote:
> > > On 9/5/2020 6:25 AM, Paul Moore wrote:
> > >> On Fri, Sep 4, 2020 at 7:58 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> > >>> On 9/4/2020 2:53 PM, Paul Moore wrote:
> > >>>> On Fri, Sep 4, 2020 at 5:35 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> > >>>>> On 9/4/2020 1:08 PM, Paul Moore wrote:
> > >> ...
> > >>
> > >>>> I understand the concerns you mention, they are all valid as far as
> > >>>> I'm concerned, but I think we are going to get burned by this code as
> > >>>> it currently stands.
> > >>> Yes, I can see that. We're getting burned by the non-extensibility
> > >>> of secids. It will take someone smarter than me to figure out how to
> > >>> fit N secids into 32bits without danger of either failure or memory
> > >>> allocation.
> > >> Sooo what are the next steps here?  It sounds like there is some
> > >> agreement that the currently proposed unix_skb_params approach is a
> > >> problem, but it also sounds like you just want to merge it anyway?
> > >
> > > There are real problems with all the approaches. This is by far the
> > > least invasive of the lot. If this is acceptable for now I will commit
> > > to including the dynamic allocation version in the full stacking
> > > (e.g. Smack + SELinux) stage. If it isn't, well, this stage is going
> > > to take even longer than it already has. Sigh.
> > >
> > >
> > >> I was sorta hoping for something a bit better.
> > >
> > > I will be looking at alternatives. I am very much open to suggestions.
> > > I'm not even 100% convinced that Stephen's objections to my separate
> > > allocation strategy outweigh its advantages. If you have an opinion on
> > > that, I'd love to hear it.
> > >
> >
> > fwiw I prefer the separate allocation strategy, but as you have already
> > said it trading off one set of problems for another. I would rather see
> > this move forward and one set of trade offs isn't significantly worse
> > than the other to me so, either wfm.
>
> I remain unclear that AppArmor needs this patch at all even when
> support for SO_PEERSEC lands.
> Contrary to the patch description, it is about supporting SCM_SECURITY
> for datagram not SO_PEERSEC.  And I don't know of any actual users of
> SCM_SECURITY even for SELinux, just SO_PEERSEC.

I remembered that systemd once tried using SCM_SECURITY but that was a
bug since systemd was using it with stream sockets and that wasn't
supported by the kernel at the time,
https://bugzilla.redhat.com/show_bug.cgi?id=1224211, so systemd
switched over to using SO_PEERSEC.  Subsequently I did fix
SCM_SECURITY to work with stream sockets via kernel commit
37a9a8df8ce9de6ea73349c9ac8bdf6ba4ec4f70 but SO_PEERSEC is still
preferred.  Looking around, I see that there is still one usage of
SCM_SECURITY in systemd-journald but it doesn't seem to be required
(if provided, journald will pass the label along but nothing seems to
depend on it AFAICT).  In any event, I don't believe this patch is
needed to support stacking AppArmor.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

