Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id BCC72226099
	for <lists+linux-audit@lfdr.de>; Mon, 20 Jul 2020 15:18:52 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-V0iBBo8qNZS64izVvVE1rw-1; Mon, 20 Jul 2020 09:18:47 -0400
X-MC-Unique: V0iBBo8qNZS64izVvVE1rw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C90918C63CE;
	Mon, 20 Jul 2020 13:18:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23037CF940;
	Mon, 20 Jul 2020 13:18:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E4B189A15C;
	Mon, 20 Jul 2020 13:18:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06HNGnq6002303 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 17 Jul 2020 19:16:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8402420A0533; Fri, 17 Jul 2020 23:16:49 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BAB420A052D
	for <linux-audit@redhat.com>; Fri, 17 Jul 2020 23:16:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 667B61832D2C
	for <linux-audit@redhat.com>; Fri, 17 Jul 2020 23:16:47 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-220-49P71Lj-N5CTTTCvMfQ5uw-1;
	Fri, 17 Jul 2020 19:16:44 -0400
X-MC-Unique: 49P71Lj-N5CTTTCvMfQ5uw-1
Received: from dede-linux-virt.corp.microsoft.com (unknown [131.107.160.54])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6A1F020B4914;
	Fri, 17 Jul 2020 16:09:48 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6A1F020B4914
From: Deven Bowers <deven.desai@linux.microsoft.com>
To: agk@redhat.com, axboe@kernel.dk, snitzer@redhat.com, jmorris@namei.org,
	serge@hallyn.com, zohar@linux.ibm.com, viro@zeniv.linux.org.uk,
	paul@paul-moore.com, eparis@redhat.com, jannh@google.com,
	dm-devel@redhat.com, linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-audit@redhat.com
Subject: [RFC PATCH v4 08/12] ipe: add property for signed dmverity volumes
Date: Fri, 17 Jul 2020 16:09:37 -0700
Message-Id: <20200717230941.1190744-9-deven.desai@linux.microsoft.com>
In-Reply-To: <20200717230941.1190744-1-deven.desai@linux.microsoft.com>
References: <20200717230941.1190744-1-deven.desai@linux.microsoft.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06HNGnq6002303
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Allow IPE to leverage the stacked security blob infrastructure,
and enlighten IPE to the block_device security blob.

This allows IPE to have a property to express rules around a device-mapper
verity volume whose root-hash has been signed, and the signature has been
verified against the system keyring. This is property is also added in
this patch.

Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
---
 security/ipe/Kconfig                         |  2 +-
 security/ipe/Makefile                        |  1 +
 security/ipe/ipe-blobs.c                     | 82 ++++++++++++++++++++
 security/ipe/ipe-blobs.h                     | 18 +++++
 security/ipe/ipe-engine.c                    |  4 +
 security/ipe/ipe-engine.h                    |  9 +++
 security/ipe/ipe-hooks.c                     |  1 +
 security/ipe/ipe-hooks.h                     |  7 ++
 security/ipe/ipe.c                           | 18 +++++
 security/ipe/ipe.h                           |  2 +
 security/ipe/properties/Kconfig              | 10 +++
 security/ipe/properties/Makefile             |  1 +
 security/ipe/properties/dmverity-signature.c | 82 ++++++++++++++++++++
 security/ipe/properties/prop-entry.h         |  9 +++
 security/ipe/utility.h                       | 10 +++
 15 files changed, 255 insertions(+), 1 deletion(-)
 create mode 100644 security/ipe/ipe-blobs.c
 create mode 100644 security/ipe/ipe-blobs.h
 create mode 100644 security/ipe/properties/dmverity-signature.c

diff --git a/security/ipe/Kconfig b/security/ipe/Kconfig
index f47b7ef94133..9b5e8fc77a96 100644
--- a/security/ipe/Kconfig
+++ b/security/ipe/Kconfig
@@ -5,7 +5,7 @@
 
 menuconfig SECURITY_IPE
 	bool "Integrity Policy Enforcement (IPE)"
-	depends on SECURITY && AUDIT
+	depends on SECURITY && AUDIT && BLOCK
 	select SYSTEM_DATA_VERIFICATION
 	select SECURITYFS
 	select CRYPTO_SHA1
diff --git a/security/ipe/Makefile b/security/ipe/Makefile
index 7e98982c5035..98a2245b6956 100644
--- a/security/ipe/Makefile
+++ b/security/ipe/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_SECURITY_IPE) += \
 	ipe-property.o \
 	ipe-hooks.o \
 	ipe-secfs.o \
