Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id D6BA2219547
	for <lists+linux-audit@lfdr.de>; Thu,  9 Jul 2020 02:40:22 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-2yXgF1UONHaXvJ-Ow7b3GQ-1; Wed, 08 Jul 2020 20:40:19 -0400
X-MC-Unique: 2yXgF1UONHaXvJ-Ow7b3GQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 166FF18FF661;
	Thu,  9 Jul 2020 00:40:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 831C27F8AB;
	Thu,  9 Jul 2020 00:40:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 915B772F7E;
	Thu,  9 Jul 2020 00:40:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0690e04Q002069 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 8 Jul 2020 20:40:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 606AA2166BA0; Thu,  9 Jul 2020 00:40:00 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BC572166B27
	for <linux-audit@redhat.com>; Thu,  9 Jul 2020 00:39:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53122924904
	for <linux-audit@redhat.com>; Thu,  9 Jul 2020 00:39:57 +0000 (UTC)
Received: from sonic310-23.consmr.mail.bf2.yahoo.com
	(sonic310-23.consmr.mail.bf2.yahoo.com [74.6.135.197]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-474-idHlrGskN0iWxVSCGlJ2yQ-1;
	Wed, 08 Jul 2020 20:39:53 -0400
X-MC-Unique: idHlrGskN0iWxVSCGlJ2yQ-1
X-YMail-OSG: T0gKP5IVM1me_zPBNgEDI6YvfmOjJewblk0YSEJ9Q3.gIC258yjH6WiyTUlxmEn
	7Sqryy139THHH_Wn5_4n0JmcBetKGmpl8OBOWraFU.OLUaag4ghD71baKo752cZgOSYW3EHqJGqZ
	.wE95ry8iy8GBsKmBLh0hsXkkFlNyv001zP9n15p2VFOV1BYxON7aSFvYB0eyT_ig4NH28C5C75A
	vcSWLTkAd7deU88Ozws3A3sDItnGnepoiJWPbLB7BzwuYSOl2sS.H9zD39H4jr01Z69Yp2wG9n2L
	tShu2FV0I6RWF2N45fLwoUjPDKx9GoN8anmKy2G8ojsK60tAebz0ijJzKwTPYYRsNM54Yadc2T_N
	ylSBTDCPsTsAFnkEybpmnRMUfrM47ArmYXiSDlX74CWx__Fcww0qIJJ..3ygm2tRn_B63A9hGmrJ
	ZHOBKoMqi2sp8P42FYWctI_njzGVJWaPI7qJYM2HfNeoH1RZ9Q6_oUTJBm3I7Y0f3EDpFtT4Mh6C
	Tpd74O3CtO0MMU4oze6VKts4wINx.Xm8fKjdY5bAuA9g9Scfpj5XHf0GAXfyyLx8NIZrTRUFWKI3
	tcdIDkED_uNu7gyU0FK3CpBxI5J1Dn8eaDZJCu6iYW6BpYn6RJvC49xU6eWNEcv58wNd0FpKv9eQ
	tsfeZe11dcCLRaY9MAeCe54Y8FZxib18DsN7i8CF0JXzWnoMBooBfi4dr.eNRVlQ3Upw9j4sZyXI
	v0vVxGZ.BSm.EbQFzooUeZVu0TtJ5zDmed3Ghu0P0N8NWxqlOaceq9gb0cFRmtaVIjWFd8.yzPD2
	WK79Pt3dbSR4OO7BTeEw1Z50Zc0TaYUkZO6i9b8CfCeKw4xwCii6Rku4JqRX4aPEtdWRssiZ.9NE
	lyScI6eDtgahkEZ5nQQD9i5gww7SyiJMo9s_uAk9aFFIIW.ysLsA7QLfTSgOzEGldgaGbM8wNTWC
	xEjKJBmVoIoST1pmG5mN.1OBidFVL4YOwto_NZgr2rwJbMLJYVB4BxOam_0n1e.QuNnQam6MJQ2B
	XA3.dEW2lWH2LrPInq.3wMGSvvs2lmFe7sNwHs1Xzp.Z2YkaZFVOsbMEwLqgctOYV.uPMXAH9gyH
	SS8O.xpwZVEnMqBYRXx5oqqhzKR35XSktw61Ze..1fYan3XBphaZNWigJpif1c202gy7QFXSGcWa
	DmLmh_09Koqy1Tx0tf3SzIXbdNjez7hcq9uK2gS2113sOv05XkRCv07GoWBgFrTKjbF5bBVwkSE1
	3RwtJqhPqME6w.SYt8z8kQz2o3Lp1UFNd4qgvK25XubQkqNK.Tgt_RMg.0_Cv9IpAqJouawjAhfq
	Z542yUTX8A1IR2EMWZY8G1NCN7GfXVKzZi9Smf2KTIwrcMoCq_S1v1XQ0ECT17Ee9bn.ff2R9nS8
	EHEKOuU.cD5wJAcql5GYy2aMJB6chNE6A
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic310.consmr.mail.bf2.yahoo.com with HTTP;
	Thu, 9 Jul 2020 00:39:53 +0000
Received: by smtp424.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 327910ebfcdadf1415e2725a120b5f3f; 
	Thu, 09 Jul 2020 00:39:49 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v18 20/23] Audit: Add new record for multiple process LSM
	attributes
