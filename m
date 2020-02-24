Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id E4C6016A771
	for <lists+linux-audit@lfdr.de>; Mon, 24 Feb 2020 14:42:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582551742;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=d9tSFOBFMaX/yud+lXr6B5Plldm8pwIY1fdI6uQhh14=;
	b=TDxtcXgPEmWulkQubtOJ35wobJg/ZVPeRpahLQ3M0Xmj9Dr12kNDVE4UXEq/VDkUYZVeNO
	UAG1YkR/dS9SXG76KmLjdLL9jljEr+p4aG3JXBDV7w9zEKmdYw3k6gs+AfUoVa59aiUbwx
	Y39Ai9+9lIRtlub9H8sfFV1I/AL6a3o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270--zwU6tHjP0ePl8H9dzDeUw-1; Mon, 24 Feb 2020 08:42:20 -0500
X-MC-Unique: -zwU6tHjP0ePl8H9dzDeUw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A551F13F5;
	Mon, 24 Feb 2020 13:42:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 836C08AC30;
	Mon, 24 Feb 2020 13:42:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3A45E860ED;
	Mon, 24 Feb 2020 13:42:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01O8ILtb030533 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 24 Feb 2020 03:18:22 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B52901004C40; Mon, 24 Feb 2020 08:18:21 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AFFF71004C57
	for <linux-audit@redhat.com>; Mon, 24 Feb 2020 08:18:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 40B88185A791
	for <linux-audit@redhat.com>; Mon, 24 Feb 2020 08:18:19 +0000 (UTC)
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
	[209.85.166.197]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-435-o_rosfJEOXq4L7EzgkXUGQ-1; Mon, 24 Feb 2020 03:18:14 -0500
X-MC-Unique: o_rosfJEOXq4L7EzgkXUGQ-1
Received: by mail-il1-f197.google.com with SMTP id h87so16889610ild.11
	for <linux-audit@redhat.com>; Mon, 24 Feb 2020 00:18:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=JLPU87tnj1f/dwZOZUf4sgSYUIjyyQgE9NDCtchiKHg=;
	b=l9XsctdGQCfnDjQO8LEpMcwI1P4xQGYINSvxwrF/1NhEstRVSWIEqMtdLOyDNNMzmR
	5dykIcmOREeHowcbzXlbbw5yx3wxHps0yylKeB4aRlX+QYMnavY2K6tItpML/zK6eB9i
	B0nMqwdj8TjaZGnRbgqGErvGJZ2mKZaWgqwjS7ahKRgJasyBj4S9GSWfRiPyCNikUYW4
	fTSUFN3i0qBchpDvFXw/stqZxyEQuL2Y+u5AbpS7IdHPWVSPuhihChV2Xxq137PxtmWe
	aBb9NqdfWP5fvBBFiMaJ655PWLLU8s/tgkBdVNLSWvkPF/SfSzf49oC/xFEIeS9yf/Hy
	rFbg==
X-Gm-Message-State: APjAAAXxqBS0yjURGkMTFLhJkcktfLolHUenVXtTcmPmjAjhIQPZD8ah
	/LHH/7LnSZ3aSsLW1PqF5FdGx58kkycqN2tulotJmoo4UidF
X-Google-Smtp-Source: APXvYqweqrylK3pukroyPFpF1CqM/vmRCGM+KOrt5PclygW/HBOfAPZfaJMekDpiEsgrLRmdG8dMFShCCyW/LuXmtBU0b3/BSwvs
MIME-Version: 1.0
X-Received: by 2002:a92:3a07:: with SMTP id h7mr57387937ila.203.1582532294128; 
	Mon, 24 Feb 2020 00:18:14 -0800 (PST)
Date: Mon, 24 Feb 2020 00:18:14 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003cbb40059f4e0346@google.com>
Subject: kernel panic: audit: backlog limit exceeded
From: syzbot <syzbot+9a5e789e4725b9ef1316@syzkaller.appspotmail.com>
To: a@unstable.cc, b.a.t.m.a.n@diktynna.open-mesh.org,
	dan.carpenter@oracle.com, davem@davemloft.net, eparis@redhat.com,
	fzago@cray.com, gregkh@linuxfoundation.org, john.hammond@intel.com,
	linux-audit@redhat.com, linux-kernel@vger.kernel.org,
	mareklindner@neomailbox.ch, netdev@vger.kernel.org,
	paul@paul-moore.com, sw@simonwunderlich.de, syzkaller-bugs@googlegroups.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01O8ILtb030533
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

