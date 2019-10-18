Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id C2AC1E0918
	for <lists+linux-audit@lfdr.de>; Tue, 22 Oct 2019 18:36:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571762194;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sYm1WVJh2IYHfCbrCecg+PWRce5lAgih7i2uBvYlatI=;
	b=IfYoDbvMEJxhoV561+Qr2AP+eskPCBpA2sAyb/PsMv5znMsBc0vNreWfBqIp/fAYeafX5y
	hZQEixHR2qbqY4gTQ313/ggpVmiT8GKAudZWtz9nYwnuY208e4386k7jhN97NU1+xPHQsh
	HQ4Hc1Ke401s+rDdZTnkLAqi+xt2mJE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-JLPx5IqXOmWU2OtW9Xxq9w-1; Tue, 22 Oct 2019 12:36:32 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 728CA1005516;
	Tue, 22 Oct 2019 16:36:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DDCC60856;
	Tue, 22 Oct 2019 16:36:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C1EFC180085A;
	Tue, 22 Oct 2019 16:36:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9IGZHvZ007002 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 18 Oct 2019 12:35:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 237C35EE1D; Fri, 18 Oct 2019 16:35:17 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CC1C5D71C
	for <linux-audit@redhat.com>; Fri, 18 Oct 2019 16:35:14 +0000 (UTC)
Received: from smtprelay.hostedemail.com (smtprelay0178.hostedemail.com
	[216.40.44.178])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 676CA6412B
	for <linux-audit@redhat.com>; Fri, 18 Oct 2019 16:35:12 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
	[216.40.38.60])
	by smtprelay05.hostedemail.com (Postfix) with ESMTP id 626F418264E3F;
	Fri, 18 Oct 2019 16:35:11 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, :::::::::::::::::,
	RULES_HIT:4:41:355:379:800:960:966:967:968:973:982:988:989:1260:1277:1311:1313:1314:1345:1437:1515:1516:1518:1593:1594:1605:1730:1747:1777:1792:1801:2196:2198:2199:2200:2393:2525:2559:2563:2682:2685:2828:2859:2898:2899:2901:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3165:3865:3866:3867:3868:3870:3871:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4321:4385:4605:5007:6119:7903:8603:9010:9025:9040:9592:10004:11026:11232:11473:11657:11658:11914:12043:12294:12296:12297:12438:12555:12691:12737:12760:12986:13439:13845:14096:14097:14394:14659:14877:21080:21433:21451:21611:21627:21740:21789:21811:21819:30022:30045:30051:30054:30070:30075,
	0,
	RBL:47.151.135.224:@perches.com:.lbl8.mailshell.net-62.8.0.100
	64.201.201.201, CacheIP:none, Bayesian:0.5, 0.5, 0.5,
	Netcheck:none, DomainCache:0, MSF:not bulk, SPF:fn, MSBL:0,
	DNSBL:neutral, Custom_rules:0:0:0, LFtime:25, LUA_SUMMARY:none
X-HE-Tag: swim18_4a2a99c5c3b53
X-Filterd-Recvd-Size: 18853
Received: from XPS-9350.home (unknown [47.151.135.224])
	(Authenticated sender: joe@perches.com)
	by omf04.hostedemail.com (Postfix) with ESMTPA;
	Fri, 18 Oct 2019 16:35:09 +0000 (UTC)
Message-ID: <f31b38b9ad515a138edaecf85701b1e3db064114.camel@perches.com>
Subject: [PATCH] kernel: convert switch/case fallthrough comments to
	fallthrough;
From: Joe Perches <joe@perches.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 18 Oct 2019 09:35:08 -0700
User-Agent: Evolution 3.32.1-2
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.39]); Fri, 18 Oct 2019 16:35:12 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Fri, 18 Oct 2019 16:35:12 +0000 (UTC) for IP:'216.40.44.178'
	DOMAIN:'smtprelay0178.hostedemail.com'
	HELO:'smtprelay.hostedemail.com' FROM:'joe@perches.com' RCPT:''
X-RedHat-Spam-Score: 0.002  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_NONE) 216.40.44.178 smtprelay0178.hostedemail.com
	216.40.44.178 smtprelay0178.hostedemail.com <joe@perches.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 22 Oct 2019 12:36:07 -0400
