Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1A644168AB8
	for <lists+linux-audit@lfdr.de>; Sat, 22 Feb 2020 01:06:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582329990;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pdwOLDmnG/rOdZP4o1TVVrj2MXeuxpQYYN6tpal669E=;
	b=K/RadWWOWj+Aw3X/RhBN37KLgHGSdBB/bc7I4k79zlARfJwrhVGwUlELVtFhwsOUUeSd6B
	dRUbnPP12VPkGHwT4XseMXQMbZS2bOwSmAunaSzkDotlAOv5+3/QfKypHHGYVh7RvG3i5i
	sgT0lKE3OSe8abVIOo6dXRXG23x9A0k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-TH11F-25MlCcBBciX6t3yw-1; Fri, 21 Feb 2020 19:06:28 -0500
X-MC-Unique: TH11F-25MlCcBBciX6t3yw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9B53184B134;
	Sat, 22 Feb 2020 00:06:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BBA0460C99;
	Sat, 22 Feb 2020 00:06:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6C81618089C8;
	Sat, 22 Feb 2020 00:06:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01M06JJN001759 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 21 Feb 2020 19:06:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 539602166B30; Sat, 22 Feb 2020 00:06:19 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4EF622166B2B
	for <linux-audit@redhat.com>; Sat, 22 Feb 2020 00:06:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99FD58007C9
	for <linux-audit@redhat.com>; Sat, 22 Feb 2020 00:06:15 +0000 (UTC)
