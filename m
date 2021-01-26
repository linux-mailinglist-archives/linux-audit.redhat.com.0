Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2E05E30440E
	for <lists+linux-audit@lfdr.de>; Tue, 26 Jan 2021 17:58:19 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-yCtc0r63PcCedGDJxhKODw-1; Tue, 26 Jan 2021 11:58:15 -0500
X-MC-Unique: yCtc0r63PcCedGDJxhKODw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06139802B49;
	Tue, 26 Jan 2021 16:58:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BB971880F;
	Tue, 26 Jan 2021 16:58:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 194234BB7B;
	Tue, 26 Jan 2021 16:58:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10QGsccX028798 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 26 Jan 2021 11:54:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8C18DA9A11; Tue, 26 Jan 2021 16:54:38 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 85A1EA7FA1
	for <linux-audit@redhat.com>; Tue, 26 Jan 2021 16:54:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33C0F8015A2
	for <linux-audit@redhat.com>; Tue, 26 Jan 2021 16:54:36 +0000 (UTC)
Received: from sonic307-15.consmr.mail.ne1.yahoo.com
	(sonic307-15.consmr.mail.ne1.yahoo.com [66.163.190.38]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-9-YWLv_KbnNSmYh1xmrJtvpA-1;
	Tue, 26 Jan 2021 11:54:32 -0500
X-MC-Unique: YWLv_KbnNSmYh1xmrJtvpA-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1611680071; bh=cVvdEKd+j67O6YAjM5HeqM+LHOy/fRFCf5csP0z/nM8=;
	h=From:To:Subject:Date:From:Subject:Reply-To;
	b=E3mLIUdPKffi4mPtzcLW1Ueq83b8+Wk9j8OTmLdy8ut9Jj6scqfWoGRxBhdmPBK/mtJu7A+9ksg8U2XX6HhbuMat+HWymmrKA+rZ5en24ZYBi1dECjieSHkR91y/5cpdn2mBjnEUnKHZhL52237oblTiOhCJacR9O/G/RBdEzwUIzI/QvsfmU0VxwqZzuYF8Vn47PjwNmne4IP4TWV5eGibJaDS9OJb/KjedAQugzPv4mKiHYSDJ1gyr9+cblFD3YScUknTvJ4BXccgM4knuQNdv88sxU0ZeboDDH4j8f8GI4bDAYO02J/ZYgzXZNPX1MUwoRoiZeaKp5aFYRbDJZg==
X-YMail-OSG: PE9GbSYVM1nQfBdkjVX0nrpwoHt02LwOAU_varyi7srP6yZwGMyrL8Vz5h.7Jy3
	XxdI7XQWX1ca5O78y6OID.APZzcuuWRr91nY19Gf.VzI27q3g2nOrfRZeEqqweGGJ5_jyo8ryXhS
	mAJKGVzfWwjWrsOUOZJWcHbFaBcKMRkDeczuzsT.MqTkcwZh_X28eWK3bIpVXOHSIjOINkFG_OpE
	XONBhjS3kCyVsvAcYi_WjIVzoEqkYBoWrWrxOu_YNucDuBhibMYnUKcd8nD1LCIMD20Vh4o1G6mv
	7PmzJquJevTiz4PnxrPmbnc0S1n2GG3Waobvu61EdBsdo4O0TvhVURlxbkx5OTogwFPLXoV564qx
	KV3wWZa7SUHILvEPxZ33YJzQ09VJEwVJqZBVULfHpI1rkyigKHEfwuUQUbRM.HGziKF.eHL4aL0U
	MCAhALUe1ClZE8Wxx_cFG4nryp_z3ubJu3Dp48fVM.GR88X1EzKDtE7BgH5sn82mUYTLj..2vQh.
	ldcGWRIa2nl7f0pmKKFgrgnxHFE.FAf_7DZMwkaKIDqcNcxudXvi1VHv5A81vlV4ueN4T2vBDhyi
	ckxtAjsVHzj135Xtrjk1h4Qxr_rhYwqpJJP5oZ9Ap5.ozPTz_yVZZzemE322S3ZUZWP4_npiwfjf
	qgZ13sNS7QGFsl5gTH_En.rQWKoAeBrKjhq_15L_w9B.lTPtGyDozzwSgrkxYSjPd69.PoHPLKbR
	Sq3BMzFYymp4Z5UvTdQ_8OT.FB6Yyb2Pk0im_zAbDrOzPrbbsOu5ohLyt3V2afV.P0apEIW5Cxfq
	OSYSj7QHMEK0_.WemUNR9RVngUGco2yxlk2qf1akr7Ho20iPTTZ.jRFL9HYGKT1au8lDKO2tAdA_
	Tnn09bUx5KvqafT6etWPqnGFAvbrgITbE5jhu.IAXvS0FaD9ECs_9NYW7ysczh_kzly5H1PXzE6h
	kQpwbZthR1_kiWhaNBlSGlLQKSK2E8HUBbVNG3ktFEJPQiLMhfwkZaIcq0C7QJYFx3bLzWPUnjr7
	n0vvDyBlgehrRDjN6t2tSUDq8n0uugwlGGoksL7Cg8KTUT6hXIanHFMjtOwU8bqcZZBBerGAc5d6
	d5Bed_rusH37cJedKTTLe7aCYkMtDt12peRKj_whZ5wcDKnzSE6.vtjyKy4BEVjFHKW6s_LMyikw
	it8nM8ZI.yAgcoXh8Hw8OnO.J5Ae_UCd3snjVgWntGlels7gUQiuX1eawlzVU90_xa_uKsZKH1pq
	jWcPd1mhwAg1jPy_c9qoGzjzTEtgp4T.QPZRFykKj_8nklOiqyfQXxTlmdPFKOjNG3x3pM_pHQQy
	nDVLrXbRFBkmvc6ABHXL4sYRMy.QuCBPqCWB.rZhkGQyW69CPO9b2F..N9DqJsAszm6pINTd7apI
	n55JYqwTI5vI3nIp7xsew88NPmy0WYbmkcoDSG.4sq_T63L_2qW07pqfQmtjvW_bglZYghOx7RcB
	Kv.xY5gZUkUTBRuRKvzE_vhXugNbrRcNWd3SMMTlK7YTJFacvXv15se8LWHhyBhbr4lzUA1j8HYV
	zCGUECwJpHP6JO0gj2Z8HfPDFItR0NLw5ezir.FDW5KFW1_H0zyqPmb3mRy_fG18N23y6NcZASxh
	fwZasHzvOJDFdzIW0doEhMNbTL1hwrE5IDOHCnhQCEWGeH3S0TWiuR9xCfIAN4RXAbJfxo_5x4k0
	b4piH9YTvq66cQpb3sHOv2ai7y29.ztRU.GCQG3IsVt3jE57E9oKT3iCAPgKKNpn5U8j7ZymY8O9
	7Uy6ea2UmB8I07FZTykl3YUJwx5Fs71HcRkr0o7f_cMESVMXef_aj67bSNDu0zi.pAaLFrx2yU27
	Z4m8lg1jtUPh3d9dtM_kOthtjVjM1T8aD2em_.qKDqeVyKNqLkpM8EJzKFofPlVlmYabm_7J8MC7
	QTLafLBgm_l1eYCza0zTFR1BAq5trYfj4utYaZPmOh6WOhR7w4XkFZ27Dw91sNLe6kmPKenjt8Od
	0IOh1gtQLJrVezxH5eylu_ixWF4SQjRrtw50nE9anfVGVkEQzGaUomb1imPPSQVV8qTrHhFa94Fu
	zzGsEWwmtSumU4gmXbF0AMbOoDWLDFrT2jrJXe1mLMxhYm8c8Gn4d0.oQw8eC5Ku.rN2UeGmKi5.
	Kec2UEV46CxyxVzmmt43M3axUXgRhB_tG4T2OFqdOIT4e6sItKXSEeJEvprZ7EXSpISZAYp8ogbU
	3YkgJL0zzKQKXbRVFbKTSORDFKefmEmfW7QyblioIx7QjHtrzqe_IKhARoJ_CFjBTsr.oRvZm.5f
	01XVUZz0CsxZ1IC0twI4cPRQhK5N4975YCBt4zLWblvygKbN15epYVgnXLc4ejddILSLBiS84AL5
	vblH.BI42LgEeU8a1jgYRAEytKoxAEX_zN.f8OgfkkvRsobvHBnClee00OVG12IG9Kb7i6kNyuFw
	cM7PK611suJgOwr.G3f1kKlm5Qaq07Nq.9w.SDGTg95qP_f8aEox_xsx8IhorlR3Y9cYZlgzFPHP
	vfU7JVTdrosWtQ7VKt7orlxHew6gPsRUrNZ1fLWMwH4QQMO7c.._n81yGEr8ui2wJx0Lrxcte2Qf
	V8bQjcPfiXfKA5x.59NYyw4Ja9VvjLR96O21SHQlnNW8L6flDxmURrAmgY8OWKcbAOYoxVcYHnnK
	sxjJcDs2wTZcnByek9qv9_x9JHbdD7ZM99YxgDB.PJOQmFNVi6uGenE9Dgow4tBOMW2VE4qyTNKN
	Mtu2wR9SVsHOxyrH6ceTmG6dtaumg0NvJE8fGAePUnyO_ArvgKM5VIp7EelLHEU.oCx5WYageQpN
	i12hZgV4_TriEMYLXMjqFHbmQaF0HND1ToAbl33v7wSOUFnYYw9j01N7rH9f1E503v9MnbJhtxLW
	iOVA2qtu__aPFfj.HKsPR.qFmK_T1w5CN8QaS63NO0EgdoKjCUYd6VoANNZQ1Y8Rqq95bgcNMzrg
	hVvwGcdRIqVRRc_QDIEXLo3w_m9MhCwCcs0LiJXwL3ObWwyO6J3EaX0iaE_dKCVh0u1o52vN2aJs
	YauezpL4wSS4nqsWjWMFgPUuzyQ37p6C91N6XTcHPXGYVklcFocmvmL9OhiyWfIeCVEEooVtwzFd
	tNvxRP8QG_nziY7Qh0F_Rxpynip2f4dozp7w1L1iQ
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic307.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 26 Jan 2021 16:54:31 +0000
Received: by smtp410.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 6a837b0801d3b54812419bec914e9161; 
	Tue, 26 Jan 2021 16:54:30 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v24 12/25] LSM: Use lsmblob in security_cred_getsecid
