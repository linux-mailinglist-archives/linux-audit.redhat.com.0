Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id EFF84168BD1
	for <lists+linux-audit@lfdr.de>; Sat, 22 Feb 2020 02:47:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582336043;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GvZSY6MgJ4H9yazwlaMiK63L0IyEUHFW3MXSnC/Gidg=;
	b=SXKctIGzCf7u9Py0+fxPSLFdqtvFG6AhPfJtokzpWUlPpu15fe6TLWSgvgw4HCkUpsw/+7
	L20mDyLvnNMrxGt9m3jhgvazDe428CnzOQj0HBiGXQ0qc+PawqGzc/iVGqQ3LU4VxpuEkA
	etPFhg4r4FbMUubihU6fzTO51o8FInQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-g0U4AlIDMA6x4vqCp_XrRw-1; Fri, 21 Feb 2020 20:47:21 -0500
X-MC-Unique: g0U4AlIDMA6x4vqCp_XrRw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79905800D50;
	Sat, 22 Feb 2020 01:47:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED1939051B;
	Sat, 22 Feb 2020 01:47:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 11FFD1809567;
	Sat, 22 Feb 2020 01:47:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01M1DKhD005148 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 21 Feb 2020 20:13:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 64D3D165440; Sat, 22 Feb 2020 01:13:20 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6097516544A
	for <linux-audit@redhat.com>; Sat, 22 Feb 2020 01:13:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F180985A304
	for <linux-audit@redhat.com>; Sat, 22 Feb 2020 01:13:17 +0000 (UTC)
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
	[209.85.166.198]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-254-neNW1ELaMLGfEbfRBB5c0g-1; Fri, 21 Feb 2020 20:13:13 -0500
X-MC-Unique: neNW1ELaMLGfEbfRBB5c0g-1
Received: by mail-il1-f198.google.com with SMTP id u14so4429567ilq.15
	for <linux-audit@redhat.com>; Fri, 21 Feb 2020 17:13:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=6eLAPqtZ8c5EdwJf7EVWvvnHhrg/3kPG4gMqHFy5v4A=;
	b=swzbwxwO2YaXiegdXwzg4nfbP/Plxsj+BllMFM22VrvlPfQ0derYe5aTMEKpNMPmdS
	XrvF3FAc3VSXKkMdX3Zusdb8eK4ORVZG2DPI4ENNPw90VlYoeVdINebaMVo0W4MYlrfR
	jyIruZHQQWaIowvWvnDYDNJ1GsUSyXcLcRNBhAu/oBvFz6AJyFZQ7YCbmIXZuE061ZfW
	EV15AJ4SEL/EfDEyyW8IvHg9zBKyIuHeqExFY+wf56uTHrkmSpTPp66fEGOhk7RIAovN
	jI1gLHdowb9OLcb7tmVX4JImePibcgvebbldlOKzMF4QB4gtiFj3x5qaTHd+/CCpPQew
	4pTw==
X-Gm-Message-State: APjAAAUuUqXMjJbkH/V8Sm5NNEWMVcupULlJ6IAo7S26iRrIcNOUZHjd
	vaxAjbnzK3SJqwx/OPagBe+rhqmXjzhgtR/s4JdYrF4NakTR
X-Google-Smtp-Source: APXvYqzbaMogp/HG01MNtFex4blRaUgwqV4zRTvObvGHWAiNFmsEDRlx2xNtXRh0TW9qSQF6PSZLllmHa9ms9GXF7vKm0O5NRTl6
MIME-Version: 1.0
X-Received: by 2002:a6b:740c:: with SMTP id s12mr36894580iog.108.1582333992768;
	Fri, 21 Feb 2020 17:13:12 -0800 (PST)
Date: Fri, 21 Feb 2020 17:13:12 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008e18fb059f1fd725@google.com>
Subject: kernel BUG at arch/x86/mm/physaddr.c:LINE! (4)
From: syzbot <syzbot+1f4d90ead370d72e450b@syzkaller.appspotmail.com>
To: eparis@redhat.com, linux-audit@redhat.com, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, paul@paul-moore.com,
	syzkaller-bugs@googlegroups.com
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01M1DKhD005148
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 21 Feb 2020 20:46:52 -0500
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

