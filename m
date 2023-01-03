Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E0C65D4FD
	for <lists+linux-audit@lfdr.de>; Wed,  4 Jan 2023 15:07:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672841254;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kwYkx90Qxtcs4Sc7LndEMVJxoIGECdBl2ayNkr86Ajg=;
	b=RXEk4Jm4Kk23i46p1bJCYnk7Y1lik1VR+xOEF462O9MzK1cN63MAWjJiWYYY1pH3jOuiSe
	lQ8OxatNzd/cSR2nImp5WMZEgwA8TCvjNr1RnJF9A6dbfSAT+HcJcMYAypnJ0fH3dQNrNM
	On5vWT67ozly1/xsYlJKzILtYDykrow=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-379-w2e0Ml4WNn6R8X5jNqQECQ-1; Wed, 04 Jan 2023 09:07:32 -0500
X-MC-Unique: w2e0Ml4WNn6R8X5jNqQECQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8FAB18030CC;
	Wed,  4 Jan 2023 14:07:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C2BE739D6D;
	Wed,  4 Jan 2023 14:07:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AB0131946A70;
	Wed,  4 Jan 2023 14:07:20 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3A7291946588 for <linux-audit@listman.corp.redhat.com>;
 Tue,  3 Jan 2023 16:50:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2ABB4140EBF6; Tue,  3 Jan 2023 16:50:05 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 22010140EBF4
 for <linux-audit@redhat.com>; Tue,  3 Jan 2023 16:50:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9F272806041
 for <linux-audit@redhat.com>; Tue,  3 Jan 2023 16:50:04 +0000 (UTC)
