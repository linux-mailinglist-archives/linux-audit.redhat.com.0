Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E4E678479
	for <lists+linux-audit@lfdr.de>; Mon, 23 Jan 2023 19:22:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674498122;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+jEAGeoieDFd5CR1Ib/EY9pbM7KK7+TaTDH0AzMiUHg=;
	b=CUZgeXjm9xkLIx+stZjIPvAXFdQ6jvhlS/UBQWWxV6g0ALswUiHVS5bRbM09W0h5usxpN0
	0MyqwQ2iQacBAfk/xzjkCW1neVfW7ftwzhP9lVIZgSlnt2hFJZKVEnkjup9T2hpYAmXahF
	0gy1qF5JeGuVEG8k4NdwZSmdexw9RGk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-D0Uk1tgJOVyrYuhqrWXlqA-1; Mon, 23 Jan 2023 13:22:00 -0500
X-MC-Unique: D0Uk1tgJOVyrYuhqrWXlqA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6562485CBCC;
	Mon, 23 Jan 2023 18:21:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D114D2026D2C;
	Mon, 23 Jan 2023 18:21:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CEFB319465A0;
	Mon, 23 Jan 2023 18:21:47 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3E6B81946586 for <linux-audit@listman.corp.redhat.com>;
 Sun, 22 Jan 2023 15:08:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0070D1121331; Sun, 22 Jan 2023 15:08:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED18B1121330
 for <linux-audit@redhat.com>; Sun, 22 Jan 2023 15:08:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9773802BEE
 for <linux-audit@redhat.com>; Sun, 22 Jan 2023 15:08:30 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-MeIW5R8tMW27VmAGFuPMIQ-1; Sun, 22 Jan 2023 10:08:27 -0500
X-MC-Unique: MeIW5R8tMW27VmAGFuPMIQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 41CF9B80AF8;
 Sun, 22 Jan 2023 15:02:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88DC2C433D2;
 Sun, 22 Jan 2023 15:02:25 +0000 (UTC)
Date: Sun, 22 Jan 2023 17:02:14 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Yann Sionneau <ysionneau@kalray.eu>
Subject: Re: [RFC PATCH v2 01/31] Documentation: kvx: Add basic documentation
Message-ID: <Y81P9qtEBHsNqxN/@kernel.org>
References: <20230120141002.2442-1-ysionneau@kalray.eu>
 <20230120141002.2442-2-ysionneau@kalray.eu>
MIME-Version: 1.0
In-Reply-To: <20230120141002.2442-2-ysionneau@kalray.eu>
X-TUID: BmNtroIydu7f
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

While reviewing kvx-mmu.rst I've spotted several places where the
documentation does not match the code, please make sure that the
documentation in this patch actually reflects what the code is doing.

Also, sectioning looked a bit strange to me, make sure to take a look at
the generated html and see if it is rendered as intended.

On Fri, Jan 20, 2023 at 03:09:32PM +0100, Yann Sionneau wrote:
> Add some documentation for the kvx architecture and its Linux port.
> 
> Co-developed-by: Clement Leger <clement@clement-leger.fr>
> Signed-off-by: Clement Leger <clement@clement-leger.fr>
> Co-developed-by: Jules Maselbas <jmaselbas@kalray.eu>
> Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
> Co-developed-by: Guillaume Thouvenin <gthouvenin@kalray.eu>
> Signed-off-by: Guillaume Thouvenin <gthouvenin@kalray.eu>
> Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
> ---
> 
> Notes:
>     V1 -> V2:
>      - converted to .rst, typos and formatting fixes
>      - reword few paragraphs
> 
>  Documentation/arch.rst               |   1 +
>  Documentation/kvx/index.rst          |  17 ++
>  Documentation/kvx/kvx-exceptions.rst | 256 ++++++++++++++++++++++++
>  Documentation/kvx/kvx-iommu.rst      | 191 ++++++++++++++++++
>  Documentation/kvx/kvx-mmu.rst        | 287 +++++++++++++++++++++++++++
>  Documentation/kvx/kvx-smp.rst        |  39 ++++
>  Documentation/kvx/kvx.rst            | 273 +++++++++++++++++++++++++
>  7 files changed, 1064 insertions(+)
>  create mode 100644 Documentation/kvx/index.rst
>  create mode 100644 Documentation/kvx/kvx-exceptions.rst
>  create mode 100644 Documentation/kvx/kvx-iommu.rst
>  create mode 100644 Documentation/kvx/kvx-mmu.rst
>  create mode 100644 Documentation/kvx/kvx-smp.rst
>  create mode 100644 Documentation/kvx/kvx.rst
> 
> diff --git a/Documentation/arch.rst b/Documentation/arch.rst
> index 41a66a8b38e4..1ccda8ef6eef 100644
> --- a/Documentation/arch.rst
> +++ b/Documentation/arch.rst
> @@ -13,6 +13,7 @@ implementation.
>     arm/index
>     arm64/index
>     ia64/index
> +   kvx/index
>     loongarch/index
>     m68k/index
>     mips/index

