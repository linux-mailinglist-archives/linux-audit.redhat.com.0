Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 45EAD102B71
	for <lists+linux-audit@lfdr.de>; Tue, 19 Nov 2019 19:05:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574186702;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OwChr6XkP9bwm9vAoAPsmMCr9jVvGCduznloDBSz0GE=;
	b=KU3YRHDThFDIDchUWtt3wKoIPgIWw2i67Eqwp8IUx5l/kmYQFgX5vZP9Icy/rW+i3B/2Mx
	zYB3Lam3T3LxYHlhPM64V5zuTSWu2EmaGOkL5JoBdt2uCXhs7dy8BfvhuEuDAo7XDQMMH9
	F708xmVG22R6hU5mAAKCXq7uLhMXCH8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-qUUhm_8xMkSbeNBBuG9oMA-1; Tue, 19 Nov 2019 13:04:27 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D48551883528;
	Tue, 19 Nov 2019 18:04:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD8FA18214;
	Tue, 19 Nov 2019 18:04:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 67FE34E566;
	Tue, 19 Nov 2019 18:04:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAJI4GAY001282 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 19 Nov 2019 13:04:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 817A1178B1; Tue, 19 Nov 2019 18:04:16 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B5351C59A
	for <linux-audit@redhat.com>; Tue, 19 Nov 2019 18:04:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C66A5900AA3
	for <linux-audit@redhat.com>; Tue, 19 Nov 2019 18:04:13 +0000 (UTC)
X-YMail-OSG: ybxQnbUVM1nRFpfxRGUR7r8riSEc3aqDTK7YYs8B0uzfdA_FuhOW2pPZo.o.835
	ni5_Nz8Ly9DpjQxERSCnjhupFLKxV6LEYJWCBOeXpp7GzDMNr4n9cTcaMwzetsi16COo4zvp9_Sq
	M_Ta_ssHCIAnW9VpWyiYo4mzSy9Xu.hYguTd2dpiL3Nq4Rw.SIzt_tNoaUySKmIS5WH6AukTN7_.
	5w_6bgFKA5IwTzKQokFUyLZo7CFW6BK1j5WCSQ5WSleSt673B.o1Aujd8lEWsIGPG6cIToYWVphk
	S7EjNgodEEOq5kGUqdzOQnC__42B7WqZ7MsdHUy9qmKiCnxMAfIMjXVsGvWjAP2ZX.iGc8Oqa8ZM
	Fx5MkYPPXqvW93DnyrLn2wp.LZuqWm6cRos.ngG70q4hnYvaiDLGfx5NqSEvbWitw8fUSbRp6zOP
	LwezOUxqrm9xqNZIHyZFityM9PClV3v99CHnVuJAmVdQBHVaPGdhbpNO7g.R5xyp2BJWdqf6xly2
	FEiby__YmtsU.inkQKbY6Dgp7g1onl0ZaWjlZLnHyF1tv3mn7g6uX3V.O2WR9zTkie2Yqh_0Rupb
	9pxYzURR3kT2Or6Mj81LPVFbhFNaANuOMe2F_DFs3QNoDYTn7r.B9oDp.elf01a1biUgzUXB56Bs
	r4cqDZ8hsGaBh_70mHt5itaS8NcFUUWpLScwUOjnIC4HyulZNfozhjU4U3OeGxxUHtJaVrElLjVz
	lA3mwv5qQlmuWywTbEDraZAASNibmyHeaD73KUwW5KEUoJnLGMZALGf8wzrvRbBe4LdsEPRRrFVc
	_vNfDK0bo7MCQzlSMtSyYVUdXf2nHI40LLR8JHW0OTsxw6UMaurVpW4A0dqkPDhyx0vPT3AhCgje
	Md1ab_RMFrFzjFvmfVVroW6O7tgMJ7ug84Pn7Uyo44zrvoz9QLVBAgqml106uCV2_Be3govwyCE8
	.BpgMAclUyrGKyWi5BeXqoSicus0oMi1wcjRf7BI6yX6RFNfr23v0pBrvdvY4gZXE9fGX_hRsF44
	rEWrjHNtJL3.RuJijbRmLhsv00QgklXfHzqHMDreGr1YHRoCknK1po5Bc0ezeK7D0BHSks8gliN3
	ViVvtNQp3aDihYAEmu58sL5gc5Oz5yTzDD7MGHTiWGF8g5otv5CR5FdsFwLNMo4AKYl9QuTRXJ9u
	uu0lnWJuN6sZfkmEY6hvik2ztwsLU6QBVrZo51qLKfU3tit1XoW6CCljmzrqLachvIq_ePIiML8e
	DNhHPdur5bvCE.DZk6qlGclLDoo.EG1JRn6PzKQo2izFuC1sIfcQzwsmUXjE2_pFjBO1mSY9uZVP
	vVZZJQxokopxRULw9K0AtIE4uo2Y29RoyEm2igkndXj1mfFEk7BURd_FnmDOku0Pr04i3TMc6VNO
	OM_ZW7k77K4yAJpzkezHTHHo9tIsvlbbiwQEaZXyNDAz1W_iK
