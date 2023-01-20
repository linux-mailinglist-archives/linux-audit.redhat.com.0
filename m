Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BF125675D7F
	for <lists+linux-audit@lfdr.de>; Fri, 20 Jan 2023 20:03:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674241402;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+xXvr5hYydZRuYuM2zbdI0L70jryTQ0Gs0kHI8Md3aA=;
	b=BP9TJ4NKekxXNrHxyhQWEl8PQ4YL/r6hR0hn+j9HvDqhdVz2kvPjxYKz4qc350Tq+AJcA4
	2+L9ooIb46o1BGVGLmsaFujlUdkxlcgL5g14OEcdO3TJTeRwcfXwXLHaecMqUaO/4Oug+L
	e6T3W/hsAl4w2D/A97vL9egP/cuKAZY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-sJAXBQx-Mt2uOkolV6rIDA-1; Fri, 20 Jan 2023 14:03:19 -0500
X-MC-Unique: sJAXBQx-Mt2uOkolV6rIDA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF454281724D;
	Fri, 20 Jan 2023 19:02:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 91DDE14152F6;
	Fri, 20 Jan 2023 19:02:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7B0021946A72;
	Fri, 20 Jan 2023 19:02:55 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0642519465B6 for <linux-audit@listman.corp.redhat.com>;
 Fri, 20 Jan 2023 14:53:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CA8042166B2C; Fri, 20 Jan 2023 14:53:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C3C2D2166B2A
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 14:53:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A6418030D7
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 14:53:25 +0000 (UTC)
Received: from fx405.security-mail.net (smtpout140.security-mail.net
 [85.31.212.145]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-628-eyzl6HjBOKCV9FpZi_oxqg-1; Fri, 20 Jan 2023 09:53:21 -0500
X-MC-Unique: eyzl6HjBOKCV9FpZi_oxqg-1
Received: from localhost (fx405.security-mail.net [127.0.0.1])
 by fx405.security-mail.net (Postfix) with ESMTP id 8B0F9335CDF
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 15:53:20 +0100 (CET)
Received: from fx405 (fx405.security-mail.net [127.0.0.1]) by
 fx405.security-mail.net (Postfix) with ESMTP id 1A3B7335CAA; Fri, 20 Jan
 2023 15:53:20 +0100 (CET)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx405.security-mail.net (Postfix) with ESMTPS id F1088335B7A; Fri, 20 Jan
 2023 15:53:18 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 7269927E043A; Fri, 20 Jan 2023
 15:53:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 52FB427E0437; Fri, 20 Jan 2023 15:53:18 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 PJVPWxUQy6bp; Fri, 20 Jan 2023 15:53:18 +0100 (CET)
Received: from tellis.lin.mbt.kalray.eu (unknown [192.168.36.206]) by
 zimbra2.kalray.eu (Postfix) with ESMTPSA id 057AA27E0430; Fri, 20 Jan 2023
 15:53:18 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <d912.63caaade.ac33d.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 52FB427E0437
Date: Fri, 20 Jan 2023 15:53:16 +0100
From: Jules Maselbas <jmaselbas@kalray.eu>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH v2 09/31] kvx: Add build infrastructure
Message-ID: <20230120145316.GA4155@tellis.lin.mbt.kalray.eu>
References: <20230120141002.2442-1-ysionneau@kalray.eu>
 <20230120141002.2442-10-ysionneau@kalray.eu>
 <aa4d68b2-b5b5-4c17-a44f-7c6db443ea4c@app.fastmail.com>
MIME-Version: 1.0
In-Reply-To: <aa4d68b2-b5b5-4c17-a44f-7c6db443ea4c@app.fastmail.com>
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
X-Mailman-Approved-At: Fri, 20 Jan 2023 19:02:49 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, "Jason
 A . Donenfeld" <Jason@zx2c4.com>,
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
 Linux-Arch <linux-arch@vger.kernel.org>,
 Jean-Christophe Pince <jcpince@gmail.com>, Waiman Long <longman@redhat.com>,
 Bharat Bhushan <bbhushan2@marvell.com>, Qi Liu <liuqi115@huawei.com>,
 Alexey Dobriyan <adobriyan@gmail.com>, Luc Michel <lmichel@kalray.eu>,
 John Garry <john.garry@huawei.com>, Ashley Lesdalons <alesdalons@kalray.eu>,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Yann Sionneau <ysionneau@kalray.eu>, Boqun Feng <boqun.feng@gmail.com>,
 Guillaume Thouvenin <gthouvenin@kalray.eu>, Julian Vetter <jvetter@kalray.eu>,
 Nicholas Piggin <npiggin@gmail.com>,
 Shaokun Zhang <zhangshaokun@hisilicon.com>, Rob Herring <robh+dt@kernel.org>,
 Bibo Mao <maobibo@loongson.cn>, Paul Walmsley <paul.walmsley@sifive.com>,
 WANG Xuerui <git@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>,
 Marius Gligor <mgligor@kalray.eu>, Janosch Frank <frankja@linux.ibm.com>,
 Julien Villette <jvillette@kalray.eu>, linux-audit@redhat.com,
 Christian Brauner <brauner@kernel.org>,
 Benjamin Mugnier <mugnier.benjamin@gmail.com>,
 Vincent Chardon <vincent.chardon@elsys-design.com>,
 Guillaume Missonnier <gmissonnier@kalray.eu>, Oleg Nesterov <oleg@redhat.com>,
 Eric Paris <eparis@redhat.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 20, 2023 at 03:39:22PM +0100, Arnd Bergmann wrote:
> On Fri, Jan 20, 2023, at 15:09, Yann Sionneau wrote:
> >      - Fix clean target raising an error from gcc (LIBGCC)
> 
> I had not noticed this on v1 but:
> 
> > +# Link with libgcc to get __div* builtins.
> > +LIBGCC	:= $(shell $(CC) $(DEFAULT_OPTS) --print-libgcc-file-name)
> 
> It's better to copy the bits of libgcc that you actually need
> than to include the whole thing. The kernel is in a weird
It was initialy using KCONFIG_CFLAGS which do not contains valid options
when invoking the clean target.

I am not exactly sure what's needed by gcc for --print-libgcc-file-name,
my guess is that only the -march option matters, I will double check
internally with compiler peoples.

> state that is neither freestanding nor the normal libc based
> environment, so we generally want full control over what is
> used. This is particularly important for 32-bit architectures
> that do not want the 64-bit division, but there are probably
> enough other cases as well.
> 
>      Arnd
> 
> 
> 
> 




--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

