Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id D5730117BD8
	for <lists+linux-audit@lfdr.de>; Tue, 10 Dec 2019 00:54:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575935639;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=E2BBKauc+Mo5eWS+IaC1kmV+5YnccE+Dm+UQ5HTloCU=;
	b=O6rADSYqYKxo11aWd3hXkfdtQqWbMKAuq0kMWKAbWY70abfavCiSGfc/A9GSM1quecCRrT
	DpSeYRwzVzDD0vpuM8TB0lzHJlRZjWRsRAKISDXJ7fxqLoYiDltkQATKPO1Zf1WmjddxZH
	9CnoCs0p+mXVzwfu1gUe9VVIG1gzcyA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-ili0u2BqNeSNDBjMNoEsDQ-1; Mon, 09 Dec 2019 18:53:58 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AFB09122A;
	Mon,  9 Dec 2019 23:53:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E7681001B35;
	Mon,  9 Dec 2019 23:53:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B8579180338F;
	Mon,  9 Dec 2019 23:53:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB9Nrdg5011945 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 9 Dec 2019 18:53:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D6E432166B29; Mon,  9 Dec 2019 23:53:39 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D266A2166B27
	for <linux-audit@redhat.com>; Mon,  9 Dec 2019 23:53:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A27D8CB2D6
	for <linux-audit@redhat.com>; Mon,  9 Dec 2019 23:53:38 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-231-C6vTAIV7MKqC1rwrtPcd0g-1; Mon, 09 Dec 2019 18:53:36 -0500
Received: by mail-lj1-f194.google.com with SMTP id a13so17704235ljm.10
	for <linux-audit@redhat.com>; Mon, 09 Dec 2019 15:53:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8PYO3gKOvpQJUKoPD4Ucl8MVrwdN3gMad52iHtR/vZs=;
	b=JN3NAiij6H0qmWHFBrV/ZF+lPPnC7cCWHlxvKwqivsPkB0ByV/fNuO//OulslTjKdp
	DUDPpRKG1mlVUqSH8YskgAyjhqs8j1GTej7MVxAef/279W7pm0K1Jxzzjm+gkMQW66n0
	KDF0aQgMozCuVF9Rl32XwWwyb+TKG+PPSjgaoOvUD6J47mI1FmF6NiMxvwBDfwjdwPLr
	pt7C2gK5dDk6+dthbPizM9/yIK64uJOlVkNebDVP5MpFGl0zWSCIT3Bto3TkDZIkiCkx
	WzklxAD8vlth6Shz5X48ckzOFfNmSkFoCfaFGni+iLPFd6nI1fCUXOjLPS96P7kGXjCq
	Xl6g==
X-Gm-Message-State: APjAAAWhEIptKOidpBC8pTdHRJhbAUBLYfWuN5GsNdrGyUjuKdTolIGi
	nY/sgcSHYaeNk2DCpcSKSD5bpGq8qYQRgQwp6jst
X-Google-Smtp-Source: APXvYqxm5P6p8PMa6Ve7YcMvKPOBDHSKqfXxUTTrADm7WlA8FeZonMrFtrUaZwY0Q7lPO92mGz404lWFoQ6nO9KpZis=
X-Received: by 2002:a2e:99cd:: with SMTP id l13mr4379179ljj.243.1575935614551; 
	Mon, 09 Dec 2019 15:53:34 -0800 (PST)
MIME-Version: 1.0
References: <20191206214934.11319-1-jolsa@kernel.org>
	<20191209121537.GA14170@linux.fritz.box>
	<CAHC9VhQdOGTj1HT1cwvAdE1sRpzk5mC+oHQLHgJFa3vXEij+og@mail.gmail.com>
	<d387184e-9c5f-d5b2-0acb-57b794235cbd@iogearbox.net>
In-Reply-To: <d387184e-9c5f-d5b2-0acb-57b794235cbd@iogearbox.net>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 9 Dec 2019 18:53:23 -0500
Message-ID: <CAHC9VhRDsEDGripZRrVNcjEBEEULPk+0dRp-uJ3nmmBK7B=sYQ@mail.gmail.com>
Subject: Re: [PATCHv3] bpf: Emit audit messages upon successful prog load and
	unload
