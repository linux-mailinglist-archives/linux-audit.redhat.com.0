Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2BDB916A770
	for <lists+linux-audit@lfdr.de>; Mon, 24 Feb 2020 14:42:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582551742;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=x1ZwgDW3Xuz/O9p456VpieIx42p2JL4ci93XXN6RYHs=;
	b=KDhJjCRqAYPi/sc/gwWb1FjRe7KniLw++si5tuC3xxw44C38XI+Ew7SDWjEHW/15SUC1vq
	Hetb5YiIIgrO+xwtJ0s6e4Ju1T2TilVDoA2bMAKsIxBSTmEQZwZAQ/DFCA5CVKxiXW+KO6
	jx5OWheZAkikRI8vYVQGFrCiiICZ+Ec=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-wNjRFcRbNwm89JNmK_hvzA-1; Mon, 24 Feb 2020 08:42:19 -0500
X-MC-Unique: wNjRFcRbNwm89JNmK_hvzA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C658213E4;
	Mon, 24 Feb 2020 13:42:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C51F5C557;
	Mon, 24 Feb 2020 13:42:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DF59D18089C8;
	Mon, 24 Feb 2020 13:42:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01O88I7u029600 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 24 Feb 2020 03:08:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 482942166B2E; Mon, 24 Feb 2020 08:08:18 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 441D62166B2B
	for <linux-audit@redhat.com>; Mon, 24 Feb 2020 08:08:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CDE3B101A55D
	for <linux-audit@redhat.com>; Mon, 24 Feb 2020 08:08:15 +0000 (UTC)
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
	[209.85.166.199]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-186-AAdphnWzOP2PV3KH9P6vRg-1; Mon, 24 Feb 2020 03:08:13 -0500
X-MC-Unique: AAdphnWzOP2PV3KH9P6vRg-1
Received: by mail-il1-f199.google.com with SMTP id s13so16963856ili.9
	for <linux-audit@redhat.com>; Mon, 24 Feb 2020 00:08:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=Wna1rMldzsmbnjszH8n3rODL+05VVA6Ale5k8VVJ2i4=;
	b=kylaccE+mzHc/5HbcJQZ7XcGoO8QFJIsh+JW7e65MjLeEmY8/b8bFpScCFyI3/SO3h
	ZiqSKynVoYn5tR9R8XmjGFGfWps9xScfZImIhNFafoEAW5eP10SlqR6Y/BMNn4BxM21j
	t4i+dEn3bQxweQBKfTmAPHH1BjuupGKeh1U+s59gzlxNVH6tQZgnXkek2v+K7mzEHuK+
	wXnUdikqJv+hNcyr7RhJNhlydcl3bLy+VR2tPET8dnBZInMpCzw/nFdJ7zAd3IkNZO1L
	lxZ1G2Pmdgw3pK3e0dBd53idSYHbhFYoQJEEq8OpQCc1Je7FASeepbiKChSeOdpSmrnn
	vNFw==
X-Gm-Message-State: APjAAAV7SJ3aUhJBPqYbal8Uad7VpunCLyaLohu/XSdUFVKK2exPhbnA
	2REBrexg765ZDH/2m8B8jnEOQJ01UV21f94da+R+BoeU4ZkJ
X-Google-Smtp-Source: APXvYqyvSyynHQG4jiljx7UD/b0fRBe/Nar2IzCegIL4JyjWa1ESBPfuOi1gU9+drfh+dlzfeBgOhWR3+WmkaRWZM6CYPwgpv1IS
MIME-Version: 1.0
X-Received: by 2002:a92:3a9b:: with SMTP id i27mr60243880ilf.39.1582531692452; 
	Mon, 24 Feb 2020 00:08:12 -0800 (PST)
