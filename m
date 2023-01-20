Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C46675D86
	for <lists+linux-audit@lfdr.de>; Fri, 20 Jan 2023 20:04:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674241446;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hVMfvTVkjL9cRXSimIG5LiU0ppCOw4EUkEpq+/d3nLs=;
	b=NO41a3Vy81uDK+K+isbbTs1NNhQdFgHrWOW3d7g3uVpDZJPYCw6BJeEFs9lJ9wcXTbO+UE
	vg36n+o94AO5+DfbTdNAiB8kpFpTemHi9BjZGLe+l52uZdW20CZGoYCQ+dhGp4xWtLFuHY
	Jht+tppGcpDu/PiNQ4qH1y4ZdU2hBvY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-Zsc77iyPP_mQq61l9iDt0Q-1; Fri, 20 Jan 2023 14:03:10 -0500
X-MC-Unique: Zsc77iyPP_mQq61l9iDt0Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6EECB855714;
	Fri, 20 Jan 2023 19:02:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4F7CE492B02;
	Fri, 20 Jan 2023 19:02:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E213A1946A7F;
	Fri, 20 Jan 2023 19:02:53 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7654A1946588 for <linux-audit@listman.corp.redhat.com>;
 Fri, 20 Jan 2023 17:28:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6C35E492B03; Fri, 20 Jan 2023 17:28:50 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 648EA492B02
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 17:28:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48A5488B76E
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 17:28:50 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-356-Z6cmEqTZNdi9N6bgd-6tWw-1; Fri, 20 Jan 2023 12:28:46 -0500
X-MC-Unique: Z6cmEqTZNdi9N6bgd-6tWw-1
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-12c8312131fso6985789fac.4; 
 Fri, 20 Jan 2023 09:28:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5gjBA06WD67YyrMoXqvO6J1PCDs2JLwdpFR7b9qxItY=;
 b=CRdhmXc/mKXctMyd5ZregcKfv07ZxaK7GRA8AUIV9sMXhlSAeNURzhU7e8vl1QS/NJ
 4D+S7H+bgB5UAQogkjrEjc1Awdal4QjXoln8pDZSkfR4/Lzg+91dWmyeEnEQNtD40X50
 29+gl/0wppJiUli226Y4ycIUmNHdQC2PeMtEnyflRBxL93Nb3Y2CYHvrJthL/QzKgvHS
 G2NzI+cpiAR9jCTKi+KaaLKQgMrZ6vW4Z2+oXPgtpAFmC9V6h54ik5eYt+RLKfCu6gBo
 Tw4WcNwLjL4TIms9uqJnNvvEKNerWkTG+IOEgl9M5yYHjCVVzB5m2GpupnaRxwMEPCnK
 54/g==
X-Gm-Message-State: AFqh2koHp5q2UD1Go2C16hiZE2s/IK/THit+CQXw6YihHhYzkS7/brLv
 FDw6WnSu47N/n50SO2ltIQ==
X-Google-Smtp-Source: AMrXdXsC2cOGm30AaJai4q7zhD2SMcLgQzNvcz66PRBIqSJXVFomWcJHEJ/jDByOesOFNWT0pQYdHA==
X-Received: by 2002:a05:6870:c08f:b0:15f:cf98:35af with SMTP id
 c15-20020a056870c08f00b0015fcf9835afmr1110684oad.2.1674235724686; 
 Fri, 20 Jan 2023 09:28:44 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 h3-20020a4ac443000000b004fb2935d0e7sm4395655ooq.36.2023.01.20.09.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 09:28:44 -0800 (PST)
Received: (nullmailer pid 1329678 invoked by uid 1000);
 Fri, 20 Jan 2023 17:28:32 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Yann Sionneau <ysionneau@kalray.eu>
In-Reply-To: <20230120141002.2442-7-ysionneau@kalray.eu>
References: <20230120141002.2442-1-ysionneau@kalray.eu>
 <20230120141002.2442-7-ysionneau@kalray.eu>
