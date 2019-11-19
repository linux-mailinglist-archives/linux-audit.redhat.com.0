Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 11AA0102B5E
	for <lists+linux-audit@lfdr.de>; Tue, 19 Nov 2019 19:04:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574186650;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uKQ9rwoWRp/aQZLFi7K3ESpujUBEEbrFybeDHrXMRRs=;
	b=HKSCyKOehpmFpXG1TN3T777vmFVBjITUEYjxbL6SVnaCXZg0m4WVH0mB09Nvsv/J4AOIfJ
	3n0jGXFE4rsryvNV/F1L5OQCIGSDsE8blQbs3cjio95Lpm8iOJJvsqX4mrZhmYjaMK8eLN
	xaD07qkINrsXbwUFp7MBF7k8eqxKdf4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-7o2SESxDOyeTFZTiyUT0qA-1; Tue, 19 Nov 2019 13:04:08 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BBA01883526;
	Tue, 19 Nov 2019 18:04:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0084217AA2;
	Tue, 19 Nov 2019 18:04:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A85A218095FF;
	Tue, 19 Nov 2019 18:04:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAJI3wgD001156 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 19 Nov 2019 13:03:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 931F5178B1; Tue, 19 Nov 2019 18:03:58 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E7AB17590
	for <linux-audit@redhat.com>; Tue, 19 Nov 2019 18:03:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62F8280013A
	for <linux-audit@redhat.com>; Tue, 19 Nov 2019 18:03:58 +0000 (UTC)
X-YMail-OSG: zsB9gbMVM1n6zwtdiyzo65F71mnVAv38GptJnI63fke29n7aq3FIzx8jMWn3fNK
	VyDAzhmaZ62e5s1NziGPjpE0JP.926aUOpZtwm.V7eAmADkcUYK6M1ppO.BmqWfNqO__tj_M6EaC
	LzGRqHiXV02G1MDIGCC9hnQa6efwEbIGxP.fvVVqTOjWEoMVRQRdEPvDubx_RdV4n2Yz.fK4NPWM
	aWwjlpQOBliZ9lwYb6_yfFL2JBqho7hf9wvRDYPzBLI6BbsGb40TqtzcHURJtCLFqTw94pdjp7uy
	G97AfDaOBD4yOJ4m8hceQol3jiR5ejyl0J_6S.REKhw7oyNma4hmf.hP7_ZjpZiYMTFLMkdq84WB
	N5X.BUydencBxQLDtSd5S57Bfp.oiU4hT8yAk94d.VYo9vqa1p3RlGAPkkY0esYqKyRclb4jxNFi
	DP.RyG94LJANxTU8UegYskwVzIVOIBh3uxXhmDaLEndtqbbh5RfcH8mZpEp0G6LctCWqdZN1rIY5
	.bVCLi5mhdebr3Bg54X.op0BIgxFE6558DwHiRatvdojvYdksizp5YRyc03hJfS8sDQXo3ILJDAx
	McVxRsPbVeGRgL4HDIH0LgaywiabZYjB4v6GiJSRUQl9gRQfSFssK.pMG7KULNSkVB1ExEIE6M9c
	EVIShI.kNH55VL1gGF4lnbWa6EVcPto6KAEKTWl8vxCKbNJAA0kGa5MMWmMbkMBCtZrK36b8BscS
	jwM8isKLz_8WP2MK73aDCPmInV3nzVF2cFYOWgv2avuKvMAF0VdasQpepqwg9FuNS8TKeTHZzD5m
	BKsHCF1pNl3hEvmqIVu8cUyI_D_Our2VfcJrtNaR9dRcVpYtUY4KeKd2t8M3TMtQiaF7jo_XtPvt
	F6XL6y3kLtrLZjGhGjXJc3iB60CeS4F1ICCeaIgAcpfDRMVdz7JOq5R4AkMjF4_TeGkr1kBdx_vN
	PoJbnX7zugbJ_ctAlU4b2StcXToolgaeeidnBn9i9rvcbFoAokvu6Z.MMAnUMY7R1ahtu1YdqDPm
	Z2Frd4mj5UHVVQHFhHmAfZ3C63VcxuDFs4WbD0eqvVrqpiNUtIYNOK49ldXQmagM_p0lR8_zAnF8
	v_KoXDm8V4T0etBGmG..QuzrRx2Lxdmw4ETbuyqU6Gz1V7SpwGu7.OJV3eGcpd_YsdyYGiInt2hd
	rFc3f9zVRltdUkFUuCf5FkK_eBY9s1uw1s96yCt88NuP3x6u6zTmOeZTCX1GByY_8DaRVE45aZFO
	nAG0qn6Gzh4SDono85lZF4ji1NSHunPSdjTBXhzWH3R5YTQI8oBVtx0NAlWxcXVmFbZILgJHpwsZ
	.mzKz7isYJ8kmfmvIzeTPtftqfBxcSQ_uvPUjQrxz8JSkyR06Z8yiJFvuEfWR7Zza73bCpb5lGyO
	SE8edhZwetXW32QR8U6hw4eLo.e8aSZWTEJlPIZf34iGK
