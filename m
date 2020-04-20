Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 6A9D31B0B6A
	for <lists+linux-audit@lfdr.de>; Mon, 20 Apr 2020 14:56:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587387368;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lfVG/MBI+iOV4uQd8ByhXCYXl92IdQrZlK6l7D4+yAY=;
	b=XB84JkpwN4UiZnxNMNbZWBW/uxcgA+iNTOaEP7dRNb/nxFt0gfw+mqY+Xs3Vkz2OMvWyfx
	oxFjwBTHd1wHRnnzoRgw0utV4QYbQ+W1gZXsJBndReAIt8D0XnlkeJIugoJdmmUhD0luzW
	IClNnX2C2sy6Rl+duHVRPoUBZ+9lFrQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-VynWorUwPYuOCKbyim1LAg-1; Mon, 20 Apr 2020 08:56:04 -0400
X-MC-Unique: VynWorUwPYuOCKbyim1LAg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 469F9801E5A;
	Mon, 20 Apr 2020 12:55:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AB7BA1898;
	Mon, 20 Apr 2020 12:55:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6408093907;
	Mon, 20 Apr 2020 12:55:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03K5ZJnG023662 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 20 Apr 2020 01:35:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9C5721CBD0; Mon, 20 Apr 2020 05:35:19 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9849FAF7A1
	for <linux-audit@redhat.com>; Mon, 20 Apr 2020 05:35:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48115185A790
	for <linux-audit@redhat.com>; Mon, 20 Apr 2020 05:35:17 +0000 (UTC)
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
	[209.85.166.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-187-dUNeDBFTOpa4hGJ33QqF_Q-1; Mon, 20 Apr 2020 01:35:14 -0400
X-MC-Unique: dUNeDBFTOpa4hGJ33QqF_Q-1
Received: by mail-io1-f69.google.com with SMTP id v23so10446982ioj.14
	for <linux-audit@redhat.com>; Sun, 19 Apr 2020 22:35:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=h/BvHvMfds32NfgtE98V2KP6Bs++QvZcaliDj82Cs0E=;
	b=Z3nVuOuDYkiZitPDevPHjpP7zTbEL4wJCrJogUTmdIB/sftEsxjjZtGDTptHpraZG1
	5Ert3F8VTa/Cp6RtZk+NytKSHmwTtIaLYXVIQwGkCp7VUd2veM9K20tIs+Wn/DkV8Efg
	/loaZPRv2h5lb/4Uc8WhdySRP0tiypUVuQuYdEW8pHqd8ZC07P8hsv4uqucDsNW28D4G
	k/iFA2E9pDgfrwb50aS8sgLPZG78Vbn3l93ntdDeuVf2i2pYYAE00ORBrOLprSwMI46Q
	k3T9JzNI7zo/hmMANYEp2vMAmzQZKnCIypGbBJGBqbZk8WhNbma/RPrXaap8PLBhlPN7
	oqCA==
X-Gm-Message-State: AGi0PuaXSrfigQI8TIgZQU57EXhgNu0l5/oSiNW/BvJCln7VslF9amSQ
	YGI43C+JSNXtQPRzro32JFo4gS7h5F2U2+8tIFEQVNmYGgx7
X-Google-Smtp-Source: APiQypLbMNCAg8juI7DU5HhW3a6QLULnSLinXE3REp1inSW17hBXgpxyQyOzwzcnKgTIuhgyGKBF8HWyhClxQa95esEk7KAEOrVS
MIME-Version: 1.0
X-Received: by 2002:a92:5d5b:: with SMTP id r88mr14510816ilb.206.1587360913748;
	Sun, 19 Apr 2020 22:35:13 -0700 (PDT)
Date: Sun, 19 Apr 2020 22:35:13 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000064f6e505a3b243aa@google.com>
Subject: KMSAN: uninit-value in audit_log_vformat (2)
From: syzbot <syzbot+49e69b4d71a420ceda3e@syzkaller.appspotmail.com>
To: eparis@redhat.com, glider@google.com, linux-audit@redhat.com,
	linux-kernel@vger.kernel.org, paul@paul-moore.com,
	syzkaller-bugs@googlegroups.com
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03K5ZJnG023662
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 20 Apr 2020 08:55:30 -0400
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

Hello,

syzbot found the following crash on:

HEAD commit:    5356842d [EXPERIMENTAL] kmsan: eagerly allocate shadow at ..
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=12f06720100000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a5915107b3106aaa
dashboard link: https://syzkaller.appspot.com/bug?extid=49e69b4d71a420ceda3e
compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
userspace arch: i386
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=133b5dabe00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=143e1610100000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+49e69b4d71a420ceda3e@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in string_nocheck lib/vsprintf.c:608 [inline]
BUG: KMSAN: uninit-value in string+0x522/0x690 lib/vsprintf.c:689
CPU: 1 PID: 8854 Comm: syz-executor694 Not tainted 5.6.0-rc7-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x1c9/0x220 lib/dump_stack.c:118
 kmsan_report+0xf7/0x1e0 mm/kmsan/kmsan_report.c:118
 __msan_warning+0x58/0xa0 mm/kmsan/kmsan_instr.c:215
 string_nocheck lib/vsprintf.c:608 [inline]
 string+0x522/0x690 lib/vsprintf.c:689
 vsnprintf+0x207d/0x31b0 lib/vsprintf.c:2574
 audit_log_vformat+0x583/0xcd0 kernel/audit.c:1858
 audit_log_format+0x220/0x260 kernel/audit.c:1892
 audit_receive_msg kernel/audit.c:1344 [inline]
 audit_receive+0x18a4/0x6d50 kernel/audit.c:1515
 netlink_unicast_kernel net/netlink/af_netlink.c:1303 [inline]
 netlink_unicast+0xf9e/0x1100 net/netlink/af_netlink.c:1329
 netlink_sendmsg+0x1246/0x14d0 net/netlink/af_netlink.c:1918
 sock_sendmsg_nosec net/socket.c:652 [inline]
 sock_sendmsg net/socket.c:672 [inline]
 ____sys_sendmsg+0x12b6/0x1350 net/socket.c:2345
 ___sys_sendmsg net/socket.c:2399 [inline]
 __sys_sendmsg+0x451/0x5f0 net/socket.c:2432
 __compat_sys_sendmsg net/compat.c:642 [inline]
 __do_compat_sys_sendmsg net/compat.c:649 [inline]
 __se_compat_sys_sendmsg net/compat.c:646 [inline]
 __ia32_compat_sys_sendmsg+0xed/0x130 net/compat.c:646
 do_syscall_32_irqs_on arch/x86/entry/common.c:339 [inline]
 do_fast_syscall_32+0x3c7/0x6e0 arch/x86/entry/common.c:410
 entry_SYSENTER_compat+0x68/0x77 arch/x86/entry/entry_64_compat.S:139
RIP: 0023:0xf7fa0d99
Code: 90 e8 0b 00 00 00 f3 90 0f ae e8 eb f9 8d 74 26 00 89 3c 24 c3 90 90 90 90 90 90 90 90 90 90 90 90 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 eb 0d 90 90 90 90 90 90 90 90 90 90 90 90
RSP: 002b:00000000ffb27c7c EFLAGS: 00000246 ORIG_RAX: 0000000000000172
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00000000200002c0
RDX: 0000000000000000 RSI: 00000000080ea078 RDI: 00000000ffb27cd0
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000

Uninit was created at:
 kmsan_save_stack_with_flags mm/kmsan/kmsan.c:144 [inline]
 kmsan_internal_poison_shadow+0x66/0xd0 mm/kmsan/kmsan.c:127
 kmsan_slab_alloc+0x8a/0xe0 mm/kmsan/kmsan_hooks.c:82
 slab_alloc_node mm/slub.c:2801 [inline]
 __kmalloc_node_track_caller+0xb40/0x1200 mm/slub.c:4420
 __kmalloc_reserve net/core/skbuff.c:142 [inline]
 __alloc_skb+0x2fd/0xac0 net/core/skbuff.c:210
 alloc_skb include/linux/skbuff.h:1081 [inline]
 netlink_alloc_large_skb net/netlink/af_netlink.c:1175 [inline]
 netlink_sendmsg+0x7d3/0x14d0 net/netlink/af_netlink.c:1893
 sock_sendmsg_nosec net/socket.c:652 [inline]
 sock_sendmsg net/socket.c:672 [inline]
 ____sys_sendmsg+0x12b6/0x1350 net/socket.c:2345
 ___sys_sendmsg net/socket.c:2399 [inline]
 __sys_sendmsg+0x451/0x5f0 net/socket.c:2432
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