Received: from sonic314-27.consmr.mail.ne1.yahoo.com
	(sonic314-27.consmr.mail.ne1.yahoo.com [66.163.189.153]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-259-R-Qkz7J1OBGUSjG7tX4heg-1;
	Fri, 21 Feb 2020 19:06:12 -0500
X-MC-Unique: R-Qkz7J1OBGUSjG7tX4heg-1
X-YMail-OSG: kW_dsUMVM1n8Ff7AywlmJGDgUrjUKtnkK3eP1XF6zEFgYve597.zE0911vVF4FI
	DCiplG9c_sy36YTEdP5_8P0QDaOi8FyQHOLhghW1etAZ_XgVX4XXFNs9mGByaMZdwb4J9OUwpfIq
	Lrfv.ISTB7If8IVNqwtuY8XNwTp0YfrQub.xFnS0OzisqsKhflGe_dOtoh7l.6vdRNbK4pFdL.hT
	H9Igq0GnnirHFyi0ovCjIx6GioCUBDwG_yKwxtT.kJt15OW7quv9Tre.L4DQlRmalsFL5CNH0Wkc
	MPebskzQrvpimtXS3mjh59NIo31ywhRxgxM5hWyXL3OIqMPo.9RdGqQve2CcBEjn_WFgeo8TwU_I
	yW.mGkZsmDVOuJtXob5F9WYD7uXFs2FBUIJ4b8jW.5ny4h4JHwVPHgA2jVnXWY109jdIAK2Z9nZI
	tlCYZeDJUwGpKspMc0sTlhICqxPamctV7CJZ3CRelJldsvXmQW5X0hXhp7zIZOuqBO0VFoBfD7NR
	CbnKqMcJKkm74M2Px9TkG2emq5zIm5MMOT.jXVFjq8ZuotPz4IUAwgqRtMpYqzw9itkyMHwrGbNX
	hi96OZ12jJv.wll.Zwwf0RRTlQ1x_dsQyhck0OVThcLRn1dqHj9rP61qeVhxWc1khpl7ASwspv6I
	KpXJD6yzdjgSGKsakzObvEomeCTlbp.zjpO.MCjzaqhnN_JbborbkJIHnRTxK1MHT7v8BeWXjuaq
	sTdCbC9QkzeL3ytCzafyN.HxL0uW_znwKJPgAGQMPL.5D6pXLxGewIipB0BP5xITAkJiYngcL7H8
	m_tErwsmDUlDLZpav7FFpDhPzTTzy.YBYRGWVQxXiQRYMf5nWC2NOmlpXbUPIWm5K_R70hMSpxWj
	vke1QylxurnPZf3e9cGQhNfdNxHyYGfBMhmufUi_MlsNAJ.5GgFB6RTv464vXFvVoUxWu3Epa4g4
	cr.4izhSJSpsFe4XxAEbrdYJ5DO9jYspYvWRMUuRaAbfFAaUto.P8xNjqJ_6oD5jAdH6rQNQK9rx
	xvQx52d57eySBEem9_eCz.iQlisyPqnfDilHUIn8YyuQmmMRhMmVrWJfAqqKWyA2NPpt07YzminW
	72iamTVxrXniTRyATH7q07tLFPvz0W_Mbn5LmYfxTmndKQmp4qGWu_qrXI9xswfIczwRKxkLkSn7
	chsfhS_uV3qtNeOGPw8zkuz_aWK1QxQsVopl657ZF1Bawr3sL.fikdZvyO2AG39P9B076E_ONjU9
	Q0HyYN79QcGN1SWsEEqG_BSoPc.bh_8Iznen9sb3.jkHg3si9Yy3tQPJH7cZrBEXa5BWVRB_BIP1
	f9y6aOBBlXaE7k5YIziI9UwhyNpekxNGfGqozm_vKrzbafOyrM639FHEN9ChUEKGSiIt8seNEjdc
	SeOIsp8zPSSFER9EVhEpNSLOk
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic314.consmr.mail.ne1.yahoo.com with HTTP;
	Sat, 22 Feb 2020 00:06:11 +0000
Received: by smtp414.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 0e706714352d04af1a6921209e6db81a; 
	Sat, 22 Feb 2020 00:06:08 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, linux-audit@redhat.com
Subject: [PATCH v15 20/23] Audit: Add subj_LSM fields when necessary
Date: Fri, 21 Feb 2020 16:04:06 -0800
Message-Id: <20200222000407.110158-13-casey@schaufler-ca.com>
In-Reply-To: <20200222000407.110158-1-casey@schaufler-ca.com>
References: <20200222000407.110158-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01M06JJN001759
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add record entries to identify subject data for all of the
security modules when there is more than one.

Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
Cc: netdev@vger.kernel.org
Cc: linux-audit@redhat.com
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
index fb7a473f4270..ee6cd2106dea 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -3109,7 +3109,7 @@ static void binder_transaction(struct binder_proc *proc,
 		size_t added_size;
 
 		security_task_getsecid(proc->tsk, &blob);
-		ret = security_secid_to_secctx(&blob, &lsmctx);
+		ret = security_secid_to_secctx(&blob, &lsmctx, LSMBLOB_DISPLAY);
 		if (ret) {
 			return_error = BR_FAILED_REPLY;
 			return_error_param = ret;
diff --git a/include/linux/audit.h b/include/linux/audit.h
index 8e1c759fd1ff..d4213c471801 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -163,6 +163,7 @@ extern void		    audit_log_path_denied(int type,
 extern void		    audit_log_lost(const char *message);
 
 extern int audit_log_task_context(struct audit_buffer *ab);
+extern void audit_log_task_lsms(struct audit_buffer *ab);
 extern void audit_log_task_info(struct audit_buffer *ab);
 
 extern int		    audit_update_lsm_rules(void);
diff --git a/include/linux/security.h b/include/linux/security.h
index 690f8d6495e5..26b598a843dd 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -178,6 +178,8 @@ struct lsmblob {
 #define LSMBLOB_INVALID		-1	/* Not a valid LSM slot number */
 #define LSMBLOB_NEEDED		-2	/* Slot requested on initialization */
 #define LSMBLOB_NOT_NEEDED	-3	/* Slot not requested */
+#define LSMBLOB_DISPLAY		-4	/* Use the "display" slot */
+#define LSMBLOB_FIRST		-5	/* Use the default "display" slot */
 
 /**
  * lsmblob_init - initialize an lsmblob structure.
@@ -219,6 +221,8 @@ static inline bool lsmblob_equal(struct lsmblob *bloba, struct lsmblob *blobb)
 	return !memcmp(bloba, blobb, sizeof(*bloba));
 }
 
+const char *security_lsm_slot_name(int slot);
+
 /* These functions are in security/commoncap.c */
 extern int cap_capable(const struct cred *cred, struct user_namespace *ns,
 		       int cap, unsigned int opts);
@@ -528,7 +532,8 @@ int security_setprocattr(const char *lsm, const char *name, void *value,
 			 size_t size);
 int security_netlink_send(struct sock *sk, struct sk_buff *skb);
 int security_ismaclabel(const char *name);
-int security_secid_to_secctx(struct lsmblob *blob, struct lsmcontext *cp);
+int security_secid_to_secctx(struct lsmblob *blob, struct lsmcontext *cp,
+			     int display);
 int security_secctx_to_secid(const char *secdata, u32 seclen,
 			     struct lsmblob *blob);
 void security_release_secctx(struct lsmcontext *cp);
@@ -1333,7 +1338,7 @@ static inline int security_ismaclabel(const char *name)
 }
 
 static inline int security_secid_to_secctx(struct lsmblob *blob,
-					   struct lsmcontext *cp)
+					   struct lsmcontext *cp, int display)
 {
 	return -EOPNOTSUPP;
 }
diff --git a/include/net/scm.h b/include/net/scm.h
index 4a6ad8caf423..8b5a4737e1b8 100644
--- a/include/net/scm.h
+++ b/include/net/scm.h
@@ -96,7 +96,8 @@ static inline void scm_passec(struct socket *sock, struct msghdr *msg, struct sc
 	int err;
 
 	if (test_bit(SOCK_PASSSEC, &sock->flags)) {
-		err = security_secid_to_secctx(&scm->lsmblob, &context);
+		err = security_secid_to_secctx(&scm->lsmblob, &context,
+					       LSMBLOB_DISPLAY);
 
 		if (!err) {
 			put_cmsg(msg, SOL_SOCKET, SCM_SECURITY,
diff --git a/kernel/audit.c b/kernel/audit.c
index a25097cfe623..c3a1d8d2d33c 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -393,6 +393,7 @@ static int audit_log_config_change(char *function_name, u32 new, u32 old,
 	if (rc)
 		allow_changes = 0; /* Something weird, deny request */
 	audit_log_format(ab, " res=%d", allow_changes);
+	audit_log_task_lsms(ab);
 	audit_log_end(ab);
 	return rc;
 }
@@ -1098,6 +1099,7 @@ static void audit_log_feature_change(int which, u32 old_feature, u32 new_feature
 	audit_log_format(ab, " feature=%s old=%u new=%u old_lock=%u new_lock=%u res=%d",
 			 audit_feature_names[which], !!old_feature, !!new_feature,
 			 !!old_lock, !!new_lock, res);
+	audit_log_task_lsms(ab);
 	audit_log_end(ab);
 }
 
@@ -1347,6 +1349,7 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 					size--;
 				audit_log_n_untrustedstring(ab, data, size);
 			}
+			audit_log_task_lsms(ab);
 			audit_log_end(ab);
 		}
 		break;
@@ -1361,6 +1364,7 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 					 msg_type == AUDIT_ADD_RULE ?
 						"add_rule" : "remove_rule",
 					 audit_enabled);
+			audit_log_task_lsms(ab);
 			audit_log_end(ab);
 			return -EPERM;
 		}
@@ -1374,6 +1378,7 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 		audit_log_common_recv_msg(audit_context(), &ab,
 					  AUDIT_CONFIG_CHANGE);
 		audit_log_format(ab, " op=trim res=1");
+		audit_log_task_lsms(ab);
 		audit_log_end(ab);
 		break;
 	case AUDIT_MAKE_EQUIV: {
@@ -1409,6 +1414,7 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 		audit_log_format(ab, " new=");
 		audit_log_untrustedstring(ab, new);
 		audit_log_format(ab, " res=%d", !err);
+		audit_log_task_lsms(ab);
 		audit_log_end(ab);
 		kfree(old);
 		kfree(new);
@@ -1417,7 +1423,7 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 	case AUDIT_SIGNAL_INFO:
 		if (lsmblob_is_set(&audit_sig_lsm)) {
 			err = security_secid_to_secctx(&audit_sig_lsm,
-						       &context);
+						       &context, LSMBLOB_FIRST);
 			if (err)
 				return err;
 		}
@@ -1476,6 +1482,7 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 				 " old-log_passwd=%d new-log_passwd=%d res=%d",
 				 old.enabled, s.enabled, old.log_passwd,
 				 s.log_passwd, !err);
+		audit_log_task_lsms(ab);
 		audit_log_end(ab);
 		break;
 	}
@@ -2054,6 +2061,33 @@ void audit_log_key(struct audit_buffer *ab, char *key)
 		audit_log_format(ab, "(null)");
 }
 
