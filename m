Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 3B7FD16B40C
	for <lists+linux-audit@lfdr.de>; Mon, 24 Feb 2020 23:31:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582583496;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=b6l2ijAlCEJconCN9mbmASTaNB4iHbZjbSHMRwkh99Y=;
	b=KHLm1zevhH+ECteTqkINuZbFB3pph9uB7gjsAhl+IrsgmTxmMOaauYVQwFYkI2c4CSREUl
	OtIwGJfebEW+bd3Jbbcy+EU9BCWcewXlYRe4mEixfq1BqDhfO8ptmvesOFJU+c2u2K/in+
	eIMZXPoZ3jNhnTZ7ydkRpBT1ZBfuQaQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-0q8RIQHlNnOcZ1ixZA-GFg-1; Mon, 24 Feb 2020 17:31:34 -0500
X-MC-Unique: 0q8RIQHlNnOcZ1ixZA-GFg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE085DB62;
	Mon, 24 Feb 2020 22:31:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB66790F5B;
	Mon, 24 Feb 2020 22:31:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D502218089C8;
	Mon, 24 Feb 2020 22:31:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01OMVH9c023178 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 24 Feb 2020 17:31:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C38722166B2A; Mon, 24 Feb 2020 22:31:17 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BEFE82166B28
	for <linux-audit@redhat.com>; Mon, 24 Feb 2020 22:31:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9362385A312
	for <linux-audit@redhat.com>; Mon, 24 Feb 2020 22:31:15 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-353-6xHiF2FCOYaL_wcQRmEkVg-1; Mon, 24 Feb 2020 17:31:13 -0500
X-MC-Unique: 6xHiF2FCOYaL_wcQRmEkVg-1
Received: by mail-ed1-f65.google.com with SMTP id e10so13830171edv.9
	for <linux-audit@redhat.com>; Mon, 24 Feb 2020 14:31:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Y1+xf/91VEGcnGcVJFtk+JLwutL06o8ZnFL54+b0xTQ=;
	b=PsUFhpoDBx0JE9BbCFNDQME/Pm65y3nrp4PvEIuSKoZZmmUx5DqH0tQDJH6kFujICa
	t4F82IAzXp7w9s37LrnD6Ns+JR7AUs4u4FOmeC7+oIrTjpVv4pX31H+++cjCX66I15CT
	WH0qGufoAaD3Vm3u6o40qcMQEPfLd9wEOrTuFNAJDt9wpTrx9pKG2W2UvqkoR0uJq8el
	DKzgyUeJB75mL7kvUBY4i9107AwGAHP2eq75FvRreU71fX6qL1sFE6Vnlt5MvL29sRFg
	ZDjFg5zRTDmGE/8yT7B/dXoUiWVbXIQCgu2Z8sm3YI+zsiCZeBezvre2KwybjFjROu0K
	a9XA==
X-Gm-Message-State: APjAAAVeXOhlizlouYC8k/UkLSuWV+jUKvF3d108LxjKg8f+7Q61gcmy
	W6cd0C7y5aLQWAaq+jRobvmJlmAChMZzKWEQ0GNc
X-Google-Smtp-Source: APXvYqyBneNBBzfUR07VIESGO2wz3HrjOgPWUq5aInT2EWIsajlWwC7ntX7qFMXz0aqfABaj6c/xmcTmVbIiiirgNCU=
X-Received: by 2002:a17:906:f251:: with SMTP id
	gy17mr47885489ejb.308.1582583471733; 
	Mon, 24 Feb 2020 14:31:11 -0800 (PST)
