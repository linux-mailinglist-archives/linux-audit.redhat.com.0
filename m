Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4650C675D77
	for <lists+linux-audit@lfdr.de>; Fri, 20 Jan 2023 20:03:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674241399;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OfArZyCjpNYZ0Xni6SbUv89/h2Q53qJ3kM9czPBCPDo=;
	b=eUwYZz0k0CmXnfLXdBYW2vgXXIve6m1SYyGjse5FgflICthngX2b7rnJQsD0Z5MX8vkviQ
	LXPnjJl4KBr1+sUSs/1YiXh0ql/r21Fu+5aVggjHkjFEvKoXa+ODxXUXy4+ZNcdtgQcwxf
	Z+JvH6PovqTgQKS667TiRmLiAljZOb8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-353-Bg0lW9pOPQqR-CmNiFRqMw-1; Fri, 20 Jan 2023 14:03:15 -0500
X-MC-Unique: Bg0lW9pOPQqR-CmNiFRqMw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76FE785C6E1;
	Fri, 20 Jan 2023 19:02:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 59F5A4085720;
	Fri, 20 Jan 2023 19:02:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4E3461946A78;
	Fri, 20 Jan 2023 19:02:55 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0560B19465B6 for <linux-audit@listman.corp.redhat.com>;
 Fri, 20 Jan 2023 14:20:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CE9B040444C3; Fri, 20 Jan 2023 14:20:48 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C5EF240C2064
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 14:20:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9FEA3281DE84
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 14:20:48 +0000 (UTC)
Received: from fx306.security-mail.net (smtpout30.security-mail.net
 [85.31.212.36]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-404-BZtNAuTSOjO3fyzSi3ri_Q-1; Fri, 20 Jan 2023 09:20:46 -0500
X-MC-Unique: BZtNAuTSOjO3fyzSi3ri_Q-1
Received: from localhost (fx306.security-mail.net [127.0.0.1])
 by fx306.security-mail.net (Postfix) with ESMTP id D66EB35CDEA
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 15:20:45 +0100 (CET)
Received: from fx306 (fx306.security-mail.net [127.0.0.1]) by
 fx306.security-mail.net (Postfix) with ESMTP id 8BE2E35CD5B; Fri, 20 Jan
 2023 15:20:45 +0100 (CET)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx306.security-mail.net (Postfix) with ESMTPS id 1398E35CC96; Fri, 20 Jan
 2023 15:20:45 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id E7FE727E044F; Fri, 20 Jan 2023
 15:10:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id CFF1027E0444; Fri, 20 Jan 2023 15:10:34 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 OVJ7A2wZo_Fk; Fri, 20 Jan 2023 15:10:34 +0100 (CET)
Received: from junon.lin.mbt.kalray.eu (unknown [192.168.37.161]) by
 zimbra2.kalray.eu (Postfix) with ESMTPSA id 4201627E043A; Fri, 20 Jan 2023
 15:10:34 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <218f.63caa33d.dde8.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu CFF1027E0444
From: Yann Sionneau <ysionneau@kalray.eu>
To: Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Thomas
 Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Will Deacon <will@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, Mark
 Rutland <mark.rutland@arm.com>, Eric Biederman <ebiederm@xmission.com>, Kees
 Cook <keescook@chromium.org>, Oleg Nesterov <oleg@redhat.com>, Ingo Molnar
 <mingo@redhat.com>, Waiman Long <longman@redhat.com>, "Aneesh Kumar K.V"
 <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>,
 Nick Piggin <npiggin@gmail.com>, Paul Moore <paul@paul-moore.com>, Eric
 Paris <eparis@redhat.com>, Christian Brauner <brauner@kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Jules Maselbas <jmaselbas@kalray.eu>,
 Yann Sionneau <ysionneau@kalray.eu>, Guillaume Thouvenin
 <gthouvenin@kalray.eu>, Clement Leger <clement@clement-leger.fr>, Vincent
 Chardon <vincent.chardon@elsys-design.com>, Marc =?utf-8?b?UG91bGhpw6hz?=
 <dkm@kataplop.net>, Julian Vetter <jvetter@kalray.eu>, Samuel Jones
 <sjones@kalray.eu>, Ashley Lesdalons <alesdalons@kalray.eu>, Thomas Costis
 <tcostis@kalray.eu>, Marius Gligor <mgligor@kalray.eu>, Jonathan Borne
 <jborne@kalray.eu>, Julien Villette <jvillette@kalray.eu>, Luc Michel
 <lmichel@kalray.eu>, Louis Morhet <lmorhet@kalray.eu>, Julien Hascoet
 <jhascoet@kalray.eu>, Jean-Christophe Pince <jcpince@gmail.com>, Guillaume
 Missonnier <gmissonnier@kalray.eu>, Alex Michon <amichon@kalray.eu>, Huacai
 Chen <chenhuacai@kernel.org>, WANG Xuerui <git@xen0n.name>, Shaokun Zhang
 <zhangshaokun@hisilicon.com>, John Garry <john.garry@huawei.com>, Guangbin
 Huang <huangguangbin2@huawei.com>, Bharat Bhushan <bbhushan2@marvell.com>,
 Bibo Mao <maobibo@loongson.cn>, Atish Patra <atishp@atishpatra.org>, "Jason
 A. Donenfeld" <Jason@zx2c4.com>, Qi Liu <liuqi115@huawei.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark
 Brown <broonie@kernel.org>, Janosch Frank <frankja@linux.ibm.com>, Alexey
 Dobriyan <adobriyan@gmail.com>
Subject: [RFC PATCH v2 22/31] kvx: Add signal handling support
Date: Fri, 20 Jan 2023 15:09:53 +0100
Message-ID: <20230120141002.2442-23-ysionneau@kalray.eu>
In-Reply-To: <20230120141002.2442-1-ysionneau@kalray.eu>
References: <20230120141002.2442-1-ysionneau@kalray.eu>
MIME-Version: 1.0
X-ALTERMIMEV2_out: done
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Fri, 20 Jan 2023 19:02:49 +0000
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: linux-arch@vger.kernel.org, devicetree@vger.kernel.org,
 Benjamin Mugnier <mugnier.benjamin@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-audit@redhat.com,
 linux-riscv@lists.infradead.org, bpf@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add sigcontext definition and signal handling support for kvx.

Co-developed-by: Clement Leger <clement@clement-leger.fr>
Signed-off-by: Clement Leger <clement@clement-leger.fr>
Co-developed-by: Jules Maselbas <jmaselbas@kalray.eu>
Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
Co-developed-by: Julian Vetter <jvetter@kalray.eu>
Signed-off-by: Julian Vetter <jvetter@kalray.eu>
Co-developed-by: Yann Sionneau <ysionneau@kalray.eu>
Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
---

Notes:
    V1 -> V2:
     - use read_thread_flags() as suggested by Mark Rutland

 arch/kvx/include/uapi/asm/sigcontext.h |  16 ++
 arch/kvx/kernel/signal.c               | 265 +++++++++++++++++++++++++
 arch/kvx/kernel/vdso.c                 |  87 ++++++++
 3 files changed, 368 insertions(+)
 create mode 100644 arch/kvx/include/uapi/asm/sigcontext.h
 create mode 100644 arch/kvx/kernel/signal.c
 create mode 100644 arch/kvx/kernel/vdso.c

diff --git a/arch/kvx/include/uapi/asm/sigcontext.h b/arch/kvx/include/uapi/asm/sigcontext.h
new file mode 100644
index 000000000000..97ab4f78152a
--- /dev/null
+++ b/arch/kvx/include/uapi/asm/sigcontext.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/*
+ * Copyright (C) 2017-2023 Kalray Inc.
+ * Author(s): Clement Leger
+ */
+
+#ifndef _UAPI_ASM_KVX_SIGCONTEXT_H
+#define _UAPI_ASM_KVX_SIGCONTEXT_H
+
+#include <asm/ptrace.h>
+
+struct sigcontext {
+	struct user_pt_regs sc_regs;
+};
+
+#endif	/* _UAPI_ASM_KVX_SIGCONTEXT_H */
diff --git a/arch/kvx/kernel/signal.c b/arch/kvx/kernel/signal.c
new file mode 100644
index 000000000000..5bd63d14f43e
--- /dev/null
+++ b/arch/kvx/kernel/signal.c
@@ -0,0 +1,265 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2017-2023 Kalray Inc.
+ * Author(s): Clement Leger
+ */
+
+#include <linux/bug.h>
+#include <linux/syscalls.h>
+
+#include <asm/ucontext.h>
+#include <asm/processor.h>
+#include <asm/cacheflush.h>
+#include <linux/resume_user_mode.h>
+
+struct rt_sigframe {
+	struct siginfo info;
+	struct ucontext uc;
+};
+
+int __init setup_syscall_sigreturn_page(void *sigpage_addr)
+{
+	unsigned int frame_size = (uintptr_t) &user_scall_rt_sigreturn_end -
+				  (uintptr_t) &user_scall_rt_sigreturn;
+
+	/* Copy the sigreturn scall implementation */
+	memcpy(sigpage_addr, &user_scall_rt_sigreturn, frame_size);
+
+	flush_icache_range((unsigned long) sigpage_addr,
+			   (unsigned long) sigpage_addr + frame_size);
+
+	return 0;
+}
+
+static long restore_sigcontext(struct pt_regs *regs,
+			       struct sigcontext __user *sc)
+{
+	long err;
+
+	/* sc_regs is structured the same as the start of pt_regs */
+	err = __copy_from_user(regs, &sc->sc_regs, sizeof(sc->sc_regs));
+
+	return err;
+}
+
+long _sys_rt_sigreturn(void)
+{
+	struct pt_regs *regs = current_pt_regs();
+	struct rt_sigframe __user *frame;
+	struct task_struct *task;
+	sigset_t set;
+
+	current->restart_block.fn = do_no_restart_syscall;
+
+	frame = (struct rt_sigframe __user *) user_stack_pointer(regs);
+
+	/*
+	 * Stack is not aligned but should be !
+	 * User probably did some malicious things.
+	 */
+	if (user_stack_pointer(regs) & STACK_ALIGN_MASK)
+		goto badframe;
+
+	if (!access_ok(frame, sizeof(*frame)))
+		goto badframe;
+
+	/* Restore sigmask */
+	if (__copy_from_user(&set, &frame->uc.uc_sigmask, sizeof(set)))
+		goto badframe;
+
+	set_current_blocked(&set);
+
+	if (restore_sigcontext(regs, &frame->uc.uc_mcontext))
+		goto badframe;
+
+	if (restore_altstack(&frame->uc.uc_stack))
+		goto badframe;
+
+	return regs->r0;
+
+badframe:
+	task = current;
+	if (show_unhandled_signals) {
+		pr_info_ratelimited(
+			"%s[%d]: bad frame in %s: frame=%p pc=%p sp=%p\n",
+			task->comm, task_pid_nr(task), __func__,
+			frame, (void *) instruction_pointer(regs),
+			(void *) user_stack_pointer(regs));
+	}
+	force_sig(SIGSEGV);
+	return 0;
+}
+
+
+static long setup_sigcontext(struct rt_sigframe __user *frame,
+			     struct pt_regs *regs)
+{
+	struct sigcontext __user *sc = &frame->uc.uc_mcontext;
+	long err;
+
+	/* sc_regs is structured the same as the start of pt_regs */
+	err = __copy_to_user(&sc->sc_regs, regs, sizeof(sc->sc_regs));
+
+	return err;
+}
+
+static inline void __user *get_sigframe(struct ksignal *ksig,
+					struct pt_regs *regs, size_t framesize)
+{
+	unsigned long sp;
+	/* Default to using normal stack */
+	sp = regs->sp;
+
+	/*
+	 * If we are on the alternate signal stack and would overflow it, don't.
+	 * Return an always-bogus address instead so we will die with SIGSEGV.
+	 */
+	if (on_sig_stack(sp) && !likely(on_sig_stack(sp - framesize)))
+		return (void __user __force *)(-1UL);
+
+	/* This is the X/Open sanctioned signal stack switching. */
+	sp = sigsp(sp, ksig) - framesize;
+
+	/* Align the stack frame on 16bytes */
+	sp &= ~STACK_ALIGN_MASK;
+
+	return (void __user *)sp;
+}
+
+/* TODO: Use VDSO when ready ! */
+static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
+			  struct pt_regs *regs)
+{
+	unsigned long sigpage = current->mm->context.sigpage;
+	struct rt_sigframe __user *frame;
+	long err = 0;
+
+	frame = get_sigframe(ksig, regs, sizeof(*frame));
+	if (!access_ok(frame, sizeof(*frame)))
+		return -EFAULT;
+
+	err |= copy_siginfo_to_user(&frame->info, &ksig->info);
+
+	/* Create the ucontext. */
+	err |= __put_user(0, &frame->uc.uc_flags);
+	err |= __put_user(NULL, &frame->uc.uc_link);
+	err |= __save_altstack(&frame->uc.uc_stack, user_stack_pointer(regs));
+	err |= setup_sigcontext(frame, regs);
+	err |= __copy_to_user(&frame->uc.uc_sigmask, set, sizeof(*set));
+	if (err)
+		return -EFAULT;
+
+	/*
+	 * When returning from the handler, we want to jump to the
+	 * sigpage which will execute the sigreturn scall.
+	 */
+	regs->ra = sigpage;
+	/* Return to signal handler */
+	regs->spc = (unsigned long)ksig->ka.sa.sa_handler;
+	regs->sp = (unsigned long) frame;
+
+	/* Parameters for signal handler */
+	regs->r0 = ksig->sig;                     /* r0: signal number */
+	regs->r1 = (unsigned long)(&frame->info); /* r1: siginfo pointer */
+	regs->r2 = (unsigned long)(&frame->uc);   /* r2: ucontext pointer */
+
+	return 0;
+}
+
+static void handle_signal(struct ksignal *ksig, struct pt_regs *regs)
+{
+	sigset_t *oldset = sigmask_to_save();
+	int ret;
+
+	/* Are we from a system call? */
+	if (in_syscall(regs)) {
+		/* If so, check system call restarting.. */
+		switch (regs->r0) {
+		case -ERESTART_RESTARTBLOCK:
+		case -ERESTARTNOHAND:
+			regs->r0 = -EINTR;
+			break;
+		case -ERESTARTSYS:
+			if (!(ksig->ka.sa.sa_flags & SA_RESTART)) {
+				regs->r0 = -EINTR;
+				break;
+			}
+			fallthrough;
+		case -ERESTARTNOINTR:
+			regs->r0 = regs->orig_r0;
+			regs->spc -= 0x4;
+			break;
+		}
+	}
+
+	ret = setup_rt_frame(ksig, oldset, regs);
+
+	signal_setup_done(ret, ksig, 0);
+}
+
+asmlinkage void do_signal(struct pt_regs *regs)
+{
+	struct ksignal ksig;
+
+	if (get_signal(&ksig)) {
+		handle_signal(&ksig, regs);
+		return;
+	}
+
+	/* Are we from a system call? */
+	if (in_syscall(regs)) {
+		/*
+		 * If we are here, this means there is no handler
+		 * present and we must restart the syscall.
+		 */
+		switch (regs->r0) {
+		case -ERESTART_RESTARTBLOCK:
+			/* Modify the syscall number in order to restart it */
+			regs->r6 = __NR_restart_syscall;
+			fallthrough;
+		case -ERESTARTNOHAND:
+		case -ERESTARTSYS:
+		case -ERESTARTNOINTR:
+			/* We are restarting the syscall */
+			regs->r0 = regs->orig_r0;
+			/*
+			 * scall instruction isn't bundled with anything else,
+			 * so we can just revert the spc to restart the syscall.
+			 */
+			regs->spc -= 0x4;
+			break;
+		}
+	}
+
+	/*
+	 * If there's no signal to deliver, we just put the saved sigmask
+	 * back.
+	 */
+	restore_saved_sigmask();
+}
+
+
+asmlinkage void do_work_pending(struct pt_regs *regs,
+				unsigned long thread_flags)
+{
+	/* We are called with IRQs disabled */
+	trace_hardirqs_off();
+
+	do {
+		if (thread_flags & _TIF_NEED_RESCHED) {
+			schedule();
+		} else {
+			local_irq_enable();
+			if (thread_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
+				do_signal(regs);
+
+			if (thread_flags & _TIF_NOTIFY_RESUME) {
+				clear_thread_flag(TIF_NOTIFY_RESUME);
+				resume_user_mode_work(regs);
+			}
+		}
+		local_irq_disable();
+		thread_flags = read_thread_flags();
+	} while (thread_flags & _TIF_WORK_MASK);
+}
+
diff --git a/arch/kvx/kernel/vdso.c b/arch/kvx/kernel/vdso.c
new file mode 100644
index 000000000000..1515de15eb31
--- /dev/null
+++ b/arch/kvx/kernel/vdso.c
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2017-2023 Kalray Inc.
+ * Author(s): Clement Leger
+ */
+
+#include <linux/mm.h>
+#include <linux/vmalloc.h>
+#include <linux/binfmts.h>
+
+#include <asm/syscall.h>
+
+static struct page *signal_page;
+
+static int __init init_sigreturn(void)
+{
+	struct page *sigpage;
+	void *mapped_sigpage;
+	int err;
+
+	sigpage = alloc_page(GFP_KERNEL);
+	if (!sigpage)
+		panic("Cannot allocate sigreturn page");
+
+	mapped_sigpage = vmap(&sigpage, 1, 0, PAGE_KERNEL);
+	if (!mapped_sigpage)
+		panic("Cannot map sigreturn page");
+
+	clear_page(mapped_sigpage);
+
+	err = setup_syscall_sigreturn_page(mapped_sigpage);
+	if (err)
+		panic("Cannot set signal return syscall, err: %x.", err);
+
+	vunmap(mapped_sigpage);
+
+	signal_page = sigpage;
+
+	return 0;
+}
+arch_initcall(init_sigreturn);
+
+static int sigpage_mremap(const struct vm_special_mapping *sm,
+		struct vm_area_struct *new_vma)
+{
+	current->mm->context.sigpage = new_vma->vm_start;
+	return 0;
+}
+
+static const struct vm_special_mapping sigpage_mapping = {
+	.name = "[sigpage]",
+	.pages = &signal_page,
+	.mremap = sigpage_mremap,
+};
+
+int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
+{
+	int ret = 0;
+	unsigned long addr;
+	struct mm_struct *mm = current->mm;
+	struct vm_area_struct *vma;
+
+	mmap_write_lock(mm);
+
+	addr = get_unmapped_area(NULL, STACK_TOP, PAGE_SIZE, 0, 0);
+	if (IS_ERR_VALUE(addr)) {
+		ret = addr;
+		goto up_fail;
+	}
+
+	vma = _install_special_mapping(
+			mm,
+			addr,
+			PAGE_SIZE,
+			VM_READ|VM_EXEC|VM_MAYREAD|VM_MAYEXEC,
+			&sigpage_mapping);
+	if (IS_ERR(vma)) {
+		ret = PTR_ERR(vma);
+		goto up_fail;
+	}
+
+	mm->context.sigpage = addr;
+
+up_fail:
+	mmap_write_unlock(mm);
+	return ret;
+}
-- 
2.37.2





--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

