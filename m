Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id EBDDA1A036A
	for <lists+linux-audit@lfdr.de>; Tue,  7 Apr 2020 02:11:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586218272;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=u8vx4Z8uOKPw9eCJTSsQD8dFIZHiGQThe+HkxvfMKQw=;
	b=VQau7aYgG/3G7MDwBVGQUBq+snaf7E5oEYM/nxUWR+78ga2B0mGsOKvLxgDWi9Kw8trLUP
	NdcvxynX7BzilLYJOuimS74kPaJ2hKiYWJaPzQxo8mYO2s0TxGByiX8I5ZwdBoEAwmYTwG
	1CtL5onGIxQQVVRgO3GYbYbX4cKJ28c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-lJbqqtiGNCWmByCyYNKpsQ-1; Mon, 06 Apr 2020 20:11:10 -0400
X-MC-Unique: lJbqqtiGNCWmByCyYNKpsQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A36E418B9FC3;
	Tue,  7 Apr 2020 00:11:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 737535C1B0;
	Tue,  7 Apr 2020 00:11:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D4EC618089C8;
	Tue,  7 Apr 2020 00:11:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0370B0NY025062 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 6 Apr 2020 20:11:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A48D220230A9; Tue,  7 Apr 2020 00:11:00 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A06D8202A943
	for <linux-audit@redhat.com>; Tue,  7 Apr 2020 00:10:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 271A78007AC
	for <linux-audit@redhat.com>; Tue,  7 Apr 2020 00:10:58 +0000 (UTC)
Received: from sonic306-28.consmr.mail.ne1.yahoo.com
	(sonic306-28.consmr.mail.ne1.yahoo.com [66.163.189.90]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-385-32eHt744NHChnEl8pufOlA-1;
	Mon, 06 Apr 2020 20:10:56 -0400
X-MC-Unique: 32eHt744NHChnEl8pufOlA-1
X-YMail-OSG: 9nFUCNgVM1lR7qF9KuMbU9ULpdB7zOvlKh_M3OLjIrjpMZ2dfD4U.Xljs5D1opB
	9TcreFpuvqICVD2dUqvhcux0WpvxYqd2Hg7VOGPEap2zueY3VcnbqHZ0Uug2Bk.daQU5J8eaM0Fz
	Vhbce3NMYhepj9nVH6WPglWJLFv8OhY8iQHmZk8iTusXTjlFq3RudHTEpVxSiyOXNqGfn_GZ_s0j
	gQwPqG71.3kOCv5UhI1htY9Cn_Lcv56RR5EH24p2nlHKsz3pKIn64VyPexWg46hknlKtKGo_ObyG
	7AacXkjz3Nt1EE0Rz6jV4vq4zofllfN12.M.cuzMVv_GJt95dQzULIJMrpe9BbU4h3bMnSWc3wWb
	qrInCyUaB_6R_uIhL6Rj1f9IkUXZ7n9nz.BrD3.p1AvdDTihiUDZWHmspvpxmYLBB8QVxPO6T9nc
	f_mVxfJpB.3AY4SC201p4AcQCc1bB7rLjsOu85jAevr0Y_bZXFGa.MQhHGTogQ.I0gXv1X6Ezzfe
	wQzIZJEutOJ0DfF90Lj8FU1C8z_i1cQrmnN4EDKazETs9maoVqGrj6Fjx4EJ7BvCdEoXtzaLz7EL
	SL5dEAzMR_1bdZYI_VCKn3YlX3.5ueq2h1EMJgCIHJv1PSVWnrlniGsM9GkzCx4gV8q.4p.cPejl
	.yrF8iq71Gs0dpyJleaIi3WwSfxCTvWN68oaFXpTUSbs6V2ZT8UJAxn.j6_o.CMbErxQapmyhuRN
	9qlwx9wVlREoDnoGlSSG1qOE_lJKUVlTjqpooLQNH2V.FfUzIBUz0x_sp2g377JtZ7FIJxN2y8W0
	iLdycI0xRS1kHRvsUrC12RcaMOrgp_kq8H3vBq1GVNuXRMw4s_d8eYDcsfbaMzCRda4O1q9xRMQJ
	Rj86vQ8tx1c9RnumF6gAuXSlUuSuDwFXAqwyPnb._o6coi.KGf4EK7z3BR7LHCAv5Xygqm5.DCN3
	uXmGKF5E7NiQ_UapSKONTUTUenXfh6lMrZS.xw.qJiun6rsdadn8bOzk8ZTfAhCpaEnSDw79LYxN
	pWd6jfM.Qu5TSgfdlDeA1oPrpCCDTfEroZqvegAh.4hBZ_Q0q84lG0oVpKc0HyFYC1ios1Q_m_N0
	HH4mYOXyfmmJ.6bslrL2nj6.UI.udJUcjXpr4ZL7AL1KfaBz1DUNpxBD2Cg5gHAoX_LUIbgUDhTh
	viaoBR3fSGe4.eEIRIy3hYDOQjr8hc0OghQ6D3nbuBNiMMul6eoZC.iFiRlbDnY4lkqebIAhtyzZ
	7nU6mk6e77V7agjw3Ukmoj813LyJFCKfph.Jh03rg_YplXfd0Oa.rOHWObOjsyjD.xPAHauJ0PjM
	aJUC_Su.1gDPK3ltZGuGi5Ei5XIAm1nxRhHfFmpexl15EISkrZxFQ0y53qjuD8ayx.8U3GCE99N1
	LgfCyjicfF8Uywu.Ops0yN2O0hEDIGWNArBYoywoPb48R4hgJaEq5yhEkmMZUbQvBUJ8-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic306.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 7 Apr 2020 00:10:55 +0000
Received: by smtp412.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 872e464e2a367a830538f58bc8b5b2c1; 
	Tue, 07 Apr 2020 00:10:50 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v16 08/23] LSM: Use lsmblob in security_ipc_getsecid
Date: Mon,  6 Apr 2020 17:01:44 -0700
Message-Id: <20200407000159.43602-9-casey@schaufler-ca.com>
In-Reply-To: <20200407000159.43602-1-casey@schaufler-ca.com>
References: <20200407000159.43602-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0370B0NY025062
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
index 97921325b2e9..10c607a40057 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -489,7 +489,7 @@ int security_task_prctl(int option, unsigned long arg2, unsigned long arg3,
 			unsigned long arg4, unsigned long arg5);
 void security_task_to_inode(struct task_struct *p, struct inode *inode);
 int security_ipc_permission(struct kern_ipc_perm *ipcp, short flag);
-void security_ipc_getsecid(struct kern_ipc_perm *ipcp, u32 *secid);
+void security_ipc_getsecid(struct kern_ipc_perm *ipcp, struct lsmblob *blob);
 int security_msg_msg_alloc(struct msg_msg *msg);
 void security_msg_msg_free(struct msg_msg *msg);
 int security_msg_queue_alloc(struct kern_ipc_perm *msq);
@@ -1197,9 +1197,10 @@ static inline int security_ipc_permission(struct kern_ipc_perm *ipcp,
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
index 56cbb113975a..c5aa1f10e7cc 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -2299,11 +2299,16 @@ void __audit_mq_getsetattr(mqd_t mqdes, struct mq_attr *mqstat)
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
index 85751ebe8842..776f62291b9f 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1815,10 +1815,16 @@ int security_ipc_permission(struct kern_ipc_perm *ipcp, short flag)
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

