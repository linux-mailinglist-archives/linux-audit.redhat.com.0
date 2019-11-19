Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 7C198102B5D
	for <lists+linux-audit@lfdr.de>; Tue, 19 Nov 2019 19:04:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574186650;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cBk9cvWHB1Ef8yDw9VN7Zq7tKFMycpuIUm9NEkoI5qY=;
	b=gIb3SdvgzFsZ4atjXztx3/B4O4ushyJf/27IqBVMo5vAtmywdd4hnTcmoTsdKP7hy5Bsog
	lUhIzfpbSgMyKFognzufhEG54RzJ618Kaw2Cko6qeO9mpWG0m90OethqjdRMz0QYwNj77y
	Jj8yuKWrqyIsOo/dowjwhT1jnfGU8S0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-feFmp-p8PgqgeX_hT8NbJw-1; Tue, 19 Nov 2019 13:04:07 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F47C100551B;
	Tue, 19 Nov 2019 18:04:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC46F4DA65;
	Tue, 19 Nov 2019 18:03:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9B80D4E562;
	Tue, 19 Nov 2019 18:03:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAJI3uFF001124 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 19 Nov 2019 13:03:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E7234178B1; Tue, 19 Nov 2019 18:03:55 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E18EE1C5B6
	for <linux-audit@redhat.com>; Tue, 19 Nov 2019 18:03:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42C501011A62
	for <linux-audit@redhat.com>; Tue, 19 Nov 2019 18:03:53 +0000 (UTC)
X-YMail-OSG: 7lUsOFAVM1l50ZFvGWfgvcR.vjbhrQMcZ_iSr5ug0UkM6n0bBOkk.OL5IrCMjq9
	9Yl15AAMQciAvujps7D.G_PoJMJBNTYYPKVINCJbfuw5wFJrubQI_z558tM_WHlzQSvQE6fSQjLF
	e_i5m9OXLrvoZG3kTEOn625yICRUx5lGHHnRxoHJxG12k13rwedAs6Xb6PHjdezsFMt0NaG90727
	qeBBD7nvFNzzs.4WEVHf8CDEXyVSbPQyMKvYEKuGvf7KbLVM_pfVd.WY.A1wRTqe.GFmyxqgN2s8
	giDUX4Za0LGjGsebcGIBLJKWSrI1DkIjX_1iUoppWDBeDrFLNZHTXl7iDcCVXmag.cFGAVTtFE6z
	atqR1QjhDoXIXFfO7sWltw04vZc_hCjqt61b2PtmG0EmBhMKqDTL16._frwycLdmymUkj4UmXngi
	hRxxd3QBNwdYYeb7C3Kq_N707JrQdv9B22c3fMmry93xwpK.vgfpCicXVyqCcekgkKY2fSd4ngE_
	HNNsINmMA3yAvffJl68Ii4hdK4VveLs_FZ9j4cZro6nktNVpt7ARipj32yqTMkNDbCx9CzsGmlog
	2.pSgnl_UTf6a7doOFdzGXs6heXAwxX.VbY2Yxp56mGLzh9EEjAxukv2KlSgsEGp6ouFqZfnlSlu
	oCCjINkt_JUDAAktOGYIh3fZz2LZlQkLrjLXSMO_cj93EBkqYB9RL8njokqAJdfYNf10y6x3MDtK
	3F10hq4Fs7wjjjvjs66ix1rcDKxBMMHfJh2es6wtvIUsKw8ZsYh0BBrcL_ZfpqB5UTK1vbVFwsVU
	P2sCPfcODedLSNQxdtjZ2vI4WtwKyPBUIz5RBJ_4ovZC7Q5Mu0vt0hDuQTH3SjAD9sxrHocNuN.H
	l1xJAEF4mjX3hQwYBBOHspCehvEgXfrYmcdI95_UGR5ACZoG.6IunwXpzs6EegMQhq4FkpN6DwJx
	Lh7chNrCQJn1ln.btFyqYVkKv2HMGu9DmwHyvKTeMgTEVA4bhAPTs4w5c_6l3Jd5E46nURUozbJT
	gfWooO51gUJ1HQ71TcEUvRIxHaI1Dz0qM.mHxb.HMxFJUc93qFkZQtO4IfRxANhB0iRjLYkcOMFi
	HV.7.rKnr9Qpt1rZfqldFOOg9QzHBKbr0hXWFwWbWeZl8pLGoH03is4MXHaRFhPaJO0c9kl_buKO
	MvvVyz573z2QLiOM_D4GpXWtXEfwc4N.obu.s1MwoWwXtb71m7Jzt90ZUQVlkdZ6YgELXzJayMG0
	tXhj1hJLa.znifBYpL_rFW1dH45QPOwV6l2t914ZkjF0k.Aj1gIJ7uhedNFiAjPUgvsNVu3rFmH_
	IsaqQ8_FWlMa0NYV308kwzTwnMuI9LCD7uOHa_xPEGarjlPc5GAEkmKMDHToLtG20ABWsICkj.SI
	Eyg5PpjXYaImu0Ie.hURMV8QrzQZ.osbg3.QwH799QKPlAvs-
