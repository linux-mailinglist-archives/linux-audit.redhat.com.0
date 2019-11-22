Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id AA67810792C
	for <lists+linux-audit@lfdr.de>; Fri, 22 Nov 2019 21:06:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574453171;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+oNGulGZeJqtFxzdNtK36Hc+1Hl3Jc44xPk2NYkYKJA=;
	b=NG+Y3I694ONbocseFkJRaAYaxrcLzeVtsS/GCOnL/kb9INmhl0W0auNwaxSdI+U8loyxeY
	XrU8p9iqGTAZRT+mreiFpPz84qXFZxggm9JmpFxcnmkIz6iQD8CQbDe4uycfRYeiyjm4zT
	41nmflT//r+LwRcJc8WgSCobh3pV1Jo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-MZT57p7kN5CAVKEHGpePIg-1; Fri, 22 Nov 2019 15:06:10 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 263558C5481;
	Fri, 22 Nov 2019 20:06:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5E515E1AE;
	Fri, 22 Nov 2019 20:06:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 13F7718089CE;
	Fri, 22 Nov 2019 20:05:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAMJO0Vn027724 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 22 Nov 2019 14:24:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 81EAC60BDA; Fri, 22 Nov 2019 19:24:00 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from krava (ovpn-204-245.brq.redhat.com [10.40.204.245])
	by smtp.corp.redhat.com (Postfix) with SMTP id 9310E60468;
	Fri, 22 Nov 2019 19:23:54 +0000 (UTC)
Date: Fri, 22 Nov 2019 20:23:53 +0100
From: Jiri Olsa <jolsa@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH] bpf: emit audit messages upon successful prog load and
	unload
