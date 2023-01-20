Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC1A675D61
	for <lists+linux-audit@lfdr.de>; Fri, 20 Jan 2023 20:03:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674241387;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pT80ENklH99rshuiBX4jl/ROm1HnqaYW7053RyiLQCA=;
	b=MLQUIb54Z8Tb6yNHrwd4Q7v+d7H8WscFegyjtfkpXhrtLD+N4JoImGU6g/E4i2nNKifdRc
	RfAIOPa1rUlJEMTJsjDGXnkr0PBk81qus7lZOOguQjlTuFB8oSuELFQ96oW1rq5v1Gav9O
	UaxMM2MCwYnitVlQsLQc6wyCjuT8m9Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-LtliMd2iOpqXVbbUZ251CQ-1; Fri, 20 Jan 2023 14:03:05 -0500
X-MC-Unique: LtliMd2iOpqXVbbUZ251CQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F9EA1C02D56;
	Fri, 20 Jan 2023 19:02:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 058C3C15BAD;
	Fri, 20 Jan 2023 19:02:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2ABD01947057;
	Fri, 20 Jan 2023 19:02:52 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0989B1946588 for <linux-audit@listman.corp.redhat.com>;
 Fri, 20 Jan 2023 17:28:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E326240444C3; Fri, 20 Jan 2023 17:28:44 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB72740C2064
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 17:28:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C14333806109
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 17:28:44 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com
 [209.85.160.54]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-256-4Jw_LiMRPS-45k7YLHCO7w-1; Fri, 20 Jan 2023 12:28:40 -0500
X-MC-Unique: 4Jw_LiMRPS-45k7YLHCO7w-1
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-15eec491b40so6917164fac.12; 
 Fri, 20 Jan 2023 09:28:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UvYbaNfQm3I2mSz+vFgV+Zpo/6TKrTqqiUlOL3TyJbU=;
 b=LdsZvXJm7+PsFCvX6whHfYFx42ROtngO9DqxHOr0TayRxISnqiGaCjVNmVmOUu/jc6
 geewaXM2pnY82dARkcJf2AAINDIvqDwTVf7tNFnP/dzuCRz4odnLHq9CHKQGRriYAlio
 y6vTRn5IzK2iPc4a6xXIn4y2kMM+IVnG0TzaVzkiEAX2hP+XX2uaG003p+AFP9uQJbdX
 9smrDc2HqOESRLcBAOTFoi3c1IWjCoY/rGSAdCxoQVr7ayzhVg9eTd9KeFBCYBpAAfIT
 ZLEYZ5LwtBvG/9zN+nneYGGXchsSbSIGrB95hpbdkVGg2mMJBaesmvN0u0eXOVooSnmQ
 WDiw==
X-Gm-Message-State: AFqh2ko5NT7XJiP6vNm0DgflTeUMoa+Y83L1p68buzDlXnkEa8SCy2Yc
 UAC06u6PZtjq1It8Xr6Xxw==
X-Google-Smtp-Source: AMrXdXuIj9Mc6vhmcjt+cVUmsx/qJI+DwldGfBtYKiNvQNiIU6JcQTsuH2h+z+SVTygNWPiU0rySOw==
X-Received: by 2002:a05:6870:54c5:b0:15f:853d:d7f with SMTP id
 g5-20020a05687054c500b0015f853d0d7fmr6250068oan.23.1674235718838; 
 Fri, 20 Jan 2023 09:28:38 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 er14-20020a056870c88e00b0013bc40b09dasm21968671oab.17.2023.01.20.09.28.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 09:28:38 -0800 (PST)
Received: (nullmailer pid 1329680 invoked by uid 1000);
 Fri, 20 Jan 2023 17:28:32 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Yann Sionneau <ysionneau@kalray.eu>
In-Reply-To: <20230120141002.2442-8-ysionneau@kalray.eu>
References: <20230120141002.2442-1-ysionneau@kalray.eu>
 <20230120141002.2442-8-ysionneau@kalray.eu>