Cc: linux-pm@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	netdev@vger.kernel.org, bpf@vger.kernel.org
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
X-MC-Unique: JLPx5IqXOmWU2OtW9Xxq9w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Use the new pseudo keyword "fallthrough;" and not the
various /* fallthrough */ style comments.

Signed-off-by: Joe Perches <joe@perches.com>
---

This is a single patch for the kernel/ source tree,
which would otherwise
be sent through as separate
patches to 19 maintainer sections.

compilation tested only.

Done by the script in this email:
https://lore.kernel.org/lkml/9fe980f7e28242c2835ffae34914c5f68e8268a7.camel=
@perches.com/

 kernel/auditfilter.c               | 2 +-
 kernel/bpf/cgroup.c                | 4 ++--
 kernel/bpf/verifier.c              | 4 ++--
 kernel/capability.c                | 2 +-
 kernel/compat.c                    | 6 +++---
 kernel/debug/gdbstub.c             | 6 +++---
 kernel/debug/kdb/kdb_keyboard.c    | 4 ++--
 kernel/debug/kdb/kdb_support.c     | 6 +++---
 kernel/events/core.c               | 3 +--
 kernel/futex.c                     | 4 ++--
 kernel/gcov/gcc_3_4.c              | 6 +++---
 kernel/irq/handle.c                | 3 +--
 kernel/irq/manage.c                | 5 ++---
 kernel/kallsyms.c                  | 4 ++--
 kernel/pid.c                       | 2 +-
 kernel/power/hibernate.c           | 2 +-
 kernel/power/qos.c                 | 4 ++--
 kernel/printk/printk.c             | 2 +-
 kernel/sched/core.c                | 2 +-
 kernel/sched/topology.c            | 6 +++---
 kernel/signal.c                    | 2 +-
 kernel/sys.c                       | 3 +--
 kernel/time/hrtimer.c              | 2 +-
 kernel/time/posix-timers.c         | 4 ++--
 kernel/time/tick-broadcast.c       | 2 +-
 kernel/time/timer.c                | 2 +-
 kernel/trace/blktrace.c            | 2 +-
 kernel/trace/trace_events_filter.c | 4 ++--
 28 files changed, 47 insertions(+), 51 deletions(-)

diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
index b0126e9c0743..471cd680479d 100644
--- a/kernel/auditfilter.c
+++ b/kernel/auditfilter.c
@@ -674,7 +674,7 @@ static struct audit_rule_data *audit_krule_to_data(stru=
ct audit_krule *krule)
 =09=09=09=09data->values[i] =3D AUDIT_UID_UNSET;
 =09=09=09=09break;
 =09=09=09}
-=09=09=09/* fall through - if set */
+=09=09=09fallthrough;=09/* if set */
 =09=09default:
 =09=09=09data->values[i] =3D f->val;
 =09=09}
diff --git a/kernel/bpf/cgroup.c b/kernel/bpf/cgroup.c
index ddd8addcdb5c..955631f1b77d 100644
--- a/kernel/bpf/cgroup.c
+++ b/kernel/bpf/cgroup.c
@@ -797,7 +797,7 @@ cgroup_base_func_proto(enum bpf_func_id func_id, const =
struct bpf_prog *prog)
 =09case BPF_FUNC_trace_printk:
 =09=09if (capable(CAP_SYS_ADMIN))
 =09=09=09return bpf_get_trace_printk_proto();
-=09=09/* fall through */
+=09=09fallthrough;
 =09default:
 =09=09return NULL;
 =09}
@@ -1439,7 +1439,7 @@ static bool cg_sockopt_is_valid_access(int off, int s=
ize,
 =09=09=09return prog->expected_attach_type =3D=3D
 =09=09=09=09BPF_CGROUP_GETSOCKOPT;
 =09=09case offsetof(struct bpf_sockopt, optname):
-=09=09=09/* fallthrough */
+=09=09=09fallthrough;
 =09=09case offsetof(struct bpf_sockopt, level):
 =09=09=09if (size !=3D size_default)
 =09=09=09=09return false;
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index ffc3e53f5300..d2b6fd8545e2 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -2249,7 +2249,7 @@ static bool may_access_direct_pkt_data(struct bpf_ver=
ifier_env *env,
 =09case BPF_PROG_TYPE_CGROUP_SKB:
 =09=09if (t =3D=3D BPF_WRITE)
 =09=09=09return false;
-=09=09/* fallthrough */
+=09=09fallthrough;
=20
 =09/* Program types with direct read + write access go here! */
 =09case BPF_PROG_TYPE_SCHED_CLS:
@@ -4381,7 +4381,7 @@ static int adjust_ptr_min_max_vals(struct bpf_verifie=
r_env *env,
 =09=09=09=09off_reg =3D=3D dst_reg ? dst : src);
 =09=09=09return -EACCES;
 =09=09}
-=09=09/* fall-through */
+=09=09fallthrough;
 =09default:
 =09=09break;
 =09}
