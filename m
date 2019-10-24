Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 52EEAE3E60
	for <lists+linux-audit@lfdr.de>; Thu, 24 Oct 2019 23:41:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571953296;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ee2CuEB+BtimmL+4yKJdNitiHKJcQiyg+INXxzAiEFM=;
	b=f6iyvE41OoyMd4dAV+xhBehROiCb8/F2j4QNp0gHXtMPoZ/s8JbKCUVZMkkKxXhqf2qN8j
	xIoH2prLm2oJm0jY6O5JsnBumDQD/pmJKg691cWLALW1UhEucOAIfgLCi+0jl6vy1ikyy2
	qE8XOScNxQrjRhXFKuS9MW23p443KS0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-Mkv-zA0OMXClfDlyxe7VFA-1; Thu, 24 Oct 2019 17:41:29 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8ADBB800D4E;
	Thu, 24 Oct 2019 21:41:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E0603CCA;
	Thu, 24 Oct 2019 21:41:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 98AD34E58A;
	Thu, 24 Oct 2019 21:41:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9OLfGK5021010 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 24 Oct 2019 17:41:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EBF281001B30; Thu, 24 Oct 2019 21:41:16 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx28.extmail.prod.ext.phx2.redhat.com
	[10.5.110.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E631D100164D
	for <linux-audit@redhat.com>; Thu, 24 Oct 2019 21:41:14 +0000 (UTC)
Received: from sonic306-28.consmr.mail.ne1.yahoo.com
	(sonic306-28.consmr.mail.ne1.yahoo.com [66.163.189.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8858F883832
	for <linux-audit@redhat.com>; Thu, 24 Oct 2019 21:41:12 +0000 (UTC)
X-YMail-OSG: iXZOSLYVM1mq3iALvVBuq81OygmVPoETc4iQgmZMIejYjlVemFXFsrFQkPipuP4
	A0EIe.Dd_BBexbZPfVeN0_IyqugNbck7TJl0uEB4E6KtI9VhPtuBTE.cOZeUVDJasBmu3tyNLauu
	BmaUYKp4H2lfkNX16U2MU_hkTj0xkXSfm4yDbGOVkNbf3oPb3hkJDE87m03dH.bE226QOVjo91Mt
	FmmO30OyvX3A0Vw307r5VLQKFQWylzu7Q_8lD6n3_DknhPR8C0EZ_GkpfKuRKXCIhbzN9sn19MUv
	1YofjdzZLi4LTaJP0Uzh7NDYnctFizP__rOjqaYE74WJ4jHjydZIDqYz23j3YLh1zKFHeSrOwsXr
	rTnmACjVQJjUZxhdBMQbe8jMME.ekttmDkLbLhNFM0VPSA3oopbHXgJ56KVoyV0t6vVwxrmUQyAL
	KAXyqvgcBPTqJBNIXsRpN.wmtv9Nfif6jmYcbpteYm_Lc80XTxdilqLniFZjbB4S_wJXc.NfnZab
	Wv_4.nDEu8KYoNwFLOoIe0_CH119PorFVB3AWXcVbidI8kuLlP.ey6nuDksTsHiCHJGJbzMdW5U2
	BjYze2pYUiTUPUa_ovKnjy6THoyiIdHiHuFeAL2u5EjQHSYxhX.jS_ASs76PNPYAj5A7W25XB6eW
	BzzymbxTHmac7itslYKvxco9KJ8f3VDhuu0RdNbDpl1JPSLd6NqtV5jlHXoGw2X92X1Lu0Wnu1SW
	kIj8ypiUvPnrSLiQr0w7VBzES.FcOfW4uMQpACAx6EOAGT4EJGtGtvAvpk7zodZbhlYWK9EXa6A4
	qXXsvM3fBDChuC4vWBQXEETkF5XTRplaq1.nXNZOWdGKBAf67Ra9NkHmCKmYt_P1bGQz79HEQcnR
	h3Ots8eV76EF9Wjg2neEU.JlI4sIxoCmIYzWeWGQwl7f8zW2_zdtfSBPJVXsJtKamfe4fDRnbGA5
	LL_MzzqqwliuS.zlmVPeu76Y4igebuZz6cT.wT1HcshMBn4t0Kt8MVSZs.BnP3C_TonMMTzjY9yL
	T9ZuH1Q3GlbsFGqEJT_DjksecdU_KqdERsHSI.3E8vp9AxJ6OEbFSz2V86NWR3AMdeKaC6pA7iIm
	X1ZKwV3bpt32ypOAuGJVtzl9Bd8qFCNdI3k_HKjMD5jAphHNB_8fP_qw1vhrmy4ex0b3oOWh4yuk
	ko8M_WTVAwyhRp0n_PxZNUZZYoXy35Yit0vrzKsebdFmuerlQSDS4NOtbBqJRbUro0q.aaRBdor9
	5qnY_yBUxvzcZvsnS_sqCD30VmcQ9tQmodhqXacc3C7LalwHekHuy4KZOcGEJgVFqwc0Lw_hd0Q3
	kMrbzsYi4rwJK3FBSOHobettlRJM_hPC1AS8_O4EM1Ws4KpshUOL74sdBTEmiuKLiuqMjlCfpEQ_
	lt.zcZ0.JnxnPKmjdUhCLusRA2nt9za8CrcqZoAIT
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic306.consmr.mail.ne1.yahoo.com with HTTP;
	Thu, 24 Oct 2019 21:41:11 +0000
Received: by smtp401.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 5e7ebe53215bff98a9542b5270b49f73; 
	Thu, 24 Oct 2019 21:41:10 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: linux-audit@redhat.com
Subject: [PATCH v10 21/25] Audit: Add subj_LSM fields when necessary
Date: Thu, 24 Oct 2019 14:41:07 -0700
Message-Id: <20191024214108.7203-1-casey@schaufler-ca.com>
MIME-Version: 1.0
References: <20191024214108.7203-1-casey.ref@schaufler-ca.com>
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.69]); Thu, 24 Oct 2019 21:41:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.69]);
	Thu, 24 Oct 2019 21:41:13 +0000 (UTC) for IP:'66.163.189.90'
	DOMAIN:'sonic306-28.consmr.mail.ne1.yahoo.com'
	HELO:'sonic306-28.consmr.mail.ne1.yahoo.com'
	FROM:'casey@schaufler-ca.com' RCPT:''
