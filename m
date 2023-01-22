Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C02A867847B
	for <lists+linux-audit@lfdr.de>; Mon, 23 Jan 2023 19:22:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674498123;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BCaZUJFHVAkn+wjpmATqmhCwOrkP+ZmMby0Nb8LzR80=;
	b=EHv6X7cE0SzNazFXcUswUh0WmvQeLgHn/BuIMCDHkE7b5iGZedBLzPILFYtqEL7P2Ay756
	jydq43eW/0BdZakFVCUTTXF2Ej1TaK3+OrBOA4BOp6ebFK0b6HmbOaLamHlTEtqyQK3W19
	hfu2ZeDedJXC4IVzVhzGcG+uMl3xBO8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118-mST7V0FjMjuJO5YRWtYf1A-1; Mon, 23 Jan 2023 13:22:00 -0500
X-MC-Unique: mST7V0FjMjuJO5YRWtYf1A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 652633C31DE0;
	Mon, 23 Jan 2023 18:21:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C34B21121333;
	Mon, 23 Jan 2023 18:21:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 617C2194658D;
	Mon, 23 Jan 2023 18:21:48 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A02CB1946586 for <linux-audit@listman.corp.redhat.com>;
 Sun, 22 Jan 2023 11:49:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5CE4EC15BAE; Sun, 22 Jan 2023 11:49:43 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 54B7BC15BAD
 for <linux-audit@redhat.com>; Sun, 22 Jan 2023 11:49:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B71F802BF3
 for <linux-audit@redhat.com>; Sun, 22 Jan 2023 11:49:43 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-534-OhoGCjqMPkmd-b0vmqv9gg-1; Sun, 22 Jan 2023 06:49:37 -0500
X-MC-Unique: OhoGCjqMPkmd-b0vmqv9gg-1
Received: by mail-wr1-f50.google.com with SMTP id d14so4778155wrr.9
 for <linux-audit@redhat.com>; Sun, 22 Jan 2023 03:49:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L18XUoVuVYI0pnqHwuAZ/a/gl46rC1ac5Z5pGu4tjjA=;
 b=Gi7wVKnocvZqxp7rX5qM/4tpRkxEmZ/gfI4vEaDrTGPj686VqUs77i3R1Nnw7SWJmJ
 h4sig0V//HGZa6vAGhacFrpIBZIVpdQqyl4y2WXe+OX2mR+wEw88fe7n+nqL6BtxvfIh
 NxtEAbuiVs7VvOAlPg5jjs+tCXD9M5kwosNe3d6YnfLxHsEyo6rc9EKuWaQWOynV/245
 z5hGJXBQW/Rt+lTKQmkRyKmgNfs4vGlQ6hOkMv+KUEhGijygIbY0G+dc6NzXZQd3df0c
 bkn+/uNF+46yLk9m01J0DgLESthiP+glQhc+nsFtN+98tiQvuaCxuUhCk+vu1g/WwP+z
 hqbQ==
X-Gm-Message-State: AFqh2koEhSOzfC1q111KXRsBS+QKl4kMnEla4oFr0c0oCESfWejWo1BN
 memBeEXzAk5g/C6QhrpUGgwyEw==
X-Google-Smtp-Source: AMrXdXuO4A8xyx6+67tnt5vSccGnQfMst13iHm3i0RgTmN8zIeWyW0hP20D/R/sapznzyBbbSLIUpw==
X-Received: by 2002:adf:f606:0:b0:24b:b74d:8012 with SMTP id
 t6-20020adff606000000b0024bb74d8012mr17321312wrp.18.1674388176056; 
 Sun, 22 Jan 2023 03:49:36 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 m8-20020adfa3c8000000b00236545edc91sm1740479wrb.76.2023.01.22.03.49.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Jan 2023 03:49:35 -0800 (PST)
Message-ID: <c8f7294d-6522-40f6-7923-c379ec8ca6bb@linaro.org>
Date: Sun, 22 Jan 2023 12:49:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [RFC PATCH v2 05/31] Documentation: Add binding for
 kalray,coolidge-itgen