Received: from fx409.security-mail.net (smtpout253.security-mail.net
 [46.30.205.253]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-354-3HGwWFJ4NpG4IC67XllzIw-1; Tue, 03 Jan 2023 11:50:03 -0500
X-MC-Unique: 3HGwWFJ4NpG4IC67XllzIw-1
Received: from localhost (fx409.security-mail.net [127.0.0.1])
 by fx409.security-mail.net (Postfix) with ESMTP id BA5F0349870
 for <linux-audit@redhat.com>; Tue,  3 Jan 2023 17:44:32 +0100 (CET)
Received: from fx409 (fx409.security-mail.net [127.0.0.1]) by
 fx409.security-mail.net (Postfix) with ESMTP id 36C773496C7; Tue,  3 Jan
 2023 17:44:32 +0100 (CET)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx409.security-mail.net (Postfix) with ESMTPS id 251F534946B; Tue,  3 Jan
 2023 17:44:31 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id D835E27E03FB; Tue,  3 Jan 2023
 17:44:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id AEB8627E03F6; Tue,  3 Jan 2023 17:44:30 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 z0U0Q9npD5IP; Tue,  3 Jan 2023 17:44:30 +0100 (CET)
Received: from junon.lin.mbt.kalray.eu (unknown [192.168.37.161]) by
 zimbra2.kalray.eu (Postfix) with ESMTPSA id 573EC27E03F4; Tue,  3 Jan 2023
 17:44:30 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <436b.63b45b6f.21544.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu AEB8627E03F6
From: Yann Sionneau <ysionneau@kalray.eu>
To: Arnd Bergmann <arnd@arndb.de>
Subject: [RFC PATCH 00/25] Upstream kvx Linux port
Date: Tue,  3 Jan 2023 17:43:34 +0100
Message-ID: <20230103164359.24347-1-ysionneau@kalray.eu>
MIME-Version: 1.0
X-ALTERMIMEV2_out: done
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mailman-Approved-At: Wed, 04 Jan 2023 14:07:19 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Marc =?utf-8?b?UG91bGhpw6hz?= <dkm@kataplop.net>, linux-doc@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, Sebastian Reichel <sre@kernel.org>,
 Marius Gligor <mgligor@kalray.eu>, Oleg Nesterov <oleg@redhat.com>,
 linux-mm@kvack.org, Louis Morhet <lmorhet@kalray.eu>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Luc Michel <lmichel@kalray.eu>, linux-riscv@lists.infradead.org,
 Ashley Lesdalons <alesdalons@kalray.eu>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arch@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Thomas Costis <tcostis@kalray.eu>,
 Jonathan Corbet <corbet@lwn.net>, Jonathan Borne <jborne@kalray.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Samuel Jones <sjones@kalray.eu>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Steven Rostedt <rostedt@goodmis.org>,
 Jean-Christophe Pince <jcpince@gmail.com>, Waiman Long <longman@redhat.com>,
 Clement Leger <clement.leger@bootlin.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 linux-pm@vger.kernel.org, Yann Sionneau <ysionneau@kalray.eu>,
 Boqun Feng <boqun.feng@gmail.com>, Guillaume Thouvenin <gthouvenin@kalray.eu>,
 Julian Vetter <jvetter@kalray.eu>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Julien Hascoet <jhascoet@kalray.eu>, Jason Baron <jbaron@akamai.com>,
 Rob Herring <robh+dt@kernel.org>, Nick Piggin <npiggin@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Namhyung Kim <namhyung@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Josh Poimboeuf <jpoimboe@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Julien Villette <jvillette@kalray.eu>,
 Jules Maselbas <jmaselbas@kalray.eu>, Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Benjamin Mugnier <mugnier.benjamin@gmail.com>,
 Vincent Chardon <vincent.chardon@elsys-design.com>,
 Guillaume Missonnier <gmissonnier@kalray.eu>, linux-kernel@vger.kernel.org,
 Eric Paris <eparis@redhat.com>, Alex Michon <amichon@kalray.eu>,
 linux-perf-users@vger.kernel.org, linux-audit@redhat.com,
 Palmer Dabbelt <palmer@dabbelt.com>, Eric Biederman <ebiederm@xmission.com>,
 Jiri Olsa <jolsa@kernel.org>, Kieran Bingham <kbingham@kernel.org>,
 bpf@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch series adds support for the kv3-1 CPU architecture of the kvx family
found in the Coolidge (aka MPPA3-80) SoC of Kalray.

This is an RFC, since kvx support is not yet upstreamed into gcc/binutils,
therefore this patch series cannot be merged into Linux for now.

The goal is to have preliminary reviews and to fix problems early.

The Kalray VLIW processor family (kvx) has the following features:
* 32/64 bits execution mode
* 6-issue VLIW architecture
* 64 x 64bits general purpose registers
* SIMD instructions
* little-endian
* deep learning co-processor

Kalray kv3-1 core which is the third of the kvx family is embedded in Kalray
Coolidge SoC currently used on K200 and K200-LP boards.

The Coolidge SoC contains 5 clusters each of which is made of:
* 4MiB of on-chip memory (SMEM)
* 1 dedicated safety/security core (kv3-1 core).
* 16 PEs (Processing Elements) (kv3-1 cores).
* 16 Co-processors (one per PE)
* 2 Crypto accelerators

The Coolidge SoC contains the following features:
* 5 Clusters
* 2 100G Ethernet controllers
* 8 PCIe GEN4 controllers (Root Complex and Endpoint capable)
* 2 USB 2.0 controllers
* 1 Octal SPI-NOR flash controller
* 1 eMMC controller
* 3 Quad SPI controllers
* 6 UART
* 5 I2C controllers (3 of which are SMBus capable)
* 4 CAN controllers
* 1 OTP memory

A kvx toolchain can be built using:
# install dependencies: texinfo bison flex libgmp-dev libmpc-dev libmpfr-dev
$ git clone https://github.com/kalray/build-scripts
$ cd build-scripts
$ source last.refs
$ ./build-kvx-xgcc.sh output

The kvx toolchain will be installed in the "output" directory.

A buildroot image (kernel+rootfs) and toolchain can be built using:
$ git clone -b coolidge-for-upstream https://github.com/kalray/buildroot
$ cd buildroot
$ make O=build_kvx kvx_defconfig
$ make O=build_kvx

The vmlinux image can be found in buildroot/build_kvx/images/vmlinux.

If you are just interested in building the Linux kernel with no rootfs you can
just do this with the kvx-elf- toolchain:
$ make ARCH=kvx O=build_kvx CROSS_COMPILE=kvx-elf- default_defconfig
$ make ARCH=kvx O=build_kvx CROSS_COMPILE=kvx-elf- -j$(($(nproc) + 1))

The vmlinux ELF can be run with qemu by doing:
# install dependencies: ninja pkg-config libglib-2.0-dev cmake libfdt-dev libpixman-1-dev zlib1g-dev
$ git clone https://github.com/kalray/qemu-builder
$ cd qemu-builder
$ git submodule update --init
$ make -j$(($(nproc) + 1))
$ ./qemu-system-kvx -m 1024 -nographic -kernel <path/to/vmlinux>

Yann Sionneau (25):
  Documentation: kvx: Add basic documentation
  kvx: Add ELF-related definitions
  kvx: Add build infrastructure
  kvx: Add CPU definition headers
  kvx: Add atomic/locking headers
  kvx: Add other common headers
  kvx: Add boot and setup routines
  kvx: Add exception/interrupt handling
  kvx: irqchip: Add support for irq controllers
  kvx: Add process management
  kvx: Add memory management
  kvx: Add system call support
  kvx: Add signal handling support
  kvx: Add ELF relocations and module support
  kvx: Add misc common routines
  kvx: Add some library functions
  kvx: Add multi-processor (SMP) support
  kvx: Add kvx default config file
  kvx: power: scall poweroff driver
  kvx: gdb: add kvx related gdb helpers
  kvx: Add support for ftrace
  kvx: Add support for jump labels
  kvx: Add debugging related support
  kvx: Add support for CPU Perf Monitors
  kvx: Add support for cpuinfo

 .../kalray,kvx-core-intc.txt                  |   22 +
 .../devicetree/bindings/perf/kalray-pm.txt    |   21 +
 Documentation/kvx/kvx-exceptions.txt          |  246 +
 Documentation/kvx/kvx-iommu.txt               |  183 +
 Documentation/kvx/kvx-mmu.txt                 |  272 +
 Documentation/kvx/kvx-smp.txt                 |   36 +
 Documentation/kvx/kvx.txt                     |  268 +
 arch/kvx/Kconfig                              |  249 +
 arch/kvx/Kconfig.debug                        |   70 +
 arch/kvx/Makefile                             |   52 +
 arch/kvx/configs/default_defconfig            |  130 +
 arch/kvx/include/asm/Kbuild                   |   20 +
 arch/kvx/include/asm/asm-prototypes.h         |   14 +
 arch/kvx/include/asm/atomic.h                 |  104 +
 arch/kvx/include/asm/barrier.h                |   15 +
 arch/kvx/include/asm/bitops.h                 |  207 +
 arch/kvx/include/asm/bitrev.h                 |   32 +
 arch/kvx/include/asm/break_hook.h             |   69 +
 arch/kvx/include/asm/bug.h                    |   67 +
 arch/kvx/include/asm/cache.h                  |   46 +
 arch/kvx/include/asm/cacheflush.h             |  181 +
 arch/kvx/include/asm/clocksource.h            |   17 +
 arch/kvx/include/asm/cmpxchg.h                |  185 +
 arch/kvx/include/asm/current.h                |   22 +
 arch/kvx/include/asm/dame.h                   |   31 +
 arch/kvx/include/asm/debug.h                  |   35 +
 arch/kvx/include/asm/elf.h                    |  155 +
 arch/kvx/include/asm/fixmap.h                 |   47 +
 arch/kvx/include/asm/ftrace.h                 |   41 +
 arch/kvx/include/asm/futex.h                  |  141 +
 arch/kvx/include/asm/hardirq.h                |   14 +
 arch/kvx/include/asm/hugetlb.h                |   36 +
 arch/kvx/include/asm/hw_breakpoint.h          |   72 +
 arch/kvx/include/asm/hw_irq.h                 |   14 +
 arch/kvx/include/asm/insns.h                  |   16 +
 arch/kvx/include/asm/insns_defs.h             |  197 +
 arch/kvx/include/asm/io.h                     |   34 +
 arch/kvx/include/asm/ipi.h                    |   16 +
 arch/kvx/include/asm/irqflags.h               |   58 +
 arch/kvx/include/asm/jump_label.h             |   59 +
 arch/kvx/include/asm/l2_cache.h               |   75 +
 arch/kvx/include/asm/l2_cache_defs.h          |   64 +
 arch/kvx/include/asm/linkage.h                |   13 +
 arch/kvx/include/asm/mem_map.h                |   44 +
 arch/kvx/include/asm/mmu.h                    |  296 +
 arch/kvx/include/asm/mmu_context.h            |  156 +
 arch/kvx/include/asm/mmu_stats.h              |   38 +
 arch/kvx/include/asm/page.h                   |  187 +
 arch/kvx/include/asm/page_size.h              |   29 +
 arch/kvx/include/asm/pci.h                    |   36 +
 arch/kvx/include/asm/perf_event.h             |   90 +
 arch/kvx/include/asm/pgalloc.h                |  101 +
 arch/kvx/include/asm/pgtable-bits.h           |  102 +
 arch/kvx/include/asm/pgtable.h                |  451 ++
 arch/kvx/include/asm/privilege.h              |  211 +
 arch/kvx/include/asm/processor.h              |  176 +
 arch/kvx/include/asm/ptrace.h                 |  217 +
 arch/kvx/include/asm/pwr_ctrl.h               |   45 +
 arch/kvx/include/asm/rm_fw.h                  |   16 +
 arch/kvx/include/asm/sections.h               |   18 +
 arch/kvx/include/asm/setup.h                  |   29 +
 arch/kvx/include/asm/sfr.h                    |  107 +
 arch/kvx/include/asm/sfr_defs.h               | 5028 +++++++++++++++++
 arch/kvx/include/asm/smp.h                    |   42 +
 arch/kvx/include/asm/sparsemem.h              |   15 +
 arch/kvx/include/asm/spinlock.h               |   16 +
 arch/kvx/include/asm/spinlock_types.h         |   17 +
 arch/kvx/include/asm/stackprotector.h         |   47 +
 arch/kvx/include/asm/stacktrace.h             |   44 +
 arch/kvx/include/asm/string.h                 |   20 +
 arch/kvx/include/asm/swab.h                   |   48 +
 arch/kvx/include/asm/switch_to.h              |   21 +
 arch/kvx/include/asm/symbols.h                |   16 +
 arch/kvx/include/asm/sys_arch.h               |   51 +
 arch/kvx/include/asm/syscall.h                |   73 +
 arch/kvx/include/asm/syscalls.h               |   21 +
 arch/kvx/include/asm/thread_info.h            |   78 +
 arch/kvx/include/asm/timex.h                  |   20 +
 arch/kvx/include/asm/tlb.h                    |   24 +
 arch/kvx/include/asm/tlb_defs.h               |  131 +
 arch/kvx/include/asm/tlbflush.h               |   58 +
 arch/kvx/include/asm/traps.h                  |   76 +
 arch/kvx/include/asm/types.h                  |   12 +
 arch/kvx/include/asm/uaccess.h                |  324 ++
 arch/kvx/include/asm/unistd.h                 |   11 +
 arch/kvx/include/asm/vermagic.h               |   12 +
 arch/kvx/include/asm/vmalloc.h                |   10 +
 arch/kvx/include/uapi/asm/Kbuild              |    1 +
 arch/kvx/include/uapi/asm/bitsperlong.h       |   14 +
 arch/kvx/include/uapi/asm/byteorder.h         |   12 +
 arch/kvx/include/uapi/asm/cachectl.h          |   25 +
 arch/kvx/include/uapi/asm/ptrace.h            |  114 +
 arch/kvx/include/uapi/asm/sigcontext.h        |   16 +
 arch/kvx/include/uapi/asm/unistd.h            |   16 +
 arch/kvx/kernel/Makefile                      |   27 +
 arch/kvx/kernel/asm-offsets.c                 |  157 +
 arch/kvx/kernel/break_hook.c                  |   77 +
 arch/kvx/kernel/common.c                      |   11 +
 arch/kvx/kernel/cpuinfo.c                     |   96 +
 arch/kvx/kernel/dame_handler.c                |  113 +
 arch/kvx/kernel/debug.c                       |   64 +
 arch/kvx/kernel/entry.S                       | 1759 ++++++
 arch/kvx/kernel/ftrace.c                      |  339 ++
 arch/kvx/kernel/head.S                        |  612 ++
 arch/kvx/kernel/hw_breakpoint.c               |  556 ++
 arch/kvx/kernel/insns.c                       |  146 +
 arch/kvx/kernel/io.c                          |   96 +
 arch/kvx/kernel/irq.c                         |   78 +
 arch/kvx/kernel/jump_label.c                  |   34 +
 arch/kvx/kernel/kvx_ksyms.c                   |   29 +
 arch/kvx/kernel/l2_cache.c                    |  448 ++
 arch/kvx/kernel/mcount.S                      |  340 ++
 arch/kvx/kernel/module.c                      |  148 +
 arch/kvx/kernel/perf_event.c                  |  609 ++
 arch/kvx/kernel/process.c                     |  212 +
 arch/kvx/kernel/prom.c                        |   24 +
 arch/kvx/kernel/ptrace.c                      |  461 ++
 arch/kvx/kernel/reset.c                       |   37 +
 arch/kvx/kernel/return_address.c              |   55 +
 arch/kvx/kernel/setup.c                       |  178 +
 arch/kvx/kernel/signal.c                      |  266 +
 arch/kvx/kernel/smp.c                         |  110 +
 arch/kvx/kernel/smpboot.c                     |  127 +
 arch/kvx/kernel/stacktrace.c                  |  173 +
 arch/kvx/kernel/sys_kvx.c                     |   58 +
 arch/kvx/kernel/syscall_table.c               |   19 +
 arch/kvx/kernel/time.c                        |  242 +
 arch/kvx/kernel/traps.c                       |  243 +
 arch/kvx/kernel/vdso.c                        |   87 +
 arch/kvx/kernel/vmlinux.lds.S                 |  173 +
 arch/kvx/lib/Makefile                         |    6 +
 arch/kvx/lib/clear_page.S                     |   40 +
 arch/kvx/lib/copy_page.S                      |   90 +
 arch/kvx/lib/delay.c                          |   39 +
 arch/kvx/lib/memcpy.c                         |   70 +
 arch/kvx/lib/memset.S                         |  351 ++
 arch/kvx/lib/strlen.S                         |  122 +
 arch/kvx/lib/usercopy.S                       |   90 +
 arch/kvx/mm/Makefile                          |   10 +
 arch/kvx/mm/cacheflush.c                      |  154 +
 arch/kvx/mm/dma-mapping.c                     |   95 +
 arch/kvx/mm/extable.c                         |   24 +
 arch/kvx/mm/fault.c                           |  264 +
 arch/kvx/mm/hugetlbpage.c                     |  317 ++
 arch/kvx/mm/init.c                            |  527 ++
 arch/kvx/mm/kernel_rwx.c                      |  228 +
 arch/kvx/mm/mmap.c                            |   31 +
 arch/kvx/mm/mmu.c                             |  204 +
 arch/kvx/mm/mmu_stats.c                       |   94 +
 arch/kvx/mm/tlb.c                             |  433 ++
 arch/kvx/platform/Makefile                    |    7 +
 arch/kvx/platform/ipi.c                       |  110 +
 arch/kvx/platform/pwr_ctrl.c                  |   93 +
 drivers/irqchip/Kconfig                       |   27 +
 drivers/irqchip/Makefile                      |    4 +
 drivers/irqchip/irq-kvx-apic-gic.c            |  349 ++
 drivers/irqchip/irq-kvx-apic-mailbox.c        |  465 ++
 drivers/irqchip/irq-kvx-core-intc.c           |   82 +
 drivers/irqchip/irq-kvx-itgen.c               |  224 +
 drivers/power/reset/kvx-scall-poweroff.c      |   53 +
 include/linux/cpuhotplug.h                    |    2 +
 include/linux/irqchip/irq-kvx-apic-gic.h      |   21 +
 include/linux/irqchip/irq-kvx-apic-mailbox.h  |   29 +
 include/linux/irqchip/irq-kvx-itgen.h         |   24 +
 include/uapi/linux/audit.h                    |    1 +
 include/uapi/linux/elf-em.h                   |    1 +
 include/uapi/linux/elf.h                      |    1 +
 scripts/gdb/arch/Makefile                     |   11 +
 scripts/gdb/arch/__init__.py                  |    1 +
 scripts/gdb/arch/kvx/Makefile                 |   25 +
 scripts/gdb/arch/kvx/__init__.py              |    1 +
 scripts/gdb/arch/kvx/constants.py.in          |   74 +
 scripts/gdb/arch/kvx/mmu.py                   |  199 +
 scripts/gdb/arch/kvx/page_table_walk.py       |  207 +
 tools/include/uapi/asm/bitsperlong.h          |    2 +
 175 files changed, 25814 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/kalray,kvx-core-intc.txt
 create mode 100644 Documentation/devicetree/bindings/perf/kalray-pm.txt
 create mode 100644 Documentation/kvx/kvx-exceptions.txt
 create mode 100644 Documentation/kvx/kvx-iommu.txt
 create mode 100644 Documentation/kvx/kvx-mmu.txt
 create mode 100644 Documentation/kvx/kvx-smp.txt
 create mode 100644 Documentation/kvx/kvx.txt
 create mode 100644 arch/kvx/Kconfig
 create mode 100644 arch/kvx/Kconfig.debug
 create mode 100644 arch/kvx/Makefile
 create mode 100644 arch/kvx/configs/default_defconfig
 create mode 100644 arch/kvx/include/asm/Kbuild
 create mode 100644 arch/kvx/include/asm/asm-prototypes.h
 create mode 100644 arch/kvx/include/asm/atomic.h
 create mode 100644 arch/kvx/include/asm/barrier.h
 create mode 100644 arch/kvx/include/asm/bitops.h
 create mode 100644 arch/kvx/include/asm/bitrev.h
 create mode 100644 arch/kvx/include/asm/break_hook.h
 create mode 100644 arch/kvx/include/asm/bug.h
 create mode 100644 arch/kvx/include/asm/cache.h
 create mode 100644 arch/kvx/include/asm/cacheflush.h
 create mode 100644 arch/kvx/include/asm/clocksource.h
 create mode 100644 arch/kvx/include/asm/cmpxchg.h
 create mode 100644 arch/kvx/include/asm/current.h
 create mode 100644 arch/kvx/include/asm/dame.h
 create mode 100644 arch/kvx/include/asm/debug.h
 create mode 100644 arch/kvx/include/asm/elf.h
 create mode 100644 arch/kvx/include/asm/fixmap.h
 create mode 100644 arch/kvx/include/asm/ftrace.h
 create mode 100644 arch/kvx/include/asm/futex.h
 create mode 100644 arch/kvx/include/asm/hardirq.h
 create mode 100644 arch/kvx/include/asm/hugetlb.h
 create mode 100644 arch/kvx/include/asm/hw_breakpoint.h
 create mode 100644 arch/kvx/include/asm/hw_irq.h
 create mode 100644 arch/kvx/include/asm/insns.h
 create mode 100644 arch/kvx/include/asm/insns_defs.h
 create mode 100644 arch/kvx/include/asm/io.h
 create mode 100644 arch/kvx/include/asm/ipi.h
 create mode 100644 arch/kvx/include/asm/irqflags.h
 create mode 100644 arch/kvx/include/asm/jump_label.h
 create mode 100644 arch/kvx/include/asm/l2_cache.h
 create mode 100644 arch/kvx/include/asm/l2_cache_defs.h
 create mode 100644 arch/kvx/include/asm/linkage.h
 create mode 100644 arch/kvx/include/asm/mem_map.h
 create mode 100644 arch/kvx/include/asm/mmu.h
 create mode 100644 arch/kvx/include/asm/mmu_context.h
 create mode 100644 arch/kvx/include/asm/mmu_stats.h
 create mode 100644 arch/kvx/include/asm/page.h
 create mode 100644 arch/kvx/include/asm/page_size.h
 create mode 100644 arch/kvx/include/asm/pci.h
 create mode 100644 arch/kvx/include/asm/perf_event.h
 create mode 100644 arch/kvx/include/asm/pgalloc.h
 create mode 100644 arch/kvx/include/asm/pgtable-bits.h
 create mode 100644 arch/kvx/include/asm/pgtable.h
 create mode 100644 arch/kvx/include/asm/privilege.h
 create mode 100644 arch/kvx/include/asm/processor.h
 create mode 100644 arch/kvx/include/asm/ptrace.h
 create mode 100644 arch/kvx/include/asm/pwr_ctrl.h
 create mode 100644 arch/kvx/include/asm/rm_fw.h
 create mode 100644 arch/kvx/include/asm/sections.h
 create mode 100644 arch/kvx/include/asm/setup.h
 create mode 100644 arch/kvx/include/asm/sfr.h
 create mode 100644 arch/kvx/include/asm/sfr_defs.h
 create mode 100644 arch/kvx/include/asm/smp.h
 create mode 100644 arch/kvx/include/asm/sparsemem.h
 create mode 100644 arch/kvx/include/asm/spinlock.h
 create mode 100644 arch/kvx/include/asm/spinlock_types.h
 create mode 100644 arch/kvx/include/asm/stackprotector.h
 create mode 100644 arch/kvx/include/asm/stacktrace.h
 create mode 100644 arch/kvx/include/asm/string.h
 create mode 100644 arch/kvx/include/asm/swab.h
 create mode 100644 arch/kvx/include/asm/switch_to.h
 create mode 100644 arch/kvx/include/asm/symbols.h
 create mode 100644 arch/kvx/include/asm/sys_arch.h
 create mode 100644 arch/kvx/include/asm/syscall.h
 create mode 100644 arch/kvx/include/asm/syscalls.h
 create mode 100644 arch/kvx/include/asm/thread_info.h
 create mode 100644 arch/kvx/include/asm/timex.h
 create mode 100644 arch/kvx/include/asm/tlb.h
 create mode 100644 arch/kvx/include/asm/tlb_defs.h
 create mode 100644 arch/kvx/include/asm/tlbflush.h
 create mode 100644 arch/kvx/include/asm/traps.h
 create mode 100644 arch/kvx/include/asm/types.h
 create mode 100644 arch/kvx/include/asm/uaccess.h
 create mode 100644 arch/kvx/include/asm/unistd.h
 create mode 100644 arch/kvx/include/asm/vermagic.h
 create mode 100644 arch/kvx/include/asm/vmalloc.h
 create mode 100644 arch/kvx/include/uapi/asm/Kbuild
 create mode 100644 arch/kvx/include/uapi/asm/bitsperlong.h
 create mode 100644 arch/kvx/include/uapi/asm/byteorder.h
 create mode 100644 arch/kvx/include/uapi/asm/cachectl.h
 create mode 100644 arch/kvx/include/uapi/asm/ptrace.h
 create mode 100644 arch/kvx/include/uapi/asm/sigcontext.h
 create mode 100644 arch/kvx/include/uapi/asm/unistd.h
 create mode 100644 arch/kvx/kernel/Makefile
 create mode 100644 arch/kvx/kernel/asm-offsets.c
 create mode 100644 arch/kvx/kernel/break_hook.c
 create mode 100644 arch/kvx/kernel/common.c
 create mode 100644 arch/kvx/kernel/cpuinfo.c
 create mode 100644 arch/kvx/kernel/dame_handler.c
 create mode 100644 arch/kvx/kernel/debug.c
 create mode 100644 arch/kvx/kernel/entry.S
 create mode 100644 arch/kvx/kernel/ftrace.c
 create mode 100644 arch/kvx/kernel/head.S
 create mode 100644 arch/kvx/kernel/hw_breakpoint.c
 create mode 100644 arch/kvx/kernel/insns.c
 create mode 100644 arch/kvx/kernel/io.c
 create mode 100644 arch/kvx/kernel/irq.c
 create mode 100644 arch/kvx/kernel/jump_label.c
 create mode 100644 arch/kvx/kernel/kvx_ksyms.c
 create mode 100644 arch/kvx/kernel/l2_cache.c
 create mode 100644 arch/kvx/kernel/mcount.S
 create mode 100644 arch/kvx/kernel/module.c
 create mode 100644 arch/kvx/kernel/perf_event.c
 create mode 100644 arch/kvx/kernel/process.c
 create mode 100644 arch/kvx/kernel/prom.c
 create mode 100644 arch/kvx/kernel/ptrace.c
 create mode 100644 arch/kvx/kernel/reset.c
 create mode 100644 arch/kvx/kernel/return_address.c
 create mode 100644 arch/kvx/kernel/setup.c
 create mode 100644 arch/kvx/kernel/signal.c
 create mode 100644 arch/kvx/kernel/smp.c
 create mode 100644 arch/kvx/kernel/smpboot.c
 create mode 100644 arch/kvx/kernel/stacktrace.c
 create mode 100644 arch/kvx/kernel/sys_kvx.c
 create mode 100644 arch/kvx/kernel/syscall_table.c
 create mode 100644 arch/kvx/kernel/time.c
 create mode 100644 arch/kvx/kernel/traps.c
 create mode 100644 arch/kvx/kernel/vdso.c
 create mode 100644 arch/kvx/kernel/vmlinux.lds.S
 create mode 100644 arch/kvx/lib/Makefile
 create mode 100644 arch/kvx/lib/clear_page.S
 create mode 100644 arch/kvx/lib/copy_page.S
 create mode 100644 arch/kvx/lib/delay.c
 create mode 100644 arch/kvx/lib/memcpy.c
 create mode 100644 arch/kvx/lib/memset.S
 create mode 100644 arch/kvx/lib/strlen.S
 create mode 100644 arch/kvx/lib/usercopy.S
 create mode 100644 arch/kvx/mm/Makefile
 create mode 100644 arch/kvx/mm/cacheflush.c
 create mode 100644 arch/kvx/mm/dma-mapping.c
 create mode 100644 arch/kvx/mm/extable.c
 create mode 100644 arch/kvx/mm/fault.c
 create mode 100644 arch/kvx/mm/hugetlbpage.c
 create mode 100644 arch/kvx/mm/init.c
 create mode 100644 arch/kvx/mm/kernel_rwx.c
 create mode 100644 arch/kvx/mm/mmap.c
 create mode 100644 arch/kvx/mm/mmu.c
 create mode 100644 arch/kvx/mm/mmu_stats.c
 create mode 100644 arch/kvx/mm/tlb.c
 create mode 100644 arch/kvx/platform/Makefile
 create mode 100644 arch/kvx/platform/ipi.c
 create mode 100644 arch/kvx/platform/pwr_ctrl.c
 create mode 100644 drivers/irqchip/irq-kvx-apic-gic.c
 create mode 100644 drivers/irqchip/irq-kvx-apic-mailbox.c
 create mode 100644 drivers/irqchip/irq-kvx-core-intc.c
 create mode 100644 drivers/irqchip/irq-kvx-itgen.c
 create mode 100644 drivers/power/reset/kvx-scall-poweroff.c
 create mode 100644 include/linux/irqchip/irq-kvx-apic-gic.h
 create mode 100644 include/linux/irqchip/irq-kvx-apic-mailbox.h
 create mode 100644 include/linux/irqchip/irq-kvx-itgen.h
 create mode 100644 scripts/gdb/arch/Makefile
 create mode 100644 scripts/gdb/arch/__init__.py
 create mode 100644 scripts/gdb/arch/kvx/Makefile
 create mode 100644 scripts/gdb/arch/kvx/__init__.py
 create mode 100644 scripts/gdb/arch/kvx/constants.py.in
 create mode 100644 scripts/gdb/arch/kvx/mmu.py
 create mode 100644 scripts/gdb/arch/kvx/page_table_walk.py

-- 
2.37.2





--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

