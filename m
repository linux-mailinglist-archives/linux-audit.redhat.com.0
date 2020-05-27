Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id C2FC91E4385
	for <lists+linux-audit@lfdr.de>; Wed, 27 May 2020 15:24:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590585877;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TGfN7qAYaWXh72JoWp6ZKSgFssw/RUGXQIewn8gbZYk=;
	b=Grmuq7D498xIeLnlXyfe+Bs2Mt1URbhK0orCA3PM3HeHG4Kqf/TYTl1v+t8tkg/fDFjXQu
	nWQZJerWxPcZQY5m6lM1IosPeKNIfJ0UfeehqjhMeOLMB2320IKqnIcOayQbtQcQWzSm3z
	0KzR2AiI82OLkBHvizbtCVel7mxJb2w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-ZjfcUzfwP62_akNJCwaBRw-1; Wed, 27 May 2020 09:24:35 -0400
X-MC-Unique: ZjfcUzfwP62_akNJCwaBRw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A428A1005512;
	Wed, 27 May 2020 13:24:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D1D235C1B0;
	Wed, 27 May 2020 13:24:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2300C1809541;
	Wed, 27 May 2020 13:24:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04RDO7G4014742 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 27 May 2020 09:24:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A084DC223E; Wed, 27 May 2020 13:24:06 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 42441C1FA1
	for <linux-audit@redhat.com>; Wed, 27 May 2020 13:24:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F8A2833B49
	for <linux-audit@redhat.com>; Wed, 27 May 2020 13:24:02 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
	[209.85.208.41]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-243-6IVKOWpTN7SVtLXL_vnp6A-1; Wed, 27 May 2020 09:23:59 -0400
X-MC-Unique: 6IVKOWpTN7SVtLXL_vnp6A-1
Received: by mail-ed1-f41.google.com with SMTP id l5so20236480edn.7
	for <linux-audit@redhat.com>; Wed, 27 May 2020 06:23:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4f9CyBDRhfRcn9q9AtsiFqOgOL1KUGbRdM4Yl+3K+Ko=;
	b=ShdfPCcBmGfcNhGP5ht7cgVnVoACFZxZCi6cXjNnnboiWVZW6OVUWi1ZhtQTWl9WqL
	/evy7r6ucuDfNX/n3mxBFZaQIklBUZA74OFFBh7jiPlM4WSCmQmP98MphMu20qxlkqi/
	uaOmTRJTouv6DUMCq/cJgxYFQ9/MOhTlN9SODHAVMJh4FCRiwcvPCUuc7uzdwMol0T2M
	m6zzZUySFuHbC7nbJl0i+0mAOqw7P0y8M55++Kec2LJRao64YW0plf22s7EmENXsgpS8
	XcyHEFED3DBadev5ImDaO4I//hvGFaTVWdubhKkBCHnXPT/3QtuYeET3b6nRyQPsr6QX
	ew2w==
X-Gm-Message-State: AOAM532MzJpWxnXWER1Jl2Oc1rUMUnME5d3/GDjWmuQkgM5Ng6pkkIzp
	N2K73LN1aQmxoi0P11m2g4aF/iqTed8nQy8Vct8m
X-Google-Smtp-Source: ABdhPJwwPLN9eomVh6q0wPzj7+zX/QAhf9E0i5rktg6nvLDsp76xErwXKtVTovZUO7sSt7E9BZvnlbe1ZBoSguw822c=
X-Received: by 2002:a05:6402:14d3:: with SMTP id
	f19mr23014342edx.135.1590585838155; 
	Wed, 27 May 2020 06:23:58 -0700 (PDT)
MIME-Version: 1.0
References: <1590391317-71528-1-git-send-email-guyiwen@huawei.com>
	<CAHC9VhQ8orX0B4Rq5ztaumrGQKmaPvu8n059MomRM0fxUc3H_Q@mail.gmail.com>
	<20200527003651.GA97661@shell-el7.hosts.prod.upshift.rdu2.redhat.com>
In-Reply-To: <20200527003651.GA97661@shell-el7.hosts.prod.upshift.rdu2.redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 27 May 2020 09:23:46 -0400
Message-ID: <CAHC9VhQW+zt7zEkLNT4rv7_sQOmC1NUq8Mh=5Xs5RZwcWLFcVg@mail.gmail.com>
Subject: Re: [RFC] audit: allow audit_reusename to check kernel path
To: Alexander Viro <aviro@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, May 26, 2020 at 8:37 PM Alexander Viro <aviro@redhat.com> wrote:
> On Tue, May 26, 2020 at 08:32:06AM -0400, Paul Moore wrote:
> > On Mon, May 25, 2020 at 3:22 AM Yiwen Gu <guyiwen@huawei.com> wrote:
> > > For now, we met a situation where the audit_reusename checking
> > > function returns the same filename structure for files sharing
> > > the same uptr. However, these files are different, and we are trying
> > > to open them in a loop where the names are loaded into the same address.
> > > Therefore, the function returns the same structure for different files.
> > > By the way, may I ask in what situation would the audit_list be kept
> > > across syscalls?
>
> Never.  "reuse" is strictly within the same syscall, so e.g. -ESTALE
> retry logics doesn't have to worry about extra instances of struct
> filename.

I think there is something odd with the kernel that Yiwen Gu is
running; they posted a similar patch back in April (link below) and we
talked about it then.  The patch didn't make sense in April and it
still doesn't make sense to me now.

If they can provide more information and a reproducer that works on a
kernel from Linus' tree we can take a look, but as things currently
stand I think this may be due to a wonky Android/Huawei kernel.

* https://lore.kernel.org/linux-audit/1587536907-63272-1-git-send-email-guyiwen@huawei.com

> > What kernel are you using?  Is this an Android kernel?
> >
> > Do you have a reproducer you can share?

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

