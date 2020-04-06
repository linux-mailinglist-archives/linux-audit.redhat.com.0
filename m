Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5C92E19FF56
	for <lists+linux-audit@lfdr.de>; Mon,  6 Apr 2020 22:42:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586205743;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=u8vx4Z8uOKPw9eCJTSsQD8dFIZHiGQThe+HkxvfMKQw=;
	b=azBhsIzhKVPN8NG2eqNgcuS2NaqNumwCpsIPqkk7wCATbblhnpQhjtE4I3EhVw3CKeHnts
	9xxJGoDJB90f87n6zsV86sBpRM5/FXzQLb8qW+SR6ET2TeBqlrN/ih4WFa6k4q4XRwkew2
	0PVdRc0IatH5488sj6gFzSw+MSFMU4U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-7pu63ke8NIOE7IQOKL0kdg-1; Mon, 06 Apr 2020 16:42:21 -0400
X-MC-Unique: 7pu63ke8NIOE7IQOKL0kdg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9EC6F991C2;
	Mon,  6 Apr 2020 20:42:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7810B177DD;
	Mon,  6 Apr 2020 20:42:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3666218089CF;
	Mon,  6 Apr 2020 20:42:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 036Kg8NE013253 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 6 Apr 2020 16:42:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AE8F22022EA5; Mon,  6 Apr 2020 20:42:08 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AACC42022EA4
	for <linux-audit@redhat.com>; Mon,  6 Apr 2020 20:42:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D4A2185A78E
	for <linux-audit@redhat.com>; Mon,  6 Apr 2020 20:42:06 +0000 (UTC)
Received: from sonic313-15.consmr.mail.ne1.yahoo.com
	(sonic313-15.consmr.mail.ne1.yahoo.com [66.163.185.38]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-501-Pv1QLtoQPK2XCDYM1xxKug-1;
	Mon, 06 Apr 2020 16:42:03 -0400
X-MC-Unique: Pv1QLtoQPK2XCDYM1xxKug-1
X-YMail-OSG: YmIR8qUVM1k3L4uEhE3lw6N5d3lW1tI6RR_8XtL.pMeSci0dc9rO59GvyIM0XDY
	Szu7t._zxrT28ZxA5wG1pHt8x_GGNvw2uu4hEgNMVHn4lI3ygT01DswBUOvE0_7mCwVtiTrWy03T
	2h.GvBpQXdzvOUELFOGjcNBQKmXkTATQm3hjd_QvDRkFJmdk2m5RrlYWignfpDpUSCRsTbDkoIxk
	eacTIgkqQJ5AJq.AOHJLiH_h5Wjdzdg7CD2B1n_9VoQ.1DfU.F4teuPY00nlviMI0tL1aeMqW3OX
	uUu9mbnWpU5wrPAo.4efWHAC9jHsM0n2hNkJXNVyo5MjwrBOzJ1vqqLR.hT_TYeqwB8AbKHnDDK3
	9toKDxnJ6sQwPhMR.Uj1X0nSiJYatj1Pz3tiBM0n8ClJt19yazFbGK_6S3VrlfCj6txZxiN7NvZe
	fqWRq61Oixj5Ba1FQ56GlF15t.c0GYUm2x4S2rT6UqLegE7NO2yTxDzwgTLkZP.Elf5esWVuCvC_
	LLPrFaNT1nl53wVvfbQnb7AbjL3RNB2lXzoVi6MH2jDHByLqFB4Ty2qIVycryLMpa3CUGp5SywTO
	JSEZO5pu.Wj0Czm8nN252.VJ5CAtGLCWIOgw_EgUApfhd5ioLuvDg4p..VJzkcfwBjFUFxUOjoqE
	VkAJqWJjZfMm.BDXuxoj6gNmVJVJNJMU93bNEVofVnRnz53dj0W1SSMKlYMJjGAD.Zl7_aGXv9NI
	FIs1rAg0taLKg8xwKu8CJ7QuPWX9v4icJqi88DkW_R2ETTxluE9GArCFkVm55GtTaJJUX5xXmj4d
	7z.qsRQuXRBeWafFnFJvny8LX5IPAK_iP1CECfuvRa1JKZVs6Q2IsDXHKe4zAQCjH_Bj2CruPvJV
	JGT8nMNFjc06lddRZJKwLsWuVvY8gbjoCgBSZ0pK7NMcBzzHo_RbujeEa0eY8Vy3xnp6OOb4Gucq
	b3fhMRiLigz6yNEzZFC2fTbBIvrYYWOO2JcSitdv7jmSloLdIXa7pJPz.8jN4drjotu3vfxMiwFO
	JVNVWa8ZVA4IgtamG_oVnS1_pEXCfFye11N9PdLIO3X15sfnP1BD9XLoO.wWVkuFGpUXdzuNhsiT
	YDRSdnBQBqHx87VK2ojbHgw.pkvO4aalbmfm7vbQqYNMQZCGUgHdzG9UkZ07hN1ARYH21EkaB7Gl
	pPZaxDBjN8k8MCWa.AH5LxpfT9E_Ab5vTZ9120DLE3LImNJ1UzRyGKJIMjcfCcEB_Gb7M..nSwUG
	1nNkxZx_26V62gBwYFBF8O8kBE8CVW6zUyfF0Q._ZnFDN6uV1pZ3fNt5n5lkOvZe8bufbC11XgB5
	13lSzgVAZRdbu6q09WSG8blzC_LBSvl2pQWZ8rDWMZ28Q2_dLGhhLTPuJ.rgQWc6ofhgEGiKJCwG
	LKuyCbSuc9UAxbJQO9jA9Z0ospWmbsr3tGPw6ZnEaR9XclrevuBblMmfhbvW6
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic313.consmr.mail.ne1.yahoo.com with HTTP;
	Mon, 6 Apr 2020 20:42:03 +0000
Received: by smtp422.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 330bc0ae330c243d0dc3a8e85f923118; 
	Mon, 06 Apr 2020 20:41:59 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v16 08/23] LSM: Use lsmblob in security_ipc_getsecid
Date: Mon,  6 Apr 2020 13:40:22 -0700
Message-Id: <20200406204037.42262-9-casey@schaufler-ca.com>
In-Reply-To: <20200406204037.42262-1-casey@schaufler-ca.com>
References: <20200406204037.42262-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 036Kg8NE013253
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

