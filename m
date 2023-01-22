Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAEA678475
	for <lists+linux-audit@lfdr.de>; Mon, 23 Jan 2023 19:22:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674498121;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BovX80tgx4AbN6WqbRCWpmBxk/Px7+lpLntmPCJLZuY=;
	b=BQdsu+g02MesbrHI1Ea+aW1CnIYOjXNHa5Tcsd2TlPcAGBh/HBlZRDqzT7qQFJ4Ioj/Ujr
	JIwKHGKh5olYTkCWjVd9vFouSWVmWBhpNS6pLnO+BanNh+EDV/EDMbfNcrpX0Yo3F5cjVw
	Gq1ns/EXTgKM7f9SHX2bmYFreEVCw0c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-3mfvoE3kMgKADkeblrDnOQ-1; Mon, 23 Jan 2023 13:22:00 -0500
X-MC-Unique: 3mfvoE3kMgKADkeblrDnOQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 689302999B2D;
	Mon, 23 Jan 2023 18:21:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0D144492C1B;
	Mon, 23 Jan 2023 18:21:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 26CD91946A48;
	Mon, 23 Jan 2023 18:21:50 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BBD651946586 for <linux-audit@listman.corp.redhat.com>;
 Sun, 22 Jan 2023 11:50:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 99B9040C115E; Sun, 22 Jan 2023 11:50:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 91A3040C1141
 for <linux-audit@redhat.com>; Sun, 22 Jan 2023 11:50:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7735C2A5955F
 for <linux-audit@redhat.com>; Sun, 22 Jan 2023 11:50:27 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-207-o4XpvP9yMwuiwHw_0Sd6kg-1; Sun, 22 Jan 2023 06:50:23 -0500
X-MC-Unique: o4XpvP9yMwuiwHw_0Sd6kg-1
Received: by mail-wm1-f41.google.com with SMTP id
 f19-20020a1c6a13000000b003db0ef4dedcso8744297wmc.4
 for <linux-audit@redhat.com>; Sun, 22 Jan 2023 03:50:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0EpkB2BBdVigwr5Td9P+HmXwToYi435KgLDWMOa4EE8=;
 b=OSuo1O/zn63u2A9nH0ECiVoc/OXh0oPXl6gngm0yvlkbwujn8m6yvWrMUtjLeCT3wp
 Prsm6L+aZ6nGsNKTUU9vPLty+JZGWYtKWlhdFCEsQPLnctlXomSqsbQsIwYd4eNwlTN0
 2G8BEJNs4w/BSawaYEGyVPtBeqU0nvEUrpjls8D+3/L9jrtX+9TFHz+kH8SHgLIMWuhl
 fDWvyzs0RWpHfoJNrlmZ5M9izJPZNXw+YGIU8i9V08/ohJ51L0f/V3AfkuqRKk+vgFWE
 1WjT12p8C3g8cCAfAgX3uV8omperoGOu2IhhXqiG5stjgi/zXMHz+/DzuEezh5DMD3r7
 muCg==
X-Gm-Message-State: AFqh2kqvw4xCks9YYhbwDmRGmHupr+ycZzJJWyo7v2dghi1vZoWUD37t
 FdjEb2E/Hu0zD/4p0vnELpgMaw==
X-Google-Smtp-Source: AMrXdXvaWQ3NiM1uiaHGSPzJg1g++T4pemcHh7xrDRxj9Aer0pOjcC8iWTUXjRv5iTAL5OdTQdwkyw==
X-Received: by 2002:a05:600c:2284:b0:3d3:5c21:dd9d with SMTP id
 4-20020a05600c228400b003d35c21dd9dmr20563566wmf.19.1674388222395; 
 Sun, 22 Jan 2023 03:50:22 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 c40-20020a05600c4a2800b003db16770bc5sm7460685wmp.6.2023.01.22.03.50.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Jan 2023 03:50:21 -0800 (PST)
Message-ID: <57fa51fd-fd3a-f08e-d3de-06a24d1b6ea1@linaro.org>
Date: Sun, 22 Jan 2023 12:50:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [RFC PATCH v2 06/31] Documentation: Add binding for
 kalray,kv3-1-ipi-ctrl
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
 <20230120141002.2442-7-ysionneau@kalray.eu>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230120141002.2442-7-ysionneau@kalray.eu>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 20/01/2023 15:09, Yann Sionneau wrote:
> From: Jules Maselbas <jmaselbas@kalray.eu>
> 
> Add documentation for `kalray,kv3-1-ipi-ctrl` binding.
> 
> Co-developed-by: Jules Maselbas <jmaselbas@kalray.eu>
> Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
> Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
> ---
> 
> Notes:
>     V1 -> V2: new patch
> 
>  .../kalray/kalray,kv3-1-ipi-ctrl.yaml         | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/kalray/kalray,kv3-1-ipi-ctrl.yaml

Wrong directory. Interrupt controllers go to respective subsystem directory.

Best regards,
Krzysztof

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

