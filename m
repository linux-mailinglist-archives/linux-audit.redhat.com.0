Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3496F304486
	for <lists+linux-audit@lfdr.de>; Tue, 26 Jan 2021 18:07:45 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-Oinh61lGPdysH3xZux0w_g-1; Tue, 26 Jan 2021 12:07:42 -0500
X-MC-Unique: Oinh61lGPdysH3xZux0w_g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E39E107ACF5;
	Tue, 26 Jan 2021 17:07:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E028710016F7;
	Tue, 26 Jan 2021 17:07:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9DD975002C;
	Tue, 26 Jan 2021 17:07:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10QH7GdN030756 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 26 Jan 2021 12:07:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E030E2026D38; Tue, 26 Jan 2021 17:07:15 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D846C2026D76
	for <linux-audit@redhat.com>; Tue, 26 Jan 2021 17:07:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48E1F101A561
	for <linux-audit@redhat.com>; Tue, 26 Jan 2021 17:07:12 +0000 (UTC)
Received: from sonic314-26.consmr.mail.ne1.yahoo.com
	(sonic314-26.consmr.mail.ne1.yahoo.com [66.163.189.152]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-205-WfPvDEa9PYG_8rlK0qzofA-1;
	Tue, 26 Jan 2021 12:07:09 -0500
X-MC-Unique: WfPvDEa9PYG_8rlK0qzofA-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1611680828; bh=l06ZNd8NpCUgSjD9LOYDGpbVyStsVE0bw4DjSdQaoPr=;
	h=From:To:Subject:Date:From:Subject:Reply-To;
	b=ORWdeVgD1dojhl2z3PotxWz537sBKOo63wNJq/uVNRBzOGBksjsBoMRMAKwtoK1kRK+QbUxr1nipYFeeofMqazvpvq9oFAv4FHBack3fixtsmYycH+foghBhQkra7gtUoGXfc4NqplxzM1OiYvO5oj6o1oczIk0oC/tH87jG2GtvWlWSw3s0Ze1Cng4plvmlbbOIoSX9Aed3uHRItm1JR728WoVtmmctF0daK/OpzzaXg5LptkqgZ1BfRjCbse7+uxoK0y4M70lZ5Xoa2ZLW8DmFLohhsNI2fvhs6MvURQquyXmwQc+s/S4mLu3VguwruVeQ3DGHingwj4LdNdqN7g==
X-YMail-OSG: ievRcNYVM1mbt8.NiqvlbX9i4dbPQLxAotXhLnLUavA7mJ1JAoTJlGAd6YpDWEE
	pTnKogol68Nozb4txxClRc.Q1BtkMN7EhhQ2z60vEQZERNl06iCyoomdYiV46ZyuKnhBfRe81UiY
	ZDJw46TYot0T5iO.19_tiVNVQpEAHqwIOvBveotMxxeS2P37NQKo7vveqfyiO28XRVhn2LmLzsTA
	8H6_qvi_xRoAhtVCRcnKF4axXklcWnBoVz2E.xnJxCJgDZNv728JvNH02T4j4WbLAf5wNCsfu9zr
	VEwaenEwtjtZ0UrBM6CGU3mE.m2H8c5vhGb24m_m83k9J6Q0vo79XW93iG7g7zQwuIJXqtcPhkpM
	zHzEwEZuonAVlWQDAAIK5ud1jwB7hSj_34J0IIZT.e78CUyb4_ea6sIBDViaJTe2lFZUjMJjgv1N
	ZrLone9Erq86S0GwVdc4WztDQ7KjGFPIAKS_S8w_GrzShBelLTmxJAEYwuz1tjAO7KBypSx.QPb3
	391kC3MhPDrzldN9A3.dV8UlaiKxo6xtMwUxjD6zn0rx1QBSgPCK_oT7.WU2YVPnOKH0j6tA2Rqo
	74iQUBnvj6GDjrAw9zSEY1cAF1pU1RSbcNjUugxWQ8wjf8r2NNsjTCQ2nFNJDpFNAPYAT1LxCeIq
	dMkwBpZX5hqnUKMQZC7ZE4ONaOcobH6YUM9L1go_fuljK1R57A9RsOP4RqHEhB74dqTeB3H7_Efq
	6s4fSg9SK2guIVxWeILlpBML8l3EIsq6fnn1beD0yiwTbBMtnjnmf4T5MheGUZEBw.MfioU0briZ
	dV0JYffqdgDewVRtMzvsJkZeE4Viq4o9n9SkWXleFlrVWW6rB.DbQj3WQhcuyYBhk7tB8tmOP2fL
	4Q3qPGdyLirQ4jMhTGG.xkC5ZgLDMYnAjxwvfcMapTBuTQkFLDXA9DTAmHycmA2b6M9MR.iul29t
	lsLHcvZ3baxSGn46MyoZQnWnCnDGUUUe4A2U8FbyFQIlhamUyqTEg0RzwCGY2xMhwGirIuo2qtjg
	W2hn0Lr40y2EKoTI5HzioZeBEIgU8mQ0h8brD4_qCWBPibZ4vG22x1rt4M9PdOfe8fys5ediWzlT
	cdczCL7yo2iKQ6JAxn5QWV7wy3z3SvPtiyah0eQUfZ7G6jpUaXj99jY7MR6W3bka9hv3BduFWAmq
	AkDgDAJt6HmdbnPLJ._eVUXf03Dl7ePDxCVouLGNQSg1CsyAItqyOtfnO6rWD63mL36fY478IggV
	daa672Rnluxowm_aUN7Az1TwrDpHgpd6QdvFR3LgYKLzZuM0kbOxs09o6BV.fx9g8qnMPpHRFFhx
	aWrOCKJ.tZa3EmE20xe_z2AU8RpacyP4UzXUq.IEJC7o0NcsJUepDXuyGf00SZVfGLLf8WoEQUM3
	UMWbDXW9eX5KyNZ1o3ZEU5CLiDHb3NEjh9Wnu_dlM0y857NufVUIxWvqq.KobPmCgTRYc6IFQWCg
	xn.k8.z_I272VJ5d1uFpqIL4jhhAKXONONzGNeX1lI5NaV3gJgOXbB55p9WvGzHOxuvcU_wfO7GF
	wi3DwMwvNFsUKtmF0FiC_OX7d0G4h6UK_Jk6xgghj0PR5E_BkF9xVMIEdYHjJuQiyx4bWibCVD1Q
	yFOMUw3JrTLDmh1NibKfezV34E1LwEoEj1tf5tZEm62ALMB22l1YqFoPfs3Yculgeat6.ZNe3DI9
	FdY_QGHZDT.00Kl3_VvbSVl2ZSigQYp3Sind.HX1bY8P1awXRqm08rdeSwiHS35xpP_n70QGLp_j
	gvYbFejD1rsj3oyLsEyIwMhC.RhX7qfnQHBPhRvgG8bT7PRVuCEXMc58gynHIJnAGkEEvS3s80I5
	rb1ozcpywqubVT5.qJmf34gRTU1F92qkxDHVSgUZl8nxoE_JR51dkOPUyrU9uq3hnbrC_EZfb7Xq
	kUiWVSKWcZdQQVVBVvQn7zkQNvlgYIed2snE_2DJrQdsmvlwhsPNEpSzlDSAN8AHRRMAv9kMEmH4
	sNXqi8PYbtcneR.NvDiB4f6YtpO9_2HI2hKh_qGqLE81spRybHkUs7hKFxWKpsn7jT6ubrVY15jr
	nataD8kN_OY1KEl0xWArsx60HOxZWMzVSfkcCLC9OOpLUDzImOa3FwRbMkmzMIbUEDy2Lur87m7I
	xYBFuH6BENjaibgrT4r9xlDeQkJ5KQuforsJm3iVWGd6_802D0oJikSBkJ.Jkn2w6eCBRVLgBM7b
	UL5mlKlWglZsEQ_sZpdM154w4588WbcAGf68lXBiFYXZ5H7CsdD.mT70aYE.RnYnHzvhtAgRNdPA
	SdAxNU08UDcUMNNpVFgI_tIPJlEQF__v493UadmlBCuU4WKAm6FZEVkoauJgeV6p58z19baZQQ5z
	TLp3bnFd9qFjJkFc1kHt2.1iidLqLDu_zizmABXggs6ceG7GbQfkNQHgwXxFbxDiC6G6A64pVnPD
	PTXM_Prm.7CttYD.9LIZSEz5xD04HjpuMekhv.xI4IFPTmtcX46hE0DgIAqDNXprfzQrI8AZVH3l
	SmBU4t.9WGqHb65ZOnvDn5iEpLXduCxcz3LDLjYU04kocy5QRVbWMne0us22RtvmV3QuD9W1SjFN
	wYrCWpSlNB59qaO_8udpKXj2fDzP6f_9ZQUEfFRABawOa36z13MwB58dwQwshxFbIbfch7qL7Cfi
	blxTGClh2b.0p7K4P7cZEqTzqhG2P7nHux0whcDUmklS2muFdYCDixCC3VDIQbB_GzXrZ1QPLU37
	.wjxN1bx2F1g0D59KYfHo0QB8dJeSRQuNWkx482IxIhTOWpLVbnTxvKyW3rmwb0M5o4B5460sfsX
	gDqstMj7gZOvpGSaYw.A63FlzI9H.hJLoBfzK4pR34zIch6xsCNiIamZ0TvjRpFMQWCqGA2IOTT4
	n5dLp9bELNGJyETNsSVK.Wi18o4D0hxLXl1wf9WZcU8ynraNd5nnCAF09c6qAVS9dLRvdO7Dhi0x
	_Tm_32bal.kDlJbzJJo4_CeMaypLBzPQDvvSg9OVDqLMga3Dw_n4pLzccbM9acpjNrsczZ7EtMgj
	LZJNukxukS98Wosos6zaZBLWcsjpGD_YJVDdaV2LU6vCck.Db4rB52YdTs8Q-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic314.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 26 Jan 2021 17:07:08 +0000
Received: by smtp408.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 78ca719d8f4395e9f47d7b6d0de76a03; 
	Tue, 26 Jan 2021 17:07:04 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v24 23/25] Audit: Add a new record for multiple object LSM
	attributes