...

> diff --git a/Documentation/kvx/kvx-mmu.rst b/Documentation/kvx/kvx-mmu.rst
> new file mode 100644
> index 000000000000..b7186331396c
> --- /dev/null
> +++ b/Documentation/kvx/kvx-mmu.rst
> @@ -0,0 +1,287 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +===
> +MMU
> +===
> +
> +Virtual addresses are on 41 bits for kvx when using 64-bit mode.

There is only 64-bit support at the moment, so no need to mention it.

> +To differentiate kernel from user space, we use the high order bit
> +(bit 40). When bit 40 is set, then the higher remaining bits must also be
> +set to 1. The virtual address must be extended with 1 when the bit 40 is set,
> +if not the address must be zero extended. Bit 40 is set for kernel space
> +mappings and not set for user space mappings.

I'd reorder this paragraph to first mention that bit 40 is set for kernel
space and then write about sign extension.

> +
> +Memory Map
> +----------
> +
> +In Linux physical memories are arranged into banks according to the cost of an
> +access in term of distance to a memory. As we are UMA architecture we only have
> +one bank and thus one node.
> +
> +A node is divided into several kind of zone. For example if DMA can only access
> +a specific area in the physical memory we will define a ZONE_DMA for this purpose.
> +In our case we are considering that DMA can access all DDR so we don't have a specific
> +zone for this. On 64 bit architecture all DDR can be mapped in virtual kernel space
> +so there is no need for a ZONE_HIGHMEM. That means that in our case there is
> +only one ZONE_NORMAL. This will be updated if DMA cannot access all memory.

These two paragraphs have nothing to do with the virtual memory map. Please
drop them.

> +
> +Currently, the memory mapping is the following for 4KB page:
> +
> +  ======================== ======================= ====== ======= ==============
> +  Start                    End                     Attr   Size    Name
> +  ======================== ======================= ====== ======= ==============
> +  0000 0000 0000 0000      0000 003F FFFF FFFF     ---    256GB    User
> +  0000 0040 0000 0000      0000 007F FFFF FFFF     ---    256GB     MMAP
> +  0000 0080 0000 0000      FFFF FF7F FFFF FFFF     ---    ---      Gap
> +  FFFF FF80 0000 0000      FFFF FFFF FFFF FFFF     ---    512GB    Kernel
> +    FFFF FF80 0000 0000     FFFF FF8F FFFF FFFF    RWX    64GB      Direct Map
> +    FFFF FF90 0000 0000     FFFF FF90 3FFF FFFF    RWX    1GB       Vmalloc
> +    FFFF FF90 4000 0000     FFFF FFFF FFFF FFFF    RW     447GB     Free area
> +  ======================== ======================= ====== ======= ==============
> +
> +Enable the MMU
> +--------------
> +
> +All kernel functions and symbols are in virtual memory except for kvx_start()
> +function which is loaded at 0x0 in physical memory.
> +To be able to switch from physical addresses to virtual addresses we choose to
> +setup the TLB at the very beginning of the boot process to be able to map both
> +pieces of code. For this we added two entries in the LTLB. The first one,
> +LTLB[0], contains the mapping between virtual memory and DDR. Its size is 512MB.
> +The second entry, LTLB[1], contains a flat mapping of the first 2MB of the SMEM.
> +Once those two entries are present we can enable the MMU. LTLB[1] will be
> +removed during paging_init() because once we are really running in virtual space
> +it will not be used anymore.
> +In order to access more than 512MB DDR memory, the remaining memory (> 512MB) is
> +refill using a comparison in kernel_perf_refill that does not walk the kernel
> +page table, thus having a faster refill time for kernel. These entries are
> +inserted into the LTLB for easier computation (4 LTLB entries). The drawback of
> +this approach is that mapped entries are using RWX protection attributes,
> +leading to no protection at all.
> +
> +Kernel strict RWX
> +-----------------
> +
> +``CONFIG_STRICT_KERNEL_RWX`` is enabled by default in defconfig.

This is not what I see in the current patchset. Please re-add this section
along with CONFIG_STRICT_KERNEL_RWX support, otherwise it's misleading.