Date: Mon, 24 Feb 2020 00:08:12 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000005fe204059f4ddf27@google.com>
Subject: kernel panic: audit: rate limit exceeded
From: syzbot <syzbot+72461ac44b36c98f58e5@syzkaller.appspotmail.com>
To: eparis@redhat.com, kvalo@codeaurora.org, linux-audit@redhat.com,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	paul@paul-moore.com, peter.senna@collabora.com,
	romain.perier@collabora.com, stas.yakovlev@gmail.com,
	syzkaller-bugs@googlegroups.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01O88I7u029600
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

HEAD commit:    0c0ddd6a Merge tag 'linux-watchdog-5.6-rc3' of git://www.l..
git tree:       net
console output: https://syzkaller.appspot.com/x/log.txt?x=12c8a3d9e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3b8906eb6a7d6028
dashboard link: https://syzkaller.appspot.com/bug?extid=72461ac44b36c98f58e5
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14c803ede00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17237de9e00000

The bug was bisected to:

commit 28b75415ad19fef232d8daab4d5de17d753f0b36
Author: Romain Perier <romain.perier@collabora.com>
Date:   Wed Aug 23 07:16:51 2017 +0000

    wireless: ipw2200: Replace PCI pool old API

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12dbfe09e00000
final crash:    https://syzkaller.appspot.com/x/report.txt?x=11dbfe09e00000
console output: https://syzkaller.appspot.com/x/log.txt?x=16dbfe09e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+72461ac44b36c98f58e5@syzkaller.appspotmail.com
Fixes: 28b75415ad19 ("wireless: ipw2200: Replace PCI pool old API")

audit: audit_lost=1 audit_rate_limit=2 audit_backlog_limit=0
Kernel panic - not syncing: audit: rate limit exceeded
CPU: 1 PID: 10031 Comm: syz-executor626 Not tainted 5.6.0-rc2-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x197/0x210 lib/dump_stack.c:118
 panic+0x2e3/0x75c kernel/panic.c:221
 audit_panic.cold+0x32/0x32 kernel/audit.c:307
 audit_log_lost kernel/audit.c:377 [inline]
 audit_log_lost+0x8b/0x180 kernel/audit.c:349
 audit_log_end+0x23c/0x2b0 kernel/audit.c:2322
 audit_log_config_change+0xcc/0xf0 kernel/audit.c:396
 audit_receive_msg+0x2246/0x28b0 kernel/audit.c:1277
 audit_receive+0x114/0x230 kernel/audit.c:1513
 netlink_unicast_kernel net/netlink/af_netlink.c:1303 [inline]
 netlink_unicast+0x59e/0x7e0 net/netlink/af_netlink.c:1329
 netlink_sendmsg+0x91c/0xea0 net/netlink/af_netlink.c:1918
 sock_sendmsg_nosec net/socket.c:652 [inline]
 sock_sendmsg+0xd7/0x130 net/socket.c:672
 ____sys_sendmsg+0x753/0x880 net/socket.c:2343
 ___sys_sendmsg+0x100/0x170 net/socket.c:2397
 __sys_sendmsg+0x105/0x1d0 net/socket.c:2430
 __do_sys_sendmsg net/socket.c:2439 [inline]
 __se_sys_sendmsg net/socket.c:2437 [inline]
 __x64_sys_sendmsg+0x78/0xb0 net/socket.c:2437
 do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x441239
Code: e8 fc ab 02 00 48 83 c4 18 c3 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 9b 09 fc ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007ffd68c9df48 EFLAGS: 00000246 ORIG_RAX: 000000000000002e
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 0000000000441239
RDX: 0000000000000000 RSI: 00000000200006c0 RDI: 0000000000000003
RBP: 0000000000018b16 R08: 00000000004002c8 R09: 00000000004002c8
R10: 0000000000000004 R11: 0000000000000246 R12: 0000000000402060
R13: 00000000004020f0 R14: 0000000000000000 R15: 0000000000000000
Kernel Offset: disabled
Rebooting in 86400 seconds..


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

