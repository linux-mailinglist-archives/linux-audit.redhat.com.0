Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 55444675D68
	for <lists+linux-audit@lfdr.de>; Fri, 20 Jan 2023 20:03:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674241394;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cenBvtEuRbvEZ8XKX+9BSy2CAGfqworgLsngEjKX/H4=;
	b=a+kTr8OaubAj+35UMYv93rYo3TYpWAvsWsSwjQvIO1qeLQDCaq/LtyWZqVpmChlanbaxqQ
	c6S8RbfkMGy0jQOzAnWnweRQhRJcd2G+cHmipKdSZ1DI4kOdujO1qm3rRX1LBMLeKfRRme
	eZQb0S3O+rMaioHOSdU4ePL9rQErWi0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-53-uYTZomQlOCSpxnOifB6FNg-1; Fri, 20 Jan 2023 14:03:05 -0500
X-MC-Unique: uYTZomQlOCSpxnOifB6FNg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6026185C06D;
	Fri, 20 Jan 2023 19:02:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3CF542027001;
	Fri, 20 Jan 2023 19:02:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5B6EC1947066;
	Fri, 20 Jan 2023 19:02:51 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4DF301946A6D for <linux-audit@listman.corp.redhat.com>;
 Fri, 20 Jan 2023 14:20:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 31A7740444C5; Fri, 20 Jan 2023 14:20:51 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 29D3140C2064
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 14:20:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E83AC18E0046
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 14:20:50 +0000 (UTC)
Received: from fx601.security-mail.net (smtpout140.security-mail.net
 [85.31.212.146]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-232-PtAVCeKqOnGssTKUWjjdzA-1; Fri, 20 Jan 2023 09:20:48 -0500
X-MC-Unique: PtAVCeKqOnGssTKUWjjdzA-1
Received: from localhost (fx601.security-mail.net [127.0.0.1])
 by fx601.security-mail.net (Postfix) with ESMTP id E802234944A
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 15:20:46 +0100 (CET)
Received: from fx601 (fx601.security-mail.net [127.0.0.1]) by
 fx601.security-mail.net (Postfix) with ESMTP id DAE483498AD; Fri, 20 Jan
 2023 15:20:45 +0100 (CET)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx601.security-mail.net (Postfix) with ESMTPS id A493E3497CD; Fri, 20 Jan
 2023 15:20:44 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 3AAC327E0461; Fri, 20 Jan 2023
 15:10:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 20DDD27E0456; Fri, 20 Jan 2023 15:10:37 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 O9iQteuEJcJb; Fri, 20 Jan 2023 15:10:37 +0100 (CET)
Received: from junon.lin.mbt.kalray.eu (unknown [192.168.37.161]) by
 zimbra2.kalray.eu (Postfix) with ESMTPSA id 9550C27E0457; Fri, 20 Jan 2023
 15:10:36 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <5c86.63caa33c.a2d74.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 20DDD27E0456
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
Subject: [RFC PATCH v2 26/31] kvx: Add multi-processor (SMP) support
Date: Fri, 20 Jan 2023 15:09:57 +0100
Message-ID: <20230120141002.2442-27-ysionneau@kalray.eu>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Coolidge v1 SoC has 5 clusters of 17 kvx cores:
 - 16 application cores aka PE
 - 1 privileged core, the Resource Manager, aka RM.

Linux can run in SMP config on the 16 cores of a Cluster.

Memory coherency between all cores is guarenteed by the L2 cache.

Co-developed-by: Clement Leger <clement@clement-leger.fr>
Signed-off-by: Clement Leger <clement@clement-leger.fr>
Co-developed-by: Julian Vetter <jvetter@kalray.eu>
Signed-off-by: Julian Vetter <jvetter@kalray.eu>
Co-developed-by: Julien Hascoet <jhascoet@kalray.eu>
Signed-off-by: Julien Hascoet <jhascoet@kalray.eu>
Co-developed-by: Louis Morhet <lmorhet@kalray.eu>
Signed-off-by: Louis Morhet <lmorhet@kalray.eu>
Co-developed-by: Luc Michel <lmichel@kalray.eu>
Signed-off-by: Luc Michel <lmichel@kalray.eu>
Co-developed-by: Marius Gligor <mgligor@kalray.eu>
Signed-off-by: Marius Gligor <mgligor@kalray.eu>
Co-developed-by: Yann Sionneau <ysionneau@kalray.eu>
Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
---

Notes:
    V1 -> V2:
     - removed L2 cache driver
     - removed ipi and pwr-ctrl driver (splitted in their own patch)

 arch/kvx/include/asm/smp.h |  42 ++++++++++++
 arch/kvx/kernel/smp.c      | 110 ++++++++++++++++++++++++++++++++
 arch/kvx/kernel/smpboot.c  | 127 +++++++++++++++++++++++++++++++++++++
 include/linux/cpuhotplug.h |   2 +
 4 files changed, 281 insertions(+)
 create mode 100644 arch/kvx/include/asm/smp.h
 create mode 100644 arch/kvx/kernel/smp.c
 create mode 100644 arch/kvx/kernel/smpboot.c

diff --git a/arch/kvx/include/asm/smp.h b/arch/kvx/include/asm/smp.h
new file mode 100644
index 000000000000..e4fd4d001b2c
--- /dev/null
+++ b/arch/kvx/include/asm/smp.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2017-2023 Kalray Inc.
+ * Author(s): Clement Leger
+ */
+
+#ifndef _ASM_KVX_SMP_H
+#define _ASM_KVX_SMP_H
+
+#include <linux/cpumask.h>
+#include <linux/irqreturn.h>
+
+#include <asm/sfr.h>
+
+#ifdef CONFIG_SMP
+
+/* Hook for the generic smp_call_function_many() routine. */
+void arch_send_call_function_ipi_mask(struct cpumask *mask);
+
+/* Hook for the generic smp_call_function_single() routine. */
+void arch_send_call_function_single_ipi(int cpu);
+
+void __init setup_processor(void);
+
+void smp_init_cpus(void);
+
+irqreturn_t ipi_call_interrupt(int irq, void *dev_id);
+
+#define raw_smp_processor_id() ((int) \
+	((kvx_sfr_get(PCR) & KVX_SFR_PCR_PID_MASK) \
+					>> KVX_SFR_PCR_PID_SHIFT))
+
+#define flush_cache_vmap(start, end)		do { } while (0)
+#define flush_cache_vunmap(start, end)		do { } while (0)
+
+#else
+
+void smp_init_cpus(void) {}
+
+#endif /* CONFIG_SMP */
+
+#endif
diff --git a/arch/kvx/kernel/smp.c b/arch/kvx/kernel/smp.c
new file mode 100644
index 000000000000..ed4c35a8c4bc
--- /dev/null
+++ b/arch/kvx/kernel/smp.c
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2017-2023 Kalray Inc.
+ * Author(s): Clement Leger
+ */
+
+#include <linux/smp.h>
+#include <linux/cpu.h>
+#include <linux/of_irq.h>
+#include <linux/cpumask.h>
+#include <linux/irq_work.h>
+#include <linux/mm_types.h>
+#include <linux/interrupt.h>
+
+#include <asm/ipi.h>
+#include <asm/tlbflush.h>
+
+enum ipi_message_type {
+	IPI_RESCHEDULE,
+	IPI_CALL_FUNC,
+	IPI_IRQ_WORK,
+	IPI_MAX
+};
+
+/* A collection of single bit ipi messages.  */
+static struct {
+	unsigned long bits ____cacheline_aligned;
+} ipi_data[NR_CPUS] __cacheline_aligned;
+
+static void send_ipi_message(const struct cpumask *mask,
+			     enum ipi_message_type operation)
+{
+	unsigned long flags;
+	int cpu;
+
+	/* Set operation that must be done by receiver */
+	for_each_cpu(cpu, mask)
+		set_bit(operation, &ipi_data[cpu].bits);
+
+	/* Commit the write before sending IPI */
+	smp_wmb();
+
+	local_irq_save(flags);
+
+	kvx_ipi_send(mask);
+
+	local_irq_restore(flags);
+}
+
+void arch_send_call_function_ipi_mask(struct cpumask *mask)
+{
+	send_ipi_message(mask, IPI_CALL_FUNC);
+}
+
+void arch_send_call_function_single_ipi(int cpu)
+{
+	send_ipi_message(cpumask_of(cpu), IPI_CALL_FUNC);
+}
+
+#ifdef CONFIG_IRQ_WORK
+void arch_irq_work_raise(void)
+{
+	send_ipi_message(cpumask_of(smp_processor_id()), IPI_IRQ_WORK);
+}
+#endif
+
+static void ipi_stop(void *unused)
+{
+	local_cpu_stop();
+}
+
+void smp_send_stop(void)
+{
+	struct cpumask targets;
+
+	cpumask_copy(&targets, cpu_online_mask);
+	cpumask_clear_cpu(smp_processor_id(), &targets);
+
+	smp_call_function_many(&targets, ipi_stop, NULL, 0);
+}
+
+void smp_send_reschedule(int cpu)
+{
+	send_ipi_message(cpumask_of(cpu), IPI_RESCHEDULE);
+}
+
+irqreturn_t ipi_call_interrupt(int irq, void *dev_id)
+{
+	unsigned long *pending_ipis = &ipi_data[smp_processor_id()].bits;
+
+	while (true) {
+		unsigned long ops = xchg(pending_ipis, 0);
+
+		if (ops == 0)
+			return IRQ_HANDLED;
+
+		if (ops & (1 << IPI_RESCHEDULE))
+			scheduler_ipi();
+
+		if (ops & (1 << IPI_CALL_FUNC))
+			generic_smp_call_function_interrupt();
+
+		if (ops & (1 << IPI_IRQ_WORK))
+			irq_work_run();
+
+		BUG_ON((ops >> IPI_MAX) != 0);
+	}
+
+	return IRQ_HANDLED;
+}
diff --git a/arch/kvx/kernel/smpboot.c b/arch/kvx/kernel/smpboot.c
new file mode 100644
index 000000000000..987a6f014163
--- /dev/null
+++ b/arch/kvx/kernel/smpboot.c
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2017-2023 Kalray Inc.
+ * Author(s): Clement Leger
+ *            Julian Vetter
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/smp.h>
+#include <linux/cpu.h>
+#include <linux/sched.h>
+#include <linux/cpumask.h>
+#include <linux/sched/mm.h>
+#include <linux/mm_types.h>
+#include <linux/of_platform.h>
+#include <linux/sched/task_stack.h>
+
+#include <asm/pwr_ctrl.h>
+#include <asm/tlbflush.h>
+#include <asm/ipi.h>
+
+void *__cpu_up_stack_pointer[NR_CPUS];
+void *__cpu_up_task_pointer[NR_CPUS];
+
+void __init smp_prepare_boot_cpu(void)
+{
+}
+
+int __cpu_up(unsigned int cpu, struct task_struct *tidle)
+{
+	__cpu_up_stack_pointer[cpu] = task_stack_page(tidle) + THREAD_SIZE;
+	__cpu_up_task_pointer[cpu] = tidle;
+	/* We need to be sure writes are committed */
+	smp_mb();
+
+	kvx_pwr_ctrl_cpu_poweron(cpu);
+	while (!cpu_online(cpu))
+		cpu_relax();
+
+	return 0;
+}
+
+void __init smp_cpus_done(unsigned int max_cpus)
+{
+}
+
+void __init smp_init_cpus(void)
+{
+	struct cpumask cpumask;
+	struct device_node *cpu;
+	const __be32 *reg;
+	u32 cpu_num;
+	unsigned int nr_cpus = 0;
+
+	cpumask_clear(&cpumask);
+
+	for_each_of_cpu_node(cpu) {
+		if (!of_device_is_available(cpu))
+			continue;
+
+		reg = of_get_property(cpu, "reg", NULL);
+		if (!reg)
+			continue;
+
+		cpu_num = be32_to_cpup(reg);
+		if (cpu_num >= nr_cpu_ids)
+			continue;
+
+		nr_cpus++;
+		cpumask_set_cpu(cpu_num, &cpumask);
+	}
+
+	pr_info("%d possible cpus\n", nr_cpus);
+	init_cpu_possible(&cpumask);
+}
+
+void __init smp_prepare_cpus(unsigned int max_cpus)
+{
+	if (num_present_cpus() <= 1)
+		init_cpu_present(cpu_possible_mask);
+}
+
+int __init setup_smp(void)
+{
+	int ret;
+
+	ret = kvx_pwr_ctrl_probe();
+	if (ret)
+		panic("Failed to probe power controller !");
+
+	ret = kvx_ipi_ctrl_probe(ipi_call_interrupt);
+	if (ret)
+		panic("Failed to probe IPI controller !");
+
+	return 0;
+}
+
+early_initcall(setup_smp);
+
+/*
+ * C entry point for a secondary processor.
+ */
+void __init start_kernel_secondary(void)
+{
+	struct mm_struct *mm = &init_mm;
+	unsigned int cpu = smp_processor_id();
+
+	setup_processor();
+	kvx_mmu_early_setup();
+
+	/* All kernel threads share the same mm context.  */
+	mmgrab(mm);
+	current->active_mm = mm;
+	cpumask_set_cpu(cpu, mm_cpumask(mm));
+
+	notify_cpu_starting(cpu);
+	set_cpu_online(cpu, true);
+	trace_hardirqs_off();
+
+	local_flush_tlb_all();
+
+	local_irq_enable();
+	cpu_startup_entry(CPUHP_AP_ONLINE_IDLE);
+}
diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index f61447913db9..f5a484547b15 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -152,6 +152,7 @@ enum cpuhp_state {
 	CPUHP_AP_IRQ_RISCV_STARTING,
 	CPUHP_AP_IRQ_LOONGARCH_STARTING,
 	CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING,
+	CPUHP_AP_IRQ_KVX_STARTING,
 	CPUHP_AP_ARM_MVEBU_COHERENCY,
 	CPUHP_AP_MICROCODE_LOADER,
 	CPUHP_AP_PERF_X86_AMD_UNCORE_STARTING,
@@ -189,6 +190,7 @@ enum cpuhp_state {
 	CPUHP_AP_KVM_ARM_VGIC_INIT_STARTING,
 	CPUHP_AP_KVM_ARM_VGIC_STARTING,
 	CPUHP_AP_KVM_ARM_TIMER_STARTING,
+	CPUHP_AP_KVX_TIMER_STARTING,
 	/* Must be the last timer callback */
 	CPUHP_AP_DUMMY_TIMER_STARTING,
 	CPUHP_AP_ARM_XEN_STARTING,
-- 
2.37.2





--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

