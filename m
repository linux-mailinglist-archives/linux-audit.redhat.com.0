Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E702016B47D
	for <lists+linux-audit@lfdr.de>; Mon, 24 Feb 2020 23:47:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582584442;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RdK6XJOQtjwLL0PO5+dc6RTUJDTlS89m+jRHly4kjew=;
	b=g6WFvt0Kqi1id0wDL4plbLaEBcLpVAykZKP5gSYXDVMEo0EMGJtJ52ShAxUIxnjiFyKVn+
	493MXddJI2+hP/X6UJdxa7ulZY5tzYX4+KhZ2/CI/z4fbkGZKG59780EzhzTBNFlQ5Xs6p
	7o5y22T34dUwViDGNpTgCbfSz3//RUg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-aQxpc2rDPF69MqneqcwtzQ-1; Mon, 24 Feb 2020 17:47:19 -0500
X-MC-Unique: aQxpc2rDPF69MqneqcwtzQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C15A107ACCD;
	Mon, 24 Feb 2020 22:47:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D8219009D;
	Mon, 24 Feb 2020 22:47:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DA85818089C8;
	Mon, 24 Feb 2020 22:47:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01OMl8wW024399 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 24 Feb 2020 17:47:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6E0542026D68; Mon, 24 Feb 2020 22:47:08 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 679732026D67
	for <linux-audit@redhat.com>; Mon, 24 Feb 2020 22:47:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53E7B8002E0
	for <linux-audit@redhat.com>; Mon, 24 Feb 2020 22:47:06 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-251-9CBa40nuPBOO6DFwj6t7vA-1; Mon, 24 Feb 2020 17:47:03 -0500
X-MC-Unique: 9CBa40nuPBOO6DFwj6t7vA-1
Received: by mail-ed1-f67.google.com with SMTP id c26so13898732eds.8
	for <linux-audit@redhat.com>; Mon, 24 Feb 2020 14:47:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IiEfOHCrh6zWQVm34gh4O8v2Un9u1uyhgcdvK71qZmY=;
	b=F6UrEuBJcTlLgxfAsqt3n4NyqbM+DyTTYKGTWhhRmeTFJHVlYnxjDCOduey6/Bc5MC
	28MxHhbHlGDpYhFiDhUKIL/e2h4gRloaOEUq2fb4XtscDhEW1wW6HkZYh+sutfuijfYb
	9Qu+HzRI2yC6Uk2OXWcVTr5dxcm74YPDBJJLB3IW/A7pBv4isef9KugU1/TkVsNH0XFJ
	4GFTQu8b25l2Io65K+tIpsnZta/56E7bZ3hCISGKLKe/zyw9GiKfPuUxtRi3zE/J9j2e
	KUqH01EGBsupbXXArbhvD9D+AQPAqabLqneQTYDGtkp3Z0l6hn/o5oIcmJ0NMq1W5esP
	sHKw==
X-Gm-Message-State: APjAAAXp3cMMgRh22lXnfjGa118RvAvg42efILbfQ19V1P8dCz3Ixv0r
	/U9BxCJdwkVh/nO0idCJCYHctrpGkDNI85cH/5me
X-Google-Smtp-Source: APXvYqyoEHk7Xyx5zXdxxgh2THrTubUE2a7R58KdpvBAlLT9giKcRzhphu4hO4d4zL35ZHuLq9wq3CyiOiQrMTUn+N0=
X-Received: by 2002:a50:a7a5:: with SMTP id i34mr49474602edc.128.1582584422397;
	Mon, 24 Feb 2020 14:47:02 -0800 (PST)
MIME-Version: 1.0
References: <0000000000003cbb40059f4e0346@google.com>
	<CAHC9VhQVXk5ucd3=7OC=BxEkZGGLfXv9bESX67Mr-TRmTwxjEg@mail.gmail.com>
	<17916d0509978e14d9a5e9eb52d760fa57460542.camel@redhat.com>
