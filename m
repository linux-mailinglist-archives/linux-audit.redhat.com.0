Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id A2DCE102B5C
	for <lists+linux-audit@lfdr.de>; Tue, 19 Nov 2019 19:04:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574186648;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SpCz3iS/hwVlC5QZKYbDRZU2C3NS0o0h2E7y8pw6RFg=;
	b=GNplYn0XWbFaUZ2jGiDLGKqbk5kzyEzZsOeo29Uha/UH7V4miuu7WrTkQY/cyRbYM085x6
	Jcy4aRCR2NNOPfOc0ZghCwpoTnweh+Lu2GWQJM+7aNC4aMsTf78BK3gT/Diu7WQxExiQWt
	eyy1NRT3UeaW0Z7O9O9bR7jPhB3BUao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-z300ZMIwPOaKjHsXUkR0WA-1; Tue, 19 Nov 2019 13:04:06 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01278801FD2;
	Tue, 19 Nov 2019 18:04:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BFB345E269;
	Tue, 19 Nov 2019 18:03:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 807434BB65;
	Tue, 19 Nov 2019 18:03:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAJI3tQU001113 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 19 Nov 2019 13:03:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7C33A201803C; Tue, 19 Nov 2019 18:03:55 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7724B2064003
	for <linux-audit@redhat.com>; Tue, 19 Nov 2019 18:03:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C812900A99
	for <linux-audit@redhat.com>; Tue, 19 Nov 2019 18:03:53 +0000 (UTC)
X-YMail-OSG: .zaZnzIVM1m7OWgs5q.207PO0Q6T9.HpFHguowB5T74B_NAP20jR9UYmILf24.f
	3tzHzZBSCAUDleiTQmJrEGSTw5D4U4M9JmpvvT_v8OggnmoPw3XPTuIL60UMrvd8IWb1b.ZWOQoK
	BtwAtQg3Mta2P1xlXysoJwo5VzoshDWfgDTV3lsT_FLLL4sMp5hDiyRfiH9YIUB0Qk8WfnM3ILo_
	UiggUakn7M.FxxwT3eZLBRwyF0QkArDPUmgd5NvhWRYKyKxX4kiT4vyTbkSXxrJbjEE7u4XavBa9
	4MIcVqR2Dtg957ldfhuSRVsUt7qFPBsziH_sBiNM988cX1LycgFIxWr6GnRbNH0X5S2MHcp8PT9b
	ym9SGZqEIp4I1ECEF5l_daGG0EARi.KSMGKDMB0rrLff1Ew0C6fD3PrgtNPfp7zYFKnJwA6GpuKM
	7vq7UZ2oNLn5MkcPv0UtQ35E8mkRsAYj5jrgKV62Nv2Udt9TpcSPIBQdsmna36TkadCab9LUx6Ex
	09ftuZMcq_djX6BFWgPLv16h6MihyWRuq1LH32j.91IUURBx0x4le_RSBDsCHKigqro_Fv0xHTiM
	gEaNIqfGGybtmVN5eeXntt4aCPihu7aYTGqyJD0kEKTHPIVTaJdX4_b7L3Cx8fqRPjzn4_KAhw7f
	NBKU6Vh5FDsLdTfilnnmxHWw4fo.9lWeIFPxW6m7shFf9RaxUo1_meAmJOwOvk7QnxPhADokIef2
	Icq8A1NYwzBVr8VRESnK5QrJHzCSHSGb9gwlQGk.mlhaJ0ZCD7ocozw8rtMO8SG3zj9jXeiQsMqu
	0fr9OtApBKBF44k8UHutI5IGtaPaD9YCZeHpd2hXmqPFi6hoZJBwaQ44Cpupo3wLHFQ1ylFWOf9y
	YkctHQWOUxHIp55dOfrmhLXn61UP8_zE249qeqbYYxZsbFSGg_U.PwzTURPBFg7NPKnwzzr0AvTk
	qjE7ByYoS2IvFVCQIviTT_rH435yDRGIRp0PtTBvZaJRyz8RcZBg8wZmoH1uNfmpvvEUTcUL01vn
	FZAr9fSmZMzAipyCmsxbL3ZoWpaYiMgRk0AoG97EgoQL95JBbk4EV_506w7sVYCoWYafveWfBSDy
	2y17K.ML0VTFfDetPwilfiIz7dj1vz3qmYS7ulqCsP8fc6uJkFR0dVLleSMCDptxKAqAKkFtqosb
	MJAo92n_n5N.amUmNGgF5y5ZNylv5GhphpvJyRU.BOrBkWxx43Yb66Amvzg2wr4ftzX8KsOSrcPx
	aywU7ybjo.7nhi1eNXfZzRsVz.vxTIVCXYFfiyDsqD2c5quKL4f5CBU0lQiDo.EoaIanbGkxwfvj
	Slmtj9jtreAVR9up4m7kYWWtSl2ZySmoQ__aynns7jDPrV8B_Yb8uURaf8Frarvxpqn6wmTBDQEa
	_S94KnqoysHaPcGh.OtkM5N4t2sPfj4IiYuM3KzKNb9KTePc-
