Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id C053C231529
	for <lists+linux-audit@lfdr.de>; Tue, 28 Jul 2020 23:48:08 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423--BhKzlgyMF63_sDSW5MKaA-1; Tue, 28 Jul 2020 17:48:02 -0400
X-MC-Unique: -BhKzlgyMF63_sDSW5MKaA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E47ABE924;
	Tue, 28 Jul 2020 21:47:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C70768A172;
	Tue, 28 Jul 2020 21:47:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9D156A3593;
	Tue, 28 Jul 2020 21:47:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06SLaZcS019902 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 28 Jul 2020 17:36:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7331C217B43D; Tue, 28 Jul 2020 21:36:35 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 598B8218ADC1
	for <linux-audit@redhat.com>; Tue, 28 Jul 2020 21:36:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A2C780CDB8
	for <linux-audit@redhat.com>; Tue, 28 Jul 2020 21:36:33 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-397-Jb4mJjQQPsSR0X07fV3uyg-1;
	Tue, 28 Jul 2020 17:36:28 -0400
X-MC-Unique: Jb4mJjQQPsSR0X07fV3uyg-1
Received: from dede-linux-virt.corp.microsoft.com (unknown [131.107.160.54])
	by linux.microsoft.com (Postfix) with ESMTPSA id BC67820B4909;
	Tue, 28 Jul 2020 14:36:26 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BC67820B4909
From: Deven Bowers <deven.desai@linux.microsoft.com>
To: agk@redhat.com, axboe@kernel.dk, snitzer@redhat.com, jmorris@namei.org,
	serge@hallyn.com, zohar@linux.ibm.com, viro@zeniv.linux.org.uk,
	paul@paul-moore.com, eparis@redhat.com, jannh@google.com,
	dm-devel@redhat.com, linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-audit@redhat.com
Subject: [RFC PATCH v5 01/11] scripts: add ipe tooling to generate boot policy
Date: Tue, 28 Jul 2020 14:36:01 -0700
Message-Id: <20200728213614.586312-2-deven.desai@linux.microsoft.com>
In-Reply-To: <20200728213614.586312-1-deven.desai@linux.microsoft.com>
References: <20200728213614.586312-1-deven.desai@linux.microsoft.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06SLaZcS019902
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 28 Jul 2020 17:47:37 -0400
Cc: sashal@kernel.org, pasha.tatashin@soleen.com, mdsakib@microsoft.com,
	corbet@lwn.net, linux-kernel@vger.kernel.org,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a tool for the generation of an IPE policy to be compiled into the
kernel. This policy will be enforced until userland deploys and activates
a new policy.

Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
---
 MAINTAINERS                   |   6 ++
 scripts/Makefile              |   1 +
 scripts/ipe/Makefile          |   2 +
 scripts/ipe/polgen/.gitignore |   1 +
 scripts/ipe/polgen/Makefile   |   7 ++
 scripts/ipe/polgen/polgen.c   | 136 ++++++++++++++++++++++++++++++++++
 6 files changed, 153 insertions(+)
 create mode 100644 scripts/ipe/Makefile
 create mode 100644 scripts/ipe/polgen/.gitignore
 create mode 100644 scripts/ipe/polgen/Makefile
 create mode 100644 scripts/ipe/polgen/polgen.c

diff --git a/MAINTAINERS b/MAINTAINERS
index d53db30d1365..86450be5437b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8579,6 +8579,12 @@ S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity.git
 F:	security/integrity/ima/
 
+INTEGRITY POLICY ENFORCEMENT (IPE)
+M:	Deven Bowers <deven.desai@linux.microsoft.com>
+L:	linux-integrity@vger.kernel.org
+S:	Supported
+F:	scripts/ipe/
+
 INTEL 810/815 FRAMEBUFFER DRIVER
 M:	Antonino Daplas <adaplas@gmail.com>
 L:	linux-fbdev@vger.kernel.org
diff --git a/scripts/Makefile b/scripts/Makefile
index 95ecf970c74c..b3c1882fd6dd 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -34,6 +34,7 @@ hostprogs += unifdef
 subdir-$(CONFIG_GCC_PLUGINS) += gcc-plugins
 subdir-$(CONFIG_MODVERSIONS) += genksyms
 subdir-$(CONFIG_SECURITY_SELINUX) += selinux
+subdir-$(CONFIG_SECURITY_IPE) += ipe
 
 # Let clean descend into subdirs
 subdir-	+= basic dtc gdb kconfig mod
