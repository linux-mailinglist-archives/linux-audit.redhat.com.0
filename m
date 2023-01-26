Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BA93967D1AF
	for <lists+linux-audit@lfdr.de>; Thu, 26 Jan 2023 17:33:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674750834;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2kyjVXhUIoZTuwtN8dYtHBO9LzAeMaVz+GbyI49skZE=;
	b=YBzsfD+zjHtBTnWusOaq91TLQooDq8W7iOwyByJdqvdfU4OievMGoIMOo6Njw4+UiC/vI+
	Wjj8ZpUibeL4odjWMP8hT3H2PLYcDkphyzDUW+XDfZfDkS2yCDWwumzJULqRP1gJbcNTfx
	G4/FdrBmpYakct4EruJYRJcyjNGJXzM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-602-ePjYAxBdOB6qIM2G04psLg-1; Thu, 26 Jan 2023 11:33:53 -0500
X-MC-Unique: ePjYAxBdOB6qIM2G04psLg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF55E29A9D4A;
	Thu, 26 Jan 2023 16:33:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 35AE92026D76;
	Thu, 26 Jan 2023 16:33:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 96B071946A4B;
	Thu, 26 Jan 2023 16:33:46 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D98AF194658C for <linux-audit@listman.corp.redhat.com>;
 Thu, 26 Jan 2023 09:57:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 93F1540C200C; Thu, 26 Jan 2023 09:57:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BB8940C2064
 for <linux-audit@redhat.com>; Thu, 26 Jan 2023 09:57:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 539112801E47
 for <linux-audit@redhat.com>; Thu, 26 Jan 2023 09:57:27 +0000 (UTC)
