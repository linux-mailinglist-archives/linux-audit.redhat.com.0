Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id BDB99287FD8
	for <lists+linux-audit@lfdr.de>; Fri,  9 Oct 2020 03:13:33 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-8S2MuvMlOpW9AnK7UhzV5Q-1; Thu, 08 Oct 2020 21:13:31 -0400
X-MC-Unique: 8S2MuvMlOpW9AnK7UhzV5Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78750427C6;
	Fri,  9 Oct 2020 01:13:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB4C210013C1;
	Fri,  9 Oct 2020 01:13:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 101608C7C6;
	Fri,  9 Oct 2020 01:13:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0991CxKn022460 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 8 Oct 2020 21:13:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D0AFD207A79B; Fri,  9 Oct 2020 01:12:59 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA2222049CB7
	for <linux-audit@redhat.com>; Fri,  9 Oct 2020 01:12:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BEEF718A6656
	for <linux-audit@redhat.com>; Fri,  9 Oct 2020 01:12:56 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
	[209.85.218.50]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-421-B4r3RI1HPFGwwHSfjhg8JA-1; Thu, 08 Oct 2020 21:12:54 -0400
X-MC-Unique: B4r3RI1HPFGwwHSfjhg8JA-1
Received: by mail-ej1-f50.google.com with SMTP id x7so578587eje.8
	for <linux-audit@redhat.com>; Thu, 08 Oct 2020 18:12:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=pIP3++Em6y++SJ2S9ePX+Vlk9HSFgz43F2jnS5STs80=;
	b=OhOLSxUI6P2d0MeH5eALdrtmgOERdYsYNH8ezA3WWRFnxU7h+vubTWe2FOfKJesXS8
	swC5lyhXsQ2f7+ZQfEXQp/X3gZc4kacTUS7PwObAME4Nx+q5Y+ipi/Dcg5FNpmhMwM4N
	hISkjFGIlx+VWYNINRJcv7HzFym1YYcjRvk28r3P6Ef0Bw+bOJ/3+hFwlxwlFfFivrWK
	RP8rmzlG/IHu6lZurUnC3sbBD8ekWm5OxNn0q5oKSu4v0TxSqlfwiQcLxZtBbsfWy/Ur
	n2KKeI+54Dxj13m++DEMHQtTsHzGBxBLQuwF7tPDQzvc9C64EyWsvSglf+d2UpYiTa/l
	NTlQ==
X-Gm-Message-State: AOAM532jqo39uVBnRwJDU1qQHAQDExAkQZPbQk8OGIVAQvrxP6IrrBj3
	gg2WPtW/YCm1vuBu7riqIMd00sLWjvgHRe+e2lmf
X-Google-Smtp-Source: ABdhPJyt83889nK8SDN3Gb8/rkQF+X4k+x3aTnKL1k//6tXA8b38vwvsuctzq/yqS10E1R1YPsKM0DVvGTSnWH5sLbs=
X-Received: by 2002:a17:906:2301:: with SMTP id
	l1mr11260303eja.488.1602205972677; 
	Thu, 08 Oct 2020 18:12:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAPErmPdDACGemKqTrUk4xKNBwnoj6FEeWbsvmk7jS0TjOyaOqg@mail.gmail.com>
	<5549003.MhkbZ0Pkbq@x2>
	<CAHC9VhThN4R7jsukKrmjVG=6Rm07jWwjcNQ5CS4v6JzMh+NQbg@mail.gmail.com>
	<CAPErmPfEQZj22G5rrGykSxp7Tawzmd_Y=yJzexRBkN55LrpE_A@mail.gmail.com>
In-Reply-To: <CAPErmPfEQZj22G5rrGykSxp7Tawzmd_Y=yJzexRBkN55LrpE_A@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 8 Oct 2020 21:12:41 -0400
Message-ID: <CAHC9VhQGzWk=ZSHryJ=dqw3mFyJBFAM9JD_Bcjss0arB909Ouw@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0991CxKn022460
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 8, 2020 at 4:00 AM Natan Yellin <aantny@gmail.com> wrote:
>
> What would be so messy about adding the extra field?
>
> I'm happy to put together a patch myself which adds it to all syscalls and to process lifecycle events. My goal isn't to identify the exact thread that performs every audit event but rather to allow tracking thread lifecycle which isn't currently possible.

*Please* don't top post, it's a pain to read and it messes up the thread.

As far as recording the thread information, what I meant by messy is
that any new fields added to a record need to be added to the end[1],
which may result in some ugly code.  Of course, if it's important to
you I would encourage you to develop a RFC patch and send it off to
the list for review.  Maybe it won't be so messy after all! :)

[1] It's a really long story, involving a lot of screaming, so just
trust me on this one.  If you really want to challenge this assertion
go read the past seven to eight years of linux-audit archives first ;)

> On Thu, Oct 8, 2020, 04:27 Paul Moore <paul@paul-moore.com> wrote:
>>
>> On Tue, Oct 6, 2020 at 4:20 PM Steve Grubb <sgrubb@redhat.com> wrote:
>> > On Monday, October 5, 2020 3:07:12 PM EDT Natan Yellin wrote:
>> > > I've been tracking all process terminations using a rule for the exit and
>> > > exit_group syscalls. However, by looking at the audit events for exit it is
>> > > impossible to differentiate between the death of different threads in the
>> > > same thread group. Is there an alternative way to track this?
>> >
>> > I don't think the audit system was ever designed to distinguish between
>> > threads. But there is a general need to determine the exit of a process
>> > rather than a thread.
>> >
>> > Paul, Richard, Do you have any thoughts?
>>
>> Almost everywhere in the kernel we record the TGID for the "pid="
>> values and not the actual task/thread ID.  That decision was made
>> before my heavy involvement with audit, but my guess is that most
>> audit users are focused more on security relevant events at the
>> process level, not the thread level.  After all, there isn't really
>> much in the way of significant boundaries between threads.
>>
>> To get the information you are looking for, I think we would need to
>> add an additional task/thread ID to the relevant records and that
>> would be *very* messy.
>>
>> --
>> paul moore
>> www.paul-moore.com



-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

