Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id D077411AC33
	for <lists+linux-audit@lfdr.de>; Wed, 11 Dec 2019 14:40:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576071617;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MJLm9RFRW049Wy0WEgIgIEjgE0RcnN9fF0vbHFcDjAw=;
	b=f7TMeY3kDBzV/uaujrbdq5JLSYB8vAr6PT1pq9lb49y8RrJv/Aio4puC+Aq7fq9HiR9xI9
	3nG4VFhuF1KMTxJVGSSTgYu29xT+m23NLtuoseoawYBxyr/b9vDxjnm9kYL0OPKtB3dMRY
	hFLFtpGf8IQfGtMk6cQFZwud6/TYK8g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-ssUo_hy0OoSkru8cKxSbzg-1; Wed, 11 Dec 2019 08:40:15 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5AFB102C8D3;
	Wed, 11 Dec 2019 13:40:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B22B319756;
	Wed, 11 Dec 2019 13:40:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CA4BD18089CD;
	Wed, 11 Dec 2019 13:39:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBBDK5Cn016153 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 11 Dec 2019 08:20:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2075F2166B2E; Wed, 11 Dec 2019 13:20:05 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BE702166B2B
	for <linux-audit@redhat.com>; Wed, 11 Dec 2019 13:20:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A951A1809A43
	for <linux-audit@redhat.com>; Wed, 11 Dec 2019 13:20:02 +0000 (UTC)
Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-11-wIHE20cjMgi4n-aDiWGhPQ-1; Wed, 11 Dec 2019 08:19:58 -0500
Received: from [2001:1620:665:0:5795:5b0a:e5d5:5944] (helo=localhost)
	by www62.your-server.de with esmtpsa
	(TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256) (Exim 4.89_1)
	(envelope-from <daniel@iogearbox.net>)
	id 1if1uG-0004ra-BR; Wed, 11 Dec 2019 14:19:56 +0100
Date: Wed, 11 Dec 2019 14:19:55 +0100
From: Daniel Borkmann <daniel@iogearbox.net>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCHv3] bpf: Emit audit messages upon successful prog load and
	unload
Message-ID: <20191211131955.GC23383@linux.fritz.box>
References: <20191206214934.11319-1-jolsa@kernel.org>
	<20191209121537.GA14170@linux.fritz.box>
	<CAHC9VhQdOGTj1HT1cwvAdE1sRpzk5mC+oHQLHgJFa3vXEij+og@mail.gmail.com>
	<d387184e-9c5f-d5b2-0acb-57b794235cbd@iogearbox.net>
	<CAHC9VhRDsEDGripZRrVNcjEBEEULPk+0dRp-uJ3nmmBK7B=sYQ@mail.gmail.com>
	<20191210153652.GA14123@krava>
	<CAHC9VhSa_B-VJOa_r8OcNrm0Yd_t1j3otWhKHgganSDx5Ni=Tg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhSa_B-VJOa_r8OcNrm0Yd_t1j3otWhKHgganSDx5Ni=Tg@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.101.4/25660/Wed Dec 11 10:47:07 2019)
X-MC-Unique: wIHE20cjMgi4n-aDiWGhPQ-1
X-MC-Unique: ssUo_hy0OoSkru8cKxSbzg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xBBDK5Cn016153
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Wed, 11 Dec 2019 08:39:46 -0500
Cc: Andrii Nakryiko <andriin@fb.com>,
	Jakub Kicinski <jakub.kicinski@netronome.com>,
	netdev@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
	Jiri Benc <jbenc@redhat.com>, linux-audit@redhat.com,
	Jiri Olsa <jolsa@kernel.org>, David Miller <davem@redhat.com>,
	Yonghong Song <yhs@fb.com>, bpf@vger.kernel.org,
	Jiri Olsa <jolsa@redhat.com>, Martin KaFai Lau <kafai@fb.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Dec 10, 2019 at 05:45:59PM -0500, Paul Moore wrote:
> On Tue, Dec 10, 2019 at 10:37 AM Jiri Olsa <jolsa@redhat.com> wrote:
> > On Mon, Dec 09, 2019 at 06:53:23PM -0500, Paul Moore wrote:
> > > On Mon, Dec 9, 2019 at 6:19 PM Daniel Borkmann <daniel@iogearbox.net> wrote:
> > > > On 12/9/19 3:56 PM, Paul Moore wrote:
> > > > > On Mon, Dec 9, 2019 at 7:15 AM Daniel Borkmann <daniel@iogearbox.net> wrote:
> > > > >> On Fri, Dec 06, 2019 at 10:49:34PM +0100, Jiri Olsa wrote:
> > > > >>> From: Daniel Borkmann <daniel@iogearbox.net>
> > > > >>>
> > > > >>> Allow for audit messages to be emitted upon BPF program load and
> > > > >>> unload for having a timeline of events. The load itself is in
> > > > >>> syscall context, so additional info about the process initiating
> > > > >>> the BPF prog creation can be logged and later directly correlated
> > > > >>> to the unload event.
> > > > >>>
> > > > >>> The only info really needed from BPF side is the globally unique
> > > > >>> prog ID where then audit user space tooling can query / dump all
> > > > >>> info needed about the specific BPF program right upon load event
> > > > >>> and enrich the record, thus these changes needed here can be kept
> > > > >>> small and non-intrusive to the core.
> > > > >>>
> > > > >>> Raw example output:
> > > > >>>
> > > > >>>    # auditctl -D
> > > > >>>    # auditctl -a always,exit -F arch=x86_64 -S bpf
> > > > >>>    # ausearch --start recent -m 1334
> > > > >>>    ...
> > > > >>>    ----
> > > > >>>    time->Wed Nov 27 16:04:13 2019
> > > > >>>    type=PROCTITLE msg=audit(1574867053.120:84664): proctitle="./bpf"
> > > > >>>    type=SYSCALL msg=audit(1574867053.120:84664): arch=c000003e syscall=321   \
> > > > >>>      success=yes exit=3 a0=5 a1=7ffea484fbe0 a2=70 a3=0 items=0 ppid=7477    \
> > > > >>>      pid=12698 auid=1001 uid=1001 gid=1001 euid=1001 suid=1001 fsuid=1001    \
> > > > >>>      egid=1001 sgid=1001 fsgid=1001 tty=pts2 ses=4 comm="bpf"                \
> > > > >>>      exe="/home/jolsa/auditd/audit-testsuite/tests/bpf/bpf"                  \
> > > > >>>      subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=(null)
> > > > >>>    type=UNKNOWN[1334] msg=audit(1574867053.120:84664): prog-id=76 op=LOAD
> > > > >>>    ----
> > > > >>>    time->Wed Nov 27 16:04:13 2019
> > > > >>>    type=UNKNOWN[1334] msg=audit(1574867053.120:84665): prog-id=76 op=UNLOAD
> > > > >>>    ...
> > > > >>>
> > > > >>> Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
> > > > >>> Co-developed-by: Jiri Olsa <jolsa@kernel.org>
> > > > >>> Signed-off-by: Jiri Olsa <jolsa@kernel.org>
> > > > >>
> > > > >> Paul, Steve, given the merge window is closed by now, does this version look
> > > > >> okay to you for proceeding to merge into bpf-next?
> > > > >
> > > > > Given the change to audit UAPI I was hoping to merge this via the
> > > > > audit/next tree, is that okay with you?
> > > >
> > > > Hm, my main concern is that given all the main changes are in BPF core and
> > > > usually the BPF subsystem has plenty of changes per release coming in that we'd
> > > > end up generating unnecessary merge conflicts. Given the include/uapi/linux/audit.h
> > > > UAPI diff is a one-line change, my preference would be to merge via bpf-next with
> > > > your ACK or SOB added. Does that work for you as well as?
> > >
> > > I regularly (a few times a week) run the audit and SELinux tests
> > > against Linus+audit/next+selinux/next to make sure things are working
> > > as expected and that some other subsystem has introduced a change
> > > which has broken something.  If you are willing to ensure the tests
> > > get run, including your new BPF audit tests I would be okay with that;
> > > is that acceptable?
> >
> > would you please let me know which tree this landed at the end?
> 
> I think that's what we are trying to figure out - Daniel?

Yeah, sounds reasonable wrt running tests to make sure nothing breaks. In that
case I'd wait for your ACK or SOB to proceed with merging into bpf-next. Thanks
Paul!


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