Date: Tue, 26 Jan 2021 08:41:06 -0800
Message-Id: <20210126164108.1958-24-casey@schaufler-ca.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
Cc: john.johansen@canonical.com, linux-kernel@vger.kernel.org,
	linux-audit@redhat.com, sds@tycho.nsa.gov
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Create a new audit record type to contain the object information
when there are multiple security modules that may require such data.
This record is linked with the same timestamp and serial number.

An example of the MAC_OBJ_CONTEXTS (1421) record is:

        type=UNKNOWN[1421]
        msg=audit(1601152467.009:1050):
        obj_selinux=unconfined_u:object_r:user_home_t:s0

Not all security modules that can provide object information
do so in all cases. It is possible that a security module won't
apply an object attribute in all cases.

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
Cc: linux-audit@redhat.com
To: Paul Moore <paul@paul-moore.com>
---
 include/linux/audit.h      |  7 ++++
 include/uapi/linux/audit.h |  1 +
 kernel/audit.c             | 53 +++++++++++++++++++++++++++
 kernel/audit.h             |  4 +--
 kernel/auditsc.c           | 73 +++++++-------------------------------
 5 files changed, 75 insertions(+), 63 deletions(-)

diff --git a/include/linux/audit.h b/include/linux/audit.h
index 229cd71fbf09..b92ad58bc97d 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -189,6 +189,8 @@ extern void		    audit_log_path_denied(int type,
 extern void		    audit_log_lost(const char *message);
 
 extern int audit_log_task_context(struct audit_buffer *ab);
+extern int audit_log_object_context(struct audit_buffer *ab,
+				    struct lsmblob *blob);
 extern void audit_log_task_info(struct audit_buffer *ab);
 extern void audit_log_lsm(struct audit_context *context);
 
@@ -256,6 +258,11 @@ static inline int audit_log_task_context(struct audit_buffer *ab)
 {
 	return 0;
 }
+static inline int audit_log_object_context(struct audit_buffer *ab,
+					   struct lsmblob *blob)
+{
+	return 0;
+}
 static inline void audit_log_task_info(struct audit_buffer *ab)
 { }
 static void audit_log_lsm(struct audit_context *context)
diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
index 2a63720e56f6..dbb1dce16962 100644
--- a/include/uapi/linux/audit.h
+++ b/include/uapi/linux/audit.h
@@ -140,6 +140,7 @@
 #define AUDIT_MAC_CALIPSO_ADD	1418	/* NetLabel: add CALIPSO DOI entry */
 #define AUDIT_MAC_CALIPSO_DEL	1419	/* NetLabel: del CALIPSO DOI entry */
 #define AUDIT_MAC_TASK_CONTEXTS	1420	/* Multiple LSM contexts */
+#define AUDIT_MAC_OBJ_CONTEXTS	1421	/* Multiple LSM object contexts */
 
 #define AUDIT_FIRST_KERN_ANOM_MSG   1700
 #define AUDIT_LAST_KERN_ANOM_MSG    1799
diff --git a/kernel/audit.c b/kernel/audit.c
index 732ce576ed89..357b652339cf 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -2171,6 +2171,59 @@ int audit_log_task_context(struct audit_buffer *ab)
 }
 EXPORT_SYMBOL(audit_log_task_context);
 
