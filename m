Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2B3E416A772
	for <lists+linux-audit@lfdr.de>; Mon, 24 Feb 2020 14:42:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582551743;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CJFncKb11VnxRyd/YTQJ1Y2w2kS8sGVjh6N6im6gsUo=;
	b=N/YysexWLtMotO5L/nD9uVHG4GGoYlMKqKt3CWftjWO6aij7EQDLsLWnvZkIYpX5ODcbJu
	UNvBt+pOOIo4Kp6x6CJJV3zoKzNVyAQfk5f5KIk65TA6zhmxETa6aoSSVP3meMRlabrUGD
	sEwPVU7OdBzH4C0jmVvX7MGyzzYamxE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-8fqWvidBMouBxiELC2XS1g-1; Mon, 24 Feb 2020 08:42:19 -0500
X-MC-Unique: 8fqWvidBMouBxiELC2XS1g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35AF1107ACCD;
	Mon, 24 Feb 2020 13:42:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5526F9183D;
	Mon, 24 Feb 2020 13:42:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DF5E2860EA;
	Mon, 24 Feb 2020 13:42:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01O88KGH029605 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 24 Feb 2020 03:08:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 921AA2063211; Mon, 24 Feb 2020 08:08:20 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D84C2026D68
	for <linux-audit@redhat.com>; Mon, 24 Feb 2020 08:08:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0921285A30F
	for <linux-audit@redhat.com>; Mon, 24 Feb 2020 08:08:18 +0000 (UTC)
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
	[209.85.166.197]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-353-MJq4epZHOtKFPLSZ57j5jA-1; Mon, 24 Feb 2020 03:08:13 -0500
X-MC-Unique: MJq4epZHOtKFPLSZ57j5jA-1
Received: by mail-il1-f197.google.com with SMTP id p67so16816306ili.23
	for <linux-audit@redhat.com>; Mon, 24 Feb 2020 00:08:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=4ffBqSpOrkn3eYeP2zdTUWaU56natMn7rNnOnAVtWBQ=;
	b=XCkqY3ubyq9ShBKMItiI+PzFWwXrSftHnT6uP+ZboE3faheD7mjt5YZQhxYA4GmGgM
	HveEduK6CA9KiQ5BbA9SS9uKyMYqeB9rZDYcpieRTtI6dgtUL3dE8bPWoh1uiK9nbAk/
	tOV3QWcUcdRWi1RzNIbtPZG/1jZmNvuV+6RjbEkknYVdH6PL7m8wxqKj0pVRZhSPafHt
	7+mi4fS9r4tdCFY0tifAwaEXWmvl7IvUCL0jyLxK9/AAXAR5bS9mRz1PTjMRwoP0/QVD
	2EFhHlFel4mTaGsVSKrbYiQkAiG7/lFSA8jHKmAscv4AMjgR6qBqlwTKbvS+/vIZc5UH
	K0hw==
X-Gm-Message-State: APjAAAWSdqocNMcYTVeodQlXUzdl2CdNLqrb2jz7swXP716D7sm+6Y1v
	mJpjKs3xKWgn+APLfRLnPv14DOJt6SnQEABxQiQsC/gZpVj9
X-Google-Smtp-Source: APXvYqxC8Yp8nQNnAGIMalHBXGSQjJQGagoRK7FT4+BzgT0wZNor+UJic1ApcwJqNEcQnO7RK3/ZV9kMOcz5ENk9CgnvIvoBoBkA
MIME-Version: 1.0
X-Received: by 2002:a5e:c604:: with SMTP id f4mr48055490iok.304.1582531692969; 
	Mon, 24 Feb 2020 00:08:12 -0800 (PST)
Date: Mon, 24 Feb 2020 00:08:12 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000067c539059f4ddf1a@google.com>
Subject: KMSAN: uninit-value in audit_receive
From: syzbot <syzbot+399c44bf1f43b8747403@syzkaller.appspotmail.com>
To: eparis@redhat.com, glider@google.com, linux-audit@redhat.com,
	linux-kernel@vger.kernel.org, paul@paul-moore.com,
	syzkaller-bugs@googlegroups.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01O88KGH029605
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 24 Feb 2020 08:41:58 -0500
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

Hello,

syzbot found the following crash on:

