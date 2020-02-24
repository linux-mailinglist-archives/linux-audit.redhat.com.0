Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 280EE16B42C
	for <lists+linux-audit@lfdr.de>; Mon, 24 Feb 2020 23:38:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582583899;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oEz40qpihBze5otCAvusBPPHR2Mu75ksryGDZsUFR6Q=;
	b=TXwgmNM+sn1XWLwIPemUd9pR7tA1kwp4OTSoiPEtmiD/XPWlOR3o7ZWKF+74Yw6wKeWSf+
	RCIqU3g4K4O2ZUB+LDMyT33F9tYTZi8tQpdMkPsvL/VIZeZFoNrgQZcGn0NPWdZmotKazW
	ABcTHwTCLIm+XBNbgI4m8C+oqUMeeeE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-jah358P3PEm6VSMnxU5TdQ-1; Mon, 24 Feb 2020 17:38:16 -0500
X-MC-Unique: jah358P3PEm6VSMnxU5TdQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5147B8017CC;
	Mon, 24 Feb 2020 22:38:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C42C45D9CD;
	Mon, 24 Feb 2020 22:38:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 281D2860EF;
	Mon, 24 Feb 2020 22:38:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01OMbvhX023912 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 24 Feb 2020 17:37:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9EC972166B28; Mon, 24 Feb 2020 22:37:57 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A1F62166B27
	for <linux-audit@redhat.com>; Mon, 24 Feb 2020 22:37:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 737D48007A4
	for <linux-audit@redhat.com>; Mon, 24 Feb 2020 22:37:55 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-79-C-JbU9xVOdSs6pbfEiTrQA-1; Mon, 24 Feb 2020 17:37:53 -0500
X-MC-Unique: C-JbU9xVOdSs6pbfEiTrQA-1
Received: by mail-ed1-f66.google.com with SMTP id p3so13869934edx.7
	for <linux-audit@redhat.com>; Mon, 24 Feb 2020 14:37:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3N90WFV/7sUeBc8APgoP9uPRrizY9mUfJVzn6+g48Ag=;
	b=IVZXvPEVdiW1vrSRbYShFf3iJZsuoFP3dkC+TTg9AUDxxi1es0+O14PkpV2iWi37cw
	wd25eQU5f5O2HelUhuu37vLec9WIdweM8NvvZL3GepCxVO3xpGSKugMDF6OOcdrsB0G7
	3KwKc8YN3jXnXZaSy2gNWM68Oej4JoVQqryKqlHQpxnHpx/3/hLQdicXRjTwHOgtzdUy
	qwdxO9HzXTrBDqWwKaDAHky/vk+15wwaaHbHmGC7pTTI+pPyXNL4GL5ZTIge6WTzAUdG
	tZavpzlFZWzxEf9/Kr41dqqqjlNvC4/pvcc+4qY6UC51Pa71zUhnEOYr9njOL4VB5U+l
	QBZQ==
X-Gm-Message-State: APjAAAVe2xlPfkefwK2Qoo+JhDEl6tdISUY8FlftdgJiECKsw8hZAhjL
	AZcNplqXhaPsg15sHHkfpgaIY1s7dRICBUCSrLK2
X-Google-Smtp-Source: APXvYqzk5aWfHcxpccXcxPmfJlsCR1KQaNpOdP6b7V7BafO0b2WVftvp09WOF+osxKaxnSRtXQP0NYq7m3LuJkNHTGQ=
X-Received: by 2002:a50:ec1a:: with SMTP id g26mr46930820edr.164.1582583871720;
	Mon, 24 Feb 2020 14:37:51 -0800 (PST)
MIME-Version: 1.0
References: <0000000000005fe204059f4ddf27@google.com>
In-Reply-To: <0000000000005fe204059f4ddf27@google.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 24 Feb 2020 17:37:40 -0500
Message-ID: <CAHC9VhRxnY8Zj9OvPcbkc0VkUsJKd7+khAz7MiGGs0SUoegg_g@mail.gmail.com>
Subject: Re: kernel panic: audit: rate limit exceeded
To: syzbot <syzbot+72461ac44b36c98f58e5@syzkaller.appspotmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01OMbvhX023912
X-loop: linux-audit@redhat.com
Cc: netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
	linux-kernel@vger.kernel.org, linux-audit@redhat.com,
	peter.senna@collabora.com, stas.yakovlev@gmail.com,
	romain.perier@collabora.com, kvalo@codeaurora.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 24, 2020 at 3:08 AM syzbot
