Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D7626675D82
	for <lists+linux-audit@lfdr.de>; Fri, 20 Jan 2023 20:03:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674241405;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SaEO28BFHY3u4Pz3c1igPcJifDUbxk4bbWSe+dUFFq8=;
	b=a0+bkdB7gUGjLjnkb6AO5ugr87KJLW1Gk3IhVFmMrLMoLQ9BrV0nLbz0dc4CEXgwcknjRi
	DAHU/fr0rGBIdIqVDe9Wb65KbthGflOlOhNZkLknu+ifkiYDKwI/Rwhf/SDzfNZWKOVB0U
	Hgqo3W0VlyhPUuquIUnJ9FWONbPpR24=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-N1Kf3VtCPYGi_XYTHn-GnQ-1; Fri, 20 Jan 2023 14:03:21 -0500
X-MC-Unique: N1Kf3VtCPYGi_XYTHn-GnQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB7531C07835;
	Fri, 20 Jan 2023 19:02:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B06AC492C3E;
	Fri, 20 Jan 2023 19:02:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7A2DE1946A7C;
	Fri, 20 Jan 2023 19:02:54 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 20AC319465B6 for <linux-audit@listman.corp.redhat.com>;
 Fri, 20 Jan 2023 17:28:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 02F6640444C3; Fri, 20 Jan 2023 17:28:47 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF19540C2064
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 17:28:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D536D29AA2C6
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 17:28:46 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-458-E7Tx8DczMnu-oZksN0kKog-1; Fri, 20 Jan 2023 12:28:43 -0500
X-MC-Unique: E7Tx8DczMnu-oZksN0kKog-1
Received: by mail-ot1-f54.google.com with SMTP id
 d6-20020a056830138600b0068585c52f86so3480188otq.4; 
 Fri, 20 Jan 2023 09:28:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9HSgCQCxDRt/ES8CSO81S+bMV2W0e0O/4hQkm1CKfbA=;
 b=Bfskz6zQmIbrNijkSJ8sGUuKRllhIbZ6M0o67E1K5bRHR7835FQUyZLqeNFrDDFFLw
 t7MlnBWlv/eDDUcnxvGCfgw5/1wKHjfQZ4MR2CW5clsLrISgxAMQtLILB3PSasltW3oD
 M6rZ47/rKkpB0H7AXbxDZYUDQTgBgamOIcIoIesrJ1C2jaa3Sq4PeHDLNgHE6aC9VEWC
 YwY5mTj4p9aazn0wzLUTMIREiZJz1FCtEr2C5wNpU7fMRlJxnRPJqICruUfqjkYGHpTM
 kMk1qPtQ1pFAqXwLrGaVuhYh2wfC6LmIedYbIIfyKISbr5Ttt9+h8ykOpM9QVgNCnrc0
 omBA==
X-Gm-Message-State: AFqh2kqSRb59z8qW0Mnr93You7Wn+5Kv72tEbMwXstGIH5x5oIk4B77e
 65RewrE7PB0BNoJMD6/5rA==
X-Google-Smtp-Source: AMrXdXs87XWf1uJ29pt4F76PCQm1VpwDoqJpVdMTPVfzjFv4uCqY7pHkuEjoheseeck2vFnJTqwQuw==
X-Received: by 2002:a05:6830:201a:b0:685:85bd:3fc9 with SMTP id
 e26-20020a056830201a00b0068585bd3fc9mr7086097otp.36.1674235722043; 
 Fri, 20 Jan 2023 09:28:42 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 y13-20020a9d714d000000b00661a16f14a1sm6072663otj.15.2023.01.20.09.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 09:28:41 -0800 (PST)
Received: (nullmailer pid 1329674 invoked by uid 1000);
 Fri, 20 Jan 2023 17:28:32 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Yann Sionneau <ysionneau@kalray.eu>
In-Reply-To: <20230120141002.2442-5-ysionneau@kalray.eu>
References: <20230120141002.2442-1-ysionneau@kalray.eu>
 <20230120141002.2442-5-ysionneau@kalray.eu>
Message-Id: <167423561602.1325928.9348232988456790495.robh@kernel.org>
Subject: Re: [RFC PATCH v2 04/31] Documentation: Add binding for
 kalray,kv3-1-apic-mailbox