diff --git a/kernel/capability.c b/kernel/capability.c
index 1444f3954d75..7c59b096c98a 100644
--- a/kernel/capability.c
+++ b/kernel/capability.c
@@ -93,7 +93,7 @@ static int cap_validate_magic(cap_user_header_t header, u=
nsigned *tocopy)
 =09=09break;
 =09case _LINUX_CAPABILITY_VERSION_2:
 =09=09warn_deprecated_v2();
-=09=09/* fall through - v3 is otherwise equivalent to v2. */
+=09=09fallthrough;=09/* v3 is otherwise equivalent to v2 */
 =09case _LINUX_CAPABILITY_VERSION_3:
 =09=09*tocopy =3D _LINUX_CAPABILITY_U32S_3;
 =09=09break;
diff --git a/kernel/compat.c b/kernel/compat.c
index a2bc1d6ceb57..d9c61f4317be 100644
--- a/kernel/compat.c
+++ b/kernel/compat.c
@@ -343,11 +343,11 @@ get_compat_sigset(sigset_t *set, const compat_sigset_=
t __user *compat)
 =09=09return -EFAULT;
 =09switch (_NSIG_WORDS) {
 =09case 4: set->sig[3] =3D v.sig[6] | (((long)v.sig[7]) << 32 );
-=09=09/* fall through */
+=09=09fallthrough;
 =09case 3: set->sig[2] =3D v.sig[4] | (((long)v.sig[5]) << 32 );
-=09=09/* fall through */
+=09=09fallthrough;
 =09case 2: set->sig[1] =3D v.sig[2] | (((long)v.sig[3]) << 32 );
-=09=09/* fall through */
+=09=09fallthrough;
 =09case 1: set->sig[0] =3D v.sig[0] | (((long)v.sig[1]) << 32 );
 =09}
 #else
diff --git a/kernel/debug/gdbstub.c b/kernel/debug/gdbstub.c
index 4b280fc7dd67..b9d8b7248964 100644
--- a/kernel/debug/gdbstub.c
+++ b/kernel/debug/gdbstub.c
@@ -1033,14 +1033,14 @@ int gdb_serial_stub(struct kgdb_state *ks)
 =09=09=09=09return DBG_PASS_EVENT;
 =09=09=09}
 #endif
-=09=09=09/* Fall through */
+=09=09=09fallthrough;
 =09=09case 'C': /* Exception passing */
 =09=09=09tmp =3D gdb_cmd_exception_pass(ks);
 =09=09=09if (tmp > 0)
 =09=09=09=09goto default_handle;
 =09=09=09if (tmp =3D=3D 0)
 =09=09=09=09break;
-=09=09=09/* Fall through - on tmp < 0 */
+=09=09=09fallthrough;=09/* on tmp < 0 */
 =09=09case 'c': /* Continue packet */
 =09=09case 's': /* Single step packet */
 =09=09=09if (kgdb_contthread && kgdb_contthread !=3D current) {
@@ -1049,7 +1049,7 @@ int gdb_serial_stub(struct kgdb_state *ks)
 =09=09=09=09break;
 =09=09=09}
 =09=09=09dbg_activate_sw_breakpoints();