Received: from sonic306-27.consmr.mail.ne1.yahoo.com
	(sonic306-27.consmr.mail.ne1.yahoo.com [66.163.189.89]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-159-tshBIvmxMTaMivjkBi5kFg-1;
	Tue, 19 Nov 2019 13:03:56 -0500
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic306.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 19 Nov 2019 18:03:55 +0000
Received: by smtp402.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 151488e03b2a663d69020bb4fc329e8c; 
	Tue, 19 Nov 2019 18:03:49 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: linux-audit@redhat.com
Subject: [PATCH v11 15/25] LSM: Use lsmcontext in security_secid_to_secctx
Date: Tue, 19 Nov 2019 10:03:12 -0800
Message-Id: <20191119180315.12254-9-casey@schaufler-ca.com>
In-Reply-To: <20191119180315.12254-1-casey@schaufler-ca.com>
References: <20191119180315.12254-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-MC-Unique: tshBIvmxMTaMivjkBi5kFg-1
X-MC-Unique: 7o2SESxDOyeTFZTiyUT0qA-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAJI3wgD001156
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Replace the (secctx,seclen) pointer pair with a single
lsmcontext pointer to allow return of the LSM identifier
along with the context and context length. This allows
security_release_secctx() to know how to release the
context. Callers have been modified to use or save the
returned data from the new structure.

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
cc: netdev@vger.kernel.org
---
 drivers/android/binder.c                | 26 +++++++---------
 include/linux/security.h                |  4 +--
 include/net/scm.h                       | 10 ++-----
 kernel/audit.c                          | 29 +++++++-----------
 kernel/auditsc.c                        | 31 +++++++------------
 net/ipv4/ip_sockglue.c                  |  7 ++---
 net/netfilter/nf_conntrack_netlink.c    | 14 +++++----
 net/netfilter/nf_conntrack_standalone.c |  7 ++---
 net/netfilter/nfnetlink_queue.c         |  5 +++-
 net/netlabel/netlabel_unlabeled.c       | 40 ++++++++-----------------
 net/netlabel/netlabel_user.c            |  7 ++---
 security/security.c                     | 10 +++++--
 12 files changed, 74 insertions(+), 116 deletions(-)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 49b84b6fafd9..cc81d0f540fd 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -2863,9 +2863,7 @@ static void binder_transaction(struct binder_proc *pr=
oc,
 =09binder_size_t last_fixup_min_off =3D 0;
 =09struct binder_context *context =3D proc->context;
 =09int t_debug_id =3D atomic_inc_return(&binder_last_id);
-=09char *secctx =3D NULL;
-=09u32 secctx_sz =3D 0;
-=09struct lsmcontext scaff; /* scaffolding */
+=09struct lsmcontext lsmctx =3D { };
=20
 =09e =3D binder_transaction_log_add(&binder_transaction_log);
 =09e->debug_id =3D t_debug_id;
@@ -3113,14 +3111,14 @@ static void binder_transaction(struct binder_proc *=
proc,
 =09=09size_t added_size;
=20
 =09=09security_task_getsecid(proc->tsk, &blob);
-=09=09ret =3D security_secid_to_secctx(&blob, &secctx, &secctx_sz);
+=09=09ret =3D security_secid_to_secctx(&blob, &lsmctx);
 =09=09if (ret) {
 =09=09=09return_error =3D BR_FAILED_REPLY;
 =09=09=09return_error_param =3D ret;
 =09=09=09return_error_line =3D __LINE__;
 =09=09=09goto err_get_secctx_failed;
 =09=09}
-=09=09added_size =3D ALIGN(secctx_sz, sizeof(u64));
+=09=09added_size =3D ALIGN(lsmctx.len, sizeof(u64));
 =09=09extra_buffers_size +=3D added_size;
 =09=09if (extra_buffers_size < added_size) {
 =09=09=09/* integer overflow of extra_buffers_size */
@@ -3147,24 +3145,22 @@ static void binder_transaction(struct binder_proc *=
proc,
 =09=09t->buffer =3D NULL;
 =09=09goto err_binder_alloc_buf_failed;
 =09}
-=09if (secctx) {
+=09if (lsmctx.context) {
 =09=09int err;
 =09=09size_t buf_offset =3D ALIGN(tr->data_size, sizeof(void *)) +
 =09=09=09=09    ALIGN(tr->offsets_size, sizeof(void *)) +
 =09=09=09=09    ALIGN(extra_buffers_size, sizeof(void *)) -
-=09=09=09=09    ALIGN(secctx_sz, sizeof(u64));
+=09=09=09=09    ALIGN(lsmctx.len, sizeof(u64));
=20
 =09=09t->security_ctx =3D (uintptr_t)t->buffer->user_data + buf_offset;
 =09=09err =3D binder_alloc_copy_to_buffer(&target_proc->alloc,
 =09=09=09=09=09=09  t->buffer, buf_offset,
-=09=09=09=09=09=09  secctx, secctx_sz);
+=09=09=09=09=09=09  lsmctx.context, lsmctx.len);
 =09=09if (err) {
 =09=09=09t->security_ctx =3D 0;
 =09=09=09WARN_ON(1);
 =09=09}
-=09=09lsmcontext_init(&scaff, secctx, secctx_sz, 0);
-=09=09security_release_secctx(&scaff);
-=09=09secctx =3D NULL;
+=09=09security_release_secctx(&lsmctx);
 =09}
 =09t->buffer->debug_id =3D t->debug_id;
 =09t->buffer->transaction =3D t;
@@ -3220,7 +3216,7 @@ static void binder_transaction(struct binder_proc *pr=
oc,
 =09off_end_offset =3D off_start_offset + tr->offsets_size;
 =09sg_buf_offset =3D ALIGN(off_end_offset, sizeof(void *));
 =09sg_buf_end_offset =3D sg_buf_offset + extra_buffers_size -
-=09=09ALIGN(secctx_sz, sizeof(u64));
+=09=09ALIGN(lsmctx.len, sizeof(u64));
 =09off_min =3D 0;
 =09for (buffer_offset =3D off_start_offset; buffer_offset < off_end_offset=
;
 =09     buffer_offset +=3D sizeof(binder_size_t)) {
@@ -3496,10 +3492,8 @@ static void binder_transaction(struct binder_proc *p=
roc,
 =09binder_alloc_free_buf(&target_proc->alloc, t->buffer);
 err_binder_alloc_buf_failed:
 err_bad_extra_size:
-=09if (secctx) {
-=09=09lsmcontext_init(&scaff, secctx, secctx_sz, 0);
-=09=09security_release_secctx(&scaff);
-=09}
+=09if (lsmctx.context)
+=09=09security_release_secctx(&lsmctx);
 err_get_secctx_failed:
 =09kfree(tcomplete);
 =09binder_stats_deleted(BINDER_STAT_TRANSACTION_COMPLETE);
diff --git a/include/linux/security.h b/include/linux/security.h
index 9bb11d9f1348..e47cef3d62f0 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -528,7 +528,7 @@ int security_setprocattr(const char *lsm, const char *n=
ame, void *value,
 =09=09=09 size_t size);
 int security_netlink_send(struct sock *sk, struct sk_buff *skb);
 int security_ismaclabel(const char *name);
-int security_secid_to_secctx(struct lsmblob *blob, char **secdata, u32 *se=
clen);
+int security_secid_to_secctx(struct lsmblob *blob, struct lsmcontext *cp);
 int security_secctx_to_secid(const char *secdata, u32 seclen,
 =09=09=09     struct lsmblob *blob);
 void security_release_secctx(struct lsmcontext *cp);
@@ -1333,7 +1333,7 @@ static inline int security_ismaclabel(const char *nam=
e)
 }
=20
 static inline int security_secid_to_secctx(struct lsmblob *blob,
-=09=09=09=09=09   char **secdata, u32 *seclen)
+=09=09=09=09=09   struct lsmcontext *cp)
 {
 =09return -EOPNOTSUPP;
 }
diff --git a/include/net/scm.h b/include/net/scm.h
index 30ba801c91bd..4a6ad8caf423 100644
--- a/include/net/scm.h
+++ b/include/net/scm.h
@@ -93,18 +93,14 @@ static __inline__ int scm_send(struct socket *sock, str=
uct msghdr *msg,
 static inline void scm_passec(struct socket *sock, struct msghdr *msg, str=
uct scm_cookie *scm)
 {
 =09struct lsmcontext context;
-=09char *secdata;
-=09u32 seclen;
 =09int err;
=20
 =09if (test_bit(SOCK_PASSSEC, &sock->flags)) {
-=09=09err =3D security_secid_to_secctx(&scm->lsmblob, &secdata,
-=09=09=09=09=09       &seclen);
+=09=09err =3D security_secid_to_secctx(&scm->lsmblob, &context);
=20
 =09=09if (!err) {
-=09=09=09put_cmsg(msg, SOL_SOCKET, SCM_SECURITY, seclen, secdata);
-=09=09=09/*scaffolding*/
-=09=09=09lsmcontext_init(&context, secdata, seclen, 0);
+=09=09=09put_cmsg(msg, SOL_SOCKET, SCM_SECURITY,
+=09=09=09=09 context.len, context.context);
 =09=09=09security_release_secctx(&context);
 =09=09}
 =09}
diff --git a/kernel/audit.c b/kernel/audit.c
index 35970e7191b6..cd0024c89807 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -1178,9 +1178,8 @@ static int audit_receive_msg(struct sk_buff *skb, str=
uct nlmsghdr *nlh)
 =09struct audit_buffer=09*ab;
 =09u16=09=09=09msg_type =3D nlh->nlmsg_type;
 =09struct audit_sig_info   *sig_data;
-=09char=09=09=09*ctx =3D NULL;
 =09u32=09=09=09len;
-=09struct lsmcontext=09scaff; /* scaffolding */
+=09struct lsmcontext=09context =3D { };
=20
 =09err =3D audit_netlink_ok(skb, msg_type);
 =09if (err)
@@ -1418,25 +1417,22 @@ static int audit_receive_msg(struct sk_buff *skb, s=
truct nlmsghdr *nlh)
 =09case AUDIT_SIGNAL_INFO:
 =09=09len =3D 0;
 =09=09if (lsmblob_is_set(&audit_sig_lsm)) {
-=09=09=09err =3D security_secid_to_secctx(&audit_sig_lsm, &ctx,
-=09=09=09=09=09=09       &len);
+=09=09=09err =3D security_secid_to_secctx(&audit_sig_lsm,
+=09=09=09=09=09=09       &context);
 =09=09=09if (err)
 =09=09=09=09return err;
 =09=09}
 =09=09sig_data =3D kmalloc(sizeof(*sig_data) + len, GFP_KERNEL);
 =09=09if (!sig_data) {
-=09=09=09if (lsmblob_is_set(&audit_sig_lsm)) {
-=09=09=09=09lsmcontext_init(&scaff, ctx, len, 0);
-=09=09=09=09security_release_secctx(&scaff);
-=09=09=09}
+=09=09=09if (lsmblob_is_set(&audit_sig_lsm))
+=09=09=09=09security_release_secctx(&context);
 =09=09=09return -ENOMEM;
 =09=09}
 =09=09sig_data->uid =3D from_kuid(&init_user_ns, audit_sig_uid);
 =09=09sig_data->pid =3D audit_sig_pid;
 =09=09if (lsmblob_is_set(&audit_sig_lsm)) {
-=09=09=09memcpy(sig_data->ctx, ctx, len);
-=09=09=09lsmcontext_init(&scaff, ctx, len, 0);
-=09=09=09security_release_secctx(&scaff);
+=09=09=09memcpy(sig_data->ctx, context.context, context.len);
+=09=09=09security_release_secctx(&context);
 =09=09}
 =09=09audit_send_reply(skb, seq, AUDIT_SIGNAL_INFO, 0, 0,
 =09=09=09=09 sig_data, sizeof(*sig_data) + len);
@@ -2061,26 +2057,23 @@ void audit_log_key(struct audit_buffer *ab, char *k=
ey)
=20
 int audit_log_task_context(struct audit_buffer *ab)
 {
-=09char *ctx =3D NULL;
-=09unsigned len;
 =09int error;
 =09struct lsmblob blob;
-=09struct lsmcontext scaff; /* scaffolding */
+=09struct lsmcontext context;
=20
 =09security_task_getsecid(current, &blob);
 =09if (!lsmblob_is_set(&blob))
 =09=09return 0;
=20
-=09error =3D security_secid_to_secctx(&blob, &ctx, &len);
+=09error =3D security_secid_to_secctx(&blob, &context);
 =09if (error) {
 =09=09if (error !=3D -EINVAL)
 =09=09=09goto error_path;
 =09=09return 0;
 =09}
=20
-=09audit_log_format(ab, " subj=3D%s", ctx);
-=09lsmcontext_init(&scaff, ctx, len, 0);
-=09security_release_secctx(&scaff);
+=09audit_log_format(ab, " subj=3D%s", context.context);
+=09security_release_secctx(&context);
 =09return 0;
=20
 error_path:
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 8790e7aafa7d..6d273183dd87 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -962,9 +962,7 @@ static int audit_log_pid_context(struct audit_context *=
context, pid_t pid,
 =09=09=09=09 struct lsmblob *blob, char *comm)
 {
 =09struct audit_buffer *ab;
-=09struct lsmcontext lsmcxt;
-=09char *ctx =3D NULL;
-=09u32 len;
+=09struct lsmcontext lsmctx;
 =09int rc =3D 0;
=20
 =09ab =3D audit_log_start(context, GFP_KERNEL, AUDIT_OBJ_PID);
@@ -975,13 +973,12 @@ static int audit_log_pid_context(struct audit_context=
 *context, pid_t pid,
 =09=09=09 from_kuid(&init_user_ns, auid),
 =09=09=09 from_kuid(&init_user_ns, uid), sessionid);
 =09if (lsmblob_is_set(blob)) {
-=09=09if (security_secid_to_secctx(blob, &ctx, &len)) {
+=09=09if (security_secid_to_secctx(blob, &lsmctx)) {
 =09=09=09audit_log_format(ab, " obj=3D(none)");
 =09=09=09rc =3D 1;
 =09=09} else {
-=09=09=09audit_log_format(ab, " obj=3D%s", ctx);
-=09=09=09lsmcontext_init(&lsmcxt, ctx, len, 0); /*scaffolding*/
-=09=09=09security_release_secctx(&lsmcxt);
+=09=09=09audit_log_format(ab, " obj=3D%s", lsmctx.context);
+=09=09=09security_release_secctx(&lsmctx);
 =09=09}
 =09}
 =09audit_log_format(ab, " ocomm=3D");
@@ -1194,7 +1191,6 @@ static void audit_log_fcaps(struct audit_buffer *ab, =
struct audit_names *name)
=20
 static void show_special(struct audit_context *context, int *call_panic)
 {
-=09struct lsmcontext lsmcxt;
 =09struct audit_buffer *ab;
 =09int i;
=20
@@ -1218,17 +1214,15 @@ static void show_special(struct audit_context *cont=
ext, int *call_panic)
 =09=09=09=09 from_kgid(&init_user_ns, context->ipc.gid),
 =09=09=09=09 context->ipc.mode);
 =09=09if (osid) {
-=09=09=09char *ctx =3D NULL;
-=09=09=09u32 len;
+=09=09=09struct lsmcontext lsmcxt;
 =09=09=09struct lsmblob blob;
=20
 =09=09=09lsmblob_init(&blob, osid);
-=09=09=09if (security_secid_to_secctx(&blob, &ctx, &len)) {
+=09=09=09if (security_secid_to_secctx(&blob, &lsmcxt)) {
 =09=09=09=09audit_log_format(ab, " osid=3D%u", osid);
 =09=09=09=09*call_panic =3D 1;
 =09=09=09} else {
-=09=09=09=09audit_log_format(ab, " obj=3D%s", ctx);
-=09=09=09=09lsmcontext_init(&lsmcxt, ctx, len, 0);
+=09=09=09=09audit_log_format(ab, " obj=3D%s", lsmcxt.context);
 =09=09=09=09security_release_secctx(&lsmcxt);
 =09=09=09}
 =09=09}
@@ -1372,20 +1366,17 @@ static void audit_log_name(struct audit_context *co=
ntext, struct audit_names *n,
 =09=09=09=09 MAJOR(n->rdev),
 =09=09=09=09 MINOR(n->rdev));
 =09if (n->osid !=3D 0) {
-=09=09char *ctx =3D NULL;
-=09=09u32 len;
 =09=09struct lsmblob blob;
-=09=09struct lsmcontext lsmcxt;
+=09=09struct lsmcontext lsmctx;
=20
 =09=09lsmblob_init(&blob, n->osid);
-=09=09if (security_secid_to_secctx(&blob, &ctx, &len)) {
+=09=09if (security_secid_to_secctx(&blob, &lsmctx)) {
 =09=09=09audit_log_format(ab, " osid=3D%u", n->osid);
 =09=09=09if (call_panic)
 =09=09=09=09*call_panic =3D 2;
 =09=09} else {
-=09=09=09audit_log_format(ab, " obj=3D%s", ctx);
-=09=09=09lsmcontext_init(&lsmcxt, ctx, len, 0); /* scaffolding */
-=09=09=09security_release_secctx(&lsmcxt);
+=09=09=09audit_log_format(ab, " obj=3D%s", lsmctx.context);
+=09=09=09security_release_secctx(&lsmctx);
 =09=09}
 =09}
=20
diff --git a/net/ipv4/ip_sockglue.c b/net/ipv4/ip_sockglue.c
index 96d56a30ecca..27af7a6b8780 100644
--- a/net/ipv4/ip_sockglue.c
+++ b/net/ipv4/ip_sockglue.c
@@ -132,20 +132,17 @@ static void ip_cmsg_recv_security(struct msghdr *msg,=
 struct sk_buff *skb)
 {
 =09struct lsmcontext context;
 =09struct lsmblob lb;
-=09char *secdata;
-=09u32 seclen;
 =09int err;
=20
 =09err =3D security_socket_getpeersec_dgram(NULL, skb, &lb);
 =09if (err)
 =09=09return;
=20
-=09err =3D security_secid_to_secctx(&lb, &secdata, &seclen);
+=09err =3D security_secid_to_secctx(&lb, &context);
 =09if (err)
 =09=09return;
=20
-=09put_cmsg(msg, SOL_IP, SCM_SECURITY, seclen, secdata);
-=09lsmcontext_init(&context, secdata, seclen, 0); /* scaffolding */
+=09put_cmsg(msg, SOL_IP, SCM_SECURITY, context.len, context.context);
 =09security_release_secctx(&context);
 }
=20
diff --git a/net/netfilter/nf_conntrack_netlink.c b/net/netfilter/nf_conntr=
ack_netlink.c
index 78791e015d8b..7c8a7edac36d 100644
--- a/net/netfilter/nf_conntrack_netlink.c
+++ b/net/netfilter/nf_conntrack_netlink.c
@@ -329,13 +329,12 @@ static int ctnetlink_dump_mark(struct sk_buff *skb, c=
onst struct nf_conn *ct)
 static int ctnetlink_dump_secctx(struct sk_buff *skb, const struct nf_conn=
 *ct)
 {
 =09struct nlattr *nest_secctx;
-=09int len, ret;
-=09char *secctx;
+=09int ret;
 =09struct lsmblob blob;
 =09struct lsmcontext context;
=20
 =09lsmblob_init(&blob, ct->secmark);
-=09ret =3D security_secid_to_secctx(&blob, &secctx, &len);
+=09ret =3D security_secid_to_secctx(&blob, &context);
 =09if (ret)
 =09=09return 0;
=20
@@ -344,13 +343,12 @@ static int ctnetlink_dump_secctx(struct sk_buff *skb,=
 const struct nf_conn *ct)
 =09if (!nest_secctx)
 =09=09goto nla_put_failure;
=20
-=09if (nla_put_string(skb, CTA_SECCTX_NAME, secctx))
+=09if (nla_put_string(skb, CTA_SECCTX_NAME, context.context))
 =09=09goto nla_put_failure;
 =09nla_nest_end(skb, nest_secctx);
=20
 =09ret =3D 0;
 nla_put_failure:
-=09lsmcontext_init(&context, secctx, len, 0); /* scaffolding */
 =09security_release_secctx(&context);
 =09return ret;
 }
@@ -626,12 +624,16 @@ static inline int ctnetlink_secctx_size(const struct =
nf_conn *ct)
 #ifdef CONFIG_NF_CONNTRACK_SECMARK
 =09int len, ret;
 =09struct lsmblob blob;
+=09struct lsmcontext context;
=20
 =09lsmblob_init(&blob, ct->secmark);
-=09ret =3D security_secid_to_secctx(&blob, NULL, &len);
+=09ret =3D security_secid_to_secctx(&blob, &context);
 =09if (ret)
 =09=09return 0;
=20
+=09len =3D context.len;
+=09security_release_secctx(&context);
+
 =09return nla_total_size(0) /* CTA_SECCTX */
 =09       + nla_total_size(sizeof(char) * len); /* CTA_SECCTX_NAME */
 #else
diff --git a/net/netfilter/nf_conntrack_standalone.c b/net/netfilter/nf_con=
ntrack_standalone.c
index 8601fcb99f7a..8969754d7fe9 100644
--- a/net/netfilter/nf_conntrack_standalone.c
+++ b/net/netfilter/nf_conntrack_standalone.c
@@ -173,19 +173,16 @@ static void ct_seq_stop(struct seq_file *s, void *v)
 static void ct_show_secctx(struct seq_file *s, const struct nf_conn *ct)
 {
 =09int ret;
-=09u32 len;
-=09char *secctx;
 =09struct lsmblob blob;
 =09struct lsmcontext context;
=20
 =09lsmblob_init(&blob, ct->secmark);
-=09ret =3D security_secid_to_secctx(&blob, &secctx, &len);
+=09ret =3D security_secid_to_secctx(&blob, &context);
 =09if (ret)
 =09=09return;
=20
-=09seq_printf(s, "secctx=3D%s ", secctx);
+=09seq_printf(s, "secctx=3D%s ", context.context);
=20
-=09lsmcontext_init(&context, secctx, len, 0); /* scaffolding */
 =09security_release_secctx(&context);
 }
 #else
diff --git a/net/netfilter/nfnetlink_queue.c b/net/netfilter/nfnetlink_queu=
e.c
index cc3ef03ee198..2d6668fd026c 100644
--- a/net/netfilter/nfnetlink_queue.c
+++ b/net/netfilter/nfnetlink_queue.c
@@ -306,6 +306,7 @@ static u32 nfqnl_get_sk_secctx(struct sk_buff *skb, cha=
r **secdata)
 =09u32 seclen =3D 0;
 #if IS_ENABLED(CONFIG_NETWORK_SECMARK)
 =09struct lsmblob blob;
+=09struct lsmcontext context =3D { };
=20
 =09if (!skb || !sk_fullsock(skb->sk))
 =09=09return 0;
@@ -314,10 +315,12 @@ static u32 nfqnl_get_sk_secctx(struct sk_buff *skb, c=
har **secdata)
=20
 =09if (skb->secmark) {
 =09=09lsmblob_init(&blob, skb->secmark);
-=09=09security_secid_to_secctx(&blob, secdata, &seclen);
+=09=09security_secid_to_secctx(&blob, &context);
+=09=09*secdata =3D context.context;
 =09}
=20
 =09read_unlock_bh(&skb->sk->sk_callback_lock);
+=09seclen =3D context.len;
 #endif
 =09return seclen;
 }
diff --git a/net/netlabel/netlabel_unlabeled.c b/net/netlabel/netlabel_unla=
beled.c
index 288c005b44c7..c03fe9a4f7b9 100644
--- a/net/netlabel/netlabel_unlabeled.c
+++ b/net/netlabel/netlabel_unlabeled.c
@@ -374,8 +374,6 @@ int netlbl_unlhsh_add(struct net *net,
 =09struct netlbl_unlhsh_iface *iface;
 =09struct audit_buffer *audit_buf =3D NULL;
 =09struct lsmcontext context;
-=09char *secctx =3D NULL;
-=09u32 secctx_len;
 =09struct lsmblob blob;
=20
 =09if (addr_len !=3D sizeof(struct in_addr) &&
@@ -440,12 +438,9 @@ int netlbl_unlhsh_add(struct net *net,
 =09rcu_read_unlock();
 =09if (audit_buf !=3D NULL) {
 =09=09lsmblob_init(&blob, secid);
-=09=09if (security_secid_to_secctx(&blob,
-=09=09=09=09=09     &secctx,
-=09=09=09=09=09     &secctx_len) =3D=3D 0) {
-=09=09=09audit_log_format(audit_buf, " sec_obj=3D%s", secctx);
-=09=09=09/* scaffolding */
-=09=09=09lsmcontext_init(&context, secctx, secctx_len, 0);
+=09=09if (security_secid_to_secctx(&blob, &context) =3D=3D 0) {
+=09=09=09audit_log_format(audit_buf, " sec_obj=3D%s",
+=09=09=09=09=09 context.context);
 =09=09=09security_release_secctx(&context);
 =09=09}
 =09=09audit_log_format(audit_buf, " res=3D%u", ret_val =3D=3D 0 ? 1 : 0);
@@ -478,8 +473,6 @@ static int netlbl_unlhsh_remove_addr4(struct net *net,
 =09struct audit_buffer *audit_buf;
 =09struct net_device *dev;
 =09struct lsmcontext context;
-=09char *secctx;
-=09u32 secctx_len;
 =09struct lsmblob blob;
=20
 =09spin_lock(&netlbl_unlhsh_lock);
@@ -503,11 +496,9 @@ static int netlbl_unlhsh_remove_addr4(struct net *net,
 =09=09if (entry !=3D NULL)
 =09=09=09lsmblob_init(&blob, entry->secid);
 =09=09if (entry !=3D NULL &&
-=09=09    security_secid_to_secctx(&blob,
-=09=09=09=09=09     &secctx, &secctx_len) =3D=3D 0) {
-=09=09=09audit_log_format(audit_buf, " sec_obj=3D%s", secctx);
-=09=09=09/* scaffolding */
-=09=09=09lsmcontext_init(&context, secctx, secctx_len, 0);
+=09=09    security_secid_to_secctx(&blob, &context) =3D=3D 0) {
+=09=09=09audit_log_format(audit_buf, " sec_obj=3D%s",
+=09=09=09=09=09 context.context);
 =09=09=09security_release_secctx(&context);
 =09=09}
 =09=09audit_log_format(audit_buf, " res=3D%u", entry !=3D NULL ? 1 : 0);
@@ -546,8 +537,6 @@ static int netlbl_unlhsh_remove_addr6(struct net *net,
 =09struct audit_buffer *audit_buf;
 =09struct net_device *dev;
 =09struct lsmcontext context;
-=09char *secctx;
-=09u32 secctx_len;
 =09struct lsmblob blob;
=20
 =09spin_lock(&netlbl_unlhsh_lock);
@@ -570,10 +559,9 @@ static int netlbl_unlhsh_remove_addr6(struct net *net,
 =09=09if (entry !=3D NULL)
 =09=09=09lsmblob_init(&blob, entry->secid);
 =09=09if (entry !=3D NULL &&
-=09=09    security_secid_to_secctx(&blob,
-=09=09=09=09=09     &secctx, &secctx_len) =3D=3D 0) {
-=09=09=09audit_log_format(audit_buf, " sec_obj=3D%s", secctx);
-=09=09=09lsmcontext_init(&context, secctx, secctx_len, 0);
+=09=09    security_secid_to_secctx(&blob, &context) =3D=3D 0) {
+=09=09=09audit_log_format(audit_buf, " sec_obj=3D%s",
+=09=09=09=09=09 context.context);
 =09=09=09security_release_secctx(&context);
 =09=09}
 =09=09audit_log_format(audit_buf, " res=3D%u", entry !=3D NULL ? 1 : 0);
@@ -1091,8 +1079,6 @@ static int netlbl_unlabel_staticlist_gen(u32 cmd,
 =09struct lsmcontext context;
 =09void *data;
 =09u32 secid;
-=09char *secctx;
-=09u32 secctx_len;
 =09struct lsmblob blob;
=20
 =09data =3D genlmsg_put(cb_arg->skb, NETLINK_CB(cb_arg->nl_cb->skb).portid=
,
@@ -1149,15 +1135,13 @@ static int netlbl_unlabel_staticlist_gen(u32 cmd,
 =09}
=20
 =09lsmblob_init(&blob, secid);
-=09ret_val =3D security_secid_to_secctx(&blob, &secctx, &secctx_len);
+=09ret_val =3D security_secid_to_secctx(&blob, &context);
 =09if (ret_val !=3D 0)
 =09=09goto list_cb_failure;
 =09ret_val =3D nla_put(cb_arg->skb,
 =09=09=09  NLBL_UNLABEL_A_SECCTX,
-=09=09=09  secctx_len,
-=09=09=09  secctx);
-=09/* scaffolding */
-=09lsmcontext_init(&context, secctx, secctx_len, 0);
+=09=09=09  context.len,
+=09=09=09  context.context);
 =09security_release_secctx(&context);
 =09if (ret_val !=3D 0)
 =09=09goto list_cb_failure;
diff --git a/net/netlabel/netlabel_user.c b/net/netlabel/netlabel_user.c
index ef139d8ae7cd..951ba0639d20 100644
--- a/net/netlabel/netlabel_user.c
+++ b/net/netlabel/netlabel_user.c
@@ -85,8 +85,6 @@ struct audit_buffer *netlbl_audit_start_common(int type,
 {
 =09struct audit_buffer *audit_buf;
 =09struct lsmcontext context;
-=09char *secctx;
-=09u32 secctx_len;
 =09struct lsmblob blob;
=20
 =09if (audit_enabled =3D=3D AUDIT_OFF)
@@ -102,9 +100,8 @@ struct audit_buffer *netlbl_audit_start_common(int type=
,
=20
 =09lsmblob_init(&blob, audit_info->secid);
 =09if (audit_info->secid !=3D 0 &&
-=09    security_secid_to_secctx(&blob, &secctx, &secctx_len) =3D=3D 0) {
-=09=09audit_log_format(audit_buf, " subj=3D%s", secctx);
-=09=09lsmcontext_init(&context, secctx, secctx_len, 0);/*scaffolding*/
+=09    security_secid_to_secctx(&blob, &context) =3D=3D 0) {
+=09=09audit_log_format(audit_buf, " subj=3D%s", context.context);
 =09=09security_release_secctx(&context);
 =09}
=20
diff --git a/security/security.c b/security/security.c
index c05ef9d0c8ed..618d4f90936b 100644
--- a/security/security.c
+++ b/security/security.c
@@ -2109,18 +2109,22 @@ int security_ismaclabel(const char *name)
 }
 EXPORT_SYMBOL(security_ismaclabel);
=20
-int security_secid_to_secctx(struct lsmblob *blob, char **secdata, u32 *se=
clen)
+int security_secid_to_secctx(struct lsmblob *blob, struct lsmcontext *cp)
 {
 =09struct security_hook_list *hp;
 =09int display =3D lsm_task_display(current);
=20
+=09memset(cp, 0, sizeof(*cp));
+
 =09hlist_for_each_entry(hp, &security_hook_heads.secid_to_secctx, list) {
 =09=09if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >=3D lsm_slot))
 =09=09=09continue;
-=09=09if (display =3D=3D LSMBLOB_INVALID || display =3D=3D hp->lsmid->slot=
)
+=09=09if (display =3D=3D LSMBLOB_INVALID || display =3D=3D hp->lsmid->slot=
) {
+=09=09=09cp->slot =3D hp->lsmid->slot;
 =09=09=09return hp->hook.secid_to_secctx(
 =09=09=09=09=09blob->secid[hp->lsmid->slot],
-=09=09=09=09=09secdata, seclen);
+=09=09=09=09=09&cp->context, &cp->len);
+=09=09}
 =09}
 =09return 0;
 }
--=20
2.20.1


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

