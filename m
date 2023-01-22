Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDA6678476
	for <lists+linux-audit@lfdr.de>; Mon, 23 Jan 2023 19:22:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674498121;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jf2K7cc031oU6vEvSfdGa7LBRO3icsTVEOvQ0XrWZy8=;
	b=KPt3tQxvyyjkyVRfeQQegITpmMgTiGTGYibXIQF/jLczwEBemfhyHpZeLKtyg99MUzHjZX
	81GjrMu77RCD0dxTQRu0ePYRVqLq+cThMqhxXFF3Mg3Kj7ByTC7QyFusZCJMhgxaFW5sVX
	eHOGNohJ3HMbhDOywraEmc5v0LU59YE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-qsn5Hy8nMDO8V2q3ent2GA-1; Mon, 23 Jan 2023 13:22:00 -0500
X-MC-Unique: qsn5Hy8nMDO8V2q3ent2GA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6ACAA1C08781;
	Mon, 23 Jan 2023 18:21:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7F778C15BAD;
	Mon, 23 Jan 2023 18:21:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 33E231946589;
	Mon, 23 Jan 2023 18:21:48 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E78D01946587 for <linux-audit@listman.corp.redhat.com>;
 Sun, 22 Jan 2023 16:10:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CFA894221F; Sun, 22 Jan 2023 16:09:57 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C6BEE175AD
 for <linux-audit@redhat.com>; Sun, 22 Jan 2023 16:09:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F61C857D0D
 for <linux-audit@redhat.com>; Sun, 22 Jan 2023 16:09:57 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-6DO6VzOrOVCL3fOxitc1Gg-1; Sun, 22 Jan 2023 11:09:53 -0500
X-MC-Unique: 6DO6VzOrOVCL3fOxitc1Gg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9BF5AB80B1F;
 Sun, 22 Jan 2023 16:09:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 378B5C433D2;
 Sun, 22 Jan 2023 16:09:29 +0000 (UTC)
Date: Sun, 22 Jan 2023 18:09:19 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Yann Sionneau <ysionneau@kalray.eu>
Subject: Re: [RFC PATCH v2 20/31] kvx: Add memory management
Message-ID: <Y81fr4qewOpj5lQl@kernel.org>
References: <20230120141002.2442-1-ysionneau@kalray.eu>
 <20230120141002.2442-21-ysionneau@kalray.eu>
MIME-Version: 1.0
In-Reply-To: <20230120141002.2442-21-ysionneau@kalray.eu>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Mon, 23 Jan 2023 18:21:47 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Marc =?iso-8859-1?Q?Poulhi=E8s?= <dkm@kataplop.net>, linux-doc@vger.kernel.org,
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 20, 2023 at 03:09:51PM +0100, Yann Sionneau wrote:
> Add memory management support for kvx, including: cache and tlb
> management, page fault handling, ioremap/mmap and streaming dma support.
>=20
> Co-developed-by: Clement Leger <clement@clement-leger.fr>
> Signed-off-by: Clement Leger <clement@clement-leger.fr>
> Co-developed-by: Guillaume Thouvenin <gthouvenin@kalray.eu>
> Signed-off-by: Guillaume Thouvenin <gthouvenin@kalray.eu>
> Co-developed-by: Jean-Christophe Pince <jcpince@gmail.com>
> Signed-off-by: Jean-Christophe Pince <jcpince@gmail.com>
> Co-developed-by: Jules Maselbas <jmaselbas@kalray.eu>
> Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
> Co-developed-by: Julian Vetter <jvetter@kalray.eu>
> Signed-off-by: Julian Vetter <jvetter@kalray.eu>
> Co-developed-by: Julien Hascoet <jhascoet@kalray.eu>
> Signed-off-by: Julien Hascoet <jhascoet@kalray.eu>
> Co-developed-by: Louis Morhet <lmorhet@kalray.eu>
> Signed-off-by: Louis Morhet <lmorhet@kalray.eu>
> Co-developed-by: Marc Poulhi=E8s <dkm@kataplop.net>
> Signed-off-by: Marc Poulhi=E8s <dkm@kataplop.net>
> Co-developed-by: Marius Gligor <mgligor@kalray.eu>
> Signed-off-by: Marius Gligor <mgligor@kalray.eu>
> Co-developed-by: Vincent Chardon <vincent.chardon@elsys-design.com>
> Signed-off-by: Vincent Chardon <vincent.chardon@elsys-design.com>
> Co-developed-by: Yann Sionneau <ysionneau@kalray.eu>
> Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
> ---
>=20
> Notes:
>     V1 -> V2: removed L2 cache management
>=20
>  arch/kvx/include/asm/cache.h        |  43 +++
>  arch/kvx/include/asm/cacheflush.h   | 158 ++++++++++
>  arch/kvx/include/asm/fixmap.h       |  47 +++
>  arch/kvx/include/asm/hugetlb.h      |  36 +++
>  arch/kvx/include/asm/mem_map.h      |  44 +++
>  arch/kvx/include/asm/mmu.h          | 289 ++++++++++++++++++
>  arch/kvx/include/asm/mmu_context.h  | 156 ++++++++++
>  arch/kvx/include/asm/mmu_stats.h    |  38 +++
>  arch/kvx/include/asm/page.h         | 187 ++++++++++++
>  arch/kvx/include/asm/page_size.h    |  29 ++
>  arch/kvx/include/asm/pgalloc.h      | 101 +++++++
>  arch/kvx/include/asm/pgtable-bits.h | 102 +++++++
>  arch/kvx/include/asm/pgtable.h      | 451 ++++++++++++++++++++++++++++
>  arch/kvx/include/asm/rm_fw.h        |  16 +
>  arch/kvx/include/asm/sparsemem.h    |  15 +
>  arch/kvx/include/asm/symbols.h      |  16 +
>  arch/kvx/include/asm/tlb.h          |  24 ++
>  arch/kvx/include/asm/tlb_defs.h     | 131 ++++++++
>  arch/kvx/include/asm/tlbflush.h     |  58 ++++
>  arch/kvx/include/asm/vmalloc.h      |  10 +
>  arch/kvx/mm/cacheflush.c            | 154 ++++++++++
>  arch/kvx/mm/dma-mapping.c           |  85 ++++++
>  arch/kvx/mm/extable.c               |  24 ++
>  arch/kvx/mm/fault.c                 | 264 ++++++++++++++++
>  arch/kvx/mm/init.c                  | 277 +++++++++++++++++
>  arch/kvx/mm/mmap.c                  |  31 ++
>  arch/kvx/mm/mmu.c                   | 202 +++++++++++++
>  arch/kvx/mm/mmu_stats.c             |  94 ++++++
>  arch/kvx/mm/tlb.c                   | 433 ++++++++++++++++++++++++++
>  29 files changed, 3515 insertions(+)
>  create mode 100644 arch/kvx/include/asm/cache.h
>  create mode 100644 arch/kvx/include/asm/cacheflush.h
>  create mode 100644 arch/kvx/include/asm/fixmap.h
>  create mode 100644 arch/kvx/include/asm/hugetlb.h
>  create mode 100644 arch/kvx/include/asm/mem_map.h
>  create mode 100644 arch/kvx/include/asm/mmu.h
>  create mode 100644 arch/kvx/include/asm/mmu_context.h
>  create mode 100644 arch/kvx/include/asm/mmu_stats.h
>  create mode 100644 arch/kvx/include/asm/page.h
>  create mode 100644 arch/kvx/include/asm/page_size.h
>  create mode 100644 arch/kvx/include/asm/pgalloc.h
>  create mode 100644 arch/kvx/include/asm/pgtable-bits.h
>  create mode 100644 arch/kvx/include/asm/pgtable.h
>  create mode 100644 arch/kvx/include/asm/rm_fw.h
>  create mode 100644 arch/kvx/include/asm/sparsemem.h
>  create mode 100644 arch/kvx/include/asm/symbols.h
>  create mode 100644 arch/kvx/include/asm/tlb.h
>  create mode 100644 arch/kvx/include/asm/tlb_defs.h
>  create mode 100644 arch/kvx/include/asm/tlbflush.h
>  create mode 100644 arch/kvx/include/asm/vmalloc.h
>  create mode 100644 arch/kvx/mm/cacheflush.c
>  create mode 100644 arch/kvx/mm/dma-mapping.c
>  create mode 100644 arch/kvx/mm/extable.c
>  create mode 100644 arch/kvx/mm/fault.c
>  create mode 100644 arch/kvx/mm/init.c
>  create mode 100644 arch/kvx/mm/mmap.c
>  create mode 100644 arch/kvx/mm/mmu.c
>  create mode 100644 arch/kvx/mm/mmu_stats.c
>  create mode 100644 arch/kvx/mm/tlb.c