In-Reply-To: <17916d0509978e14d9a5e9eb52d760fa57460542.camel@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 24 Feb 2020 17:46:50 -0500
Message-ID: <CAHC9VhQnbdJprbdTa_XcgUJaiwhzbnGMWJqHczU54UMk0AFCtw@mail.gmail.com>
Subject: Re: kernel panic: audit: backlog limit exceeded
To: Eric Paris <eparis@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01OMl8wW024399
X-loop: linux-audit@redhat.com
Cc: mareklindner@neomailbox.ch, sw@simonwunderlich.de,
	gregkh@linuxfoundation.org, a@unstable.cc,
	linux-kernel@vger.kernel.org, davem@davemloft.net,
	syzkaller-bugs@googlegroups.com,
	b.a.t.m.a.n@diktynna.open-mesh.org, linux-audit@redhat.com,
	netdev@vger.kernel.org, john.hammond@intel.com, fzago@cray.com,
	syzbot <syzbot+9a5e789e4725b9ef1316@syzkaller.appspotmail.com>,
	dan.carpenter@oracle.com
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 24, 2020 at 5:43 PM Eric Paris <eparis@redhat.com> wrote:
> https://syzkaller.appspot.com/x/repro.syz?x=151b1109e00000 (the
> reproducer listed) looks like it is literally fuzzing the AUDIT_SET.
> Which seems like this is working as designed if it is setting the
> failure mode to 2.

So it is, good catch :)  I saw the panic and instinctively chalked
that up to a mistaken config, not expecting that it was what was being
tested.

