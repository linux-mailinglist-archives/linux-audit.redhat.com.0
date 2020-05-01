Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 277771C1F6E
	for <lists+linux-audit@lfdr.de>; Fri,  1 May 2020 23:15:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588367726;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=F6+JtJIvbQ9M2fGcxw/XpSefj/AW8s3ss4B9eQYH/5Y=;
	b=WgBOErT4PB3wvhVHkhkwOCYzCosqIKcjsO7YhYkGtRgIMVUcwonT8RW0hBXzfV2V58TZE7
	0uFIFKJMERf/7PpMKadwvfC1oEHDO0IgtY82fN+Q/xyBpBlIO7HaQPQU3tuLcQdMsV+03a
	dHkPv9njsbxob5rH1+8mj11XpvfzF5U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-GBDi_IR_OB2B7S1PEMSiuw-1; Fri, 01 May 2020 17:15:24 -0400
X-MC-Unique: GBDi_IR_OB2B7S1PEMSiuw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84714800D24;
	Fri,  1 May 2020 21:15:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B477E60E1C;
	Fri,  1 May 2020 21:15:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 520591809542;
	Fri,  1 May 2020 21:15:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 041LEtC2007852 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 1 May 2020 17:14:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5BF131248E6; Fri,  1 May 2020 21:14:55 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 57F0C1248E0
	for <linux-audit@redhat.com>; Fri,  1 May 2020 21:14:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B286800296
	for <linux-audit@redhat.com>; Fri,  1 May 2020 21:14:52 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
	[209.85.218.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-273-pMC2tTwHPQa4gcQahWsOlw-1; Fri, 01 May 2020 17:14:50 -0400
X-MC-Unique: pMC2tTwHPQa4gcQahWsOlw-1
Received: by mail-ej1-f65.google.com with SMTP id pg17so8551039ejb.9
	for <linux-audit@redhat.com>; Fri, 01 May 2020 14:14:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=us9WMkr6wKnyYx/hgFQnJdJ65nSZxBY8d4KZLY6FNHM=;
	b=jY5k5AXZEgJGQmJxXwrsr9Wx8iA+n/A3AmIA4SpgWAa1IgArXbu40bGOyT+TLCOnsx
	I7pJxRifAOxMo9mOn8meeaTXO17V6E5bObVJJS3uoa2/dr+vQPNHPExdrKhBpR8rFyKY
	vSBp+dPNFLYbvr2E26spVT5y8t63/0gesPSdhBnjLR8JyIyoxLFMxVUf00KbTP6vtD0e
	Po2j3Ppei0WIQmZHvdcTEcLFxoeAlZ4uhZe1u5kkG8DXDsIWZrA0JHxXBWWqoqfmGjpV
	lCzmiCTSBdk0F8Sdh2p9nRzyDSZeGBjRw99hqCrGqZhT3zG64PVtk/k4XiJEwGbX88Yu
	S0Dg==
X-Gm-Message-State: AGi0PuZMwNdEZWW9s+E5JzWKO0kKNvTrcGvlleo5AN1Yc6LRRvokyqYl
	m69VGNxI9vSTVJNw6XtzPPdF9FxtK+sOaEtRVKA5
X-Google-Smtp-Source: APiQypI06H5AjLHya/8neX/PwPs/MhJ6QoaTYrimLEvjr3QVzovpXkFejuz2QZHd7O6PUX8G9UyMM+2AOd0/OaZ90mU=
X-Received: by 2002:a17:906:d7a2:: with SMTP id
	pk2mr5302234ejb.272.1588367688992; 
	Fri, 01 May 2020 14:14:48 -0700 (PDT)
MIME-Version: 1.0
References: <1584006083-28936-1-git-send-email-chenhc@lemote.com>
	<CAAhV-H6Jy_7N99XmBwjSEX=Fx16AY4Azt_fUNvPBZNiqxhJ_zQ@mail.gmail.com>
In-Reply-To: <CAAhV-H6Jy_7N99XmBwjSEX=Fx16AY4Azt_fUNvPBZNiqxhJ_zQ@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 1 May 2020 17:14:37 -0400
Message-ID: <CAHC9VhTbTKF3+adVq8ubwHu7HuVJvGBgokNxSaH1f1Hcku8Rzg@mail.gmail.com>
Subject: Re: [PATCH Resend] MIPS: Add syscall auditing support
To: Huacai Chen <chenhuacai@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 041LEtC2007852
X-loop: linux-audit@redhat.com
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Zhangjin Wu <wuzhangjin@gmail.com>,
	"open list:MIPS" <linux-mips@vger.kernel.org>,
	linux-audit@redhat.com, Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Fuxin Zhang <zhangfx@lemote.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 27, 2020 at 5:12 AM Huacai Chen <chenhuacai@gmail.com> wrote:
> On Thu, Mar 12, 2020 at 5:33 PM Huacai Chen <chenhc@lemote.com> wrote:
> >
> > From: Ralf Baechle <ralf@linux-mips.org>
> >
> > The original patch is from Ralf. I have maintained it for more than six
> > years on Loongson platform, and it works perfectly. Most of the commit
> > messages are written by Ralf.
> >
> > MIPS doesn't quite fit into the existing pattern of other architectures
> > and I'd appreciate your comments and maybe even an Acked-by.
> >
> >  - Linux on MIPS extends the traditional syscall table used by older UNIX
> >    implementations.  This is why 32-bit Linux syscalls are starting from
> >    4000; the native 64-bit syscalls start from 5000 and the N32 compat ABI
> >    from 6000.  The existing syscall bitmap is only large enough for at most
> >    2048 syscalls, so I had to increase AUDIT_BITMASK_SIZE to 256 which
> >    provides enough space for 8192 syscalls.  Because include/uapi/linux/
> >    audit.h and AUDIT_BITMASK_SIZE are exported to userspace I've used an
> >    #ifdef __mips__ for this.

I'm sure you're aware of the hacky nature of such a change and
considering that it is a break in the kernel/userspace API, hacky
changes make me nervous.  Very nervous.

The ultimate fix for this would be to move away from passing structs
across netlink and use netlink attributes; this would allow us the
flexibility to tweak the fields like we would need for this without
completely breaking existing systems.  However, that is a big chunk of
work (and I'm just talking about the control plane, not the audit
records themselves as has been discussed in the past) and I can
understand if that is not something you want to take on at this point.

A less disruptive, but even more of an awful hack would be to extend
past the end of the audit_rule_data struct with an audit_rule_data_ext
(?) struct (perhaps indicated by a flag), but that is tricky due the
variable length buffer at the end of audit_rule_data.  I *really*
dislike this idea, but it is *an* idea.

I'm open to suggestions, but my current leaning is that if we are
going to add support for MIPS, we'll need to actually do the work to
convert the netlink control plane to use netlink attributes.

> >  - The code treats the little endian MIPS architecture as separate from
> >    big endian.  Combined with the 3 ABIs that's 6 combinations.  I tried
> >    to sort of follow the example set by ARM which explicitly lists the
> >    (rare) big endian architecture variant - but it doesn't seem to very
> >    useful so I wonder if this could be squashed to just the three ABIs
> >    without consideration of endianess?

Forgive my ignorance of MIPS, but as I understand it there is 32-bit
MIPS (old-ABI), 64-bit MIPS (new-ABI), and 64/32-bit MIPS (new-API,
aka N32); with each having both little and big endian variants, is
that correct?

Is it also safe to assume that 64-bit MIPS (new-API) can only run
64-bit new-API and N32 binaries and *not* 32-bit old-API binaries?

I'm guessing MIPS does not support running both little and big endian
binaries simultaneously on the same booted system?  Or does it?

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

