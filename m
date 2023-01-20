Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C798F675D5C
	for <lists+linux-audit@lfdr.de>; Fri, 20 Jan 2023 20:03:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674241381;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5Q24h29IVjxg0JFJRom/RW1XzW8CYJqsjCX4aN6D0yE=;
	b=JPelqC7+G0sYXae75EFZx75dKzCnPDJtjNbgmHlCsLaPeAWIDMaRpb3c6xM813cyrKK7r3
	4hDZonayS8YxZ12BX3ggj1CGTahMlWqsmJfLz7zM1PvjL5M5Eys/3Y+XCyia//jEJ1KvpT
	qWo//K1nIY1/VH47FW8SopFnTX2NCyE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-x38W32gCN2eMaLmm6JVbNg-1; Fri, 20 Jan 2023 14:02:57 -0500
X-MC-Unique: x38W32gCN2eMaLmm6JVbNg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFA113C1024C;
	Fri, 20 Jan 2023 19:02:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 77A32492B03;
	Fri, 20 Jan 2023 19:02:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CE8C61947043;
	Fri, 20 Jan 2023 19:02:50 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9682D19465B6 for <linux-audit@listman.corp.redhat.com>;
 Fri, 20 Jan 2023 14:10:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8C5942166B2B; Fri, 20 Jan 2023 14:10:37 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 83EBA2166B2A
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 14:10:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6628385C6E2
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 14:10:37 +0000 (UTC)
Received: from fx601.security-mail.net (smtpout140.security-mail.net
 [85.31.212.146]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-507-b03xm1eKN7KFfRo1WlJuJw-1; Fri, 20 Jan 2023 09:10:35 -0500
X-MC-Unique: b03xm1eKN7KFfRo1WlJuJw-1
Received: from localhost (fx601.security-mail.net [127.0.0.1])
 by fx601.security-mail.net (Postfix) with ESMTP id 9209C3498C8
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 15:10:34 +0100 (CET)
Received: from fx601 (fx601.security-mail.net [127.0.0.1]) by
 fx601.security-mail.net (Postfix) with ESMTP id 49E1D349679; Fri, 20 Jan
 2023 15:10:33 +0100 (CET)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx601.security-mail.net (Postfix) with ESMTPS id 6052E349425; Fri, 20 Jan
 2023 15:10:32 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 2DDA027E043D; Fri, 20 Jan 2023
 15:10:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 0E11627E0437; Fri, 20 Jan 2023 15:10:32 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 RaEvsddOB1Lw; Fri, 20 Jan 2023 15:10:31 +0100 (CET)
Received: from junon.lin.mbt.kalray.eu (unknown [192.168.37.161]) by
 zimbra2.kalray.eu (Postfix) with ESMTPSA id 8788727E043E; Fri, 20 Jan 2023
 15:10:31 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <1461a.63caa0d8.5c064.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 0E11627E0437
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
Subject: [RFC PATCH v2 16/31] irqchip: Add irq-kvx-itgen driver
Date: Fri, 20 Jan 2023 15:09:47 +0100
Message-ID: <20230120141002.2442-17-ysionneau@kalray.eu>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Jules Maselbas <jmaselbas@kalray.eu>

The Kalray Core Interrupt Controller is tightly integrated in each kv3
core present in the Coolidge SoC.

It provides the following features:
 - 32 independent interrupt sources
 - 2-bit configurable priority level
 - 2-bit configurable ownership level

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
    V1 -> V2: new patch
     - removed header include/linux/irqchip/irq-kvx-apic-gic.h
     - header moved to drivers/irqchip/ but in another patch
     - removed print on probe success

 drivers/irqchip/Kconfig         |   8 ++
 drivers/irqchip/Makefile        |   1 +
 drivers/irqchip/irq-kvx-itgen.c | 236 ++++++++++++++++++++++++++++++++
 3 files changed, 245 insertions(+)
 create mode 100644 drivers/irqchip/irq-kvx-itgen.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 2433e4ba0759..546bc611f3f3 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -340,6 +340,14 @@ config KVX_APIC_GIC
 	select IRQ_DOMAIN
 	select IRQ_DOMAIN_HIERARCHY
 
+config KVX_ITGEN
+	bool
+	depends on KVX
+	select GENERIC_IRQ_IPI if SMP
+	select GENERIC_MSI_IRQ_DOMAIN
+	select IRQ_DOMAIN
+	select IRQ_DOMAIN_HIERARCHY
+
 config INGENIC_IRQ
 	bool
 	depends on MACH_INGENIC
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 8ac1dd880420..6b8f459d8a21 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -70,6 +70,7 @@ obj-$(CONFIG_BRCMSTB_L2_IRQ)		+= irq-brcmstb-l2.o
 obj-$(CONFIG_KEYSTONE_IRQ)		+= irq-keystone.o
 obj-$(CONFIG_MIPS_GIC)			+= irq-mips-gic.o
 obj-$(CONFIG_KVX_APIC_GIC)		+= irq-kvx-apic-gic.o
+obj-$(CONFIG_KVX_ITGEN)			+= irq-kvx-itgen.o
 obj-$(CONFIG_ARCH_MEDIATEK)		+= irq-mtk-sysirq.o irq-mtk-cirq.o
 obj-$(CONFIG_ARCH_DIGICOLOR)		+= irq-digicolor.o
 obj-$(CONFIG_ARCH_SA1100)		+= irq-sa11x0.o
diff --git a/drivers/irqchip/irq-kvx-itgen.c b/drivers/irqchip/irq-kvx-itgen.c
new file mode 100644
index 000000000000..f6af023a689e
--- /dev/null
+++ b/drivers/irqchip/irq-kvx-itgen.c
@@ -0,0 +1,236 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2017-2023 Kalray Inc.
+ * Author(s): Clement Leger
+ *            Julian Vetter
+ *            Vincent Chardon
+ */
+
+#include <linux/platform_device.h>
+#include <linux/of_platform.h>
+#include <linux/of_address.h>
+#include <linux/interrupt.h>
+#include <linux/irqdomain.h>
+#include <linux/irqchip.h>
+#include <linux/module.h>
+#include <linux/msi.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+
+/* Parameters */
+#define KVX_ITGEN_PARAM_OFFSET			0x1100
+#define KVX_ITGEN_PARAM_IT_NUM_OFFSET		0x0
+
+/* Target configuration */
+#define KVX_ITGEN_CFG_ENABLE_OFFSET		0x8
+#define KVX_ITGEN_CFG_ELEM_SIZE		0x10
+#define KVX_ITGEN_CFG_TARGET_OFFSET		0x0
+#define KVX_ITGEN_CFG_TARGET_MAILBOX_SHIFT	0x0
+#define KVX_ITGEN_CFG_TARGET_MAILBOX_MASK	0x7FUL
+#define KVX_ITGEN_CFG_TARGET_CLUSTER_SHIFT	0x8
+#define KVX_ITGEN_CFG_TARGET_CLUSTER_MASK	0x700UL
+#define KVX_ITGEN_CFG_TARGET_SELECT_BIT_SHIFT	0x18
+#define KVX_ITGEN_CFG_TARGET_SELECT_BIT_MASK	0x3F000000UL
+
+#define MB_ADDR_CLUSTER_SHIFT	24
+#define MB_ADDR_MAILBOX_SHIFT	9
+
+/**
+ * struct kvx_itgen - kvx interrupt generator (MSI client)
+ * @base: base address of the itgen controller
+ * @domain: IRQ domain of the controller
+ * @pdev: Platform device associated to the controller
+ */
+struct kvx_itgen {
+	void __iomem *base;
+	struct irq_domain *domain;
+	struct platform_device *pdev;
+};
+
+static void __iomem *get_itgen_cfg_offset(struct kvx_itgen *itgen,
+						irq_hw_number_t hwirq)
+{
+	return itgen->base + KVX_ITGEN_CFG_TARGET_OFFSET +
+				hwirq * KVX_ITGEN_CFG_ELEM_SIZE;
+}
+
+void __iomem *get_itgen_param_offset(struct kvx_itgen *itgen)
+{
+	return itgen->base + KVX_ITGEN_PARAM_OFFSET;
+}
+
+static void kvx_itgen_enable(struct irq_data *data, u32 value)
+{
+	struct kvx_itgen *itgen = irq_data_get_irq_chip_data(data);
+	void __iomem *enable_reg =
+		get_itgen_cfg_offset(itgen, irqd_to_hwirq(data)) +
+		KVX_ITGEN_CFG_ENABLE_OFFSET;
+
+	dev_dbg(&itgen->pdev->dev, "%sabling hwirq %d, addr %p\n",
+		 value ? "En" : "Dis",
+		 (int) irqd_to_hwirq(data),
+		 enable_reg);
+	writel(value, enable_reg);
+}
+
+static void kvx_itgen_mask(struct irq_data *data)
+{
+	kvx_itgen_enable(data, 0x0);
+	irq_chip_mask_parent(data);
+}
+
+static void kvx_itgen_unmask(struct irq_data *data)
+{
+	kvx_itgen_enable(data, 0x1);
+	irq_chip_unmask_parent(data);
+}
+
+#ifdef CONFIG_SMP
+static int kvx_itgen_irq_set_affinity(struct irq_data *data,
+				      const struct cpumask *dest, bool force)
+{
+	return -ENOSYS;
+}
+#endif
+
+static struct irq_chip itgen_irq_chip = {
+	.name =			"kvx-itgen",
+	.irq_mask =		kvx_itgen_mask,
+	.irq_unmask =		kvx_itgen_unmask,
+#ifdef CONFIG_SMP
+	.irq_set_affinity =	kvx_itgen_irq_set_affinity,
+#endif
+};
+
+#define ITGEN_UNSUPPORTED_TYPES (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_EDGE_FALLING)
+
+static int kvx_itgen_domain_alloc(struct irq_domain *domain, unsigned int virq,
+				   unsigned int nr_irqs, void *args)
+{
+	int i, err;
+	struct irq_fwspec *fwspec = args;
+	int hwirq = fwspec->param[0];
+	int type = IRQ_TYPE_NONE;
+	struct kvx_itgen *itgen;
+
+	if (fwspec->param_count >= 2)
+		type = fwspec->param[1];
+
+	WARN_ON(type & ITGEN_UNSUPPORTED_TYPES);
+
+	err = platform_msi_device_domain_alloc(domain, virq, nr_irqs);
+	if (err)
+		return err;
+
+	itgen = platform_msi_get_host_data(domain);
+
+	for (i = 0; i < nr_irqs; i++) {
+		irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
+				      &itgen_irq_chip, itgen);
+		if (type == IRQ_TYPE_LEVEL_HIGH)
+			irq_set_handler(virq + i, handle_level_irq);
+	}
+
+	return 0;
+}
+
+static const struct irq_domain_ops itgen_domain_ops = {
+	.alloc		= kvx_itgen_domain_alloc,
+	.free		= irq_domain_free_irqs_common,
+};
+
+static void kvx_itgen_write_msg(struct msi_desc *desc, struct msi_msg *msg)
+{
+	struct irq_data *d = irq_get_irq_data(desc->irq);
+	struct kvx_itgen *itgen = irq_data_get_irq_chip_data(d);
+	uint32_t cfg_val = 0;
+	uintptr_t dest_addr = ((uint64_t) msg->address_hi << 32) |
+							msg->address_lo;
+	void __iomem *cfg = get_itgen_cfg_offset(itgen, irqd_to_hwirq(d));
+
+	/*
+	 * Address in the msi data is the address of the targeted mailbox.
+	 * To save a few cells of hw, itgen configuration expects the target
+	 * of the write using mppa id, cluster id and mailbox id instead
+	 * of address.
+	 * We extract these informations from the mailbox address.
+	 */
+
+	cfg_val |= (((kvx_sfr_get(PCR) & KVX_SFR_PCR_CID_MASK) >>
+				 KVX_SFR_PCR_CID_SHIFT)
+				<< KVX_ITGEN_CFG_TARGET_CLUSTER_SHIFT);
+	cfg_val |= ((dest_addr >> MB_ADDR_MAILBOX_SHIFT) &
+		     KVX_ITGEN_CFG_TARGET_MAILBOX_MASK)
+		    << KVX_ITGEN_CFG_TARGET_MAILBOX_SHIFT;
+
+	/*
+	 * msg->data contains the bit number to be written and is included in
+	 * the itgen config
+	 */
+	cfg_val |= ((msg->data << KVX_ITGEN_CFG_TARGET_SELECT_BIT_SHIFT)
+		    & KVX_ITGEN_CFG_TARGET_SELECT_BIT_MASK);
+
+	dev_dbg(&itgen->pdev->dev,
+		"Writing dest_addr %lx, value %x to cfg %p\n",
+		dest_addr, cfg_val, cfg);
+
+	writel(cfg_val, cfg);
+}
+
+static int
+kvx_itgen_device_probe(struct platform_device *pdev)
+{
+	struct kvx_itgen *itgen;
+	u32 it_count;
+	struct resource *mem;
+
+	itgen = devm_kzalloc(&pdev->dev, sizeof(*itgen), GFP_KERNEL);
+	if (!itgen)
+		return -ENOMEM;
+
+	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	itgen->base = devm_ioremap_resource(&pdev->dev, mem);
+	if (IS_ERR(itgen->base)) {
+		dev_err(&pdev->dev, "Failed to ioremap itgen\n");
+		return PTR_ERR(itgen->base);
+	}
+
+	itgen->pdev = pdev;
+	it_count = readl(get_itgen_param_offset(itgen) +
+				KVX_ITGEN_PARAM_IT_NUM_OFFSET);
+
+	itgen->domain = platform_msi_create_device_domain(&pdev->dev,
+						   it_count,
+						   kvx_itgen_write_msg,
+						   &itgen_domain_ops,
+						   itgen);
+	if (!itgen->domain) {
+		dev_err(&pdev->dev, "Failed to create device domain\n");
+		return -ENOMEM;
+	}
+
+	platform_set_drvdata(pdev, itgen);
+
+	return 0;
+}
+
+static const struct of_device_id itgen_of_match[] = {
+	{ .compatible = "kalray,kvx-itgen" },
+	{ /* END */ }
+};
+MODULE_DEVICE_TABLE(of, itgen_of_match);
+
+static struct platform_driver itgen_platform_driver = {
+	.driver = {
+		.name		= "kvx-itgen",
+		.of_match_table	= itgen_of_match,
+	},
+	.probe			= kvx_itgen_device_probe,
+};
+
+static int __init kvx_itgen_init(void)
+{
+	return platform_driver_register(&itgen_platform_driver);
+}
+
+arch_initcall(kvx_itgen_init);
-- 
2.37.2





--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