> +Once booted, if ``CONFIG_STRICT_KERNEL_RWX`` is enable, the kernel text and memory
> +will be mapped in the init_mm page table. Once mapped, the refill routine for
> +the kernel is patched to always do a page table walk, bypassing the faster
> +comparison but enforcing page protection attributes when refilling.
> +Finally, the LTLB[0] entry is replaced by a 4K one, mapping only exceptions with
> +RX protection. It allows us to never trigger nomapping on nomapping refill
> +routine which would (obviously) not work... Once this is done, we can flush the
> +4 LTLB entries for kernel refill in order to be sure there is no stalled
> +entries and that new entries inserted in JTLB will apply.
> +
> +By default, the following policy is applied on vmlinux sections:
> +
> + - init_data: RW
> + - init_text: RX (or RWX if parameter rodata=off)
> + - text: RX (or RWX if parameter rodata=off)
> + - rodata: RW before init, RO after init
> + - sdata: RW
> +
> +Kernel RWX mode can then be switched on/off using /sys/kvx/kernel_rwx file.
> +
> +Privilege Level
> +---------------
> +
> +Since we are using privilege levels on kvx, we make use of the virtual
> +spaces to be in the same space as the user. The kernel will have the

I'm failing to parse this. What will be in the same space as user?

> +$ps.mmup set in kernel (PL1) and unset for user (PL2).
> +As said in kvx documentation, we have two cases when the kernel is
> +booted:
> +
> + - Either we have been booted by someone (bootloader, hypervisor, etc)
> + - Or we are alone (boot from flash)
> +
> +In both cases, we will use the virtual space 0. Indeed, if we are alone
> +on the core, then it means nobody is using the MMU and we can take the
> +first virtual space. If not alone, then when writing an entry to the tlb
> +using writetlb instruction, the hypervisor will catch it and change the
> +virtual space accordingly.
> +
> +Memblock
> +========
> +
> +When the kernel starts there is no memory allocator available. One of the first
> +step in the kernel is to detect the amount of DDR available by getting this
> +information in the device tree and initialize the low-level "memblock" allocator.
> +
> +We start by reserving memory for the whole kernel. For instance with a device
> +tree containing 512MB of DDR you could see the following boot messages::
> +
> +  setup_bootmem: Memory  : 0x100000000 - 0x120000000
> +  setup_bootmem: Reserved: 0x10001f000 - 0x1002d1bc0
> +
> +During the paging init we need to set:
> +
> + - min_low_pfn that is the lowest PFN available in the system
> + - max_low_pfn that indicates the end if NORMAL zone
> + - max_pfn that is the number of pages in the system
> +
> +This setting is used for dividing memory into pages and for configuring the
> +zone. See the memory map section for more information about ZONE.
> +
> +Zones are configured in free_area_init_core(). During start_kernel() other
> +allocations are done for command line, cpu areas, PID hash table, different
> +caches for VFS. This allocator is used until mem_init() is called.
> +
> +mem_init() is provided by the architecture. For MPPA we just call
> +free_all_bootmem() that will go through all pages that are not used by the
> +low level allocator and mark them as not used. So physical pages that are
> +reserved for the kernel are still used and remain in physical memory. All pages
> +released will now be used by the buddy allocator.

There is nothing kvx-specific in the memblock section. Please strive to
keep Docimentaion/arch/kvx about architecture specific details.

> +Peripherals
> +-----------
> +
> +Peripherals are mapped using standard ioremap infrastructure, therefore
> +mapped addresses are located in the vmalloc space.
> +
> +LTLB Usage
> +----------
> +
> +LTLB is used to add resident mapping which allows for faster MMU lookup.
> +Currently, the LTLB is used to map some mandatory kernel pages and to allow fast
> +accesses to l2 cache (mailbox and registers).
> +When CONFIG_STRICT_KERNEL_RWX is disabled, 4 entries are reserved for kernel

Please remove CONFIG_STRICT_KERNEL_RWX documentation for now. This should
be a part of a patchset than enables CONFIG_STRICT_KERNEL_RWX.

> +TLB refill using 512MB pages. When CONFIG_STRICT_KERNEL_RWX is enabled, these
> +entries are unused since kernel is paginated using the same mecanism than for
> +user (page walking and entries in JTLB)
> +
> +Page Table
> +==========
> +
> +We only support three levels for the page table and 4KB for page size.
> +
> +3 levels page table
> +-------------------
> +
> +::
> +
> +  ...-----+--------+--------+--------+--------+--------+
> +        40|39    32|31    24|23    16|15     8|7      0|
> +  ...-----++-------+--+-----+---+----+----+---+--------+
> +           |          |         |         |
> +           |          |         |         +--->  [11:0] Offset (12 bits)
> +           |          |         +------------->  [20:12] PTE offset (9 bits)
> +           |          +----------------------->  [29:21] PMD offset (9 bits)
> +           +---------------------------------->  [39:30] PGD offset (10 bits)
> +
> +Bits 40 to 64 are signed extended according to bit 39. If bit 39 is equal to 1
> +we are in kernel space.

Previously you've mentioned that bit 40 is used to differentiate kernel and
user space. Which one is correct?

> +
> +As 10 bits are used for PGD we need to allocate 2 pages.
> +
> +PTE format
> +==========

