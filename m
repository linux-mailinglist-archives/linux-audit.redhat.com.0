Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F0765ED3E
	for <lists+linux-audit@lfdr.de>; Thu,  5 Jan 2023 14:38:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672925930;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WWZeWNWS8NYCOsg6gMvWmYiGDZIrDtYb/mVNow8Y+8o=;
	b=FTccWIAvILklGnSvdvBarD/m2ffLqO0ukukSYGeanWgodtwiNLFJhQaxxzWFnKtrT7P7iq
	eJSyinDPqpIaHgx35oqm8VX0RflLV92sIUD1FBC2KimbXER3tXidDQP6XSkpiqSEKy4QXj
	asEwP4QtYjVEkgcporvFEAgPtnc0QNQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-SIp-pSdrP-mADohgPUZfDg-1; Thu, 05 Jan 2023 08:38:46 -0500
X-MC-Unique: SIp-pSdrP-mADohgPUZfDg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B60543C1485C;
	Thu,  5 Jan 2023 13:38:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D86FB2026D4B;
	Thu,  5 Jan 2023 13:38:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9536619465B3;
	Thu,  5 Jan 2023 13:38:39 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 264F81946586 for <linux-audit@listman.corp.redhat.com>;
 Thu,  5 Jan 2023 10:45:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 187E12166B31; Thu,  5 Jan 2023 10:45:07 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 10E132166B30
 for <linux-audit@redhat.com>; Thu,  5 Jan 2023 10:45:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E4B8A857F40
 for <linux-audit@redhat.com>; Thu,  5 Jan 2023 10:45:06 +0000 (UTC)
Received: from fx308.security-mail.net (smtpout30.security-mail.net
 [85.31.212.38]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-539-TM_XvGtrOfqIY-woTSYMyg-1; Thu, 05 Jan 2023 05:45:03 -0500
X-MC-Unique: TM_XvGtrOfqIY-woTSYMyg-1
Received: from localhost (localhost [127.0.0.1])
 by fx308.security-mail.net (Postfix) with ESMTP id 95F8675A755
 for <linux-audit@redhat.com>; Thu,  5 Jan 2023 11:40:21 +0100 (CET)
Received: from fx308 (localhost [127.0.0.1]) by fx308.security-mail.net
 (Postfix) with ESMTP id 7006775A3E7; Thu,  5 Jan 2023 11:40:21 +0100 (CET)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx308.security-mail.net (Postfix) with ESMTPS id 0F44375AB2B; Thu,  5 Jan
 2023 11:40:21 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id D52FF27E0373; Thu,  5 Jan 2023
 11:40:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id B47A227E02E4; Thu,  5 Jan 2023 11:40:20 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 h9vZft-QceM0; Thu,  5 Jan 2023 11:40:20 +0100 (CET)
Received: from tellis.lin.mbt.kalray.eu (unknown [192.168.36.206]) by
 zimbra2.kalray.eu (Postfix) with ESMTPSA id 5854D27E02AC; Thu,  5 Jan 2023
 11:40:20 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <141b8.63b6a915.e31d.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu B47A227E02E4
Date: Thu, 5 Jan 2023 11:40:19 +0100
From: Jules Maselbas <jmaselbas@kalray.eu>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH 00/25] Upstream kvx Linux port
Message-ID: <20230105104019.GA7446@tellis.lin.mbt.kalray.eu>
References: <20230103164359.24347-1-ysionneau@kalray.eu>
 <7c531595-e987-422b-bcf7-48ad0ba49ce6@app.fastmail.com>
