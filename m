Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B330E675D78
	for <lists+linux-audit@lfdr.de>; Fri, 20 Jan 2023 20:03:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674241400;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rBGxFSkL03vGCzU1pWPHxJ1KtxnAiM5dwjj2ZtYS+pQ=;
	b=Zy4vxc2urDdQtv/0IjY5WtZP3cwRUNE8OrDNeZt0/5/LQNE7PzpsumIc0Cf06R+YAb204J
	juoppXWrrIf+hPFiO3M1Bx5wZOsZlxOuxShBGIuypy+6IgHIN2nbtbM7jpV8ZM1adgYZ/F
	Rgehh0fj2aEWVytZN6xAtAXzzz7aRbc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-kE96SVqiN1aFl6du2of7Xg-1; Fri, 20 Jan 2023 14:03:18 -0500
X-MC-Unique: kE96SVqiN1aFl6du2of7Xg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9BCFA810BD0;
	Fri, 20 Jan 2023 19:02:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7E9261415304;
	Fri, 20 Jan 2023 19:02:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 26BD21946A6D;
	Fri, 20 Jan 2023 19:02:54 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EA08219465B6 for <linux-audit@listman.corp.redhat.com>;
 Fri, 20 Jan 2023 14:20:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CC09140C2064; Fri, 20 Jan 2023 14:20:50 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C379A40444C3
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 14:20:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CF7C85CCE0
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 14:20:50 +0000 (UTC)
Received: from fx306.security-mail.net (smtpout30.security-mail.net
 [85.31.212.36]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-1-1cjS4XXhPl2BXT3EY9Z8cg-1; Fri, 20 Jan 2023 09:20:49 -0500
X-MC-Unique: 1cjS4XXhPl2BXT3EY9Z8cg-1
Received: from localhost (fx306.security-mail.net [127.0.0.1])
 by fx306.security-mail.net (Postfix) with ESMTP id 042B435CF87
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 15:20:47 +0100 (CET)
Received: from fx306 (fx306.security-mail.net [127.0.0.1]) by
 fx306.security-mail.net (Postfix) with ESMTP id 6E26435CF13; Fri, 20 Jan
 2023 15:20:46 +0100 (CET)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx306.security-mail.net (Postfix) with ESMTPS id 439BB35CD24; Fri, 20 Jan
 2023 15:20:45 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 8FFB327E0453; Fri, 20 Jan 2023
 15:10:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 7082927E044D; Fri, 20 Jan 2023 15:10:35 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 gKzfpy00nt4p; Fri, 20 Jan 2023 15:10:35 +0100 (CET)
Received: from junon.lin.mbt.kalray.eu (unknown [192.168.37.161]) by
 zimbra2.kalray.eu (Postfix) with ESMTPSA id B1D2927E0442; Fri, 20 Jan 2023
 15:10:34 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <13806.63caa33d.420ef.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 7082927E044D
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
Subject: [RFC PATCH v2 23/31] kvx: Add ELF relocations and module support
Date: Fri, 20 Jan 2023 15:09:54 +0100
Message-ID: <20230120141002.2442-24-ysionneau@kalray.eu>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add ELF-related definition and module relocation code for basic
kvx support.

Co-developed-by: Clement Leger <clement@clement-leger.fr>
Signed-off-by: Clement Leger <clement@clement-leger.fr>
Co-developed-by: Julian Vetter <jvetter@kalray.eu>
Signed-off-by: Julian Vetter <jvetter@kalray.eu>
Co-developed-by: Marius Gligor <mgligor@kalray.eu>
Signed-off-by: Marius Gligor <mgligor@kalray.eu>
Co-developed-by: Yann Sionneau <ysionneau@kalray.eu>
Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
---

Notes:
    V1 -> V2: no changes

 arch/kvx/include/asm/elf.h      | 155 ++++++++++++++++++++++++++++++++
 arch/kvx/include/asm/vermagic.h |  12 +++
 arch/kvx/kernel/module.c        | 148 ++++++++++++++++++++++++++++++
 3 files changed, 315 insertions(+)
 create mode 100644 arch/kvx/include/asm/elf.h
 create mode 100644 arch/kvx/include/asm/vermagic.h
 create mode 100644 arch/kvx/kernel/module.c

diff --git a/arch/kvx/include/asm/elf.h b/arch/kvx/include/asm/elf.h
new file mode 100644
index 000000000000..38978d48221e
--- /dev/null
+++ b/arch/kvx/include/asm/elf.h
@@ -0,0 +1,155 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2017-2023 Kalray Inc.
+ * Author(s): Yann Sionneau
+ *            Clement Leger
+ *            Marius Gligor
+ *            Guillaume Thouvenin
+ */
+
+#ifndef _ASM_KVX_ELF_H
+#define _ASM_KVX_ELF_H
+
+#include <linux/types.h>
+
+#include <asm/ptrace.h>
+
+/*
+ * These are used to set parameters in the core dumps.
+ */
+#define ELF_CLASS	ELFCLASS64
+#define ELF_DATA	ELFDATA2LSB
+#define ELF_ARCH	EM_KVX
+
+typedef uint64_t elf_greg_t;
+typedef uint64_t elf_fpregset_t;
+
+#define ELF_NGREG	(sizeof(struct user_pt_regs) / sizeof(elf_greg_t))
+typedef elf_greg_t elf_gregset_t[ELF_NGREG];
+
+/* Copy user_pt_regs from pt_regs into the elf_gregset_t */
+#define ELF_CORE_COPY_REGS(dest, regs) \
+	*(struct user_pt_regs *)&(dest) = (regs)->user_regs;
+
+/*
+ * This is used to ensure we don't load something for the wrong architecture.
+ */
+#define elf_check_arch(x) ((x)->e_machine == EM_KVX)
+
+#define ELF_CORE_EFLAGS 0x1308
+
+#define ELF_EXEC_PAGESIZE	(PAGE_SIZE)
+
+/*
+ * This is the location that an ET_DYN program is loaded if exec'ed.  Typical
+ * use of this is to invoke "./ld.so someprog" to test out a new version of
+ * the loader.  We need to make sure that it is out of the way of the program
+ * that it will "exec", and that there is sufficient room for the brk.
+ */
+#define ELF_ET_DYN_BASE		((TASK_SIZE / 3) * 2)
+
+/*
+ * This yields a mask that user programs can use to figure out what
+ * instruction set this CPU supports.  This could be done in user space,
+ * but it's not easy, and we've already done it here.
+ */
+#define ELF_HWCAP	(elf_hwcap)
+extern unsigned long elf_hwcap;
+
+/*
+ * This yields a string that ld.so will use to load implementation
+ * specific libraries for optimization.  This is more specific in
+ * intent than poking at uname or /proc/cpuinfo.
+ */
+#define ELF_PLATFORM	(NULL)
+
+#define ARCH_HAS_SETUP_ADDITIONAL_PAGES 1
+struct linux_binprm;
+extern int arch_setup_additional_pages(struct linux_binprm *bprm,
+				       int uses_interp);
+
+/* KVX relocs */
+#define R_KVX_NONE                                   0
+#define R_KVX_16                                     1
+#define R_KVX_32                                     2
+#define R_KVX_64                                     3
+#define R_KVX_S16_PCREL                              4
+#define R_KVX_PCREL17                                5
+#define R_KVX_PCREL27                                6
+#define R_KVX_32_PCREL                               7
+#define R_KVX_S37_PCREL_LO10                         8
+#define R_KVX_S37_PCREL_UP27                         9
+#define R_KVX_S43_PCREL_LO10                        10
+#define R_KVX_S43_PCREL_UP27                        11
+#define R_KVX_S43_PCREL_EX6                         12
+#define R_KVX_S64_PCREL_LO10                        13
+#define R_KVX_S64_PCREL_UP27                        14
+#define R_KVX_S64_PCREL_EX27                        15
+#define R_KVX_64_PCREL                              16
+#define R_KVX_S16                                   17
+#define R_KVX_S32_LO5                               18
+#define R_KVX_S32_UP27                              19
+#define R_KVX_S37_LO10                              20
+#define R_KVX_S37_UP27                              21
+#define R_KVX_S37_GOTOFF_LO10                       22
+#define R_KVX_S37_GOTOFF_UP27                       23
+#define R_KVX_S43_GOTOFF_LO10                       24
+#define R_KVX_S43_GOTOFF_UP27                       25
+#define R_KVX_S43_GOTOFF_EX6                        26
+#define R_KVX_32_GOTOFF                             27
+#define R_KVX_64_GOTOFF                             28
+#define R_KVX_32_GOT                                29
+#define R_KVX_S37_GOT_LO10                          30
+#define R_KVX_S37_GOT_UP27                          31
+#define R_KVX_S43_GOT_LO10                          32
+#define R_KVX_S43_GOT_UP27                          33
+#define R_KVX_S43_GOT_EX6                           34
+#define R_KVX_64_GOT                                35
+#define R_KVX_GLOB_DAT                              36
+#define R_KVX_COPY                                  37
+#define R_KVX_JMP_SLOT                              38
+#define R_KVX_RELATIVE                              39
+#define R_KVX_S43_LO10                              40
+#define R_KVX_S43_UP27                              41
+#define R_KVX_S43_EX6                               42
+#define R_KVX_S64_LO10                              43
+#define R_KVX_S64_UP27                              44
+#define R_KVX_S64_EX27                              45
+#define R_KVX_S37_GOTADDR_LO10                      46
+#define R_KVX_S37_GOTADDR_UP27                      47
+#define R_KVX_S43_GOTADDR_LO10                      48
+#define R_KVX_S43_GOTADDR_UP27                      49
+#define R_KVX_S43_GOTADDR_EX6                       50
+#define R_KVX_S64_GOTADDR_LO10                      51
+#define R_KVX_S64_GOTADDR_UP27                      52
+#define R_KVX_S64_GOTADDR_EX27                      53
+#define R_KVX_64_DTPMOD                             54
+#define R_KVX_64_DTPOFF                             55
+#define R_KVX_S37_TLS_DTPOFF_LO10                   56
+#define R_KVX_S37_TLS_DTPOFF_UP27                   57
+#define R_KVX_S43_TLS_DTPOFF_LO10                   58
+#define R_KVX_S43_TLS_DTPOFF_UP27                   59
+#define R_KVX_S43_TLS_DTPOFF_EX6                    60
+#define R_KVX_S37_TLS_GD_LO10                       61
+#define R_KVX_S37_TLS_GD_UP27                       62
+#define R_KVX_S43_TLS_GD_LO10                       63
+#define R_KVX_S43_TLS_GD_UP27                       64
+#define R_KVX_S43_TLS_GD_EX6                        65
+#define R_KVX_S37_TLS_LD_LO10                       66
+#define R_KVX_S37_TLS_LD_UP27                       67
+#define R_KVX_S43_TLS_LD_LO10                       68
+#define R_KVX_S43_TLS_LD_UP27                       69
+#define R_KVX_S43_TLS_LD_EX6                        70
+#define R_KVX_64_TPOFF                              71
+#define R_KVX_S37_TLS_IE_LO10                       72
+#define R_KVX_S37_TLS_IE_UP27                       73
+#define R_KVX_S43_TLS_IE_LO10                       74
+#define R_KVX_S43_TLS_IE_UP27                       75
+#define R_KVX_S43_TLS_IE_EX6                        76
+#define R_KVX_S37_TLS_LE_LO10                       77
+#define R_KVX_S37_TLS_LE_UP27                       78
+#define R_KVX_S43_TLS_LE_LO10                       79
+#define R_KVX_S43_TLS_LE_UP27                       80
+#define R_KVX_S43_TLS_LE_EX6                        81
+
+#endif	/* _ASM_KVX_ELF_H */
diff --git a/arch/kvx/include/asm/vermagic.h b/arch/kvx/include/asm/vermagic.h
new file mode 100644
index 000000000000..fef9a33065df
--- /dev/null
+++ b/arch/kvx/include/asm/vermagic.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2017-2023 Kalray Inc.
+ * Author(s): Clement Leger
+ */
+
+#ifndef _ASM_KVX_VERMAGIC_H
+#define _ASM_KVX_VERMAGIC_H
+
+#define MODULE_ARCH_VERMAGIC    "kvx"
+
+#endif /* _ASM_KVX_VERMAGIC_H */
diff --git a/arch/kvx/kernel/module.c b/arch/kvx/kernel/module.c
new file mode 100644
index 000000000000..b9383792ae45
--- /dev/null
+++ b/arch/kvx/kernel/module.c
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2017-2023 Kalray Inc.
+ * Author(s): Yann Sionneau
+ *            Clement Leger
+ */
+
+#include <linux/elf.h>
+#include <linux/moduleloader.h>
+#include <linux/overflow.h>
+
+
+static int apply_rela_bits(Elf64_Addr loc, Elf64_Addr val,
+				  int sign, int immsize, int bits, int rshift,
+				  int lshift, unsigned int relocnum,
+				  struct module *me)
+{
+	unsigned long long umax;
+	long long min, max;
+	unsigned long long mask = GENMASK_ULL(bits + lshift - 1, lshift);
+
+	if (sign) {
+		min = -(1ULL << (immsize - 1));
+		max = (1ULL << (immsize - 1)) - 1;
+		if ((long long) val < min || (long long) val > max)
+			goto too_big;
+		val = (Elf64_Addr)(((long) val) >> rshift);
+	} else {
+		if (immsize < 64)
+			umax = (1ULL << immsize) - 1;
+		else
+			umax = -1ULL;
+		if ((unsigned long long) val > umax)
+			goto too_big;
+		val >>= rshift;
+	}
+
+	val <<= lshift;
+	val &= mask;
+	if (bits <= 32)
+		*(u32 *) loc = (*(u32 *)loc & ~mask) | val;
+	else
+		*(u64 *) loc = (*(u64 *)loc & ~mask) | val;
+
+	return 0;
+too_big:
+	pr_err("%s: value %llx does not fit in %d bits for reloc %u",
+	       me->name, val, bits, relocnum);
+	return -ENOEXEC;
+}
+
+int apply_relocate_add(Elf64_Shdr *sechdrs,
+			   const char *strtab,
+			   unsigned int symindex,
+			   unsigned int relsec,
+			   struct module *me)
+{
+	unsigned int i;
+	Elf64_Addr loc;
+	u64 val;
+	s64 sval;
+	Elf64_Sym *sym;
+	Elf64_Rela *rel = (void *)sechdrs[relsec].sh_addr;
+	int ret = 0;
+
+	pr_debug("Applying relocate section %u to %u\n",
+			relsec, sechdrs[relsec].sh_info);
+
+	for (i = 0; i < sechdrs[relsec].sh_size / sizeof(*rel); i++) {
+		/* This is where to make the change */
+		loc = (Elf64_Addr)sechdrs[sechdrs[relsec].sh_info].sh_addr
+			+ rel[i].r_offset;
+		/* This is the symbol it is referring to.  Note that all
+		 *  undefined symbols have been resolved.
+		 */
+		sym = (Elf64_Sym *)sechdrs[symindex].sh_addr
+			+ ELF64_R_SYM(rel[i].r_info);
+
+		pr_debug("type %d st_value %llx r_addend %llx loc %llx offset %llx\n",
+			 (int)ELF64_R_TYPE(rel[i].r_info),
+			 sym->st_value, rel[i].r_addend, (uint64_t)loc,
+			 rel[i].r_offset);
+
+		val = sym->st_value + rel[i].r_addend;
+		switch (ELF64_R_TYPE(rel[i].r_info)) {
+		case R_KVX_NONE:
+			break;
+		case R_KVX_32:
+			ret = apply_rela_bits(loc, val, 0, 32, 32, 0, 0,
+					      ELF64_R_TYPE(rel[i].r_info),
+					      me);
+			break;
+		case R_KVX_64:
+			ret = apply_rela_bits(loc, val, 0, 64, 64, 0, 0,
+					      ELF64_R_TYPE(rel[i].r_info),
+					      me);
+			break;
+		case R_KVX_S43_LO10:
+			ret = apply_rela_bits(loc, val, 1, 43, 10, 0, 6,
+					      ELF64_R_TYPE(rel[i].r_info),
+					      me);
+			break;
+		case R_KVX_S64_LO10:
+			ret = apply_rela_bits(loc, val, 1, 64, 10, 0, 6,
+					      ELF64_R_TYPE(rel[i].r_info),
+					      me);
+			break;
+		case R_KVX_S43_UP27:
+			ret = apply_rela_bits(loc, val, 1, 43, 27, 10, 0,
+					      ELF64_R_TYPE(rel[i].r_info),
+					      me);
+			break;
+		case R_KVX_S64_UP27:
+			ret = apply_rela_bits(loc, val, 1, 64, 27, 10, 0,
+					      ELF64_R_TYPE(rel[i].r_info),
+					      me);
+			break;
+		case R_KVX_S43_EX6:
+			ret = apply_rela_bits(loc, val, 1, 43, 6, 37, 0,
+					      ELF64_R_TYPE(rel[i].r_info),
+					      me);
+			break;
+		case R_KVX_S64_EX27:
+			ret = apply_rela_bits(loc, val, 1, 64, 27, 37, 0,
+					      ELF64_R_TYPE(rel[i].r_info),
+					      me);
+			break;
+		case R_KVX_PCREL27:
+			if (__builtin_sub_overflow(val, loc, &sval)) {
+				pr_err("%s: Signed integer overflow, this should not happen\n",
+				       me->name);
+				return -ENOEXEC;
+			}
+			sval >>= 2;
+			ret = apply_rela_bits(loc, (Elf64_Addr)sval, 1, 27, 27,
+					      0, 0,
+					      ELF64_R_TYPE(rel[i].r_info),
+					      me);
+			break;
+		default:
+			pr_err("%s: Unknown relocation: %llu\n",
+				me->name, ELF64_R_TYPE(rel[i].r_info));
+			ret = -ENOEXEC;
+		}
+	}
+	return ret;
+}
+
-- 
2.37.2





--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

