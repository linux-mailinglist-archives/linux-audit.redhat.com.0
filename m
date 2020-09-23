Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id B18BC275F1A
	for <lists+linux-audit@lfdr.de>; Wed, 23 Sep 2020 19:48:17 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-c_h3cNYtM5y-5CGbbHYOnw-1; Wed, 23 Sep 2020 13:48:14 -0400
X-MC-Unique: c_h3cNYtM5y-5CGbbHYOnw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FE51800135;
	Wed, 23 Sep 2020 17:48:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D51A73682;
	Wed, 23 Sep 2020 17:48:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4788818095FF;
	Wed, 23 Sep 2020 17:48:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08NHluub014915 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 23 Sep 2020 13:47:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B44312166B28; Wed, 23 Sep 2020 17:47:56 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF3CA2166B27
	for <linux-audit@redhat.com>; Wed, 23 Sep 2020 17:47:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C62B280351B
	for <linux-audit@redhat.com>; Wed, 23 Sep 2020 17:47:53 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
	[209.85.218.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-486-PSvaIeqpPV6gCKlQgK8QFQ-1; Wed, 23 Sep 2020 13:47:51 -0400
X-MC-Unique: PSvaIeqpPV6gCKlQgK8QFQ-1
Received: by mail-ej1-f66.google.com with SMTP id o8so776110ejb.10
	for <linux-audit@redhat.com>; Wed, 23 Sep 2020 10:47:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bUS2UZxRGpO2YaOW6upGWdToFOcqQ6pHgW0MxAB1v5c=;
	b=JPgz3GLHbxiigyNqCvXrG44Xc+9RRtw5cM2qCdUFZ6DUu/mPV/R3TeD3XaZh38WFCe
	DEx/uq5CE9XQgBlATsWT2YKHqFwZSXdZ4bHJJYi9nB1MBVGNuegF+iyMhEf2QEbvHDTD
	vSFRHv0ICDE1kpqTHEXrcrjpIP/tukKtUQs3ktQVv7jPPPHlBgEudaHEn9BdZdL6Iq3U
	hjzXtr8BM9S513gAAoP2UrnkJeER1RBBZAQexxwAhTrGa8Gdgx4VQvAh1QZOcqx/zYu4
	VcULm2EzttXcJF5A4inupKehOiUv9MhKNDFhckUUOWvJdQ9Qz2JkJcMkyyDiz7LRznIx
	T9Dg==
X-Gm-Message-State: AOAM533gSmeyzZoUW4Ir0u93kZ6/yi4fd3M8MxHik5ZQODZOFWWLjkoG
	Oz8Nj8VflYjaBAvsSSkk5a8p8tn/ctknZ2EwQbNu
X-Google-Smtp-Source: ABdhPJxJ+5OmXZaampvYMsc4KTyV/pMqSMPlrkTf341wG+iTjZFNqNcPd/Y92fwJWPJ5VK+eJTITMavL6zHZYqWaMdc=
X-Received: by 2002:a17:906:3553:: with SMTP id
	s19mr815876eja.178.1600883269547; 
	Wed, 23 Sep 2020 10:47:49 -0700 (PDT)
MIME-Version: 1.0
References: <7081a5b9c7d2e8085c49cec2fa72fcbb0b25e0d7.1600778472.git.rgb@redhat.com>
	<CAHC9VhSPk2RiMsnjTKw02_+_1Kagm06m+-r=ooNruT+fuuixYQ@mail.gmail.com>
	<20200923144852.GK822320@madcap2.tricolour.ca>
In-Reply-To: <20200923144852.GK822320@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 23 Sep 2020 13:47:38 -0400
Message-ID: <CAHC9VhRu4KEyp+e0tbSbObL1y0+90z_Znp+0z-hmnj5V68bh0w@mail.gmail.com>
Subject: Re: [PATCH ghak120 V5] audit: trigger accompanying records when no
	rules present
To: Richard Guy Briggs <rgb@redhat.com>
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
Cc: Linux Security Module list <linux-security-module@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
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

On Wed, Sep 23, 2020 at 10:49 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-09-23 10:29, Paul Moore wrote:
> > I've gone over this revision a couple of times now and it looks okay,
> > but past experience is whispering in my ear that perhaps this is
> > better to wait on this for the next cycle so it gets a full set of
> > -rcX releases.  Thoughts?
>
> I thought I had lots of time since we were just at the end of the
> previous cycle when this failed the previous time...  Ran out yet
> again...  (there were two weeks of PTO and a devel system rebuild in
> there somewhere...)

We are at -rc6 and assuming v5.9 is released after -rc7 that would
give this roughly a week and a half in v5.9-rcX; considering the
history of this patch (reverted, obvious problems in development) I'm
not confident -rc6 provides enough soak time (even if we go to -rc8 I
remain skeptical).  In addition, we've got a history of not taking new
work that isn't a bug-fix past the -rc5/-rc6 timeframe.  This is why
I'm debating holding this until after the merge window.

> It isn't my call.

I asked for your thoughts on the matter, surely you have the liberty
to comment on your own opinion :)

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