HEAD commit:    36a44bcd Merge branch 'bnxt_en-shutdown-and-kexec-kdump-re..
git tree:       net
console output: https://syzkaller.appspot.com/x/log.txt?x=12524265e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=768cc3d3e277cc16
dashboard link: https://syzkaller.appspot.com/bug?extid=1f4d90ead370d72e450b
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=123d9de9e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1648fe09e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+1f4d90ead370d72e450b@syzkaller.appspotmail.com

------------[ cut here ]------------
kernel BUG at arch/x86/mm/physaddr.c:28!
invalid opcode: 0000 [#1] PREEMPT SMP KASAN
CPU: 1 PID: 9873 Comm: syz-executor039 Not tainted 5.6.0-rc1-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:__phys_addr+0xb3/0x120 arch/x86/mm/physaddr.c:28
Code: 09 4c 89 e3 31 ff 48 d3 eb 48 89 de e8 36 e2 40 00 48 85 db 75 0f e8 8c e0 40 00 4c 89 e0 5b 41 5c 41 5d 5d c3 e8 7d e0 40 00 <0f> 0b e8 76 e0 40 00 48 c7 c0 10 50 a7 89 48 ba 00 00 00 00 00 fc
RSP: 0018:ffffc90005b47490 EFLAGS: 00010093
RAX: ffff8880944f4600 RBX: 0000000002777259 RCX: ffffffff8134ad32
RDX: 0000000000000000 RSI: ffffffff8134ad93 RDI: 0000000000000006
RBP: ffffc90005b474a8 R08: ffff8880944f4600 R09: ffffed1015d2707c
R10: ffffed1015d2707b R11: ffff8880ae9383db R12: 0000778002777259
R13: 0000000082777259 R14: ffff88809a765000 R15: 0000000000000010
FS:  0000000001436880(0000) GS:ffff8880ae900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000200004c0 CR3: 0000000096da8000 CR4: 00000000001406e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 virt_to_head_page include/linux/mm.h:721 [inline]
 virt_to_cache mm/slab.h:472 [inline]
 kfree+0x7b/0x2c0 mm/slab.c:3749
 audit_free_lsm_field kernel/auditfilter.c:76 [inline]
 audit_free_rule kernel/auditfilter.c:91 [inline]
 audit_data_to_entry+0xb7b/0x25f0 kernel/auditfilter.c:603
 audit_rule_change+0x6b5/0x1130 kernel/auditfilter.c:1130
 audit_receive_msg+0xda5/0x28b0 kernel/audit.c:1368
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
RIP: 0033:0x4401a9
Code: 18 89 d0 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 fb 13 fc ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007ffd66553d28 EFLAGS: 00000246 ORIG_RAX: 000000000000002e
RAX: ffffffffffffffda RBX: 00000000004002c8 RCX: 00000000004401a9
RDX: 0000000000000000 RSI: 00000000200004c0 RDI: 0000000000000003
RBP: 00000000006ca018 R08: 0000000000000000 R09: 00000000004002c8
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000401a30
R13: 0000000000401ac0 R14: 0000000000000000 R15: 0000000000000000
Modules linked in:
---[ end trace 1e4db35053a9d748 ]---
RIP: 0010:__phys_addr+0xb3/0x120 arch/x86/mm/physaddr.c:28
Code: 09 4c 89 e3 31 ff 48 d3 eb 48 89 de e8 36 e2 40 00 48 85 db 75 0f e8 8c e0 40 00 4c 89 e0 5b 41 5c 41 5d 5d c3 e8 7d e0 40 00 <0f> 0b e8 76 e0 40 00 48 c7 c0 10 50 a7 89 48 ba 00 00 00 00 00 fc
RSP: 0018:ffffc90005b47490 EFLAGS: 00010093
RAX: ffff8880944f4600 RBX: 0000000002777259 RCX: ffffffff8134ad32
RDX: 0000000000000000 RSI: ffffffff8134ad93 RDI: 0000000000000006
RBP: ffffc90005b474a8 R08: ffff8880944f4600 R09: ffffed1015d2707c
R10: ffffed1015d2707b R11: ffff8880ae9383db R12: 0000778002777259
R13: 0000000082777259 R14: ffff88809a765000 R15: 0000000000000010
FS:  0000000001436880(0000) GS:ffff8880ae900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000200004c0 CR3: 0000000096da8000 CR4: 00000000001406e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


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