syzbot found the following crash on:

HEAD commit:    36a44bcd Merge branch 'bnxt_en-shutdown-and-kexec-kdump-re..
git tree:       net
console output: https://syzkaller.appspot.com/x/log.txt?x=148bfdd9e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=768cc3d3e277cc16
dashboard link: https://syzkaller.appspot.com/bug?extid=9a5e789e4725b9ef1316
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=151b1109e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=128bfdd9e00000

The bug was bisected to:

commit 0c1b9970ddd4cc41002321c3877e7f91aacb896d
Author: Dan Carpenter <dan.carpenter@oracle.com>
Date:   Fri Jul 28 14:42:27 2017 +0000

    staging: lustre: lustre: Off by two in lmv_fid2path()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17e6c3e9e00000
final crash:    https://syzkaller.appspot.com/x/report.txt?x=1416c3e9e00000
console output: https://syzkaller.appspot.com/x/log.txt?x=1016c3e9e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+9a5e789e4725b9ef1316@syzkaller.appspotmail.com
Fixes: 0c1b9970ddd4 ("staging: lustre: lustre: Off by two in lmv_fid2path()")

audit: audit_backlog=13 > audit_backlog_limit=7
audit: audit_lost=1 audit_rate_limit=0 audit_backlog_limit=7
Kernel panic - not syncing: audit: backlog limit exceeded
CPU: 1 PID: 9913 Comm: syz-executor024 Not tainted 5.6.0-rc1-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x197/0x210 lib/dump_stack.c:118
 panic+0x2e3/0x75c kernel/panic.c:221
 audit_panic.cold+0x32/0x32 kernel/audit.c:307
 audit_log_lost kernel/audit.c:377 [inline]
 audit_log_lost+0x8b/0x180 kernel/audit.c:349
 audit_log_start kernel/audit.c:1788 [inline]
 audit_log_start+0x70e/0x7c0 kernel/audit.c:1745
 audit_log+0x95/0x120 kernel/audit.c:2345
 xt_replace_table+0x61d/0x830 net/netfilter/x_tables.c:1413
 __do_replace+0x1da/0x950 net/ipv6/netfilter/ip6_tables.c:1084
 do_replace net/ipv6/netfilter/ip6_tables.c:1157 [inline]
 do_ip6t_set_ctl+0x33a/0x4c8 net/ipv6/netfilter/ip6_tables.c:1681
 nf_sockopt net/netfilter/nf_sockopt.c:106 [inline]
 nf_setsockopt+0x77/0xd0 net/netfilter/nf_sockopt.c:115
 ipv6_setsockopt net/ipv6/ipv6_sockglue.c:949 [inline]
 ipv6_setsockopt+0x147/0x180 net/ipv6/ipv6_sockglue.c:933
 tcp_setsockopt net/ipv4/tcp.c:3165 [inline]
 tcp_setsockopt+0x8f/0xe0 net/ipv4/tcp.c:3159
 sock_common_setsockopt+0x94/0xd0 net/core/sock.c:3149
 __sys_setsockopt+0x261/0x4c0 net/socket.c:2130
 __do_sys_setsockopt net/socket.c:2146 [inline]
 __se_sys_setsockopt net/socket.c:2143 [inline]
 __x64_sys_setsockopt+0xbe/0x150 net/socket.c:2143
 do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x44720a
Code: 49 89 ca b8 37 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 1a e0 fb ff c3 66 0f 1f 84 00 00 00 00 00 49 89 ca b8 36 00 00 00 0f 05 <48> 3d 01 f0 ff ff 0f 83 fa df fb ff c3 66 0f 1f 84 00 00 00 00 00
RSP: 002b:00007ffd032dec78 EFLAGS: 00000286 ORIG_RAX: 0000000000000036
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 000000000044720a
RDX: 0000000000000040 RSI: 0000000000000029 RDI: 0000000000000003
RBP: 00007ffd032deda0 R08: 00000000000003b8 R09: 0000000000004000
R10: 00000000006d7b40 R11: 0000000000000286 R12: 00007ffd032deca0
R13: 00000000006d9d60 R14: 0000000000000029 R15: 00000000006d7ba0
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

