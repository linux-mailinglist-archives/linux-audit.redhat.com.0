Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7C6432BB6B7
	for <lists+linux-audit@lfdr.de>; Fri, 20 Nov 2020 21:26:42 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-rkC7TfL7OkyQcmiKhS6p8Q-1; Fri, 20 Nov 2020 15:26:39 -0500
X-MC-Unique: rkC7TfL7OkyQcmiKhS6p8Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9F1C18BA294;
	Fri, 20 Nov 2020 20:26:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 782BF5D6AD;
	Fri, 20 Nov 2020 20:26:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E9B284BB7B;
	Fri, 20 Nov 2020 20:26:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AKKQTSi032328 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 15:26:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D321E101F0B6; Fri, 20 Nov 2020 20:26:29 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD523101F0D6
	for <linux-audit@redhat.com>; Fri, 20 Nov 2020 20:26:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4EFE3800B3A
	for <linux-audit@redhat.com>; Fri, 20 Nov 2020 20:26:27 +0000 (UTC)
Received: from sonic317-38.consmr.mail.ne1.yahoo.com
	(sonic317-38.consmr.mail.ne1.yahoo.com [66.163.184.49]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-190-Xq7szePEO1KdcSeLkZrZpw-1;
	Fri, 20 Nov 2020 15:26:24 -0500
X-MC-Unique: Xq7szePEO1KdcSeLkZrZpw-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1605903984; bh=lCwoQOPY3YlAqAiLhuxPVs/VumTMzrLLbDV0aQV6f5E=;
	h=From:To:Subject:Date:From:Subject;
	b=Cd5RryuY/3v9bQgapmn8jV1Yb9sXNniI+G3tjsOpH5vuYlhz01Fei+/jWOEI8DFd8IMQFqk8j0VjuQBrAsrcwyamPy3wzE7VG0Dq0Njet1EoC6uUIZ1CGzad25hcX17bqH4NjQs7E99TB5i/qMJyUOz4/tAZxRXtt541l+ZVeQaPhq0QKzTlmHt+uBv1HOQ734IVrtHv5alUUa2JHgU7ESS1q5D5/sXk4CwvmmhtJzcrkmBklgs+I0c8QxH+PniBUiSxzlBkL10E6DPjDGtcrONL9ZmVD7rj68L1C9kUd6iTLk4nUF+kBSYRN60SBMKe6x3dig9xeTYTNYLTB5wjDw==
X-YMail-OSG: kBvy1OQVM1mQoZLm0hBp_PE0.zTAPEmL7VtTFZXfhqDlIjbi0Tqsblv0rdlNczD
	.nKTeV7xFSRp2bVBbHp0Y.fZI.1pzDxI1I5KENKSy6Y6Krt6IPl8mKqqPyy064xhMTlNMFYLsIdI
	bteX1XZu6mCkS6Tuwv.erXRWNCbfaJ15zCLuYFFL8oNohEnODGW.2znQOG2Q_EVrptqMZYLhKNdW
	QEqV2KEbhN.4cFyTtKMTdVoP7i5rca6g8kuvLiehhgSuG_BM41N7L88MLcV_G5CzXQzrFfTNh_yK
	aeAw22qBS2gIlksN7FQJYehjWWYrMg7susWxZj6qL1nXLFS4g7a8bkE.xgRrrnVGMhFcbtCFsMPr
	pkjQbEcdupSOh3GWs2XHz9jxJA5iKkniQ6eZgi5K2bVrXnOCmcus0Kmb.ohIPAE7JcaI4C2Tn.8L
	ma_JGJtWimdeB0WBcQ8PBNiXUOBQMB9JnbZf7P6k98CdjyUUUqPByEYDJN9.WIQ_xCAETEqf4xzS
	yJ4H0c0_SThF36G18JVubRQpKzwmZIYgKEgWXf.FAKRW7XDtcoLWpKkGlZryyA2XQAbqXPvWdv8D
	Nc2iP38rlxw3WCHfNc89jSeRXDS8oGNIhiyFGDCjlswXEaxIamIS3yrNF07dhdK2boG.cwRDofxd
	ZeGbrUsuMZl18aWdmhPKuAPijTysT9OiebDZu3YR7dI_2DyQzp1dxNnaBmcjShm.JODcEwc_hTE2
	ZCk9mD0GGOeVhpXv7Px6lm4V2M30D2P9QhG_a7X8zsfDjoOuOtwla.DmMc2ewgNALSNf106b2Z_L
	EzF.JgjBzoYJHdnlnZmtwB7A.37qbyD3462oyWd1ORgQE1hOBxk3JEKVJ7Dd6wU2MZDlZNkjc2Pi
	HBrNCqH9UsY7gVLqLkPTDwkm.40bVtduTRf.vGm50280CRc1LBXIB9dXHVOG1NVVZjI50AVedIfm
	ZmhC3rcNvxKRZQdR5cq6hyjgqMdpkFU.k5fAjExJT.FYBEI6hEVi98o5eNcbwjFmtk1wguKWNlDS
	SCaOmSAitGL7FfCBXhValtmEq4aisGPztA6DgFSH98ue5UpigTtSd.4g9U.yfOufcp6..XGSb1LR
	gXCYf9RiwFljFXzClwlwPTjdxTa4iS9foQfrYGQEWanw1UIuF08DQmkkFi.Vc3OKX.XusXzT6Ix8
	tQAv_8WmuF4X4ZQTcFX_ulBsjjl2tJHxF7YhSIhqpMI64m7UQGeOQbWwFE6vqTue8VfDfDMNLSrs
	H.5_e1enL3zISpxIU9a7IX38mAn4oOpVsFts2rVbe8QKzS5UCBbasq6modB4loB.ON92iv9cEba1
	z8Gm.errEbJILOClpAO.QSuDA62_bS.PFOefmyPUbdnDxchquzCWyee.ChWXl03wKhvIhe5NoRvL
	lqbR5zCqLgbQOmbi34UF5HAbKkNa9lEvtnK5n0VUaDk1l_Hh2FPhJitP1eHNC3C_Fadt37oUa5AG
	wTsjrZK.rD4_eJs1lH7GKe4E7JG82JRl59K95c4q3MeVTfedR9ElaI7hRnBSWwDZR5XdG3ySXt0.
	44Nk_GnymLxA7UHweykolwq6LVwejXP8aFJbm8SSN2EAeDyyodExI.2AuAP0ude1ZX7vhl_9JSRs
	TM2APCGeKHr3mgR.bq1ixOnDdD5JK3A4EkKTfr1UDqSTJWEE5Ve6OwMPOBcvzQby2CZWRiY9QIuB
	JoEz07w9yEJCbn84zy9E0juaFDiI2.L8n8xVUAHysMLhV1v.kcPZ3s5s0d3w1l.uCeYSqqiBhEO1
	6hYMzuXKGbxzWzVB2bNp78MS6ADpub3s6FIlxWnyzT911._x2fncxayyzArfACNF3QhJvMpk0abX
	O77HCLG3xTde.4BLN_vwcPIq7kO.tTPv3uIv.75Z03VflqIwI.HhnrKUzvHGK1l2_FNmSGcpee0i
	gfr0M31V4PAj.PYgNDfizH3etSBwQsm_UaF.xJ7ilMwFy_pR5FAecLvnjnpTQDyHRnsZ5NcmWLB9
	RiYPkcYhJhEJgZija7U5riJjEcYTKPHTW1aHytAcGftMz_dx4WxW6bWz6l0k_0_lu0w7tZuAUe5N
	kH8rv891rBTa7_KE0sLSnXm.nIkrDkDQut_kV9snNSI_dofeLjoe28i.K4VXzZAmp9IC0NEbIn3P
	_u2c2arSOVTjhnljBIoiVQZ1YI7kTZvACY2jmcmNtX7KGJGbOkosBtfm.eA3s9V1P6qID1dxvaik
	CghGKW_HNwSk1h7ehvlkeQ7QTA5RfDAi095DSVn.sz_k6p0tpfwuKzZCBLBTAW09e3qMqT_oVA7i
	fuihMrStPiV3z1NajiJGQSO6rGEx9IVUjC45rOvDXYVuzTMLmjJ2zb3P6yxw_K.wIQgZcBCESo63
	ynRqpRzp4UVfFjRT26.8X_h_nwI9BEbaDfvOwGfNZGG63UjAb_e1fXw3iSAPcSz.bBDrkTnDZInJ
	AJrwrNjwoGOP4ZxCqwbVmRUfotqnxkfJd9cR8_u.CxWDZ1nEG_Y0EEZgjuW5qslEASneX9FRSBLP
	Yg6Sq9CgbfcqQf8zqTdisau9zN3HqeaJfWH86YVeKI5xx0FO.ijohM9Z_H0LbAtrXRfP9cqOoE0w
	1E12kwtRrBVxyMT2YLMA9Y2P4SjoLf2ZMrioAq192BvB0951GKED.V2EMDrWdJyCdNlZArq76G7g
	t.UIh5Y6iEMEm9fqZdy_aw2HPuX4ghHZSDuZa.5HFQHHr0DdYAgiILTKAc6YqNuMMbS5GLXOlLzp
	8LGkdcCe.S.VDDhzbg13PiJVKgfd_p5fMc3HEr8z1V0n5hXvPQdAfdKftxahkSHi7UkZD8DKjj_T
	.ub8GsU8qjOYUv_4qLHoFVlYVgWYKoXUHi63DEpt8F7WGJj20IOZPYHogF5AVhqNOh9YUrS0x3..
	fV35vK37aH3O1GRnIHrktbGUDW5i2hERU7RwbZ_DKZmERn06l8dG4lEZpPOhzeEp.b0LD6Zg6iUN
	4kiWK2pzT82c1oUTtLqXlDMUsd3W6C8uylf6C_zg8HcW0.anLenFmFeUKqkk1DR0YmlTnEqACIcy
	L3v42aO3TPVdTuN7YTCpVfcxuA2g4K1VfQwMBBAyraWqKwzx0QPgB2V.CEYaIg9CJxQZt5rnvLcr
	AKfRy6NADCmI51DeBv3zecwDcnjI7rGHZWqIY4OQz9hAPBDltolkreocuhVNzKIyLu3bVEvKkeuE
	zOCpSKdNlAMQWGspQyxe0TntfjKvvrrXKBU787Ab0uNcqjb7SDMaj4UzK3EyAt3qkby_Li1g3e1x
	TP8ZeNjrUEwxA3BPPX3AEm8fK9A39LlLygoN8rq9VfYXIvY_RgsONQ7_XaD0i3WoUmPUnaq1fQa4
	n0PryMkP9cyxNw2uS.Mk_oq2izictToCzgJEaA2c8My3XFhuIeXkEj4B32TCUbgWsRRs0lTAsjiQ
	-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic317.consmr.mail.ne1.yahoo.com with HTTP;
	Fri, 20 Nov 2020 20:26:24 +0000
Received: by smtp416.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID ec3a54960ce6754cc1bf168bca538386; 
	Fri, 20 Nov 2020 20:26:18 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v23 10/23] LSM: Use lsmblob in security_cred_getsecid
