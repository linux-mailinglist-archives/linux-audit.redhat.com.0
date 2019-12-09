Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 01463116FC5
	for <lists+linux-audit@lfdr.de>; Mon,  9 Dec 2019 15:57:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575903429;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dNy8YUMw/Tj709RG80DL2G5T+s3/IqBsN2eC3+2U/yw=;
	b=MAIp6XKHyUwQ2zPwjAhYXY4OLCa1Fx7YyZzelba833KSPkWs+1PQv2U1K+9s5O3tUPWII3
	mHCd+Wk6q7zjAGd2uuevD+PActOM7JEm/k3JYqlkCVbcRfH0V4nSR4YhkGe7a0vqvDwHw2
	nmy0XJrI7/yHqqCNDR5DzdMkX0t82eo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-wtHi02rGN2WMXVAHDTW0Nw-1; Mon, 09 Dec 2019 09:57:06 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E664118B5FA2;
	Mon,  9 Dec 2019 14:57:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B60260BE0;
	Mon,  9 Dec 2019 14:56:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F3C5518089C8;
	Mon,  9 Dec 2019 14:56:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB9Eudbu032656 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 9 Dec 2019 09:56:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DC11BD0B50; Mon,  9 Dec 2019 14:56:39 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D44D3D0B51
	for <linux-audit@redhat.com>; Mon,  9 Dec 2019 14:56:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 752D5900336
	for <linux-audit@redhat.com>; Mon,  9 Dec 2019 14:56:37 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-290-QJTU3SYKNx6bD4EmcjSdTQ-1; Mon, 09 Dec 2019 09:56:35 -0500
Received: by mail-lj1-f195.google.com with SMTP id d20so15932448ljc.12
	for <linux-audit@redhat.com>; Mon, 09 Dec 2019 06:56:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RsQfOlFUGzZqyf3ezmn5EcB8XlzWrV/TpuS1nL9HyUA=;
	b=Ffnr0DC7NKNXuJrC/1gCeBVxZEFeSofDbhjIutxOiAeGpm6UNep+fiT3OXHmccpVDm
	YQ/pyWvthCovK19A0pFBVwLedWPoKxAPaRVwcGLpuvhw4bR4U2zBoFcgNv8bkIYEbX0d
	BvOHB8qBEa5j3qpELZUk9dRw1g5UN9JIZfmFxcLzBNV5oJR0m0G0+Cle9TGazPHeCIdr
	kuZ0D3h3qAbuw9ktm5r0WKPHmMxL+niOPlFdX58AyA4lww5DnPcQVAoR+tc7u4OLrRF0
	Iw27IGKpfwAAkjc3hAj2cdkAaJqfqfDMEPd9IzNogpnFYv3hONssTeYby9oY4XFM6Z9j
	7bAg==
X-Gm-Message-State: APjAAAXesVEOO5KeYOoIxLDRl6JVk16bxUFMhtpf2ivJhb18U155RnbR
	pT4j+8YWPSN5XZG6DxaoIJJuk9V7mw6nr/0zhEUy
X-Google-Smtp-Source: APXvYqzEIjSqtPTCB2cfVEMG6x0at7HT07j/bt6UvxOXj8LpjTFeTQmPmWYxjSCxxluC4FcTeVwB0BNgblygXkcpdFM=
X-Received: by 2002:a2e:99cd:: with SMTP id l13mr3012994ljj.243.1575903393503; 
	Mon, 09 Dec 2019 06:56:33 -0800 (PST)
MIME-Version: 1.0
References: <20191206214934.11319-1-jolsa@kernel.org>
	<20191209121537.GA14170@linux.fritz.box>
In-Reply-To: <20191209121537.GA14170@linux.fritz.box>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 9 Dec 2019 09:56:22 -0500
Message-ID: <CAHC9VhQdOGTj1HT1cwvAdE1sRpzk5mC+oHQLHgJFa3vXEij+og@mail.gmail.com>
Subject: Re: [PATCHv3] bpf: Emit audit messages upon successful prog load and
	unload
To: Daniel Borkmann <daniel@iogearbox.net>
X-MC-Unique: QJTU3SYKNx6bD4EmcjSdTQ-1
X-MC-Unique: wtHi02rGN2WMXVAHDTW0Nw-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB9Eudbu032656
X-loop: linux-audit@redhat.com
Cc: Jakub Kicinski <jakub.kicinski@netronome.com>, netdev@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Jiri Benc <jbenc@redhat.com>, linux-audit@redhat.com,
	Jiri Olsa <jolsa@kernel.org>, David Miller <davem@redhat.com>,
	Yonghong Song <yhs@fb.com>, bpf@vger.kernel.org,
	Andrii Nakryiko <andriin@fb.com>, Martin KaFai Lau <kafai@fb.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 9, 2019 at 7:15 AM Daniel Borkmann <daniel@iogearbox.net> wrote:
> On Fri, Dec 06, 2019 at 10:49:34PM +0100, Jiri Olsa wrote:
> > From: Daniel Borkmann <daniel@iogearbox.net>
> >
> > Allow for audit messages to be emitted upon BPF program load and
> > unload for having a timeline of events. The load itself is in
> > syscall context, so additional info about the process initiating
> > the BPF prog creation can be logged and later directly correlated
> > to the unload event.
> >
> > The only info really needed from BPF side is the globally unique
> > prog ID where then audit user space tooling can query / dump all
> > info needed about the specific BPF program right upon load event
> > and enrich the record, thus these changes needed here can be kept
> > small and non-intrusive to the core.
> >
> > Raw example output:
> >
> >   # auditctl -D
> >   # auditctl -a always,exit -F arch=x86_64 -S bpf
> >   # ausearch --start recent -m 1334
> >   ...
> >   ----
> >   time->Wed Nov 27 16:04:13 2019
> >   type=PROCTITLE msg=audit(1574867053.120:84664): proctitle="./bpf"
> >   type=SYSCALL msg=audit(1574867053.120:84664): arch=c000003e syscall=321   \
> >     success=yes exit=3 a0=5 a1=7ffea484fbe0 a2=70 a3=0 items=0 ppid=7477    \
> >     pid=12698 auid=1001 uid=1001 gid=1001 euid=1001 suid=1001 fsuid=1001    \
> >     egid=1001 sgid=1001 fsgid=1001 tty=pts2 ses=4 comm="bpf"                \
> >     exe="/home/jolsa/auditd/audit-testsuite/tests/bpf/bpf"                  \
> >     subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=(null)
> >   type=UNKNOWN[1334] msg=audit(1574867053.120:84664): prog-id=76 op=LOAD
> >   ----
> >   time->Wed Nov 27 16:04:13 2019
> >   type=UNKNOWN[1334] msg=audit(1574867053.120:84665): prog-id=76 op=UNLOAD
> >   ...
> >
> > Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
> > Co-developed-by: Jiri Olsa <jolsa@kernel.org>
> > Signed-off-by: Jiri Olsa <jolsa@kernel.org>
>
> Paul, Steve, given the merge window is closed by now, does this version look
> okay to you for proceeding to merge into bpf-next?

Given the change to audit UAPI I was hoping to merge this via the
audit/next tree, is that okay with you?

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