Shouldn't PTE format section be the same level as "3 levels page table"?

> +
> +About the format of the PTE entry, as we are not forced by hardware for choices,
> +we choose to follow the format described in the RiscV implementation as a
> +starting point::
> +
> +   +---------+--------+----+--------+---+---+---+---+---+---+------+---+---+
> +   | 63..23  | 22..13 | 12 | 11..10 | 9 | 8 | 7 | 6 | 5 | 4 | 3..2 | 1 | 0 |
> +   +---------+--------+----+--------+---+---+---+---+---+---+------+---+---+
> +       PFN     Unused   S    PageSZ   H   G   X   W   R   D    CP    A   P
> +         where:
> +          P: Present
> +          A: Accessed
> +          CP: Cache policy
> +          D: Dirty
> +          R: Read
> +          W: Write
> +          X: Executable
> +          G: Global
> +          H: Huge page
> +          PageSZ: Page size as set in TLB format (0:4KB, 1:64KB, 2:2MB, 3:512MB)
> +          S: Soft/Special
> +          PFN: Page frame number (depends on page size)
> +
> +Huge bit must be somewhere in the first 12 bits to be able to detect it
> +when reading the PMD entry.
> +
> +PageSZ must be on bit 10 and 11 because it matches the TEL.PS bits. And
> +by doing that it is easier in assembly to set the TEL.PS to PageSZ.
> +
> +Fast TLB refill
> +===============
> +
> +kvx core does not feature a hardware page walker. This work must be done
> +by the core in software. In order to optimize TLB refill, a special fast
> +path is taken when entering in kernel space.
> +In order to speed up the process, the following actions are taken:
> +
> + 1. Save some registers in a per process scratchpad
> + 2. If the trap is a nomapping then try the fastpath
> + 3. Save some more registers for this fastpath
> + 4. Check if faulting address is a memory direct mapping one.
> +
> +    * If entry is a direct mapping one and RWX is not enabled, add an entry into LTLB
> +    * If not, continue
> +
> + 5. Try to walk the page table
> +
> +    * If entry is not present, take the slowpath (do_page_fault)
> +
> + 6. Refill the tlb properly
> + 7. Exit by restoring only a few registers
> +
> +ASN Handling
> +============
> +
> +Disclaimer: Some part of this are taken from ARC architecture.
> +
> +kvx MMU provides 9-bit ASN (Address Space Number) in order to tag TLB entries.
> +It allows for multiple process with the same virtual space to cohabit without
> +the need to flush TLB everytime we context switch.
> +kvx implementation to use them is based on other architectures (such as arc
> +or xtensa) and uses a wrapping ASN counter containing both cycle/generation and
> +asn.
> +
> +::
> +
> +  +---------+--------+
> +  |63     10|9      0|
> +  +---------+--------+
> +    Cycle      ASN
> +
> +This ASN counter is incremented monotonously to allocate new ASNs. When the
> +counter reaches 511 (9 bit), TLB is completely flushed and a new cycle is
> +started. A new allocation cycle, post rollover, could potentially reassign an
> +ASN to a different task. Thus the rule is to reassign an ASN when the current
> +context cycles does not match the allocation cycle.
> +The 64 bit @cpu_asn_cache (and mm->asn) have 9 bits MMU ASN and rest 55 bits
> +serve as cycle/generation indicator and natural 64 bit unsigned math
> +automagically increments the generation when lower 9 bits rollover.
> +When the counter completely wraps, we reset the counter to first cycle value
> +(ie cycle = 1). This allows to distinguish context without any ASN and old cycle
> +generated value with the same operation (XOR on cycle).
> +
> +Huge page
> +=========
> +
> +Currently only 3 level page table has been implemented for 4KB base page size.
> +So the page shift is 12 bits, the pmd shift is 21 and the pgdir shift is 30 bits.
> +This choice implies that for 4KB base page size if we use a PMD as a huge
> +page the size will be 2MB and if we use a PUD as a huge page it will be 1GB.
> +
> +To support other huge page sizes (64KB and 512MB) we need to use several
> +contiguous entries in the page table. For huge page of 64KB we will need to
> +use 16 entries in the PTE and for a huge page of 512MB it means that 256
> +entries in PMD will be used.
> +
> +Debug
> +=====
> +
> +In order to debug the page table and tlb entries, gdb scripts contains commands
> +which allows to dump the page table:
> +
> +:``lx-kvx-page-table-walk``: Display the current process page table by default
> +:``lx-kvx-tlb-decode``: Display the content of $tel and $teh into something readable
> +
> +Other commands available in kvx-gdb are the following:
> +
> +:``mppa-dump-tlb``: Display the content of TLBs (JTLB and LTLB)
> +:``mppa-lookup-addr``: Find physical address matching a virtual one

-- 
Sincerely yours,
Mike.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