...=20

> diff --git a/arch/kvx/include/asm/mmu.h b/arch/kvx/include/asm/mmu.h
> new file mode 100644
> index 000000000000..09f3fdd66a34
> --- /dev/null
> +++ b/arch/kvx/include/asm/mmu.h
> @@ -0,0 +1,289 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2017-2023 Kalray Inc.
> + * Author(s): Guillaume Thouvenin
> + *            Clement Leger
> + *            Marc Poulhi=E8s
> + */
> +
> +#ifndef _ASM_KVX_MMU_H
> +#define _ASM_KVX_MMU_H
> +
> +#include <linux/bug.h>
> +#include <linux/types.h>
> +#include <linux/threads.h>
> +
> +#include <asm/page.h>
> +#include <asm/sfr.h>
> +#include <asm/page.h>
> +#include <asm/pgtable-bits.h>
> +#include <asm/tlb_defs.h>
> +
> +/* Virtual addresses can use at most 41 bits */
> +#define MMU_VIRT_BITS=09=0941
> +
> +/*
> + * See Documentation/kvx/kvx-mmu.txt for details about the division of t=
he
> + * virtual memory space.
> + */
> +#if defined(CONFIG_KVX_4K_PAGES)
> +#define MMU_USR_ADDR_BITS=0939
> +#else
> +#error "Only 4Ko page size is supported at this time"
> +#endif
> +
> +typedef struct mm_context {
> +=09unsigned long end_brk;
> +=09unsigned long asn[NR_CPUS];
> +=09unsigned long sigpage;
> +} mm_context_t;
> +
> +struct __packed tlb_entry_low {
> +=09unsigned int es:2;       /* Entry Status */
> +=09unsigned int cp:2;       /* Cache Policy */
> +=09unsigned int pa:4;       /* Protection Attributes */
> +=09unsigned int r:2;        /* Reserved */
> +=09unsigned int ps:2;       /* Page Size */
> +=09unsigned int fn:28;      /* Frame Number */
> +};
> +
> +struct __packed tlb_entry_high {
> +=09unsigned int asn:9;  /* Address Space Number */
> +=09unsigned int g:1;    /* Global Indicator */
> +=09unsigned int vs:2;   /* Virtual Space */
> +=09unsigned int pn:29;  /* Page Number */
> +};
> +
> +struct kvx_tlb_format {
> +=09union {
> +=09=09struct tlb_entry_low tel;
> +=09=09uint64_t tel_val;
> +=09};
> +=09union {
> +=09=09struct tlb_entry_high teh;
> +=09=09uint64_t teh_val;
> +=09};
> +};

I believe tlb_entry is a better name and unless I've missed something, this
struct is only used internally in arch/kvx/mm, so it'd be better to declare
it in a header at arch/kvx/mm.

Generally, it's better to move internal definitions out of include/asm and
have them near the .c files that use them. For instance, I randomly picked
several functions below, e.g. kvx_mmu_probetlb(), tlb_entry_overlaps(), and
it seems they are only used in arch/kvx/mm.

> +
> +#define KVX_EMPTY_TLB_ENTRY { .tel_val =3D 0x0, .teh_val =3D 0x0 }
> +
> +/* Bit [0:39] of the TLB format corresponds to TLB Entry low */
> +/* Bit [40:80] of the TLB format corresponds to the TLB Entry high */
> +#define kvx_mmu_set_tlb_entry(tlbf) do { \
> +=09kvx_sfr_set(TEL, (uint64_t) tlbf.tel_val); \
> +=09kvx_sfr_set(TEH, (uint64_t) tlbf.teh_val); \
> +} while (0)
> +
> +#define kvx_mmu_get_tlb_entry(tlbf) do { \
> +=09tlbf.tel_val =3D kvx_sfr_get(TEL); \
> +=09tlbf.teh_val =3D kvx_sfr_get(TEH); \
> +} while (0)
> +
> +/* Use kvx_mmc_ to read a field from MMC value passed as parameter */
> +#define __kvx_mmc(mmc_reg, field) \
> +=09kvx_sfr_field_val(mmc_reg, MMC, field)
> +

...

> diff --git a/arch/kvx/include/asm/mmu_context.h b/arch/kvx/include/asm/mm=
u_context.h
> new file mode 100644
> index 000000000000..39fa92f1506b
> --- /dev/null
> +++ b/arch/kvx/include/asm/mmu_context.h
> @@ -0,0 +1,156 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2017-2023 Kalray Inc.
> + * Author(s): Clement Leger
> + *            Guillaume Thouvenin
> + */
> +
> +#ifndef __ASM_KVX_MMU_CONTEXT_H
> +#define __ASM_KVX_MMU_CONTEXT_H
> +
> +/*
> + * Management of the Address Space Number:
> + * Coolidge architecture provides a 9-bit ASN to tag TLB entries. This c=
an be
> + * used to allow several entries with the same virtual address (so from
> + * different process) to be in the TLB at the same time. That means that=
 won't
> + * necessarily flush the TLB when a context switch occurs and so it will
> + * improve performances.
> + */
> +#include <linux/smp.h>
> +
> +#include <asm/mmu.h>
> +#include <asm/sfr_defs.h>
> +#include <asm/tlbflush.h>
> +
> +#include <asm-generic/mm_hooks.h>

...

> +/**
> + * Redefining the generic hooks that are:
> + *   - activate_mm
> + *   - deactivate_mm
> + *   - enter_lazy_tlb
> + *   - init_new_context
> + *   - destroy_context
> + *   - switch_mm
> + */

Please drop this comment, it does not add any information
> +
> +#define activate_mm(prev, next) switch_mm((prev), (next), NULL)
> +#define deactivate_mm(tsk, mm) do { } while (0)
> +#define enter_lazy_tlb(mm, tsk) do { } while (0)
> +

...

> +#endif /* __ASM_KVX_MMU_CONTEXT_H */
> diff --git a/arch/kvx/include/asm/mmu_stats.h b/arch/kvx/include/asm/mmu_=
stats.h
> new file mode 100644
> index 000000000000..999352dbc1ce

Looks like this entire header can be moved to arch/kvx/mm

