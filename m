Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id D5CA0253306
	for <lists+linux-audit@lfdr.de>; Wed, 26 Aug 2020 17:10:50 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-ZPxMi04ZOx-Kcwoekje1SQ-1; Wed, 26 Aug 2020 11:10:47 -0400
X-MC-Unique: ZPxMi04ZOx-Kcwoekje1SQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C28B110066FB;
	Wed, 26 Aug 2020 15:10:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A510C74F58;
	Wed, 26 Aug 2020 15:10:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 75C4E181A870;
	Wed, 26 Aug 2020 15:10:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07QFAQm0008183 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 26 Aug 2020 11:10:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6D98B114B9C2; Wed, 26 Aug 2020 15:10:26 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C537A100651B
	for <linux-audit@redhat.com>; Wed, 26 Aug 2020 15:10:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87F4580350A
	for <linux-audit@redhat.com>; Wed, 26 Aug 2020 15:10:23 +0000 (UTC)
Received: from sonic302-27.consmr.mail.ne1.yahoo.com
	(sonic302-27.consmr.mail.ne1.yahoo.com [66.163.186.153]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-573-vtxFaJgnMfedl-qHpVeRdQ-1;
	Wed, 26 Aug 2020 11:10:20 -0400
X-MC-Unique: vtxFaJgnMfedl-qHpVeRdQ-1
X-YMail-OSG: SKu.ip0VM1mOKBpN1yNjZmiI7FvaGv41xuO4tl5.zjopbfRBhUUAu8sNYmGryhe
	JntfFzE4ufF6YyraNTYsZoFqjGOxqstIz2hOo5xhjCq.Hz05ESVtxr55lbCrQINTRydJm1lmyiCv
	g3LnzZdxGRjlqBEtBGyXRDBzetFYvzOkfBCpX1k3pQEADd.P0KmufNrTegKoQjS_20_gM.2FnnTK
	qtJ4xetPPoTkDmtkSdiQIY.9PqpAy_nCqqELTdzn_dS28luRJ7DvHIJq3XNIptv12B4.lIDg0.1X
	oCYPufhYA.MpGvX1LMa9ML3jk2aDJrzXUjXyCq6l8xHCCIHm8yYlnxECWzzBUiSR6SRJmoSr48IL
	COx9mKYxlTDyJ.ACWXp5cuFyqDx_tWnimQJ3bhfuachpp.qAsigq0qVR77DaSZy9DmHnOeGbBOUU
	wZ8o8xb.s7lWKyAA9TeX9MsisAV9mdZI7Bo7QMr_GWNhXPm2OtJfmvjanOt_X45W29QH9p2HNnx7
	u57iYCJlzHEDYO6VgxAK1p66r5hZKu.lBTAsUDUOx0_eigzzX4uhD_rTgxnisHIT2YhEMrdkPisb
	Y9dFGymiNmXFHm7ULEhuQy7Q.bcVxXi9VWGzGV45qNLZtF.kxjFCrmFULm.1aA.OZkZ_4iVqgAC9
	OMpHfehqK0PnzAcP0.RVseknVtfn7n3nKCpLsyfdbpMwMQtVdYdKvN0SMclDvlTEjYvIaivUvKf.
	i7WNxLVY3Y2elnekrOfYItIL_Owl59pB2oJduqMB3CKW0WST4d1k_d7p69XVaqcaFeKZs9btSOlS
	9W7iY2oPhc_T6fWVb4bDnxYg69oQ9x6cteSDqggWSr.GRDbN8BhkhCs3wRglWd_z3aA4nl5fKsK6
	ONf_kSt7NAArNjyJNY2ln62evs50TJP8ZKSNhqEPI.yUfNQGyT4YgNkg4TsTbFD3fdSod4WPwXzQ
	qDRaFc5vv1ELSnnsTmLVLWg9aqzjqQ3N3Dmx.mMszhXpsnD58BMcubdr53vfsxlEGlxMTY5TbcuT
	lvflrjtdXOrUsADHhf9ywgAhenS9vSdW7mWmL8P644EsnP.dklLlHCY3brEiIdfdW3M3l1coDqF_
	VHgRY.OItpCl6Vot3cB6CcdvEC4kPkkV4T.gHOx6UN0_633eo5xdzQwVaMZ9RVZoi2oUkNWFXRrn
	bczQwJbiLAUWhoXvAkEAaeCt9QJ1b37.6E..oqYxuf0uSPfiumSaeGSKNa4I_TCF3fZcoBXkjf7q
	qezRrJBnDWEATOs0yDXbhFtStot.aZ9NeVnV1SubCQyQXDWfNbqLqWra4vs7SHuYt_M_ga1ghIOx
	BA1voGhuccr6e1TnNsfJXvK4X2uW8RHXyDgbAHXY98xHsqDX7CPmV7AODItM1.Ami.Rh5BQKO.Z5
	HgnSoILpOpuxf5.XpNGvd6gYAod55eunxge8Iu2nAOkcFBz2cv_7EJHBZvhz8PiYcStUJapeneGf
	azUjITlrHgaSvFqoPXl98m5BkEHvUwu4U1c1EAh5gK6ZsPuvNvL0p3fbE__wFev3SmRy_bYDXikc
	kvKYZIvsXpUouRPSrgzDbAIB_
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic302.consmr.mail.ne1.yahoo.com with HTTP;
	Wed, 26 Aug 2020 15:10:19 +0000
Received: by smtp424.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 4a79242ab2db84f56b5dd2596a16b4ad; 
	Wed, 26 Aug 2020 15:10:18 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v20 08/23] LSM: Use lsmblob in security_ipc_getsecid
Date: Wed, 26 Aug 2020 07:52:32 -0700
Message-Id: <20200826145247.10029-9-casey@schaufler-ca.com>
In-Reply-To: <20200826145247.10029-1-casey@schaufler-ca.com>
References: <20200826145247.10029-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
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
index 5c66348d9ab0..5f38bde9162f 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -494,7 +494,7 @@ int security_task_prctl(int option, unsigned long arg2, unsigned long arg3,
 			unsigned long arg4, unsigned long arg5);
 void security_task_to_inode(struct task_struct *p, struct inode *inode);
 int security_ipc_permission(struct kern_ipc_perm *ipcp, short flag);
-void security_ipc_getsecid(struct kern_ipc_perm *ipcp, u32 *secid);
+void security_ipc_getsecid(struct kern_ipc_perm *ipcp, struct lsmblob *blob);
 int security_msg_msg_alloc(struct msg_msg *msg);
 void security_msg_msg_free(struct msg_msg *msg);
 int security_msg_queue_alloc(struct kern_ipc_perm *msq);
@@ -1215,9 +1215,10 @@ static inline int security_ipc_permission(struct kern_ipc_perm *ipcp,
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
index 5f9bdd62f78d..35d6bd0526a2 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -2341,11 +2341,16 @@ void __audit_mq_getsetattr(mqd_t mqdes, struct mq_attr *mqstat)
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

