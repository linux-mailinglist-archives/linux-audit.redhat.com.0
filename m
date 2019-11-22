Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id EC2AC105DC3
	for <lists+linux-audit@lfdr.de>; Fri, 22 Nov 2019 01:37:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574383029;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+nXOsIr5waVcFsqb+gtKRvu6K+bXC4LW8eynrPsOlpE=;
	b=Nv8G/Zz0H6qSmkukDG6mhYhYshmqF0Bc+wwAFgbAlQsrHsNU66I1V1NEFOygqfjCho0wp2
	GjsslBOGqKReX1emR9GjzSyZQdNpEm20UADuRDpcirfksPGO9k8iK5FlOwCyTtwyVpTGJ5
	/OJ19Rhy2C/YUg2MqWWv007k4YteB7M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-vbQxtShiP5yXJ6Yr3QOzBA-1; Thu, 21 Nov 2019 19:37:07 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27AFF8018A3;
	Fri, 22 Nov 2019 00:37:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F97E6E3F4;
	Fri, 22 Nov 2019 00:37:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 97C4518089CD;
	Fri, 22 Nov 2019 00:36:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAM0aoNF028962 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 21 Nov 2019 19:36:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BA3432157F47; Fri, 22 Nov 2019 00:36:50 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4D8B2157F4C
	for <linux-audit@redhat.com>; Fri, 22 Nov 2019 00:36:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 68F70101A55E
	for <linux-audit@redhat.com>; Fri, 22 Nov 2019 00:36:48 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-336-XdQ5DkdzPjC1zAIMqgzylw-1; Thu, 21 Nov 2019 19:36:42 -0500
Received: by mail-lj1-f195.google.com with SMTP id n5so5289295ljc.9
	for <linux-audit@redhat.com>; Thu, 21 Nov 2019 16:36:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ssYpMX2MrYa5cZrb9J08z0A37+V+3LLndprxjHmeMv0=;
	b=KGEug3RL3Z6LEdS8Ucrvpzfbffufb2VcHeySJ9HRQLjSflAiXJCcGg+xc60AOF5A9+
	0o+B3UPEtmypQL2pJalWq4JGkGnQkjME6R6nKquYa/AegKpbbmKohXXt3NtmpGIhKaTL
	awZXqhLr8kunHMk7NcJ8XGo4pR/G7WaIJgqHJ+TI9b7nWc+z5MlhrOIFr49somUWHO+Q
	BmO+sPwEUhMaPsRaU94YUpYEYlqeFVFapzWbNtBx9bhhaL9HwbhVx2ueAfuE9Jsveqqg
	CQAX6Oywd+KgzdoqK5mM7TLp7uQUjdr8GrWDE4zbP4jjsCIP6XDoht1Ca4DcZyso3Jnt
	NSeA==
X-Gm-Message-State: APjAAAUNPPY0r4cRN4P+/8dKBtMuz8X833j0aXaeDH1qyxZ76VH8CQXK
	uj9Mr6MEqLBWvWIdZYlcNM3zc7V/htpLIZu+QdDL
X-Google-Smtp-Source: APXvYqyK0IC3Ufsh7Ivd3NjOoGIvpal8xESx2JMA5UpxyGvFS3bv20z5yuxOK9i+Cl0c7qivRA13cE2yY7ruALWrky4=
X-Received: by 2002:a2e:85d5:: with SMTP id h21mr9851090ljj.243.1574383000344; 
	Thu, 21 Nov 2019 16:36:40 -0800 (PST)
MIME-Version: 1.0
References: <20191120213816.8186-1-jolsa@kernel.org>
	<8c928ec4-9e43-3e2a-7005-21f40fcca061@iogearbox.net>
	<CAADnVQKu-ZgFTaSMH=Q-jMOYYvE32TF2b2hq1=dmDV8wAf18pg@mail.gmail.com>
	<CAHC9VhQbQoXacbTCNJPGNzFOv30PwLeiWu4ROQFU46=saTeTNQ@mail.gmail.com>
	<20191122002257.4hgui6pylpkmpwac@ast-mbp.dhcp.thefacebook.com>
In-Reply-To: <20191122002257.4hgui6pylpkmpwac@ast-mbp.dhcp.thefacebook.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 21 Nov 2019 19:36:29 -0500
Message-ID: <CAHC9VhRihMi_d-p+ieXyuVBcGMs80SkypVxF4gLE_s45GKP0dg@mail.gmail.com>
Subject: Re: [PATCH] bpf: emit audit messages upon successful prog load and
	unload
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
X-MC-Unique: XdQ5DkdzPjC1zAIMqgzylw-1
X-MC-Unique: vbQxtShiP5yXJ6Yr3QOzBA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAM0aoNF028962
X-loop: linux-audit@redhat.com
Cc: Jakub Kicinski <jakub.kicinski@netronome.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Network Development <netdev@vger.kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Jiri Benc <jbenc@redhat.com>, linux-audit@redhat.com,
	Jiri Olsa <jolsa@kernel.org>, David Miller <davem@redhat.com>,
	Yonghong Song <yhs@fb.com>, bpf <bpf@vger.kernel.org>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 21, 2019 at 7:23 PM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