Message-Id: <167423561782.1326010.11195251542877567719.robh@kernel.org>
Subject: Re: [RFC PATCH v2 06/31] Documentation: Add binding for kalray,
 kv3-1-ipi-ctrl
Date: Fri, 20 Jan 2023 11:28:32 -0600
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
 ", Peter Zijlstra" <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>,
 Atish Patra <atishp@atishpatra.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Oleg Nesterov <oleg@redhat.com>, Clement Leger <clement@clement-leger.fr>,
 linux-mm@kvack.org, Albert Ou <aou@eecs.berkeley.edu>,
 Louis Morhet <lmorhet@kalray.eu>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Guangbin Huang <huangguangbin2@huawei.com>, linux-arch@vger.kernel.org,
 Thomas Costis <tcostis@kalray.eu>, Jonathan Corbet <corbet@lwn.net>,
 Jonathan Borne <jborne@kalray.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Huacai Chen <chenhuacai@kernel.org>, bpf@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Jean-Christophe Pince <jcpince@gmail.com>,
 Waiman Long <longman@redhat.com>, Bharat Bhushan <bbhushan2@marvell.com>,
 Qi Liu <liuqi115@huawei.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 Luc Michel <lmichel@kalray.eu>, devicetree@vger.kernel.org,
 Guillaume Thouvenin <gthouvenin@kalray.eu>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Samuel Jones <sjones@kalray.eu>,
 Boqun Feng <boqun.feng@gmail.com>, John Garry <john.garry@huawei.com>,
 Julian Vetter <jvetter@kalray.eu>, Bibo Mao <maobibo@loongson.cn>,
 Shaokun Zhang <zhangshaokun@hisilicon.com>, Rob Herring <robh+dt@kernel.org>,
 Nick Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 WANG Xuerui <git@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Janosch Frank <frankja@linux.ibm.com>,
 Julien Villette <jvillette@kalray.eu>, Jules Maselbas <jmaselbas@kalray.eu>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Benjamin Mugnier <mugnier.benjamin@gmail.com>,
 Vincent Chardon <vincent.chardon@elsys-design.com>,
 Guillaume Missonnier <gmissonnier@kalray.eu>,
 Julien Hascoet <jhascoet@kalray.eu>, Eric Paris <eparis@redhat.com>,
 linux-kernel@vger.kernel.org, linux-audit@redhat.com,
 Ashley Lesdalons <alesdalons@kalray.eu>,
 Eric Biederman <ebiederm@xmission.com>, Marc Zyngier <maz@kernel.org>,
 Marius Gligor <mgligor@kalray.eu>, Alex Michon <amichon@kalray.eu>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


On Fri, 20 Jan 2023 15:09:37 +0100, Yann Sionneau wrote:
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
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/kalray/kalray,kv3-1-ipi-ctrl.yaml: $id: 'http://devicetree.org/schemas/kalray/kalray,kv3-1-ipi-ctrl#' does not match 'http://devicetree.org/schemas/.*\\.yaml#'
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/kalray/kalray,kv3-1-ipi-ctrl.yaml: 'maintainers' is a required property
	hint: Metaschema for devicetree binding documentation
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/kalray/kalray,kv3-1-ipi-ctrl.yaml: 'oneOf' conditional failed, one must be fixed:
	'unevaluatedProperties' is a required property
	'additionalProperties' is a required property
	hint: Either unevaluatedProperties or additionalProperties must be present
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
./Documentation/devicetree/bindings/kalray/kalray,kv3-1-ipi-ctrl.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/kalray/kalray,kv3-1-ipi-ctrl.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/kalray/kalray,kv3-1-ipi-ctrl.example.dtb: inter-processor-interrupt@ad0000: reg: [[0, 11337728], [0, 4096]] is too long
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/kalray/kalray,kv3-1-ipi-ctrl.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/kalray/kalray,kv3-1-ipi-ctrl.example.dtb: inter-processor-interrupt@ad0000: 'interrupt-parent' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/kalray/kalray,kv3-1-ipi-ctrl.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230120141002.2442-7-ysionneau@kalray.eu

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

