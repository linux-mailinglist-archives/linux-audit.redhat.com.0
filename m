Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 3FF9C172CDD
	for <lists+linux-audit@lfdr.de>; Fri, 28 Feb 2020 01:15:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582848908;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RnhnHPLDlJ6BuqtfFMPZhLKSvdHvnd9WVB0V4aiJdY8=;
	b=SCV0JVkm832IvYgGPRZmgJYBAv0TBUh8BmEuJFSj5i3442j6ItG2/C+mLYdBSzW+ba2vwF
	lQoyNma6aI3Vp18XsWTGpDXuJZK9mF/Odf5rSujkcFgldoET6fKskT89jPcbWIdlkVr8y6
	P64mu0bRw05XW8+fmzd54sCdKZ8ifuc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63--dKKgX1LNmSDYlzJelTqxg-1; Thu, 27 Feb 2020 19:15:06 -0500
X-MC-Unique: -dKKgX1LNmSDYlzJelTqxg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C2461882CE0;
	Fri, 28 Feb 2020 00:15:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 19A6560BE0;
	Fri, 28 Feb 2020 00:14:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 79D1618089C8;
	Fri, 28 Feb 2020 00:14:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01S0EZQj009678 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 27 Feb 2020 19:14:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F40E12022EA7; Fri, 28 Feb 2020 00:14:35 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF3502026D69
	for <linux-audit@redhat.com>; Fri, 28 Feb 2020 00:14:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB41F8007B3
	for <linux-audit@redhat.com>; Fri, 28 Feb 2020 00:14:32 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-159-fcGkJ1yBPQyI80VhIp8ltw-1; Thu, 27 Feb 2020 19:14:27 -0500
X-MC-Unique: fcGkJ1yBPQyI80VhIp8ltw-1
Received: by mail-ed1-f65.google.com with SMTP id e25so1237415edq.5
	for <linux-audit@redhat.com>; Thu, 27 Feb 2020 16:14:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1ib8VWwHjJvggYN18BEOwzhOZqnlM4YEYxegYLVlKSo=;
	b=ngBcj5kPoMK3M772OCciYJ5BWe360JW9QLwxurXvnTq/GcWCGxjEWfRtbYMZxIeq7i
	NyZ/Evs5mXzTdDFE8e3L91eyywvjI/C4IwxwninNdsfurIqutgltro4nX3swez/KqLnQ
	Dtc46iye9lItnFFAgfSXIBdCgOhuPreqKwIPxilsjjjiyi9kBYadYR+lNtG6CNxGrCJr
	J0DCBHTsvMkE6ZOY44kJMMSZd7OjLVzqhWHdwc1xxRpCXO9zwQsPqfTNQjANP7KPyARH
	aYgFu4gvXA/Mt/Da+Vd/PhBDbmx7Hm8nm1xOYVjZ/Nh+4kCIHL+sKQNQTzroPBrnCadf
	XJ/A==
X-Gm-Message-State: APjAAAUHazLlxva37h//Yp0m0V69x9ETAlDk+uDyyUMxKwBy4lgoD71C
	83INrs7l6VqZDTKyTcBq3B+fLbez1xGtRNc4bUvN
X-Google-Smtp-Source: APXvYqzIh7t+mGR5KHWmesjgjSlqpj0MLXTGXcf7rY8aVOBQpqG6xj9+VllvTVXsLbvgWVt9QS8HOh37KIMIXqFAaUs=
X-Received: by 2002:a50:a7a5:: with SMTP id i34mr1145928edc.128.1582848866078; 
	Thu, 27 Feb 2020 16:14:26 -0800 (PST)
MIME-Version: 1.0
References: <0000000000003cbb40059f4e0346@google.com>
	<CAHC9VhQVXk5ucd3=7OC=BxEkZGGLfXv9bESX67Mr-TRmTwxjEg@mail.gmail.com>
	<17916d0509978e14d9a5e9eb52d760fa57460542.camel@redhat.com>
	<CAHC9VhQnbdJprbdTa_XcgUJaiwhzbnGMWJqHczU54UMk0AFCtw@mail.gmail.com>
	<CACT4Y+azQXLcPqtJG9zbj8hxqw4jE3dcwUj5T06bdL3uMaZk+Q@mail.gmail.com>
In-Reply-To: <CACT4Y+azQXLcPqtJG9zbj8hxqw4jE3dcwUj5T06bdL3uMaZk+Q@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 27 Feb 2020 19:14:15 -0500
Message-ID: <CAHC9VhRRDJzyene2_40nhnxRV_ufgyaU=RrFxYGsnxR4Z_AWWw@mail.gmail.com>
Subject: Re: kernel panic: audit: backlog limit exceeded
To: Dmitry Vyukov <dvyukov@google.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01S0EZQj009678
X-loop: linux-audit@redhat.com
Cc: mareklindner@neomailbox.ch, sw@simonwunderlich.de,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, a@unstable.cc,
	LKML <linux-kernel@vger.kernel.org>, David Miller <davem@davemloft.net>,
	syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
	b.a.t.m.a.n@diktynna.open-mesh.org, linux-audit@redhat.com,
	syzkaller <syzkaller@googlegroups.com>,
	netdev <netdev@vger.kernel.org>, john.hammond@intel.com, fzago@cray.com,
	syzbot <syzbot+9a5e789e4725b9ef1316@syzkaller.appspotmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 27, 2020 at 10:40 AM Dmitry Vyukov <dvyukov@google.com> wrote:
> On Mon, Feb 24, 2020 at 11:47 PM Paul Moore <paul@paul-moore.com> wrote:
> > On Mon, Feb 24, 2020 at 5:43 PM Eric Paris <eparis@redhat.com> wrote:
> > > https://syzkaller.appspot.com/x/repro.syz?x=151b1109e00000 (the
> > > reproducer listed) looks like it is literally fuzzing the AUDIT_SET.
> > > Which seems like this is working as designed if it is setting the
> > > failure mode to 2.
> >
> > So it is, good catch :)  I saw the panic and instinctively chalked
> > that up to a mistaken config, not expecting that it was what was being
> > tested.
>
> Yes, this audit failure mode is quite unpleasant for fuzzing. And
> since this is not a top-level syscall argument value, it's effectively
> impossible to filter out in the fuzzer. Maybe another use case for the
> "fuzer lockdown" feature +Tetsuo proposed.
> With the current state of the things, I think we only have an option
> to disable fuzzing of audit. Which is pity because it has found 5 or
> so real bugs in audit too.
> But this happened anyway because audit is only reachable from init pid
> namespace and syzkaller always unshares pid namespace for sandboxing
> reasons, that was removed accidentally and that's how it managed to
> find the bugs. But the unshare is restored now:
> https://github.com/google/syzkaller/commit/5e0e1d1450d7c3497338082fc28912fdd7f93a3c
>
> As a side effect all other real bugs in audit will be auto-obsoleted
> in future if not fixed because they will stop happening.

On the plus side, I did submit fixes for the other real audit bugs
that syzbot found recently and Linus pulled them into the tree today
so at least we have that small victory.

We could consider adding a fuzz-friendly build time config which would
disable the panic failsafe, but it probably isn't worth it at the
moment considering the syzbot's pid namespace limitations.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