+	ipe-blobs.o \
 
 clean-files := ipe-bp.c
 
diff --git a/security/ipe/ipe-blobs.c b/security/ipe/ipe-blobs.c
new file mode 100644
index 000000000000..03e916d13ac1
--- /dev/null
+++ b/security/ipe/ipe-blobs.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) Microsoft Corporation. All rights reserved.
+ */
+
+#include "ipe.h"
+#include "ipe-engine.h"
+#include "ipe-blobs.h"
+
+#include <linux/types.h>
+#include <linux/fs.h>
+#include <linux/device-mapper.h>
+
+/**
+ * ipe_bdev_alloc_security: Performs the initialization of IPE's security blob.
+ * @bdev: The block device to source the security blob from.
+ *
+ * The allocation is performed earlier by the LSM infrastructure,
+ * (on behalf of all LSMs) in lsm_alloc_bdev. At the moment, IPE uses
+ * this time to zero out the region of memory reserved for IPE.
+ *
+ * Return:
+ * 0 - OK
+ */
+int ipe_bdev_alloc_security(struct block_device *bdev)
+{
+	struct ipe_bdev_blob *bdev_sec = ipe_bdev(bdev);
+
+	memset(bdev_sec, 0x0, sizeof(*bdev_sec));
+
+	return 0;
+}
+
+/**
+ * ipe_bdev_free_security: Frees all fields of IPE's block dev security blob.
+ * @bdev: The block device to source the security blob from.
+ *
+ * The deallocation of the blob itself is performed later by the LSM
+ * infrastructure, (on behalf of all LSMs) in lsm_free_bdev.
+ *
+ * Pointers allocated by the bdev_setsecurity hook and alloc_security
+ * hook need to be deallocated here.
+ */
+void ipe_bdev_free_security(struct block_device *bdev)
+{
+	struct ipe_bdev_blob *bdev_sec = ipe_bdev(bdev);
+
+	kfree(bdev_sec->dmverity_rh_sig);
+
+	memset(bdev_sec, 0x0, sizeof(*bdev_sec));
+}
+
+/**
+ * ipe_bdev_setsecurity: Sets the a certain field of a block device security
+ *			 blob, based on @key.
+ * @bdev: The block device to source the security blob from.
+ * @key: The key representing the information to be stored.
+ * @value: The value to be stored.
+ * @len: The length of @value.
+ *
+ * As block-devices are a generic implementation across specific stacks,
+ * this allows information to be stored from various stacks.
+ *
+ * Return:
+ * 0 - OK
+ * !0 - Error
+ */
+int ipe_bdev_setsecurity(struct block_device *bdev, const char *key,
+			 const void *value, size_t len)
+{
+	struct ipe_bdev_blob *bdev_sec = ipe_bdev(bdev);
+
+	if (!strcmp(key, DM_VERITY_SIGNATURE_SEC_NAME)) {
+		bdev_sec->dmverity_rh_sig = kmemdup(value, len, GFP_KERNEL);
+		if (!bdev_sec->dmverity_rh_sig)
+			return -ENOMEM;
+
+		bdev_sec->dmv_rh_sig_len = len;
+	}
+
+	return 0;
+}
diff --git a/security/ipe/ipe-blobs.h b/security/ipe/ipe-blobs.h
new file mode 100644
index 000000000000..7561f4cef558
--- /dev/null
+++ b/security/ipe/ipe-blobs.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) Microsoft Corporation. All rights reserved.
+ */
+#include <linux/types.h>
+#include <linux/fs.h>
+
+#include "ipe.h"
+
+#ifndef IPE_BLOB_H
+#define IPE_BLOB_H
+
+static inline struct ipe_bdev_blob *ipe_bdev(struct block_device *bdev)
+{
+	return bdev->security + ipe_blobs.lbs_bdev;
+}
+
+#endif /* IPE_BLOB_H */
diff --git a/security/ipe/ipe-engine.c b/security/ipe/ipe-engine.c
index 2eab680587ce..5785e51e8630 100644
--- a/security/ipe/ipe-engine.c
+++ b/security/ipe/ipe-engine.c
@@ -10,6 +10,7 @@
 #include "ipe-engine.h"
 #include "ipe-audit.h"
 #include "ipe-pin.h"
+#include "ipe-blobs.h"
 #include "utility.h"
 
 #include <linux/types.h>
@@ -116,6 +117,9 @@ static struct ipe_engine_ctx *build_ctx(const struct file *file,
 	local->op = op;
 	local->hook = hook;
 
+	if (has_bdev(file))
+		local->sec_bdev = ipe_bdev(bdev(file));
+
 	return local;
 }
 