To: Yann Sionneau <ysionneau@kalray.eu>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>,
 Oleg Nesterov <oleg@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Waiman Long <longman@redhat.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>,
 Paul Moore <paul@paul-moore.com>, Eric Paris <eparis@redhat.com>,
 Christian Brauner <brauner@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jules Maselbas <jmaselbas@kalray.eu>,
 Guillaume Thouvenin <gthouvenin@kalray.eu>,
 Clement Leger <clement@clement-leger.fr>,
 Vincent Chardon <vincent.chardon@elsys-design.com>,
 =?UTF-8?Q?Marc_Poulhi=c3=a8s?= <dkm@kataplop.net>,
 Julian Vetter <jvetter@kalray.eu>, Samuel Jones <sjones@kalray.eu>,
 Ashley Lesdalons <alesdalons@kalray.eu>, Thomas Costis <tcostis@kalray.eu>,
 Marius Gligor <mgligor@kalray.eu>, Jonathan Borne <jborne@kalray.eu>,
 Julien Villette <jvillette@kalray.eu>, Luc Michel <lmichel@kalray.eu>,
 Louis Morhet <lmorhet@kalray.eu>, Julien Hascoet <jhascoet@kalray.eu>,
 Jean-Christophe Pince <jcpince@gmail.com>,
 Guillaume Missonnier <gmissonnier@kalray.eu>, Alex Michon
 <amichon@kalray.eu>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <git@xen0n.name>, Shaokun Zhang <zhangshaokun@hisilicon.com>,
 John Garry <john.garry@huawei.com>,
 Guangbin Huang <huangguangbin2@huawei.com>,
 Bharat Bhushan <bbhushan2@marvell.com>, Bibo Mao <maobibo@loongson.cn>,
 Atish Patra <atishp@atishpatra.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Qi Liu <liuqi115@huawei.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>,
 Janosch Frank <frankja@linux.ibm.com>, Alexey Dobriyan <adobriyan@gmail.com>
References: <20230120141002.2442-1-ysionneau@kalray.eu>
 <20230120141002.2442-6-ysionneau@kalray.eu>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230120141002.2442-6-ysionneau@kalray.eu>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mailman-Approved-At: Mon, 23 Jan 2023 18:21:47 +0000
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
Cc: linux-arch@vger.kernel.org, devicetree@vger.kernel.org,
 Benjamin Mugnier <mugnier.benjamin@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-audit@redhat.com,
 linux-riscv@lists.infradead.org, bpf@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 20/01/2023 15:09, Yann Sionneau wrote:
> From: Jules Maselbas <jmaselbas@kalray.eu>
> 
> Add documentation for `kalray,coolidge-itgen` binding.
> 
> Co-developed-by: Jules Maselbas <jmaselbas@kalray.eu>
> Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
> Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>

The same comments apply plus more...

> ---
> 
> Notes:
>     V1 -> V2: new patch
> 
>  .../kalray,coolidge-itgen.yaml                | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/kalray,coolidge-itgen.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/kalray,coolidge-itgen.yaml b/Documentation/devicetree/bindings/interrupt-controller/kalray,coolidge-itgen.yaml
> new file mode 100644
> index 000000000000..47b503bff1d9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/kalray,coolidge-itgen.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license. Checkpatch should complain about this - did you run it?

This applies to all your other patches (both, run checkpatch and use
proper license).


> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/kalray,coolidge-itgen#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Kalray Coolidge SoC Interrupt Generator (ITGEN)
> +
> +description: |
> +  The Interrupt Generator (ITGEN) is an interrupt controller block.
> +  It's purpose is to convert IRQ lines coming from SoC peripherals into writes
> +  on the AXI bus. The ITGEN intended purpose is to write into the APIC mailboxes.
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: kalray,coolidge-itgen
> +

So why suddenly this patch has proper blank lines...

Missing reg.

> +  "#interrupt-cells":
> +    const: 2
> +    description: |
> +      - 1st cell is for the IRQ number
> +      - 2nd cell is for the trigger type as defined dt-bindings/interrupt-controller/irq.h
> +
> +  interrupt-controller: true
> +
> +  msi-parent: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#interrupt-cells"
> +  - interrupt-controller
> +  - msi-parent
> +
> +examples:
> +  - |
> +    itgen: interrupt-controller@27000000 {
> +        compatible = "kalray,coolidge-itgen";
> +        reg = <0 0x27000000 0 0x1104>;
> +        #interrupt-cells = <2>;
> +        interrupt-controller;
> +        msi-parent = <&apic_mailbox>;
> +    };
> +
> +...

Best regards,
Krzysztof

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

