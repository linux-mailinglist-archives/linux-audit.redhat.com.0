Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id C5239102B54
	for <lists+linux-audit@lfdr.de>; Tue, 19 Nov 2019 19:03:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574186633;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rX+iWpI7MT42a9225aN+73UUH2DaUv6CE6VQFl26rPA=;
	b=OsA2/Ryzyz2IftkSGoI+0wybU58bc4QFu/cHAWawZkKjSCz9qyoCBI0tQ7Ftoejz1prt3f
	SGs7NXwtzk1aezk/Fu/9EVBMBdSz9ZiPY963ASNbpWYkBgao4GDTxg/eTIZTCjHXYzWhir
	wgE7kkJRxhIblS269GFGws05xnu+VYg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-xu_g--ecNY25tURBCVTBuw-1; Tue, 19 Nov 2019 13:03:51 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E188B801FA1;
	Tue, 19 Nov 2019 18:03:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE7C35E254;
	Tue, 19 Nov 2019 18:03:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 750874A460;
	Tue, 19 Nov 2019 18:03:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAJI3Ul7001042 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 19 Nov 2019 13:03:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 73D7F2064003; Tue, 19 Nov 2019 18:03:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F5312014DFA
	for <linux-audit@redhat.com>; Tue, 19 Nov 2019 18:03:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3CD6A800147
	for <linux-audit@redhat.com>; Tue, 19 Nov 2019 18:03:28 +0000 (UTC)
X-YMail-OSG: XqsMSi0VM1nmZqdbdS35.moUscxPROmT9awsiriZdk6GoloOQdGsm3BlwxmmMJZ
	hD1lC0XInSyPlIcYikj7mOeaf_FEoFPSzHzUquPR8NEZGBGdlfaKt2UBgsUGXeGn7eMiLU0S1OdE
	5n14xExwUg6e4Ik6B1iYPcfzf_D97RYZ1lpwja_8nHv32OcGkVBwOlS0RlBTPzIf1V54yN6GtTj7
	.4WWmTECxYhXy43YQ3H_rpD9B1DFkg8_zeh20ZaB3CUkvXJ8h0ii_OAdLEvitNCvcSF6Bka79ZZO
	eKGCHlv0hXwaW6.IZdpH8yRMe7zFpdLJah.IOLksuwR3JTsvsOZoJmDruwD5Sn.M6MmQXCSN.v5Q
	Q3ETJX_2dzL.zsJGC4kb0PJWIjy7g4S19EERHAGxcLrPOQjf1UQPzX2U71.7MzO_21peAe3nFQUx
	a.UedDlozw_IeQ31kzcBLyecsFPUAz2Yxls7MPTt.6kUZPieHqQHyxk48oBob9s7eQ6WtEK5xmUs
	MCUbrfJJwsJ2Y3J0sfzJoTFU94.bPpv6Tog3c7Y88tz1V4KZ5HijKN7pxb2bOAMUG5euYaVIOBfv
	EyLZ7BwmtI0q.yEnQxCac1.EcfCvr9gEsSOHndTnJtn_GoPeOmQvHeRqUknl5paa3_I55wXqqlVN
	Ea5ZMhXTod_KJx73p7xyf0o5yHFE1y5iYEHp.jF8VuFeRkmun.Cu1PZPcKx101zkAm_R2St0T2YS
	3UfGNuHJDvCE.SZ9gdbhJu5UWRJuZuleSs9aPADab9PufVFfziFeBokgiuU_04SYjqyBoICxs.My
	IvL_XMIxQELKmpVCKSDDnxNG2.d8NxsSxwtoibJmjQjpQJl8QkHQq09BeW.9lhqmcZN03vAhqN_3
	KJaLnO2Z9co_v7T3GqwTi7lp3zeYNkTTvO_iNS4_CKfQrfEKZYreFyS0KRXcnNKa4kzQr2Q4V3lT
	Lqxam4w9176h0IK_e0cnNB..iJ.mC.wYpeR3kEn2IqX_F3PUQPjOXqPx0WfiAdE6ysC1GlKeC2_3
	NIviMY73adoaBiKS.AnhB_3TDTnr1ajQJy8Q61YHVP1qHHSK0TD4mXZgjcERBsyQ6Zt6OM93oKYc
	cbJ3SDjeU3A3ztCT7D8p_ksYTHDUqW6N.ho9wle2SYbRA2.BTEESyYjQ69kFCGoo49zvrNO_nMaD
	VcGDuXt_6PszAgDENyqRGWPNrFERjj1s4PB5PKAV50rA5mLEsZN.gXqbcxqI4exLvT_U4iXGTRsG
	AIMrGEcj6rNgua4yWhhBS9NbEaOJf43cgHQ7zyK0ki8kkkPmWy2QHTwWAHqvRECjDmawlO.tSTh0
	S8QDXG7HJmvHjQ0WY1lYNLnBH7vs8qvfJSdJq5WM8hAjMvJZ3pdY3zvprtX_mC25jXj12n79ShfH
	yggJhSeSzk1SfUTskgcT45owcnNwVUok8kK92pw--
