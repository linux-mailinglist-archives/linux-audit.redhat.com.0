Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 423785ECD60
	for <lists+linux-audit@lfdr.de>; Tue, 27 Sep 2022 21:58:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664308680;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BZh+cjgSQWpoVxfrjnNneZpAAaNdLYbyIALJMB1lptc=;
	b=gcwKNlNJ3WTrjTXwioColtxJN8nJDwT8WrVM1pi6TVodVo1i9LSKdsH9ZenYtiZdQ5JhTG
	PW40UO4A4YNofuFg9Y7xBJ2i4PXox7cn0sl1v8OpKYs6dnWpAgfCfuypoUXWAEQhy9M2bx
	dCUePzwXzSYE5ajXByibXukLxxvE7V8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-y__GiIrvOXa-o0xsUfm_8w-1; Tue, 27 Sep 2022 15:57:56 -0400
X-MC-Unique: y__GiIrvOXa-o0xsUfm_8w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14F731019C89;
	Tue, 27 Sep 2022 19:57:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B428A40C6EC2;
	Tue, 27 Sep 2022 19:57:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 58A061946A48;
	Tue, 27 Sep 2022 19:57:54 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B1F961946586 for <linux-audit@listman.corp.redhat.com>;
 Tue, 27 Sep 2022 19:57:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A327C40C6EC3; Tue, 27 Sep 2022 19:57:52 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BB9F40C6EC2
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 19:57:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 487BF811E67
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 19:57:52 +0000 (UTC)
Received: from sonic308-15.consmr.mail.ne1.yahoo.com
 (sonic308-15.consmr.mail.ne1.yahoo.com [66.163.187.38]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-110-lJWLZwErPG-3PP2x8YJ_YA-1; Tue,
 27 Sep 2022 15:57:50 -0400
X-MC-Unique: lJWLZwErPG-3PP2x8YJ_YA-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1664308668; bh=T5jk2y9T+drXO7O7D/paeS4v82VxdgLXsarm0U+wPSI=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=nriGsB+SwRfS51E4D3Pl73EEk58z9EmTyrlc2HvUeHE5zilaruoE12yk8UkKV58b/neKEQZj7PGTo8xzSVxJUMF78v9/Knii2Xj/jl/vaB4kRFt6h0ffNvUautLhBlPP7bOrF13PTJsQ+vo9VAOLUfx/GHFXCiaS3dD8cFPiRFb7z3gexR5IPOxZMlrGxRNnUwnnjJwrO6R+vcK5IoJBesZ2B3J7qjYmBojPFEYbHjeuphuy2r7mo9+lkDCJ+XDUsUvRrnwxfZtVWdZPFIHMAhnZLQ5xs2i2Shhzwn5Q70Ro1r+2pDHG6nwrW4qemu8/r9Dt+B6A5Z+ggLdMEGnlpA==
X-YMail-OSG: nJkogSEVM1kNj9s_zZ4BVO2HQfXmit.YqhGXtyRLsJFnqJdKJhV7hrJ0W2QfTf2
 oBG1ouBlJNBHlhXqafIkSqdKHkW673ItUu9GQJPEudY.qnmfKk2QAMa133Xj_AVMmBBqtn.MQ74g
 DnTV.O1HJq4r7EeXiiJc14uEkYDKDZlnRmH3xNk.TfgBYiUO7XnSISRssQY3ENP2TIwxNKUJowbC
 q7Lr7ZQj6t.314UPhlRQRb.Ntw098uvHTfJMog4eJLg.qjndkqBX3XLi4ogGML_MPgo3loROyBBp
 r88qXe7rK2UF1MGi5mA.NqP7oQ6q8pZjXTXIJOnKXEwMPgF0MUnvQBW8NA2jV2qDV1lPBnc84ICD
 5HgJNZyK9AzAdtrtWQ5kU4.LtmLe4Ar6EbbnZc8tG.5_OUAr07JDWRLcaa6V0Wg6NTNA0AETqBYt
 R8s..3uQ1LTsaPFbpMNA_6.Bi_PQEvZCCOAyRSATKz8GyzdzunXv7jKsAwDVvG4ikcMPbWhswlOK
 XrMBodF91rpHTI.Wj_UqlR_s7ifXL8XYerxS73o2SohoAdYx2K5Xul_PN9CQ8o14JLgBneOR4h4m
 rLw8B4qmZxbpGAbcAd2ZlL4Qrs.c2ecYqZsPI_f9OsYTvF0SKcR_.f_a6PENF7hz9NsZ5airJDmS
 qUq91QhnbKsM.Zx7Sgpv125nnzPSfxilhtnD794_pgVbAFQK1AC1zJwGN2izifyq2Wuliy5Pkg9y
 PBijVhnafYeAQujZzyJu2xxqyVChJ6GtjGdeRwswjRATDrGjh41UymdA6rRiG3Nm_pNnxFhJsbqh
 v5ePw8Q3RoncBNTxF3hYztPzO61sCaTeULYIo19cZIR.g3ddsM7Bho8kS_i7QUGOw_lO2hKl.BJz
 FPtWwdV6hiBddDKzZ9hSAetzg6rLg6TQn6osD2LUNwSBDxcPiTR.JvLXy9ZFCiOszhRWG_S2wbj_
 fo25hwZWF6A5uTf9qSUyA.xjQtfzuNntWLwZh2KYm6J0U2eA4BHx.NA6yOma1oQzs4P0uwqXwkIC
 tWaEZlRIPslysP14OGp26hK8DWrXnGzo244vN8JXLz.HGIutArpPNfClLUkJ8B2djgWHVSaX9zBI
 Itti8k.VPOel5ZncGXGThquDYgb8kaEXnyRkPZdM830oDcz8cS6IdKpvotc1GTB73xG_x_X_hgCt
 nRBgCXMDpoYZSjbzPLcI.bNO.koaSw1.zKkIIIA2kudTsGedWvfiQLD130XtfhNcfzWhUJEpP6Tm
 3TH5bw3A_WaCH8WpP166Dyo86J0aUej2mjXzU5nKFA2yNkjEOjW8MHrcr6xZcLK6bGRv18MA2Ip0
 .tNOWhicmE7vszXSnzrHSASoBZoh7JfrDLbWLxZefVHK3JKz0nAtDn2VYHBvkVRpmVPzYPp9x32G
 o72Px3c5mwv6w3WbhHTINdpKfy5KSrzxg71K3tNCPYnpdsAhFVoe5g2angkTZ2kY713ujPn8lGDM
 1Oo4GiJRyGRPu1d_bIk0B2TJp2jnPUY35uTDVq6A0l.Q1ilzgUNrq0eGCi4BhkAcJI8hvJMOy_aJ
 mNje9J_B5szqbv22R68t1PBgGlaiMJwoc1iHdtsuJa6dS25IqzamgoSXS.zercrjjH2gxqNb23no
 he5HDJ.XKfgWGGvra7ET3MeSj5kqJ9udxWrCyI9kSUJrgmZbbRsiezat1I5OZ2K6NEkag.pkH.Vh
 1LUThUc6onEied.nl6Oa1qsjXUKI2yyl09Fc10VaZKD0F7TkI5rHmet525ifPJr4jLjcpGfZW6IU
 P_9viAxGq6TgHpMqiF3BNwsQE6skrvA4363evvTezWeeceMvEyReXjyp8HQ77vhnxB1R.Nw37Njr
 5ihQ60lMDBp7.LGi99FoH2nhClTB1PoL2Bswe8CkTofOWyGp1WMJnDwYIpAi5y8v61iCZFXuzHTZ
 94MOfZzVfjtyvfM8lNfKz.ApIRfVPFASWhisq9Qg5mOfOjH4e24B3Svxorw.nuFYl0rGYJv.1kjp
 s0sj4KU7oN_ow2I5aGRCx6h93OAOena9FeLpEbghAtFJ8UX75Jiw9II5XgRvyedsU.iiUN.7E8Op
 2zQTIsa969iR5vFX5gK.aTPqZJt1wdxUvpCUhcuCeXGs.34LvV2MkY54Y_9xYE4IS0rBqdUKHS7Q
 .Dm7fwtX7CAkUkAEUq5o0Yb1qzM_Xon1ftMv5hYKQ_e0oZZAMkrB5C45yACMQX_cfFgziSDDJKJt
 nfJlHhkcUozWMrBR4J2LOY7OefvbhWY8zqFkdOjonBlqjz_W_Y6KSfBQdWp65fkx8V0j.rbuQVyA
 UmD_enXgHglL1ZZFWWwLzIwy.S8KTI5zek06Y50jO
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.ne1.yahoo.com with HTTP; Tue, 27 Sep 2022 19:57:48 +0000
Received: by hermes--production-gq1-7dfd88c84d-65w2z (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 29caefd968e6c103fbfc34a90b4ad636; 
 Tue, 27 Sep 2022 19:57:45 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, paul@paul-moore.com,
 linux-security-module@vger.kernel.org
Subject: [PATCH v38 06/39] LSM: lsm_self_attr syscall for LSM self attributes
Date: Tue, 27 Sep 2022 12:53:48 -0700
Message-Id: <20220927195421.14713-7-casey@schaufler-ca.com>
In-Reply-To: <20220927195421.14713-1-casey@schaufler-ca.com>
References: <20220927195421.14713-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
Cc: john.johansen@canonical.com, selinux@vger.kernel.org, jmorris@namei.org,
 linux-kernel@vger.kernel.org, linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Create a system call lsm_self_attr() to provide the security
module maintained attributes of the current process. Historically
these attributes have been exposed to user space via entries in
procfs under /proc/self/attr.

Attributes are provided as a collection of lsm_ctx structures
which are placed into a user supplied buffer. Each structure
identifys the security module providing the attribute, which
of the possible attributes is provided, the size of the
attribute, and finally the attribute value. The format of the
attribute value is defined by the security module, but will
always be \0 terminated. The ctx_len value will be larger than
strlen(ctx).

	------------------------------
	| unsigned int id            |
	------------------------------
	| unsigned int flags         |
	------------------------------
	| __kernel_size_t ctx_len    |
	------------------------------
	| unsigned char ctx[ctx_len] |
	------------------------------
	| unsigned int id            |
	------------------------------
	| unsigned int flags         |
	------------------------------
	| __kernel_size_t ctx_len    |
	------------------------------
	| unsigned char ctx[ctx_len] |
	------------------------------

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 arch/x86/entry/syscalls/syscall_64.tbl |   1 +
 include/linux/syscalls.h               |   1 +
 include/uapi/asm-generic/unistd.h      |   5 +-
 include/uapi/linux/lsm.h               |  21 ++++
 kernel/sys_ni.c                        |   3 +
 security/Makefile                      |   1 +
 security/lsm_syscalls.c                | 156 +++++++++++++++++++++++++
 7 files changed, 187 insertions(+), 1 deletion(-)
 create mode 100644 security/lsm_syscalls.c

diff --git a/arch/x86/entry/syscalls/syscall_64.tbl b/arch/x86/entry/syscalls/syscall_64.tbl
index c84d12608cd2..56d5c5202fd0 100644
--- a/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/arch/x86/entry/syscalls/syscall_64.tbl
@@ -372,6 +372,7 @@
 448	common	process_mrelease	sys_process_mrelease
 449	common	futex_waitv		sys_futex_waitv
 450	common	set_mempolicy_home_node	sys_set_mempolicy_home_node
+451	common	lsm_self_attr		sys_lsm_self_attr
 
 #
 # Due to a historical design error, certain syscalls are numbered differently
diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index a34b0f9a9972..7f87ef8be546 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -1056,6 +1056,7 @@ asmlinkage long sys_memfd_secret(unsigned int flags);
 asmlinkage long sys_set_mempolicy_home_node(unsigned long start, unsigned long len,
 					    unsigned long home_node,
 					    unsigned long flags);
+asmlinkage long sys_lsm_self_attr(struct lsm_ctx *ctx, size_t *size, int flags);
 
 /*
  * Architecture-specific system calls
diff --git a/include/uapi/asm-generic/unistd.h b/include/uapi/asm-generic/unistd.h
index 45fa180cc56a..aa66718e1b48 100644
--- a/include/uapi/asm-generic/unistd.h
+++ b/include/uapi/asm-generic/unistd.h
@@ -886,8 +886,11 @@ __SYSCALL(__NR_futex_waitv, sys_futex_waitv)
 #define __NR_set_mempolicy_home_node 450
 __SYSCALL(__NR_set_mempolicy_home_node, sys_set_mempolicy_home_node)
 
+#define __NR_lsm_self_attr 451
+__SYSCALL(__NR_lsm_self_attr, sys_lsm_self_attr)
+
 #undef __NR_syscalls
-#define __NR_syscalls 451
+#define __NR_syscalls 452
 
 /*
  * 32 bit systems traditionally used different
diff --git a/include/uapi/linux/lsm.h b/include/uapi/linux/lsm.h
index 4bb692b84a28..5acd791f82a9 100644
--- a/include/uapi/linux/lsm.h
+++ b/include/uapi/linux/lsm.h
@@ -9,6 +9,27 @@
 #ifndef _UAPI_LINUX_LSM_H
 #define _UAPI_LINUX_LSM_H
 
+#include <linux/types.h>
+#include <linux/unistd.h>
+
+/**
+ * struct lsm_ctx - LSM context
+ * @id: the LSM id number, see LSM_ID_XXX
+ * @flags: context specifier and LSM specific flags
+ * @ctx_len: the size of @ctx
+ * @ctx: the LSM context, a nul terminated string
+ *
+ * @ctx in a nul terminated string.
+ *	(strlen(@ctx) < @ctx_len) is always true.
+ *	(strlen(@ctx) == @ctx_len + 1) is not guaranteed.
+ */
+struct lsm_ctx {
+	unsigned int		id;
+	unsigned int		flags;
+	__kernel_size_t		ctx_len;
+	unsigned char		ctx[];
+};
+
 /*
  * ID values to identify security modules.
  * A system may use more than one security module.
diff --git a/kernel/sys_ni.c b/kernel/sys_ni.c
index 860b2dcf3ac4..0fdb0341251d 100644
--- a/kernel/sys_ni.c
+++ b/kernel/sys_ni.c
@@ -262,6 +262,9 @@ COND_SYSCALL_COMPAT(recvmsg);
 /* mm/nommu.c, also with MMU */
 COND_SYSCALL(mremap);
 
+/* security/lsm_syscalls.c */
+COND_SYSCALL(lsm_self_attr);
+
 /* security/keys/keyctl.c */
 COND_SYSCALL(add_key);
 COND_SYSCALL(request_key);
diff --git a/security/Makefile b/security/Makefile
index 18121f8f85cd..59f238490665 100644
--- a/security/Makefile
+++ b/security/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_KEYS)			+= keys/
 
 # always enable default capabilities
 obj-y					+= commoncap.o
+obj-$(CONFIG_SECURITY) 			+= lsm_syscalls.o
 obj-$(CONFIG_MMU)			+= min_addr.o
 
 # Object file lists
diff --git a/security/lsm_syscalls.c b/security/lsm_syscalls.c
new file mode 100644
index 000000000000..da0fab7065e2
--- /dev/null
+++ b/security/lsm_syscalls.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * System calls implementing the Linux Security Module API.
+ *
+ *  Copyright (C) 2022 Casey Schaufler <casey@schaufler-ca.com>
+ *  Copyright (C) Intel Corporation
+ */
+
+#include <asm/current.h>
+#include <linux/compiler_types.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/security.h>
+#include <linux/stddef.h>
+#include <linux/syscalls.h>
+#include <linux/types.h>
+#include <linux/lsm_hooks.h>
+#include <uapi/linux/lsm.h>
+
+struct feature_map {
+	char *name;
+	int feature;
+};
+
+static const struct feature_map lsm_attr_names[] = {
+	{ .name = "current",	.feature = LSM_ATTR_CURRENT, },
+	{ .name = "exec",	.feature = LSM_ATTR_EXEC, },
+	{ .name = "fscreate",	.feature = LSM_ATTR_FSCREATE, },
+	{ .name = "keycreate",	.feature = LSM_ATTR_KEYCREATE, },
+	{ .name = "prev",	.feature = LSM_ATTR_PREV, },
+	{ .name = "sockcreate",	.feature = LSM_ATTR_SOCKCREATE, },
+};
+
+/**
+ * lsm_self_attr - Return current task's security module attributes
+ * @ctx: the LSM contexts
+ * @size: size of @ctx, updated on return
+ * @flags: reserved for future use, must be zero
+ *
+ * Returns the calling task's LSM contexts. On success this
+ * function returns the number of @ctx array elements. This value
+ * may be zero if there are no LSM contexts assigned. If @size is
+ * insufficient to contain the return data -E2BIG is returned and
+ * @size is set to the minimum required size. In all other cases
+ * a negative value indicating the error is returned.
+ */
+SYSCALL_DEFINE3(lsm_self_attr,
+	       struct lsm_ctx __user *, ctx,
+	       size_t __user *, size,
+	       int, flags)
+{
+	struct lsm_ctx *final = NULL;
+	struct lsm_ctx *interum;
+	struct lsm_ctx *ip;
+	void *curr;
+	char **interum_ctx;
+	char *cp;
+	size_t total_size = 0;
+	int count = 0;
+	int attr;
+	int len;
+	int rc = 0;
+	int i;
+
+	interum = kzalloc(ARRAY_SIZE(lsm_attr_names) * lsm_id *
+			  sizeof(*interum), GFP_KERNEL);
+	if (interum == NULL)
+		return -ENOMEM;
+	ip = interum;
+
+	interum_ctx = kzalloc(ARRAY_SIZE(lsm_attr_names) * lsm_id *
+			      sizeof(*interum_ctx), GFP_KERNEL);
+	if (interum_ctx == NULL) {
+		kfree(interum);
+		return -ENOMEM;
+	}
+
+	for (attr = 0; attr < ARRAY_SIZE(lsm_attr_names); attr++) {
+		for (i = 0; i < lsm_id; i++) {
+			if ((lsm_idlist[i]->features &
+			     lsm_attr_names[attr].feature) == 0)
+				continue;
+
+			len = security_getprocattr(current, lsm_idlist[i]->id,
+						   lsm_attr_names[attr].name,
+						   &cp);
+			if (len <= 0)
+				continue;
+
+			ip->id = lsm_idlist[i]->id;
+			ip->flags = lsm_attr_names[attr].feature;
+			/* space for terminating \0 is allocated below */
+			ip->ctx_len = len + 1;
+			interum_ctx[count] = cp;
+			/*
+			 * Security modules have been inconsistent about
+			 * including the \0 terminator in the size. The
+			 * context len has been adjusted to ensure there
+			 * is one.
+			 * At least one security module adds a \n at the
+			 * end of a context to make it look nicer. Change
+			 * that to a \0 so that user space doesn't have to
+			 * work around it. Because of this meddling it is
+			 * safe to assume that lsm_ctx.name is terminated
+			 * and that strlen(lsm_ctx.name) < lsm.ctx_len.
+			 */
+			total_size += sizeof(*interum) + ip->ctx_len;
+			cp = strnchr(cp, len, '\n');
+			if (cp != NULL)
+				*cp = '\0';
+			ip++;
+			count++;
+		}
+	}
+
+	if (count == 0)
+		goto free_out;
+
+	final = kzalloc(total_size, GFP_KERNEL);
+	if (final == NULL) {
+		rc = -ENOMEM;
+		goto free_out;
+	}
+
+	curr = final;
+	ip = interum;
+	for (i = 0; i < count; i++) {
+		memcpy(curr, ip, sizeof(*interum));
+		curr += sizeof(*interum);
+		memcpy(curr, interum_ctx[i], ip->ctx_len);
+		curr += ip->ctx_len;
+		ip++;
+	}
+
+	if (get_user(len, size)) {
+		rc = -EFAULT;
+		goto free_out;
+	}
+	if (total_size > len) {
+		rc = -ERANGE;
+		goto free_out;
+	}
+	if (copy_to_user(ctx, final, total_size) != 0 ||
+	    put_user(total_size, size) != 0)
+		rc = -EFAULT;
+	else
+		rc = count;
+
+free_out:
+	for (i = 0; i < count; i++)
+		kfree(interum_ctx[i]);
+	kfree(interum_ctx);
+	kfree(interum);
+	kfree(final);
+	return rc;
+}
-- 
2.37.3

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

