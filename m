Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id DC44422608F
	for <lists+linux-audit@lfdr.de>; Mon, 20 Jul 2020 15:18:44 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-lbtqD7DkMlehWSxdDHIVWQ-1; Mon, 20 Jul 2020 09:18:39 -0400
X-MC-Unique: lbtqD7DkMlehWSxdDHIVWQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E659A1083E84;
	Mon, 20 Jul 2020 13:18:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 930957EFB4;
	Mon, 20 Jul 2020 13:18:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EEB401809554;
	Mon, 20 Jul 2020 13:18:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06HNGm1C002211 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 17 Jul 2020 19:16:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 77581105019F; Fri, 17 Jul 2020 23:16:48 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 72E371054597
	for <linux-audit@redhat.com>; Fri, 17 Jul 2020 23:16:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 572351012443
	for <linux-audit@redhat.com>; Fri, 17 Jul 2020 23:16:48 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-122-IyK3660jM46rIY3U5jBdrQ-1;
	Fri, 17 Jul 2020 19:16:44 -0400
X-MC-Unique: IyK3660jM46rIY3U5jBdrQ-1
Received: from dede-linux-virt.corp.microsoft.com (unknown [131.107.160.54])
	by linux.microsoft.com (Postfix) with ESMTPSA id 58F5220B490E;
	Fri, 17 Jul 2020 16:09:47 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 58F5220B490E
From: Deven Bowers <deven.desai@linux.microsoft.com>
To: agk@redhat.com, axboe@kernel.dk, snitzer@redhat.com, jmorris@namei.org,
	serge@hallyn.com, zohar@linux.ibm.com, viro@zeniv.linux.org.uk,
	paul@paul-moore.com, eparis@redhat.com, jannh@google.com,
	dm-devel@redhat.com, linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-audit@redhat.com
Subject: [RFC PATCH v4 04/12] ipe: add property for trust of boot volume
Date: Fri, 17 Jul 2020 16:09:33 -0700
Message-Id: <20200717230941.1190744-5-deven.desai@linux.microsoft.com>
In-Reply-To: <20200717230941.1190744-1-deven.desai@linux.microsoft.com>
References: <20200717230941.1190744-1-deven.desai@linux.microsoft.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06HNGm1C002211
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 20 Jul 2020 09:18:19 -0400
Cc: sashal@kernel.org, mdsakib@microsoft.com, corbet@lwn.net,
	linux-kernel@vger.kernel.org, pasha.tatshin@soleen.com,
	nramas@linux.microsoft.com, tyhicks@linux.microsoft.com,
	jaskarankhurana@linux.microsoft.com
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a property for IPE policy to express trust of the first superblock
where a file would be evaluated to determine trust.

Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
---
 security/ipe/Kconfig                    |  2 +
 security/ipe/Makefile                   |  4 ++
 security/ipe/ipe-engine.c               |  4 ++
 security/ipe/ipe-hooks.c                | 19 +++++
 security/ipe/ipe-hooks.h                |  2 +
 security/ipe/ipe-pin.c                  | 93 +++++++++++++++++++++++++
 security/ipe/ipe-pin.h                  | 36 ++++++++++
 security/ipe/ipe.c                      | 24 +++++++
 security/ipe/properties/Kconfig         | 15 ++++
 security/ipe/properties/Makefile        | 11 +++
 security/ipe/properties/boot-verified.c | 82 ++++++++++++++++++++++
 security/ipe/properties/prop-entry.h    | 20 ++++++
 security/ipe/utility.h                  | 22 ++++++
 13 files changed, 334 insertions(+)
 create mode 100644 security/ipe/ipe-pin.c
 create mode 100644 security/ipe/ipe-pin.h
 create mode 100644 security/ipe/properties/Kconfig
 create mode 100644 security/ipe/properties/Makefile
 create mode 100644 security/ipe/properties/boot-verified.c
 create mode 100644 security/ipe/properties/prop-entry.h
 create mode 100644 security/ipe/utility.h

diff --git a/security/ipe/Kconfig b/security/ipe/Kconfig
index 83cf0634043a..f47b7ef94133 100644
--- a/security/ipe/Kconfig
+++ b/security/ipe/Kconfig
@@ -42,4 +42,6 @@ config SECURITY_IPE_PERMISSIVE_SWITCH
 
 	  If unsure, answer Y.
 
+source "security/ipe/properties/Kconfig"
+
 endif
diff --git a/security/ipe/Makefile b/security/ipe/Makefile
index 7d6da33dd0c4..7e98982c5035 100644
--- a/security/ipe/Makefile
+++ b/security/ipe/Makefile
@@ -26,3 +26,7 @@ obj-$(CONFIG_SECURITY_IPE) += \
 	ipe-secfs.o \
 
 clean-files := ipe-bp.c