Received: from sonic306-27.consmr.mail.ne1.yahoo.com
	(sonic306-27.consmr.mail.ne1.yahoo.com [66.163.189.89]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-223-7EpTb3JnPEWBFTL0OgdSyA-1;
	Tue, 19 Nov 2019 13:03:26 -0500
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic306.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 19 Nov 2019 18:03:25 +0000
Received: by smtp411.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 5c625e7366fd4c784e1de9eefb8a42af; 
	Tue, 19 Nov 2019 18:03:19 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: linux-audit@redhat.com
Subject: [PATCH v11 07/25] LSM: Use lsmblob in security_secid_to_secctx
Date: Tue, 19 Nov 2019 10:03:06 -0800
Message-Id: <20191119180315.12254-3-casey@schaufler-ca.com>
In-Reply-To: <20191119180315.12254-1-casey@schaufler-ca.com>
References: <20191119180315.12254-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-MC-Unique: 7EpTb3JnPEWBFTL0OgdSyA-1
X-MC-Unique: xu_g--ecNY25tURBCVTBuw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAJI3Ul7001042
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

Change security_secid_to_secctx() to take a lsmblob as input
instead of a u32 secid. It will then call the LSM hooks
using the lsmblob element allocated for that module. The
callers have been updated as well. This allows for the
possibility that more than one module may be called upon
to translate a secid to a string, as can occur in the
audit code.

Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: John Johansen <john.johansen@canonical.com>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
cc: netdev@vger.kernel.org
---
 drivers/android/binder.c                |  4 +++-
 include/linux/security.h                |  5 +++--
 include/net/scm.h                       |  5 ++---
 kernel/audit.c                          |  9 +++++++--
 kernel/auditsc.c                        | 14 ++++++++++----
 net/ipv4/ip_sockglue.c                  |  3 +--
 net/netfilter/nf_conntrack_netlink.c    |  8 ++++++--
 net/netfilter/nf_conntrack_standalone.c |  4 +++-
 net/netfilter/nfnetlink_queue.c         |  8 ++++++--
 net/netlabel/netlabel_unlabeled.c       | 18 ++++++++++++++----
 net/netlabel/netlabel_user.c            |  6 +++---
 security/security.c                     | 16 +++++++++++++---
 12 files changed, 71 insertions(+), 29 deletions(-)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 265d9dd46a5e..5f4702b4c507 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -3109,10 +3109,12 @@ static void binder_transaction(struct binder_proc *=
proc,
=20
 =09if (target_node && target_node->txn_security_ctx) {
 =09=09u32 secid;
+=09=09struct lsmblob blob;
 =09=09size_t added_size;
=20
 =09=09security_task_getsecid(proc->tsk, &secid);
-=09=09ret =3D security_secid_to_secctx(secid, &secctx, &secctx_sz);
+=09=09lsmblob_init(&blob, secid);
+=09=09ret =3D security_secid_to_secctx(&blob, &secctx, &secctx_sz);
 =09=09if (ret) {
 =09=09=09return_error =3D BR_FAILED_REPLY;
 =09=09=09return_error_param =3D ret;
diff --git a/include/linux/security.h b/include/linux/security.h
index b69877a13efa..a3e99bccb1bb 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -493,7 +493,7 @@ int security_setprocattr(const char *lsm, const char *n=
ame, void *value,
 =09=09=09 size_t size);
 int security_netlink_send(struct sock *sk, struct sk_buff *skb);
 int security_ismaclabel(const char *name);
-int security_secid_to_secctx(u32 secid, char **secdata, u32 *seclen);
+int security_secid_to_secctx(struct lsmblob *blob, char **secdata, u32 *se=
clen);
 int security_secctx_to_secid(const char *secdata, u32 seclen,
 =09=09=09     struct lsmblob *blob);
 void security_release_secctx(char *secdata, u32 seclen);
@@ -1294,7 +1294,8 @@ static inline int security_ismaclabel(const char *nam=
e)
 =09return 0;
 }
=20
-static inline int security_secid_to_secctx(u32 secid, char **secdata, u32 =
*seclen)
+static inline int security_secid_to_secctx(struct lsmblob *blob,
+=09=09=09=09=09   char **secdata, u32 *seclen)
 {
 =09return -EOPNOTSUPP;
 }
diff --git a/include/net/scm.h b/include/net/scm.h
index e2e71c4bf9d0..31ae605fcc0a 100644
--- a/include/net/scm.h
+++ b/include/net/scm.h
@@ -97,9 +97,8 @@ static inline void scm_passec(struct socket *sock, struct=
 msghdr *msg, struct sc
 =09int err;
=20
 =09if (test_bit(SOCK_PASSSEC, &sock->flags)) {
-=09=09/* Scaffolding - it has to be element 0 for now */
-=09=09err =3D security_secid_to_secctx(scm->lsmblob.secid[0],
-=09=09=09=09=09       &secdata, &seclen);
+=09=09err =3D security_secid_to_secctx(&scm->lsmblob, &secdata,
+=09=09=09=09=09       &seclen);
=20
 =09=09if (!err) {
 =09=09=09put_cmsg(msg, SOL_SOCKET, SCM_SECURITY, seclen, secdata);
diff --git a/kernel/audit.c b/kernel/audit.c
index da8dc0db5bd3..2f8e89eaf3e5 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -1417,7 +1417,10 @@ static int audit_receive_msg(struct sk_buff *skb, st=
ruct nlmsghdr *nlh)
 =09case AUDIT_SIGNAL_INFO:
 =09=09len =3D 0;
 =09=09if (audit_sig_sid) {
-=09=09=09err =3D security_secid_to_secctx(audit_sig_sid, &ctx, &len);
+=09=09=09struct lsmblob blob;
+
+=09=09=09lsmblob_init(&blob, audit_sig_sid);
+=09=09=09err =3D security_secid_to_secctx(&blob, &ctx, &len);
 =09=09=09if (err)
 =09=09=09=09return err;
 =09=09}
@@ -2060,12 +2063,14 @@ int audit_log_task_context(struct audit_buffer *ab)
 =09unsigned len;
 =09int error;
 =09u32 sid;
+=09struct lsmblob blob;
=20
 =09security_task_getsecid(current, &sid);
 =09if (!sid)
 =09=09return 0;
=20
-=09error =3D security_secid_to_secctx(sid, &ctx, &len);
+=09lsmblob_init(&blob, sid);
+=09error =3D security_secid_to_secctx(&blob, &ctx, &len);
 =09if (error) {
 =09=09if (error !=3D -EINVAL)
 =09=09=09goto error_path;
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 7566e5b1c419..04803c3099b2 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -966,6 +966,7 @@ static int audit_log_pid_context(struct audit_context *=
context, pid_t pid,
 =09char *ctx =3D NULL;
 =09u32 len;
 =09int rc =3D 0;
+=09struct lsmblob blob;
=20
 =09ab =3D audit_log_start(context, GFP_KERNEL, AUDIT_OBJ_PID);
 =09if (!ab)
@@ -975,7 +976,8 @@ static int audit_log_pid_context(struct audit_context *=
context, pid_t pid,
 =09=09=09 from_kuid(&init_user_ns, auid),
 =09=09=09 from_kuid(&init_user_ns, uid), sessionid);
 =09if (sid) {
-=09=09if (security_secid_to_secctx(sid, &ctx, &len)) {
+=09=09lsmblob_init(&blob, sid);
+=09=09if (security_secid_to_secctx(&blob, &ctx, &len)) {
 =09=09=09audit_log_format(ab, " obj=3D(none)");
 =09=09=09rc =3D 1;
 =09=09} else {
@@ -1218,7 +1220,10 @@ static void show_special(struct audit_context *conte=
xt, int *call_panic)
 =09=09if (osid) {
 =09=09=09char *ctx =3D NULL;
 =09=09=09u32 len;
-=09=09=09if (security_secid_to_secctx(osid, &ctx, &len)) {
+=09=09=09struct lsmblob blob;
+
+=09=09=09lsmblob_init(&blob, osid);
+=09=09=09if (security_secid_to_secctx(&blob, &ctx, &len)) {
 =09=09=09=09audit_log_format(ab, " osid=3D%u", osid);
 =09=09=09=09*call_panic =3D 1;
 =09=09=09} else {
@@ -1368,9 +1373,10 @@ static void audit_log_name(struct audit_context *con=
text, struct audit_names *n,
 =09if (n->osid !=3D 0) {
 =09=09char *ctx =3D NULL;
 =09=09u32 len;
+=09=09struct lsmblob blob;
=20
-=09=09if (security_secid_to_secctx(
-=09=09=09n->osid, &ctx, &len)) {
+=09=09lsmblob_init(&blob, n->osid);
+=09=09if (security_secid_to_secctx(&blob, &ctx, &len)) {
 =09=09=09audit_log_format(ab, " osid=3D%u", n->osid);
 =09=09=09if (call_panic)
 =09=09=09=09*call_panic =3D 2;
diff --git a/net/ipv4/ip_sockglue.c b/net/ipv4/ip_sockglue.c
index 6cf57d5ac899..1ca97d0cb4a9 100644
--- a/net/ipv4/ip_sockglue.c
+++ b/net/ipv4/ip_sockglue.c
@@ -139,8 +139,7 @@ static void ip_cmsg_recv_security(struct msghdr *msg, s=
truct sk_buff *skb)
 =09if (err)
 =09=09return;
=20
-=09/* Scaffolding - it has to be element 0 */
-=09err =3D security_secid_to_secctx(lb.secid[0], &secdata, &seclen);
+=09err =3D security_secid_to_secctx(&lb, &secdata, &seclen);
 =09if (err)
 =09=09return;
=20
diff --git a/net/netfilter/nf_conntrack_netlink.c b/net/netfilter/nf_conntr=
ack_netlink.c
index e2d13cd18875..0412f6744185 100644
--- a/net/netfilter/nf_conntrack_netlink.c
+++ b/net/netfilter/nf_conntrack_netlink.c
@@ -331,8 +331,10 @@ static int ctnetlink_dump_secctx(struct sk_buff *skb, =
const struct nf_conn *ct)
 =09struct nlattr *nest_secctx;
 =09int len, ret;
 =09char *secctx;
+=09struct lsmblob blob;
=20
-=09ret =3D security_secid_to_secctx(ct->secmark, &secctx, &len);
+=09lsmblob_init(&blob, ct->secmark);
+=09ret =3D security_secid_to_secctx(&blob, &secctx, &len);
 =09if (ret)
 =09=09return 0;
=20
@@ -621,8 +623,10 @@ static inline int ctnetlink_secctx_size(const struct n=
f_conn *ct)
 {
 #ifdef CONFIG_NF_CONNTRACK_SECMARK
 =09int len, ret;
+=09struct lsmblob blob;
=20
-=09ret =3D security_secid_to_secctx(ct->secmark, NULL, &len);
+=09lsmblob_init(&blob, ct->secmark);
+=09ret =3D security_secid_to_secctx(&blob, NULL, &len);
 =09if (ret)
 =09=09return 0;
=20
diff --git a/net/netfilter/nf_conntrack_standalone.c b/net/netfilter/nf_con=
ntrack_standalone.c
index 410809c669e1..183a85412155 100644
--- a/net/netfilter/nf_conntrack_standalone.c
+++ b/net/netfilter/nf_conntrack_standalone.c
@@ -175,8 +175,10 @@ static void ct_show_secctx(struct seq_file *s, const s=
truct nf_conn *ct)
 =09int ret;
 =09u32 len;
 =09char *secctx;
+=09struct lsmblob blob;
=20
-=09ret =3D security_secid_to_secctx(ct->secmark, &secctx, &len);
+=09lsmblob_init(&blob, ct->secmark);
+=09ret =3D security_secid_to_secctx(&blob, &secctx, &len);
 =09if (ret)
 =09=09return;
=20
diff --git a/net/netfilter/nfnetlink_queue.c b/net/netfilter/nfnetlink_queu=
e.c
index feabdfb22920..bfa7f12fde99 100644
--- a/net/netfilter/nfnetlink_queue.c
+++ b/net/netfilter/nfnetlink_queue.c
@@ -305,13 +305,17 @@ static u32 nfqnl_get_sk_secctx(struct sk_buff *skb, c=
har **secdata)
 {
 =09u32 seclen =3D 0;
 #if IS_ENABLED(CONFIG_NETWORK_SECMARK)
+=09struct lsmblob blob;
+
 =09if (!skb || !sk_fullsock(skb->sk))
 =09=09return 0;
=20
 =09read_lock_bh(&skb->sk->sk_callback_lock);
=20
-=09if (skb->secmark)
-=09=09security_secid_to_secctx(skb->secmark, secdata, &seclen);
+=09if (skb->secmark) {
+=09=09lsmblob_init(&blob, skb->secmark);
+=09=09security_secid_to_secctx(&blob, secdata, &seclen);
+=09}
=20
 =09read_unlock_bh(&skb->sk->sk_callback_lock);
 #endif
diff --git a/net/netlabel/netlabel_unlabeled.c b/net/netlabel/netlabel_unla=
beled.c
index 7a5a87f15736..0cda17cb44a0 100644
--- a/net/netlabel/netlabel_unlabeled.c
+++ b/net/netlabel/netlabel_unlabeled.c
@@ -375,6 +375,7 @@ int netlbl_unlhsh_add(struct net *net,
 =09struct audit_buffer *audit_buf =3D NULL;
 =09char *secctx =3D NULL;
 =09u32 secctx_len;
+=09struct lsmblob blob;
=20
 =09if (addr_len !=3D sizeof(struct in_addr) &&
 =09    addr_len !=3D sizeof(struct in6_addr))
@@ -437,7 +438,8 @@ int netlbl_unlhsh_add(struct net *net,
 unlhsh_add_return:
 =09rcu_read_unlock();
 =09if (audit_buf !=3D NULL) {
-=09=09if (security_secid_to_secctx(secid,
+=09=09lsmblob_init(&blob, secid);
+=09=09if (security_secid_to_secctx(&blob,
 =09=09=09=09=09     &secctx,
 =09=09=09=09=09     &secctx_len) =3D=3D 0) {
 =09=09=09audit_log_format(audit_buf, " sec_obj=3D%s", secctx);
@@ -474,6 +476,7 @@ static int netlbl_unlhsh_remove_addr4(struct net *net,
 =09struct net_device *dev;
 =09char *secctx;
 =09u32 secctx_len;
+=09struct lsmblob blob;
=20
 =09spin_lock(&netlbl_unlhsh_lock);
 =09list_entry =3D netlbl_af4list_remove(addr->s_addr, mask->s_addr,
@@ -493,8 +496,10 @@ static int netlbl_unlhsh_remove_addr4(struct net *net,
 =09=09=09=09=09  addr->s_addr, mask->s_addr);
 =09=09if (dev !=3D NULL)
 =09=09=09dev_put(dev);
+=09=09if (entry !=3D NULL)
+=09=09=09lsmblob_init(&blob, entry->secid);
 =09=09if (entry !=3D NULL &&
-=09=09    security_secid_to_secctx(entry->secid,
+=09=09    security_secid_to_secctx(&blob,
 =09=09=09=09=09     &secctx, &secctx_len) =3D=3D 0) {
 =09=09=09audit_log_format(audit_buf, " sec_obj=3D%s", secctx);
 =09=09=09security_release_secctx(secctx, secctx_len);
@@ -536,6 +541,7 @@ static int netlbl_unlhsh_remove_addr6(struct net *net,
 =09struct net_device *dev;
 =09char *secctx;
 =09u32 secctx_len;
+=09struct lsmblob blob;
=20
 =09spin_lock(&netlbl_unlhsh_lock);
 =09list_entry =3D netlbl_af6list_remove(addr, mask, &iface->addr6_list);
@@ -554,8 +560,10 @@ static int netlbl_unlhsh_remove_addr6(struct net *net,
 =09=09=09=09=09  addr, mask);
 =09=09if (dev !=3D NULL)
 =09=09=09dev_put(dev);
+=09=09if (entry !=3D NULL)
+=09=09=09lsmblob_init(&blob, entry->secid);
 =09=09if (entry !=3D NULL &&
-=09=09    security_secid_to_secctx(entry->secid,
+=09=09    security_secid_to_secctx(&blob,
 =09=09=09=09=09     &secctx, &secctx_len) =3D=3D 0) {
 =09=09=09audit_log_format(audit_buf, " sec_obj=3D%s", secctx);
 =09=09=09security_release_secctx(secctx, secctx_len);
@@ -1076,6 +1084,7 @@ static int netlbl_unlabel_staticlist_gen(u32 cmd,
 =09u32 secid;
 =09char *secctx;
 =09u32 secctx_len;
+=09struct lsmblob blob;
=20
 =09data =3D genlmsg_put(cb_arg->skb, NETLINK_CB(cb_arg->nl_cb->skb).portid=
,
 =09=09=09   cb_arg->seq, &netlbl_unlabel_gnl_family,
@@ -1130,7 +1139,8 @@ static int netlbl_unlabel_staticlist_gen(u32 cmd,
 =09=09secid =3D addr6->secid;
 =09}
=20
-=09ret_val =3D security_secid_to_secctx(secid, &secctx, &secctx_len);
+=09lsmblob_init(&blob, secid);
+=09ret_val =3D security_secid_to_secctx(&blob, &secctx, &secctx_len);
 =09if (ret_val !=3D 0)
 =09=09goto list_cb_failure;
 =09ret_val =3D nla_put(cb_arg->skb,
diff --git a/net/netlabel/netlabel_user.c b/net/netlabel/netlabel_user.c
index 3ed4fea2a2de..893301ae0131 100644
--- a/net/netlabel/netlabel_user.c
+++ b/net/netlabel/netlabel_user.c
@@ -86,6 +86,7 @@ struct audit_buffer *netlbl_audit_start_common(int type,
 =09struct audit_buffer *audit_buf;
 =09char *secctx;
 =09u32 secctx_len;
+=09struct lsmblob blob;
=20
 =09if (audit_enabled =3D=3D AUDIT_OFF)
 =09=09return NULL;
@@ -98,10 +99,9 @@ struct audit_buffer *netlbl_audit_start_common(int type,
 =09=09=09 from_kuid(&init_user_ns, audit_info->loginuid),
 =09=09=09 audit_info->sessionid);
=20
+=09lsmblob_init(&blob, audit_info->secid);
 =09if (audit_info->secid !=3D 0 &&
-=09    security_secid_to_secctx(audit_info->secid,
-=09=09=09=09     &secctx,
-=09=09=09=09     &secctx_len) =3D=3D 0) {
+=09    security_secid_to_secctx(&blob, &secctx, &secctx_len) =3D=3D 0) {
 =09=09audit_log_format(audit_buf, " subj=3D%s", secctx);
 =09=09security_release_secctx(secctx, secctx_len);
 =09}
diff --git a/security/security.c b/security/security.c
index 32bb5383de9b..0fc75a31a6bb 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1963,10 +1963,20 @@ int security_ismaclabel(const char *name)
 }
 EXPORT_SYMBOL(security_ismaclabel);
=20
-int security_secid_to_secctx(u32 secid, char **secdata, u32 *seclen)
+int security_secid_to_secctx(struct lsmblob *blob, char **secdata, u32 *se=
clen)
 {
-=09return call_int_hook(secid_to_secctx, -EOPNOTSUPP, secid, secdata,
-=09=09=09=09seclen);
+=09struct security_hook_list *hp;
+=09int rc;
+
+=09hlist_for_each_entry(hp, &security_hook_heads.secid_to_secctx, list) {
+=09=09if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >=3D lsm_slot))
+=09=09=09continue;
+=09=09rc =3D hp->hook.secid_to_secctx(blob->secid[hp->lsmid->slot],
+=09=09=09=09=09      secdata, seclen);
+=09=09if (rc !=3D 0)
+=09=09=09return rc;
+=09}
+=09return 0;
 }
 EXPORT_SYMBOL(security_secid_to_secctx);
=20
--=20
2.20.1


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

