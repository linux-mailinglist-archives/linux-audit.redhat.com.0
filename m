Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FD167847C
	for <lists+linux-audit@lfdr.de>; Mon, 23 Jan 2023 19:22:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674498123;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YzJxoJAfeqNpWGwldu0MfSOewiahx/fbQtEP7yxuWK0=;
	b=cffKwtFRF/rlt+kgaWpuvNgi0D7WCUPxzWgsqJlPKpFABP/aqwvFHrlmQuenfEpX2+E+uR
	U23v4A05ewvBFakIIdPzT67cYizR1ZSY1CtKdRGubbaXtxeuwqawptKgnnneAbpkxKaUpr
	EcFwhRQX+0pC4ngTgxIiBxZtmd0TpgQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-O5ln-dtTMzCZiIN14LnV9Q-1; Mon, 23 Jan 2023 13:22:00 -0500
X-MC-Unique: O5ln-dtTMzCZiIN14LnV9Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E26585C06E;
	Mon, 23 Jan 2023 18:21:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 949CE492B02;
	Mon, 23 Jan 2023 18:21:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 77EE319465A3;
	Mon, 23 Jan 2023 18:21:51 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A98E81946586 for <linux-audit@listman.corp.redhat.com>;
 Sun, 22 Jan 2023 11:51:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9925E2166B33; Sun, 22 Jan 2023 11:51:42 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 919E72166B32
 for <linux-audit@redhat.com>; Sun, 22 Jan 2023 11:51:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D120380670B
 for <linux-audit@redhat.com>; Sun, 22 Jan 2023 11:51:42 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-568-8eapfw0fOS-INzdtEmuD-w-1; Sun, 22 Jan 2023 06:51:40 -0500
X-MC-Unique: 8eapfw0fOS-INzdtEmuD-w-1
Received: by mail-wr1-f52.google.com with SMTP id z5so8466130wrt.6
 for <linux-audit@redhat.com>; Sun, 22 Jan 2023 03:51:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QW4gcfTBDAxCEJmp81ra89ieKaIa7EaBAPXtJreoq+w=;
 b=uOmw8vgpjx3Y+I8C+ZdQefeybjPhIhvIoSfEsQUq8FkR8shAJMdYGFOkDOe+Zlast/
 TdzmZxIaOVgk7UGlpsTxEpl3KkK106YlRwV8B6uk4DXVuwlDZqcE170FpZgswfzGy365
 GAGGfbjXcQY9EYexqy5KsYAH6s/nru6Hhl5cLme2NeoxFiKdkgIsIed1lYOXLn5s3APv
 1uSl2We9nLVatFxEwrFfqUqfuRz7YPsTatgl34PT0afjWGzkzhdcAR8AfW0lpP/pj6V9
 yPLYfsYfzCvmnagqZ/98+cYX7A05bHZOK+CCO7GR053OX+3PD0BZAbU7aNt1DWVh43FO
 Bamw==
X-Gm-Message-State: AFqh2kqk8fvgbpo2hbmcVsom8OIOjXMl/qVR5lK91Z6T+nLxZHT97Voe
 lKz1BPTGpPIcsoXBLPs8w6qZyA==
X-Google-Smtp-Source: AMrXdXu3komgmJz3v4UQ6DFMLR2KXaq2N92Bqckcvh43HhbdmlU07p0tmzT8+sQ+olcM02A9d6D9gA==
X-Received: by 2002:adf:f501:0:b0:2ba:dce5:ee28 with SMTP id
 q1-20020adff501000000b002badce5ee28mr17537961wro.18.1674388299288; 
 Sun, 22 Jan 2023 03:51:39 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a5d6787000000b0025e86026866sm3554309wru.0.2023.01.22.03.51.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Jan 2023 03:51:38 -0800 (PST)
Message-ID: <d02b81ab-fa72-6005-79e9-249225483364@linaro.org>
Date: Sun, 22 Jan 2023 12:51:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [RFC PATCH v2 07/31] Documentation: Add binding for
 kalray,kv3-1-pwr-ctrl
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
 <20230120141002.2442-8-ysionneau@kalray.eu>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230120141002.2442-8-ysionneau@kalray.eu>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 20/01/2023 15:09, Yann Sionneau wrote:
> From: Jules Maselbas <jmaselbas@kalray.eu>
> 
> Add documentation for `kalray,kv3-1-pwr-ctrl` binding.
> 
> Co-developed-by: Jules Maselbas <jmaselbas@kalray.eu>
> Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
> Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
> ---
> 
> Notes:
>     V1 -> V2: new patch
> 
>  .../kalray/kalray,kv3-1-pwr-ctrl.yaml         | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/kalray/kalray,kv3-1-pwr-ctrl.yaml

All the usual comments plus - wrong directory. Power controllers go to
respective power directory.

> 
> diff --git a/Documentation/devicetree/bindings/kalray/kalray,kv3-1-pwr-ctrl.yaml b/Documentation/devicetree/bindings/kalray/kalray,kv3-1-pwr-ctrl.yaml
> new file mode 100644
> index 000000000000..968674bb0c63
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/kalray/kalray,kv3-1-pwr-ctrl.yaml
> @@ -0,0 +1,29 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/kalray/kalray,kv3-1-pwr-ctrl#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Kalray cluster Power Controller (pwr-ctrl)
> +
> +description: |
> +  The Power Controller (pwr-ctrl) control cores reset and wake-up procedure.
> +
> +properties:
> +  compatible:
> +    const: kalray,kv3-1-pwr-ctrl
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    pwr_ctrl: power-controller@a40000 {
> +        compatible = "kalray,kv3-1-pwr-ctrl";
> +        reg = <0x00 0xa40000 0x00 0x4158>;

I really doubt that you tested it... Examples are not run with address
cells 2.


Best regards,
Krzysztof

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