> On Mon, 2020-02-24 at 17:38 -0500, Paul Moore wrote:
> > On Mon, Feb 24, 2020 at 3:18 AM syzbot
> > <syzbot+9a5e789e4725b9ef1316@syzkaller.appspotmail.com> wrote:
> > > Hello,
> > >
> > > syzbot found the following crash on:
> > >
> > > HEAD commit:    36a44bcd Merge branch 'bnxt_en-shutdown-and-kexec-
> > > kdump-re..
> > > git tree:       net
> > > console output:
> > > https://syzkaller.appspot.com/x/log.txt?x=148bfdd9e00000
> > > kernel config:
> > > https://syzkaller.appspot.com/x/.config?x=768cc3d3e277cc16
> > > dashboard link:
> > > https://syzkaller.appspot.com/bug?extid=9a5e789e4725b9ef1316
> > > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > > syz repro:
> > > https://syzkaller.appspot.com/x/repro.syz?x=151b1109e00000
> > > C reproducer:
> > > https://syzkaller.appspot.com/x/repro.c?x=128bfdd9e00000
> > >
> > > The bug was bisected to:
> > >
> > > commit 0c1b9970ddd4cc41002321c3877e7f91aacb896d
> > > Author: Dan Carpenter <dan.carpenter@oracle.com>
> > > Date:   Fri Jul 28 14:42:27 2017 +0000
> > >
> > >     staging: lustre: lustre: Off by two in lmv_fid2path()
> > >
> > > bisection log:
> > > https://syzkaller.appspot.com/x/bisect.txt?x=17e6c3e9e00000
> > > final crash:
> > > https://syzkaller.appspot.com/x/report.txt?x=1416c3e9e00000
> > > console output:
> > > https://syzkaller.appspot.com/x/log.txt?x=1016c3e9e00000
> > >
> > > IMPORTANT: if you fix the bug, please add the following tag to the
> > > commit:
> > > Reported-by: syzbot+9a5e789e4725b9ef1316@syzkaller.appspotmail.com
> > > Fixes: 0c1b9970ddd4 ("staging: lustre: lustre: Off by two in
> > > lmv_fid2path()")
> > >
> > > audit: audit_backlog=13 > audit_backlog_limit=7
> > > audit: audit_lost=1 audit_rate_limit=0 audit_backlog_limit=7
> > > Kernel panic - not syncing: audit: backlog limit exceeded
> > > CPU: 1 PID: 9913 Comm: syz-executor024 Not tainted 5.6.0-rc1-
> > > syzkaller #0
> > > Hardware name: Google Google Compute Engine/Google Compute Engine,
> > > BIOS Google 01/01/2011
> > > Call Trace:
> > >  __dump_stack lib/dump_stack.c:77 [inline]
> > >  dump_stack+0x197/0x210 lib/dump_stack.c:118
> > >  panic+0x2e3/0x75c kernel/panic.c:221
> > >  audit_panic.cold+0x32/0x32 kernel/audit.c:307
> > >  audit_log_lost kernel/audit.c:377 [inline]
> > >  audit_log_lost+0x8b/0x180 kernel/audit.c:349
> > >  audit_log_start kernel/audit.c:1788 [inline]
> > >  audit_log_start+0x70e/0x7c0 kernel/audit.c:1745
> > >  audit_log+0x95/0x120 kernel/audit.c:2345
> > >  xt_replace_table+0x61d/0x830 net/netfilter/x_tables.c:1413
> > >  __do_replace+0x1da/0x950 net/ipv6/netfilter/ip6_tables.c:1084
> > >  do_replace net/ipv6/netfilter/ip6_tables.c:1157 [inline]
> > >  do_ip6t_set_ctl+0x33a/0x4c8 net/ipv6/netfilter/ip6_tables.c:1681
> > >  nf_sockopt net/netfilter/nf_sockopt.c:106 [inline]
> > >  nf_setsockopt+0x77/0xd0 net/netfilter/nf_sockopt.c:115
> > >  ipv6_setsockopt net/ipv6/ipv6_sockglue.c:949 [inline]
> > >  ipv6_setsockopt+0x147/0x180 net/ipv6/ipv6_sockglue.c:933
> > >  tcp_setsockopt net/ipv4/tcp.c:3165 [inline]
> > >  tcp_setsockopt+0x8f/0xe0 net/ipv4/tcp.c:3159
> > >  sock_common_setsockopt+0x94/0xd0 net/core/sock.c:3149
> > >  __sys_setsockopt+0x261/0x4c0 net/socket.c:2130
> > >  __do_sys_setsockopt net/socket.c:2146 [inline]
> > >  __se_sys_setsockopt net/socket.c:2143 [inline]
> > >  __x64_sys_setsockopt+0xbe/0x150 net/socket.c:2143
> > >  do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
> > >  entry_SYSCALL_64_after_hwframe+0x49/0xbe
> > > RIP: 0033:0x44720a
> > > Code: 49 89 ca b8 37 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 1a e0
> > > fb ff c3 66 0f 1f 84 00 00 00 00 00 49 89 ca b8 36 00 00 00 0f 05
> > > <48> 3d 01 f0 ff ff 0f 83 fa df fb ff c3 66 0f 1f 84 00 00 00 00 00
> > > RSP: 002b:00007ffd032dec78 EFLAGS: 00000286 ORIG_RAX:
> > > 0000000000000036
> > > RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 000000000044720a
> > > RDX: 0000000000000040 RSI: 0000000000000029 RDI: 0000000000000003
> > > RBP: 00007ffd032deda0 R08: 00000000000003b8 R09: 0000000000004000
> > > R10: 00000000006d7b40 R11: 0000000000000286 R12: 00007ffd032deca0
> > > R13: 00000000006d9d60 R14: 0000000000000029 R15: 00000000006d7ba0
> > > Kernel Offset: disabled
> > > Rebooting in 86400 seconds..
> > >
> > >
> > > ---
> > > This bug is generated by a bot. It may contain errors.
> > > See https://goo.gl/tpsmEJ for more information about syzbot.
> > > syzbot engineers can be reached at syzkaller@googlegroups.com.
> > >
> > > syzbot will keep track of this bug report. See:
> > > https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> > > For information about bisection process see:
> > > https://goo.gl/tpsmEJ#bisection
> > > syzbot can test patches for this bug, for details see:
> > > https://goo.gl/tpsmEJ#testing-patches
> >
> > Similar to syzbot report 72461ac44b36c98f58e5, see my comments there.
> >
>


-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

