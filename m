Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0156F29CCE8
	for <lists+linux-audit@lfdr.de>; Wed, 28 Oct 2020 02:31:39 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-iRwTG1FjMmar2QoQm3JW0w-1; Tue, 27 Oct 2020 21:31:36 -0400
X-MC-Unique: iRwTG1FjMmar2QoQm3JW0w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54CA9180F179;
	Wed, 28 Oct 2020 01:31:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 736EA5D9EF;
	Wed, 28 Oct 2020 01:31:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E75B85810D;
	Wed, 28 Oct 2020 01:31:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09S1QWeB027168 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 27 Oct 2020 21:26:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 38C312011569; Wed, 28 Oct 2020 01:26:32 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32E29201156B
	for <linux-audit@redhat.com>; Wed, 28 Oct 2020 01:26:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E133E85828D
	for <linux-audit@redhat.com>; Wed, 28 Oct 2020 01:26:28 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
	[209.85.218.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-273-Ssf2ecIAM4iy_z5M9zWxdA-1; Tue, 27 Oct 2020 21:26:26 -0400
X-MC-Unique: Ssf2ecIAM4iy_z5M9zWxdA-1
Received: by mail-ej1-f65.google.com with SMTP id p9so4927505eji.4
	for <linux-audit@redhat.com>; Tue, 27 Oct 2020 18:26:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0jVxeGv6lE9HxG3ioZ1jNMfiO7oQfXoYg0ePUwTMDgQ=;
	b=C37H5gFN94RK4GFe/fkmTsuoYD4nFYoFLR0Rd/T/sQchzePgANlH2wyU84eFME7cVD
	ZVSKkRHol6vi/OYfH0HD0JZu2a24uubE6dznNTyAQnm+50VVlHsl99VlzAM9VsEvG0zT
	9U1STUZn8Aur3kbRcuO+XhRQl62vaPiL1zRrCzTuEg2h+R32oqIsBOB/SNQas+TONMwd
	7fuPON0UyrrNWW7YesTEcZs6RXD2NhMb8I13rQUvutDcohx2o7ggoxMJ7w9RSNIP7oF9
	o80fUbUHAO+DpytBW26SK2z5Vjk/KB/v/7BcgxWo8HAF1thomnFvDsp0QO9Swcsikdk4
	XtFA==
X-Gm-Message-State: AOAM532Sq+hlKkLxLSnkLo9FfJisI4J6RTDAq8nF9hIUocpF0A3pXE3j
	BJ2maCQPZw7JLlazjkHwHU1svzrHYIztjMqmuz/glGuu6g==
X-Google-Smtp-Source: ABdhPJwEzZ6iuiYaqP3D8WgJUCMcZ88Ip3ZyPs/mRAVgBH9lthbImUjuYFxHiRFl7WkTjg/dMh67mJNU6KVwr/0CDdc=
X-Received: by 2002:a17:906:af87:: with SMTP id
	mj7mr5178601ejb.178.1603848385218; 
	Tue, 27 Oct 2020 18:26:25 -0700 (PDT)
MIME-Version: 1.0
References: <7081a5b9c7d2e8085c49cec2fa72fcbb0b25e0d7.1600778472.git.rgb@redhat.com>
	<CAHC9VhSPk2RiMsnjTKw02_+_1Kagm06m+-r=ooNruT+fuuixYQ@mail.gmail.com>
	<20200923144852.GK822320@madcap2.tricolour.ca>
	<CAHC9VhRu4KEyp+e0tbSbObL1y0+90z_Znp+0z-hmnj5V68bh0w@mail.gmail.com>
In-Reply-To: <CAHC9VhRu4KEyp+e0tbSbObL1y0+90z_Znp+0z-hmnj5V68bh0w@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 27 Oct 2020 21:26:14 -0400
Message-ID: <CAHC9VhTBxdtC8YF_Vze54WQgfhf3kH+2RAGnsjzf2whwJw8SOA@mail.gmail.com>
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
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 23, 2020 at 1:47 PM Paul Moore <paul@paul-moore.com> wrote:
> On Wed, Sep 23, 2020 at 10:49 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> > On 2020-09-23 10:29, Paul Moore wrote:
> > > I've gone over this revision a couple of times now and it looks okay,
> > > but past experience is whispering in my ear that perhaps this is
> > > better to wait on this for the next cycle so it gets a full set of
> > > -rcX releases.  Thoughts?
> >
> > I thought I had lots of time since we were just at the end of the
> > previous cycle when this failed the previous time...  Ran out yet
> > again...  (there were two weeks of PTO and a devel system rebuild in
> > there somewhere...)
>
> We are at -rc6 and assuming v5.9 is released after -rc7 that would
> give this roughly a week and a half in v5.9-rcX; considering the
> history of this patch (reverted, obvious problems in development) I'm
> not confident -rc6 provides enough soak time (even if we go to -rc8 I
> remain skeptical).  In addition, we've got a history of not taking new
> work that isn't a bug-fix past the -rc5/-rc6 timeframe.  This is why
> I'm debating holding this until after the merge window.
>
> > It isn't my call.
>
> I asked for your thoughts on the matter, surely you have the liberty
> to comment on your own opinion :)

I never heard back on this, but the patch is in audit/next now.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