> --- /dev/null
> +++ b/arch/kvx/include/asm/mmu_stats.h
> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2017-2023 Kalray Inc.
> + * Author(s): Clement Leger
> + */
> +
> +#ifndef _ASM_KVX_MMU_STATS_H
> +#define _ASM_KVX_MMU_STATS_H
> +
> +#ifdef CONFIG_KVX_MMU_STATS
> +#include <linux/percpu.h>
> +
> +struct mmu_refill_stats {
> +=09unsigned long count;
> +=09unsigned long total;
> +=09unsigned long min;
> +=09unsigned long max;
> +};
> +
> +enum mmu_refill_type {
> +=09MMU_REFILL_TYPE_USER,
> +=09MMU_REFILL_TYPE_KERNEL,
> +=09MMU_REFILL_TYPE_KERNEL_DIRECT,
> +=09MMU_REFILL_TYPE_COUNT,
> +};
> +
> +struct mmu_stats {
> +=09struct mmu_refill_stats refill[MMU_REFILL_TYPE_COUNT];
> +=09/* keep these fields ordered this way for assembly */
> +=09unsigned long cycles_between_refill;
> +=09unsigned long last_refill;
> +=09unsigned long tlb_flush_all;
> +};
> +
> +DECLARE_PER_CPU(struct mmu_stats, mmu_stats);
> +#endif
> +
> +#endif /* _ASM_KVX_MMU_STATS_H */

...

> diff --git a/arch/kvx/include/asm/pgalloc.h b/arch/kvx/include/asm/pgallo=
c.h
> new file mode 100644
> index 000000000000..0e654dd1a072
> --- /dev/null
> +++ b/arch/kvx/include/asm/pgalloc.h
> @@ -0,0 +1,101 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2017-2023 Kalray Inc.
> + * Author(s): Guillaume Thouvenin
> + *            Clement Leger
> + */
> +
> +#ifndef _ASM_KVX_PGALLOC_H
> +#define _ASM_KVX_PGALLOC_H
> +
> +#include <linux/mm.h>
> +#include <asm/tlb.h>
> +
> +#define __HAVE_ARCH_PGD_FREE
> +#include <asm-generic/pgalloc.h>=09/* for pte_{alloc,free}_one */
> +
> +static inline void check_pgt_cache(void)
> +{
> +=09/*
> +=09 * check_pgt_cache() is called to check watermarks from counters that
> +=09 * computes the number of pages allocated by cached allocation functi=
ons
> +=09 * pmd_alloc_one_fast() and pte_alloc_one_fast().
> +=09 * Currently we just skip this test.
> +=09 */

It seems this function is never called.

> +}
> +
> +/**
> + * PGD
> + */

Please drop these comments (here and for lower levels as well), they don't
add information but only take space.

> +
> +static inline void
> +pgd_free(struct mm_struct *mm, pgd_t *pgd)
> +{
> +=09free_pages((unsigned long) pgd, PAGES_PER_PGD);
> +}
> +
> +static inline
> +pgd_t *pgd_alloc(struct mm_struct *mm)
> +{
> +=09pgd_t *pgd;
> +
> +=09pgd =3D (pgd_t *) __get_free_pages(GFP_KERNEL, PAGES_PER_PGD);
> +=09if (unlikely(pgd =3D=3D NULL))
> +=09=09return NULL;
> +
> +=09memset(pgd, 0, USER_PTRS_PER_PGD * sizeof(pgd_t));
> +
> +=09/* Copy kernel mappings */
> +=09memcpy(pgd + USER_PTRS_PER_PGD,
> +=09       init_mm.pgd + USER_PTRS_PER_PGD,
> +=09       (PTRS_PER_PGD - USER_PTRS_PER_PGD) * sizeof(pgd_t));
> +
> +=09return pgd;
> +}
> +
> +/**
> + * PUD
> + */
> +
> +static inline void pud_populate(struct mm_struct *mm, pud_t *pud, pmd_t =
*pmd)
> +{
> +=09unsigned long pfn =3D virt_to_pfn(pmd);
> +
> +=09set_pud(pud, __pud((unsigned long)pfn << PAGE_SHIFT));
> +}
> +
> +/**
> + * PMD
> + */
> +
> +static inline void pmd_populate_kernel(struct mm_struct *mm,
> +=09pmd_t *pmd, pte_t *pte)
> +{
> +=09unsigned long pfn =3D virt_to_pfn(pte);
> +
> +=09set_pmd(pmd, __pmd((unsigned long)pfn << PAGE_SHIFT));
> +}
> +
> +static inline void pmd_populate(struct mm_struct *mm,
> +=09pmd_t *pmd, pgtable_t pte)
> +{
> +=09unsigned long pfn =3D virt_to_pfn(page_address(pte));
> +
> +=09set_pmd(pmd, __pmd((unsigned long)pfn << PAGE_SHIFT));
> +}
> +
> +#if CONFIG_PGTABLE_LEVELS > 2
> +#define __pmd_free_tlb(tlb, pmd, addr) pmd_free((tlb)->mm, pmd)
> +#endif /* CONFIG_PGTABLE_LEVELS > 2 */
> +
> +/**
> + * PTE
> + */
> +
> +#define __pte_free_tlb(tlb, pte, buf)   \
> +do {                                    \
> +=09pgtable_pte_page_dtor(pte);         \
> +=09tlb_remove_page((tlb), pte);    \
> +} while (0)
> +
> +#endif /* _ASM_KVX_PGALLOC_H */

...

> diff --git a/arch/kvx/include/asm/pgtable.h b/arch/kvx/include/asm/pgtabl=
e.h
> new file mode 100644
> index 000000000000..9e36db4d98a7
> --- /dev/null
> +++ b/arch/kvx/include/asm/pgtable.h
> @@ -0,0 +1,451 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2017-2023 Kalray Inc.
> + * Author(s): Guillaume Thouvenin
> + *            Clement Leger
> + *            Marius Gligor
> + *            Yann Sionneau
> + */
> +
> +#ifndef _ASM_KVX_PGTABLE_H
> +#define _ASM_KVX_PGTABLE_H
> +

...

> +
> +/*
> + * PGD definitions:
> + *   - pgd_ERROR
> + */

With macro name pgd_ERROR, it's already clear that this is pgd_ERROR.
Please drop the comment.

> +#define pgd_ERROR(e) \
> +=09pr_err("%s:%d: bad pgd %016lx.\n", __FILE__, __LINE__, pgd_val(e))
> +
> +/*
> + * PUD
> + *
> + * As we manage a three level page table the call to set_pud is used to =
fill
> + * PGD.
> + */
> +static inline void set_pud(pud_t *pudp, pud_t pmd)
> +{
> +=09*pudp =3D pmd;
> +}
> +
> +static inline int pud_none(pud_t pud)
> +{
> +=09return pud_val(pud) =3D=3D 0;
> +}
> +
> +static inline int pud_bad(pud_t pud)
> +{
> +=09return pud_none(pud);
> +}
> +static inline int pud_present(pud_t pud)
> +{
> +=09return pud_val(pud) !=3D 0;
> +}
> +
> +static inline void pud_clear(pud_t *pud)
> +{
> +=09set_pud(pud, __pud(0));
> +}
> +
> +/*
> + * PMD definitions:
> + *   - set_pmd
> + *   - pmd_present
> + *   - pmd_none
> + *   - pmd_bad
> + *   - pmd_clear
> + *   - pmd_page
> + */

Ditto