Message-Id: <167423561872.1326049.17437952508849163257.robh@kernel.org>
Subject: Re: [RFC PATCH v2 07/31] Documentation: Add binding for kalray,
 kv3-1-pwr-ctrl
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
 Catalin Marinas <catalin.marinas@arm.com>, Atish Patra <atishp@atishpatra.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Julien Hascoet <jhascoet@kalray.eu>,
 Clement Leger <clement@clement-leger.fr>, linux-mm@kvack.org,
 Louis Morhet <lmorhet@kalray.eu>, Waiman Long <longman@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Guangbin Huang <huangguangbin2@huawei.com>, linux-arch@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Thomas Costis <tcostis@kalray.eu>,
 Jonathan Corbet <corbet@lwn.net>, Jonathan Borne <jborne@kalray.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Jean-Christophe Pince <jcpince@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bharat Bhushan <bbhushan2@marvell.com>, Qi Liu <liuqi115@huawei.com>,
 bpf@vger.kernel.org, Luc Michel <lmichel@kalray.eu>,
 devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Samuel Jones <sjones@kalray.eu>, linux-kernel@vger.kernel.org,
 Boqun Feng <boqun.feng@gmail.com>, John Garry <john.garry@huawei.com>,
 Julian Vetter <jvetter@kalray.eu>, Nick Piggin <npiggin@gmail.com>,
 Shaokun Zhang <zhangshaokun@hisilicon.com>, Rob Herring <robh+dt@kernel.org>,
 Bibo Mao <maobibo@loongson.cn>, Paul Walmsley <paul.walmsley@sifive.com>,
 WANG Xuerui <git@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Janosch Frank <frankja@linux.ibm.com>, Julien Villette <jvillette@kalray.eu>,
 Jules Maselbas <jmaselbas@kalray.eu>, Christian Brauner <brauner@kernel.org>,
 Benjamin Mugnier <mugnier.benjamin@gmail.com>,
 Vincent Chardon <vincent.chardon@elsys-design.com>,
 Guillaume Missonnier <gmissonnier@kalray.eu>, Oleg Nesterov <oleg@redhat.com>,
 Eric Paris <eparis@redhat.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 Guillaume Thouvenin <gthouvenin@kalray.eu>, Mark Brown <broonie@kernel.org>,
 Ashley Lesdalons <alesdalons@kalray.eu>,
 Eric Biederman <ebiederm@xmission.com>, linux-audit@redhat.com,
 Marius Gligor <mgligor@kalray.eu>, Alex Michon <amichon@kalray.eu>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


On Fri, 20 Jan 2023 15:09:38 +0100, Yann Sionneau wrote:
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
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/kalray/kalray,kv3-1-pwr-ctrl.yaml: $id: 'http://devicetree.org/schemas/kalray/kalray,kv3-1-pwr-ctrl#' does not match 'http://devicetree.org/schemas/.*\\.yaml#'
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/kalray/kalray,kv3-1-pwr-ctrl.yaml: 'maintainers' is a required property
	hint: Metaschema for devicetree binding documentation
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/kalray/kalray,kv3-1-pwr-ctrl.yaml: 'oneOf' conditional failed, one must be fixed:
	'unevaluatedProperties' is a required property
	'additionalProperties' is a required property
	hint: Either unevaluatedProperties or additionalProperties must be present
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
./Documentation/devicetree/bindings/kalray/kalray,kv3-1-pwr-ctrl.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/kalray/kalray,kv3-1-pwr-ctrl.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/kalray/kalray,kv3-1-pwr-ctrl.example.dtb: power-controller@a40000: reg: [[0, 10747904], [0, 16728]] is too long
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/kalray/kalray,kv3-1-pwr-ctrl.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/kalray/kalray,kv3-1-pwr-ctrl.example.dtb: power-controller@a40000: '#power-domain-cells' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/power/power-domain.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230120141002.2442-8-ysionneau@kalray.eu

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