Date: Tue, 26 Jan 2021 08:40:55 -0800
Message-Id: <20210126164108.1958-13-casey@schaufler-ca.com>
In-Reply-To: <20210126164108.1958-1-casey@schaufler-ca.com>
References: <20210126164108.1958-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
index e8d73b0220e4..e4a4816f1b94 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -468,7 +468,7 @@ int security_cred_alloc_blank(struct cred *cred, gfp_t gfp);
 void security_cred_free(struct cred *cred);
 int security_prepare_creds(struct cred *new, const struct cred *old, gfp_t gfp);
 void security_transfer_creds(struct cred *new, const struct cred *old);
-void security_cred_getsecid(const struct cred *c, u32 *secid);
+void security_cred_getsecid(const struct cred *c, struct lsmblob *blob);
 int security_kernel_act_as(struct cred *new, struct lsmblob *blob);
 int security_kernel_create_files_as(struct cred *new, struct inode *inode);
 int security_kernel_module_request(char *kmod_name);
diff --git a/kernel/audit.c b/kernel/audit.c
index e70bbd6b91c4..f6af7b27a6fa 100644
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
@@ -2352,7 +2344,6 @@ int audit_set_loginuid(kuid_t loginuid)
 int audit_signal_info(int sig, struct task_struct *t)
 {
 	kuid_t uid = current_uid(), auid;
-	struct lsmblob blob;
 
 	if (auditd_test_task(t) &&
 	    (sig == SIGTERM || sig == SIGHUP ||
@@ -2363,9 +2354,7 @@ int audit_signal_info(int sig, struct task_struct *t)
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
index 7883b8ac8ea4..c766502b58f2 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -111,7 +111,7 @@ struct audit_aux_data_pids {
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
@@ -2421,15 +2420,12 @@ int __audit_sockaddr(int len, void *a)
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
 
@@ -2445,7 +2441,6 @@ int audit_signal_info_syscall(struct task_struct *t)
 	struct audit_aux_data_pids *axp;
 	struct audit_context *ctx = audit_context();
 	kuid_t t_uid = task_uid(t);
-	struct lsmblob blob;
 
 	if (!audit_signals || audit_dummy_context())
 		return 0;
@@ -2457,9 +2452,7 @@ int audit_signal_info_syscall(struct task_struct *t)
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
@@ -2480,9 +2473,7 @@ int audit_signal_info_syscall(struct task_struct *t)
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
index 175a79076569..e4ed01b1919a 100644
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
index 9241245a9d4b..45824239cb2f 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1739,10 +1739,16 @@ void security_transfer_creds(struct cred *new, const struct cred *old)
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
2.25.4

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