+
+obj-$(CONFIG_IPE_BOOT_PROP) += ipe-pin.o
+
+obj-$(CONFIG_SECURITY_IPE) += properties/
diff --git a/security/ipe/ipe-engine.c b/security/ipe/ipe-engine.c
index c79f422245c6..2eab680587ce 100644
--- a/security/ipe/ipe-engine.c
+++ b/security/ipe/ipe-engine.c
@@ -9,6 +9,8 @@
 #include "ipe-policy.h"
 #include "ipe-engine.h"
 #include "ipe-audit.h"
+#include "ipe-pin.h"
+#include "utility.h"
 
 #include <linux/types.h>
 #include <linux/fs.h>
@@ -205,6 +207,8 @@ int ipe_process_event(const struct file *file, enum ipe_op op,
 	if (IS_ERR(ctx))
 		goto cleanup;
 
+	ipe_pin_superblock(ctx->file);
+
 	rc = evaluate(ctx);
 
 cleanup:
diff --git a/security/ipe/ipe-hooks.c b/security/ipe/ipe-hooks.c
index 071c4af23a3d..45efe022be04 100644
--- a/security/ipe/ipe-hooks.c
+++ b/security/ipe/ipe-hooks.c
@@ -6,6 +6,7 @@
 #include "ipe.h"
 #include "ipe-hooks.h"
 #include "ipe-engine.h"
+#include "ipe-pin.h"
 
 #include <linux/types.h>
 #include <linux/fs.h>
@@ -147,3 +148,21 @@ int ipe_on_kernel_load_data(enum kernel_load_data_id id)
 					 ipe_hook_kernel_load);
 	}
 }
+
+/**
+ * ipe_sb_free_security: LSM hook called on sb_free_security.
+ * @mnt_sb: Super block that is being freed.
+ *
+ * IPE does not currently utilize the super block security hook,
+ * it utilizes this hook to invalidate the saved super block for
+ * the boot_verified property.
+ *
+ * For more information, see the LSM hook, sb_free_security.
+ *
+ * Return:
+ * 0 - OK
+ */
+void ipe_sb_free_security(struct super_block *mnt_sb)
+{
+	ipe_invalidate_pinned_sb(mnt_sb);
+}
diff --git a/security/ipe/ipe-hooks.h b/security/ipe/ipe-hooks.h
index 806659b7cdbe..5e46726f2562 100644
--- a/security/ipe/ipe-hooks.h
+++ b/security/ipe/ipe-hooks.h
@@ -58,4 +58,6 @@ int ipe_on_kernel_read(struct file *file, enum kernel_read_file_id id);
 
 int ipe_on_kernel_load_data(enum kernel_load_data_id id);
 
+void ipe_sb_free_security(struct super_block *mnt_sb);
+
 #endif /* IPE_HOOK_H */
