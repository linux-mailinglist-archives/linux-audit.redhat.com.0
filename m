Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id CE8402B44E0
	for <lists+linux-audit@lfdr.de>; Mon, 16 Nov 2020 14:43:49 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-l_3z9aeUO-mvXyyEWSqNXQ-1; Mon, 16 Nov 2020 08:43:47 -0500
X-MC-Unique: l_3z9aeUO-mvXyyEWSqNXQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72632873115;
	Mon, 16 Nov 2020 13:43:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A948E176BB;
	Mon, 16 Nov 2020 13:43:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8E6505811B;
	Mon, 16 Nov 2020 13:43:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AGDhWl0006650 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 16 Nov 2020 08:43:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 360E56FA57; Mon, 16 Nov 2020 13:43:32 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F5E16FA54
	for <linux-audit@redhat.com>; Mon, 16 Nov 2020 13:43:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6A6C811E79
	for <linux-audit@redhat.com>; Mon, 16 Nov 2020 13:43:28 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
	[209.85.208.49]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-374-P7ovG_a5NPeWSD_EN4sSGw-1; Mon, 16 Nov 2020 08:43:26 -0500
X-MC-Unique: P7ovG_a5NPeWSD_EN4sSGw-1
Received: by mail-ed1-f49.google.com with SMTP id v22so18734156edt.9
	for <linux-audit@redhat.com>; Mon, 16 Nov 2020 05:43:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=f/9HOQoCs1AftR2M0uecyqes0fM7Vd/bfLPNJDj0MxQ=;
	b=me/YDTgIl2pG/xiyAKtxq0CEb6FlrR7b/iRCGIUWIiWIv9QoDGB8Guss1n4NK/uqR2
	vWEzuPsVQlbpw8FKcCh4Gja3IdEYVbklSUHR45L3TtumT4CJWhM3ekv0070Errd79o3j
	bifcbgWAjgzecPmtoI3Q+uBzu0b902b4rpa7UHhfdk1ud6k61lW3FYID3TIZlWIsCH+U
	7Kb7m4MTB7InEYF678kGncnYaihY2TcNC0J/EMIlqXz4F9YDoHs2WjghHi2PExO+32jF
	IGEgXypPCDIqqYpU7xqWqsXrzi9ydqOP4XCuLo5uaDyBLnE3T6aeGEHT51sDd01jRwea
	5lXA==
X-Gm-Message-State: AOAM532vYhwY2sVgynzHIlbn5LpK5vToOLwgLNnZSfO9BTE+g7YOE9mA
	kucdw4Qp8StqbfimXhYIeVpikFO7i/D+xgHA+dUX
X-Google-Smtp-Source: ABdhPJzwq18p90AjBv0hOyqIKVoiWJTWWLhwPMub49W20PUHjzYar+5mtRhPNapF+nsbVwVjLW7lhfbm+ezeVOFyJno=
X-Received: by 2002:aa7:de01:: with SMTP id h1mr15461961edv.269.1605534205150; 
	Mon, 16 Nov 2020 05:43:25 -0800 (PST)
MIME-Version: 1.0
References: <CAPErmPdDACGemKqTrUk4xKNBwnoj6FEeWbsvmk7jS0TjOyaOqg@mail.gmail.com>
	<5549003.MhkbZ0Pkbq@x2>
	<CAHC9VhThN4R7jsukKrmjVG=6Rm07jWwjcNQ5CS4v6JzMh+NQbg@mail.gmail.com>
	<1c3736b4-c72e-fc87-90af-3d336a8a6c64@magitekltd.com>
	<5FB21F35.4070309@tlinx.org>
In-Reply-To: <5FB21F35.4070309@tlinx.org>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 16 Nov 2020 08:43:14 -0500
Message-ID: <CAHC9VhTh6wk7O+dsN3zeguR83v8G=ykosR95smfy5WmML+XXfA@mail.gmail.com>
Subject: Re: Identifying thread/process termination
To: "L. A. Walsh" <lkml@tlinx.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 16, 2020 at 8:16 AM L. A. Walsh <lkml@tlinx.org> wrote:
> On 2020/10/08 08:33, Lenny Bruzenak wrote:
> > On 10/7/20 7:27 PM, Paul Moore wrote:
> >> Almost everywhere in the kernel we record the TGID for the "pid="
> >> values and not the actual task/thread ID.  That decision was made
> >> before my heavy involvement with audit, but my guess is that most
> >> audit users are focused more on security relevant events at the
> >> process level, not the thread level.  After all, there isn't really
> >> much in the way of significant boundaries between threads.
> >>
> >
> > That's right, Paul. The process (exe/comm) is the discriminator from a
> > security perspective.
> >
> ----
>   So, when different threads perform / execute different functionality
> as loaded by a runtime loadable libraries, how is that discriminated
> from the initially started program?
>
>   Often, programs with many threads will rename the threads so they
> show up differently, though some of those may be processes, on linux
> there really aren't any threads as being separate from processes -- i.e.
> threads, at the linux kernel level are built on processes AFAIK.  Either
> way, there can be a separation of what is executed based on what threads
> are assigned what purposes.  I'd be hesitant to label the exe/comm as
> the only discriminator in an "arbitrary target environment".  Certainly
> it can be in some, but that doesn't mean it has to be sole discriminator
> when different threads can be mapped to different functions in
> 1 starting binary.

The most important thing to keep in mind is that all of the threads
inside a process share the same memory space.  It is the lack of a
strong, enforceable boundary between threads which makes it difficult,
if not impossible, to view threads as individual entities from a
security perspective.

>   In a similar way, coreutils, can be used as 1 library/binary where
> functionality is determined by the invoking name.  While coreutils uses
> separate names for each function, there's nothing stopping creating
> 1 binary with all functions launched in separate threads launched out of
>   some shell performing diverse functions based on a thread ID or name.
> Certainly it isn't the common case, but it would be a way for a hacker
> to make their actions more opaque given current limitations.  At the
> same time, it might be the way to create some type of 'all-in-one' shell
> that could be configured by runtime presence of loadable objects.

First, and perhaps most importantly, see the earlier comments about
threads and the lack of strong boundaries inside a process.  Second,
the busybox problem (different behavior based on the executable name)
is one of the many reasons why relying on executable names, pathnames,
etc. for identification of entities in a security policy is generally
ill advised.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