Message-ID: <20191122192353.GA2157@krava>
References: <20191120213816.8186-1-jolsa@kernel.org>
	<8c928ec4-9e43-3e2a-7005-21f40fcca061@iogearbox.net>
	<CAADnVQKu-ZgFTaSMH=Q-jMOYYvE32TF2b2hq1=dmDV8wAf18pg@mail.gmail.com>
	<CAHC9VhQbQoXacbTCNJPGNzFOv30PwLeiWu4ROQFU46=saTeTNQ@mail.gmail.com>
	<20191122002257.4hgui6pylpkmpwac@ast-mbp.dhcp.thefacebook.com>
	<CAHC9VhRihMi_d-p+ieXyuVBcGMs80SkypVxF4gLE_s45GKP0dg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhRihMi_d-p+ieXyuVBcGMs80SkypVxF4gLE_s45GKP0dg@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 22 Nov 2019 15:05:52 -0500
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: MZT57p7kN5CAVKEHGpePIg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Nov 21, 2019 at 07:36:29PM -0500, Paul Moore wrote:
> On Thu, Nov 21, 2019 at 7:23 PM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> > On Thu, Nov 21, 2019 at 06:41:31PM -0500, Paul Moore wrote:
> > > On Wed, Nov 20, 2019 at 4:49 PM Alexei Starovoitov
> > > <alexei.starovoitov@gmail.com> wrote:
> > > > On Wed, Nov 20, 2019 at 1:46 PM Daniel Borkmann <daniel@iogearbox.net> wrote:
> > > > > On 11/20/19 10:38 PM, Jiri Olsa wrote:
> > > > > > From: Daniel Borkmann <daniel@iogearbox.net>
> > > > > >
> > > > > > Allow for audit messages to be emitted upon BPF program load and
> > > > > > unload for having a timeline of events. The load itself is in
> > > > > > syscall context, so additional info about the process initiating
> > > > > > the BPF prog creation can be logged and later directly correlated
> > > > > > to the unload event.
> > > > > >
> > > > > > The only info really needed from BPF side is the globally unique
> > > > > > prog ID where then audit user space tooling can query / dump all
> > > > > > info needed about the specific BPF program right upon load event
> > > > > > and enrich the record, thus these changes needed here can be kept
> > > > > > small and non-intrusive to the core.
> > > > > >
> > > > > > Raw example output:
> > > > > >
> > > > > >    # auditctl -D
> > > > > >    # auditctl -a always,exit -F arch=x86_64 -S bpf
> > > > > >    # ausearch --start recent -m 1334
> > > > > >    [...]
> > > > > >    ----
> > > > > >    time->Wed Nov 20 12:45:51 2019
> > > > > >    type=PROCTITLE msg=audit(1574271951.590:8974): proctitle="./test_verifier"
> > > > > >    type=SYSCALL msg=audit(1574271951.590:8974): arch=c000003e syscall=321 success=yes exit=14 a0=5 a1=7ffe2d923e80 a2=78 a3=0 items=0 ppid=742 pid=949 auid=0 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=pts0 ses=2 comm="test_verifier" exe="/root/bpf-next/tools/testing/selftests/bpf/test_verifier" subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=(null)
> > > > > >    type=UNKNOWN[1334] msg=audit(1574271951.590:8974): auid=0 uid=0 gid=0 ses=2 subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 pid=949 comm="test_verifier" exe="/root/bpf-next/tools/testing/selftests/bpf/test_verifier" prog-id=3260 event=LOAD
> > > > > >    ----
> > > > > >    time->Wed Nov 20 12:45:51 2019
> > > > > > type=UNKNOWN[1334] msg=audit(1574271951.590:8975): prog-id=3260 event=UNLOAD
> > > > > >    ----
> > > > > >    [...]
> > > > > >
> > > > > > Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
> > > > > > Signed-off-by: Jiri Olsa <jolsa@kernel.org>
> > > > >
> > > > > LGTM, thanks for the rebase!
> > > >
> > > > Applied to bpf-next. Thanks!
> > >
> > > [NOTE: added linux-audit to the To/CC line]
> > >
> > > Wait a minute, why was the linux-audit list not CC'd on this?  Why are
> > > you merging a patch into -next that adds to the uapi definition *and*
> > > creates a new audit record while we are at -rc8?
> > >
> > > Aside from that I'm concerned that you are relying on audit userspace
> > > changes that might not be okay; I see the PR below, but I don't see
> > > any comment on it from Steve (it is his audit userspace).  I also
> > > don't see a corresponding test added to the audit-testsuite, which is
> > > a common requirement for new audit functionality (link below).  I'm
> > > also fairly certain we don't want this new BPF record to look like how
> > > you've coded it up in bpf_audit_prog(); duplicating the fields with
> > > audit_log_task() is wrong, you've either already got them via an
> > > associated record (which you get from passing non-NULL as the first
> > > parameter to audit_log_start()), or you don't because there is no
> > > associated syscall/task (which you get from passing NULL as the first
> > > parameter).  Please revert, un-merge, etc. this patch from bpf-next;
> > > it should not go into Linus' tree as written.
> >
> > Sorry I didn't realize there was a disagreement.
> >
> > Dave, could you please revert it in net-next?
> >
> > > Audit userspace PR:
> > > * https://github.com/linux-audit/audit-userspace/pull/104
> >
> > This PR does not use this new audit. It's doing everything via existing
> > perf_event notification. My understanding of Jiri's email was that netlink
> > style is preferred vs perf_event. Did I get it wrong?
> 
> Perhaps confusion on my part regarding the audit-userspace PR.  The
> commit description mentioned the audit userspace (the daemon most
> likely) fetching additional info about the BPF program and this was
> the only outstanding audit-userspace PR that had any mention of BPF.
> 
> However, getting back to netlink vs perf_event, if you want to
> generate an audit record, it should happen via the audit subsystem
> (and go up to the audit daemon via netlink).

