Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EC167847F
	for <lists+linux-audit@lfdr.de>; Mon, 23 Jan 2023 19:22:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674498125;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UK8AHjGQ62T7B2XcVicblGRbn5WhPd33Ce3QQVtY3Pc=;
	b=WFjdAQ2K3L+uBoQDayHRq2llnpAKSUKdw9k7yRDkEPKb5fb5/086jJlx0b5l4YGxbVdl1P
	kD/dilK942FQ3rRcgQJ5Q3skvZln3S6gGjrVpH5hag9UdhGFNHONwQhnemxEJeHOU4/oic
	bpnBFECmhT3hIH9Y2GkdW9Kw90HETaY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-Ce4KeFbkMyS3ph5AtlI3rg-1; Mon, 23 Jan 2023 13:22:00 -0500
X-MC-Unique: Ce4KeFbkMyS3ph5AtlI3rg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 642FB100F902;
	Mon, 23 Jan 2023 18:21:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3F79C1121339;
	Mon, 23 Jan 2023 18:21:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 505651946A4F;
	Mon, 23 Jan 2023 18:21:50 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 40C831946586 for <linux-audit@listman.corp.redhat.com>;
 Sun, 22 Jan 2023 11:58:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EEE1E1400AFC; Sun, 22 Jan 2023 11:58:14 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E57F114171C0
 for <linux-audit@redhat.com>; Sun, 22 Jan 2023 11:58:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C76CA3C0252F
 for <linux-audit@redhat.com>; Sun, 22 Jan 2023 11:58:14 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-47-qSfpScv6NveA0bKSTrbqng-1; Sun, 22 Jan 2023 06:58:12 -0500
X-MC-Unique: qSfpScv6NveA0bKSTrbqng-1
Received: by mail-wm1-f44.google.com with SMTP id g10so7107987wmo.1
 for <linux-audit@redhat.com>; Sun, 22 Jan 2023 03:58:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YjGs/N459uaRgS5yJ3WFfESguZ4NHWx9awwoiEeB780=;
 b=N/pGZ3/l7M0YZRIZxJnImLdIzefMlTpzZlxrCP/KKk4AbX7OKUipidTSCQswNBUikJ
 xmYDwWpuDM43iU6sEUbNpAei5SXGAdf/Kv9SL9onCMQQoyqLwZQdRUUnojZt2nJlUAZe
 EkaK+0bpQxhR7AMVGK1HzkQ5WUCNvFwZyCroge+uZ1+DNfGZXW5wAHb5cN2QLveHJ38x
 +2WXCSx1eIncbBxqzIEzIQnIyWkJYRx3FZqCnXwPRsUnQpTaBnGy0w01JmOvvdrDfZqw
 CYVBYHAMUwGPJcLWK+nUU6EI0N8YebkUw5kR89OjxUJP+gBZCmmdhbagwXiePpZj2KjT
 qu0A==
X-Gm-Message-State: AFqh2krhevsK5TwRDYST71Bo015mh/C4tdbShCVLSJWekl8ddh1kE0o+
 vuOl20xxfKGWcw8p8eRRAxAr2A==
X-Google-Smtp-Source: AMrXdXtq5Rph9UIfC3hB2PBgU4uL+k5CyKLEV85gy72Xc9vXVhqLaj7EC+pHgTHApG8hI/7ahj3Ing==
X-Received: by 2002:a05:600c:540d:b0:3d9:fb59:c16b with SMTP id
 he13-20020a05600c540d00b003d9fb59c16bmr17056417wmb.36.1674388691612; 
 Sun, 22 Jan 2023 03:58:11 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 i22-20020a05600c355600b003a84375d0d1sm8262888wmq.44.2023.01.22.03.58.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Jan 2023 03:58:11 -0800 (PST)
Message-ID: <9becf3e0-19cc-8924-6da9-8f62f8f8636c@linaro.org>
Date: Sun, 22 Jan 2023 12:58:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [RFC PATCH v2 27/31] kvx: Add kvx default config file
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
 <20230120141002.2442-28-ysionneau@kalray.eu>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230120141002.2442-28-ysionneau@kalray.eu>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
> Add a default config file for kvx based Coolidge SoC.
> 
> Co-developed-by: Ashley Lesdalons <alesdalons@kalray.eu>
> Signed-off-by: Ashley Lesdalons <alesdalons@kalray.eu>
> Co-developed-by: Benjamin Mugnier <mugnier.benjamin@gmail.com>
> Signed-off-by: Benjamin Mugnier <mugnier.benjamin@gmail.com>
> Co-developed-by: Clement Leger <clement@clement-leger.fr>
> Signed-off-by: Clement Leger <clement@clement-leger.fr>
> Co-developed-by: Guillaume Thouvenin <gthouvenin@kalray.eu>
> Signed-off-by: Guillaume Thouvenin <gthouvenin@kalray.eu>
> Co-developed-by: Jules Maselbas <jmaselbas@kalray.eu>
> Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
> Co-developed-by: Julian Vetter <jvetter@kalray.eu>
> Signed-off-by: Julian Vetter <jvetter@kalray.eu>
> Co-developed-by: Samuel Jones <sjones@kalray.eu>
> Signed-off-by: Samuel Jones <sjones@kalray.eu>
> Co-developed-by: Thomas Costis <tcostis@kalray.eu>
> Signed-off-by: Thomas Costis <tcostis@kalray.eu>
> Co-developed-by: Vincent Chardon <vincent.chardon@elsys-design.com>
> Signed-off-by: Vincent Chardon <vincent.chardon@elsys-design.com>
> Co-developed-by: Yann Sionneau <ysionneau@kalray.eu>
> Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
> ---
> 
> Notes:
>     V1 -> V2: default_defconfig renamed to defconfig
> 
>  arch/kvx/configs/defconfig | 127 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 127 insertions(+)
>  create mode 100644 arch/kvx/configs/defconfig
> 
> diff --git a/arch/kvx/configs/defconfig b/arch/kvx/configs/defconfig
> new file mode 100644
> index 000000000000..960784da0b1b
> --- /dev/null
> +++ b/arch/kvx/configs/defconfig
> @@ -0,0 +1,127 @@
> +CONFIG_DEFAULT_HOSTNAME="KVXlinux"
> +CONFIG_SERIAL_KVX_SCALL_COMM=y
> +CONFIG_CONFIGFS_FS=y
> +CONFIG_DEBUG_KERNEL=y
> +CONFIG_DEBUG_INFO=y
> +CONFIG_DEBUG_INFO_DWARF4=y
> +CONFIG_PRINTK_TIME=y
> +CONFIG_CONSOLE_LOGLEVEL_DEFAULT=15
> +CONFIG_MESSAGE_LOGLEVEL_DEFAULT=7
> +CONFIG_PANIC_TIMEOUT=-1
> +CONFIG_BLK_DEV_INITRD=y
> +CONFIG_GDB_SCRIPTS=y
> +CONFIG_FRAME_POINTER=y
> +CONFIG_HZ_100=y
> +CONFIG_SERIAL_EARLYCON=y
> +CONFIG_HOTPLUG_PCI_PCIE=y
> +CONFIG_PCIEAER=y
> +CONFIG_PCIE_DPC=y
> +CONFIG_HOTPLUG_PCI=y
> +CONFIG_SERIAL_8250=y

Are you sure this is the result of savedefconfig? Order looks a bit odd
in several places, so I want to double check.

Best regards,
Krzysztof

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

