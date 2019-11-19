Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id AEE7F102B63
	for <lists+linux-audit@lfdr.de>; Tue, 19 Nov 2019 19:04:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574186663;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dF+Yp/sk86mKcxyQJXklRPUZVrOvcBh9b4/XIyj5V+A=;
	b=gv1SzFXWO92bM8lhCqmZhrdDJMVa0t41dyP2ENxGhjTYiIYfCxgsdtmNhPtIoS4pUYcPAb
	pHWSL0jdyj+aFoprCxgnFG/U1BTYk+H1QPvb3P9ACFyABYBxsOLKn2jFLqunjOa8uBVmi9
	87AdXMZ1Hhg06VHeiLuizR67Q/5eo7U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-9b-dJnuiMl-VFFMU48XL-A-1; Tue, 19 Nov 2019 13:04:20 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FE4E1883524;
	Tue, 19 Nov 2019 18:04:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DCEDC60467;
	Tue, 19 Nov 2019 18:04:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9DE7118089C8;
	Tue, 19 Nov 2019 18:04:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAJI4Aq5001230 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 19 Nov 2019 13:04:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2D6C82064003; Tue, 19 Nov 2019 18:04:10 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 28D9D2064004
	for <linux-audit@redhat.com>; Tue, 19 Nov 2019 18:04:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0681185A79C
	for <linux-audit@redhat.com>; Tue, 19 Nov 2019 18:04:09 +0000 (UTC)
X-YMail-OSG: m7e_w5EVM1nrq0wWSMsWjnjoGuLbSqGsw74DH_aunuhlXXloNoGRMvgoNgFBEtw
	9yIWCrX3WtyG6agdy0i7Q2QbrCG4iKrmNQa0qenX.ubDuGU0vaUyVIhdkcs9d38a2UnikcmiG4zS
	VtRT.SaZjpdQGzynu.BwSBpXCQKSs3.dr9mimR0hgP39FgeWDOpemPWxwOuNGwLiY1635QTeqJbV
	Hi4wrnhBWsBww46crvyGx4AGC5B3.cOmdQEqDF_I1i3VQfsWFGtrwnbKZL1ec6zsmhtWSbOJU6B0
	p0YtyoWvRISWSrvfvYY1_w.I1X_u6f_LT8U3pch9vvFerxPY8IblA4WC8Mfl3jnSIJDPbrD6D4or
	4H2bk.HhRcRyCkuhnPcoudmfEVeUKuhKOkYR1uvqAJd1H6D_8nmz4oqO7e30K5K50K1nQN5uZC4B
	jAkdV2ydd.nTrjjM5awvdXymflE_LrYCzvVXcGhzttZnKJ6PLV6Vrl0FBNHeepj84HzTvZ89g7iv
	09KYTD6Zfg97Z2ei9Rq2NsAuReUZdZ55Ptrn_54KrWSzCP4tsyPwrNZdw_60F4G5ln0F6eZzi04I
	Ay9H2Alv9UBBI0W7lJ4ZtmScICMy29eZJTL9tMazRiJsUCXnDZnEQbueTnnnLpOUkzrm1xYIDKwf
	TiMM49K7LUUFrlt2C27nygd3LOcFEz5jqZxLA1.izXb0qcaK37lWmxq4DRzqk6L472xNpbyoJ_6Y
	2gVW1VRhf64XOxZjKkXCH2xrLF5rZAk9UkPOSN7Zu26gz1T4jhXSuvUPucECD4GRWpSLp5HdXsK4
	aAoLWiJU6iRy4kmZLrJivSmpCecTdgMN1Ah_9n49zScIjq1XusL256rWpJ30ZaUGV2BvTE7h49iK
	kQEigBN4ZaikaHIzx5GnB9.87ouwAojfIiz2mHitkDSLfqw1toLqn2G_BOkglumJA7Hi7GKQ0oYy
	E0YNwE93i87J.wY2kwPyba3iHbIzCe4Oh8ZsYjmxJYdh6lEtNzSV9_EVPCKJZIi2yD_n4idWaUI.
	u4i1d4Pgo5Ta_PTqGJ66wI_Dv44CjDnRxzcC6UZTUbNxKMWp7Wkb1jNFRSYsd9uAG.vWWKv5EdIj
	YrgXMaK26iAWU9saziOQlBYcvaI4Hxq9RhHInM0b0VzM30sMRFsWbJiseMr_89v9m7HfShuoV7D9
	96A5IwuoQBv7YGKIOgGqNKORy3dLXP34620QDw3UdWsD5RqQxrmCXlZZK0Ohk6IiK1hbsd.ALugI
	WYCEvkKAvyqJKzhxrfaa22IVTUaHQAu17_CZgzbfXoXWEl7stYcC_HwAkl1BlkP9zOdzmljpM_v4
	YVA6tn6wxJ7p0ypRDzQZWe_BeB.Qgt4VIueBKzGlGN6bUmszi0yLFAT5deuX2BLL7TLQOQ7s22YK
	SiHSKYoag1kyotwBlVGtXC9FFOl5E9mmdUmqX9A--
