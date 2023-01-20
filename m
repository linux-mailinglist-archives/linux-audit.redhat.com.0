Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EAB675D80
	for <lists+linux-audit@lfdr.de>; Fri, 20 Jan 2023 20:03:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674241402;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=F8nSGMg8156vrw6g7tlQsUxRU0gB5yAA+KX8VAm9QWM=;
	b=TLs0jU3CSvdxjdF9/Uh1RB9Bcq0Lah0V4AgSs5LlrArsdMkY7DdvlqhUFvgHud0zWOHCUg
	oQcL1ihUKtRZoEcExmAMK8FiOYOTokFOFrluJipjzTUCUKBHZYBFiGVeFer7gbFsd6jtkg
	bbUeCZ2vlNW1YgJPzXCXBxN25iI1QXk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-MtwfDSMwONeyZ1DBQRfobg-1; Fri, 20 Jan 2023 14:03:17 -0500
X-MC-Unique: MtwfDSMwONeyZ1DBQRfobg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5BE12857A88;
	Fri, 20 Jan 2023 19:02:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3E2F82026D2A;
	Fri, 20 Jan 2023 19:02:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 32FFA1946588;
	Fri, 20 Jan 2023 19:02:56 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EA3681946588 for <linux-audit@listman.corp.redhat.com>;
 Fri, 20 Jan 2023 14:25:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A65FC1759E; Fri, 20 Jan 2023 14:25:47 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DE7353AA
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 14:25:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79523802BF5
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 14:25:47 +0000 (UTC)
Received: from fx408.security-mail.net (smtpout140.security-mail.net
 [85.31.212.148]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-638-m5E7_h2PP-iRduLDI0EvkA-1; Fri, 20 Jan 2023 09:25:46 -0500
X-MC-Unique: m5E7_h2PP-iRduLDI0EvkA-1
Received: from localhost (fx408.security-mail.net [127.0.0.1])
 by fx408.security-mail.net (Postfix) with ESMTP id ED4FF3229F7
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 15:25:44 +0100 (CET)
Received: from fx408 (fx408.security-mail.net [127.0.0.1]) by
 fx408.security-mail.net (Postfix) with ESMTP id B5716322547; Fri, 20 Jan
 2023 15:25:44 +0100 (CET)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx408.security-mail.net (Postfix) with ESMTPS id 1C87E322929; Fri, 20 Jan
 2023 15:25:44 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 2A48827E0437; Fri, 20 Jan 2023
 15:10:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 0210427E043D; Fri, 20 Jan 2023 15:10:33 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 ImWCZZGcWW5W; Fri, 20 Jan 2023 15:10:32 +0100 (CET)
Received: from junon.lin.mbt.kalray.eu (unknown [192.168.37.161]) by
 zimbra2.kalray.eu (Postfix) with ESMTPSA id 8995D27E043A; Fri, 20 Jan 2023
 15:10:32 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <f780.63caa468.1b48f.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 0210427E043D
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
Subject: [RFC PATCH v2 18/31] irqchip: Add kvx-core-intc core interupt
 controller driver
Date: Fri, 20 Jan 2023 15:09:49 +0100
Message-ID: <20230120141002.2442-19-ysionneau@kalray.eu>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

From: Jules Maselbas <jmaselbas@kalray.eu>

Each kvx core includes a hardware interrupt controller (core INTC)
with the following features:
 - 32 independent interrupt sources
 - 4-bit priotity level
 - Individual interrupt enable bit
 - Interrupt status bit displaying the pending interrupts
 - Priority management between the 32 interrupts

Among those 32 interrupt sources, the first are hard-wired to hardware
sources. The remaining interrupt sources can be triggered via software
by directly writing to the ILR SFR.

The hard-wired interrupt sources are the following:
  0: Timer 0
  1: Timer 1
  2: Watchdog
  3: Performance Monitors
  4: APIC GIC line 0
  5: APIC GIC line 1
  6: APIC GIC line 2
  7: APIC GIC line 3
 12: SECC error from memory system
 13: Arithmetic exception (carry and IEEE 754 flags)
 16: Data Asynchronous Memory Error (DAME), raised for DECC/DSYS errors
 17: CLI (Cache Line Invalidation) for L1D or L1I following
     DECC/DSYS/Parity errors

The APIC GIC lines will be used to route interrupts coming from SoC
peripherals from outside the Cluster to the kvx core. Those peripherals
include USB host controller, eMMC/SD host controller, i2c, spi, PCIe,
IOMMUs etc...

Co-developed-by: Clement Leger <clement@clement-leger.fr>
Signed-off-by: Clement Leger <clement@clement-leger.fr>
Co-developed-by: Julian Vetter <jvetter@kalray.eu>
Signed-off-by: Julian Vetter <jvetter@kalray.eu>
Co-developed-by: Vincent Chardon <vincent.chardon@elsys-design.com>
Signed-off-by: Vincent Chardon <vincent.chardon@elsys-design.com>
Co-developed-by: Jules Maselbas <jmaselbas@kalray.eu>
Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
---

Notes:
    V1 -> V2: new patch
     - removed print on probe success

 drivers/irqchip/Kconfig             |  5 ++
 drivers/irqchip/Makefile            |  1 +
 drivers/irqchip/irq-kvx-core-intc.c | 80 +++++++++++++++++++++++++++++
 3 files changed, 86 insertions(+)
 create mode 100644 drivers/irqchip/irq-kvx-core-intc.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 806adbc7b2a4..d242e02771e3 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -334,6 +334,11 @@ config MIPS_GIC
 	select IRQ_DOMAIN_HIERARCHY
 	select MIPS_CM
 
+config KVX_CORE_INTC
+	bool
+	depends on KVX
+	select IRQ_DOMAIN
+
 config KVX_APIC_GIC
 	bool
 	depends on KVX
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 7eaea87ca9ab..d931f2eb38b6 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -69,6 +69,7 @@ obj-$(CONFIG_BCM7120_L2_IRQ)		+= irq-bcm7120-l2.o
 obj-$(CONFIG_BRCMSTB_L2_IRQ)		+= irq-brcmstb-l2.o
 obj-$(CONFIG_KEYSTONE_IRQ)		+= irq-keystone.o
 obj-$(CONFIG_MIPS_GIC)			+= irq-mips-gic.o
+obj-$(CONFIG_KVX_CORE_INTC)		+= irq-kvx-core-intc.o
 obj-$(CONFIG_KVX_APIC_GIC)		+= irq-kvx-apic-gic.o
 obj-$(CONFIG_KVX_ITGEN)			+= irq-kvx-itgen.o
 obj-$(CONFIG_KVX_APIC_MAILBOX)		+= irq-kvx-apic-mailbox.o
diff --git a/drivers/irqchip/irq-kvx-core-intc.c b/drivers/irqchip/irq-kvx-core-intc.c
new file mode 100644
index 000000000000..145f1248925b
--- /dev/null
+++ b/drivers/irqchip/irq-kvx-core-intc.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2017-2023 Kalray Inc.
+ * Author(s): Clement Leger
+ */
+
+#define pr_fmt(fmt)	"kvx_core_intc: " fmt
+
+#include <linux/interrupt.h>
+#include <linux/irqdomain.h>
+#include <linux/irqchip.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/of.h>
+#include <asm/irq.h>
+
+#define KVX_CORE_INTC_IRQ	32
+
+
+static void kvx_irq_mask(struct irq_data *data)
+{
+	kvx_sfr_clear_bit(ILE, data->hwirq);
+}
+
+static void kvx_irq_unmask(struct irq_data *data)
+{
+	kvx_sfr_set_bit(ILE, data->hwirq);
+}
+
+static struct irq_chip kvx_irq_chip = {
+	.name           = "kvx core Intc",
+	.irq_mask	= kvx_irq_mask,
+	.irq_unmask	= kvx_irq_unmask,
+};
+
+static int kvx_irq_map(struct irq_domain *d, unsigned int irq,
+			 irq_hw_number_t hw)
+{
+	/* All interrupts for core are per cpu */
+	irq_set_percpu_devid(irq);
+	irq_set_chip_and_handler(irq, &kvx_irq_chip, handle_percpu_irq);
+
+	return 0;
+}
+
+static const struct irq_domain_ops kvx_irq_ops = {
+	.xlate = irq_domain_xlate_onecell,
+	.map = kvx_irq_map,
+};
+
+static int __init
+kvx_init_core_intc(struct device_node *intc, struct device_node *parent)
+{
+	struct irq_domain *root_domain;
+	uint32_t core_nr_irqs;
+
+	if (parent)
+		panic("DeviceTree core intc not a root irq controller\n");
+
+	if (of_property_read_u32(intc, "kalray,intc-nr-irqs", &core_nr_irqs))
+		core_nr_irqs = KVX_CORE_INTC_IRQ;
+
+	/* We only have up to 32 interrupts, according to IRQ-domain.txt,
+	 * linear is likely to be the best choice
+	 */
+	root_domain = irq_domain_add_linear(intc, core_nr_irqs,
+						&kvx_irq_ops, NULL);
+	if (!root_domain)
+		panic("root irq domain not avail\n");
+
+	/*
+	 * Needed for primary domain lookup to succeed
+	 * This is a primary irqchip, and can never have a parent
+	 */
+	irq_set_default_host(root_domain);
+
+	return 0;
+}
+
+IRQCHIP_DECLARE(kvx_core_intc, "kalray,kvx-core-intc", kvx_init_core_intc);
-- 
2.37.2





--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

