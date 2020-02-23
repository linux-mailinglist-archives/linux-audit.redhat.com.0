Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 2867B1692DA
	for <lists+linux-audit@lfdr.de>; Sun, 23 Feb 2020 02:36:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582421813;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XOk725AwK9bDmwwweUlo1bI3m6ImHDp4CKGBt3/R7t0=;
	b=CbKLvqHtejDe6aoPG+3K8yO6+D9ukLOA9rurOTo1PP5lgSSoG/2+bsgaBdnGKFVH0UxMYT
	Y6xr5aaqTsmUJiB5SfIFzX97IgGAp9nq4blP7rZgs0qVi6h1WPGHfXyPNO1XbiymGjUEgE
	pWzCV02uIoCVx6Y4AUKqC8YJMjKYWr8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-_Hs63kSsO2m13K0CN4bAuA-1; Sat, 22 Feb 2020 20:36:50 -0500
X-MC-Unique: _Hs63kSsO2m13K0CN4bAuA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70406107ACCD;
	Sun, 23 Feb 2020 01:36:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37A125D9E2;
	Sun, 23 Feb 2020 01:36:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ADE631809563;
	Sun, 23 Feb 2020 01:36:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01N1Zon8003882 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 22 Feb 2020 20:35:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 40B06D0B54; Sun, 23 Feb 2020 01:35:50 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C81ED19BD
	for <linux-audit@redhat.com>; Sun, 23 Feb 2020 01:35:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6C1A85A304
	for <linux-audit@redhat.com>; Sun, 23 Feb 2020 01:35:47 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-408-LC3ECeUaMCOfK9_Iy8Uz3A-1; Sat, 22 Feb 2020 20:35:45 -0500
X-MC-Unique: LC3ECeUaMCOfK9_Iy8Uz3A-1
Received: by mail-ed1-f68.google.com with SMTP id r21so7426486edq.0
	for <linux-audit@redhat.com>; Sat, 22 Feb 2020 17:35:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=20P6VASIF4kXfRxGqIIEpQkeQCJGweC3KQmcTkimeB8=;
	b=g3YSPVevk1Grn87TZ03zmOqj84Hn7ZZYfQ+8dudRfO3eBfPYtRIP5704nuwyXe7fp8
	e3BUbzqotBaKCkO8+CbiDnUg+7yr/3xdSbDzfmPeobjvokAwuL+SIKh7KJvdcc67yHTI
	YWRWjSJ213sII/dqM6XLW7u1cmV4OKqNdXnglg6ekxKv9Bp2ER5piquL69Y+o1bsCqW8
	NdtSXvhJQJExsUIJnpS5Shq8jUn5dP8LOT0IEftmolUuDmB9wYPLt0xFEu9fRT3sm+a1
	6Um95hPcjn3Cw7aRUzw51RVYSoG2EfoY8YgzBT2x03kvhgZm3a6orTWvsCyE0RAn8dsg
	SReA==
X-Gm-Message-State: APjAAAX0p9QYZTxlB0jUwjxQBo9QQF3t778C3j+zTHnRyrs1sym1Zwsi
	9GaVPF517NXXqSVehZ2plA4sFHSQA2m999PByZNdvIeHQTEb
X-Google-Smtp-Source: APXvYqz8DJKS5CKcLnZfHxjXlihVmzI0hJTOjd6/HsN9rvUBib9qD32P32RQSfCFIFr+XM7mZe8f07VSy739INwIpBk=
X-Received: by 2002:a17:906:9352:: with SMTP id
	p18mr40572590ejw.95.1582421743723; 
	Sat, 22 Feb 2020 17:35:43 -0800 (PST)
