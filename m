Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9973B682E6A
	for <lists+linux-audit@lfdr.de>; Tue, 31 Jan 2023 14:51:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675173106;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NKwyXFl7DMb5YE5FUKsZpH5u3pPOFqeCht51c/DaM8w=;
	b=MiXURDwmSm6Wf130hxMxqSnGq1r4PNfg412a653W1aw+RyeGaVywkeDU5Wy8aI5Bof8B2l
	4X7i3x2saEZUXnOE/eIvV8Ksp7GX/p9r2dg7OfUiDPGKtIg1Hzk7xJytq+BorvUzu1wraK
	B1VkwXo7qnApZ6TKnbiAOo3ai+gnvWg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-354-LmHXVJOOOOa0tNT4NgWTgg-1; Tue, 31 Jan 2023 08:51:44 -0500
X-MC-Unique: LmHXVJOOOOa0tNT4NgWTgg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09D3B100DEB0;
	Tue, 31 Jan 2023 13:51:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4C471175A2;
	Tue, 31 Jan 2023 13:51:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3E96019465B6;
	Tue, 31 Jan 2023 13:51:25 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 31D2E1946587 for <linux-audit@listman.corp.redhat.com>;
 Mon, 30 Jan 2023 23:06:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1FFDA40C1073; Mon, 30 Jan 2023 23:06:42 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 187034010D2A
 for <linux-audit@redhat.com>; Mon, 30 Jan 2023 23:06:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0402800159
 for <linux-audit@redhat.com>; Mon, 30 Jan 2023 23:06:41 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
 relay.mimecast.com with ESMTP id us-mta-467-ZCUExuL7NX-pluH1enmkBw-1; Mon,
 30 Jan 2023 18:06:38 -0500
X-MC-Unique: ZCUExuL7NX-pluH1enmkBw-1
Received: by linux.microsoft.com (Postfix, from userid 1052)
 id EED8320E9FBB; Mon, 30 Jan 2023 14:58:41 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com EED8320E9FBB
From: Fan Wu <wufan@linux.microsoft.com>
To: corbet@lwn.net, zohar@linux.ibm.com, jmorris@namei.org, serge@hallyn.com,
 tytso@mit.edu, ebiggers@kernel.org, axboe@kernel.dk, agk@redhat.com,
 snitzer@kernel.org, eparis@redhat.com, paul@paul-moore.com
Subject: [RFC PATCH v9 01/16] security: add ipe lsm
Date: Mon, 30 Jan 2023 14:57:16 -0800
Message-Id: <1675119451-23180-2-git-send-email-wufan@linux.microsoft.com>
In-Reply-To: <1675119451-23180-1-git-send-email-wufan@linux.microsoft.com>
References: <1675119451-23180-1-git-send-email-wufan@linux.microsoft.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mailman-Approved-At: Tue, 31 Jan 2023 13:51:24 +0000
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
Cc: Fan Wu <wufan@linux.microsoft.com>, dm-devel@redhat.com,
 linux-doc@vger.kernel.org, Deven Bowers <deven.desai@linux.microsoft.com>,
 roberto.sassu@huawei.com, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-audit@redhat.com,
 linux-integrity@vger.kernel.org
MIME-Version: 1.0
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Deven Bowers <deven.desai@linux.microsoft.com>

Integrity Policy Enforcement (IPE) is an LSM that provides an
complimentary approach to Mandatory Access Control than existing LSMs
today.

Existing LSMs have centered around the concept of access to a resource
should be controlled by the current user's credentials. IPE's approach,
is that access to a resource should be controlled by the system's trust
of a current resource.

The basis of this approach is defining a global policy to specify which
resource can be trusted.

Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
Signed-off-by: Fan Wu <wufan@linux.microsoft.com>
---
v2:
  + Split evaluation loop, access control hooks,
    and evaluation loop from policy parser and userspace
    interface to pass mailing list character limit

