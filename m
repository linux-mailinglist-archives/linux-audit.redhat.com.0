Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 481EE16A775
	for <lists+linux-audit@lfdr.de>; Mon, 24 Feb 2020 14:42:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582551747;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PgQKy56NuL2VMPToEUL4KJblC4DEuyTSwaZmDCNbJ+I=;
	b=M2ZdG29Q3wqwCcx9jqelvD5zZ9YUupJgNqIHQsp4R9YZVp+HSRhBzEOsnnDIbdJfbpP4lR
	OD0FXS+hklH3mBOlU7z/3qxnCQ5wUdpYJmLsGqxw8MpW6R+L6Si1hMcyh8k+xAxI/Jz7WQ
	R4n3gLKHfRmWeCojMPG8UNkn0M9sDto=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-qsC-V560O_eSEbmr0IAoWQ-1; Mon, 24 Feb 2020 08:42:25 -0500
X-MC-Unique: qsC-V560O_eSEbmr0IAoWQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB5EE189F763;
	Mon, 24 Feb 2020 13:42:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B01CC5C554;
	Mon, 24 Feb 2020 13:42:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EA3D3860EC;
	Mon, 24 Feb 2020 13:42:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01O8SInA031396 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 24 Feb 2020 03:28:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C7CE720316E0; Mon, 24 Feb 2020 08:28:18 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2DBC2026D68
	for <linux-audit@redhat.com>; Mon, 24 Feb 2020 08:28:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A6208007A4
	for <linux-audit@redhat.com>; Mon, 24 Feb 2020 08:28:16 +0000 (UTC)
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
	[209.85.166.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-437-jzu9XfpOMuSOXQIBgTOqJg-1; Mon, 24 Feb 2020 03:28:14 -0500
X-MC-Unique: jzu9XfpOMuSOXQIBgTOqJg-1
Received: by mail-io1-f72.google.com with SMTP id c7so14214910ioq.18
	for <linux-audit@redhat.com>; Mon, 24 Feb 2020 00:28:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=pYGatFicrbglupdARJznOrNIqMZ4ujkbH/2DBHb9eKg=;
	b=ARDTinXc/JeUd2ssgUSXE8ryqMID49j+3swxsUafaPW8lrhKrTB25HJ1FtuCUabBoN
	eUXIuRJKuNxR874ZUBu8v+9L8MlHIBOZBCHWltb8ATLCxVnXKM5CkkLl8qWakakw72yY
	1pm+tZUfRtlfm1r851XnNhOvlzirN2bWDWmbaVVBaQr1K1QOjdNel1MBpibcTCIUNfqa
	eATgM3VLDYp/v5gQb1QBze+p7BFkA1FLPynfsWfUV0h00sNIIoWnl4fTm9vtVRWtLjWg
	Fgs20S79zz4eHtaZpX0lu1lfiyon5o9bwGTtpd2Eqrmc6a1qDVOe60YZGaMM8He7crC2
	0icA==
X-Gm-Message-State: APjAAAUeGihT3iMGFAxrgD+40cAuMw13+W3gelZf1S2RcaIyzjFWQj8+
	/zLtW1q8iwncFeVqISYP9ICNVheI0DB3o1vdjIwp+barFwwa
X-Google-Smtp-Source: APXvYqzBY2WbTHwkw5r6uemXyd4m2EQk7GMd+RoLGF9laEPT2xiswkHlF8OOmE7RkUrrGhPe6sa0+d9ze2j6ARx+pXcDCeWtia6D
MIME-Version: 1.0
X-Received: by 2002:a92:cc04:: with SMTP id s4mr35066051ilp.193.1582532893787; 
	Mon, 24 Feb 2020 00:28:13 -0800 (PST)
Date: Mon, 24 Feb 2020 00:28:13 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000fac9a5059f4e266d@google.com>
Subject: KMSAN: uninit-value in audit_log_vformat
From: syzbot <syzbot+e4b12d8d202701f08b6d@syzkaller.appspotmail.com>
To: eparis@redhat.com, glider@google.com, linux-audit@redhat.com,
	linux-kernel@vger.kernel.org, paul@paul-moore.com,
	syzkaller-bugs@googlegroups.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01O8SInA031396
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

syzbot found the following crash on:

HEAD commit:    8bbbc5cf kmsan: don't compile memmove
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=11d7c109e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cd0e9a6b0e555cc3
dashboard link: https://syzkaller.appspot.com/bug?extid=e4b12d8d202701f08b6d
compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
userspace arch: i386
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1287fdd9e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13ffec81e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+e4b12d8d202701f08b6d@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in string_nocheck lib/vsprintf.c:608 [inline]
BUG: KMSAN: uninit-value in string+0x522/0x690 lib/vsprintf.c:689
CPU: 1 PID: 12069 Comm: syz-executor170 Not tainted 5.6.0-rc2-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x1c9/0x220 lib/dump_stack.c:118
 kmsan_report+0xf7/0x1e0 mm/kmsan/kmsan_report.c:118
 __msan_warning+0x58/0xa0 mm/kmsan/kmsan_instr.c:215
 string_nocheck lib/vsprintf.c:608 [inline]
 string+0x522/0x690 lib/vsprintf.c:689
 vsnprintf+0x207d/0x31b0 lib/vsprintf.c:2574
 audit_log_vformat+0x583/0xcd0 kernel/audit.c:1856
 audit_log_format+0x220/0x260 kernel/audit.c:1890
 audit_receive_msg kernel/audit.c:1338 [inline]
 audit_receive+0x3688/0x6be0 kernel/audit.c:1513
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
RIP: 0023:0xf7f12d99
Code: 90 e8 0b 00 00 00 f3 90 0f ae e8 eb f9 8d 74 26 00 89 3c 24 c3 90 90 90 90 90 90 90 90 90 90 90 90 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 eb 0d 90 90 90 90 90 90 90 90 90 90 90 90
RSP: 002b:00000000ffadf8ac EFLAGS: 00000246 ORIG_RAX: 0000000000000172
RAX: ffffffffffffffda RBX: 0000000000000004 RCX: 0000000020000200
RDX: 0000000000000000 RSI: 00000000080ea080 RDI: 00000000ffadf900
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