Date: Fri, 20 Nov 2020 12:14:54 -0800
Message-Id: <20201120201507.11993-11-casey@schaufler-ca.com>
In-Reply-To: <20201120201507.11993-1-casey@schaufler-ca.com>
References: <20201120201507.11993-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
Cc: john.johansen@canonical.com, linux-kernel@vger.kernel.org,
	linux-audit@redhat.com, linux-integrity@vger.kernel.org, sds@tycho.nsa.gov
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

Change the security_cred_getsecid() interface to fill in a
lsmblob instead of a u32 secid. The associated data elements
in the audit sub-system are changed from a secid to a lsmblob
to accommodate multiple possible LSM audit users.

Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: John Johansen <john.johansen@canonical.com>
Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
Acked-by: Paul Moore <paul@paul-moore.com>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
Cc: linux-integrity@vger.kernel.org
Cc: linux-audit@redhat.com
---
 include/linux/security.h          |  2 +-
 kernel/audit.c                    | 25 +++++++----------------
 kernel/audit.h                    |  3 ++-
 kernel/auditsc.c                  | 33 +++++++++++--------------------
 security/integrity/ima/ima_main.c |  8 ++++----
 security/security.c               | 12 ++++++++---
 6 files changed, 35 insertions(+), 48 deletions(-)

