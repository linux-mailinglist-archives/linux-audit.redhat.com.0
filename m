Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id BC3E6175C85
	for <lists+linux-audit@lfdr.de>; Mon,  2 Mar 2020 15:03:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583157828;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Hputq7w3kPP9nwaEaTlKeBnAwbZuYW/0Wi2JV6GZtz0=;
	b=inTIBv/k8mxR9vLLxgnexp0PbF/d4Py5GiW7/2oVllThkzYYD+hhxDwH0LL6Vbnw5BOFdW
	Vf+ZB//TezzpoVEAl2Ue9JHIzfGBhUVwG62q/cl1N9l2Q3VkKIeYXfYiBXObgnk/pSzi+J
	zj0efanxMC7o2qAwu0aAEmaN9qhDoK8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-nWfmlAZcP76djxC4-wQcNA-1; Mon, 02 Mar 2020 09:03:45 -0500
X-MC-Unique: nWfmlAZcP76djxC4-wQcNA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F74C800D50;
	Mon,  2 Mar 2020 14:03:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 065491001DF2;
	Mon,  2 Mar 2020 14:03:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2458B182B00F;
	Mon,  2 Mar 2020 14:03:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0228gw8o016729 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 2 Mar 2020 03:42:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 870C610F8E05; Mon,  2 Mar 2020 08:42:58 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 81E5110F8E03
	for <linux-audit@redhat.com>; Mon,  2 Mar 2020 08:42:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8A91800294
	for <linux-audit@redhat.com>; Mon,  2 Mar 2020 08:42:55 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-281-j2MISWN_Nea8wFxFSy1CoA-1; Mon, 02 Mar 2020 03:42:54 -0500
X-MC-Unique: j2MISWN_Nea8wFxFSy1CoA-1
Received: by mail-qk1-f195.google.com with SMTP id u124so9206664qkh.13
	for <linux-audit@redhat.com>; Mon, 02 Mar 2020 00:42:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=r8aSF5MeqDQUW8YKb8YbsbsupScDDHgnONeFSMF1J5M=;
	b=HfqtkVDEIHscSv/23hdS5Si2+md41GBZTmXa8SRIGvel67MZki8oLD06IiySWmALt7
	5AWc9v5cb/qbNItWvjgduQ3cwsWQS2Jta6IL/pYgomiGDGsCivi9vpEsXrLoIsCCF9XZ
	2eXU6MOSLacZ2B4zyXPpnR298c67kFHPsjEETu7Oo41o5GcZjd4b/sFcdHjzF5ys439x
	xnREwo3E9aOc7IIEepsDy2TvKmFrnisNmBT1gvyZDSB+UuVsOLYxAhyHOXJltWPbME+F
	X0hf5QX2Y3joZb376Xqh1fG3P1lX3HZNFM2I8wfLB+8HMw9JJLWeSEL8kggHmv0olTYP
	FkvA==
X-Gm-Message-State: APjAAAVCSQj73Bi/Z7OwGDL91m/hiN4nFQlG+Uy+UJz8pZeMf/iiCHWo
	889Y0M1ANcM3smIudiUqW77FEfAR3mb/kl73mNQQwjBc
X-Google-Smtp-Source: APXvYqztcu29n10/zsKgII0AqR3Fc9rw71b3zIoTvJYDp6H3lPYF0NTShZJmpjhfeX5F1NoW+jLeFauy7Qb3dxiFWO0=
X-Received: by 2002:ae9:e003:: with SMTP id m3mr15639507qkk.250.1583138573164; 
	Mon, 02 Mar 2020 00:42:53 -0800 (PST)
MIME-Version: 1.0
References: <0000000000003cbb40059f4e0346@google.com>
	<CAHC9VhQVXk5ucd3=7OC=BxEkZGGLfXv9bESX67Mr-TRmTwxjEg@mail.gmail.com>
	<17916d0509978e14d9a5e9eb52d760fa57460542.camel@redhat.com>
	<CAHC9VhQnbdJprbdTa_XcgUJaiwhzbnGMWJqHczU54UMk0AFCtw@mail.gmail.com>
	<CACT4Y+azQXLcPqtJG9zbj8hxqw4jE3dcwUj5T06bdL3uMaZk+Q@mail.gmail.com>
	<CAHC9VhRRDJzyene2_40nhnxRV_ufgyaU=RrFxYGsnxR4Z_AWWw@mail.gmail.com>
In-Reply-To: <CAHC9VhRRDJzyene2_40nhnxRV_ufgyaU=RrFxYGsnxR4Z_AWWw@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 2 Mar 2020 09:42:41 +0100
Message-ID: <CACT4Y+YkJSLt+-0_wvSHfxi8J1Tn=H-NBeZ+E3h-TAKu53vyqw@mail.gmail.com>
Subject: Re: kernel panic: audit: backlog limit exceeded
To: Paul Moore <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0228gw8o016729
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 02 Mar 2020 09:03:21 -0500
Cc: mareklindner@neomailbox.ch, sw@simonwunderlich.de,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, a@unstable.cc,
	LKML <linux-kernel@vger.kernel.org>, David Miller <davem@davemloft.net>,
	syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
	b.a.t.m.a.n@diktynna.open-mesh.org, linux-audit@redhat.com,
	syzkaller <syzkaller@googlegroups.com>,
	netdev <netdev@vger.kernel.org>, john.hammond@intel.com, fzago@cray.com,
	syzbot <syzbot+9a5e789e4725b9ef1316@syzkaller.appspotmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 28, 2020 at 1:14 AM Paul Moore <paul@paul-moore.com> wrote:
>
> On Thu, Feb 27, 2020 at 10:40 AM Dmitry Vyukov <dvyukov@google.com> wrote:
> > On Mon, Feb 24, 2020 at 11:47 PM Paul Moore <paul@paul-moore.com> wrote:
> > > On Mon, Feb 24, 2020 at 5:43 PM Eric Paris <eparis@redhat.com> wrote:
> > > > https://syzkaller.appspot.com/x/repro.syz?x=151b1109e00000 (the
> > > > reproducer listed) looks like it is literally fuzzing the AUDIT_SET.
> > > > Which seems like this is working as designed if it is setting the
> > > > failure mode to 2.
> > >
> > > So it is, good catch :)  I saw the panic and instinctively chalked
> > > that up to a mistaken config, not expecting that it was what was being
> > > tested.
> >
> > Yes, this audit failure mode is quite unpleasant for fuzzing. And
> > since this is not a top-level syscall argument value, it's effectively
> > impossible to filter out in the fuzzer. Maybe another use case for the
> > "fuzer lockdown" feature +Tetsuo proposed.
> > With the current state of the things, I think we only have an option
> > to disable fuzzing of audit. Which is pity because it has found 5 or
> > so real bugs in audit too.
> > But this happened anyway because audit is only reachable from init pid
> > namespace and syzkaller always unshares pid namespace for sandboxing
> > reasons, that was removed accidentally and that's how it managed to
> > find the bugs. But the unshare is restored now:
> > https://github.com/google/syzkaller/commit/5e0e1d1450d7c3497338082fc28912fdd7f93a3c
> >
> > As a side effect all other real bugs in audit will be auto-obsoleted
> > in future if not fixed because they will stop happening.
>
> On the plus side, I did submit fixes for the other real audit bugs
> that syzbot found recently and Linus pulled them into the tree today
> so at least we have that small victory.

+1!

> We could consider adding a fuzz-friendly build time config which would
> disable the panic failsafe, but it probably isn't worth it at the
> moment considering the syzbot's pid namespace limitations.
>
> --
> paul moore
> www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

