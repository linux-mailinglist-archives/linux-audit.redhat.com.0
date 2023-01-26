Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEB767D1B1
	for <lists+linux-audit@lfdr.de>; Thu, 26 Jan 2023 17:33:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674750836;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bMosRqKvrZ+PUCh/1C+XMtSmpFfltBvkGAZQ+lK5mlc=;
	b=KP4dV61F9D+uICHL3ln5OD255Xu8FzB4eyVgI1x70jJTpcbNHIfDPJrXT8t39lnF26Iuf5
	sXdifhqiYfxqL9LBwtCXhwH+NKlQD2XrsPXHPeLHdDy2VvNUbRW6/eQA5kb+NHGVmapruB
	nckb784K7QF3+75rZEu5LRTvUOLm5Pw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-2oK4ulsHPN6xdH1ul6nFkg-1; Thu, 26 Jan 2023 11:33:54 -0500
X-MC-Unique: 2oK4ulsHPN6xdH1ul6nFkg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFDE41C07551;
	Thu, 26 Jan 2023 16:33:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1C3102166B26;
	Thu, 26 Jan 2023 16:33:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E862719465A3;
	Thu, 26 Jan 2023 16:33:49 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C1CFC194658C for <linux-audit@listman.corp.redhat.com>;
 Thu, 26 Jan 2023 11:15:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6CE592026D76; Thu, 26 Jan 2023 11:15:54 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 651122026D4B
 for <linux-audit@redhat.com>; Thu, 26 Jan 2023 11:15:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 46D67857F82
 for <linux-audit@redhat.com>; Thu, 26 Jan 2023 11:15:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172]) by
 relay.mimecast.com with ESMTP id us-mta-222-aRhJMwwCOVCkaUjigmRqAA-1; Thu,
 26 Jan 2023 06:15:50 -0500
X-MC-Unique: aRhJMwwCOVCkaUjigmRqAA-1
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33988C14;
 Thu, 26 Jan 2023 03:16:31 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.10.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 402733F71E;
 Thu, 26 Jan 2023 03:15:40 -0800 (PST)
Date: Thu, 26 Jan 2023 11:15:37 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Jules Maselbas <jmaselbas@kalray.eu>
Subject: Re: [RFC PATCH v2 11/31] kvx: Add atomic/locking headers
Message-ID: <Y9Jg2QkbLUoYhimB@FVFF77S0Q05N>
References: <20230120141002.2442-1-ysionneau@kalray.eu>
 <20230120141002.2442-12-ysionneau@kalray.eu>
 <Y8qw2MaCJZzu3Ows@FVFF77S0Q05N>
 <20230126095720.GF5952@tellis.lin.mbt.kalray.eu>
MIME-Version: 1.0
In-Reply-To: <20230126095720.GF5952@tellis.lin.mbt.kalray.eu>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
 Marc =?utf-8?B?UG91bGhpw6hz?= <dkm@kataplop.net>, linux-doc@vger.kernel.org,
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Jules,

On Thu, Jan 26, 2023 at 10:57:20AM +0100, Jules Maselbas wrote:
> Hi Mark,
> 
> On Fri, Jan 20, 2023 at 03:18:48PM +0000, Mark Rutland wrote:
> > On Fri, Jan 20, 2023 at 03:09:42PM +0100, Yann Sionneau wrote:
> > > +#define ATOMIC64_RETURN_OP(op, c_op)					\
> > > +static inline long arch_atomic64_##op##_return(long i, atomic64_t *v)	\
> > > +{									\
> > > +	long new, old, ret;						\
> > > +									\
> > > +	do {								\
> > > +		old = v->counter;					\
> > 
> > This should be arch_atomic64_read(v), in order to avoid the potential for the
> > compiler to replay the access and introduce ABA races and other such problems.
> Thanks for the suggestion, this will be into v3.
> 
> > For details, see:
> > 
> >   https://lore.kernel.org/lkml/Y70SWXHDmOc3RhMd@osiris/
> >   https://lore.kernel.org/lkml/Y71LoCIl+IFdy9D8@FVFF77S0Q05N/
> > 
> > I see that the generic 32-bit atomic code suffers from that issue, and we
> > should fix it.
> I took a look at the generic 32-bit atomic, but I am unsure if this
> needs to be done for both the SMP and non-SMP implementations. But I
> can send a first patch and we can discuss from there.

Sounds good to me; thanks!

[...]

> > > +static inline int arch_atomic_add_return(int i, atomic_t *v)
> > > +{
> > > +	int new, old, ret;
> > > +
> > > +	do {
> > > +		old = v->counter;
> > 
> > Likewise, arch_atomic64_read(v) here.
> ack, this will bt arch_atomic_read(v) here since this is not atomic64_t
> here.

Ah, yes, my bad!

Thanks,
Mark.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