To: Daniel Borkmann <daniel@iogearbox.net>
X-MC-Unique: C6vTAIV7MKqC1rwrtPcd0g-1
X-MC-Unique: ili0u2BqNeSNDBjMNoEsDQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB9Nrdg5011945
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 9, 2019 at 6:19 PM Daniel Borkmann <daniel@iogearbox.net> wrote:
> On 12/9/19 3:56 PM, Paul Moore wrote:
> > On Mon, Dec 9, 2019 at 7:15 AM Daniel Borkmann <daniel@iogearbox.net> wrote:
> >> On Fri, Dec 06, 2019 at 10:49:34PM +0100, Jiri Olsa wrote:
> >>> From: Daniel Borkmann <daniel@iogearbox.net>
> >>>
> >>> Allow for audit messages to be emitted upon BPF program load and
> >>> unload for having a timeline of events. The load itself is in
> >>> syscall context, so additional info about the process initiating
> >>> the BPF prog creation can be logged and later directly correlated
> >>> to the unload event.
> >>>
> >>> The only info really needed from BPF side is the globally unique
> >>> prog ID where then audit user space tooling can query / dump all
> >>> info needed about the specific BPF program right upon load event
> >>> and enrich the record, thus these changes needed here can be kept
> >>> small and non-intrusive to the core.
> >>>
> >>> Raw example output:
> >>>
> >>>    # auditctl -D
> >>>    # auditctl -a always,exit -F arch=x86_64 -S bpf
> >>>    # ausearch --start recent -m 1334
> >>>    ...
> >>>    ----
> >>>    time->Wed Nov 27 16:04:13 2019
> >>>    type=PROCTITLE msg=audit(1574867053.120:84664): proctitle="./bpf"
> >>>    type=SYSCALL msg=audit(1574867053.120:84664): arch=c000003e syscall=321   \
> >>>      success=yes exit=3 a0=5 a1=7ffea484fbe0 a2=70 a3=0 items=0 ppid=7477    \
> >>>      pid=12698 auid=1001 uid=1001 gid=1001 euid=1001 suid=1001 fsuid=1001    \
> >>>      egid=1001 sgid=1001 fsgid=1001 tty=pts2 ses=4 comm="bpf"                \
> >>>      exe="/home/jolsa/auditd/audit-testsuite/tests/bpf/bpf"                  \
> >>>      subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=(null)
> >>>    type=UNKNOWN[1334] msg=audit(1574867053.120:84664): prog-id=76 op=LOAD
> >>>    ----
> >>>    time->Wed Nov 27 16:04:13 2019
> >>>    type=UNKNOWN[1334] msg=audit(1574867053.120:84665): prog-id=76 op=UNLOAD
> >>>    ...
> >>>
> >>> Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
> >>> Co-developed-by: Jiri Olsa <jolsa@kernel.org>
> >>> Signed-off-by: Jiri Olsa <jolsa@kernel.org>
> >>
> >> Paul, Steve, given the merge window is closed by now, does this version look
> >> okay to you for proceeding to merge into bpf-next?
> >
> > Given the change to audit UAPI I was hoping to merge this via the
> > audit/next tree, is that okay with you?
>
> Hm, my main concern is that given all the main changes are in BPF core and
> usually the BPF subsystem has plenty of changes per release coming in that we'd
> end up generating unnecessary merge conflicts. Given the include/uapi/linux/audit.h
> UAPI diff is a one-line change, my preference would be to merge via bpf-next with
> your ACK or SOB added. Does that work for you as well as?

I regularly (a few times a week) run the audit and SELinux tests
against Linus+audit/next+selinux/next to make sure things are working
as expected and that some other subsystem has introduced a change
which has broken something.  If you are willing to ensure the tests
get run, including your new BPF audit tests I would be okay with that;
is that acceptable?

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

