Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E179B675D79
	for <lists+linux-audit@lfdr.de>; Fri, 20 Jan 2023 20:03:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674241401;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HKMolucf0pZRYmgENQ3GoKW+Zuq9ejlcjXS+yAJhLgU=;
	b=P5zMjbrMZPqy+nkAdlcKS6kd+96tVl8px88RWoMHEmUwWHwPuKVPxfQwdKTbfnUljF0A2k
	VFgenIe2vGLuRdQVCDdD1gzO4jwuaCpfMGym/kc9SZB5myjSKV8MTLkqufrkK6fTVobD+Y
	j6hqDpIuoQhEvkqf5EFwIr3U/q1zwM0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-9oSZ7KryMmuIR77m83owmA-1; Fri, 20 Jan 2023 14:03:17 -0500
X-MC-Unique: 9oSZ7KryMmuIR77m83owmA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7EECB3C14103;
	Fri, 20 Jan 2023 19:02:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 65B49492B03;
	Fri, 20 Jan 2023 19:02:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5B1221946588;
	Fri, 20 Jan 2023 19:02:56 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1162B1946588 for <linux-audit@listman.corp.redhat.com>;
 Fri, 20 Jan 2023 15:25:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E698D2026D2B; Fri, 20 Jan 2023 15:25:47 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE4902026D68
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 15:25:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD30788B7D7
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 15:25:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172]) by
 relay.mimecast.com with ESMTP id us-mta-277-gccQkcHKNA-QTjhFs_G--A-1; Fri,
 20 Jan 2023 10:25:43 -0500
X-MC-Unique: gccQkcHKNA-QTjhFs_G--A-1
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B62521515;
 Fri, 20 Jan 2023 07:19:46 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.11.233])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 175CD3F67D;
 Fri, 20 Jan 2023 07:18:55 -0800 (PST)
Date: Fri, 20 Jan 2023 15:18:48 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Yann Sionneau <ysionneau@kalray.eu>
Subject: Re: [RFC PATCH v2 11/31] kvx: Add atomic/locking headers
Message-ID: <Y8qw2MaCJZzu3Ows@FVFF77S0Q05N>
References: <20230120141002.2442-1-ysionneau@kalray.eu>
 <20230120141002.2442-12-ysionneau@kalray.eu>
MIME-Version: 1.0
In-Reply-To: <20230120141002.2442-12-ysionneau@kalray.eu>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Marc =?utf-8?B?UG91bGhpw6hz?= <dkm@kataplop.net>, linux-doc@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Atish Patra <atishp@atishpatra.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Julien Hascoet <jhascoet@kalray.eu>,
 Clement Leger <clement@clement-leger.fr>, linux-mm@kvack.org,
 devicetree@vger.kernel.org, Louis Morhet <lmorhet@kalray.eu>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Guangbin Huang <huangguangbin2@huawei.com>, Alex Michon <amichon@kalray.eu>,
 Thomas Costis <tcostis@kalray.eu>, Jonathan Corbet <corbet@lwn.net>,
 Jonathan Borne <jborne@kalray.eu>, Marc Zyngier <maz@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, bpf@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-arch@vger.kernel.org,
 Jean-Christophe Pince <jcpince@gmail.com>, Waiman Long <longman@redhat.com>,
 Bharat Bhushan <bbhushan2@marvell.com>, Qi Liu <liuqi115@huawei.com>,
 Alexey Dobriyan <adobriyan@gmail.com>, Luc Michel <lmichel@kalray.eu>,
 John Garry <john.garry@huawei.com>, Ashley Lesdalons <alesdalons@kalray.eu>,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Samuel Jones <sjones@kalray.eu>,
 Boqun Feng <boqun.feng@gmail.com>, Guillaume Thouvenin <gthouvenin@kalray.eu>,
 Julian Vetter <jvetter@kalray.eu>, Nick Piggin <npiggin@gmail.com>,
 Shaokun Zhang <zhangshaokun@hisilicon.com>, Rob Herring <robh+dt@kernel.org>,
 Bibo Mao <maobibo@loongson.cn>, Paul Walmsley <paul.walmsley@sifive.com>,
 WANG Xuerui <git@xen0n.name>, linux-audit@redhat.com,
 Thomas Gleixner <tglx@linutronix.de>, Marius Gligor <mgligor@kalray.eu>,
 Janosch Frank <frankja@linux.ibm.com>, Julien Villette <jvillette@kalray.eu>,
 Jules Maselbas <jmaselbas@kalray.eu>, Christian Brauner <brauner@kernel.org>,
 Benjamin Mugnier <mugnier.benjamin@gmail.com>,
 Vincent Chardon <vincent.chardon@elsys-design.com>,
 Guillaume Missonnier <gmissonnier@kalray.eu>, Oleg Nesterov <oleg@redhat.com>,
 Eric Paris <eparis@redhat.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Eric Biederman <ebiederm@xmission.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 20, 2023 at 03:09:42PM +0100, Yann Sionneau wrote:
> Add common headers (atomic, bitops, barrier and locking) for basic
> kvx support.
> 
> Co-developed-by: Clement Leger <clement@clement-leger.fr>
> Signed-off-by: Clement Leger <clement@clement-leger.fr>
> Co-developed-by: Jules Maselbas <jmaselbas@kalray.eu>
> Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
> Co-developed-by: Julian Vetter <jvetter@kalray.eu>
> Signed-off-by: Julian Vetter <jvetter@kalray.eu>
> Co-developed-by: Julien Villette <jvillette@kalray.eu>
> Signed-off-by: Julien Villette <jvillette@kalray.eu>
> Co-developed-by: Yann Sionneau <ysionneau@kalray.eu>
> Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
> ---
> 
> Notes:
>     V1 -> V2:
>      - use {READ,WRITE}_ONCE for arch_atomic64_{read,set}
>      - use asm-generic/bitops/atomic.h instead of __test_and_*_bit
>      - removed duplicated includes
>      - rewrite xchg and cmpxchg in C using builtins for acswap insn

Thanks for those changes. I see one issue below (instantiated a few times), but
other than that this looks good to me.

[...]

> +#define ATOMIC64_RETURN_OP(op, c_op)					\
> +static inline long arch_atomic64_##op##_return(long i, atomic64_t *v)	\
> +{									\
> +	long new, old, ret;						\
> +									\
> +	do {								\
> +		old = v->counter;					\

This should be arch_atomic64_read(v), in order to avoid the potential for the
compiler to replay the access and introduce ABA races and other such problems.

For details, see:

  https://lore.kernel.org/lkml/Y70SWXHDmOc3RhMd@osiris/
  https://lore.kernel.org/lkml/Y71LoCIl+IFdy9D8@FVFF77S0Q05N/

I see that the generic 32-bit atomic code suffers from that issue, and we
should fix it.

> +		new = old c_op i;					\
> +		ret = arch_cmpxchg(&v->counter, old, new);		\
> +	} while (ret != old);						\
> +									\
> +	return new;							\
> +}
> +
> +#define ATOMIC64_OP(op, c_op)						\
> +static inline void arch_atomic64_##op(long i, atomic64_t *v)		\
> +{									\
> +	long new, old, ret;						\
> +									\
> +	do {								\
> +		old = v->counter;					\

Likewise, arch_atomic64_read(v) here.

> +		new = old c_op i;					\
> +		ret = arch_cmpxchg(&v->counter, old, new);		\
> +	} while (ret != old);						\
> +}
> +
> +#define ATOMIC64_FETCH_OP(op, c_op)					\
> +static inline long arch_atomic64_fetch_##op(long i, atomic64_t *v)	\
> +{									\
> +	long new, old, ret;						\
> +									\
> +	do {								\
> +		old = v->counter;					\

Likewise, arch_atomic64_read(v) here.

> +		new = old c_op i;					\
> +		ret = arch_cmpxchg(&v->counter, old, new);		\
> +	} while (ret != old);						\
> +									\
> +	return old;							\
> +}
> +
> +#define ATOMIC64_OPS(op, c_op)						\
> +	ATOMIC64_OP(op, c_op)						\
> +	ATOMIC64_RETURN_OP(op, c_op)					\
> +	ATOMIC64_FETCH_OP(op, c_op)
> +
> +ATOMIC64_OPS(and, &)
> +ATOMIC64_OPS(or, |)
> +ATOMIC64_OPS(xor, ^)
> +ATOMIC64_OPS(add, +)
> +ATOMIC64_OPS(sub, -)
> +
> +#undef ATOMIC64_OPS
> +#undef ATOMIC64_FETCH_OP
> +#undef ATOMIC64_OP
> +
> +static inline int arch_atomic_add_return(int i, atomic_t *v)
> +{
> +	int new, old, ret;
> +
> +	do {
> +		old = v->counter;

Likewise, arch_atomic64_read(v) here.

> +		new = old + i;
> +		ret = arch_cmpxchg(&v->counter, old, new);
> +	} while (ret != old);
> +
> +	return new;
> +}
> +
> +static inline int arch_atomic_sub_return(int i, atomic_t *v)
> +{
> +	return arch_atomic_add_return(-i, v);
> +}
> +
> +#include <asm-generic/atomic.h>
> +
> +#endif	/* _ASM_KVX_ATOMIC_H */

Otherwise, the atomics look good to me.

Thanks,
Mark.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

