Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 568EA2B3B6F
	for <lists+linux-audit@lfdr.de>; Mon, 16 Nov 2020 03:16:06 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-LjMZk2DGNtaSZPKAkFS32w-1; Sun, 15 Nov 2020 21:15:28 -0500
X-MC-Unique: LjMZk2DGNtaSZPKAkFS32w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C11B10866B4;
	Mon, 16 Nov 2020 02:15:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E753C610AF;
	Mon, 16 Nov 2020 02:15:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B228A18199F7;
	Mon, 16 Nov 2020 02:15:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AFAcrjN025116 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 15 Nov 2020 05:38:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B9C97200C0FE; Sun, 15 Nov 2020 10:38:53 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B31D220227BA
	for <linux-audit@redhat.com>; Sun, 15 Nov 2020 10:38:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 925CA1021E15
	for <linux-audit@redhat.com>; Sun, 15 Nov 2020 10:38:53 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-305-tzj4hr_bOa-dG4hoZvfWuQ-1; Sun, 15 Nov 2020 05:38:49 -0500
X-MC-Unique: tzj4hr_bOa-dG4hoZvfWuQ-1
Received: from ip5f5af0a0.dynamic.kabel-deutschland.de ([95.90.240.160]
	helo=wittgenstein.fritz.box) by youngberry.canonical.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <christian.brauner@ubuntu.com>)
	id 1keFQQ-0000Kt-Uy; Sun, 15 Nov 2020 10:38:27 +0000
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christoph Hellwig <hch@infradead.org>, linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 05/39] tests: add mount_setattr() selftests
Date: Sun, 15 Nov 2020 11:36:44 +0100
Message-Id: <20201115103718.298186-6-christian.brauner@ubuntu.com>
In-Reply-To: <20201115103718.298186-1-christian.brauner@ubuntu.com>
References: <20201115103718.298186-1-christian.brauner@ubuntu.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Sun, 15 Nov 2020 21:15:05 -0500
Cc: Phil Estes <estesp@gmail.com>, Lennart Poettering <lennart@poettering.net>,
	Mimi Zohar <zohar@linux.ibm.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	containers@lists.linux-foundation.org,
	Christian Brauner <christian.brauner@ubuntu.com>,
	Christoph Hellwig <hch@lst.de>, Tycho Andersen <tycho@tycho.ws>,
	Jonathan Corbet <corbet@lwn.net>,
	James Morris <jmorris@namei.org>, smbarber@chromium.org,
	linux-ext4@vger.kernel.org, Mrunal Patel <mpatel@redhat.com>,
	Serge Hallyn <serge@hallyn.com>, Arnd Bergmann <arnd@arndb.de>,
	Jann Horn <jannh@google.com>, selinux@vger.kernel.org,
	Josh Triplett <josh@joshtriplett.org>,
	Seth Forshee <seth.forshee@canonical.com>,
	Aleksa Sarai <cyphar@cyphar.com>, Andy Lutomirski <luto@kernel.org>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Geoffrey Thomas <geofft@ldpreload.com>,
	David Howells <dhowells@redhat.com>,
	John Johansen <john.johansen@canonical.com>, Theodore Tso <tytso@mit.edu>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	linux-api@vger.kernel.org, Alban Crequy <alban@kinvolk.io>,
	linux-integrity@vger.kernel.org,
	=?UTF-8?q?St=C3=A9phane=20Graber?= <stgraber@ubuntu.com>,
	Todd Kjos <tkjos@google.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a range of selftests for the new mount_setattr() syscall to verify
that it works as expected. This tests that:
- no invalid flags can be specified
- changing properties of a single mount works and leaves other mounts in
  the mount tree unchanged
- changing a mount tre to read-only when one of the mounts has writers
  fails and leaves the whole mount tree unchanged
- changing mount properties from multiple threads works
- changing atime settings works
- changing mount propagation works
- changing the mount options of a mount tree where the individual mounts
  in the tree have different mount options only changes the flags that
  were requested to change
- changing mount options from another mount namespace fails
- changing mount options from another user namespace fails

[==========] Running 9 tests from 2 test cases.
[ RUN      ] mount_setattr.invalid_attributes
[       OK ] mount_setattr.invalid_attributes
[ RUN      ] mount_setattr.basic
[       OK ] mount_setattr.basic
[ RUN      ] mount_setattr.basic_recursive
[       OK ] mount_setattr.basic_recursive
[ RUN      ] mount_setattr.mount_has_writers
[       OK ] mount_setattr.mount_has_writers
[ RUN      ] mount_setattr.mixed_mount_options
[       OK ] mount_setattr.mixed_mount_options
[ RUN      ] mount_setattr.time_changes
[       OK ] mount_setattr.time_changes
[ RUN      ] mount_setattr.multi_threaded
[       OK ] mount_setattr.multi_threaded
[ RUN      ] mount_setattr.wrong_user_namespace
[       OK ] mount_setattr.wrong_user_namespace
[ RUN      ] mount_setattr.wrong_mount_namespace
[       OK ] mount_setattr.wrong_mount_namespace
[==========] 9 / 9 tests passed.
[  PASSED  ]