Date: Wed,  8 Jul 2020 17:12:31 -0700
Message-Id: <20200709001234.9719-21-casey@schaufler-ca.com>
In-Reply-To: <20200709001234.9719-1-casey@schaufler-ca.com>
References: <20200709001234.9719-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: john.johansen@canonical.com, linux-audit@redhat.com, sds@tycho.nsa.gov
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Create a new audit record type to contain the subject information
when there are multiple security modules that require such data.
This record is linked with the same timestamp and serial number.
The record is produced only in cases where there is more than one
security module with a process "context".

Before this change the only audit events that required multiple
records were syscall events. Several non-syscall events include
subject contexts, so the use of audit_context data has been expanded
as necessary.

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
Cc: linux-audit@redhat.com
---
 drivers/android/binder.c                |  2 +-
 include/linux/audit.h                   | 13 +++-
 include/linux/security.h                |  9 ++-
 include/net/netlabel.h                  |  2 +-
 include/net/scm.h                       |  3 +-
 include/net/xfrm.h                      |  4 +-
 include/uapi/linux/audit.h              |  1 +
 kernel/audit.c                          | 90 ++++++++++++++++++-------
 kernel/audit.h                          |  5 ++
 kernel/auditfilter.c                    |  2 +-
 kernel/auditsc.c                        | 87 ++++++++++++++++++++++--
 net/ipv4/ip_sockglue.c                  |  2 +-
 net/netfilter/nf_conntrack_netlink.c    |  4 +-
 net/netfilter/nf_conntrack_standalone.c |  2 +-
 net/netfilter/nfnetlink_queue.c         |  2 +-
 net/netlabel/netlabel_unlabeled.c       | 16 ++---
 net/netlabel/netlabel_user.c            | 12 ++--
 net/netlabel/netlabel_user.h            |  6 +-
 security/integrity/integrity_audit.c    |  2 +-
 security/security.c                     | 71 ++++++++++++++-----
 security/smack/smackfs.c                |  3 +-
 21 files changed, 255 insertions(+), 83 deletions(-)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index ceb5987c7d76..99b1e65b193c 100644
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
index aabbbe6d9296..4693febcf41f 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -168,7 +168,9 @@ extern void		    audit_log_path_denied(int type,
 						  const char *operation);
 extern void		    audit_log_lost(const char *message);
 
-extern int audit_log_task_context(struct audit_buffer *ab);
+extern void audit_log_lsm(struct lsmblob *blob, bool exiting);
+extern int audit_log_task_context(struct audit_buffer *ab,
+				  struct lsmblob *blob);
 extern void audit_log_task_info(struct audit_buffer *ab);
 
 extern int		    audit_update_lsm_rules(void);
@@ -228,7 +230,10 @@ static inline void audit_log_key(struct audit_buffer *ab, char *key)
 { }
 static inline void audit_log_path_denied(int type, const char *operation)
 { }
-static inline int audit_log_task_context(struct audit_buffer *ab)
+static inline void audit_log_lsm(struct lsmblob *blob, bool exiting)
+{ }
+static inline int audit_log_task_context(struct audit_buffer *ab,
+					 struct lsmblob *blob);
 {
 	return 0;
 }
@@ -287,6 +292,7 @@ extern void audit_seccomp(unsigned long syscall, long signr, int code);
 extern void audit_seccomp_actions_logged(const char *names,
 					 const char *old_names, int res);
 extern void __audit_ptrace(struct task_struct *t);
+extern void audit_stamp_context(struct audit_context *ctx);
 
 static inline void audit_set_context(struct task_struct *task, struct audit_context *ctx)
 {
@@ -665,6 +671,9 @@ static inline void audit_ntp_log(const struct audit_ntp_data *ad)
 static inline void audit_ptrace(struct task_struct *t)
 { }
 
+static inline void audit_stamp_context(struct audit_context *ctx)
+{ }
+
 static inline void audit_log_nfcfg(const char *name, u8 af,
 				   unsigned int nentries,
 				   enum audit_nfcfgop op)
diff --git a/include/linux/security.h b/include/linux/security.h
index 02dc3b5ef57b..ab62f9040e19 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -179,6 +179,8 @@ struct lsmblob {
 #define LSMBLOB_INVALID		-1	/* Not a valid LSM slot number */
 #define LSMBLOB_NEEDED		-2	/* Slot requested on initialization */
 #define LSMBLOB_NOT_NEEDED	-3	/* Slot not requested */
+#define LSMBLOB_DISPLAY		-4	/* Use the "display" slot */
+#define LSMBLOB_FIRST		-5	/* Use the default "display" slot */
 
 /**
  * lsmblob_init - initialize an lsmblob structure.
@@ -241,6 +243,8 @@ static inline u32 lsmblob_value(const struct lsmblob *blob)
 	return 0;
 }
 
+const char *security_lsm_slot_name(int slot);
+
 /* These functions are in security/commoncap.c */
 extern int cap_capable(const struct cred *cred, struct user_namespace *ns,
 		       int cap, unsigned int opts);
@@ -553,7 +557,8 @@ int security_setprocattr(const char *lsm, const char *name, void *value,
 			 size_t size);
 int security_netlink_send(struct sock *sk, struct sk_buff *skb);
 int security_ismaclabel(const char *name);
-int security_secid_to_secctx(struct lsmblob *blob, struct lsmcontext *cp);
+int security_secid_to_secctx(struct lsmblob *blob, struct lsmcontext *cp,
+			     int display);
 int security_secctx_to_secid(const char *secdata, u32 seclen,
 			     struct lsmblob *blob);
 void security_release_secctx(struct lsmcontext *cp);
@@ -1371,7 +1376,7 @@ static inline int security_ismaclabel(const char *name)
 }
 
 static inline int security_secid_to_secctx(struct lsmblob *blob,
-					   struct lsmcontext *cp)
+					   struct lsmcontext *cp, int display)
 {
 	return -EOPNOTSUPP;
 }