diff --git a/include/linux/security.h b/include/linux/security.h
index a7968dde27c6..dacd64d2d141 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -463,7 +463,7 @@ int security_cred_alloc_blank(struct cred *cred, gfp_t gfp);
 void security_cred_free(struct cred *cred);
 int security_prepare_creds(struct cred *new, const struct cred *old, gfp_t gfp);
 void security_transfer_creds(struct cred *new, const struct cred *old);
-void security_cred_getsecid(const struct cred *c, u32 *secid);
+void security_cred_getsecid(const struct cred *c, struct lsmblob *blob);
 int security_kernel_act_as(struct cred *new, struct lsmblob *blob);
 int security_kernel_create_files_as(struct cred *new, struct inode *inode);
 int security_kernel_module_request(char *kmod_name);
diff --git a/kernel/audit.c b/kernel/audit.c
index 9e3eec0a9c29..1f987ac23e90 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -125,7 +125,7 @@ static u32	audit_backlog_wait_time = AUDIT_BACKLOG_WAIT_TIME;
 /* The identity of the user shutting down the audit system. */
 static kuid_t		audit_sig_uid = INVALID_UID;
 static pid_t		audit_sig_pid = -1;
-static u32		audit_sig_sid;
+struct lsmblob		audit_sig_lsm;
 
 /* Records can be lost in several ways:
    0) [suppressed in audit_alloc]
@@ -1441,29 +1441,21 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 	}
 	case AUDIT_SIGNAL_INFO:
 		len = 0;
-		if (audit_sig_sid) {
-			struct lsmblob blob;
-
-			/*
-			 * lsmblob_init sets all values in the lsmblob
-			 * to audit_sig_sid. This is temporary until
-			 * audit_sig_sid is converted to a lsmblob, which
-			 * happens later in this patch set.
-			 */
-			lsmblob_init(&blob, audit_sig_sid);
-			err = security_secid_to_secctx(&blob, &ctx, &len);
+		if (lsmblob_is_set(&audit_sig_lsm)) {
+			err = security_secid_to_secctx(&audit_sig_lsm, &ctx,
+						       &len);
 			if (err)
 				return err;
 		}
 		sig_data = kmalloc(sizeof(*sig_data) + len, GFP_KERNEL);
 		if (!sig_data) {
-			if (audit_sig_sid)
+			if (lsmblob_is_set(&audit_sig_lsm))
 				security_release_secctx(ctx, len);
 			return -ENOMEM;
 		}
 		sig_data->uid = from_kuid(&init_user_ns, audit_sig_uid);
 		sig_data->pid = audit_sig_pid;
