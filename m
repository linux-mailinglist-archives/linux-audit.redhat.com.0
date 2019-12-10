Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id C2F41119E85
	for <lists+linux-audit@lfdr.de>; Tue, 10 Dec 2019 23:46:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576018003;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JvmUqdF8WAu7PFvy31OwtVngUoJ1tzc2Omuydkh31rE=;
	b=YDTx6chJ7CVdLGe2mzSzhknZihNU4MvXekOKM/eLLi28H6vWUauHYWAW2PTG4eoqB1KAvu
	NMNEv9bdgWipxcg+fYneYtmL3Hacw0Gotbff5EX8mvbK9fdcHWVMrnje4MJTtH0ptBbJ9u
	QkSXf1lSpfl7oBV9EnDcAavsmuqLJT4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-QEwyczTxOf6p6F7Jh9nVbg-1; Tue, 10 Dec 2019 17:46:41 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3340E800C7B;
	Tue, 10 Dec 2019 22:46:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86AFD5C1B0;
	Tue, 10 Dec 2019 22:46:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6628783570;
	Tue, 10 Dec 2019 22:46:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBAMkJs6001997 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 10 Dec 2019 17:46:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5183A10100DC; Tue, 10 Dec 2019 22:46:19 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C5E3101301D
	for <linux-audit@redhat.com>; Tue, 10 Dec 2019 22:46:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2CD71024BC4
	for <linux-audit@redhat.com>; Tue, 10 Dec 2019 22:46:16 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-412-rzy6cWo7PkK5AJXldEGrFg-1; Tue, 10 Dec 2019 17:46:12 -0500
Received: by mail-lj1-f194.google.com with SMTP id h23so21731673ljc.8
	for <linux-audit@redhat.com>; Tue, 10 Dec 2019 14:46:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iqidpsRetevR7KQf2spiLZEXt1H+oFvx8yu6gvT2PyY=;
	b=Ompul64mw6LEwB0L/EiBRPGv+btVcVg/gOUBbPToqeVBrQ2YlIvqrvryg2C5aepS82
	wfkIkrBBF52X+NlRZaCJ2FH/uopzhvu6AHDFVlRdaehMN0KZCPwavI7FRXWZBGlbajk8
	VI2d7EmylOiXtbfE8ZQAzq/U7j2Ffj4lQ83P4UXWk/G8VqjZYb+vI1K8t++0/CLK4UDd
	aGYeK8KIBJI1qe+Xei94ETWGbvsHkrdTiKGTGqB3zfkWmz9VvXpYVii8cooBwqKzcnR2
	XZwCb7KRv5tyPX070IMNpekw63/PI7BApkQ6k1ky4A59dxWxEugVHc7OYxU20H4Hiyp0
	+t/w==
X-Gm-Message-State: APjAAAWeW0nE2zkOA7f/fO5vkqknkpA8B9mvNoN4msDdCbd2JjaaL0pd
	5lEZVHq+1vxmJ4r1K0GQFwnEIEOYHMSqiGe9QZLu
X-Google-Smtp-Source: APXvYqwwFpweBwuruZL/D9PCPIdAr4GxZUnVllKgDndZSSzILeWdfLDomxs8nWamvvW8Y3aYKfYQw+55pd3HU/tS5yg=
X-Received: by 2002:a2e:800b:: with SMTP id j11mr20040516ljg.126.1576017970966;
	Tue, 10 Dec 2019 14:46:10 -0800 (PST)
MIME-Version: 1.0
References: <20191206214934.11319-1-jolsa@kernel.org>
	<20191209121537.GA14170@linux.fritz.box>
	<CAHC9VhQdOGTj1HT1cwvAdE1sRpzk5mC+oHQLHgJFa3vXEij+og@mail.gmail.com>
	<d387184e-9c5f-d5b2-0acb-57b794235cbd@iogearbox.net>
	<CAHC9VhRDsEDGripZRrVNcjEBEEULPk+0dRp-uJ3nmmBK7B=sYQ@mail.gmail.com>
	<20191210153652.GA14123@krava>
In-Reply-To: <20191210153652.GA14123@krava>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 10 Dec 2019 17:45:59 -0500
Message-ID: <CAHC9VhSa_B-VJOa_r8OcNrm0Yd_t1j3otWhKHgganSDx5Ni=Tg@mail.gmail.com>
Subject: Re: [PATCHv3] bpf: Emit audit messages upon successful prog load and
	unload
