Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A475665D500
	for <lists+linux-audit@lfdr.de>; Wed,  4 Jan 2023 15:07:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672841255;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fOZK0pjUpDsXxnMnMr5Jx39yqn7n9sw/TWvRaAuIME4=;
	b=RXD0EJc6rNzMCeatemFSozu+Gsdwj2nWFczji0AXo6/X4uyBsG2O9KfNuEiE5fkJ1yZYYO
	KYXAPyonwAXeGzJitJLspADBpInNQaa9m/6yxEtuNFhURB9fQgSu7HjWejYxN+4a7OzOF9
	gDXwGK5ghoILbMQmxQAin5LPumHJuww=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-379-iF3J3bUSPrOzr-x79nceWA-1; Wed, 04 Jan 2023 09:07:32 -0500
X-MC-Unique: iF3J3bUSPrOzr-x79nceWA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8DA74811E6E;
	Wed,  4 Jan 2023 14:07:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7E369C15BA0;
	Wed,  4 Jan 2023 14:07:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B3EDE19465A0;
	Wed,  4 Jan 2023 14:07:19 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D675C1946587 for <linux-audit@listman.corp.redhat.com>;
 Tue,  3 Jan 2023 16:50:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id ABC292026D68; Tue,  3 Jan 2023 16:50:06 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A3BCD2026D4B
 for <linux-audit@redhat.com>; Tue,  3 Jan 2023 16:50:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 846E38030A0
 for <linux-audit@redhat.com>; Tue,  3 Jan 2023 16:50:06 +0000 (UTC)
Received: from fx303.security-mail.net (mxout.security-mail.net
 [85.31.212.46]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-313-vkcj8RZuMPalFtTxwsjJuw-1; Tue, 03 Jan 2023 11:50:05 -0500
X-MC-Unique: vkcj8RZuMPalFtTxwsjJuw-1
Received: from localhost (fx303.security-mail.net [127.0.0.1])
 by fx303.security-mail.net (Postfix) with ESMTP id 7624130F776
 for <linux-audit@redhat.com>; Tue,  3 Jan 2023 17:44:32 +0100 (CET)
Received: from fx303 (fx303.security-mail.net [127.0.0.1]) by
 fx303.security-mail.net (Postfix) with ESMTP id 242F630F757; Tue,  3 Jan
 2023 17:44:32 +0100 (CET)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx303.security-mail.net (Postfix) with ESMTPS id 3C57F30F6D9; Tue,  3 Jan
 2023 17:44:31 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 1197027E03F6; Tue,  3 Jan 2023
 17:44:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id DA1B427E03FD; Tue,  3 Jan 2023 17:44:30 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 5JvnSL-6Jy3z; Tue,  3 Jan 2023 17:44:30 +0100 (CET)
Received: from junon.lin.mbt.kalray.eu (unknown [192.168.37.161]) by
 zimbra2.kalray.eu (Postfix) with ESMTPSA id B500D27E03F8; Tue,  3 Jan 2023
 17:44:30 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <10abe.63b45b6f.396d0.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu DA1B427E03FD
From: Yann Sionneau <ysionneau@kalray.eu>
To: 
Subject: [RFC PATCH 02/25] kvx: Add ELF-related definitions
Date: Tue,  3 Jan 2023 17:43:36 +0100
Message-ID: <20230103164359.24347-3-ysionneau@kalray.eu>
In-Reply-To: <20230103164359.24347-1-ysionneau@kalray.eu>
References: <20230103164359.24347-1-ysionneau@kalray.eu>
MIME-Version: 1.0
X-ALTERMIMEV2_out: done
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Wed, 04 Jan 2023 14:07:19 +0000
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
Cc: Kees Cook <keescook@chromium.org>, Yann Sionneau <ysionneau@kalray.eu>,
 linux-kernel@vger.kernel.org, Eric Paris <eparis@redhat.com>,
 linux-mm@kvack.org, linux-audit@redhat.com,
 Eric Biederman <ebiederm@xmission.com>,
 Clement Leger <clement.leger@bootlin.com>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add ELF-related definitions for kvx, including: EM_KVX,
AUDIT_ARCH_KVX and NT_KVX_TCA.

CC: Paul Moore <paul@paul-moore.com>
CC: Eric Paris <eparis@redhat.com>
CC: Eric Biederman <ebiederm@xmission.com>
CC: Kees Cook <keescook@chromium.org>
CC: linux-audit@redhat.com
CC: linux-kernel@vger.kernel.org
CC: linux-mm@kvack.org
Co-developed-by: Clement Leger <clement.leger@bootlin.com>
Signed-off-by: Clement Leger <clement.leger@bootlin.com>
Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
---
 include/uapi/linux/audit.h  | 1 +
 include/uapi/linux/elf-em.h | 1 +
 include/uapi/linux/elf.h    | 1 +
 3 files changed, 3 insertions(+)

diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
index d676ed2b246e..4db7aa3f84c7 100644
--- a/include/uapi/linux/audit.h
+++ b/include/uapi/linux/audit.h
@@ -402,6 +402,7 @@ enum {
 #define AUDIT_ARCH_HEXAGON	(EM_HEXAGON)
 #define AUDIT_ARCH_I386		(EM_386|__AUDIT_ARCH_LE)
 #define AUDIT_ARCH_IA64		(EM_IA_64|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
+#define AUDIT_ARCH_KVX		(EM_KVX|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
 #define AUDIT_ARCH_M32R		(EM_M32R)
 #define AUDIT_ARCH_M68K		(EM_68K)
 #define AUDIT_ARCH_MICROBLAZE	(EM_MICROBLAZE)
diff --git a/include/uapi/linux/elf-em.h b/include/uapi/linux/elf-em.h
index ef38c2bc5ab7..9cc348be7f86 100644
--- a/include/uapi/linux/elf-em.h
+++ b/include/uapi/linux/elf-em.h
@@ -51,6 +51,7 @@
 #define EM_RISCV	243	/* RISC-V */
 #define EM_BPF		247	/* Linux BPF - in-kernel virtual machine */
 #define EM_CSKY		252	/* C-SKY */
+#define EM_KVX		256	/* Kalray VLIW Architecture */
 #define EM_LOONGARCH	258	/* LoongArch */
 #define EM_FRV		0x5441	/* Fujitsu FR-V */
 
diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
index c7b056af9ef0..49094f3be06c 100644
--- a/include/uapi/linux/elf.h
+++ b/include/uapi/linux/elf.h
@@ -444,6 +444,7 @@ typedef struct elf64_shdr {
 #define NT_LOONGARCH_LSX	0xa02	/* LoongArch Loongson SIMD Extension registers */
 #define NT_LOONGARCH_LASX	0xa03	/* LoongArch Loongson Advanced SIMD Extension registers */
 #define NT_LOONGARCH_LBT	0xa04	/* LoongArch Loongson Binary Translation registers */
+#define NT_KVX_TCA		0x900	/* kvx TCA registers */
 
 /* Note types with note name "GNU" */
 #define NT_GNU_PROPERTY_TYPE_0	5
-- 
2.37.2





--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