diff --git a/include/net/netlabel.h b/include/net/netlabel.h
index 73fc25b4042b..216cb1ffc8f0 100644
--- a/include/net/netlabel.h
+++ b/include/net/netlabel.h
@@ -97,7 +97,7 @@ struct calipso_doi;
 
 /* NetLabel audit information */
 struct netlbl_audit {
-	u32 secid;
+	struct lsmblob lsmdata;
 	kuid_t loginuid;
 	unsigned int sessionid;
 };
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
diff --git a/include/net/xfrm.h b/include/net/xfrm.h
index c7d213c9f9d8..930432c3912e 100644
--- a/include/net/xfrm.h
+++ b/include/net/xfrm.h
@@ -672,11 +672,13 @@ static inline struct audit_buffer *xfrm_audit_start(const char *op)
 
 	if (audit_enabled == AUDIT_OFF)
 		return NULL;
+	audit_stamp_context(audit_context());
 	audit_buf = audit_log_start(audit_context(), GFP_ATOMIC,
 				    AUDIT_MAC_IPSEC_EVENT);
 	if (audit_buf == NULL)
 		return NULL;
 	audit_log_format(audit_buf, "op=%s", op);
+	audit_log_lsm(NULL, false);
 	return audit_buf;
 }
 
@@ -690,7 +692,7 @@ static inline void xfrm_audit_helper_usrinfo(bool task_valid,
 		AUDIT_SID_UNSET;
 
 	audit_log_format(audit_buf, " auid=%u ses=%u", auid, ses);
-	audit_log_task_context(audit_buf);
+	audit_log_task_context(audit_buf, NULL);
 }
 
 void xfrm_audit_policy_add(struct xfrm_policy *xp, int result, bool task_valid);
diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
index 9b6a973f4cc3..a5403efc2fdf 100644
--- a/include/uapi/linux/audit.h
+++ b/include/uapi/linux/audit.h
@@ -139,6 +139,7 @@
 #define AUDIT_MAC_UNLBL_STCDEL	1417	/* NetLabel: del a static label */
 #define AUDIT_MAC_CALIPSO_ADD	1418	/* NetLabel: add CALIPSO DOI entry */
 #define AUDIT_MAC_CALIPSO_DEL	1419	/* NetLabel: del CALIPSO DOI entry */
+#define AUDIT_MAC_TASK_CONTEXTS	1420	/* Multiple LSM contexts */
 
 #define AUDIT_FIRST_KERN_ANOM_MSG   1700
 #define AUDIT_LAST_KERN_ANOM_MSG    1799
diff --git a/kernel/audit.c b/kernel/audit.c
index d300e41ca443..9ca8445ca539 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -389,10 +389,11 @@ static int audit_log_config_change(char *function_name, u32 new, u32 old,
 		return rc;
 	audit_log_format(ab, "op=set %s=%u old=%u ", function_name, new, old);
 	audit_log_session_info(ab);
-	rc = audit_log_task_context(ab);
+	rc = audit_log_task_context(ab, NULL);
 	if (rc)
 		allow_changes = 0; /* Something weird, deny request */
 	audit_log_format(ab, " res=%d", allow_changes);
+	audit_log_lsm(NULL, false);
 	audit_log_end(ab);
 	return rc;
 }
@@ -1065,13 +1066,31 @@ static void audit_log_common_recv_msg(struct audit_context *context,
 		return;
 	audit_log_format(*ab, "pid=%d uid=%u ", pid, uid);
 	audit_log_session_info(*ab);
-	audit_log_task_context(*ab);
+	audit_log_task_context(*ab, NULL);
 }
 
 static inline void audit_log_user_recv_msg(struct audit_buffer **ab,
 					   u16 msg_type)
 {
-	audit_log_common_recv_msg(NULL, ab, msg_type);
+	struct audit_context *context;
+
+	if (!audit_lsm_multiple_contexts()) {
+		audit_log_common_recv_msg(NULL, ab, msg_type);
+		return;
+	}
+
+	context = audit_context();
+	if (context) {
+		if (!context->in_syscall)
+			audit_stamp_context(context);
+		audit_log_common_recv_msg(context, ab, msg_type);
+		return;
+	}
+
+	audit_alloc(current);
+	context = audit_context();
+
+	audit_log_common_recv_msg(context, ab, msg_type);
 }
 
 int is_audit_feature_set(int i)