> On Thu, Nov 21, 2019 at 06:41:31PM -0500, Paul Moore wrote:
> > On Wed, Nov 20, 2019 at 4:49 PM Alexei Starovoitov
> > <alexei.starovoitov@gmail.com> wrote:
> > > On Wed, Nov 20, 2019 at 1:46 PM Daniel Borkmann <daniel@iogearbox.net> wrote:
> > > > On 11/20/19 10:38 PM, Jiri Olsa wrote:
> > > > > From: Daniel Borkmann <daniel@iogearbox.net>
> > > > >
> > > > > Allow for audit messages to be emitted upon BPF program load and
> > > > > unload for having a timeline of events. The load itself is in
> > > > > syscall context, so additional info about the process initiating
> > > > > the BPF prog creation can be logged and later directly correlated
> > > > > to the unload event.
> > > > >
> > > > > The only info really needed from BPF side is the globally unique
> > > > > prog ID where then audit user space tooling can query / dump all
> > > > > info needed about the specific BPF program right upon load event
> > > > > and enrich the record, thus these changes needed here can be kept
> > > > > small and non-intrusive to the core.
> > > > >
> > > > > Raw example output:
> > > > >
> > > > >    # auditctl -D
> > > > >    # auditctl -a always,exit -F arch=x86_64 -S bpf
> > > > >    # ausearch --start recent -m 1334
> > > > >    [...]
> > > > >    ----
> > > > >    time->Wed Nov 20 12:45:51 2019
> > > > >    type=PROCTITLE msg=audit(1574271951.590:8974): proctitle="./test_verifier"
> > > > >    type=SYSCALL msg=audit(1574271951.590:8974): arch=c000003e syscall=321 success=yes exit=14 a0=5 a1=7ffe2d923e80 a2=78 a3=0 items=0 ppid=742 pid=949 auid=0 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=pts0 ses=2 comm="test_verifier" exe="/root/bpf-next/tools/testing/selftests/bpf/test_verifier" subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=(null)
> > > > >    type=UNKNOWN[1334] msg=audit(1574271951.590:8974): auid=0 uid=0 gid=0 ses=2 subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 pid=949 comm="test_verifier" exe="/root/bpf-next/tools/testing/selftests/bpf/test_verifier" prog-id=3260 event=LOAD
> > > > >    ----
> > > > >    time->Wed Nov 20 12:45:51 2019
> > > > > type=UNKNOWN[1334] msg=audit(1574271951.590:8975): prog-id=3260 event=UNLOAD
> > > > >    ----
> > > > >    [...]
> > > > >
> > > > > Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
> > > > > Signed-off-by: Jiri Olsa <jolsa@kernel.org>
> > > >
> > > > LGTM, thanks for the rebase!
> > >
> > > Applied to bpf-next. Thanks!
> >
> > [NOTE: added linux-audit to the To/CC line]
> >
> > Wait a minute, why was the linux-audit list not CC'd on this?  Why are
> > you merging a patch into -next that adds to the uapi definition *and*
> > creates a new audit record while we are at -rc8?
> >
> > Aside from that I'm concerned that you are relying on audit userspace
> > changes that might not be okay; I see the PR below, but I don't see
> > any comment on it from Steve (it is his audit userspace).  I also
> > don't see a corresponding test added to the audit-testsuite, which is
> > a common requirement for new audit functionality (link below).  I'm
> > also fairly certain we don't want this new BPF record to look like how
> > you've coded it up in bpf_audit_prog(); duplicating the fields with
> > audit_log_task() is wrong, you've either already got them via an
> > associated record (which you get from passing non-NULL as the first
> > parameter to audit_log_start()), or you don't because there is no
> > associated syscall/task (which you get from passing NULL as the first
> > parameter).  Please revert, un-merge, etc. this patch from bpf-next;
> > it should not go into Linus' tree as written.
>
> Sorry I didn't realize there was a disagreement.
>
> Dave, could you please revert it in net-next?
>
> > Audit userspace PR:
> > * https://github.com/linux-audit/audit-userspace/pull/104
>
> This PR does not use this new audit. It's doing everything via existing
> perf_event notification. My understanding of Jiri's email was that netlink
> style is preferred vs perf_event. Did I get it wrong?

Perhaps confusion on my part regarding the audit-userspace PR.  The
commit description mentioned the audit userspace (the daemon most
likely) fetching additional info about the BPF program and this was
the only outstanding audit-userspace PR that had any mention of BPF.

However, getting back to netlink vs perf_event, if you want to
generate an audit record, it should happen via the audit subsystem
(and go up to the audit daemon via netlink).

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