+void audit_log_task_lsms(struct audit_buffer *ab)
+{
+	int i;
+	const char *lsm;
+	struct lsmblob blob;
+	struct lsmcontext context;
+
+	/*
+	 * Don't do anything unless there is more than one LSM
+	 * with a security context to report.
+	 */
+	if (security_lsm_slot_name(1) == NULL)
+		return;
+
+	security_task_getsecid(current, &blob);
+
+	for (i = 0; i < LSMBLOB_ENTRIES; i++) {
+		lsm = security_lsm_slot_name(i);
+		if (lsm == NULL)
+			break;
+		if (security_secid_to_secctx(&blob, &context, i))
+			continue;
+		audit_log_format(ab, " subj_%s=%s", lsm, context.context);
+		security_release_secctx(&context);
+	}
+}
+
 int audit_log_task_context(struct audit_buffer *ab)
 {
 	int error;
@@ -2064,7 +2098,7 @@ int audit_log_task_context(struct audit_buffer *ab)
 	if (!lsmblob_is_set(&blob))
 		return 0;
 
-	error = security_secid_to_secctx(&blob, &context);
+	error = security_secid_to_secctx(&blob, &context, LSMBLOB_FIRST);
 	if (error) {
 		if (error != -EINVAL)
 			goto error_path;
@@ -2172,6 +2206,7 @@ void audit_log_path_denied(int type, const char *operation)
 	audit_log_format(ab, "op=%s", operation);
 	audit_log_task_info(ab);
 	audit_log_format(ab, " res=0");
+	audit_log_task_lsms(ab);
 	audit_log_end(ab);
 }
 
@@ -2222,6 +2257,7 @@ static void audit_log_set_loginuid(kuid_t koldloginuid, kuid_t kloginuid,
 			 oldloginuid, loginuid, tty ? tty_name(tty) : "(none)",
 			 oldsessionid, sessionid, !rc);
 	audit_put_tty(tty);
+	audit_log_task_lsms(ab);
 	audit_log_end(ab);
 }
 
