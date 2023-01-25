Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F39E067D1B2
	for <lists+linux-audit@lfdr.de>; Thu, 26 Jan 2023 17:33:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674750836;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=D11qA2tcmPaqXJCFHktqCWyouEK17Z2gojMLbSDJ2Ss=;
	b=HrUDhQETkOqx2iD8Ylavy+eAXZtLiyNaJyTIQLTF56YAjIgUJ0nZfvUq0dgDL3oG7kyzmk
	EAX4jioI8lMBxq3soCBeCUglqMgRt+OnO4EzSDpwLdOxrEFxFn6y7XZI87Gv13A38GmJNV
	y779G4DG7vw3Wuw0LmQBt3t9GcTxjBI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-UtRjrLzQMJOCM5xT4AQMww-1; Thu, 26 Jan 2023 11:33:55 -0500
X-MC-Unique: UtRjrLzQMJOCM5xT4AQMww-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1CEA29A9D4F;
	Thu, 26 Jan 2023 16:33:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 55EFE40C2064;
	Thu, 26 Jan 2023 16:33:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BFFE31946A5E;
	Thu, 26 Jan 2023 16:33:46 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B2E0E194658C for <linux-audit@listman.corp.redhat.com>;
 Wed, 25 Jan 2023 21:55:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7A0682166B29; Wed, 25 Jan 2023 21:55:26 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 717802166B26
 for <linux-audit@redhat.com>; Wed, 25 Jan 2023 21:55:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53C333C01DE8
 for <linux-audit@redhat.com>; Wed, 25 Jan 2023 21:55:26 +0000 (UTC)
Received: from fx403.security-mail.net (smtpout140.security-mail.net
 [85.31.212.143]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-551-5_YnvB0LNISuCjmxkX-c3w-1; Wed, 25 Jan 2023 16:55:24 -0500
X-MC-Unique: 5_YnvB0LNISuCjmxkX-c3w-1
Received: from localhost (localhost [127.0.0.1])
 by fx403.security-mail.net (Postfix) with ESMTP id 8E72E579241
 for <linux-audit@redhat.com>; Wed, 25 Jan 2023 22:55:22 +0100 (CET)
Received: from fx403 (localhost [127.0.0.1]) by fx403.security-mail.net
 (Postfix) with ESMTP id 14D4C578EE2; Wed, 25 Jan 2023 22:55:22 +0100 (CET)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx403.security-mail.net (Postfix) with ESMTPS id 194FF578B2C; Wed, 25 Jan
 2023 22:55:21 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id D2EB627E0493; Wed, 25 Jan 2023
 22:55:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id AEC3727E0491; Wed, 25 Jan 2023 22:55:20 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 si6Lv1AzzjtE; Wed, 25 Jan 2023 22:55:20 +0100 (CET)
Received: from tellis.lin.mbt.kalray.eu (unknown [192.168.36.206]) by
 zimbra2.kalray.eu (Postfix) with ESMTPSA id 4AA5127E0461; Wed, 25 Jan 2023
 22:55:20 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <13e79.63d1a549.170d1.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu AEC3727E0491
Date: Wed, 25 Jan 2023 22:55:19 +0100
From: Jules Maselbas <jmaselbas@kalray.eu>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [RFC PATCH v2 12/31] kvx: Add other common headers
Message-ID: <20230125215519.GE5952@tellis.lin.mbt.kalray.eu>
References: <20230120141002.2442-1-ysionneau@kalray.eu>
 <20230120141002.2442-13-ysionneau@kalray.eu> <Y8qlOpYgDefMPqWH@zx2c4.com>
MIME-Version: 1.0
In-Reply-To: <Y8qlOpYgDefMPqWH@zx2c4.com>
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
X-Mailman-Approved-At: Thu, 26 Jan 2023 16:33:45 +0000
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
 Samuel Jones <sjones@kalray.eu>, Ingo Molnar <mingo@redhat.com>,
 linux-arch@vger.kernel.org, Jean-Christophe Pince <jcpince@gmail.com>,
 Waiman Long <longman@redhat.com>, Bharat Bhushan <bbhushan2@marvell.com>,
 Qi Liu <liuqi115@huawei.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 Luc Michel <lmichel@kalray.eu>, John Garry <john.garry@huawei.com>,
 Ashley Lesdalons <alesdalons@kalray.eu>, Albert Ou <aou@eecs.berkeley.edu>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Yann Sionneau <ysionneau@kalray.eu>, Boqun Feng <boqun.feng@gmail.com>,
 Guillaume Thouvenin <gthouvenin@kalray.eu>, Julian Vetter <jvetter@kalray.eu>,
 Nick Piggin <npiggin@gmail.com>, Shaokun Zhang <zhangshaokun@hisilicon.com>,
 Rob Herring <robh+dt@kernel.org>, Bibo Mao <maobibo@loongson.cn>,
 Paul Walmsley <paul.walmsley@sifive.com>, WANG Xuerui <git@xen0n.name>,
 Thomas Gleixner <tglx@linutronix.de>, Marius Gligor <mgligor@kalray.eu>,
 Janosch Frank <frankja@linux.ibm.com>, Julien Villette <jvillette@kalray.eu>,
 linux-audit@redhat.com, Christian Brauner <brauner@kernel.org>,
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Jason,

On Fri, Jan 20, 2023 at 03:29:14PM +0100, Jason A. Donenfeld wrote:
> Hi Yann,
> 
> On Fri, Jan 20, 2023 at 03:09:43PM +0100, Yann Sionneau wrote:
> > +#include <linux/random.h>
> > +#include <linux/version.h>
> > +
> > +extern unsigned long __stack_chk_guard;
> > +
> > +/*
> > + * Initialize the stackprotector canary value.
> > + *
> > + * NOTE: this must only be called from functions that never return,
> > + * and it must always be inlined.
> > + */
> > +static __always_inline void boot_init_stack_canary(void)
> > +{
> > +	unsigned long canary;
> > +
> > +	/* Try to get a semi random initial value. */
> > +	get_random_bytes(&canary, sizeof(canary));
> > +	canary ^= LINUX_VERSION_CODE;
> > +	canary &= CANARY_MASK;
> > +
> > +	current->stack_canary = canary;
> > +	__stack_chk_guard = current->stack_canary;
> > +}
> 
> 
> You should rewrite this as:
> 
>     current->stack_canary = get_random_canary();
>     __stack_chk_guard = current->stack_canary;
> 
> which is what the other archs all now do. (They didn't used to, and this
> looks like it's simply based on older code.)
Thanks for the suggestion, this will be into v3

> > +#define get_cycles get_cycles
> > +
> > +#include <asm/sfr.h>
> > +#include <asm-generic/timex.h>
> > +
> > +static inline cycles_t get_cycles(void)
> > +{
> > +	return kvx_sfr_get(PM0);
> > +}
> 
> Glad to see this CPU has a cycle counter. Out of curiosity, what is
> its resolution?
This cpu has 4 performance monitor (PM), the first one is reserved to
count cycles, and it is cycle accurate.

> Also, related, does this CPU happen to have a "RDRAND"-like instruction?
I didn't knew about the RDRAND insruction, but no this CPU do not have
an instruction like that.

> (I don't know anything about kvx or even what it is.)
It's a VLIW core, a bit like Itanium, there are currently not publicly
available documentation.  We have started a discussion internally at
Kalray to share more information regarding this CPU and its ABI.

A very crude instruction listing can be found in our fork of
gdb-binutils: https://raw.githubusercontent.com/kalray/binutils/binutils-2_35_2/coolidge/opcodes/kv3-opc.c

Best regards,
-- Jules





--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

