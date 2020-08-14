Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 71E7A245110
	for <lists+linux-audit@lfdr.de>; Sat, 15 Aug 2020 15:51:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597499498;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LQ+RVg8NcPoZqFkxhjwM70YXigWXc1q1gsHonBP5WAk=;
	b=fF17WA64YJf3yTVqFKHtFNvOCnqHCkGjsVT83bMVrwEKO5jk7iSW2u67llTygLy+rslloi
	6m2H2uh/Jhq5/SWN7iCZG0oHc6W3UoKtinXKNaHyGY4FDkZYQKYqQhcdU3e/TQNPazqR0j
	XXgq/XCL+PWDfH26e1tCJd+JZW7E9NQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-WLRVusYKPqu4T05ylu4a6Q-1; Sat, 15 Aug 2020 09:51:35 -0400
X-MC-Unique: WLRVusYKPqu4T05ylu4a6Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C33A3801AAE;
	Sat, 15 Aug 2020 13:51:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D57574F45;
	Sat, 15 Aug 2020 13:51:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 573714EE19;
	Sat, 15 Aug 2020 13:51:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07EN93eP012036 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 14 Aug 2020 19:09:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 83E2D54596; Fri, 14 Aug 2020 23:09:03 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.51])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 896D374E17;
	Fri, 14 Aug 2020 23:08:54 +0000 (UTC)
Date: Fri, 14 Aug 2020 19:08:51 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: kernel test robot <rong.a.chen@intel.com>
Subject: Re: [audit] c4dad0aab3: canonical_address#:#[##]
Message-ID: <20200814230851.sn4oiddwcaoqhvso@madcap2.tricolour.ca>
References: <20200809063600.GC1538@shao2-debian>
MIME-Version: 1.0
In-Reply-To: <20200809063600.GC1538@shao2-debian>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Sat, 15 Aug 2020 09:50:55 -0400
Cc: lkp@lists.01.org, Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.004
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-08-09 14:36, kernel test robot wrote:
> Greeting,
> 
> FYI, we noticed the following commit (built with clang-12):
> 
> commit: c4dad0aab3fca0c1f0baa4cc84b6ec91b7ebf426 ("audit: tidy and extend netfilter_cfg x_tables")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 
> 
> in testcase: trinity
> with following parameters:
> 
> 	runtime: 300s
> 
> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
> 
> 
> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> 
> caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):

This looks odd to me.  I don't see any audit involved in this and I've
heard other complaints that this bot has appeared to mis-attribute other
errors.  I had a quick look before I went on vacation a week ago and was
back today briefly.  I'll be away until the 24th and won't be able to
look before then.

> +---------------------------------------------+------------+------------+
> |                                             | 9d2161bed4 | c4dad0aab3 |
> +---------------------------------------------+------------+------------+
> | boot_successes                              | 0          | 0          |
> | boot_failures                               | 8          | 8          |
> | BUG:unable_to_handle_page_fault_for_address | 8          | 8          |
> | Oops:#[##]                                  | 8          | 8          |
> | RIP:slob_alloc                              | 8          |            |
> | Kernel_panic-not_syncing:Fatal_exception    | 8          | 8          |
> | canonical_address#:#[##]                    | 0          | 8          |
> | RIP:copy_user_generic_unrolled              | 0          | 8          |
> | BUG:kernel_NULL_pointer_dereference,address | 0          | 8          |
> +---------------------------------------------+------------+------------+
> 
> 
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
> 
> 
> [    3.977763] BUG: unable to handle page fault for address: ffff88842c3e6002
> [    3.978199] #PF: supervisor write access in kernel mode
> [    3.978520] #PF: error_code(0x0002) - not-present page
> [    3.978836] PGD 6401067 P4D 6401067 PUD f000ff53f000ff53 
> [    3.978846] general protection fault, probably for non-canonical address 0xa000328280002b08: 0000 [#1] DEBUG_PAGEALLOC PTI
> [    3.979870] CPU: 0 PID: 0 Comm: swapper Not tainted 5.7.0-rc1-00004-gc4dad0aab3fca #1
> [    3.980345] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.12.0-1 04/01/2014
> [    3.980865] RIP: 0010:copy_user_generic_unrolled+0x83/0xb0
> [    3.981201] Code: 4c 8b 5e 38 4c 89 47 20 4c 89 4f 28 4c 89 57 30 4c 89 5f 38 48 8d 76 40 48 8d 7f 40 ff c9 75 b6 89 d1 83 e2 07 c1 e9 03 74 12 <4c> 8b 06 4c 89 07 48 8d 76 08 48 8d 7f 08 ff c9 75 ee 21 d2 74 10
> [    3.982338] RSP: 0000:ffffffff838dfa88 EFLAGS: 00010002
> [    3.982656] RAX: ffffffff811fa36b RBX: ffffffff83a82880 RCX: 0000000000000001
> [    3.983090] RDX: 0000000000000000 RSI: a000328280002b08 RDI: ffffffff838dfac0
> [    3.983537] RBP: 0000000000000093 R08: 3030306620445550 R09: 3030306633356666
> [    3.983972] R10: 6633356666303030 R11: 2033356666303030 R12: ffffffff838dfac0
> [    3.984406] R13: ffffffffffffffff R14: a000328280002b08 R15: 0000000000000008
> [    3.984841] FS:  0000000000000000(0000) GS:ffffffff83a99000(0000) knlGS:0000000000000000
> [    3.985333] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    3.985684] CR2: ffff88842c3e6002 CR3: 0000000003a7a000 CR4: 00000000000406b0
> [    3.986121] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [    3.986556] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [    3.986996] Call Trace:
> [    3.987153] Modules linked in:
> [    3.987349] random: get_random_bytes called from print_oops_end_marker+0x28/0x52 with crng_init=0
> [    3.987352] ---[ end trace 79cfc4eb7b4892f4 ]---
> 
> 
> To reproduce:
> 
>         # build kernel
> 	cd linux
> 	cp config-5.7.0-rc1-00004-gc4dad0aab3fca .config
> 	make HOSTCC=clang-12 CC=clang-12 ARCH=x86_64 olddefconfig prepare modules_prepare bzImage
> 
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script # job-script is attached in this email
> 
> 
> 
> Thanks,
> Rong Chen
> 

> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/x86_64 5.7.0-rc1 Kernel Configuration
> #
> 
> #
> # Compiler: clang version 12.0.0 (git://gitmirror/llvm_project a97dfdc30b5bdec7d6cdcb9f421ef5a288495420)
> #
> CONFIG_GCC_VERSION=0
> CONFIG_LD_VERSION=0
> CONFIG_CC_IS_CLANG=y
> CONFIG_CLANG_VERSION=120000
> CONFIG_CC_CAN_LINK=y
> CONFIG_CC_HAS_ASM_GOTO=y
> CONFIG_CC_HAS_ASM_INLINE=y
> # CONFIG_CC_DISABLE_WARN_MAYBE_UNINITIALIZED is not set
> CONFIG_CONSTRUCTORS=y
> CONFIG_IRQ_WORK=y
> CONFIG_BUILDTIME_TABLE_SORT=y
> CONFIG_THREAD_INFO_IN_TASK=y
> 
> #
> # General setup
> #
> CONFIG_BROKEN_ON_SMP=y
> CONFIG_INIT_ENV_ARG_LIMIT=32
> # CONFIG_COMPILE_TEST is not set
> CONFIG_UAPI_HEADER_TEST=y
> CONFIG_LOCALVERSION=""
> CONFIG_LOCALVERSION_AUTO=y
> CONFIG_BUILD_SALT=""
> CONFIG_HAVE_KERNEL_GZIP=y
> CONFIG_HAVE_KERNEL_BZIP2=y
> CONFIG_HAVE_KERNEL_LZMA=y
> CONFIG_HAVE_KERNEL_XZ=y
> CONFIG_HAVE_KERNEL_LZO=y
> CONFIG_HAVE_KERNEL_LZ4=y
> # CONFIG_KERNEL_GZIP is not set
> CONFIG_KERNEL_BZIP2=y
> # CONFIG_KERNEL_LZMA is not set
> # CONFIG_KERNEL_XZ is not set
> # CONFIG_KERNEL_LZO is not set
> # CONFIG_KERNEL_LZ4 is not set
> CONFIG_DEFAULT_HOSTNAME="(none)"
> # CONFIG_SWAP is not set
> CONFIG_SYSVIPC=y
> CONFIG_SYSVIPC_SYSCTL=y
> # CONFIG_POSIX_MQUEUE is not set
> # CONFIG_CROSS_MEMORY_ATTACH is not set
> # CONFIG_USELIB is not set
> # CONFIG_AUDIT is not set
> CONFIG_HAVE_ARCH_AUDITSYSCALL=y
> 
> #
> # IRQ subsystem
> #
> CONFIG_GENERIC_IRQ_PROBE=y
> CONFIG_GENERIC_IRQ_SHOW=y
> CONFIG_GENERIC_IRQ_INJECTION=y
> CONFIG_HARDIRQS_SW_RESEND=y
> CONFIG_GENERIC_IRQ_CHIP=y
> CONFIG_IRQ_DOMAIN=y
> CONFIG_IRQ_SIM=y
> CONFIG_IRQ_DOMAIN_HIERARCHY=y
> CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=y
> CONFIG_GENERIC_IRQ_RESERVATION_MODE=y
> CONFIG_IRQ_FORCED_THREADING=y
> CONFIG_SPARSE_IRQ=y
> CONFIG_GENERIC_IRQ_DEBUGFS=y
> # end of IRQ subsystem
> 
> CONFIG_CLOCKSOURCE_WATCHDOG=y
> CONFIG_ARCH_CLOCKSOURCE_INIT=y
> CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=y
> CONFIG_GENERIC_TIME_VSYSCALL=y
> CONFIG_GENERIC_CLOCKEVENTS=y
> CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
> CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=y
> CONFIG_GENERIC_CMOS_UPDATE=y
> 
> #
> # Timers subsystem
> #
> CONFIG_TICK_ONESHOT=y
> CONFIG_HZ_PERIODIC=y
> # CONFIG_NO_HZ_IDLE is not set
> CONFIG_NO_HZ=y
> CONFIG_HIGH_RES_TIMERS=y
> # end of Timers subsystem
> 
> CONFIG_PREEMPT_NONE=y
> # CONFIG_PREEMPT_VOLUNTARY is not set
> # CONFIG_PREEMPT is not set
> CONFIG_PREEMPT_COUNT=y
> 
> #
> # CPU/Task time and stats accounting
> #
> CONFIG_TICK_CPU_ACCOUNTING=y
> # CONFIG_VIRT_CPU_ACCOUNTING_GEN is not set
> # CONFIG_IRQ_TIME_ACCOUNTING is not set
> CONFIG_BSD_PROCESS_ACCT=y
> # CONFIG_BSD_PROCESS_ACCT_V3 is not set
> # CONFIG_TASKSTATS is not set
> # CONFIG_PSI is not set
> # end of CPU/Task time and stats accounting
> 
> #
> # RCU Subsystem
> #
> CONFIG_TINY_RCU=y
> CONFIG_RCU_EXPERT=y
> CONFIG_SRCU=y
> CONFIG_TINY_SRCU=y
> CONFIG_TASKS_RCU=y
> # end of RCU Subsystem
> 
> CONFIG_BUILD_BIN2C=y
> CONFIG_IKCONFIG=y
> CONFIG_IKCONFIG_PROC=y
> CONFIG_IKHEADERS=y
> CONFIG_LOG_BUF_SHIFT=20
> CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y
> 
> #
> # Scheduler features
> #
> # end of Scheduler features
> 
> CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
> CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
> CONFIG_CC_HAS_INT128=y
> CONFIG_ARCH_SUPPORTS_INT128=y
> CONFIG_CGROUPS=y
> CONFIG_PAGE_COUNTER=y
> CONFIG_MEMCG=y
> # CONFIG_BLK_CGROUP is not set
> CONFIG_CGROUP_SCHED=y
> CONFIG_FAIR_GROUP_SCHED=y
> CONFIG_CFS_BANDWIDTH=y
> CONFIG_RT_GROUP_SCHED=y
> CONFIG_CGROUP_PIDS=y
> CONFIG_CGROUP_RDMA=y
> CONFIG_CGROUP_FREEZER=y
> # CONFIG_CGROUP_HUGETLB is not set
> CONFIG_CGROUP_DEVICE=y
> # CONFIG_CGROUP_CPUACCT is not set
> CONFIG_CGROUP_PERF=y
> # CONFIG_CGROUP_DEBUG is not set
> CONFIG_NAMESPACES=y
> CONFIG_UTS_NS=y
> # CONFIG_TIME_NS is not set
> # CONFIG_IPC_NS is not set
> # CONFIG_USER_NS is not set
> CONFIG_PID_NS=y
> CONFIG_NET_NS=y
> CONFIG_CHECKPOINT_RESTORE=y
> CONFIG_SCHED_AUTOGROUP=y
> # CONFIG_SYSFS_DEPRECATED is not set
> # CONFIG_RELAY is not set
> CONFIG_BLK_DEV_INITRD=y
> CONFIG_INITRAMFS_SOURCE=""
> CONFIG_RD_GZIP=y
> CONFIG_RD_BZIP2=y
> CONFIG_RD_LZMA=y
> # CONFIG_RD_XZ is not set
> # CONFIG_RD_LZO is not set
> # CONFIG_RD_LZ4 is not set
> CONFIG_BOOT_CONFIG=y
> # CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
> CONFIG_CC_OPTIMIZE_FOR_SIZE=y
> CONFIG_SYSCTL=y
> CONFIG_HAVE_UID16=y
> CONFIG_SYSCTL_EXCEPTION_TRACE=y
> CONFIG_HAVE_PCSPKR_PLATFORM=y
> CONFIG_BPF=y
> CONFIG_EXPERT=y
> # CONFIG_UID16 is not set
> CONFIG_MULTIUSER=y
> # CONFIG_SGETMASK_SYSCALL is not set
> CONFIG_SYSFS_SYSCALL=y
> CONFIG_FHANDLE=y
> CONFIG_POSIX_TIMERS=y
> CONFIG_PRINTK=y
> CONFIG_PRINTK_NMI=y
> CONFIG_BUG=y
> CONFIG_ELF_CORE=y
> CONFIG_PCSPKR_PLATFORM=y
> # CONFIG_BASE_FULL is not set
> CONFIG_FUTEX=y
> CONFIG_FUTEX_PI=y
> CONFIG_EPOLL=y
> CONFIG_SIGNALFD=y
> CONFIG_TIMERFD=y
> CONFIG_EVENTFD=y
> CONFIG_SHMEM=y
> CONFIG_AIO=y
> CONFIG_IO_URING=y
> CONFIG_ADVISE_SYSCALLS=y
> CONFIG_HAVE_ARCH_USERFAULTFD_WP=y
> CONFIG_MEMBARRIER=y
> CONFIG_KALLSYMS=y
> CONFIG_KALLSYMS_ALL=y
> CONFIG_KALLSYMS_BASE_RELATIVE=y
> # CONFIG_BPF_SYSCALL is not set
> CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=y
> CONFIG_USERFAULTFD=y
> CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
> CONFIG_RSEQ=y
> # CONFIG_DEBUG_RSEQ is not set
> CONFIG_EMBEDDED=y
> CONFIG_HAVE_PERF_EVENTS=y
> CONFIG_PERF_USE_VMALLOC=y
> CONFIG_PC104=y
> 
> #
> # Kernel Performance Events And Counters
> #
> CONFIG_PERF_EVENTS=y
> CONFIG_DEBUG_PERF_USE_VMALLOC=y
> # end of Kernel Performance Events And Counters
> 
> CONFIG_VM_EVENT_COUNTERS=y
> # CONFIG_COMPAT_BRK is not set
> # CONFIG_SLAB is not set
> # CONFIG_SLUB is not set
> CONFIG_SLOB=y
> CONFIG_SLAB_MERGE_DEFAULT=y
> CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
> # CONFIG_PROFILING is not set
> CONFIG_TRACEPOINTS=y
> # end of General setup
> 
> CONFIG_64BIT=y
> CONFIG_X86_64=y
> CONFIG_X86=y
> CONFIG_INSTRUCTION_DECODER=y
> CONFIG_OUTPUT_FORMAT="elf64-x86-64"
> CONFIG_LOCKDEP_SUPPORT=y
> CONFIG_STACKTRACE_SUPPORT=y
> CONFIG_MMU=y
> CONFIG_ARCH_MMAP_RND_BITS_MIN=28
> CONFIG_ARCH_MMAP_RND_BITS_MAX=32
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=16
> CONFIG_GENERIC_ISA_DMA=y
> CONFIG_GENERIC_BUG=y
> CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
> CONFIG_ARCH_MAY_HAVE_PC_FDC=y
> CONFIG_GENERIC_CALIBRATE_DELAY=y
> CONFIG_ARCH_HAS_CPU_RELAX=y
> CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
> CONFIG_ARCH_HAS_FILTER_PGPROT=y
> CONFIG_HAVE_SETUP_PER_CPU_AREA=y
> CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
> CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
> CONFIG_ARCH_HIBERNATION_POSSIBLE=y
> CONFIG_ARCH_SUSPEND_POSSIBLE=y
> CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
> CONFIG_ZONE_DMA32=y
> CONFIG_AUDIT_ARCH=y
> CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
> CONFIG_ARCH_SUPPORTS_UPROBES=y
> CONFIG_FIX_EARLYCON_MEM=y
> CONFIG_DYNAMIC_PHYSICAL_MASK=y
> CONFIG_PGTABLE_LEVELS=5
> CONFIG_CC_HAS_SANE_STACKPROTECTOR=y
> 
> #
> # Processor type and features
> #
> # CONFIG_ZONE_DMA is not set
> # CONFIG_SMP is not set
> CONFIG_X86_FEATURE_NAMES=y
> # CONFIG_X86_X2APIC is not set
> CONFIG_X86_MPPARSE=y
> CONFIG_GOLDFISH=y
> # CONFIG_RETPOLINE is not set
> # CONFIG_X86_CPU_RESCTRL is not set
> # CONFIG_X86_EXTENDED_PLATFORM is not set
> # CONFIG_X86_INTEL_LPSS is not set
> # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
> CONFIG_IOSF_MBI=y
> # CONFIG_IOSF_MBI_DEBUG is not set
> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> CONFIG_HYPERVISOR_GUEST=y
> CONFIG_PARAVIRT=y
> # CONFIG_PARAVIRT_DEBUG is not set
> CONFIG_X86_HV_CALLBACK_VECTOR=y
> # CONFIG_XEN is not set
> CONFIG_KVM_GUEST=y
> CONFIG_ARCH_CPUIDLE_HALTPOLL=y
> # CONFIG_PVH is not set
> # CONFIG_KVM_DEBUG_FS is not set
> # CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
> CONFIG_PARAVIRT_CLOCK=y
> # CONFIG_JAILHOUSE_GUEST is not set
> CONFIG_ACRN_GUEST=y
> # CONFIG_MK8 is not set
> # CONFIG_MPSC is not set
> # CONFIG_MCORE2 is not set
> # CONFIG_MATOM is not set
> CONFIG_GENERIC_CPU=y
> CONFIG_X86_INTERNODE_CACHE_SHIFT=6
> CONFIG_X86_L1_CACHE_SHIFT=6
> CONFIG_X86_TSC=y
> CONFIG_X86_CMPXCHG64=y
> CONFIG_X86_CMOV=y
> CONFIG_X86_MINIMUM_CPU_FAMILY=64
> CONFIG_X86_DEBUGCTLMSR=y
> CONFIG_IA32_FEAT_CTL=y
> CONFIG_X86_VMX_FEATURE_NAMES=y
> # CONFIG_PROCESSOR_SELECT is not set
> CONFIG_CPU_SUP_INTEL=y
> CONFIG_CPU_SUP_AMD=y
> CONFIG_CPU_SUP_HYGON=y
> CONFIG_CPU_SUP_CENTAUR=y
> CONFIG_CPU_SUP_ZHAOXIN=y
> CONFIG_HPET_TIMER=y
> CONFIG_HPET_EMULATE_RTC=y
> CONFIG_DMI=y
> # CONFIG_GART_IOMMU is not set
> CONFIG_NR_CPUS_RANGE_BEGIN=1
> CONFIG_NR_CPUS_RANGE_END=1
> CONFIG_NR_CPUS_DEFAULT=1
> CONFIG_NR_CPUS=1
> CONFIG_UP_LATE_INIT=y
> CONFIG_X86_LOCAL_APIC=y
> CONFIG_X86_IO_APIC=y
> CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=y
> # CONFIG_X86_MCE is not set
> 
> #
> # Performance monitoring
> #
> # CONFIG_PERF_EVENTS_INTEL_UNCORE is not set
> CONFIG_PERF_EVENTS_INTEL_RAPL=y
> CONFIG_PERF_EVENTS_INTEL_CSTATE=y
> # CONFIG_PERF_EVENTS_AMD_POWER is not set
> # end of Performance monitoring
> 
> # CONFIG_X86_16BIT is not set
> CONFIG_X86_VSYSCALL_EMULATION=y
> CONFIG_X86_IOPL_IOPERM=y
> CONFIG_I8K=y
> CONFIG_MICROCODE=y
> # CONFIG_MICROCODE_INTEL is not set
> CONFIG_MICROCODE_AMD=y
> # CONFIG_MICROCODE_OLD_INTERFACE is not set
> CONFIG_X86_MSR=y
> CONFIG_X86_CPUID=y
> CONFIG_X86_5LEVEL=y
> CONFIG_X86_DIRECT_GBPAGES=y
> CONFIG_X86_CPA_STATISTICS=y
> CONFIG_AMD_MEM_ENCRYPT=y
> # CONFIG_AMD_MEM_ENCRYPT_ACTIVE_BY_DEFAULT is not set
> CONFIG_ARCH_SPARSEMEM_ENABLE=y
> CONFIG_ARCH_SPARSEMEM_DEFAULT=y
> CONFIG_ARCH_SELECT_MEMORY_MODEL=y
> CONFIG_ARCH_PROC_KCORE_TEXT=y
> CONFIG_ILLEGAL_POINTER_VALUE=0xdead000000000000
> # CONFIG_X86_PMEM_LEGACY is not set
> # CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
> CONFIG_X86_RESERVE_LOW=64
> # CONFIG_MTRR is not set
> CONFIG_ARCH_RANDOM=y
> # CONFIG_X86_SMAP is not set
> # CONFIG_X86_UMIP is not set
> CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=y
> # CONFIG_X86_INTEL_TSX_MODE_OFF is not set
> # CONFIG_X86_INTEL_TSX_MODE_ON is not set
> CONFIG_X86_INTEL_TSX_MODE_AUTO=y
> # CONFIG_EFI is not set
> CONFIG_SECCOMP=y
> # CONFIG_HZ_100 is not set
> CONFIG_HZ_250=y
> # CONFIG_HZ_300 is not set
> # CONFIG_HZ_1000 is not set
> CONFIG_HZ=250
> CONFIG_SCHED_HRTICK=y
> # CONFIG_KEXEC is not set
> CONFIG_KEXEC_FILE=y
> CONFIG_ARCH_HAS_KEXEC_PURGATORY=y
> CONFIG_KEXEC_SIG=y
> # CONFIG_KEXEC_SIG_FORCE is not set
> CONFIG_CRASH_DUMP=y
> CONFIG_PHYSICAL_START=0x1000000
> CONFIG_RELOCATABLE=y
> # CONFIG_RANDOMIZE_BASE is not set
> CONFIG_PHYSICAL_ALIGN=0x200000
> CONFIG_DYNAMIC_MEMORY_LAYOUT=y
> CONFIG_COMPAT_VDSO=y
> CONFIG_LEGACY_VSYSCALL_EMULATE=y
> # CONFIG_LEGACY_VSYSCALL_XONLY is not set
> # CONFIG_LEGACY_VSYSCALL_NONE is not set
> # CONFIG_CMDLINE_BOOL is not set
> CONFIG_MODIFY_LDT_SYSCALL=y
> CONFIG_HAVE_LIVEPATCH=y
> # end of Processor type and features
> 
> CONFIG_ARCH_HAS_ADD_PAGES=y
> CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
> CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
> CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=y
> 
> #
> # Power management and ACPI options
> #
> # CONFIG_SUSPEND is not set
> CONFIG_PM=y
> # CONFIG_PM_DEBUG is not set
> CONFIG_PM_CLK=y
> # CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
> CONFIG_ARCH_SUPPORTS_ACPI=y
> CONFIG_ACPI=y
> CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
> CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
> CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
> # CONFIG_ACPI_DEBUGGER is not set
> CONFIG_ACPI_SPCR_TABLE=y
> CONFIG_ACPI_LPIT=y
> # CONFIG_ACPI_PROCFS_POWER is not set
> CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=y
> # CONFIG_ACPI_EC_DEBUGFS is not set
> CONFIG_ACPI_AC=y
> CONFIG_ACPI_BATTERY=y
> CONFIG_ACPI_BUTTON=y
> CONFIG_ACPI_VIDEO=y
> CONFIG_ACPI_FAN=y
> # CONFIG_ACPI_DOCK is not set
> CONFIG_ACPI_CPU_FREQ_PSS=y
> CONFIG_ACPI_PROCESSOR_CSTATE=y
> CONFIG_ACPI_PROCESSOR_IDLE=y
> CONFIG_ACPI_PROCESSOR=y
> # CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
> CONFIG_ACPI_THERMAL=y
> CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
> CONFIG_ACPI_TABLE_UPGRADE=y
> # CONFIG_ACPI_DEBUG is not set
> # CONFIG_ACPI_PCI_SLOT is not set
> # CONFIG_ACPI_CONTAINER is not set
> CONFIG_ACPI_HOTPLUG_IOAPIC=y
> # CONFIG_ACPI_SBS is not set
> # CONFIG_ACPI_HED is not set
> # CONFIG_ACPI_CUSTOM_METHOD is not set
> # CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
> # CONFIG_ACPI_NFIT is not set
> CONFIG_HAVE_ACPI_APEI=y
> CONFIG_HAVE_ACPI_APEI_NMI=y
> # CONFIG_ACPI_APEI is not set
> # CONFIG_DPTF_POWER is not set
> # CONFIG_PMIC_OPREGION is not set
> # CONFIG_ACPI_CONFIGFS is not set
> CONFIG_X86_PM_TIMER=y
> # CONFIG_SFI is not set
> 
> #
> # CPU Frequency scaling
> #
> # CONFIG_CPU_FREQ is not set
> # end of CPU Frequency scaling
> 
> #
> # CPU Idle
> #
> CONFIG_CPU_IDLE=y
> # CONFIG_CPU_IDLE_GOV_LADDER is not set
> CONFIG_CPU_IDLE_GOV_MENU=y
> # CONFIG_CPU_IDLE_GOV_TEO is not set
> # CONFIG_CPU_IDLE_GOV_HALTPOLL is not set
> CONFIG_HALTPOLL_CPUIDLE=y
> # end of CPU Idle
> 
> CONFIG_INTEL_IDLE=y
> # end of Power management and ACPI options
> 
> #
> # Bus options (PCI etc.)
> #
> CONFIG_PCI_DIRECT=y
> CONFIG_PCI_MMCONFIG=y
> CONFIG_MMCONF_FAM10H=y
> CONFIG_PCI_CNB20LE_QUIRK=y
> # CONFIG_ISA_BUS is not set
> CONFIG_ISA_DMA_API=y
> CONFIG_AMD_NB=y
> # CONFIG_X86_SYSFB is not set
> # end of Bus options (PCI etc.)
> 
> #
> # Binary Emulations
> #
> CONFIG_IA32_EMULATION=y
> # CONFIG_X86_X32 is not set
> CONFIG_COMPAT_32=y
> CONFIG_COMPAT=y
> CONFIG_COMPAT_FOR_U64_ALIGNMENT=y
> CONFIG_SYSVIPC_COMPAT=y
> # end of Binary Emulations
> 
> #
> # Firmware Drivers
> #
> CONFIG_EDD=y
> CONFIG_EDD_OFF=y
> CONFIG_FIRMWARE_MEMMAP=y
> # CONFIG_DMIID is not set
> CONFIG_DMI_SYSFS=y
> CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
> CONFIG_FW_CFG_SYSFS=y
> # CONFIG_FW_CFG_SYSFS_CMDLINE is not set
> CONFIG_GOOGLE_FIRMWARE=y
> # CONFIG_GOOGLE_SMI is not set
> CONFIG_GOOGLE_COREBOOT_TABLE=y
> # CONFIG_GOOGLE_MEMCONSOLE_X86_LEGACY is not set
> # CONFIG_GOOGLE_MEMCONSOLE_COREBOOT is not set
> CONFIG_GOOGLE_VPD=y
> CONFIG_EFI_EARLYCON=y
> 
> #
> # Tegra firmware driver
> #
> # end of Tegra firmware driver
> # end of Firmware Drivers
> 
> CONFIG_HAVE_KVM=y
> CONFIG_VIRTUALIZATION=y
> # CONFIG_KVM is not set
> # CONFIG_KVM_WERROR is not set
> CONFIG_AS_AVX512=y
> CONFIG_AS_SHA1_NI=y
> CONFIG_AS_SHA256_NI=y
> 
> #
> # General architecture-dependent options
> #
> CONFIG_CRASH_CORE=y
> CONFIG_KEXEC_CORE=y
> CONFIG_HAVE_OPROFILE=y
> CONFIG_OPROFILE_NMI_TIMER=y
> # CONFIG_KPROBES is not set
> CONFIG_JUMP_LABEL=y
> # CONFIG_STATIC_KEYS_SELFTEST is not set
> CONFIG_UPROBES=y
> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
> CONFIG_ARCH_USE_BUILTIN_BSWAP=y
> CONFIG_HAVE_IOREMAP_PROT=y
> CONFIG_HAVE_KPROBES=y
> CONFIG_HAVE_KRETPROBES=y
> CONFIG_HAVE_OPTPROBES=y
> CONFIG_HAVE_KPROBES_ON_FTRACE=y
> CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
> CONFIG_HAVE_NMI=y
> CONFIG_HAVE_ARCH_TRACEHOOK=y
> CONFIG_HAVE_DMA_CONTIGUOUS=y
> CONFIG_GENERIC_SMP_IDLE_THREAD=y
> CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
> CONFIG_ARCH_HAS_SET_MEMORY=y
> CONFIG_ARCH_HAS_SET_DIRECT_MAP=y
> CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=y
> CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
> CONFIG_HAVE_ASM_MODVERSIONS=y
> CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
> CONFIG_HAVE_RSEQ=y
> CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=y
> CONFIG_HAVE_CLK=y
> CONFIG_HAVE_HW_BREAKPOINT=y
> CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
> CONFIG_HAVE_USER_RETURN_NOTIFIER=y
> CONFIG_HAVE_PERF_EVENTS_NMI=y
> CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=y
> CONFIG_HAVE_PERF_REGS=y
> CONFIG_HAVE_PERF_USER_STACK_DUMP=y
> CONFIG_HAVE_ARCH_JUMP_LABEL=y
> CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
> CONFIG_MMU_GATHER_TABLE_FREE=y
> CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
> CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
> CONFIG_HAVE_CMPXCHG_LOCAL=y
> CONFIG_HAVE_CMPXCHG_DOUBLE=y
> CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=y
> CONFIG_ARCH_WANT_OLD_COMPAT_IPC=y
> CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
> CONFIG_SECCOMP_FILTER=y
> CONFIG_HAVE_ARCH_STACKLEAK=y
> CONFIG_HAVE_STACKPROTECTOR=y
> CONFIG_CC_HAS_STACKPROTECTOR_NONE=y
> CONFIG_STACKPROTECTOR=y
> CONFIG_STACKPROTECTOR_STRONG=y
> CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
> CONFIG_HAVE_CONTEXT_TRACKING=y
> CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
> CONFIG_HAVE_MOVE_PMD=y
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=y
> CONFIG_HAVE_ARCH_HUGE_VMAP=y
> CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
> CONFIG_HAVE_ARCH_SOFT_DIRTY=y
> CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
> CONFIG_MODULES_USE_ELF_RELA=y
> CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=y
> CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
> CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
> CONFIG_HAVE_EXIT_THREAD=y
> CONFIG_ARCH_MMAP_RND_BITS=28
> CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=y
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS=8
> CONFIG_HAVE_ARCH_COMPAT_MMAP_BASES=y
> CONFIG_HAVE_COPY_THREAD_TLS=y
> CONFIG_HAVE_STACK_VALIDATION=y
> CONFIG_HAVE_RELIABLE_STACKTRACE=y
> CONFIG_ISA_BUS_API=y
> CONFIG_OLD_SIGSUSPEND3=y
> CONFIG_COMPAT_OLD_SIGACTION=y
> CONFIG_COMPAT_32BIT_TIME=y
> CONFIG_HAVE_ARCH_VMAP_STACK=y
> CONFIG_VMAP_STACK=y
> CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
> CONFIG_STRICT_KERNEL_RWX=y
> CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
> CONFIG_STRICT_MODULE_RWX=y
> CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
> CONFIG_ARCH_USE_MEMREMAP_PROT=y
> CONFIG_LOCK_EVENT_COUNTS=y
> CONFIG_ARCH_HAS_MEM_ENCRYPT=y
> 
> #
> # GCOV-based kernel profiling
> #
> CONFIG_GCOV_KERNEL=y
> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
> # CONFIG_GCOV_PROFILE_ALL is not set
> # end of GCOV-based kernel profiling
> 
> CONFIG_HAVE_GCC_PLUGINS=y
> # end of General architecture-dependent options
> 
> CONFIG_RT_MUTEXES=y
> CONFIG_BASE_SMALL=1
> CONFIG_MODULES=y
> # CONFIG_MODULE_FORCE_LOAD is not set
> # CONFIG_MODULE_UNLOAD is not set
> # CONFIG_MODVERSIONS is not set
> # CONFIG_MODULE_SRCVERSION_ALL is not set
> # CONFIG_MODULE_SIG is not set
> # CONFIG_MODULE_COMPRESS is not set
> # CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
> CONFIG_UNUSED_SYMBOLS=y
> CONFIG_MODULES_TREE_LOOKUP=y
> CONFIG_BLOCK=y
> CONFIG_BLK_SCSI_REQUEST=y
> CONFIG_BLK_DEV_BSG=y
> CONFIG_BLK_DEV_BSGLIB=y
> CONFIG_BLK_DEV_INTEGRITY=y
> CONFIG_BLK_DEV_INTEGRITY_T10=y
> CONFIG_BLK_DEV_ZONED=y
> # CONFIG_BLK_CMDLINE_PARSER is not set
> # CONFIG_BLK_WBT is not set
> # CONFIG_BLK_DEBUG_FS is not set
> CONFIG_BLK_SED_OPAL=y
> 
> #
> # Partition Types
> #
> CONFIG_PARTITION_ADVANCED=y
> # CONFIG_ACORN_PARTITION is not set
> # CONFIG_AIX_PARTITION is not set
> # CONFIG_OSF_PARTITION is not set
> CONFIG_AMIGA_PARTITION=y
> # CONFIG_ATARI_PARTITION is not set
> # CONFIG_MAC_PARTITION is not set
> # CONFIG_MSDOS_PARTITION is not set
> CONFIG_LDM_PARTITION=y
> CONFIG_LDM_DEBUG=y
> CONFIG_SGI_PARTITION=y
> # CONFIG_ULTRIX_PARTITION is not set
> # CONFIG_SUN_PARTITION is not set
> CONFIG_KARMA_PARTITION=y
> CONFIG_EFI_PARTITION=y
> CONFIG_SYSV68_PARTITION=y
> # CONFIG_CMDLINE_PARTITION is not set
> # end of Partition Types
> 
> CONFIG_BLOCK_COMPAT=y
> CONFIG_BLK_MQ_PCI=y
> CONFIG_BLK_MQ_VIRTIO=y
> CONFIG_BLK_PM=y
> 
> #
> # IO Schedulers
> #
> CONFIG_MQ_IOSCHED_DEADLINE=y
> # CONFIG_MQ_IOSCHED_KYBER is not set
> # CONFIG_IOSCHED_BFQ is not set
> # end of IO Schedulers
> 
> CONFIG_ASN1=y
> CONFIG_UNINLINE_SPIN_UNLOCK=y
> CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
> CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
> CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
> CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=y
> CONFIG_ARCH_HAS_SYSCALL_WRAPPER=y
> CONFIG_FREEZER=y
> 
> #
> # Executable file formats
> #
> CONFIG_BINFMT_ELF=y
> CONFIG_COMPAT_BINFMT_ELF=y
> CONFIG_ELFCORE=y
> CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
> CONFIG_BINFMT_SCRIPT=y
> CONFIG_BINFMT_MISC=y
> CONFIG_COREDUMP=y
> # end of Executable file formats
> 
> #
> # Memory Management options
> #
> CONFIG_SELECT_MEMORY_MODEL=y
> CONFIG_SPARSEMEM_MANUAL=y
> CONFIG_SPARSEMEM=y
> CONFIG_HAVE_MEMORY_PRESENT=y
> CONFIG_SPARSEMEM_EXTREME=y
> CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
> CONFIG_SPARSEMEM_VMEMMAP=y
> CONFIG_HAVE_MEMBLOCK_NODE_MAP=y
> CONFIG_HAVE_FAST_GUP=y
> CONFIG_MEMORY_ISOLATION=y
> # CONFIG_MEMORY_HOTPLUG is not set
> CONFIG_SPLIT_PTLOCK_CPUS=4
> CONFIG_MEMORY_BALLOON=y
> # CONFIG_COMPACTION is not set
> CONFIG_PAGE_REPORTING=y
> CONFIG_MIGRATION=y
> CONFIG_CONTIG_ALLOC=y
> CONFIG_PHYS_ADDR_T_64BIT=y
> CONFIG_VIRT_TO_BUS=y
> CONFIG_MMU_NOTIFIER=y
> # CONFIG_KSM is not set
> CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
> # CONFIG_TRANSPARENT_HUGEPAGE is not set
> CONFIG_ARCH_WANTS_THP_SWAP=y
> CONFIG_NEED_PER_CPU_KM=y
> # CONFIG_CLEANCACHE is not set
> CONFIG_CMA=y
> CONFIG_CMA_DEBUG=y
> # CONFIG_CMA_DEBUGFS is not set
> CONFIG_CMA_AREAS=7
> CONFIG_MEM_SOFT_DIRTY=y
> # CONFIG_ZPOOL is not set
> # CONFIG_ZBUD is not set
> # CONFIG_ZSMALLOC is not set
> CONFIG_GENERIC_EARLY_IOREMAP=y
> CONFIG_IDLE_PAGE_TRACKING=y
> CONFIG_ARCH_HAS_PTE_DEVMAP=y
> CONFIG_HMM_MIRROR=y
> CONFIG_FRAME_VECTOR=y
> CONFIG_ARCH_USES_HIGH_VMA_FLAGS=y
> CONFIG_ARCH_HAS_PKEYS=y
> # CONFIG_PERCPU_STATS is not set
> CONFIG_GUP_BENCHMARK=y
> CONFIG_ARCH_HAS_PTE_SPECIAL=y
> CONFIG_MAPPING_DIRTY_HELPERS=y
> # end of Memory Management options
> 
> CONFIG_NET=y
> 
> #
> # Networking options
> #
> # CONFIG_PACKET is not set
> CONFIG_UNIX=y
> CONFIG_UNIX_SCM=y
> # CONFIG_UNIX_DIAG is not set
> # CONFIG_TLS is not set
> # CONFIG_XFRM_USER is not set
> # CONFIG_NET_KEY is not set
> CONFIG_INET=y
> # CONFIG_IP_MULTICAST is not set
> # CONFIG_IP_ADVANCED_ROUTER is not set
> CONFIG_IP_PNP=y
> CONFIG_IP_PNP_DHCP=y
> # CONFIG_IP_PNP_BOOTP is not set
> # CONFIG_IP_PNP_RARP is not set
> # CONFIG_NET_IPIP is not set
> # CONFIG_NET_IPGRE_DEMUX is not set
> CONFIG_NET_IP_TUNNEL=y
> # CONFIG_SYN_COOKIES is not set
> # CONFIG_NET_IPVTI is not set
> # CONFIG_NET_FOU is not set
> # CONFIG_NET_FOU_IP_TUNNELS is not set
> # CONFIG_INET_AH is not set
> # CONFIG_INET_ESP is not set
> # CONFIG_INET_IPCOMP is not set
> CONFIG_INET_TUNNEL=y
> CONFIG_INET_DIAG=y
> CONFIG_INET_TCP_DIAG=y
> # CONFIG_INET_UDP_DIAG is not set
> # CONFIG_INET_RAW_DIAG is not set
> # CONFIG_INET_DIAG_DESTROY is not set
> # CONFIG_TCP_CONG_ADVANCED is not set
> CONFIG_TCP_CONG_CUBIC=y
> CONFIG_DEFAULT_TCP_CONG="cubic"
> # CONFIG_TCP_MD5SIG is not set
> CONFIG_IPV6=y
> # CONFIG_IPV6_ROUTER_PREF is not set
> # CONFIG_IPV6_OPTIMISTIC_DAD is not set
> # CONFIG_INET6_AH is not set
> # CONFIG_INET6_ESP is not set
> # CONFIG_INET6_IPCOMP is not set
> # CONFIG_IPV6_MIP6 is not set
> # CONFIG_IPV6_VTI is not set
> CONFIG_IPV6_SIT=y
> # CONFIG_IPV6_SIT_6RD is not set
> CONFIG_IPV6_NDISC_NODETYPE=y
> # CONFIG_IPV6_TUNNEL is not set
> # CONFIG_IPV6_MULTIPLE_TABLES is not set
> # CONFIG_IPV6_MROUTE is not set
> # CONFIG_IPV6_SEG6_LWTUNNEL is not set
> # CONFIG_IPV6_SEG6_HMAC is not set
> # CONFIG_IPV6_RPL_LWTUNNEL is not set
> # CONFIG_NETLABEL is not set
> # CONFIG_MPTCP is not set
> # CONFIG_NETWORK_SECMARK is not set
> # CONFIG_NETWORK_PHY_TIMESTAMPING is not set
> # CONFIG_NETFILTER is not set
> # CONFIG_BPFILTER is not set
> # CONFIG_IP_DCCP is not set
> # CONFIG_IP_SCTP is not set
> # CONFIG_RDS is not set
> # CONFIG_TIPC is not set
> # CONFIG_ATM is not set
> # CONFIG_L2TP is not set
> # CONFIG_BRIDGE is not set
> CONFIG_HAVE_NET_DSA=y
> # CONFIG_NET_DSA is not set
> # CONFIG_VLAN_8021Q is not set
> # CONFIG_DECNET is not set
> # CONFIG_LLC2 is not set
> # CONFIG_ATALK is not set
> # CONFIG_X25 is not set
> # CONFIG_LAPB is not set
> # CONFIG_PHONET is not set
> # CONFIG_6LOWPAN is not set
> # CONFIG_IEEE802154 is not set
> # CONFIG_NET_SCHED is not set
> # CONFIG_DCB is not set
> CONFIG_DNS_RESOLVER=m
> # CONFIG_BATMAN_ADV is not set
> # CONFIG_OPENVSWITCH is not set
> # CONFIG_VSOCKETS is not set
> # CONFIG_NETLINK_DIAG is not set
> # CONFIG_MPLS is not set
> # CONFIG_NET_NSH is not set
> # CONFIG_HSR is not set
> # CONFIG_NET_SWITCHDEV is not set
> # CONFIG_NET_L3_MASTER_DEV is not set
> # CONFIG_NET_NCSI is not set
> # CONFIG_CGROUP_NET_PRIO is not set
> # CONFIG_CGROUP_NET_CLASSID is not set
> CONFIG_NET_RX_BUSY_POLL=y
> CONFIG_BQL=y
> # CONFIG_BPF_JIT is not set
> 
> #
> # Network testing
> #
> # CONFIG_NET_PKTGEN is not set
> # CONFIG_NET_DROP_MONITOR is not set
> # end of Network testing
> # end of Networking options
> 
> # CONFIG_HAMRADIO is not set
> # CONFIG_CAN is not set
> # CONFIG_BT is not set
> # CONFIG_AF_RXRPC is not set
> # CONFIG_AF_KCM is not set
> CONFIG_WIRELESS=y
> # CONFIG_CFG80211 is not set
> 
> #
> # CFG80211 needs to be enabled for MAC80211
> #
> CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
> # CONFIG_WIMAX is not set
> # CONFIG_RFKILL is not set
> CONFIG_NET_9P=y
> CONFIG_NET_9P_VIRTIO=y
> # CONFIG_NET_9P_DEBUG is not set
> # CONFIG_CAIF is not set
> # CONFIG_CEPH_LIB is not set
> # CONFIG_NFC is not set
> # CONFIG_PSAMPLE is not set
> # CONFIG_NET_IFE is not set
> # CONFIG_LWTUNNEL is not set
> CONFIG_DST_CACHE=y
> CONFIG_GRO_CELLS=y
> # CONFIG_FAILOVER is not set
> CONFIG_ETHTOOL_NETLINK=y
> CONFIG_HAVE_EBPF_JIT=y
> 
> #
> # Device Drivers
> #
> CONFIG_HAVE_EISA=y
> CONFIG_EISA=y
> # CONFIG_EISA_VLB_PRIMING is not set
> # CONFIG_EISA_PCI_EISA is not set
> CONFIG_EISA_VIRTUAL_ROOT=y
> # CONFIG_EISA_NAMES is not set
> CONFIG_HAVE_PCI=y
> CONFIG_PCI=y
> CONFIG_PCI_DOMAINS=y
> # CONFIG_PCIEPORTBUS is not set
> # CONFIG_PCIEASPM is not set
> # CONFIG_PCIE_PTM is not set
> # CONFIG_PCI_MSI is not set
> CONFIG_PCI_QUIRKS=y
> # CONFIG_PCI_DEBUG is not set
> # CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
> CONFIG_PCI_STUB=y
> # CONFIG_PCI_PF_STUB is not set
> CONFIG_PCI_ATS=y
> CONFIG_PCI_ECAM=y
> CONFIG_PCI_LOCKLESS_CONFIG=y
> CONFIG_PCI_IOV=y
> CONFIG_PCI_PRI=y
> # CONFIG_PCI_PASID is not set
> CONFIG_PCI_LABEL=y
> CONFIG_HOTPLUG_PCI=y
> # CONFIG_HOTPLUG_PCI_ACPI is not set
> # CONFIG_HOTPLUG_PCI_CPCI is not set
> # CONFIG_HOTPLUG_PCI_SHPC is not set
> 
> #
> # PCI controller drivers
> #
> CONFIG_PCI_FTPCI100=y
> CONFIG_PCI_HOST_COMMON=y
> CONFIG_PCI_HOST_GENERIC=y
> # CONFIG_PCIE_XILINX is not set
> 
> #
> # DesignWare PCI Core Support
> #
> # end of DesignWare PCI Core Support
> 
> #
> # Mobiveil PCIe Core Support
> #
> # end of Mobiveil PCIe Core Support
> 
> #
> # Cadence PCIe controllers support
> #
> CONFIG_PCIE_CADENCE=y
> CONFIG_PCIE_CADENCE_HOST=y
> CONFIG_PCIE_CADENCE_PLAT=y
> CONFIG_PCIE_CADENCE_PLAT_HOST=y
> # end of Cadence PCIe controllers support
> # end of PCI controller drivers
> 
> #
> # PCI Endpoint
> #
> # CONFIG_PCI_ENDPOINT is not set
> # end of PCI Endpoint
> 
> #
> # PCI switch controller drivers
> #
> CONFIG_PCI_SW_SWITCHTEC=y
> # end of PCI switch controller drivers
> 
> # CONFIG_PCCARD is not set
> # CONFIG_RAPIDIO is not set
> 
> #
> # Generic Driver Options
> #
> # CONFIG_UEVENT_HELPER is not set
> CONFIG_DEVTMPFS=y
> # CONFIG_DEVTMPFS_MOUNT is not set
> CONFIG_STANDALONE=y
> CONFIG_PREVENT_FIRMWARE_BUILD=y
> 
> #
> # Firmware loader
> #
> CONFIG_FW_LOADER=y
> CONFIG_FW_LOADER_PAGED_BUF=y
> CONFIG_EXTRA_FIRMWARE=""
> CONFIG_FW_LOADER_USER_HELPER=y
> CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
> CONFIG_FW_LOADER_COMPRESS=y
> # end of Firmware loader
> 
> CONFIG_WANT_DEV_COREDUMP=y
> # CONFIG_ALLOW_DEV_COREDUMP is not set
> # CONFIG_DEBUG_DRIVER is not set
> CONFIG_DEBUG_DEVRES=y
> # CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
> CONFIG_PM_QOS_KUNIT_TEST=y
> # CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
> CONFIG_KUNIT_DRIVER_PE_TEST=y
> CONFIG_GENERIC_CPU_AUTOPROBE=y
> CONFIG_GENERIC_CPU_VULNERABILITIES=y
> CONFIG_REGMAP=y
> CONFIG_REGMAP_I2C=y
> CONFIG_REGMAP_SPMI=y
> CONFIG_REGMAP_W1=y
> CONFIG_REGMAP_MMIO=y
> CONFIG_REGMAP_IRQ=y
> CONFIG_REGMAP_SCCB=y
> CONFIG_DMA_SHARED_BUFFER=y
> # CONFIG_DMA_FENCE_TRACE is not set
> # end of Generic Driver Options
> 
> #
> # Bus devices
> #
> CONFIG_SIMPLE_PM_BUS=y
> # CONFIG_MHI_BUS is not set
> # end of Bus devices
> 
> # CONFIG_CONNECTOR is not set
> CONFIG_GNSS=y
> CONFIG_GNSS_SERIAL=y
> CONFIG_GNSS_MTK_SERIAL=y
> # CONFIG_GNSS_SIRF_SERIAL is not set
> # CONFIG_GNSS_UBX_SERIAL is not set
> # CONFIG_MTD is not set
> CONFIG_DTC=y
> CONFIG_OF=y
> # CONFIG_OF_UNITTEST is not set
> CONFIG_OF_FLATTREE=y
> CONFIG_OF_KOBJ=y
> CONFIG_OF_DYNAMIC=y
> CONFIG_OF_ADDRESS=y
> CONFIG_OF_IRQ=y
> CONFIG_OF_NET=y
> CONFIG_OF_RESOLVE=y
> CONFIG_OF_OVERLAY=y
> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
> CONFIG_PARPORT=y
> # CONFIG_PARPORT_PC is not set
> # CONFIG_PARPORT_AX88796 is not set
> # CONFIG_PARPORT_1284 is not set
> CONFIG_PNP=y
> CONFIG_PNP_DEBUG_MESSAGES=y
> 
> #
> # Protocols
> #
> CONFIG_PNPACPI=y
> CONFIG_BLK_DEV=y
> CONFIG_BLK_DEV_NULL_BLK=y
> # CONFIG_BLK_DEV_NULL_BLK_FAULT_INJECTION is not set
> CONFIG_BLK_DEV_FD=y
> CONFIG_CDROM=y
> CONFIG_BLK_DEV_PCIESSD_MTIP32XX=y
> CONFIG_BLK_DEV_UMEM=y
> CONFIG_BLK_DEV_LOOP=y
> CONFIG_BLK_DEV_LOOP_MIN_COUNT=8
> CONFIG_BLK_DEV_CRYPTOLOOP=y
> # CONFIG_BLK_DEV_DRBD is not set
> # CONFIG_BLK_DEV_NBD is not set
> # CONFIG_BLK_DEV_SKD is not set
> CONFIG_BLK_DEV_SX8=y
> CONFIG_BLK_DEV_RAM=y
> CONFIG_BLK_DEV_RAM_COUNT=16
> CONFIG_BLK_DEV_RAM_SIZE=4096
> CONFIG_CDROM_PKTCDVD=y
> CONFIG_CDROM_PKTCDVD_BUFFERS=8
> # CONFIG_CDROM_PKTCDVD_WCACHE is not set
> # CONFIG_ATA_OVER_ETH is not set
> # CONFIG_VIRTIO_BLK is not set
> # CONFIG_BLK_DEV_RBD is not set
> # CONFIG_BLK_DEV_RSXX is not set
> 
> #
> # NVME Support
> #
> CONFIG_NVME_CORE=y
> # CONFIG_BLK_DEV_NVME is not set
> # CONFIG_NVME_MULTIPATH is not set
> # CONFIG_NVME_HWMON is not set
> CONFIG_NVME_FABRICS=y
> # CONFIG_NVME_FC is not set
> CONFIG_NVME_TARGET=y
> CONFIG_NVME_TARGET_LOOP=y
> CONFIG_NVME_TARGET_FC=y
> # CONFIG_NVME_TARGET_TCP is not set
> # end of NVME Support
> 
> #
> # Misc devices
> #
> # CONFIG_AD525X_DPOT is not set
> CONFIG_DUMMY_IRQ=y
> # CONFIG_IBM_ASM is not set
> # CONFIG_PHANTOM is not set
> CONFIG_TIFM_CORE=y
> # CONFIG_TIFM_7XX1 is not set
> CONFIG_ICS932S401=y
> # CONFIG_ENCLOSURE_SERVICES is not set
> # CONFIG_HP_ILO is not set
> # CONFIG_APDS9802ALS is not set
> CONFIG_ISL29003=y
> CONFIG_ISL29020=y
> CONFIG_SENSORS_TSL2550=y
> CONFIG_SENSORS_BH1770=y
> CONFIG_SENSORS_APDS990X=y
> CONFIG_HMC6352=y
> CONFIG_DS1682=y
> CONFIG_VMWARE_BALLOON=y
> CONFIG_SRAM=y
> CONFIG_PCI_ENDPOINT_TEST=y
> CONFIG_XILINX_SDFEC=y
> CONFIG_MISC_RTSX=y
> CONFIG_PVPANIC=y
> CONFIG_C2PORT=y
> CONFIG_C2PORT_DURAMAR_2150=y
> 
> #
> # EEPROM support
> #
> # CONFIG_EEPROM_AT24 is not set
> CONFIG_EEPROM_LEGACY=y
> CONFIG_EEPROM_MAX6875=y
> CONFIG_EEPROM_93CX6=y
> CONFIG_EEPROM_IDT_89HPESX=y
> # CONFIG_EEPROM_EE1004 is not set
> # end of EEPROM support
> 
> CONFIG_CB710_CORE=y
> CONFIG_CB710_DEBUG=y
> CONFIG_CB710_DEBUG_ASSUMPTIONS=y
> 
> #
> # Texas Instruments shared transport line discipline
> #
> # CONFIG_TI_ST is not set
> # end of Texas Instruments shared transport line discipline
> 
> # CONFIG_SENSORS_LIS3_I2C is not set
> # CONFIG_ALTERA_STAPL is not set
> CONFIG_INTEL_MEI=y
> CONFIG_INTEL_MEI_ME=y
> # CONFIG_INTEL_MEI_TXE is not set
> CONFIG_VMWARE_VMCI=y
> 
> #
> # Intel MIC & related support
> #
> # CONFIG_INTEL_MIC_BUS is not set
> CONFIG_SCIF_BUS=y
> CONFIG_VOP_BUS=y
> CONFIG_SCIF=y
> CONFIG_MIC_COSM=y
> # CONFIG_VOP is not set
> # end of Intel MIC & related support
> 
> # CONFIG_GENWQE is not set
> CONFIG_ECHO=y
> CONFIG_MISC_ALCOR_PCI=y
> CONFIG_MISC_RTSX_PCI=y
> # CONFIG_HABANA_AI is not set
> # CONFIG_UACCE is not set
> # end of Misc devices
> 
> CONFIG_HAVE_IDE=y
> # CONFIG_IDE is not set
> 
> #
> # SCSI device support
> #
> CONFIG_SCSI_MOD=y
> # CONFIG_RAID_ATTRS is not set
> CONFIG_SCSI=y
> CONFIG_SCSI_DMA=y
> CONFIG_SCSI_PROC_FS=y
> 
> #
> # SCSI support type (disk, tape, CD-ROM)
> #
> # CONFIG_BLK_DEV_SD is not set
> # CONFIG_CHR_DEV_ST is not set
> # CONFIG_BLK_DEV_SR is not set
> CONFIG_CHR_DEV_SG=y
> CONFIG_CHR_DEV_SCH=y
> CONFIG_SCSI_CONSTANTS=y
> CONFIG_SCSI_LOGGING=y
> # CONFIG_SCSI_SCAN_ASYNC is not set
> 
> #
> # SCSI Transports
> #
> CONFIG_SCSI_SPI_ATTRS=y
> # CONFIG_SCSI_FC_ATTRS is not set
> # CONFIG_SCSI_ISCSI_ATTRS is not set
> CONFIG_SCSI_SAS_ATTRS=y
> CONFIG_SCSI_SAS_LIBSAS=y
> CONFIG_SCSI_SAS_ATA=y
> # CONFIG_SCSI_SAS_HOST_SMP is not set
> # CONFIG_SCSI_SRP_ATTRS is not set
> # end of SCSI Transports
> 
> # CONFIG_SCSI_LOWLEVEL is not set
> # CONFIG_SCSI_DH is not set
> # end of SCSI device support
> 
> CONFIG_ATA=y
> CONFIG_SATA_HOST=y
> CONFIG_PATA_TIMINGS=y
> CONFIG_ATA_VERBOSE_ERROR=y
> # CONFIG_ATA_FORCE is not set
> CONFIG_ATA_ACPI=y
> # CONFIG_SATA_ZPODD is not set
> # CONFIG_SATA_PMP is not set
> 
> #
> # Controllers with non-SFF native interface
> #
> # CONFIG_SATA_AHCI is not set
> CONFIG_SATA_AHCI_PLATFORM=y
> CONFIG_AHCI_CEVA=y
> CONFIG_AHCI_QORIQ=y
> # CONFIG_SATA_INIC162X is not set
> # CONFIG_SATA_ACARD_AHCI is not set
> CONFIG_SATA_SIL24=y
> CONFIG_ATA_SFF=y
> 
> #
> # SFF controllers with custom DMA interface
> #
> CONFIG_PDC_ADMA=y
> CONFIG_SATA_QSTOR=y
> CONFIG_SATA_SX4=y
> CONFIG_ATA_BMDMA=y
> 
> #
> # SATA SFF controllers with BMDMA
> #
> CONFIG_ATA_PIIX=y
> CONFIG_SATA_MV=y
> # CONFIG_SATA_NV is not set
> CONFIG_SATA_PROMISE=y
> CONFIG_SATA_SIL=y
> # CONFIG_SATA_SIS is not set
> # CONFIG_SATA_SVW is not set
> # CONFIG_SATA_ULI is not set
> # CONFIG_SATA_VIA is not set
> CONFIG_SATA_VITESSE=y
> 
> #
> # PATA SFF controllers with BMDMA
> #
> CONFIG_PATA_ALI=y
> CONFIG_PATA_AMD=y
> CONFIG_PATA_ARTOP=y
> CONFIG_PATA_ATIIXP=y
> CONFIG_PATA_ATP867X=y
> CONFIG_PATA_CMD64X=y
> # CONFIG_PATA_CYPRESS is not set
> # CONFIG_PATA_EFAR is not set
> # CONFIG_PATA_HPT366 is not set
> CONFIG_PATA_HPT37X=y
> # CONFIG_PATA_HPT3X2N is not set
> # CONFIG_PATA_HPT3X3 is not set
> CONFIG_PATA_IT8213=y
> CONFIG_PATA_IT821X=y
> # CONFIG_PATA_JMICRON is not set
> CONFIG_PATA_MARVELL=y
> CONFIG_PATA_NETCELL=y
> # CONFIG_PATA_NINJA32 is not set
> # CONFIG_PATA_NS87415 is not set
> # CONFIG_PATA_OLDPIIX is not set
> CONFIG_PATA_OPTIDMA=y
> CONFIG_PATA_PDC2027X=y
> CONFIG_PATA_PDC_OLD=y
> CONFIG_PATA_RADISYS=y
> CONFIG_PATA_RDC=y
> CONFIG_PATA_SCH=y
> CONFIG_PATA_SERVERWORKS=y
> # CONFIG_PATA_SIL680 is not set
> CONFIG_PATA_SIS=y
> CONFIG_PATA_TOSHIBA=y
> # CONFIG_PATA_TRIFLEX is not set
> # CONFIG_PATA_VIA is not set
> CONFIG_PATA_WINBOND=y
> 
> #
> # PIO-only SFF controllers
> #
> # CONFIG_PATA_CMD640_PCI is not set
> CONFIG_PATA_MPIIX=y
> # CONFIG_PATA_NS87410 is not set
> # CONFIG_PATA_OPTI is not set
> CONFIG_PATA_PLATFORM=y
> CONFIG_PATA_OF_PLATFORM=y
> CONFIG_PATA_RZ1000=y
> 
> #
> # Generic fallback / legacy drivers
> #
> # CONFIG_PATA_ACPI is not set
> CONFIG_ATA_GENERIC=y
> # CONFIG_PATA_LEGACY is not set
> # CONFIG_MD is not set
> CONFIG_TARGET_CORE=y
> CONFIG_TCM_IBLOCK=y
> CONFIG_TCM_FILEIO=y
> CONFIG_TCM_PSCSI=y
> # CONFIG_TCM_USER2 is not set
> # CONFIG_LOOPBACK_TARGET is not set
> # CONFIG_ISCSI_TARGET is not set
> CONFIG_SBP_TARGET=y
> CONFIG_FUSION=y
> CONFIG_FUSION_SPI=y
> # CONFIG_FUSION_SAS is not set
> CONFIG_FUSION_MAX_SGE=128
> CONFIG_FUSION_CTL=y
> CONFIG_FUSION_LOGGING=y
> 
> #
> # IEEE 1394 (FireWire) support
> #
> CONFIG_FIREWIRE=y
> CONFIG_FIREWIRE_OHCI=y
> # CONFIG_FIREWIRE_SBP2 is not set
> # CONFIG_FIREWIRE_NET is not set
> CONFIG_FIREWIRE_NOSY=y
> # end of IEEE 1394 (FireWire) support
> 
> # CONFIG_MACINTOSH_DRIVERS is not set
> CONFIG_NETDEVICES=y
> CONFIG_NET_CORE=y
> # CONFIG_BONDING is not set
> # CONFIG_DUMMY is not set
> # CONFIG_WIREGUARD is not set
> # CONFIG_EQUALIZER is not set
> # CONFIG_NET_FC is not set
> # CONFIG_NET_TEAM is not set
> # CONFIG_MACVLAN is not set
> # CONFIG_IPVLAN is not set
> # CONFIG_VXLAN is not set
> # CONFIG_GENEVE is not set
> # CONFIG_BAREUDP is not set
> # CONFIG_GTP is not set
> # CONFIG_MACSEC is not set
> # CONFIG_NETCONSOLE is not set
> # CONFIG_NTB_NETDEV is not set
> # CONFIG_TUN is not set
> # CONFIG_TUN_VNET_CROSS_LE is not set
> # CONFIG_VETH is not set
> # CONFIG_VIRTIO_NET is not set
> # CONFIG_NLMON is not set
> # CONFIG_ARCNET is not set
> 
> #
> # Distributed Switch Architecture drivers
> #
> # end of Distributed Switch Architecture drivers
> 
> CONFIG_ETHERNET=y
> CONFIG_NET_VENDOR_3COM=y
> # CONFIG_EL3 is not set
> # CONFIG_VORTEX is not set
> # CONFIG_TYPHOON is not set
> CONFIG_NET_VENDOR_ADAPTEC=y
> # CONFIG_ADAPTEC_STARFIRE is not set
> CONFIG_NET_VENDOR_AGERE=y
> # CONFIG_ET131X is not set
> CONFIG_NET_VENDOR_ALACRITECH=y
> # CONFIG_SLICOSS is not set
> CONFIG_NET_VENDOR_ALTEON=y
> # CONFIG_ACENIC is not set
> # CONFIG_ALTERA_TSE is not set
> CONFIG_NET_VENDOR_AMAZON=y
> CONFIG_NET_VENDOR_AMD=y
> # CONFIG_AMD8111_ETH is not set
> # CONFIG_PCNET32 is not set
> # CONFIG_AMD_XGBE is not set
> CONFIG_NET_VENDOR_AQUANTIA=y
> # CONFIG_AQTION is not set
> CONFIG_NET_VENDOR_ARC=y
> CONFIG_NET_VENDOR_ATHEROS=y
> # CONFIG_ATL2 is not set
> # CONFIG_ATL1 is not set
> # CONFIG_ATL1E is not set
> # CONFIG_ATL1C is not set
> # CONFIG_ALX is not set
> CONFIG_NET_VENDOR_AURORA=y
> # CONFIG_AURORA_NB8800 is not set
> CONFIG_NET_VENDOR_BROADCOM=y
> # CONFIG_B44 is not set
> # CONFIG_BCMGENET is not set
> # CONFIG_BNX2 is not set
> # CONFIG_CNIC is not set
> # CONFIG_TIGON3 is not set
> # CONFIG_BNX2X is not set
> # CONFIG_SYSTEMPORT is not set
> # CONFIG_BNXT is not set
> CONFIG_NET_VENDOR_BROCADE=y
> # CONFIG_BNA is not set
> CONFIG_NET_VENDOR_CADENCE=y
> # CONFIG_MACB is not set
> CONFIG_NET_VENDOR_CAVIUM=y
> # CONFIG_THUNDER_NIC_PF is not set
> # CONFIG_THUNDER_NIC_VF is not set
> # CONFIG_THUNDER_NIC_BGX is not set
> # CONFIG_THUNDER_NIC_RGX is not set
> # CONFIG_CAVIUM_PTP is not set
> # CONFIG_LIQUIDIO is not set
> CONFIG_NET_VENDOR_CHELSIO=y
> # CONFIG_CHELSIO_T1 is not set
> # CONFIG_CHELSIO_T3 is not set
> # CONFIG_CHELSIO_T4 is not set
> # CONFIG_CHELSIO_T4VF is not set
> CONFIG_NET_VENDOR_CIRRUS=y
> # CONFIG_CS89x0 is not set
> CONFIG_NET_VENDOR_CISCO=y
> # CONFIG_ENIC is not set
> CONFIG_NET_VENDOR_CORTINA=y
> # CONFIG_GEMINI_ETHERNET is not set
> # CONFIG_CX_ECAT is not set
> # CONFIG_DNET is not set
> CONFIG_NET_VENDOR_DEC=y
> # CONFIG_NET_TULIP is not set
> CONFIG_NET_VENDOR_DLINK=y
> # CONFIG_DL2K is not set
> # CONFIG_SUNDANCE is not set
> CONFIG_NET_VENDOR_EMULEX=y
> # CONFIG_BE2NET is not set
> CONFIG_NET_VENDOR_EZCHIP=y
> # CONFIG_EZCHIP_NPS_MANAGEMENT_ENET is not set
> CONFIG_NET_VENDOR_GOOGLE=y
> CONFIG_NET_VENDOR_HUAWEI=y
> CONFIG_NET_VENDOR_I825XX=y
> CONFIG_NET_VENDOR_INTEL=y
> # CONFIG_E100 is not set
> CONFIG_E1000=y
> # CONFIG_E1000E is not set
> # CONFIG_IGB is not set
> # CONFIG_IGBVF is not set
> # CONFIG_IXGB is not set
> # CONFIG_IXGBE is not set
> # CONFIG_I40E is not set
> # CONFIG_IGC is not set
> # CONFIG_JME is not set
> CONFIG_NET_VENDOR_MARVELL=y
> # CONFIG_MVMDIO is not set
> # CONFIG_SKGE is not set
> # CONFIG_SKY2 is not set
> CONFIG_NET_VENDOR_MELLANOX=y
> # CONFIG_MLX4_EN is not set
> # CONFIG_MLX5_CORE is not set
> # CONFIG_MLXSW_CORE is not set
> # CONFIG_MLXFW is not set
> CONFIG_NET_VENDOR_MICREL=y
> # CONFIG_KS8851_MLL is not set
> # CONFIG_KSZ884X_PCI is not set
> CONFIG_NET_VENDOR_MICROCHIP=y
> # CONFIG_LAN743X is not set
> CONFIG_NET_VENDOR_MICROSEMI=y
> CONFIG_NET_VENDOR_MYRI=y
> # CONFIG_MYRI10GE is not set
> # CONFIG_FEALNX is not set
> CONFIG_NET_VENDOR_NATSEMI=y
> # CONFIG_NATSEMI is not set
> # CONFIG_NS83820 is not set
> CONFIG_NET_VENDOR_NETERION=y
> # CONFIG_S2IO is not set
> # CONFIG_VXGE is not set
> CONFIG_NET_VENDOR_NETRONOME=y
> CONFIG_NET_VENDOR_NI=y
> # CONFIG_NI_XGE_MANAGEMENT_ENET is not set
> CONFIG_NET_VENDOR_8390=y
> # CONFIG_NE2K_PCI is not set
> CONFIG_NET_VENDOR_NVIDIA=y
> # CONFIG_FORCEDETH is not set
> CONFIG_NET_VENDOR_OKI=y
> # CONFIG_ETHOC is not set
> CONFIG_NET_VENDOR_PACKET_ENGINES=y
> # CONFIG_HAMACHI is not set
> # CONFIG_YELLOWFIN is not set
> CONFIG_NET_VENDOR_PENSANDO=y
> # CONFIG_IONIC is not set
> CONFIG_NET_VENDOR_QLOGIC=y
> # CONFIG_QLA3XXX is not set
> # CONFIG_QLCNIC is not set
> # CONFIG_NETXEN_NIC is not set
> # CONFIG_QED is not set
> CONFIG_NET_VENDOR_QUALCOMM=y
> # CONFIG_QCA7000_UART is not set
> # CONFIG_QCOM_EMAC is not set
> # CONFIG_RMNET is not set
> CONFIG_NET_VENDOR_RDC=y
> # CONFIG_R6040 is not set
> CONFIG_NET_VENDOR_REALTEK=y
> # CONFIG_ATP is not set
> # CONFIG_8139CP is not set
> # CONFIG_8139TOO is not set
> # CONFIG_R8169 is not set
> CONFIG_NET_VENDOR_RENESAS=y
> CONFIG_NET_VENDOR_ROCKER=y
> CONFIG_NET_VENDOR_SAMSUNG=y
> # CONFIG_SXGBE_ETH is not set
> CONFIG_NET_VENDOR_SEEQ=y
> CONFIG_NET_VENDOR_SOLARFLARE=y
> # CONFIG_SFC is not set
> # CONFIG_SFC_FALCON is not set
> CONFIG_NET_VENDOR_SILAN=y
> # CONFIG_SC92031 is not set
> CONFIG_NET_VENDOR_SIS=y
> # CONFIG_SIS900 is not set
> # CONFIG_SIS190 is not set
> CONFIG_NET_VENDOR_SMSC=y
> # CONFIG_EPIC100 is not set
> # CONFIG_SMSC911X is not set
> # CONFIG_SMSC9420 is not set
> CONFIG_NET_VENDOR_SOCIONEXT=y
> CONFIG_NET_VENDOR_STMICRO=y
> # CONFIG_STMMAC_ETH is not set
> CONFIG_NET_VENDOR_SUN=y
> # CONFIG_HAPPYMEAL is not set
> # CONFIG_SUNGEM is not set
> # CONFIG_CASSINI is not set
> # CONFIG_NIU is not set
> CONFIG_NET_VENDOR_SYNOPSYS=y
> # CONFIG_DWC_XLGMAC is not set
> CONFIG_NET_VENDOR_TEHUTI=y
> # CONFIG_TEHUTI is not set
> CONFIG_NET_VENDOR_TI=y
> # CONFIG_TI_CPSW_PHY_SEL is not set
> # CONFIG_TLAN is not set
> CONFIG_NET_VENDOR_VIA=y
> # CONFIG_VIA_RHINE is not set
> # CONFIG_VIA_VELOCITY is not set
> CONFIG_NET_VENDOR_WIZNET=y
> # CONFIG_WIZNET_W5100 is not set
> # CONFIG_WIZNET_W5300 is not set
> CONFIG_NET_VENDOR_XILINX=y
> # CONFIG_XILINX_AXI_EMAC is not set
> # CONFIG_XILINX_LL_TEMAC is not set
> # CONFIG_FDDI is not set
> # CONFIG_HIPPI is not set
> # CONFIG_NET_SB1000 is not set
> # CONFIG_MDIO_DEVICE is not set
> # CONFIG_PHYLIB is not set
> # CONFIG_PLIP is not set
> # CONFIG_PPP is not set
> # CONFIG_SLIP is not set
> 
> #
> # Host-side USB support is needed for USB Network Adapter support
> #
> CONFIG_WLAN=y
> # CONFIG_WIRELESS_WDS is not set
> CONFIG_WLAN_VENDOR_ADMTEK=y
> CONFIG_WLAN_VENDOR_ATH=y
> # CONFIG_ATH_DEBUG is not set
> # CONFIG_ATH5K_PCI is not set
> CONFIG_WLAN_VENDOR_ATMEL=y
> CONFIG_WLAN_VENDOR_BROADCOM=y
> CONFIG_WLAN_VENDOR_CISCO=y
> CONFIG_WLAN_VENDOR_INTEL=y
> CONFIG_WLAN_VENDOR_INTERSIL=y
> # CONFIG_HOSTAP is not set
> # CONFIG_PRISM54 is not set
> CONFIG_WLAN_VENDOR_MARVELL=y
> CONFIG_WLAN_VENDOR_MEDIATEK=y
> CONFIG_WLAN_VENDOR_RALINK=y
> CONFIG_WLAN_VENDOR_REALTEK=y
> CONFIG_WLAN_VENDOR_RSI=y
> CONFIG_WLAN_VENDOR_ST=y
> CONFIG_WLAN_VENDOR_TI=y
> CONFIG_WLAN_VENDOR_ZYDAS=y
> CONFIG_WLAN_VENDOR_QUANTENNA=y
> 
> #
> # Enable WiMAX (Networking options) to see the WiMAX drivers
> #
> # CONFIG_WAN is not set
> # CONFIG_VMXNET3 is not set
> # CONFIG_FUJITSU_ES is not set
> # CONFIG_NETDEVSIM is not set
> # CONFIG_NET_FAILOVER is not set
> # CONFIG_ISDN is not set
> CONFIG_NVM=y
> CONFIG_NVM_PBLK=y
> CONFIG_NVM_PBLK_DEBUG=y
> 
> #
> # Input device support
> #
> CONFIG_INPUT=y
> CONFIG_INPUT_LEDS=y
> # CONFIG_INPUT_FF_MEMLESS is not set
> # CONFIG_INPUT_POLLDEV is not set
> # CONFIG_INPUT_SPARSEKMAP is not set
> # CONFIG_INPUT_MATRIXKMAP is not set
> 
> #
> # Userland interfaces
> #
> # CONFIG_INPUT_MOUSEDEV is not set
> # CONFIG_INPUT_JOYDEV is not set
> # CONFIG_INPUT_EVDEV is not set
> # CONFIG_INPUT_EVBUG is not set
> 
> #
> # Input Device Drivers
> #
> CONFIG_INPUT_KEYBOARD=y
> # CONFIG_KEYBOARD_ADC is not set
> # CONFIG_KEYBOARD_ADP5520 is not set
> # CONFIG_KEYBOARD_ADP5588 is not set
> # CONFIG_KEYBOARD_ADP5589 is not set
> CONFIG_KEYBOARD_ATKBD=y
> # CONFIG_KEYBOARD_QT1050 is not set
> # CONFIG_KEYBOARD_QT1070 is not set
> # CONFIG_KEYBOARD_QT2160 is not set
> # CONFIG_KEYBOARD_DLINK_DIR685 is not set
> # CONFIG_KEYBOARD_LKKBD is not set
> # CONFIG_KEYBOARD_GPIO is not set
> # CONFIG_KEYBOARD_GPIO_POLLED is not set
> # CONFIG_KEYBOARD_TCA6416 is not set
> # CONFIG_KEYBOARD_TCA8418 is not set
> # CONFIG_KEYBOARD_MATRIX is not set
> # CONFIG_KEYBOARD_LM8323 is not set
> # CONFIG_KEYBOARD_LM8333 is not set
> # CONFIG_KEYBOARD_MAX7359 is not set
> # CONFIG_KEYBOARD_MCS is not set
> # CONFIG_KEYBOARD_MPR121 is not set
> # CONFIG_KEYBOARD_NEWTON is not set
> # CONFIG_KEYBOARD_OPENCORES is not set
> # CONFIG_KEYBOARD_SAMSUNG is not set
> # CONFIG_KEYBOARD_GOLDFISH_EVENTS is not set
> # CONFIG_KEYBOARD_STOWAWAY is not set
> # CONFIG_KEYBOARD_SUNKBD is not set
> # CONFIG_KEYBOARD_OMAP4 is not set
> # CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
> # CONFIG_KEYBOARD_TWL4030 is not set
> # CONFIG_KEYBOARD_XTKBD is not set
> # CONFIG_KEYBOARD_CROS_EC is not set
> # CONFIG_KEYBOARD_CAP11XX is not set
> # CONFIG_KEYBOARD_BCM is not set
> # CONFIG_KEYBOARD_MTK_PMIC is not set
> CONFIG_INPUT_MOUSE=y
> CONFIG_MOUSE_PS2=y
> CONFIG_MOUSE_PS2_ALPS=y
> CONFIG_MOUSE_PS2_BYD=y
> CONFIG_MOUSE_PS2_LOGIPS2PP=y
> CONFIG_MOUSE_PS2_SYNAPTICS=y
> CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=y
> CONFIG_MOUSE_PS2_CYPRESS=y
> CONFIG_MOUSE_PS2_LIFEBOOK=y
> CONFIG_MOUSE_PS2_TRACKPOINT=y
> # CONFIG_MOUSE_PS2_ELANTECH is not set
> # CONFIG_MOUSE_PS2_SENTELIC is not set
> # CONFIG_MOUSE_PS2_TOUCHKIT is not set
> CONFIG_MOUSE_PS2_FOCALTECH=y
> # CONFIG_MOUSE_PS2_VMMOUSE is not set
> CONFIG_MOUSE_PS2_SMBUS=y
> # CONFIG_MOUSE_SERIAL is not set
> # CONFIG_MOUSE_APPLETOUCH is not set
> # CONFIG_MOUSE_BCM5974 is not set
> # CONFIG_MOUSE_CYAPA is not set
> # CONFIG_MOUSE_ELAN_I2C is not set
> # CONFIG_MOUSE_VSXXXAA is not set
> # CONFIG_MOUSE_GPIO is not set
> # CONFIG_MOUSE_SYNAPTICS_I2C is not set
> # CONFIG_MOUSE_SYNAPTICS_USB is not set
> # CONFIG_INPUT_JOYSTICK is not set
> # CONFIG_INPUT_TABLET is not set
> # CONFIG_INPUT_TOUCHSCREEN is not set
> # CONFIG_INPUT_MISC is not set
> # CONFIG_RMI4_CORE is not set
> 
> #
> # Hardware I/O ports
> #
> CONFIG_SERIO=y
> CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
> CONFIG_SERIO_I8042=y
> CONFIG_SERIO_SERPORT=y
> CONFIG_SERIO_CT82C710=y
> # CONFIG_SERIO_PARKBD is not set
> CONFIG_SERIO_PCIPS2=y
> CONFIG_SERIO_LIBPS2=y
> # CONFIG_SERIO_RAW is not set
> CONFIG_SERIO_ALTERA_PS2=y
> CONFIG_SERIO_PS2MULT=y
> CONFIG_SERIO_ARC_PS2=y
> # CONFIG_SERIO_APBPS2 is not set
> CONFIG_SERIO_GPIO_PS2=y
> CONFIG_USERIO=y
> CONFIG_GAMEPORT=y
> CONFIG_GAMEPORT_NS558=y
> CONFIG_GAMEPORT_L4=y
> # CONFIG_GAMEPORT_EMU10K1 is not set
> CONFIG_GAMEPORT_FM801=y
> # end of Hardware I/O ports
> # end of Input device support
> 
> #
> # Character devices
> #
> CONFIG_TTY=y
> # CONFIG_VT is not set
> CONFIG_UNIX98_PTYS=y
> CONFIG_LEGACY_PTYS=y
> CONFIG_LEGACY_PTY_COUNT=256
> # CONFIG_LDISC_AUTOLOAD is not set
> 
> #
> # Serial drivers
> #
> CONFIG_SERIAL_EARLYCON=y
> CONFIG_SERIAL_8250=y
> # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
> CONFIG_SERIAL_8250_PNP=y
> # CONFIG_SERIAL_8250_16550A_VARIANTS is not set
> # CONFIG_SERIAL_8250_FINTEK is not set
> CONFIG_SERIAL_8250_CONSOLE=y
> CONFIG_SERIAL_8250_PCI=y
> CONFIG_SERIAL_8250_EXAR=y
> CONFIG_SERIAL_8250_NR_UARTS=4
> CONFIG_SERIAL_8250_RUNTIME_UARTS=4
> CONFIG_SERIAL_8250_EXTENDED=y
> CONFIG_SERIAL_8250_MANY_PORTS=y
> CONFIG_SERIAL_8250_ASPEED_VUART=y
> CONFIG_SERIAL_8250_SHARE_IRQ=y
> CONFIG_SERIAL_8250_DETECT_IRQ=y
> CONFIG_SERIAL_8250_RSA=y
> CONFIG_SERIAL_8250_DWLIB=y
> # CONFIG_SERIAL_8250_DW is not set
> # CONFIG_SERIAL_8250_RT288X is not set
> CONFIG_SERIAL_8250_LPSS=y
> CONFIG_SERIAL_8250_MID=y
> CONFIG_SERIAL_OF_PLATFORM=y
> 
> #
> # Non-8250 serial port support
> #
> # CONFIG_SERIAL_UARTLITE is not set
> CONFIG_SERIAL_CORE=y
> CONFIG_SERIAL_CORE_CONSOLE=y
> CONFIG_SERIAL_JSM=y
> # CONFIG_SERIAL_SIFIVE is not set
> # CONFIG_SERIAL_SCCNXP is not set
> CONFIG_SERIAL_SC16IS7XX=y
> # CONFIG_SERIAL_SC16IS7XX_I2C is not set
> CONFIG_SERIAL_ALTERA_JTAGUART=y
> # CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE is not set
> CONFIG_SERIAL_ALTERA_UART=y
> CONFIG_SERIAL_ALTERA_UART_MAXPORTS=4
> CONFIG_SERIAL_ALTERA_UART_BAUDRATE=115200
> # CONFIG_SERIAL_ALTERA_UART_CONSOLE is not set
> # CONFIG_SERIAL_XILINX_PS_UART is not set
> CONFIG_SERIAL_ARC=y
> # CONFIG_SERIAL_ARC_CONSOLE is not set
> CONFIG_SERIAL_ARC_NR_PORTS=1
> # CONFIG_SERIAL_RP2 is not set
> # CONFIG_SERIAL_FSL_LPUART is not set
> # CONFIG_SERIAL_FSL_LINFLEXUART is not set
> CONFIG_SERIAL_CONEXANT_DIGICOLOR=y
> CONFIG_SERIAL_CONEXANT_DIGICOLOR_CONSOLE=y
> CONFIG_SERIAL_SPRD=y
> CONFIG_SERIAL_SPRD_CONSOLE=y
> # end of Serial drivers
> 
> CONFIG_SERIAL_MCTRL_GPIO=y
> CONFIG_SERIAL_NONSTANDARD=y
> CONFIG_ROCKETPORT=y
> CONFIG_CYCLADES=y
> # CONFIG_CYZ_INTR is not set
> CONFIG_MOXA_INTELLIO=y
> CONFIG_MOXA_SMARTIO=y
> CONFIG_SYNCLINK=y
> CONFIG_SYNCLINKMP=y
> CONFIG_SYNCLINK_GT=y
> # CONFIG_ISI is not set
> # CONFIG_N_HDLC is not set
> CONFIG_GOLDFISH_TTY=y
> CONFIG_GOLDFISH_TTY_EARLY_CONSOLE=y
> # CONFIG_N_GSM is not set
> # CONFIG_NOZOMI is not set
> CONFIG_NULL_TTY=y
> # CONFIG_TRACE_ROUTER is not set
> CONFIG_TRACE_SINK=y
> CONFIG_HVC_DRIVER=y
> CONFIG_SERIAL_DEV_BUS=y
> # CONFIG_SERIAL_DEV_CTRL_TTYPORT is not set
> # CONFIG_TTY_PRINTK is not set
> CONFIG_PRINTER=y
> # CONFIG_LP_CONSOLE is not set
> CONFIG_PPDEV=y
> CONFIG_VIRTIO_CONSOLE=y
> # CONFIG_IPMI_HANDLER is not set
> CONFIG_IPMB_DEVICE_INTERFACE=y
> CONFIG_HW_RANDOM=y
> CONFIG_HW_RANDOM_TIMERIOMEM=y
> # CONFIG_HW_RANDOM_INTEL is not set
> # CONFIG_HW_RANDOM_AMD is not set
> # CONFIG_HW_RANDOM_VIA is not set
> CONFIG_HW_RANDOM_VIRTIO=y
> CONFIG_APPLICOM=y
> CONFIG_MWAVE=y
> CONFIG_DEVMEM=y
> CONFIG_DEVKMEM=y
> CONFIG_NVRAM=y
> CONFIG_RAW_DRIVER=y
> CONFIG_MAX_RAW_DEVS=256
> CONFIG_DEVPORT=y
> # CONFIG_HPET is not set
> # CONFIG_HANGCHECK_TIMER is not set
> # CONFIG_TCG_TPM is not set
> CONFIG_TELCLOCK=y
> CONFIG_XILLYBUS=y
> CONFIG_XILLYBUS_OF=y
> # end of Character devices
> 
> CONFIG_RANDOM_TRUST_CPU=y
> CONFIG_RANDOM_TRUST_BOOTLOADER=y
> 
> #
> # I2C support
> #
> CONFIG_I2C=y
> CONFIG_ACPI_I2C_OPREGION=y
> CONFIG_I2C_BOARDINFO=y
> # CONFIG_I2C_COMPAT is not set
> CONFIG_I2C_CHARDEV=y
> CONFIG_I2C_MUX=y
> 
> #
> # Multiplexer I2C Chip support
> #
> CONFIG_I2C_ARB_GPIO_CHALLENGE=y
> CONFIG_I2C_MUX_GPIO=y
> CONFIG_I2C_MUX_GPMUX=y
> # CONFIG_I2C_MUX_LTC4306 is not set
> CONFIG_I2C_MUX_PCA9541=y
> CONFIG_I2C_MUX_PCA954x=y
> # CONFIG_I2C_MUX_PINCTRL is not set
> CONFIG_I2C_MUX_REG=y
> CONFIG_I2C_DEMUX_PINCTRL=y
> CONFIG_I2C_MUX_MLXCPLD=y
> # end of Multiplexer I2C Chip support
> 
> CONFIG_I2C_HELPER_AUTO=y
> CONFIG_I2C_SMBUS=y
> CONFIG_I2C_ALGOBIT=y
> 
> #
> # I2C Hardware Bus support
> #
> 
> #
> # PC SMBus host controller drivers
> #
> # CONFIG_I2C_ALI1535 is not set
> CONFIG_I2C_ALI1563=y
> # CONFIG_I2C_ALI15X3 is not set
> # CONFIG_I2C_AMD756 is not set
> CONFIG_I2C_AMD8111=y
> # CONFIG_I2C_AMD_MP2 is not set
> CONFIG_I2C_I801=y
> # CONFIG_I2C_ISCH is not set
> CONFIG_I2C_ISMT=y
> CONFIG_I2C_PIIX4=y
> CONFIG_I2C_NFORCE2=y
> CONFIG_I2C_NFORCE2_S4985=y
> # CONFIG_I2C_NVIDIA_GPU is not set
> CONFIG_I2C_SIS5595=y
> CONFIG_I2C_SIS630=y
> CONFIG_I2C_SIS96X=y
> CONFIG_I2C_VIA=y
> CONFIG_I2C_VIAPRO=y
> 
> #
> # ACPI drivers
> #
> # CONFIG_I2C_SCMI is not set
> 
> #
> # I2C system bus drivers (mostly embedded / system-on-chip)
> #
> CONFIG_I2C_CBUS_GPIO=y
> CONFIG_I2C_DESIGNWARE_CORE=y
> CONFIG_I2C_DESIGNWARE_PLATFORM=y
> # CONFIG_I2C_DESIGNWARE_SLAVE is not set
> CONFIG_I2C_DESIGNWARE_PCI=y
> # CONFIG_I2C_DESIGNWARE_BAYTRAIL is not set
> # CONFIG_I2C_EMEV2 is not set
> CONFIG_I2C_GPIO=y
> # CONFIG_I2C_GPIO_FAULT_INJECTOR is not set
> CONFIG_I2C_KEMPLD=y
> # CONFIG_I2C_OCORES is not set
> # CONFIG_I2C_PCA_PLATFORM is not set
> # CONFIG_I2C_RK3X is not set
> CONFIG_I2C_SIMTEC=y
> CONFIG_I2C_XILINX=y
> 
> #
> # External I2C/SMBus adapter drivers
> #
> CONFIG_I2C_PARPORT=y
> # CONFIG_I2C_TAOS_EVM is not set
> 
> #
> # Other I2C/SMBus bus drivers
> #
> CONFIG_I2C_MLXCPLD=y
> CONFIG_I2C_CROS_EC_TUNNEL=y
> CONFIG_I2C_FSI=y
> # end of I2C Hardware Bus support
> 
> # CONFIG_I2C_STUB is not set
> CONFIG_I2C_SLAVE=y
> # CONFIG_I2C_SLAVE_EEPROM is not set
> # CONFIG_I2C_DEBUG_CORE is not set
> # CONFIG_I2C_DEBUG_ALGO is not set
> # CONFIG_I2C_DEBUG_BUS is not set
> # end of I2C support
> 
> CONFIG_I3C=y
> # CONFIG_CDNS_I3C_MASTER is not set
> # CONFIG_DW_I3C_MASTER is not set
> # CONFIG_SPI is not set
> CONFIG_SPMI=y
> # CONFIG_HSI is not set
> CONFIG_PPS=y
> # CONFIG_PPS_DEBUG is not set
> # CONFIG_NTP_PPS is not set
> 
> #
> # PPS clients support
> #
> CONFIG_PPS_CLIENT_KTIMER=y
> CONFIG_PPS_CLIENT_LDISC=y
> CONFIG_PPS_CLIENT_PARPORT=y
> CONFIG_PPS_CLIENT_GPIO=y
> 
> #
> # PPS generators support
> #
> 
> #
> # PTP clock support
> #
> # CONFIG_PTP_1588_CLOCK is not set
> 
> #
> # Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
> #
> # end of PTP clock support
> 
> CONFIG_PINCTRL=y
> CONFIG_GENERIC_PINCTRL_GROUPS=y
> CONFIG_PINMUX=y
> CONFIG_GENERIC_PINMUX_FUNCTIONS=y
> CONFIG_PINCONF=y
> CONFIG_GENERIC_PINCONF=y
> # CONFIG_DEBUG_PINCTRL is not set
> CONFIG_PINCTRL_AS3722=y
> # CONFIG_PINCTRL_AXP209 is not set
> # CONFIG_PINCTRL_AMD is not set
> CONFIG_PINCTRL_DA9062=y
> # CONFIG_PINCTRL_MCP23S08 is not set
> # CONFIG_PINCTRL_SINGLE is not set
> # CONFIG_PINCTRL_SX150X is not set
> # CONFIG_PINCTRL_STMFX is not set
> CONFIG_PINCTRL_PALMAS=y
> CONFIG_PINCTRL_RK805=y
> CONFIG_PINCTRL_OCELOT=y
> # CONFIG_PINCTRL_BAYTRAIL is not set
> # CONFIG_PINCTRL_CHERRYVIEW is not set
> # CONFIG_PINCTRL_LYNXPOINT is not set
> # CONFIG_PINCTRL_BROXTON is not set
> # CONFIG_PINCTRL_CANNONLAKE is not set
> # CONFIG_PINCTRL_CEDARFORK is not set
> # CONFIG_PINCTRL_DENVERTON is not set
> # CONFIG_PINCTRL_GEMINILAKE is not set
> # CONFIG_PINCTRL_ICELAKE is not set
> # CONFIG_PINCTRL_LEWISBURG is not set
> # CONFIG_PINCTRL_SUNRISEPOINT is not set
> # CONFIG_PINCTRL_TIGERLAKE is not set
> CONFIG_PINCTRL_MADERA=y
> CONFIG_PINCTRL_CS47L35=y
> CONFIG_PINCTRL_CS47L85=y
> CONFIG_PINCTRL_CS47L90=y
> CONFIG_PINCTRL_CS47L92=y
> # CONFIG_PINCTRL_EQUILIBRIUM is not set
> CONFIG_GPIOLIB=y
> CONFIG_GPIOLIB_FASTPATH_LIMIT=512
> CONFIG_OF_GPIO=y
> CONFIG_GPIO_ACPI=y
> CONFIG_GPIOLIB_IRQCHIP=y
> # CONFIG_DEBUG_GPIO is not set
> CONFIG_GPIO_SYSFS=y
> CONFIG_GPIO_GENERIC=y
> 
> #
> # Memory mapped GPIO drivers
> #
> CONFIG_GPIO_74XX_MMIO=y
> # CONFIG_GPIO_ALTERA is not set
> # CONFIG_GPIO_AMDPT is not set
> CONFIG_GPIO_CADENCE=y
> CONFIG_GPIO_DWAPB=y
> # CONFIG_GPIO_EXAR is not set
> CONFIG_GPIO_FTGPIO010=y
> # CONFIG_GPIO_GENERIC_PLATFORM is not set
> CONFIG_GPIO_GRGPIO=y
> CONFIG_GPIO_HLWD=y
> CONFIG_GPIO_ICH=y
> # CONFIG_GPIO_LOGICVC is not set
> CONFIG_GPIO_MB86S7X=y
> # CONFIG_GPIO_SAMA5D2_PIOBU is not set
> # CONFIG_GPIO_SIFIVE is not set
> # CONFIG_GPIO_SYSCON is not set
> CONFIG_GPIO_VX855=y
> CONFIG_GPIO_XILINX=y
> # CONFIG_GPIO_AMD_FCH is not set
> # end of Memory mapped GPIO drivers
> 
> #
> # Port-mapped I/O GPIO drivers
> #
> CONFIG_GPIO_104_DIO_48E=y
> CONFIG_GPIO_104_IDIO_16=y
> CONFIG_GPIO_104_IDI_48=y
> CONFIG_GPIO_F7188X=y
> CONFIG_GPIO_GPIO_MM=y
> CONFIG_GPIO_IT87=y
> CONFIG_GPIO_SCH=y
> # CONFIG_GPIO_SCH311X is not set
> CONFIG_GPIO_WINBOND=y
> CONFIG_GPIO_WS16C48=y
> # end of Port-mapped I/O GPIO drivers
> 
> #
> # I2C GPIO expanders
> #
> CONFIG_GPIO_ADP5588=y
> # CONFIG_GPIO_ADP5588_IRQ is not set
> CONFIG_GPIO_ADNP=y
> # CONFIG_GPIO_GW_PLD is not set
> # CONFIG_GPIO_MAX7300 is not set
> CONFIG_GPIO_MAX732X=y
> # CONFIG_GPIO_MAX732X_IRQ is not set
> CONFIG_GPIO_PCA953X=y
> # CONFIG_GPIO_PCA953X_IRQ is not set
> CONFIG_GPIO_PCF857X=y
> CONFIG_GPIO_TPIC2810=y
> # end of I2C GPIO expanders
> 
> #
> # MFD GPIO expanders
> #
> CONFIG_GPIO_ADP5520=y
> # CONFIG_GPIO_ARIZONA is not set
> CONFIG_GPIO_BD70528=y
> # CONFIG_GPIO_BD71828 is not set
> # CONFIG_GPIO_BD9571MWV is not set
> CONFIG_GPIO_DA9052=y
> CONFIG_GPIO_JANZ_TTL=y
> CONFIG_GPIO_KEMPLD=y
> CONFIG_GPIO_LP87565=y
> # CONFIG_GPIO_MADERA is not set
> CONFIG_GPIO_MAX77650=y
> CONFIG_GPIO_PALMAS=y
> # CONFIG_GPIO_TPS65086 is not set
> CONFIG_GPIO_TPS65218=y
> CONFIG_GPIO_TPS6586X=y
> CONFIG_GPIO_TPS65912=y
> CONFIG_GPIO_TQMX86=y
> CONFIG_GPIO_TWL4030=y
> # CONFIG_GPIO_TWL6040 is not set
> # CONFIG_GPIO_WM8994 is not set
> # end of MFD GPIO expanders
> 
> #
> # PCI GPIO expanders
> #
> CONFIG_GPIO_AMD8111=y
> # CONFIG_GPIO_BT8XX is not set
> CONFIG_GPIO_ML_IOH=y
> CONFIG_GPIO_PCI_IDIO_16=y
> CONFIG_GPIO_PCIE_IDIO_24=y
> CONFIG_GPIO_RDC321X=y
> # CONFIG_GPIO_SODAVILLE is not set
> # end of PCI GPIO expanders
> 
> CONFIG_GPIO_MOCKUP=y
> CONFIG_W1=y
> 
> #
> # 1-wire Bus Masters
> #
> CONFIG_W1_MASTER_MATROX=y
> CONFIG_W1_MASTER_DS2482=y
> CONFIG_W1_MASTER_DS1WM=y
> # CONFIG_W1_MASTER_GPIO is not set
> CONFIG_W1_MASTER_SGI=y
> # end of 1-wire Bus Masters
> 
> #
> # 1-wire Slaves
> #
> CONFIG_W1_SLAVE_THERM=y
> CONFIG_W1_SLAVE_SMEM=y
> CONFIG_W1_SLAVE_DS2405=y
> CONFIG_W1_SLAVE_DS2408=y
> # CONFIG_W1_SLAVE_DS2408_READBACK is not set
> # CONFIG_W1_SLAVE_DS2413 is not set
> CONFIG_W1_SLAVE_DS2406=y
> # CONFIG_W1_SLAVE_DS2423 is not set
> # CONFIG_W1_SLAVE_DS2805 is not set
> # CONFIG_W1_SLAVE_DS2430 is not set
> # CONFIG_W1_SLAVE_DS2431 is not set
> CONFIG_W1_SLAVE_DS2433=y
> # CONFIG_W1_SLAVE_DS2433_CRC is not set
> CONFIG_W1_SLAVE_DS2438=y
> # CONFIG_W1_SLAVE_DS250X is not set
> CONFIG_W1_SLAVE_DS2780=y
> CONFIG_W1_SLAVE_DS2781=y
> # CONFIG_W1_SLAVE_DS28E04 is not set
> # CONFIG_W1_SLAVE_DS28E17 is not set
> # end of 1-wire Slaves
> 
> # CONFIG_POWER_AVS is not set
> CONFIG_POWER_RESET=y
> CONFIG_POWER_RESET_AS3722=y
> CONFIG_POWER_RESET_GPIO=y
> # CONFIG_POWER_RESET_GPIO_RESTART is not set
> # CONFIG_POWER_RESET_LTC2952 is not set
> # CONFIG_POWER_RESET_MT6323 is not set
> # CONFIG_POWER_RESET_RESTART is not set
> # CONFIG_POWER_RESET_SYSCON is not set
> CONFIG_POWER_RESET_SYSCON_POWEROFF=y
> # CONFIG_SYSCON_REBOOT_MODE is not set
> # CONFIG_NVMEM_REBOOT_MODE is not set
> CONFIG_POWER_SUPPLY=y
> # CONFIG_POWER_SUPPLY_DEBUG is not set
> # CONFIG_POWER_SUPPLY_HWMON is not set
> CONFIG_PDA_POWER=y
> # CONFIG_GENERIC_ADC_BATTERY is not set
> CONFIG_MAX8925_POWER=y
> # CONFIG_TEST_POWER is not set
> CONFIG_BATTERY_88PM860X=y
> CONFIG_CHARGER_ADP5061=y
> CONFIG_BATTERY_ACT8945A=y
> CONFIG_BATTERY_DS2760=y
> CONFIG_BATTERY_DS2780=y
> CONFIG_BATTERY_DS2781=y
> # CONFIG_BATTERY_DS2782 is not set
> CONFIG_BATTERY_LEGO_EV3=y
> CONFIG_BATTERY_SBS=y
> CONFIG_CHARGER_SBS=y
> # CONFIG_MANAGER_SBS is not set
> CONFIG_BATTERY_BQ27XXX=y
> CONFIG_BATTERY_BQ27XXX_I2C=y
> CONFIG_BATTERY_BQ27XXX_HDQ=y
> # CONFIG_BATTERY_BQ27XXX_DT_UPDATES_NVM is not set
> CONFIG_BATTERY_DA9030=y
> # CONFIG_BATTERY_DA9052 is not set
> CONFIG_BATTERY_DA9150=y
> CONFIG_CHARGER_AXP20X=y
> # CONFIG_BATTERY_AXP20X is not set
> CONFIG_AXP20X_POWER=y
> # CONFIG_AXP288_FUEL_GAUGE is not set
> CONFIG_BATTERY_MAX17040=y
> CONFIG_BATTERY_MAX17042=y
> CONFIG_BATTERY_MAX1721X=y
> CONFIG_BATTERY_TWL4030_MADC=y
> # CONFIG_CHARGER_88PM860X is not set
> CONFIG_CHARGER_PCF50633=y
> CONFIG_BATTERY_RX51=y
> CONFIG_CHARGER_MAX8903=y
> CONFIG_CHARGER_TWL4030=y
> CONFIG_CHARGER_LP8727=y
> # CONFIG_CHARGER_GPIO is not set
> CONFIG_CHARGER_MANAGER=y
> CONFIG_CHARGER_LT3651=y
> CONFIG_CHARGER_MAX14577=y
> CONFIG_CHARGER_DETECTOR_MAX14656=y
> CONFIG_CHARGER_MAX77650=y
> CONFIG_CHARGER_MAX77693=y
> CONFIG_CHARGER_BQ2415X=y
> CONFIG_CHARGER_BQ24190=y
> CONFIG_CHARGER_BQ24257=y
> # CONFIG_CHARGER_BQ24735 is not set
> CONFIG_CHARGER_BQ25890=y
> CONFIG_CHARGER_SMB347=y
> # CONFIG_CHARGER_TPS65217 is not set
> # CONFIG_BATTERY_GAUGE_LTC2941 is not set
> CONFIG_BATTERY_GOLDFISH=y
> CONFIG_BATTERY_RT5033=y
> # CONFIG_CHARGER_RT9455 is not set
> # CONFIG_CHARGER_CROS_USBPD is not set
> CONFIG_CHARGER_UCS1002=y
> CONFIG_CHARGER_BD70528=y
> CONFIG_HWMON=y
> CONFIG_HWMON_VID=y
> CONFIG_HWMON_DEBUG_CHIP=y
> 
> #
> # Native drivers
> #
> CONFIG_SENSORS_ABITUGURU=y
> # CONFIG_SENSORS_ABITUGURU3 is not set
> # CONFIG_SENSORS_AD7414 is not set
> # CONFIG_SENSORS_AD7418 is not set
> CONFIG_SENSORS_ADM1021=y
> CONFIG_SENSORS_ADM1025=y
> CONFIG_SENSORS_ADM1026=y
> CONFIG_SENSORS_ADM1029=y
> CONFIG_SENSORS_ADM1031=y
> CONFIG_SENSORS_ADM1177=y
> CONFIG_SENSORS_ADM9240=y
> CONFIG_SENSORS_ADT7X10=y
> CONFIG_SENSORS_ADT7410=y
> # CONFIG_SENSORS_ADT7411 is not set
> CONFIG_SENSORS_ADT7462=y
> CONFIG_SENSORS_ADT7470=y
> # CONFIG_SENSORS_ADT7475 is not set
> CONFIG_SENSORS_AS370=y
> # CONFIG_SENSORS_ASC7621 is not set
> # CONFIG_SENSORS_AXI_FAN_CONTROL is not set
> CONFIG_SENSORS_K8TEMP=y
> CONFIG_SENSORS_K10TEMP=y
> CONFIG_SENSORS_FAM15H_POWER=y
> # CONFIG_SENSORS_APPLESMC is not set
> CONFIG_SENSORS_ASB100=y
> # CONFIG_SENSORS_ASPEED is not set
> CONFIG_SENSORS_ATXP1=y
> # CONFIG_SENSORS_DRIVETEMP is not set
> # CONFIG_SENSORS_DS620 is not set
> CONFIG_SENSORS_DS1621=y
> CONFIG_SENSORS_DELL_SMM=y
> # CONFIG_SENSORS_DA9052_ADC is not set
> CONFIG_SENSORS_I5K_AMB=y
> CONFIG_SENSORS_F71805F=y
> CONFIG_SENSORS_F71882FG=y
> CONFIG_SENSORS_F75375S=y
> # CONFIG_SENSORS_FSCHMD is not set
> CONFIG_SENSORS_FTSTEUTATES=y
> # CONFIG_SENSORS_GL518SM is not set
> # CONFIG_SENSORS_GL520SM is not set
> # CONFIG_SENSORS_G760A is not set
> # CONFIG_SENSORS_G762 is not set
> CONFIG_SENSORS_GPIO_FAN=y
> CONFIG_SENSORS_HIH6130=y
> CONFIG_SENSORS_IIO_HWMON=y
> CONFIG_SENSORS_I5500=y
> CONFIG_SENSORS_CORETEMP=y
> # CONFIG_SENSORS_IT87 is not set
> CONFIG_SENSORS_JC42=y
> CONFIG_SENSORS_POWR1220=y
> # CONFIG_SENSORS_LINEAGE is not set
> CONFIG_SENSORS_LTC2945=y
> CONFIG_SENSORS_LTC2947=y
> CONFIG_SENSORS_LTC2947_I2C=y
> # CONFIG_SENSORS_LTC2990 is not set
> CONFIG_SENSORS_LTC4151=y
> CONFIG_SENSORS_LTC4215=y
> CONFIG_SENSORS_LTC4222=y
> CONFIG_SENSORS_LTC4245=y
> # CONFIG_SENSORS_LTC4260 is not set
> # CONFIG_SENSORS_LTC4261 is not set
> CONFIG_SENSORS_MAX16065=y
> CONFIG_SENSORS_MAX1619=y
> CONFIG_SENSORS_MAX1668=y
> CONFIG_SENSORS_MAX197=y
> # CONFIG_SENSORS_MAX31730 is not set
> CONFIG_SENSORS_MAX6621=y
> CONFIG_SENSORS_MAX6639=y
> # CONFIG_SENSORS_MAX6642 is not set
> CONFIG_SENSORS_MAX6650=y
> # CONFIG_SENSORS_MAX6697 is not set
> # CONFIG_SENSORS_MAX31790 is not set
> CONFIG_SENSORS_MCP3021=y
> CONFIG_SENSORS_TC654=y
> CONFIG_SENSORS_LM63=y
> CONFIG_SENSORS_LM73=y
> CONFIG_SENSORS_LM75=y
> CONFIG_SENSORS_LM77=y
> # CONFIG_SENSORS_LM78 is not set
> # CONFIG_SENSORS_LM80 is not set
> CONFIG_SENSORS_LM83=y
> CONFIG_SENSORS_LM85=y
> CONFIG_SENSORS_LM87=y
> # CONFIG_SENSORS_LM90 is not set
> CONFIG_SENSORS_LM92=y
> CONFIG_SENSORS_LM93=y
> # CONFIG_SENSORS_LM95234 is not set
> CONFIG_SENSORS_LM95241=y
> CONFIG_SENSORS_LM95245=y
> CONFIG_SENSORS_PC87360=y
> # CONFIG_SENSORS_PC87427 is not set
> CONFIG_SENSORS_NTC_THERMISTOR=y
> # CONFIG_SENSORS_NCT6683 is not set
> CONFIG_SENSORS_NCT6775=y
> # CONFIG_SENSORS_NCT7802 is not set
> CONFIG_SENSORS_NCT7904=y
> CONFIG_SENSORS_NPCM7XX=y
> CONFIG_SENSORS_PCF8591=y
> CONFIG_PMBUS=y
> CONFIG_SENSORS_PMBUS=y
> # CONFIG_SENSORS_ADM1275 is not set
> CONFIG_SENSORS_BEL_PFE=y
> CONFIG_SENSORS_IBM_CFFPS=y
> CONFIG_SENSORS_INSPUR_IPSPS=y
> CONFIG_SENSORS_IR35221=y
> CONFIG_SENSORS_IR38064=y
> CONFIG_SENSORS_IRPS5401=y
> CONFIG_SENSORS_ISL68137=y
> # CONFIG_SENSORS_LM25066 is not set
> CONFIG_SENSORS_LTC2978=y
> CONFIG_SENSORS_LTC2978_REGULATOR=y
> CONFIG_SENSORS_LTC3815=y
> CONFIG_SENSORS_MAX16064=y
> # CONFIG_SENSORS_MAX20730 is not set
> # CONFIG_SENSORS_MAX20751 is not set
> # CONFIG_SENSORS_MAX31785 is not set
> # CONFIG_SENSORS_MAX34440 is not set
> # CONFIG_SENSORS_MAX8688 is not set
> CONFIG_SENSORS_PXE1610=y
> CONFIG_SENSORS_TPS40422=y
> CONFIG_SENSORS_TPS53679=y
> CONFIG_SENSORS_UCD9000=y
> CONFIG_SENSORS_UCD9200=y
> CONFIG_SENSORS_XDPE122=y
> CONFIG_SENSORS_ZL6100=y
> CONFIG_SENSORS_SHT15=y
> CONFIG_SENSORS_SHT21=y
> CONFIG_SENSORS_SHT3x=y
> CONFIG_SENSORS_SHTC1=y
> # CONFIG_SENSORS_SIS5595 is not set
> CONFIG_SENSORS_DME1737=y
> CONFIG_SENSORS_EMC1403=y
> # CONFIG_SENSORS_EMC2103 is not set
> CONFIG_SENSORS_EMC6W201=y
> CONFIG_SENSORS_SMSC47M1=y
> # CONFIG_SENSORS_SMSC47M192 is not set
> CONFIG_SENSORS_SMSC47B397=y
> # CONFIG_SENSORS_SCH5627 is not set
> # CONFIG_SENSORS_SCH5636 is not set
> # CONFIG_SENSORS_STTS751 is not set
> # CONFIG_SENSORS_SMM665 is not set
> # CONFIG_SENSORS_ADC128D818 is not set
> CONFIG_SENSORS_ADS7828=y
> CONFIG_SENSORS_AMC6821=y
> # CONFIG_SENSORS_INA209 is not set
> CONFIG_SENSORS_INA2XX=y
> CONFIG_SENSORS_INA3221=y
> CONFIG_SENSORS_TC74=y
> CONFIG_SENSORS_THMC50=y
> CONFIG_SENSORS_TMP102=y
> CONFIG_SENSORS_TMP103=y
> # CONFIG_SENSORS_TMP108 is not set
> CONFIG_SENSORS_TMP401=y
> # CONFIG_SENSORS_TMP421 is not set
> CONFIG_SENSORS_TMP513=y
> # CONFIG_SENSORS_VIA_CPUTEMP is not set
> # CONFIG_SENSORS_VIA686A is not set
> # CONFIG_SENSORS_VT1211 is not set
> # CONFIG_SENSORS_VT8231 is not set
> CONFIG_SENSORS_W83773G=y
> CONFIG_SENSORS_W83781D=y
> CONFIG_SENSORS_W83791D=y
> CONFIG_SENSORS_W83792D=y
> CONFIG_SENSORS_W83793=y
> # CONFIG_SENSORS_W83795 is not set
> # CONFIG_SENSORS_W83L785TS is not set
> # CONFIG_SENSORS_W83L786NG is not set
> # CONFIG_SENSORS_W83627HF is not set
> # CONFIG_SENSORS_W83627EHF is not set
> 
> #
> # ACPI drivers
> #
> # CONFIG_SENSORS_ACPI_POWER is not set
> # CONFIG_SENSORS_ATK0110 is not set
> CONFIG_THERMAL=y
> CONFIG_THERMAL_STATISTICS=y
> CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
> # CONFIG_THERMAL_HWMON is not set
> # CONFIG_THERMAL_OF is not set
> # CONFIG_THERMAL_WRITABLE_TRIPS is not set
> CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
> # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> CONFIG_THERMAL_GOV_FAIR_SHARE=y
> CONFIG_THERMAL_GOV_STEP_WISE=y
> CONFIG_THERMAL_GOV_BANG_BANG=y
> # CONFIG_THERMAL_GOV_USER_SPACE is not set
> CONFIG_CLOCK_THERMAL=y
> CONFIG_DEVFREQ_THERMAL=y
> CONFIG_THERMAL_EMULATION=y
> # CONFIG_THERMAL_MMIO is not set
> CONFIG_DA9062_THERMAL=y
> 
> #
> # Intel thermal drivers
> #
> CONFIG_INTEL_POWERCLAMP=y
> # CONFIG_INTEL_SOC_DTS_THERMAL is not set
> 
> #
> # ACPI INT340X thermal drivers
> #
> # CONFIG_INT340X_THERMAL is not set
> # end of ACPI INT340X thermal drivers
> 
> # CONFIG_INTEL_PCH_THERMAL is not set
> # end of Intel thermal drivers
> 
> CONFIG_GENERIC_ADC_THERMAL=y
> CONFIG_WATCHDOG=y
> CONFIG_WATCHDOG_CORE=y
> # CONFIG_WATCHDOG_NOWAYOUT is not set
> # CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is not set
> CONFIG_WATCHDOG_OPEN_TIMEOUT=0
> # CONFIG_WATCHDOG_SYSFS is not set
> 
> #
> # Watchdog Pretimeout Governors
> #
> CONFIG_WATCHDOG_PRETIMEOUT_GOV=y
> CONFIG_WATCHDOG_PRETIMEOUT_GOV_SEL=m
> # CONFIG_WATCHDOG_PRETIMEOUT_GOV_NOOP is not set
> CONFIG_WATCHDOG_PRETIMEOUT_GOV_PANIC=y
> CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC=y
> 
> #
> # Watchdog Device Drivers
> #
> # CONFIG_SOFT_WATCHDOG is not set
> CONFIG_BD70528_WATCHDOG=y
> CONFIG_DA9052_WATCHDOG=y
> # CONFIG_DA9063_WATCHDOG is not set
> CONFIG_DA9062_WATCHDOG=y
> # CONFIG_GPIO_WATCHDOG is not set
> # CONFIG_WDAT_WDT is not set
> CONFIG_XILINX_WATCHDOG=y
> CONFIG_ZIIRAVE_WATCHDOG=y
> # CONFIG_CADENCE_WATCHDOG is not set
> # CONFIG_DW_WATCHDOG is not set
> CONFIG_RN5T618_WATCHDOG=y
> # CONFIG_TWL4030_WATCHDOG is not set
> CONFIG_MAX63XX_WATCHDOG=y
> # CONFIG_RETU_WATCHDOG is not set
> # CONFIG_STPMIC1_WATCHDOG is not set
> CONFIG_ACQUIRE_WDT=y
> # CONFIG_ADVANTECH_WDT is not set
> CONFIG_ALIM1535_WDT=y
> CONFIG_ALIM7101_WDT=y
> CONFIG_EBC_C384_WDT=y
> CONFIG_F71808E_WDT=y
> CONFIG_SP5100_TCO=y
> # CONFIG_SBC_FITPC2_WATCHDOG is not set
> # CONFIG_EUROTECH_WDT is not set
> CONFIG_IB700_WDT=y
> # CONFIG_IBMASR is not set
> CONFIG_WAFER_WDT=y
> CONFIG_I6300ESB_WDT=y
> CONFIG_IE6XX_WDT=y
> CONFIG_ITCO_WDT=y
> CONFIG_ITCO_VENDOR_SUPPORT=y
> # CONFIG_IT8712F_WDT is not set
> CONFIG_IT87_WDT=y
> CONFIG_HP_WATCHDOG=y
> # CONFIG_HPWDT_NMI_DECODING is not set
> CONFIG_KEMPLD_WDT=y
> CONFIG_SC1200_WDT=y
> CONFIG_PC87413_WDT=y
> # CONFIG_NV_TCO is not set
> # CONFIG_60XX_WDT is not set
> CONFIG_CPU5_WDT=y
> # CONFIG_SMSC_SCH311X_WDT is not set
> CONFIG_SMSC37B787_WDT=y
> CONFIG_TQMX86_WDT=y
> # CONFIG_VIA_WDT is not set
> CONFIG_W83627HF_WDT=y
> # CONFIG_W83877F_WDT is not set
> CONFIG_W83977F_WDT=y
> # CONFIG_MACHZ_WDT is not set
> CONFIG_SBC_EPX_C3_WATCHDOG=y
> # CONFIG_INTEL_MEI_WDT is not set
> # CONFIG_NI903X_WDT is not set
> # CONFIG_NIC7018_WDT is not set
> CONFIG_MEN_A21_WDT=y
> 
> #
> # PCI-based Watchdog Cards
> #
> # CONFIG_PCIPCWATCHDOG is not set
> # CONFIG_WDTPCI is not set
> CONFIG_SSB_POSSIBLE=y
> CONFIG_SSB=y
> CONFIG_SSB_SPROM=y
> CONFIG_SSB_PCIHOST_POSSIBLE=y
> CONFIG_SSB_PCIHOST=y
> CONFIG_SSB_SDIOHOST_POSSIBLE=y
> CONFIG_SSB_SDIOHOST=y
> CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=y
> CONFIG_SSB_DRIVER_PCICORE=y
> CONFIG_SSB_DRIVER_GPIO=y
> CONFIG_BCMA_POSSIBLE=y
> # CONFIG_BCMA is not set
> 
> #
> # Multifunction device drivers
> #
> CONFIG_MFD_CORE=y
> CONFIG_MFD_ACT8945A=y
> # CONFIG_MFD_AS3711 is not set
> CONFIG_MFD_AS3722=y
> CONFIG_PMIC_ADP5520=y
> CONFIG_MFD_AAT2870_CORE=y
> CONFIG_MFD_ATMEL_FLEXCOM=y
> CONFIG_MFD_ATMEL_HLCDC=y
> CONFIG_MFD_BCM590XX=y
> CONFIG_MFD_BD9571MWV=y
> CONFIG_MFD_AXP20X=y
> CONFIG_MFD_AXP20X_I2C=y
> CONFIG_MFD_CROS_EC_DEV=y
> CONFIG_MFD_MADERA=y
> CONFIG_MFD_MADERA_I2C=y
> # CONFIG_MFD_CS47L15 is not set
> CONFIG_MFD_CS47L35=y
> CONFIG_MFD_CS47L85=y
> CONFIG_MFD_CS47L90=y
> CONFIG_MFD_CS47L92=y
> CONFIG_PMIC_DA903X=y
> CONFIG_PMIC_DA9052=y
> CONFIG_MFD_DA9052_I2C=y
> # CONFIG_MFD_DA9055 is not set
> CONFIG_MFD_DA9062=y
> CONFIG_MFD_DA9063=y
> CONFIG_MFD_DA9150=y
> # CONFIG_MFD_MC13XXX_I2C is not set
> # CONFIG_MFD_HI6421_PMIC is not set
> # CONFIG_HTC_PASIC3 is not set
> CONFIG_HTC_I2CPLD=y
> CONFIG_MFD_INTEL_QUARK_I2C_GPIO=y
> CONFIG_LPC_ICH=y
> CONFIG_LPC_SCH=y
> # CONFIG_INTEL_SOC_PMIC is not set
> # CONFIG_INTEL_SOC_PMIC_CHTWC is not set
> # CONFIG_INTEL_SOC_PMIC_CHTDC_TI is not set
> CONFIG_MFD_INTEL_LPSS=y
> # CONFIG_MFD_INTEL_LPSS_ACPI is not set
> CONFIG_MFD_INTEL_LPSS_PCI=y
> # CONFIG_MFD_IQS62X is not set
> CONFIG_MFD_JANZ_CMODIO=y
> CONFIG_MFD_KEMPLD=y
> CONFIG_MFD_88PM800=y
> CONFIG_MFD_88PM805=y
> CONFIG_MFD_88PM860X=y
> CONFIG_MFD_MAX14577=y
> # CONFIG_MFD_MAX77620 is not set
> CONFIG_MFD_MAX77650=y
> # CONFIG_MFD_MAX77686 is not set
> CONFIG_MFD_MAX77693=y
> # CONFIG_MFD_MAX77843 is not set
> CONFIG_MFD_MAX8907=y
> CONFIG_MFD_MAX8925=y
> CONFIG_MFD_MAX8997=y
> # CONFIG_MFD_MAX8998 is not set
> CONFIG_MFD_MT6397=y
> # CONFIG_MFD_MENF21BMC is not set
> CONFIG_MFD_RETU=y
> CONFIG_MFD_PCF50633=y
> CONFIG_PCF50633_ADC=y
> CONFIG_PCF50633_GPIO=y
> CONFIG_MFD_RDC321X=y
> CONFIG_MFD_RT5033=y
> # CONFIG_MFD_RC5T583 is not set
> CONFIG_MFD_RK808=y
> CONFIG_MFD_RN5T618=y
> CONFIG_MFD_SEC_CORE=y
> CONFIG_MFD_SI476X_CORE=y
> CONFIG_MFD_SM501=y
> # CONFIG_MFD_SM501_GPIO is not set
> CONFIG_MFD_SKY81452=y
> # CONFIG_MFD_SMSC is not set
> CONFIG_ABX500_CORE=y
> # CONFIG_AB3100_CORE is not set
> # CONFIG_MFD_STMPE is not set
> CONFIG_MFD_SYSCON=y
> # CONFIG_MFD_TI_AM335X_TSCADC is not set
> # CONFIG_MFD_LP3943 is not set
> # CONFIG_MFD_LP8788 is not set
> CONFIG_MFD_TI_LMU=y
> CONFIG_MFD_PALMAS=y
> # CONFIG_TPS6105X is not set
> # CONFIG_TPS65010 is not set
> CONFIG_TPS6507X=y
> CONFIG_MFD_TPS65086=y
> # CONFIG_MFD_TPS65090 is not set
> CONFIG_MFD_TPS65217=y
> # CONFIG_MFD_TPS68470 is not set
> # CONFIG_MFD_TI_LP873X is not set
> CONFIG_MFD_TI_LP87565=y
> CONFIG_MFD_TPS65218=y
> CONFIG_MFD_TPS6586X=y
> # CONFIG_MFD_TPS65910 is not set
> CONFIG_MFD_TPS65912=y
> CONFIG_MFD_TPS65912_I2C=y
> CONFIG_MFD_TPS80031=y
> CONFIG_TWL4030_CORE=y
> CONFIG_MFD_TWL4030_AUDIO=y
> CONFIG_TWL6040_CORE=y
> CONFIG_MFD_WL1273_CORE=y
> CONFIG_MFD_LM3533=y
> # CONFIG_MFD_TC3589X is not set
> CONFIG_MFD_TQMX86=y
> CONFIG_MFD_VX855=y
> # CONFIG_MFD_LOCHNAGAR is not set
> CONFIG_MFD_ARIZONA=y
> CONFIG_MFD_ARIZONA_I2C=y
> # CONFIG_MFD_CS47L24 is not set
> # CONFIG_MFD_WM5102 is not set
> # CONFIG_MFD_WM5110 is not set
> CONFIG_MFD_WM8997=y
> CONFIG_MFD_WM8998=y
> # CONFIG_MFD_WM8400 is not set
> # CONFIG_MFD_WM831X_I2C is not set
> # CONFIG_MFD_WM8350_I2C is not set
> CONFIG_MFD_WM8994=y
> # CONFIG_MFD_ROHM_BD718XX is not set
> CONFIG_MFD_ROHM_BD70528=y
> CONFIG_MFD_ROHM_BD71828=y
> CONFIG_MFD_STPMIC1=y
> CONFIG_MFD_STMFX=y
> # CONFIG_RAVE_SP_CORE is not set
> # end of Multifunction device drivers
> 
> CONFIG_REGULATOR=y
> # CONFIG_REGULATOR_DEBUG is not set
> CONFIG_REGULATOR_FIXED_VOLTAGE=y
> # CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
> CONFIG_REGULATOR_USERSPACE_CONSUMER=y
> # CONFIG_REGULATOR_88PG86X is not set
> CONFIG_REGULATOR_88PM800=y
> CONFIG_REGULATOR_88PM8607=y
> # CONFIG_REGULATOR_ACT8865 is not set
> CONFIG_REGULATOR_ACT8945A=y
> CONFIG_REGULATOR_AD5398=y
> CONFIG_REGULATOR_AAT2870=y
> # CONFIG_REGULATOR_AS3722 is not set
> # CONFIG_REGULATOR_AXP20X is not set
> # CONFIG_REGULATOR_BCM590XX is not set
> CONFIG_REGULATOR_BD70528=y
> CONFIG_REGULATOR_BD71828=y
> # CONFIG_REGULATOR_BD9571MWV is not set
> # CONFIG_REGULATOR_DA9052 is not set
> # CONFIG_REGULATOR_DA9062 is not set
> CONFIG_REGULATOR_DA9063=y
> # CONFIG_REGULATOR_DA9210 is not set
> CONFIG_REGULATOR_DA9211=y
> # CONFIG_REGULATOR_FAN53555 is not set
> CONFIG_REGULATOR_GPIO=y
> CONFIG_REGULATOR_ISL9305=y
> CONFIG_REGULATOR_ISL6271A=y
> CONFIG_REGULATOR_LM363X=y
> CONFIG_REGULATOR_LP3971=y
> # CONFIG_REGULATOR_LP3972 is not set
> CONFIG_REGULATOR_LP872X=y
> CONFIG_REGULATOR_LP8755=y
> CONFIG_REGULATOR_LP87565=y
> CONFIG_REGULATOR_LTC3589=y
> CONFIG_REGULATOR_LTC3676=y
> CONFIG_REGULATOR_MAX14577=y
> CONFIG_REGULATOR_MAX1586=y
> # CONFIG_REGULATOR_MAX77650 is not set
> CONFIG_REGULATOR_MAX8649=y
> CONFIG_REGULATOR_MAX8660=y
> CONFIG_REGULATOR_MAX8907=y
> # CONFIG_REGULATOR_MAX8925 is not set
> # CONFIG_REGULATOR_MAX8952 is not set
> # CONFIG_REGULATOR_MAX8997 is not set
> CONFIG_REGULATOR_MAX77693=y
> CONFIG_REGULATOR_MCP16502=y
> CONFIG_REGULATOR_MP5416=y
> CONFIG_REGULATOR_MP8859=y
> CONFIG_REGULATOR_MP886X=y
> CONFIG_REGULATOR_MPQ7920=y
> CONFIG_REGULATOR_MT6311=y
> CONFIG_REGULATOR_MT6323=y
> # CONFIG_REGULATOR_MT6397 is not set
> CONFIG_REGULATOR_PALMAS=y
> # CONFIG_REGULATOR_PCF50633 is not set
> CONFIG_REGULATOR_PFUZE100=y
> # CONFIG_REGULATOR_PV88060 is not set
> CONFIG_REGULATOR_PV88080=y
> CONFIG_REGULATOR_PV88090=y
> # CONFIG_REGULATOR_QCOM_SPMI is not set
> # CONFIG_REGULATOR_RK808 is not set
> # CONFIG_REGULATOR_RN5T618 is not set
> CONFIG_REGULATOR_ROHM=y
> CONFIG_REGULATOR_RT5033=y
> CONFIG_REGULATOR_S2MPA01=y
> CONFIG_REGULATOR_S2MPS11=y
> # CONFIG_REGULATOR_S5M8767 is not set
> # CONFIG_REGULATOR_SKY81452 is not set
> CONFIG_REGULATOR_SLG51000=y
> CONFIG_REGULATOR_STPMIC1=y
> # CONFIG_REGULATOR_SY8106A is not set
> CONFIG_REGULATOR_SY8824X=y
> CONFIG_REGULATOR_TPS51632=y
> # CONFIG_REGULATOR_TPS62360 is not set
> CONFIG_REGULATOR_TPS65023=y
> # CONFIG_REGULATOR_TPS6507X is not set
> CONFIG_REGULATOR_TPS65086=y
> CONFIG_REGULATOR_TPS65132=y
> # CONFIG_REGULATOR_TPS65217 is not set
> # CONFIG_REGULATOR_TPS65218 is not set
> # CONFIG_REGULATOR_TPS6586X is not set
> # CONFIG_REGULATOR_TPS65912 is not set
> CONFIG_REGULATOR_TPS80031=y
> # CONFIG_REGULATOR_TWL4030 is not set
> # CONFIG_REGULATOR_VCTRL is not set
> # CONFIG_REGULATOR_WM8994 is not set
> CONFIG_CEC_CORE=y
> CONFIG_CEC_NOTIFIER=y
> # CONFIG_RC_CORE is not set
> CONFIG_MEDIA_SUPPORT=y
> 
> #
> # Multimedia core support
> #
> CONFIG_MEDIA_CAMERA_SUPPORT=y
> CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
> CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
> CONFIG_MEDIA_RADIO_SUPPORT=y
> CONFIG_MEDIA_SDR_SUPPORT=y
> CONFIG_MEDIA_CEC_SUPPORT=y
> CONFIG_MEDIA_CONTROLLER=y
> CONFIG_MEDIA_CONTROLLER_DVB=y
> CONFIG_MEDIA_CONTROLLER_REQUEST_API=y
> CONFIG_VIDEO_DEV=y
> CONFIG_VIDEO_V4L2_SUBDEV_API=y
> CONFIG_VIDEO_V4L2=y
> CONFIG_VIDEO_V4L2_I2C=y
> # CONFIG_VIDEO_ADV_DEBUG is not set
> # CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
> CONFIG_V4L2_MEM2MEM_DEV=y
> # CONFIG_V4L2_FLASH_LED_CLASS is not set
> CONFIG_V4L2_FWNODE=y
> CONFIG_DVB_CORE=y
> CONFIG_DVB_MMAP=y
> CONFIG_DVB_NET=y
> CONFIG_DVB_MAX_ADAPTERS=16
> CONFIG_DVB_DYNAMIC_MINORS=y
> # CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
> # CONFIG_DVB_ULE_DEBUG is not set
> 
> #
> # Media drivers
> #
> # CONFIG_MEDIA_PCI_SUPPORT is not set
> CONFIG_V4L_PLATFORM_DRIVERS=y
> # CONFIG_VIDEO_CAFE_CCIC is not set
> CONFIG_VIDEO_VIA_CAMERA=y
> # CONFIG_VIDEO_CADENCE is not set
> # CONFIG_VIDEO_ASPEED is not set
> CONFIG_VIDEO_MUX=y
> CONFIG_VIDEO_XILINX=y
> CONFIG_VIDEO_XILINX_TPG=y
> CONFIG_VIDEO_XILINX_VTC=y
> # CONFIG_V4L_MEM2MEM_DRIVERS is not set
> CONFIG_V4L_TEST_DRIVERS=y
> # CONFIG_VIDEO_VIMC is not set
> # CONFIG_VIDEO_VIVID is not set
> CONFIG_VIDEO_VIM2M=y
> CONFIG_VIDEO_VICODEC=y
> # CONFIG_DVB_PLATFORM_DRIVERS is not set
> # CONFIG_CEC_PLATFORM_DRIVERS is not set
> CONFIG_SDR_PLATFORM_DRIVERS=y
> 
> #
> # Supported MMC/SDIO adapters
> #
> # CONFIG_SMS_SDIO_DRV is not set
> CONFIG_RADIO_ADAPTERS=y
> CONFIG_RADIO_SI470X=y
> CONFIG_I2C_SI470X=y
> CONFIG_RADIO_SI4713=y
> CONFIG_PLATFORM_SI4713=y
> CONFIG_I2C_SI4713=y
> # CONFIG_RADIO_MAXIRADIO is not set
> CONFIG_RADIO_TEA5764=y
> # CONFIG_RADIO_TEA5764_XTAL is not set
> CONFIG_RADIO_SAA7706H=y
> # CONFIG_RADIO_TEF6862 is not set
> CONFIG_RADIO_WL1273=y
> 
> #
> # Texas Instruments WL128x FM driver (ST based)
> #
> # end of Texas Instruments WL128x FM driver (ST based)
> 
> #
> # Supported FireWire (IEEE 1394) Adapters
> #
> # CONFIG_DVB_FIREDTV is not set
> CONFIG_VIDEOBUF2_CORE=y
> CONFIG_VIDEOBUF2_V4L2=y
> CONFIG_VIDEOBUF2_MEMOPS=y
> CONFIG_VIDEOBUF2_DMA_CONTIG=y
> CONFIG_VIDEOBUF2_VMALLOC=y
> CONFIG_VIDEOBUF2_DMA_SG=y
> 
> #
> # Media ancillary drivers (tuners, sensors, i2c, spi, frontends)
> #
> CONFIG_MEDIA_SUBDRV_AUTOSELECT=y
> CONFIG_MEDIA_ATTACH=y
> 
> #
> # I2C Encoders, decoders, sensors and other helper chips
> #
> 
> #
> # Audio decoders, processors and mixers
> #
> CONFIG_VIDEO_TVAUDIO=y
> # CONFIG_VIDEO_TDA7432 is not set
> CONFIG_VIDEO_TDA9840=y
> # CONFIG_VIDEO_TEA6415C is not set
> # CONFIG_VIDEO_TEA6420 is not set
> # CONFIG_VIDEO_MSP3400 is not set
> CONFIG_VIDEO_CS3308=y
> CONFIG_VIDEO_CS5345=y
> CONFIG_VIDEO_CS53L32A=y
> CONFIG_VIDEO_TLV320AIC23B=y
> CONFIG_VIDEO_UDA1342=y
> CONFIG_VIDEO_WM8775=y
> # CONFIG_VIDEO_WM8739 is not set
> CONFIG_VIDEO_VP27SMPX=y
> CONFIG_VIDEO_SONY_BTF_MPX=y
> 
> #
> # RDS decoders
> #
> CONFIG_VIDEO_SAA6588=y
> 
> #
> # Video decoders
> #
> CONFIG_VIDEO_ADV7180=y
> # CONFIG_VIDEO_ADV7183 is not set
> CONFIG_VIDEO_ADV748X=y
> CONFIG_VIDEO_ADV7604=y
> CONFIG_VIDEO_ADV7604_CEC=y
> CONFIG_VIDEO_ADV7842=y
> CONFIG_VIDEO_ADV7842_CEC=y
> CONFIG_VIDEO_BT819=y
> CONFIG_VIDEO_BT856=y
> CONFIG_VIDEO_BT866=y
> # CONFIG_VIDEO_KS0127 is not set
> CONFIG_VIDEO_ML86V7667=y
> CONFIG_VIDEO_SAA7110=y
> CONFIG_VIDEO_SAA711X=y
> CONFIG_VIDEO_TC358743=y
> # CONFIG_VIDEO_TC358743_CEC is not set
> # CONFIG_VIDEO_TVP514X is not set
> # CONFIG_VIDEO_TVP5150 is not set
> CONFIG_VIDEO_TVP7002=y
> CONFIG_VIDEO_TW2804=y
> CONFIG_VIDEO_TW9903=y
> # CONFIG_VIDEO_TW9906 is not set
> # CONFIG_VIDEO_TW9910 is not set
> # CONFIG_VIDEO_VPX3220 is not set
> 
> #
> # Video and audio decoders
> #
> CONFIG_VIDEO_SAA717X=y
> CONFIG_VIDEO_CX25840=y
> 
> #
> # Video encoders
> #
> # CONFIG_VIDEO_SAA7127 is not set
> CONFIG_VIDEO_SAA7185=y
> CONFIG_VIDEO_ADV7170=y
> CONFIG_VIDEO_ADV7175=y
> CONFIG_VIDEO_ADV7343=y
> CONFIG_VIDEO_ADV7393=y
> CONFIG_VIDEO_AD9389B=y
> CONFIG_VIDEO_AK881X=y
> CONFIG_VIDEO_THS8200=y
> 
> #
> # Camera sensor devices
> #
> CONFIG_VIDEO_APTINA_PLL=y
> CONFIG_VIDEO_SMIAPP_PLL=y
> # CONFIG_VIDEO_HI556 is not set
> CONFIG_VIDEO_IMX214=y
> CONFIG_VIDEO_IMX219=y
> CONFIG_VIDEO_IMX258=y
> # CONFIG_VIDEO_IMX274 is not set
> CONFIG_VIDEO_IMX290=y
> CONFIG_VIDEO_IMX319=y
> CONFIG_VIDEO_IMX355=y
> CONFIG_VIDEO_OV2640=y
> CONFIG_VIDEO_OV2659=y
> CONFIG_VIDEO_OV2680=y
> CONFIG_VIDEO_OV2685=y
> CONFIG_VIDEO_OV5640=y
> CONFIG_VIDEO_OV5645=y
> CONFIG_VIDEO_OV5647=y
> # CONFIG_VIDEO_OV6650 is not set
> CONFIG_VIDEO_OV5670=y
> CONFIG_VIDEO_OV5675=y
> # CONFIG_VIDEO_OV5695 is not set
> CONFIG_VIDEO_OV7251=y
> CONFIG_VIDEO_OV772X=y
> # CONFIG_VIDEO_OV7640 is not set
> CONFIG_VIDEO_OV7670=y
> CONFIG_VIDEO_OV7740=y
> CONFIG_VIDEO_OV8856=y
> CONFIG_VIDEO_OV9640=y
> CONFIG_VIDEO_OV9650=y
> CONFIG_VIDEO_OV13858=y
> # CONFIG_VIDEO_VS6624 is not set
> # CONFIG_VIDEO_MT9M001 is not set
> CONFIG_VIDEO_MT9M032=y
> CONFIG_VIDEO_MT9M111=y
> CONFIG_VIDEO_MT9P031=y
> CONFIG_VIDEO_MT9T001=y
> CONFIG_VIDEO_MT9T112=y
> CONFIG_VIDEO_MT9V011=y
> # CONFIG_VIDEO_MT9V032 is not set
> CONFIG_VIDEO_MT9V111=y
> # CONFIG_VIDEO_SR030PC30 is not set
> # CONFIG_VIDEO_NOON010PC30 is not set
> CONFIG_VIDEO_M5MOLS=y
> # CONFIG_VIDEO_RJ54N1 is not set
> # CONFIG_VIDEO_S5K6AA is not set
> CONFIG_VIDEO_S5K6A3=y
> # CONFIG_VIDEO_S5K4ECGX is not set
> # CONFIG_VIDEO_S5K5BAF is not set
> CONFIG_VIDEO_SMIAPP=y
> # CONFIG_VIDEO_ET8EK8 is not set
> 
> #
> # Lens drivers
> #
> CONFIG_VIDEO_AD5820=y
> # CONFIG_VIDEO_AK7375 is not set
> # CONFIG_VIDEO_DW9714 is not set
> CONFIG_VIDEO_DW9807_VCM=y
> 
> #
> # Flash devices
> #
> CONFIG_VIDEO_ADP1653=y
> CONFIG_VIDEO_LM3560=y
> # CONFIG_VIDEO_LM3646 is not set
> 
> #
> # Video improvement chips
> #
> CONFIG_VIDEO_UPD64031A=y
> CONFIG_VIDEO_UPD64083=y
> 
> #
> # Audio/Video compression chips
> #
> CONFIG_VIDEO_SAA6752HS=y
> 
> #
> # SDR tuner chips
> #
> CONFIG_SDR_MAX2175=y
> 
> #
> # Miscellaneous helper chips
> #
> CONFIG_VIDEO_THS7303=y
> # CONFIG_VIDEO_M52790 is not set
> # CONFIG_VIDEO_I2C is not set
> # CONFIG_VIDEO_ST_MIPID02 is not set
> # end of I2C Encoders, decoders, sensors and other helper chips
> 
> #
> # SPI helper chips
> #
> # end of SPI helper chips
> 
> CONFIG_MEDIA_TUNER=y
> 
> #
> # Customize TV tuners
> #
> CONFIG_MEDIA_TUNER_SIMPLE=y
> # CONFIG_MEDIA_TUNER_TDA18250 is not set
> CONFIG_MEDIA_TUNER_TDA8290=y
> CONFIG_MEDIA_TUNER_TDA827X=y
> CONFIG_MEDIA_TUNER_TDA18271=y
> CONFIG_MEDIA_TUNER_TDA9887=y
> CONFIG_MEDIA_TUNER_TEA5761=y
> CONFIG_MEDIA_TUNER_TEA5767=y
> CONFIG_MEDIA_TUNER_MT20XX=y
> # CONFIG_MEDIA_TUNER_MT2060 is not set
> CONFIG_MEDIA_TUNER_MT2063=y
> CONFIG_MEDIA_TUNER_MT2266=y
> # CONFIG_MEDIA_TUNER_MT2131 is not set
> CONFIG_MEDIA_TUNER_QT1010=y
> CONFIG_MEDIA_TUNER_XC2028=y
> CONFIG_MEDIA_TUNER_XC5000=y
> CONFIG_MEDIA_TUNER_XC4000=y
> # CONFIG_MEDIA_TUNER_MXL5005S is not set
> CONFIG_MEDIA_TUNER_MXL5007T=y
> CONFIG_MEDIA_TUNER_MC44S803=y
> CONFIG_MEDIA_TUNER_MAX2165=y
> # CONFIG_MEDIA_TUNER_TDA18218 is not set
> CONFIG_MEDIA_TUNER_FC0011=y
> # CONFIG_MEDIA_TUNER_FC0012 is not set
> CONFIG_MEDIA_TUNER_FC0013=y
> CONFIG_MEDIA_TUNER_TDA18212=y
> CONFIG_MEDIA_TUNER_E4000=y
> CONFIG_MEDIA_TUNER_FC2580=y
> # CONFIG_MEDIA_TUNER_M88RS6000T is not set
> CONFIG_MEDIA_TUNER_TUA9001=y
> CONFIG_MEDIA_TUNER_SI2157=y
> CONFIG_MEDIA_TUNER_IT913X=y
> CONFIG_MEDIA_TUNER_R820T=y
> CONFIG_MEDIA_TUNER_MXL301RF=y
> CONFIG_MEDIA_TUNER_QM1D1C0042=y
> CONFIG_MEDIA_TUNER_QM1D1B0004=y
> # end of Customize TV tuners
> 
> #
> # Customise DVB Frontends
> #
> 
> #
> # Multistandard (satellite) frontends
> #
> # CONFIG_DVB_STB0899 is not set
> # CONFIG_DVB_STB6100 is not set
> # CONFIG_DVB_STV090x is not set
> CONFIG_DVB_STV0910=y
> CONFIG_DVB_STV6110x=y
> CONFIG_DVB_STV6111=y
> CONFIG_DVB_MXL5XX=y
> CONFIG_DVB_M88DS3103=y
> 
> #
> # Multistandard (cable + terrestrial) frontends
> #
> CONFIG_DVB_DRXK=y
> CONFIG_DVB_TDA18271C2DD=y
> CONFIG_DVB_SI2165=y
> # CONFIG_DVB_MN88472 is not set
> CONFIG_DVB_MN88473=y
> 
> #
> # DVB-S (satellite) frontends
> #
> CONFIG_DVB_CX24110=y
> CONFIG_DVB_CX24123=y
> CONFIG_DVB_MT312=y
> CONFIG_DVB_ZL10036=y
> CONFIG_DVB_ZL10039=y
> CONFIG_DVB_S5H1420=y
> CONFIG_DVB_STV0288=y
> CONFIG_DVB_STB6000=y
> # CONFIG_DVB_STV0299 is not set
> CONFIG_DVB_STV6110=y
> CONFIG_DVB_STV0900=y
> # CONFIG_DVB_TDA8083 is not set
> # CONFIG_DVB_TDA10086 is not set
> CONFIG_DVB_TDA8261=y
> CONFIG_DVB_VES1X93=y
> CONFIG_DVB_TUNER_ITD1000=y
> CONFIG_DVB_TUNER_CX24113=y
> CONFIG_DVB_TDA826X=y
> CONFIG_DVB_TUA6100=y
> # CONFIG_DVB_CX24116 is not set
> CONFIG_DVB_CX24117=y
> # CONFIG_DVB_CX24120 is not set
> # CONFIG_DVB_SI21XX is not set
> # CONFIG_DVB_TS2020 is not set
> CONFIG_DVB_DS3000=y
> CONFIG_DVB_MB86A16=y
> # CONFIG_DVB_TDA10071 is not set
> 
> #
> # DVB-T (terrestrial) frontends
> #
> # CONFIG_DVB_SP8870 is not set
> CONFIG_DVB_SP887X=y
> # CONFIG_DVB_CX22700 is not set
> CONFIG_DVB_CX22702=y
> CONFIG_DVB_S5H1432=y
> # CONFIG_DVB_DRXD is not set
> # CONFIG_DVB_L64781 is not set
> CONFIG_DVB_TDA1004X=y
> CONFIG_DVB_NXT6000=y
> CONFIG_DVB_MT352=y
> CONFIG_DVB_ZL10353=y
> # CONFIG_DVB_DIB3000MB is not set
> CONFIG_DVB_DIB3000MC=y
> CONFIG_DVB_DIB7000M=y
> CONFIG_DVB_DIB7000P=y
> CONFIG_DVB_DIB9000=y
> # CONFIG_DVB_TDA10048 is not set
> CONFIG_DVB_AF9013=y
> CONFIG_DVB_EC100=y
> # CONFIG_DVB_STV0367 is not set
> # CONFIG_DVB_CXD2820R is not set
> # CONFIG_DVB_CXD2841ER is not set
> CONFIG_DVB_RTL2830=y
> # CONFIG_DVB_RTL2832 is not set
> CONFIG_DVB_SI2168=y
> CONFIG_DVB_ZD1301_DEMOD=y
> 
> #
> # DVB-C (cable) frontends
> #
> CONFIG_DVB_VES1820=y
> CONFIG_DVB_TDA10021=y
> CONFIG_DVB_TDA10023=y
> # CONFIG_DVB_STV0297 is not set
> 
> #
> # ATSC (North American/Korean Terrestrial/Cable DTV) frontends
> #
> # CONFIG_DVB_NXT200X is not set
> CONFIG_DVB_OR51211=y
> CONFIG_DVB_OR51132=y
> # CONFIG_DVB_BCM3510 is not set
> CONFIG_DVB_LGDT330X=y
> CONFIG_DVB_LGDT3305=y
> CONFIG_DVB_LGDT3306A=y
> CONFIG_DVB_LG2160=y
> # CONFIG_DVB_S5H1409 is not set
> CONFIG_DVB_AU8522=y
> CONFIG_DVB_AU8522_DTV=y
> CONFIG_DVB_AU8522_V4L=y
> CONFIG_DVB_S5H1411=y
> 
> #
> # ISDB-T (terrestrial) frontends
> #
> CONFIG_DVB_S921=y
> # CONFIG_DVB_DIB8000 is not set
> CONFIG_DVB_MB86A20S=y
> 
> #
> # ISDB-S (satellite) & ISDB-T (terrestrial) frontends
> #
> # CONFIG_DVB_TC90522 is not set
> CONFIG_DVB_MN88443X=y
> 
> #
> # Digital terrestrial only tuners/PLL
> #
> CONFIG_DVB_PLL=y
> CONFIG_DVB_TUNER_DIB0070=y
> CONFIG_DVB_TUNER_DIB0090=y
> 
> #
> # SEC control devices for DVB-S
> #
> # CONFIG_DVB_DRX39XYJ is not set
> CONFIG_DVB_LNBH25=y
> # CONFIG_DVB_LNBH29 is not set
> # CONFIG_DVB_LNBP21 is not set
> # CONFIG_DVB_LNBP22 is not set
> CONFIG_DVB_ISL6405=y
> CONFIG_DVB_ISL6421=y
> CONFIG_DVB_ISL6423=y
> CONFIG_DVB_A8293=y
> CONFIG_DVB_LGS8GL5=y
> CONFIG_DVB_LGS8GXX=y
> # CONFIG_DVB_ATBM8830 is not set
> # CONFIG_DVB_TDA665x is not set
> CONFIG_DVB_IX2505V=y
> CONFIG_DVB_M88RS2000=y
> CONFIG_DVB_AF9033=y
> CONFIG_DVB_HORUS3A=y
> CONFIG_DVB_ASCOT2E=y
> # CONFIG_DVB_HELENE is not set
> 
> #
> # Common Interface (EN50221) controller drivers
> #
> CONFIG_DVB_CXD2099=y
> CONFIG_DVB_SP2=y
> 
> #
> # Tools to develop new frontends
> #
> CONFIG_DVB_DUMMY_FE=y
> # end of Customise DVB Frontends
> 
> #
> # Graphics support
> #
> CONFIG_AGP=y
> # CONFIG_AGP_AMD64 is not set
> CONFIG_AGP_INTEL=y
> CONFIG_AGP_SIS=y
> # CONFIG_AGP_VIA is not set
> CONFIG_INTEL_GTT=y
> CONFIG_VGA_ARB=y
> CONFIG_VGA_ARB_MAX_GPUS=16
> # CONFIG_VGA_SWITCHEROO is not set
> CONFIG_DRM=y
> CONFIG_DRM_MIPI_DSI=y
> CONFIG_DRM_DP_AUX_CHARDEV=y
> CONFIG_DRM_DEBUG_MM=y
> CONFIG_DRM_DEBUG_SELFTEST=y
> CONFIG_DRM_KMS_HELPER=y
> CONFIG_DRM_KMS_FB_HELPER=y
> CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS=y
> # CONFIG_DRM_FBDEV_EMULATION is not set
> CONFIG_DRM_LOAD_EDID_FIRMWARE=y
> CONFIG_DRM_DP_CEC=y
> CONFIG_DRM_TTM=y
> CONFIG_DRM_TTM_DMA_PAGE_POOL=y
> CONFIG_DRM_VRAM_HELPER=y
> CONFIG_DRM_TTM_HELPER=y
> CONFIG_DRM_GEM_CMA_HELPER=y
> CONFIG_DRM_KMS_CMA_HELPER=y
> CONFIG_DRM_GEM_SHMEM_HELPER=y
> CONFIG_DRM_VM=y
> CONFIG_DRM_SCHED=y
> 
> #
> # I2C encoder or helper chips
> #
> CONFIG_DRM_I2C_CH7006=y
> CONFIG_DRM_I2C_SIL164=y
> CONFIG_DRM_I2C_NXP_TDA998X=y
> CONFIG_DRM_I2C_NXP_TDA9950=y
> # end of I2C encoder or helper chips
> 
> #
> # ARM devices
> #
> # CONFIG_DRM_KOMEDA is not set
> # end of ARM devices
> 
> CONFIG_DRM_RADEON=y
> CONFIG_DRM_RADEON_USERPTR=y
> CONFIG_DRM_AMDGPU=y
> # CONFIG_DRM_AMDGPU_SI is not set
> # CONFIG_DRM_AMDGPU_CIK is not set
> CONFIG_DRM_AMDGPU_USERPTR=y
> CONFIG_DRM_AMDGPU_GART_DEBUGFS=y
> 
> #
> # ACP (Audio CoProcessor) Configuration
> #
> # CONFIG_DRM_AMD_ACP is not set
> # end of ACP (Audio CoProcessor) Configuration
> 
> #
> # Display Engine Configuration
> #
> CONFIG_DRM_AMD_DC=y
> CONFIG_DRM_AMD_DC_DCN=y
> # CONFIG_DRM_AMD_DC_HDCP is not set
> CONFIG_DEBUG_KERNEL_DC=y
> # end of Display Engine Configuration
> 
> CONFIG_HSA_AMD=y
> CONFIG_DRM_NOUVEAU=y
> CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT=y
> CONFIG_NOUVEAU_DEBUG=5
> CONFIG_NOUVEAU_DEBUG_DEFAULT=3
> # CONFIG_NOUVEAU_DEBUG_MMU is not set
> # CONFIG_DRM_NOUVEAU_BACKLIGHT is not set
> # CONFIG_DRM_I915 is not set
> CONFIG_DRM_VGEM=y
> CONFIG_DRM_VKMS=y
> CONFIG_DRM_VMWGFX=y
> # CONFIG_DRM_VMWGFX_FBCON is not set
> # CONFIG_DRM_GMA500 is not set
> CONFIG_DRM_AST=y
> # CONFIG_DRM_MGAG200 is not set
> CONFIG_DRM_CIRRUS_QEMU=y
> CONFIG_DRM_RCAR_DW_HDMI=y
> CONFIG_DRM_RCAR_LVDS=y
> CONFIG_DRM_QXL=y
> CONFIG_DRM_BOCHS=y
> CONFIG_DRM_VIRTIO_GPU=y
> CONFIG_DRM_PANEL=y
> 
> #
> # Display Panels
> #
> CONFIG_DRM_PANEL_ARM_VERSATILE=y
> CONFIG_DRM_PANEL_BOE_HIMAX8279D=y
> # CONFIG_DRM_PANEL_BOE_TV101WUM_NL6 is not set
> CONFIG_DRM_PANEL_LVDS=y
> CONFIG_DRM_PANEL_SIMPLE=y
> # CONFIG_DRM_PANEL_ELIDA_KD35T133 is not set
> CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02=y
> CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D=y
> CONFIG_DRM_PANEL_ILITEK_ILI9881C=y
> # CONFIG_DRM_PANEL_INNOLUX_P079ZCA is not set
> CONFIG_DRM_PANEL_JDI_LT070ME05000=y
> CONFIG_DRM_PANEL_KINGDISPLAY_KD097D04=y
> # CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829 is not set
> # CONFIG_DRM_PANEL_NOVATEK_NT35510 is not set
> # CONFIG_DRM_PANEL_OLIMEX_LCD_OLINUXINO is not set
> # CONFIG_DRM_PANEL_ORISETECH_OTM8009A is not set
> CONFIG_DRM_PANEL_OSD_OSD101T2587_53TS=y
> CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00=y
> CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN=y
> # CONFIG_DRM_PANEL_RAYDIUM_RM67191 is not set
> CONFIG_DRM_PANEL_RAYDIUM_RM68200=y
> # CONFIG_DRM_PANEL_ROCKTECH_JH057N00900 is not set
> CONFIG_DRM_PANEL_RONBO_RB070D30=y
> # CONFIG_DRM_PANEL_SAMSUNG_S6D16D0 is not set
> CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2=y
> CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03=y
> # CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01 is not set
> CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0=y
> CONFIG_DRM_PANEL_SEIKO_43WVF1G=y
> CONFIG_DRM_PANEL_SHARP_LQ101R1SX01=y
> CONFIG_DRM_PANEL_SHARP_LS037V7DW01=y
> CONFIG_DRM_PANEL_SHARP_LS043T1LE01=y
> CONFIG_DRM_PANEL_SITRONIX_ST7701=y
> # CONFIG_DRM_PANEL_SONY_ACX424AKP is not set
> CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=y
> CONFIG_DRM_PANEL_XINPENG_XPP055C272=y
> # end of Display Panels
> 
> CONFIG_DRM_BRIDGE=y
> CONFIG_DRM_PANEL_BRIDGE=y
> 
> #
> # Display Interface Bridges
> #
> # CONFIG_DRM_CDNS_DSI is not set
> CONFIG_DRM_DISPLAY_CONNECTOR=y
> CONFIG_DRM_LVDS_CODEC=y
> CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW=y
> CONFIG_DRM_NXP_PTN3460=y
> CONFIG_DRM_PARADE_PS8622=y
> CONFIG_DRM_PARADE_PS8640=y
> # CONFIG_DRM_SIL_SII8620 is not set
> CONFIG_DRM_SII902X=y
> CONFIG_DRM_SII9234=y
> # CONFIG_DRM_SIMPLE_BRIDGE is not set
> CONFIG_DRM_THINE_THC63LVD1024=y
> CONFIG_DRM_TOSHIBA_TC358764=y
> CONFIG_DRM_TOSHIBA_TC358767=y
> CONFIG_DRM_TOSHIBA_TC358768=y
> # CONFIG_DRM_TI_TFP410 is not set
> CONFIG_DRM_TI_SN65DSI86=y
> CONFIG_DRM_TI_TPD12S015=y
> CONFIG_DRM_ANALOGIX_ANX6345=y
> # CONFIG_DRM_ANALOGIX_ANX78XX is not set
> CONFIG_DRM_ANALOGIX_DP=y
> CONFIG_DRM_I2C_ADV7511=y
> CONFIG_DRM_I2C_ADV7511_CEC=y
> CONFIG_DRM_DW_HDMI=y
> CONFIG_DRM_DW_HDMI_CEC=y
> # end of Display Interface Bridges
> 
> CONFIG_DRM_ETNAVIV=y
> CONFIG_DRM_ETNAVIV_THERMAL=y
> CONFIG_DRM_ARCPGU=y
> CONFIG_DRM_MXS=y
> CONFIG_DRM_MXSFB=y
> CONFIG_DRM_VBOXVIDEO=y
> CONFIG_DRM_LEGACY=y
> CONFIG_DRM_TDFX=y
> # CONFIG_DRM_R128 is not set
> CONFIG_DRM_I810=y
> CONFIG_DRM_MGA=y
> CONFIG_DRM_SIS=y
> # CONFIG_DRM_VIA is not set
> # CONFIG_DRM_SAVAGE is not set
> CONFIG_DRM_EXPORT_FOR_TESTS=y
> CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y
> CONFIG_DRM_LIB_RANDOM=y
> 
> #
> # Frame buffer Devices
> #
> CONFIG_FB_CMDLINE=y
> CONFIG_FB_NOTIFY=y
> CONFIG_FB=y
> CONFIG_FIRMWARE_EDID=y
> CONFIG_FB_DDC=y
> CONFIG_FB_BOOT_VESA_SUPPORT=y
> CONFIG_FB_CFB_FILLRECT=y
> CONFIG_FB_CFB_COPYAREA=y
> CONFIG_FB_CFB_IMAGEBLIT=y
> CONFIG_FB_SYS_FILLRECT=y
> CONFIG_FB_SYS_COPYAREA=y
> CONFIG_FB_SYS_IMAGEBLIT=y
> # CONFIG_FB_FOREIGN_ENDIAN is not set
> CONFIG_FB_SYS_FOPS=y
> CONFIG_FB_DEFERRED_IO=y
> CONFIG_FB_HECUBA=y
> CONFIG_FB_SVGALIB=y
> CONFIG_FB_MODE_HELPERS=y
> CONFIG_FB_TILEBLITTING=y
> 
> #
> # Frame buffer hardware drivers
> #
> # CONFIG_FB_CIRRUS is not set
> # CONFIG_FB_PM2 is not set
> CONFIG_FB_CYBER2000=y
> # CONFIG_FB_CYBER2000_DDC is not set
> # CONFIG_FB_ARC is not set
> # CONFIG_FB_ASILIANT is not set
> CONFIG_FB_IMSTT=y
> # CONFIG_FB_VGA16 is not set
> # CONFIG_FB_VESA is not set
> CONFIG_FB_N411=y
> CONFIG_FB_HGA=y
> CONFIG_FB_OPENCORES=y
> # CONFIG_FB_S1D13XXX is not set
> # CONFIG_FB_NVIDIA is not set
> # CONFIG_FB_RIVA is not set
> # CONFIG_FB_I740 is not set
> CONFIG_FB_LE80578=y
> CONFIG_FB_CARILLO_RANCH=y
> CONFIG_FB_INTEL=y
> # CONFIG_FB_INTEL_DEBUG is not set
> CONFIG_FB_INTEL_I2C=y
> CONFIG_FB_MATROX=y
> CONFIG_FB_MATROX_MILLENIUM=y
> CONFIG_FB_MATROX_MYSTIQUE=y
> CONFIG_FB_MATROX_G=y
> # CONFIG_FB_MATROX_I2C is not set
> # CONFIG_FB_RADEON is not set
> # CONFIG_FB_ATY128 is not set
> # CONFIG_FB_ATY is not set
> CONFIG_FB_S3=y
> # CONFIG_FB_S3_DDC is not set
> CONFIG_FB_SAVAGE=y
> # CONFIG_FB_SAVAGE_I2C is not set
> CONFIG_FB_SAVAGE_ACCEL=y
> # CONFIG_FB_SIS is not set
> CONFIG_FB_VIA=y
> CONFIG_FB_VIA_DIRECT_PROCFS=y
> CONFIG_FB_VIA_X_COMPATIBILITY=y
> # CONFIG_FB_NEOMAGIC is not set
> CONFIG_FB_KYRO=y
> CONFIG_FB_3DFX=y
> # CONFIG_FB_3DFX_ACCEL is not set
> CONFIG_FB_3DFX_I2C=y
> CONFIG_FB_VOODOO1=y
> # CONFIG_FB_VT8623 is not set
> CONFIG_FB_TRIDENT=y
> # CONFIG_FB_ARK is not set
> CONFIG_FB_PM3=y
> # CONFIG_FB_CARMINE is not set
> # CONFIG_FB_SM501 is not set
> CONFIG_FB_IBM_GXT4500=y
> CONFIG_FB_GOLDFISH=y
> CONFIG_FB_VIRTUAL=y
> CONFIG_FB_METRONOME=y
> # CONFIG_FB_MB862XX is not set
> # CONFIG_FB_SIMPLE is not set
> # CONFIG_FB_SSD1307 is not set
> # CONFIG_FB_SM712 is not set
> # end of Frame buffer Devices
> 
> #
> # Backlight & LCD device support
> #
> CONFIG_LCD_CLASS_DEVICE=y
> # CONFIG_LCD_PLATFORM is not set
> CONFIG_BACKLIGHT_CLASS_DEVICE=y
> CONFIG_BACKLIGHT_GENERIC=y
> CONFIG_BACKLIGHT_LM3533=y
> CONFIG_BACKLIGHT_CARILLO_RANCH=y
> CONFIG_BACKLIGHT_DA903X=y
> CONFIG_BACKLIGHT_DA9052=y
> # CONFIG_BACKLIGHT_MAX8925 is not set
> # CONFIG_BACKLIGHT_APPLE is not set
> CONFIG_BACKLIGHT_QCOM_WLED=y
> CONFIG_BACKLIGHT_SAHARA=y
> CONFIG_BACKLIGHT_ADP5520=y
> CONFIG_BACKLIGHT_ADP8860=y
> CONFIG_BACKLIGHT_ADP8870=y
> CONFIG_BACKLIGHT_88PM860X=y
> # CONFIG_BACKLIGHT_PCF50633 is not set
> CONFIG_BACKLIGHT_AAT2870=y
> # CONFIG_BACKLIGHT_LM3639 is not set
> CONFIG_BACKLIGHT_PANDORA=y
> CONFIG_BACKLIGHT_SKY81452=y
> # CONFIG_BACKLIGHT_TPS65217 is not set
> CONFIG_BACKLIGHT_GPIO=y
> CONFIG_BACKLIGHT_LV5207LP=y
> CONFIG_BACKLIGHT_BD6107=y
> CONFIG_BACKLIGHT_ARCXCNN=y
> CONFIG_BACKLIGHT_LED=y
> # end of Backlight & LCD device support
> 
> CONFIG_VGASTATE=y
> CONFIG_VIDEOMODE_HELPERS=y
> CONFIG_HDMI=y
> CONFIG_LOGO=y
> # CONFIG_LOGO_LINUX_MONO is not set
> # CONFIG_LOGO_LINUX_VGA16 is not set
> # CONFIG_LOGO_LINUX_CLUT224 is not set
> # end of Graphics support
> 
> CONFIG_SOUND=y
> # CONFIG_SND is not set
> 
> #
> # HID support
> #
> CONFIG_HID=y
> # CONFIG_HID_BATTERY_STRENGTH is not set
> # CONFIG_HIDRAW is not set
> # CONFIG_UHID is not set
> CONFIG_HID_GENERIC=y
> 
> #
> # Special HID drivers
> #
> # CONFIG_HID_A4TECH is not set
> # CONFIG_HID_ACRUX is not set
> # CONFIG_HID_APPLE is not set
> # CONFIG_HID_ASUS is not set
> # CONFIG_HID_AUREAL is not set
> # CONFIG_HID_BELKIN is not set
> # CONFIG_HID_CHERRY is not set
> # CONFIG_HID_CHICONY is not set
> # CONFIG_HID_COUGAR is not set
> # CONFIG_HID_MACALLY is not set
> # CONFIG_HID_CMEDIA is not set
> # CONFIG_HID_CYPRESS is not set
> # CONFIG_HID_DRAGONRISE is not set
> # CONFIG_HID_EMS_FF is not set
> # CONFIG_HID_ELECOM is not set
> # CONFIG_HID_EZKEY is not set
> # CONFIG_HID_GEMBIRD is not set
> # CONFIG_HID_GFRM is not set
> # CONFIG_HID_GLORIOUS is not set
> # CONFIG_HID_KEYTOUCH is not set
> # CONFIG_HID_KYE is not set
> # CONFIG_HID_WALTOP is not set
> # CONFIG_HID_VIEWSONIC is not set
> # CONFIG_HID_GYRATION is not set
> # CONFIG_HID_ICADE is not set
> # CONFIG_HID_ITE is not set
> # CONFIG_HID_JABRA is not set
> # CONFIG_HID_TWINHAN is not set
> # CONFIG_HID_KENSINGTON is not set
> # CONFIG_HID_LCPOWER is not set
> # CONFIG_HID_LED is not set
> # CONFIG_HID_LENOVO is not set
> # CONFIG_HID_LOGITECH is not set
> # CONFIG_HID_MAGICMOUSE is not set
> # CONFIG_HID_MALTRON is not set
> # CONFIG_HID_MAYFLASH is not set
> # CONFIG_HID_REDRAGON is not set
> # CONFIG_HID_MICROSOFT is not set
> # CONFIG_HID_MONTEREY is not set
> # CONFIG_HID_MULTITOUCH is not set
> # CONFIG_HID_NTI is not set
> # CONFIG_HID_ORTEK is not set
> # CONFIG_HID_PANTHERLORD is not set
> # CONFIG_HID_PETALYNX is not set
> # CONFIG_HID_PICOLCD is not set
> # CONFIG_HID_PLANTRONICS is not set
> # CONFIG_HID_PRIMAX is not set
> # CONFIG_HID_SAITEK is not set
> # CONFIG_HID_SAMSUNG is not set
> # CONFIG_HID_SPEEDLINK is not set
> # CONFIG_HID_STEAM is not set
> # CONFIG_HID_STEELSERIES is not set
> # CONFIG_HID_SUNPLUS is not set
> # CONFIG_HID_RMI is not set
> # CONFIG_HID_GREENASIA is not set
> # CONFIG_HID_SMARTJOYPLUS is not set
> # CONFIG_HID_TIVO is not set
> # CONFIG_HID_TOPSEED is not set
> # CONFIG_HID_THINGM is not set
> # CONFIG_HID_THRUSTMASTER is not set
> # CONFIG_HID_UDRAW_PS3 is not set
> # CONFIG_HID_WIIMOTE is not set
> # CONFIG_HID_XINMO is not set
> # CONFIG_HID_ZEROPLUS is not set
> # CONFIG_HID_ZYDACRON is not set
> # CONFIG_HID_SENSOR_HUB is not set
> # CONFIG_HID_ALPS is not set
> # end of Special HID drivers
> 
> #
> # I2C HID support
> #
> # CONFIG_I2C_HID is not set
> # end of I2C HID support
> 
> #
> # Intel ISH HID support
> #
> # CONFIG_INTEL_ISH_HID is not set
> # end of Intel ISH HID support
> # end of HID support
> 
> CONFIG_USB_OHCI_LITTLE_ENDIAN=y
> CONFIG_USB_SUPPORT=y
> # CONFIG_USB_ULPI_BUS is not set
> # CONFIG_USB_CONN_GPIO is not set
> CONFIG_USB_ARCH_HAS_HCD=y
> # CONFIG_USB is not set
> CONFIG_USB_PCI=y
> 
> #
> # USB port drivers
> #
> 
> #
> # USB Physical Layer drivers
> #
> # CONFIG_NOP_USB_XCEIV is not set
> # CONFIG_USB_GPIO_VBUS is not set
> # CONFIG_TAHVO_USB is not set
> # end of USB Physical Layer drivers
> 
> # CONFIG_USB_GADGET is not set
> # CONFIG_TYPEC is not set
> # CONFIG_USB_ROLE_SWITCH is not set
> CONFIG_MMC=y
> CONFIG_PWRSEQ_EMMC=y
> # CONFIG_PWRSEQ_SIMPLE is not set
> CONFIG_MMC_BLOCK=y
> CONFIG_MMC_BLOCK_MINORS=8
> CONFIG_SDIO_UART=y
> # CONFIG_MMC_TEST is not set
> 
> #
> # MMC/SD/SDIO Host Controller Drivers
> #
> # CONFIG_MMC_DEBUG is not set
> # CONFIG_MMC_SDHCI is not set
> CONFIG_MMC_WBSD=y
> # CONFIG_MMC_ALCOR is not set
> CONFIG_MMC_TIFM_SD=y
> CONFIG_MMC_GOLDFISH=y
> CONFIG_MMC_CB710=y
> CONFIG_MMC_VIA_SDMMC=y
> CONFIG_MMC_USDHI6ROL0=y
> CONFIG_MMC_REALTEK_PCI=y
> CONFIG_MMC_CQHCI=y
> # CONFIG_MMC_HSQ is not set
> CONFIG_MMC_TOSHIBA_PCI=y
> CONFIG_MMC_MTK=y
> CONFIG_MEMSTICK=y
> # CONFIG_MEMSTICK_DEBUG is not set
> 
> #
> # MemoryStick drivers
> #
> # CONFIG_MEMSTICK_UNSAFE_RESUME is not set
> CONFIG_MSPRO_BLOCK=y
> CONFIG_MS_BLOCK=y
> 
> #
> # MemoryStick Host Controller Drivers
> #
> CONFIG_MEMSTICK_TIFM_MS=y
> CONFIG_MEMSTICK_JMICRON_38X=y
> CONFIG_MEMSTICK_R592=y
> CONFIG_MEMSTICK_REALTEK_PCI=y
> CONFIG_NEW_LEDS=y
> CONFIG_LEDS_CLASS=y
> CONFIG_LEDS_CLASS_FLASH=y
> # CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set
> 
> #
> # LED drivers
> #
> CONFIG_LEDS_88PM860X=y
> CONFIG_LEDS_AAT1290=y
> CONFIG_LEDS_AN30259A=y
> # CONFIG_LEDS_APU is not set
> CONFIG_LEDS_AS3645A=y
> # CONFIG_LEDS_BCM6328 is not set
> CONFIG_LEDS_BCM6358=y
> CONFIG_LEDS_LM3530=y
> # CONFIG_LEDS_LM3532 is not set
> # CONFIG_LEDS_LM3533 is not set
> # CONFIG_LEDS_LM3642 is not set
> # CONFIG_LEDS_LM3692X is not set
> # CONFIG_LEDS_LM3601X is not set
> # CONFIG_LEDS_MT6323 is not set
> # CONFIG_LEDS_PCA9532 is not set
> CONFIG_LEDS_GPIO=y
> CONFIG_LEDS_LP3944=y
> # CONFIG_LEDS_LP3952 is not set
> CONFIG_LEDS_LP55XX_COMMON=y
> # CONFIG_LEDS_LP5521 is not set
> # CONFIG_LEDS_LP5523 is not set
> # CONFIG_LEDS_LP5562 is not set
> CONFIG_LEDS_LP8501=y
> CONFIG_LEDS_LP8860=y
> CONFIG_LEDS_CLEVO_MAIL=y
> CONFIG_LEDS_PCA955X=y
> CONFIG_LEDS_PCA955X_GPIO=y
> # CONFIG_LEDS_PCA963X is not set
> CONFIG_LEDS_DA903X=y
> CONFIG_LEDS_DA9052=y
> CONFIG_LEDS_REGULATOR=y
> CONFIG_LEDS_BD2802=y
> CONFIG_LEDS_INTEL_SS4200=y
> CONFIG_LEDS_LT3593=y
> CONFIG_LEDS_ADP5520=y
> CONFIG_LEDS_TCA6507=y
> CONFIG_LEDS_TLC591XX=y
> # CONFIG_LEDS_MAX77650 is not set
> CONFIG_LEDS_MAX77693=y
> # CONFIG_LEDS_MAX8997 is not set
> CONFIG_LEDS_LM355x=y
> CONFIG_LEDS_KTD2692=y
> CONFIG_LEDS_IS31FL319X=y
> CONFIG_LEDS_IS31FL32XX=y
> 
> #
> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
> #
> CONFIG_LEDS_BLINKM=y
> CONFIG_LEDS_SYSCON=y
> CONFIG_LEDS_MLXCPLD=y
> CONFIG_LEDS_MLXREG=y
> CONFIG_LEDS_USER=y
> # CONFIG_LEDS_NIC78BX is not set
> CONFIG_LEDS_TI_LMU_COMMON=y
> CONFIG_LEDS_LM3697=y
> # CONFIG_LEDS_LM36274 is not set
> 
> #
> # LED Triggers
> #
> # CONFIG_LEDS_TRIGGERS is not set
> # CONFIG_ACCESSIBILITY is not set
> # CONFIG_INFINIBAND is not set
> CONFIG_EDAC_ATOMIC_SCRUB=y
> CONFIG_EDAC_SUPPORT=y
> CONFIG_EDAC=y
> # CONFIG_EDAC_LEGACY_SYSFS is not set
> # CONFIG_EDAC_DEBUG is not set
> CONFIG_EDAC_E752X=y
> # CONFIG_EDAC_I82975X is not set
> CONFIG_EDAC_I3000=y
> # CONFIG_EDAC_I3200 is not set
> CONFIG_EDAC_IE31200=y
> # CONFIG_EDAC_X38 is not set
> CONFIG_EDAC_I5400=y
> # CONFIG_EDAC_I5000 is not set
> # CONFIG_EDAC_I5100 is not set
> # CONFIG_EDAC_I7300 is not set
> CONFIG_RTC_LIB=y
> CONFIG_RTC_MC146818_LIB=y
> CONFIG_RTC_CLASS=y
> # CONFIG_RTC_HCTOSYS is not set
> CONFIG_RTC_SYSTOHC=y
> CONFIG_RTC_SYSTOHC_DEVICE="rtc0"
> # CONFIG_RTC_DEBUG is not set
> # CONFIG_RTC_NVMEM is not set
> 
> #
> # RTC interfaces
> #
> # CONFIG_RTC_INTF_SYSFS is not set
> # CONFIG_RTC_INTF_PROC is not set
> # CONFIG_RTC_INTF_DEV is not set
> CONFIG_RTC_DRV_TEST=y
> 
> #
> # I2C RTC drivers
> #
> CONFIG_RTC_DRV_88PM860X=y
> CONFIG_RTC_DRV_88PM80X=y
> CONFIG_RTC_DRV_ABB5ZES3=y
> CONFIG_RTC_DRV_ABEOZ9=y
> CONFIG_RTC_DRV_ABX80X=y
> CONFIG_RTC_DRV_AS3722=y
> # CONFIG_RTC_DRV_DS1307 is not set
> # CONFIG_RTC_DRV_DS1374 is not set
> CONFIG_RTC_DRV_DS1672=y
> CONFIG_RTC_DRV_HYM8563=y
> CONFIG_RTC_DRV_MAX6900=y
> CONFIG_RTC_DRV_MAX8907=y
> CONFIG_RTC_DRV_MAX8925=y
> CONFIG_RTC_DRV_MAX8997=y
> CONFIG_RTC_DRV_RK808=y
> CONFIG_RTC_DRV_RS5C372=y
> CONFIG_RTC_DRV_ISL1208=y
> # CONFIG_RTC_DRV_ISL12022 is not set
> CONFIG_RTC_DRV_ISL12026=y
> CONFIG_RTC_DRV_X1205=y
> # CONFIG_RTC_DRV_PCF8523 is not set
> CONFIG_RTC_DRV_PCF85063=y
> CONFIG_RTC_DRV_PCF85363=y
> CONFIG_RTC_DRV_PCF8563=y
> # CONFIG_RTC_DRV_PCF8583 is not set
> CONFIG_RTC_DRV_M41T80=y
> # CONFIG_RTC_DRV_M41T80_WDT is not set
> CONFIG_RTC_DRV_BD70528=y
> CONFIG_RTC_DRV_BQ32K=y
> # CONFIG_RTC_DRV_TWL4030 is not set
> # CONFIG_RTC_DRV_PALMAS is not set
> CONFIG_RTC_DRV_TPS6586X=y
> # CONFIG_RTC_DRV_TPS80031 is not set
> CONFIG_RTC_DRV_RC5T619=y
> CONFIG_RTC_DRV_S35390A=y
> CONFIG_RTC_DRV_FM3130=y
> CONFIG_RTC_DRV_RX8010=y
> CONFIG_RTC_DRV_RX8581=y
> # CONFIG_RTC_DRV_RX8025 is not set
> # CONFIG_RTC_DRV_EM3027 is not set
> CONFIG_RTC_DRV_RV3028=y
> CONFIG_RTC_DRV_RV8803=y
> # CONFIG_RTC_DRV_S5M is not set
> CONFIG_RTC_DRV_SD3078=y
> 
> #
> # SPI RTC drivers
> #
> CONFIG_RTC_I2C_AND_SPI=y
> 
> #
> # SPI and I2C RTC drivers
> #
> CONFIG_RTC_DRV_DS3232=y
> CONFIG_RTC_DRV_DS3232_HWMON=y
> CONFIG_RTC_DRV_PCF2127=y
> CONFIG_RTC_DRV_RV3029C2=y
> CONFIG_RTC_DRV_RV3029_HWMON=y
> 
> #
> # Platform RTC drivers
> #
> CONFIG_RTC_DRV_CMOS=y
> CONFIG_RTC_DRV_DS1286=y
> CONFIG_RTC_DRV_DS1511=y
> CONFIG_RTC_DRV_DS1553=y
> CONFIG_RTC_DRV_DS1685_FAMILY=y
> CONFIG_RTC_DRV_DS1685=y
> # CONFIG_RTC_DRV_DS1689 is not set
> # CONFIG_RTC_DRV_DS17285 is not set
> # CONFIG_RTC_DRV_DS17485 is not set
> # CONFIG_RTC_DRV_DS17885 is not set
> CONFIG_RTC_DRV_DS1742=y
> CONFIG_RTC_DRV_DS2404=y
> # CONFIG_RTC_DRV_DA9052 is not set
> CONFIG_RTC_DRV_DA9063=y
> CONFIG_RTC_DRV_STK17TA8=y
> CONFIG_RTC_DRV_M48T86=y
> CONFIG_RTC_DRV_M48T35=y
> # CONFIG_RTC_DRV_M48T59 is not set
> # CONFIG_RTC_DRV_MSM6242 is not set
> # CONFIG_RTC_DRV_BQ4802 is not set
> # CONFIG_RTC_DRV_RP5C01 is not set
> CONFIG_RTC_DRV_V3020=y
> CONFIG_RTC_DRV_PCF50633=y
> CONFIG_RTC_DRV_ZYNQMP=y
> CONFIG_RTC_DRV_CROS_EC=y
> 
> #
> # on-CPU RTC drivers
> #
> CONFIG_RTC_DRV_CADENCE=y
> CONFIG_RTC_DRV_FTRTC010=y
> # CONFIG_RTC_DRV_MT6397 is not set
> # CONFIG_RTC_DRV_R7301 is not set
> 
> #
> # HID Sensor RTC drivers
> #
> CONFIG_RTC_DRV_GOLDFISH=y
> # CONFIG_DMADEVICES is not set
> 
> #
> # DMABUF options
> #
> CONFIG_SYNC_FILE=y
> # CONFIG_SW_SYNC is not set
> CONFIG_UDMABUF=y
> CONFIG_DMABUF_MOVE_NOTIFY=y
> # CONFIG_DMABUF_SELFTESTS is not set
> # CONFIG_DMABUF_HEAPS is not set
> # end of DMABUF options
> 
> CONFIG_AUXDISPLAY=y
> CONFIG_HD44780=y
> # CONFIG_IMG_ASCII_LCD is not set
> # CONFIG_HT16K33 is not set
> CONFIG_PARPORT_PANEL=y
> CONFIG_PANEL_PARPORT=0
> CONFIG_PANEL_PROFILE=5
> CONFIG_PANEL_CHANGE_MESSAGE=y
> CONFIG_PANEL_BOOT_MESSAGE=""
> CONFIG_CHARLCD_BL_OFF=y
> # CONFIG_CHARLCD_BL_ON is not set
> # CONFIG_CHARLCD_BL_FLASH is not set
> CONFIG_PANEL=y
> CONFIG_CHARLCD=y
> CONFIG_UIO=y
> CONFIG_UIO_CIF=y
> CONFIG_UIO_PDRV_GENIRQ=y
> CONFIG_UIO_DMEM_GENIRQ=y
> # CONFIG_UIO_AEC is not set
> # CONFIG_UIO_SERCOS3 is not set
> CONFIG_UIO_PCI_GENERIC=y
> CONFIG_UIO_NETX=y
> CONFIG_UIO_PRUSS=y
> # CONFIG_UIO_MF624 is not set
> CONFIG_VFIO_IOMMU_TYPE1=y
> CONFIG_VFIO=y
> CONFIG_VFIO_NOIOMMU=y
> # CONFIG_VFIO_PCI is not set
> CONFIG_VFIO_MDEV=y
> CONFIG_VFIO_MDEV_DEVICE=y
> # CONFIG_VIRT_DRIVERS is not set
> CONFIG_VIRTIO=y
> CONFIG_VIRTIO_MENU=y
> CONFIG_VIRTIO_PCI=y
> # CONFIG_VIRTIO_PCI_LEGACY is not set
> # CONFIG_VIRTIO_VDPA is not set
> CONFIG_VIRTIO_BALLOON=y
> # CONFIG_VIRTIO_INPUT is not set
> CONFIG_VIRTIO_MMIO=y
> # CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES is not set
> # CONFIG_VDPA_MENU is not set
> # CONFIG_VHOST_MENU is not set
> 
> #
> # Microsoft Hyper-V guest support
> #
> # CONFIG_HYPERV is not set
> # end of Microsoft Hyper-V guest support
> 
> CONFIG_GREYBUS=y
> CONFIG_STAGING=y
> # CONFIG_COMEDI is not set
> # CONFIG_RTLLIB is not set
> # CONFIG_RTS5208 is not set
> 
> #
> # IIO staging drivers
> #
> 
> #
> # Accelerometers
> #
> # end of Accelerometers
> 
> #
> # Analog to digital converters
> #
> # end of Analog to digital converters
> 
> #
> # Analog digital bi-direction converters
> #
> CONFIG_ADT7316=y
> CONFIG_ADT7316_I2C=y
> # end of Analog digital bi-direction converters
> 
> #
> # Capacitance to digital converters
> #
> CONFIG_AD7150=y
> CONFIG_AD7746=y
> # end of Capacitance to digital converters
> 
> #
> # Direct Digital Synthesis
> #
> # end of Direct Digital Synthesis
> 
> #
> # Network Analyzer, Impedance Converters
> #
> CONFIG_AD5933=y
> # end of Network Analyzer, Impedance Converters
> 
> #
> # Active energy metering IC
> #
> CONFIG_ADE7854=y
> # CONFIG_ADE7854_I2C is not set
> # end of Active energy metering IC
> 
> #
> # Resolver to digital converters
> #
> # end of Resolver to digital converters
> # end of IIO staging drivers
> 
> # CONFIG_FB_SM750 is not set
> 
> #
> # Speakup console speech
> #
> # end of Speakup console speech
> 
> CONFIG_STAGING_MEDIA=y
> CONFIG_VIDEO_IPU3_IMGU=y
> 
> #
> # soc_camera sensor drivers
> #
> 
> #
> # Android
> #
> # CONFIG_ASHMEM is not set
> CONFIG_ION=y
> # CONFIG_ION_SYSTEM_HEAP is not set
> # CONFIG_ION_CMA_HEAP is not set
> # end of Android
> 
> # CONFIG_STAGING_BOARD is not set
> CONFIG_FIREWIRE_SERIAL=y
> CONFIG_FWTTY_MAX_TOTAL_PORTS=64
> CONFIG_FWTTY_MAX_CARD_PORTS=32
> # CONFIG_GOLDFISH_AUDIO is not set
> CONFIG_GS_FPGABOOT=y
> # CONFIG_UNISYSSPAR is not set
> # CONFIG_COMMON_CLK_XLNX_CLKWZRD is not set
> # CONFIG_KS7010 is not set
> # CONFIG_GREYBUS_AUDIO is not set
> CONFIG_GREYBUS_BOOTROM=y
> # CONFIG_GREYBUS_HID is not set
> CONFIG_GREYBUS_LIGHT=y
> # CONFIG_GREYBUS_LOG is not set
> # CONFIG_GREYBUS_LOOPBACK is not set
> CONFIG_GREYBUS_POWER=y
> # CONFIG_GREYBUS_RAW is not set
> CONFIG_GREYBUS_VIBRATOR=y
> CONFIG_GREYBUS_BRIDGED_PHY=y
> CONFIG_GREYBUS_GPIO=y
> CONFIG_GREYBUS_I2C=y
> CONFIG_GREYBUS_SDIO=y
> CONFIG_GREYBUS_UART=y
> 
> #
> # Gasket devices
> #
> CONFIG_STAGING_GASKET_FRAMEWORK=y
> # CONFIG_STAGING_APEX_DRIVER is not set
> # end of Gasket devices
> 
> # CONFIG_XIL_AXIS_FIFO is not set
> CONFIG_FIELDBUS_DEV=y
> CONFIG_HMS_ANYBUSS_BUS=y
> CONFIG_ARCX_ANYBUS_CONTROLLER=y
> # CONFIG_HMS_PROFINET is not set
> # CONFIG_KPC2000 is not set
> # CONFIG_QLGE is not set
> CONFIG_X86_PLATFORM_DEVICES=y
> CONFIG_ACPI_WMI=y
> CONFIG_WMI_BMOF=y
> # CONFIG_ALIENWARE_WMI is not set
> # CONFIG_HUAWEI_WMI is not set
> # CONFIG_INTEL_WMI_THUNDERBOLT is not set
> CONFIG_MXM_WMI=y
> # CONFIG_PEAQ_WMI is not set
> # CONFIG_XIAOMI_WMI is not set
> # CONFIG_ACERHDF is not set
> # CONFIG_ACER_WIRELESS is not set
> # CONFIG_ACER_WMI is not set
> # CONFIG_APPLE_GMUX is not set
> # CONFIG_ASUS_LAPTOP is not set
> # CONFIG_ASUS_WIRELESS is not set
> # CONFIG_ASUS_WMI is not set
> # CONFIG_EEEPC_LAPTOP is not set
> # CONFIG_DCDBAS is not set
> # CONFIG_DELL_SMBIOS is not set
> # CONFIG_DELL_RBU is not set
> # CONFIG_DELL_SMO8800 is not set
> # CONFIG_DELL_WMI_AIO is not set
> # CONFIG_DELL_WMI_LED is not set
> # CONFIG_FUJITSU_LAPTOP is not set
> # CONFIG_FUJITSU_TABLET is not set
> # CONFIG_GPD_POCKET_FAN is not set
> # CONFIG_HP_ACCEL is not set
> # CONFIG_HP_WIRELESS is not set
> # CONFIG_HP_WMI is not set
> # CONFIG_IBM_RTL is not set
> # CONFIG_SENSORS_HDAPS is not set
> # CONFIG_THINKPAD_ACPI is not set
> # CONFIG_INTEL_ATOMISP2_PM is not set
> # CONFIG_INTEL_HID_EVENT is not set
> # CONFIG_INTEL_INT0002_VGPIO is not set
> # CONFIG_INTEL_MENLOW is not set
> # CONFIG_INTEL_VBTN is not set
> # CONFIG_SURFACE_3_POWER_OPREGION is not set
> # CONFIG_SURFACE_PRO3_BUTTON is not set
> # CONFIG_MSI_WMI is not set
> # CONFIG_PCENGINES_APU2 is not set
> # CONFIG_SAMSUNG_LAPTOP is not set
> # CONFIG_SAMSUNG_Q10 is not set
> # CONFIG_ACPI_TOSHIBA is not set
> # CONFIG_TOSHIBA_BT_RFKILL is not set
> # CONFIG_TOSHIBA_HAPS is not set
> # CONFIG_TOSHIBA_WMI is not set
> # CONFIG_ACPI_CMPC is not set
> # CONFIG_LG_LAPTOP is not set
> # CONFIG_PANASONIC_LAPTOP is not set
> # CONFIG_SYSTEM76_ACPI is not set
> # CONFIG_TOPSTAR_LAPTOP is not set
> # CONFIG_I2C_MULTI_INSTANTIATE is not set
> # CONFIG_MLX_PLATFORM is not set
> # CONFIG_INTEL_IPS is not set
> # CONFIG_INTEL_RST is not set
> # CONFIG_INTEL_SMARTCONNECT is not set
> 
> #
> # Intel Speed Select Technology interface support
> #
> # CONFIG_INTEL_SPEED_SELECT_INTERFACE is not set
> # end of Intel Speed Select Technology interface support
> 
> # CONFIG_INTEL_UNCORE_FREQ_CONTROL is not set
> # CONFIG_INTEL_PMC_CORE is not set
> # CONFIG_INTEL_PMC_IPC is not set
> # CONFIG_INTEL_PUNIT_IPC is not set
> CONFIG_PMC_ATOM=y
> # CONFIG_GOLDFISH_PIPE is not set
> # CONFIG_MFD_CROS_EC is not set
> CONFIG_CHROME_PLATFORMS=y
> CONFIG_CHROMEOS_LAPTOP=y
> CONFIG_CHROMEOS_PSTORE=y
> # CONFIG_CHROMEOS_TBMC is not set
> CONFIG_CROS_EC=y
> CONFIG_CROS_EC_I2C=y
> # CONFIG_CROS_EC_LPC is not set
> CONFIG_CROS_EC_PROTO=y
> # CONFIG_CROS_KBD_LED_BACKLIGHT is not set
> CONFIG_CROS_EC_CHARDEV=y
> CONFIG_CROS_EC_LIGHTBAR=y
> CONFIG_CROS_EC_VBC=y
> CONFIG_CROS_EC_DEBUGFS=y
> # CONFIG_CROS_EC_SENSORHUB is not set
> # CONFIG_CROS_EC_SYSFS is not set
> CONFIG_CROS_USBPD_NOTIFY=y
> # CONFIG_MELLANOX_PLATFORM is not set
> CONFIG_CLKDEV_LOOKUP=y
> CONFIG_HAVE_CLK_PREPARE=y
> CONFIG_COMMON_CLK=y
> 
> #
> # Common Clock Framework
> #
> # CONFIG_CLK_HSDK is not set
> CONFIG_COMMON_CLK_MAX9485=y
> CONFIG_COMMON_CLK_RK808=y
> # CONFIG_COMMON_CLK_SI5341 is not set
> CONFIG_COMMON_CLK_SI5351=y
> # CONFIG_COMMON_CLK_SI514 is not set
> CONFIG_COMMON_CLK_SI544=y
> CONFIG_COMMON_CLK_SI570=y
> CONFIG_COMMON_CLK_CDCE706=y
> CONFIG_COMMON_CLK_CDCE925=y
> # CONFIG_COMMON_CLK_CS2000_CP is not set
> CONFIG_COMMON_CLK_S2MPS11=y
> # CONFIG_CLK_TWL6040 is not set
> CONFIG_COMMON_CLK_PALMAS=y
> CONFIG_COMMON_CLK_VC5=y
> # CONFIG_COMMON_CLK_BD718XX is not set
> # CONFIG_COMMON_CLK_FIXED_MMIO is not set
> # end of Common Clock Framework
> 
> CONFIG_HWSPINLOCK=y
> 
> #
> # Clock Source drivers
> #
> CONFIG_CLKEVT_I8253=y
> CONFIG_I8253_LOCK=y
> CONFIG_CLKBLD_I8253=y
> # CONFIG_MICROCHIP_PIT64B is not set
> # end of Clock Source drivers
> 
> CONFIG_MAILBOX=y
> CONFIG_PLATFORM_MHU=y
> # CONFIG_PCC is not set
> # CONFIG_ALTERA_MBOX is not set
> # CONFIG_MAILBOX_TEST is not set
> CONFIG_IOMMU_IOVA=y
> CONFIG_IOMMU_API=y
> CONFIG_IOMMU_SUPPORT=y
> 
> #
> # Generic IOMMU Pagetable Support
> #
> # end of Generic IOMMU Pagetable Support
> 
> CONFIG_IOMMU_DEBUGFS=y
> # CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
> CONFIG_OF_IOMMU=y
> # CONFIG_AMD_IOMMU is not set
> # CONFIG_AMD_IOMMU_V2 is not set
> 
> #
> # Remoteproc drivers
> #
> CONFIG_REMOTEPROC=y
> # end of Remoteproc drivers
> 
> #
> # Rpmsg drivers
> #
> # CONFIG_RPMSG_QCOM_GLINK_RPM is not set
> # CONFIG_RPMSG_VIRTIO is not set
> # end of Rpmsg drivers
> 
> CONFIG_SOUNDWIRE=y
> 
> #
> # SoundWire Devices
> #
> 
> #
> # SOC (System On Chip) specific Drivers
> #
> 
> #
> # Amlogic SoC drivers
> #
> # end of Amlogic SoC drivers
> 
> #
> # Aspeed SoC drivers
> #
> # end of Aspeed SoC drivers
> 
> #
> # Broadcom SoC drivers
> #
> # end of Broadcom SoC drivers
> 
> #
> # NXP/Freescale QorIQ SoC drivers
> #
> # end of NXP/Freescale QorIQ SoC drivers
> 
> #
> # i.MX SoC drivers
> #
> # end of i.MX SoC drivers
> 
> #
> # Qualcomm SoC drivers
> #
> # end of Qualcomm SoC drivers
> 
> # CONFIG_SOC_TI is not set
> 
> #
> # Xilinx SoC drivers
> #
> CONFIG_XILINX_VCU=y
> # end of Xilinx SoC drivers
> # end of SOC (System On Chip) specific Drivers
> 
> CONFIG_PM_DEVFREQ=y
> 
> #
> # DEVFREQ Governors
> #
> CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
> CONFIG_DEVFREQ_GOV_PERFORMANCE=y
> CONFIG_DEVFREQ_GOV_POWERSAVE=y
> # CONFIG_DEVFREQ_GOV_USERSPACE is not set
> CONFIG_DEVFREQ_GOV_PASSIVE=y
> 
> #
> # DEVFREQ Drivers
> #
> CONFIG_PM_DEVFREQ_EVENT=y
> CONFIG_EXTCON=y
> 
> #
> # Extcon Device Drivers
> #
> CONFIG_EXTCON_ADC_JACK=y
> # CONFIG_EXTCON_AXP288 is not set
> # CONFIG_EXTCON_FSA9480 is not set
> CONFIG_EXTCON_GPIO=y
> # CONFIG_EXTCON_INTEL_INT3496 is not set
> # CONFIG_EXTCON_MAX14577 is not set
> CONFIG_EXTCON_MAX3355=y
> # CONFIG_EXTCON_MAX77693 is not set
> CONFIG_EXTCON_MAX8997=y
> CONFIG_EXTCON_PALMAS=y
> CONFIG_EXTCON_PTN5150=y
> CONFIG_EXTCON_RT8973A=y
> # CONFIG_EXTCON_SM5502 is not set
> CONFIG_EXTCON_USB_GPIO=y
> CONFIG_EXTCON_USBC_CROS_EC=y
> CONFIG_MEMORY=y
> CONFIG_IIO=y
> CONFIG_IIO_BUFFER=y
> CONFIG_IIO_BUFFER_CB=y
> CONFIG_IIO_BUFFER_HW_CONSUMER=y
> CONFIG_IIO_KFIFO_BUF=y
> CONFIG_IIO_TRIGGERED_BUFFER=y
> CONFIG_IIO_CONFIGFS=y
> CONFIG_IIO_TRIGGER=y
> CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
> CONFIG_IIO_SW_DEVICE=y
> # CONFIG_IIO_SW_TRIGGER is not set
> 
> #
> # Accelerometers
> #
> CONFIG_ADXL345=y
> CONFIG_ADXL345_I2C=y
> # CONFIG_ADXL372_I2C is not set
> CONFIG_BMA180=y
> # CONFIG_BMA400 is not set
> # CONFIG_BMC150_ACCEL is not set
> # CONFIG_DA280 is not set
> # CONFIG_DA311 is not set
> CONFIG_DMARD06=y
> CONFIG_DMARD09=y
> CONFIG_DMARD10=y
> # CONFIG_IIO_ST_ACCEL_3AXIS is not set
> CONFIG_KXSD9=y
> CONFIG_KXSD9_I2C=y
> CONFIG_KXCJK1013=y
> # CONFIG_MC3230 is not set
> CONFIG_MMA7455=y
> CONFIG_MMA7455_I2C=y
> CONFIG_MMA7660=y
> CONFIG_MMA8452=y
> CONFIG_MMA9551_CORE=y
> CONFIG_MMA9551=y
> CONFIG_MMA9553=y
> CONFIG_MXC4005=y
> # CONFIG_MXC6255 is not set
> # CONFIG_STK8312 is not set
> CONFIG_STK8BA50=y
> # end of Accelerometers
> 
> #
> # Analog to digital converters
> #
> # CONFIG_AD7091R5 is not set
> CONFIG_AD7291=y
> CONFIG_AD7606=y
> CONFIG_AD7606_IFACE_PARALLEL=y
> CONFIG_AD799X=y
> CONFIG_AXP20X_ADC=y
> CONFIG_AXP288_ADC=y
> # CONFIG_CC10001_ADC is not set
> # CONFIG_DA9150_GPADC is not set
> CONFIG_ENVELOPE_DETECTOR=y
> CONFIG_HX711=y
> CONFIG_LTC2471=y
> CONFIG_LTC2485=y
> CONFIG_LTC2497=y
> CONFIG_MAX1363=y
> CONFIG_MAX9611=y
> # CONFIG_MCP3422 is not set
> CONFIG_NAU7802=y
> CONFIG_PALMAS_GPADC=y
> CONFIG_QCOM_VADC_COMMON=y
> CONFIG_QCOM_SPMI_IADC=y
> CONFIG_QCOM_SPMI_VADC=y
> CONFIG_QCOM_SPMI_ADC5=y
> CONFIG_RN5T618_ADC=y
> CONFIG_SD_ADC_MODULATOR=y
> CONFIG_STX104=y
> # CONFIG_TI_ADC081C is not set
> CONFIG_TI_ADS1015=y
> CONFIG_TWL4030_MADC=y
> # CONFIG_TWL6030_GPADC is not set
> CONFIG_VF610_ADC=y
> CONFIG_XILINX_XADC=y
> # end of Analog to digital converters
> 
> #
> # Analog Front Ends
> #
> # CONFIG_IIO_RESCALE is not set
> # end of Analog Front Ends
> 
> #
> # Amplifiers
> #
> # CONFIG_HMC425 is not set
> # end of Amplifiers
> 
> #
> # Chemical Sensors
> #
> CONFIG_ATLAS_PH_SENSOR=y
> CONFIG_BME680=y
> CONFIG_BME680_I2C=y
> # CONFIG_CCS811 is not set
> CONFIG_IAQCORE=y
> # CONFIG_PMS7003 is not set
> CONFIG_SENSIRION_SGP30=y
> # CONFIG_SPS30 is not set
> CONFIG_VZ89X=y
> # end of Chemical Sensors
> 
> #
> # Hid Sensor IIO Common
> #
> # end of Hid Sensor IIO Common
> 
> CONFIG_IIO_MS_SENSORS_I2C=y
> 
> #
> # SSP Sensor Common
> #
> # end of SSP Sensor Common
> 
> CONFIG_IIO_ST_SENSORS_I2C=y
> CONFIG_IIO_ST_SENSORS_CORE=y
> 
> #
> # Digital to analog converters
> #
> CONFIG_AD5064=y
> CONFIG_AD5380=y
> CONFIG_AD5446=y
> CONFIG_AD5592R_BASE=y
> CONFIG_AD5593R=y
> # CONFIG_AD5696_I2C is not set
> CONFIG_CIO_DAC=y
> CONFIG_DPOT_DAC=y
> CONFIG_DS4424=y
> CONFIG_M62332=y
> CONFIG_MAX517=y
> CONFIG_MAX5821=y
> CONFIG_MCP4725=y
> CONFIG_TI_DAC5571=y
> CONFIG_VF610_DAC=y
> # end of Digital to analog converters
> 
> #
> # IIO dummy driver
> #
> CONFIG_IIO_SIMPLE_DUMMY=y
> # CONFIG_IIO_SIMPLE_DUMMY_EVENTS is not set
> CONFIG_IIO_SIMPLE_DUMMY_BUFFER=y
> # end of IIO dummy driver
> 
> #
> # Frequency Synthesizers DDS/PLL
> #
> 
> #
> # Clock Generator/Distribution
> #
> # end of Clock Generator/Distribution
> 
> #
> # Phase-Locked Loop (PLL) frequency synthesizers
> #
> # end of Phase-Locked Loop (PLL) frequency synthesizers
> # end of Frequency Synthesizers DDS/PLL
> 
> #
> # Digital gyroscope sensors
> #
> CONFIG_BMG160=y
> CONFIG_BMG160_I2C=y
> # CONFIG_FXAS21002C is not set
> CONFIG_MPU3050=y
> CONFIG_MPU3050_I2C=y
> CONFIG_IIO_ST_GYRO_3AXIS=y
> CONFIG_IIO_ST_GYRO_I2C_3AXIS=y
> # CONFIG_ITG3200 is not set
> # end of Digital gyroscope sensors
> 
> #
> # Health Sensors
> #
> 
> #
> # Heart Rate Monitors
> #
> CONFIG_AFE4404=y
> CONFIG_MAX30100=y
> # CONFIG_MAX30102 is not set
> # end of Heart Rate Monitors
> # end of Health Sensors
> 
> #
> # Humidity sensors
> #
> CONFIG_AM2315=y
> # CONFIG_DHT11 is not set
> CONFIG_HDC100X=y
> CONFIG_HTS221=y
> CONFIG_HTS221_I2C=y
> CONFIG_HTU21=y
> CONFIG_SI7005=y
> CONFIG_SI7020=y
> # end of Humidity sensors
> 
> #
> # Inertial measurement units
> #
> CONFIG_BMI160=y
> CONFIG_BMI160_I2C=y
> CONFIG_FXOS8700=y
> CONFIG_FXOS8700_I2C=y
> CONFIG_KMX61=y
> CONFIG_INV_MPU6050_IIO=y
> CONFIG_INV_MPU6050_I2C=y
> # CONFIG_IIO_ST_LSM6DSX is not set
> # end of Inertial measurement units
> 
> #
> # Light sensors
> #
> # CONFIG_ACPI_ALS is not set
> CONFIG_ADJD_S311=y
> CONFIG_ADUX1020=y
> CONFIG_AL3010=y
> # CONFIG_AL3320A is not set
> CONFIG_APDS9300=y
> CONFIG_APDS9960=y
> # CONFIG_BH1750 is not set
> CONFIG_BH1780=y
> CONFIG_CM32181=y
> CONFIG_CM3232=y
> CONFIG_CM3323=y
> # CONFIG_CM3605 is not set
> # CONFIG_CM36651 is not set
> CONFIG_GP2AP002=y
> CONFIG_GP2AP020A00F=y
> # CONFIG_SENSORS_ISL29018 is not set
> CONFIG_SENSORS_ISL29028=y
> # CONFIG_ISL29125 is not set
> CONFIG_JSA1212=y
> # CONFIG_RPR0521 is not set
> # CONFIG_SENSORS_LM3533 is not set
> CONFIG_LTR501=y
> CONFIG_LV0104CS=y
> CONFIG_MAX44000=y
> CONFIG_MAX44009=y
> # CONFIG_NOA1305 is not set
> CONFIG_OPT3001=y
> CONFIG_PA12203001=y
> # CONFIG_SI1133 is not set
> # CONFIG_SI1145 is not set
> # CONFIG_STK3310 is not set
> # CONFIG_ST_UVIS25 is not set
> # CONFIG_TCS3414 is not set
> CONFIG_TCS3472=y
> CONFIG_SENSORS_TSL2563=y
> CONFIG_TSL2583=y
> CONFIG_TSL2772=y
> # CONFIG_TSL4531 is not set
> CONFIG_US5182D=y
> CONFIG_VCNL4000=y
> CONFIG_VCNL4035=y
> CONFIG_VEML6030=y
> CONFIG_VEML6070=y
> CONFIG_VL6180=y
> CONFIG_ZOPT2201=y
> # end of Light sensors
> 
> #
> # Magnetometer sensors
> #
> # CONFIG_AK8974 is not set
> CONFIG_AK8975=y
> CONFIG_AK09911=y
> CONFIG_BMC150_MAGN=y
> CONFIG_BMC150_MAGN_I2C=y
> CONFIG_MAG3110=y
> # CONFIG_MMC35240 is not set
> # CONFIG_IIO_ST_MAGN_3AXIS is not set
> # CONFIG_SENSORS_HMC5843_I2C is not set
> # CONFIG_SENSORS_RM3100_I2C is not set
> # end of Magnetometer sensors
> 
> #
> # Multiplexers
> #
> CONFIG_IIO_MUX=y
> # end of Multiplexers
> 
> #
> # Inclinometer sensors
> #
> # end of Inclinometer sensors
> 
> #
> # Triggers - standalone
> #
> # CONFIG_IIO_INTERRUPT_TRIGGER is not set
> CONFIG_IIO_SYSFS_TRIGGER=y
> # end of Triggers - standalone
> 
> #
> # Linear and angular position sensors
> #
> # end of Linear and angular position sensors
> 
> #
> # Digital potentiometers
> #
> CONFIG_AD5272=y
> CONFIG_DS1803=y
> CONFIG_MAX5432=y
> # CONFIG_MCP4018 is not set
> CONFIG_MCP4531=y
> CONFIG_TPL0102=y
> # end of Digital potentiometers
> 
> #
> # Digital potentiostats
> #
> # CONFIG_LMP91000 is not set
> # end of Digital potentiostats
> 
> #
> # Pressure sensors
> #
> CONFIG_ABP060MG=y
> # CONFIG_BMP280 is not set
> CONFIG_DLHL60D=y
> # CONFIG_DPS310 is not set
> CONFIG_HP03=y
> # CONFIG_ICP10100 is not set
> CONFIG_MPL115=y
> CONFIG_MPL115_I2C=y
> CONFIG_MPL3115=y
> # CONFIG_MS5611 is not set
> CONFIG_MS5637=y
> # CONFIG_IIO_ST_PRESS is not set
> CONFIG_T5403=y
> # CONFIG_HP206C is not set
> CONFIG_ZPA2326=y
> CONFIG_ZPA2326_I2C=y
> # end of Pressure sensors
> 
> #
> # Lightning sensors
> #
> # end of Lightning sensors
> 
> #
> # Proximity and distance sensors
> #
> # CONFIG_ISL29501 is not set
> # CONFIG_LIDAR_LITE_V2 is not set
> CONFIG_MB1232=y
> # CONFIG_PING is not set
> CONFIG_RFD77402=y
> # CONFIG_SRF04 is not set
> CONFIG_SX9500=y
> # CONFIG_SRF08 is not set
> CONFIG_VL53L0X_I2C=y
> # end of Proximity and distance sensors
> 
> #
> # Resolver to digital converters
> #
> # end of Resolver to digital converters
> 
> #
> # Temperature sensors
> #
> CONFIG_MLX90614=y
> CONFIG_MLX90632=y
> CONFIG_TMP006=y
> CONFIG_TMP007=y
> CONFIG_TSYS01=y
> # CONFIG_TSYS02D is not set
> # end of Temperature sensors
> 
> CONFIG_NTB=y
> # CONFIG_NTB_AMD is not set
> CONFIG_NTB_IDT=y
> CONFIG_NTB_INTEL=y
> CONFIG_NTB_SWITCHTEC=y
> # CONFIG_NTB_PINGPONG is not set
> CONFIG_NTB_TOOL=y
> CONFIG_NTB_PERF=y
> CONFIG_NTB_TRANSPORT=y
> # CONFIG_VME_BUS is not set
> # CONFIG_PWM is not set
> 
> #
> # IRQ chip support
> #
> CONFIG_IRQCHIP=y
> CONFIG_AL_FIC=y
> CONFIG_MADERA_IRQ=y
> # end of IRQ chip support
> 
> CONFIG_IPACK_BUS=y
> CONFIG_BOARD_TPCI200=y
> CONFIG_SERIAL_IPOCTAL=y
> CONFIG_RESET_CONTROLLER=y
> # CONFIG_RESET_BRCMSTB_RESCAL is not set
> # CONFIG_RESET_INTEL_GW is not set
> CONFIG_RESET_TI_SYSCON=y
> 
> #
> # PHY Subsystem
> #
> CONFIG_GENERIC_PHY=y
> CONFIG_GENERIC_PHY_MIPI_DPHY=y
> # CONFIG_BCM_KONA_USB2_PHY is not set
> CONFIG_PHY_CADENCE_TORRENT=y
> CONFIG_PHY_CADENCE_DPHY=y
> CONFIG_PHY_CADENCE_SIERRA=y
> # CONFIG_PHY_FSL_IMX8MQ_USB is not set
> CONFIG_PHY_MIXEL_MIPI_DPHY=y
> # CONFIG_PHY_PXA_28NM_HSIC is not set
> # CONFIG_PHY_PXA_28NM_USB2 is not set
> # CONFIG_PHY_CPCAP_USB is not set
> # CONFIG_PHY_MAPPHONE_MDM6600 is not set
> # CONFIG_PHY_OCELOT_SERDES is not set
> CONFIG_PHY_INTEL_EMMC=y
> # end of PHY Subsystem
> 
> # CONFIG_POWERCAP is not set
> # CONFIG_MCB is not set
> 
> #
> # Performance monitor support
> #
> # end of Performance monitor support
> 
> CONFIG_RAS=y
> # CONFIG_USB4 is not set
> 
> #
> # Android
> #
> CONFIG_ANDROID=y
> CONFIG_ANDROID_BINDER_IPC=y
> CONFIG_ANDROID_BINDERFS=y
> CONFIG_ANDROID_BINDER_DEVICES="binder,hwbinder,vndbinder"
> # CONFIG_ANDROID_BINDER_IPC_SELFTEST is not set
> # end of Android
> 
> # CONFIG_LIBNVDIMM is not set
> CONFIG_DAX=y
> CONFIG_NVMEM=y
> CONFIG_NVMEM_SYSFS=y
> # CONFIG_NVMEM_SPMI_SDAM is not set
> 
> #
> # HW tracing support
> #
> # CONFIG_STM is not set
> CONFIG_INTEL_TH=y
> # CONFIG_INTEL_TH_PCI is not set
> # CONFIG_INTEL_TH_ACPI is not set
> # CONFIG_INTEL_TH_GTH is not set
> CONFIG_INTEL_TH_MSU=y
> CONFIG_INTEL_TH_PTI=y
> CONFIG_INTEL_TH_DEBUG=y
> # end of HW tracing support
> 
> CONFIG_FPGA=y
> CONFIG_ALTERA_PR_IP_CORE=y
> CONFIG_ALTERA_PR_IP_CORE_PLAT=y
> # CONFIG_FPGA_MGR_ALTERA_CVP is not set
> CONFIG_FPGA_BRIDGE=y
> CONFIG_ALTERA_FREEZE_BRIDGE=y
> CONFIG_XILINX_PR_DECOUPLER=y
> CONFIG_FPGA_REGION=y
> CONFIG_OF_FPGA_REGION=y
> CONFIG_FPGA_DFL=y
> # CONFIG_FPGA_DFL_FME is not set
> CONFIG_FPGA_DFL_AFU=y
> CONFIG_FPGA_DFL_PCI=y
> CONFIG_FSI=y
> CONFIG_FSI_NEW_DEV_NODE=y
> CONFIG_FSI_MASTER_GPIO=y
> CONFIG_FSI_MASTER_HUB=y
> # CONFIG_FSI_MASTER_ASPEED is not set
> # CONFIG_FSI_SCOM is not set
> # CONFIG_FSI_SBEFIFO is not set
> CONFIG_TEE=y
> 
> #
> # TEE drivers
> #
> # end of TEE drivers
> 
> CONFIG_MULTIPLEXER=y
> 
> #
> # Multiplexer drivers
> #
> CONFIG_MUX_ADG792A=y
> CONFIG_MUX_GPIO=y
> CONFIG_MUX_MMIO=y
> # end of Multiplexer drivers
> 
> CONFIG_PM_OPP=y
> # CONFIG_UNISYS_VISORBUS is not set
> # CONFIG_SIOX is not set
> # CONFIG_SLIMBUS is not set
> # CONFIG_INTERCONNECT is not set
> CONFIG_COUNTER=y
> CONFIG_104_QUAD_8=y
> CONFIG_FTM_QUADDEC=y
> # CONFIG_MOST is not set
> # end of Device Drivers
> 
> #
> # File systems
> #
> CONFIG_DCACHE_WORD_ACCESS=y
> CONFIG_VALIDATE_FS_PARSER=y
> CONFIG_FS_IOMAP=y
> CONFIG_EXT2_FS=y
> # CONFIG_EXT2_FS_XATTR is not set
> # CONFIG_EXT3_FS is not set
> CONFIG_EXT4_FS=y
> # CONFIG_EXT4_FS_POSIX_ACL is not set
> # CONFIG_EXT4_FS_SECURITY is not set
> # CONFIG_EXT4_DEBUG is not set
> CONFIG_EXT4_KUNIT_TESTS=y
> CONFIG_JBD2=y
> CONFIG_JBD2_DEBUG=y
> CONFIG_FS_MBCACHE=y
> CONFIG_REISERFS_FS=y
> CONFIG_REISERFS_CHECK=y
> # CONFIG_REISERFS_PROC_INFO is not set
> # CONFIG_REISERFS_FS_XATTR is not set
> CONFIG_JFS_FS=y
> # CONFIG_JFS_POSIX_ACL is not set
> # CONFIG_JFS_SECURITY is not set
> CONFIG_JFS_DEBUG=y
> # CONFIG_JFS_STATISTICS is not set
> # CONFIG_XFS_FS is not set
> CONFIG_GFS2_FS=y
> # CONFIG_OCFS2_FS is not set
> # CONFIG_BTRFS_FS is not set
> # CONFIG_NILFS2_FS is not set
> # CONFIG_F2FS_FS is not set
> CONFIG_ZONEFS_FS=y
> CONFIG_FS_DAX=y
> CONFIG_FS_POSIX_ACL=y
> CONFIG_EXPORTFS=y
> CONFIG_EXPORTFS_BLOCK_OPS=y
> CONFIG_FILE_LOCKING=y
> CONFIG_MANDATORY_FILE_LOCKING=y
> CONFIG_FS_ENCRYPTION=y
> CONFIG_FS_ENCRYPTION_ALGS=y
> # CONFIG_FS_VERITY is not set
> CONFIG_FSNOTIFY=y
> CONFIG_DNOTIFY=y
> CONFIG_INOTIFY_USER=y
> CONFIG_FANOTIFY=y
> # CONFIG_FANOTIFY_ACCESS_PERMISSIONS is not set
> # CONFIG_QUOTA is not set
> # CONFIG_QUOTA_NETLINK_INTERFACE is not set
> CONFIG_QUOTACTL=y
> CONFIG_QUOTACTL_COMPAT=y
> # CONFIG_AUTOFS4_FS is not set
> CONFIG_AUTOFS_FS=y
> CONFIG_FUSE_FS=y
> CONFIG_CUSE=y
> CONFIG_VIRTIO_FS=y
> # CONFIG_OVERLAY_FS is not set
> 
> #
> # Caches
> #
> CONFIG_FSCACHE=y
> # CONFIG_FSCACHE_STATS is not set
> # CONFIG_FSCACHE_HISTOGRAM is not set
> # CONFIG_FSCACHE_DEBUG is not set
> CONFIG_FSCACHE_OBJECT_LIST=y
> CONFIG_CACHEFILES=y
> # CONFIG_CACHEFILES_DEBUG is not set
> # CONFIG_CACHEFILES_HISTOGRAM is not set
> # end of Caches
> 
> #
> # CD-ROM/DVD Filesystems
> #
> CONFIG_ISO9660_FS=y
> CONFIG_JOLIET=y
> CONFIG_ZISOFS=y
> # CONFIG_UDF_FS is not set
> # end of CD-ROM/DVD Filesystems
> 
> #
> # DOS/FAT/EXFAT/NT Filesystems
> #
> CONFIG_FAT_FS=y
> CONFIG_MSDOS_FS=y
> CONFIG_VFAT_FS=y
> CONFIG_FAT_DEFAULT_CODEPAGE=437
> CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
> # CONFIG_FAT_DEFAULT_UTF8 is not set
> # CONFIG_EXFAT_FS is not set
> CONFIG_NTFS_FS=y
> CONFIG_NTFS_DEBUG=y
> CONFIG_NTFS_RW=y
> # end of DOS/FAT/EXFAT/NT Filesystems
> 
> #
> # Pseudo filesystems
> #
> CONFIG_PROC_FS=y
> CONFIG_PROC_KCORE=y
> # CONFIG_PROC_VMCORE is not set
> CONFIG_PROC_SYSCTL=y
> CONFIG_PROC_PAGE_MONITOR=y
> CONFIG_PROC_CHILDREN=y
> CONFIG_PROC_PID_ARCH_STATUS=y
> CONFIG_KERNFS=y
> CONFIG_SYSFS=y
> CONFIG_TMPFS=y
> CONFIG_TMPFS_POSIX_ACL=y
> CONFIG_TMPFS_XATTR=y
> CONFIG_HUGETLBFS=y
> CONFIG_HUGETLB_PAGE=y
> CONFIG_MEMFD_CREATE=y
> CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
> CONFIG_CONFIGFS_FS=y
> # end of Pseudo filesystems
> 
> # CONFIG_MISC_FILESYSTEMS is not set
> CONFIG_NETWORK_FILESYSTEMS=y
> CONFIG_NFS_FS=y
> CONFIG_NFS_V2=y
> CONFIG_NFS_V3=y
> # CONFIG_NFS_V3_ACL is not set
> CONFIG_NFS_V4=m
> # CONFIG_NFS_V4_1 is not set
> # CONFIG_ROOT_NFS is not set
> # CONFIG_NFS_FSCACHE is not set
> # CONFIG_NFS_USE_LEGACY_DNS is not set
> CONFIG_NFS_USE_KERNEL_DNS=y
> CONFIG_NFS_DISABLE_UDP_SUPPORT=y
> # CONFIG_NFSD is not set
> CONFIG_GRACE_PERIOD=y
> CONFIG_LOCKD=y
> CONFIG_LOCKD_V4=y
> CONFIG_NFS_COMMON=y
> CONFIG_SUNRPC=y
> CONFIG_SUNRPC_GSS=y
> CONFIG_RPCSEC_GSS_KRB5=y
> # CONFIG_SUNRPC_DISABLE_INSECURE_ENCTYPES is not set
> # CONFIG_SUNRPC_DEBUG is not set
> # CONFIG_CEPH_FS is not set
> CONFIG_CIFS=m
> # CONFIG_CIFS_STATS2 is not set
> CONFIG_CIFS_ALLOW_INSECURE_LEGACY=y
> # CONFIG_CIFS_WEAK_PW_HASH is not set
> # CONFIG_CIFS_UPCALL is not set
> # CONFIG_CIFS_XATTR is not set
> CONFIG_CIFS_DEBUG=y
> # CONFIG_CIFS_DEBUG2 is not set
> # CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
> # CONFIG_CIFS_DFS_UPCALL is not set
> # CONFIG_CIFS_FSCACHE is not set
> # CONFIG_CODA_FS is not set
> # CONFIG_AFS_FS is not set
> # CONFIG_9P_FS is not set
> CONFIG_NLS=y
> CONFIG_NLS_DEFAULT="iso8859-1"
> CONFIG_NLS_CODEPAGE_437=y
> # CONFIG_NLS_CODEPAGE_737 is not set
> # CONFIG_NLS_CODEPAGE_775 is not set
> CONFIG_NLS_CODEPAGE_850=y
> CONFIG_NLS_CODEPAGE_852=y
> # CONFIG_NLS_CODEPAGE_855 is not set
> # CONFIG_NLS_CODEPAGE_857 is not set
> CONFIG_NLS_CODEPAGE_860=y
> CONFIG_NLS_CODEPAGE_861=y
> CONFIG_NLS_CODEPAGE_862=y
> # CONFIG_NLS_CODEPAGE_863 is not set
> # CONFIG_NLS_CODEPAGE_864 is not set
> # CONFIG_NLS_CODEPAGE_865 is not set
> # CONFIG_NLS_CODEPAGE_866 is not set
> CONFIG_NLS_CODEPAGE_869=y
> CONFIG_NLS_CODEPAGE_936=y
> # CONFIG_NLS_CODEPAGE_950 is not set
> CONFIG_NLS_CODEPAGE_932=y
> CONFIG_NLS_CODEPAGE_949=y
> # CONFIG_NLS_CODEPAGE_874 is not set
> # CONFIG_NLS_ISO8859_8 is not set
> CONFIG_NLS_CODEPAGE_1250=y
> CONFIG_NLS_CODEPAGE_1251=y
> # CONFIG_NLS_ASCII is not set
> CONFIG_NLS_ISO8859_1=y
> CONFIG_NLS_ISO8859_2=y
> # CONFIG_NLS_ISO8859_3 is not set
> CONFIG_NLS_ISO8859_4=y
> CONFIG_NLS_ISO8859_5=y
> CONFIG_NLS_ISO8859_6=y
> # CONFIG_NLS_ISO8859_7 is not set
> CONFIG_NLS_ISO8859_9=y
> CONFIG_NLS_ISO8859_13=y
> CONFIG_NLS_ISO8859_14=y
> CONFIG_NLS_ISO8859_15=y
> CONFIG_NLS_KOI8_R=y
> # CONFIG_NLS_KOI8_U is not set
> CONFIG_NLS_MAC_ROMAN=y
> CONFIG_NLS_MAC_CELTIC=y
> CONFIG_NLS_MAC_CENTEURO=y
> # CONFIG_NLS_MAC_CROATIAN is not set
> CONFIG_NLS_MAC_CYRILLIC=y
> # CONFIG_NLS_MAC_GAELIC is not set
> CONFIG_NLS_MAC_GREEK=y
> CONFIG_NLS_MAC_ICELAND=y
> # CONFIG_NLS_MAC_INUIT is not set
> # CONFIG_NLS_MAC_ROMANIAN is not set
> # CONFIG_NLS_MAC_TURKISH is not set
> # CONFIG_NLS_UTF8 is not set
> # CONFIG_DLM is not set
> CONFIG_UNICODE=y
> CONFIG_UNICODE_NORMALIZATION_SELFTEST=y
> CONFIG_IO_WQ=y
> # end of File systems
> 
> #
> # Security options
> #
> CONFIG_KEYS=y
> # CONFIG_KEYS_REQUEST_CACHE is not set
> # CONFIG_PERSISTENT_KEYRINGS is not set
> CONFIG_BIG_KEYS=y
> # CONFIG_ENCRYPTED_KEYS is not set
> # CONFIG_KEY_DH_OPERATIONS is not set
> # CONFIG_SECURITY_DMESG_RESTRICT is not set
> CONFIG_SECURITY=y
> CONFIG_SECURITYFS=y
> CONFIG_SECURITY_NETWORK=y
> CONFIG_PAGE_TABLE_ISOLATION=y
> # CONFIG_SECURITY_PATH is not set
> CONFIG_FORTIFY_SOURCE=y
> # CONFIG_STATIC_USERMODEHELPER is not set
> # CONFIG_SECURITY_SMACK is not set
> # CONFIG_SECURITY_TOMOYO is not set
> # CONFIG_SECURITY_APPARMOR is not set
> CONFIG_SECURITY_LOADPIN=y
> # CONFIG_SECURITY_LOADPIN_ENFORCE is not set
> # CONFIG_SECURITY_YAMA is not set
> CONFIG_SECURITY_SAFESETID=y
> # CONFIG_SECURITY_LOCKDOWN_LSM is not set
> CONFIG_INTEGRITY=y
> CONFIG_INTEGRITY_SIGNATURE=y
> CONFIG_INTEGRITY_ASYMMETRIC_KEYS=y
> # CONFIG_INTEGRITY_TRUSTED_KEYRING is not set
> # CONFIG_IMA is not set
> # CONFIG_EVM is not set
> CONFIG_DEFAULT_SECURITY_DAC=y
> CONFIG_LSM="lockdown,yama,loadpin,safesetid,integrity,bpf"
> 
> #
> # Kernel hardening options
> #
> 
> #
> # Memory initialization
> #
> CONFIG_CC_HAS_AUTO_VAR_INIT=y
> # CONFIG_INIT_STACK_NONE is not set
> CONFIG_INIT_STACK_ALL=y
> # CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
> # CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
> # end of Memory initialization
> # end of Kernel hardening options
> # end of Security options
> 
> CONFIG_CRYPTO=y
> 
> #
> # Crypto core or helper
> #
> CONFIG_CRYPTO_ALGAPI=y
> CONFIG_CRYPTO_ALGAPI2=y
> CONFIG_CRYPTO_AEAD=y
> CONFIG_CRYPTO_AEAD2=y
> CONFIG_CRYPTO_SKCIPHER=y
> CONFIG_CRYPTO_SKCIPHER2=y
> CONFIG_CRYPTO_HASH=y
> CONFIG_CRYPTO_HASH2=y
> CONFIG_CRYPTO_RNG=y
> CONFIG_CRYPTO_RNG2=y
> CONFIG_CRYPTO_RNG_DEFAULT=y
> CONFIG_CRYPTO_AKCIPHER2=y
> CONFIG_CRYPTO_AKCIPHER=y
> CONFIG_CRYPTO_KPP2=y
> CONFIG_CRYPTO_KPP=y
> CONFIG_CRYPTO_ACOMP2=y
> CONFIG_CRYPTO_MANAGER=y
> CONFIG_CRYPTO_MANAGER2=y
> # CONFIG_CRYPTO_USER is not set
> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
> CONFIG_CRYPTO_GF128MUL=y
> CONFIG_CRYPTO_NULL=y
> CONFIG_CRYPTO_NULL2=y
> CONFIG_CRYPTO_CRYPTD=y
> CONFIG_CRYPTO_AUTHENC=y
> # CONFIG_CRYPTO_TEST is not set
> CONFIG_CRYPTO_SIMD=y
> CONFIG_CRYPTO_GLUE_HELPER_X86=y
> CONFIG_CRYPTO_ENGINE=y
> 
> #
> # Public-key cryptography
> #
> CONFIG_CRYPTO_RSA=y
> CONFIG_CRYPTO_DH=y
> CONFIG_CRYPTO_ECC=y
> # CONFIG_CRYPTO_ECDH is not set
> CONFIG_CRYPTO_ECRDSA=y
> CONFIG_CRYPTO_CURVE25519=y
> CONFIG_CRYPTO_CURVE25519_X86=y
> 
> #
> # Authenticated Encryption with Associated Data
> #
> CONFIG_CRYPTO_CCM=m
> CONFIG_CRYPTO_GCM=y
> # CONFIG_CRYPTO_CHACHA20POLY1305 is not set
> CONFIG_CRYPTO_AEGIS128=y
> CONFIG_CRYPTO_AEGIS128_AESNI_SSE2=y
> CONFIG_CRYPTO_SEQIV=y
> CONFIG_CRYPTO_ECHAINIV=y
> 
> #
> # Block modes
> #
> CONFIG_CRYPTO_CBC=y
> CONFIG_CRYPTO_CFB=y
> CONFIG_CRYPTO_CTR=y
> CONFIG_CRYPTO_CTS=y
> CONFIG_CRYPTO_ECB=y
> # CONFIG_CRYPTO_LRW is not set
> CONFIG_CRYPTO_OFB=y
> CONFIG_CRYPTO_PCBC=y
> CONFIG_CRYPTO_XTS=y
> CONFIG_CRYPTO_KEYWRAP=y
> CONFIG_CRYPTO_NHPOLY1305=y
> CONFIG_CRYPTO_NHPOLY1305_SSE2=y
> CONFIG_CRYPTO_NHPOLY1305_AVX2=y
> CONFIG_CRYPTO_ADIANTUM=y
> CONFIG_CRYPTO_ESSIV=y
> 
> #
> # Hash modes
> #
> CONFIG_CRYPTO_CMAC=m
> CONFIG_CRYPTO_HMAC=y
> CONFIG_CRYPTO_XCBC=y
> CONFIG_CRYPTO_VMAC=y
> 
> #
> # Digest
> #
> CONFIG_CRYPTO_CRC32C=y
> CONFIG_CRYPTO_CRC32C_INTEL=y
> # CONFIG_CRYPTO_CRC32 is not set
> CONFIG_CRYPTO_CRC32_PCLMUL=y
> CONFIG_CRYPTO_XXHASH=y
> # CONFIG_CRYPTO_BLAKE2B is not set
> # CONFIG_CRYPTO_BLAKE2S is not set
> # CONFIG_CRYPTO_BLAKE2S_X86 is not set
> CONFIG_CRYPTO_CRCT10DIF=y
> CONFIG_CRYPTO_CRCT10DIF_PCLMUL=y
> CONFIG_CRYPTO_GHASH=y
> # CONFIG_CRYPTO_POLY1305 is not set
> CONFIG_CRYPTO_POLY1305_X86_64=y
> CONFIG_CRYPTO_MD4=m
> CONFIG_CRYPTO_MD5=y
> CONFIG_CRYPTO_MICHAEL_MIC=y
> CONFIG_CRYPTO_RMD128=y
> CONFIG_CRYPTO_RMD160=y
> CONFIG_CRYPTO_RMD256=y
> CONFIG_CRYPTO_RMD320=y
> CONFIG_CRYPTO_SHA1=y
> CONFIG_CRYPTO_SHA1_SSSE3=y
> # CONFIG_CRYPTO_SHA256_SSSE3 is not set
> CONFIG_CRYPTO_SHA512_SSSE3=y
> CONFIG_CRYPTO_SHA256=y
> CONFIG_CRYPTO_SHA512=y
> CONFIG_CRYPTO_SHA3=y
> CONFIG_CRYPTO_SM3=y
> CONFIG_CRYPTO_STREEBOG=y
> # CONFIG_CRYPTO_TGR192 is not set
> CONFIG_CRYPTO_WP512=y
> # CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL is not set
> 
> #
> # Ciphers
> #
> CONFIG_CRYPTO_AES=y
> CONFIG_CRYPTO_AES_TI=y
> CONFIG_CRYPTO_AES_NI_INTEL=y
> CONFIG_CRYPTO_ANUBIS=y
> CONFIG_CRYPTO_ARC4=y
> CONFIG_CRYPTO_BLOWFISH=y
> CONFIG_CRYPTO_BLOWFISH_COMMON=y
> CONFIG_CRYPTO_BLOWFISH_X86_64=y
> CONFIG_CRYPTO_CAMELLIA=y
> CONFIG_CRYPTO_CAMELLIA_X86_64=y
> CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=y
> # CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64 is not set
> CONFIG_CRYPTO_CAST_COMMON=y
> CONFIG_CRYPTO_CAST5=y
> # CONFIG_CRYPTO_CAST5_AVX_X86_64 is not set
> # CONFIG_CRYPTO_CAST6 is not set
> # CONFIG_CRYPTO_CAST6_AVX_X86_64 is not set
> CONFIG_CRYPTO_DES=y
> CONFIG_CRYPTO_DES3_EDE_X86_64=y
> CONFIG_CRYPTO_FCRYPT=y
> CONFIG_CRYPTO_KHAZAD=y
> # CONFIG_CRYPTO_SALSA20 is not set
> CONFIG_CRYPTO_CHACHA20=y
> CONFIG_CRYPTO_CHACHA20_X86_64=y
> CONFIG_CRYPTO_SEED=y
> CONFIG_CRYPTO_SERPENT=y
> # CONFIG_CRYPTO_SERPENT_SSE2_X86_64 is not set
> # CONFIG_CRYPTO_SERPENT_AVX_X86_64 is not set
> # CONFIG_CRYPTO_SERPENT_AVX2_X86_64 is not set
> CONFIG_CRYPTO_SM4=y
> CONFIG_CRYPTO_TEA=y
> # CONFIG_CRYPTO_TWOFISH is not set
> CONFIG_CRYPTO_TWOFISH_COMMON=y
> CONFIG_CRYPTO_TWOFISH_X86_64=y
> CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=y
> CONFIG_CRYPTO_TWOFISH_AVX_X86_64=y
> 
> #
> # Compression
> #
> # CONFIG_CRYPTO_DEFLATE is not set
> CONFIG_CRYPTO_LZO=y
> CONFIG_CRYPTO_842=y
> CONFIG_CRYPTO_LZ4=y
> # CONFIG_CRYPTO_LZ4HC is not set
> CONFIG_CRYPTO_ZSTD=y
> 
> #
> # Random Number Generation
> #
> # CONFIG_CRYPTO_ANSI_CPRNG is not set
> CONFIG_CRYPTO_DRBG_MENU=y
> CONFIG_CRYPTO_DRBG_HMAC=y
> # CONFIG_CRYPTO_DRBG_HASH is not set
> # CONFIG_CRYPTO_DRBG_CTR is not set
> CONFIG_CRYPTO_DRBG=y
> CONFIG_CRYPTO_JITTERENTROPY=y
> # CONFIG_CRYPTO_USER_API_HASH is not set
> # CONFIG_CRYPTO_USER_API_SKCIPHER is not set
> # CONFIG_CRYPTO_USER_API_RNG is not set
> # CONFIG_CRYPTO_USER_API_AEAD is not set
> CONFIG_CRYPTO_HASH_INFO=y
> 
> #
> # Crypto library routines
> #
> CONFIG_CRYPTO_LIB_AES=y
> CONFIG_CRYPTO_LIB_ARC4=y
> CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
> CONFIG_CRYPTO_LIB_BLAKE2S=y
> CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=y
> CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
> CONFIG_CRYPTO_LIB_CHACHA=y
> CONFIG_CRYPTO_ARCH_HAVE_LIB_CURVE25519=y
> CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=y
> # CONFIG_CRYPTO_LIB_CURVE25519 is not set
> CONFIG_CRYPTO_LIB_DES=y
> CONFIG_CRYPTO_LIB_POLY1305_RSIZE=11
> CONFIG_CRYPTO_ARCH_HAVE_LIB_POLY1305=y
> CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
> CONFIG_CRYPTO_LIB_POLY1305=y
> CONFIG_CRYPTO_LIB_CHACHA20POLY1305=y
> CONFIG_CRYPTO_LIB_SHA256=y
> CONFIG_CRYPTO_HW=y
> CONFIG_CRYPTO_DEV_PADLOCK=y
> CONFIG_CRYPTO_DEV_PADLOCK_AES=y
> # CONFIG_CRYPTO_DEV_PADLOCK_SHA is not set
> CONFIG_CRYPTO_DEV_ATMEL_I2C=y
> # CONFIG_CRYPTO_DEV_ATMEL_ECC is not set
> CONFIG_CRYPTO_DEV_ATMEL_SHA204A=y
> # CONFIG_CRYPTO_DEV_CCP is not set
> CONFIG_CRYPTO_DEV_QAT=y
> # CONFIG_CRYPTO_DEV_QAT_DH895xCC is not set
> # CONFIG_CRYPTO_DEV_QAT_C3XXX is not set
> # CONFIG_CRYPTO_DEV_QAT_C62X is not set
> CONFIG_CRYPTO_DEV_QAT_DH895xCCVF=y
> CONFIG_CRYPTO_DEV_QAT_C3XXXVF=y
> CONFIG_CRYPTO_DEV_QAT_C62XVF=y
> # CONFIG_CRYPTO_DEV_VIRTIO is not set
> # CONFIG_CRYPTO_DEV_SAFEXCEL is not set
> # CONFIG_CRYPTO_DEV_CCREE is not set
> CONFIG_CRYPTO_DEV_AMLOGIC_GXL=y
> # CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG is not set
> CONFIG_ASYMMETRIC_KEY_TYPE=y
> CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
> CONFIG_X509_CERTIFICATE_PARSER=y
> CONFIG_PKCS8_PRIVATE_KEY_PARSER=y
> # CONFIG_PKCS7_MESSAGE_PARSER is not set
> 
> #
> # Certificates for signature checking
> #
> CONFIG_SYSTEM_TRUSTED_KEYRING=y
> CONFIG_SYSTEM_TRUSTED_KEYS=""
> # CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
> # CONFIG_SECONDARY_TRUSTED_KEYRING is not set
> # CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
> # end of Certificates for signature checking
> 
> CONFIG_BINARY_PRINTF=y
> 
> #
> # Library routines
> #
> CONFIG_PACKING=y
> CONFIG_BITREVERSE=y
> CONFIG_GENERIC_STRNCPY_FROM_USER=y
> CONFIG_GENERIC_STRNLEN_USER=y
> CONFIG_GENERIC_NET_UTILS=y
> CONFIG_GENERIC_FIND_FIRST_BIT=y
> # CONFIG_CORDIC is not set
> CONFIG_PRIME_NUMBERS=y
> CONFIG_RATIONAL=y
> CONFIG_GENERIC_PCI_IOMAP=y
> CONFIG_GENERIC_IOMAP=y
> CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
> CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
> CONFIG_CRC_CCITT=y
> CONFIG_CRC16=y
> CONFIG_CRC_T10DIF=y
> CONFIG_CRC_ITU_T=y
> CONFIG_CRC32=y
> CONFIG_CRC32_SELFTEST=y
> # CONFIG_CRC32_SLICEBY8 is not set
> # CONFIG_CRC32_SLICEBY4 is not set
> CONFIG_CRC32_SARWATE=y
> # CONFIG_CRC32_BIT is not set
> # CONFIG_CRC64 is not set
> CONFIG_CRC4=y
> # CONFIG_CRC7 is not set
> CONFIG_LIBCRC32C=y
> CONFIG_CRC8=y
> CONFIG_XXHASH=y
> CONFIG_RANDOM32_SELFTEST=y
> CONFIG_842_COMPRESS=y
> CONFIG_842_DECOMPRESS=y
> CONFIG_ZLIB_INFLATE=y
> CONFIG_LZO_COMPRESS=y
> CONFIG_LZO_DECOMPRESS=y
> CONFIG_LZ4_COMPRESS=y
> CONFIG_LZ4_DECOMPRESS=y
> CONFIG_ZSTD_COMPRESS=y
> CONFIG_ZSTD_DECOMPRESS=y
> CONFIG_XZ_DEC=y
> CONFIG_XZ_DEC_X86=y
> CONFIG_XZ_DEC_POWERPC=y
> CONFIG_XZ_DEC_IA64=y
> CONFIG_XZ_DEC_ARM=y
> CONFIG_XZ_DEC_ARMTHUMB=y
> # CONFIG_XZ_DEC_SPARC is not set
> CONFIG_XZ_DEC_BCJ=y
> # CONFIG_XZ_DEC_TEST is not set
> CONFIG_DECOMPRESS_GZIP=y
> CONFIG_DECOMPRESS_BZIP2=y
> CONFIG_DECOMPRESS_LZMA=y
> CONFIG_GENERIC_ALLOCATOR=y
> CONFIG_INTERVAL_TREE=y
> CONFIG_ASSOCIATIVE_ARRAY=y
> CONFIG_HAS_IOMEM=y
> CONFIG_HAS_IOPORT_MAP=y
> CONFIG_HAS_DMA=y
> CONFIG_NEED_SG_DMA_LENGTH=y
> CONFIG_NEED_DMA_MAP_STATE=y
> CONFIG_ARCH_DMA_ADDR_T_64BIT=y
> CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED=y
> CONFIG_SWIOTLB=y
> CONFIG_DMA_CMA=y
> 
> #
> # Default contiguous memory area size:
> #
> CONFIG_CMA_SIZE_MBYTES=0
> CONFIG_CMA_SIZE_SEL_MBYTES=y
> # CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
> # CONFIG_CMA_SIZE_SEL_MIN is not set
> # CONFIG_CMA_SIZE_SEL_MAX is not set
> CONFIG_CMA_ALIGNMENT=8
> # CONFIG_DMA_API_DEBUG is not set
> CONFIG_SGL_ALLOC=y
> CONFIG_CHECK_SIGNATURE=y
> CONFIG_DQL=y
> CONFIG_GLOB=y
> CONFIG_GLOB_SELFTEST=y
> CONFIG_NLATTR=y
> CONFIG_CLZ_TAB=y
> CONFIG_IRQ_POLL=y
> CONFIG_MPILIB=y
> CONFIG_SIGNATURE=y
> CONFIG_LIBFDT=y
> CONFIG_OID_REGISTRY=y
> CONFIG_HAVE_GENERIC_VDSO=y
> CONFIG_GENERIC_GETTIMEOFDAY=y
> CONFIG_GENERIC_VDSO_TIME_NS=y
> CONFIG_FONT_SUPPORT=y
> CONFIG_FONT_8x16=y
> CONFIG_FONT_AUTOSELECT=y
> CONFIG_SG_POOL=y
> CONFIG_ARCH_HAS_PMEM_API=y
> CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=y
> CONFIG_ARCH_STACKWALK=y
> CONFIG_STACKDEPOT=y
> CONFIG_SBITMAP=y
> CONFIG_STRING_SELFTEST=y
> # end of Library routines
> 
> #
> # Kernel hacking
> #
> 
> #
> # printk and dmesg options
> #
> CONFIG_PRINTK_TIME=y
> # CONFIG_PRINTK_CALLER is not set
> CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
> CONFIG_CONSOLE_LOGLEVEL_QUIET=4
> CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
> # CONFIG_BOOT_PRINTK_DELAY is not set
> # CONFIG_DYNAMIC_DEBUG is not set
> # CONFIG_SYMBOLIC_ERRNAME is not set
> CONFIG_DEBUG_BUGVERBOSE=y
> # end of printk and dmesg options
> 
> #
> # Compile-time checks and compiler options
> #
> CONFIG_DEBUG_INFO=y
> CONFIG_DEBUG_INFO_REDUCED=y
> # CONFIG_DEBUG_INFO_SPLIT is not set
> # CONFIG_DEBUG_INFO_DWARF4 is not set
> # CONFIG_DEBUG_INFO_BTF is not set
> # CONFIG_GDB_SCRIPTS is not set
> # CONFIG_ENABLE_MUST_CHECK is not set
> CONFIG_FRAME_WARN=2048
> CONFIG_STRIP_ASM_SYMS=y
> CONFIG_READABLE_ASM=y
> CONFIG_HEADERS_INSTALL=y
> CONFIG_DEBUG_SECTION_MISMATCH=y
> CONFIG_SECTION_MISMATCH_WARN_ONLY=y
> CONFIG_STACK_VALIDATION=y
> # CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
> # end of Compile-time checks and compiler options
> 
> #
> # Generic Kernel Debugging Instruments
> #
> CONFIG_MAGIC_SYSRQ=y
> CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
> CONFIG_MAGIC_SYSRQ_SERIAL=y
> CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=""
> CONFIG_DEBUG_FS=y
> CONFIG_HAVE_ARCH_KGDB=y
> # CONFIG_KGDB is not set
> CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
> CONFIG_UBSAN=y
> CONFIG_UBSAN_TRAP=y
> # CONFIG_UBSAN_BOUNDS is not set
> CONFIG_UBSAN_MISC=y
> # CONFIG_UBSAN_SANITIZE_ALL is not set
> CONFIG_UBSAN_NO_ALIGNMENT=y
> # CONFIG_TEST_UBSAN is not set
> # end of Generic Kernel Debugging Instruments
> 
> CONFIG_DEBUG_KERNEL=y
> CONFIG_DEBUG_MISC=y
> 
> #
> # Memory Debugging
> #
> # CONFIG_PAGE_EXTENSION is not set
> CONFIG_DEBUG_PAGEALLOC=y
> CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT=y
> # CONFIG_PAGE_OWNER is not set
> # CONFIG_PAGE_POISONING is not set
> CONFIG_DEBUG_PAGE_REF=y
> # CONFIG_DEBUG_RODATA_TEST is not set
> CONFIG_GENERIC_PTDUMP=y
> # CONFIG_PTDUMP_DEBUGFS is not set
> # CONFIG_DEBUG_OBJECTS is not set
> CONFIG_HAVE_DEBUG_KMEMLEAK=y
> CONFIG_DEBUG_KMEMLEAK=y
> CONFIG_DEBUG_KMEMLEAK_MEM_POOL_SIZE=16000
> # CONFIG_DEBUG_KMEMLEAK_TEST is not set
> # CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF is not set
> # CONFIG_DEBUG_KMEMLEAK_AUTO_SCAN is not set
> # CONFIG_DEBUG_STACK_USAGE is not set
> CONFIG_SCHED_STACK_END_CHECK=y
> # CONFIG_DEBUG_VM is not set
> CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
> CONFIG_DEBUG_VIRTUAL=y
> # CONFIG_DEBUG_MEMORY_INIT is not set
> CONFIG_HAVE_ARCH_KASAN=y
> CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
> CONFIG_CC_HAS_KASAN_GENERIC=y
> CONFIG_CC_HAS_KASAN_SW_TAGS=y
> CONFIG_KASAN_STACK=0
> # end of Memory Debugging
> 
> CONFIG_DEBUG_SHIRQ=y
> 
> #
> # Debug Oops, Lockups and Hangs
> #
> # CONFIG_PANIC_ON_OOPS is not set
> CONFIG_PANIC_ON_OOPS_VALUE=0
> CONFIG_PANIC_TIMEOUT=0
> CONFIG_LOCKUP_DETECTOR=y
> CONFIG_SOFTLOCKUP_DETECTOR=y
> CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y
> CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=1
> CONFIG_HARDLOCKUP_DETECTOR_PERF=y
> CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=y
> CONFIG_HARDLOCKUP_DETECTOR=y
> # CONFIG_BOOTPARAM_HARDLOCKUP_PANIC is not set
> CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=0
> # CONFIG_DETECT_HUNG_TASK is not set
> CONFIG_WQ_WATCHDOG=y
> CONFIG_TEST_LOCKUP=y
> # end of Debug Oops, Lockups and Hangs
> 
> #
> # Scheduler Debugging
> #
> # CONFIG_SCHED_DEBUG is not set
> CONFIG_SCHED_INFO=y
> CONFIG_SCHEDSTATS=y
> # end of Scheduler Debugging
> 
> CONFIG_DEBUG_TIMEKEEPING=y
> 
> #
> # Lock Debugging (spinlocks, mutexes, etc...)
> #
> CONFIG_LOCK_DEBUGGING_SUPPORT=y
> CONFIG_PROVE_LOCKING=y
> # CONFIG_PROVE_RAW_LOCK_NESTING is not set
> CONFIG_LOCK_STAT=y
> CONFIG_DEBUG_RT_MUTEXES=y
> CONFIG_DEBUG_SPINLOCK=y
> CONFIG_DEBUG_MUTEXES=y
> CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
> CONFIG_DEBUG_RWSEMS=y
> CONFIG_DEBUG_LOCK_ALLOC=y
> CONFIG_LOCKDEP=y
> # CONFIG_DEBUG_LOCKDEP is not set
> CONFIG_DEBUG_ATOMIC_SLEEP=y
> # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> CONFIG_LOCK_TORTURE_TEST=y
> CONFIG_WW_MUTEX_SELFTEST=y
> # end of Lock Debugging (spinlocks, mutexes, etc...)
> 
> CONFIG_TRACE_IRQFLAGS=y
> CONFIG_STACKTRACE=y
> # CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
> # CONFIG_DEBUG_KOBJECT is not set
> 
> #
> # Debug kernel data structures
> #
> CONFIG_DEBUG_LIST=y
> # CONFIG_DEBUG_PLIST is not set
> CONFIG_DEBUG_SG=y
> # CONFIG_DEBUG_NOTIFIERS is not set
> CONFIG_BUG_ON_DATA_CORRUPTION=y
> # end of Debug kernel data structures
> 
> CONFIG_DEBUG_CREDENTIALS=y
> 
> #
> # RCU Debugging
> #
> CONFIG_PROVE_RCU=y
> # CONFIG_PROVE_RCU_LIST is not set
> CONFIG_TORTURE_TEST=y
> CONFIG_RCU_PERF_TEST=y
> # CONFIG_RCU_TORTURE_TEST is not set
> # CONFIG_RCU_TRACE is not set
> # CONFIG_RCU_EQS_DEBUG is not set
> # end of RCU Debugging
> 
> # CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
> # CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
> # CONFIG_LATENCYTOP is not set
> CONFIG_USER_STACKTRACE_SUPPORT=y
> CONFIG_NOP_TRACER=y
> CONFIG_HAVE_FUNCTION_TRACER=y
> CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
> CONFIG_HAVE_DYNAMIC_FTRACE=y
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
> CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
> CONFIG_HAVE_FENTRY=y
> CONFIG_HAVE_C_RECORDMCOUNT=y
> CONFIG_TRACER_MAX_TRACE=y
> CONFIG_TRACE_CLOCK=y
> CONFIG_RING_BUFFER=y
> CONFIG_EVENT_TRACING=y
> CONFIG_CONTEXT_SWITCH_TRACER=y
> CONFIG_RING_BUFFER_ALLOW_SWAP=y
> CONFIG_PREEMPTIRQ_TRACEPOINTS=y
> CONFIG_TRACING=y
> CONFIG_GENERIC_TRACER=y
> CONFIG_TRACING_SUPPORT=y
> CONFIG_FTRACE=y
> CONFIG_BOOTTIME_TRACING=y
> # CONFIG_FUNCTION_TRACER is not set
> # CONFIG_STACK_TRACER is not set
> # CONFIG_PREEMPTIRQ_EVENTS is not set
> CONFIG_IRQSOFF_TRACER=y
> # CONFIG_SCHED_TRACER is not set
> CONFIG_HWLAT_TRACER=y
> CONFIG_MMIOTRACE=y
> CONFIG_FTRACE_SYSCALLS=y
> CONFIG_TRACER_SNAPSHOT=y
> CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP=y
> CONFIG_BRANCH_PROFILE_NONE=y
> # CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
> # CONFIG_BLK_DEV_IO_TRACE is not set
> CONFIG_UPROBE_EVENTS=y
> CONFIG_DYNAMIC_EVENTS=y
> CONFIG_PROBE_EVENTS=y
> CONFIG_TRACING_MAP=y
> CONFIG_HIST_TRIGGERS=y
> # CONFIG_TRACE_EVENT_INJECT is not set
> CONFIG_TRACEPOINT_BENCHMARK=y
> CONFIG_RING_BUFFER_BENCHMARK=y
> # CONFIG_TRACE_EVAL_MAP_FILE is not set
> # CONFIG_GCOV_PROFILE_FTRACE is not set
> # CONFIG_FTRACE_STARTUP_TEST is not set
> # CONFIG_RING_BUFFER_STARTUP_TEST is not set
> # CONFIG_MMIOTRACE_TEST is not set
> # CONFIG_PREEMPTIRQ_DELAY_TEST is not set
> # CONFIG_SYNTH_EVENT_GEN_TEST is not set
> CONFIG_PROVIDE_OHCI1394_DMA_INIT=y
> # CONFIG_SAMPLES is not set
> CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
> # CONFIG_STRICT_DEVMEM is not set
> 
> #
> # x86 Debugging
> #
> CONFIG_TRACE_IRQFLAGS_SUPPORT=y
> CONFIG_EARLY_PRINTK_USB=y
> CONFIG_X86_VERBOSE_BOOTUP=y
> CONFIG_EARLY_PRINTK=y
> CONFIG_EARLY_PRINTK_DBGP=y
> CONFIG_EARLY_PRINTK_USB_XDBC=y
> # CONFIG_DEBUG_WX is not set
> CONFIG_DOUBLEFAULT=y
> CONFIG_DEBUG_TLBFLUSH=y
> CONFIG_HAVE_MMIOTRACE_SUPPORT=y
> # CONFIG_X86_DECODER_SELFTEST is not set
> # CONFIG_IO_DELAY_0X80 is not set
> CONFIG_IO_DELAY_0XED=y
> # CONFIG_IO_DELAY_UDELAY is not set
> # CONFIG_IO_DELAY_NONE is not set
> CONFIG_DEBUG_BOOT_PARAMS=y
> # CONFIG_CPA_DEBUG is not set
> # CONFIG_DEBUG_ENTRY is not set
> # CONFIG_DEBUG_NMI_SELFTEST is not set
> CONFIG_X86_DEBUG_FPU=y
> # CONFIG_PUNIT_ATOM_DEBUG is not set
> CONFIG_UNWINDER_ORC=y
> # CONFIG_UNWINDER_FRAME_POINTER is not set
> # end of x86 Debugging
> 
> #
> # Kernel Testing and Coverage
> #
> CONFIG_KUNIT=y
> CONFIG_KUNIT_DEBUGFS=y
> CONFIG_KUNIT_TEST=y
> CONFIG_KUNIT_EXAMPLE_TEST=y
> # CONFIG_NOTIFIER_ERROR_INJECTION is not set
> CONFIG_FAULT_INJECTION=y
> CONFIG_FAIL_PAGE_ALLOC=y
> CONFIG_FAIL_MAKE_REQUEST=y
> CONFIG_FAIL_IO_TIMEOUT=y
> CONFIG_FAIL_FUTEX=y
> CONFIG_FAULT_INJECTION_DEBUG_FS=y
> # CONFIG_FAIL_MMC_REQUEST is not set
> CONFIG_ARCH_HAS_KCOV=y
> CONFIG_CC_HAS_SANCOV_TRACE_PC=y
> CONFIG_KCOV=y
> # CONFIG_KCOV_ENABLE_COMPARISONS is not set
> CONFIG_KCOV_INSTRUMENT_ALL=y
> # CONFIG_RUNTIME_TESTING_MENU is not set
> CONFIG_MEMTEST=y
> # end of Kernel Testing and Coverage
> # end of Kernel hacking