v3:
  + Move ipe_load_properties to patch 04.
  + Remove useless 0-initializations
  + Prefix extern variables with ipe_
  + Remove kernel module parameters, as these are
    exposed through sysctls.
  + Add more prose to the IPE base config option
    help text.
  + Use GFP_KERNEL for audit_log_start.
  + Remove unnecessary caching system.
  + Remove comments from headers
  + Use rcu_access_pointer for rcu-pointer null check
  + Remove usage of reqprot; use prot only.
  + Move policy load and activation audit event to 03/12

v4:
  + Remove sysctls in favor of securityfs nodes
  + Re-add kernel module parameters, as these are now
    exposed through securityfs.
  + Refactor property audit loop to a separate function.

v5:
  + fix minor grammatical errors
  + do not group rule by curly-brace in audit record,
    reconstruct the exact rule.

v6:
  + No changes

v7:
  + Further split lsm creation into a separate commit from the
    evaluation loop and audit system, for easier review.

  + Introduce the concept of an ipe_context, a scoped way to
    introduce execution policies, used initially for allowing for
    kunit tests in isolation.

v8:
  + Follow lsmname_hook_name convention for lsm hooks.
  + Move LSM blob accessors to ipe.c and mark LSM blobs as static.

v9:
  + Remove ipe_context for simplification
---
 MAINTAINERS           |  5 +++++
 security/Kconfig      | 11 ++++++-----
 security/Makefile     |  1 +
 security/ipe/Kconfig  | 17 +++++++++++++++++
 security/ipe/Makefile | 10 ++++++++++
 security/ipe/ipe.c    | 40 ++++++++++++++++++++++++++++++++++++++++
 security/ipe/ipe.h    | 13 +++++++++++++
 7 files changed, 92 insertions(+), 5 deletions(-)
 create mode 100644 security/ipe/Kconfig
 create mode 100644 security/ipe/Makefile
 create mode 100644 security/ipe/ipe.c
 create mode 100644 security/ipe/ipe.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 8a5c25c20d00..5e27e84763cc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10273,6 +10273,11 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity.git
 F:	security/integrity/ima/
 F:	security/integrity/
 
+INTEGRITY POLICY ENFORCEMENT (IPE)
+M:	Fan Wu <wufan@linux.microsoft.com>
+S:	Supported
+F:	security/ipe/
+
 INTEL 810/815 FRAMEBUFFER DRIVER
 M:	Antonino Daplas <adaplas@gmail.com>
 L:	linux-fbdev@vger.kernel.org
diff --git a/security/Kconfig b/security/Kconfig
index e6db09a779b7..9f59add2d16c 100644
--- a/security/Kconfig
+++ b/security/Kconfig
@@ -207,6 +207,7 @@ source "security/yama/Kconfig"
 source "security/safesetid/Kconfig"
 source "security/lockdown/Kconfig"
 source "security/landlock/Kconfig"
+source "security/ipe/Kconfig"
 
 source "security/integrity/Kconfig"
 
@@ -246,11 +247,11 @@ endchoice
 
 config LSM
 	string "Ordered list of enabled LSMs"
-	default "landlock,lockdown,yama,loadpin,safesetid,integrity,smack,selinux,tomoyo,apparmor,bpf" if DEFAULT_SECURITY_SMACK
-	default "landlock,lockdown,yama,loadpin,safesetid,integrity,apparmor,selinux,smack,tomoyo,bpf" if DEFAULT_SECURITY_APPARMOR
-	default "landlock,lockdown,yama,loadpin,safesetid,integrity,tomoyo,bpf" if DEFAULT_SECURITY_TOMOYO
-	default "landlock,lockdown,yama,loadpin,safesetid,integrity,bpf" if DEFAULT_SECURITY_DAC
-	default "landlock,lockdown,yama,loadpin,safesetid,integrity,selinux,smack,tomoyo,apparmor,bpf"
+	default "landlock,lockdown,yama,loadpin,safesetid,integrity,ipe,smack,selinux,tomoyo,apparmor,bpf" if DEFAULT_SECURITY_SMACK
+	default "landlock,lockdown,yama,loadpin,safesetid,integrity,ipe,apparmor,selinux,smack,tomoyo,bpf" if DEFAULT_SECURITY_APPARMOR
+	default "landlock,lockdown,yama,loadpin,safesetid,integrity,ipe,tomoyo,bpf" if DEFAULT_SECURITY_TOMOYO
+	default "landlock,lockdown,yama,loadpin,safesetid,integrity,ipe,bpf" if DEFAULT_SECURITY_DAC
+	default "landlock,lockdown,yama,loadpin,safesetid,integrity,ipe,selinux,smack,tomoyo,apparmor,bpf"
 	help
 	  A comma-separated list of LSMs, in initialization order.
 	  Any LSMs left off this list will be ignored. This can be
