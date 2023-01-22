Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C163167847D
	for <lists+linux-audit@lfdr.de>; Mon, 23 Jan 2023 19:22:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674498124;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3GQCTN3GM/VEBO1VZgbmwyS+gQBKe4SANWxk3I0xmt8=;
	b=hsmoTg+rHPKugRgDRHDpGOxm0vlUqFmObZpMJ51IAsEDywZFd+zgEFupKguOjQJ1tltF9J
	Kys2k5OzyUfJhjYXirzRUgkQDwhaCJeuWD9CYF9eoolm/0xO39eH/1rLAKO988JK8sPn/h
	BWXoxwyoaaUiKZMiswezQhg+W052IrU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-gUHuYFlLMx-lJ6r_a1eRaw-1; Mon, 23 Jan 2023 13:22:00 -0500
X-MC-Unique: gUHuYFlLMx-lJ6r_a1eRaw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 631818030CC;
	Mon, 23 Jan 2023 18:21:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D7D512026D2B;
	Mon, 23 Jan 2023 18:21:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8E2EC1946A52;
	Mon, 23 Jan 2023 18:21:48 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8C3041946586 for <linux-audit@listman.corp.redhat.com>;
 Sun, 22 Jan 2023 11:54:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 45E81492B03; Sun, 22 Jan 2023 11:54:22 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EBB2492B02
 for <linux-audit@redhat.com>; Sun, 22 Jan 2023 11:54:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F92C18811F4
 for <linux-audit@redhat.com>; Sun, 22 Jan 2023 11:54:22 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-206-HvnB5K5HMXmYvNMe4Z85Ew-1; Sun, 22 Jan 2023 06:54:18 -0500
X-MC-Unique: HvnB5K5HMXmYvNMe4Z85Ew-1
Received: by mail-wr1-f49.google.com with SMTP id y1so3969562wru.2
 for <linux-audit@redhat.com>; Sun, 22 Jan 2023 03:54:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SufkmAjwbNPzx+QZI0to5Uf48TUW+IZPLNjbNqCZpfI=;
 b=DCcXBu6pZ33cTlG9EIx5GBvhV50gKxfLRs5bYeCAzVV3bS8wt8BPtB9cWrWOmUxKHm
 RBEzgbrVvqvCDRb6kAfxGhwRa0Ooc/brURwi5KxjK56Zty4SjnYc4gOGfmzoHCfD6Ytx
 tG44HL0zL1fLYRpkBD/EimAuJmHAndU1WsoDJvnrW5exCHGipJrfunPu022xxLcFAfnb
 p7G3ArqdhzfTivN+Ki4B5QufCBVN08ELx/OPw8d+YEvX0Gpl0bGzmsgmGGi1sjqmeWkk
 Ux/rh9dsCk6xbvzf8ap+s5Q/Ps1tMAaMD5jog+km705qrcL533OWXKN92Lt2va2enkYc
 xkCQ==
X-Gm-Message-State: AFqh2kol5qpwOY9p2p0re1n85JZcfnUL6k9BYYqvikYeEs570io+9zIh
 eh2Az4QPA0WbbR3OuVZf1SlehQ==
X-Google-Smtp-Source: AMrXdXt21M3CsHbnhN4nC75KtRaK9snE7H1KnN8u8SuCQjR3lZXo7Zes1x4/j1347YU7bM+ZYlALNg==
X-Received: by 2002:adf:e9d2:0:b0:2bd:e6f5:5122 with SMTP id
 l18-20020adfe9d2000000b002bde6f55122mr17418436wrn.65.1674388457426; 
 Sun, 22 Jan 2023 03:54:17 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 ba9-20020a0560001c0900b002b57bae7174sm2174746wrb.5.2023.01.22.03.54.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Jan 2023 03:54:16 -0800 (PST)
Message-ID: <f69adaf2-6582-c134-5671-4d6fd100fcf1@linaro.org>
Date: Sun, 22 Jan 2023 12:54:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [RFC PATCH v2 30/31] kvx: Add power controller driver
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
 <20230120141002.2442-31-ysionneau@kalray.eu>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230120141002.2442-31-ysionneau@kalray.eu>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 20/01/2023 15:10, Yann Sionneau wrote:
> From: Jules Maselbas <jmaselbas@kalray.eu>
> 
> The Power Controller (pwr-ctrl) control cores reset and wake-up
> procedure.


> +
> +static struct device_node * __init get_pwr_ctrl_node(void)
> +{
> +	const phandle *ph;
> +	struct device_node *cpu;
> +	struct device_node *node;
> +
> +	cpu = of_get_cpu_node(raw_smp_processor_id(), NULL);
> +	if (!cpu) {
> +		pr_err("Failed to get CPU node\n");
> +		return NULL;
> +	}
> +
> +	ph = of_get_property(cpu, "power-controller", NULL);
> +	if (!ph) {
> +		pr_err("Failed to get power-controller phandle\n");
> +		return NULL;
> +	}
> +
> +	node = of_find_node_by_phandle(be32_to_cpup(ph));
> +	if (!node) {
> +		pr_err("Failed to get power-controller node\n");
> +		return NULL;
> +	}
> +
> +	return node;
> +}
> +
> +int __init kvx_pwr_ctrl_probe(void)
> +{
> +	struct device_node *ctrl;
> +
> +	ctrl = get_pwr_ctrl_node();
> +	if (!ctrl) {
> +		pr_err("Failed to get power controller node\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!of_device_is_compatible(ctrl, "kalray,kvx-pwr-ctrl")) {
> +		pr_err("Failed to get power controller node\n");

No. Drivers go to drivers, not to arch directory. This should be a
proper driver instead of some fake stub doing its own driver matching.
You need to rework this.

Best regards,
Krzysztof

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