> #!/bin/sh
> 
> export_top_env()
> {
> 	export suite='trinity'
> 	export testcase='trinity'
> 	export category='functional'
> 	export need_memory='300MB'
> 	export runtime=300
> 	export job_origin='/lkp-src/allot/rand/vm-snb/trinity.yaml'
> 	export queue_cmdline_keys='branch
> commit
> queue_at_least_once'
> 	export queue='validate'
> 	export testbox='vm-snb-62'
> 	export tbox_group='vm-snb'
> 	export branch='linus/master'
> 	export commit='c4dad0aab3fca0c1f0baa4cc84b6ec91b7ebf426'
> 	export kconfig='x86_64-randconfig-a016-20200727'
> 	export repeat_to=4
> 	export nr_vm=64
> 	export submit_id='5f2e2353a2f2a708a09c12ad'
> 	export job_file='/lkp/jobs/scheduled/vm-snb-62/trinity-300s-yocto-i386-minimal-20190520.cgz-c4dad0aab3fca0c1f0baa4cc84b6ec91b7ebf426-20200808-2208-1jlquyo-2.yaml'
> 	export id='e5ad1ae7f53603c4eaa919d28ce7d3e34cabed6f'
> 	export queuer_version='/lkp-src'
> 	export model='qemu-system-x86_64 -enable-kvm -cpu SandyBridge'
> 	export nr_cpu=2
> 	export memory='16G'
> 	export hdd_partitions='/dev/vda /dev/vdb /dev/vdc /dev/vdd /dev/vde /dev/vdf'
> 	export swap_partitions='/dev/vdg'
> 	export need_kconfig='CONFIG_KVM_GUEST=y'
> 	export ssh_base_port=23032
> 	export rootfs='yocto-i386-minimal-20190520.cgz'
> 	export compiler='clang-12'
> 	export enqueue_time='2020-08-08 12:00:20 +0800'
> 	export _id='5f2e2353a2f2a708a09c12ad'
> 	export _rt='/result/trinity/300s/vm-snb/yocto-i386-minimal-20190520.cgz/x86_64-randconfig-a016-20200727/clang-12/c4dad0aab3fca0c1f0baa4cc84b6ec91b7ebf426'
> 	export user='lkp'
> 	export result_root='/result/trinity/300s/vm-snb/yocto-i386-minimal-20190520.cgz/x86_64-randconfig-a016-20200727/clang-12/c4dad0aab3fca0c1f0baa4cc84b6ec91b7ebf426/3'
> 	export scheduler_version='/lkp/lkp/.src-20200805-150518'
> 	export LKP_SERVER='inn'
> 	export arch='i386'
> 	export max_uptime=1500
> 	export initrd='/osimage/yocto/yocto-i386-minimal-20190520.cgz'
> 	export bootloader_append='root=/dev/ram0
> user=lkp
> job=/lkp/jobs/scheduled/vm-snb-62/trinity-300s-yocto-i386-minimal-20190520.cgz-c4dad0aab3fca0c1f0baa4cc84b6ec91b7ebf426-20200808-2208-1jlquyo-2.yaml
> ARCH=x86_64
> kconfig=x86_64-randconfig-a016-20200727
> branch=linus/master
> commit=c4dad0aab3fca0c1f0baa4cc84b6ec91b7ebf426
> BOOT_IMAGE=/pkg/linux/x86_64-randconfig-a016-20200727/clang-12/c4dad0aab3fca0c1f0baa4cc84b6ec91b7ebf426/vmlinuz-5.7.0-rc1-00004-gc4dad0aab3fca
> max_uptime=1500
> RESULT_ROOT=/result/trinity/300s/vm-snb/yocto-i386-minimal-20190520.cgz/x86_64-randconfig-a016-20200727/clang-12/c4dad0aab3fca0c1f0baa4cc84b6ec91b7ebf426/3
> LKP_SERVER=inn
> selinux=0
> debug
> apic=debug
> sysrq_always_enabled
> rcupdate.rcu_cpu_stall_timeout=100
> net.ifnames=0
> printk.devkmsg=on
> panic=-1
> softlockup_panic=1
> nmi_watchdog=panic
> oops=panic
> load_ramdisk=2
> prompt_ramdisk=0
> drbd.minor_count=8
> systemd.log_level=err
> ignore_loglevel
> console=tty0
> earlyprintk=ttyS0,115200
> console=ttyS0,115200
> vga=normal
> rw'
> 	export modules_initrd='/pkg/linux/x86_64-randconfig-a016-20200727/clang-12/c4dad0aab3fca0c1f0baa4cc84b6ec91b7ebf426/modules.cgz'
> 	export bm_initrd='/osimage/pkg/yocto-i386-minimal-20190520.cgz/trinity-i386.cgz'
> 	export lkp_initrd='/osimage/user/lkp/lkp-i386.cgz'
> 	export site='inn'
> 	export LKP_CGI_PORT=80
> 	export LKP_CIFS_PORT=139
> 	export schedule_notify_address=
> 	export queue_at_least_once=1
> 	export kernel='/pkg/linux/x86_64-randconfig-a016-20200727/clang-12/c4dad0aab3fca0c1f0baa4cc84b6ec91b7ebf426/vmlinuz-5.7.0-rc1-00004-gc4dad0aab3fca'
> 	export dequeue_time='2020-08-08 12:00:26 +0800'
> 	export job_initrd='/lkp/jobs/scheduled/vm-snb-62/trinity-300s-yocto-i386-minimal-20190520.cgz-c4dad0aab3fca0c1f0baa4cc84b6ec91b7ebf426-20200808-2208-1jlquyo-2.cgz'
> 
> 	[ -n "$LKP_SRC" ] ||
> 	export LKP_SRC=/lkp/${user:-lkp}/src
> }
> 
> run_job()
> {
> 	echo $$ > $TMP/run-job.pid
> 
> 	. $LKP_SRC/lib/http.sh
> 	. $LKP_SRC/lib/job.sh
> 	. $LKP_SRC/lib/env.sh
> 
> 	export_top_env
> 
> 	run_monitor $LKP_SRC/monitors/wrapper kmsg
> 	run_monitor $LKP_SRC/monitors/wrapper heartbeat
> 	run_monitor $LKP_SRC/monitors/wrapper meminfo
> 	run_monitor $LKP_SRC/monitors/wrapper oom-killer
> 	run_monitor $LKP_SRC/monitors/plain/watchdog
> 
> 	run_test $LKP_SRC/tests/wrapper trinity
> }
> 
> extract_stats()
> {
> 	export stats_part_begin=
> 	export stats_part_end=
> 
> 	$LKP_SRC/stats/wrapper kmsg
> 	$LKP_SRC/stats/wrapper meminfo
> 
> 	$LKP_SRC/stats/wrapper time trinity.time
> 	$LKP_SRC/stats/wrapper dmesg
> 	$LKP_SRC/stats/wrapper kmsg
> 	$LKP_SRC/stats/wrapper last_state
> 	$LKP_SRC/stats/wrapper stderr
> 	$LKP_SRC/stats/wrapper time
> }
> 
> "$@"



- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

