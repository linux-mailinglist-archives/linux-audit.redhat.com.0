Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DA765D501
	for <lists+linux-audit@lfdr.de>; Wed,  4 Jan 2023 15:07:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672841255;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WKtiTTo2QRyHD/VzJkf1WWnyBw0haGnNqEfJgciKvbU=;
	b=hohnzZhgWUptC56ITQPQ6t+zoPiYvz4vcH3YOH/BX0oMotbULL0tNZXG4cTx2ws7wGMRpL
	nDDg64R1IOoHlrO1y5cMurR1zRI1tJOHAXnuvsSwvrmEmpC1Ess9EmDyRY7utdQii5T9ZI
	Js4LEfvco2xvU4wmK/ZKclmZXSzGLPY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-185-MWKl37VdOPa60bbwtdjlWQ-1; Wed, 04 Jan 2023 09:07:32 -0500
X-MC-Unique: MWKl37VdOPa60bbwtdjlWQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D19118E0A62;
	Wed,  4 Jan 2023 14:07:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E87BC492B07;
	Wed,  4 Jan 2023 14:07:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 53B16194706A;
	Wed,  4 Jan 2023 14:07:21 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 207C71946587 for <linux-audit@listman.corp.redhat.com>;
 Tue,  3 Jan 2023 20:53:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 02F05140EBF6; Tue,  3 Jan 2023 20:53:02 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF966140EBF4
 for <linux-audit@redhat.com>; Tue,  3 Jan 2023 20:53:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D42062A59550
 for <linux-audit@redhat.com>; Tue,  3 Jan 2023 20:53:01 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-317-DNoAsiRNNX-dYhhDPT_wOw-1; Tue, 03 Jan 2023 15:52:58 -0500
X-MC-Unique: DNoAsiRNNX-dYhhDPT_wOw-1
Received: by mail-il1-f169.google.com with SMTP id d10so18641596ilc.12;
 Tue, 03 Jan 2023 12:52:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TcjxuWhsew0S4JMMZ0LVIr9mYr0ZItiOrBsIyKBjzxA=;
 b=i2ODx9/G6XJvRyclQHerQAsYeRmG9TMdBkGwdYA1aE6WdLWMK9ka2oJE4GvQ7iMNR8
 X+VEbKFxmJQvgHCIrsylUUVBJyLhgsYjlTs1zVGD9Ba+izTfaBB8/VjLkIuPy/ck7oTn
 ZQ4Y3xH4XqiFoKJiVUs7hYRpYLZFjWX77ah7zzlX9LjPWimyJ34v3EsOUGrwI1ggr5ze
 ejqqUj7aqu+6k9BJ7cYKG9vlXJ1E2o39vIwtNpDNolN6SrF9EOZSya7vK5RoZSDqzhCd
 Ia4wfGOzJRbUaKYm/NY27OClhXj1xZ0WDkgCfS+PMnr0Rsuyqgn+Du2XNOAPp9U6gsjU
 HBhw==
X-Gm-Message-State: AFqh2kqMvpZNpS+BD3q5Ts4qWqIc3u5TbtEUwWdj6lUBz63Zhjt4ectz
 CyGMiRsRFmpjlsUVHzRIbQ==
X-Google-Smtp-Source: AMrXdXs7CLCkBhA2bAs8+otIJJ87HLmOu2iBxk7dmL/ZdUhdNLgBmJbpCAkIQKJL5QLEGLa5kGxn6A==
X-Received: by 2002:a05:6e02:549:b0:306:d1b4:f3c7 with SMTP id
 i9-20020a056e02054900b00306d1b4f3c7mr25689876ils.20.1672779176867; 
 Tue, 03 Jan 2023 12:52:56 -0800 (PST)
Received: from robh_at_kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 c24-20020a023b18000000b00388b6508ec8sm9836486jaa.115.2023.01.03.12.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 12:52:56 -0800 (PST)
Received: (nullmailer pid 3961459 invoked by uid 1000);
 Tue, 03 Jan 2023 20:52:50 -0000
