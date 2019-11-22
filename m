Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id D284C105DCB
	for <lists+linux-audit@lfdr.de>; Fri, 22 Nov 2019 01:43:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574383392;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KbnVEWVVH7PUSxuXacTs8U1ZIhapz6IRySqhaNPkWfA=;
	b=iD5/G2E+4iFNTsnSxS149cFGUt5rRvzNCV/lT7I2fxlZ5mCLUu+v6plOhp0g3fSXA5PLuo
	J8CuYuHAHwTwU6/qGWCJ7vhFGZpDJSuUu+OrvEVy9vzT3PIHV5tttSMfOoyd5freq7wbnf
	MiUs30HGKvw6a7gLwB3Upnks4dXP89Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-Bq2Mg6KYPT2XOoH0BnWg_A-1; Thu, 21 Nov 2019 19:43:10 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70F148018A3;
	Fri, 22 Nov 2019 00:43:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 74E645E263;
	Fri, 22 Nov 2019 00:43:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5568818089C8;
	Fri, 22 Nov 2019 00:42:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAM0geKs029091 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 21 Nov 2019 19:42:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3AB261055394; Fri, 22 Nov 2019 00:42:40 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 362161055530
	for <linux-audit@redhat.com>; Fri, 22 Nov 2019 00:42:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5AFD1101A55E
	for <linux-audit@redhat.com>; Fri, 22 Nov 2019 00:42:38 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-109-RertVHUkMGSfW-Ox2sr-Lg-1; Thu, 21 Nov 2019 19:42:31 -0500
Received: by mail-lj1-f193.google.com with SMTP id d5so5336971ljl.4
	for <linux-audit@redhat.com>; Thu, 21 Nov 2019 16:42:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=YzYTuPfhNF+6hAQ8DRw50vXORP/WZWzxXXw+iGKNMpw=;
	b=etrJlyOVtIjXljEsL4L5i8IgckpdKRfXMwNG7AR/4RZsS0JeEXliaPo6ozPSBtFrzb
	WN7ZPqy2at9yjrZR1FlDEPwBTHsTHZkcPbclU8UMPY8bB8e3TcW1HzpeMo7MWgywryVE
	sR7K8zkzuhQOSCqkbJ9392jEHJfu9aXcEwMt+JPIiRyMJjVTtzmfWOR9p70IKw0xrSEo
	nrcU+2R8XUQPG45AQiWyWIePYwbRqVAcuPz11fSTtsRgJbeMz8VJ5ps8SYY4/D3wV3jL
	PdNwQsph683BORrR4sdANR299eiCRQ/jh/acxvJtgp5mRr0kSXiTM2LHERbi+aQC+eR5
	I9cA==
X-Gm-Message-State: APjAAAUQCtvamgpGZJFP/Uacu1jlP6b2HywLGVcjN1WOP1YOhFMI+uD5
	j3R+x9W9Ta+SUyua/ujRyWI+FIUAPDZlZ7HjhylWIx8=
X-Google-Smtp-Source: APXvYqxHINm8pj5hHObN5FfogVwDQsXbF6iabxRdRu8W/YON+dxEFj3FPP1741tdwyk7vPn0EjxORYxieY+pfttr9EM=
X-Received: by 2002:a2e:970e:: with SMTP id r14mr9681041lji.57.1574383349234; 
	Thu, 21 Nov 2019 16:42:29 -0800 (PST)
MIME-Version: 1.0
References: <20191120213816.8186-1-jolsa@kernel.org>
	<8c928ec4-9e43-3e2a-7005-21f40fcca061@iogearbox.net>
	<CAADnVQKu-ZgFTaSMH=Q-jMOYYvE32TF2b2hq1=dmDV8wAf18pg@mail.gmail.com>
	<CAHC9VhQbQoXacbTCNJPGNzFOv30PwLeiWu4ROQFU46=saTeTNQ@mail.gmail.com>
	<b8a79ac0-a7d3-8d7b-1e31-33f477b30503@iogearbox.net>
In-Reply-To: <b8a79ac0-a7d3-8d7b-1e31-33f477b30503@iogearbox.net>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 21 Nov 2019 19:42:18 -0500
Message-ID: <CAHC9VhR7_n9MpoNx8A8QWzNMOZwMG6H6xegdYt5qxAf-xbwXCA@mail.gmail.com>
Subject: Re: [PATCH] bpf: emit audit messages upon successful prog load and
	unload
