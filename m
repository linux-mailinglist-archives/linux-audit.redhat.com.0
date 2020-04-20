Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 9FCA31B16E4
	for <lists+linux-audit@lfdr.de>; Mon, 20 Apr 2020 22:27:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587414422;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=c/01AkzfpNd3+nAs+X8yWvhkKojwZNa5JFdM1UQpIFs=;
	b=Df6dB9/KVuqcyfo4Kp02MY+hePJdt5pY4hWzeVsw2P6M0Jl1tPP53PXBFJ1YTyL+ShrwCn
	/FRsAaNInuUnSzaEaIZNJb9aiHvK9y74kAbJLmuQlEBYXQ0RD2+GCZ5QZeioivtn/PXUJc
	kgLqs5sAGRd1YCR6QCDm05BEXtpMLQI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-cLE0flN9NM6mS73dU8VQFA-1; Mon, 20 Apr 2020 16:27:00 -0400
X-MC-Unique: cLE0flN9NM6mS73dU8VQFA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C70A4190D37A;
	Mon, 20 Apr 2020 20:26:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E1F7328994;
	Mon, 20 Apr 2020 20:26:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 04A35938FE;
	Mon, 20 Apr 2020 20:26:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03KKQdS3024109 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 20 Apr 2020 16:26:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0F1D22166B2A; Mon, 20 Apr 2020 20:26:39 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BD832166B29
	for <linux-audit@redhat.com>; Mon, 20 Apr 2020 20:26:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 18EEB86BCA4
	for <linux-audit@redhat.com>; Mon, 20 Apr 2020 20:26:37 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-102-jTjbr2i_N7-kufaTxhpLQg-1; Mon, 20 Apr 2020 16:26:34 -0400
X-MC-Unique: jTjbr2i_N7-kufaTxhpLQg-1
Received: by mail-ed1-f66.google.com with SMTP id r7so8473226edo.11
	for <linux-audit@redhat.com>; Mon, 20 Apr 2020 13:26:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wwUPCWKp0XjwepXQOmIetCoyqhWj31DcYHiSp/UXrjU=;
	b=Utusly5CIlWnvq0C0tuhtU0z7nrx+fb5Sx2Pz9osCPhZrZCbAtVcaaaHTMzK0/LZXQ
	Jh7U89omtqGAFK2hlpP3CQqbSpbe272nymEu4epSQE+vxVLxs3FevqgK10ectJ1kg1SF
	KzxKkQaonfMaiRAS2x2bHf2h5TiYknqW763ZwE9hh2rgo4eO6ef6KtTfSRdinbt6mNem
	tZpSTqb8Xw05Ar6uoN8XkrYRCpzD1kGawl7OVCgkz84aRduKaXWUQ1lk1+cCqaYK8cgM
	3OY6OFLXW3PK9FHCsF4Ulmumop23K8bciCBwfBeilUFM+cLUzoOaPcQglClydvIu8iuA
	KXcQ==
X-Gm-Message-State: AGi0PuaN5kbkBFdNJFxOUTBf8ngY2lSV9CEmzj4/gczU7cR765sxYvgW
	FqLy2yjlQj8rFZ53L/P4UJUPtWDntgXrHZ0zM4lCvNA=
X-Google-Smtp-Source: APiQypJPD/FkR6eQInJaCe11axRqNxPjye0HG0pNX0w10VJWP4Vuxwr6q4w9/9a603DJDHR6p9S2rG2NX4NP4J8beZA=
X-Received: by 2002:a05:6402:1215:: with SMTP id
	c21mr16361574edw.128.1587414392996; 
	Mon, 20 Apr 2020 13:26:32 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000064f6e505a3b243aa@google.com>
	<CAHC9VhTZ_itetT4cx32vW3A79tb76dzjaBC_0S8Y_=DcEBL2nw@mail.gmail.com>
	<CACT4Y+ZUpH3giZmiA51NZ1BhHOoGETqfxscBW6kBxWDf6-Q-HA@mail.gmail.com>
In-Reply-To: <CACT4Y+ZUpH3giZmiA51NZ1BhHOoGETqfxscBW6kBxWDf6-Q-HA@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 20 Apr 2020 16:26:21 -0400
Message-ID: <CAHC9VhQOvA8-9wCXn1CV4iz_OtoQAaAv9gS+kWsitU3-axsbzg@mail.gmail.com>
Subject: Re: KMSAN: uninit-value in audit_log_vformat (2)
To: Dmitry Vyukov <dvyukov@google.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03KKQdS3024109
X-loop: linux-audit@redhat.com
Cc: syzbot <syzbot+49e69b4d71a420ceda3e@syzkaller.appspotmail.com>,
	syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
	LKML <linux-kernel@vger.kernel.org>, linux-audit@redhat.com,
	Alexander Potapenko <glider@google.com>
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

On Mon, Apr 20, 2020 at 2:12 PM Dmitry Vyukov <dvyukov@google.com> wrote:
> On Mon, Apr 20, 2020 at 6:29 PM Paul Moore <paul@paul-moore.com> wrote:
> > On Mon, Apr 20, 2020 at 1:35 AM syzbot
> > <syzbot+49e69b4d71a420ceda3e@syzkaller.appspotmail.com> wrote:
> > >
> > > Hello,
> > >
> > > syzbot found the following crash on:
> > >
> > > HEAD commit:    5356842d [EXPERIMENTAL] kmsan: eagerly allocate shadow at ..
> > > git tree:       https://github.com/google/kmsan.git master
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=12f06720100000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=a5915107b3106aaa
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=49e69b4d71a420ceda3e
> > > compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
> > > userspace arch: i386
> > > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=133b5dabe00000
> > > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=143e1610100000
> > >
> > > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > > Reported-by: syzbot+49e69b4d71a420ceda3e@syzkaller.appspotmail.com
> > >
> > > =====================================================
> > > BUG: KMSAN: uninit-value in string_nocheck lib/vsprintf.c:608 [inline]
> > > BUG: KMSAN: uninit-value in string+0x522/0x690 lib/vsprintf.c:689
> > > CPU: 1 PID: 8854 Comm: syz-executor694 Not tainted 5.6.0-rc7-syzkaller #0
> > > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> > > Call Trace:
> > >  __dump_stack lib/dump_stack.c:77 [inline]
> > >  dump_stack+0x1c9/0x220 lib/dump_stack.c:118
> > >  kmsan_report+0xf7/0x1e0 mm/kmsan/kmsan_report.c:118
> > >  __msan_warning+0x58/0xa0 mm/kmsan/kmsan_instr.c:215
> > >  string_nocheck lib/vsprintf.c:608 [inline]
> > >  string+0x522/0x690 lib/vsprintf.c:689
> > >  vsnprintf+0x207d/0x31b0 lib/vsprintf.c:2574
> >
> > Are there any ongoing problems with [vsn]printf() in the kernel at the
> > moment with syzbot?
> >
> > I ask because on first look I'm not seeing any obvious problems in the
> > audit portion of this code path.
>
> None I am aware of. Alex?
> Can it be related to data_len==0? I don't see any obvious checks for
> this. And in that case will 0-terminate out-of-bounds (at offset -1?)
> and print potentially uninit data. But I looked at the code only very
> briefly so potentially I am totally wrong.

Bingo, that's likely it.  Thanks.

I was in the process of fixing another audit bug when I looked at this
and got fixated on the varg stuff, not the variables themselves.  I'll
have a patch out later today.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

