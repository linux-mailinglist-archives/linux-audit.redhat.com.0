Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DA62F286C60
	for <lists+linux-audit@lfdr.de>; Thu,  8 Oct 2020 03:27:47 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-6S74aBl-MrmFeAiIwQMcWQ-1; Wed, 07 Oct 2020 21:27:44 -0400
X-MC-Unique: 6S74aBl-MrmFeAiIwQMcWQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 745291007286;
	Thu,  8 Oct 2020 01:27:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3ED9C19D7C;
	Thu,  8 Oct 2020 01:27:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 027F91832FC2;
	Thu,  8 Oct 2020 01:27:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0981RRGV019389 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 7 Oct 2020 21:27:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1063210CD83E; Thu,  8 Oct 2020 01:27:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0962C10CD83D
	for <linux-audit@redhat.com>; Thu,  8 Oct 2020 01:27:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 350D0811E7A
	for <linux-audit@redhat.com>; Thu,  8 Oct 2020 01:27:24 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
	[209.85.218.42]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-438-PkJOK-B6O16wHY4vsBtKPg-1; Wed, 07 Oct 2020 21:27:20 -0400
X-MC-Unique: PkJOK-B6O16wHY4vsBtKPg-1
Received: by mail-ej1-f42.google.com with SMTP id lw21so5661507ejb.6
	for <linux-audit@redhat.com>; Wed, 07 Oct 2020 18:27:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RictCY/NeVd887j674KALfBhHUKbs2izk3taD3IWKls=;
	b=QnkhnBE+XWC62oPt+momg3uvaPuMgK7+18PRG654hn3bBtF236dTW8dbzpEy61nr5A
	yFNFvhoBT1kkosaY8XxzWcnAOkroIRPakX4gLjsFah4dTZ9mCUI/ctM3V3NsSGAOIzYN
	FFmgfLQlVBw44APWp1jAaRSas2pks+KxsxOe1nyCNm2AYD5/br7gleR9L48KPvcSBJ4W
	u59eSumH4t6V06M0Fr/IvhUn0qJLIrcJwcciN6tyxgQjxA8lPlDFWpBb33Pk4+4s7WMv
	f0FQdiONN+KNzeXw7gs0I3/yS8bF+17kanhYX/IelnBLMJciGTL/5ZiKgNoLPiWCSCyr
	CoPA==
X-Gm-Message-State: AOAM532J8m3ls0s7RYzm0PYnDAJgzBf5k4A1/IeyMEipdlEZpcdHhcAF
	RVuytDKGnb+WjO8VKjxvioNyIPWbhmnB9KjQcc0I
X-Google-Smtp-Source: ABdhPJzIwmhzqdDW5xLA578WXu0YGHfcBGFg6WwzpC/1F1cPKaBVmzh0+LmVKxhlVN1IDidQkc6+sZ3YZuaPhz4gRfA=
X-Received: by 2002:a17:906:c444:: with SMTP id
	ck4mr5838819ejb.398.1602120438538; 
	Wed, 07 Oct 2020 18:27:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAPErmPdDACGemKqTrUk4xKNBwnoj6FEeWbsvmk7jS0TjOyaOqg@mail.gmail.com>
	<5549003.MhkbZ0Pkbq@x2>
In-Reply-To: <5549003.MhkbZ0Pkbq@x2>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 7 Oct 2020 21:27:07 -0400
Message-ID: <CAHC9VhThN4R7jsukKrmjVG=6Rm07jWwjcNQ5CS4v6JzMh+NQbg@mail.gmail.com>
Subject: Re: Identifying thread/process termination
To: Natan Yellin <aantny@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Oct 6, 2020 at 4:20 PM Steve Grubb <sgrubb@redhat.com> wrote:
> On Monday, October 5, 2020 3:07:12 PM EDT Natan Yellin wrote:
> > I've been tracking all process terminations using a rule for the exit and
> > exit_group syscalls. However, by looking at the audit events for exit it is
> > impossible to differentiate between the death of different threads in the
> > same thread group. Is there an alternative way to track this?
>
> I don't think the audit system was ever designed to distinguish between
> threads. But there is a general need to determine the exit of a process
> rather than a thread.
>
> Paul, Richard, Do you have any thoughts?

Almost everywhere in the kernel we record the TGID for the "pid="
values and not the actual task/thread ID.  That decision was made
before my heavy involvement with audit, but my guess is that most
audit users are focused more on security relevant events at the
process level, not the thread level.  After all, there isn't really
much in the way of significant boundaries between threads.

To get the information you are looking for, I think we would need to
add an additional task/thread ID to the relevant records and that
would be *very* messy.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