HEAD commit:    8bbbc5cf kmsan: don't compile memmove
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=15c21c81e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cd0e9a6b0e555cc3
dashboard link: https://syzkaller.appspot.com/bug?extid=399c44bf1f43b8747403
compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
userspace arch: i386
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10dbda7ee00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1721fe09e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+399c44bf1f43b8747403@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in audit_set_feature kernel/audit.c:1119 [inline]
BUG: KMSAN: uninit-value in audit_receive_msg kernel/audit.c:1318 [inline]
BUG: KMSAN: uninit-value in audit_receive+0x2691/0x6be0 kernel/audit.c:1513
CPU: 1 PID: 11583 Comm: syz-executor100 Not tainted 5.6.0-rc2-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x1c9/0x220 lib/dump_stack.c:118
 kmsan_report+0xf7/0x1e0 mm/kmsan/kmsan_report.c:118
 __msan_warning+0x58/0xa0 mm/kmsan/kmsan_instr.c:215
 audit_set_feature kernel/audit.c:1119 [inline]
 audit_receive_msg kernel/audit.c:1318 [inline]
 audit_receive+0x2691/0x6be0 kernel/audit.c:1513
 netlink_unicast_kernel net/netlink/af_netlink.c:1302 [inline]
 netlink_unicast+0xf9e/0x1100 net/netlink/af_netlink.c:1328
 netlink_sendmsg+0x1246/0x14d0 net/netlink/af_netlink.c:1917
 sock_sendmsg_nosec net/socket.c:652 [inline]
 sock_sendmsg net/socket.c:672 [inline]
 ____sys_sendmsg+0x12b6/0x1350 net/socket.c:2343
 ___sys_sendmsg net/socket.c:2397 [inline]
 __sys_sendmsg+0x451/0x5f0 net/socket.c:2430
 __compat_sys_sendmsg net/compat.c:642 [inline]
 __do_compat_sys_sendmsg net/compat.c:649 [inline]
 __se_compat_sys_sendmsg net/compat.c:646 [inline]
 __ia32_compat_sys_sendmsg+0xed/0x130 net/compat.c:646
 do_syscall_32_irqs_on arch/x86/entry/common.c:339 [inline]
 do_fast_syscall_32+0x3c7/0x6e0 arch/x86/entry/common.c:410
 entry_SYSENTER_compat+0x68/0x77 arch/x86/entry/entry_64_compat.S:139
RIP: 0023:0xf7fcbd99
Code: 90 e8 0b 00 00 00 f3 90 0f ae e8 eb f9 8d 74 26 00 89 3c 24 c3 90 90 90 90 90 90 90 90 90 90 90 90 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 eb 0d 90 90 90 90 90 90 90 90 90 90 90 90
RSP: 002b:00000000ff99b74c EFLAGS: 00000246 ORIG_RAX: 0000000000000172
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00000000200000c0
RDX: 0000000000000000 RSI: 00000000080ea078 RDI: 00000000ff99b7a0
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000

Uninit was created at:
 kmsan_save_stack_with_flags mm/kmsan/kmsan.c:144 [inline]
 kmsan_internal_poison_shadow+0x66/0xd0 mm/kmsan/kmsan.c:127
 kmsan_slab_alloc+0x8a/0xe0 mm/kmsan/kmsan_hooks.c:82
 slab_alloc_node mm/slub.c:2793 [inline]
 __kmalloc_node_track_caller+0xb40/0x1200 mm/slub.c:4401
 __kmalloc_reserve net/core/skbuff.c:142 [inline]
 __alloc_skb+0x2fd/0xac0 net/core/skbuff.c:210
 alloc_skb include/linux/skbuff.h:1051 [inline]
 netlink_alloc_large_skb net/netlink/af_netlink.c:1174 [inline]
 netlink_sendmsg+0x7d3/0x14d0 net/netlink/af_netlink.c:1892
 sock_sendmsg_nosec net/socket.c:652 [inline]
 sock_sendmsg net/socket.c:672 [inline]
 ____sys_sendmsg+0x12b6/0x1350 net/socket.c:2343
 ___sys_sendmsg net/socket.c:2397 [inline]
 __sys_sendmsg+0x451/0x5f0 net/socket.c:2430
 __compat_sys_sendmsg net/compat.c:642 [inline]
 __do_compat_sys_sendmsg net/compat.c:649 [inline]
 __se_compat_sys_sendmsg net/compat.c:646 [inline]
 __ia32_compat_sys_sendmsg+0xed/0x130 net/compat.c:646
 do_syscall_32_irqs_on arch/x86/entry/common.c:339 [inline]
 do_fast_syscall_32+0x3c7/0x6e0 arch/x86/entry/common.c:410
 entry_SYSENTER_compat+0x68/0x77 arch/x86/entry/entry_64_compat.S:139
=====================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