> +
> +static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
> +{
> +=09*pmdp =3D pmd;
> +}
> +
> +/* Returns 1 if entry is present */
> +static inline int pmd_present(pmd_t pmd)
> +{
> +=09return pmd_val(pmd) !=3D 0;
> +}
> +
> +/* Returns 1 if the corresponding entry has the value 0 */
> +static inline int pmd_none(pmd_t pmd)
> +{
> +=09return pmd_val(pmd) =3D=3D 0;
> +}
> +
> +/* Used to check that a page middle directory entry is valid */
> +static inline int pmd_bad(pmd_t pmd)
> +{
> +=09return pmd_none(pmd);
> +}
> +
> +/* Clears the entry to prevent process to use the linear address that
> + * mapped it.
> + */
> +static inline void pmd_clear(pmd_t *pmdp)
> +{
> +=09set_pmd(pmdp, __pmd(0));
> +}
> +
> +/*
> + * Returns the address of the descriptor of the page table referred by t=
he
> + * PMD entry.
> + */
> +static inline struct page *pmd_page(pmd_t pmd)
> +{
> +=09if (pmd_val(pmd) & _PAGE_HUGE)
> +=09=09return pfn_to_page(
> +=09=09=09=09(pmd_val(pmd) & KVX_PFN_MASK) >> KVX_PFN_SHIFT);
> +
> +=09return pfn_to_page(pmd_val(pmd) >> PAGE_SHIFT);
> +}
> +
> +#define pmd_ERROR(e) \
> +=09pr_err("%s:%d: bad pmd %016lx.\n", __FILE__, __LINE__, pmd_val(e))
> +
> +static inline pmd_t *pud_pgtable(pud_t pud)
> +{
> +=09return (pmd_t *)pfn_to_virt(pud_val(pud) >> PAGE_SHIFT);
> +}
> +
> +static inline struct page *pud_page(pud_t pud)
> +{
> +=09return pfn_to_page(pud_val(pud) >> PAGE_SHIFT);
> +}
> +
> +/*
> + * PTE definitions:
> + *   - set_pte
> + *   - set_pte_at
> + *   - pte_clear
> + *   - pte_page
> + *   - pte_pfn
> + *   - pte_present
> + *   - pte_none
> + *   - pte_write
> + *   - pte_dirty
> + *   - pte_young
> + *   - pte_special
> + *   - pte_mkdirty
> + *   - pte_mkwrite
> + *   - pte_mkclean
> + *   - pte_mkyoung
> + *   - pte_mkold
> + *   - pte_mkspecial
> + *   - pte_wrprotect
> + */

Ditto

> +
> +static inline void set_pte(pte_t *ptep, pte_t pteval)
> +{
> +=09*ptep =3D pteval;
> +}
> +
> +static inline void set_pte_at(struct mm_struct *mm, unsigned long addr,
> +=09=09=09      pte_t *ptep, pte_t pteval)
> +{
> +=09set_pte(ptep, pteval);
> +}
> +
> +#define pte_clear(mm, addr, ptep) set_pte(ptep, __pte(0))
> +
> +/* Constructs a page table entry */
> +static inline pte_t pfn_pte(unsigned long pfn, pgprot_t prot)
> +{
> +=09return __pte(((pfn << KVX_PFN_SHIFT) & KVX_PFN_MASK) |
> +=09=09     pgprot_val(prot));
> +}
> +
> +/* Builds a page table entry by combining a page descriptor and a group =
of
> + * access rights.
> + */
> +#define mk_pte(page, prot)=09(pfn_pte(page_to_pfn(page), prot))
> +
> +/* Modifies page access rights */
> +static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
> +{
> +=09return __pte((pte_val(pte) & _PAGE_CHG_MASK) | pgprot_val(newprot));
> +}
> +
> +#define pte_page(x)     pfn_to_page(pte_pfn(x))
> +
> +static inline unsigned long pmd_page_vaddr(pmd_t pmd)
> +{
> +=09return (unsigned long)pfn_to_virt(pmd_val(pmd) >> PAGE_SHIFT);
> +}
> +
> +/* Yields the page frame number (PFN) of a page table entry */
> +static inline unsigned long pte_pfn(pte_t pte)
> +{
> +=09return ((pte_val(pte) & KVX_PFN_MASK) >> KVX_PFN_SHIFT);
> +}
> +
> +static inline int pte_present(pte_t pte)
> +{
> +=09return (pte_val(pte) & (_PAGE_PRESENT | _PAGE_NONE));
> +}
> +
> +static inline int pte_none(pte_t pte)
> +{
> +=09return (pte_val(pte) =3D=3D 0);
> +}
> +
> +static inline int pte_write(pte_t pte)
> +{
> +=09return pte_val(pte) & _PAGE_WRITE;
> +}
> +
> +static inline int pte_dirty(pte_t pte)
> +{
> +=09return pte_val(pte) & _PAGE_DIRTY;
> +}
> +
> +static inline int pte_young(pte_t pte)
> +{
> +=09return pte_val(pte) & _PAGE_ACCESSED;
> +}
> +
> +static inline int pte_special(pte_t pte)
> +{
> +=09return pte_val(pte) & _PAGE_SPECIAL;
> +}
> +
> +static inline int pte_huge(pte_t pte)
> +{
> +=09return pte_val(pte) & _PAGE_HUGE;
> +}
> +
> +static inline pte_t pte_mkdirty(pte_t pte)
> +{
> +=09return __pte(pte_val(pte) | _PAGE_DIRTY);
> +}
> +
> +static inline pte_t pte_mkwrite(pte_t pte)
> +{
> +=09return __pte(pte_val(pte) | _PAGE_WRITE);
> +}
> +
> +static inline pte_t pte_mkclean(pte_t pte)
> +{
> +=09return __pte(pte_val(pte) & ~(_PAGE_DIRTY));
> +}
> +
> +static inline pte_t pte_mkyoung(pte_t pte)
> +{
> +=09return __pte(pte_val(pte) | _PAGE_ACCESSED);
> +}
> +
> +static inline pte_t pte_mkold(pte_t pte)
> +{
> +=09return __pte(pte_val(pte) & ~(_PAGE_ACCESSED));
> +}
> +
> +static inline pte_t pte_mkspecial(pte_t pte)
> +{
> +=09return __pte(pte_val(pte) | _PAGE_SPECIAL);
> +}
> +
> +static inline pte_t pte_wrprotect(pte_t pte)
> +{
> +=09return __pte(pte_val(pte) & ~(_PAGE_WRITE));
> +}
> +
> +static inline pte_t pte_mkhuge(pte_t pte)
> +{
> +=09return __pte(pte_val(pte) | _PAGE_HUGE);
> +}
> +
> +static inline pte_t pte_of_pmd(pmd_t pmd)
> +{
> +=09return __pte(pmd_val(pmd));
> +}
> +
> +#define pmd_pfn(pmd)       pte_pfn(pte_of_pmd(pmd))
> +
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE

I don't see HAVE_ARCH_TRANSPARENT_HUGEPAGE in arch/kvx/Kconfig. Please
remove this part for now.