diff --git a/security/ipe/ipe-engine.h b/security/ipe/ipe-engine.h
index d9a95674e70d..038c39a8973e 100644
--- a/security/ipe/ipe-engine.h
+++ b/security/ipe/ipe-engine.h
@@ -3,20 +3,29 @@
  * Copyright (C) Microsoft Corporation. All rights reserved.
  */
 
+#include "ipe.h"
 #include "ipe-hooks.h"
 
 #include <linux/types.h>
 #include <linux/rbtree.h>
 #include <linux/fs.h>
 
+#include <crypto/pkcs7.h>
+
 #ifndef IPE_ENGINE_H
 #define IPE_ENGINE_H
 
+struct ipe_bdev_blob {
+	u8	*dmverity_rh_sig;
+	size_t	dmv_rh_sig_len;
+};
+
 struct ipe_engine_ctx {
 	enum ipe_op op;
 	enum ipe_hook hook;
 	const struct file *file;
 	const char *audit_pathname;
+	const struct ipe_bdev_blob *sec_bdev;
 };
 
 struct ipe_prop_cache {
diff --git a/security/ipe/ipe-hooks.c b/security/ipe/ipe-hooks.c
index 45efe022be04..18ab2dcd74d1 100644
--- a/security/ipe/ipe-hooks.c
+++ b/security/ipe/ipe-hooks.c
@@ -15,6 +15,7 @@
 #include <linux/mman.h>
 #include <linux/mm.h>
 #include <linux/security.h>
+#include <linux/device-mapper.h>
 
 /**
  * ipe_on_exec: LSM hook called on the exec family of system calls.
diff --git a/security/ipe/ipe-hooks.h b/security/ipe/ipe-hooks.h
index 5e46726f2562..b2417831cfc1 100644
--- a/security/ipe/ipe-hooks.h
+++ b/security/ipe/ipe-hooks.h
@@ -60,4 +60,11 @@ int ipe_on_kernel_load_data(enum kernel_load_data_id id);
 
 void ipe_sb_free_security(struct super_block *mnt_sb);
 
+int ipe_bdev_alloc_security(struct block_device *bdev);
+
+void ipe_bdev_free_security(struct block_device *bdev);
+
+int ipe_bdev_setsecurity(struct block_device *bdev, const char *key,
+			 const void *value, size_t len);
+
 #endif /* IPE_HOOK_H */
diff --git a/security/ipe/ipe.c b/security/ipe/ipe.c
index 4a2623962f8c..b7d112fce62f 100644
--- a/security/ipe/ipe.c
+++ b/security/ipe/ipe.c
@@ -24,6 +24,9 @@ static struct security_hook_list ipe_hooks[] __lsm_ro_after_init = {
 	LSM_HOOK_INIT(kernel_load_data, ipe_on_kernel_load_data),
 	LSM_HOOK_INIT(file_mprotect, ipe_on_mprotect),
 	LSM_HOOK_INIT(sb_free_security, ipe_sb_free_security),
+	LSM_HOOK_INIT(bdev_alloc_security, ipe_bdev_alloc_security),
+	LSM_HOOK_INIT(bdev_free_security, ipe_bdev_free_security),
+	LSM_HOOK_INIT(bdev_setsecurity, ipe_bdev_setsecurity),
 };
 
 /**
@@ -41,6 +44,10 @@ static int __init ipe_load_properties(void)
 	if (rc != 0)
 		return rc;
 
+	rc = ipe_init_dm_verity_signature();
+	if (rc != 0)
+		return rc;
+
 	return rc;
 }
 
@@ -73,9 +80,20 @@ static int __init ipe_init(void)
 	return rc;
 }
 
+struct lsm_blob_sizes ipe_blobs = {
+	.lbs_cred = 0,
+	.lbs_file = 0,
+	.lbs_inode = 0,
+	.lbs_ipc = 0,
+	.lbs_msg_msg = 0,
+	.lbs_task = 0,
+	.lbs_bdev = sizeof(struct ipe_bdev_blob),
+};
+
 DEFINE_LSM(ipe) = {
 	.name = "ipe",
 	.init = ipe_init,
+	.blobs = &ipe_blobs,
 };
 
 bool ipe_enforce = true;
diff --git a/security/ipe/ipe.h b/security/ipe/ipe.h
index af72bb574f73..a59cae2deec6 100644
--- a/security/ipe/ipe.h
+++ b/security/ipe/ipe.h
@@ -10,11 +10,13 @@
 
 #include <linux/types.h>
 #include <linux/fs.h>
+#include <linux/lsm_hooks.h>
 
 #define IPE_MODE_ENFORCE	"enforce"
 #define IPE_MODE_PERMISSIVE	"permissive"
 
 extern bool ipe_enforce;
 extern bool ipe_success_audit;
+extern struct lsm_blob_sizes ipe_blobs;
 
 #endif /* IPE_H */
diff --git a/security/ipe/properties/Kconfig b/security/ipe/properties/Kconfig
index 75c6c6ff6cd8..4046f7e5eaef 100644
--- a/security/ipe/properties/Kconfig
+++ b/security/ipe/properties/Kconfig
@@ -13,3 +13,13 @@ config IPE_BOOT_PROP
 	  superblock.
 
 	  if unsure, answer N.
+
+config IPE_DM_VERITY_SIGNATURE
+	bool "Enable property for signature verified dm-verity volumes"
+	depends on DM_VERITY_VERIFY_ROOTHASH_SIG
+	help
+	  This option enables IPE's integration with Device-Mapper Verity's
+	  signed root-hashes. This enables the usage of the property,
+	  "dmverity_signature" in IPE's policy.
+
+	  if unsure, answer Y.
diff --git a/security/ipe/properties/Makefile b/security/ipe/properties/Makefile
index e3e7fe17cf58..6b67cbe36e31 100644
--- a/security/ipe/properties/Makefile
+++ b/security/ipe/properties/Makefile
@@ -9,3 +9,4 @@
 obj-$(CONFIG_SECURITY_IPE) += properties.o
 
 properties-$(CONFIG_IPE_BOOT_PROP) += boot-verified.o
+properties-$(CONFIG_IPE_DM_VERITY_SIGNATURE) += dmverity-signature.o
diff --git a/security/ipe/properties/dmverity-signature.c b/security/ipe/properties/dmverity-signature.c
new file mode 100644
index 000000000000..819222f226b7
--- /dev/null
+++ b/security/ipe/properties/dmverity-signature.c
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
+#include <linux/audit.h>
+#include <linux/mount.h>
+
+#define PROPERTY_NAME "dmverity_signature"
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
+	bool b = has_bdev(ctx->file) && ctx->sec_bdev->dmverity_rh_sig;
+
+	audit(ab, b);
+}
+
+static bool evaluate(const struct ipe_engine_ctx *ctx,
+		     const void *value)
+{
+	bool expect = (bool)value;
+
+	if (!has_bdev(ctx->file))
+		return false;
+
+	return ((bool)ctx->sec_bdev->dmverity_rh_sig) == expect;
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
+static const struct ipe_property dmv_signature = {
+	.property_name = PROPERTY_NAME,
+	.version = 1,
+	.eval = evaluate,
+	.parse = parse,
+	.rule_audit = audit_rule_value,
+	.ctx_audit = audit_ctx,
+	.dup = duplicate,
+	.free_val = NULL,
+};
+
+int ipe_init_dm_verity_signature(void)
+{
+	return ipe_register_property(&dmv_signature);
+}
diff --git a/security/ipe/properties/prop-entry.h b/security/ipe/properties/prop-entry.h
index f598dd9608b9..85366366ff0d 100644
--- a/security/ipe/properties/prop-entry.h
+++ b/security/ipe/properties/prop-entry.h
@@ -17,4 +17,13 @@ static inline int __init ipe_init_bootv(void)
 int __init ipe_init_bootv(void);
 #endif /* CONFIG_IPE_BOOT_PROP */
 
+#ifndef CONFIG_IPE_DM_VERITY_SIGNATURE
+static inline int __init ipe_init_dm_verity_signature(void)
+{
+	return 0;
+}
+#else
+int __init ipe_init_dm_verity_signature(void);
+#endif /* CONFIG_IPE_DM_VERITY_SIGNATURE */
+
 #endif /* IPE_PROP_ENTRY_H */
diff --git a/security/ipe/utility.h b/security/ipe/utility.h
index a13089bb0d8f..7580f17274a3 100644
--- a/security/ipe/utility.h
+++ b/security/ipe/utility.h
@@ -19,4 +19,14 @@ static inline bool has_sb(const struct file *file)
 	return has_mount(file) && file->f_path.mnt->mnt_sb;
 }
 
+static inline bool has_bdev(const struct file *file)
+{
+	return has_sb(file) && file->f_path.mnt->mnt_sb->s_bdev;
+}
+
+static inline struct block_device *bdev(const struct file *file)
+{
+	return file->f_path.mnt->mnt_sb->s_bdev;
+}
+
 #endif /* IPE_UTILITY_H */
-- 
2.27.0


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

