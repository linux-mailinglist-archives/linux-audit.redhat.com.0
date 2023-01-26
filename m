Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E6967D1B3
	for <lists+linux-audit@lfdr.de>; Thu, 26 Jan 2023 17:34:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674750838;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6l8iQ3O2lAgIK8upBzXY5L1otp/edAUrLem3ut2eJ2Y=;
	b=WBCGCNSLbkCLgjKw0sGNin1xjQLnqgYyxXEKOrpIoZblGWxWzy1CB6x+DF27mxuvNbIIBK
	wARZE75AHYztQ0dCdhk+uyeJKqKWEYCuoVCOMaXTtWXn7/EtJsFDYe5VStvlxFD534uqoD
	euHy1/gAIp7GM+9HykFZSAVzeWcAHk8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-UZ3e8TgKM9KUFuKCWtqEjw-1; Thu, 26 Jan 2023 11:33:55 -0500
X-MC-Unique: UZ3e8TgKM9KUFuKCWtqEjw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0C9B857A81;
	Thu, 26 Jan 2023 16:33:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 567A2401530E;
	Thu, 26 Jan 2023 16:33:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AC4571946A51;
	Thu, 26 Jan 2023 16:33:46 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8D8FE194658C for <linux-audit@listman.corp.redhat.com>;
 Thu, 26 Jan 2023 16:10:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 813F62166B32; Thu, 26 Jan 2023 16:10:40 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 793AB2166B29
 for <linux-audit@redhat.com>; Thu, 26 Jan 2023 16:10:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 577E919705AB
 for <linux-audit@redhat.com>; Thu, 26 Jan 2023 16:10:40 +0000 (UTC)
Received: from fx409.security-mail.net (smtpout140.security-mail.net
 [85.31.212.149]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-553-Hw2gzfkIMRqwLwh9KG5TcA-1; Thu, 26 Jan 2023 11:10:38 -0500
X-MC-Unique: Hw2gzfkIMRqwLwh9KG5TcA-1
Received: from localhost (fx409.security-mail.net [127.0.0.1])
 by fx409.security-mail.net (Postfix) with ESMTP id 0EDDD349704
 for <linux-audit@redhat.com>; Thu, 26 Jan 2023 17:10:37 +0100 (CET)
Received: from fx409 (fx409.security-mail.net [127.0.0.1]) by
 fx409.security-mail.net (Postfix) with ESMTP id 5FEDB3495F6; Thu, 26 Jan
 2023 17:10:36 +0100 (CET)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx409.security-mail.net (Postfix) with ESMTPS id 42F9E3496BD; Thu, 26 Jan
 2023 17:10:35 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 0E32B27E0492; Thu, 26 Jan 2023
 17:10:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id E364B27E0431; Thu, 26 Jan 2023 17:10:34 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 DTQUInwcUDo5; Thu, 26 Jan 2023 17:10:34 +0100 (CET)
Received: from tellis.lin.mbt.kalray.eu (unknown [192.168.36.206]) by
 zimbra2.kalray.eu (Postfix) with ESMTPSA id 8E3C527E0374; Thu, 26 Jan 2023
 17:10:34 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <4f4e.63d2a5fb.40271.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu E364B27E0431
Date: Thu, 26 Jan 2023 17:10:33 +0100
From: Jules Maselbas <jmaselbas@kalray.eu>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [RFC PATCH v2 02/31] Documentation: Add binding for
 kalray,kv3-1-core-intc
Message-ID: <20230126161032.GH5952@tellis.lin.mbt.kalray.eu>
References: <20230120141002.2442-1-ysionneau@kalray.eu>
 <20230120141002.2442-3-ysionneau@kalray.eu>
 <d4d998ee-1532-c896-df25-195ec9c72e3f@linaro.org>
MIME-Version: 1.0
In-Reply-To: <d4d998ee-1532-c896-df25-195ec9c72e3f@linaro.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, "Jason
 A. Donenfeld" <Jason@zx2c4.com>,
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

On Sun, Jan 22, 2023 at 12:44:46PM +0100, Krzysztof Kozlowski wrote:
> On 20/01/2023 15:09, Yann Sionneau wrote:
> > From: Jules Maselbas <jmaselbas@kalray.eu>
> 
> Use subject prefixes matching the subsystem (which you can get for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching).
This will be fixed, sorry for the inconvenience.

> 
> > 
> > Add documentation for `kalray,kv3-1-core-intc` binding.
> > 
> > Co-developed-by: Jules Maselbas <jmaselbas@kalray.eu>
> > Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
> > Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
> > ---
> > 
> > Notes:
> >     V1 -> V2: new patch
> > 
> >  .../kalray,kv3-1-core-intc.yaml               | 46 +++++++++++++++++++
> >  1 file changed, 46 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/kalray,kv3-1-core-intc.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/kalray,kv3-1-core-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/kalray,kv3-1-core-intc.yaml
> > new file mode 100644
> > index 000000000000..1e3d0593173a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/kalray,kv3-1-core-intc.yaml
> > @@ -0,0 +1,46 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/interrupt-controller/kalray,kv3-1-core-intc#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Kalray kv3-1 Core Interrupt Controller
> > +
> > +description: |
> > +  The Kalray Core Interrupt Controller is tightly integrated in each kv3 core
> > +  present in the Coolidge SoC.
> > +
> > +  It provides the following features:
> > +  - 32 independent interrupt sources
> > +  - 2-bit configurable priority level
> > +  - 2-bit configurable ownership level
> > +
> > +allOf:
> > +  - $ref: /schemas/interrupt-controller.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: kalray,kv3-1-core-intc
> 
> Blank line between each of these,
Ack

> > +  "#interrupt-cells":
> > +    const: 1
> > +    description:
> > +      The IRQ number.
> > +  reg:
> > +    maxItems: 0
> 
> ??? No way... What's this?
This (per CPU) interrupt controller is not memory mapped at all, it is
controlled and configured through system registers.

I do not have found existing .yaml bindings for such devices, only the
file snps,archs-intc.txt has something similar.

I do not know what is the best way to represent such devices in the
device-tree.  Any suggestions are welcome.

> 
> > +  "kalray,intc-nr-irqs":
> 
> Drop quotes.
> 
> > +    description: Number of irqs handled by the controller.
> 
> Why this is variable per board? Why do you need it ?
This property is not even used in our device-tree, this will be removed
from the documentation and from the driver as well.

> > +
> > +required:
> > +  - compatible
> > +  - "#interrupt-cells"
> > +  - interrupt-controller
> 
> missing additionalProperties: false
> 
> This binding looks poor, like you started from something odd. Please
> don't. Take the newest reviewed binding or better example-schema and use
> it to build yours. This would solve several trivial mistakes and style
> issues.
I am starting over from the example-schema.

> > +
> > +examples:
> > +  - |
> > +    intc: interrupt-controller {
> 
> What's the IO address space?
As said above, this is not a memory mapped device, but is accessed
through system registers.

Thanks,
-- Jules




--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