Received: from fx303.security-mail.net (mxout.security-mail.net
 [85.31.212.46]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-302-R7fG-bmIPiGYDI8J1PI3ag-1; Thu, 26 Jan 2023 04:57:25 -0500
X-MC-Unique: R7fG-bmIPiGYDI8J1PI3ag-1
Received: from localhost (fx303.security-mail.net [127.0.0.1])
 by fx303.security-mail.net (Postfix) with ESMTP id F377130F7B5
 for <linux-audit@redhat.com>; Thu, 26 Jan 2023 10:57:23 +0100 (CET)
Received: from fx303 (fx303.security-mail.net [127.0.0.1]) by
 fx303.security-mail.net (Postfix) with ESMTP id 4B88F30F6F4; Thu, 26 Jan
 2023 10:57:23 +0100 (CET)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx303.security-mail.net (Postfix) with ESMTPS id 600CC30EF2D; Thu, 26 Jan
 2023 10:57:22 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 1EF2427E0493; Thu, 26 Jan 2023
 10:57:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id F0A6127E0491; Thu, 26 Jan 2023 10:57:21 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 JRZseFWEf3ef; Thu, 26 Jan 2023 10:57:21 +0100 (CET)
Received: from tellis.lin.mbt.kalray.eu (unknown [192.168.36.206]) by
 zimbra2.kalray.eu (Postfix) with ESMTPSA id 9A5BE27E048E; Thu, 26 Jan 2023
 10:57:21 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <12187.63d24e82.597fe.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu F0A6127E0491
Date: Thu, 26 Jan 2023 10:57:20 +0100
From: Jules Maselbas <jmaselbas@kalray.eu>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [RFC PATCH v2 11/31] kvx: Add atomic/locking headers
Message-ID: <20230126095720.GF5952@tellis.lin.mbt.kalray.eu>
References: <20230120141002.2442-1-ysionneau@kalray.eu>
 <20230120141002.2442-12-ysionneau@kalray.eu> <Y8qw2MaCJZzu3Ows@FVFF77S0Q05N>
MIME-Version: 1.0
In-Reply-To: <Y8qw2MaCJZzu3Ows@FVFF77S0Q05N>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ALTERMIMEV2_out: done
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Mark,

On Fri, Jan 20, 2023 at 03:18:48PM +0000, Mark Rutland wrote:
> On Fri, Jan 20, 2023 at 03:09:42PM +0100, Yann Sionneau wrote:
> > Add common headers (atomic, bitops, barrier and locking) for basic
> > kvx support.
> > 
> > Co-developed-by: Clement Leger <clement@clement-leger.fr>
> > Signed-off-by: Clement Leger <clement@clement-leger.fr>
> > Co-developed-by: Jules Maselbas <jmaselbas@kalray.eu>
> > Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
> > Co-developed-by: Julian Vetter <jvetter@kalray.eu>
> > Signed-off-by: Julian Vetter <jvetter@kalray.eu>
> > Co-developed-by: Julien Villette <jvillette@kalray.eu>
> > Signed-off-by: Julien Villette <jvillette@kalray.eu>
> > Co-developed-by: Yann Sionneau <ysionneau@kalray.eu>
> > Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
> > ---
> > 
> > Notes:
> >     V1 -> V2:
> >      - use {READ,WRITE}_ONCE for arch_atomic64_{read,set}
> >      - use asm-generic/bitops/atomic.h instead of __test_and_*_bit
> >      - removed duplicated includes
> >      - rewrite xchg and cmpxchg in C using builtins for acswap insn
> 
> Thanks for those changes. I see one issue below (instantiated a few times), but
> other than that this looks good to me.
> 
> [...]
> 
> > +#define ATOMIC64_RETURN_OP(op, c_op)					\
> > +static inline long arch_atomic64_##op##_return(long i, atomic64_t *v)	\
> > +{									\
> > +	long new, old, ret;						\
> > +									\
> > +	do {								\
> > +		old = v->counter;					\
> 
> This should be arch_atomic64_read(v), in order to avoid the potential for the
> compiler to replay the access and introduce ABA races and other such problems.
Thanks for the suggestion, this will be into v3.

> For details, see:
> 
>   https://lore.kernel.org/lkml/Y70SWXHDmOc3RhMd@osiris/
>   https://lore.kernel.org/lkml/Y71LoCIl+IFdy9D8@FVFF77S0Q05N/
> 
> I see that the generic 32-bit atomic code suffers from that issue, and we
> should fix it.
I took a look at the generic 32-bit atomic, but I am unsure if this
needs to be done for both the SMP and non-SMP implementations. But I
can send a first patch and we can discuss from there.

> > +		new = old c_op i;					\
> > +		ret = arch_cmpxchg(&v->counter, old, new);		\
> > +	} while (ret != old);						\
> > +									\
> > +	return new;							\
> > +}
> > +
> > +#define ATOMIC64_OP(op, c_op)						\
> > +static inline void arch_atomic64_##op(long i, atomic64_t *v)		\
> > +{									\
> > +	long new, old, ret;						\
> > +									\
> > +	do {								\
> > +		old = v->counter;					\
> 
> Likewise, arch_atomic64_read(v) here.
ack

> > +		new = old c_op i;					\
> > +		ret = arch_cmpxchg(&v->counter, old, new);		\
> > +	} while (ret != old);						\
> > +}
> > +
> > +#define ATOMIC64_FETCH_OP(op, c_op)					\
> > +static inline long arch_atomic64_fetch_##op(long i, atomic64_t *v)	\
> > +{									\
> > +	long new, old, ret;						\
> > +									\
> > +	do {								\
> > +		old = v->counter;					\
> 
> Likewise, arch_atomic64_read(v) here.
ack

> > +		new = old c_op i;					\
> > +		ret = arch_cmpxchg(&v->counter, old, new);		\
> > +	} while (ret != old);						\
> > +									\
> > +	return old;							\
> > +}
> > +
> > +#define ATOMIC64_OPS(op, c_op)						\
> > +	ATOMIC64_OP(op, c_op)						\
> > +	ATOMIC64_RETURN_OP(op, c_op)					\
> > +	ATOMIC64_FETCH_OP(op, c_op)
> > +
> > +ATOMIC64_OPS(and, &)
> > +ATOMIC64_OPS(or, |)
> > +ATOMIC64_OPS(xor, ^)
> > +ATOMIC64_OPS(add, +)
> > +ATOMIC64_OPS(sub, -)
> > +
> > +#undef ATOMIC64_OPS
> > +#undef ATOMIC64_FETCH_OP
> > +#undef ATOMIC64_OP
> > +
> > +static inline int arch_atomic_add_return(int i, atomic_t *v)
> > +{
> > +	int new, old, ret;
> > +
> > +	do {
> > +		old = v->counter;
> 
> Likewise, arch_atomic64_read(v) here.
ack, this will bt arch_atomic_read(v) here since this is not atomic64_t
here.


Thanks
-- Jules





--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