MIME-Version: 1.0
In-Reply-To: <7c531595-e987-422b-bcf7-48ad0ba49ce6@app.fastmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ALTERMIMEV2_out: done
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mailman-Approved-At: Thu, 05 Jan 2023 13:38:37 +0000
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
 Ard Biesheuvel <ardb@kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>,
 Marc Zyngier <maz@kernel.org>, Thomas Costis <tcostis@kalray.eu>,
 Jonathan Corbet <corbet@lwn.net>, Jonathan Borne <jborne@kalray.eu>,
 Aneesh Kumar <aneesh.kumar@linux.ibm.com>, Samuel Jones <sjones@kalray.eu>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Jean-Christophe Pince <jcpince@gmail.com>, Waiman Long <longman@redhat.com>,
 Clement Leger <clement.leger@bootlin.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 linux-pm@vger.kernel.org, Yann Sionneau <ysionneau@kalray.eu>,
 Boqun Feng <boqun.feng@gmail.com>, Guillaume Thouvenin <gthouvenin@kalray.eu>,
 Julian Vetter <jvetter@kalray.eu>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Julien Hascoet <jhascoet@kalray.eu>, Jason Baron <jbaron@akamai.com>,
 Rob Herring <robh+dt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Namhyung Kim <namhyung@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Josh Poimboeuf <jpoimboe@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Julien Villette <jvillette@kalray.eu>,
 Christian Brauner <brauner@kernel.org>,
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

On Wed, Jan 04, 2023 at 04:58:25PM +0100, Arnd Bergmann wrote:
> On Tue, Jan 3, 2023, at 17:43, Yann Sionneau wrote:
> > This patch series adds support for the kv3-1 CPU architecture of the kvx family
> > found in the Coolidge (aka MPPA3-80) SoC of Kalray.
> >
> > This is an RFC, since kvx support is not yet upstreamed into gcc/binutils,
> > therefore this patch series cannot be merged into Linux for now.
> >
> > The goal is to have preliminary reviews and to fix problems early.
> >
> > The Kalray VLIW processor family (kvx) has the following features:
> > * 32/64 bits execution mode
> > * 6-issue VLIW architecture
> > * 64 x 64bits general purpose registers
> > * SIMD instructions
> > * little-endian
> > * deep learning co-processor
> 
> Thanks for posting these, I had been wondering about the
> state of the port. Overall this looks really nice, I can
> see that you and the team have looked at other ports
> and generally made the right decisions.

Thank you and all for the reviews. We are currently going
through every remarks and we are trying to do our best to
send a new patch series with everything addressed.

> I commented on the syscall patch directly, I think it's
> important to stop using the deprecated syscalls as soon
> as possible to avoid having dependencies in too many
> libc binaries. Almost everything else can be changed
> easily as you get closer to upstream inclusion.
> 
> I did not receive most of the other patches as I'm
> not subscribed to all the mainline lists. For future 
> submissions, can you add the linux-arch list to Cc for
> all patches?

We misused get_maintainers.pl, running it on each patch instead
of using it on the whole series. next time every one will be in
copy of every patch in the series and including linux-arch.

> Reading the rest of the series through lore.kernel.org,
> most of the comments I have are for improvements that
> you may find valuable rather than serious mistakes:
> 
> - the {copy_to,copy_from,clear}_user functions are
>   well worth optimizing better than the byte-at-a-time
>   version you have, even just a C version built around
>   your __get_user/__put_user inline asm should help, and
>   could be added to lib/usercopy.c.

right, we are using memcpy for {copy_to,copy_from}_user_page
which has a simple optimized version introduced in
(kvx: Add some library functions).
I wonder if it is possible to do the same for copy_*_user functions.

> - The __raw_{read,write}{b,w,l,q} helpers should
>   normally be defined as inline asm instead of
>   volatile pointer dereferences, I've seen cases where
>   the compiler ends up splitting the access or does
>   other things you may not want on MMIO areas.
>
> - I would recomment implementing HAVE_ARCH_VMAP_STACK
>   as well as IRQ stacks, both of these help to
>   avoid data corruption from stack overflow that you
>   will eventually run into.
> 
> - You use qspinlock as the only available spinlock
>   implementation, but only support running on a
>   single cluster of 16 cores. It may help to use
>   the generic ticket spinlock instead, or leave it
>   as a Kconfig option, in particular since you only
>   have the emulated xchg16() atomic for qspinlock.
> 
> - Your defconfig file enables CONFIG_EMBEDDED, which
>   in turn enables CONFIG_EXPERT. This is probably
>   not what you want, so better turn off both of these.
> 
> - The GENERIC_CALIBRATE_DELAY should not be necessary
>   since you have a get_cycles() based delay loop.
>   Just set loops_per_jiffy to the correct value based
>   on the frequency of the cycle counter, to save
>   a little time during boot and get a more accurate
>   delay loop.
>
Ack !

   Jules




--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

