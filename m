Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1FF6F2BB707
	for <lists+linux-audit@lfdr.de>; Fri, 20 Nov 2020 21:38:50 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-_U6RIMrqO-mZ7aThZoHInw-1; Fri, 20 Nov 2020 15:38:46 -0500
X-MC-Unique: _U6RIMrqO-mZ7aThZoHInw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C68945B366;
	Fri, 20 Nov 2020 20:38:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8AAA5C230;
	Fri, 20 Nov 2020 20:38:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 777F4180954D;
	Fri, 20 Nov 2020 20:38:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AKKcb75001969 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 15:38:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BE45C2166B2B; Fri, 20 Nov 2020 20:38:37 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8D792166B28
	for <linux-audit@redhat.com>; Fri, 20 Nov 2020 20:38:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43F23803C9F
	for <linux-audit@redhat.com>; Fri, 20 Nov 2020 20:38:35 +0000 (UTC)
Received: from sonic305-28.consmr.mail.ne1.yahoo.com
	(sonic305-28.consmr.mail.ne1.yahoo.com [66.163.185.154]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-572-NKDGBsC3PdWlHRT623NiuA-1;
	Fri, 20 Nov 2020 15:38:32 -0500
X-MC-Unique: NKDGBsC3PdWlHRT623NiuA-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1605904712; bh=cVdOiHpvaX5hEUoOdp/ZIPhxaa5oB5XBMOsoNcalEa1=;
	h=From:To:Subject:Date:From:Subject;
	b=J4a3H6GfrrEGJK3rb0m5Hg25qq0zjVFF5ugkwpXTdUfKoa7ArAbt2jd6YuiHkwkvsXqT8ZtLP/TYxGxeAI5nVRTt1oHl4uXrFzdp3+18C74hkjw0JLIiP+5J36/Wo25ABql1SQV9zo5kVAiL8Q5HjljFTB/u6bG072QCFZv40vSqYMHDdF2/AOgI5+g07VJhRRt6YmjMSyWCCwg5Z+JmDNYzHNNE6w3ZRyHbn9DUfGuOT77g573OQsk87yzZLxnOo3H4Zoe3DYKL30Mtu2rU1XPgIKtS0ZGBJShYENfEQrRUIg+9FqTivdo+WKADP/7fi6zy4hrWPu0n5sJhbTdw3w==
X-YMail-OSG: mtwqkK4VM1kpXkEv7xSlILGphO8_VKylGpNrrScTrscJacnEVTop_cxl.G3JSUC
	b.TCeYDfXNuur7INXVBaHDugqhPcShROT0WdW2_pwrsHZq4s.IL04mm.1sqyzwNoKCGXn4CHqohS
	oykhnbsE15QnNR2XTmKPy5A9K8Ggh9QpDMg.D6pLOOIKxl_10LVpe7tHWev96RMsqa6VGj2Mj5gW
	gpL3DKYfc9dcleHkAEl0atVcQeICzzL7pxKM57kRe8X3KBx.1NtXudb._fZUjhP8v7Yfo2dLQRjQ
	jofhTNzdIzI0NwSuiB5WUw0Vnju7ZkAi8Gl8ODRkBnFlIFBjBxuLtRfXeZ_XidCwLMmrFTGSDhL6
	vO9Yd0ZFO_eD5KWSGEv626ANMQizci5gm_DxtyeDzQf6gX8j7SIQb7PUEv7PbvZ6.6WwvOVWPljZ
	KPZKcxE29zZix8hrR3wGnZZSbugMUMBC760jxjkshoMzvT_oyWN_jWCn7cWO2iuOtQEA3vjcESpz
	OTnG.ISteHy8pVSDGVz7rg7T8qF9T0fVD45D.BuIvG2o7k9kJ9xxI24HG4aespH9WiHD32y20hLK
	2JsfKMkNvlIWkdewIzpme1MWgsv1PS3Z.2tOT91SA6kuwmzESSlso8SfP41iNrQUHSjScIUj6g4s
	BlupL9oTe.jbgq1VKF9iDD6D2Bfy5Zel13740LMV1gIPF5HAsVd7_7gNurXfKSiiVZrhb2e97kVQ
	WHBiued0I6XRad.mXFvIC3s6jR4WYWyRXDis9Pqa8t.1xiK61gKF3LTQ0b4SmQoOQcKWl.gzsv2d
	Ai3gQgcRLj.vu7TQ0BmqhVGr_dFCmFXdZwVpgwsiCYvx8or3cpuHaqNjUp.sSR.MYClO3tMwjkNs
	gsu9rxm5C.6Kf608o4R6opI7zOT6LW9iUefAbvm43DTzUf1CdxNez8db9ezNS3yzmhM4kLxETvwC
	0ywgejbkbS8TG.rhirqCZOpY_pJ9TJVScviVWTAD3nU73PrZgZjy4243.j4WPAWvcjDAFEMqa0ss
	teJtTAk8UFqWBkSAdF8WDLwWlbjkKkwlIvUcSkoD1v02BoImEwFqfIwIi6ih5Pc1s23UWWj0RcFS
	U5LHkP7Lw2S5pI_GW3oXFEqUXn_nEI0iR29VpCaOIhAuLfRW54EUb2UBORZNLvYyCE9Mgu8aWnx3
	Kj82g_D4f_rOr7vPCxQ.mm1PbTtW50QEvP1WlU6.DUwPzk1UZJrxnTjh11NjOXw4m3Q4FNVXVY.c
	ff3sVg7HI3z1DGqQNyVBhHVaYA5DOsxBTZTuV15Mn1MyXLadeIsqI3dHLpRiEnwOjnEtaefJQzRF
	vlCWfk9D_5_urdE7C6CDv1GEl4JImgHwVJ1M6rvwJ2izDQKAPAD_6c5V1_9ZqwZqd6uSyFZkm41B
	YHDoB8L0hsCOLsGNHL2KEFDxq0vQCwb9kYBgtKV36IXUTqey9Xoh2jKSnvXwp6lNeDKGGXvnD5Bv
	bhI0FgfMreCnSW7C3yYgpMY8QQ55RRBjzNcWVNcEquyPQSeHEbANpOB5XFpHTsF31p8IT3zSOuYA
	RVbDqyyEq4NDbjiAbK8QC6yqbeoR6QpvPdRdklItNYC.E4NBonyLeC6BQMQyzkNbQJGput5iPrtP
	JLsQ_95OCeRmFcZPUMx5e1QESwg9qG6L1XZwdotvqA4nxQtH2uPArgUcBRDaOboaV5v0Ku9LUPG7
	1Fcx8.LlzBAMvoUS2GqvAKwoZ1v8tBs2LZqExR3WD_Ej0Yup3j77saWu5wDS3QROQtm4q8uYEm8b
	yhJdQzeVWj.QKAICkJ0a8ed5EDnKGLcxO0VZosNzdmM7SVQGP.GIVkOIFaUIq2i1AcPZ.LLtivoi
	toT4aQ8MvQjE12oGNWGpepDET6RT9KlHQduRFfveyiJ.qKrzFghEpIzmk6WEbLHaGXauWCyEc3Lx
	LxgyjrdcpMzhM4dc6SrKuvQBJA4upVTKSUP.N6FiyBEtVPRHBbp3lAEBS8DFCVB8Hug2EupKvnNl
	aawz3usp26VP6Od82pYsjZ_d8vOxfFYKOc.SXLsMGQfzQ6K4h40Fe.0pn.eKDuL3iKlSTIHTWjmY
	XtVAGTub4K0Qw4h_RJzkgrWG8EUh8VyuVah9J5HgBNRY9AhYxhAWTt0ZnO4FNf1RCntlcM3H1eR9
	e3sscmiUp9XdPqlgAExxMiqOPEDxOV.VtkHMXu58HX2X5iSL5rvnmKHfuTZyxYFYKLsb1n7sx4WI
	Swl1I0AHTz_tlPAA1pRj.Iur5b5bGcKqDLOVE0QHomBX7zKtsMZ30si1SHvYddS_caC0NuanB8H3
	DggLWFLvZXoJYMD4zbi_DETRATGjDfIN8C4SifJRNxB8H891JlBGgLzpyWFDmSOiXBkZN7NhkJ6l
	ehmnsyo0TdyvmZApKmwZ5GjWjow7htwfGVT0fOculV797YqyLYqHeRYUq5Rt4UHlLuCNnIZ5eqxQ
	kd1iAu_1Di6ghfU9qpltP52w2R3aYtr4yXoW3UF6vnu475ParXqF2Dr41FK9Dy7kRruTOVA2PlUH
	lqHn5D.vkHTD6b9j.B9Tl2nIl8Jm_QmwKpQN0VsJosHsSCgTewLqcfq7ofOrqKGA3gH0XC0LYVd3
	A8aHAs2YA32rz4zCSCDStQf7V5mRybkJAtXzUNr4MZ2ebqxn5h7Bf0j6f8eiocFKkANMijFsatLz
	Z0xTJh5xk__duz3LudXDeAU9d7V3AwxaEb3zDV3p8ODzXZAvbt6HWHf_AfTkGEusYKbF420K_44o
	Mpe_v1wMTP83.43SEEPHL.wMcc3EX1bf0vNIjMQuabUEr0gbbcEPiSAImVSPIaEyQ49npfPieQS8
	jXlMjHpw9tQIyrHvsHpSzJWFwfY05qYlXUF4MOyAqlcpi8gHnG5T_46RqWrFX_steNJDoNKM6Wnn
	zP8vYEuhuP_dRSfG6oUwJvepmkiupRrhaUeYZHfeYTVN1JwMs49d2SIA8epc1Fd_QLqN90NfshYF
	kKgV9t2EReciXdFRTO9Sf0UxC0PCsz2eft3DUP9X4LgAAj7lfPIAeFqd79ueGTDwG8_RD51VY0Tf
	RqJtK_I9HoqeNzVcBEjf6craDR9vVDo2BObDSucBCTXOGFypZyndFTUbZgv1iRrrUMSpatX7G6tO
	fQVr1YCSRJQWh6bXea0L0dYLRHArdyTCKeSLj0gPmtq1p.bGQmvZx0lyluR6jhuk0r_OhGdIXT_L
	UO69sMY40aLPUns9NaPfKupgCronBEGKDOsx5cvozYWzgoaC54SqLZ7vlYTRc4_87ZAKNxZbcPd0
	dFoWBKBSeCcp_Bx00.Qt4W4Zqv95WVIforiTrpL698l7F5CNK9wy.3ExcC5WSogpmBJk4isVQUuC
	zirHWaScJrfkz
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic305.consmr.mail.ne1.yahoo.com with HTTP;
	Fri, 20 Nov 2020 20:38:32 +0000
Received: by smtp405.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 2041e98e668985278407e815db53ae4c; 
	Fri, 20 Nov 2020 20:38:30 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v23 21/23] Audit: Add a new record for multiple object LSM
	attributes