Received: from sonic306-27.consmr.mail.ne1.yahoo.com
	(sonic306-27.consmr.mail.ne1.yahoo.com [66.163.189.89]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-293-dGe4g-iYORiU292ZVpDwng-1;
	Tue, 19 Nov 2019 13:04:07 -0500
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic306.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 19 Nov 2019 18:04:05 +0000
Received: by smtp405.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID cbade386d4ed07348d4fb8056a0439b3; 
	Tue, 19 Nov 2019 18:04:03 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: linux-audit@redhat.com
Subject: [PATCH v11 21/25] Audit: Add subj_LSM fields when necessary
Date: Tue, 19 Nov 2019 10:03:13 -0800
Message-Id: <20191119180315.12254-10-casey@schaufler-ca.com>
In-Reply-To: <20191119180315.12254-1-casey@schaufler-ca.com>
References: <20191119180315.12254-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-MC-Unique: dGe4g-iYORiU292ZVpDwng-1
X-MC-Unique: 9b-dJnuiMl-VFFMU48XL-A-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAJI4Aq5001230
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Add record entries to identify subject data for all of the
security modules when there is more than one.

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
cc: netdev@vger.kernel.com
---
 drivers/android/binder.c                |  2 +-
 include/linux/audit.h                   |  1 +
 include/linux/security.h                |  9 ++++-
 include/net/scm.h                       |  3 +-
 kernel/audit.c                          | 40 ++++++++++++++++++-
 kernel/audit_fsnotify.c                 |  1 +
 kernel/auditfilter.c                    |  1 +
 kernel/auditsc.c                        | 10 +++--
 net/ipv4/ip_sockglue.c                  |  2 +-
 net/netfilter/nf_conntrack_netlink.c    |  4 +-
 net/netfilter/nf_conntrack_standalone.c |  2 +-
 net/netfilter/nfnetlink_queue.c         |  2 +-
 net/netlabel/netlabel_unlabeled.c       | 11 ++++--
 net/netlabel/netlabel_user.c            |  2 +-
 net/xfrm/xfrm_policy.c                  |  2 +
 net/xfrm/xfrm_state.c                   |  2 +
 security/integrity/ima/ima_api.c        |  1 +
 security/integrity/integrity_audit.c    |  1 +
 security/security.c                     | 51 +++++++++++++++++++++++--
 19 files changed, 124 insertions(+), 23 deletions(-)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index cc81d0f540fd..0ca841ce2de9 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -3111,7 +3111,7 @@ static void binder_transaction(struct binder_proc *pr=
oc,
 =09=09size_t added_size;
=20
 =09=09security_task_getsecid(proc->tsk, &blob);
-=09=09ret =3D security_secid_to_secctx(&blob, &lsmctx);
+=09=09ret =3D security_secid_to_secctx(&blob, &lsmctx, LSMBLOB_DISPLAY);
 =09=09if (ret) {
 =09=09=09return_error =3D BR_FAILED_REPLY;
 =09=09=09return_error_param =3D ret;
diff --git a/include/linux/audit.h b/include/linux/audit.h
index aee3dc9eb378..950d2d141cde 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -160,6 +160,7 @@ extern void=09=09    audit_log_link_denied(const char *=
operation);
 extern void=09=09    audit_log_lost(const char *message);
=20
 extern int audit_log_task_context(struct audit_buffer *ab);
+extern void audit_log_task_lsms(struct audit_buffer *ab);
 extern void audit_log_task_info(struct audit_buffer *ab);
=20
 extern int=09=09    audit_update_lsm_rules(void);
diff --git a/include/linux/security.h b/include/linux/security.h
index 5da16f97f2be..79f5177a6b52 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -178,6 +178,8 @@ struct lsmblob {
 #define LSMBLOB_INVALID=09=09-1=09/* Not a valid LSM slot number */
 #define LSMBLOB_NEEDED=09=09-2=09/* Slot requested on initialization */
 #define LSMBLOB_NOT_NEEDED=09-3=09/* Slot not requested */
+#define LSMBLOB_DISPLAY=09=09-4=09/* Use the "display" slot */
+#define LSMBLOB_FIRST=09=09-5=09/* Use the default "display" slot */
=20
 /**
  * lsmblob_init - initialize an lsmblob structure.
@@ -219,6 +221,8 @@ static inline bool lsmblob_equal(struct lsmblob *bloba,=
 struct lsmblob *blobb)
 =09return !memcmp(bloba, blobb, sizeof(*bloba));
 }
=20
+const char *security_lsm_slot_name(int slot);
+
 /* These functions are in security/commoncap.c */
 extern int cap_capable(const struct cred *cred, struct user_namespace *ns,
 =09=09       int cap, unsigned int opts);
@@ -528,7 +532,8 @@ int security_setprocattr(const char *lsm, const char *n=
ame, void *value,
 =09=09=09 size_t size);
 int security_netlink_send(struct sock *sk, struct sk_buff *skb);
 int security_ismaclabel(const char *name);
-int security_secid_to_secctx(struct lsmblob *blob, struct lsmcontext *cp);
+int security_secid_to_secctx(struct lsmblob *blob, struct lsmcontext *cp,
+=09=09=09     int display);
 int security_secctx_to_secid(const char *secdata, u32 seclen,
 =09=09=09     struct lsmblob *blob);
 void security_release_secctx(struct lsmcontext *cp);
@@ -1332,7 +1337,7 @@ static inline int security_ismaclabel(const char *nam=
e)
 }
=20
 static inline int security_secid_to_secctx(struct lsmblob *blob,
-=09=09=09=09=09   struct lsmcontext *cp)
+=09=09=09=09=09   struct lsmcontext *cp, int display)
 {
 =09return -EOPNOTSUPP;
 }
diff --git a/include/net/scm.h b/include/net/scm.h
index 4a6ad8caf423..8b5a4737e1b8 100644
--- a/include/net/scm.h
+++ b/include/net/scm.h
@@ -96,7 +96,8 @@ static inline void scm_passec(struct socket *sock, struct=
 msghdr *msg, struct sc
 =09int err;
=20
 =09if (test_bit(SOCK_PASSSEC, &sock->flags)) {
-=09=09err =3D security_secid_to_secctx(&scm->lsmblob, &context);
+=09=09err =3D security_secid_to_secctx(&scm->lsmblob, &context,
+=09=09=09=09=09       LSMBLOB_DISPLAY);
=20
 =09=09if (!err) {
 =09=09=09put_cmsg(msg, SOL_SOCKET, SCM_SECURITY,
diff --git a/kernel/audit.c b/kernel/audit.c
index cd0024c89807..77e5d54a3e30 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -392,6 +392,7 @@ static int audit_log_config_change(char *function_name,=
 u32 new, u32 old,
 =09if (rc)
 =09=09allow_changes =3D 0; /* Something weird, deny request */
 =09audit_log_format(ab, " res=3D%d", allow_changes);
+=09audit_log_task_lsms(ab);
 =09audit_log_end(ab);
 =09return rc;
 }
@@ -1097,6 +1098,7 @@ static void audit_log_feature_change(int which, u32 o=
ld_feature, u32 new_feature
 =09audit_log_format(ab, " feature=3D%s old=3D%u new=3D%u old_lock=3D%u new=
_lock=3D%u res=3D%d",
 =09=09=09 audit_feature_names[which], !!old_feature, !!new_feature,
 =09=09=09 !!old_lock, !!new_lock, res);
+=09audit_log_task_lsms(ab);
 =09audit_log_end(ab);
 }
=20
@@ -1347,6 +1349,7 @@ static int audit_receive_msg(struct sk_buff *skb, str=
uct nlmsghdr *nlh)
 =09=09=09=09=09size--;
 =09=09=09=09audit_log_n_untrustedstring(ab, data, size);
 =09=09=09}
+=09=09=09audit_log_task_lsms(ab);
 =09=09=09audit_log_end(ab);
 =09=09}
 =09=09break;
@@ -1361,6 +1364,7 @@ static int audit_receive_msg(struct sk_buff *skb, str=
uct nlmsghdr *nlh)
 =09=09=09=09=09 msg_type =3D=3D AUDIT_ADD_RULE ?
 =09=09=09=09=09=09"add_rule" : "remove_rule",
 =09=09=09=09=09 audit_enabled);
+=09=09=09audit_log_task_lsms(ab);
 =09=09=09audit_log_end(ab);
 =09=09=09return -EPERM;
 =09=09}
@@ -1374,6 +1378,7 @@ static int audit_receive_msg(struct sk_buff *skb, str=
uct nlmsghdr *nlh)
 =09=09audit_log_common_recv_msg(audit_context(), &ab,
 =09=09=09=09=09  AUDIT_CONFIG_CHANGE);
 =09=09audit_log_format(ab, " op=3Dtrim res=3D1");
+=09=09audit_log_task_lsms(ab);
 =09=09audit_log_end(ab);
 =09=09break;
 =09case AUDIT_MAKE_EQUIV: {
@@ -1409,6 +1414,7 @@ static int audit_receive_msg(struct sk_buff *skb, str=
uct nlmsghdr *nlh)
 =09=09audit_log_format(ab, " new=3D");
 =09=09audit_log_untrustedstring(ab, new);
 =09=09audit_log_format(ab, " res=3D%d", !err);
+=09=09audit_log_task_lsms(ab);
 =09=09audit_log_end(ab);
 =09=09kfree(old);
 =09=09kfree(new);
@@ -1418,7 +1424,7 @@ static int audit_receive_msg(struct sk_buff *skb, str=
uct nlmsghdr *nlh)
 =09=09len =3D 0;
 =09=09if (lsmblob_is_set(&audit_sig_lsm)) {
 =09=09=09err =3D security_secid_to_secctx(&audit_sig_lsm,
-=09=09=09=09=09=09       &context);
+=09=09=09=09=09=09       &context, LSMBLOB_FIRST);
 =09=09=09if (err)
 =09=09=09=09return err;
 =09=09}
@@ -1477,6 +1483,7 @@ static int audit_receive_msg(struct sk_buff *skb, str=
uct nlmsghdr *nlh)
 =09=09=09=09 " old-log_passwd=3D%d new-log_passwd=3D%d res=3D%d",
 =09=09=09=09 old.enabled, s.enabled, old.log_passwd,
 =09=09=09=09 s.log_passwd, !err);
+=09=09audit_log_task_lsms(ab);
 =09=09audit_log_end(ab);
 =09=09break;
 =09}