Paul,
would following output be ok:

    type=SYSCALL msg=audit(1574445211.897:28015): arch=c000003e syscall=321 success=no exit=-13 a0=5 a1=7fff09ac6c60 a2=78 a3=6 items=0 ppid=1408 pid=9266 auid=1001 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=pts0 ses=1 comm="test_verifier" exe="/home/jolsa/linux/tools/testing/selftests/bpf/test_verifier" subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=(null)ARCH=x86_64 SYSCALL=bpf AUID="jolsa" UID="root" GID="root" EUID="root" SUID="root" FSUID="root" EGID="root" SGID="root" FSGID="root"
    type=PROCTITLE msg=audit(1574445211.897:28015): proctitle="./test_verifier"
    type=BPF msg=audit(1574445211.897:28016): prog-id=8103 event=LOAD

    type=SYSCALL msg=audit(1574445211.897:28016): arch=c000003e syscall=321 success=yes exit=14 a0=5 a1=7fff09ac6b80 a2=78 a3=0 items=0 ppid=1408 pid=9266 auid=1001 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=pts0 ses=1 comm="test_verifier" exe="/home/jolsa/linux/tools/testing/selftests/bpf/test_verifier" subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=(null)ARCH=x86_64 SYSCALL=bpf AUID="jolsa" UID="root" GID="root" EUID="root" SUID="root" FSUID="root" EGID="root" SGID="root" FSGID="root"
    type=PROCTITLE msg=audit(1574445211.897:28016): proctitle="./test_verifier"
    type=BPF msg=audit(1574445211.897:28017): prog-id=8103 event=UNLOAD

I assume for audit-userspace and audit-testsuite the change will
go in as github PR, right? I have the auditd change ready and will
add test shortly.

thanks,
jirka


---
 include/linux/audit.h | 4 ----
 kernel/auditsc.c      | 2 +-
 kernel/bpf/syscall.c  | 6 +-----
 3 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/include/linux/audit.h b/include/linux/audit.h
index 18925d924c73..c69d2776d197 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -358,8 +358,6 @@ static inline void audit_ptrace(struct task_struct *t)
 		__audit_ptrace(t);
 }
 
-extern void audit_log_task(struct audit_buffer *ab);
-
 				/* Private API (for audit.c only) */
 extern void __audit_ipc_obj(struct kern_ipc_perm *ipcp);
 extern void __audit_ipc_set_perm(unsigned long qbytes, uid_t uid, gid_t gid, umode_t mode);
@@ -648,8 +646,6 @@ static inline void audit_ntp_log(const struct audit_ntp_data *ad)
 static inline void audit_ptrace(struct task_struct *t)
 { }
 
-static inline void audit_log_task(struct audit_buffer *ab)
-{ }
 #define audit_n_rules 0
 #define audit_signals 0
 #endif /* CONFIG_AUDITSYSCALL */
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 9bf1045fedfa..4effe01ebbe2 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -2545,7 +2545,7 @@ void __audit_ntp_log(const struct audit_ntp_data *ad)
 	audit_log_ntp_val(ad, "adjust",	AUDIT_NTP_ADJUST);
 }
 
-void audit_log_task(struct audit_buffer *ab)
+static void audit_log_task(struct audit_buffer *ab)
 {
 	kuid_t auid, uid;
 	kgid_t gid;
diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index b51ecb9644d0..e3a7fa4d7a82 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -1334,7 +1334,6 @@ static const char * const bpf_event_audit_str[] = {
 
 static void bpf_audit_prog(const struct bpf_prog *prog, enum bpf_event event)
 {
-	bool has_task_context = event == BPF_EVENT_LOAD;
 	struct audit_buffer *ab;
 
 	if (audit_enabled == AUDIT_OFF)
@@ -1342,10 +1341,7 @@ static void bpf_audit_prog(const struct bpf_prog *prog, enum bpf_event event)
 	ab = audit_log_start(audit_context(), GFP_ATOMIC, AUDIT_BPF);
 	if (unlikely(!ab))
 		return;
-	if (has_task_context)
-		audit_log_task(ab);
-	audit_log_format(ab, "%sprog-id=%u event=%s",
-			 has_task_context ? " " : "",
+	audit_log_format(ab, "prog-id=%u event=%s",
 			 prog->aux->id, bpf_event_audit_str[event]);
 	audit_log_end(ab);
 }
-- 
2.23.0

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