diff --git a/security/ipe/ipe-pin.c b/security/ipe/ipe-pin.c
new file mode 100644
index 000000000000..a963be8e5321
--- /dev/null
+++ b/security/ipe/ipe-pin.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * This file has been heavily adapted from the source code of the
+ * loadpin LSM. The source code for loadpin is co-located in the linux
+ * tree under security/loadpin/loadpin.c.
+ *
+ * Please see loadpin.c for up-to-date information about
+ * loadpin.
+ */
+
+#include "ipe.h"
+
+#include <linux/types.h>
+#include <linux/spinlock_types.h>
+#include <linux/fs.h>
+#include <linux/mount.h>
+#include <linux/magic.h>
+#include <linux/mm.h>
+#include <linux/mman.h>
+
+static DEFINE_SPINLOCK(pinned_sb_spinlock);
+
+static struct super_block *pinned_sb;
+
+/**
+ * ipe_is_from_pinned_sb: Determine if @file originates from the initial
+ *			  super block that a file was executed from.
+ * @file: File to check if it originates from the super block.
+ *
+ * Return:
+ * true - File originates from the initial super block
+ * false - File does not originate from the initial super block
+ */
+bool ipe_is_from_pinned_sb(const struct file *file)
+{
+	bool rv = false;
+
+	spin_lock(&pinned_sb_spinlock);
+
+	/*
+	 * Check if pinned_sb is set:
+	 *  NULL == not set -> exit
+	 *  ERR == was once set (and has been unmounted) -> exit
+	 * AND check that the pinned sb is the same as the file's.
+	 */
+	if (!IS_ERR_OR_NULL(pinned_sb) &&
+	    file->f_path.mnt->mnt_sb == pinned_sb) {
+		rv = true;
+		goto cleanup;
+	}
+
+cleanup:
+	spin_unlock(&pinned_sb_spinlock);
+	return rv;
+}
+
+/**
+ * ipe_pin_superblock: Attempt to save a file's super block address to later
+ *		       determine if a file originates from a super block.
+ * @file: File to source the super block from.
+ */
+void ipe_pin_superblock(const struct file *file)
+{
+	spin_lock(&pinned_sb_spinlock);
+
+	/* if set, return */
+	if (pinned_sb || !file)
+		goto cleanup;
+
+	pinned_sb = file->f_path.mnt->mnt_sb;
+cleanup:
+	spin_unlock(&pinned_sb_spinlock);
+}
+
+/**
+ * ipe_invalidate_pinned_sb: Invalidate the saved super block.
+ * @mnt_sb: Super block to compare against the saved super block.
+ *
+ * This avoids authorizing a file when the super block does not exist anymore.
+ */
+void ipe_invalidate_pinned_sb(const struct super_block *mnt_sb)
+{
+	spin_lock(&pinned_sb_spinlock);
+
+	/*
+	 * On pinned sb unload - invalidate the pinned address
+	 * by setting the pinned_sb to ERR_PTR(-EIO)
+	 */
+	if (!IS_ERR_OR_NULL(pinned_sb) && mnt_sb == pinned_sb)
+		pinned_sb = ERR_PTR(-EIO);
+
+	spin_unlock(&pinned_sb_spinlock);
+}
diff --git a/security/ipe/ipe-pin.h b/security/ipe/ipe-pin.h
new file mode 100644
index 000000000000..b707e6253c33
--- /dev/null
+++ b/security/ipe/ipe-pin.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) Microsoft Corporation. All rights reserved.
+ */
+#ifndef IPE_PIN_H
+#define IPE_PIN_H
+
+#include <linux/types.h>
+#include <linux/fs.h>
+
+#ifdef CONFIG_IPE_BOOT_PROP
+
+bool ipe_is_from_pinned_sb(const struct file *file);
+
+void ipe_pin_superblock(const struct file *file);
+
+void ipe_invalidate_pinned_sb(const struct super_block *mnt_sb);
+
+#else /* CONFIG_IPE_BOOT_PROP */
+
+static inline bool ipe_is_from_pinned_sb(const struct file *file)
+{
+	return false;
+}
+
+static inline void ipe_pin_superblock(const struct file *file)
+{
+}
+
+static inline void ipe_invalidate_pinned_sb(const struct super_block *mnt_sb)
+{
+}
+
+#endif /* !CONFIG_IPE_BOOT_PROP */
+
+#endif /* IPE_PIN_H */
diff --git a/security/ipe/ipe.c b/security/ipe/ipe.c
index a339bca64dd9..4a2623962f8c 100644
--- a/security/ipe/ipe.c
+++ b/security/ipe/ipe.c
@@ -7,6 +7,7 @@
 #include "ipe-policy.h"
 #include "ipe-hooks.h"
 #include "ipe-secfs.h"
+#include "properties/prop-entry.h"
 
 #include <linux/module.h>
 #include <linux/lsm_hooks.h>
@@ -22,8 +23,27 @@ static struct security_hook_list ipe_hooks[] __lsm_ro_after_init = {
 	LSM_HOOK_INIT(kernel_read_file, ipe_on_kernel_read),
 	LSM_HOOK_INIT(kernel_load_data, ipe_on_kernel_load_data),
 	LSM_HOOK_INIT(file_mprotect, ipe_on_mprotect),
+	LSM_HOOK_INIT(sb_free_security, ipe_sb_free_security),
 };
 