@@ -1361,6 +1380,7 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 				audit_log_n_untrustedstring(ab, str, data_len);
 			}
 			audit_log_end(ab);
+			audit_log_lsm(NULL, false);
 		}
 		break;
 	case AUDIT_ADD_RULE:
@@ -1430,7 +1450,7 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 	case AUDIT_SIGNAL_INFO:
 		if (lsmblob_is_set(&audit_sig_lsm)) {
 			err = security_secid_to_secctx(&audit_sig_lsm,
-						       &context);
+						       &context, LSMBLOB_FIRST);
 			if (err)
 				return err;
 		}
@@ -1556,7 +1576,7 @@ static void audit_log_multicast(int group, const char *op, int err)
 			 tty ? tty_name(tty) : "(none)",
 			 audit_get_sessionid(current));
 	audit_put_tty(tty);
-	audit_log_task_context(ab); /* subj= */
+	audit_log_task_context(ab, NULL); /* subj= */
 	audit_log_format(ab, " comm=");
 	audit_log_untrustedstring(ab, get_task_comm(comm, current));
 	audit_log_d_path_exe(ab, current->mm); /* exe= */
@@ -1851,6 +1871,11 @@ struct audit_buffer *audit_log_start(struct audit_context *ctx, gfp_t gfp_mask,
 
 	audit_get_stamp(ab->ctx, &t, &serial);
 	audit_clear_dummy(ab->ctx);
+
+	if (type == AUDIT_MAC_TASK_CONTEXTS && ab->ctx->serial == 0) {
+		audit_stamp_context(ab->ctx);
+		audit_get_stamp(ab->ctx, &t, &serial);
+	}
 	audit_log_format(ab, "audit(%llu.%03lu:%u): ",
 			 (unsigned long long)t.tv_sec, t.tv_nsec/1000000, serial);
 
@@ -2108,30 +2133,47 @@ void audit_log_key(struct audit_buffer *ab, char *key)
 		audit_log_format(ab, "(null)");
 }
 
-int audit_log_task_context(struct audit_buffer *ab)
+int audit_log_task_context(struct audit_buffer *ab, struct lsmblob *blob)
 {
+	int i;
 	int error;
-	struct lsmblob blob;
-	struct lsmcontext context;
+	struct lsmblob localblob;
+	struct lsmcontext lsmdata;
 
-	security_task_getsecid(current, &blob);
-	if (!lsmblob_is_set(&blob))
+	/*
+	 * If there is more than one security module that has a
+	 * subject "context" it's necessary to put the subject data
+	 * into a separate record to maintain compatibility.
+	 */
+	if (audit_lsm_multiple_contexts()) {
+		audit_log_format(ab, " subj=?");
 		return 0;
+	}
 
-	error = security_secid_to_secctx(&blob, &context);
-	if (error) {
-		if (error != -EINVAL)
-			goto error_path;
-		return 0;
+	if (blob == NULL) {
+		security_task_getsecid(current, &localblob);
+		if (!lsmblob_is_set(&localblob)) {
+			audit_log_format(ab, " subj=?");
+			return 0;
+		}
+		blob = &localblob;
 	}
 
-	audit_log_format(ab, " subj=%s", context.context);
-	security_release_secctx(&context);
-	return 0;
+	for (i = 0; i < LSMBLOB_ENTRIES; i++) {
+		if (blob->secid[i] == 0)
+			continue;
+		error = security_secid_to_secctx(blob, &lsmdata, i);
+		if (error && error != -EINVAL) {
+			audit_panic("error in audit_log_task_context");
+			return error;
+		}
+
+		audit_log_format(ab, " subj=%s", lsmdata.context);
+		security_release_secctx(&lsmdata);
+		break;
+	}
 
-error_path:
-	audit_panic("error in audit_log_task_context");
-	return error;
+	return 0;
 }
 EXPORT_SYMBOL(audit_log_task_context);
 
@@ -2203,7 +2245,7 @@ void audit_log_task_info(struct audit_buffer *ab)
 	audit_log_format(ab, " comm=");
 	audit_log_untrustedstring(ab, get_task_comm(comm, current));
 	audit_log_d_path_exe(ab, current->mm);
-	audit_log_task_context(ab);
+	audit_log_task_context(ab, NULL);
 }
 EXPORT_SYMBOL(audit_log_task_info);
 