+int audit_log_object_context(struct audit_buffer *ab,
+				    struct lsmblob *blob)
+{
+	int i;
+	int error;
+	bool sep = false;
+	struct lsmcontext lsmdata;
+	struct audit_buffer *lsmab = NULL;
+	struct audit_context *context = NULL;
+
+	/*
+	 * If there is more than one security module that has a
+	 * object "context" it's necessary to put the object data
+	 * into a separate record to maintain compatibility.
+	 */
+	if (lsm_multiple_contexts()) {
+		audit_log_format(ab, " obj=?");
+		context = ab->ctx;
+		if (context)
+			lsmab = audit_log_start(context, GFP_KERNEL,
+						AUDIT_MAC_OBJ_CONTEXTS);
+	}
+
+	for (i = 0; i < LSMBLOB_ENTRIES; i++) {
+		if (blob->secid[i] == 0)
+			continue;
+		error = security_secid_to_secctx(blob, &lsmdata, i);
+		if (error && error != -EINVAL) {
+			audit_panic("error in audit_log_object_context");
+			return error;
+		}
+
+		if (context) {
+			audit_log_format(lsmab, "%sobj_%s=%s",
+					 sep ? " " : "",
+					 lsm_slot_to_name(i),
+					 lsmdata.context);
+			sep = true;
+		} else
+			audit_log_format(ab, " obj=%s", lsmdata.context);
+
+		security_release_secctx(&lsmdata);
+		if (!context)
+			break;
+	}
+
+	if (context)
+		audit_log_end(lsmab);
+
+	return 0;
+}
+EXPORT_SYMBOL(audit_log_object_context);
+
 void audit_log_d_path_exe(struct audit_buffer *ab,
 			  struct mm_struct *mm)
 {
diff --git a/kernel/audit.h b/kernel/audit.h
index 4f245c3dac0c..c65f40a1d308 100644
--- a/kernel/audit.h
+++ b/kernel/audit.h
@@ -78,7 +78,7 @@ struct audit_names {
 	kuid_t			uid;
 	kgid_t			gid;
 	dev_t			rdev;
-	u32			osid;
+	struct lsmblob		oblob;
 	struct audit_cap_data	fcap;
 	unsigned int		fcap_ver;
 	unsigned char		type;		/* record type */
@@ -155,7 +155,7 @@ struct audit_context {
 			kuid_t			uid;
 			kgid_t			gid;
 			umode_t			mode;
-			u32			osid;
+			struct lsmblob		oblob;
 			int			has_perm;
 			uid_t			perm_uid;
 			gid_t			perm_gid;
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 376adae15a9d..e7c204039264 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -686,14 +686,6 @@ static int audit_filter_rules(struct task_struct *tsk,
 			if (f->lsm_isset) {
 				/* Find files that match */
 				if (name) {
-					/*
-					 * lsmblob_init sets all values in the
-					 * lsmblob to sid. This is temporary
-					 * until name->osid is converted to a
-					 * lsmblob, which happens later in
-					 * this patch set.
-					 */
-					lsmblob_init(&blob, name->osid);
 					result = security_audit_rule_match(
 								&blob,
 								f->type,
@@ -701,7 +693,6 @@ static int audit_filter_rules(struct task_struct *tsk,
 								f->lsm_rules);
 				} else if (ctx) {
 					list_for_each_entry(n, &ctx->names_list, list) {
-						lsmblob_init(&blob, name->osid);
 						if (security_audit_rule_match(
 								&blob,
 								f->type,
@@ -715,8 +706,7 @@ static int audit_filter_rules(struct task_struct *tsk,
 				/* Find ipc objects that match */
 				if (!ctx || ctx->type != AUDIT_IPC)
 					break;
-				lsmblob_init(&blob, ctx->ipc.osid);
-				if (security_audit_rule_match(&blob,
+				if (security_audit_rule_match(&ctx->ipc.oblob,
 							      f->type, f->op,
 							      f->lsm_rules))
 					++result;
@@ -1028,7 +1018,6 @@ static int audit_log_pid_context(struct audit_context *context, pid_t pid,
 				 struct lsmblob *blob, char *comm)
 {
 	struct audit_buffer *ab;
-	struct lsmcontext lsmctx;
 	int rc = 0;
 
 	ab = audit_log_start(context, GFP_KERNEL, AUDIT_OBJ_PID);
@@ -1038,15 +1027,8 @@ static int audit_log_pid_context(struct audit_context *context, pid_t pid,
 	audit_log_format(ab, "opid=%d oauid=%d ouid=%d oses=%d", pid,
 			 from_kuid(&init_user_ns, auid),
 			 from_kuid(&init_user_ns, uid), sessionid);
-	if (lsmblob_is_set(blob)) {
-		if (security_secid_to_secctx(blob, &lsmctx, LSMBLOB_FIRST)) {
-			audit_log_format(ab, " obj=(none)");
-			rc = 1;
-		} else {
-			audit_log_format(ab, " obj=%s", lsmctx.context);
-			security_release_secctx(&lsmctx);
-		}
-	}
+	if (lsmblob_is_set(blob))
+		rc = audit_log_object_context(ab, blob);
 	audit_log_format(ab, " ocomm=");
 	audit_log_untrustedstring(ab, comm);
 	audit_log_end(ab);
@@ -1273,26 +1255,15 @@ static void show_special(struct audit_context *context, int *call_panic)
 				context->socketcall.args[i]);
 		break; }
 	case AUDIT_IPC: {
-		u32 osid = context->ipc.osid;
+		struct lsmblob *oblob = &context->ipc.oblob;
 
 		audit_log_format(ab, "ouid=%u ogid=%u mode=%#ho",
 				 from_kuid(&init_user_ns, context->ipc.uid),
 				 from_kgid(&init_user_ns, context->ipc.gid),
 				 context->ipc.mode);
-		if (osid) {
-			struct lsmcontext lsmcxt;
-			struct lsmblob blob;
-
-			lsmblob_init(&blob, osid);
-			if (security_secid_to_secctx(&blob, &lsmcxt,
-						     LSMBLOB_FIRST)) {
-				audit_log_format(ab, " osid=%u", osid);
-				*call_panic = 1;
-			} else {
-				audit_log_format(ab, " obj=%s", lsmcxt.context);
-				security_release_secctx(&lsmcxt);
-			}
-		}
+		if (lsmblob_is_set(oblob) &&
+		    audit_log_object_context(ab, oblob))
+			*call_panic = 1;
 		if (context->ipc.has_perm) {
 			audit_log_end(ab);
 			ab = audit_log_start(context, GFP_KERNEL,
@@ -1435,20 +1406,9 @@ static void audit_log_name(struct audit_context *context, struct audit_names *n,
 				 from_kgid(&init_user_ns, n->gid),
 				 MAJOR(n->rdev),
 				 MINOR(n->rdev));
-	if (n->osid != 0) {
-		struct lsmblob blob;
-		struct lsmcontext lsmctx;
-
-		lsmblob_init(&blob, n->osid);
-		if (security_secid_to_secctx(&blob, &lsmctx, LSMBLOB_FIRST)) {
-			audit_log_format(ab, " osid=%u", n->osid);
-			if (call_panic)
-				*call_panic = 2;
-		} else {
-			audit_log_format(ab, " obj=%s", lsmctx.context);
-			security_release_secctx(&lsmctx);
-		}
-	}
+	if (lsmblob_is_set(&n->oblob) &&
+	    audit_log_object_context(ab, &n->oblob) && call_panic)
+		*call_panic = 2;
 
 	/* log the audit_names record type */
 	switch (n->type) {
@@ -2038,17 +1998,13 @@ static void audit_copy_inode(struct audit_names *name,
 			     const struct dentry *dentry,
 			     struct inode *inode, unsigned int flags)
 {
-	struct lsmblob blob;
-
 	name->ino   = inode->i_ino;
 	name->dev   = inode->i_sb->s_dev;
 	name->mode  = inode->i_mode;
 	name->uid   = inode->i_uid;
 	name->gid   = inode->i_gid;
 	name->rdev  = inode->i_rdev;
-	security_inode_getsecid(inode, &blob);
-	/* scaffolding until osid is updated */
-	name->osid = blob.secid[0];
+	security_inode_getsecid(inode, &name->oblob);
 	if (flags & AUDIT_INODE_NOEVAL) {
 		name->fcap_ver = -1;
 		return;
@@ -2394,16 +2350,11 @@ void __audit_mq_getsetattr(mqd_t mqdes, struct mq_attr *mqstat)
 void __audit_ipc_obj(struct kern_ipc_perm *ipcp)
 {
 	struct audit_context *context = audit_context();
-	struct lsmblob blob;
 	context->ipc.uid = ipcp->uid;
 	context->ipc.gid = ipcp->gid;
 	context->ipc.mode = ipcp->mode;
 	context->ipc.has_perm = 0;
-	security_ipc_getsecid(ipcp, &blob);
-	/* context->ipc.osid will be changed to a lsmblob later in
-	 * the patch series. This will allow auditing of all the object
-	 * labels associated with the ipc object. */
-	context->ipc.osid = lsmblob_value(&blob);
+	security_ipc_getsecid(ipcp, &context->ipc.oblob);
 	context->type = AUDIT_IPC;
 }
 
-- 
2.25.4

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

