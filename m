Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA6F675D5D
	for <lists+linux-audit@lfdr.de>; Fri, 20 Jan 2023 20:03:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674241384;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=msknAbukPJ7tmorwu8ShZu6fXKc+h0Ey7IXg9tzZrlY=;
	b=P/HZH6yWb3+MJOmBNxTV9Mc0wb52nnY6/bxQLIyYub0516xXJm67wFxMMbVs9lWaOKCzux
	I9ejfNtGqtCT+93pMmu1ABp02/OyDA2O74XAq8Gk8oKHKRY879piCcecgex5tj46bWrQjT
	HCa2WO3F+Rf2+N2Wr1Olcm9Q/viCpZo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-d9JfQw2OOV6vAd1pmvfbMw-1; Fri, 20 Jan 2023 14:03:02 -0500
X-MC-Unique: d9JfQw2OOV6vAd1pmvfbMw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD84F3803920;
	Fri, 20 Jan 2023 19:02:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9059840E0427;
	Fri, 20 Jan 2023 19:02:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B9BA81947072;
	Fri, 20 Jan 2023 19:02:51 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 11E171946588 for <linux-audit@listman.corp.redhat.com>;
 Fri, 20 Jan 2023 15:01:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 014E41415108; Fri, 20 Jan 2023 15:01:40 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED196140EBF6
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 15:01:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BAD8D1C0A59B
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 15:01:39 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com
 (wout1-smtp.messagingengine.com [64.147.123.24]) by relay.mimecast.com with
 ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-487-Eqy21U4oOBWKylk9QoUCGw-1; Fri, 20 Jan 2023 10:01:36 -0500
X-MC-Unique: Eqy21U4oOBWKylk9QoUCGw-1
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 64F0B320077A;
 Fri, 20 Jan 2023 10:01:33 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Fri, 20 Jan 2023 10:01:34 -0500
X-ME-Sender: <xms:y6zKY1--FxFV5WM_dvH3L-jhvDJdkUv2VKNjqycw8wsWi1kY60t_Hg>
 <xme:y6zKY5uEr8VwywOYKxxuRFHA2t7uhUz8er2Qni3FDxgSf42PnIomr8bT4uWQPMrSj
 vl6wYFssrKwy6qpeIw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudduvddgjeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
 teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:y6zKYzAQI32j9NDjRfMqwyTzyHZ7gpDAsgcrznJyKaxYWkjqDKkMig>
 <xmx:y6zKY5dwnJnhoe3QJUqC8kllrSTTegH2oqUNSRINTZtDGCG_doy8wg>
 <xmx:y6zKY6NeO-4u4ZZ4r7o7F71zTnD9XHdwpsJ3MbruCFIRzX2R-IamTw>
 <xmx:zKzKY0uSG_2mGZuS71TMJo-MA0P9EOIrBzWmkXOZx-9ZotVtWq1S0w>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 786ABB60086; Fri, 20 Jan 2023 10:01:31 -0500 (EST)
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <9965e2d1-bae8-4ce7-911c-783c772e9ff1@app.fastmail.com>
In-Reply-To: <20230120145316.GA4155@tellis.lin.mbt.kalray.eu>
References: <20230120141002.2442-1-ysionneau@kalray.eu>
 <20230120141002.2442-10-ysionneau@kalray.eu>
 <aa4d68b2-b5b5-4c17-a44f-7c6db443ea4c@app.fastmail.com>
 <20230120145316.GA4155@tellis.lin.mbt.kalray.eu>
Date: Fri, 20 Jan 2023 16:01:11 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jules Maselbas" <jmaselbas@kalray.eu>
Subject: Re: [RFC PATCH v2 09/31] kvx: Add build infrastructure
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>,
 =?UTF-8?Q?Marc_Poulhi=C3=A8s?= <dkm@kataplop.net>, linux-doc@vger.kernel.org,
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
 Linux-Arch <linux-arch@vger.kernel.org>,
 Jean-Christophe Pince <jcpince@gmail.com>, Waiman Long <longman@redhat.com>,
 Bharat Bhushan <bbhushan2@marvell.com>, Qi Liu <liuqi115@huawei.com>,
 Alexey Dobriyan <adobriyan@gmail.com>, Luc Michel <lmichel@kalray.eu>,
 John Garry <john.garry@huawei.com>, Ashley Lesdalons <alesdalons@kalray.eu>,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Yann Sionneau <ysionneau@kalray.eu>, Boqun Feng <boqun.feng@gmail.com>,
 Guillaume Thouvenin <gthouvenin@kalray.eu>, Julian Vetter <jvetter@kalray.eu>,
 Nicholas Piggin <npiggin@gmail.com>,
 Shaokun Zhang <zhangshaokun@hisilicon.com>, Rob Herring <robh+dt@kernel.org>,
 Bibo Mao <maobibo@loongson.cn>, Paul Walmsley <paul.walmsley@sifive.com>,
 WANG Xuerui <git@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>,
 Marius Gligor <mgligor@kalray.eu>, Janosch Frank <frankja@linux.ibm.com>,
 Julien Villette <jvillette@kalray.eu>, linux-audit@redhat.com,
 Christian Brauner <brauner@kernel.org>,
 Benjamin Mugnier <mugnier.benjamin@gmail.com>,
 Vincent Chardon <vincent.chardon@elsys-design.com>,
 Guillaume Missonnier <gmissonnier@kalray.eu>, Oleg Nesterov <oleg@redhat.com>,
 Eric Paris <eparis@redhat.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 20, 2023, at 15:53, Jules Maselbas wrote:
> On Fri, Jan 20, 2023 at 03:39:22PM +0100, Arnd Bergmann wrote:
>> On Fri, Jan 20, 2023, at 15:09, Yann Sionneau wrote:
>> >      - Fix clean target raising an error from gcc (LIBGCC)
>> 
>> I had not noticed this on v1 but:
>> 
>> > +# Link with libgcc to get __div* builtins.
>> > +LIBGCC	:= $(shell $(CC) $(DEFAULT_OPTS) --print-libgcc-file-name)
>> 
>> It's better to copy the bits of libgcc that you actually need
>> than to include the whole thing. The kernel is in a weird
> It was initialy using KCONFIG_CFLAGS which do not contains valid options
> when invoking the clean target.
>
> I am not exactly sure what's needed by gcc for --print-libgcc-file-name,
> my guess is that only the -march option matters, I will double check
> internally with compiler peoples.
>
>> state that is neither freestanding nor the normal libc based
>> environment, so we generally want full control over what is
>> used. This is particularly important for 32-bit architectures
>> that do not want the 64-bit division, but there are probably
>> enough other cases as well.

To clarify: I meant you should not include libgcc.a at all but
add the minimum set of required files as arch/kvx/lib/*.S.

     Arnd

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

