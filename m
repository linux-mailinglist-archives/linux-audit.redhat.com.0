Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E76E5ECE0D
	for <lists+linux-audit@lfdr.de>; Tue, 27 Sep 2022 22:12:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664309563;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=n6tb0qeOxS1yv7EDY+J7fGq/IJ78b9HPT9F4zuiovb8=;
	b=aK/D/aPyFf/GTRYcOpF+seQe7UAZ4L2X8YnPnGNNkENPXlL9xaal+hDxjpHKrxz80mQbjV
	2z06GE5iwKWAnQEmdZSEQdmajd0+d97o7Jbx2jFAgfhUA8o6nst8FQDOnr5VimF52A0Pjk
	Z2aK4cRoysHLL4/68ACfD1oKoJgmTQ4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-TVDt504mMq6OeyUVqyIlGg-1; Tue, 27 Sep 2022 16:12:40 -0400
X-MC-Unique: TVDt504mMq6OeyUVqyIlGg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 623A2185A7AA;
	Tue, 27 Sep 2022 20:12:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 479284A9254;
	Tue, 27 Sep 2022 20:12:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EE49B1946A4E;
	Tue, 27 Sep 2022 20:12:37 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E9B4B1946586 for <linux-audit@listman.corp.redhat.com>;
 Tue, 27 Sep 2022 20:12:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DAF661415102; Tue, 27 Sep 2022 20:12:35 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D2EF51415113
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 20:12:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 433D0858F17
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 20:12:35 +0000 (UTC)
Received: from sonic306-27.consmr.mail.ne1.yahoo.com
 (sonic306-27.consmr.mail.ne1.yahoo.com [66.163.189.89]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-349-Qh4efVFPOSaXxuUQdjg-Rw-1; Tue,
 27 Sep 2022 16:12:33 -0400
X-MC-Unique: Qh4efVFPOSaXxuUQdjg-Rw-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1664309551; bh=pl1Gh4uIxRC7hNMCvd9w9Zsip/ZOdh9RaWWoT+8FUCO=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=IPht/0EpIBuxprwPg6/0ysMiLL3PNCNEkr3KRenrkxtbSjHla/M1bh/EpzoQnc9fk2B0bbQsBiX8vibhwhCcMHbTKdQLuWx8Z/GXV7HDma+6Z0xAR0eEMHSX2DvHJ9m//gpAcHt7Twd3pEYgLRoZGeeFMnsSJ4Zao4JCsIpro1UzQypmhkTkzZOjXYT9dWj6QPl/+ggtoI7YArO/5Jc47rqHy4944vbF2JpXmhyAubX9Z5X3T6fx1kNC2FSBW2M5wcoQZRbspURe1/6qzGCMHHs4moyujHpQsdOHN2mvImpDV6EBdQrTBdCKZWoOdQvchJ+YAiF/H/axsqYlA1Z32w==
X-YMail-OSG: e3v8OPMVM1kFHlkT.RUFd1.wsFQBEcYPJfzD59jmuzgCIleg0pCoU74dM1.WbbB
 o5RbXmdaOLQgcmaICgh719UR4QYso7rVVtgwCbzxeImaw.KUOO_QEWUJZTW_1rU1qxQV67ocgLyd
 BJvKCVvjjiK0ThslYoRjYYkztgx66zh1RhgL16lfWK5bzAW7JWsz2ngst.SmrfAgv5f2TiEvtTFX
 15Xg5G8gA.FKOxpNoq9tWBjfYlFJuA8pCNqEY9eYNamOeswmV3XLNCSMtX0mEGZ4AETr3ETLmG9P
 JAyBGTELZ6p6ofPXPmzBw98JTuuCn70SjfTrgfX.Uy9Ib_wdb0E18lvafe6rNt8APta0WZr7ugZ8
 v5cPcZ4cSulKJr_bNrTCornFjuEcDIpOT3nsxmjJzzrWEn_qEMusVshotY5nZvzVb6IxByYmiuRO
 yoVy0OWn12yP0oDc2Q6VBk40knU2FJpnGR5OuVboliJsDgv31KaUUR4TJvSAuVc.shN_VOHzI83e
 5oghTLE63Pnp9ibSczvAzBpgPw1uqIh2X5tZX5hSbDycWhKj7Ki9fF2USdYOzBm7GZA7W5ECw597
 z1p34XKIFLBQOyOA3hd563X1G8_TPyBJAKjagp3uCM9.Mu5aGxc7uqiS97ljeEaEV1skpND.AyLY
 ee..XifVG17HG0DZz6sfIXOYWnkRnwBkMqIW5FFzh8rFJ_yfqRPYRVIbgly6h.VKf5qPQH1UUve6
 AsOhtRbvU.7FkxEAhOmh68Ky25uktrNXXmC7EuvV6nlkLhDf3H2ZoXciI00ebg2QXTC8e48MDGfE
 snTMLZDAwKGrRd8OTXLt6tfOaoDrZ3Qu1ppUyPMMtJIygiervoI4SNqcJ2fRSS5E4jcTFgClTe6x
 cGQ_EGmMkPuJXj0u9jWbzEavARqzlv7zpvD77H8UmHm.au6NLcyKeVmKDbmXXQbi_31HpgMwki5G
 UoAdUOc_z44ZiY4elfp7akOYgeRF98iLYd3sKrvlnqvW9Noy9f6fAp2iYQRLKB3zYoNaslZtOKr2
 _GKy5LDJDJU90RrJVojVx6x9vxdPwMz750VAQl6SqNwvgleaAHoc6PMOeDoetK92.htow1TjAfyx
 BuNEZ8FhT21GSDD6aQogsZwOScbxRXlyWkB9p1r3awUPZzxVz47i2N29PZmiWRSaRv7La2DNK2i5
 _vRWUMbrB.YMMbMcHu7jxQarxSf.cD7ulT8ltjr4Enf9yQdZk54PbaCjhnWP4YvkLQIm1EoXkhDH
 DeKHfqjYCMA2qdBpiNO_qnHu4Oi4GI.kiOH78QCF9Yb.NfvWVZnYwcd8J8_N67UfWIgLRLBNEmqb
 SDbRs9bXybvAQVKeVrgLpSsrZxLo5esf3Z3azX3WclWif6wH3f4sEsl0ewOxMnKyGESNguv8Lekp
 eMteIA18S17FIiOOUBsSzs4vX8rwnePpvt8V41RQxRwSo1lH5R7NJqK0iWCNLT4rSk_SyXPfRTl0
 y0bgWGFo9XrAtk1qdRnrKw_GWLBbh90KZh6zDFXHmrLWs017.9xrdOyIBW9TBn2pOFDZVOeCA7gB
 8gr9VLvKn9rhSq0DzK6ivqYrjiVia5C9KEtLL6ph3tV8BmDnSbqdCgTnC1dgnS4fgq4r.orVPsYh
 LTzc28dLiIcA3jLmo9wcFRMmcZ0oMtx8_P6CpzNObo_KwXJehgk6JgRCdVn0gNhM52RGvgrZhhQi
 M6uFNj2uBzHn8_deFl20c65uGKfRUeDOCAIoP1cPx.y1j2eV.CE5Ni_sywu5bLNpEVfF0ioPDkbZ
 j1stkNXPoZUCDO9JTK0rer8zZKvZ5vZRqd2mQM4l0iLvy2.8ccyc1IDrLzAB_Rl2Gs0U3IDKZls2
 HzAqsSXVzX0zRJCOvcofxa7huWUTXExd.JTEVo5zCOkKynSE5_IIMpOhd2.lqESY2yn97OpDpm8O
 IRtTMRlZFWML0oqcfBPqT8yLwsvFxhXczD0hzTN5R.ovxhrxqmVOp.XJCVZOB1SKMsi_gZlrqCpr
 ctBPtG9xNCJ7FFvdrrKdO9yuj.iSUlvDn_G7W5.NdUdswDoNrm3M0G9lL2Ig09X7U4tPDNo2cFDs
 i4_be4aW6xs763wJ_ahVSvLKerHLAfFxM6gkEYp3wYa2TDD9FpRjVcbeQfV3S1O.UjjASKC4j.L.
 _UvH_XI9GdM_YeulJmIk1.NNgZM6xfxdH8WFj9e2GsdGmOLpTi_dgjf5XQ7k6yrtLI_7polNWjMr
 9hfAMAuHOA4skx2SeUwNjfQuTAY2Rtnaed2w7PaTDB9D9esK7a4KTGb1M.g7FWw--
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.ne1.yahoo.com with HTTP; Tue, 27 Sep 2022 20:12:31 +0000
Received: by hermes--production-gq1-7dfd88c84d-nfz27 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 1d976fe2ee917226e6d7cc50e923ce4f; 
 Tue, 27 Sep 2022 20:12:26 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, paul@paul-moore.com,
 linux-security-module@vger.kernel.org
Subject: [PATCH v38 35/39] Audit: Add record for multiple object contexts
Date: Tue, 27 Sep 2022 12:54:17 -0700
Message-Id: <20220927195421.14713-36-casey@schaufler-ca.com>
In-Reply-To: <20220927195421.14713-1-casey@schaufler-ca.com>
References: <20220927195421.14713-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: john.johansen@canonical.com, selinux@vger.kernel.org, jmorris@namei.org,
 linux-kernel@vger.kernel.org, linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Create a new audit record AUDIT_MAC_OBJ_CONTEXTS.
An example of the MAC_OBJ_CONTEXTS (1421) record is:

    type=MAC_OBJ_CONTEXTS[1421]
    msg=audit(1601152467.009:1050):
    obj_selinux=unconfined_u:object_r:user_home_t:s0

When an audit event includes a AUDIT_MAC_OBJ_CONTEXTS record
the "obj=" field in other records in the event will be "obj=?".
An AUDIT_MAC_OBJ_CONTEXTS record is supplied when the system has
multiple security modules that may make access decisions based
on an object security context.

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
Acked-by: Paul Moore <paul@paul-moore.com>
---
 include/linux/audit.h      |  5 +++
 include/uapi/linux/audit.h |  1 +
 kernel/audit.c             | 49 ++++++++++++++++++++++-
 kernel/auditsc.c           | 79 ++++++++++++--------------------------
 4 files changed, 78 insertions(+), 56 deletions(-)

diff --git a/include/linux/audit.h b/include/linux/audit.h
index 87ba6fe7f1a2..ce3f034e0c04 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -188,6 +188,8 @@ extern void		    audit_log_path_denied(int type,
 						  const char *operation);
 extern void		    audit_log_lost(const char *message);
 
+extern void audit_log_object_context(struct audit_buffer *ab,
+				     struct lsmblob *blob);
 extern int audit_log_subject_context(struct audit_buffer *ab,
 				     struct lsmblob *blob);
 extern int audit_log_task_context(struct audit_buffer *ab);
@@ -250,6 +252,9 @@ static inline void audit_log_key(struct audit_buffer *ab, char *key)
 { }
 static inline void audit_log_path_denied(int type, const char *operation)
 { }
+static inline  void audit_log_object_context(struct audit_buffer *ab,
+					     struct lsmblob *blob)
+{ }
 static inline int audit_log_subject_context(struct audit_buffer *ab,
 					    struct lsmblob *blob)
 {
diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
index 7a5966b46f38..e5fae08982ca 100644
--- a/include/uapi/linux/audit.h
+++ b/include/uapi/linux/audit.h
@@ -144,6 +144,7 @@
 #define AUDIT_MAC_CALIPSO_ADD	1418	/* NetLabel: add CALIPSO DOI entry */
 #define AUDIT_MAC_CALIPSO_DEL	1419	/* NetLabel: del CALIPSO DOI entry */
 #define AUDIT_MAC_TASK_CONTEXTS	1420	/* Multiple LSM task contexts */
+#define AUDIT_MAC_OBJ_CONTEXTS	1421	/* Multiple LSM objext contexts */
 
 #define AUDIT_FIRST_KERN_ANOM_MSG   1700
 #define AUDIT_LAST_KERN_ANOM_MSG    1799
diff --git a/kernel/audit.c b/kernel/audit.c
index a611130f83cb..a1679bac7944 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -1107,7 +1107,6 @@ static int is_audit_feature_set(int i)
 	return af.features & AUDIT_FEATURE_TO_MASK(i);
 }
 
-
 static int audit_get_feature(struct sk_buff *skb)
 {
 	u32 seq;
@@ -2288,6 +2287,54 @@ int audit_log_task_context(struct audit_buffer *ab)
 }
 EXPORT_SYMBOL(audit_log_task_context);
 
+void audit_log_object_context(struct audit_buffer *ab, struct lsmblob *blob)
+{
+	int i;
+	int error;
+	struct lsmcontext context;
+
+	if (!lsm_multiple_contexts()) {
+		error = security_secid_to_secctx(blob, &context, LSMBLOB_FIRST);
+		if (error) {
+			if (error != -EINVAL)
+				goto error_path;
+			return;
+		}
+		audit_log_format(ab, " obj=%s", context.context);
+		security_release_secctx(&context);
+	} else {
+		audit_log_format(ab, " obj=?");
+		error = audit_buffer_aux_new(ab, AUDIT_MAC_OBJ_CONTEXTS);
+		if (error)
+			goto error_path;
+
+		for (i = 0; i < LSMBLOB_ENTRIES; i++) {
+			if (blob->secid[i] == 0)
+				continue;
+			error = security_secid_to_secctx(blob, &context, i);
+			if (error) {
+				audit_log_format(ab, "%sobj_%s=?",
+						 i ? " " : "",
+						 lsm_slot_to_name(i));
+				if (error != -EINVAL)
+					audit_panic("error in audit_log_object_context");
+			} else {
+				audit_log_format(ab, "%sobj_%s=%s",
+						 i ? " " : "",
+						 lsm_slot_to_name(i),
+						 context.context);
+				security_release_secctx(&context);
+			}
+		}
+
+		audit_buffer_aux_end(ab);
+	}
+	return;
+
+error_path:
+	audit_panic("error in audit_log_object_context");
+}
+
 void audit_log_d_path_exe(struct audit_buffer *ab,
 			  struct mm_struct *mm)
 {
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index bc0621282a9a..f62605d994fa 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -1089,36 +1089,25 @@ static inline void audit_free_context(struct audit_context *context)
 	kfree(context);
 }
 
-static int audit_log_pid_context(struct audit_context *context, pid_t pid,
-				 kuid_t auid, kuid_t uid,
-				 unsigned int sessionid,
-				 struct lsmblob *blob, char *comm)
+static void audit_log_pid_context(struct audit_context *context, pid_t pid,
+				  kuid_t auid, kuid_t uid,
+				  unsigned int sessionid,
+				  struct lsmblob *blob, char *comm)
 {
 	struct audit_buffer *ab;
-	struct lsmcontext lsmctx;
-	int rc = 0;
 
 	ab = audit_log_start(context, GFP_KERNEL, AUDIT_OBJ_PID);
 	if (!ab)
-		return rc;
+		return;
 
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
+		audit_log_object_context(ab, blob);
 	audit_log_format(ab, " ocomm=");
 	audit_log_untrustedstring(ab, comm);
 	audit_log_end(ab);
-
-	return rc;
 }
 
 static void audit_log_execve_info(struct audit_context *context,
@@ -1395,18 +1384,10 @@ static void show_special(struct audit_context *context, int *call_panic)
 				 from_kgid(&init_user_ns, context->ipc.gid),
 				 context->ipc.mode);
 		if (osid) {
-			struct lsmcontext lsmcxt;
 			struct lsmblob blob;
 
 			lsmblob_init(&blob, osid);
-			if (security_secid_to_secctx(&blob, &lsmcxt,
-						     LSMBLOB_FIRST)) {
-				audit_log_format(ab, " osid=%u", osid);
-				*call_panic = 1;
-			} else {
-				audit_log_format(ab, " obj=%s", lsmcxt.context);
-				security_release_secctx(&lsmcxt);
-			}
+			audit_log_object_context(ab, &blob);
 		}
 		if (context->ipc.has_perm) {
 			audit_log_end(ab);
@@ -1563,19 +1544,8 @@ static void audit_log_name(struct audit_context *context, struct audit_names *n,
 				 from_kgid(&init_user_ns, n->gid),
 				 MAJOR(n->rdev),
 				 MINOR(n->rdev));
-	if (lsmblob_is_set(&n->lsmblob)) {
-		struct lsmcontext lsmctx;
-
-		if (security_secid_to_secctx(&n->lsmblob, &lsmctx,
-					     LSMBLOB_FIRST)) {
-			audit_log_format(ab, " osid=?");
-			if (call_panic)
-				*call_panic = 2;
-		} else {
-			audit_log_format(ab, " obj=%s", lsmctx.context);
-			security_release_secctx(&lsmctx);
-		}
-	}
+	if (lsmblob_is_set(&n->lsmblob))
+		audit_log_object_context(ab, &n->lsmblob);
 
 	/* log the audit_names record type */
 	switch (n->type) {
@@ -1780,21 +1750,20 @@ static void audit_log_exit(void)
 		struct audit_aux_data_pids *axs = (void *)aux;
 
 		for (i = 0; i < axs->pid_count; i++)
-			if (audit_log_pid_context(context, axs->target_pid[i],
-						  axs->target_auid[i],
-						  axs->target_uid[i],
-						  axs->target_sessionid[i],
-						  &axs->target_lsm[i],
-						  axs->target_comm[i]))
-				call_panic = 1;
-	}
-
-	if (context->target_pid &&
-	    audit_log_pid_context(context, context->target_pid,
-				  context->target_auid, context->target_uid,
-				  context->target_sessionid,
-				  &context->target_lsm, context->target_comm))
-			call_panic = 1;
+			audit_log_pid_context(context, axs->target_pid[i],
+					      axs->target_auid[i],
+					      axs->target_uid[i],
+					      axs->target_sessionid[i],
+					      &axs->target_lsm[i],
+					      axs->target_comm[i]);
+	}
+
+	if (context->target_pid)
+		audit_log_pid_context(context, context->target_pid,
+				      context->target_auid, context->target_uid,
+				      context->target_sessionid,
+				      &context->target_lsm,
+				      context->target_comm);
 
 	if (context->pwd.dentry && context->pwd.mnt) {
 		ab = audit_log_start(context, GFP_KERNEL, AUDIT_CWD);
-- 
2.37.3

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