Date: Fri, 20 Jan 2023 11:28:32 -0600
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
Cc: Mark Rutland <mark.rutland@arm.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 =?UTF-8?Q?Marc_Poulhi=C3=A8s?= <dkm@kataplop.net>, linux-doc@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Julien Hascoet <jhascoet@kalray.eu>,
 Clement Leger <clement@clement-leger.fr>, linux-mm@kvack.org,
 Albert Ou <aou@eecs.berkeley.edu>, Louis Morhet <lmorhet@kalray.eu>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, ",
 Guangbin Huang" <huangguangbin2@huawei.com>, Alex Michon <amichon@kalray.eu>,
 Marc Zyngier <maz@kernel.org>, Thomas Costis <tcostis@kalray.eu>,
 Jonathan Corbet <corbet@lwn.net>, Jonathan Borne <jborne@kalray.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 linux-arch@vger.kernel.org, Jean-Christophe Pince <jcpince@gmail.com>,
 Waiman Long <longman@redhat.com>, Bharat Bhushan <bbhushan2@marvell.com>,
 Qi Liu <liuqi115@huawei.com>, bpf@vger.kernel.org,
 Eric Biederman <ebiederm@xmission.com>, devicetree@vger.kernel.org,
 Guillaume Thouvenin <gthouvenin@kalray.eu>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Samuel Jones <sjones@kalray.eu>,
 linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 John Garry <john.garry@huawei.com>, Julian Vetter <jvetter@kalray.eu>,
 Nick Piggin <npiggin@gmail.com>, Shaokun Zhang <zhangshaokun@hisilicon.com>,
 Mark Brown <broonie@kernel.org>, Bibo Mao <maobibo@loongson.cn>,
 Atish Patra <atishp@atishpatra.org>, WANG Xuerui <git@xen0n.name>,
 Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Janosch Frank <frankja@linux.ibm.com>, Julien Villette <jvillette@kalray.eu>,
 Jules Maselbas <jmaselbas@kalray.eu>, Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Benjamin Mugnier <mugnier.benjamin@gmail.com>,
 Vincent Chardon <vincent.chardon@elsys-design.com>,
 Guillaume Missonnier <gmissonnier@kalray.eu>, Oleg Nesterov <oleg@redhat.com>,
 Eric Paris <eparis@redhat.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Ashley Lesdalons <alesdalons@kalray.eu>,
 Luc Michel <lmichel@kalray.eu>, linux-audit@redhat.com,
 Marius Gligor <mgligor@kalray.eu>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


On Fri, 20 Jan 2023 15:09:35 +0100, Yann Sionneau wrote:
> From: Jules Maselbas <jmaselbas@kalray.eu>
> 
> Add documentation for `kalray,kv3-1-core-intc` binding.
> 
> Co-developed-by: Jules Maselbas <jmaselbas@kalray.eu>
> Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
> Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
> ---
> 
> Notes:
>     V1 -> V2: new patch
> 
>  .../kalray,kv3-1-apic-mailbox.yaml            | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/kalray,kv3-1-apic-mailbox.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/kalray,kv3-1-apic-mailbox.yaml: $id: 'http://devicetree.org/schemas/interrupt-controller/kalray,kv3-1-apic-mailbox#' does not match 'http://devicetree.org/schemas/.*\\.yaml#'
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/kalray,kv3-1-apic-mailbox.yaml: 'maintainers' is a required property
	hint: Metaschema for devicetree binding documentation
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/kalray,kv3-1-apic-mailbox.yaml: 'oneOf' conditional failed, one must be fixed:
	'unevaluatedProperties' is a required property
	'additionalProperties' is a required property
	hint: Either unevaluatedProperties or additionalProperties must be present
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/kalray,kv3-1-apic-mailbox.yaml: properties:interrupt-parent: False schema does not allow True
	from schema $id: http://devicetree.org/meta-schemas/interrupts.yaml#
./Documentation/devicetree/bindings/interrupt-controller/kalray,kv3-1-apic-mailbox.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/interrupt-controller/kalray,kv3-1-apic-mailbox.yaml#
Documentation/devicetree/bindings/interrupt-controller/kalray,kv3-1-apic-mailbox.example.dtb: /example-0/interrupt-controller@a00000: failed to match any schema with compatible: ['kalray,kv3-1-apic-gic']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230120141002.2442-5-ysionneau@kalray.eu

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

