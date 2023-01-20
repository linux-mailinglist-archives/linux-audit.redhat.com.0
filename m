Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E896675D66
	for <lists+linux-audit@lfdr.de>; Fri, 20 Jan 2023 20:03:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674241393;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gozLLfUU6Jkr8ZC7TVxEC0CTECSCo+xCtiWPNc3Ow+Q=;
	b=S3LrO7xAIAypnS2xJ/PxRnf2bvouhc/bue0UjG4frCT9AXRxZ+rj3kZ2OOz6R2Zo5Q8o6A
	py4HyXKTNXcvRrx4WuRVas01GBh/oGsHAZZsPRECeknexrfwdDAYe6BXbTFuTOrmUNxNup
	VbqvWCUsOz89VCn9YrytRqRf9DFcblA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-284-6BJICl0dOr-jzKvYeZOk0A-1; Fri, 20 Jan 2023 14:03:10 -0500
X-MC-Unique: 6BJICl0dOr-jzKvYeZOk0A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 364E43C10EDF;
	Fri, 20 Jan 2023 19:02:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1921314152F6;
	Fri, 20 Jan 2023 19:02:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id ACC9B1946588;
	Fri, 20 Jan 2023 19:02:53 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C8E5E1946588 for <linux-audit@listman.corp.redhat.com>;
 Fri, 20 Jan 2023 14:20:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AFFB9401530A; Fri, 20 Jan 2023 14:20:51 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A741240C6EC4
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 14:20:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C4F7281DE7E
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 14:20:51 +0000 (UTC)
Received: from fx601.security-mail.net (smtpout140.security-mail.net
 [85.31.212.146]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-59-3J0m29rJMQutcvQdI1MSDA-1; Fri, 20 Jan 2023 09:20:47 -0500
X-MC-Unique: 3J0m29rJMQutcvQdI1MSDA-1
Received: from localhost (fx601.security-mail.net [127.0.0.1])
 by fx601.security-mail.net (Postfix) with ESMTP id 6666534971C
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 15:20:46 +0100 (CET)
Received: from fx601 (fx601.security-mail.net [127.0.0.1]) by
 fx601.security-mail.net (Postfix) with ESMTP id BEEDF349869; Fri, 20 Jan
 2023 15:20:45 +0100 (CET)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx601.security-mail.net (Postfix) with ESMTPS id 1F87634967F; Fri, 20 Jan
 2023 15:20:44 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 7BC3F27E0481; Fri, 20 Jan 2023
 15:10:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 62F6427E047C; Fri, 20 Jan 2023 15:10:39 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 efK8YWmnYQbb; Fri, 20 Jan 2023 15:10:39 +0100 (CET)
Received: from junon.lin.mbt.kalray.eu (unknown [192.168.37.161]) by
 zimbra2.kalray.eu (Postfix) with ESMTPSA id C9CA227E0474; Fri, 20 Jan 2023
 15:10:38 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <5b1f.63caa33c.1c743.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 62F6427E047C
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
Subject: [RFC PATCH v2 31/31] kvx: Add IPI driver
Date: Fri, 20 Jan 2023 15:10:02 +0100
Message-ID: <20230120141002.2442-32-ysionneau@kalray.eu>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Jules Maselbas <jmaselbas@kalray.eu>

The Inter-Processor Interrupt Controller (IPI) provides a fast
synchronization mechanism to the software. It exposes eight independent
set of registers that can be use to notify each processor in the cluster.
test

Co-developed-by: Clement Leger <clement@clement-leger.fr>
Signed-off-by: Clement Leger <clement@clement-leger.fr>
Co-developed-by: Guillaume Thouvenin <gthouvenin@kalray.eu>
Signed-off-by: Guillaume Thouvenin <gthouvenin@kalray.eu>
Co-developed-by: Julian Vetter <jvetter@kalray.eu>
Signed-off-by: Julian Vetter <jvetter@kalray.eu>
Co-developed-by: Luc Michel <lmichel@kalray.eu>
Signed-off-by: Luc Michel <lmichel@kalray.eu>
Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
---

Notes:
    V1 -> V2: new patch

 arch/kvx/include/asm/ipi.h |  16 ++++++
 arch/kvx/platform/Makefile |   1 +
 arch/kvx/platform/ipi.c    | 108 +++++++++++++++++++++++++++++++++++++
 3 files changed, 125 insertions(+)
 create mode 100644 arch/kvx/include/asm/ipi.h
 create mode 100644 arch/kvx/platform/ipi.c

diff --git a/arch/kvx/include/asm/ipi.h b/arch/kvx/include/asm/ipi.h
new file mode 100644
index 000000000000..137407a075e6
--- /dev/null
+++ b/arch/kvx/include/asm/ipi.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2017-2023 Kalray Inc.
+ * Author(s): Clement Leger
+ */
+
+#ifndef _ASM_KVX_IPI_H
+#define _ASM_KVX_IPI_H
+
+#include <linux/irqreturn.h>
+
+int kvx_ipi_ctrl_probe(irqreturn_t (*ipi_irq_handler)(int, void *));
+
+void kvx_ipi_send(const struct cpumask *mask);
+
+#endif /* _ASM_KVX_IPI_H */
diff --git a/arch/kvx/platform/Makefile b/arch/kvx/platform/Makefile
index c7d0abb15c27..27f0914e0de5 100644
--- a/arch/kvx/platform/Makefile
+++ b/arch/kvx/platform/Makefile
@@ -4,3 +4,4 @@
 #
 
 obj-$(CONFIG_SMP) += pwr_ctrl.o
+obj-$(CONFIG_SMP) += ipi.o
diff --git a/arch/kvx/platform/ipi.c b/arch/kvx/platform/ipi.c
new file mode 100644
index 000000000000..a471039b1643
--- /dev/null
+++ b/arch/kvx/platform/ipi.c
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2017-2023 Kalray Inc.
+ * Author(s): Clement Leger
+ *            Luc Michel
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/io.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/module.h>
+#include <linux/of_irq.h>
+#include <linux/cpumask.h>
+#include <linux/interrupt.h>
+#include <linux/cpuhotplug.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+
+#define IPI_INTERRUPT_OFFSET	0x0
+#define IPI_MASK_OFFSET		0x20
+
+/*
+ * IPI controller can signal RM and PE0 -> 15
+ * In order to restrict that to the PE, write the corresponding mask
+ */
+#define KVX_IPI_CPU_MASK	(~0xFFFF)
+
+struct kvx_ipi_ctrl {
+	void __iomem *regs;
+	unsigned int ipi_irq;
+};
+
+static struct kvx_ipi_ctrl kvx_ipi_controller;
+
+/**
+ * @kvx_pwr_ctrl_cpu_poweron Wakeup a cpu
+ *
+ * cpu: cpu to wakeup
+ */
+void kvx_ipi_send(const struct cpumask *mask)
+{
+	const unsigned long *maskb = cpumask_bits(mask);
+
+	WARN_ON(*maskb & KVX_IPI_CPU_MASK);
+	writel(*maskb, kvx_ipi_controller.regs + IPI_INTERRUPT_OFFSET);
+}
+
+static int kvx_ipi_starting_cpu(unsigned int cpu)
+{
+	enable_percpu_irq(kvx_ipi_controller.ipi_irq, IRQ_TYPE_NONE);
+
+	return 0;
+}
+
+static int kvx_ipi_dying_cpu(unsigned int cpu)
+{
+	disable_percpu_irq(kvx_ipi_controller.ipi_irq);
+
+	return 0;
+}
+
+int __init kvx_ipi_ctrl_probe(irqreturn_t (*ipi_irq_handler)(int, void *))
+{
+	struct device_node *np;
+	int ret;
+	unsigned int ipi_irq;
+	void __iomem *ipi_base;
+
+	np = of_find_compatible_node(NULL, NULL, "kalray,kvx-ipi-ctrl");
+	BUG_ON(!np);
+
+	ipi_base = of_iomap(np, 0);
+	BUG_ON(!ipi_base);
+
+	kvx_ipi_controller.regs = ipi_base;
+
+	/* Init mask for interrupts to PE0 -> PE15 */
+	writel(KVX_IPI_CPU_MASK, kvx_ipi_controller.regs + IPI_MASK_OFFSET);
+
+	ipi_irq = irq_of_parse_and_map(np, 0);
+	of_node_put(np);
+	if (!ipi_irq) {
+		pr_err("Failed to parse irq: %d\n", ipi_irq);
+		return -EINVAL;
+	}
+
+	ret = request_percpu_irq(ipi_irq, ipi_irq_handler,
+						"kvx_ipi", &kvx_ipi_controller);
+	if (ret) {
+		pr_err("can't register interrupt %d (%d)\n",
+						ipi_irq, ret);
+		return ret;
+	}
+	kvx_ipi_controller.ipi_irq = ipi_irq;
+
+	ret = cpuhp_setup_state(CPUHP_AP_IRQ_KVX_STARTING,
+				"kvx/ipi:online",
+				kvx_ipi_starting_cpu,
+				kvx_ipi_dying_cpu);
+	if (ret < 0) {
+		pr_err("Failed to setup hotplug state");
+		return ret;
+	}
+
+	return 0;
+}
-- 
2.37.2





--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

