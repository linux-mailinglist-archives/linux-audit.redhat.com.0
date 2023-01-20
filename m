Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9884D675D62
	for <lists+linux-audit@lfdr.de>; Fri, 20 Jan 2023 20:03:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674241388;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Gm1YnCai1AKIsR//N7ElhBkSzzVq7jQqPO72yLNQo9g=;
	b=dnalWQ1zeo+KpRRLAWdem6y18vZA9WOax0IF/n+8F1/WI7E7uiueglOqwjJCb8oPzY4Uhc
	zJiizvvsvYSNS8IsWNPB6Rvyn+UPPv5s/hL5Vp2DtPMeWpWJI+pvw3Nyl9fcgod19RB+5k
	1LsabMm8/wzN0m3D8ddqJpAfK1GYGxo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-210-oc0atf5-MX6KOUN58Xydjg-1; Fri, 20 Jan 2023 14:03:04 -0500
X-MC-Unique: oc0atf5-MX6KOUN58Xydjg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07C4A88B7BD;
	Fri, 20 Jan 2023 19:02:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E0204C15BAE;
	Fri, 20 Jan 2023 19:02:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 03E6F1946A6D;
	Fri, 20 Jan 2023 19:02:51 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CE6751946A6D for <linux-audit@listman.corp.redhat.com>;
 Fri, 20 Jan 2023 14:10:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BC907C159BB; Fri, 20 Jan 2023 14:10:35 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B3DD8C15BAD
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 14:10:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92127281DE82
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 14:10:35 +0000 (UTC)
Received: from fx408.security-mail.net (smtpout140.security-mail.net
 [85.31.212.148]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-503-nF87PntFPOiqCoXYM1N7Uw-1; Fri, 20 Jan 2023 09:10:34 -0500
X-MC-Unique: nF87PntFPOiqCoXYM1N7Uw-1
Received: from localhost (fx408.security-mail.net [127.0.0.1])
 by fx408.security-mail.net (Postfix) with ESMTP id 429D4322B8E
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 15:10:32 +0100 (CET)
Received: from fx408 (fx408.security-mail.net [127.0.0.1]) by
 fx408.security-mail.net (Postfix) with ESMTP id 06ADB322B21; Fri, 20 Jan
 2023 15:10:32 +0100 (CET)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx408.security-mail.net (Postfix) with ESMTPS id 2F716322939; Fri, 20 Jan
 2023 15:10:30 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id DEDF827E0442; Fri, 20 Jan 2023
 15:10:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id BA21327E043E; Fri, 20 Jan 2023 15:10:29 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 IVLBnrnY8q7M; Fri, 20 Jan 2023 15:10:29 +0100 (CET)
Received: from junon.lin.mbt.kalray.eu (unknown [192.168.37.161]) by
 zimbra2.kalray.eu (Postfix) with ESMTPSA id 3038927E0439; Fri, 20 Jan 2023
 15:10:29 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <8eb9.63caa0d6.2d305.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu BA21327E043E
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
Subject: [RFC PATCH v2 11/31] kvx: Add atomic/locking headers
Date: Fri, 20 Jan 2023 15:09:42 +0100
Message-ID: <20230120141002.2442-12-ysionneau@kalray.eu>
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

Add common headers (atomic, bitops, barrier and locking) for basic
kvx support.

Co-developed-by: Clement Leger <clement@clement-leger.fr>
Signed-off-by: Clement Leger <clement@clement-leger.fr>
Co-developed-by: Jules Maselbas <jmaselbas@kalray.eu>
Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
Co-developed-by: Julian Vetter <jvetter@kalray.eu>
Signed-off-by: Julian Vetter <jvetter@kalray.eu>
Co-developed-by: Julien Villette <jvillette@kalray.eu>
Signed-off-by: Julien Villette <jvillette@kalray.eu>
Co-developed-by: Yann Sionneau <ysionneau@kalray.eu>
Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
---

Notes:
    V1 -> V2:
     - use {READ,WRITE}_ONCE for arch_atomic64_{read,set}
     - use asm-generic/bitops/atomic.h instead of __test_and_*_bit
     - removed duplicated includes
     - rewrite xchg and cmpxchg in C using builtins for acswap insn

 arch/kvx/include/asm/atomic.h  | 104 ++++++++++++++++++++
 arch/kvx/include/asm/barrier.h |  15 +++
 arch/kvx/include/asm/bitops.h  | 115 ++++++++++++++++++++++
 arch/kvx/include/asm/bitrev.h  |  32 +++++++
 arch/kvx/include/asm/cmpxchg.h | 170 +++++++++++++++++++++++++++++++++
 5 files changed, 436 insertions(+)
 create mode 100644 arch/kvx/include/asm/atomic.h
 create mode 100644 arch/kvx/include/asm/barrier.h
 create mode 100644 arch/kvx/include/asm/bitops.h
 create mode 100644 arch/kvx/include/asm/bitrev.h
 create mode 100644 arch/kvx/include/asm/cmpxchg.h

diff --git a/arch/kvx/include/asm/atomic.h b/arch/kvx/include/asm/atomic.h
new file mode 100644
index 000000000000..bea3d70785b1
--- /dev/null
+++ b/arch/kvx/include/asm/atomic.h
@@ -0,0 +1,104 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2017-2023 Kalray Inc.
+ * Author(s): Clement Leger
+ */
+
+#ifndef _ASM_KVX_ATOMIC_H
+#define _ASM_KVX_ATOMIC_H
+
+#include <linux/types.h>
+
+#include <asm/cmpxchg.h>
+
+#define ATOMIC64_INIT(i)     { (i) }
+
+#define arch_atomic64_cmpxchg(v, old, new) (arch_cmpxchg(&((v)->counter), old, new))
+#define arch_atomic64_xchg(v, new) (arch_xchg(&((v)->counter), new))
+
+static inline long arch_atomic64_read(const atomic64_t *v)
+{
+	return READ_ONCE(v->counter);
+}
+
+static inline void arch_atomic64_set(atomic64_t *v, long i)
+{
+	WRITE_ONCE(v->counter, i);
+}
+
+#define ATOMIC64_RETURN_OP(op, c_op)					\
+static inline long arch_atomic64_##op##_return(long i, atomic64_t *v)	\
+{									\
+	long new, old, ret;						\
+									\
+	do {								\
+		old = v->counter;					\
+		new = old c_op i;					\
+		ret = arch_cmpxchg(&v->counter, old, new);		\
+	} while (ret != old);						\
+									\
+	return new;							\
+}
+
+#define ATOMIC64_OP(op, c_op)						\
+static inline void arch_atomic64_##op(long i, atomic64_t *v)		\
+{									\
+	long new, old, ret;						\
+									\
+	do {								\
+		old = v->counter;					\
+		new = old c_op i;					\
+		ret = arch_cmpxchg(&v->counter, old, new);		\
+	} while (ret != old);						\
+}
+
+#define ATOMIC64_FETCH_OP(op, c_op)					\
+static inline long arch_atomic64_fetch_##op(long i, atomic64_t *v)	\
+{									\
+	long new, old, ret;						\
+									\
+	do {								\
+		old = v->counter;					\
+		new = old c_op i;					\
+		ret = arch_cmpxchg(&v->counter, old, new);		\
+	} while (ret != old);						\
+									\
+	return old;							\
+}
+
+#define ATOMIC64_OPS(op, c_op)						\
+	ATOMIC64_OP(op, c_op)						\
+	ATOMIC64_RETURN_OP(op, c_op)					\
+	ATOMIC64_FETCH_OP(op, c_op)
+
+ATOMIC64_OPS(and, &)
+ATOMIC64_OPS(or, |)
+ATOMIC64_OPS(xor, ^)
+ATOMIC64_OPS(add, +)
+ATOMIC64_OPS(sub, -)
+
+#undef ATOMIC64_OPS
+#undef ATOMIC64_FETCH_OP
+#undef ATOMIC64_OP
+
+static inline int arch_atomic_add_return(int i, atomic_t *v)
+{
+	int new, old, ret;
+
+	do {
+		old = v->counter;
+		new = old + i;
+		ret = arch_cmpxchg(&v->counter, old, new);
+	} while (ret != old);
+
+	return new;
+}
+
+static inline int arch_atomic_sub_return(int i, atomic_t *v)
+{
+	return arch_atomic_add_return(-i, v);
+}
+
+#include <asm-generic/atomic.h>
+
+#endif	/* _ASM_KVX_ATOMIC_H */
diff --git a/arch/kvx/include/asm/barrier.h b/arch/kvx/include/asm/barrier.h
new file mode 100644
index 000000000000..371f1c70746d
--- /dev/null
+++ b/arch/kvx/include/asm/barrier.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2017-2023 Kalray Inc.
+ * Author(s): Clement Leger
+ */
+
+#ifndef _ASM_KVX_BARRIER_H
+#define _ASM_KVX_BARRIER_H
+
+/* fence is sufficient to guarantee write ordering */
+#define mb()	__builtin_kvx_fence()
+
+#include <asm-generic/barrier.h>
+
+#endif /* _ASM_KVX_BARRIER_H */
diff --git a/arch/kvx/include/asm/bitops.h b/arch/kvx/include/asm/bitops.h
new file mode 100644
index 000000000000..c643f4765059
--- /dev/null
+++ b/arch/kvx/include/asm/bitops.h
@@ -0,0 +1,115 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2017-2023 Kalray Inc.
+ * Author(s): Clement Leger
+ *            Yann Sionneau
+ */
+
+#ifndef _ASM_KVX_BITOPS_H
+#define _ASM_KVX_BITOPS_H
+
+#ifdef __KERNEL__
+
+#ifndef _LINUX_BITOPS_H
+#error only <linux/bitops.h> can be included directly
+#endif
+
+#include <asm/cmpxchg.h>
+
+static inline int fls(int x)
+{
+	return 32 - __builtin_kvx_clzw(x);
+}
+
+static inline int fls64(__u64 x)
+{
+	return 64 - __builtin_kvx_clzd(x);
+}
+
+/**
+ * __ffs - find first set bit in word
+ * @word: The word to search
+ *
+ * Undefined if no set bit exists, so code should check against 0 first.
+ */
+static inline unsigned long __ffs(unsigned long word)
+{
+	return __builtin_kvx_ctzd(word);
+}
+
+/**
+ * __fls - find last set bit in word
+ * @word: The word to search
+ *
+ * Undefined if no set bit exists, so code should check against 0 first.
+ */
+static inline unsigned long __fls(unsigned long word)
+{
+	return 63 - __builtin_kvx_clzd(word);
+}
+
+
+/**
+ * ffs - find first set bit in word
+ * @x: the word to search
+ *
+ * This is defined the same way as the libc and compiler builtin ffs
+ * routines, therefore differs in spirit from the other bitops.
+ *
+ * ffs(value) returns 0 if value is 0 or the position of the first
+ * set bit if value is nonzero. The first (least significant) bit
+ * is at position 1.
+ */
+static inline int ffs(int x)
+{
+	if (!x)
+		return 0;
+	return __builtin_kvx_ctzw(x) + 1;
+}
+
+static inline unsigned int __arch_hweight32(unsigned int w)
+{
+	unsigned int count;
+
+	asm volatile ("cbsw %0 = %1\n\t;;"
+	: "=r" (count)
+	: "r" (w));
+
+	return count;
+}
+
+static inline unsigned int __arch_hweight64(__u64 w)
+{
+	unsigned int count;
+
+	asm volatile ("cbsd %0 = %1\n\t;;"
+	: "=r" (count)
+	: "r" (w));
+
+	return count;
+}
+
+static inline unsigned int __arch_hweight16(unsigned int w)
+{
+	return __arch_hweight32(w & 0xffff);
+}
+
+static inline unsigned int __arch_hweight8(unsigned int w)
+{
+	return __arch_hweight32(w & 0xff);
+}
+
+#include <asm-generic/bitops/ffz.h>
+
+#include <asm-generic/bitops/sched.h>
+#include <asm-generic/bitops/const_hweight.h>
+
+#include <asm-generic/bitops/atomic.h>
+#include <asm-generic/bitops/non-atomic.h>
+#include <asm-generic/bitops/lock.h>
+#include <asm-generic/bitops/le.h>
+#include <asm-generic/bitops/ext2-atomic.h>
+
+#endif
+
+#endif
diff --git a/arch/kvx/include/asm/bitrev.h b/arch/kvx/include/asm/bitrev.h
new file mode 100644
index 000000000000..79865081905a
--- /dev/null
+++ b/arch/kvx/include/asm/bitrev.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2017-2023 Kalray Inc.
+ * Author(s): Clement Leger
+ */
+
+#ifndef _ASM_KVX_BITREV_H
+#define _ASM_KVX_BITREV_H
+
+#include <linux/swab.h>
+
+/* Bit reversal constant for matrix multiply */
+#define BIT_REVERSE 0x0102040810204080ULL
+
+static __always_inline __attribute_const__ u32 __arch_bitrev32(u32 x)
+{
+	/* Reverse all bits for each bytes and then byte-reverse the 32 LSB */
+	return swab32(__builtin_kvx_sbmm8(BIT_REVERSE, x));
+}
+
+static __always_inline __attribute_const__ u16 __arch_bitrev16(u16 x)
+{
+	/* Reverse all bits for each bytes and then byte-reverse the 16 LSB */
+	return swab16(__builtin_kvx_sbmm8(BIT_REVERSE, x));
+}
+
+static __always_inline __attribute_const__ u8 __arch_bitrev8(u8 x)
+{
+	return __builtin_kvx_sbmm8(BIT_REVERSE, x);
+}
+
+#endif
diff --git a/arch/kvx/include/asm/cmpxchg.h b/arch/kvx/include/asm/cmpxchg.h
new file mode 100644
index 000000000000..51ccb83757cc
--- /dev/null
+++ b/arch/kvx/include/asm/cmpxchg.h
@@ -0,0 +1,170 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2017-2023 Kalray Inc.
+ * Author(s): Clement Leger
+ *            Yann Sionneau
+ *            Jules Maselbas
+ */
+
+#ifndef _ASM_KVX_CMPXCHG_H
+#define _ASM_KVX_CMPXCHG_H
+
+#include <linux/bits.h>
+#include <linux/types.h>
+#include <linux/align.h>
+#include <linux/build_bug.h>
+
+/*
+ * On kvx, we have a boolean compare and swap which means that the operation
+ * returns only the success of operation.
+ * If operation succeed, this is simple, we just need to return the provided
+ * old value. However, if it fails, we need to load the value to return it for
+ * the caller. If the loaded value is different from the "old" provided by the
+ * caller, we can return it since it will means it failed.
+ * However, if for some reason the value we read is equal to the old value
+ * provided by the caller, we can't simply return it or the caller will think it
+ * succeeded. So if the value we read is the same as the "old" provided by
+ * the caller, we try again until either we succeed or we fail with a different
+ * value than the provided one.
+ */
+
+static inline unsigned int __cmpxchg_u32(unsigned int old, unsigned int new,
+					 volatile unsigned int *ptr)
+{
+	unsigned int exp = old;
+
+	__builtin_kvx_fence();
+	while (exp == old) {
+		if (__builtin_kvx_acswapw((void *)ptr, new, exp))
+			break; /* acswap succeed */
+		exp = *ptr;
+	}
+
+	return exp;
+}
+
+static inline unsigned long __cmpxchg_u64(unsigned long old, unsigned long new,
+					  volatile unsigned long *ptr)
+{
+	unsigned long exp = old;
+
+	__builtin_kvx_fence();
+	while (exp == old) {
+		if (__builtin_kvx_acswapd((void *)ptr, new, exp))
+			break; /* acswap succeed */
+		exp = *ptr;
+	}
+
+	return exp;
+}
+
+extern unsigned long __cmpxchg_called_with_bad_pointer(void)
+	__compiletime_error("Bad argument size for cmpxchg");
+
+static __always_inline unsigned long __cmpxchg(unsigned long old,
+					       unsigned long new,
+					       volatile void *ptr, int size)
+{
+	switch (size) {
+	case 4:
+		return __cmpxchg_u32(old, new, ptr);
+	case 8:
+		return __cmpxchg_u64(old, new, ptr);
+	default:
+		return __cmpxchg_called_with_bad_pointer();
+	}
+}
+
+#define arch_cmpxchg(ptr, old, new)					\
+	((__typeof__(*(ptr))) __cmpxchg(				\
+		(unsigned long)(old), (unsigned long)(new),		\
+		(ptr), sizeof(*(ptr))))
+
+/*
+ * In order to optimize xchg for 16 byte, we can use insf/extfs if we know the
+ * bounds. This way, we only take one more bundle than standard xchg.
+ * We simply do a read modify acswap on a 32 bit word.
+ */
+
+#define __kvx_insf(org, val, start, stop) __asm__ __volatile__(	\
+		"insf %[_org] = %[_val], %[_stop], %[_start]\n\t;;"	\
+		: [_org]"+r"(org)					\
+		: [_val]"r"(val), [_stop]"i"(stop), [_start]"i"(start))
+
+#define __kvx_extfz(out, val, start, stop) __asm__ __volatile__(	\
+		"extfz %[_out] = %[_val], %[_stop], %[_start]\n\t;;"	\
+		: [_out]"=r"(out)					\
+		: [_val]"r"(val), [_stop]"i"(stop), [_start]"i"(start))
+
+/* Needed for generic qspinlock implementation */
+static inline unsigned int __xchg_u16(unsigned int old, unsigned int new,
+				      volatile unsigned int *ptr)
+{
+	unsigned int off = ((unsigned long)ptr) % sizeof(unsigned int);
+	unsigned int val;
+
+	ptr = PTR_ALIGN_DOWN(ptr, sizeof(unsigned int));
+	__builtin_kvx_fence();
+	do {
+		old = *ptr;
+		val = old;
+		if (off == 0)
+			__kvx_insf(val, new, 0, 15);
+		else
+			__kvx_insf(val, new, 16, 31);
+	} while (!__builtin_kvx_acswapw((void *)ptr, val, old));
+
+	if (off == 0)
+		__kvx_extfz(old, old, 0, 15);
+	else
+		__kvx_extfz(old, old, 16, 31);
+
+	return old;
+}
+
+static inline unsigned int __xchg_u32(unsigned int old, unsigned int new,
+				      volatile unsigned int *ptr)
+{
+	__builtin_kvx_fence();
+	do
+		old = *ptr;
+	while (!__builtin_kvx_acswapw((void *)ptr, new, old));
+
+	return old;
+}
+
+static inline unsigned long __xchg_u64(unsigned long old, unsigned long new,
+				       volatile unsigned long *ptr)
+{
+	__builtin_kvx_fence();
+	do
+		old = *ptr;
+	while (!__builtin_kvx_acswapd((void *)ptr, new, old));
+
+	return old;
+}
+
+extern unsigned long __xchg_called_with_bad_pointer(void)
+	__compiletime_error("Bad argument size for xchg");
+
+static __always_inline unsigned long __xchg(unsigned long val,
+					    volatile void *ptr, int size)
+{
+	switch (size) {
+	case 2:
+		return __xchg_u16(0, val, ptr);
+	case 4:
+		return __xchg_u32(0, val, ptr);
+	case 8:
+		return __xchg_u64(0, val, ptr);
+	default:
+		return __xchg_called_with_bad_pointer();
+	}
+}
+
+#define arch_xchg(ptr, val)						\
+	((__typeof__(*(ptr))) __xchg(					\
+		(unsigned long)(val),					\
+		(ptr), sizeof(*(ptr))))
+
+#endif
-- 
2.37.2





--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