Date: Tue, 3 Jan 2023 14:52:50 -0600
From: Rob Herring <robh@kernel.org>
To: Yann Sionneau <ysionneau@kalray.eu>
Subject: Re: [RFC PATCH 00/25] Upstream kvx Linux port
Message-ID: <20230103205250.GB3942221-robh@kernel.org>
References: <20230103164359.24347-1-ysionneau@kalray.eu>
MIME-Version: 1.0
In-Reply-To: <20230103164359.24347-1-ysionneau@kalray.eu>
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
 =?UTF-8?Q?Marc_Poulhi=C3=A8s?= <dkm@kataplop.net>, linux-doc@vger.kernel.org,
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
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Jean-Christophe Pince <jcpince@gmail.com>, Waiman Long <longman@redhat.com>,
 Clement Leger <clement.leger@bootlin.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 Samuel Jones <sjones@kalray.eu>, Boqun Feng <boqun.feng@gmail.com>,
 Guillaume Thouvenin <gthouvenin@kalray.eu>, Julian Vetter <jvetter@kalray.eu>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Julien Hascoet <jhascoet@kalray.eu>, Jason Baron <jbaron@akamai.com>,
 Nick Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Josh Poimboeuf <jpoimboe@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Julien Villette <jvillette@kalray.eu>, Jules Maselbas <jmaselbas@kalray.eu>,
 Christian Brauner <brauner@kernel.org>,
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 03, 2023 at 05:43:34PM +0100, Yann Sionneau wrote:
> This patch series adds support for the kv3-1 CPU architecture of the kvx family
> found in the Coolidge (aka MPPA3-80) SoC of Kalray.
> 
> This is an RFC, since kvx support is not yet upstreamed into gcc/binutils,
> therefore this patch series cannot be merged into Linux for now.
> 
> The goal is to have preliminary reviews and to fix problems early.
> 
> The Kalray VLIW processor family (kvx) has the following features:
> * 32/64 bits execution mode
> * 6-issue VLIW architecture
> * 64 x 64bits general purpose registers
> * SIMD instructions
> * little-endian
> * deep learning co-processor
> 
> Kalray kv3-1 core which is the third of the kvx family is embedded in Kalray
> Coolidge SoC currently used on K200 and K200-LP boards.
> 
> The Coolidge SoC contains 5 clusters each of which is made of:
> * 4MiB of on-chip memory (SMEM)
> * 1 dedicated safety/security core (kv3-1 core).
> * 16 PEs (Processing Elements) (kv3-1 cores).
> * 16 Co-processors (one per PE)
> * 2 Crypto accelerators
> 
> The Coolidge SoC contains the following features:
> * 5 Clusters
> * 2 100G Ethernet controllers
> * 8 PCIe GEN4 controllers (Root Complex and Endpoint capable)
> * 2 USB 2.0 controllers
> * 1 Octal SPI-NOR flash controller
> * 1 eMMC controller
> * 3 Quad SPI controllers
> * 6 UART
> * 5 I2C controllers (3 of which are SMBus capable)
> * 4 CAN controllers
> * 1 OTP memory
> 
> A kvx toolchain can be built using:
> # install dependencies: texinfo bison flex libgmp-dev libmpc-dev libmpfr-dev
> $ git clone https://github.com/kalray/build-scripts
> $ cd build-scripts
> $ source last.refs
> $ ./build-kvx-xgcc.sh output
> 
> The kvx toolchain will be installed in the "output" directory.
> 
> A buildroot image (kernel+rootfs) and toolchain can be built using:
> $ git clone -b coolidge-for-upstream https://github.com/kalray/buildroot
> $ cd buildroot
> $ make O=build_kvx kvx_defconfig
> $ make O=build_kvx
> 
> The vmlinux image can be found in buildroot/build_kvx/images/vmlinux.
> 
> If you are just interested in building the Linux kernel with no rootfs you can
> just do this with the kvx-elf- toolchain:
> $ make ARCH=kvx O=build_kvx CROSS_COMPILE=kvx-elf- default_defconfig
> $ make ARCH=kvx O=build_kvx CROSS_COMPILE=kvx-elf- -j$(($(nproc) + 1))
> 
> The vmlinux ELF can be run with qemu by doing:
> # install dependencies: ninja pkg-config libglib-2.0-dev cmake libfdt-dev libpixman-1-dev zlib1g-dev
> $ git clone https://github.com/kalray/qemu-builder
> $ cd qemu-builder
> $ git submodule update --init
> $ make -j$(($(nproc) + 1))
> $ ./qemu-system-kvx -m 1024 -nographic -kernel <path/to/vmlinux>
> 
> Yann Sionneau (25):
>   Documentation: kvx: Add basic documentation
>   kvx: Add ELF-related definitions
>   kvx: Add build infrastructure
>   kvx: Add CPU definition headers
>   kvx: Add atomic/locking headers
>   kvx: Add other common headers
>   kvx: Add boot and setup routines
>   kvx: Add exception/interrupt handling
>   kvx: irqchip: Add support for irq controllers
>   kvx: Add process management
>   kvx: Add memory management
>   kvx: Add system call support
>   kvx: Add signal handling support
>   kvx: Add ELF relocations and module support
>   kvx: Add misc common routines
>   kvx: Add some library functions
>   kvx: Add multi-processor (SMP) support
>   kvx: Add kvx default config file
>   kvx: power: scall poweroff driver
>   kvx: gdb: add kvx related gdb helpers
>   kvx: Add support for ftrace
>   kvx: Add support for jump labels
>   kvx: Add debugging related support
>   kvx: Add support for CPU Perf Monitors
>   kvx: Add support for cpuinfo

You should strip this series down to just what's needed to boot. You 
don't need the last 7 patches at least.

Rob

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

