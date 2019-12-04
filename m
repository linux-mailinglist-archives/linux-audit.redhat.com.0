Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 30A40112EA1
	for <lists+linux-audit@lfdr.de>; Wed,  4 Dec 2019 16:38:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575473890;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DLbyXp1NyToV++4EzwVZdO5OkuaIIQAjeX322gry468=;
	b=X/ifOOo32E0A2t0Dfcue0p8nGhrKyL2lqeouC1a9zGGpGwiAkQ4D6u4jlbcLq1nzvj8C8s
	z5QH2QeGc5r7QVTf8ZBgZ94UxlzyYl21oFJ+0iQgCCHKusCJkC/ukCvCf0Ti0ENE2AQjo0
	iZbCadLwA1txS4QaNpGKJsgxz/6Qdw8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-eo1ladT1P1-8KZcKY8ys3Q-1; Wed, 04 Dec 2019 10:38:08 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C3C4107ACCC;
	Wed,  4 Dec 2019 15:38:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2C505D6BB;
	Wed,  4 Dec 2019 15:38:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C6A6262CF0;
	Wed,  4 Dec 2019 15:37:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB4E8ZoE007268 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 4 Dec 2019 09:08:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0EC5119756; Wed,  4 Dec 2019 14:08:35 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from krava (unknown [10.43.17.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 10EEF19C68;
	Wed,  4 Dec 2019 14:08:29 +0000 (UTC)
Date: Wed, 4 Dec 2019 15:08:27 +0100
From: Jiri Olsa <jolsa@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [RFC] bpf: Emit audit messages upon successful prog load and
	unload
Message-ID: <20191204140827.GB12431@krava>
References: <20191128091633.29275-1-jolsa@kernel.org>
	<CAHC9VhQ7zkXdz1V5hQ8PN68-NnCn56TjKA0wCL6ZjHy9Up8fuQ@mail.gmail.com>
	<20191203093837.GC17468@krava>
	<CAHC9VhRhMhsRPj1D2TY3O=Nc6Rx9=o1-Z5ZMjrCepfFY6VtdbQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhRhMhsRPj1D2TY3O=Nc6Rx9=o1-Z5ZMjrCepfFY6VtdbQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Wed, 04 Dec 2019 10:37:50 -0500
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: eo1ladT1P1-8KZcKY8ys3Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Dec 03, 2019 at 09:53:16PM -0500, Paul Moore wrote:

SNIP

> > >
> > > static inline void audit_foo(...)
> > > {
> > >   if (unlikely(!audit_dummy_context()))
> > >     __audit_foo(...)
> > > }
> >
> > bpf_audit_prog might be called outside of syscall context for UNLOAD event,
> > so that would prevent it from being stored
> 
> Okay, right.  More on this below ...
> 
> > I can see audit_log_start checks on value of audit_context() that we pass in,
> 
> The check in audit_log_start() is for a different reason; it checks
> the passed context to see if it should associate the record with
> others in the same event, e.g. PATH records associated with the
> matching SYSCALL record.  This way all the associated records show up
> as part of the same event (as defined by the audit timestamp).
> 
> > should we check for audit_dummy_context just for load event? like:
> >
> >
> > static void bpf_audit_prog(const struct bpf_prog *prog, enum bpf_audit op)
> > {
> >         struct audit_buffer *ab;
> >
> >         if (audit_enabled == AUDIT_OFF)
> >                 return;
> >         if (op == BPF_AUDIT_LOAD && audit_dummy_context())
> >                 return;
> >         ab = audit_log_start(audit_context(), GFP_ATOMIC, AUDIT_BPF);
> >         if (unlikely(!ab))
> >                 return;
> >         ...
> > }
> 
> Ignoring the dummy context for a minute, there is likely a larger
> issue here with using audit_context() when bpf_audit_prog() is called
> outside of a syscall, e.g. BPF_AUDIT_UNLOAD.  In this case we likely
> shouldn't be taking the audit context from the current task, we
> shouldn't be taking it from anywhere, it should be NULL.
> 
> As far as the dummy context is concerned, you might want to skip the
> dummy context check since you can only do that on the LOAD side, which
> means that depending on the system's configuration you could end up
> with a number of unbalanced LOAD/UNLOAD events.  The downside is that
> you are always going to get the BPF audit records on systemd based
> systems, since they ignore the admin's audit configuration and always
> enable audit (yes, we've tried to get systemd to change, they don't
> seem to care).

ok, so something like below?

thanks,
jirka


---
 include/uapi/linux/audit.h |  1 +
 kernel/bpf/syscall.c       | 30 ++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
index c89c6495983d..32a5db900f47 100644
--- a/include/uapi/linux/audit.h
+++ b/include/uapi/linux/audit.h
@@ -116,6 +116,7 @@
 #define AUDIT_FANOTIFY		1331	/* Fanotify access decision */
 #define AUDIT_TIME_INJOFFSET	1332	/* Timekeeping offset injected */
 #define AUDIT_TIME_ADJNTPVAL	1333	/* NTP value adjustment */
+#define AUDIT_BPF		1334	/* BPF subsystem */
 
 #define AUDIT_AVC		1400	/* SE Linux avc denial or grant */
 #define AUDIT_SELINUX_ERR	1401	/* Internal SE Linux Errors */
diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index e3461ec59570..81f1a6308aa8 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -23,6 +23,7 @@
 #include <linux/timekeeping.h>
 #include <linux/ctype.h>
 #include <linux/nospec.h>
+#include <linux/audit.h>
 #include <uapi/linux/btf.h>
 
 #define IS_FD_ARRAY(map) ((map)->map_type == BPF_MAP_TYPE_PERF_EVENT_ARRAY || \
@@ -1306,6 +1307,33 @@ static int find_prog_type(enum bpf_prog_type type, struct bpf_prog *prog)
 	return 0;
 }
 
+enum bpf_audit {
+	BPF_AUDIT_LOAD,
+	BPF_AUDIT_UNLOAD,
+};
+
+static const char * const bpf_audit_str[] = {
+	[BPF_AUDIT_LOAD]   = "LOAD",
+	[BPF_AUDIT_UNLOAD] = "UNLOAD",
+};
+
+static void bpf_audit_prog(const struct bpf_prog *prog, enum bpf_audit op)
+{
+	struct audit_context *ctx = NULL;
+	struct audit_buffer *ab;
+
+	if (audit_enabled == AUDIT_OFF)
+		return;
+	if (op == BPF_AUDIT_LOAD)
+		ctx = audit_context();
+	ab = audit_log_start(ctx, GFP_ATOMIC, AUDIT_BPF);
+	if (unlikely(!ab))
+		return;
+	audit_log_format(ab, "prog-id=%u op=%s",
+			 prog->aux->id, bpf_audit_str[op]);
+	audit_log_end(ab);
+}
+
 int __bpf_prog_charge(struct user_struct *user, u32 pages)
 {
 	unsigned long memlock_limit = rlimit(RLIMIT_MEMLOCK) >> PAGE_SHIFT;
@@ -1421,6 +1449,7 @@ static void __bpf_prog_put(struct bpf_prog *prog, bool do_idr_lock)
 {
 	if (atomic64_dec_and_test(&prog->aux->refcnt)) {
 		perf_event_bpf_event(prog, PERF_BPF_EVENT_PROG_UNLOAD, 0);
+		bpf_audit_prog(prog, BPF_AUDIT_UNLOAD);
 		/* bpf_prog_free_id() must be called first */
 		bpf_prog_free_id(prog, do_idr_lock);
 		__bpf_prog_put_noref(prog, true);
@@ -1830,6 +1859,7 @@ static int bpf_prog_load(union bpf_attr *attr, union bpf_attr __user *uattr)
 	 */
 	bpf_prog_kallsyms_add(prog);
 	perf_event_bpf_event(prog, PERF_BPF_EVENT_PROG_LOAD, 0);
+	bpf_audit_prog(prog, BPF_AUDIT_LOAD);
 
 	err = bpf_prog_new_fd(prog);
 	if (err < 0)
-- 
2.23.0

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