To: Jiri Olsa <jolsa@redhat.com>
X-MC-Unique: rzy6cWo7PkK5AJXldEGrFg-1
X-MC-Unique: QEwyczTxOf6p6F7Jh9nVbg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xBAMkJs6001997
X-loop: linux-audit@redhat.com
Cc: Jakub Kicinski <jakub.kicinski@netronome.com>,
	Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 10, 2019 at 10:37 AM Jiri Olsa <jolsa@redhat.com> wrote:
> On Mon, Dec 09, 2019 at 06:53:23PM -0500, Paul Moore wrote:
> > On Mon, Dec 9, 2019 at 6:19 PM Daniel Borkmann <daniel@iogearbox.net> wrote:
> > > On 12/9/19 3:56 PM, Paul Moore wrote:
> > > > On Mon, Dec 9, 2019 at 7:15 AM Daniel Borkmann <daniel@iogearbox.net> wrote:
> > > >> On Fri, Dec 06, 2019 at 10:49:34PM +0100, Jiri Olsa wrote:
> > > >>> From: Daniel Borkmann <daniel@iogearbox.net>
> > > >>>
> > > >>> Allow for audit messages to be emitted upon BPF program load and
> > > >>> unload for having a timeline of events. The load itself is in
> > > >>> syscall context, so additional info about the process initiating
> > > >>> the BPF prog creation can be logged and later directly correlated
> > > >>> to the unload event.
> > > >>>
> > > >>> The only info really needed from BPF side is the globally unique
> > > >>> prog ID where then audit user space tooling can query / dump all
> > > >>> info needed about the specific BPF program right upon load event
> > > >>> and enrich the record, thus these changes needed here can be kept
> > > >>> small and non-intrusive to the core.
> > > >>>
> > > >>> Raw example output:
> > > >>>
> > > >>>    # auditctl -D
> > > >>>    # auditctl -a always,exit -F arch=x86_64 -S bpf
> > > >>>    # ausearch --start recent -m 1334
> > > >>>    ...
> > > >>>    ----
> > > >>>    time->Wed Nov 27 16:04:13 2019
> > > >>>    type=PROCTITLE msg=audit(1574867053.120:84664): proctitle="./bpf"
> > > >>>    type=SYSCALL msg=audit(1574867053.120:84664): arch=c000003e syscall=321   \
> > > >>>      success=yes exit=3 a0=5 a1=7ffea484fbe0 a2=70 a3=0 items=0 ppid=7477    \
> > > >>>      pid=12698 auid=1001 uid=1001 gid=1001 euid=1001 suid=1001 fsuid=1001    \
> > > >>>      egid=1001 sgid=1001 fsgid=1001 tty=pts2 ses=4 comm="bpf"                \
> > > >>>      exe="/home/jolsa/auditd/audit-testsuite/tests/bpf/bpf"                  \
> > > >>>      subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=(null)
> > > >>>    type=UNKNOWN[1334] msg=audit(1574867053.120:84664): prog-id=76 op=LOAD
> > > >>>    ----
> > > >>>    time->Wed Nov 27 16:04:13 2019
> > > >>>    type=UNKNOWN[1334] msg=audit(1574867053.120:84665): prog-id=76 op=UNLOAD
> > > >>>    ...
> > > >>>
> > > >>> Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
> > > >>> Co-developed-by: Jiri Olsa <jolsa@kernel.org>
> > > >>> Signed-off-by: Jiri Olsa <jolsa@kernel.org>
> > > >>
> > > >> Paul, Steve, given the merge window is closed by now, does this version look
> > > >> okay to you for proceeding to merge into bpf-next?
> > > >
> > > > Given the change to audit UAPI I was hoping to merge this via the
> > > > audit/next tree, is that okay with you?
> > >
> > > Hm, my main concern is that given all the main changes are in BPF core and
> > > usually the BPF subsystem has plenty of changes per release coming in that we'd
> > > end up generating unnecessary merge conflicts. Given the include/uapi/linux/audit.h
> > > UAPI diff is a one-line change, my preference would be to merge via bpf-next with
> > > your ACK or SOB added. Does that work for you as well as?
> >
> > I regularly (a few times a week) run the audit and SELinux tests
> > against Linus+audit/next+selinux/next to make sure things are working
> > as expected and that some other subsystem has introduced a change
> > which has broken something.  If you are willing to ensure the tests
> > get run, including your new BPF audit tests I would be okay with that;
> > is that acceptable?
>
> hi,
> would you please let me know which tree this landed at the end?

I think that's what we are trying to figure out - Daniel?

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

