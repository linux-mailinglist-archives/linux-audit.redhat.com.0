Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AB97367E846
	for <lists+linux-audit@lfdr.de>; Fri, 27 Jan 2023 15:30:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674829818;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Pcozziye6IwCk19OXh9gDdvcXDa5bQoIm7BE5wDyFh0=;
	b=dE7ZXTd3vAomczJORriHlHUvlOo0DSRgakAmo0pS6PmD9bA9nWsMq/deEIa9CLtJSs/DeM
	Du/Ag/RGUSM5ME1lzDa/2sLtyhibkQNAsV4hAgfCiWA1chySbN2QuGlOtOYONo5P2ryJwC
	FC+9V1/w3PerFvuN5PmiCv4MLI8prUw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-5mZ_2IvYPGqIYqOi7bvP-w-1; Fri, 27 Jan 2023 09:30:13 -0500
X-MC-Unique: 5mZ_2IvYPGqIYqOi7bvP-w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03734857F82;
	Fri, 27 Jan 2023 14:30:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E30C940C200C;
	Fri, 27 Jan 2023 14:30:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C1E0519465A8;
	Fri, 27 Jan 2023 14:29:58 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8F0F01946594 for <linux-audit@listman.corp.redhat.com>;
 Fri, 27 Jan 2023 08:33:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E036E2166B2A; Fri, 27 Jan 2023 08:33:04 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D986F2166B26
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 08:33:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBC4C280BCB0
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 08:33:04 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-607-gOhdS1Q8OTW3dLL-76H_1Q-1; Fri, 27 Jan 2023 03:33:00 -0500
X-MC-Unique: gOhdS1Q8OTW3dLL-76H_1Q-1
Received: by mail-wm1-f48.google.com with SMTP id
 e19-20020a05600c439300b003db1cac0c1fso4864740wmn.5
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 00:32:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mNDzzLve1QZpQMH586QRx6794jByHtxqf4nlX323e/M=;
 b=M5pg2uN2AdgNLK/9imgladYm/TDXdfiGKTOXK2VmQfw5NlztFgkAJLLZ1hQx8lV7vb
 IP0j7iG+1WROtqN5gf/hzoPJl21HLeibZUFbgUh2CmPu/NFV4lFsvycLo2386HCFIgce
 M0zdy3AUUiMGs+8kRJug0J2dRoDOA/WUq64YUQYnYjSJFLcOsSxF5yFju8OhroaswduR
 W6n3W1vT5UMYWhvmkwotCXETGJSSz3qu57Wp6c4gWH7379KiJSwgxdY1sCfzvHJNqG2e
 Q7gg0Q0I+UI2etRK4Mv1LQ7ZgSFqrlBW/b5HeKlQGI/tCGCYeDGugs82SVumciNZuAjM
 kYrw==
X-Gm-Message-State: AO0yUKWvJfeXgxiJxUhK+iCVgk4iU216LWu0oAdDLYvxcILD0Fd9wpn+
 DhYpiGj4pTBz9N0IxmyaQlFIaA==
X-Google-Smtp-Source: AK7set8AUVYQ3DMEqB5mb5eVqgQNd79NxSGC2QpLaYfkKjZyelI9gwbfI++aOYEpI1mjO/SKh2lGNQ==
X-Received: by 2002:a05:600c:1caa:b0:3dc:4042:5c30 with SMTP id
 k42-20020a05600c1caa00b003dc40425c30mr177420wms.10.1674808379017; 
 Fri, 27 Jan 2023 00:32:59 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 d10-20020adffbca000000b00287da7ee033sm3318241wrs.46.2023.01.27.00.32.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 00:32:58 -0800 (PST)
Message-ID: <348c3416-be44-b912-98ef-7f394bd408c0@linaro.org>
Date: Fri, 27 Jan 2023 09:32:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH v2 02/31] Documentation: Add binding for
 kalray,kv3-1-core-intc
To: Jules Maselbas <jmaselbas@kalray.eu>
References: <20230120141002.2442-1-ysionneau@kalray.eu>
 <20230120141002.2442-3-ysionneau@kalray.eu>
 <d4d998ee-1532-c896-df25-195ec9c72e3f@linaro.org>
 <20230126161032.GH5952@tellis.lin.mbt.kalray.eu>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230126161032.GH5952@tellis.lin.mbt.kalray.eu>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mailman-Approved-At: Fri, 27 Jan 2023 14:29:56 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 =?UTF-8?Q?Marc_Poulhi=c3=a8s?= <dkm@kataplop.net>, linux-doc@vger.kernel.org,
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 26/01/2023 17:10, Jules Maselbas wrote:

>>> +  reg:
>>> +    maxItems: 0
>>
>> ??? No way... What's this?
> This (per CPU) interrupt controller is not memory mapped at all, it is
> controlled and configured through system registers.
> 
> I do not have found existing .yaml bindings for such devices, only the
> file snps,archs-intc.txt has something similar.
> 
> I do not know what is the best way to represent such devices in the
> device-tree.  Any suggestions are welcome.

You cannot have an array property with 0 items. How would it look like
in DTS? There are many, many bindings which are expressing it. Just drop
the reg.

> 
>>
>>> +  "kalray,intc-nr-irqs":
>>
>> Drop quotes.
>>
>>> +    description: Number of irqs handled by the controller.
>>
>> Why this is variable per board? Why do you need it ?
> This property is not even used in our device-tree, this will be removed
> from the documentation and from the driver as well.
> 
>>> +
>>> +required:
>>> +  - compatible
>>> +  - "#interrupt-cells"
>>> +  - interrupt-controller
>>
>> missing additionalProperties: false
>>
>> This binding looks poor, like you started from something odd. Please
>> don't. Take the newest reviewed binding or better example-schema and use
>> it to build yours. This would solve several trivial mistakes and style
>> issues.
> I am starting over from the example-schema.
> 
>>> +
>>> +examples:
>>> +  - |
>>> +    intc: interrupt-controller {
>>
>> What's the IO address space?
> As said above, this is not a memory mapped device, but is accessed
> through system registers.

Sure, but then you cannot define a reg which was confusing...

Best regards,
Krzysztof

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