@@ -2261,6 +2303,7 @@ static void audit_log_set_loginuid(kuid_t koldloginuid, kuid_t kloginuid,
 	if (!audit_enabled)
 		return;
 
+	audit_stamp_context(audit_context());
 	ab = audit_log_start(audit_context(), GFP_KERNEL, AUDIT_LOGIN);
 	if (!ab)
 		return;
@@ -2271,11 +2314,12 @@ static void audit_log_set_loginuid(kuid_t koldloginuid, kuid_t kloginuid,
 	tty = audit_get_tty();
 
 	audit_log_format(ab, "pid=%d uid=%u", task_tgid_nr(current), uid);
-	audit_log_task_context(ab);
+	audit_log_task_context(ab, NULL);
 	audit_log_format(ab, " old-auid=%u auid=%u tty=%s old-ses=%u ses=%u res=%d",
 			 oldloginuid, loginuid, tty ? tty_name(tty) : "(none)",
 			 oldsessionid, sessionid, !rc);
 	audit_put_tty(tty);
+	audit_log_lsm(NULL, true);
 	audit_log_end(ab);
 }
 
diff --git a/kernel/audit.h b/kernel/audit.h
index 6ab012e5fe98..8efb68c21c2d 100644
--- a/kernel/audit.h
+++ b/kernel/audit.h
@@ -298,6 +298,11 @@ static inline void audit_clear_dummy(struct audit_context *ctx)
 		ctx->dummy = 0;
 }
 
+static inline bool audit_lsm_multiple_contexts(void)
+{
+	return security_lsm_slot_name(1) != NULL;
+}
+
 #else /* CONFIG_AUDITSYSCALL */
 #define auditsc_get_stamp(c, t, s) 0
 #define audit_put_watch(w) {}
diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
index 31732023b689..6c03e463668e 100644
--- a/kernel/auditfilter.c
+++ b/kernel/auditfilter.c
@@ -1107,7 +1107,7 @@ static void audit_log_rule_change(char *action, struct audit_krule *rule, int re
 	if (!ab)
 		return;
 	audit_log_session_info(ab);
-	audit_log_task_context(ab);
+	audit_log_task_context(ab, NULL);
 	audit_log_format(ab, " op=%s", action);
 	audit_log_key(ab, rule->filterkey);
 	audit_log_format(ab, " list=%d res=%d", rule->listnr, res);
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 1f7bd6b34ec7..54639da63dbf 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -455,7 +455,7 @@ static int audit_filter_rules(struct task_struct *tsk,
 {
 	const struct cred *cred;
 	int i, need_sid = 1;
-	struct lsmblob blob;
+	struct lsmblob blob = { };
 	unsigned int sessionid;
 
 	cred = rcu_dereference_check(tsk->cred, tsk == current || task_creation);
@@ -944,10 +944,12 @@ int audit_alloc(struct task_struct *tsk)
 		return 0; /* Return if not auditing. */
 
 	state = audit_filter_task(tsk, &key);
-	if (state == AUDIT_DISABLED) {
+	if (!audit_lsm_multiple_contexts() && state == AUDIT_DISABLED) {
 		clear_tsk_thread_flag(tsk, TIF_SYSCALL_AUDIT);
 		return 0;
 	}
+	if (state == AUDIT_DISABLED)
+		clear_tsk_thread_flag(tsk, TIF_SYSCALL_AUDIT);
 
 	if (!(context = audit_alloc_context(state))) {
 		kfree(key);
@@ -991,7 +993,7 @@ static int audit_log_pid_context(struct audit_context *context, pid_t pid,
 			 from_kuid(&init_user_ns, auid),
 			 from_kuid(&init_user_ns, uid), sessionid);
 	if (lsmblob_is_set(blob)) {
-		if (security_secid_to_secctx(blob, &lsmctx)) {
+		if (security_secid_to_secctx(blob, &lsmctx, LSMBLOB_FIRST)) {
 			audit_log_format(ab, " obj=(none)");
 			rc = 1;
 		} else {
@@ -1236,7 +1238,8 @@ static void show_special(struct audit_context *context, int *call_panic)
 			struct lsmblob blob;
 
 			lsmblob_init(&blob, osid);
-			if (security_secid_to_secctx(&blob, &lsmcxt)) {
+			if (security_secid_to_secctx(&blob, &lsmcxt,
+						     LSMBLOB_FIRST)) {
 				audit_log_format(ab, " osid=%u", osid);
 				*call_panic = 1;
 			} else {
@@ -1388,7 +1391,7 @@ static void audit_log_name(struct audit_context *context, struct audit_names *n,
 		struct lsmcontext lsmctx;
 
 		lsmblob_init(&blob, n->osid);
-		if (security_secid_to_secctx(&blob, &lsmctx)) {
+		if (security_secid_to_secctx(&blob, &lsmctx, LSMBLOB_FIRST)) {
 			audit_log_format(ab, " osid=%u", n->osid);
 			if (call_panic)
 				*call_panic = 2;
@@ -1462,6 +1465,52 @@ static void audit_log_proctitle(void)
 	audit_log_end(ab);
 }
 
+void audit_log_lsm(struct lsmblob *blob, bool exiting)
+{
+	struct audit_context *context = audit_context();
+	struct lsmcontext lsmdata;
+	struct audit_buffer *ab;
+	struct lsmblob localblob;
+	bool sep = false;
+	int error;
+	int i;
+
+	if (!audit_lsm_multiple_contexts())
+		return;
+
+	if (context && context->in_syscall && !exiting)
+		return;
+
+	ab = audit_log_start(context, GFP_KERNEL, AUDIT_MAC_TASK_CONTEXTS);
+	if (!ab)
+		return;	/* audit_panic or being filtered */
+
+	if (blob == NULL) {
+		security_task_getsecid(current, &localblob);
+		if (!lsmblob_is_set(&localblob))
+			return;
+		blob = &localblob;
+	}
+
+	for (i = 0; i < LSMBLOB_ENTRIES; i++) {
+		if (blob->secid[i] == 0)
+			continue;
+		error = security_secid_to_secctx(blob, &lsmdata, i);
+		if (error && error != -EINVAL) {
+			audit_panic("error in audit_log_lsm");
+			return;
+		}
+
+		audit_log_format(ab, "%ssubj_%s=%s", sep ? " " : "",
+				 security_lsm_slot_name(i), lsmdata.context);
+		sep = true;
+
+		security_release_secctx(&lsmdata);
+	}
+
+	audit_log_end(ab);
+}
+
 static void audit_log_exit(void)
 {
 	int i, call_panic = 0;
@@ -1585,6 +1634,7 @@ static void audit_log_exit(void)
 	}
 
 	audit_log_proctitle();
+	audit_log_lsm(NULL, true);
 
 	/* Send end of event record to help user space know we are finished */
 	ab = audit_log_start(context, GFP_KERNEL, AUDIT_EOE);
@@ -2183,6 +2233,21 @@ void __audit_inode_child(struct inode *parent,
 }
 EXPORT_SYMBOL_GPL(__audit_inode_child);
 
+/**
+ * audit_stamp_context - set the timestamp+serial in an audit context
+ * @ctx: audit_context to set
+ */
+void audit_stamp_context(struct audit_context *ctx)
+{
+	/* ctx will be NULL unless audit_lsm_multiple_contexts() is true */
+	if (!ctx)
+		return;
+
+	ktime_get_coarse_real_ts64(&ctx->ctime);
+	ctx->serial = audit_serial();
+	ctx->current_state = AUDIT_BUILD_CONTEXT;
+}
+ 
 /**
  * auditsc_get_stamp - get local copies of audit_context values
  * @ctx: audit_context for the task
@@ -2194,6 +2259,12 @@ EXPORT_SYMBOL_GPL(__audit_inode_child);
 int auditsc_get_stamp(struct audit_context *ctx,
 		       struct timespec64 *t, unsigned int *serial)
 {
+	if (ctx->serial && !ctx->in_syscall) {
+		t->tv_sec  = ctx->ctime.tv_sec;
+		t->tv_nsec = ctx->ctime.tv_nsec;
+		*serial    = ctx->serial;
+		return 1;
+	}
 	if (!ctx->in_syscall)
 		return 0;
 	if (!ctx->serial)
@@ -2588,7 +2659,7 @@ void __audit_log_nfcfg(const char *name, u8 af, unsigned int nentries,
 			 name, af, nentries, audit_nfcfgs[op].s);
 
 	audit_log_format(ab, " pid=%u", task_pid_nr(current));
-	audit_log_task_context(ab); /* subj= */
+	audit_log_task_context(ab, NULL); /* subj= */
 	audit_log_format(ab, " comm=");
 	audit_log_untrustedstring(ab, get_task_comm(comm, current));
 	audit_log_end(ab);
@@ -2611,7 +2682,7 @@ static void audit_log_task(struct audit_buffer *ab)
 			 from_kuid(&init_user_ns, uid),
 			 from_kgid(&init_user_ns, gid),
 			 sessionid);
-	audit_log_task_context(ab);
+	audit_log_task_context(ab, NULL);
 	audit_log_format(ab, " pid=%d comm=", task_tgid_nr(current));
 	audit_log_untrustedstring(ab, get_task_comm(comm, current));
 	audit_log_d_path_exe(ab, current->mm);
@@ -2634,11 +2705,13 @@ void audit_core_dumps(long signr)
 	if (signr == SIGQUIT)	/* don't care for those */
 		return;
 
+	audit_stamp_context(audit_context());
 	ab = audit_log_start(audit_context(), GFP_KERNEL, AUDIT_ANOM_ABEND);
 	if (unlikely(!ab))
 		return;
 	audit_log_task(ab);
 	audit_log_format(ab, " sig=%ld res=1", signr);
+	audit_log_lsm(NULL, true);
 	audit_log_end(ab);
 }
 
diff --git a/net/ipv4/ip_sockglue.c b/net/ipv4/ip_sockglue.c
index 176ac9ce6069..e5c7a1b94ca4 100644
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
index e38b5182e301..3c90b9a488d5 100644
--- a/net/netfilter/nf_conntrack_netlink.c
+++ b/net/netfilter/nf_conntrack_netlink.c
@@ -339,7 +339,7 @@ static int ctnetlink_dump_secctx(struct sk_buff *skb, const struct nf_conn *ct)
 	 * security_secid_to_secctx() will know which security module
 	 * to use to create the secctx.  */
 	lsmblob_init(&blob, ct->secmark);
-	ret = security_secid_to_secctx(&blob, &context);
+	ret = security_secid_to_secctx(&blob, &context, LSMBLOB_DISPLAY);
 	if (ret)
 		return 0;
 
@@ -655,7 +655,7 @@ static inline int ctnetlink_secctx_size(const struct nf_conn *ct)
 	struct lsmblob blob;
 	struct lsmcontext context;
 
-	ret = security_secid_to_secctx(&blob, &context);
+	ret = security_secid_to_secctx(&blob, &context, LSMBLOB_DISPLAY);
 	if (ret)
 		return 0;
 
diff --git a/net/netfilter/nf_conntrack_standalone.c b/net/netfilter/nf_conntrack_standalone.c
index 0ecd1040f4f1..de85317a366e 100644
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
index a4d4602ab9b7..15cabd7be92a 100644
--- a/net/netfilter/nfnetlink_queue.c
+++ b/net/netfilter/nfnetlink_queue.c
@@ -316,7 +316,7 @@ static u32 nfqnl_get_sk_secctx(struct sk_buff *skb, struct lsmcontext *context)
 		 * blob. security_secid_to_secctx() will know which security
 		 * module to use to create the secctx.  */
 		lsmblob_init(&blob, skb->secmark);
-		security_secid_to_secctx(&blob, context);
+		security_secid_to_secctx(&blob, context, LSMBLOB_DISPLAY);
 	}
 
 	read_unlock_bh(&skb->sk->sk_callback_lock);
diff --git a/net/netlabel/netlabel_unlabeled.c b/net/netlabel/netlabel_unlabeled.c
index c14a485ff045..99579fa49293 100644
--- a/net/netlabel/netlabel_unlabeled.c
+++ b/net/netlabel/netlabel_unlabeled.c
@@ -437,7 +437,8 @@ int netlbl_unlhsh_add(struct net *net,
 unlhsh_add_return:
 	rcu_read_unlock();
 	if (audit_buf != NULL) {
-		if (security_secid_to_secctx(lsmblob, &context) == 0) {
+		if (security_secid_to_secctx(lsmblob, &context,
+					     LSMBLOB_FIRST) == 0) {
 			audit_log_format(audit_buf, " sec_obj=%s",
 					 context.context);
 			security_release_secctx(&context);
@@ -492,7 +493,8 @@ static int netlbl_unlhsh_remove_addr4(struct net *net,
 		if (dev != NULL)
 			dev_put(dev);
 		if (entry != NULL &&
-		    security_secid_to_secctx(&entry->lsmblob, &context) == 0) {
+		    security_secid_to_secctx(&entry->lsmblob, &context,
+					     LSMBLOB_FIRST) == 0) {
 			audit_log_format(audit_buf, " sec_obj=%s",
 					 context.context);
 			security_release_secctx(&context);
@@ -552,7 +554,8 @@ static int netlbl_unlhsh_remove_addr6(struct net *net,
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
@@ -1521,14 +1524,11 @@ int __init netlbl_unlabel_defconf(void)
 	int ret_val;
 	struct netlbl_dom_map *entry;
 	struct netlbl_audit audit_info;
-	struct lsmblob blob;
 
 	/* Only the kernel is allowed to call this function and the only time
 	 * it is called is at bootup before the audit subsystem is reporting
 	 * messages so don't worry to much about these values. */
-	security_task_getsecid(current, &blob);
-	/* scaffolding until audit_info.secid is converted */
-	audit_info.secid = blob.secid[0];
+	security_task_getsecid(current, &audit_info.lsmdata);
 	audit_info.loginuid = GLOBAL_ROOT_UID;
 	audit_info.sessionid = 0;
 
diff --git a/net/netlabel/netlabel_user.c b/net/netlabel/netlabel_user.c
index 951ba0639d20..4e9064754b5f 100644
--- a/net/netlabel/netlabel_user.c
+++ b/net/netlabel/netlabel_user.c
@@ -84,12 +84,12 @@ struct audit_buffer *netlbl_audit_start_common(int type,
 					       struct netlbl_audit *audit_info)
 {
 	struct audit_buffer *audit_buf;
-	struct lsmcontext context;
-	struct lsmblob blob;
 
 	if (audit_enabled == AUDIT_OFF)
 		return NULL;
 
+	audit_stamp_context(audit_context());
+
 	audit_buf = audit_log_start(audit_context(), GFP_ATOMIC, type);
 	if (audit_buf == NULL)
 		return NULL;
@@ -98,12 +98,8 @@ struct audit_buffer *netlbl_audit_start_common(int type,
 			 from_kuid(&init_user_ns, audit_info->loginuid),
 			 audit_info->sessionid);
 
-	lsmblob_init(&blob, audit_info->secid);
-	if (audit_info->secid != 0 &&
-	    security_secid_to_secctx(&blob, &context) == 0) {
-		audit_log_format(audit_buf, " subj=%s", context.context);
-		security_release_secctx(&context);
-	}
+	audit_log_task_context(audit_buf, &audit_info->lsmdata);
+	audit_log_lsm(&audit_info->lsmdata, false);
 
 	return audit_buf;
 }
diff --git a/net/netlabel/netlabel_user.h b/net/netlabel/netlabel_user.h
index 438b5db6c714..bd4335443b87 100644
--- a/net/netlabel/netlabel_user.h
+++ b/net/netlabel/netlabel_user.h
@@ -34,11 +34,7 @@
 static inline void netlbl_netlink_auditinfo(struct sk_buff *skb,
 					    struct netlbl_audit *audit_info)
 {
-	struct lsmblob blob;
-
-	security_task_getsecid(current, &blob);
-	/* scaffolding until secid is converted */
-	audit_info->secid = blob.secid[0];
+	security_task_getsecid(current, &audit_info->lsmdata);
 	audit_info->loginuid = audit_get_loginuid(current);
 	audit_info->sessionid = audit_get_sessionid(current);
 }
diff --git a/security/integrity/integrity_audit.c b/security/integrity/integrity_audit.c
index 5109173839cc..00d8aa358651 100644
--- a/security/integrity/integrity_audit.c
+++ b/security/integrity/integrity_audit.c
@@ -41,7 +41,7 @@ void integrity_audit_msg(int audit_msgno, struct inode *inode,
 			 from_kuid(&init_user_ns, current_cred()->uid),
 			 from_kuid(&init_user_ns, audit_get_loginuid(current)),
 			 audit_get_sessionid(current));
-	audit_log_task_context(ab);
+	audit_log_task_context(ab, NULL);
 	audit_log_format(ab, " op=%s cause=%s comm=", op, cause);
 	audit_log_untrustedstring(ab, get_task_comm(name, current));
 	if (fname) {
diff --git a/security/security.c b/security/security.c
index c3fa4b7e9338..2b729d8c94b4 100644
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
@@ -2205,13 +2229,32 @@ int security_ismaclabel(const char *name)
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
+			"LSM: %s unknown display\n", __func__);
+		display = LSMBLOB_INVALID;
+	} else if (display >= lsm_slot) {
+		WARN_ONCE(true,
+			"LSM: %s invalid display\n", __func__);
+		display = LSMBLOB_INVALID;
+	}
+
+
 	hlist_for_each_entry(hp, &security_hook_heads.secid_to_secctx, list) {
 		if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
 			continue;
@@ -2241,7 +2284,7 @@ int security_secctx_to_secid(const char *secdata, u32 seclen,
 			return hp->hook.secctx_to_secid(secdata, seclen,
 						&blob->secid[hp->lsmid->slot]);
 	}
-	return 0;
+	return -EOPNOTSUPP;
 }
 EXPORT_SYMBOL(security_secctx_to_secid);
 
@@ -2742,23 +2785,17 @@ int security_key_getsecurity(struct key *key, char **_buffer)
 int security_audit_rule_init(u32 field, u32 op, char *rulestr, void **lsmrule)
 {
 	struct security_hook_list *hp;
-	bool one_is_good = false;
-	int rc = 0;
-	int trc;
+	int display = lsm_task_display(current);
 
 	hlist_for_each_entry(hp, &security_hook_heads.audit_rule_init, list) {
 		if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
 			continue;
-		trc = hp->hook.audit_rule_init(field, op, rulestr,
-					       &lsmrule[hp->lsmid->slot]);
-		if (trc == 0)
-			one_is_good = true;
-		else
-			rc = trc;
+		if (display != LSMBLOB_INVALID && display != hp->lsmid->slot)
+			continue;
+		return hp->hook.audit_rule_init(field, op, rulestr,
+						&lsmrule[hp->lsmid->slot]);
 	}
-	if (one_is_good)
-		return 0;
-	return rc;
+	return 0;
 }
 
 int security_audit_rule_known(struct audit_krule *krule)
@@ -2790,6 +2827,8 @@ int security_audit_rule_match(struct lsmblob *blob, u32 field, u32 op,
 			continue;
 		if (lsmrule[hp->lsmid->slot] == NULL)
 			continue;
+		if (lsmrule[hp->lsmid->slot] == NULL)
+			continue;
 		rc = hp->hook.audit_rule_match(blob->secid[hp->lsmid->slot],
 					       field, op,
 					       &lsmrule[hp->lsmid->slot]);
diff --git a/security/smack/smackfs.c b/security/smack/smackfs.c
index 177e69b43a52..2abdb45b3a61 100644
--- a/security/smack/smackfs.c
+++ b/security/smack/smackfs.c
@@ -185,7 +185,8 @@ static void smk_netlabel_audit_set(struct netlbl_audit *nap)
 
 	nap->loginuid = audit_get_loginuid(current);
 	nap->sessionid = audit_get_sessionid(current);
-	nap->secid = skp->smk_secid;
+	lsmblob_init(&nap->lsmdata, 0);
+	nap->lsmdata.secid[smack_lsmid.slot] = skp->smk_secid;
 }
 
 /*
-- 
2.24.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