Received: from sonic313-15.consmr.mail.ne1.yahoo.com
	(sonic313-15.consmr.mail.ne1.yahoo.com [66.163.185.38]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-394-V0b73SQSOwiwCWAtQCA23g-1;
	Tue, 19 Nov 2019 13:03:51 -0500
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic313.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 19 Nov 2019 18:03:50 +0000
Received: by smtp402.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 151488e03b2a663d69020bb4fc329e8c; 
	Tue, 19 Nov 2019 18:03:47 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: linux-audit@redhat.com
Subject: [PATCH v11 11/25] LSM: Use lsmblob in security_cred_getsecid
Date: Tue, 19 Nov 2019 10:03:10 -0800
Message-Id: <20191119180315.12254-7-casey@schaufler-ca.com>
In-Reply-To: <20191119180315.12254-1-casey@schaufler-ca.com>
References: <20191119180315.12254-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-MC-Unique: V0b73SQSOwiwCWAtQCA23g-1
X-MC-Unique: feFmp-p8PgqgeX_hT8NbJw-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAJI3uFF001124
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

Change the security_cred_getsecid() interface to fill in a
lsmblob instead of a u32 secid. The associated data elements
in the audit sub-system are changed from a secid to a lsmblob
to accommodate multiple possible LSM audit users.

Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: John Johansen <john.johansen@canonical.com>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
cc: linux-integrity@vger.kernel.org
---
 include/linux/security.h          |  2 +-
 kernel/audit.c                    | 19 +++++++-----------
 kernel/audit.h                    |  5 +++--
 kernel/auditsc.c                  | 33 +++++++++++--------------------
 security/integrity/ima/ima_main.c |  8 ++++----
 security/security.c               | 12 ++++++++---
 6 files changed, 36 insertions(+), 43 deletions(-)

diff --git a/include/linux/security.h b/include/linux/security.h
index a845254fc415..f7bc7aef95cb 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -434,7 +434,7 @@ int security_cred_alloc_blank(struct cred *cred, gfp_t =
gfp);
 void security_cred_free(struct cred *cred);
 int security_prepare_creds(struct cred *new, const struct cred *old, gfp_t=
 gfp);
 void security_transfer_creds(struct cred *new, const struct cred *old);
-void security_cred_getsecid(const struct cred *c, u32 *secid);
+void security_cred_getsecid(const struct cred *c, struct lsmblob *blob);
 int security_kernel_act_as(struct cred *new, struct lsmblob *blob);
 int security_kernel_create_files_as(struct cred *new, struct inode *inode)=
;
 int security_kernel_module_request(char *kmod_name);
diff --git a/kernel/audit.c b/kernel/audit.c
index fd29186ae977..ba9f78e36d1e 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -124,7 +124,7 @@ static u32=09audit_backlog_wait_time =3D AUDIT_BACKLOG_=
WAIT_TIME;
 /* The identity of the user shutting down the audit system. */
 kuid_t=09=09audit_sig_uid =3D INVALID_UID;
 pid_t=09=09audit_sig_pid =3D -1;
-u32=09=09audit_sig_sid =3D 0;
+struct lsmblob=09audit_sig_lsm;
=20
 /* Records can be lost in several ways:
    0) [suppressed in audit_alloc]
@@ -1416,23 +1416,21 @@ static int audit_receive_msg(struct sk_buff *skb, s=
truct nlmsghdr *nlh)
 =09}
 =09case AUDIT_SIGNAL_INFO:
 =09=09len =3D 0;
-=09=09if (audit_sig_sid) {
-=09=09=09struct lsmblob blob;
-
-=09=09=09lsmblob_init(&blob, audit_sig_sid);
-=09=09=09err =3D security_secid_to_secctx(&blob, &ctx, &len);
+=09=09if (lsmblob_is_set(&audit_sig_lsm)) {
+=09=09=09err =3D security_secid_to_secctx(&audit_sig_lsm, &ctx,
+=09=09=09=09=09=09       &len);
 =09=09=09if (err)
 =09=09=09=09return err;
 =09=09}
 =09=09sig_data =3D kmalloc(sizeof(*sig_data) + len, GFP_KERNEL);
 =09=09if (!sig_data) {
-=09=09=09if (audit_sig_sid)
+=09=09=09if (lsmblob_is_set(&audit_sig_lsm))
 =09=09=09=09security_release_secctx(ctx, len);
 =09=09=09return -ENOMEM;
 =09=09}
 =09=09sig_data->uid =3D from_kuid(&init_user_ns, audit_sig_uid);
 =09=09sig_data->pid =3D audit_sig_pid;
-=09=09if (audit_sig_sid) {
+=09=09if (lsmblob_is_set(&audit_sig_lsm)) {
 =09=09=09memcpy(sig_data->ctx, ctx, len);
 =09=09=09security_release_secctx(ctx, len);
 =09=09}
@@ -2274,7 +2272,6 @@ int audit_set_loginuid(kuid_t loginuid)
 int audit_signal_info(int sig, struct task_struct *t)
 {
 =09kuid_t uid =3D current_uid(), auid;
-=09struct lsmblob blob;
=20
 =09if (auditd_test_task(t) &&
 =09    (sig =3D=3D SIGTERM || sig =3D=3D SIGHUP ||
@@ -2285,9 +2282,7 @@ int audit_signal_info(int sig, struct task_struct *t)
 =09=09=09audit_sig_uid =3D auid;
 =09=09else
 =09=09=09audit_sig_uid =3D uid;
-=09=09security_task_getsecid(current, &blob);
-=09=09/* scaffolding until audit_sig_sid is converted */
-=09=09audit_sig_sid =3D blob.secid[0];
+=09=09security_task_getsecid(current, &audit_sig_lsm);
 =09}
