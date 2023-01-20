Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A3814675D7D
	for <lists+linux-audit@lfdr.de>; Fri, 20 Jan 2023 20:03:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674241402;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=E2VgBKWG8oc/kPzisgnzCN2UHQ7M95t0sVG694wFvEM=;
	b=GNDhtoGJSY4nVq612vRPS98E0b+t2m/QsiDWLryynGKXoC4ZaoHK0f7XpsO5yz3gG8KUIz
	KRuU603JcGOHqVpWk25wO0WIAt49cB5isR7rX1S5rLWWmj6XUtKRMHv4CfMXJ77hrhO3sy
	ro+MiacKU+M0J+RP8TuPVYzZkvF+Fdg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-MyW5JA4OMc2k7gU5weIsVA-1; Fri, 20 Jan 2023 14:03:17 -0500
X-MC-Unique: MyW5JA4OMc2k7gU5weIsVA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1BE321C087A9;
	Fri, 20 Jan 2023 19:02:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F221714171C1;
	Fri, 20 Jan 2023 19:02:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E57091946588;
	Fri, 20 Jan 2023 19:02:54 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A74221946588 for <linux-audit@listman.corp.redhat.com>;
 Fri, 20 Jan 2023 14:10:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7B4F3112131B; Fri, 20 Jan 2023 14:10:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 442951121315
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 14:10:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1786F8030D8
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 14:10:30 +0000 (UTC)
Received: from fx306.security-mail.net (smtpout30.security-mail.net
 [85.31.212.36]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-183-m5YCHth-OdG1Hopxrn10aw-1; Fri, 20 Jan 2023 09:10:28 -0500
X-MC-Unique: m5YCHth-OdG1Hopxrn10aw-1
Received: from localhost (fx306.security-mail.net [127.0.0.1])
 by fx306.security-mail.net (Postfix) with ESMTP id 2F0A635CEED
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 15:10:27 +0100 (CET)
Received: from fx306 (fx306.security-mail.net [127.0.0.1]) by
 fx306.security-mail.net (Postfix) with ESMTP id CC3FC35CE72; Fri, 20 Jan
 2023 15:10:26 +0100 (CET)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx306.security-mail.net (Postfix) with ESMTPS id 525A035CEDA; Fri, 20 Jan
 2023 15:10:26 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 1E8E727E0437; Fri, 20 Jan 2023
 15:10:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id E726C27E043A; Fri, 20 Jan 2023 15:10:25 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 4dOAwL90Msog; Fri, 20 Jan 2023 15:10:25 +0100 (CET)
Received: from junon.lin.mbt.kalray.eu (unknown [192.168.37.161]) by
 zimbra2.kalray.eu (Postfix) with ESMTPSA id 5C09A27E043D; Fri, 20 Jan 2023
 15:10:25 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <15347.63caa0d2.51414.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu E726C27E043A
From: Yann Sionneau <ysionneau@kalray.eu>
To: Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Thomas
 Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Will Deacon <will@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, Mark
 Rutland <mark.rutland@arm.com>, Eric Biederman <ebiederm@xmission.com>, Kees
 Cook <keescook@chromium.org>, Oleg Nesterov <oleg@redhat.com>, Ingo Molnar
 <mingo@redhat.com>, Waiman Long <longman@redhat.com>, "Aneesh Kumar K.V"
 <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>,
 Nick Piggin <npiggin@gmail.com>, Paul Moore <paul@paul-moore.com>, Eric
 Paris <eparis@redhat.com>, Christian Brauner <brauner@kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Jules Maselbas <jmaselbas@kalray.eu>,
 Yann Sionneau <ysionneau@kalray.eu>, Guillaume Thouvenin
 <gthouvenin@kalray.eu>, Clement Leger <clement@clement-leger.fr>, Vincent
 Chardon <vincent.chardon@elsys-design.com>, Marc =?utf-8?b?UG91bGhpw6hz?=
 <dkm@kataplop.net>, Julian Vetter <jvetter@kalray.eu>, Samuel Jones
 <sjones@kalray.eu>, Ashley Lesdalons <alesdalons@kalray.eu>, Thomas Costis
 <tcostis@kalray.eu>, Marius Gligor <mgligor@kalray.eu>, Jonathan Borne
 <jborne@kalray.eu>, Julien Villette <jvillette@kalray.eu>, Luc Michel
 <lmichel@kalray.eu>, Louis Morhet <lmorhet@kalray.eu>, Julien Hascoet
 <jhascoet@kalray.eu>, Jean-Christophe Pince <jcpince@gmail.com>, Guillaume
 Missonnier <gmissonnier@kalray.eu>, Alex Michon <amichon@kalray.eu>, Huacai
 Chen <chenhuacai@kernel.org>, WANG Xuerui <git@xen0n.name>, Shaokun Zhang
 <zhangshaokun@hisilicon.com>, John Garry <john.garry@huawei.com>, Guangbin
 Huang <huangguangbin2@huawei.com>, Bharat Bhushan <bbhushan2@marvell.com>,
 Bibo Mao <maobibo@loongson.cn>, Atish Patra <atishp@atishpatra.org>, "Jason
 A. Donenfeld" <Jason@zx2c4.com>, Qi Liu <liuqi115@huawei.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark
 Brown <broonie@kernel.org>, Janosch Frank <frankja@linux.ibm.com>, Alexey
 Dobriyan <adobriyan@gmail.com>
Subject: [RFC PATCH v2 03/31] Documentation: Add binding for
 kalray,kv3-1-apic-gic
Date: Fri, 20 Jan 2023 15:09:34 +0100
Message-ID: <20230120141002.2442-4-ysionneau@kalray.eu>
In-Reply-To: <20230120141002.2442-1-ysionneau@kalray.eu>
References: <20230120141002.2442-1-ysionneau@kalray.eu>
MIME-Version: 1.0
X-ALTERMIMEV2_out: done
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
Cc: linux-arch@vger.kernel.org, devicetree@vger.kernel.org,
 Benjamin Mugnier <mugnier.benjamin@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-audit@redhat.com,
 linux-riscv@lists.infradead.org, bpf@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Jules Maselbas <jmaselbas@kalray.eu>

Add documentation for `kalray,kv3-1-apic-gic` binding.

Co-developed-by: Jules Maselbas <jmaselbas@kalray.eu>
Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
---

Notes:
    V1 -> V2: new patch

 .../kalray,kv3-1-apic-gic.yaml                | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/kalray,kv3-1-apic-gic.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/kalray,kv3-1-apic-gic.yaml b/Documentation/devicetree/bindings/interrupt-controller/kalray,kv3-1-apic-gic.yaml
new file mode 100644
index 000000000000..7a37f19db2fb
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/kalray,kv3-1-apic-gic.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/kalray,kv3-1-apic-gic#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Kalray kv3-1 APIC-GIC
+
+description: |
+  Each cluster in the Coolidge SoC includes an Advanced Programmable Interrupt
+  Controller (APIC) which is split in two part:
+    - a Generic Interrupt Controller (referred as APIC-GIC)
+    - a Mailbox Controller           (referred as APIC-Mailbox)
+  The APIC-GIC acts as an intermediary interrupt controller, muxing/routing
+  incoming interrupts to output interrupts connected to kvx cores interrupts lines.
+  The 139 possible input interrupt lines are organized as follow:
+     - 128 from the mailbox controller (one it per mailboxes)
+     - 1   from the NoC router
+     - 5   from IOMMUs
+     - 1   from L2 cache DMA job FIFO
+     - 1   from cluster watchdog
+     - 2   for SECC, DECC
+     - 1   from Data NoC
+  The 72 possible output interrupt lines:
+     -  68 : 4 interrupts per cores (17 cores)
+     -  1 for L2 cache controller
+     -  3 extra that are for padding
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+properties:
+  compatible:
+    const: kalray,kv3-1-apic-gic
+  "#interrupt-cells":
+    const: 1
+    description:
+      The IRQ number.
+  interrupt-controller: true
+  interrupt-parent: true
+  interrupts:
+    maxItems: 4
+    description: |
+     Specifies the interrupt line(s) in the interrupt-parent controller node;
+     valid values depend on the type of parent interrupt controller
+
+required:
+  - compatible
+  - reg
+  - "#interrupt-cells"
+  - interrupt-controller
+  - interrupt-parent
+  - interrupts
+
+examples:
+  - |
+    apic_gic: interrupt-controller@a20000 {
+        compatible = "kalray,kv3-1-apic-gic";
+        reg = <0 0xa20000 0 0x12000>;
+        #interrupt-cells = <1>;
+        interrupt-controller;
+        interrupt-parent = <&intc>;
+        interrups = <4 5 6 7>;
+    };
+
+...
-- 
2.37.2





--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