@@ -2055,6 +2062,33 @@ void audit_log_key(struct audit_buffer *ab, char *ke=
y)
 =09=09audit_log_format(ab, "(null)");
 }
=20
+void audit_log_task_lsms(struct audit_buffer *ab)
+{
+=09int i;
+=09const char *lsm;
+=09struct lsmblob blob;
+=09struct lsmcontext context;
+
+=09/*
+=09 * Don't do anything unless there is more than one LSM
+=09 * with a security context to report.
+=09 */
+=09if (security_lsm_slot_name(1) =3D=3D NULL)
+=09=09return;
+
+=09security_task_getsecid(current, &blob);
+
+=09for (i =3D 0; i < LSMBLOB_ENTRIES; i++) {
+=09=09lsm =3D security_lsm_slot_name(i);
+=09=09if (lsm =3D=3D NULL)
+=09=09=09break;
+=09=09if (security_secid_to_secctx(&blob, &context, i))
+=09=09=09continue;
+=09=09audit_log_format(ab, " subj_%s=3D%s", lsm, context.context);
+=09=09security_release_secctx(&context);
+=09}
+}
+
 int audit_log_task_context(struct audit_buffer *ab)
 {
 =09int error;
@@ -2065,7 +2099,7 @@ int audit_log_task_context(struct audit_buffer *ab)
 =09if (!lsmblob_is_set(&blob))
 =09=09return 0;
=20
-=09error =3D security_secid_to_secctx(&blob, &context);
+=09error =3D security_secid_to_secctx(&blob, &context, LSMBLOB_FIRST);
 =09if (error) {
 =09=09if (error !=3D -EINVAL)
 =09=09=09goto error_path;
@@ -2172,6 +2206,7 @@ void audit_log_link_denied(const char *operation)
 =09audit_log_format(ab, "op=3D%s", operation);
 =09audit_log_task_info(ab);
 =09audit_log_format(ab, " res=3D0");
+=09audit_log_task_lsms(ab);
 =09audit_log_end(ab);
 }
=20
@@ -2222,6 +2257,7 @@ static void audit_log_set_loginuid(kuid_t koldloginui=
d, kuid_t kloginuid,
 =09=09=09 oldloginuid, loginuid, tty ? tty_name(tty) : "(none)",
 =09=09=09 oldsessionid, sessionid, !rc);
 =09audit_put_tty(tty);
+=09audit_log_task_lsms(ab);
 =09audit_log_end(ab);
 }
