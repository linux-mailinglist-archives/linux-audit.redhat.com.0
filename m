Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4AC67D1B0
	for <lists+linux-audit@lfdr.de>; Thu, 26 Jan 2023 17:33:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674750836;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gOmhrTxZzOI2SnbrMrILtK8X3rM9kb/S1inVt3cB63A=;
	b=YSPAXb5ElcxVH61KuEi7+LxzTNUhRrXSl47v7JbTujmD4WNtx9AiwgXEoYeGAMXYZT+TRB
	aNLxLQCx22i5DrN3lR6Rq0aYUcfzVAtmivTVCEXjLmERcYFv3pgJLV7lWtVJf6r3aCa9dD
	k65CJdtRfd17EEU6BWaAFnUCLtao1vs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-X8ut4oR4MAqDOMuyZZIZMw-1; Thu, 26 Jan 2023 11:33:54 -0500
X-MC-Unique: X8ut4oR4MAqDOMuyZZIZMw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0433857F41;
	Thu, 26 Jan 2023 16:33:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 757CC14171BB;
	Thu, 26 Jan 2023 16:33:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 58B6C19465B3;
	Thu, 26 Jan 2023 16:33:46 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3CE00194658C for <linux-audit@listman.corp.redhat.com>;
 Thu, 26 Jan 2023 11:20:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4F5B439D92; Thu, 26 Jan 2023 11:20:04 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4754C51E5
 for <linux-audit@redhat.com>; Thu, 26 Jan 2023 11:20:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E597F802D1A
 for <linux-audit@redhat.com>; Thu, 26 Jan 2023 11:20:03 +0000 (UTC)
Received: from fx403.security-mail.net (smtpout140.security-mail.net
 [85.31.212.143]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-593-b6y-QOgwNfmGH7VHPd3pzA-1; Thu, 26 Jan 2023 06:20:02 -0500
X-MC-Unique: b6y-QOgwNfmGH7VHPd3pzA-1
Received: from localhost (localhost [127.0.0.1])
 by fx403.security-mail.net (Postfix) with ESMTP id E55CE5A29B7
 for <linux-audit@redhat.com>; Thu, 26 Jan 2023 12:20:00 +0100 (CET)
Received: from fx403 (localhost [127.0.0.1]) by fx403.security-mail.net
 (Postfix) with ESMTP id 9A8DB5A2BA8; Thu, 26 Jan 2023 12:20:00 +0100 (CET)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx403.security-mail.net (Postfix) with ESMTPS id 61FD45A2C93; Thu, 26 Jan
 2023 12:19:59 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 14ABE27E0494; Thu, 26 Jan 2023
 12:19:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id DF47D27E0492; Thu, 26 Jan 2023 12:19:58 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 pfciJ45Q2s0p; Thu, 26 Jan 2023 12:19:58 +0100 (CET)
Received: from tellis.lin.mbt.kalray.eu (unknown [192.168.36.206]) by
 zimbra2.kalray.eu (Postfix) with ESMTPSA id 54C0E27E0491; Thu, 26 Jan 2023
 12:19:58 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <15758.63d261df.603f0.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu DF47D27E0492
Date: Thu, 26 Jan 2023 12:19:57 +0100
From: Jules Maselbas <jmaselbas@kalray.eu>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [RFC PATCH v2 11/31] kvx: Add atomic/locking headers
Message-ID: <20230126111957.GG5952@tellis.lin.mbt.kalray.eu>
References: <20230120141002.2442-1-ysionneau@kalray.eu>
 <20230120141002.2442-12-ysionneau@kalray.eu> <Y8qw2MaCJZzu3Ows@FVFF77S0Q05N>
 <20230126095720.GF5952@tellis.lin.mbt.kalray.eu>
MIME-Version: 1.0
In-Reply-To: <20230126095720.GF5952@tellis.lin.mbt.kalray.eu>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ALTERMIMEV2_out: done
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 26, 2023 at 10:57:20AM +0100, Jules Maselbas wrote:
> Hi Mark,
...

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
I took a second look at this and I think we are not doing the right
thing, we do not need to defined arch_atomic_add_return at all since
we are including the generic atomic right after, which will define
the macro arch_atomic_add_return as generic_atomic_add_return

> 
> Thanks
> -- Jules
> 
> 
> 
> 
> 
> 
> 
> 
> 




--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