diff --git a/scripts/ipe/Makefile b/scripts/ipe/Makefile
new file mode 100644
index 000000000000..e87553fbb8d6
--- /dev/null
+++ b/scripts/ipe/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+subdir-y := polgen
diff --git a/scripts/ipe/polgen/.gitignore b/scripts/ipe/polgen/.gitignore
new file mode 100644
index 000000000000..80f32f25d200
--- /dev/null
+++ b/scripts/ipe/polgen/.gitignore
@@ -0,0 +1 @@
+polgen
diff --git a/scripts/ipe/polgen/Makefile b/scripts/ipe/polgen/Makefile
new file mode 100644
index 000000000000..a519b594e13c
--- /dev/null
+++ b/scripts/ipe/polgen/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0
+hostprogs-y	:= polgen
+HOST_EXTRACFLAGS += \
+	-I$(srctree)/include \
+	-I$(srctree)/include/uapi \
+
+always		:= $(hostprogs-y)
diff --git a/scripts/ipe/polgen/polgen.c b/scripts/ipe/polgen/polgen.c
new file mode 100644
index 000000000000..a80fffe1b27c
--- /dev/null
+++ b/scripts/ipe/polgen/polgen.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) Microsoft Corporation. All rights reserved.
+ */
+
+#include <stdlib.h>
+#include <stddef.h>
+#include <stdio.h>
+#include <unistd.h>
+#include <errno.h>
+
+static void usage(const char *const name)
+{
+	printf("Usage: %s OutputFile (PolicyFile)\n", name);
+	exit(EINVAL);
+}
+
+static int policy_to_buffer(const char *pathname, char **buffer, size_t *size)
+{
+	int rc = 0;
+	FILE *fd;
+	char *lbuf;
+	size_t fsize;
+	size_t read;
+
+	fd = fopen(pathname, "r");
+	if (!fd) {
+		rc = errno;
+		goto out;
+	}
+
+	fseek(fd, 0, SEEK_END);
+	fsize = ftell(fd);
+	rewind(fd);
+
+	lbuf = malloc(fsize);
+	if (!lbuf) {
+		rc = ENOMEM;
+		goto out_close;
+	}
+
+	read = fread((void *)lbuf, sizeof(*lbuf), fsize, fd);
+	if (read != fsize) {
+		rc = -1;
+		goto out_free;
+	}
+
+	*buffer = lbuf;
+	*size = fsize;
+	fclose(fd);
+
+	return rc;
+
+out_free:
+	free(lbuf);
+out_close:
+	fclose(fd);
+out:
+	return rc;
+}
+
+static int write_boot_policy(const char *pathname, const char *buf, size_t size)
+{
+	FILE *fd;
+	size_t i;
+
+	fd = fopen(pathname, "w");
+	if (!fd)
+		goto err;
+
+	fprintf(fd, "/* This file is automatically generated.");
+	fprintf(fd, " Do not edit. */\n");
+	fprintf(fd, "#include <stddef.h>\n");
+	fprintf(fd, "const char *const ipe_boot_policy =\n");
+
+	if (!buf || size == 0) {
+		fprintf(fd, "\tNULL;\n");
+		fclose(fd);
+		return 0;
+	}
+
+	for (i = 0; i < size; ++i) {
+		if (i == 0)
+			fprintf(fd, "\t\"");
+
+		switch (buf[i]) {
+		case '"':
+			fprintf(fd, "\\\"");
+			break;
+		case '\'':
+			fprintf(fd, "'");
+			break;
+		case '\n':
+			fprintf(fd, "\\n\"\n\t\"");
+			break;
+		case '\\':
+			fprintf(fd, "\\\\");
+			break;
+		default:
+			fprintf(fd, "%c", buf[i]);
+		}
+	}
+	fprintf(fd, "\";\n");
+	fclose(fd);
+
+	return 0;
+
+err:
+	if (fd)
+		fclose(fd);
+	return errno;
+}
+
+int main(int argc, const char *argv[])
+{
+	int rc = 0;
+	size_t len = 0;
+	char *policy = NULL;
+
+	if (argc < 2)
+		usage(argv[0]);
+
+	if (argc > 2) {
+		rc = policy_to_buffer(argv[2], &policy, &len);
+		if (rc != 0)
+			goto cleanup;
+	}
+
+	rc = write_boot_policy(argv[1], policy, len);
+cleanup:
+	if (policy)
+		free(policy);
+	if (rc != 0)
+		perror("An error occurred during policy conversion: ");
+	return rc;
+}
-- 
2.27.0


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

