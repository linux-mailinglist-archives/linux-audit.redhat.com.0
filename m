Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F6565ED3D
	for <lists+linux-audit@lfdr.de>; Thu,  5 Jan 2023 14:38:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672925928;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=f0vKzCo63PxihTc5DJ+3VaLutNkcgvNjbp6QRnJQobs=;
	b=WQscQFvYlEzqFOgGJHtO0i/1CvuCWPn6RkEC/dMEmgeCGX9Od4xW1N2VBijWLgOZWCG2Ih
	1aIbX0HfrnDVo2RHPbLLcXu7Z7hFmJHpskojQ5TrK1l8xFUhlZNR3jNgaVyjRDmpd2E8RG
	venKpne9SOZJu4fuqLLZGS3gT9rpJ0g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-XHGKjJ7ePSW_KD_GsoTCTA-1; Thu, 05 Jan 2023 08:38:45 -0500
X-MC-Unique: XHGKjJ7ePSW_KD_GsoTCTA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5DF33C1485B;
	Thu,  5 Jan 2023 13:38:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 29D514014EBE;
	Thu,  5 Jan 2023 13:38:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BBAA01946A6D;
	Thu,  5 Jan 2023 13:38:39 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B08801946586 for <linux-audit@listman.corp.redhat.com>;
 Thu,  5 Jan 2023 12:05:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7615C2026D68; Thu,  5 Jan 2023 12:05:57 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E1BD2026D4B
 for <linux-audit@redhat.com>; Thu,  5 Jan 2023 12:05:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F897101A521
 for <linux-audit@redhat.com>; Thu,  5 Jan 2023 12:05:57 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-461-XwSRfJ5NMpKH6qXOPxaetQ-1; Thu, 05 Jan 2023 07:05:53 -0500
X-MC-Unique: XwSRfJ5NMpKH6qXOPxaetQ-1
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id BB1615C0153;
 Thu,  5 Jan 2023 07:05:52 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Thu, 05 Jan 2023 07:05:52 -0500
X-ME-Sender: <xms:H722Y-iPa3z3j_Obn9xJ3y4iLVHhLZYRWE53ebwI868UqtTNDK5plw>
 <xme:H722Y_DR7L7Ik-e0GNVxK4qRWiDzyZlVGLcd9_UeECqwuSW1v_o48jnzUAXib3fI1
 l2hOQJUDcEf27Bnh80>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjeekgdefjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
 ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
 gvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeufeeh
 udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:IL22Y2FbE7Dg5EIyTdQbXO2BylVr2xsUQ8dgioEgrBp0aBvl5yIzAw>
 <xmx:IL22Y3R6pvyQ83oUVYNDJvXQYrV_MCh96rREY2TwUokJi-LRFkGQew>
 <xmx:IL22Y7wfGtxDIPBbXqwUsBIkc8fSVT82W3nBfU_1b_qETo-u8EOO8g>
 <xmx:IL22YzhCDyHE_6V7W5RQnzsUyD5S1ryM9MpvwA09NHFl1ioeyc63Vg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E6BA2B60086; Thu,  5 Jan 2023 07:05:51 -0500 (EST)
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1185-g841157300a-fm-20221208.002-g84115730
Mime-Version: 1.0
Message-Id: <5b69db0b-9eed-42ce-8e93-4b656022433f@app.fastmail.com>
In-Reply-To: <20230105104019.GA7446@tellis.lin.mbt.kalray.eu>
References: <20230103164359.24347-1-ysionneau@kalray.eu>
 <7c531595-e987-422b-bcf7-48ad0ba49ce6@app.fastmail.com>
 <20230105104019.GA7446@tellis.lin.mbt.kalray.eu>
Date: Thu, 05 Jan 2023 13:05:32 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jules Maselbas" <jmaselbas@kalray.eu>
Subject: Re: [RFC PATCH 00/25] Upstream kvx Linux port
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 5, 2023, at 11:40, Jules Maselbas wrote:
> On Wed, Jan 04, 2023 at 04:58:25PM +0100, Arnd Bergmann wrote:
>> On Tue, Jan 3, 2023, at 17:43, Yann Sionneau wrote:

>> I commented on the syscall patch directly, I think it's
>> important to stop using the deprecated syscalls as soon
>> as possible to avoid having dependencies in too many
>> libc binaries. Almost everything else can be changed
>> easily as you get closer to upstream inclusion.
>> 
>> I did not receive most of the other patches as I'm
>> not subscribed to all the mainline lists. For future 
>> submissions, can you add the linux-arch list to Cc for
>> all patches?
>
> We misused get_maintainers.pl, running it on each patch instead
> of using it on the whole series. next time every one will be in
> copy of every patch in the series and including linux-arch.

Be careful not to make the list too long though, there is
usually a limit of 1024 characters for the entire Cc list,
above this your mails may get dropped by the mailing lists.

>> Reading the rest of the series through lore.kernel.org,
>> most of the comments I have are for improvements that
>> you may find valuable rather than serious mistakes:
>> 
>> - the {copy_to,copy_from,clear}_user functions are
>>   well worth optimizing better than the byte-at-a-time
>>   version you have, even just a C version built around
>>   your __get_user/__put_user inline asm should help, and
>>   could be added to lib/usercopy.c.
>
> right, we are using memcpy for {copy_to,copy_from}_user_page
> which has a simple optimized version introduced in
> (kvx: Add some library functions).
> I wonder if it is possible to do the same for copy_*_user functions.

copy_from_user_page() is only about managing cache aliases,
not user access, and it's not used anywhere in the fast
path, so it's a bit different.

arch/arm/lib/copy_template.S has an example for how
you can share the same assembler implementation between
memcpy() and copy_from_user(), but it's not very
intuitive.

The tricky bit with copy_from_user() is the partial copy
that relies on copying the exact amount of data that can
be accessed including the last byte before the end of
the mapping, and returning the correct count of non-copied
bytes.

If you want a C version, you can probably use the
copy_from_kernel_nofault implementation mm/maccess.c
as a template, but have to add code for the correct
return value.

    Arnd

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