<syzbot+72461ac44b36c98f58e5@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    0c0ddd6a Merge tag 'linux-watchdog-5.6-rc3' of git://www.l..
> git tree:       net
> console output: https://syzkaller.appspot.com/x/log.txt?x=12c8a3d9e00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3b8906eb6a7d6028
> dashboard link: https://syzkaller.appspot.com/bug?extid=72461ac44b36c98f58e5
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14c803ede00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17237de9e00000
>
> The bug was bisected to:
>
> commit 28b75415ad19fef232d8daab4d5de17d753f0b36
> Author: Romain Perier <romain.perier@collabora.com>
> Date:   Wed Aug 23 07:16:51 2017 +0000
>
>     wireless: ipw2200: Replace PCI pool old API
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12dbfe09e00000
> final crash:    https://syzkaller.appspot.com/x/report.txt?x=11dbfe09e00000
> console output: https://syzkaller.appspot.com/x/log.txt?x=16dbfe09e00000
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+72461ac44b36c98f58e5@syzkaller.appspotmail.com
> Fixes: 28b75415ad19 ("wireless: ipw2200: Replace PCI pool old API")
>
> audit: audit_lost=1 audit_rate_limit=2 audit_backlog_limit=0
> Kernel panic - not syncing: audit: rate limit exceeded
> CPU: 1 PID: 10031 Comm: syz-executor626 Not tainted 5.6.0-rc2-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Call Trace:
>  __dump_stack lib/dump_stack.c:77 [inline]
>  dump_stack+0x197/0x210 lib/dump_stack.c:118
>  panic+0x2e3/0x75c kernel/panic.c:221
>  audit_panic.cold+0x32/0x32 kernel/audit.c:307
>  audit_log_lost kernel/audit.c:377 [inline]
>  audit_log_lost+0x8b/0x180 kernel/audit.c:349
>  audit_log_end+0x23c/0x2b0 kernel/audit.c:2322
>  audit_log_config_change+0xcc/0xf0 kernel/audit.c:396
>  audit_receive_msg+0x2246/0x28b0 kernel/audit.c:1277
>  audit_receive+0x114/0x230 kernel/audit.c:1513
>  netlink_unicast_kernel net/netlink/af_netlink.c:1303 [inline]
>  netlink_unicast+0x59e/0x7e0 net/netlink/af_netlink.c:1329
>  netlink_sendmsg+0x91c/0xea0 net/netlink/af_netlink.c:1918
>  sock_sendmsg_nosec net/socket.c:652 [inline]
>  sock_sendmsg+0xd7/0x130 net/socket.c:672
>  ____sys_sendmsg+0x753/0x880 net/socket.c:2343
>  ___sys_sendmsg+0x100/0x170 net/socket.c:2397
>  __sys_sendmsg+0x105/0x1d0 net/socket.c:2430
>  __do_sys_sendmsg net/socket.c:2439 [inline]
>  __se_sys_sendmsg net/socket.c:2437 [inline]
>  __x64_sys_sendmsg+0x78/0xb0 net/socket.c:2437
>  do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
>  entry_SYSCALL_64_after_hwframe+0x49/0xbe
> RIP: 0033:0x441239
> Code: e8 fc ab 02 00 48 83 c4 18 c3 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 9b 09 fc ff c3 66 2e 0f 1f 84 00 00 00 00
> RSP: 002b:00007ffd68c9df48 EFLAGS: 00000246 ORIG_RAX: 000000000000002e
> RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 0000000000441239
> RDX: 0000000000000000 RSI: 00000000200006c0 RDI: 0000000000000003
> RBP: 0000000000018b16 R08: 00000000004002c8 R09: 00000000004002c8
> R10: 0000000000000004 R11: 0000000000000246 R12: 0000000000402060
> R13: 00000000004020f0 R14: 0000000000000000 R15: 0000000000000000
> Kernel Offset: disabled
> Rebooting in 86400 seconds..

Has the syzbot audit related configuration recently changed?  At the
very least it looks like you want to configure the system so that it
doesn't panic when an audit record is lost (printk/AUDIT_FAIL_PRINTK
or silent/AUDIT_FAIL_SILENT are better options); look at the
auditctl(8) manpage for some more information (hint: look at the "-f"
option).

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