+/**
+ * ipe_load_properties: Call the property entry points for all the IPE modules
+ *			that were selected at kernel build-time.
+ *
+ * Return:
+ * 0 - OK
+ */
+static int __init ipe_load_properties(void)
+{
+	int rc = 0;
+
+	rc = ipe_init_bootv();
+	if (rc != 0)
+		return rc;
+
+	return rc;
+}
+
 /**
  * ipe_init: Entry point of IPE.
  *
@@ -41,6 +61,10 @@ static int __init ipe_init(void)
 {
 	int rc;
 
+	rc = ipe_load_properties();
+	if (rc != 0)
+		panic("IPE: properties failed to load");
+
 	pr_info("mode=%s", (ipe_enforce == 1) ? IPE_MODE_ENFORCE :
 						IPE_MODE_PERMISSIVE);
 
diff --git a/security/ipe/properties/Kconfig b/security/ipe/properties/Kconfig
new file mode 100644
index 000000000000..75c6c6ff6cd8
--- /dev/null
+++ b/security/ipe/properties/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Integrity Policy Enforcement (IPE) configuration
+#
+
+config IPE_BOOT_PROP
+	bool "Enable trust for boot volume"
+	help
+	  This option enables the property "boot_verified" in IPE policy.
+	  This property 'pins' the initial superblock when something is
+	  evaluated as an execution. This property will evaluate to true
+	  when the file being evaluated originates from the initial
+	  superblock.
+
+	  if unsure, answer N.
diff --git a/security/ipe/properties/Makefile b/security/ipe/properties/Makefile
new file mode 100644
index 000000000000..e3e7fe17cf58
--- /dev/null
+++ b/security/ipe/properties/Makefile
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (C) Microsoft Corporation. All rights reserved.
+#
+# Makefile for building the properties that IPE uses
+# as part of the kernel tree.
+#
+
+obj-$(CONFIG_SECURITY_IPE) += properties.o
+
+properties-$(CONFIG_IPE_BOOT_PROP) += boot-verified.o
diff --git a/security/ipe/properties/boot-verified.c b/security/ipe/properties/boot-verified.c
new file mode 100644
index 000000000000..eb9e6ebe34fa
--- /dev/null
+++ b/security/ipe/properties/boot-verified.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) Microsoft Corporation. All rights reserved.
+ */
+
+#include "../ipe.h"
+#include "../ipe-pin.h"
+#include "../ipe-property.h"
+#include "../utility.h"
+
+#include <linux/types.h>
+#include <linux/slab.h>
+#include <linux/fs.h>
+#include <linux/mount.h>
+#include <linux/audit.h>
+
+#define PROPERTY_NAME "boot_verified"
+
+static void audit(struct audit_buffer *ab, bool value)
+{
+	audit_log_format(ab, "%s", (value) ? "TRUE" : "FALSE");
+}
+
+static inline void audit_rule_value(struct audit_buffer *ab,
+				    const void *value)
+{
+	audit(ab, (bool)value);
+}
+
+static inline void audit_ctx(struct audit_buffer *ab,
+			     const struct ipe_engine_ctx *ctx)
+{
+	bool b = has_sb(ctx->file) && ipe_is_from_pinned_sb(ctx->file);
+
+	audit(ab, b);
+}
+
+static bool evaluate(const struct ipe_engine_ctx *ctx,
+		     const void *value)
+{
+	bool expect = (bool)value;
+
+	if (!ctx->file || !has_sb(ctx->file))
+		return false;
+
+	return ipe_is_from_pinned_sb(ctx->file) == expect;
+}
+
+static int parse(const char *val_str, void **value)
+{
+	if (strcmp("TRUE", val_str) == 0)
+		*value = (void *)true;
+	else if (strcmp("FALSE", val_str) == 0)
+		*value = (void *)false;
+	else
+		return -EBADMSG;
+
+	return 0;
+}
+
+static inline int duplicate(const void *src, void **dest)
+{
+	*dest = (void *)(bool)src;
+
+	return 0;
+}
+
+static const struct ipe_property boot_verified = {
+	.property_name = PROPERTY_NAME,
+	.version = 1,
+	.eval = evaluate,
+	.rule_audit = audit_rule_value,
+	.ctx_audit = audit_ctx,
+	.parse = parse,
+	.dup = duplicate,
+	.free_val = NULL,
+};
+
+int ipe_init_bootv(void)
+{
+	return ipe_register_property(&boot_verified);
+}
diff --git a/security/ipe/properties/prop-entry.h b/security/ipe/properties/prop-entry.h
new file mode 100644
index 000000000000..f598dd9608b9
--- /dev/null
+++ b/security/ipe/properties/prop-entry.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) Microsoft Corporation. All rights reserved.
+ */
+
+#include <linux/types.h>
+
+#ifndef IPE_PROP_ENTRY_H
+#define IPE_PROP_ENTRY_H
+
+#ifndef CONFIG_IPE_BOOT_PROP
+static inline int __init ipe_init_bootv(void)
+{
+	return 0;
+}
+#else
+int __init ipe_init_bootv(void);
+#endif /* CONFIG_IPE_BOOT_PROP */
+
+#endif /* IPE_PROP_ENTRY_H */
diff --git a/security/ipe/utility.h b/security/ipe/utility.h
new file mode 100644
index 000000000000..a13089bb0d8f
--- /dev/null
+++ b/security/ipe/utility.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) Microsoft Corporation. All rights reserved.
+ */
+
+#ifndef IPE_UTILITY_H
+#define IPE_UTILITY_H
+
+#include <linux/types.h>
+#include <linux/fs.h>
+
+static inline bool has_mount(const struct file *file)
+{
+	return file && file->f_path.mnt;
+}
+
+static inline bool has_sb(const struct file *file)
+{
+	return has_mount(file) && file->f_path.mnt->mnt_sb;
+}
+
+#endif /* IPE_UTILITY_H */
-- 
2.27.0


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