> +
> +#define pmdp_establish pmdp_establish
> +static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
> +=09=09unsigned long address, pmd_t *pmdp, pmd_t pmd)
> +{
> +=09return __pmd(xchg(&pmd_val(*pmdp), pmd_val(pmd)));
> +}
> +
> +static inline int pmd_trans_huge(pmd_t pmd)
> +{
> +=09return !!(pmd_val(pmd) & _PAGE_HUGE);
> +}
> +
> +static inline pmd_t pmd_of_pte(pte_t pte)
> +{
> +=09return __pmd(pte_val(pte));
> +}
> +
> +
> +#define pmd_mkclean(pmd)      pmd_of_pte(pte_mkclean(pte_of_pmd(pmd)))
> +#define pmd_mkdirty(pmd)      pmd_of_pte(pte_mkdirty(pte_of_pmd(pmd)))
> +#define pmd_mkold(pmd)=09      pmd_of_pte(pte_mkold(pte_of_pmd(pmd)))
> +#define pmd_mkwrite(pmd)      pmd_of_pte(pte_mkwrite(pte_of_pmd(pmd)))
> +#define pmd_mkyoung(pmd)      pmd_of_pte(pte_mkyoung(pte_of_pmd(pmd)))
> +#define pmd_modify(pmd, prot) pmd_of_pte(pte_modify(pte_of_pmd(pmd), pro=
t))
> +#define pmd_wrprotect(pmd)    pmd_of_pte(pte_wrprotect(pte_of_pmd(pmd)))
> +
> +static inline pmd_t pmd_mkhuge(pmd_t pmd)
> +{
> +=09/* Create a huge page in PMD implies a size of 2 MB */
> +=09return __pmd(pmd_val(pmd) |
> +=09=09=09_PAGE_HUGE | (TLB_PS_2M << KVX_PAGE_SZ_SHIFT));
> +}
> +
> +static inline pmd_t pmd_mkinvalid(pmd_t pmd)
> +{
> +=09pmd_val(pmd) &=3D ~(_PAGE_PRESENT);
> +
> +=09return pmd;
> +}
> +
> +#define pmd_dirty(pmd)     pte_dirty(pte_of_pmd(pmd))
> +#define pmd_write(pmd)     pte_write(pte_of_pmd(pmd))
> +#define pmd_young(pmd)     pte_young(pte_of_pmd(pmd))
> +
> +#define mk_pmd(page, prot)  pmd_of_pte(mk_pte(page, prot))
> +
> +static inline pmd_t pfn_pmd(unsigned long pfn, pgprot_t prot)
> +{
> +=09return __pmd(((pfn << KVX_PFN_SHIFT) & KVX_PFN_MASK) |
> +=09=09=09pgprot_val(prot));
> +}
> +
> +static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
> +=09=09=09      pmd_t *pmdp, pmd_t pmd)
> +{
> +=09*pmdp =3D pmd;
> +}
> +
> +#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
> +
> +#endif=09/* _ASM_KVX_PGTABLE_H */
> diff --git a/arch/kvx/include/asm/rm_fw.h b/arch/kvx/include/asm/rm_fw.h
> new file mode 100644
> index 000000000000..f89bdd5915ed
> --- /dev/null
> +++ b/arch/kvx/include/asm/rm_fw.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2017-2023 Kalray Inc.
> + * Author(s): Clement Leger
> + */
> +
> +#ifndef _ASM_KVX_RM_FW_H
> +#define _ASM_KVX_RM_FW_H
> +
> +#include <linux/sizes.h>
> +
> +#define KVX_RM_ID=0916
> +
> +#define RM_FIRMWARE_REGS_SIZE=09(SZ_4K)
> +
> +#endif /* _ASM_KVX_RM_FW_H */
> diff --git a/arch/kvx/include/asm/sparsemem.h b/arch/kvx/include/asm/spar=
semem.h
> new file mode 100644
> index 000000000000..2f35743f20fb
> --- /dev/null
> +++ b/arch/kvx/include/asm/sparsemem.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2017-2023 Kalray Inc.
> + * Author(s): Clement Leger
> + */
> +
> +#ifndef _ASM_KVX_SPARSEMEM_H
> +#define _ASM_KVX_SPARSEMEM_H

Does kvx support holes between memory banks? If no, FLATMEM should do.

> +
> +#ifdef CONFIG_SPARSEMEM
> +#define MAX_PHYSMEM_BITS=0940
> +#define SECTION_SIZE_BITS=0930
> +#endif /* CONFIG_SPARSEMEM */
> +
> +#endif /* _ASM_KVX_SPARSEMEM_H */
> diff --git a/arch/kvx/include/asm/symbols.h b/arch/kvx/include/asm/symbol=
s.h
> new file mode 100644
> index 000000000000..a53c1607979f
> --- /dev/null
> +++ b/arch/kvx/include/asm/symbols.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2017-2023 Kalray Inc.
> + * Author(s): Clement Leger
> + */
> +
> +#ifndef _ASM_KVX_SYMBOLS_H
> +#define _ASM_KVX_SYMBOLS_H
> +
> +/* Symbols to patch TLB refill handler */
> +extern char kvx_perf_tlb_refill[], kvx_std_tlb_refill[];
> +
> +/* Entry point of the ELF, used to start other PEs in SMP */
> +extern int kvx_start[];
> +
> +#endif
> diff --git a/arch/kvx/include/asm/tlb.h b/arch/kvx/include/asm/tlb.h
> new file mode 100644
> index 000000000000..190b682e1819
> --- /dev/null
> +++ b/arch/kvx/include/asm/tlb.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2017-2023 Kalray Inc.
> + * Author(s): Guillaume Thouvenin
> + *            Clement Leger
> + */
> +
> +#ifndef _ASM_KVX_TLB_H
> +#define _ASM_KVX_TLB_H
> +
> +struct mmu_gather;
> +
> +static void tlb_flush(struct mmu_gather *tlb);
> +
> +int clear_ltlb_entry(unsigned long vaddr);
> +
> +#include <asm-generic/tlb.h>
> +
> +static inline unsigned int pgprot_cache_policy(unsigned long flags)
> +{
> +=09return (flags & KVX_PAGE_CP_MASK) >> KVX_PAGE_CP_SHIFT;
> +}
> +
> +#endif /* _ASM_KVX_TLB_H */
> diff --git a/arch/kvx/include/asm/tlb_defs.h b/arch/kvx/include/asm/tlb_d=
efs.h
> new file mode 100644
> index 000000000000..3f5b29cd529e
> --- /dev/null
> +++ b/arch/kvx/include/asm/tlb_defs.h

It looks like this header can be moved to arch/kvx/mm

> @@ -0,0 +1,131 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2017-2023 Kalray Inc.
> + * Author(s): Clement Leger
> + *            Julian Vetter
> + *            Guillaume Thouvenin
> + *            Marius Gligor
> + */
> +
> +#ifndef _ASM_KVX_TLB_DEFS_H
> +#define _ASM_KVX_TLB_DEFS_H
> +

...