X-RedHat-Spam-Score: 0.002  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_NONE) 66.163.189.90 sonic306-28.consmr.mail.ne1.yahoo.com
	66.163.189.90 sonic306-28.consmr.mail.ne1.yahoo.com
	<casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.69
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: Mkv-zA0OMXClfDlyxe7VFA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Add record entries to identify subject data for all of the
security modules when there is more than one.

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
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
index 90bc4ce07cd2..cb44f59b9bbe 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -3121,7 +3121,7 @@ static void binder_transaction(struct binder_proc *pr=
oc,
 =09=09struct lsmblob blob;
=20
 =09=09security_task_getsecid(proc->tsk, &blob);
-=09=09ret =3D security_secid_to_secctx(&blob, &lsmctx);
+=09=09ret =3D security_secid_to_secctx(&blob, &lsmctx, LSMBLOB_DISPLAY);
 =09=09if (ret) {
 =09=09=09return_error =3D BR_FAILED_REPLY;
 =09=09=09return_error_param =3D ret;
diff --git a/include/linux/audit.h b/include/linux/audit.h
index 1e69d9fe16da..306b404d419c 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -152,6 +152,7 @@ extern void=09=09    audit_log_link_denied(const char *=
operation);
 extern void=09=09    audit_log_lost(const char *message);
=20
 extern int audit_log_task_context(struct audit_buffer *ab);
+extern void audit_log_task_lsms(struct audit_buffer *ab);
 extern void audit_log_task_info(struct audit_buffer *ab);
=20
 extern int=09=09    audit_update_lsm_rules(void);
diff --git a/include/linux/security.h b/include/linux/security.h
index 4b685770c399..35b03b57bce2 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -128,6 +128,8 @@ struct lsmblob {
 #define LSMBLOB_INVALID=09=09-1=09/* Not a valid LSM slot number */
 #define LSMBLOB_NEEDED=09=09-2=09/* Slot requested on initialization */
 #define LSMBLOB_NOT_NEEDED=09-3=09/* Slot not requested */
+#define LSMBLOB_DISPLAY=09=09-4=09/* Use the "display" slot */
+#define LSMBLOB_FIRST=09=09-5=09/* Use the default "display" slot */
=20
 /**
  * lsmblob_init - initialize an lsmblob structure.
@@ -169,6 +171,8 @@ static inline bool lsmblob_equal(struct lsmblob *bloba,=
 struct lsmblob *blobb)
 =09return !memcmp(bloba, blobb, sizeof(*bloba));
 }
=20
+const char *security_lsm_slot_name(int slot);
+
 /* These functions are in security/commoncap.c */
 extern int cap_capable(const struct cred *cred, struct user_namespace *ns,
 =09=09       int cap, unsigned int opts);
@@ -473,7 +477,8 @@ int security_setprocattr(const char *lsm, const char *n=
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
@@ -1254,7 +1259,7 @@ static inline int security_ismaclabel(const char *nam=
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
index e1dfd9c6df36..45ea36f1f1c5 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -405,6 +405,7 @@ static int audit_log_config_change(char *function_name,=
 u32 new, u32 old,
 =09if (rc)
 =09=09allow_changes =3D 0; /* Something weird, deny request */
 =09audit_log_format(ab, " res=3D%d", allow_changes);
+=09audit_log_task_lsms(ab);
 =09audit_log_end(ab);
 =09return rc;
 }
@@ -1110,6 +1111,7 @@ static void audit_log_feature_change(int which, u32 o=
ld_feature, u32 new_feature
 =09audit_log_format(ab, " feature=3D%s old=3D%u new=3D%u old_lock=3D%u new=
_lock=3D%u res=3D%d",
 =09=09=09 audit_feature_names[which], !!old_feature, !!new_feature,
 =09=09=09 !!old_lock, !!new_lock, res);
+=09audit_log_task_lsms(ab);
 =09audit_log_end(ab);
 }
=20
@@ -1360,6 +1362,7 @@ static int audit_receive_msg(struct sk_buff *skb, str=
uct nlmsghdr *nlh)
 =09=09=09=09=09size--;
 =09=09=09=09audit_log_n_untrustedstring(ab, data, size);
 =09=09=09}
+=09=09=09audit_log_task_lsms(ab);
 =09=09=09audit_log_end(ab);
 =09=09}
 =09=09break;
@@ -1374,6 +1377,7 @@ static int audit_receive_msg(struct sk_buff *skb, str=
uct nlmsghdr *nlh)
 =09=09=09=09=09 msg_type =3D=3D AUDIT_ADD_RULE ?
 =09=09=09=09=09=09"add_rule" : "remove_rule",
 =09=09=09=09=09 audit_enabled);
+=09=09=09audit_log_task_lsms(ab);
 =09=09=09audit_log_end(ab);
 =09=09=09return -EPERM;
 =09=09}
@@ -1387,6 +1391,7 @@ static int audit_receive_msg(struct sk_buff *skb, str=
uct nlmsghdr *nlh)
 =09=09audit_log_common_recv_msg(audit_context(), &ab,
 =09=09=09=09=09  AUDIT_CONFIG_CHANGE);
 =09=09audit_log_format(ab, " op=3Dtrim res=3D1");
+=09=09audit_log_task_lsms(ab);
 =09=09audit_log_end(ab);
 =09=09break;
 =09case AUDIT_MAKE_EQUIV: {
@@ -1422,6 +1427,7 @@ static int audit_receive_msg(struct sk_buff *skb, str=
uct nlmsghdr *nlh)
 =09=09audit_log_format(ab, " new=3D");
 =09=09audit_log_untrustedstring(ab, new);
 =09=09audit_log_format(ab, " res=3D%d", !err);
+=09=09audit_log_task_lsms(ab);
 =09=09audit_log_end(ab);
 =09=09kfree(old);
 =09=09kfree(new);
@@ -1431,7 +1437,7 @@ static int audit_receive_msg(struct sk_buff *skb, str=
uct nlmsghdr *nlh)
 =09=09len =3D 0;
 =09=09if (lsmblob_is_set(&audit_sig_lsm)) {
 =09=09=09err =3D security_secid_to_secctx(&audit_sig_lsm,
-=09=09=09=09=09=09       &context);
+=09=09=09=09=09=09       &context, LSMBLOB_FIRST);
 =09=09=09if (err)
 =09=09=09=09return err;
 =09=09}
@@ -1490,6 +1496,7 @@ static int audit_receive_msg(struct sk_buff *skb, str=
uct nlmsghdr *nlh)
 =09=09=09=09 " old-log_passwd=3D%d new-log_passwd=3D%d res=3D%d",
 =09=09=09=09 old.enabled, s.enabled, old.log_passwd,
 =09=09=09=09 s.log_passwd, !err);
