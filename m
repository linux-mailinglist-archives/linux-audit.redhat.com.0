Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7A25ECE1D
	for <lists+linux-audit@lfdr.de>; Tue, 27 Sep 2022 22:14:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664309656;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=90eBMYQjGXXKYEfA+gfL8kM5PlZCrkGgqLCPcx8bm7c=;
	b=Yx1MdZe2p1JNberPp1leshwj2xSLTgW/g2JaUhpKOdfAWBxczqyXiXTnI5bCxD14A6qttt
	v+g/k2Qxv0xnodleuE4Dbyu8s2XrhWZy7Job50Jg16es+NDuZSstkInJhJYl8vmcx/fYak
	230dNxUFWj31dTnwi4h+TMJxIPC5xVQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-IoNatpBtPZiPhOwKy9mTcg-1; Tue, 27 Sep 2022 16:14:14 -0400
X-MC-Unique: IoNatpBtPZiPhOwKy9mTcg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6926299E774;
	Tue, 27 Sep 2022 20:14:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9DCAB40C2065;
	Tue, 27 Sep 2022 20:14:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 344791946A4E;
	Tue, 27 Sep 2022 20:14:09 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 447991946586 for <linux-audit@listman.corp.redhat.com>;
 Tue, 27 Sep 2022 20:14:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0140940C2065; Tue, 27 Sep 2022 20:14:08 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED07440C2064
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 20:14:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D116D299E775
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 20:14:07 +0000 (UTC)
Received: from sonic309-27.consmr.mail.ne1.yahoo.com
 (sonic309-27.consmr.mail.ne1.yahoo.com [66.163.184.153]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-577-qAUwIdC4POGYmLdCfrMIRA-1; Tue,
 27 Sep 2022 16:14:05 -0400
X-MC-Unique: qAUwIdC4POGYmLdCfrMIRA-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1664309643; bh=5XcvpUDC4BByB+AJV9gZ/qzE7cCiE5C8eZU0BIdd6Wj=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=rie+38A8TnaelCsVKkL6/RzTO/AQTfRvfBaP33MinHfUMOk63Il0pyWbaTCE6iIHjQqznUWVpVg21zxpRk/RbMp1pHhSN8DUi4Bbni6zlALGjCSU1ocryocfzOrcVEWKpx+iOt9zypRI6qxPguv2E5BISvQAC34COz2zNoKYdBaSaiw5t53wUGRYjmPXIvGQuf2lmpCQ8n+h+GVvLS6/prij67Jw6mZ5eL0X4hqHyS30ppuNXR2VnYl+/HLdZfyThcghUGwyXw92WZs6JRkWeyX0ejfHgmw1X2wdQryV+QgywgSyibuDJ7Job/4RCG2BHSx8O0o6IelMa+vzv+ll0Q==
X-YMail-OSG: 9CezXe0VM1moRcGdHRJfUFwiYz9H7tPZsJXW7928ta9lLQpzzFSMXADEZKvNDCY
 NK_b68ezOicW1j1JCNroU.H7uNwIpx5v70.WD7MN_Eu2hS3T4wxuwyKiYsesys2PGCUWDU5cIBlu
 qpmww0cUiTpWSo6DkFC49pVnjQEbmtjUwYgdJ3vHOZXq.q.j8yu8oLLM9IpUGMnSFa0G5HWpIuiW
 b72NN8VRxDvtNErrQNujd5o_TOwT4HyazoT86Hx8NuVt7JOIVAkEyGZIUEizKukkZ7h6gHBhmpU5
 zS8wPuZLq3ZK39.2I.cFuQqcIEjDXaQM6pkEP_e9FaL6hSMm3oR8R2HBaMwoiA0sSrePBgGdoUtL
 Dj8berJtoJzpUHHDRoc2_qTLCL91SEOUYxUL1w.wsRqgG9UscntanYhIXfzEe1rn1KRLLS2_HGQ6
 nDKvU7.UJTZj_vgWqutWPlNGjIVCrUQ2kP1Bl09WlIcaH7U4Y7U68vyUqDIj.02VzlVEI6783Ayn
 IkNWl.TjfqtEbP80xyeTSn6ihla9.1YlXLMuVAHq6Sra6Ob7BZjHol11Kz00kPwl1yC8.2tdoFsI
 QBaD3fDJM_AfkKN9MVamrL_6HVtsJVwdE3J08ZlpRP9AvtA3MlQ7euwWdGVHWv6GnIvxsUQ2a13M
 lrDFhrMR8bKmWpZlvN2CgTEf90Q7V7Wt5sj1cCVK8gHbA1yOkJiqbhACdXF0XIUbEcm9J8dPdW9V
 .MWL2ZQ0A5Se36aA.zpg4NavctoD4kekbfhumZLgvJsDU5lhTLyDyYE_0QX4YMLiZZZH6Y00CWaQ
 S5t3E1ABT3Uo_E5Q86sXYsBW9lFPiN1j4IigG7eOR144aW4IedgQkOEgiSq4R8D39PF5QyFpc6vX
 BU9xV9oEJQGzx5mobjLWjR1vX50AT0oDFhG1nR4O68VRuHtQnsDh4yFiFBFc7SbspOBlau0pCpoo
 avODr3TNs0fVghQ9mQVFna.90dJpTrqu2ws06PsOm1gFlJhWwudSifnHUK2lxM3y7iPBm7yHjPaH
 EbO4anOqzSsimkPpETcsXt62QF4jTNJCJCdfmiLpA8GsgvWiYw7XqnuKZDJKhONoM8hdp5nIHvNM
 2cSPIJAxQzcA82gVLlZzigipWUYsfS8SHjWfWqgw.7FBYjWvmfXiTf1ewsEzxO60vpJBZ_gxh49K
 IT36S7Qsuxb5jhVNkqMNwdTzGN3vA3_H3FWJpzsLG2l5Z0IhXIkmKeQZlJABbeDOYabZNPDRHhL7
 6UxygDTAQvudqmOSkj2A8cEhbluzr_LF.i1RKM.yvrZ9ipwZHtiBP7mihzTyepGmc1aE.fShF4oq
 4uCiLgTCUjh2r3PW4JlKlG_zPJjSTb.iv55HIUwH.AtXMcM3L2GmgWg5RpTn2lPGQDxrZSD4LK0s
 4HxlQ.2wqIx_8xdU7gC8hd90P4WtTzpwfu_sGxLs7KJHptQXsVF4QtueC7WCkqVCH6A5o7MKQl2S
 gtjdb..xkbGwPsD_xdQYL8KBXVx39zc9b0obwfd2Dy5GH26aCVkx.c_5jzyt6YE.CWBDk1sJq5Rx
 JLq3R7ItBYjx9RO0zXUAbuk3BxUaCzyiNEgzYRvMyezp3RUUhHBd3YenGoWzV7SjsoCwhcDxgHEq
 sCUYV8zMIquNl5FiRVzs2cSScuPVHoDZ8az0haiXnz6rb23YVBNmLhIn9NCini8mwZP3uqEEsFx7
 r9xH0HkuvK0N38StTE6lMNjjyJdU7fHFhiB9ENupMD9b4iMwBl5CJcXINf_oxLatRVWtFlcWVpPZ
 2VTPbKLueBcJPOFDyzRk4P4OTufKJBtS1yQFcAgW1atHwhYpMtLHbQto4DImNVDX5vOhyaox_5HH
 WEQ8lOkaDZud5mfBlehlmVN5OxEssln0Em59rl0ZxQkKBRyfZHVN9sYUDSt2tOyJb4qv6MumygLd
 JJ6Jub.5qirDI6X7z0mlKsA2t6ZLBFaZOHDOXXH2Yh_zcIgsqPqDGH1JJL.PBfYDwxawje0bycxV
 9p8olbdRDxhSMoyawL5pL8LvJmRRsH1jE_MsoR9rfpk2v7InW4Priu.szkJzt3XKOsdaAxaILg0w
 F2HDLrl3WXA5y8sxoqHpLmbfUs_AFkfBmn7J1D.D5w.Bmo.t2K492lnJgr8zQatsT7NqM_QUiM7t
 XZXYJvjg0Wp3rXQxI.yKRkFEHS.ZSlkstQtkCKkPtW1OiJqd7QDkbiBOiDsLh9LrNQXOQ_P_CU8L
 lkz5DMqT4o49w7F.3ugtYVWkK748DjjIOnUYsYFHRSes8CKNofJCkst6Iheg-
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.ne1.yahoo.com with HTTP; Tue, 27 Sep 2022 20:14:03 +0000
Received: by hermes--production-gq1-7dfd88c84d-65ptt (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 395ac973b3706d14ddbf652d9544c668; 
 Tue, 27 Sep 2022 20:14:00 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, paul@paul-moore.com,
 linux-security-module@vger.kernel.org
Subject: [PATCH v38 36/39] netlabel: Use a struct lsmblob in audit data
Date: Tue, 27 Sep 2022 12:54:18 -0700
Message-Id: <20220927195421.14713-37-casey@schaufler-ca.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Remove scaffolding in netlabel audit by keeping subject
lsm information in an lsmblob structure instead of a secid.

Acked-by: Paul Moore <paul@paul-moore.com>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 include/net/netlabel.h            | 2 +-
 net/netlabel/netlabel_unlabeled.c | 4 +---
 net/netlabel/netlabel_user.c      | 4 +---
 net/netlabel/netlabel_user.h      | 6 +-----
 security/smack/smackfs.c          | 2 +-
 5 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/include/net/netlabel.h b/include/net/netlabel.h
index 73fc25b4042b..d9aaa264e29c 100644
--- a/include/net/netlabel.h
+++ b/include/net/netlabel.h
@@ -97,7 +97,7 @@ struct calipso_doi;
 
 /* NetLabel audit information */
 struct netlbl_audit {
-	u32 secid;
+	struct lsmblob lsmblob;
 	kuid_t loginuid;
 	unsigned int sessionid;
 };
diff --git a/net/netlabel/netlabel_unlabeled.c b/net/netlabel/netlabel_unlabeled.c
index 050753d2f2bb..24519b803a6c 100644
--- a/net/netlabel/netlabel_unlabeled.c
+++ b/net/netlabel/netlabel_unlabeled.c
@@ -1529,13 +1529,11 @@ int __init netlbl_unlabel_defconf(void)
 	int ret_val;
 	struct netlbl_dom_map *entry;
 	struct netlbl_audit audit_info;
-	struct lsmblob blob;
 
 	/* Only the kernel is allowed to call this function and the only time
 	 * it is called is at bootup before the audit subsystem is reporting
 	 * messages so don't worry to much about these values. */
-	security_current_getsecid_subj(&blob);
-	audit_info.secid = lsmblob_first(&blob);
+	security_current_getsecid_subj(&audit_info.lsmblob);
 	audit_info.loginuid = GLOBAL_ROOT_UID;
 	audit_info.sessionid = 0;
 
diff --git a/net/netlabel/netlabel_user.c b/net/netlabel/netlabel_user.c
index 42812bdfc31a..e72dfe2da77a 100644
--- a/net/netlabel/netlabel_user.c
+++ b/net/netlabel/netlabel_user.c
@@ -84,7 +84,6 @@ struct audit_buffer *netlbl_audit_start_common(int type,
 					       struct netlbl_audit *audit_info)
 {
 	struct audit_buffer *audit_buf;
-	struct lsmblob blob;
 
 	if (audit_enabled == AUDIT_OFF)
 		return NULL;
@@ -97,8 +96,7 @@ struct audit_buffer *netlbl_audit_start_common(int type,
 			 from_kuid(&init_user_ns, audit_info->loginuid),
 			 audit_info->sessionid);
 
-	lsmblob_init(&blob, audit_info->secid);
-	audit_log_subject_context(audit_buf, &blob);
+	audit_log_subject_context(audit_buf, &audit_info->lsmblob);
 
 	return audit_buf;
 }
diff --git a/net/netlabel/netlabel_user.h b/net/netlabel/netlabel_user.h
index 34bb6572f33b..56a634244a6e 100644
--- a/net/netlabel/netlabel_user.h
+++ b/net/netlabel/netlabel_user.h
@@ -32,11 +32,7 @@
  */
 static inline void netlbl_netlink_auditinfo(struct netlbl_audit *audit_info)
 {
-	struct lsmblob blob;
-
-	security_current_getsecid_subj(&blob);
-	/* scaffolding until secid is converted */
-	audit_info->secid = lsmblob_first(&blob);
+	security_current_getsecid_subj(&audit_info->lsmblob);
 	audit_info->loginuid = audit_get_loginuid(current);
 	audit_info->sessionid = audit_get_sessionid(current);
 }
diff --git a/security/smack/smackfs.c b/security/smack/smackfs.c
index 314336463111..f74207f6c71e 100644
--- a/security/smack/smackfs.c
+++ b/security/smack/smackfs.c
@@ -186,7 +186,7 @@ static void smk_netlabel_audit_set(struct netlbl_audit *nap)
 
 	nap->loginuid = audit_get_loginuid(current);
 	nap->sessionid = audit_get_sessionid(current);
-	nap->secid = skp->smk_secid;
+	nap->lsmblob.secid[smack_lsmid.slot] = skp->smk_secid;
 }
 
 /*
-- 
2.37.3

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

