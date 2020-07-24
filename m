Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9CE4E22CE7B
	for <lists+linux-audit@lfdr.de>; Fri, 24 Jul 2020 21:11:05 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-XEBVreJEOXmF7i8zsgSRIA-1; Fri, 24 Jul 2020 15:11:02 -0400
X-MC-Unique: XEBVreJEOXmF7i8zsgSRIA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5127F80183C;
	Fri, 24 Jul 2020 19:10:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FEFF5C1D3;
	Fri, 24 Jul 2020 19:10:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0DC8A180954D;
	Fri, 24 Jul 2020 19:10:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06OJAbXk020605 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 24 Jul 2020 15:10:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 414382157F23; Fri, 24 Jul 2020 19:10:37 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CFF12166BA2
	for <linux-audit@redhat.com>; Fri, 24 Jul 2020 19:10:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E9808007B1
	for <linux-audit@redhat.com>; Fri, 24 Jul 2020 19:10:34 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
	[209.85.218.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-127-cEzXQLo-Ps-anyQoyd09FA-1; Fri, 24 Jul 2020 15:10:31 -0400
X-MC-Unique: cEzXQLo-Ps-anyQoyd09FA-1
Received: by mail-ej1-f66.google.com with SMTP id rk21so11049793ejb.2
	for <linux-audit@redhat.com>; Fri, 24 Jul 2020 12:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XUCWEzj7ru/gIMtw0eYk51qviOh+O/mPbFTYOrCZuvU=;
	b=t5F+jH0v42NtYHTQgnNTrBrzyMEt9B8NSWfmCpG1GUPDjSd8y60joJXeNipMW1O7wW
	OR+qelNC5uSZXTptVDkcBujx1R8J7/LeZ0uGhyv1Vg5SxxQZy9uPTGXFj1bWf4IwtkUP
	cmG2/yULgRzwvsl6DJ3ZHfkxjdZhkbxI0kAUzMraZXkWgXID2GJdUJKosFDZkpzoJlj3
	d62VVwzKaa3lFT6b8lgod3ugPGBYMrtHBs2Y8/XBzbgTonBqsdSISdLf2oRM5aJVldtp
	R/Kl6gjA9TlBQjrMcTXEzbjdzQby2V6s5aRgaC/J1CafEIRMLIqG4b0C1NKDG8dhfGYz
	8H1Q==
X-Gm-Message-State: AOAM531+1s2C0DM8oNG+LNWqVNsPCoUaRXTDRCh12+lnlspnaDX6ja5U
	Qp18kX+m/60RW0Lyy/lv42Az0yPkq9uoPexAMpgC
X-Google-Smtp-Source: ABdhPJy5FTRV9dTJ2w3NZaTaf64IC1/Xj6EwnGyh1p7eUJAmfdip1Klnm/AYFSpm3w6V9yKIZ5Zf5d8ilCZ4+Ph6JjU=
X-Received: by 2002:a17:906:fb90:: with SMTP id
	lr16mr4057786ejb.542.1595617830107; 
	Fri, 24 Jul 2020 12:10:30 -0700 (PDT)
MIME-Version: 1.0
References: <9c8f1fc6-2b8e-e9e3-37bf-2d1d6bedace1@gmail.com>
	<360c7a62-fd39-ad02-60b8-87fb18022eeb@defensec.nl>
	<CAHC9VhRGJ4EwFYpRtoHe=m_GNB6WAt3cDCf7pd4YbvydEPpy3w@mail.gmail.com>
	<CAHC9VhTbMB==FaxwUDviw9D5-M6wUGnYwwHz7wCDMYSOUw07dA@mail.gmail.com>
	<20200722020100.tigrpqzoxj6pqf52@madcap2.tricolour.ca>
	<CAHC9VhT6A0mo4FozQV9G1+U7F=8B6ApjxonTtXXEBCnSy4ikgw@mail.gmail.com>
	<20200723125645.mfvuss2m2b6bou3s@madcap2.tricolour.ca>
In-Reply-To: <20200723125645.mfvuss2m2b6bou3s@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 24 Jul 2020 15:10:18 -0400
Message-ID: <CAHC9VhTwW07upzC4dFFXM8ozXcD0++dK1FXr8bjv=ZV_FSJGFw@mail.gmail.com>
Subject: Re: null pointer dereference regression in 5.7
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: bauen1 <j2468h@googlemail.com>, linux-audit@redhat.com,
	Dominick Grift <dominick.grift@defensec.nl>
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

On Thu, Jul 23, 2020 at 8:57 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-07-22 21:01, Paul Moore wrote:
> > Do you have a rough idea as to how long it would take to chase down
> > all the code paths?  I'm asking not to rush you, but to figure out if
> > we should revert the patch now to resolve the problem and restore it
> > later once we are confident there are no additional issues lurking.
>
> I figure 2-3 days.

Okay.  I think we need to submit a revert for v5.8 and -stable (which
is pretty limited at this point); can you put that together and send
it to the list?  It should be trivial, if you can't do it let me know.

> I'm trying to remember the name of the tool to build a function calling
> tree, either up or down.  Was it cscope?  Or is there something more
> modern?  It will have some limitations due to op function pointers.

I'm not sure what you're talking about, I always just walk the code by
hand in my editor with cscope or lxr as tools on the side.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

