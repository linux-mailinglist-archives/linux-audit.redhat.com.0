Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id B14D41072C2
	for <lists+linux-audit@lfdr.de>; Fri, 22 Nov 2019 14:07:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574428073;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vQtyMwmwID3C+Rm2ocwQyHrXkD7hZB9u9GXAwe31LME=;
	b=TBVbQ53aporTnO9Fx0sBrfWoEdjSsEfc0uvaouIGsWT1IoOUBgWFaSBfFq61wJCuwSjqls
	pVx1vPEnAG9eFX5KBZv6D5Q80LHpcN0hdno7/ZFdk561mEWPiVweMg0sgQdUytIA4+VymG
	6rkrVYQ5/N9hhsHvrI3cwhsznUS5IXg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-CDAtHoojPQm-3leuH1LdXw-1; Fri, 22 Nov 2019 08:07:48 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3955DB24;
	Fri, 22 Nov 2019 13:07:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3950C6016C;
	Fri, 22 Nov 2019 13:07:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2FB0118089D0;
	Fri, 22 Nov 2019 13:07:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAM0NDX0028706 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 21 Nov 2019 19:23:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 62D76203396F; Fri, 22 Nov 2019 00:23:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D8622064008
	for <linux-audit@redhat.com>; Fri, 22 Nov 2019 00:23:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 658EC101A55E
	for <linux-audit@redhat.com>; Fri, 22 Nov 2019 00:23:11 +0000 (UTC)
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-307-qcv1VnxvOri-03hPivS_IA-1; Thu, 21 Nov 2019 19:23:07 -0500
Received: by mail-pj1-f68.google.com with SMTP id a10so2252203pju.10;
	Thu, 21 Nov 2019 16:23:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=jHfmWhwDjTayWt4cceCFKWOx1QwC3hTKJWD9ujUx5bs=;
	b=Z8cfQ2ITFT2MHCVzHtkmmvA3HGVVa7+x4K04ScS3wDc4dLgSSzxcVfxa4Pi1kh4JGF
	1SXQEQmVlYKC5t2tENnblGKN9BexupEy6Fs5ydolCzm98a/mGlVCBmfM82ePb1IJ3T1I
	k4saS6eCmhTiIiuPNwGJhyZIqziB81IIo96dPof5LrWmdqtJNPQhqrb9GnPiximq2kw8
	uIW/1y5730PUgUpPXJbLHosVzWkSt4gRjBQ6UeBKOGCmCbWYRNzGSyHh/t6atB+Q4EDK
	hTmeA/EmxGSNFsR1KsFbX4Wk3r3YY75IYq3JaYilHzqCLu5ggkakcLkjlfsHDEdE9I5g
	9AUw==
X-Gm-Message-State: APjAAAXUzdOpE0Np4lq75PApy/gFv99BLrrzssFctlOXX+fqE/+KYyaE
	izGspgHWK7ncX8mKl0vG66E=
X-Google-Smtp-Source: APXvYqwIAD2d23t3wkiXDlurwxuEr+VIkFxuxQRG4nhY2AY9BJDYHvJ1pUObdT7cFCAcAuTBD23uCA==
X-Received: by 2002:a17:902:820f:: with SMTP id
	x15mr11623453pln.125.1574382185655; 
	Thu, 21 Nov 2019 16:23:05 -0800 (PST)
Received: from ast-mbp.dhcp.thefacebook.com ([2620:10d:c090:180::dee3])
	by smtp.gmail.com with ESMTPSA id
	em16sm622342pjb.21.2019.11.21.16.23.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Nov 2019 16:23:03 -0800 (PST)
Date: Thu, 21 Nov 2019 16:22:59 -0800
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH] bpf: emit audit messages upon successful prog load and
	unload
Message-ID: <20191122002257.4hgui6pylpkmpwac@ast-mbp.dhcp.thefacebook.com>
References: <20191120213816.8186-1-jolsa@kernel.org>
	<8c928ec4-9e43-3e2a-7005-21f40fcca061@iogearbox.net>
	<CAADnVQKu-ZgFTaSMH=Q-jMOYYvE32TF2b2hq1=dmDV8wAf18pg@mail.gmail.com>
	<CAHC9VhQbQoXacbTCNJPGNzFOv30PwLeiWu4ROQFU46=saTeTNQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhQbQoXacbTCNJPGNzFOv30PwLeiWu4ROQFU46=saTeTNQ@mail.gmail.com>
User-Agent: NeoMutt/20180223
X-MC-Unique: qcv1VnxvOri-03hPivS_IA-1
X-MC-Unique: CDAtHoojPQm-3leuH1LdXw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAM0NDX0028706
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 22 Nov 2019 08:07:21 -0500
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
>=20
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

Sorry I didn't realize there was a disagreement.

Dave, could you please revert it in net-next?

> Audit userspace PR:
> * https://github.com/linux-audit/audit-userspace/pull/104

This PR does not use this new audit. It's doing everything via existing
perf_event notification. My understanding of Jiri's email was that netlink
style is preferred vs perf_event. Did I get it wrong?


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

