Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2CE678477
	for <lists+linux-audit@lfdr.de>; Mon, 23 Jan 2023 19:22:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674498121;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Frv7ym57OBzWlmeliBa7uxm6dAtU/G9jdanzQENIvCg=;
	b=XIWqiYSUBDBZLwcbuQ7uu/ZqFYa74SEA8DXL3qX/eX0CTVUJTg3DF8WPpeJ1/x2R7Swd7i
	9aC8tMaXtKstJ0as2G+AnEP85Ai99eFMYTv7VcxSELVPvlUzHkhtXPlB8cN1tjZbgpXXOy
	74KCUFANau8BYyqheNLlcVRHyVSSz+8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-7-TY8XUKP36Pa5o-SJZtwA-1; Mon, 23 Jan 2023 13:22:00 -0500
X-MC-Unique: 7-TY8XUKP36Pa5o-SJZtwA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62E1C181E3EF;
	Mon, 23 Jan 2023 18:21:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E40D72166B33;
	Mon, 23 Jan 2023 18:21:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F21C819465BD;
	Mon, 23 Jan 2023 18:21:49 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EA0391946586 for <linux-audit@listman.corp.redhat.com>;
 Sun, 22 Jan 2023 11:47:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9C068492B03; Sun, 22 Jan 2023 11:47:09 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94A96492B02
 for <linux-audit@redhat.com>; Sun, 22 Jan 2023 11:47:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79D1C380670B
 for <linux-audit@redhat.com>; Sun, 22 Jan 2023 11:47:09 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-584-LMibf-PZMiKLGuStNka7Pw-1; Sun, 22 Jan 2023 06:47:06 -0500
X-MC-Unique: LMibf-PZMiKLGuStNka7Pw-1
Received: by mail-wm1-f46.google.com with SMTP id
 c10-20020a05600c0a4a00b003db0636ff84so6675775wmq.0
 for <linux-audit@redhat.com>; Sun, 22 Jan 2023 03:47:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M2dS08c5mDDQCSEte2hJr4AncAP49BS6JfkPW/bfJ8w=;
 b=o5W/cx78OqlXI44b+KvN0x9vWwbYXGv4/J1TNAdYkoxOPXUQGt+YBlOGiVvObaMMOB
 5Oiyah/WCbNsHZxZOnzy5LZBpQAJD/KRXqSb5Hd/uXj5X3NqJ8V4aRXLKwfmLOTVB71D
 TzejfF+mTfogUaOomOOthVlEZ5af9uOCQqt9IyWPPM8TQXbM4unXjncaPntgv/LpqLjd
 NXQRW7opTRB8HPSd6OMYS3BmjE7dR441GlwuCo8Vqcv3jBnKWHljONC87z/Qqc2KFKIn
 Y9wkyC1OgfFxlzRox+ZuyPnE19J38+bkyWhCKGYpJprjdfRkeQIejOpDGyzyqm0+kNZx
 YfrQ==
X-Gm-Message-State: AFqh2krAjdTElZCIMuvR/0Am5DE7D+kGisjhBKbt3Yb5HXTmSXDe0dkf
 MeUbtPBV/0/cPs2LnvPDJUadNw==
X-Google-Smtp-Source: AMrXdXvv5SOq8oLh4MHQyQrfcxkhDTk8DLHjQASO2lJraohGjZ9veTwuZ0pwUHGY71DEX8EYBAct8g==
X-Received: by 2002:a05:600c:4f82:b0:3db:25a0:ca5b with SMTP id
 n2-20020a05600c4f8200b003db25a0ca5bmr11762781wmq.37.1674388025485; 
 Sun, 22 Jan 2023 03:47:05 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c350f00b003db0b0cc2afsm8452351wmq.30.2023.01.22.03.47.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Jan 2023 03:47:04 -0800 (PST)
Message-ID: <faa9ee85-60d7-6495-2376-384946720f60@linaro.org>
Date: Sun, 22 Jan 2023 12:47:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [RFC PATCH v2 03/31] Documentation: Add binding for
 kalray,kv3-1-apic-gic
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
 <20230120141002.2442-4-ysionneau@kalray.eu>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230120141002.2442-4-ysionneau@kalray.eu>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 20/01/2023 15:09, Yann Sionneau wrote:
> From: Jules Maselbas <jmaselbas@kalray.eu>
> 
> Add documentation for `kalray,kv3-1-apic-gic` binding.
> 
> Co-developed-by: Jules Maselbas <jmaselbas@kalray.eu>
> Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
> Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
> ---

All the comments apply here and to all your other patches - wrong
subject, missing blank lines, missing additionalProperties, missing
tests (patches were for sure not tested as you can see from bot's
answers) etc. Really, please start from scratch on example-schema.

> 
> Notes:
>     V1 -> V2: new patch
> 
>  .../kalray,kv3-1-apic-gic.yaml                | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/kalray,kv3-1-apic-gic.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/kalray,kv3-1-apic-gic.yaml b/Documentation/devicetree/bindings/interrupt-controller/kalray,kv3-1-apic-gic.yaml
> new file mode 100644
> index 000000000000..7a37f19db2fb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/kalray,kv3-1-apic-gic.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/kalray,kv3-1-apic-gic#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Kalray kv3-1 APIC-GIC
> +
> +description: |
> +  Each cluster in the Coolidge SoC includes an Advanced Programmable Interrupt
> +  Controller (APIC) which is split in two part:
> +    - a Generic Interrupt Controller (referred as APIC-GIC)
> +    - a Mailbox Controller           (referred as APIC-Mailbox)
> +  The APIC-GIC acts as an intermediary interrupt controller, muxing/routing
> +  incoming interrupts to output interrupts connected to kvx cores interrupts lines.
> +  The 139 possible input interrupt lines are organized as follow:
> +     - 128 from the mailbox controller (one it per mailboxes)
> +     - 1   from the NoC router
> +     - 5   from IOMMUs
> +     - 1   from L2 cache DMA job FIFO
> +     - 1   from cluster watchdog
> +     - 2   for SECC, DECC
> +     - 1   from Data NoC
> +  The 72 possible output interrupt lines:
> +     -  68 : 4 interrupts per cores (17 cores)
> +     -  1 for L2 cache controller
> +     -  3 extra that are for padding
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: kalray,kv3-1-apic-gic

Missing reg

> +  "#interrupt-cells":
> +    const: 1
> +    description:
> +      The IRQ number.
> +  interrupt-controller: true
> +  interrupt-parent: true

Drop, should not be needed.

> +  interrupts:
> +    maxItems: 4
> +    description: |
> +     Specifies the interrupt line(s) in the interrupt-parent controller node;
> +     valid values depend on the type of parent interrupt controller
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#interrupt-cells"
> +  - interrupt-controller
> +  - interrupt-parent
> +  - interrupts
> +
> +examples:
> +  - |
> +    apic_gic: interrupt-controller@a20000 {
> +        compatible = "kalray,kv3-1-apic-gic";
> +        reg = <0 0xa20000 0 0x12000>;
> +        #interrupt-cells = <1>;
> +        interrupt-controller;
> +        interrupt-parent = <&intc>;
> +        interrups = <4 5 6 7>;
> +    };
> +
> +...

Best regards,
Krzysztof

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

