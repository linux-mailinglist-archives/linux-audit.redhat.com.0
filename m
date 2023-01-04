Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7519B65DFDF
	for <lists+linux-audit@lfdr.de>; Wed,  4 Jan 2023 23:21:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672870915;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UHRsRLEUIMKgPNQ5ej9qqO87kztpHUUKiW/YjlNEksA=;
	b=athBToBehpv0tv0e/OL3iUfaMspmKUFBxIZry67xDNjTIgZquIRY1BxSxniSEQ3wFb77Pf
	jEok4P4jb9e/m+ErqiBB4R6lK4guvGWHPEIu+bf2sKjFOUVKQ09guVZj2pixz7A3j+IuPs
	23aquaPh/ObMV9+H1xE6Oozd7i9eIhI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-148-bH5LxI51O-6fm7DtbgdSWA-1; Wed, 04 Jan 2023 17:21:54 -0500
X-MC-Unique: bH5LxI51O-6fm7DtbgdSWA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 649B580234E;
	Wed,  4 Jan 2023 22:21:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D85AC1415303;
	Wed,  4 Jan 2023 22:21:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D7D2E19465A0;
	Wed,  4 Jan 2023 22:21:40 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 550331946589 for <linux-audit@listman.corp.redhat.com>;
 Wed,  4 Jan 2023 16:05:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 12A6049BB6A; Wed,  4 Jan 2023 16:05:59 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B31C4021CA
 for <linux-audit@redhat.com>; Wed,  4 Jan 2023 16:05:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E15C1801779
 for <linux-audit@redhat.com>; Wed,  4 Jan 2023 16:05:58 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-116-_D2eOpzfOYKSAacaVaEztw-1; Wed, 04 Jan 2023 11:05:57 -0500
X-MC-Unique: _D2eOpzfOYKSAacaVaEztw-1
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 284635C00D1;
 Wed,  4 Jan 2023 10:58:45 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Wed, 04 Jan 2023 10:58:45 -0500
X-ME-Sender: <xms:NKK1Y48HslmbYS4XfyvkV25JDSKz4gqEZbPhEXvALJOvcqVVorgYrQ>
 <xme:NKK1YwvOYWU86IT641Xjgz28D53RJaLRPWwjvOCq1FuTvXSRIj9DM-9LxgP0a6zpv
 RWXh9d7Rchms20DgzA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjeeigdekvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
 ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
 gvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeufeeh
 udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:NKK1Y-D0Rn03uTnG6oMJtNULtppKVKQLRwrnCdfDvZq1rkRA1aAVAg>
 <xmx:NKK1Y4fvmlqny8-TiW5EIb1Km8tOPFA7Fqn4qJNuwbm4wf6rLLbgkw>
 <xmx:NKK1Y9MK4-XTCquhXJiLE_n3OfFxMW22ddTI_UZsemVu5efG4lpnyQ>
 <xmx:NaK1YztseASQahJ66RWxLZYnhH-1ueAQdizsGnk9d2-oLHJ_jMdhJw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 43F24B6008D; Wed,  4 Jan 2023 10:58:44 -0500 (EST)
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1185-g841157300a-fm-20221208.002-g84115730
Mime-Version: 1.0
Message-Id: <7c531595-e987-422b-bcf7-48ad0ba49ce6@app.fastmail.com>
In-Reply-To: <20230103164359.24347-1-ysionneau@kalray.eu>
References: <20230103164359.24347-1-ysionneau@kalray.eu>
Date: Wed, 04 Jan 2023 16:58:25 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Yann Sionneau" <ysionneau@kalray.eu>
Subject: Re: [RFC PATCH 00/25] Upstream kvx Linux port
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Wed, 04 Jan 2023 22:21:38 +0000
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
 Ard Biesheuvel <ardb@kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>,
 Marc Zyngier <maz@kernel.org>, Thomas Costis <tcostis@kalray.eu>,
 Jonathan Corbet <corbet@lwn.net>, Jonathan Borne <jborne@kalray.eu>,
 Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Jean-Christophe Pince <jcpince@gmail.com>, Waiman Long <longman@redhat.com>,
 Clement Leger <clement.leger@bootlin.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 linux-pm@vger.kernel.org, Samuel Jones <sjones@kalray.eu>,
 Boqun Feng <boqun.feng@gmail.com>, Guillaume Thouvenin <gthouvenin@kalray.eu>,
 Julian Vetter <jvetter@kalray.eu>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Julien Hascoet <jhascoet@kalray.eu>, Jason Baron <jbaron@akamai.com>,
 Rob Herring <robh+dt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
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
 Palmer Dabbelt <palmer@dabbelt.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>, Jiri Olsa <jolsa@kernel.org>,
 Kieran Bingham <kbingham@kernel.org>, bpf@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 3, 2023, at 17:43, Yann Sionneau wrote:
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

Thanks for posting these, I had been wondering about the
state of the port. Overall this looks really nice, I can
see that you and the team have looked at other ports
and generally made the right decisions.

I commented on the syscall patch directly, I think it's
important to stop using the deprecated syscalls as soon
as possible to avoid having dependencies in too many
libc binaries. Almost everything else can be changed
easily as you get closer to upstream inclusion.

I did not receive most of the other patches as I'm
not subscribed to all the mainline lists. For future 
submissions, can you add the linux-arch list to Cc for
all patches?

Reading the rest of the series through lore.kernel.org,
most of the comments I have are for improvements that
you may find valuable rather than serious mistakes:

- the {copy_to,copy_from,clear}_user functions are
  well worth optimizing better than the byte-at-a-time
  version you have, even just a C version built around
  your __get_user/__put_user inline asm should help, and
  could be added to lib/usercopy.c.

- The __raw_{read,write}{b,w,l,q} helpers should
  normally be defined as inline asm instead of
  volatile pointer dereferences, I've seen cases where
  the compiler ends up splitting the access or does
  other things you may not want on MMIO areas.

- I would recomment implementing HAVE_ARCH_VMAP_STACK
  as well as IRQ stacks, both of these help to
  avoid data corruption from stack overflow that you
  will eventually run into.

- You use qspinlock as the only available spinlock
  implementation, but only support running on a
  single cluster of 16 cores. It may help to use
  the generic ticket spinlock instead, or leave it
  as a Kconfig option, in particular since you only
  have the emulated xchg16() atomic for qspinlock.

- Your defconfig file enables CONFIG_EMBEDDED, which
  in turn enables CONFIG_EXPERT. This is probably
  not what you want, so better turn off both of these.

- The GENERIC_CALIBRATE_DELAY should not be necessary
  since you have a get_cycles() based delay loop.
  Just set loops_per_jiffy to the correct value based
  on the frequency of the cycle counter, to save
  a little time during boot and get a more accurate
  delay loop.

    Arnd

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