-		if (audit_sig_sid) {
+		if (lsmblob_is_set(&audit_sig_lsm)) {
 			memcpy(sig_data->ctx, ctx, len);
 			security_release_secctx(ctx, len);
 		}
@@ -2349,7 +2341,6 @@ int audit_set_loginuid(kuid_t loginuid)
 int audit_signal_info(int sig, struct task_struct *t)
 {
 	kuid_t uid = current_uid(), auid;
-	struct lsmblob blob;
 
 	if (auditd_test_task(t) &&
 	    (sig == SIGTERM || sig == SIGHUP ||
@@ -2360,9 +2351,7 @@ int audit_signal_info(int sig, struct task_struct *t)
 			audit_sig_uid = auid;
 		else
 			audit_sig_uid = uid;
-		security_task_getsecid(current, &blob);
-		/* scaffolding until audit_sig_sid is converted */
-		audit_sig_sid = blob.secid[0];
+		security_task_getsecid(current, &audit_sig_lsm);
 	}
 
 	return audit_signal_info_syscall(t);
diff --git a/kernel/audit.h b/kernel/audit.h
index 3b9c0945225a..ce41886807bb 100644
--- a/kernel/audit.h
+++ b/kernel/audit.h
@@ -9,6 +9,7 @@
 #include <linux/fs.h>
 #include <linux/audit.h>
 #include <linux/skbuff.h>
+#include <linux/security.h>
 #include <uapi/linux/mqueue.h>
 #include <linux/tty.h>
 
@@ -134,7 +135,7 @@ struct audit_context {
 	kuid_t		    target_auid;
 	kuid_t		    target_uid;
 	unsigned int	    target_sessionid;
-	u32		    target_sid;
+	struct lsmblob	    target_lsm;
 	char		    target_comm[TASK_COMM_LEN];
 
 	struct audit_tree_refs *trees, *first_trees;
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index b58b0048702a..b15222181700 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -113,7 +113,7 @@ struct audit_aux_data_pids {
 	kuid_t			target_auid[AUDIT_AUX_PIDS];
 	kuid_t			target_uid[AUDIT_AUX_PIDS];
 	unsigned int		target_sessionid[AUDIT_AUX_PIDS];
-	u32			target_sid[AUDIT_AUX_PIDS];
+	struct lsmblob		target_lsm[AUDIT_AUX_PIDS];
 	char 			target_comm[AUDIT_AUX_PIDS][TASK_COMM_LEN];
 	int			pid_count;
 };
@@ -993,14 +993,14 @@ static inline void audit_free_context(struct audit_context *context)
 }
 
 static int audit_log_pid_context(struct audit_context *context, pid_t pid,
-				 kuid_t auid, kuid_t uid, unsigned int sessionid,
-				 u32 sid, char *comm)
+				 kuid_t auid, kuid_t uid,
+				 unsigned int sessionid,
+				 struct lsmblob *blob, char *comm)
 {
 	struct audit_buffer *ab;
 	char *ctx = NULL;
 	u32 len;
 	int rc = 0;
-	struct lsmblob blob;
 
 	ab = audit_log_start(context, GFP_KERNEL, AUDIT_OBJ_PID);
 	if (!ab)
@@ -1009,9 +1009,8 @@ static int audit_log_pid_context(struct audit_context *context, pid_t pid,
 	audit_log_format(ab, "opid=%d oauid=%d ouid=%d oses=%d", pid,
 			 from_kuid(&init_user_ns, auid),
 			 from_kuid(&init_user_ns, uid), sessionid);
-	if (sid) {
-		lsmblob_init(&blob, sid);
-		if (security_secid_to_secctx(&blob, &ctx, &len)) {
+	if (lsmblob_is_set(blob)) {
+		if (security_secid_to_secctx(blob, &ctx, &len)) {
 			audit_log_format(ab, " obj=(none)");
 			rc = 1;
 		} else {
@@ -1582,7 +1581,7 @@ static void audit_log_exit(void)
 						  axs->target_auid[i],
 						  axs->target_uid[i],
 						  axs->target_sessionid[i],
-						  axs->target_sid[i],
+						  &axs->target_lsm[i],
 						  axs->target_comm[i]))
 				call_panic = 1;
 	}
@@ -1591,7 +1590,7 @@ static void audit_log_exit(void)
 	    audit_log_pid_context(context, context->target_pid,
 				  context->target_auid, context->target_uid,
 				  context->target_sessionid,
-				  context->target_sid, context->target_comm))
+				  &context->target_lsm, context->target_comm))
 			call_panic = 1;
 
 	if (context->pwd.dentry && context->pwd.mnt) {
@@ -1769,7 +1768,7 @@ void __audit_syscall_exit(int success, long return_code)
 	context->aux = NULL;
 	context->aux_pids = NULL;
 	context->target_pid = 0;
-	context->target_sid = 0;
+	lsmblob_init(&context->target_lsm, 0);
 	context->sockaddr_len = 0;
 	context->type = 0;
 	context->fds[0] = -1;
@@ -2435,15 +2434,12 @@ int __audit_sockaddr(int len, void *a)
 void __audit_ptrace(struct task_struct *t)
 {
 	struct audit_context *context = audit_context();
-	struct lsmblob blob;
 
 	context->target_pid = task_tgid_nr(t);
 	context->target_auid = audit_get_loginuid(t);
 	context->target_uid = task_uid(t);
 	context->target_sessionid = audit_get_sessionid(t);
-	security_task_getsecid(t, &blob);
-	/* scaffolding - until target_sid is converted */
-	context->target_sid = blob.secid[0];
+	security_task_getsecid(t, &context->target_lsm);
 	memcpy(context->target_comm, t->comm, TASK_COMM_LEN);
 }
 
@@ -2459,7 +2455,6 @@ int audit_signal_info_syscall(struct task_struct *t)
 	struct audit_aux_data_pids *axp;
 	struct audit_context *ctx = audit_context();
 	kuid_t t_uid = task_uid(t);
-	struct lsmblob blob;
 
 	if (!audit_signals || audit_dummy_context())
 		return 0;
@@ -2471,9 +2466,7 @@ int audit_signal_info_syscall(struct task_struct *t)
 		ctx->target_auid = audit_get_loginuid(t);
 		ctx->target_uid = t_uid;
 		ctx->target_sessionid = audit_get_sessionid(t);
-		security_task_getsecid(t, &blob);
-		/* scaffolding until target_sid is converted */
-		ctx->target_sid = blob.secid[0];
+		security_task_getsecid(t, &ctx->target_lsm);
 		memcpy(ctx->target_comm, t->comm, TASK_COMM_LEN);
 		return 0;
 	}
@@ -2494,9 +2487,7 @@ int audit_signal_info_syscall(struct task_struct *t)
 	axp->target_auid[axp->pid_count] = audit_get_loginuid(t);
 	axp->target_uid[axp->pid_count] = t_uid;
 	axp->target_sessionid[axp->pid_count] = audit_get_sessionid(t);
-	security_task_getsecid(t, &blob);
-	/* scaffolding until target_sid is converted */
-	axp->target_sid[axp->pid_count] = blob.secid[0];
+	security_task_getsecid(t, &axp->target_lsm[axp->pid_count]);
 	memcpy(axp->target_comm[axp->pid_count], t->comm, TASK_COMM_LEN);
 	axp->pid_count++;
 
diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
index c9f1f6bddab5..e2fd092a1023 100644
--- a/security/integrity/ima/ima_main.c
+++ b/security/integrity/ima/ima_main.c
@@ -469,7 +469,6 @@ int ima_file_mprotect(struct vm_area_struct *vma, unsigned long prot)
 int ima_bprm_check(struct linux_binprm *bprm)
 {
 	int ret;
-	u32 secid;
 	struct lsmblob blob;
 
 	security_task_getsecid(current, &blob);
@@ -479,9 +478,10 @@ int ima_bprm_check(struct linux_binprm *bprm)
 	if (ret)
 		return ret;
 
-	security_cred_getsecid(bprm->cred, &secid);
-	return process_measurement(bprm->file, bprm->cred, secid, NULL, 0,
-				   MAY_EXEC, CREDS_CHECK);
+	security_cred_getsecid(bprm->cred, &blob);
+	/* scaffolding until process_measurement changes */
+	return process_measurement(bprm->file, bprm->cred, blob.secid[0],
+				   NULL, 0, MAY_EXEC, CREDS_CHECK);
 }
 
 /**
diff --git a/security/security.c b/security/security.c
index f3f6caae392f..78aeb2ae7010 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1693,10 +1693,16 @@ void security_transfer_creds(struct cred *new, const struct cred *old)
 	call_void_hook(cred_transfer, new, old);
 }
 
-void security_cred_getsecid(const struct cred *c, u32 *secid)
+void security_cred_getsecid(const struct cred *c, struct lsmblob *blob)
 {
-	*secid = 0;
-	call_void_hook(cred_getsecid, c, secid);
+	struct security_hook_list *hp;
+
+	lsmblob_init(blob, 0);
+	hlist_for_each_entry(hp, &security_hook_heads.cred_getsecid, list) {
+		if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
+			continue;
+		hp->hook.cred_getsecid(c, &blob->secid[hp->lsmid->slot]);
+	}
 }
 EXPORT_SYMBOL(security_cred_getsecid);
 
-- 
2.24.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

