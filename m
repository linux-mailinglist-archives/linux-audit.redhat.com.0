Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5190E2B3B60
	for <lists+linux-audit@lfdr.de>; Mon, 16 Nov 2020 03:15:45 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-yo3NsVv_M3Koey_tTlbKRg-1; Sun, 15 Nov 2020 21:15:40 -0500
X-MC-Unique: yo3NsVv_M3Koey_tTlbKRg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB9061087D60;
	Mon, 16 Nov 2020 02:15:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AAA41002C1B;
	Mon, 16 Nov 2020 02:15:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4ECFF181A869;
	Mon, 16 Nov 2020 02:15:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AFAkB07025827 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 15 Nov 2020 05:46:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5510C5D23C; Sun, 15 Nov 2020 10:46:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F5155D23E
	for <linux-audit@redhat.com>; Sun, 15 Nov 2020 10:46:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E417F858296
	for <linux-audit@redhat.com>; Sun, 15 Nov 2020 10:46:08 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-578--zz5O-ExMdaeZpx-QnSyhA-1; Sun, 15 Nov 2020 05:46:04 -0500
X-MC-Unique: -zz5O-ExMdaeZpx-QnSyhA-1
Received: from ip5f5af0a0.dynamic.kabel-deutschland.de ([95.90.240.160]
	helo=wittgenstein.fritz.box) by youngberry.canonical.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <christian.brauner@ubuntu.com>)
	id 1keFS8-0000Kt-BH; Sun, 15 Nov 2020 10:40:12 +0000
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christoph Hellwig <hch@infradead.org>, linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 38/39] selftests: add idmapped mounts xattr selftest
Date: Sun, 15 Nov 2020 11:37:17 +0100
Message-Id: <20201115103718.298186-39-christian.brauner@ubuntu.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
	Tycho Andersen <tycho@tycho.pizza>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Tycho Andersen <tycho@tycho.pizza>

Add some tests for setting extended attributes on idmapped mounts.

Cc: Christoph Hellwig <hch@lst.de>
Cc: David Howells <dhowells@redhat.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org
Signed-off-by: Tycho Andersen <tycho@tycho.pizza>
Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
---
/* v2 */
patch introduced
---
 .../testing/selftests/idmap_mounts/.gitignore |   1 +
 tools/testing/selftests/idmap_mounts/Makefile |   9 +
 tools/testing/selftests/idmap_mounts/config   |   1 +
 .../testing/selftests/idmap_mounts/internal.h | 116 +++++++
 tools/testing/selftests/idmap_mounts/xattr.c  | 284 ++++++++++++++++++
 5 files changed, 411 insertions(+)
 create mode 100644 tools/testing/selftests/idmap_mounts/.gitignore
 create mode 100644 tools/testing/selftests/idmap_mounts/Makefile
 create mode 100644 tools/testing/selftests/idmap_mounts/config
 create mode 100644 tools/testing/selftests/idmap_mounts/internal.h
 create mode 100644 tools/testing/selftests/idmap_mounts/xattr.c