To: Daniel Borkmann <daniel@iogearbox.net>
X-MC-Unique: RertVHUkMGSfW-Ox2sr-Lg-1
X-MC-Unique: Bq2Mg6KYPT2XOoH0BnWg_A-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAM0geKs029091
X-loop: linux-audit@redhat.com
Cc: Jiri Benc <jbenc@redhat.com>, Jakub Kicinski <jakub.kicinski@netronome.com>,
	Network Development <netdev@vger.kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Martin KaFai Lau <kafai@fb.com>, linux-audit@redhat.com,
	Jiri Olsa <jolsa@kernel.org>, David Miller <davem@redhat.com>,
	Yonghong Song <yhs@fb.com>, bpf <bpf@vger.kernel.org>,
	Andrii Nakryiko <andriin@fb.com>,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 21, 2019 at 7:25 PM Daniel Borkmann <daniel@iogearbox.net> wrote:
> On 11/22/19 12:41 AM, Paul Moore wrote:
> > On Wed, Nov 20, 2019 at 4:49 PM Alexei Starovoitov
> > <alexei.starovoitov@gmail.com> wrote:
> >> On Wed, Nov 20, 2019 at 1:46 PM Daniel Borkmann <daniel@iogearbox.net> wrote:
> >>> On 11/20/19 10:38 PM, Jiri Olsa wrote:
> >>>> From: Daniel Borkmann <daniel@iogearbox.net>
> >>>>
> >>>> Allow for audit messages to be emitted upon BPF program load and
> >>>> unload for having a timeline of events. The load itself is in
> >>>> syscall context, so additional info about the process initiating
> >>>> the BPF prog creation can be logged and later directly correlated
> >>>> to the unload event.
> >>>>
> >>>> The only info really needed from BPF side is the globally unique
> >>>> prog ID where then audit user space tooling can query / dump all
> >>>> info needed about the specific BPF program right upon load event
> >>>> and enrich the record, thus these changes needed here can be kept
> >>>> small and non-intrusive to the core.
> >>>>
> >>>> Raw example output:
> >>>>
> >>>>     # auditctl -D
> >>>>     # auditctl -a always,exit -F arch=x86_64 -S bpf
> >>>>     # ausearch --start recent -m 1334
> >>>>     [...]
> >>>>     ----
> >>>>     time->Wed Nov 20 12:45:51 2019
> >>>>     type=PROCTITLE msg=audit(1574271951.590:8974): proctitle="./test_verifier"
> >>>>     type=SYSCALL msg=audit(1574271951.590:8974): arch=c000003e syscall=321 success=yes exit=14 a0=5 a1=7ffe2d923e80 a2=78 a3=0 items=0 ppid=742 pid=949 auid=0 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=pts0 ses=2 comm="test_verifier" exe="/root/bpf-next/tools/testing/selftests/bpf/test_verifier" subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=(null)
> >>>>     type=UNKNOWN[1334] msg=audit(1574271951.590:8974): auid=0 uid=0 gid=0 ses=2 subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 pid=949 comm="test_verifier" exe="/root/bpf-next/tools/testing/selftests/bpf/test_verifier" prog-id=3260 event=LOAD
> >>>>     ----
> >>>>     time->Wed Nov 20 12:45:51 2019
> >>>> type=UNKNOWN[1334] msg=audit(1574271951.590:8975): prog-id=3260 event=UNLOAD
> >>>>     ----
> >>>>     [...]
> >>>>
> >>>> Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
> >>>> Signed-off-by: Jiri Olsa <jolsa@kernel.org>
> >>>
> >>> LGTM, thanks for the rebase!
> >>
> >> Applied to bpf-next. Thanks!
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
> Fair enough, up to you guys. My impression was that this is mainly coming
> from RHEL use case [0] and given that the original patch was back in Oct
> 2018 [1] that you've sorted it out by now RH internally and agreed to proceed
> with this patch for BPF given the rebase + resend ... seems not then. :(

For the record, I am not currently employed by RH and thus not part of
any RH internal discussions.  Although, even when I was, I would still
bristle at the idea of audit patches going in without CC'ing the audit
list and getting an ACK from the audit folks.  Internal discussions
within a company are fine, but the final discussion and debate should
happen on the public list.

> Given the change is mostly trivial, are there any major objections for Jiri
> to follow-up? Otherwise worst case probably easier to revert in net-next.

See my previous response for more info.  However, for starters the use
of audit_log_task() looks like the wrong thing to do here.  I also
want to see a test for our test suite so we can catch when someone
invariably breaks this in future and fix it.

>    [0] slide 11, https://linuxplumbersconf.org/event/4/contributions/460/attachments/244/426/xdp-distro-view.pdf
>    [1] https://lore.kernel.org/netdev/20181004135038.2876-1-daniel@iogearbox.net/

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

