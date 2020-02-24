Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id B30B416B310
	for <lists+linux-audit@lfdr.de>; Mon, 24 Feb 2020 22:46:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582580805;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rGdh8tod1s5vlh5SCS1g2X4nFVQ7VSQZUh4EpfQkgVg=;
	b=QTfAJ+I6AmUaa0gOkMYUs8XEOhhJa4/XlHTiBRvFCHLiiTezIw/bOqU2MWg7RxCN2Y4ull
	wafn4laDYMa3U6j+cROZPS411vfBeAimp2xI/6qVE7FHcaL8O+qnyLIUxUZwc4KNe4tF4P
	5M3KKF592v76atWM9dXk8x2dEP0F6LY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-pbH15D5POG2hM0hn-LS3Ng-1; Mon, 24 Feb 2020 16:46:43 -0500
X-MC-Unique: pbH15D5POG2hM0hn-LS3Ng-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D3051005512;
	Mon, 24 Feb 2020 21:46:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 20BAB393;
	Mon, 24 Feb 2020 21:46:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C177B18095FF;
	Mon, 24 Feb 2020 21:46:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01OLkT3V019678 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 24 Feb 2020 16:46:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0B3452166B27; Mon, 24 Feb 2020 21:46:29 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0654F2166B28
	for <linux-audit@redhat.com>; Mon, 24 Feb 2020 21:46:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7CF6101A55F
	for <linux-audit@redhat.com>; Mon, 24 Feb 2020 21:46:26 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-399-ESJ8A6oeNeaVF5KuDxJqPg-1; Mon, 24 Feb 2020 16:46:23 -0500
X-MC-Unique: ESJ8A6oeNeaVF5KuDxJqPg-1
Received: by mail-ed1-f65.google.com with SMTP id p14so13695483edy.13
	for <linux-audit@redhat.com>; Mon, 24 Feb 2020 13:46:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Mbks2n1OJmqw5AGOznijH9+PH3W9rleO/9kgzMTk5hI=;
	b=LIKo9oosC77vnHUznv38KZ7ZdHzztapR2yL9FKfVM7RAcpvf834tgk2S/stSPnEafc
	YX6cQ14ZGcQtzbJvN4Up709tRDdHPcJHIwnLr5fcXK3CTRYw722IB++Ta31IFCcPMNyU
	aO+d+dersnCTn7VrwmPfK6ssmQhpceZ3akSWXeXYOkQv64wC5GCBeTmjEIevYGByKOM+
	se8PBXIV6UB/p4/Z7nJGb9y9bD7AcB5EHTP0vLtJkXDn2BDNAulGCs5SRIox8E0t7xum
	7cAk5SAFiGjY6n1+mdcUzQ4vhX7XhYdk5gVPjgb+kklXUFqUwq4e2zkIaVA/3vWkV2vE
	1z2A==
X-Gm-Message-State: APjAAAWtgJRmeHuwUEqgLOOMSzaRPSaedfx18I1/g1ZAFdmbS4rvhura
	hLKmwZ0PkSVkNxFTHNumbLHU67QZa7ZT0Rj3pe+4gbs=
X-Google-Smtp-Source: APXvYqzXaLiMEGi5ggk+RJZ9dzJKfkf6BADqrs0/OlxsYIECdztYv9xliaJOFpyEn2sZX8VP/IsqCZAoksIaCA2YEJA=
X-Received: by 2002:a17:906:19d0:: with SMTP id
	h16mr50525241ejd.70.1582580782033; 
	Mon, 24 Feb 2020 13:46:22 -0800 (PST)
MIME-Version: 1.0
References: <00000000000067c539059f4ddf1a@google.com>
In-Reply-To: <00000000000067c539059f4ddf1a@google.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 24 Feb 2020 16:46:10 -0500
Message-ID: <CAHC9VhSm4iojreY4q5Lno1QMrwB8SuKfANJGv2LVdbcpFukHvw@mail.gmail.com>
Subject: Re: KMSAN: uninit-value in audit_receive
To: linux-audit@redhat.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01OLkT3V019678
X-loop: linux-audit@redhat.com
Cc: syzkaller-bugs@googlegroups.com,
	syzbot <syzbot+399c44bf1f43b8747403@syzkaller.appspotmail.com>,
	glider@google.com, linux-kernel@vger.kernel.org
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 24, 2020 at 3:08 AM syzbot
<syzbot+399c44bf1f43b8747403@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    8bbbc5cf kmsan: don't compile memmove
> git tree:       https://github.com/google/kmsan.git master
> console output: https://syzkaller.appspot.com/x/log.txt?x=15c21c81e00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=cd0e9a6b0e555cc3
> dashboard link: https://syzkaller.appspot.com/bug?extid=399c44bf1f43b8747403
> compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
> userspace arch: i386
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10dbda7ee00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1721fe09e00000
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+399c44bf1f43b8747403@syzkaller.appspotmail.com
>
> =====================================================
> BUG: KMSAN: uninit-value in audit_set_feature kernel/audit.c:1119 [inline]
> BUG: KMSAN: uninit-value in audit_receive_msg kernel/audit.c:1318 [inline]
> BUG: KMSAN: uninit-value in audit_receive+0x2691/0x6be0 kernel/audit.c:1513

I'm guessing that the issue here is that we aren't checking to make
sure a properly formatted message is sent down to the kernel and if a
truncated AUDIT_SET_FEATURE message is sent would could end up looking
into an audit_features struct that isn't complete.

The fix should be relatively simple, verify that the netlink payload
is at least sizeof(audit_features) big before we inspect it.  Patch
coming shortly.

> CPU: 1 PID: 11583 Comm: syz-executor100 Not tainted 5.6.0-rc2-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Call Trace:
>  __dump_stack lib/dump_stack.c:77 [inline]
>  dump_stack+0x1c9/0x220 lib/dump_stack.c:118
>  kmsan_report+0xf7/0x1e0 mm/kmsan/kmsan_report.c:118
>  __msan_warning+0x58/0xa0 mm/kmsan/kmsan_instr.c:215
>  audit_set_feature kernel/audit.c:1119 [inline]
>  audit_receive_msg kernel/audit.c:1318 [inline]
>  audit_receive+0x2691/0x6be0 kernel/audit.c:1513
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
> RIP: 0023:0xf7fcbd99
> Code: 90 e8 0b 00 00 00 f3 90 0f ae e8 eb f9 8d 74 26 00 89 3c 24 c3 90 90 90 90 90 90 90 90 90 90 90 90 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 eb 0d 90 90 90 90 90 90 90 90 90 90 90 90
> RSP: 002b:00000000ff99b74c EFLAGS: 00000246 ORIG_RAX: 0000000000000172
> RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00000000200000c0
> RDX: 0000000000000000 RSI: 00000000080ea078 RDI: 00000000ff99b7a0
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



-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

