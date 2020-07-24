Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id A72EB22CFA0
	for <lists+linux-audit@lfdr.de>; Fri, 24 Jul 2020 22:41:50 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-Au2g7d7WNpuS2cRdK6NhdQ-1; Fri, 24 Jul 2020 16:41:47 -0400
X-MC-Unique: Au2g7d7WNpuS2cRdK6NhdQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07B61100960F;
	Fri, 24 Jul 2020 20:41:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D1C252DE6B;
	Fri, 24 Jul 2020 20:41:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AA7E8A3595;
	Fri, 24 Jul 2020 20:41:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06OKfcAN031302 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 24 Jul 2020 16:41:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A099B20A0521; Fri, 24 Jul 2020 20:41:38 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BC9420A0533
	for <linux-audit@redhat.com>; Fri, 24 Jul 2020 20:41:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F93380067A
	for <linux-audit@redhat.com>; Fri, 24 Jul 2020 20:41:35 +0000 (UTC)
Received: from sonic315-22.consmr.mail.bf2.yahoo.com
	(sonic315-22.consmr.mail.bf2.yahoo.com [74.6.134.196]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-324-rb3DRCeSMUOkUT9Zry5gBg-1;
	Fri, 24 Jul 2020 16:41:32 -0400
X-MC-Unique: rb3DRCeSMUOkUT9Zry5gBg-1
X-YMail-OSG: bjKgAnAVM1ms1_hyvCXWwZiFoHiWOlTs6Ms2kSS6C6OW_ClUjMXkjJCwwuLUIS_
	h5XnDhIfSQnbVbX1EiNCoF289tTOSS0LVez1UcmeSJzKlG7vWf2tQBFsbYbFtjIdo5HlleyacQjK
	_3l5qP0FB7R9WhCRpocKb.m8YBvPcGQMFwk5UWZhJjdjO2ar7WfhI4SKUsTXjTtw4aQQuxGONmHf
	v5q7fjbaGSjisTbFLsskbVib0qa3jhNvXqYJLKvRjsvC59SVO9GedR4hv08k8MKiqs9qRz6Cw2mR
	6npoZmlBV3aEJtjqo.kWht18gkEyf.0sefr1Vz0nlptnOkLZNlgLi2g6meBG3QRPeszYlKB_7tEB
	M9KKaEfXfM5_mfvRU7wb21yIjXTzi2jyBX06LlvuTSAO6PeUxWnO2wthXeoRqeWEvQ1Ipfi16K9Z
	ZLrR1BonUtY.W.ndl4tEdVZ0LYZI.JHF_U1hhrUyThEo5jw6cveMKg4JYP.s23KkunIWOJTEEUo1
	EKv_PJySNWcxR0r5qjr0HOPqwbYPDMuKFNvQkCWX9gA8l6FIvCuIe04NXuXYP_dcMWXkbf6Iyeob
	Cu7Q6u6eg77c5jTzjGJRTNiQL6BQ7ZsRzP55RD430P8i5bkkCJG_qUz44aNctnwIHBxnkeNRq6dX
	hs1phar8P_Zi66S4Gp5noWDRXgkgxCLKh9aycp6sW4spIK6PRGT8MMRkhSLJ9UV9M5mpZov9SFBT
	qtBzWqEX8y_9Rvbt.fATKXBYqldU1eFRjD8LzgpZAIppLmtM44pqChjTkaBAAKkF8durvjeCdfs5
	YH_hLJy7bc4z4AjwCVuY.g7EL.kSagG10lQoXA1PBUCX9fVQkhqu3WS.oqG.ZJk6.i5lUqwB8Vci
	kbp3vvmzHSeOWhfI8Tp2NvMcfEaSE.3nryijpsjNnunUjGp_fcaHqEVZRxh9Eh21xlRNhGa.u1I8
	k6zx43PJG0Ar2nABAyLa9yed5W6H1s_ZuP0VtnFIRv3lPZgOwkBirfDDKnISvvnRtHGDFWya5q9y
	RIyAPdYAe2N51PoXexkxndg.hDqh71BjOhBwM7rMejrgjYF0IfKkVB9mztsagbp7YtSvCmJsd6Lq
	2KvYDBGs.IqdoYFY3etvH6GYD._4T5YB1qz0zJ5SVVF0P6u2iW9MT4pQPKrJbupdbghTS60_bOG4
	vNq4zxlTR6cQ4b0RSVDNR8Ku4l1bkCWnqZQYm0w5jpHua8Q8TPPppFk_Q8qYSKZUxKsp1Qx84nRn
	orkB.dv5tF30oxKw5gGyHiQ35IExKRov07dGUUMx6rW5uTE59Lp6abUjQBNMEoQ3hdm608vYcxcd
	x.sVWz6qU9B6U8n5tYaGYiW3vz.eWSAb7Kd1x5HqTiSa6HsUiSRVnk8PzJlcLSX4rFHcFhGGtPBa
	OXoYkyB1CqPGho2wxy7z071HwhLFpENA-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic315.consmr.mail.bf2.yahoo.com with HTTP;
	Fri, 24 Jul 2020 20:41:32 +0000
Received: by smtp418.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 006a0575bffb1524bcd8a8c621c1f5ce; 
	Fri, 24 Jul 2020 20:41:28 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v19 08/23] LSM: Use lsmblob in security_ipc_getsecid