=20
diff --git a/kernel/audit_fsnotify.c b/kernel/audit_fsnotify.c
index f0d243318452..7f8c4b1a2884 100644
--- a/kernel/audit_fsnotify.c
+++ b/kernel/audit_fsnotify.c
@@ -126,6 +126,7 @@ static void audit_mark_log_rule_change(struct audit_fsn=
otify_mark *audit_mark, c
 =09audit_log_untrustedstring(ab, audit_mark->path);
 =09audit_log_key(ab, rule->filterkey);
 =09audit_log_format(ab, " list=3D%d res=3D1", rule->listnr);
+=09audit_log_task_lsms(ab);
 =09audit_log_end(ab);
 }
=20
diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
index 19cfbe716f9d..bf28bb599b6d 100644
--- a/kernel/auditfilter.c
+++ b/kernel/auditfilter.c
@@ -1103,6 +1103,7 @@ static void audit_log_rule_change(char *action, struc=
t audit_krule *rule, int re
 =09audit_log_format(ab, " op=3D%s", action);
 =09audit_log_key(ab, rule->filterkey);
 =09audit_log_format(ab, " list=3D%d res=3D%d", rule->listnr, res);
+=09audit_log_task_lsms(ab);
 =09audit_log_end(ab);
 }
=20
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 6d273183dd87..e0dd643e9b13 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -973,7 +973,7 @@ static int audit_log_pid_context(struct audit_context *=
context, pid_t pid,
 =09=09=09 from_kuid(&init_user_ns, auid),
 =09=09=09 from_kuid(&init_user_ns, uid), sessionid);
 =09if (lsmblob_is_set(blob)) {
-=09=09if (security_secid_to_secctx(blob, &lsmctx)) {
+=09=09if (security_secid_to_secctx(blob, &lsmctx, LSMBLOB_FIRST)) {
 =09=09=09audit_log_format(ab, " obj=3D(none)");
 =09=09=09rc =3D 1;
 =09=09} else {
@@ -1218,7 +1218,8 @@ static void show_special(struct audit_context *contex=
t, int *call_panic)
 =09=09=09struct lsmblob blob;
=20
 =09=09=09lsmblob_init(&blob, osid);
-=09=09=09if (security_secid_to_secctx(&blob, &lsmcxt)) {
+=09=09=09if (security_secid_to_secctx(&blob, &lsmcxt,
+=09=09=09=09=09=09     LSMBLOB_FIRST)) {
 =09=09=09=09audit_log_format(ab, " osid=3D%u", osid);
 =09=09=09=09*call_panic =3D 1;
 =09=09=09} else {
@@ -1370,7 +1371,7 @@ static void audit_log_name(struct audit_context *cont=
ext, struct audit_names *n,
 =09=09struct lsmcontext lsmctx;
=20
 =09=09lsmblob_init(&blob, n->osid);
-=09=09if (security_secid_to_secctx(&blob, &lsmctx)) {
+=09=09if (security_secid_to_secctx(&blob, &lsmctx, LSMBLOB_FIRST)) {
 =09=09=09audit_log_format(ab, " osid=3D%u", n->osid);
 =09=09=09if (call_panic)
 =09=09=09=09*call_panic =3D 2;
@@ -1479,6 +1480,7 @@ static void audit_log_exit(void)
=20
 =09audit_log_task_info(ab);
 =09audit_log_key(ab, context->filterkey);
+=09audit_log_task_lsms(ab);
 =09audit_log_end(ab);
=20
 =09for (aux =3D context->aux; aux; aux =3D aux->next) {
@@ -2602,6 +2604,7 @@ void audit_core_dumps(long signr)
 =09=09return;
 =09audit_log_task(ab);
 =09audit_log_format(ab, " sig=3D%ld res=3D1", signr);
+=09audit_log_task_lsms(ab);
 =09audit_log_end(ab);
 }
=20
@@ -2628,6 +2631,7 @@ void audit_seccomp(unsigned long syscall, long signr,=
 int code)
 =09audit_log_format(ab, " sig=3D%ld arch=3D%x syscall=3D%ld compat=3D%d ip=
=3D0x%lx code=3D0x%x",
 =09=09=09 signr, syscall_get_arch(current), syscall,
 =09=09=09 in_compat_syscall(), KSTK_EIP(current), code);
+=09audit_log_task_lsms(ab);
 =09audit_log_end(ab);
 }
=20
diff --git a/net/ipv4/ip_sockglue.c b/net/ipv4/ip_sockglue.c
index 27af7a6b8780..10b418029cdd 100644
--- a/net/ipv4/ip_sockglue.c
+++ b/net/ipv4/ip_sockglue.c
@@ -138,7 +138,7 @@ static void ip_cmsg_recv_security(struct msghdr *msg, s=
truct sk_buff *skb)
 =09if (err)
 =09=09return;
=20
-=09err =3D security_secid_to_secctx(&lb, &context);
+=09err =3D security_secid_to_secctx(&lb, &context, LSMBLOB_DISPLAY);
 =09if (err)
 =09=09return;
=20
diff --git a/net/netfilter/nf_conntrack_netlink.c b/net/netfilter/nf_conntr=
ack_netlink.c
index 7c8a7edac36d..732631f67a78 100644
--- a/net/netfilter/nf_conntrack_netlink.c
+++ b/net/netfilter/nf_conntrack_netlink.c
@@ -334,7 +334,7 @@ static int ctnetlink_dump_secctx(struct sk_buff *skb, c=
onst struct nf_conn *ct)
 =09struct lsmcontext context;
=20
 =09lsmblob_init(&blob, ct->secmark);
-=09ret =3D security_secid_to_secctx(&blob, &context);
+=09ret =3D security_secid_to_secctx(&blob, &context, LSMBLOB_DISPLAY);
 =09if (ret)
 =09=09return 0;
=20
@@ -627,7 +627,7 @@ static inline int ctnetlink_secctx_size(const struct nf=
_conn *ct)
 =09struct lsmcontext context;
=20
 =09lsmblob_init(&blob, ct->secmark);
-=09ret =3D security_secid_to_secctx(&blob, &context);
+=09ret =3D security_secid_to_secctx(&blob, &context, LSMBLOB_DISPLAY);
 =09if (ret)
 =09=09return 0;
=20
diff --git a/net/netfilter/nf_conntrack_standalone.c b/net/netfilter/nf_con=
ntrack_standalone.c
index 8969754d7fe9..0ff2b8300c28 100644
--- a/net/netfilter/nf_conntrack_standalone.c
+++ b/net/netfilter/nf_conntrack_standalone.c
@@ -177,7 +177,7 @@ static void ct_show_secctx(struct seq_file *s, const st=
ruct nf_conn *ct)
 =09struct lsmcontext context;
=20
 =09lsmblob_init(&blob, ct->secmark);
-=09ret =3D security_secid_to_secctx(&blob, &context);
+=09ret =3D security_secid_to_secctx(&blob, &context, LSMBLOB_DISPLAY);
 =09if (ret)
 =09=09return;
=20
diff --git a/net/netfilter/nfnetlink_queue.c b/net/netfilter/nfnetlink_queu=
e.c
index a1296453d8f2..b6f71be884e8 100644
--- a/net/netfilter/nfnetlink_queue.c
+++ b/net/netfilter/nfnetlink_queue.c
@@ -314,7 +314,7 @@ static u32 nfqnl_get_sk_secctx(struct sk_buff *skb, str=
uct lsmcontext *context)
 =09if (skb->secmark) {
 =09=09/* Any LSM might be looking for the secmark */
 =09=09lsmblob_init(&blob, skb->secmark);
-=09=09security_secid_to_secctx(&blob, context);
+=09=09security_secid_to_secctx(&blob, context, LSMBLOB_DISPLAY);
 =09}
=20
 =09read_unlock_bh(&skb->sk->sk_callback_lock);
diff --git a/net/netlabel/netlabel_unlabeled.c b/net/netlabel/netlabel_unla=
beled.c
index 3b0f07b59436..60a7665de0e3 100644
--- a/net/netlabel/netlabel_unlabeled.c
+++ b/net/netlabel/netlabel_unlabeled.c
@@ -436,7 +436,8 @@ int netlbl_unlhsh_add(struct net *net,
 unlhsh_add_return:
 =09rcu_read_unlock();
 =09if (audit_buf !=3D NULL) {
-=09=09if (security_secid_to_secctx(lsmblob, &context) =3D=3D 0) {
+=09=09if (security_secid_to_secctx(lsmblob, &context,
+=09=09=09=09=09     LSMBLOB_FIRST) =3D=3D 0) {
 =09=09=09audit_log_format(audit_buf, " sec_obj=3D%s",
 =09=09=09=09=09 context.context);
 =09=09=09security_release_secctx(&context);
@@ -491,7 +492,8 @@ static int netlbl_unlhsh_remove_addr4(struct net *net,
 =09=09if (dev !=3D NULL)
 =09=09=09dev_put(dev);
 =09=09if (entry !=3D NULL &&
-=09=09    security_secid_to_secctx(&entry->lsmblob, &context) =3D=3D 0) {
+=09=09    security_secid_to_secctx(&entry->lsmblob, &context,
+=09=09=09=09=09     LSMBLOB_FIRST) =3D=3D 0) {
 =09=09=09audit_log_format(audit_buf, " sec_obj=3D%s",
 =09=09=09=09=09 context.context);
 =09=09=09security_release_secctx(&context);
@@ -551,7 +553,8 @@ static int netlbl_unlhsh_remove_addr6(struct net *net,
 =09=09if (dev !=3D NULL)
 =09=09=09dev_put(dev);
 =09=09if (entry !=3D NULL &&
-=09=09    security_secid_to_secctx(&entry->lsmblob, &context) =3D=3D 0) {
+=09=09    security_secid_to_secctx(&entry->lsmblob, &context,
+=09=09=09=09=09     LSMBLOB_FIRST) =3D=3D 0) {
 =09=09=09audit_log_format(audit_buf, " sec_obj=3D%s",
 =09=09=09=09=09 context.context);
 =09=09=09security_release_secctx(&context);
@@ -1122,7 +1125,7 @@ static int netlbl_unlabel_staticlist_gen(u32 cmd,
 =09=09lsmb =3D (struct lsmblob *)&addr6->lsmblob;
 =09}
=20
-=09ret_val =3D security_secid_to_secctx(lsmb, &context);
+=09ret_val =3D security_secid_to_secctx(lsmb, &context, LSMBLOB_FIRST);
 =09if (ret_val !=3D 0)
 =09=09goto list_cb_failure;
 =09ret_val =3D nla_put(cb_arg->skb,
diff --git a/net/netlabel/netlabel_user.c b/net/netlabel/netlabel_user.c
index 951ba0639d20..1941877fd16f 100644
--- a/net/netlabel/netlabel_user.c
+++ b/net/netlabel/netlabel_user.c
@@ -100,7 +100,7 @@ struct audit_buffer *netlbl_audit_start_common(int type=
,
=20
 =09lsmblob_init(&blob, audit_info->secid);
 =09if (audit_info->secid !=3D 0 &&
-=09    security_secid_to_secctx(&blob, &context) =3D=3D 0) {
+=09    security_secid_to_secctx(&blob, &context, LSMBLOB_FIRST) =3D=3D 0) =
{
 =09=09audit_log_format(audit_buf, " subj=3D%s", context.context);
 =09=09security_release_secctx(&context);
 =09}
diff --git a/net/xfrm/xfrm_policy.c b/net/xfrm/xfrm_policy.c
index f2d1e573ea55..bd2b36a83e66 100644
--- a/net/xfrm/xfrm_policy.c
+++ b/net/xfrm/xfrm_policy.c
@@ -4206,6 +4206,7 @@ void xfrm_audit_policy_add(struct xfrm_policy *xp, in=
t result, bool task_valid)
 =09xfrm_audit_helper_usrinfo(task_valid, audit_buf);
 =09audit_log_format(audit_buf, " res=3D%u", result);
 =09xfrm_audit_common_policyinfo(xp, audit_buf);
+=09audit_log_task_lsms(audit_buf);
 =09audit_log_end(audit_buf);
 }
 EXPORT_SYMBOL_GPL(xfrm_audit_policy_add);
@@ -4221,6 +4222,7 @@ void xfrm_audit_policy_delete(struct xfrm_policy *xp,=
 int result,
 =09xfrm_audit_helper_usrinfo(task_valid, audit_buf);
 =09audit_log_format(audit_buf, " res=3D%u", result);
 =09xfrm_audit_common_policyinfo(xp, audit_buf);
+=09audit_log_task_lsms(audit_buf);
 =09audit_log_end(audit_buf);
 }
 EXPORT_SYMBOL_GPL(xfrm_audit_policy_delete);
diff --git a/net/xfrm/xfrm_state.c b/net/xfrm/xfrm_state.c
index c6f3c4a1bd99..61dddd153d82 100644
--- a/net/xfrm/xfrm_state.c
+++ b/net/xfrm/xfrm_state.c
@@ -2640,6 +2640,7 @@ void xfrm_audit_state_add(struct xfrm_state *x, int r=
esult, bool task_valid)
 =09xfrm_audit_helper_usrinfo(task_valid, audit_buf);
 =09xfrm_audit_helper_sainfo(x, audit_buf);
 =09audit_log_format(audit_buf, " res=3D%u", result);
+=09audit_log_task_lsms(audit_buf);
 =09audit_log_end(audit_buf);
 }
 EXPORT_SYMBOL_GPL(xfrm_audit_state_add);
@@ -2654,6 +2655,7 @@ void xfrm_audit_state_delete(struct xfrm_state *x, in=
t result, bool task_valid)
 =09xfrm_audit_helper_usrinfo(task_valid, audit_buf);
 =09xfrm_audit_helper_sainfo(x, audit_buf);
 =09audit_log_format(audit_buf, " res=3D%u", result);
+=09audit_log_task_lsms(audit_buf);
 =09audit_log_end(audit_buf);
 }
 EXPORT_SYMBOL_GPL(xfrm_audit_state_delete);
diff --git a/security/integrity/ima/ima_api.c b/security/integrity/ima/ima_=
api.c
index 1ab769fa7df6..252dc00700e8 100644
--- a/security/integrity/ima/ima_api.c
+++ b/security/integrity/ima/ima_api.c
@@ -363,6 +363,7 @@ void ima_audit_measurement(struct integrity_iint_cache =
*iint,
 =09audit_log_format(ab, " hash=3D\"%s:%s\"", algo_name, hash);
=20
 =09audit_log_task_info(ab);
+=09audit_log_task_lsms(ab);
 =09audit_log_end(ab);
=20
 =09iint->flags |=3D IMA_AUDITED;
diff --git a/security/integrity/integrity_audit.c b/security/integrity/inte=
grity_audit.c
index 5109173839cc..bca89ae72e3d 100644
--- a/security/integrity/integrity_audit.c
+++ b/security/integrity/integrity_audit.c
@@ -54,5 +54,6 @@ void integrity_audit_msg(int audit_msgno, struct inode *i=
node,
 =09=09audit_log_format(ab, " ino=3D%lu", inode->i_ino);
 =09}
 =09audit_log_format(ab, " res=3D%d", !result);
+=09audit_log_task_lsms(ab);
 =09audit_log_end(ab);
 }
diff --git a/security/security.c b/security/security.c
index 0e8c61cceecd..0dce15d74cb5 100644
--- a/security/security.c
+++ b/security/security.c
@@ -449,7 +449,31 @@ static int lsm_append(const char *new, char **result)
  * Pointers to the LSM id structures for local use.
  */
 static int lsm_slot __lsm_ro_after_init;
-static struct lsm_id *lsm_slotlist[LSMBLOB_ENTRIES];
+static struct lsm_id *lsm_slotlist[LSMBLOB_ENTRIES] __lsm_ro_after_init;
+
+/**
+ * security_lsm_slot_name - Get the name of the security module in a slot
+ * @slot: index into the "display" slot list.
+ *
+ * Provide the name of the security module associated with
+ * a display slot.
+ *
+ * If @slot is LSMBLOB_INVALID return the value
+ * for slot 0 if it has been set, otherwise NULL.
+ *
+ * Returns a pointer to the name string or NULL.
+ */
+const char *security_lsm_slot_name(int slot)
+{
+=09if (slot =3D=3D LSMBLOB_INVALID)
+=09=09slot =3D 0;
+=09else if (slot >=3D LSMBLOB_ENTRIES || slot < 0)
+=09=09return NULL;
+
+=09if (lsm_slotlist[slot] =3D=3D NULL)
+=09=09return NULL;
+=09return lsm_slotlist[slot]->lsm;
+}
=20
 /**
  * security_add_hooks - Add a modules hooks to the hook lists.
@@ -2159,13 +2183,32 @@ int security_ismaclabel(const char *name)
 }
 EXPORT_SYMBOL(security_ismaclabel);
=20
-int security_secid_to_secctx(struct lsmblob *blob, struct lsmcontext *cp)
+int security_secid_to_secctx(struct lsmblob *blob, struct lsmcontext *cp,
+=09=09=09     int display)
 {
 =09struct security_hook_list *hp;
-=09int display =3D lsm_task_display(current);
=20
 =09memset(cp, 0, sizeof(*cp));
=20
+=09/*
+=09 * display either is the slot number use for formatting
+=09 * or an instruction on which relative slot to use.
+=09 */
+=09if (display =3D=3D LSMBLOB_DISPLAY)
+=09=09display =3D lsm_task_display(current);
+=09else if (display =3D=3D LSMBLOB_FIRST)
+=09=09display =3D LSMBLOB_INVALID;
+=09else if (display < 0) {
+=09=09WARN_ONCE(true,
+=09=09=09"LSM: security_secid_to_secctx unknown display\n");
+=09=09display =3D LSMBLOB_INVALID;
+=09} else if (display >=3D lsm_slot) {
+=09=09WARN_ONCE(true,
+=09=09=09"LSM: security_secid_to_secctx invalid display\n");
+=09=09display =3D LSMBLOB_INVALID;
+=09}
+
+
 =09hlist_for_each_entry(hp, &security_hook_heads.secid_to_secctx, list) {
 =09=09if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >=3D lsm_slot))
 =09=09=09continue;
@@ -2176,7 +2219,7 @@ int security_secid_to_secctx(struct lsmblob *blob, st=
ruct lsmcontext *cp)
 =09=09=09=09=09&cp->context, &cp->len);
 =09=09}
 =09}
-=09return 0;
+=09return -EOPNOTSUPP;
 }
 EXPORT_SYMBOL(security_secid_to_secctx);
=20
--=20
2.20.1


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