MIME-Version: 1.0
References: <0000000000008e18fb059f1fd725@google.com>
In-Reply-To: <0000000000008e18fb059f1fd725@google.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sat, 22 Feb 2020 20:35:32 -0500
Message-ID: <CAHC9VhTKzn-OdmmvCRPQSNF2beaA6E7Cm0KkxN0u3UjA3OkyXA@mail.gmail.com>
Subject: Re: kernel BUG at arch/x86/mm/physaddr.c:LINE! (4)
To: linux-audit@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01N1Zon8003882
X-loop: linux-audit@redhat.com
Cc: syzbot <syzbot+1f4d90ead370d72e450b@syzkaller.appspotmail.com>,
	netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 21, 2020 at 8:13 PM syzbot
<syzbot+1f4d90ead370d72e450b@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    36a44bcd Merge branch 'bnxt_en-shutdown-and-kexec-kdump-re..
> git tree:       net
> console output: https://syzkaller.appspot.com/x/log.txt?x=12524265e00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=768cc3d3e277cc16
> dashboard link: https://syzkaller.appspot.com/bug?extid=1f4d90ead370d72e450b
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=123d9de9e00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1648fe09e00000
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+1f4d90ead370d72e450b@syzkaller.appspotmail.com
>
> ------------[ cut here ]------------
> kernel BUG at arch/x86/mm/physaddr.c:28!
> invalid opcode: 0000 [#1] PREEMPT SMP KASAN
> CPU: 1 PID: 9873 Comm: syz-executor039 Not tainted 5.6.0-rc1-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> RIP: 0010:__phys_addr+0xb3/0x120 arch/x86/mm/physaddr.c:28
> Code: 09 4c 89 e3 31 ff 48 d3 eb 48 89 de e8 36 e2 40 00 48 85 db 75 0f e8 8c e0 40 00 4c 89 e0 5b 41 5c 41 5d 5d c3 e8 7d e0 40 00 <0f> 0b e8 76 e0 40 00 48 c7 c0 10 50 a7 89 48 ba 00 00 00 00 00 fc
> RSP: 0018:ffffc90005b47490 EFLAGS: 00010093
> RAX: ffff8880944f4600 RBX: 0000000002777259 RCX: ffffffff8134ad32
> RDX: 0000000000000000 RSI: ffffffff8134ad93 RDI: 0000000000000006
> RBP: ffffc90005b474a8 R08: ffff8880944f4600 R09: ffffed1015d2707c
> R10: ffffed1015d2707b R11: ffff8880ae9383db R12: 0000778002777259
> R13: 0000000082777259 R14: ffff88809a765000 R15: 0000000000000010
> FS:  0000000001436880(0000) GS:ffff8880ae900000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00000000200004c0 CR3: 0000000096da8000 CR4: 00000000001406e0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  virt_to_head_page include/linux/mm.h:721 [inline]
>  virt_to_cache mm/slab.h:472 [inline]
>  kfree+0x7b/0x2c0 mm/slab.c:3749
>  audit_free_lsm_field kernel/auditfilter.c:76 [inline]
>  audit_free_rule kernel/auditfilter.c:91 [inline]
>  audit_data_to_entry+0xb7b/0x25f0 kernel/auditfilter.c:603
>  audit_rule_change+0x6b5/0x1130 kernel/auditfilter.c:1130
>  audit_receive_msg+0xda5/0x28b0 kernel/audit.c:1368
>  audit_receive+0x114/0x230 kernel/audit.c:1513

Ugh, I think I see the problem.

In audit_data_to_entry() the code sets both an audit_field->type and
an audit_field->val near the top of the big for-loop (lines 466 and
467 in Linus' tree as of now); if the type happens to be one of the
types which cause the lsm_str field to be kfree()'d (see
audit_free_lsm_field()), then we could run into problems if we end up
following an error path in audit_data_to_entry() before the lsm_str
field is populated with an actual string.

If the above reasoning proves to be correct, it looks like the problem
was caused by 219ca39427bf ("audit: use union for audit_field values
since they are mutually exclusive").

I'll see about working up a fix.

--
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