=20
 =09return audit_signal_info_syscall(t);
diff --git a/kernel/audit.h b/kernel/audit.h
index 6fb7160412d4..af9bc09e656c 100644
--- a/kernel/audit.h
+++ b/kernel/audit.h
@@ -9,6 +9,7 @@
 #include <linux/fs.h>
 #include <linux/audit.h>
 #include <linux/skbuff.h>
+#include <linux/security.h>
 #include <uapi/linux/mqueue.h>
 #include <linux/tty.h>
=20
@@ -134,7 +135,7 @@ struct audit_context {
 =09kuid_t=09=09    target_auid;
 =09kuid_t=09=09    target_uid;
 =09unsigned int=09    target_sessionid;
-=09u32=09=09    target_sid;
+=09struct lsmblob   target_lsm;
 =09char=09=09    target_comm[TASK_COMM_LEN];
=20
 =09struct audit_tree_refs *trees, *first_trees;
@@ -329,7 +330,7 @@ extern char *audit_unpack_string(void **bufp, size_t *r=
emain, size_t len);
=20
 extern pid_t audit_sig_pid;
 extern kuid_t audit_sig_uid;
-extern u32 audit_sig_sid;
+extern struct lsmblob audit_sig_lsm;
=20
 extern int audit_filter(int msgtype, unsigned int listtype);
=20
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 5752e51883d5..c1e3ac8eb1ad 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -112,7 +112,7 @@ struct audit_aux_data_pids {
 =09kuid_t=09=09=09target_auid[AUDIT_AUX_PIDS];
 =09kuid_t=09=09=09target_uid[AUDIT_AUX_PIDS];
 =09unsigned int=09=09target_sessionid[AUDIT_AUX_PIDS];
-=09u32=09=09=09target_sid[AUDIT_AUX_PIDS];
+=09struct lsmblob=09target_lsm[AUDIT_AUX_PIDS];
 =09char =09=09=09target_comm[AUDIT_AUX_PIDS][TASK_COMM_LEN];
 =09int=09=09=09pid_count;
 };
@@ -957,14 +957,14 @@ static inline void audit_free_context(struct audit_co=
ntext *context)
 }