MIME-Version: 1.0
References: <000000000000fac9a5059f4e266d@google.com>
In-Reply-To: <000000000000fac9a5059f4e266d@google.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 24 Feb 2020 17:31:00 -0500
Message-ID: <CAHC9VhSejmXqHLEPQVOqyr5agUNVJ+V5SQJnbSuZ6WPSEox6KQ@mail.gmail.com>
Subject: Re: KMSAN: uninit-value in audit_log_vformat
To: syzbot <syzbot+e4b12d8d202701f08b6d@syzkaller.appspotmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01OMVH9c023178
X-loop: linux-audit@redhat.com
Cc: syzkaller-bugs@googlegroups.com, linux-audit@redhat.com, glider@google.com,
	linux-kernel@vger.kernel.org
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 24, 2020 at 3:28 AM syzbot
<syzbot+e4b12d8d202701f08b6d@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    8bbbc5cf kmsan: don't compile memmove
> git tree:       https://github.com/google/kmsan.git master
> console output: https://syzkaller.appspot.com/x/log.txt?x=11d7c109e00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=cd0e9a6b0e555cc3
> dashboard link: https://syzkaller.appspot.com/bug?extid=e4b12d8d202701f08b6d
> compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
> userspace arch: i386
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1287fdd9e00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13ffec81e00000
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+e4b12d8d202701f08b6d@syzkaller.appspotmail.com
>
> =====================================================
> BUG: KMSAN: uninit-value in string_nocheck lib/vsprintf.c:608 [inline]
> BUG: KMSAN: uninit-value in string+0x522/0x690 lib/vsprintf.c:689
> CPU: 1 PID: 12069 Comm: syz-executor170 Not tainted 5.6.0-rc2-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Call Trace:
>  __dump_stack lib/dump_stack.c:77 [inline]
>  dump_stack+0x1c9/0x220 lib/dump_stack.c:118
>  kmsan_report+0xf7/0x1e0 mm/kmsan/kmsan_report.c:118
>  __msan_warning+0x58/0xa0 mm/kmsan/kmsan_instr.c:215
>  string_nocheck lib/vsprintf.c:608 [inline]
>  string+0x522/0x690 lib/vsprintf.c:689
>  vsnprintf+0x207d/0x31b0 lib/vsprintf.c:2574
>  audit_log_vformat+0x583/0xcd0 kernel/audit.c:1856
>  audit_log_format+0x220/0x260 kernel/audit.c:1890
>  audit_receive_msg kernel/audit.c:1338 [inline]
>  audit_receive+0x3688/0x6be0 kernel/audit.c:1513
>  netlink_unicast_kernel net/netlink/af_netlink.c:1302 [inline]
>  netlink_unicast+0xf9e/0x1100 net/netlink/af_netlink.c:1328
>  netlink_sendmsg+0x1246/0x14d0 net/netlink/af_netlink.c:1917
>  sock_sendmsg_nosec net/socket.c:652 [inline]
>  sock_sendmsg net/socket.c:672 [inline]
>  ____sys_sendmsg+0x12b6/0x1350 net/socket.c:2343
>  ___sys_sendmsg net/socket.c:2397 [inline]
>  __sys_sendmsg+0x451/0x5f0 net/socket.c:2430
>  __compat_sys_sendmsg net/compat.c:642 [inline]
>  __do_compat_sys_sendmsg net/compat.c:649 [inline]
>  __se_compat_sys_sendmsg net/compat.c:646 [inline]
>  __ia32_compat_sys_sendmsg+0xed/0x130 net/compat.c:646
>  do_syscall_32_irqs_on arch/x86/entry/common.c:339 [inline]
>  do_fast_syscall_32+0x3c7/0x6e0 arch/x86/entry/common.c:410
>  entry_SYSENTER_compat+0x68/0x77 arch/x86/entry/entry_64_compat.S:139
> RIP: 0023:0xf7f12d99
> Code: 90 e8 0b 00 00 00 f3 90 0f ae e8 eb f9 8d 74 26 00 89 3c 24 c3 90 90 90 90 90 90 90 90 90 90 90 90 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 eb 0d 90 90 90 90 90 90 90 90 90 90 90 90
> RSP: 002b:00000000ffadf8ac EFLAGS: 00000246 ORIG_RAX: 0000000000000172
> RAX: ffffffffffffffda RBX: 0000000000000004 RCX: 0000000020000200
> RDX: 0000000000000000 RSI: 00000000080ea080 RDI: 00000000ffadf900
> RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
> R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
>
> Uninit was created at:
>  kmsan_save_stack_with_flags mm/kmsan/kmsan.c:144 [inline]
>  kmsan_internal_poison_shadow+0x66/0xd0 mm/kmsan/kmsan.c:127
>  kmsan_slab_alloc+0x8a/0xe0 mm/kmsan/kmsan_hooks.c:82
>  slab_alloc_node mm/slub.c:2793 [inline]
>  __kmalloc_node_track_caller+0xb40/0x1200 mm/slub.c:4401
>  __kmalloc_reserve net/core/skbuff.c:142 [inline]
>  __alloc_skb+0x2fd/0xac0 net/core/skbuff.c:210
>  alloc_skb include/linux/skbuff.h:1051 [inline]
>  netlink_alloc_large_skb net/netlink/af_netlink.c:1174 [inline]
>  netlink_sendmsg+0x7d3/0x14d0 net/netlink/af_netlink.c:1892
>  sock_sendmsg_nosec net/socket.c:652 [inline]
>  sock_sendmsg net/socket.c:672 [inline]
>  ____sys_sendmsg+0x12b6/0x1350 net/socket.c:2343
>  ___sys_sendmsg net/socket.c:2397 [inline]
>  __sys_sendmsg+0x451/0x5f0 net/socket.c:2430
>  __compat_sys_sendmsg net/compat.c:642 [inline]
>  __do_compat_sys_sendmsg net/compat.c:649 [inline]
>  __se_compat_sys_sendmsg net/compat.c:646 [inline]
>  __ia32_compat_sys_sendmsg+0xed/0x130 net/compat.c:646
>  do_syscall_32_irqs_on arch/x86/entry/common.c:339 [inline]
>  do_fast_syscall_32+0x3c7/0x6e0 arch/x86/entry/common.c:410
>  entry_SYSENTER_compat+0x68/0x77 arch/x86/entry/entry_64_compat.S:139
> =====================================================

I found and fixed this while fixing the other audit uninit var problem
found by syzbot.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