diff --git a/tools/testing/selftests/idmap_mounts/.gitignore b/tools/testing/selftests/idmap_mounts/.gitignore
new file mode 100644
index 000000000000..18c5e90522ad
--- /dev/null
+++ b/tools/testing/selftests/idmap_mounts/.gitignore
@@ -0,0 +1 @@
+xattr
diff --git a/tools/testing/selftests/idmap_mounts/Makefile b/tools/testing/selftests/idmap_mounts/Makefile
new file mode 100644
index 000000000000..1d495c99d924
--- /dev/null
+++ b/tools/testing/selftests/idmap_mounts/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0
+# Makefile for mount selftests.
+CFLAGS = -g -I../../../../usr/include/ -Wall -O2 -pthread
+
+TEST_GEN_FILES += xattr
+
+include ../lib.mk
+
+$(OUTPUT)/xattr: xattr.c internal.h
diff --git a/tools/testing/selftests/idmap_mounts/config b/tools/testing/selftests/idmap_mounts/config
new file mode 100644
index 000000000000..80730abc534b
--- /dev/null
+++ b/tools/testing/selftests/idmap_mounts/config
@@ -0,0 +1 @@
+CONFIG_IDMAP_MOUNTS=y
diff --git a/tools/testing/selftests/idmap_mounts/internal.h b/tools/testing/selftests/idmap_mounts/internal.h
new file mode 100644
index 000000000000..252803f35d71
--- /dev/null
+++ b/tools/testing/selftests/idmap_mounts/internal.h
@@ -0,0 +1,116 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __IDMAP_INTERNAL_H
+#define __IDMAP_INTERNAL_H
+
+#define _GNU_SOURCE
+
+#include "../kselftest_harness.h"
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
+#ifndef __NR_open_tree
+	#if defined __alpha__
+		#define __NR_open_tree 538
+	#elif defined _MIPS_SIM
+		#if _MIPS_SIM == _MIPS_SIM_ABI32	/* o32 */
+			#define __NR_open_tree 4428
+		#endif
+		#if _MIPS_SIM == _MIPS_SIM_NABI32	/* n32 */
+			#define __NR_open_tree 6428
+		#endif
+		#if _MIPS_SIM == _MIPS_SIM_ABI64	/* n64 */
+			#define __NR_open_tree 5428
+		#endif
+	#elif defined __ia64__
+		#define __NR_open_tree (428 + 1024)
+	#else
+		#define __NR_open_tree 428
+	#endif
+#endif
+
+#ifndef __NR_move_mount
+	#if defined __alpha__
+		#define __NR_move_mount 539
+	#elif defined _MIPS_SIM
+		#if _MIPS_SIM == _MIPS_SIM_ABI32	/* o32 */
+			#define __NR_move_mount 4429
+		#endif
+		#if _MIPS_SIM == _MIPS_SIM_NABI32	/* n32 */
+			#define __NR_move_mount 6429
+		#endif
+		#if _MIPS_SIM == _MIPS_SIM_ABI64	/* n64 */
+			#define __NR_move_mount 5429
+		#endif
+	#elif defined __ia64__
+		#define __NR_move_mount (428 + 1024)
+	#else
+		#define __NR_move_mount 429
+	#endif
+#endif
+
+
+struct mount_attr {
+	__u64 attr_set;
+	__u64 attr_clr;
+	__u64 propagation;
+	__u64 userns;
+};
+#endif
+
+#ifndef MOVE_MOUNT_F_EMPTY_PATH
+#define MOVE_MOUNT_F_EMPTY_PATH 0x00000004 /* Empty from path permitted */
+#endif
+
+#ifndef MOUNT_ATTR_IDMAP
+#define MOUNT_ATTR_IDMAP 0x00100000
+#endif
+
+#ifndef OPEN_TREE_CLONE
+#define OPEN_TREE_CLONE 1
+#endif
+
+#ifndef OPEN_TREE_CLOEXEC
+#define OPEN_TREE_CLOEXEC O_CLOEXEC
+#endif
+
+#ifndef AT_RECURSIVE
+#define AT_RECURSIVE 0x8000 /* Apply to the entire subtree */
+#endif
+
+static inline int sys_mount_setattr(int dfd, const char *path, unsigned int flags,
+				    struct mount_attr *attr, size_t size)
+{
+	return syscall(__NR_mount_setattr, dfd, path, flags, attr, size);
+}
+
+static inline int sys_open_tree(int dfd, const char *filename, unsigned int flags)
+{
+	return syscall(__NR_open_tree, dfd, filename, flags);
+}
+
+static inline int sys_move_mount(int from_dfd, const char *from_pathname, int to_dfd,
+				 const char *to_pathname, unsigned int flags)
+{
+	return syscall(__NR_move_mount, from_dfd, from_pathname, to_dfd, to_pathname, flags);
+}
+
+
+#endif /* __IDMAP_INTERNAL_H */
diff --git a/tools/testing/selftests/idmap_mounts/xattr.c b/tools/testing/selftests/idmap_mounts/xattr.c
new file mode 100644
index 000000000000..58e88f92f958
--- /dev/null
+++ b/tools/testing/selftests/idmap_mounts/xattr.c
@@ -0,0 +1,284 @@
+// SPDX-License-Identifier: GPL-2.0
+#define _GNU_SOURCE
+#include <fcntl.h>
+#include <sched.h>
+#include <sys/mount.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <linux/limits.h>
+
+#include "internal.h"
+#include "../kselftest_harness.h"
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
+static int map_ids(pid_t pid, unsigned long nsid, unsigned long hostid,
+		   unsigned long range)
+{
+	char map[100], procfile[256];
+
+	snprintf(procfile, sizeof(procfile), "/proc/%d/setgroups", pid);
+	if (write_file(procfile, "deny", sizeof("deny") - 1) &&
+	    errno != ENOENT)
+		return -1;
+
+	snprintf(procfile, sizeof(procfile), "/proc/%d/uid_map", pid);
+	snprintf(map, sizeof(map), "%lu %lu %lu", nsid, hostid, range);
+	if (write_file(procfile, map, strlen(map)))
+		return -1;
+
+
+	snprintf(procfile, sizeof(procfile), "/proc/%d/gid_map", pid);
+	snprintf(map, sizeof(map), "%lu %lu %lu", nsid, hostid, range);
+	if (write_file(procfile, map, strlen(map)))
+		return -1;
+
+	return 0;
+}
+
+#define __STACK_SIZE (8 * 1024 * 1024)
+static pid_t do_clone(int (*fn)(void *), void *arg, int flags)
+{
+	void *stack;
+
+	stack = malloc(__STACK_SIZE);
+	if (!stack)
+		return -ENOMEM;
+
+#ifdef __ia64__
+	return __clone2(fn, stack, __STACK_SIZE, flags | SIGCHLD, arg, NULL);
+#else
+	return clone(fn, stack + __STACK_SIZE, flags | SIGCHLD, arg, NULL);
+#endif
+}
+
+static int get_userns_fd_cb(void *data)
+{
+	return kill(getpid(), SIGSTOP);
+}
+
+static int get_userns_fd(unsigned long nsid, unsigned long hostid,
+			 unsigned long range)
+{
+	int ret;
+	pid_t pid;
+	char path[256];
+
+	pid = do_clone(get_userns_fd_cb, NULL, CLONE_NEWUSER | CLONE_NEWNS);
+	if (pid < 0)
+		return -errno;
+
+	ret = map_ids(pid, nsid, hostid, range);
+	if (ret < 0)
+		return ret;
+
+	snprintf(path, sizeof(path), "/proc/%d/ns/user", pid);
+	ret = open(path, O_RDONLY | O_CLOEXEC);
+	kill(pid, SIGKILL);
+	return ret;
+}
+
+struct run_as_data {
+	int userns;
+	int (*f)(void *data);
+	void *data;
+};
+
+static int run_in_cb(void *data)
+{
+	struct run_as_data *rad = data;
+
+	if (setns(rad->userns, CLONE_NEWUSER) < 0) {
+		perror("setns");
+		return 1;
+	}
+
+	if (setuid(100010)) {
+		perror("setuid");
+		return 1;
+	}
+
+	if (setgid(100010)) {
+		perror("setgid");
+		return 1;
+	}
+
+	return rad->f(rad->data);
+}
+
+static int wait_for_pid(pid_t pid)
+{
+	int status, ret;
+
+again:
+	ret = waitpid(pid, &status, 0);
+	if (ret == -1) {
+		if (errno == EINTR)
+			goto again;
+
+		return -1;
+	}
+
+	if (!WIFEXITED(status))
+		return -1;
+
+	return WEXITSTATUS(status);
+}
+
+static int run_in(int userns, int (*f)(void *), void *f_data)
+{
+	pid_t pid;
+	struct run_as_data data;
+
+	data.userns = userns;
+	data.f = f;
+	data.data = f_data;
+	pid = do_clone(run_in_cb, &data, 0);
+	if (pid < 0)
+		return -errno;
+
+	return wait_for_pid(pid);
+}
+
+FIXTURE(ext4_xattr) {};
+
+FIXTURE_SETUP(ext4_xattr)
+{
+	int fd;
+
+	fd = open("/tmp/idmap_mounts.ext4", O_CREAT | O_WRONLY, 0600);
+	ASSERT_GE(fd, 0);
+	ASSERT_EQ(ftruncate(fd, 640 * 1024), 0);
+	ASSERT_EQ(close(fd), 0);
+	ASSERT_EQ(system("mkfs.ext4 /tmp/idmap_mounts.ext4"), 0);
+	ASSERT_EQ(mkdir("/tmp/ext4", 0777), 0);
+	ASSERT_EQ(system("mount -o loop -t ext4 /tmp/idmap_mounts.ext4 /tmp/ext4"), 0);
+}
+
+FIXTURE_TEARDOWN(ext4_xattr)
+{
+	umount("/tmp/ext4/dest");
+	umount("/tmp/ext4");
+	rmdir("/tmp/ext4");
+	unlink("/tmp/idmap_mounts.ext4");
+}
+
+struct getacl_should_be_data {
+	char path[256];
+	uid_t uid;
+};
+
+static int getacl_should_be_uid(void *data)
+{
+	struct getacl_should_be_data *ssb = data;
+	char cmd[512];
+	int ret;
+
+	snprintf(cmd, sizeof(cmd), "getfacl %s | grep user:%u:rwx", ssb->path, ssb->uid);
+	ret = system(cmd);
+	if (ret < 0) {
+		perror("system");
+		return -1;
+	}
+	if (!WIFEXITED(ret))
+		return -1;
+	return WEXITSTATUS(ret);
+}
+
+static int ls_path(void *data)
+{
+	char cmd[PATH_MAX];
+	char *path = data;
+	int ret;
+
+	snprintf(cmd, sizeof(cmd), "ls %s", path);
+	ret = system(cmd);
+	if (ret < 0) {
+		perror("system");
+		return -1;
+	}
+	if (!WIFEXITED(ret))
+		return -1;
+	return WEXITSTATUS(ret);
+}
+
+TEST_F(ext4_xattr, setattr_didnt_work)
+{
+	int mount_fd, ret;
+	struct mount_attr attr = {};
+	struct getacl_should_be_data ssb;
+
+	ASSERT_EQ(mkdir("/tmp/ext4/source", 0777), 0);
+	ASSERT_EQ(mkdir("/tmp/ext4/dest", 0777), 0);
+
+	mount_fd = sys_open_tree(-EBADF, "/tmp/ext4/source",
+				 OPEN_TREE_CLONE | OPEN_TREE_CLOEXEC | AT_EMPTY_PATH);
+	ASSERT_GE(mount_fd, 0);
+
+	ASSERT_EQ(sys_move_mount(mount_fd, "", -EBADF, "/tmp/ext4/dest",
+				 MOVE_MOUNT_F_EMPTY_PATH), 0);
+
+	attr.attr_set = MOUNT_ATTR_IDMAP;
+	attr.userns = get_userns_fd(100010, 100020, 5);
+	ASSERT_GE(attr.userns, 0);
+	ret = sys_mount_setattr(mount_fd, "", AT_EMPTY_PATH | AT_RECURSIVE,
+				    &attr, sizeof(attr));
+	ASSERT_EQ(close(mount_fd), 0);
+	ASSERT_EQ(ret, 0);
+
+	ASSERT_EQ(mkdir("/tmp/ext4/source/foo", 0700), 0);
+	ASSERT_EQ(chown("/tmp/ext4/source/foo", 100010, 100010), 0);
+
+	ASSERT_EQ(system("setfacl -m u:100010:rwx /tmp/ext4/source/foo"), 0);
+	EXPECT_EQ(system("getfacl /tmp/ext4/source/foo | grep user:100010:rwx"), 0);
+	EXPECT_EQ(system("getfacl /tmp/ext4/dest/foo | grep user:100020:rwx"), 0);
+
+	snprintf(ssb.path, sizeof(ssb.path), "/tmp/ext4/source/foo");
+	ssb.uid = 4294967295;
+	EXPECT_EQ(run_in(attr.userns, getacl_should_be_uid, &ssb), 0);
+
+	snprintf(ssb.path, sizeof(ssb.path), "/tmp/ext4/dest/foo");
+	ssb.uid = 100010;
+	EXPECT_EQ(run_in(attr.userns, getacl_should_be_uid, &ssb), 0);
+
+	/*
+	 * now, dir is owned by someone else in the user namespace, but we can
+	 * still read it because of acls
+	 */
+	ASSERT_EQ(chown("/tmp/ext4/source/foo", 100012, 100012), 0);
+	EXPECT_EQ(run_in(attr.userns, ls_path, "/tmp/ext4/dest/foo"), 0);
+
+	/*
+	 * if we delete the acls, the ls should fail because it's 700.
+	 */
+	ASSERT_EQ(system("setfacl --remove-all /tmp/ext4/source/foo"), 0);
+	EXPECT_NE(run_in(attr.userns, ls_path, "/tmp/ext4/dest/foo"), 0);
+}
+
+TEST_HARNESS_MAIN
-- 
2.29.2

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

