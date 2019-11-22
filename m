Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 517EE1072BF
	for <lists+linux-audit@lfdr.de>; Fri, 22 Nov 2019 14:07:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574428072;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Krhe93liP0jrRJS7lkXQ78vx90W4GAmStJtLY8F8zZs=;
	b=aXTe0XFaT/045RRxa1vwvpM0MlKJqJh7s98WVDXgY/Ksa6kRIZUliNzrX5K++TMIOx3VUS
	v0d0wxfUf4ANFQaAm8evmz+j5eC1iZyZUIxDB0wz7LLPhIEUOlluJKHjXFhENjcDIJSBAp
	puwtRvMVRNEAeTwSL+m7lOlOYKdww8w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-fypBxTRgMW6kn_NiE8RaOw-1; Fri, 22 Nov 2019 08:07:49 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E5E7DB21;
	Fri, 22 Nov 2019 13:07:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3657460141;
	Fri, 22 Nov 2019 13:07:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2EAD418089CE;
	Fri, 22 Nov 2019 13:07:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAM0PbfP028739 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 21 Nov 2019 19:25:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6A9162064008; Fri, 22 Nov 2019 00:25:37 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 662FA203396F
	for <linux-audit@redhat.com>; Fri, 22 Nov 2019 00:25:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6804C800195
	for <linux-audit@redhat.com>; Fri, 22 Nov 2019 00:25:35 +0000 (UTC)
Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-147-XpcGJ5LMOHK0ede1AXsgJA-1; Thu, 21 Nov 2019 19:25:33 -0500
Received: from sslproxy01.your-server.de ([88.198.220.130])
	by www62.your-server.de with esmtpsa
	(TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256) (Exim 4.89_1)
	(envelope-from <daniel@iogearbox.net>)
	id 1iXwlN-0007NS-8Q; Fri, 22 Nov 2019 01:25:29 +0100
Received: from [178.197.248.30] (helo=pc-9.home)
	by sslproxy01.your-server.de with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.89)
	(envelope-from <daniel@iogearbox.net>)
	id 1iXwlM-0002Tj-LF; Fri, 22 Nov 2019 01:25:28 +0100
Subject: Re: [PATCH] bpf: emit audit messages upon successful prog load and
	unload
To: Paul Moore <paul@paul-moore.com>,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	linux-audit@redhat.com, Jiri Olsa <jolsa@kernel.org>
References: <20191120213816.8186-1-jolsa@kernel.org>
	<8c928ec4-9e43-3e2a-7005-21f40fcca061@iogearbox.net>
	<CAADnVQKu-ZgFTaSMH=Q-jMOYYvE32TF2b2hq1=dmDV8wAf18pg@mail.gmail.com>
	<CAHC9VhQbQoXacbTCNJPGNzFOv30PwLeiWu4ROQFU46=saTeTNQ@mail.gmail.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <b8a79ac0-a7d3-8d7b-1e31-33f477b30503@iogearbox.net>
Date: Fri, 22 Nov 2019 01:25:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAHC9VhQbQoXacbTCNJPGNzFOv30PwLeiWu4ROQFU46=saTeTNQ@mail.gmail.com>
Content-Language: en-US
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.101.4/25640/Thu Nov 21 11:08:44 2019)
X-MC-Unique: XpcGJ5LMOHK0ede1AXsgJA-1
X-MC-Unique: fypBxTRgMW6kn_NiE8RaOw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAM0PbfP028739
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 22 Nov 2019 08:07:21 -0500
Cc: Jakub Kicinski <jakub.kicinski@netronome.com>,
	Network Development <netdev@vger.kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Jiri Benc <jbenc@redhat.com>, David Miller <davem@redhat.com>,
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
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable

On 11/22/19 12:41 AM, Paul Moore wrote:
> On Wed, Nov 20, 2019 at 4:49 PM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
>> On Wed, Nov 20, 2019 at 1:46 PM Daniel Borkmann <daniel@iogearbox.net> w=
rote:
>>> On 11/20/19 10:38 PM, Jiri Olsa wrote:
>>>> From: Daniel Borkmann <daniel@iogearbox.net>
>>>>
>>>> Allow for audit messages to be emitted upon BPF program load and
>>>> unload for having a timeline of events. The load itself is in
>>>> syscall context, so additional info about the process initiating
>>>> the BPF prog creation can be logged and later directly correlated
>>>> to the unload event.
>>>>
>>>> The only info really needed from BPF side is the globally unique
>>>> prog ID where then audit user space tooling can query / dump all
>>>> info needed about the specific BPF program right upon load event
>>>> and enrich the record, thus these changes needed here can be kept
>>>> small and non-intrusive to the core.
>>>>
>>>> Raw example output:
>>>>
>>>>     # auditctl -D
>>>>     # auditctl -a always,exit -F arch=3Dx86_64 -S bpf
>>>>     # ausearch --start recent -m 1334
>>>>     [...]
>>>>     ----
>>>>     time->Wed Nov 20 12:45:51 2019
>>>>     type=3DPROCTITLE msg=3Daudit(1574271951.590:8974): proctitle=3D"./=
test_verifier"
>>>>     type=3DSYSCALL msg=3Daudit(1574271951.590:8974): arch=3Dc000003e s=
yscall=3D321 success=3Dyes exit=3D14 a0=3D5 a1=3D7ffe2d923e80 a2=3D78 a3=3D=
0 items=3D0 ppid=3D742 pid=3D949 auid=3D0 uid=3D0 gid=3D0 euid=3D0 suid=3D0=
 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3Dpts0 ses=3D2 comm=3D"test_veri=
fier" exe=3D"/root/bpf-next/tools/testing/selftests/bpf/test_verifier" subj=
=3Dunconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=3D(null)
>>>>     type=3DUNKNOWN[1334] msg=3Daudit(1574271951.590:8974): auid=3D0 ui=
d=3D0 gid=3D0 ses=3D2 subj=3Dunconfined_u:unconfined_r:unconfined_t:s0-s0:c=
0.c1023 pid=3D949 comm=3D"test_verifier" exe=3D"/root/bpf-next/tools/testin=
g/selftests/bpf/test_verifier" prog-id=3D3260 event=3DLOAD
>>>>     ----
>>>>     time->Wed Nov 20 12:45:51 2019
>>>> type=3DUNKNOWN[1334] msg=3Daudit(1574271951.590:8975): prog-id=3D3260 =
event=3DUNLOAD
>>>>     ----
>>>>     [...]
>>>>
>>>> Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
>>>> Signed-off-by: Jiri Olsa <jolsa@kernel.org>
>>>
>>> LGTM, thanks for the rebase!
>>
>> Applied to bpf-next. Thanks!
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

Fair enough, up to you guys. My impression was that this is mainly coming
from RHEL use case [0] and given that the original patch was back in Oct
2018 [1] that you've sorted it out by now RH internally and agreed to proce=
ed
with this patch for BPF given the rebase + resend ... seems not then. :(

The audit-userspace PR below is sitting there since August this year but
its for the perf event based approach and my understanding from Plumbers
conf was that the internal discussion was that a native integration was
needed hence the proposed resend now.

Given the change is mostly trivial, are there any major objections for Jiri
to follow-up? Otherwise worst case probably easier to revert in net-next.

> Audit userspace PR:
> * https://github.com/linux-audit/audit-userspace/pull/104
>=20
> Audit test suite:
> * https://github.com/linux-audit/audit-testsuite
>=20
> Audit folks, here is a link to the thread in the archives:
> * https://lore.kernel.org/bpf/20191120213816.8186-1-jolsa@kernel.org/T/#u

Thanks,
Daniel

   [0] slide 11, https://linuxplumbersconf.org/event/4/contributions/460/at=
tachments/244/426/xdp-distro-view.pdf
   [1] https://lore.kernel.org/netdev/20181004135038.2876-1-daniel@iogearbo=
x.net/


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

