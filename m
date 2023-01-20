Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAA2675D69
	for <lists+linux-audit@lfdr.de>; Fri, 20 Jan 2023 20:03:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674241394;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oti63ZyLKK2PWLP+N8uQwnwnOPiOPID3osN5A27cDvY=;
	b=ZY3WKGcVR4md1p32yuTjCXkcFkEukivXAvx3TZkCuSbVLQ25y92bCSLzsT7fyldKyliAlP
	0rlgW4Oqm0QXesiSfaEWNYt+jJYCkpd3Y1nnkT1/LN5po+cd3iTGAHWboL6hGQp1C6zcRV
	hn0HLnRy3zm5FoB+6fnRIMw/izMQC4w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-vU7-v5KKMVat_Zbns6VzLw-1; Fri, 20 Jan 2023 14:03:12 -0500
X-MC-Unique: vU7-v5KKMVat_Zbns6VzLw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 085B185C081;
	Fri, 20 Jan 2023 19:02:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DEF75492B03;
	Fri, 20 Jan 2023 19:02:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 801741947042;
	Fri, 20 Jan 2023 19:02:53 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5AFDF19465B6 for <linux-audit@listman.corp.redhat.com>;
 Fri, 20 Jan 2023 14:10:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3E522C159BB; Fri, 20 Jan 2023 14:10:35 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 36EB2C15BAD
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 14:10:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17151100F909
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 14:10:35 +0000 (UTC)
Received: from fx403.security-mail.net (smtpout140.security-mail.net
 [85.31.212.143]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-12-_lbqJ8dfPVS2EZvhhFOv1A-1; Fri, 20 Jan 2023 09:10:33 -0500
X-MC-Unique: _lbqJ8dfPVS2EZvhhFOv1A-1
Received: from localhost (localhost [127.0.0.1])
 by fx403.security-mail.net (Postfix) with ESMTP id 2D364465822
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 15:10:32 +0100 (CET)
Received: from fx403 (localhost [127.0.0.1]) by fx403.security-mail.net
 (Postfix) with ESMTP id D93FE46596D; Fri, 20 Jan 2023 15:10:31 +0100 (CET)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx403.security-mail.net (Postfix) with ESMTPS id AE5D8465448; Fri, 20 Jan
 2023 15:10:30 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 4CC1A27E0440; Fri, 20 Jan 2023
 15:10:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 2CBC627E043A; Fri, 20 Jan 2023 15:10:30 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 Vglx1afFJmpx; Fri, 20 Jan 2023 15:10:30 +0100 (CET)
Received: from junon.lin.mbt.kalray.eu (unknown [192.168.37.161]) by
 zimbra2.kalray.eu (Postfix) with ESMTPSA id B43BA27E043D; Fri, 20 Jan 2023
 15:10:29 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <f06a.63caa0d6.ac49d.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 2CBC627E043A
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
Subject: [RFC PATCH v2 12/31] kvx: Add other common headers
Date: Fri, 20 Jan 2023 15:09:43 +0100
Message-ID: <20230120141002.2442-13-ysionneau@kalray.eu>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add some other common headers for basic kvx support.

Co-developed-by: Clement Leger <clement@clement-leger.fr>
Signed-off-by: Clement Leger <clement@clement-leger.fr>
Co-developed-by: Julian Vetter <jvetter@kalray.eu>
Signed-off-by: Julian Vetter <jvetter@kalray.eu>
Co-developed-by: Vincent Chardon <vincent.chardon@elsys-design.com>
Signed-off-by: Vincent Chardon <vincent.chardon@elsys-design.com>
Co-developed-by: Yann Sionneau <ysionneau@kalray.eu>
Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
---

Notes:
    V1 -> V2: no changes

 arch/kvx/include/asm/asm-prototypes.h   | 14 ++++++++
 arch/kvx/include/asm/clocksource.h      | 17 +++++++++
 arch/kvx/include/asm/linkage.h          | 13 +++++++
 arch/kvx/include/asm/pci.h              | 36 +++++++++++++++++++
 arch/kvx/include/asm/sections.h         | 18 ++++++++++
 arch/kvx/include/asm/spinlock.h         | 16 +++++++++
 arch/kvx/include/asm/spinlock_types.h   | 17 +++++++++
 arch/kvx/include/asm/stackprotector.h   | 47 +++++++++++++++++++++++++
 arch/kvx/include/asm/timex.h            | 20 +++++++++++
 arch/kvx/include/asm/types.h            | 12 +++++++
 arch/kvx/include/uapi/asm/bitsperlong.h | 14 ++++++++
 arch/kvx/include/uapi/asm/byteorder.h   | 12 +++++++
 tools/include/uapi/asm/bitsperlong.h    |  2 ++
 13 files changed, 238 insertions(+)
 create mode 100644 arch/kvx/include/asm/asm-prototypes.h
 create mode 100644 arch/kvx/include/asm/clocksource.h
 create mode 100644 arch/kvx/include/asm/linkage.h
 create mode 100644 arch/kvx/include/asm/pci.h
 create mode 100644 arch/kvx/include/asm/sections.h
 create mode 100644 arch/kvx/include/asm/spinlock.h
 create mode 100644 arch/kvx/include/asm/spinlock_types.h
 create mode 100644 arch/kvx/include/asm/stackprotector.h
 create mode 100644 arch/kvx/include/asm/timex.h
 create mode 100644 arch/kvx/include/asm/types.h
 create mode 100644 arch/kvx/include/uapi/asm/bitsperlong.h
 create mode 100644 arch/kvx/include/uapi/asm/byteorder.h

diff --git a/arch/kvx/include/asm/asm-prototypes.h b/arch/kvx/include/asm/asm-prototypes.h
new file mode 100644
index 000000000000..af032508e30c
--- /dev/null
+++ b/arch/kvx/include/asm/asm-prototypes.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2017-2023 Kalray Inc.
+ * Author(s): Clement Leger
+ */
+
+#ifndef _ASM_KVX_ASM_PROTOTYPES_H
+#define _ASM_KVX_ASM_PROTOTYPES_H
+
+#include <asm/string.h>
+
+#include <asm-generic/asm-prototypes.h>
+
+#endif /* _ASM_KVX_ASM_PROTOTYPES_H */
diff --git a/arch/kvx/include/asm/clocksource.h b/arch/kvx/include/asm/clocksource.h
new file mode 100644
index 000000000000..4df7c66ffbb5
--- /dev/null
+++ b/arch/kvx/include/asm/clocksource.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2017-2023 Kalray Inc.
+ * Author(s): Yann Sionneau
+ *            Clement Leger
+ */
+
+#ifndef _ASM_KVX_CLOCKSOURCE_H
+#define _ASM_KVX_CLOCKSOURCE_H
+
+#include <linux/compiler.h>
+
+struct arch_clocksource_data {
+	void __iomem *regs;
+};
+
+#endif /* _ASM_KVX_CLOCKSOURCE_H */
diff --git a/arch/kvx/include/asm/linkage.h b/arch/kvx/include/asm/linkage.h
new file mode 100644
index 000000000000..84e1cacf67c2
--- /dev/null
+++ b/arch/kvx/include/asm/linkage.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2017-2023 Kalray Inc.
+ * Author(s): Yann Sionneau
+ */
+
+#ifndef __ASM_KVX_LINKAGE_H
+#define __ASM_KVX_LINKAGE_H
+
+#define __ALIGN		.align 4
+#define __ALIGN_STR	".align 4"
+
+#endif
diff --git a/arch/kvx/include/asm/pci.h b/arch/kvx/include/asm/pci.h
new file mode 100644
index 000000000000..d5bbaaf041b5
--- /dev/null
+++ b/arch/kvx/include/asm/pci.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2017-2023 Kalray Inc.
+ * Author(s): Vincent Chardon
+ *            Clement Leger
+ */
+
+#ifndef __ASM_KVX_PCI_H_
+#define __ASM_KVX_PCI_H_
+
+#include <linux/dma-mapping.h>
+#include <linux/pci.h>
+#include <linux/of_gpio.h>
+
+#define ARCH_GENERIC_PCI_MMAP_RESOURCE	1
+#define HAVE_PCI_MMAP			1
+
+extern int isa_dma_bridge_buggy;
+
+/* Can be used to override the logic in pci_scan_bus for skipping
+ * already-configured bus numbers - to be used for buggy BIOSes
+ * or architectures with incomplete PCI setup by the loader.
+ */
+#define pcibios_assign_all_busses()	0
+
+#define PCIBIOS_MIN_IO          0UL
+#define PCIBIOS_MIN_MEM         0UL
+
+#ifdef CONFIG_PCI_DOMAINS
+static inline int pci_proc_domain(struct pci_bus *bus)
+{
+		return pci_domain_nr(bus);
+}
+#endif /*  CONFIG_PCI_DOMAINS */
+
+#endif /* _ASM_KVX_PCI_H */
diff --git a/arch/kvx/include/asm/sections.h b/arch/kvx/include/asm/sections.h
new file mode 100644
index 000000000000..0777675ef264
--- /dev/null
+++ b/arch/kvx/include/asm/sections.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2017-2023 Kalray Inc.
+ * Author(s): Clement Leger
+ */
+
+#ifndef _ASM_KVX_SECTIONS_H
+#define _ASM_KVX_SECTIONS_H
+
+#include <asm-generic/sections.h>
+
+extern char __rodata_start[], __rodata_end[];
+extern char __initdata_start[], __initdata_end[];
+extern char __inittext_start[], __inittext_end[];
+extern char __exception_start[], __exception_end[];
+extern char __rm_firmware_regs_start[];
+
+#endif
diff --git a/arch/kvx/include/asm/spinlock.h b/arch/kvx/include/asm/spinlock.h
new file mode 100644
index 000000000000..ed32fdba1e19
--- /dev/null
+++ b/arch/kvx/include/asm/spinlock.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2017-2023 Kalray Inc.
+ * Author(s): Clement Leger
+ */
+
+#ifndef _ASM_KVX_SPINLOCK_H
+#define _ASM_KVX_SPINLOCK_H
+
+#include <asm/qspinlock.h>
+#include <asm/qrwlock.h>
+
+/* See include/linux/spinlock.h */
+#define smp_mb__after_spinlock()	smp_mb()
+
+#endif
diff --git a/arch/kvx/include/asm/spinlock_types.h b/arch/kvx/include/asm/spinlock_types.h
new file mode 100644
index 000000000000..929a7df16ef3
--- /dev/null
+++ b/arch/kvx/include/asm/spinlock_types.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2017-2023 Kalray Inc.
+ * Author(s): Clement Leger
+ */
+
+#ifndef _ASM_KVX_SPINLOCK_TYPES_H
+#define _ASM_KVX_SPINLOCK_TYPES_H
+
+#if !defined(__LINUX_SPINLOCK_TYPES_RAW_H) && !defined(__ASM_SPINLOCK_H)
+# error "please don't include this file directly"
+#endif
+
+#include <asm-generic/qspinlock_types.h>
+#include <asm-generic/qrwlock_types.h>
+
+#endif /* _ASM_KVX_SPINLOCK_TYPES_H */
diff --git a/arch/kvx/include/asm/stackprotector.h b/arch/kvx/include/asm/stackprotector.h
new file mode 100644
index 000000000000..2c190bbb5efc
--- /dev/null
+++ b/arch/kvx/include/asm/stackprotector.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * derived from arch/mips/include/asm/stackprotector.h
+ *
+ * Copyright (C) 2017-2023 Kalray Inc.
+ * Author(s): Clement Leger
+ */
+
+/*
+ * GCC stack protector support.
+ *
+ * Stack protector works by putting predefined pattern at the start of
+ * the stack frame and verifying that it hasn't been overwritten when
+ * returning from the function.  The pattern is called stack canary
+ * and gcc expects it to be defined by a global variable called
+ * "__stack_chk_guard" on KVX.  This unfortunately means that on SMP
+ * we cannot have a different canary value per task.
+ */
+
+#ifndef __ASM_STACKPROTECTOR_H
+#define __ASM_STACKPROTECTOR_H
+
+#include <linux/random.h>
+#include <linux/version.h>
+
+extern unsigned long __stack_chk_guard;
+
+/*
+ * Initialize the stackprotector canary value.
+ *
+ * NOTE: this must only be called from functions that never return,
+ * and it must always be inlined.
+ */
+static __always_inline void boot_init_stack_canary(void)
+{
+	unsigned long canary;
+
+	/* Try to get a semi random initial value. */
+	get_random_bytes(&canary, sizeof(canary));
+	canary ^= LINUX_VERSION_CODE;
+	canary &= CANARY_MASK;
+
+	current->stack_canary = canary;
+	__stack_chk_guard = current->stack_canary;
+}
+
+#endif	/* _ASM_STACKPROTECTOR_H */
diff --git a/arch/kvx/include/asm/timex.h b/arch/kvx/include/asm/timex.h
new file mode 100644
index 000000000000..51e346faa887
--- /dev/null
+++ b/arch/kvx/include/asm/timex.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2017-2023 Kalray Inc.
+ * Author(s): Clement Leger
+ */
+
+#ifndef _ASM_KVX_TIMEX_H
+#define _ASM_KVX_TIMEX_H
+
+#define get_cycles get_cycles
+
+#include <asm/sfr.h>
+#include <asm-generic/timex.h>
+
+static inline cycles_t get_cycles(void)
+{
+	return kvx_sfr_get(PM0);
+}
+
+#endif	/* _ASM_KVX_TIMEX_H */
diff --git a/arch/kvx/include/asm/types.h b/arch/kvx/include/asm/types.h
new file mode 100644
index 000000000000..1e6c024ee892
--- /dev/null
+++ b/arch/kvx/include/asm/types.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2017-2023 Kalray Inc.
+ * Author(s): Clement Leger
+ */
+
+#ifndef _ASM_KVX_TYPES_H
+#define _ASM_KVX_TYPES_H
+
+#include <asm-generic/int-ll64.h>
+
+#endif	/* _ASM_KVX_TYPES_H */
diff --git a/arch/kvx/include/uapi/asm/bitsperlong.h b/arch/kvx/include/uapi/asm/bitsperlong.h
new file mode 100644
index 000000000000..02a91596d567
--- /dev/null
+++ b/arch/kvx/include/uapi/asm/bitsperlong.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/*
+ * Copyright (C) 2017-2023 Kalray Inc.
+ * Author(s): Clement Leger
+ */
+
+#ifndef _UAPI_ASM_KVX_BITSPERLONG_H
+#define _UAPI_ASM_KVX_BITSPERLONG_H
+
+#define __BITS_PER_LONG 64
+
+#include <asm-generic/bitsperlong.h>
+
+#endif /* _UAPI_ASM_KVX_BITSPERLONG_H */
diff --git a/arch/kvx/include/uapi/asm/byteorder.h b/arch/kvx/include/uapi/asm/byteorder.h
new file mode 100644
index 000000000000..b7d827daec73
--- /dev/null
+++ b/arch/kvx/include/uapi/asm/byteorder.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/*
+ * Copyright (C) 2017-2023 Kalray Inc.
+ * Author(s): Clement Leger
+ */
+
+#ifndef _ASM_KVX_BYTEORDER_H
+#define _ASM_KVX_BYTEORDER_H
+
+#include <linux/byteorder/little_endian.h>
+
+#endif	/* _ASM_KVX_BYTEORDER_H */
diff --git a/tools/include/uapi/asm/bitsperlong.h b/tools/include/uapi/asm/bitsperlong.h
index da5206517158..40272ffa9c32 100644
--- a/tools/include/uapi/asm/bitsperlong.h
+++ b/tools/include/uapi/asm/bitsperlong.h
@@ -19,6 +19,8 @@
 #include "../../../arch/alpha/include/uapi/asm/bitsperlong.h"
 #elif defined(__loongarch__)
 #include "../../../arch/loongarch/include/uapi/asm/bitsperlong.h"
+#elif defined(__kvx__)
+#include "../../../arch/kvx/include/uapi/asm/bitsperlong.h"
 #else
 #include <asm-generic/bitsperlong.h>
 #endif
-- 
2.37.2





--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