diff --git a/security/Makefile b/security/Makefile
index 18121f8f85cd..527b1864d96c 100644
--- a/security/Makefile
+++ b/security/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_SECURITY_LOCKDOWN_LSM)	+= lockdown/
 obj-$(CONFIG_CGROUPS)			+= device_cgroup.o
 obj-$(CONFIG_BPF_LSM)			+= bpf/
 obj-$(CONFIG_SECURITY_LANDLOCK)		+= landlock/
+obj-$(CONFIG_SECURITY_IPE)		+= ipe/
 
 # Object integrity file lists
 obj-$(CONFIG_INTEGRITY)			+= integrity/
diff --git a/security/ipe/Kconfig b/security/ipe/Kconfig
new file mode 100644
index 000000000000..e4875fb04883
--- /dev/null
+++ b/security/ipe/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Integrity Policy Enforcement (IPE) configuration
+#
+
+menuconfig SECURITY_IPE
+	bool "Integrity Policy Enforcement (IPE)"
+	depends on SECURITY && SECURITYFS
+	select PKCS7_MESSAGE_PARSER
+	select SYSTEM_DATA_VERIFICATION
+	help
+	  This option enables the Integrity Policy Enforcement LSM
+	  allowing users to define a policy to enforce a trust-based access
+	  control. A key feature of IPE is a customizable policy to allow
+	  admins to reconfigure trust requirements on the fly.
+
+	  If unsure, answer N.
diff --git a/security/ipe/Makefile b/security/ipe/Makefile
new file mode 100644
index 000000000000..571648579991
--- /dev/null
+++ b/security/ipe/Makefile
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (C) Microsoft Corporation. All rights reserved.
+#
+# Makefile for building the IPE module as part of the kernel tree.
+#
+
+obj-$(CONFIG_SECURITY_IPE) += \
+	hooks.o \
+	ipe.o \
diff --git a/security/ipe/ipe.c b/security/ipe/ipe.c
new file mode 100644
index 000000000000..9ed3bf4dcc04
--- /dev/null
+++ b/security/ipe/ipe.c
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) Microsoft Corporation. All rights reserved.
+ */
+
+#include "ipe.h"
+
+static struct lsm_blob_sizes ipe_blobs __lsm_ro_after_init = {
+};
+
+static struct security_hook_list ipe_hooks[] __lsm_ro_after_init = {
+};
+
+/**
+ * ipe_init - Entry point of IPE.
+ *
+ * This is called at LSM init, which happens occurs early during kernel
+ * start up. During this phase, IPE loads the properties compiled into
+ * the kernel, and register's IPE's hooks. The boot policy is loaded
+ * later, during securityfs init, at which point IPE will start
+ * enforcing its policy.
+ *
+ * Return:
+ * * 0		- OK
+ * * -ENOMEM	- Context creation failed.
+ */
+static int __init ipe_init(void)
+{
+	int rc = 0;
+
+	security_add_hooks(ipe_hooks, ARRAY_SIZE(ipe_hooks), "ipe");
+
+	return rc;
+}
+
+DEFINE_LSM(ipe) = {
+	.name = "ipe",
+	.init = ipe_init,
+	.blobs = &ipe_blobs,
+};
diff --git a/security/ipe/ipe.h b/security/ipe/ipe.h
new file mode 100644
index 000000000000..ee7ec3f3b55d
--- /dev/null
+++ b/security/ipe/ipe.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) Microsoft Corporation. All rights reserved.
+ */
+
+#ifndef IPE_H
+#define IPE_H
+
+#define pr_fmt(fmt) "IPE " fmt "\n"
+
+#include <linux/lsm_hooks.h>
+
+#endif /* IPE_H */
-- 
2.39.0

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