-=09=09=09/* Fall through - to default processing */
+=09=09=09fallthrough;=09/* to default processing */
 =09=09default:
 default_handle:
 =09=09=09error =3D kgdb_arch_handle_exception(ks->ex_vector,
diff --git a/kernel/debug/kdb/kdb_keyboard.c b/kernel/debug/kdb/kdb_keyboar=
d.c
index 750497b0003a..f877a0a0d7cf 100644
--- a/kernel/debug/kdb/kdb_keyboard.c
+++ b/kernel/debug/kdb/kdb_keyboard.c
@@ -173,11 +173,11 @@ int kdb_get_kbd_char(void)
 =09case KT_LATIN:
 =09=09if (isprint(keychar))
 =09=09=09break;=09=09/* printable characters */
-=09=09/* fall through */
+=09=09fallthrough;
 =09case KT_SPEC:
 =09=09if (keychar =3D=3D K_ENTER)
 =09=09=09break;
-=09=09/* fall through */
+=09=09fallthrough;
 =09default:
 =09=09return -1;=09/* ignore unprintables */
 =09}
diff --git a/kernel/debug/kdb/kdb_support.c b/kernel/debug/kdb/kdb_support.=
c
index b8e6306e7e13..d636506f695a 100644
--- a/kernel/debug/kdb/kdb_support.c
+++ b/kernel/debug/kdb/kdb_support.c
@@ -432,7 +432,7 @@ int kdb_getphysword(unsigned long *word, unsigned long =
addr, size_t size)
 =09=09=09=09*word =3D w8;
 =09=09=09break;
 =09=09}
-=09=09/* fall through */
+=09=09fallthrough;
 =09default:
 =09=09diag =3D KDB_BADWIDTH;
 =09=09kdb_printf("kdb_getphysword: bad width %ld\n", (long) size);
@@ -481,7 +481,7 @@ int kdb_getword(unsigned long *word, unsigned long addr=
, size_t size)
 =09=09=09=09*word =3D w8;
 =09=09=09break;
 =09=09}
-=09=09/* fall through */
+=09=09fallthrough;
 =09default:
 =09=09diag =3D KDB_BADWIDTH;
 =09=09kdb_printf("kdb_getword: bad width %ld\n", (long) size);
@@ -525,7 +525,7 @@ int kdb_putword(unsigned long addr, unsigned long word,=
 size_t size)
 =09=09=09diag =3D kdb_putarea(addr, w8);
 =09=09=09break;
 =09=09}