Received: from sonic313-15.consmr.mail.ne1.yahoo.com
	(sonic313-15.consmr.mail.ne1.yahoo.com [66.163.185.38]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-394-Vpb5ktdXMfqgQPjdiy3x5w-1;
	Tue, 19 Nov 2019 13:03:51 -0500
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic313.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 19 Nov 2019 18:03:50 +0000
Received: by smtp402.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 151488e03b2a663d69020bb4fc329e8c; 
	Tue, 19 Nov 2019 18:03:48 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: linux-audit@redhat.com
Subject: [PATCH v11 14/25] LSM: Ensure the correct LSM context releaser
Date: Tue, 19 Nov 2019 10:03:11 -0800
Message-Id: <20191119180315.12254-8-casey@schaufler-ca.com>
In-Reply-To: <20191119180315.12254-1-casey@schaufler-ca.com>
References: <20191119180315.12254-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-MC-Unique: Vpb5ktdXMfqgQPjdiy3x5w-1
X-MC-Unique: z300ZMIwPOaKjHsXUkR0WA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAJI3tQU001113
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Add a new lsmcontext data structure to hold all the information
about a "security context", including the string, its size and
which LSM allocated the string. The allocation information is
necessary because LSMs have different policies regarding the
lifecycle of these strings. SELinux allocates and destroys
them on each use, whereas Smack provides a pointer to an entry
in a list that never goes away.

Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: John Johansen <john.johansen@canonical.com>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
cc: linux-integrity@vger.kernel.org
cc: netdev@vger.kernel.org
---
 drivers/android/binder.c                | 10 +++++--
 fs/ceph/xattr.c                         |  6 +++-
 fs/nfs/nfs4proc.c                       |  8 +++--
 fs/nfsd/nfs4xdr.c                       |  7 +++--
 include/linux/security.h                | 39 +++++++++++++++++++++++--
 include/net/scm.h                       |  5 +++-
 kernel/audit.c                          | 14 ++++++---
 kernel/auditsc.c                        | 12 ++++++--
 net/ipv4/ip_sockglue.c                  |  4 ++-
 net/netfilter/nf_conntrack_netlink.c    |  4 ++-
 net/netfilter/nf_conntrack_standalone.c |  4 ++-
 net/netfilter/nfnetlink_queue.c         | 13 ++++++---
 net/netlabel/netlabel_unlabeled.c       | 19 +++++++++---
 net/netlabel/netlabel_user.c            |  4 ++-
 security/security.c                     | 18 ++++++++----
 security/smack/smack_lsm.c              | 14 ++++++---
 16 files changed, 141 insertions(+), 40 deletions(-)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 3a7fcdc8dbe2..49b84b6fafd9 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -2865,6 +2865,7 @@ static void binder_transaction(struct binder_proc *pr=
oc,
 =09int t_debug_id =3D atomic_inc_return(&binder_last_id);
 =09char *secctx =3D NULL;
 =09u32 secctx_sz =3D 0;
+=09struct lsmcontext scaff; /* scaffolding */
=20
 =09e =3D binder_transaction_log_add(&binder_transaction_log);
 =09e->debug_id =3D t_debug_id;
@@ -3161,7 +3162,8 @@ static void binder_transaction(struct binder_proc *pr=
oc,
 =09=09=09t->security_ctx =3D 0;
 =09=09=09WARN_ON(1);
 =09=09}
-=09=09security_release_secctx(secctx, secctx_sz);
+=09=09lsmcontext_init(&scaff, secctx, secctx_sz, 0);
+=09=09security_release_secctx(&scaff);
 =09=09secctx =3D NULL;
 =09}
 =09t->buffer->debug_id =3D t->debug_id;
@@ -3494,8 +3496,10 @@ static void binder_transaction(struct binder_proc *p=
roc,
 =09binder_alloc_free_buf(&target_proc->alloc, t->buffer);
 err_binder_alloc_buf_failed:
 err_bad_extra_size:
-=09if (secctx)
-=09=09security_release_secctx(secctx, secctx_sz);
+=09if (secctx) {
+=09=09lsmcontext_init(&scaff, secctx, secctx_sz, 0);
+=09=09security_release_secctx(&scaff);
+=09}
 err_get_secctx_failed:
 =09kfree(tcomplete);
 =09binder_stats_deleted(BINDER_STAT_TRANSACTION_COMPLETE);
diff --git a/fs/ceph/xattr.c b/fs/ceph/xattr.c
index cb18ee637cb7..ad501b5cad2c 100644
--- a/fs/ceph/xattr.c
+++ b/fs/ceph/xattr.c
@@ -1271,12 +1271,16 @@ int ceph_security_init_secctx(struct dentry *dentry=
, umode_t mode,
=20
 void ceph_release_acl_sec_ctx(struct ceph_acl_sec_ctx *as_ctx)
 {
+#ifdef CONFIG_CEPH_FS_SECURITY_LABEL
+=09struct lsmcontext scaff; /* scaffolding */
+#endif
 #ifdef CONFIG_CEPH_FS_POSIX_ACL
 =09posix_acl_release(as_ctx->acl);
 =09posix_acl_release(as_ctx->default_acl);
 #endif
 #ifdef CONFIG_CEPH_FS_SECURITY_LABEL
-=09security_release_secctx(as_ctx->sec_ctx, as_ctx->sec_ctxlen);
+=09lsmcontext_init(&scaff, as_ctx->sec_ctx, as_ctx->sec_ctxlen, 0);
+=09security_release_secctx(&scaff);
 #endif
 =09if (as_ctx->pagelist)
 =09=09ceph_pagelist_release(as_ctx->pagelist);
diff --git a/fs/nfs/nfs4proc.c b/fs/nfs/nfs4proc.c
index caacf5e7f5e1..74e9f4b7cc07 100644
--- a/fs/nfs/nfs4proc.c
+++ b/fs/nfs/nfs4proc.c
@@ -131,8 +131,12 @@ nfs4_label_init_security(struct inode *dir, struct den=
try *dentry,
 static inline void
 nfs4_label_release_security(struct nfs4_label *label)
 {
-=09if (label)
-=09=09security_release_secctx(label->label, label->len);
+=09struct lsmcontext scaff; /* scaffolding */
+
+=09if (label) {
+=09=09lsmcontext_init(&scaff, label->label, label->len, 0);
+=09=09security_release_secctx(&scaff);
+=09}
 }
 static inline u32 *nfs4_bitmask(struct nfs_server *server, struct nfs4_lab=
el *label)
 {
diff --git a/fs/nfsd/nfs4xdr.c b/fs/nfsd/nfs4xdr.c
index 533d0fc3c96b..b17aad082bde 100644
--- a/fs/nfsd/nfs4xdr.c
+++ b/fs/nfsd/nfs4xdr.c
@@ -2421,6 +2421,7 @@ nfsd4_encode_fattr(struct xdr_stream *xdr, struct svc=
_fh *fhp,
 =09int err;
 =09struct nfs4_acl *acl =3D NULL;
 #ifdef CONFIG_NFSD_V4_SECURITY_LABEL
+=09struct lsmcontext scaff; /* scaffolding */
 =09void *context =3D NULL;
 =09int contextlen;
 #endif
@@ -2923,8 +2924,10 @@ nfsd4_encode_fattr(struct xdr_stream *xdr, struct sv=
c_fh *fhp,
=20
 out:
 #ifdef CONFIG_NFSD_V4_SECURITY_LABEL
-=09if (context)
-=09=09security_release_secctx(context, contextlen);
+=09if (context) {
+=09=09lsmcontext_init(&scaff, context, contextlen, 0); /*scaffolding*/
+=09=09security_release_secctx(&scaff);
+=09}
 #endif /* CONFIG_NFSD_V4_SECURITY_LABEL */
 =09kfree(acl);
 =09if (tempfh) {
diff --git a/include/linux/security.h b/include/linux/security.h
index f7bc7aef95cb..9bb11d9f1348 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -126,6 +126,41 @@ enum lockdown_reason {
 =09LOCKDOWN_CONFIDENTIALITY_MAX,
 };
=20
+/*
+ * A "security context" is the text representation of
+ * the information used by LSMs.
+ * This structure contains the string, its length, and which LSM
+ * it is useful for.
+ */
+struct lsmcontext {
+=09char=09*context;=09/* Provided by the module */
+=09u32=09len;
+=09int=09slot;=09=09/* Identifies the module */
+};
+
+/**
+ * lsmcontext_init - initialize an lsmcontext structure.
+ * @cp: Pointer to the context to initialize
+ * @context: Initial context, or NULL
+ * @size: Size of context, or 0
+ * @slot: Which LSM provided the context
+ *
+ * Fill in the lsmcontext from the provided information.
+ * This is a scaffolding function that will be removed when
+ * lsmcontext integration is complete.
+ */
+static inline void lsmcontext_init(struct lsmcontext *cp, char *context,
+=09=09=09=09   u32 size, int slot)
+{
+=09cp->slot =3D slot;
+=09cp->context =3D context;
+
+=09if (context =3D=3D NULL || size =3D=3D 0)
+=09=09cp->len =3D 0;
+=09else
+=09=09cp->len =3D strlen(context);
+}
+
 /*
  * Data exported by the security modules
  *
@@ -496,7 +531,7 @@ int security_ismaclabel(const char *name);
 int security_secid_to_secctx(struct lsmblob *blob, char **secdata, u32 *se=
clen);
 int security_secctx_to_secid(const char *secdata, u32 seclen,
 =09=09=09     struct lsmblob *blob);
-void security_release_secctx(char *secdata, u32 seclen);
+void security_release_secctx(struct lsmcontext *cp);
 void security_inode_invalidate_secctx(struct inode *inode);
 int security_inode_notifysecctx(struct inode *inode, void *ctx, u32 ctxlen=
);
 int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32 ctxlen)=
;
@@ -1310,7 +1345,7 @@ static inline int security_secctx_to_secid(const char=
 *secdata,
 =09return -EOPNOTSUPP;
 }
=20
-static inline void security_release_secctx(char *secdata, u32 seclen)
+static inline void security_release_secctx(struct lsmcontext *cp)
 {
 }
=20
diff --git a/include/net/scm.h b/include/net/scm.h
index 31ae605fcc0a..30ba801c91bd 100644
--- a/include/net/scm.h
+++ b/include/net/scm.h
@@ -92,6 +92,7 @@ static __inline__ int scm_send(struct socket *sock, struc=
t msghdr *msg,
 #ifdef CONFIG_SECURITY_NETWORK
 static inline void scm_passec(struct socket *sock, struct msghdr *msg, str=
uct scm_cookie *scm)
 {
+=09struct lsmcontext context;
 =09char *secdata;
 =09u32 seclen;
 =09int err;
@@ -102,7 +103,9 @@ static inline void scm_passec(struct socket *sock, stru=
ct msghdr *msg, struct sc
=20
 =09=09if (!err) {
 =09=09=09put_cmsg(msg, SOL_SOCKET, SCM_SECURITY, seclen, secdata);
-=09=09=09security_release_secctx(secdata, seclen);
+=09=09=09/*scaffolding*/
+=09=09=09lsmcontext_init(&context, secdata, seclen, 0);
+=09=09=09security_release_secctx(&context);
 =09=09}
 =09}
 }
diff --git a/kernel/audit.c b/kernel/audit.c
index ba9f78e36d1e..35970e7191b6 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -1180,6 +1180,7 @@ static int audit_receive_msg(struct sk_buff *skb, str=
uct nlmsghdr *nlh)
 =09struct audit_sig_info   *sig_data;
 =09char=09=09=09*ctx =3D NULL;
 =09u32=09=09=09len;
+=09struct lsmcontext=09scaff; /* scaffolding */
=20
 =09err =3D audit_netlink_ok(skb, msg_type);
 =09if (err)
@@ -1424,15 +1425,18 @@ static int audit_receive_msg(struct sk_buff *skb, s=
truct nlmsghdr *nlh)
 =09=09}
 =09=09sig_data =3D kmalloc(sizeof(*sig_data) + len, GFP_KERNEL);
 =09=09if (!sig_data) {
-=09=09=09if (lsmblob_is_set(&audit_sig_lsm))
-=09=09=09=09security_release_secctx(ctx, len);
+=09=09=09if (lsmblob_is_set(&audit_sig_lsm)) {
+=09=09=09=09lsmcontext_init(&scaff, ctx, len, 0);
+=09=09=09=09security_release_secctx(&scaff);
+=09=09=09}
 =09=09=09return -ENOMEM;
 =09=09}
 =09=09sig_data->uid =3D from_kuid(&init_user_ns, audit_sig_uid);
 =09=09sig_data->pid =3D audit_sig_pid;
 =09=09if (lsmblob_is_set(&audit_sig_lsm)) {
 =09=09=09memcpy(sig_data->ctx, ctx, len);
-=09=09=09security_release_secctx(ctx, len);
+=09=09=09lsmcontext_init(&scaff, ctx, len, 0);
+=09=09=09security_release_secctx(&scaff);
 =09=09}
 =09=09audit_send_reply(skb, seq, AUDIT_SIGNAL_INFO, 0, 0,
 =09=09=09=09 sig_data, sizeof(*sig_data) + len);
@@ -2061,6 +2065,7 @@ int audit_log_task_context(struct audit_buffer *ab)
 =09unsigned len;
 =09int error;
 =09struct lsmblob blob;
+=09struct lsmcontext scaff; /* scaffolding */
=20
 =09security_task_getsecid(current, &blob);
 =09if (!lsmblob_is_set(&blob))
@@ -2074,7 +2079,8 @@ int audit_log_task_context(struct audit_buffer *ab)
 =09}
=20
 =09audit_log_format(ab, " subj=3D%s", ctx);
-=09security_release_secctx(ctx, len);
+=09lsmcontext_init(&scaff, ctx, len, 0);
+=09security_release_secctx(&scaff);
 =09return 0;
=20
 error_path:
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index c1e3ac8eb1ad..8790e7aafa7d 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -962,6 +962,7 @@ static int audit_log_pid_context(struct audit_context *=
context, pid_t pid,
 =09=09=09=09 struct lsmblob *blob, char *comm)
 {
 =09struct audit_buffer *ab;
+=09struct lsmcontext lsmcxt;
 =09char *ctx =3D NULL;
 =09u32 len;
 =09int rc =3D 0;
@@ -979,7 +980,8 @@ static int audit_log_pid_context(struct audit_context *=
context, pid_t pid,
 =09=09=09rc =3D 1;
 =09=09} else {
 =09=09=09audit_log_format(ab, " obj=3D%s", ctx);
-=09=09=09security_release_secctx(ctx, len);
+=09=09=09lsmcontext_init(&lsmcxt, ctx, len, 0); /*scaffolding*/
+=09=09=09security_release_secctx(&lsmcxt);
 =09=09}
 =09}
 =09audit_log_format(ab, " ocomm=3D");
@@ -1192,6 +1194,7 @@ static void audit_log_fcaps(struct audit_buffer *ab, =
struct audit_names *name)
=20
 static void show_special(struct audit_context *context, int *call_panic)
 {
+=09struct lsmcontext lsmcxt;
 =09struct audit_buffer *ab;
 =09int i;
=20
@@ -1225,7 +1228,8 @@ static void show_special(struct audit_context *contex=
t, int *call_panic)
 =09=09=09=09*call_panic =3D 1;
 =09=09=09} else {
 =09=09=09=09audit_log_format(ab, " obj=3D%s", ctx);
-=09=09=09=09security_release_secctx(ctx, len);
+=09=09=09=09lsmcontext_init(&lsmcxt, ctx, len, 0);
+=09=09=09=09security_release_secctx(&lsmcxt);
 =09=09=09}
 =09=09}
 =09=09if (context->ipc.has_perm) {
@@ -1371,6 +1375,7 @@ static void audit_log_name(struct audit_context *cont=
ext, struct audit_names *n,
 =09=09char *ctx =3D NULL;
 =09=09u32 len;
 =09=09struct lsmblob blob;
+=09=09struct lsmcontext lsmcxt;
=20
 =09=09lsmblob_init(&blob, n->osid);
 =09=09if (security_secid_to_secctx(&blob, &ctx, &len)) {
@@ -1379,7 +1384,8 @@ static void audit_log_name(struct audit_context *cont=
ext, struct audit_names *n,
 =09=09=09=09*call_panic =3D 2;
 =09=09} else {
 =09=09=09audit_log_format(ab, " obj=3D%s", ctx);
-=09=09=09security_release_secctx(ctx, len);
+=09=09=09lsmcontext_init(&lsmcxt, ctx, len, 0); /* scaffolding */
+=09=09=09security_release_secctx(&lsmcxt);
 =09=09}
 =09}
=20
diff --git a/net/ipv4/ip_sockglue.c b/net/ipv4/ip_sockglue.c
index 1ca97d0cb4a9..96d56a30ecca 100644
--- a/net/ipv4/ip_sockglue.c
+++ b/net/ipv4/ip_sockglue.c
@@ -130,6 +130,7 @@ static void ip_cmsg_recv_checksum(struct msghdr *msg, s=
truct sk_buff *skb,
=20
 static void ip_cmsg_recv_security(struct msghdr *msg, struct sk_buff *skb)
 {
+=09struct lsmcontext context;
 =09struct lsmblob lb;
 =09char *secdata;
 =09u32 seclen;
@@ -144,7 +145,8 @@ static void ip_cmsg_recv_security(struct msghdr *msg, s=
truct sk_buff *skb)
 =09=09return;
=20
 =09put_cmsg(msg, SOL_IP, SCM_SECURITY, seclen, secdata);
-=09security_release_secctx(secdata, seclen);
+=09lsmcontext_init(&context, secdata, seclen, 0); /* scaffolding */
+=09security_release_secctx(&context);
 }
=20
 static void ip_cmsg_recv_dstaddr(struct msghdr *msg, struct sk_buff *skb)
diff --git a/net/netfilter/nf_conntrack_netlink.c b/net/netfilter/nf_conntr=
ack_netlink.c
index 0412f6744185..78791e015d8b 100644
--- a/net/netfilter/nf_conntrack_netlink.c
+++ b/net/netfilter/nf_conntrack_netlink.c
@@ -332,6 +332,7 @@ static int ctnetlink_dump_secctx(struct sk_buff *skb, c=
onst struct nf_conn *ct)
 =09int len, ret;
 =09char *secctx;
 =09struct lsmblob blob;
+=09struct lsmcontext context;
=20
 =09lsmblob_init(&blob, ct->secmark);
 =09ret =3D security_secid_to_secctx(&blob, &secctx, &len);
@@ -349,7 +350,8 @@ static int ctnetlink_dump_secctx(struct sk_buff *skb, c=
onst struct nf_conn *ct)
=20
 =09ret =3D 0;
 nla_put_failure:
-=09security_release_secctx(secctx, len);
+=09lsmcontext_init(&context, secctx, len, 0); /* scaffolding */
+=09security_release_secctx(&context);
 =09return ret;
 }
 #else
diff --git a/net/netfilter/nf_conntrack_standalone.c b/net/netfilter/nf_con=
ntrack_standalone.c
index 183a85412155..8601fcb99f7a 100644
--- a/net/netfilter/nf_conntrack_standalone.c
+++ b/net/netfilter/nf_conntrack_standalone.c
@@ -176,6 +176,7 @@ static void ct_show_secctx(struct seq_file *s, const st=
ruct nf_conn *ct)
 =09u32 len;
 =09char *secctx;
 =09struct lsmblob blob;
+=09struct lsmcontext context;
=20
 =09lsmblob_init(&blob, ct->secmark);
 =09ret =3D security_secid_to_secctx(&blob, &secctx, &len);
@@ -184,7 +185,8 @@ static void ct_show_secctx(struct seq_file *s, const st=
ruct nf_conn *ct)
=20
 =09seq_printf(s, "secctx=3D%s ", secctx);
=20
-=09security_release_secctx(secctx, len);
+=09lsmcontext_init(&context, secctx, len, 0); /* scaffolding */
+=09security_release_secctx(&context);
 }
 #else
 static inline void ct_show_secctx(struct seq_file *s, const struct nf_conn=
 *ct)
diff --git a/net/netfilter/nfnetlink_queue.c b/net/netfilter/nfnetlink_queu=
e.c
index bfa7f12fde99..cc3ef03ee198 100644
--- a/net/netfilter/nfnetlink_queue.c
+++ b/net/netfilter/nfnetlink_queue.c
@@ -395,6 +395,7 @@ nfqnl_build_packet_message(struct net *net, struct nfqn=
l_instance *queue,
 =09enum ip_conntrack_info uninitialized_var(ctinfo);
 =09struct nfnl_ct_hook *nfnl_ct;
 =09bool csum_verify;
+=09struct lsmcontext scaff; /* scaffolding */
 =09char *secdata =3D NULL;
 =09u32 seclen =3D 0;
=20
@@ -625,8 +626,10 @@ nfqnl_build_packet_message(struct net *net, struct nfq=
nl_instance *queue,
 =09}
=20
 =09nlh->nlmsg_len =3D skb->len;
-=09if (seclen)
-=09=09security_release_secctx(secdata, seclen);
+=09if (seclen) {
+=09=09lsmcontext_init(&scaff, secdata, seclen, 0);
+=09=09security_release_secctx(&scaff);
+=09}
 =09return skb;
=20
 nla_put_failure:
@@ -634,8 +637,10 @@ nfqnl_build_packet_message(struct net *net, struct nfq=
nl_instance *queue,
 =09kfree_skb(skb);
 =09net_err_ratelimited("nf_queue: error creating packet message\n");
 nlmsg_failure:
-=09if (seclen)
-=09=09security_release_secctx(secdata, seclen);
+=09if (seclen) {
+=09=09lsmcontext_init(&scaff, secdata, seclen, 0);
+=09=09security_release_secctx(&scaff);
+=09}
 =09return NULL;
 }
=20
diff --git a/net/netlabel/netlabel_unlabeled.c b/net/netlabel/netlabel_unla=
beled.c
index e279b81d9545..288c005b44c7 100644
--- a/net/netlabel/netlabel_unlabeled.c
+++ b/net/netlabel/netlabel_unlabeled.c
@@ -373,6 +373,7 @@ int netlbl_unlhsh_add(struct net *net,
 =09struct net_device *dev;
 =09struct netlbl_unlhsh_iface *iface;
 =09struct audit_buffer *audit_buf =3D NULL;
+=09struct lsmcontext context;
 =09char *secctx =3D NULL;
 =09u32 secctx_len;
 =09struct lsmblob blob;
@@ -443,7 +444,9 @@ int netlbl_unlhsh_add(struct net *net,
 =09=09=09=09=09     &secctx,
 =09=09=09=09=09     &secctx_len) =3D=3D 0) {
 =09=09=09audit_log_format(audit_buf, " sec_obj=3D%s", secctx);
-=09=09=09security_release_secctx(secctx, secctx_len);
+=09=09=09/* scaffolding */
+=09=09=09lsmcontext_init(&context, secctx, secctx_len, 0);
+=09=09=09security_release_secctx(&context);
 =09=09}
 =09=09audit_log_format(audit_buf, " res=3D%u", ret_val =3D=3D 0 ? 1 : 0);
 =09=09audit_log_end(audit_buf);
@@ -474,6 +477,7 @@ static int netlbl_unlhsh_remove_addr4(struct net *net,
 =09struct netlbl_unlhsh_addr4 *entry;
 =09struct audit_buffer *audit_buf;
 =09struct net_device *dev;
+=09struct lsmcontext context;
 =09char *secctx;
 =09u32 secctx_len;
 =09struct lsmblob blob;
@@ -502,7 +506,9 @@ static int netlbl_unlhsh_remove_addr4(struct net *net,
 =09=09    security_secid_to_secctx(&blob,
 =09=09=09=09=09     &secctx, &secctx_len) =3D=3D 0) {
 =09=09=09audit_log_format(audit_buf, " sec_obj=3D%s", secctx);
-=09=09=09security_release_secctx(secctx, secctx_len);
+=09=09=09/* scaffolding */
+=09=09=09lsmcontext_init(&context, secctx, secctx_len, 0);
+=09=09=09security_release_secctx(&context);
 =09=09}
 =09=09audit_log_format(audit_buf, " res=3D%u", entry !=3D NULL ? 1 : 0);
 =09=09audit_log_end(audit_buf);
@@ -539,6 +545,7 @@ static int netlbl_unlhsh_remove_addr6(struct net *net,
 =09struct netlbl_unlhsh_addr6 *entry;
 =09struct audit_buffer *audit_buf;
 =09struct net_device *dev;
+=09struct lsmcontext context;
 =09char *secctx;
 =09u32 secctx_len;
 =09struct lsmblob blob;
@@ -566,7 +573,8 @@ static int netlbl_unlhsh_remove_addr6(struct net *net,
 =09=09    security_secid_to_secctx(&blob,
 =09=09=09=09=09     &secctx, &secctx_len) =3D=3D 0) {
 =09=09=09audit_log_format(audit_buf, " sec_obj=3D%s", secctx);
-=09=09=09security_release_secctx(secctx, secctx_len);
+=09=09=09lsmcontext_init(&context, secctx, secctx_len, 0);
+=09=09=09security_release_secctx(&context);
 =09=09}
 =09=09audit_log_format(audit_buf, " res=3D%u", entry !=3D NULL ? 1 : 0);
 =09=09audit_log_end(audit_buf);
@@ -1080,6 +1088,7 @@ static int netlbl_unlabel_staticlist_gen(u32 cmd,
 =09int ret_val =3D -ENOMEM;
 =09struct netlbl_unlhsh_walk_arg *cb_arg =3D arg;
 =09struct net_device *dev;
+=09struct lsmcontext context;
 =09void *data;
 =09u32 secid;
 =09char *secctx;
@@ -1147,7 +1156,9 @@ static int netlbl_unlabel_staticlist_gen(u32 cmd,
 =09=09=09  NLBL_UNLABEL_A_SECCTX,
 =09=09=09  secctx_len,
 =09=09=09  secctx);
-=09security_release_secctx(secctx, secctx_len);
+=09/* scaffolding */
+=09lsmcontext_init(&context, secctx, secctx_len, 0);
+=09security_release_secctx(&context);
 =09if (ret_val !=3D 0)
 =09=09goto list_cb_failure;
=20
diff --git a/net/netlabel/netlabel_user.c b/net/netlabel/netlabel_user.c
index 893301ae0131..ef139d8ae7cd 100644
--- a/net/netlabel/netlabel_user.c
+++ b/net/netlabel/netlabel_user.c
@@ -84,6 +84,7 @@ struct audit_buffer *netlbl_audit_start_common(int type,
 =09=09=09=09=09       struct netlbl_audit *audit_info)
 {
 =09struct audit_buffer *audit_buf;
+=09struct lsmcontext context;
 =09char *secctx;
 =09u32 secctx_len;
 =09struct lsmblob blob;
@@ -103,7 +104,8 @@ struct audit_buffer *netlbl_audit_start_common(int type=
,
 =09if (audit_info->secid !=3D 0 &&
 =09    security_secid_to_secctx(&blob, &secctx, &secctx_len) =3D=3D 0) {
 =09=09audit_log_format(audit_buf, " subj=3D%s", secctx);
-=09=09security_release_secctx(secctx, secctx_len);
+=09=09lsmcontext_init(&context, secctx, secctx_len, 0);/*scaffolding*/
+=09=09security_release_secctx(&context);
 =09}
=20
 =09return audit_buf;
diff --git a/security/security.c b/security/security.c
index c2874f6587d2..c05ef9d0c8ed 100644
--- a/security/security.c
+++ b/security/security.c
@@ -2144,17 +2144,23 @@ int security_secctx_to_secid(const char *secdata, u=
32 seclen,
 }
 EXPORT_SYMBOL(security_secctx_to_secid);
=20
-void security_release_secctx(char *secdata, u32 seclen)
+void security_release_secctx(struct lsmcontext *cp)
 {
 =09struct security_hook_list *hp;
-=09int *display =3D current->security;
+=09bool found =3D false;
=20
 =09hlist_for_each_entry(hp, &security_hook_heads.release_secctx, list)
-=09=09if (display =3D=3D NULL || *display =3D=3D LSMBLOB_INVALID ||
-=09=09    *display =3D=3D hp->lsmid->slot) {
-=09=09=09hp->hook.release_secctx(secdata, seclen);
-=09=09=09return;
+=09=09if (cp->slot =3D=3D hp->lsmid->slot) {
+=09=09=09hp->hook.release_secctx(cp->context, cp->len);
+=09=09=09found =3D true;
+=09=09=09break;
 =09=09}
+
+=09memset(cp, 0, sizeof(*cp));
+
+=09if (!found)
+=09=09pr_warn("%s context \"%s\" from slot %d not released\n",
+=09=09=09__func__, cp->context, cp->slot);
 }
 EXPORT_SYMBOL(security_release_secctx);
=20
diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
index aac8cb0de733..4e464e5e942e 100644
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@ -4483,11 +4483,16 @@ static int smack_secctx_to_secid(const char *secdat=
a, u32 seclen, u32 *secid)
 =09return 0;
 }
=20
-/*
- * There used to be a smack_release_secctx hook
- * that did nothing back when hooks were in a vector.
- * Now that there's a list such a hook adds cost.
+/**
+ * smack_release_secctx - do everything necessary to free a context
+ * @secdata: Unused
+ * @seclen: Unused
+ *
+ * Do nothing but hold a slot in the hooks list.
  */
+static void smack_release_secctx(char *secdata, u32 seclen)
+{
+}
=20
 static int smack_inode_notifysecctx(struct inode *inode, void *ctx, u32 ct=
xlen)
 {
@@ -4730,6 +4735,7 @@ static struct security_hook_list smack_hooks[] __lsm_=
ro_after_init =3D {
 =09LSM_HOOK_INIT(ismaclabel, smack_ismaclabel),
 =09LSM_HOOK_INIT(secid_to_secctx, smack_secid_to_secctx),
 =09LSM_HOOK_INIT(secctx_to_secid, smack_secctx_to_secid),
+=09LSM_HOOK_INIT(release_secctx, smack_release_secctx),
 =09LSM_HOOK_INIT(inode_notifysecctx, smack_inode_notifysecctx),
 =09LSM_HOOK_INIT(inode_setsecctx, smack_inode_setsecctx),
 =09LSM_HOOK_INIT(inode_getsecctx, smack_inode_getsecctx),
--=20
2.20.1


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