> diff --git a/arch/kvx/mm/init.c b/arch/kvx/mm/init.c
> new file mode 100644
> index 000000000000..bac34bc09eb5
> --- /dev/null
> +++ b/arch/kvx/mm/init.c
> @@ -0,0 +1,277 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2017-2023 Kalray Inc.
> + * Author(s): Clement Leger
> + *            Guillaume Thouvenin
> + */
> +
> +/* Memblock header depends on types.h but does not include it ! */
> +#include <linux/types.h>
> +#include <linux/memblock.h>
> +#include <linux/mmzone.h>
> +#include <linux/of_fdt.h>
> +#include <linux/sched.h>
> +#include <linux/sizes.h>
> +#include <linux/init.h>
> +#include <linux/initrd.h>
> +#include <linux/pfn.h>
> +#include <linux/mm.h>
> +
> +#include <asm/sections.h>
> +#include <asm/tlb_defs.h>
> +#include <asm/tlbflush.h>
> +#include <asm/fixmap.h>
> +#include <asm/page.h>
> +
> +/*
> + * On kvx, memory map contains the first 2G of DDR being aliased.
> + * Full contiguous DDR is located at @[4G - 68G].
> + * However, to access this DDR in 32bit mode, the first 2G of DDR are
> + * mirrored from 4G to 2G.
> + * These first 2G are accessible from all DMAs (included 32 bits one).
> + *
> + * Hence, the memory map is the following:
> + *
> + * (68G) 0x1100000000-> +-------------+
> + *                      |             |
> + *              66G     |(ZONE_NORMAL)|
> + *                      |             |
> + *   (6G) 0x180000000-> +-------------+
> + *                      |             |
> + *              2G      |(ZONE_DMA32) |
> + *                      |             |
> + *   (4G) 0x100000000-> +-------------+ +--+
> + *                      |             |    |
> + *              2G      |   (Alias)   |    | 2G Alias
> + *                      |             |    |
> + *    (2G) 0x80000000-> +-------------+ <--+
> + *
> + * The translation of 64 bits -> 32 bits can then be done using dma-rang=
es property
> + * in device-trees.
> + */
> +
> +#define DDR_64BIT_START=09=09(4ULL * SZ_1G)
> +#define DDR_32BIT_ALIAS_SIZE=09(2ULL * SZ_1G)
> +
> +#define MAX_DMA32_PFN=09PHYS_PFN(DDR_64BIT_START + DDR_32BIT_ALIAS_SIZE)
> +
> +pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
> +
> +/*
> + * empty_zero_page is a special page that is used for zero-initialized d=
ata and
> + * COW.
> + */
> +struct page *empty_zero_page;
> +EXPORT_SYMBOL(empty_zero_page);
> +
> +extern char _start[];
> +extern char __kernel_smem_code_start[];
> +extern char __kernel_smem_code_end[];
> +
> +struct kernel_section {
> +=09phys_addr_t start;
> +=09phys_addr_t end;
> +};
> +
> +struct kernel_section kernel_sections[] =3D {
> +=09{
> +=09=09.start =3D (phys_addr_t)__kernel_smem_code_start,
> +=09=09.end =3D (phys_addr_t)__kernel_smem_code_end
> +=09},
> +=09{
> +=09=09.start =3D __pa(_start),
> +=09=09.end =3D __pa(_end)
> +=09}
> +};
> +
> +static void __init zone_sizes_init(void)
> +{
> +=09unsigned long zones_size[MAX_NR_ZONES];
> +
> +=09memset(zones_size, 0, sizeof(zones_size));
> +
> +=09zones_size[ZONE_DMA32] =3D min(MAX_DMA32_PFN, max_low_pfn);
> +=09zones_size[ZONE_NORMAL] =3D max_low_pfn;
> +
> +=09free_area_init(zones_size);
> +}
> +
> +#ifdef CONFIG_BLK_DEV_INITRD
> +static void __init setup_initrd(void)
> +{
> +=09u64 base =3D phys_initrd_start;
> +=09u64 end =3D phys_initrd_start + phys_initrd_size;
> +
> +=09if (phys_initrd_size =3D=3D 0) {
> +=09=09pr_info("initrd not found or empty");
> +=09=09return;
> +=09}
> +
> +=09if (base < memblock_start_of_DRAM() || end > memblock_end_of_DRAM()) =
{
> +=09=09pr_err("initrd not in accessible memory, disabling it");
> +=09=09phys_initrd_size =3D 0;
> +=09=09return;
> +=09}
> +
> +=09pr_info("initrd: 0x%llx - 0x%llx\n", base, end);
> +
> +=09memblock_reserve(phys_initrd_start, phys_initrd_size);
> +
> +=09/* the generic initrd code expects virtual addresses */
> +=09initrd_start =3D (unsigned long) __va(base);
> +=09initrd_end =3D initrd_start + phys_initrd_size;
> +}
> +#endif
> +
> +static phys_addr_t memory_limit =3D PHYS_ADDR_MAX;
> +
> +static int __init early_mem(char *p)
> +{
> +=09if (!p)
> +=09=09return 1;
> +
> +=09memory_limit =3D memparse(p, &p) & PAGE_MASK;
> +=09pr_notice("Memory limited to %lldMB\n", memory_limit >> 20);
> +
> +=09return 0;
> +}
> +early_param("mem", early_mem);
> +
> +static void __init setup_bootmem(void)
> +{
> +=09phys_addr_t kernel_start, kernel_end;
> +=09phys_addr_t start, end =3D 0;
> +=09u64 i;
> +
> +=09init_mm.start_code =3D (unsigned long)_stext;
> +=09init_mm.end_code =3D (unsigned long)_etext;
> +=09init_mm.end_data =3D (unsigned long)_edata;
> +=09init_mm.brk =3D (unsigned long)_end;
> +
> +=09for (i =3D 0; i < ARRAY_SIZE(kernel_sections); i++) {
> +=09=09kernel_start =3D kernel_sections[i].start;
> +=09=09kernel_end =3D kernel_sections[i].end;
> +
> +=09=09memblock_reserve(kernel_start, kernel_end - kernel_start);
> +=09}
> +
> +=09for_each_mem_range(i, &start, &end) {
> +=09=09pr_info("%15s: memory  : 0x%lx - 0x%lx\n", __func__,
> +=09=09=09(unsigned long)start,
> +=09=09=09(unsigned long)end);
> +=09}
> +
> +=09/* min_low_pfn is the lowest PFN available in the system */
> +=09min_low_pfn =3D PFN_UP(memblock_start_of_DRAM());
> +
> +=09/* max_low_pfn indicates the end if NORMAL zone */
> +=09max_low_pfn =3D PFN_DOWN(memblock_end_of_DRAM());

There is also max_pfn that's used by various pfn walkers. In your case it
should be the same as max_low_pfn.

> +
> +=09/* Set the maximum number of pages in the system */
> +=09set_max_mapnr(max_low_pfn - min_low_pfn);
> +
> +#ifdef CONFIG_BLK_DEV_INITRD
> +=09setup_initrd();
> +#endif
> +
> +=09if (memory_limit !=3D PHYS_ADDR_MAX)
> +=09=09memblock_mem_limit_remove_map(memory_limit);

This may cut off the initrd memory. It's be better to cap the memory before
setting up the initrd.

> +
> +=09/* Don't reserve the device tree if its builtin */
> +=09if (!is_kernel_rodata((unsigned long) initial_boot_params))
> +=09=09early_init_fdt_reserve_self();
> +=09early_init_fdt_scan_reserved_mem();
> +
> +=09memblock_allow_resize();
> +=09memblock_dump_all();
> +}
> +
> +static pmd_t fixmap_pmd[PTRS_PER_PMD] __page_aligned_bss __maybe_unused;
> +static pte_t fixmap_pte[PTRS_PER_PTE] __page_aligned_bss __maybe_unused;
> +
> +void __init early_fixmap_init(void)
> +{
> +=09unsigned long vaddr;
> +=09pgd_t *pgd;
> +=09p4d_t *p4d;
> +=09pud_t *pud;
> +=09pmd_t *pmd;
> +
> +=09/*
> +=09 * Fixed mappings:
> +=09 */
> +=09vaddr =3D __fix_to_virt(__end_of_fixed_addresses - 1);
> +=09pgd =3D pgd_offset_pgd(swapper_pg_dir, vaddr);
> +=09set_pgd(pgd, __pgd(__pa_symbol(fixmap_pmd)));
> +
> +=09p4d =3D p4d_offset(pgd, vaddr);
> +=09pud =3D pud_offset(p4d, vaddr);
> +=09pmd =3D pmd_offset(pud, vaddr);
> +=09set_pmd(pmd, __pmd(__pa_symbol(fixmap_pte)));
> +}
> +
> +void __init setup_arch_memory(void)
> +{
> +=09setup_bootmem();
> +=09sparse_init();
> +=09zone_sizes_init();
> +}
> +
> +void __init mem_init(void)
> +{
> +=09memblock_free_all();
> +
> +=09/* allocate the zero page */
> +=09empty_zero_page =3D alloc_page(GFP_KERNEL | __GFP_ZERO);
> +=09if (!empty_zero_page)
> +=09=09panic("Failed to allocate the empty_zero_page");
> +}
> +
> +void free_initmem(void)
> +{
> +#ifdef CONFIG_POISON_INITMEM
> +=09free_initmem_default(0x0);
> +#else
> +=09free_initmem_default(-1);
> +#endif

Any reason not to use default implementation in init/main.c?

> +}
> +
> +void __set_fixmap(enum fixed_addresses idx,
> +=09=09=09=09phys_addr_t phys, pgprot_t flags)
> +{
> +=09unsigned long addr =3D __fix_to_virt(idx);
> +=09pte_t *pte;
> +
> +
> +=09BUG_ON(idx >=3D __end_of_fixed_addresses);
> +
> +=09pte =3D &fixmap_pte[pte_index(addr)];
> +
> +=09if (pgprot_val(flags)) {
> +=09=09set_pte(pte, pfn_pte(phys_to_pfn(phys), flags));
> +=09} else {
> +=09=09/* Remove the fixmap */
> +=09=09pte_clear(&init_mm, addr, pte);
> +=09}
> +=09local_flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> +}
> +
> +static const pgprot_t protection_map[16] =3D {
> +=09[VM_NONE]=09=09=09=09=09=3D PAGE_NONE,
> +=09[VM_READ]=09=09=09=09=09=3D PAGE_READ,
> +=09[VM_WRITE]=09=09=09=09=09=3D PAGE_READ,
> +=09[VM_WRITE | VM_READ]=09=09=09=09=3D PAGE_READ,
> +=09[VM_EXEC]=09=09=09=09=09=3D PAGE_READ_EXEC,
> +=09[VM_EXEC | VM_READ]=09=09=09=09=3D PAGE_READ_EXEC,
> +=09[VM_EXEC | VM_WRITE]=09=09=09=09=3D PAGE_READ_EXEC,
> +=09[VM_EXEC | VM_WRITE | VM_READ]=09=09=09=3D PAGE_READ_EXEC,
> +=09[VM_SHARED]=09=09=09=09=09=3D PAGE_NONE,
> +=09[VM_SHARED | VM_READ]=09=09=09=09=3D PAGE_READ,
> +=09[VM_SHARED | VM_WRITE]=09=09=09=09=3D PAGE_READ_WRITE,
> +=09[VM_SHARED | VM_WRITE | VM_READ]=09=09=3D PAGE_READ_WRITE,
> +=09[VM_SHARED | VM_EXEC]=09=09=09=09=3D PAGE_READ_EXEC,
> +=09[VM_SHARED | VM_EXEC | VM_READ]=09=09=09=3D PAGE_READ_EXEC,
> +=09[VM_SHARED | VM_EXEC | VM_WRITE]=09=09=3D PAGE_READ_WRITE_EXEC,
> +=09[VM_SHARED | VM_EXEC | VM_WRITE | VM_READ]=09=3D PAGE_READ_WRITE_EXEC
> +};
> +DECLARE_VM_GET_PAGE_PROT
> diff --git a/arch/kvx/mm/mmap.c b/arch/kvx/mm/mmap.c
> new file mode 100644
> index 000000000000..a2225db64438
> --- /dev/null
> +++ b/arch/kvx/mm/mmap.c
> @@ -0,0 +1,31 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * derived from arch/arm64/mm/mmap.c
> + *
> + * Copyright (C) 2017-2023 Kalray Inc.
> + * Author(s): Clement Leger
> + */
> +
> +#ifdef CONFIG_STRICT_DEVMEM
> +
> +#include <linux/mm.h>
> +#include <linux/ioport.h>
> +
> +#include <asm/page.h>
> +
> +/*
> + * devmem_is_allowed() checks to see if /dev/mem access to a certain add=
ress
> + * is valid. The argument is a physical page number.  We mimic x86 here =
by
> + * disallowing access to system RAM as well as device-exclusive MMIO reg=
ions.
> + * This effectively disable read()/write() on /dev/mem.
> + */
> +int devmem_is_allowed(unsigned long pfn)
> +{
> +=09if (iomem_is_exclusive(pfn << PAGE_SHIFT))
> +=09=09return 0;
> +=09if (!page_is_ram(pfn))

This won't work because it relies on "System RAM" in the resource tree and
you don't setup this.

> +=09=09return 1;
> +=09return 0;
> +}
> +
> +#endif
> diff --git a/arch/kvx/mm/mmu.c b/arch/kvx/mm/mmu.c
> new file mode 100644
> index 000000000000..9cb11bd2dfdf
> --- /dev/null
> +++ b/arch/kvx/mm/mmu.c
> @@ -0,0 +1,202 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2017-2023 Kalray Inc.
> + * Author(s): Clement Leger
> + *            Guillaume Thouvenin
> + *            Vincent Chardon
> + *            Jules Maselbas
> + */
> +
> +#include <linux/cache.h>
> +#include <linux/types.h>
> +#include <linux/irqflags.h>
> +#include <linux/printk.h>
> +#include <linux/percpu.h>
> +#include <linux/kernel.h>
> +#include <linux/spinlock.h>
> +#include <linux/spinlock_types.h>
> +
> +#include <asm/mmu.h>
> +#include <asm/tlb.h>
> +#include <asm/page_size.h>
> +#include <asm/mmu_context.h>
> +
> +#define DUMP_LTLB 0
> +#define DUMP_JTLB 1
> +
> +DEFINE_PER_CPU_ALIGNED(uint8_t[MMU_JTLB_SETS], jtlb_current_set_way);
> +static struct kvx_tlb_format ltlb_entries[MMU_LTLB_WAYS];
> +static unsigned long ltlb_entries_bmp;
> +
> +static int kvx_mmu_ltlb_overlaps(struct kvx_tlb_format tlbe)
> +{
> +=09int bit =3D LTLB_ENTRY_FIXED_COUNT;
> +
> +=09for_each_set_bit_from(bit, &ltlb_entries_bmp, MMU_LTLB_WAYS) {
> +=09=09if (tlb_entry_overlaps(tlbe, ltlb_entries[bit]))
> +=09=09=09return 1;
> +=09}
> +
> +=09return 0;
> +}
> +
> +/**
> + * kvx_mmu_ltlb_add_entry - Add a kernel entry in the LTLB
> + *
> + * In order to lock some entries in the LTLB and be always mapped, this
> + * function can be called with a physical address, a virtual address and
> + * protection attribute to add an entry into the LTLB. This is mainly fo=
r
> + * performances since there won't be any NOMAPPING traps for these pages=
.
> + *
> + * @vaddr: Virtual address for the entry (must be aligned according to t=
lb_ps)
> + * @paddr: Physical address for the entry (must be aligned according to =
tlb_ps)
> + * @flags: Protection attributes
> + * @tlb_ps: Page size attribute for TLB (TLB_PS_*)
> + */
> +void kvx_mmu_ltlb_add_entry(unsigned long vaddr, phys_addr_t paddr,
> +=09=09=09    pgprot_t flags, unsigned long tlb_ps)
> +{
> +=09unsigned int cp;
> +=09unsigned int idx;
> +=09unsigned long irqflags;
> +=09struct kvx_tlb_format tlbe;
> +=09u64 page_size =3D BIT(get_page_size_shift(tlb_ps));
> +
> +=09BUG_ON(!IS_ALIGNED(vaddr, page_size) || !IS_ALIGNED(paddr, page_size)=
);
> +
> +=09cp =3D pgprot_cache_policy(pgprot_val(flags));
> +
> +=09tlbe =3D tlb_mk_entry(
> +=09=09(void *) paddr,
> +=09=09(void *) vaddr,

All occurrences of tlb_mk_entry() case paddr and vaddr parameters and then
tlb_mk_entry() essentially treats them as unsigned longs. Isn't it=20
better to pass declare tlb_mk_entry as=20

=09tlb_mk_entry(phys_addr_t paddr, unsigned long vaddr, ...=20

> +=09=09tlb_ps,
> +=09=09TLB_G_GLOBAL,
> +=09=09TLB_PA_NA_RW,
> +=09=09cp,
> +=09=090,
> +=09=09TLB_ES_A_MODIFIED);

Please avoid having a parameter per line.

> +
> +=09local_irq_save(irqflags);
> +
> +=09if (IS_ENABLED(CONFIG_KVX_DEBUG_TLB_WRITE) &&
> +=09    kvx_mmu_ltlb_overlaps(tlbe))
> +=09=09panic("VA %lx overlaps with an existing LTLB mapping", vaddr);
> +
> +=09idx =3D find_next_zero_bit(&ltlb_entries_bmp, MMU_LTLB_WAYS,
> +=09=09=09=09 LTLB_ENTRY_FIXED_COUNT);
> +=09/* This should never happen */
> +=09BUG_ON(idx >=3D MMU_LTLB_WAYS);
> +=09__set_bit(idx, &ltlb_entries_bmp);
> +=09ltlb_entries[idx] =3D tlbe;
> +=09kvx_mmu_add_entry(MMC_SB_LTLB, idx, tlbe);
> +
> +=09if (kvx_mmc_error(kvx_sfr_get(MMC)))
> +=09=09panic("Failed to write entry to the LTLB");
> +
> +=09local_irq_restore(irqflags);
> +}
> +
> +void kvx_mmu_ltlb_remove_entry(unsigned long vaddr)
> +{
> +=09int ret, bit =3D LTLB_ENTRY_FIXED_COUNT;
> +=09struct kvx_tlb_format tlbe;
> +
> +=09for_each_set_bit_from(bit, &ltlb_entries_bmp, MMU_LTLB_WAYS) {
> +=09=09tlbe =3D ltlb_entries[bit];
> +=09=09if (tlb_entry_match_addr(tlbe, vaddr)) {
> +=09=09=09__clear_bit(bit, &ltlb_entries_bmp);
> +=09=09=09break;
> +=09=09}
> +=09}
> +
> +=09if (bit =3D=3D MMU_LTLB_WAYS)
> +=09=09panic("Trying to remove non-existent LTLB entry for addr %lx\n",
> +=09=09      vaddr);
> +
> +=09ret =3D clear_ltlb_entry(vaddr);
> +=09if (ret)
> +=09=09panic("Failed to remove LTLB entry for addr %lx\n", vaddr);
> +}
> +
> +/**
> + * kvx_mmu_jtlb_add_entry - Add an entry into JTLB
> + *
> + * JTLB is used both for kernel and user entries.
> + *
> + * @address: Virtual address for the entry (must be aligned according to=
 tlb_ps)
> + * @ptep: pte entry pointer
> + * @asn: ASN (if pte entry is not global)
> + */
> +void kvx_mmu_jtlb_add_entry(unsigned long address, pte_t *ptep,
> +=09=09=09    unsigned int asn)
> +{
> +=09unsigned int shifted_addr, set, way;
> +=09unsigned long flags, pte_val;
> +=09struct kvx_tlb_format tlbe;
> +=09unsigned int pa, cp, ps;
> +=09phys_addr_t pfn;
> +
> +=09pte_val =3D pte_val(*ptep);
> +
> +=09pfn =3D (phys_addr_t)pte_pfn(*ptep);
> +
> +=09asn &=3D MM_CTXT_ASN_MASK;
> +
> +=09/* Set page as accessed */
> +=09pte_val(*ptep) |=3D _PAGE_ACCESSED;
> +
> +=09BUILD_BUG_ON(KVX_PAGE_SZ_SHIFT !=3D KVX_SFR_TEL_PS_SHIFT);
> +
> +=09ps =3D (pte_val & KVX_PAGE_SZ_MASK) >> KVX_PAGE_SZ_SHIFT;
> +=09pa =3D get_page_access_perms(KVX_ACCESS_PERMS_INDEX(pte_val));
> +=09cp =3D pgprot_cache_policy(pte_val);
> +
> +=09tlbe =3D tlb_mk_entry(
> +=09=09(void *)pfn_to_phys(pfn),
> +=09=09(void *)address,
> +=09=09ps,
> +=09=09(pte_val & _PAGE_GLOBAL) ? TLB_G_GLOBAL : TLB_G_USE_ASN,
> +=09=09pa,
> +=09=09cp,
> +=09=09asn,
> +=09=09TLB_ES_A_MODIFIED);

Ditto

> +
> +=09shifted_addr =3D address >> get_page_size_shift(ps);
> +=09set =3D shifted_addr & MMU_JTLB_SET_MASK;
> +
> +=09local_irq_save(flags);
> +
> +=09if (IS_ENABLED(CONFIG_KVX_DEBUG_TLB_WRITE) &&
> +=09    kvx_mmu_ltlb_overlaps(tlbe))
> +=09=09panic("VA %lx overlaps with an existing LTLB mapping", address);
> +
> +=09way =3D get_cpu_var(jtlb_current_set_way)[set]++;
> +=09put_cpu_var(jtlb_current_set_way);
> +
> +=09way &=3D MMU_JTLB_WAY_MASK;
> +
> +=09kvx_mmu_add_entry(MMC_SB_JTLB, way, tlbe);
> +
> +=09if (IS_ENABLED(CONFIG_KVX_DEBUG_TLB_WRITE) &&
> +=09    kvx_mmc_error(kvx_sfr_get(MMC)))
> +=09=09panic("Failed to write entry to the JTLB (in update_mmu_cache)");
> +
> +=09local_irq_restore(flags);
> +}
> +
> +void __init kvx_mmu_early_setup(void)
> +{
> +=09int bit;
> +=09struct kvx_tlb_format tlbe;
> +
> +=09kvx_mmu_remove_ltlb_entry(LTLB_ENTRY_EARLY_SMEM);
> +
> +=09if (raw_smp_processor_id() !=3D 0) {
> +=09=09/* Apply existing ltlb entries starting from first one free */
> +=09=09bit =3D LTLB_ENTRY_FIXED_COUNT;
> +=09=09for_each_set_bit_from(bit, &ltlb_entries_bmp, MMU_LTLB_WAYS) {
> +=09=09=09tlbe =3D ltlb_entries[bit];
> +=09=09=09kvx_mmu_add_entry(MMC_SB_LTLB, bit, tlbe);
> +=09=09}
> +=09}
> +}

--
Sincerely yours,
Mike.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