=20
 static int audit_log_pid_context(struct audit_context *context, pid_t pid,
-=09=09=09=09 kuid_t auid, kuid_t uid, unsigned int sessionid,
-=09=09=09=09 u32 sid, char *comm)
+=09=09=09=09 kuid_t auid, kuid_t uid,
+=09=09=09=09 unsigned int sessionid,
+=09=09=09=09 struct lsmblob *blob, char *comm)
 {
 =09struct audit_buffer *ab;
 =09char *ctx =3D NULL;
 =09u32 len;
 =09int rc =3D 0;
-=09struct lsmblob blob;
=20
 =09ab =3D audit_log_start(context, GFP_KERNEL, AUDIT_OBJ_PID);
 =09if (!ab)
@@ -973,9 +973,8 @@ static int audit_log_pid_context(struct audit_context *=
context, pid_t pid,
 =09audit_log_format(ab, "opid=3D%d oauid=3D%d ouid=3D%d oses=3D%d", pid,
 =09=09=09 from_kuid(&init_user_ns, auid),
 =09=09=09 from_kuid(&init_user_ns, uid), sessionid);
-=09if (sid) {
-=09=09lsmblob_init(&blob, sid);
-=09=09if (security_secid_to_secctx(&blob, &ctx, &len)) {
+=09if (lsmblob_is_set(blob)) {
+=09=09if (security_secid_to_secctx(blob, &ctx, &len)) {
 =09=09=09audit_log_format(ab, " obj=3D(none)");
 =09=09=09rc =3D 1;
 =09=09} else {
@@ -1546,7 +1545,7 @@ static void audit_log_exit(void)
 =09=09=09=09=09=09  axs->target_auid[i],
 =09=09=09=09=09=09  axs->target_uid[i],
 =09=09=09=09=09=09  axs->target_sessionid[i],
-=09=09=09=09=09=09  axs->target_sid[i],
+=09=09=09=09=09=09  &axs->target_lsm[i],
 =09=09=09=09=09=09  axs->target_comm[i]))
 =09=09=09=09call_panic =3D 1;
 =09}
@@ -1555,7 +1554,7 @@ static void audit_log_exit(void)
 =09    audit_log_pid_context(context, context->target_pid,
 =09=09=09=09  context->target_auid, context->target_uid,
 =09=09=09=09  context->target_sessionid,
-=09=09=09=09  context->target_sid, context->target_comm))
+=09=09=09=09  &context->target_lsm, context->target_comm))
 =09=09=09call_panic =3D 1;