+=09=09audit_log_task_lsms(ab);
 =09=09audit_log_end(ab);
 =09=09break;
 =09}
@@ -2068,6 +2075,33 @@ void audit_log_key(struct audit_buffer *ab, char *ke=
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
@@ -2078,7 +2112,7 @@ int audit_log_task_context(struct audit_buffer *ab)
 =09if (!lsmblob_is_set(&blob))
 =09=09return 0;
=20
-=09error =3D security_secid_to_secctx(&blob, &context);
+=09error =3D security_secid_to_secctx(&blob, &context, LSMBLOB_FIRST);
 =09if (error) {
 =09=09if (error !=3D -EINVAL)
 =09=09=09goto error_path;
@@ -2185,6 +2219,7 @@ void audit_log_link_denied(const char *operation)
 =09audit_log_format(ab, "op=3D%s", operation);
 =09audit_log_task_info(ab);
 =09audit_log_format(ab, " res=3D0");
+=09audit_log_task_lsms(ab);
 =09audit_log_end(ab);
 }
=20
@@ -2235,6 +2270,7 @@ static void audit_log_set_loginuid(kuid_t koldloginui=
d, kuid_t kloginuid,
 =09=09=09 oldloginuid, loginuid, tty ? tty_name(tty) : "(none)",
 =09=09=09 oldsessionid, sessionid, !rc);
 =09audit_put_tty(tty);
+=09audit_log_task_lsms(ab);
 =09audit_log_end(ab);
 }