Date: Fri, 24 Jul 2020 13:32:11 -0700
Message-Id: <20200724203226.16374-9-casey@schaufler-ca.com>
In-Reply-To: <20200724203226.16374-1-casey@schaufler-ca.com>
References: <20200724203226.16374-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There may be more than one LSM that provides IPC data
for auditing. Change security_ipc_getsecid() to fill in
a lsmblob structure instead of the u32 secid. The
audit data structure containing the secid will be updated
later, so there is a bit of scaffolding here.

Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: John Johansen <john.johansen@canonical.com>
Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 include/linux/security.h |  7 ++++---
 kernel/auditsc.c         |  7 ++++++-
 security/security.c      | 12 +++++++++---
 3 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/include/linux/security.h b/include/linux/security.h
index df5e4e8d8e2c..7883975ea6b0 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -493,7 +493,7 @@ int security_task_prctl(int option, unsigned long arg2, unsigned long arg3,
 			unsigned long arg4, unsigned long arg5);
 void security_task_to_inode(struct task_struct *p, struct inode *inode);
 int security_ipc_permission(struct kern_ipc_perm *ipcp, short flag);
-void security_ipc_getsecid(struct kern_ipc_perm *ipcp, u32 *secid);
+void security_ipc_getsecid(struct kern_ipc_perm *ipcp, struct lsmblob *blob);
 int security_msg_msg_alloc(struct msg_msg *msg);
 void security_msg_msg_free(struct msg_msg *msg);
 int security_msg_queue_alloc(struct kern_ipc_perm *msq);
@@ -1214,9 +1214,10 @@ static inline int security_ipc_permission(struct kern_ipc_perm *ipcp,
 	return 0;
 }
 
-static inline void security_ipc_getsecid(struct kern_ipc_perm *ipcp, u32 *secid)
+static inline void security_ipc_getsecid(struct kern_ipc_perm *ipcp,
+					 struct lsmblob *blob)
 {
-	*secid = 0;
+	lsmblob_init(blob, 0);
 }
 
 static inline int security_msg_msg_alloc(struct msg_msg *msg)
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 3c9525c72c89..ff30714c89dc 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -2307,11 +2307,16 @@ void __audit_mq_getsetattr(mqd_t mqdes, struct mq_attr *mqstat)
 void __audit_ipc_obj(struct kern_ipc_perm *ipcp)
 {
 	struct audit_context *context = audit_context();
+	struct lsmblob blob;
 	context->ipc.uid = ipcp->uid;
 	context->ipc.gid = ipcp->gid;
 	context->ipc.mode = ipcp->mode;
 	context->ipc.has_perm = 0;
-	security_ipc_getsecid(ipcp, &context->ipc.osid);
+	security_ipc_getsecid(ipcp, &blob);
+	/* context->ipc.osid will be changed to a lsmblob later in
+	 * the patch series. This will allow auditing of all the object
+	 * labels associated with the ipc object. */
+	context->ipc.osid = lsmblob_value(&blob);
 	context->type = AUDIT_IPC;
 }
 
diff --git a/security/security.c b/security/security.c
index ce0934395c53..c74c7722e5f4 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1866,10 +1866,16 @@ int security_ipc_permission(struct kern_ipc_perm *ipcp, short flag)
 	return call_int_hook(ipc_permission, 0, ipcp, flag);
 }
 
-void security_ipc_getsecid(struct kern_ipc_perm *ipcp, u32 *secid)
+void security_ipc_getsecid(struct kern_ipc_perm *ipcp, struct lsmblob *blob)
 {
-	*secid = 0;
-	call_void_hook(ipc_getsecid, ipcp, secid);
+	struct security_hook_list *hp;
+
+	lsmblob_init(blob, 0);
+	hlist_for_each_entry(hp, &security_hook_heads.ipc_getsecid, list) {
+		if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
+			continue;
+		hp->hook.ipc_getsecid(ipcp, &blob->secid[hp->lsmid->slot]);
+	}
 }
 
 int security_msg_msg_alloc(struct msg_msg *msg)
-- 
2.24.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

