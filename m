Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AF5675D6B
	for <lists+linux-audit@lfdr.de>; Fri, 20 Jan 2023 20:03:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674241395;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=p8HN7SXJK3/hZdap9tDxxkrPrEQfb8aeKyGxthv0O0Y=;
	b=d4DRw6eQ98FYxqo+tdGWAvHNP/tr8vWRayRIljTViV8lPesHwV7849iMNNETtyJTbUQxBl
	Kk/6zAqoTcWx97Xia/4xM1MkoY1vAdjbXUcS1qS9duGq0MqrNyTNzO+GkJ9zEz51iak8oZ
	Hp1PWLFC8NGNtoizo08cAKi0FgYGd1A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-0psxtyJYPB-oZU-DhgDmLw-1; Fri, 20 Jan 2023 14:03:14 -0500
X-MC-Unique: 0psxtyJYPB-oZU-DhgDmLw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC4661C08990;
	Fri, 20 Jan 2023 19:02:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9227BC15BAD;
	Fri, 20 Jan 2023 19:02:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 86C4D1946A7A;
	Fri, 20 Jan 2023 19:02:55 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 87AD61946A72 for <linux-audit@listman.corp.redhat.com>;
 Fri, 20 Jan 2023 14:10:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6AFBFC158BB; Fri, 20 Jan 2023 14:10:37 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 62E9EC15E7F
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 14:10:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D58F3828888
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 14:10:37 +0000 (UTC)
Received: from fx405.security-mail.net (smtpout140.security-mail.net
 [85.31.212.145]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-70-oFcLHLDHOJaiPkffu0irtw-1; Fri, 20 Jan 2023 09:10:35 -0500
X-MC-Unique: oFcLHLDHOJaiPkffu0irtw-1
Received: from localhost (fx405.security-mail.net [127.0.0.1])
 by fx405.security-mail.net (Postfix) with ESMTP id B27DF335E84
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 15:10:33 +0100 (CET)
Received: from fx405 (fx405.security-mail.net [127.0.0.1]) by
 fx405.security-mail.net (Postfix) with ESMTP id 53789335E38; Fri, 20 Jan
 2023 15:10:33 +0100 (CET)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx405.security-mail.net (Postfix) with ESMTPS id EB02D335CEB; Fri, 20 Jan
 2023 15:10:31 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id A49CE27E0442; Fri, 20 Jan 2023
 15:10:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 8BB4A27E043D; Fri, 20 Jan 2023 15:10:31 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 U6itgih5Dbpw; Fri, 20 Jan 2023 15:10:31 +0100 (CET)
Received: from junon.lin.mbt.kalray.eu (unknown [192.168.37.161]) by
 zimbra2.kalray.eu (Postfix) with ESMTPSA id 0F29627E0439; Fri, 20 Jan 2023
 15:10:31 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <16482.63caa0d7.e71bf.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 8BB4A27E043D
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
Subject: [RFC PATCH v2 15/31] irqchip: Add irq-kvx-apic-gic driver
Date: Fri, 20 Jan 2023 15:09:46 +0100
Message-ID: <20230120141002.2442-16-ysionneau@kalray.eu>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Each Cluster of the Coolidge SoC includes an Advanced Programmable
Interrupt Controller (APIC) and Generic Interrupt Controller (GIC).

The APIC GIC acts as an intermediary interrupt controller, muxing/routing
incoming interrupts to cores in the cluster.

The 139 possible input interrupt lines are organized as follow:
 - 128 from the mailbox controller (one it per mailboxes)
 - 1   from the NoC router
 - 5   from IOMMUs
 - 1   from L2 cache DMA job FIFO
 - 1   from cluster watchdog
 - 2   for SECC, DECC
 - 1   from Data NoC

The 72 possible output interrupt line:
 -  68 : 4 interrupts per cores (17 cores)
 -  1 for L2 cache controller
 -  3 extra that are for padding

Co-developed-by: Clement Leger <clement@clement-leger.fr>
Signed-off-by: Clement Leger <clement@clement-leger.fr>
Co-developed-by: Julian Vetter <jvetter@kalray.eu>
Signed-off-by: Julian Vetter <jvetter@kalray.eu>
Co-developed-by: Vincent Chardon <vincent.chardon@elsys-design.com>
Signed-off-by: Vincent Chardon <vincent.chardon@elsys-design.com>
Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
---

Notes:
    V1 -> V2:
     - removed irq-kvx-itgen driver (moved in its own patch)
     - removed irq-kvx-apic-mailbox driver (moved in its own patch)
     - removed irq-kvx-core-intc driver (moved in its own patch)
     - removed print on probe success

 drivers/irqchip/Kconfig            |   6 +
 drivers/irqchip/Makefile           |   1 +
 drivers/irqchip/irq-kvx-apic-gic.c | 356 +++++++++++++++++++++++++++++
 3 files changed, 363 insertions(+)
 create mode 100644 drivers/irqchip/irq-kvx-apic-gic.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 7ef9f5e696d3..2433e4ba0759 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -334,6 +334,12 @@ config MIPS_GIC
 	select IRQ_DOMAIN_HIERARCHY
 	select MIPS_CM
 
+config KVX_APIC_GIC
+	bool
+	depends on KVX
+	select IRQ_DOMAIN
+	select IRQ_DOMAIN_HIERARCHY
+
 config INGENIC_IRQ
 	bool
 	depends on MACH_INGENIC
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 87b49a10962c..8ac1dd880420 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -69,6 +69,7 @@ obj-$(CONFIG_BCM7120_L2_IRQ)		+= irq-bcm7120-l2.o
 obj-$(CONFIG_BRCMSTB_L2_IRQ)		+= irq-brcmstb-l2.o
 obj-$(CONFIG_KEYSTONE_IRQ)		+= irq-keystone.o
 obj-$(CONFIG_MIPS_GIC)			+= irq-mips-gic.o
+obj-$(CONFIG_KVX_APIC_GIC)		+= irq-kvx-apic-gic.o
 obj-$(CONFIG_ARCH_MEDIATEK)		+= irq-mtk-sysirq.o irq-mtk-cirq.o
 obj-$(CONFIG_ARCH_DIGICOLOR)		+= irq-digicolor.o
 obj-$(CONFIG_ARCH_SA1100)		+= irq-sa11x0.o
diff --git a/drivers/irqchip/irq-kvx-apic-gic.c b/drivers/irqchip/irq-kvx-apic-gic.c
new file mode 100644
index 000000000000..cc234a075473
--- /dev/null
+++ b/drivers/irqchip/irq-kvx-apic-gic.c
@@ -0,0 +1,356 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2017 - 2022 Kalray Inc.
+ * Author(s): Clement Leger
+ *            Julian Vetter
+ */
+
+#define pr_fmt(fmt)	"kvx_apic_gic: " fmt
+
+#include <linux/of_address.h>
+#include <linux/cpuhotplug.h>
+#include <linux/interrupt.h>
+#include <linux/irqdomain.h>
+#include <linux/spinlock.h>
+#include <linux/irqchip.h>
+#include <linux/of_irq.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/of.h>
+
+/* APIC is organized in 18 groups of 4 output lines
+ * However, the two upper lines are for Secure RM and DMA engine
+ * Thus, we do not have to use them
+ */
+#define KVX_GIC_PER_CPU_IT_COUNT	4
+#define KVX_GIC_INPUT_IT_COUNT		0x9D
+#define KVX_GIC_OUTPUT_IT_COUNT		0x10
+
+/* GIC enable register definitions */
+#define KVX_GIC_ENABLE_OFFSET		0x0
+#define KVX_GIC_ENABLE_ELEM_SIZE	0x1
+#define KVX_GIC_ELEM_SIZE		0x400
+
+/* GIC status lac register definitions */
+#define KVX_GIC_STATUS_LAC_OFFSET	0x120
+#define KVX_GIC_STATUS_LAC_ELEM_SIZE	0x8
+#define KVX_GIC_STATUS_LAC_ARRAY_SIZE	0x3
+
+/**
+ * For each CPU, there is 4 output lines coming from the apic GIC.
+ * We only use 1 line and this structure represent this line.
+ * @base Output line base address
+ * @cpu CPU associated to this line
+ */
+struct gic_out_irq_line {
+	void __iomem *base;
+	unsigned int cpu;
+};
+
+/**
+ * Input irq line.
+ * This structure is used to store the status of the input line and the
+ * associated output line.
+ * @enabled Boolean for line status
+ * @cpu CPU currently receiving this interrupt
+ * @it_num Interrupt number
+ */
+struct gic_in_irq_line {
+	bool enabled;
+	struct gic_out_irq_line *out_line;
+	unsigned int it_num;
+};
+
+/**
+ * struct kvx_apic_gic - kvx apic gic
+ * @base: Base address of the controller
+ * @domain Domain for this controller
+ * @input_nr_irqs: maximum number of supported input interrupts
+ * @cpus: Per cpu interrupt configuration
+ * @output_irq: Array of output irq lines
+ * @input_irq: Array of input irq lines
+ */
+struct kvx_apic_gic {
+	raw_spinlock_t lock;
+	void __iomem *base;
+	struct irq_domain *domain;
+	uint32_t input_nr_irqs;
+	/* For each cpu, there is an output IT line */
+	struct gic_out_irq_line output_irq[KVX_GIC_OUTPUT_IT_COUNT];
+	/* Input interrupt status */
+	struct gic_in_irq_line input_irq[KVX_GIC_INPUT_IT_COUNT];
+};
+
+static int gic_parent_irq;
+
+/**
+ * Enable/Disable an output irq line
+ * This function is used by both mask/unmask to disable/enable the line.
+ */
+static void irq_line_set_enable(struct gic_out_irq_line *irq_line,
+				struct gic_in_irq_line *in_irq_line,
+				int enable)
+{
+	void __iomem *enable_line_addr = irq_line->base +
+	       KVX_GIC_ENABLE_OFFSET +
+	       in_irq_line->it_num * KVX_GIC_ENABLE_ELEM_SIZE;
+
+	writeb((uint8_t) enable ? 1 : 0, enable_line_addr);
+	in_irq_line->enabled = enable;
+}
+
+static void kvx_apic_gic_set_line(struct irq_data *data, int enable)
+{
+	struct kvx_apic_gic *gic = irq_data_get_irq_chip_data(data);
+	unsigned int in_irq = irqd_to_hwirq(data);
+	struct gic_in_irq_line *in_line = &gic->input_irq[in_irq];
+	struct gic_out_irq_line *out_line = in_line->out_line;
+
+	raw_spin_lock(&gic->lock);
+	/* Set line enable on currently assigned cpu */
+	irq_line_set_enable(out_line, in_line, enable);
+	raw_spin_unlock(&gic->lock);
+}
+
+static void kvx_apic_gic_mask(struct irq_data *data)
+{
+	kvx_apic_gic_set_line(data, 0);
+}
+
+static void kvx_apic_gic_unmask(struct irq_data *data)
+{
+	kvx_apic_gic_set_line(data, 1);
+}
+
+#ifdef CONFIG_SMP
+
+static int kvx_apic_gic_set_affinity(struct irq_data *d,
+				     const struct cpumask *cpumask,
+				     bool force)
+{
+	struct kvx_apic_gic *gic = irq_data_get_irq_chip_data(d);
+	unsigned int new_cpu;
+	unsigned int hw_irq = irqd_to_hwirq(d);
+	struct gic_in_irq_line *input_line = &gic->input_irq[hw_irq];
+	struct gic_out_irq_line *new_out_line;
+
+	/* We assume there is only one cpu in the mask */
+	new_cpu = cpumask_first(cpumask);
+	new_out_line = &gic->output_irq[new_cpu];
+
+	raw_spin_lock(&gic->lock);
+
+	/* Nothing to do, line is the same */
+	if (new_out_line == input_line->out_line)
+		goto out;
+
+	/* If old line was enabled, enable the new one before disabling
+	 * the old one
+	 */
+	if (input_line->enabled)
+		irq_line_set_enable(new_out_line, input_line, 1);
+
+	/* Disable it on old line */
+	irq_line_set_enable(input_line->out_line, input_line, 0);
+
+	/* Assign new output line to input IRQ */
+	input_line->out_line = new_out_line;
+
+out:
+	raw_spin_unlock(&gic->lock);
+
+	irq_data_update_effective_affinity(d, cpumask_of(new_cpu));
+
+	return IRQ_SET_MASK_OK;
+}
+#endif
+
+static struct irq_chip kvx_apic_gic_chip = {
+	.name           = "kvx apic gic",
+	.irq_mask	= kvx_apic_gic_mask,
+	.irq_unmask	= kvx_apic_gic_unmask,
+#ifdef CONFIG_SMP
+	.irq_set_affinity = kvx_apic_gic_set_affinity,
+#endif
+};
+
+static int kvx_apic_gic_alloc(struct irq_domain *domain, unsigned int virq,
+				   unsigned int nr_irqs, void *args)
+{
+	int i;
+	struct irq_fwspec *fwspec = args;
+	int hwirq = fwspec->param[0];
+
+	for (i = 0; i < nr_irqs; i++) {
+		irq_domain_set_info(domain, virq + i, hwirq + i,
+				    &kvx_apic_gic_chip,
+				    domain->host_data, handle_simple_irq,
+				    NULL, NULL);
+	}
+
+	return 0;
+}
+
+static const struct irq_domain_ops kvx_apic_gic_domain_ops = {
+	.alloc  = kvx_apic_gic_alloc,
+	.free   = irq_domain_free_irqs_common,
+};
+
+static void irq_line_get_status_lac(struct gic_out_irq_line *out_irq_line,
+			uint64_t status[KVX_GIC_STATUS_LAC_ARRAY_SIZE])
+{
+	int i;
+
+	for (i = 0; i < KVX_GIC_STATUS_LAC_ARRAY_SIZE; i++) {
+		status[i] = readq(out_irq_line->base +
+				  KVX_GIC_STATUS_LAC_OFFSET +
+				  i * KVX_GIC_STATUS_LAC_ELEM_SIZE);
+	}
+}
+
+static void kvx_apic_gic_handle_irq(struct irq_desc *desc)
+{
+	struct kvx_apic_gic *gic_data = irq_desc_get_handler_data(desc);
+	struct gic_out_irq_line *out_line;
+	uint64_t status[KVX_GIC_STATUS_LAC_ARRAY_SIZE];
+	unsigned long irqn, cascade_irq;
+	unsigned long cpu = smp_processor_id();
+
+	out_line = &gic_data->output_irq[cpu];
+
+	irq_line_get_status_lac(out_line, status);
+
+	for_each_set_bit(irqn, (unsigned long *) status,
+			KVX_GIC_STATUS_LAC_ARRAY_SIZE * BITS_PER_LONG) {
+
+		cascade_irq = irq_find_mapping(gic_data->domain, irqn);
+
+		generic_handle_irq(cascade_irq);
+	}
+}
+
+static void __init apic_gic_init(struct kvx_apic_gic *gic)
+{
+	unsigned int cpu, line;
+	struct gic_in_irq_line *input_irq_line;
+	struct gic_out_irq_line *output_irq_line;
+	uint64_t status[KVX_GIC_STATUS_LAC_ARRAY_SIZE];
+
+	/* Initialize all input lines (device -> )*/
+	for (line = 0; line < KVX_GIC_INPUT_IT_COUNT; line++) {
+		input_irq_line = &gic->input_irq[line];
+		input_irq_line->enabled = false;
+		/* All input lines map on output 0 */
+		input_irq_line->out_line = &gic->output_irq[0];
+		input_irq_line->it_num = line;
+	}
+
+	/* Clear all output lines (-> cpus) */
+	for (cpu = 0; cpu < KVX_GIC_OUTPUT_IT_COUNT; cpu++) {
+		output_irq_line = &gic->output_irq[cpu];
+		output_irq_line->cpu = cpu;
+		output_irq_line->base = gic->base +
+			cpu * (KVX_GIC_ELEM_SIZE * KVX_GIC_PER_CPU_IT_COUNT);
+
+		/* Disable all external lines on this core */
+		for (line = 0; line < KVX_GIC_INPUT_IT_COUNT; line++)
+			irq_line_set_enable(output_irq_line,
+					&gic->input_irq[line], 0x0);
+
+		irq_line_get_status_lac(output_irq_line, status);
+	}
+}
+
+static int kvx_gic_starting_cpu(unsigned int cpu)
+{
+	enable_percpu_irq(gic_parent_irq, IRQ_TYPE_NONE);
+
+	return 0;
+}
+
+static int kvx_gic_dying_cpu(unsigned int cpu)
+{
+	disable_percpu_irq(gic_parent_irq);
+
+	return 0;
+}
+
+static int __init kvx_init_apic_gic(struct device_node *node,
+				    struct device_node *parent)
+{
+	struct kvx_apic_gic *gic;
+	int ret;
+	unsigned int irq;
+
+	if (!parent) {
+		pr_err("kvx apic gic does not have parent\n");
+		return -EINVAL;
+	}
+
+	gic = kzalloc(sizeof(*gic), GFP_KERNEL);
+	if (!gic)
+		return -ENOMEM;
+
+	if (of_property_read_u32(node, "kalray,intc-nr-irqs",
+						&gic->input_nr_irqs))
+		gic->input_nr_irqs = KVX_GIC_INPUT_IT_COUNT;
+
+	if (WARN_ON(gic->input_nr_irqs > KVX_GIC_INPUT_IT_COUNT)) {
+		ret = -EINVAL;
+		goto err_kfree;
+	}
+
+	gic->base = of_io_request_and_map(node, 0, node->name);
+	if (!gic->base) {
+		ret = -EINVAL;
+		goto err_kfree;
+	}
+
+	raw_spin_lock_init(&gic->lock);
+	apic_gic_init(gic);
+
+	gic->domain = irq_domain_add_linear(node,
+					gic->input_nr_irqs,
+					&kvx_apic_gic_domain_ops,
+					gic);
+	if (!gic->domain) {
+		pr_err("Failed to add IRQ domain\n");
+		ret = -EINVAL;
+		goto err_iounmap;
+	}
+
+	irq = irq_of_parse_and_map(node, 0);
+	if (irq <= 0) {
+		pr_err("unable to parse irq\n");
+		ret = -EINVAL;
+		goto err_irq_domain_remove;
+	}
+
+	irq_set_chained_handler_and_data(irq, kvx_apic_gic_handle_irq,
+								gic);
+
+	gic_parent_irq = irq;
+	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
+				"kvx/gic:online",
+				kvx_gic_starting_cpu,
+				kvx_gic_dying_cpu);
+	if (ret < 0) {
+		pr_err("Failed to setup hotplug state");
+		goto err_irq_unmap;
+	}
+
+	return 0;
+
+err_irq_unmap:
+	irq_dispose_mapping(irq);
+err_irq_domain_remove:
+	irq_domain_remove(gic->domain);
+err_iounmap:
+	iounmap(gic->base);
+err_kfree:
+	kfree(gic);
+
+	return ret;
+}
+
+IRQCHIP_DECLARE(kvx_apic_gic, "kalray,kvx-apic-gic", kvx_init_apic_gic);
-- 
2.37.2





--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

