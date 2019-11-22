Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9C4E21072C1
	for <lists+linux-audit@lfdr.de>; Fri, 22 Nov 2019 14:07:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574428074;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GuEmysOQWS4EuvPtrREsLDdZW4urjkeYwSekV9vjrGg=;
	b=G/bdZrn9la/049cqTVjVnsgGMldHRL4wlmT5ZSUQ7Knx11Sza6o0ie5F9JK9tGJOIlRojS
	5s6BJqHI9LEv6Zw2I2SBSXOTnGd26LWV4RI3XeWkRIrnklns7JAUxttSXKATE3mddMORWn
	Slf4KgX+83Uip+H3jhVHnfSZ0Rf49rY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-3L8MYjzINCKmr7_Rf6Xc4A-1; Fri, 22 Nov 2019 08:07:50 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D5641005514;
	Fri, 22 Nov 2019 13:07:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 115D376FE5;
	Fri, 22 Nov 2019 13:07:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A2C1D4E562;
	Fri, 22 Nov 2019 13:07:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAM9Wd3i009307 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 22 Nov 2019 04:32:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A8C9C69316; Fri, 22 Nov 2019 09:32:39 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from krava (unknown [10.43.17.48])
	by smtp.corp.redhat.com (Postfix) with SMTP id A617B63772;
	Fri, 22 Nov 2019 09:32:33 +0000 (UTC)
Date: Fri, 22 Nov 2019 10:32:32 +0100
From: Jiri Olsa <jolsa@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH] bpf: emit audit messages upon successful prog load and
	unload
Message-ID: <20191122093232.GB8287@krava>
References: <20191120213816.8186-1-jolsa@kernel.org>
	<8c928ec4-9e43-3e2a-7005-21f40fcca061@iogearbox.net>
	<CAADnVQKu-ZgFTaSMH=Q-jMOYYvE32TF2b2hq1=dmDV8wAf18pg@mail.gmail.com>
	<CAHC9VhQbQoXacbTCNJPGNzFOv30PwLeiWu4ROQFU46=saTeTNQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhQbQoXacbTCNJPGNzFOv30PwLeiWu4ROQFU46=saTeTNQ@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 22 Nov 2019 08:07:20 -0500
Cc: Jiri Benc <jbenc@redhat.com>, Jakub Kicinski <jakub.kicinski@netronome.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 3L8MYjzINCKmr7_Rf6Xc4A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thu, Nov 21, 2019 at 06:41:31PM -0500, Paul Moore wrote:
> On Wed, Nov 20, 2019 at 4:49 PM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> > On Wed, Nov 20, 2019 at 1:46 PM Daniel Borkmann <daniel@iogearbox.net> =
wrote:
> > > On 11/20/19 10:38 PM, Jiri Olsa wrote:
> > > > From: Daniel Borkmann <daniel@iogearbox.net>
> > > >
> > > > Allow for audit messages to be emitted upon BPF program load and
> > > > unload for having a timeline of events. The load itself is in
> > > > syscall context, so additional info about the process initiating
> > > > the BPF prog creation can be logged and later directly correlated
> > > > to the unload event.
> > > >
> > > > The only info really needed from BPF side is the globally unique
> > > > prog ID where then audit user space tooling can query / dump all
> > > > info needed about the specific BPF program right upon load event
> > > > and enrich the record, thus these changes needed here can be kept
> > > > small and non-intrusive to the core.
> > > >
> > > > Raw example output:
> > > >
> > > >    # auditctl -D
> > > >    # auditctl -a always,exit -F arch=3Dx86_64 -S bpf
> > > >    # ausearch --start recent -m 1334
> > > >    [...]
> > > >    ----
> > > >    time->Wed Nov 20 12:45:51 2019
> > > >    type=3DPROCTITLE msg=3Daudit(1574271951.590:8974): proctitle=3D"=
./test_verifier"
> > > >    type=3DSYSCALL msg=3Daudit(1574271951.590:8974): arch=3Dc000003e=
 syscall=3D321 success=3Dyes exit=3D14 a0=3D5 a1=3D7ffe2d923e80 a2=3D78 a3=
=3D0 items=3D0 ppid=3D742 pid=3D949 auid=3D0 uid=3D0 gid=3D0 euid=3D0 suid=
=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3Dpts0 ses=3D2 comm=3D"test_=
verifier" exe=3D"/root/bpf-next/tools/testing/selftests/bpf/test_verifier" =
subj=3Dunconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=3D(null)
> > > >    type=3DUNKNOWN[1334] msg=3Daudit(1574271951.590:8974): auid=3D0 =
uid=3D0 gid=3D0 ses=3D2 subj=3Dunconfined_u:unconfined_r:unconfined_t:s0-s0=
:c0.c1023 pid=3D949 comm=3D"test_verifier" exe=3D"/root/bpf-next/tools/test=
ing/selftests/bpf/test_verifier" prog-id=3D3260 event=3DLOAD
> > > >    ----
> > > >    time->Wed Nov 20 12:45:51 2019
> > > > type=3DUNKNOWN[1334] msg=3Daudit(1574271951.590:8975): prog-id=3D32=
60 event=3DUNLOAD
> > > >    ----
> > > >    [...]
> > > >
> > > > Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
> > > > Signed-off-by: Jiri Olsa <jolsa@kernel.org>
> > >
> > > LGTM, thanks for the rebase!
> >
> > Applied to bpf-next. Thanks!
>=20
> [NOTE: added linux-audit to the To/CC line]
>=20
> Wait a minute, why was the linux-audit list not CC'd on this?  Why are
> you merging a patch into -next that adds to the uapi definition *and*
> creates a new audit record while we are at -rc8?

my bad sorry, I included only maintainers
there was previous RFC post:
  https://lore.kernel.org/netdev/20191120143810.8852-1-jolsa@kernel.org/

but I guess the patch followed up too fast

> Aside from that I'm concerned that you are relying on audit userspace
> changes that might not be okay; I see the PR below, but I don't see
> any comment on it from Steve (it is his audit userspace).  I also
> don't see a corresponding test added to the audit-testsuite, which is
> a common requirement for new audit functionality (link below).  I'm
> also fairly certain we don't want this new BPF record to look like how
> you've coded it up in bpf_audit_prog(); duplicating the fields with
> audit_log_task() is wrong, you've either already got them via an
> associated record (which you get from passing non-NULL as the first
> parameter to audit_log_start()), or you don't because there is no
> associated syscall/task (which you get from passing NULL as the first
> parameter).  Please revert, un-merge, etc. this patch from bpf-next;
> it should not go into Linus' tree as written.

the original audit approach for BPF notification was declined
in favor of perf-based approach:
  https://marc.info/?l=3Dlinux-netdev&m=3D153866106418036&w=3D2

We tried to add perf based notification support to auditd,
but it did not fit and was nack-ed by audit guys:
  https://www.redhat.com/archives/linux-audit/2019-August/msg00004.html

so we returned to the original approach

>=20
> Audit userspace PR:
> * https://github.com/linux-audit/audit-userspace/pull/104

this is the perf-based notification approach, that got nacked

>=20
> Audit test suite:
> * https://github.com/linux-audit/audit-testsuite

I'll check on these

thanks,
jirka

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