diff --git a/kernel/audit_fsnotify.c b/kernel/audit_fsnotify.c
index f0d243318452..7f8c4b1a2884 100644
--- a/kernel/audit_fsnotify.c
+++ b/kernel/audit_fsnotify.c
@@ -126,6 +126,7 @@ static void audit_mark_log_rule_change(struct audit_fsnotify_mark *audit_mark, c
 	audit_log_untrustedstring(ab, audit_mark->path);
 	audit_log_key(ab, rule->filterkey);
 	audit_log_format(ab, " list=%d res=1", rule->listnr);
+	audit_log_task_lsms(ab);
 	audit_log_end(ab);
 }
 
diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
index c9a46b78b932..cd19dd995120 100644
--- a/kernel/auditfilter.c
+++ b/kernel/auditfilter.c
@@ -1105,6 +1105,7 @@ static void audit_log_rule_change(char *action, struct audit_krule *rule, int re
 	audit_log_format(ab, " op=%s", action);
 	audit_log_key(ab, rule->filterkey);
 	audit_log_format(ab, " list=%d res=%d", rule->listnr, res);
+	audit_log_task_lsms(ab);
 	audit_log_end(ab);
 }
 
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index f71d8f7521be..68ae5fa843c1 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -973,7 +973,7 @@ static int audit_log_pid_context(struct audit_context *context, pid_t pid,
 			 from_kuid(&init_user_ns, auid),
 			 from_kuid(&init_user_ns, uid), sessionid);
 	if (lsmblob_is_set(blob)) {
-		if (security_secid_to_secctx(blob, &lsmctx)) {
+		if (security_secid_to_secctx(blob, &lsmctx, LSMBLOB_FIRST)) {
 			audit_log_format(ab, " obj=(none)");
 			rc = 1;
 		} else {
@@ -1218,7 +1218,8 @@ static void show_special(struct audit_context *context, int *call_panic)
 			struct lsmblob blob;
 
 			lsmblob_init(&blob, osid);
-			if (security_secid_to_secctx(&blob, &lsmcxt)) {
+			if (security_secid_to_secctx(&blob, &lsmcxt,
+						     LSMBLOB_FIRST)) {
 				audit_log_format(ab, " osid=%u", osid);
 				*call_panic = 1;
 			} else {
@@ -1370,7 +1371,7 @@ static void audit_log_name(struct audit_context *context, struct audit_names *n,
 		struct lsmcontext lsmctx;
 
 		lsmblob_init(&blob, n->osid);
-		if (security_secid_to_secctx(&blob, &lsmctx)) {
+		if (security_secid_to_secctx(&blob, &lsmctx, LSMBLOB_FIRST)) {
 			audit_log_format(ab, " osid=%u", n->osid);
 			if (call_panic)
 				*call_panic = 2;
@@ -1479,6 +1480,7 @@ static void audit_log_exit(void)
 
 	audit_log_task_info(ab);
 	audit_log_key(ab, context->filterkey);
+	audit_log_task_lsms(ab);
 	audit_log_end(ab);
 
 	for (aux = context->aux; aux; aux = aux->next) {
@@ -2602,6 +2604,7 @@ void audit_core_dumps(long signr)
 		return;
 	audit_log_task(ab);
 	audit_log_format(ab, " sig=%ld res=1", signr);
+	audit_log_task_lsms(ab);
 	audit_log_end(ab);
 }
 
@@ -2628,6 +2631,7 @@ void audit_seccomp(unsigned long syscall, long signr, int code)
 	audit_log_format(ab, " sig=%ld arch=%x syscall=%ld compat=%d ip=0x%lx code=0x%x",
 			 signr, syscall_get_arch(current), syscall,
 			 in_compat_syscall(), KSTK_EIP(current), code);
+	audit_log_task_lsms(ab);
 	audit_log_end(ab);
 }
 
diff --git a/net/ipv4/ip_sockglue.c b/net/ipv4/ip_sockglue.c
index 27af7a6b8780..10b418029cdd 100644
--- a/net/ipv4/ip_sockglue.c
+++ b/net/ipv4/ip_sockglue.c
@@ -138,7 +138,7 @@ static void ip_cmsg_recv_security(struct msghdr *msg, struct sk_buff *skb)
 	if (err)
 		return;
 
-	err = security_secid_to_secctx(&lb, &context);
+	err = security_secid_to_secctx(&lb, &context, LSMBLOB_DISPLAY);
 	if (err)
 		return;
 
diff --git a/net/netfilter/nf_conntrack_netlink.c b/net/netfilter/nf_conntrack_netlink.c
index e2e6d4bf4ac3..210aa5a84a08 100644
--- a/net/netfilter/nf_conntrack_netlink.c
+++ b/net/netfilter/nf_conntrack_netlink.c
@@ -334,7 +334,7 @@ static int ctnetlink_dump_secctx(struct sk_buff *skb, const struct nf_conn *ct)
 	struct lsmcontext context;
 
 	lsmblob_init(&blob, ct->secmark);
-	ret = security_secid_to_secctx(&blob, &context);
+	ret = security_secid_to_secctx(&blob, &context, LSMBLOB_DISPLAY);
 	if (ret)
 		return 0;
 
@@ -649,7 +649,7 @@ static inline int ctnetlink_secctx_size(const struct nf_conn *ct)
 	struct lsmcontext context;
 
 	lsmblob_init(&blob, ct->secmark);
-	ret = security_secid_to_secctx(&blob, &context);
+	ret = security_secid_to_secctx(&blob, &context, LSMBLOB_DISPLAY);
 	if (ret)
 		return 0;
 
diff --git a/net/netfilter/nf_conntrack_standalone.c b/net/netfilter/nf_conntrack_standalone.c
index 8969754d7fe9..0ff2b8300c28 100644
--- a/net/netfilter/nf_conntrack_standalone.c
+++ b/net/netfilter/nf_conntrack_standalone.c
@@ -177,7 +177,7 @@ static void ct_show_secctx(struct seq_file *s, const struct nf_conn *ct)
 	struct lsmcontext context;
 
 	lsmblob_init(&blob, ct->secmark);
-	ret = security_secid_to_secctx(&blob, &context);
+	ret = security_secid_to_secctx(&blob, &context, LSMBLOB_DISPLAY);
 	if (ret)
 		return;
 
diff --git a/net/netfilter/nfnetlink_queue.c b/net/netfilter/nfnetlink_queue.c
index e0512e91fed9..89db320f8109 100644
--- a/net/netfilter/nfnetlink_queue.c
+++ b/net/netfilter/nfnetlink_queue.c
@@ -314,7 +314,7 @@ static u32 nfqnl_get_sk_secctx(struct sk_buff *skb, struct lsmcontext *context)
 	if (skb->secmark) {
 		/* Any LSM might be looking for the secmark */
 		lsmblob_init(&blob, skb->secmark);
-		security_secid_to_secctx(&blob, context);
+		security_secid_to_secctx(&blob, context, LSMBLOB_DISPLAY);
 	}
 
 	read_unlock_bh(&skb->sk->sk_callback_lock);
diff --git a/net/netlabel/netlabel_unlabeled.c b/net/netlabel/netlabel_unlabeled.c
index 3b0f07b59436..60a7665de0e3 100644
--- a/net/netlabel/netlabel_unlabeled.c
+++ b/net/netlabel/netlabel_unlabeled.c
@@ -436,7 +436,8 @@ int netlbl_unlhsh_add(struct net *net,
 unlhsh_add_return:
 	rcu_read_unlock();
 	if (audit_buf != NULL) {
-		if (security_secid_to_secctx(lsmblob, &context) == 0) {
+		if (security_secid_to_secctx(lsmblob, &context,
+					     LSMBLOB_FIRST) == 0) {
 			audit_log_format(audit_buf, " sec_obj=%s",
 					 context.context);
 			security_release_secctx(&context);
@@ -491,7 +492,8 @@ static int netlbl_unlhsh_remove_addr4(struct net *net,
 		if (dev != NULL)
 			dev_put(dev);
 		if (entry != NULL &&
-		    security_secid_to_secctx(&entry->lsmblob, &context) == 0) {
+		    security_secid_to_secctx(&entry->lsmblob, &context,
+					     LSMBLOB_FIRST) == 0) {
 			audit_log_format(audit_buf, " sec_obj=%s",
 					 context.context);
 			security_release_secctx(&context);
@@ -551,7 +553,8 @@ static int netlbl_unlhsh_remove_addr6(struct net *net,
 		if (dev != NULL)
 			dev_put(dev);
 		if (entry != NULL &&
-		    security_secid_to_secctx(&entry->lsmblob, &context) == 0) {
+		    security_secid_to_secctx(&entry->lsmblob, &context,
+					     LSMBLOB_FIRST) == 0) {
 			audit_log_format(audit_buf, " sec_obj=%s",
 					 context.context);
 			security_release_secctx(&context);
@@ -1122,7 +1125,7 @@ static int netlbl_unlabel_staticlist_gen(u32 cmd,
 		lsmb = (struct lsmblob *)&addr6->lsmblob;
 	}
 
-	ret_val = security_secid_to_secctx(lsmb, &context);
+	ret_val = security_secid_to_secctx(lsmb, &context, LSMBLOB_FIRST);
 	if (ret_val != 0)
 		goto list_cb_failure;
 	ret_val = nla_put(cb_arg->skb,
diff --git a/net/netlabel/netlabel_user.c b/net/netlabel/netlabel_user.c
index 951ba0639d20..1941877fd16f 100644
--- a/net/netlabel/netlabel_user.c
+++ b/net/netlabel/netlabel_user.c
@@ -100,7 +100,7 @@ struct audit_buffer *netlbl_audit_start_common(int type,
 
 	lsmblob_init(&blob, audit_info->secid);
 	if (audit_info->secid != 0 &&
-	    security_secid_to_secctx(&blob, &context) == 0) {
+	    security_secid_to_secctx(&blob, &context, LSMBLOB_FIRST) == 0) {
 		audit_log_format(audit_buf, " subj=%s", context.context);
 		security_release_secctx(&context);
 	}
diff --git a/net/xfrm/xfrm_policy.c b/net/xfrm/xfrm_policy.c
index dbda08ec566e..173397c215d5 100644
--- a/net/xfrm/xfrm_policy.c
+++ b/net/xfrm/xfrm_policy.c
@@ -4213,6 +4213,7 @@ void xfrm_audit_policy_add(struct xfrm_policy *xp, int result, bool task_valid)
 	xfrm_audit_helper_usrinfo(task_valid, audit_buf);
 	audit_log_format(audit_buf, " res=%u", result);
 	xfrm_audit_common_policyinfo(xp, audit_buf);
+	audit_log_task_lsms(audit_buf);
 	audit_log_end(audit_buf);
 }
 EXPORT_SYMBOL_GPL(xfrm_audit_policy_add);
@@ -4228,6 +4229,7 @@ void xfrm_audit_policy_delete(struct xfrm_policy *xp, int result,
 	xfrm_audit_helper_usrinfo(task_valid, audit_buf);
 	audit_log_format(audit_buf, " res=%u", result);
 	xfrm_audit_common_policyinfo(xp, audit_buf);
+	audit_log_task_lsms(audit_buf);
 	audit_log_end(audit_buf);
 }
 EXPORT_SYMBOL_GPL(xfrm_audit_policy_delete);
diff --git a/net/xfrm/xfrm_state.c b/net/xfrm/xfrm_state.c
index 170d6e7f31d3..77f07e684429 100644
--- a/net/xfrm/xfrm_state.c
+++ b/net/xfrm/xfrm_state.c
@@ -2645,6 +2645,7 @@ void xfrm_audit_state_add(struct xfrm_state *x, int result, bool task_valid)
 	xfrm_audit_helper_usrinfo(task_valid, audit_buf);
 	xfrm_audit_helper_sainfo(x, audit_buf);
 	audit_log_format(audit_buf, " res=%u", result);
+	audit_log_task_lsms(audit_buf);
 	audit_log_end(audit_buf);
 }
 EXPORT_SYMBOL_GPL(xfrm_audit_state_add);
@@ -2659,6 +2660,7 @@ void xfrm_audit_state_delete(struct xfrm_state *x, int result, bool task_valid)
 	xfrm_audit_helper_usrinfo(task_valid, audit_buf);
 	xfrm_audit_helper_sainfo(x, audit_buf);
 	audit_log_format(audit_buf, " res=%u", result);
+	audit_log_task_lsms(audit_buf);
 	audit_log_end(audit_buf);
 }
 EXPORT_SYMBOL_GPL(xfrm_audit_state_delete);
diff --git a/security/integrity/ima/ima_api.c b/security/integrity/ima/ima_api.c
index b481bbc2e55f..7eb8784f15a4 100644
--- a/security/integrity/ima/ima_api.c
+++ b/security/integrity/ima/ima_api.c
@@ -365,6 +365,7 @@ void ima_audit_measurement(struct integrity_iint_cache *iint,
 	audit_log_format(ab, " hash=\"%s:%s\"", algo_name, hash);
 
 	audit_log_task_info(ab);
+	audit_log_task_lsms(ab);
 	audit_log_end(ab);
 
 	iint->flags |= IMA_AUDITED;
diff --git a/security/integrity/integrity_audit.c b/security/integrity/integrity_audit.c
index 5109173839cc..bca89ae72e3d 100644
--- a/security/integrity/integrity_audit.c
+++ b/security/integrity/integrity_audit.c
@@ -54,5 +54,6 @@ void integrity_audit_msg(int audit_msgno, struct inode *inode,
 		audit_log_format(ab, " ino=%lu", inode->i_ino);
 	}
 	audit_log_format(ab, " res=%d", !result);
+	audit_log_task_lsms(ab);
 	audit_log_end(ab);
 }
diff --git a/security/security.c b/security/security.c
index d6600bb81829..a66786c255aa 100644
--- a/security/security.c
+++ b/security/security.c
@@ -480,7 +480,31 @@ static int lsm_append(const char *new, char **result)
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
+	if (slot == LSMBLOB_INVALID)
+		slot = 0;
+	else if (slot >= LSMBLOB_ENTRIES || slot < 0)
+		return NULL;
+
+	if (lsm_slotlist[slot] == NULL)
+		return NULL;
+	return lsm_slotlist[slot]->lsm;
+}
 
 /**
  * security_add_hooks - Add a modules hooks to the hook lists.
@@ -2169,13 +2193,32 @@ int security_ismaclabel(const char *name)
 }
 EXPORT_SYMBOL(security_ismaclabel);
 
-int security_secid_to_secctx(struct lsmblob *blob, struct lsmcontext *cp)
+int security_secid_to_secctx(struct lsmblob *blob, struct lsmcontext *cp,
+			     int display)
 {
 	struct security_hook_list *hp;
-	int display = lsm_task_display(current);
 
 	memset(cp, 0, sizeof(*cp));
 
+	/*
+	 * display either is the slot number use for formatting
+	 * or an instruction on which relative slot to use.
+	 */
+	if (display == LSMBLOB_DISPLAY)
+		display = lsm_task_display(current);
+	else if (display == LSMBLOB_FIRST)
+		display = LSMBLOB_INVALID;
+	else if (display < 0) {
+		WARN_ONCE(true,
+			"LSM: security_secid_to_secctx unknown display\n");
+		display = LSMBLOB_INVALID;
+	} else if (display >= lsm_slot) {
+		WARN_ONCE(true,
+			"LSM: security_secid_to_secctx invalid display\n");
+		display = LSMBLOB_INVALID;
+	}
+
+
 	hlist_for_each_entry(hp, &security_hook_heads.secid_to_secctx, list) {
 		if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
 			continue;
@@ -2186,7 +2229,7 @@ int security_secid_to_secctx(struct lsmblob *blob, struct lsmcontext *cp)
 					&cp->context, &cp->len);
 		}
 	}
-	return 0;
+	return -EOPNOTSUPP;
 }
 EXPORT_SYMBOL(security_secid_to_secctx);
 
-- 
2.24.1


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