Cc: Christoph Hellwig <hch@lst.de>
Cc: David Howells <dhowells@redhat.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org
Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
/* v2 */
unchanged
---
 tools/testing/selftests/Makefile              |   1 +
 .../selftests/mount_setattr/.gitignore        |   1 +
 .../testing/selftests/mount_setattr/Makefile  |   7 +
 tools/testing/selftests/mount_setattr/config  |   1 +
 .../mount_setattr/mount_setattr_test.c        | 889 ++++++++++++++++++
 5 files changed, 899 insertions(+)
 create mode 100644 tools/testing/selftests/mount_setattr/.gitignore
 create mode 100644 tools/testing/selftests/mount_setattr/Makefile
 create mode 100644 tools/testing/selftests/mount_setattr/config
 create mode 100644 tools/testing/selftests/mount_setattr/mount_setattr_test.c

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index d9c283503159..87b7107dd9a6 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -34,6 +34,7 @@ TARGETS += memfd
 TARGETS += memory-hotplug
 TARGETS += mincore
 TARGETS += mount
+TARGETS += mount_setattr
 TARGETS += mqueue
 TARGETS += net
 TARGETS += net/forwarding
diff --git a/tools/testing/selftests/mount_setattr/.gitignore b/tools/testing/selftests/mount_setattr/.gitignore
new file mode 100644
index 000000000000..5f74d8488472
--- /dev/null
+++ b/tools/testing/selftests/mount_setattr/.gitignore
@@ -0,0 +1 @@
+mount_setattr_test
diff --git a/tools/testing/selftests/mount_setattr/Makefile b/tools/testing/selftests/mount_setattr/Makefile
new file mode 100644
index 000000000000..2250f7dcb81e
--- /dev/null
+++ b/tools/testing/selftests/mount_setattr/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0
+# Makefile for mount selftests.
+CFLAGS = -g -I../../../../usr/include/ -Wall -O2 -pthread
+
+TEST_GEN_FILES += mount_setattr_test
+
+include ../lib.mk
diff --git a/tools/testing/selftests/mount_setattr/config b/tools/testing/selftests/mount_setattr/config
new file mode 100644
index 000000000000..416bd53ce982
--- /dev/null
+++ b/tools/testing/selftests/mount_setattr/config
@@ -0,0 +1 @@
+CONFIG_USER_NS=y
diff --git a/tools/testing/selftests/mount_setattr/mount_setattr_test.c b/tools/testing/selftests/mount_setattr/mount_setattr_test.c
new file mode 100644
index 000000000000..d6e2555c8cac
--- /dev/null
+++ b/tools/testing/selftests/mount_setattr/mount_setattr_test.c
@@ -0,0 +1,889 @@
+// SPDX-License-Identifier: GPL-2.0
+#define _GNU_SOURCE
+#include <sched.h>
+#include <stdio.h>
+#include <errno.h>
+#include <pthread.h>
+#include <string.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <sys/mount.h>
+#include <sys/wait.h>
+#include <sys/vfs.h>
+#include <sys/statvfs.h>
+#include <sys/sysinfo.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <fcntl.h>
+#include <grp.h>
+#include <stdbool.h>
+#include <stdarg.h>
+
+#include "../kselftest_harness.h"
+
+#ifndef CLONE_NEWNS
+#define CLONE_NEWNS 0x00020000
+#endif
+
+#ifndef CLONE_NEWUSER
+#define CLONE_NEWUSER 0x10000000
+#endif
+
+#ifndef MS_REC
+#define MS_REC 16384
+#endif
+
+#ifndef MS_RELATIME
+#define MS_RELATIME (1 << 21)
+#endif
+
+#ifndef MS_STRICTATIME
+#define MS_STRICTATIME (1 << 24)
+#endif
+
+#ifndef MOUNT_ATTR_RDONLY
+#define MOUNT_ATTR_RDONLY 0x00000001
+#endif
+
+#ifndef MOUNT_ATTR_NOSUID
+#define MOUNT_ATTR_NOSUID 0x00000002
+#endif
+
+#ifndef MOUNT_ATTR_NOEXEC
+#define MOUNT_ATTR_NOEXEC 0x00000008
+#endif
+
+#ifndef MOUNT_ATTR_NODIRATIME
+#define MOUNT_ATTR_NODIRATIME 0x00000080
+#endif
+
+#ifndef MOUNT_ATTR__ATIME
+#define MOUNT_ATTR__ATIME 0x00000070
+#endif
+
+#ifndef MOUNT_ATTR_RELATIME
+#define MOUNT_ATTR_RELATIME 0x00000000
+#endif
+
+#ifndef MOUNT_ATTR_NOATIME
+#define MOUNT_ATTR_NOATIME 0x00000010
+#endif
+
+#ifndef MOUNT_ATTR_STRICTATIME
+#define MOUNT_ATTR_STRICTATIME 0x00000020
+#endif
+
+#ifndef AT_RECURSIVE
+#define AT_RECURSIVE 0x8000
+#endif
+
+#ifndef MAKE_PROPAGATION_SHARED
+#define MAKE_PROPAGATION_SHARED 4
+#endif
+
+#define DEFAULT_THREADS 4
+#define ptr_to_int(p) ((int)((intptr_t)(p)))
+#define int_to_ptr(u) ((void *)((intptr_t)(u)))
+
+#ifndef __NR_mount_setattr
+	#if defined __alpha__
+		#define __NR_mount_setattr 551
+	#elif defined _MIPS_SIM
+		#if _MIPS_SIM == _MIPS_SIM_ABI32	/* o32 */
+			#define __NR_mount_setattr 4441
+		#endif
+		#if _MIPS_SIM == _MIPS_SIM_NABI32	/* n32 */
+			#define __NR_mount_setattr 6441
+		#endif
+		#if _MIPS_SIM == _MIPS_SIM_ABI64	/* n64 */
+			#define __NR_mount_setattr 5441
+		#endif
+	#elif defined __ia64__
+		#define __NR_mount_setattr (441 + 1024)
+	#else
+		#define __NR_mount_setattr 441
+	#endif
+
+struct mount_attr {
+	__u64 attr_set;
+	__u64 attr_clr;
+	__u64 propagation;
+};
+#endif
+
+static inline int sys_mount_setattr(int dfd, const char *path, unsigned int flags,
+				    struct mount_attr *attr, size_t size)
+{
+	return syscall(__NR_mount_setattr, dfd, path, flags, attr, size);
+}
+
+static ssize_t write_nointr(int fd, const void *buf, size_t count)
+{
+	ssize_t ret;
+
+	do {
+		ret = write(fd, buf, count);
+	} while (ret < 0 && errno == EINTR);
+
+	return ret;
+}
+
+static int write_file(const char *path, const void *buf, size_t count)
+{
+	int fd;
+	ssize_t ret;
+
+	fd = open(path, O_WRONLY | O_CLOEXEC | O_NOCTTY | O_NOFOLLOW);
+	if (fd < 0)
+		return -1;
+
+	ret = write_nointr(fd, buf, count);
+	close(fd);
+	if (ret < 0 || (size_t)ret != count)
+		return -1;
+
+	return 0;
+}
+
+static int create_and_enter_userns(void)
+{
+	uid_t uid;
+	gid_t gid;
+	char map[100];
+
+	uid = getuid();
+	gid = getgid();
+
+	if (unshare(CLONE_NEWUSER))
+		return -1;
+
+	if (write_file("/proc/self/setgroups", "deny", sizeof("deny") - 1) &&
+	    errno != ENOENT)
+		return -1;
+
+	snprintf(map, sizeof(map), "0 %d 1", uid);
+	if (write_file("/proc/self/uid_map", map, strlen(map)))
+		return -1;
+
+
+	snprintf(map, sizeof(map), "0 %d 1", gid);
+	if (write_file("/proc/self/gid_map", map, strlen(map)))
+		return -1;
+
+	if (setgid(0))
+		return -1;
+
+	if (setuid(0))
+		return -1;
+
+	return 0;
+}
+
+static int prepare_unpriv_mountns(void)
+{
+	if (create_and_enter_userns())
+		return -1;
+
+	if (unshare(CLONE_NEWNS))
+		return -1;
+
+	if (mount(NULL, "/", NULL, MS_REC | MS_PRIVATE, 0))
+		return -1;
+
+	return 0;
+}
+
+static int read_mnt_flags(const char *path)
+{
+	int ret;
+	struct statvfs stat;
+	unsigned int mnt_flags;
+
+	ret = statvfs(path, &stat);
+	if (ret != 0)
+		return -EINVAL;
+
+	if (stat.f_flag &
+	    ~(ST_RDONLY | ST_NOSUID | ST_NODEV | ST_NOEXEC | ST_NOATIME |
+	      ST_NODIRATIME | ST_RELATIME | ST_SYNCHRONOUS | ST_MANDLOCK))
+		return -EINVAL;
+
+	mnt_flags = 0;
+	if (stat.f_flag & ST_RDONLY)
+		mnt_flags |= MS_RDONLY;
+	if (stat.f_flag & ST_NOSUID)
+		mnt_flags |= MS_NOSUID;
+	if (stat.f_flag & ST_NODEV)
+		mnt_flags |= MS_NODEV;
+	if (stat.f_flag & ST_NOEXEC)
+		mnt_flags |= MS_NOEXEC;
+	if (stat.f_flag & ST_NOATIME)
+		mnt_flags |= MS_NOATIME;
+	if (stat.f_flag & ST_NODIRATIME)
+		mnt_flags |= MS_NODIRATIME;
+	if (stat.f_flag & ST_RELATIME)
+		mnt_flags |= MS_RELATIME;
+	if (stat.f_flag & ST_SYNCHRONOUS)
+		mnt_flags |= MS_SYNCHRONOUS;
+	if (stat.f_flag & ST_MANDLOCK)
+		mnt_flags |= ST_MANDLOCK;
+
+	return mnt_flags;
+}
+
+static char *get_field(char *src, int nfields)
+{
+	int i;
+	char *p = src;
+
+	for (i = 0; i < nfields; i++) {
+		while (*p && *p != ' ' && *p != '\t')
+			p++;
+
+		if (!*p)
+			break;
+
+		p++;
+	}
+
+	return p;
+}
+
+static void null_endofword(char *word)
+{
+	while (*word && *word != ' ' && *word != '\t')
+		word++;
+	*word = '\0';
+}
+
+static bool is_shared_mount(const char *path)
+{
+	size_t len = 0;
+	char *line = NULL;
+	FILE *f = NULL;
+
+	f = fopen("/proc/self/mountinfo", "re");
+	if (!f)
+		return false;
+
+	while (getline(&line, &len, f) != -1) {
+		char *opts, *target;
+
+		target = get_field(line, 4);
+		if (!target)
+			continue;
+
+		opts = get_field(target, 2);
+		if (!opts)
+			continue;
+
+		null_endofword(target);
+
+		if (strcmp(target, path) != 0)
+			continue;
+
+		null_endofword(opts);
+		if (strstr(opts, "shared:"))
+			return true;
+	}
+
+	free(line);
+	fclose(f);
+
+	return false;
+}
+
+static void *mount_setattr_thread(void *data)
+{
+	struct mount_attr attr = {
+		.attr_set	= MOUNT_ATTR_RDONLY | MOUNT_ATTR_NOSUID,
+		.attr_clr	= 0,
+		.propagation	= MAKE_PROPAGATION_SHARED,
+	};
+
+	if (sys_mount_setattr(-1, "/mnt/A", AT_RECURSIVE, &attr, sizeof(attr)))
+		pthread_exit(int_to_ptr(-1));
+
+	pthread_exit(int_to_ptr(0));
+}
+
+FIXTURE(mount_setattr) {
+};
+
+FIXTURE_SETUP(mount_setattr)
+{
+	ASSERT_EQ(prepare_unpriv_mountns(), 0);
+
+	(void)umount2("/mnt", MNT_DETACH);
+	(void)umount2("/tmp", MNT_DETACH);
+
+	ASSERT_EQ(mount("testing", "/tmp", "tmpfs", MS_NOATIME | MS_NODEV,
+			"size=100000,mode=700"), 0);
+
+	ASSERT_EQ(mkdir("/tmp/B", 0777), 0);
+
+	ASSERT_EQ(mount("testing", "/tmp/B", "tmpfs", MS_NOATIME | MS_NODEV,
+			"size=100000,mode=700"), 0);
+
+	ASSERT_EQ(mkdir("/tmp/B/BB", 0777), 0);
+
+	ASSERT_EQ(mount("testing", "/tmp/B/BB", "tmpfs", MS_NOATIME | MS_NODEV,
+			"size=100000,mode=700"), 0);
+
+	ASSERT_EQ(mount("testing", "/mnt", "tmpfs", MS_NOATIME | MS_NODEV,
+			"size=100000,mode=700"), 0);
+
+	ASSERT_EQ(mkdir("/mnt/A", 0777), 0);
+
+	ASSERT_EQ(mount("testing", "/mnt/A", "tmpfs", MS_NOATIME | MS_NODEV,
+			"size=100000,mode=700"), 0);
+
+	ASSERT_EQ(mkdir("/mnt/A/AA", 0777), 0);
+
+	ASSERT_EQ(mount("/tmp", "/mnt/A/AA", NULL, MS_BIND | MS_REC, NULL), 0);
+
+	ASSERT_EQ(mkdir("/mnt/B", 0777), 0);
+
+	ASSERT_EQ(mount("testing", "/mnt/B", "ramfs",
+			MS_NOATIME | MS_NODEV | MS_NOSUID, 0), 0);
+
+	ASSERT_EQ(mkdir("/mnt/B/BB", 0777), 0);
+
+	ASSERT_EQ(mount("testing", "/tmp/B/BB", "devpts",
+			MS_RELATIME | MS_NOEXEC | MS_RDONLY, 0), 0);
+}
+
+FIXTURE_TEARDOWN(mount_setattr)
+{
+	(void)umount2("/mnt/A", MNT_DETACH);
+	(void)umount2("/tmp", MNT_DETACH);
+}
+
+TEST_F(mount_setattr, invalid_attributes)
+{
+	struct mount_attr invalid_attr = {
+		.attr_set = (1U << 31),
+	};
+
+	ASSERT_NE(sys_mount_setattr(-1, "/mnt/A", AT_RECURSIVE, &invalid_attr,
+				    sizeof(invalid_attr)), 0);
+
+	invalid_attr.attr_set	= 0;
+	invalid_attr.attr_clr	= (1U << 31);
+	ASSERT_NE(sys_mount_setattr(-1, "/mnt/A", AT_RECURSIVE, &invalid_attr,
+				    sizeof(invalid_attr)), 0);
+
+	invalid_attr.attr_clr		= 0;
+	invalid_attr.propagation	= (1U << 31);
+	ASSERT_NE(sys_mount_setattr(-1, "/mnt/A", AT_RECURSIVE, &invalid_attr,
+				    sizeof(invalid_attr)), 0);
+
+	invalid_attr.attr_set		= (1U << 31);
+	invalid_attr.attr_clr		= (1U << 31);
+	invalid_attr.propagation	= (1U << 31);
+	ASSERT_NE(sys_mount_setattr(-1, "/mnt/A", AT_RECURSIVE, &invalid_attr,
+				    sizeof(invalid_attr)), 0);
+
+	ASSERT_NE(sys_mount_setattr(-1, "mnt/A", AT_RECURSIVE, &invalid_attr,
+				    sizeof(invalid_attr)), 0);
+}
+
+TEST_F(mount_setattr, extensibility)
+{
+	unsigned int old_flags = 0, new_flags = 0, expected_flags = 0;
+	char *s = "dummy";
+	struct mount_attr invalid_attr = {};
+	struct mount_attr_large {
+		struct mount_attr attr1;
+		struct mount_attr attr2;
+		struct mount_attr attr3;
+	} large_attr = {};
+
+	old_flags = read_mnt_flags("/mnt/A");
+	ASSERT_GT(old_flags, 0);
+
+	ASSERT_NE(sys_mount_setattr(-1, "/mnt/A", AT_RECURSIVE, NULL,
+				    sizeof(invalid_attr)), 0);
+	ASSERT_EQ(errno, EFAULT);
+
+	ASSERT_NE(sys_mount_setattr(-1, "/mnt/A", AT_RECURSIVE, (void *)s,
+				    sizeof(invalid_attr)), 0);
+	ASSERT_EQ(errno, EINVAL);
+
+	ASSERT_NE(sys_mount_setattr(-1, "/mnt/A", AT_RECURSIVE, &invalid_attr, 0), 0);
+	ASSERT_EQ(errno, EINVAL);
+
+	ASSERT_NE(sys_mount_setattr(-1, "/mnt/A", AT_RECURSIVE, &invalid_attr,
+				    sizeof(invalid_attr) / 2), 0);
+	ASSERT_EQ(errno, EINVAL);
+
+	ASSERT_NE(sys_mount_setattr(-1, "/mnt/A", AT_RECURSIVE, &invalid_attr,
+				    sizeof(invalid_attr) / 2), 0);
+	ASSERT_EQ(errno, EINVAL);
+
+	ASSERT_EQ(sys_mount_setattr(-1, "/mnt/A", AT_RECURSIVE,
+				    (void *)&large_attr, sizeof(large_attr)), 0);
+
+	large_attr.attr3.attr_set = MOUNT_ATTR_RDONLY;
+	ASSERT_NE(sys_mount_setattr(-1, "/mnt/A", AT_RECURSIVE,
+				    (void *)&large_attr, sizeof(large_attr)), 0);
+
+	large_attr.attr3.attr_set = 0;
+	large_attr.attr1.attr_set = MOUNT_ATTR_RDONLY;
+	ASSERT_EQ(sys_mount_setattr(-1, "/mnt/A", AT_RECURSIVE,
+				    (void *)&large_attr, sizeof(large_attr)), 0);
+
+	expected_flags = old_flags;
+	expected_flags |= MS_RDONLY;
+
+	new_flags = read_mnt_flags("/mnt/A");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	new_flags = read_mnt_flags("/mnt/A/AA");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	new_flags = read_mnt_flags("/mnt/A/AA/B");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	new_flags = read_mnt_flags("/mnt/A/AA/B/BB");
+	ASSERT_EQ(new_flags, expected_flags);
+}
+
+TEST_F(mount_setattr, basic)
+{
+	unsigned int old_flags = 0, new_flags = 0, expected_flags = 0;
+	struct mount_attr attr = {
+		.attr_set	= MOUNT_ATTR_RDONLY | MOUNT_ATTR_NOEXEC | MOUNT_ATTR_RELATIME,
+		.attr_clr	= MOUNT_ATTR__ATIME,
+	};
+
+	old_flags = read_mnt_flags("/mnt/A");
+	ASSERT_GT(old_flags, 0);
+
+	ASSERT_EQ(sys_mount_setattr(-1, "/mnt/A", 0, &attr, sizeof(attr)), 0);
+
+	expected_flags = old_flags;
+	expected_flags |= MS_RDONLY;
+	expected_flags |= MS_NOEXEC;
+	expected_flags &= ~MS_NOATIME;
+	expected_flags |= MS_RELATIME;
+
+	new_flags = read_mnt_flags("/mnt/A");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	new_flags = read_mnt_flags("/mnt/A/AA");
+	ASSERT_EQ(new_flags, old_flags);
+
+	new_flags = read_mnt_flags("/mnt/A/AA/B");
+	ASSERT_EQ(new_flags, old_flags);
+
+	new_flags = read_mnt_flags("/mnt/A/AA/B/BB");
+	ASSERT_EQ(new_flags, old_flags);
+}
+
+TEST_F(mount_setattr, basic_recursive)
+{
+	int fd;
+	unsigned int old_flags = 0, new_flags = 0, expected_flags = 0;
+	struct mount_attr attr = {
+		.attr_set	= MOUNT_ATTR_RDONLY | MOUNT_ATTR_NOEXEC | MOUNT_ATTR_RELATIME,
+		.attr_clr	= MOUNT_ATTR__ATIME,
+	};
+
+	old_flags = read_mnt_flags("/mnt/A");
+	ASSERT_GT(old_flags, 0);
+
+	ASSERT_EQ(sys_mount_setattr(-1, "/mnt/A", AT_RECURSIVE, &attr, sizeof(attr)), 0);
+
+	expected_flags = old_flags;
+	expected_flags |= MS_RDONLY;
+	expected_flags |= MS_NOEXEC;
+	expected_flags &= ~MS_NOATIME;
+	expected_flags |= MS_RELATIME;
+
+	new_flags = read_mnt_flags("/mnt/A");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	new_flags = read_mnt_flags("/mnt/A/AA");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	new_flags = read_mnt_flags("/mnt/A/AA/B");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	new_flags = read_mnt_flags("/mnt/A/AA/B/BB");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	memset(&attr, 0, sizeof(attr));
+	attr.attr_clr = MOUNT_ATTR_RDONLY;
+	attr.propagation = MAKE_PROPAGATION_SHARED;
+	ASSERT_EQ(sys_mount_setattr(-1, "/mnt/A", AT_RECURSIVE, &attr, sizeof(attr)), 0);
+
+	expected_flags &= ~MS_RDONLY;
+	new_flags = read_mnt_flags("/mnt/A");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	ASSERT_EQ(is_shared_mount("/mnt/A"), true);
+
+	new_flags = read_mnt_flags("/mnt/A/AA");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	ASSERT_EQ(is_shared_mount("/mnt/A/AA"), true);
+
+	new_flags = read_mnt_flags("/mnt/A/AA/B");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	ASSERT_EQ(is_shared_mount("/mnt/A/AA/B"), true);
+
+	new_flags = read_mnt_flags("/mnt/A/AA/B/BB");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	ASSERT_EQ(is_shared_mount("/mnt/A/AA/B/BB"), true);
+
+	fd = open("/mnt/A/AA/B/b", O_RDWR | O_CLOEXEC | O_CREAT | O_EXCL, 0777);
+	ASSERT_GE(fd, 0);
+
+	/*
+	 * We're holding a fd open for writing so this needs to fail somewhere
+	 * in the middle and the mount options need to be unchanged.
+	 */
+	attr.attr_set = MOUNT_ATTR_RDONLY;
+	ASSERT_LT(sys_mount_setattr(-1, "/mnt/A", AT_RECURSIVE, &attr, sizeof(attr)), 0);
+
+	new_flags = read_mnt_flags("/mnt/A");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	ASSERT_EQ(is_shared_mount("/mnt/A"), true);
+
+	new_flags = read_mnt_flags("/mnt/A/AA");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	ASSERT_EQ(is_shared_mount("/mnt/A/AA"), true);
+
+	new_flags = read_mnt_flags("/mnt/A/AA/B");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	ASSERT_EQ(is_shared_mount("/mnt/A/AA/B"), true);
+
+	new_flags = read_mnt_flags("/mnt/A/AA/B/BB");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	ASSERT_EQ(is_shared_mount("/mnt/A/AA/B/BB"), true);
+
+	EXPECT_EQ(close(fd), 0);
+}
+
+TEST_F(mount_setattr, mount_has_writers)
+{
+	int fd, dfd;
+	unsigned int old_flags = 0, new_flags = 0;
+	struct mount_attr attr = {
+		.attr_set	= MOUNT_ATTR_RDONLY | MOUNT_ATTR_NOEXEC | MOUNT_ATTR_RELATIME,
+		.attr_clr	= MOUNT_ATTR__ATIME,
+		.propagation	= MAKE_PROPAGATION_SHARED,
+	};
+
+	old_flags = read_mnt_flags("/mnt/A");
+	ASSERT_GT(old_flags, 0);
+
+	fd = open("/mnt/A/AA/B/b", O_RDWR | O_CLOEXEC | O_CREAT | O_EXCL, 0777);
+	ASSERT_GE(fd, 0);
+
+	/*
+	 * We're holding a fd open to a mount somwhere in the middle so this
+	 * needs to fail somewhere in the middle. After this the mount options
+	 * need to be unchanged.
+	 */
+	ASSERT_LT(sys_mount_setattr(-1, "/mnt/A", AT_RECURSIVE, &attr, sizeof(attr)), 0);
+
+	new_flags = read_mnt_flags("/mnt/A");
+	ASSERT_EQ(new_flags, old_flags);
+
+	ASSERT_EQ(is_shared_mount("/mnt/A"), false);
+
+	new_flags = read_mnt_flags("/mnt/A/AA");
+	ASSERT_EQ(new_flags, old_flags);
+
+	ASSERT_EQ(is_shared_mount("/mnt/A/AA"), false);
+
+	new_flags = read_mnt_flags("/mnt/A/AA/B");
+	ASSERT_EQ(new_flags, old_flags);
+
+	ASSERT_EQ(is_shared_mount("/mnt/A/AA/B"), false);
+
+	new_flags = read_mnt_flags("/mnt/A/AA/B/BB");
+	ASSERT_EQ(new_flags, old_flags);
+
+	ASSERT_EQ(is_shared_mount("/mnt/A/AA/B/BB"), false);
+
+	dfd = open("/mnt/A/AA/B", O_DIRECTORY | O_CLOEXEC);
+	ASSERT_GE(dfd, 0);
+	EXPECT_EQ(fsync(dfd), 0);
+	EXPECT_EQ(close(dfd), 0);
+
+	EXPECT_EQ(fsync(fd), 0);
+	EXPECT_EQ(close(fd), 0);
+
+	/* All writers are gone so this should succeed. */
+	ASSERT_EQ(sys_mount_setattr(-1, "/mnt/A", AT_RECURSIVE, &attr, sizeof(attr)), 0);
+}
+
+TEST_F(mount_setattr, mixed_mount_options)
+{
+	unsigned int old_flags1 = 0, old_flags2 = 0, new_flags = 0, expected_flags = 0;
+	struct mount_attr attr = {
+		.attr_clr = MOUNT_ATTR_RDONLY | MOUNT_ATTR_NOSUID | MOUNT_ATTR_NOEXEC | MOUNT_ATTR__ATIME,
+		.attr_set = MOUNT_ATTR_RELATIME,
+	};
+
+	old_flags1 = read_mnt_flags("/mnt/B");
+	ASSERT_GT(old_flags1, 0);
+
+	old_flags2 = read_mnt_flags("/mnt/B/BB");
+	ASSERT_GT(old_flags2, 0);
+
+	ASSERT_EQ(sys_mount_setattr(-1, "/mnt/B", AT_RECURSIVE, &attr, sizeof(attr)), 0);
+
+	expected_flags = old_flags2;
+	expected_flags &= ~(MS_RDONLY | MS_NOEXEC | MS_NOATIME | MS_NOSUID);
+	expected_flags |= MS_RELATIME;
+
+	new_flags = read_mnt_flags("/mnt/B");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	expected_flags = old_flags2;
+	expected_flags &= ~(MS_RDONLY | MS_NOEXEC | MS_NOATIME | MS_NOSUID);
+	expected_flags |= MS_RELATIME;
+
+	new_flags = read_mnt_flags("/mnt/B/BB");
+	ASSERT_EQ(new_flags, expected_flags);
+}
+
+TEST_F(mount_setattr, time_changes)
+{
+	unsigned int old_flags = 0, new_flags = 0, expected_flags = 0;
+	struct mount_attr attr = {
+		.attr_set	= MOUNT_ATTR_NODIRATIME | MOUNT_ATTR_NOATIME,
+	};
+
+	ASSERT_NE(sys_mount_setattr(-1, "/mnt/A", AT_RECURSIVE, &attr, sizeof(attr)), 0);
+
+	attr.attr_set = MOUNT_ATTR_STRICTATIME;
+	ASSERT_NE(sys_mount_setattr(-1, "/mnt/A", AT_RECURSIVE, &attr, sizeof(attr)), 0);
+
+	attr.attr_set = MOUNT_ATTR_STRICTATIME | MOUNT_ATTR_NOATIME;
+	ASSERT_NE(sys_mount_setattr(-1, "/mnt/A", AT_RECURSIVE, &attr, sizeof(attr)), 0);
+
+	attr.attr_set = MOUNT_ATTR_STRICTATIME | MOUNT_ATTR_NOATIME;
+	attr.attr_clr = MOUNT_ATTR__ATIME;
+	ASSERT_NE(sys_mount_setattr(-1, "/mnt/A", AT_RECURSIVE, &attr, sizeof(attr)), 0);
+
+	attr.attr_set = 0;
+	attr.attr_clr = MOUNT_ATTR_STRICTATIME;
+	ASSERT_NE(sys_mount_setattr(-1, "/mnt/A", AT_RECURSIVE, &attr, sizeof(attr)), 0);
+
+	attr.attr_clr = MOUNT_ATTR_NOATIME;
+	ASSERT_NE(sys_mount_setattr(-1, "/mnt/A", AT_RECURSIVE, &attr, sizeof(attr)), 0);
+
+	old_flags = read_mnt_flags("/mnt/A");
+	ASSERT_GT(old_flags, 0);
+
+	attr.attr_set = MOUNT_ATTR_NODIRATIME | MOUNT_ATTR_NOATIME;
+	attr.attr_clr = MOUNT_ATTR__ATIME;
+	ASSERT_EQ(sys_mount_setattr(-1, "/mnt/A", AT_RECURSIVE, &attr, sizeof(attr)), 0);
+
+	expected_flags = old_flags;
+	expected_flags |= MS_NOATIME;
+	expected_flags |= MS_NODIRATIME;
+
+	new_flags = read_mnt_flags("/mnt/A");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	new_flags = read_mnt_flags("/mnt/A/AA");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	new_flags = read_mnt_flags("/mnt/A/AA/B");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	new_flags = read_mnt_flags("/mnt/A/AA/B/BB");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	memset(&attr, 0, sizeof(attr));
+	attr.attr_set &= ~MOUNT_ATTR_NOATIME;
+	attr.attr_set |= MOUNT_ATTR_RELATIME;
+	attr.attr_clr |= MOUNT_ATTR__ATIME;
+	ASSERT_EQ(sys_mount_setattr(-1, "/mnt/A", AT_RECURSIVE, &attr, sizeof(attr)), 0);
+
+	expected_flags &= ~MS_NOATIME;
+	expected_flags |= MS_RELATIME;
+
+	new_flags = read_mnt_flags("/mnt/A");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	new_flags = read_mnt_flags("/mnt/A/AA");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	new_flags = read_mnt_flags("/mnt/A/AA/B");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	new_flags = read_mnt_flags("/mnt/A/AA/B/BB");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	memset(&attr, 0, sizeof(attr));
+	attr.attr_set &= ~MOUNT_ATTR_RELATIME;
+	attr.attr_set |= MOUNT_ATTR_STRICTATIME;
+	attr.attr_clr |= MOUNT_ATTR__ATIME;
+	ASSERT_EQ(sys_mount_setattr(-1, "/mnt/A", AT_RECURSIVE, &attr, sizeof(attr)), 0);
+
+	expected_flags &= ~MS_RELATIME;
+
+	new_flags = read_mnt_flags("/mnt/A");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	new_flags = read_mnt_flags("/mnt/A/AA");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	new_flags = read_mnt_flags("/mnt/A/AA/B");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	new_flags = read_mnt_flags("/mnt/A/AA/B/BB");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	memset(&attr, 0, sizeof(attr));
+	attr.attr_set &= ~MOUNT_ATTR_STRICTATIME;
+	attr.attr_set |= MOUNT_ATTR_NOATIME;
+	attr.attr_clr |= MOUNT_ATTR__ATIME;
+	ASSERT_EQ(sys_mount_setattr(-1, "/mnt/A", AT_RECURSIVE, &attr, sizeof(attr)), 0);
+
+	expected_flags |= MS_NOATIME;
+	new_flags = read_mnt_flags("/mnt/A");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	new_flags = read_mnt_flags("/mnt/A/AA");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	new_flags = read_mnt_flags("/mnt/A/AA/B");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	new_flags = read_mnt_flags("/mnt/A/AA/B/BB");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	memset(&attr, 0, sizeof(attr));
+	ASSERT_EQ(sys_mount_setattr(-1, "/mnt/A", AT_RECURSIVE, &attr, sizeof(attr)), 0);
+
+	new_flags = read_mnt_flags("/mnt/A");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	new_flags = read_mnt_flags("/mnt/A/AA");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	new_flags = read_mnt_flags("/mnt/A/AA/B");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	new_flags = read_mnt_flags("/mnt/A/AA/B/BB");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	memset(&attr, 0, sizeof(attr));
+	attr.attr_clr = MOUNT_ATTR_NODIRATIME;
+	ASSERT_EQ(sys_mount_setattr(-1, "/mnt/A", AT_RECURSIVE, &attr, sizeof(attr)), 0);
+
+	expected_flags &= ~MS_NODIRATIME;
+
+	new_flags = read_mnt_flags("/mnt/A");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	new_flags = read_mnt_flags("/mnt/A/AA");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	new_flags = read_mnt_flags("/mnt/A/AA/B");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	new_flags = read_mnt_flags("/mnt/A/AA/B/BB");
+	ASSERT_EQ(new_flags, expected_flags);
+}
+
+TEST_F(mount_setattr, multi_threaded)
+{
+	int i, j, nthreads, ret = 0;
+	unsigned int old_flags = 0, new_flags = 0, expected_flags = 0;
+	pthread_attr_t pattr;
+	pthread_t threads[DEFAULT_THREADS];
+
+	old_flags = read_mnt_flags("/mnt/A");
+	ASSERT_GT(old_flags, 0);
+
+	/* Try to change mount options from multiple threads. */
+	nthreads = get_nprocs_conf();
+	if (nthreads > DEFAULT_THREADS)
+		nthreads = DEFAULT_THREADS;
+
+	pthread_attr_init(&pattr);
+	for (i = 0; i < nthreads; i++)
+		ASSERT_EQ(pthread_create(&threads[i], &pattr, mount_setattr_thread, NULL), 0);
+
+	for (j = 0; j < i; j++) {
+		void *retptr = NULL;
+
+		EXPECT_EQ(pthread_join(threads[j], &retptr), 0);
+
+		ret += ptr_to_int(retptr);
+		EXPECT_EQ(ret, 0);
+	}
+	pthread_attr_destroy(&pattr);
+
+	ASSERT_EQ(ret, 0);
+
+	expected_flags = old_flags;
+	expected_flags |= MS_RDONLY;
+	expected_flags |= MS_NOSUID;
+	new_flags = read_mnt_flags("/mnt/A");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	ASSERT_EQ(is_shared_mount("/mnt/A"), true);
+
+	new_flags = read_mnt_flags("/mnt/A/AA");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	ASSERT_EQ(is_shared_mount("/mnt/A/AA"), true);
+
+	new_flags = read_mnt_flags("/mnt/A/AA/B");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	ASSERT_EQ(is_shared_mount("/mnt/A/AA/B"), true);
+
+	new_flags = read_mnt_flags("/mnt/A/AA/B/BB");
+	ASSERT_EQ(new_flags, expected_flags);
+
+	ASSERT_EQ(is_shared_mount("/mnt/A/AA/B/BB"), true);
+}
+
+TEST_F(mount_setattr, wrong_user_namespace)
+{
+	int ret;
+	struct mount_attr attr = {
+		.attr_set = MOUNT_ATTR_RDONLY,
+	};
+
+	EXPECT_EQ(create_and_enter_userns(), 0);
+	ret = sys_mount_setattr(-1, "/mnt/A", AT_RECURSIVE, &attr, sizeof(attr));
+	ASSERT_LT(ret, 0);
+	ASSERT_EQ(errno, EPERM);
+}
+
+TEST_F(mount_setattr, wrong_mount_namespace)
+{
+	int fd, ret;
+	struct mount_attr attr = {
+		.attr_set = MOUNT_ATTR_RDONLY,
+	};
+
+	fd = open("/mnt/A", O_DIRECTORY | O_CLOEXEC);
+	ASSERT_GE(fd, 0);
+
+	ASSERT_EQ(unshare(CLONE_NEWNS), 0);
+
+	ret = sys_mount_setattr(fd, "", AT_EMPTY_PATH | AT_RECURSIVE, &attr, sizeof(attr));
+	ASSERT_LT(ret, 0);
+	ASSERT_EQ(errno, EINVAL);
+}
+
+TEST_HARNESS_MAIN
-- 
2.29.2

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