Date: Fri, 20 Nov 2020 12:15:05 -0800
Message-Id: <20201120201507.11993-22-casey@schaufler-ca.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
index ad1eda37166f..af9403ba8a8a 100644
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
index 554279cb1e20..1257c1787f3c 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -2164,6 +2164,59 @@ int audit_log_task_context(struct audit_buffer *ab)
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
+					 security_lsm_slot_name(i),
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
index 624828a9a7e4..3be4b03e5cb5 100644
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
@@ -154,7 +154,7 @@ struct audit_context {
 			kuid_t			uid;
 			kgid_t			gid;
 			umode_t			mode;
-			u32			osid;
+			struct lsmblob		oblob;
 			int			has_perm;
 			uid_t			perm_uid;
 			gid_t			perm_gid;
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 44b150432147..c314533dd220 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -688,14 +688,6 @@ static int audit_filter_rules(struct task_struct *tsk,
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
@@ -703,7 +695,6 @@ static int audit_filter_rules(struct task_struct *tsk,
 								f->lsm_rules);
 				} else if (ctx) {
 					list_for_each_entry(n, &ctx->names_list, list) {
-						lsmblob_init(&blob, name->osid);
 						if (security_audit_rule_match(
 								&blob,
 								f->type,
@@ -717,8 +708,7 @@ static int audit_filter_rules(struct task_struct *tsk,
 				/* Find ipc objects that match */
 				if (!ctx || ctx->type != AUDIT_IPC)
 					break;
-				lsmblob_init(&blob, ctx->ipc.osid);
-				if (security_audit_rule_match(&blob,
+				if (security_audit_rule_match(&ctx->ipc.oblob,
 							      f->type, f->op,
 							      f->lsm_rules))
 					++result;
@@ -1027,7 +1017,6 @@ static int audit_log_pid_context(struct audit_context *context, pid_t pid,
 				 struct lsmblob *blob, char *comm)
 {
 	struct audit_buffer *ab;
-	struct lsmcontext lsmctx;
 	int rc = 0;
 
 	ab = audit_log_start(context, GFP_KERNEL, AUDIT_OBJ_PID);
@@ -1037,15 +1026,8 @@ static int audit_log_pid_context(struct audit_context *context, pid_t pid,
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
@@ -1272,26 +1254,15 @@ static void show_special(struct audit_context *context, int *call_panic)
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
@@ -1431,20 +1402,9 @@ static void audit_log_name(struct audit_context *context, struct audit_names *n,
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
@@ -2047,17 +2007,13 @@ static void audit_copy_inode(struct audit_names *name,
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
@@ -2403,16 +2359,11 @@ void __audit_mq_getsetattr(mqd_t mqdes, struct mq_attr *mqstat)
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
2.24.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