=20
diff --git a/kernel/audit_fsnotify.c b/kernel/audit_fsnotify.c
index 37ae95cfb7f4..3a00583fa7fa 100644
--- a/kernel/audit_fsnotify.c
+++ b/kernel/audit_fsnotify.c
@@ -135,6 +135,7 @@ static void audit_mark_log_rule_change(struct audit_fsn=
otify_mark *audit_mark, c
 =09audit_log_untrustedstring(ab, audit_mark->path);
 =09audit_log_key(ab, rule->filterkey);
 =09audit_log_format(ab, " list=3D%d res=3D1", rule->listnr);
+=09audit_log_task_lsms(ab);
 =09audit_log_end(ab);
 }
=20
diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
index 8f244c98bb57..508d784413da 100644
--- a/kernel/auditfilter.c
+++ b/kernel/auditfilter.c
@@ -1099,6 +1099,7 @@ static void audit_log_rule_change(char *action, struc=
t audit_krule *rule, int re
 =09audit_log_format(ab, " op=3D%s", action);
 =09audit_log_key(ab, rule->filterkey);
 =09audit_log_format(ab, " list=3D%d res=3D%d", rule->listnr, res);
+=09audit_log_task_lsms(ab);
 =09audit_log_end(ab);
 }
=20
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 0478680cd0a8..46d7a58babd2 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -954,7 +954,7 @@ static int audit_log_pid_context(struct audit_context *=
context, pid_t pid,
 =09=09=09 from_kuid(&init_user_ns, auid),
 =09=09=09 from_kuid(&init_user_ns, uid), sessionid);
 =09if (lsmblob_is_set(blob)) {
-=09=09if (security_secid_to_secctx(blob, &lsmctx)) {
+=09=09if (security_secid_to_secctx(blob, &lsmctx, LSMBLOB_FIRST)) {
 =09=09=09audit_log_format(ab, " obj=3D(none)");
 =09=09=09rc =3D 1;
 =09=09} else {
@@ -1198,7 +1198,8 @@ static void show_special(struct audit_context *contex=
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
@@ -1351,7 +1352,7 @@ static void audit_log_name(struct audit_context *cont=
ext, struct audit_names *n,
 =09=09struct lsmcontext lsmctx;
=20
 =09=09lsmblob_init(&blob, n->osid);
-=09=09if (security_secid_to_secctx(&blob, &lsmctx)) {
+=09=09if (security_secid_to_secctx(&blob, &lsmctx, LSMBLOB_FIRST)) {
 =09=09=09audit_log_format(ab, " osid=3D%u", n->osid);
 =09=09=09if (call_panic)
 =09=09=09=09*call_panic =3D 2;
@@ -1460,6 +1461,7 @@ static void audit_log_exit(void)
=20
 =09audit_log_task_info(ab);
 =09audit_log_key(ab, context->filterkey);
+=09audit_log_task_lsms(ab);
 =09audit_log_end(ab);
=20
 =09for (aux =3D context->aux; aux; aux =3D aux->next) {
@@ -2569,6 +2571,7 @@ void audit_core_dumps(long signr)
 =09=09return;
 =09audit_log_task(ab);
 =09audit_log_format(ab, " sig=3D%ld res=3D1", signr);
+=09audit_log_task_lsms(ab);
 =09audit_log_end(ab);
 }
=20
@@ -2595,6 +2598,7 @@ void audit_seccomp(unsigned long syscall, long signr,=
 int code)
 =09audit_log_format(ab, " sig=3D%ld arch=3D%x syscall=3D%ld compat=3D%d ip=
=3D0x%lx code=3D0x%x",
 =09=09=09 signr, syscall_get_arch(), syscall,
 =09=09=09 in_compat_syscall(), KSTK_EIP(current), code);
+=09audit_log_task_lsms(ab);
 =09audit_log_end(ab);
 }
=20
diff --git a/net/ipv4/ip_sockglue.c b/net/ipv4/ip_sockglue.c
index 80ae0c5a1301..447fe60af0cd 100644
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
index 403307ff0fff..c870aebe99a3 100644
--- a/net/netfilter/nf_conntrack_netlink.c
+++ b/net/netfilter/nf_conntrack_netlink.c
@@ -333,7 +333,7 @@ static int ctnetlink_dump_secctx(struct sk_buff *skb, c=
onst struct nf_conn *ct)
 =09struct lsmcontext context;
=20
 =09lsmblob_init(&blob, ct->secmark);
-=09ret =3D security_secid_to_secctx(&blob, &context);
+=09ret =3D security_secid_to_secctx(&blob, &context, LSMBLOB_DISPLAY);
 =09if (ret)
 =09=09return 0;
=20
@@ -621,7 +621,7 @@ static inline int ctnetlink_secctx_size(const struct nf=
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
index fcb51ab2bb8b..60dd81eb6f89 100644
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
index 58d5bd7a376e..ad4bb3f9c7dc 100644
--- a/net/netfilter/nfnetlink_queue.c
+++ b/net/netfilter/nfnetlink_queue.c
@@ -318,7 +318,7 @@ static u32 nfqnl_get_sk_secctx(struct sk_buff *skb, str=
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
index 57ede7781c8f..cf34c163af20 100644
--- a/net/netlabel/netlabel_unlabeled.c
+++ b/net/netlabel/netlabel_unlabeled.c
@@ -450,7 +450,8 @@ int netlbl_unlhsh_add(struct net *net,
 unlhsh_add_return:
 =09rcu_read_unlock();
 =09if (audit_buf !=3D NULL) {
-=09=09if (security_secid_to_secctx(lsmblob, &context) =3D=3D 0) {
+=09=09if (security_secid_to_secctx(lsmblob, &context,
+=09=09=09=09=09     LSMBLOB_FIRST) =3D=3D 0) {
 =09=09=09audit_log_format(audit_buf, " sec_obj=3D%s",
 =09=09=09=09=09 context.context);
 =09=09=09security_release_secctx(&context);
@@ -505,7 +506,8 @@ static int netlbl_unlhsh_remove_addr4(struct net *net,
 =09=09if (dev !=3D NULL)
 =09=09=09dev_put(dev);
 =09=09if (entry !=3D NULL &&
-=09=09    security_secid_to_secctx(&entry->lsmblob, &context) =3D=3D 0) {
+=09=09    security_secid_to_secctx(&entry->lsmblob, &context,
+=09=09=09=09=09     LSMBLOB_FIRST) =3D=3D 0) {
 =09=09=09audit_log_format(audit_buf, " sec_obj=3D%s",
 =09=09=09=09=09 context.context);
 =09=09=09security_release_secctx(&context);
@@ -565,7 +567,8 @@ static int netlbl_unlhsh_remove_addr6(struct net *net,
 =09=09if (dev !=3D NULL)
 =09=09=09dev_put(dev);
 =09=09if (entry !=3D NULL &&
-=09=09    security_secid_to_secctx(&entry->lsmblob, &context) =3D=3D 0) {
+=09=09    security_secid_to_secctx(&entry->lsmblob, &context,
+=09=09=09=09=09     LSMBLOB_FIRST) =3D=3D 0) {
 =09=09=09audit_log_format(audit_buf, " sec_obj=3D%s",
 =09=09=09=09=09 context.context);
 =09=09=09security_release_secctx(&context);
@@ -1136,7 +1139,7 @@ static int netlbl_unlabel_staticlist_gen(u32 cmd,
 =09=09lsmb =3D (struct lsmblob *)&addr6->lsmblob;
 =09}
=20
-=09ret_val =3D security_secid_to_secctx(lsmb, &context);
+=09ret_val =3D security_secid_to_secctx(lsmb, &context, LSMBLOB_FIRST);
 =09if (ret_val !=3D 0)
 =09=09goto list_cb_failure;
 =09ret_val =3D nla_put(cb_arg->skb,
diff --git a/net/netlabel/netlabel_user.c b/net/netlabel/netlabel_user.c
index 2d1307f65250..193200955dbd 100644
--- a/net/netlabel/netlabel_user.c
+++ b/net/netlabel/netlabel_user.c
@@ -114,7 +114,7 @@ struct audit_buffer *netlbl_audit_start_common(int type=
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
index 8d1a898d0ba5..5a67b2e5d941 100644
--- a/net/xfrm/xfrm_policy.c
+++ b/net/xfrm/xfrm_policy.c
@@ -3996,6 +3996,7 @@ void xfrm_audit_policy_add(struct xfrm_policy *xp, in=
t result, bool task_valid)
 =09xfrm_audit_helper_usrinfo(task_valid, audit_buf);
 =09audit_log_format(audit_buf, " res=3D%u", result);
 =09xfrm_audit_common_policyinfo(xp, audit_buf);
+=09audit_log_task_lsms(audit_buf);
 =09audit_log_end(audit_buf);
 }
 EXPORT_SYMBOL_GPL(xfrm_audit_policy_add);
@@ -4011,6 +4012,7 @@ void xfrm_audit_policy_delete(struct xfrm_policy *xp,=
 int result,
 =09xfrm_audit_helper_usrinfo(task_valid, audit_buf);
 =09audit_log_format(audit_buf, " res=3D%u", result);
 =09xfrm_audit_common_policyinfo(xp, audit_buf);
+=09audit_log_task_lsms(audit_buf);
 =09audit_log_end(audit_buf);
 }
 EXPORT_SYMBOL_GPL(xfrm_audit_policy_delete);
diff --git a/net/xfrm/xfrm_state.c b/net/xfrm/xfrm_state.c
index 1bb971f46fc6..d6944123ca0e 100644
--- a/net/xfrm/xfrm_state.c
+++ b/net/xfrm/xfrm_state.c
@@ -2456,6 +2456,7 @@ void xfrm_audit_state_add(struct xfrm_state *x, int r=
esult, bool task_valid)
 =09xfrm_audit_helper_usrinfo(task_valid, audit_buf);
 =09xfrm_audit_helper_sainfo(x, audit_buf);
 =09audit_log_format(audit_buf, " res=3D%u", result);
+=09audit_log_task_lsms(audit_buf);
 =09audit_log_end(audit_buf);
 }
 EXPORT_SYMBOL_GPL(xfrm_audit_state_add);
@@ -2470,6 +2471,7 @@ void xfrm_audit_state_delete(struct xfrm_state *x, in=
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
index 94b2a4840d81..1e96afcb2d8d 100644
--- a/security/integrity/ima/ima_api.c
+++ b/security/integrity/ima/ima_api.c
@@ -337,6 +337,7 @@ void ima_audit_measurement(struct integrity_iint_cache =
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
index 82c98f7d217e..aca1c6bdcccd 100644
--- a/security/integrity/integrity_audit.c
+++ b/security/integrity/integrity_audit.c
@@ -57,5 +57,6 @@ void integrity_audit_msg(int audit_msgno, struct inode *i=
node,
 =09=09audit_log_format(ab, " ino=3D%lu", inode->i_ino);
 =09}
 =09audit_log_format(ab, " res=3D%d", !result);
+=09audit_log_task_lsms(ab);
 =09audit_log_end(ab);
 }
diff --git a/security/security.c b/security/security.c
index ebbe7fac48d8..4e878907f12b 100644
--- a/security/security.c
+++ b/security/security.c
@@ -426,7 +426,31 @@ static int lsm_append(const char *new, char **result)
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
@@ -2100,13 +2124,32 @@ int security_ismaclabel(const char *name)
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
@@ -2117,7 +2160,7 @@ int security_secid_to_secctx(struct lsmblob *blob, st=
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