-=09=09/* fall through */
+=09=09fallthrough;
 =09default:
 =09=09diag =3D KDB_BADWIDTH;
 =09=09kdb_printf("kdb_putword: bad width %ld\n", (long) size);
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 9ec0b0bfddbd..04e75b1144c5 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -9361,8 +9361,7 @@ perf_event_parse_addr_filter(struct perf_event *event=
, char *fstr,
 =09=09case IF_SRC_KERNELADDR:
 =09=09case IF_SRC_KERNEL:
 =09=09=09kernel =3D 1;
-=09=09=09/* fall through */
-
+=09=09=09fallthrough;
 =09=09case IF_SRC_FILEADDR:
 =09=09case IF_SRC_FILE:
 =09=09=09if (state !=3D IF_STATE_SOURCE)
diff --git a/kernel/futex.c b/kernel/futex.c
index bd18f60e4c6c..ab12b6229d2d 100644
--- a/kernel/futex.c
+++ b/kernel/futex.c
@@ -3639,12 +3639,12 @@ long do_futex(u32 __user *uaddr, int op, u32 val, k=
time_t *timeout,
 =09switch (cmd) {
 =09case FUTEX_WAIT:
 =09=09val3 =3D FUTEX_BITSET_MATCH_ANY;
-=09=09/* fall through */
+=09=09fallthrough;
 =09case FUTEX_WAIT_BITSET:
 =09=09return futex_wait(uaddr, flags, val, timeout, val3);
 =09case FUTEX_WAKE:
 =09=09val3 =3D FUTEX_BITSET_MATCH_ANY;
-=09=09/* fall through */
+=09=09fallthrough;
 =09case FUTEX_WAKE_BITSET:
 =09=09return futex_wake(uaddr, flags, val, val3);
 =09case FUTEX_REQUEUE:
diff --git a/kernel/gcov/gcc_3_4.c b/kernel/gcov/gcc_3_4.c
index 801ee4b0b969..32fc3278166f 100644
--- a/kernel/gcov/gcc_3_4.c
+++ b/kernel/gcov/gcc_3_4.c
@@ -455,7 +455,7 @@ int gcov_iter_next(struct gcov_iterator *iter)
 =09case RECORD_COUNT:
 =09=09/* Advance to next count */
 =09=09iter->count++;
-=09=09/* fall through */
+=09=09fallthrough;
 =09case RECORD_COUNT_LEN:
 =09=09if (iter->count < get_func(iter)->n_ctrs[iter->type]) {
 =09=09=09iter->record =3D 9;
@@ -465,7 +465,7 @@ int gcov_iter_next(struct gcov_iterator *iter)
 =09=09get_type(iter)->offset +=3D iter->count;
 =09=09iter->count =3D 0;
 =09=09iter->type++;
-=09=09/* fall through */
+=09=09fallthrough;
 =09case RECORD_FUNCTION_CHECK:
 =09=09if (iter->type < iter->num_types) {
 =09=09=09iter->record =3D 7;
@@ -474,7 +474,7 @@ int gcov_iter_next(struct gcov_iterator *iter)
 =09=09/* Advance to next function */
 =09=09iter->type =3D 0;
 =09=09iter->function++;
-=09=09/* fall through */
+=09=09fallthrough;
 =09case RECORD_TIME_STAMP:
 =09=09if (iter->function < iter->info->n_functions)
 =09=09=09iter->record =3D 3;
diff --git a/kernel/irq/handle.c b/kernel/irq/handle.c
index a4ace611f47f..b38d2fd70fe1 100644
--- a/kernel/irq/handle.c
+++ b/kernel/irq/handle.c
@@ -165,8 +165,7 @@ irqreturn_t __handle_irq_event_percpu(struct irq_desc *=
desc, unsigned int *flags
 =09=09=09}
=20
 =09=09=09__irq_wake_thread(desc, action);
-
-=09=09=09/* Fall through - to add to randomness */
+=09=09=09fallthrough;=09/* to add to randomness */
 =09=09case IRQ_HANDLED:
 =09=09=09*flags |=3D action->flags;
 =09=09=09break;
diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 1753486b440c..baa86020f243 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -222,7 +222,7 @@ int irq_do_set_affinity(struct irq_data *data, const st=
ruct cpumask *mask,
 =09case IRQ_SET_MASK_OK:
 =09case IRQ_SET_MASK_OK_DONE:
 =09=09cpumask_copy(desc->irq_common_data.affinity, mask);
-=09=09/* fall through */
+=09=09fallthrough;
 =09case IRQ_SET_MASK_OK_NOCOPY:
 =09=09irq_validate_effective_affinity(data);
 =09=09irq_set_thread_affinity(desc);
@@ -792,8 +792,7 @@ int __irq_set_trigger(struct irq_desc *desc, unsigned l=
ong flags)
 =09case IRQ_SET_MASK_OK_DONE:
 =09=09irqd_clear(&desc->irq_data, IRQD_TRIGGER_MASK);
 =09=09irqd_set(&desc->irq_data, flags);
-=09=09/* fall through */
-
+=09=09fallthrough;
 =09case IRQ_SET_MASK_OK_NOCOPY:
 =09=09flags =3D irqd_get_trigger_type(&desc->irq_data);
 =09=09irq_settings_set_trigger_mask(desc, flags);
diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index 136ce049c4ad..05ce8a4d4729 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -651,11 +651,11 @@ int kallsyms_show_value(void)
 =09case 0:
 =09=09if (kallsyms_for_perf())
 =09=09=09return 1;
-=09/* fallthrough */
+=09=09fallthrough;
 =09case 1:
 =09=09if (has_capability_noaudit(current, CAP_SYSLOG))
 =09=09=09return 1;
-=09/* fallthrough */
+=09=09fallthrough;
 =09default:
 =09=09return 0;
 =09}
diff --git a/kernel/pid.c b/kernel/pid.c
index 0a9f2e437217..b2a005a6dea1 100644
--- a/kernel/pid.c
+++ b/kernel/pid.c
@@ -144,7 +144,7 @@ void free_pid(struct pid *pid)
 =09=09=09/* Handle a fork failure of the first process */
 =09=09=09WARN_ON(ns->child_reaper);
 =09=09=09ns->pid_allocated =3D 0;
-=09=09=09/* fall through */
+=09=09=09fallthrough;
 =09=09case 0:
 =09=09=09schedule_work(&ns->proc_work);
 =09=09=09break;
diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
index 3c0a5a8170b0..d091dcd57557 100644
--- a/kernel/power/hibernate.c
+++ b/kernel/power/hibernate.c
@@ -647,7 +647,7 @@ static void power_down(void)
 =09=09break;
 =09case HIBERNATION_PLATFORM:
 =09=09hibernation_platform_enter();
-=09=09/* Fall through */
+=09=09fallthrough;
 =09case HIBERNATION_SHUTDOWN:
 =09=09if (pm_power_off)
 =09=09=09kernel_power_off();
diff --git a/kernel/power/qos.c b/kernel/power/qos.c
index 9568a2fe7c11..6bf5295b2ade 100644
--- a/kernel/power/qos.c
+++ b/kernel/power/qos.c
@@ -236,7 +236,7 @@ int pm_qos_update_target(struct pm_qos_constraints *c, =
struct plist_node *node,
 =09=09 * changed
 =09=09 */
 =09=09plist_del(node, &c->list);
-=09=09/* fall through */
+=09=09fallthrough;
 =09case PM_QOS_ADD_REQ:
 =09=09plist_node_init(node, new_value);
 =09=09plist_add(node, &c->list);
@@ -309,7 +309,7 @@ bool pm_qos_update_flags(struct pm_qos_flags *pqf,
 =09=09break;
 =09case PM_QOS_UPDATE_REQ:
 =09=09pm_qos_flags_remove_req(pqf, req);
-=09=09/* fall through */
+=09=09fallthrough;
 =09case PM_QOS_ADD_REQ:
 =09=09req->flags =3D val;
 =09=09INIT_LIST_HEAD(&req->node);
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index ca65327a6de8..6b3d7c68e6fe 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -1531,7 +1531,7 @@ int do_syslog(int type, char __user *buf, int len, in=
t source)
 =09/* Read/clear last kernel messages */
 =09case SYSLOG_ACTION_READ_CLEAR:
 =09=09clear =3D true;
-=09=09/* FALL THRU */
+=09=09fallthrough;
 =09/* Read last kernel messages */
 =09case SYSLOG_ACTION_READ_ALL:
 =09=09if (!buf || len < 0)
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index dd05a378631a..050b728728f4 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2068,7 +2068,7 @@ static int select_fallback_rq(int cpu, struct task_st=
ruct *p)
 =09=09=09=09state =3D possible;
 =09=09=09=09break;
 =09=09=09}
-=09=09=09/* Fall-through */
+=09=09=09fallthrough;
 =09=09case possible:
 =09=09=09do_set_cpus_allowed(p, cpu_possible_mask);
 =09=09=09state =3D fail;
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index b5667a273bf6..7d6b84e0caca 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -1224,13 +1224,13 @@ static void __free_domain_allocs(struct s_data *d, =
enum s_alloc what,
 =09case sa_rootdomain:
 =09=09if (!atomic_read(&d->rd->refcount))
 =09=09=09free_rootdomain(&d->rd->rcu);
-=09=09/* Fall through */
+=09=09fallthrough;
 =09case sa_sd:
 =09=09free_percpu(d->sd);
-=09=09/* Fall through */
+=09=09fallthrough;
 =09case sa_sd_storage:
 =09=09__sdt_free(cpu_map);
-=09=09/* Fall through */
+=09=09fallthrough;
 =09case sa_none:
 =09=09break;
 =09}
diff --git a/kernel/signal.c b/kernel/signal.c
index c4da1ef56fdf..73bdcc1f2561 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -846,7 +846,7 @@ static int check_kill_permission(int sig, struct kernel=
_siginfo *info,
 =09=09=09 */
 =09=09=09if (!sid || sid =3D=3D task_session(current))
 =09=09=09=09break;
-=09=09=09/* fall through */
+=09=09=09fallthrough;
 =09=09default:
 =09=09=09return -EPERM;
 =09=09}
diff --git a/kernel/sys.c b/kernel/sys.c
index a611d1d58c7d..bad4f30e7f37 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -1737,8 +1737,7 @@ void getrusage(struct task_struct *p, int who, struct=
 rusage *r)
=20
 =09=09if (who =3D=3D RUSAGE_CHILDREN)
 =09=09=09break;
-=09=09/* fall through */
-
+=09=09fallthrough;
 =09case RUSAGE_SELF:
 =09=09thread_group_cputime_adjusted(p, &tgutime, &tgstime);
 =09=09utime +=3D tgutime;
diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index 0d4dc241c0fb..8060a35682e1 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -373,7 +373,7 @@ static bool hrtimer_fixup_activate(void *addr, enum deb=
ug_obj_state state)
 =09switch (state) {
 =09case ODEBUG_STATE_ACTIVE:
 =09=09WARN_ON(1);
-=09=09/* fall through */
+=09=09fallthrough;
 =09default:
 =09=09return false;
 =09}
diff --git a/kernel/time/posix-timers.c b/kernel/time/posix-timers.c
index 0ec5b7a1d769..6cc658391702 100644
--- a/kernel/time/posix-timers.c
+++ b/kernel/time/posix-timers.c
@@ -413,12 +413,12 @@ static struct pid *good_sigevent(sigevent_t * event)
 =09=09rtn =3D pid_task(pid, PIDTYPE_PID);
 =09=09if (!rtn || !same_thread_group(rtn, current))
 =09=09=09return NULL;
-=09=09/* FALLTHRU */
+=09=09fallthrough;
 =09case SIGEV_SIGNAL:
 =09case SIGEV_THREAD:
 =09=09if (event->sigev_signo <=3D 0 || event->sigev_signo > SIGRTMAX)
 =09=09=09return NULL;
-=09=09/* FALLTHRU */
+=09=09fallthrough;
 =09case SIGEV_NONE:
 =09=09return pid;
 =09default:
diff --git a/kernel/time/tick-broadcast.c b/kernel/time/tick-broadcast.c
index e51778c312f1..36d7464c8962 100644
--- a/kernel/time/tick-broadcast.c
+++ b/kernel/time/tick-broadcast.c
@@ -381,7 +381,7 @@ void tick_broadcast_control(enum tick_broadcast_mode mo=
de)
 =09switch (mode) {
 =09case TICK_BROADCAST_FORCE:
 =09=09tick_broadcast_forced =3D 1;
-=09=09/* fall through */
+=09=09fallthrough;
 =09case TICK_BROADCAST_ON:
 =09=09cpumask_set_cpu(cpu, tick_broadcast_on);
 =09=09if (!cpumask_test_and_set_cpu(cpu, tick_broadcast_mask)) {
diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index 4820823515e9..6512d721ef57 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -653,7 +653,7 @@ static bool timer_fixup_activate(void *addr, enum debug=
_obj_state state)
=20
 =09case ODEBUG_STATE_ACTIVE:
 =09=09WARN_ON(1);
-=09=09/* fall through */
+=09=09fallthrough;
 =09default:
 =09=09return false;
 =09}
diff --git a/kernel/trace/blktrace.c b/kernel/trace/blktrace.c
index 2d6e93ab0478..0a1753dc69d3 100644
--- a/kernel/trace/blktrace.c
+++ b/kernel/trace/blktrace.c
@@ -717,7 +717,7 @@ int blk_trace_ioctl(struct block_device *bdev, unsigned=
 cmd, char __user *arg)
 #endif
 =09case BLKTRACESTART:
 =09=09start =3D 1;
-=09=09/* fall through */
+=09=09fallthrough;
 =09case BLKTRACESTOP:
 =09=09ret =3D __blk_trace_startstop(q, start);
 =09=09break;
diff --git a/kernel/trace/trace_events_filter.c b/kernel/trace/trace_events=
_filter.c
index c9a74f82b14a..78b0bfc4d72e 100644
--- a/kernel/trace/trace_events_filter.c
+++ b/kernel/trace/trace_events_filter.c
@@ -499,7 +499,7 @@ predicate_parse(const char *str, int nr_parens, int nr_=
preds,
 =09=09=09=09=09ptr++;
 =09=09=09=09=09break;
 =09=09=09=09}
-=09=09=09=09/* fall through */
+=09=09=09=09fallthrough;
 =09=09=09default:
 =09=09=09=09parse_error(pe, FILT_ERR_TOO_MANY_PREDS,
 =09=09=09=09=09    next - str);
@@ -1273,7 +1273,7 @@ static int parse_pred(const char *str, void *data,
 =09=09switch (op) {
 =09=09case OP_NE:
 =09=09=09pred->not =3D 1;
-=09=09=09/* Fall through */
+=09=09=09fallthrough;
 =09=09case OP_GLOB:
 =09=09case OP_EQ:
 =09=09=09break;


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