Received: from sonic306-27.consmr.mail.ne1.yahoo.com
	(sonic306-27.consmr.mail.ne1.yahoo.com [66.163.189.89]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-67-3_VSwrNvOaqQV5qkQ0l2zQ-1;
	Tue, 19 Nov 2019 13:04:11 -0500
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic306.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 19 Nov 2019 18:04:10 +0000
Received: by smtp405.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID cbade386d4ed07348d4fb8056a0439b3; 
	Tue, 19 Nov 2019 18:04:07 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: linux-audit@redhat.com
Subject: [PATCH v11 23/25] NET: Add SO_PEERCONTEXT for multiple LSMs
Date: Tue, 19 Nov 2019 10:03:15 -0800
Message-Id: <20191119180315.12254-12-casey@schaufler-ca.com>
In-Reply-To: <20191119180315.12254-1-casey@schaufler-ca.com>
References: <20191119180315.12254-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-MC-Unique: 3_VSwrNvOaqQV5qkQ0l2zQ-1
X-MC-Unique: qUUhm_8xMkSbeNBBuG9oMA-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAJI4GAY001282
X-loop: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

The getsockopt SO_PEERSEC provides the LSM based security
information for a single module, but for reasons of backward
compatibility cannot include the information for multiple
modules. A new option SO_PEERCONTEXT is added to report the
security "context" of multiple modules using a "compound" format

        lsm1\0value\0lsm2\0value\0

This is expected to be used by system services, including dbus-daemon.
The exact format of a compound context has been the subject of
considerable debate. This format was suggested by Simon McVittie,
a dbus maintainer with a significant stake in the format being
usable.

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
cc: netdev@vger.kernel.org
---
 arch/alpha/include/uapi/asm/socket.h  |   1 +
 arch/mips/include/uapi/asm/socket.h   |   1 +
 arch/parisc/include/uapi/asm/socket.h |   1 +
 arch/sparc/include/uapi/asm/socket.h  |   1 +
 include/linux/lsm_hooks.h             |   9 +-
 include/linux/security.h              |  11 ++-
 include/uapi/asm-generic/socket.h     |   1 +
 kernel/audit.c                        |   4 +-
 net/core/sock.c                       |   7 +-
 net/netlabel/netlabel_unlabeled.c     |   9 +-
 net/netlabel/netlabel_user.c          |   2 +-
 security/apparmor/lsm.c               |  20 ++---
 security/security.c                   | 118 +++++++++++++++++++++++---
 security/selinux/hooks.c              |  20 ++---
 security/smack/smack_lsm.c            |  31 +++----
 15 files changed, 164 insertions(+), 72 deletions(-)

diff --git a/arch/alpha/include/uapi/asm/socket.h b/arch/alpha/include/uapi=
/asm/socket.h
index de6c4df61082..b26fb34e4226 100644
--- a/arch/alpha/include/uapi/asm/socket.h
+++ b/arch/alpha/include/uapi/asm/socket.h
@@ -123,6 +123,7 @@
 #define SO_SNDTIMEO_NEW         67
=20
 #define SO_DETACH_REUSEPORT_BPF 68
+#define SO_PEERCONTEXT          69
=20
 #if !defined(__KERNEL__)
=20
diff --git a/arch/mips/include/uapi/asm/socket.h b/arch/mips/include/uapi/a=
sm/socket.h
index d0a9ed2ca2d6..10e03507b1ed 100644
--- a/arch/mips/include/uapi/asm/socket.h
+++ b/arch/mips/include/uapi/asm/socket.h
@@ -134,6 +134,7 @@
 #define SO_SNDTIMEO_NEW         67
=20
 #define SO_DETACH_REUSEPORT_BPF 68
+#define SO_PEERCONTEXT          69
=20
 #if !defined(__KERNEL__)
=20
diff --git a/arch/parisc/include/uapi/asm/socket.h b/arch/parisc/include/ua=
pi/asm/socket.h
index 10173c32195e..e11df59a84d1 100644
--- a/arch/parisc/include/uapi/asm/socket.h
+++ b/arch/parisc/include/uapi/asm/socket.h
@@ -115,6 +115,7 @@
 #define SO_SNDTIMEO_NEW         0x4041
=20
 #define SO_DETACH_REUSEPORT_BPF 0x4042
+#define SO_PEERCONTEXT          0x4043
=20
 #if !defined(__KERNEL__)
=20
diff --git a/arch/sparc/include/uapi/asm/socket.h b/arch/sparc/include/uapi=
/asm/socket.h
index 8029b681fc7c..5b41ef778040 100644
--- a/arch/sparc/include/uapi/asm/socket.h
+++ b/arch/sparc/include/uapi/asm/socket.h
@@ -116,6 +116,7 @@
 #define SO_SNDTIMEO_NEW          0x0045
=20
 #define SO_DETACH_REUSEPORT_BPF  0x0047
+#define SO_PEERCONTEXT           0x0048
=20
 #if !defined(__KERNEL__)
=20
diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
index b2ec81fcd1e2..6740bc713f12 100644
--- a/include/linux/lsm_hooks.h
+++ b/include/linux/lsm_hooks.h
@@ -880,8 +880,8 @@
  *=09SO_GETPEERSEC.  For tcp sockets this can be meaningful if the
  *=09socket is associated with an ipsec SA.
  *=09@sock is the local socket.
- *=09@optval userspace memory where the security state is to be copied.
- *=09@optlen userspace int where the module should copy the actual length
+ *=09@optval memory where the security state is to be copied.
+ *=09@optlen int where the module should copy the actual length
  *=09of the security state.
  *=09@len as input is the maximum length to copy to userspace provided
  *=09by the caller.
@@ -1724,9 +1724,8 @@ union security_list_options {
 =09int (*socket_setsockopt)(struct socket *sock, int level, int optname);
 =09int (*socket_shutdown)(struct socket *sock, int how);
 =09int (*socket_sock_rcv_skb)(struct sock *sk, struct sk_buff *skb);
-=09int (*socket_getpeersec_stream)(struct socket *sock,
-=09=09=09=09=09char __user *optval,
-=09=09=09=09=09int __user *optlen, unsigned len);
+=09int (*socket_getpeersec_stream)(struct socket *sock, char **optval,
+=09=09=09=09=09int *optlen, unsigned len);
 =09int (*socket_getpeersec_dgram)(struct socket *sock,
 =09=09=09=09=09struct sk_buff *skb, u32 *secid);
 =09int (*sk_alloc_security)(struct sock *sk, int family, gfp_t priority);
diff --git a/include/linux/security.h b/include/linux/security.h
index 79f5177a6b52..55bcb4ed8a21 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -179,7 +179,7 @@ struct lsmblob {
 #define LSMBLOB_NEEDED=09=09-2=09/* Slot requested on initialization */
 #define LSMBLOB_NOT_NEEDED=09-3=09/* Slot not requested */
 #define LSMBLOB_DISPLAY=09=09-4=09/* Use the "display" slot */
-#define LSMBLOB_FIRST=09=09-5=09/* Use the default "display" slot */
+#define LSMBLOB_COMPOUND=09-5=09/* A compound "display" */
=20
 /**
  * lsmblob_init - initialize an lsmblob structure.
@@ -1398,7 +1398,8 @@ int security_socket_setsockopt(struct socket *sock, i=
nt level, int optname);
 int security_socket_shutdown(struct socket *sock, int how);
 int security_sock_rcv_skb(struct sock *sk, struct sk_buff *skb);
 int security_socket_getpeersec_stream(struct socket *sock, char __user *op=
tval,
-=09=09=09=09      int __user *optlen, unsigned len);
+=09=09=09=09      int __user *optlen, unsigned len,
+=09=09=09=09      int display);
 int security_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *=
skb,
 =09=09=09=09     struct lsmblob *blob);
 int security_sk_alloc(struct sock *sk, int family, gfp_t priority);
@@ -1532,8 +1533,10 @@ static inline int security_sock_rcv_skb(struct sock =
*sk,
 =09return 0;
 }
=20
-static inline int security_socket_getpeersec_stream(struct socket *sock, c=
har __user *optval,
-=09=09=09=09=09=09    int __user *optlen, unsigned len)
+static inline int security_socket_getpeersec_stream(struct socket *sock,
+=09=09=09=09=09=09    char __user *optval,
+=09=09=09=09=09=09    int __user *optlen,
+=09=09=09=09=09=09    unsigned len, int display)
 {
 =09return -ENOPROTOOPT;
 }
diff --git a/include/uapi/asm-generic/socket.h b/include/uapi/asm-generic/s=
ocket.h
index 77f7c1638eb1..e3a853d53705 100644
--- a/include/uapi/asm-generic/socket.h
+++ b/include/uapi/asm-generic/socket.h
@@ -118,6 +118,7 @@
 #define SO_SNDTIMEO_NEW         67
=20
 #define SO_DETACH_REUSEPORT_BPF 68
+#define SO_PEERCONTEXT          69
=20
 #if !defined(__KERNEL__)
=20
diff --git a/kernel/audit.c b/kernel/audit.c
index 77e5d54a3e30..f75db95e6a9e 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -1424,7 +1424,7 @@ static int audit_receive_msg(struct sk_buff *skb, str=
uct nlmsghdr *nlh)
 =09=09len =3D 0;
 =09=09if (lsmblob_is_set(&audit_sig_lsm)) {
 =09=09=09err =3D security_secid_to_secctx(&audit_sig_lsm,
-=09=09=09=09=09=09       &context, LSMBLOB_FIRST);
+=09=09=09=09=09=09       &context, 0);
 =09=09=09if (err)
 =09=09=09=09return err;
 =09=09}
@@ -2099,7 +2099,7 @@ int audit_log_task_context(struct audit_buffer *ab)
 =09if (!lsmblob_is_set(&blob))
 =09=09return 0;
=20
-=09error =3D security_secid_to_secctx(&blob, &context, LSMBLOB_FIRST);
+=09error =3D security_secid_to_secctx(&blob, &context, 0);
 =09if (error) {
 =09=09if (error !=3D -EINVAL)
 =09=09=09goto error_path;
diff --git a/net/core/sock.c b/net/core/sock.c
index ac78a570e43a..7a1c41a79b0b 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -1413,7 +1413,12 @@ int sock_getsockopt(struct socket *sock, int level, =
int optname,
 =09=09break;
=20
 =09case SO_PEERSEC:
-=09=09return security_socket_getpeersec_stream(sock, optval, optlen, len);
+=09=09return security_socket_getpeersec_stream(sock, optval, optlen,
+=09=09=09=09=09=09=09 len, LSMBLOB_DISPLAY);
+
+=09case SO_PEERCONTEXT:
+=09=09return security_socket_getpeersec_stream(sock, optval, optlen,
+=09=09=09=09=09=09=09 len, LSMBLOB_COMPOUND);
=20
 =09case SO_MARK:
 =09=09v.val =3D sk->sk_mark;
diff --git a/net/netlabel/netlabel_unlabeled.c b/net/netlabel/netlabel_unla=
beled.c
index 60a7665de0e3..fefd1f2d26f8 100644
--- a/net/netlabel/netlabel_unlabeled.c
+++ b/net/netlabel/netlabel_unlabeled.c
@@ -436,8 +436,7 @@ int netlbl_unlhsh_add(struct net *net,
 unlhsh_add_return:
 =09rcu_read_unlock();
 =09if (audit_buf !=3D NULL) {
-=09=09if (security_secid_to_secctx(lsmblob, &context,
-=09=09=09=09=09     LSMBLOB_FIRST) =3D=3D 0) {
+=09=09if (security_secid_to_secctx(lsmblob, &context, 0) =3D=3D 0) {
 =09=09=09audit_log_format(audit_buf, " sec_obj=3D%s",
 =09=09=09=09=09 context.context);
 =09=09=09security_release_secctx(&context);
@@ -493,7 +492,7 @@ static int netlbl_unlhsh_remove_addr4(struct net *net,
 =09=09=09dev_put(dev);
 =09=09if (entry !=3D NULL &&
 =09=09    security_secid_to_secctx(&entry->lsmblob, &context,
-=09=09=09=09=09     LSMBLOB_FIRST) =3D=3D 0) {
+=09=09=09=09=09     0) =3D=3D 0) {
 =09=09=09audit_log_format(audit_buf, " sec_obj=3D%s",
 =09=09=09=09=09 context.context);
 =09=09=09security_release_secctx(&context);
@@ -554,7 +553,7 @@ static int netlbl_unlhsh_remove_addr6(struct net *net,
 =09=09=09dev_put(dev);
 =09=09if (entry !=3D NULL &&
 =09=09    security_secid_to_secctx(&entry->lsmblob, &context,
-=09=09=09=09=09     LSMBLOB_FIRST) =3D=3D 0) {
+=09=09=09=09=09     0) =3D=3D 0) {
 =09=09=09audit_log_format(audit_buf, " sec_obj=3D%s",
 =09=09=09=09=09 context.context);
 =09=09=09security_release_secctx(&context);
@@ -1125,7 +1124,7 @@ static int netlbl_unlabel_staticlist_gen(u32 cmd,
 =09=09lsmb =3D (struct lsmblob *)&addr6->lsmblob;
 =09}
=20
-=09ret_val =3D security_secid_to_secctx(lsmb, &context, LSMBLOB_FIRST);
+=09ret_val =3D security_secid_to_secctx(lsmb, &context, 0);
 =09if (ret_val !=3D 0)
 =09=09goto list_cb_failure;
 =09ret_val =3D nla_put(cb_arg->skb,
diff --git a/net/netlabel/netlabel_user.c b/net/netlabel/netlabel_user.c
index 1941877fd16f..537c0bf25e3c 100644
--- a/net/netlabel/netlabel_user.c
+++ b/net/netlabel/netlabel_user.c
@@ -100,7 +100,7 @@ struct audit_buffer *netlbl_audit_start_common(int type=
,
=20
 =09lsmblob_init(&blob, audit_info->secid);
 =09if (audit_info->secid !=3D 0 &&
-=09    security_secid_to_secctx(&blob, &context, LSMBLOB_FIRST) =3D=3D 0) =
{
+=09    security_secid_to_secctx(&blob, &context, 0) =3D=3D 0) {
 =09=09audit_log_format(audit_buf, " subj=3D%s", context.context);
 =09=09security_release_secctx(&context);
 =09}
diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index fefccd559541..b4c964fdc2f9 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -1065,10 +1065,8 @@ static struct aa_label *sk_peer_label(struct sock *s=
k)
  *
  * Note: for tcp only valid if using ipsec or cipso on lan
  */
-static int apparmor_socket_getpeersec_stream(struct socket *sock,
-=09=09=09=09=09     char __user *optval,
-=09=09=09=09=09     int __user *optlen,
-=09=09=09=09=09     unsigned int len)
+static int apparmor_socket_getpeersec_stream(struct socket *sock, char **o=
ptval,
+=09=09=09=09=09     int *optlen, unsigned int len)
 {
 =09char *name;
 =09int slen, error =3D 0;
@@ -1088,17 +1086,11 @@ static int apparmor_socket_getpeersec_stream(struct=
 socket *sock,
 =09if (slen < 0) {
 =09=09error =3D -ENOMEM;
 =09} else {
-=09=09if (slen > len) {
+=09=09if (slen > len)
 =09=09=09error =3D -ERANGE;
-=09=09} else if (copy_to_user(optval, name, slen)) {
-=09=09=09error =3D -EFAULT;
-=09=09=09goto out;
-=09=09}
-=09=09if (put_user(slen, optlen))
-=09=09=09error =3D -EFAULT;
-out:
-=09=09kfree(name);
-
+=09=09else
+=09=09=09*optval =3D name;
+=09=09*optlen =3D slen;
 =09}
=20
 done:
diff --git a/security/security.c b/security/security.c
index 0dce15d74cb5..f1fefa187ef8 100644
--- a/security/security.c
+++ b/security/security.c
@@ -723,6 +723,42 @@ static void __init lsm_early_task(struct task_struct *=
task)
 =09=09panic("%s: Early task alloc failed.\n", __func__);
 }
=20
+/**
+ * append_ctx - append a lsm/context pair to a compound context
+ * @ctx: the existing compound context
+ * @ctxlen: size of the old context, including terminating nul byte
+ * @lsm: new lsm name, nul terminated
+ * @new: new context, possibly nul terminated
+ * @newlen: maximum size of @new
+ *
+ * replace @ctx with a new compound context, appending @newlsm and @new
+ * to @ctx. On exit the new data replaces the old, which is freed.
+ * @ctxlen is set to the new size, which includes a trailing nul byte.
+ *
+ * Returns 0 on success, -ENOMEM if no memory is available.
+ */
+static int append_ctx(char **ctx, int *ctxlen, const char *lsm, char *new,
+=09=09      int newlen)
+{
+=09char *final;
+=09int llen;
+
+=09llen =3D strlen(lsm) + 1;
+=09newlen =3D strnlen(new, newlen) + 1;
+
+=09final =3D kzalloc(*ctxlen + llen + newlen, GFP_KERNEL);
+=09if (final =3D=3D NULL)
+=09=09return -ENOMEM;
+=09if (*ctxlen)
+=09=09memcpy(final, *ctx, *ctxlen);
+=09memcpy(final + *ctxlen, lsm, llen);
+=09memcpy(final + *ctxlen + llen, new, newlen);
+=09kfree(*ctx);
+=09*ctx =3D final;
+=09*ctxlen =3D *ctxlen + llen + newlen;
+=09return 0;
+}
+
 /*
  * Hook list operation macros.
  *
@@ -2164,8 +2200,8 @@ int security_setprocattr(const char *lsm, const char =
*name, void *value,
 =09hlist_for_each_entry(hp, &security_hook_heads.setprocattr, list) {
 =09=09if (lsm !=3D NULL && strcmp(lsm, hp->lsmid->lsm))
 =09=09=09continue;
-=09=09if (lsm =3D=3D NULL && *display !=3D LSMBLOB_INVALID &&
-=09=09    *display !=3D hp->lsmid->slot)
+=09=09if (lsm =3D=3D NULL && display !=3D NULL &&
+=09=09    *display !=3D LSMBLOB_INVALID && *display !=3D hp->lsmid->slot)
 =09=09=09continue;
 =09=09return hp->hook.setprocattr(name, value, size);
 =09}
@@ -2196,7 +2232,7 @@ int security_secid_to_secctx(struct lsmblob *blob, st=
ruct lsmcontext *cp,
 =09 */
 =09if (display =3D=3D LSMBLOB_DISPLAY)
 =09=09display =3D lsm_task_display(current);
-=09else if (display =3D=3D LSMBLOB_FIRST)
+=09else if (display =3D=3D 0)
 =09=09display =3D LSMBLOB_INVALID;
 =09else if (display < 0) {
 =09=09WARN_ONCE(true,
@@ -2246,6 +2282,15 @@ void security_release_secctx(struct lsmcontext *cp)
 =09struct security_hook_list *hp;
 =09bool found =3D false;
=20
+=09if (cp->slot =3D=3D LSMBLOB_INVALID)
+=09=09return;
+
+=09if (cp->slot =3D=3D LSMBLOB_COMPOUND) {
+=09=09kfree(cp->context);
+=09=09found =3D true;
+=09=09goto clear_out;
+=09}
+
 =09hlist_for_each_entry(hp, &security_hook_heads.release_secctx, list)
 =09=09if (cp->slot =3D=3D hp->lsmid->slot) {
 =09=09=09hp->hook.release_secctx(cp->context, cp->len);
@@ -2253,6 +2298,7 @@ void security_release_secctx(struct lsmcontext *cp)
 =09=09=09break;
 =09=09}
=20
+clear_out:
 =09memset(cp, 0, sizeof(*cp));
=20
 =09if (!found)
@@ -2389,17 +2435,67 @@ int security_sock_rcv_skb(struct sock *sk, struct s=
k_buff *skb)
 EXPORT_SYMBOL(security_sock_rcv_skb);
=20
 int security_socket_getpeersec_stream(struct socket *sock, char __user *op=
tval,
-=09=09=09=09      int __user *optlen, unsigned len)
+=09=09=09=09      int __user *optlen, unsigned len,
+=09=09=09=09      int display)
 {
-=09int display =3D lsm_task_display(current);
 =09struct security_hook_list *hp;
+=09char *final =3D NULL;
+=09char *cp;
+=09int rc =3D 0;
+=09unsigned finallen =3D 0;
+=09unsigned clen =3D 0;
=20
-=09hlist_for_each_entry(hp, &security_hook_heads.socket_getpeersec_stream,
-=09=09=09     list)
-=09=09if (display =3D=3D LSMBLOB_INVALID || display =3D=3D hp->lsmid->slot=
)
-=09=09=09return hp->hook.socket_getpeersec_stream(sock, optval,
-=09=09=09=09=09=09=09=09 optlen, len);
-=09return -ENOPROTOOPT;
+=09switch (display) {
+=09case LSMBLOB_DISPLAY:
+=09=09rc =3D -ENOPROTOOPT;
+=09=09display =3D lsm_task_display(current);
+=09=09hlist_for_each_entry(hp,
+=09=09=09=09&security_hook_heads.socket_getpeersec_stream,
+=09=09=09=09list)
+=09=09=09if (display =3D=3D LSMBLOB_INVALID ||
+=09=09=09    display =3D=3D hp->lsmid->slot) {
+=09=09=09=09rc =3D hp->hook.socket_getpeersec_stream(sock,
+=09=09=09=09=09=09=09&final, &finallen, len);
+=09=09=09=09break;
+=09=09=09}
+=09=09break;
+=09case LSMBLOB_COMPOUND:
+=09=09/*
+=09=09 * A compound context, in the form [lsm\0value\0]...
+=09=09 */
+=09=09hlist_for_each_entry(hp,
+=09=09=09=09&security_hook_heads.socket_getpeersec_stream,
+=09=09=09=09list) {
+=09=09=09rc =3D hp->hook.socket_getpeersec_stream(sock, &cp, &clen,
+=09=09=09=09=09=09=09       len);
+=09=09=09if (rc =3D=3D -EINVAL || rc =3D=3D -ENOPROTOOPT) {
+=09=09=09=09rc =3D 0;
+=09=09=09=09continue;
+=09=09=09}
+=09=09=09if (rc) {
+=09=09=09=09kfree(final);
+=09=09=09=09return rc;
+=09=09=09}
+=09=09=09rc =3D append_ctx(&final, &finallen, hp->lsmid->lsm,
+=09=09=09=09=09cp, clen);
+=09=09}
+=09=09if (final =3D=3D NULL)
+=09=09=09return -EINVAL;
+=09=09break;
+=09default:
+=09=09return -EINVAL;
+=09}
+
+=09if (finallen > len)
+=09=09rc =3D -ERANGE;
+=09else if (copy_to_user(optval, final, finallen))
+=09=09rc =3D -EFAULT;
+
+=09if (put_user(finallen, optlen))
+=09=09rc =3D -EFAULT;
+
+=09kfree(final);
+=09return rc;
 }
=20
 int security_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *=
skb,
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 16348270b98e..ca7b32631636 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -5048,10 +5048,8 @@ static int selinux_socket_sock_rcv_skb(struct sock *=
sk, struct sk_buff *skb)
 =09return err;
 }
=20
-static int selinux_socket_getpeersec_stream(struct socket *sock,
-=09=09=09=09=09    char __user *optval,
-=09=09=09=09=09    int __user *optlen,
-=09=09=09=09=09    unsigned int len)
+static int selinux_socket_getpeersec_stream(struct socket *sock, char **op=
tval,
+=09=09=09=09=09    int *optlen, unsigned int len)
 {
 =09int err =3D 0;
 =09char *scontext;
@@ -5071,18 +5069,12 @@ static int selinux_socket_getpeersec_stream(struct =
socket *sock,
 =09if (err)
 =09=09return err;
=20
-=09if (scontext_len > len) {
+=09if (scontext_len > len)
 =09=09err =3D -ERANGE;
-=09=09goto out_len;
-=09}
-
-=09if (copy_to_user(optval, scontext, scontext_len))
-=09=09err =3D -EFAULT;
+=09else
+=09=09*optval =3D scontext;
=20
-out_len:
-=09if (put_user(scontext_len, optlen))
-=09=09err =3D -EFAULT;
-=09kfree(scontext);
+=09*optlen =3D scontext_len;
 =09return err;
 }
=20
diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
index e23792dae35c..d6983fb67d31 100644
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@ -3958,28 +3958,29 @@ static int smack_socket_sock_rcv_skb(struct sock *s=
k, struct sk_buff *skb)
  *
  * returns zero on success, an error code otherwise
  */
-static int smack_socket_getpeersec_stream(struct socket *sock,
-=09=09=09=09=09  char __user *optval,
-=09=09=09=09=09  int __user *optlen, unsigned len)
+static int smack_socket_getpeersec_stream(struct socket *sock, char **optv=
al,
+=09=09=09=09=09  int *optlen, unsigned len)
 {
-=09struct socket_smack *ssp;
-=09char *rcp =3D "";
-=09int slen =3D 1;
+=09struct socket_smack *ssp =3D smack_sock(sock->sk);
+=09char *rcp;
+=09int slen;
 =09int rc =3D 0;
=20
-=09ssp =3D smack_sock(sock->sk);
-=09if (ssp->smk_packet !=3D NULL) {
-=09=09rcp =3D ssp->smk_packet->smk_known;
-=09=09slen =3D strlen(rcp) + 1;
+=09if (ssp->smk_packet =3D=3D NULL) {
+=09=09*optlen =3D 0;
+=09=09return -EINVAL;
 =09}
=20
+=09rcp =3D ssp->smk_packet->smk_known;
+=09slen =3D strlen(rcp) + 1;
 =09if (slen > len)
 =09=09rc =3D -ERANGE;
-=09else if (copy_to_user(optval, rcp, slen) !=3D 0)
-=09=09rc =3D -EFAULT;
-
-=09if (put_user(slen, optlen) !=3D 0)
-=09=09rc =3D -EFAULT;
+=09else {
+=09=09*optval =3D kstrdup(rcp, GFP_KERNEL);
+=09=09if (*optval =3D=3D NULL)
+=09=09=09rc =3D -ENOMEM;
+=09}
+=09*optlen =3D slen;
=20
 =09return rc;
 }
--=20
2.20.1


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