=20
 =09if (context->pwd.dentry && context->pwd.mnt) {
@@ -1733,7 +1732,7 @@ void __audit_syscall_exit(int success, long return_co=
de)
 =09context->aux =3D NULL;
 =09context->aux_pids =3D NULL;
 =09context->target_pid =3D 0;
-=09context->target_sid =3D 0;
+=09lsmblob_init(&context->target_lsm, 0);
 =09context->sockaddr_len =3D 0;
 =09context->type =3D 0;
 =09context->fds[0] =3D -1;
@@ -2384,15 +2383,12 @@ int __audit_sockaddr(int len, void *a)
 void __audit_ptrace(struct task_struct *t)
 {
 =09struct audit_context *context =3D audit_context();
-=09struct lsmblob blob;
=20
 =09context->target_pid =3D task_tgid_nr(t);
 =09context->target_auid =3D audit_get_loginuid(t);
 =09context->target_uid =3D task_uid(t);
 =09context->target_sessionid =3D audit_get_sessionid(t);
-=09security_task_getsecid(t, &blob);
-=09/* scaffolding - until target_sid is converted */
-=09context->target_sid =3D blob.secid[0];
+=09security_task_getsecid(t, &context->target_lsm);
 =09memcpy(context->target_comm, t->comm, TASK_COMM_LEN);
 }
=20
@@ -2408,7 +2404,6 @@ int audit_signal_info_syscall(struct task_struct *t)
 =09struct audit_aux_data_pids *axp;
 =09struct audit_context *ctx =3D audit_context();
 =09kuid_t t_uid =3D task_uid(t);
-=09struct lsmblob blob;
=20
 =09if (!audit_signals || audit_dummy_context())
 =09=09return 0;
@@ -2420,9 +2415,7 @@ int audit_signal_info_syscall(struct task_struct *t)
 =09=09ctx->target_auid =3D audit_get_loginuid(t);
 =09=09ctx->target_uid =3D t_uid;
 =09=09ctx->target_sessionid =3D audit_get_sessionid(t);
-=09=09security_task_getsecid(t, &blob);
-=09=09/* scaffolding until target_sid is converted */
-=09=09ctx->target_sid =3D blob.secid[0];
+=09=09security_task_getsecid(t, &ctx->target_lsm);
 =09=09memcpy(ctx->target_comm, t->comm, TASK_COMM_LEN);
 =09=09return 0;
 =09}
@@ -2443,9 +2436,7 @@ int audit_signal_info_syscall(struct task_struct *t)
 =09axp->target_auid[axp->pid_count] =3D audit_get_loginuid(t);
 =09axp->target_uid[axp->pid_count] =3D t_uid;
 =09axp->target_sessionid[axp->pid_count] =3D audit_get_sessionid(t);
-=09security_task_getsecid(t, &blob);
-=09/* scaffolding until target_sid is converted */
-=09axp->target_sid[axp->pid_count] =3D blob.secid[0];
+=09security_task_getsecid(t, &axp->target_lsm[axp->pid_count]);
 =09memcpy(axp->target_comm[axp->pid_count], t->comm, TASK_COMM_LEN);
 =09axp->pid_count++;
=20
diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima=
_main.c
index cac654c2faaf..305a00a6b087 100644
--- a/security/integrity/ima/ima_main.c
+++ b/security/integrity/ima/ima_main.c
@@ -408,7 +408,6 @@ int ima_file_mmap(struct file *file, unsigned long prot=
)
 int ima_bprm_check(struct linux_binprm *bprm)
 {
 =09int ret;
-=09u32 secid;
 =09struct lsmblob blob;
=20
 =09security_task_getsecid(current, &blob);
@@ -418,9 +417,10 @@ int ima_bprm_check(struct linux_binprm *bprm)
 =09if (ret)
 =09=09return ret;
=20
-=09security_cred_getsecid(bprm->cred, &secid);
-=09return process_measurement(bprm->file, bprm->cred, secid, NULL, 0,
-=09=09=09=09   MAY_EXEC, CREDS_CHECK);
+=09security_cred_getsecid(bprm->cred, &blob);
+=09/* scaffolding until process_measurement changes */
+=09return process_measurement(bprm->file, bprm->cred, blob.secid[0],
+=09=09=09=09   NULL, 0, MAY_EXEC, CREDS_CHECK);
 }
=20
 /**
diff --git a/security/security.c b/security/security.c
index bd279a24adfc..3aba440624f9 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1615,10 +1615,16 @@ void security_transfer_creds(struct cred *new, cons=
t struct cred *old)
 =09call_void_hook(cred_transfer, new, old);
 }
=20
-void security_cred_getsecid(const struct cred *c, u32 *secid)
+void security_cred_getsecid(const struct cred *c, struct lsmblob *blob)
 {
-=09*secid =3D 0;
-=09call_void_hook(cred_getsecid, c, secid);
+=09struct security_hook_list *hp;
+
+=09lsmblob_init(blob, 0);
+=09hlist_for_each_entry(hp, &security_hook_heads.cred_getsecid, list) {
+=09=09if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >=3D lsm_slot))
+=09=09=09continue;
+=09=09hp->hook.cred_getsecid(c, &blob->secid[hp->lsmid->slot]);
+=09}
 }
 EXPORT_SYMBOL(security_cred_getsecid);
=20
--=20
2.20.1


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

