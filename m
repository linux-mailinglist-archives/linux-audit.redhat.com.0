Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id B08E21D40C2
	for <lists+linux-audit@lfdr.de>; Fri, 15 May 2020 00:21:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589494861;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Vw5mFrk4yeeQ6CSriNav2Bmonepi51TL1RW7T5YCOCk=;
	b=LOCrNe5ttyiEMIioIUZTNsJeX3H4xfnWcVn+qdHv+IiaI/VF9zLsYCDysvdzVk9FTEfu0z
	wVqOo3z6A6LE/WcATdpF04138wR0/62KsBqAQ8cDEXT4ySmEVsJxHKn92VMi6aVzINumM1
	jX0blYUVn/Kzwu+0xEfAqY9rYabZCew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-mx29aCcEMBqia5aeRal-rA-1; Thu, 14 May 2020 18:20:59 -0400
X-MC-Unique: mx29aCcEMBqia5aeRal-rA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10E3219057A1;
	Thu, 14 May 2020 22:20:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E13606A977;
	Thu, 14 May 2020 22:20:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B27291809543;
	Thu, 14 May 2020 22:20:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04EMKq3k018845 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 14 May 2020 18:20:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B5C1C10A1421; Thu, 14 May 2020 22:20:50 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E9183106B47F
	for <linux-audit@redhat.com>; Thu, 14 May 2020 22:20:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 566111049843
	for <linux-audit@redhat.com>; Thu, 14 May 2020 22:20:45 +0000 (UTC)
Received: from sonic309-27.consmr.mail.ne1.yahoo.com
	(sonic309-27.consmr.mail.ne1.yahoo.com [66.163.184.153]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-341-IaL_TKEJMr2ZGe6MLQNtgA-1;
	Thu, 14 May 2020 18:20:43 -0400
X-MC-Unique: IaL_TKEJMr2ZGe6MLQNtgA-1
X-YMail-OSG: aRJA2DoVM1mMt6nktE1RwQ4Qig3wsfitX0OjU4H41mHnTjTsl6rghQL8Q2vMRFq
	Y1ZQk.tLExl1LisnrhhKIfGfN0_r_2X3NmS2gE_yFVbNMJM806N2NpvvXQL7NuLPqQPE6EO6ScV6
	MffWWMG8GWHCw2m5vCG1qH.iDOoPQENlrKWr_CoUFEL8HbIsKzt1_f8E0uVW_UGYtuCZcFqj92mz
	1of2RO6LxIjIFQwihFQ5GJpYmtHd0cR7Tu6K3sR5VPtFCfezKKJLSpVCyrXI1wDZnZMq._oOA5kB
	cMsFIqZotVJINtCQgmQsW64fmJ26TvCwlAHowBYODJyoa1z3gWPj2RMQ_NARNUbjW8WP_EbzTF.j
	J_QUOkWGxEFi6lFuchsxQaslEvb4J.D0dz4xXEV4ehxcXhU_6HwyB0G9bIJ90x8_WexsykVdeHhb
	pwiYWM71hc_PFt0zTaq6ipAh2OZD8F8GHPt9InP8eDmZB2pY5P82Q962rYSDM_NYscDl8DaJtyi9
	nW5IEhDb0kiIsN8lY64ZDEx5VFD_024yQV2UU4GWOfhDkHYYLn7WtEcD6VgmgVQ66vQjcYFZJEsa
	8.9N5WR1sINcn_fYVn0XMcCHn4t7WnSKOQTn.m6O_inlA763mLIh0Vf_KOWFG1dr.9gFmB0_MLU2
	XWSKMZpRGv8Ew6TQtDmHiUGXZloL7KVLLsG6BN8a4SOYjBAK.AJSj8LRXfC9WmHglkAzFm5f4QVP
	XKf9Hucx0MLWv7zNT9K7PD4gUPOPENrxPvVxuDa65dYyYfKbnvvWuaU9ubYrKu7RdIL_0Xs9wXVD
	ImoqBUfYexIEW3U7hs5PPMv1fXvU51dwBxmsWn86H_DR9BK7I1n8uCKHUBaaGI17otGRbevmvOiI
	1MbBJazRU3dIR2pHf.TlTa_YV4w4cuHlUq.LmwM6ehoLjfbLRVvSWvCgdJhwdRFTZoS14WAF8ONE
	qITFwf2gE_25G1.F8TCiK2FEtFxVMEwn0BDW0LCHkOywcnysE_gYA4Oq6WLewCfv1MBZN6KEC88f
	ylGiO1OhZU3EvKz7MRlYfz9jB3hWCTguy.EEJz.ynCzrW.K2rfIJBdb4pwqWxnK5sbuyByz34NnG
	g8MMJPw4aIFLmzBj8Tp6IVsEjW2otFeM1_7YwyVDNrzB24ujwuAZXeTDqRzYEyc.j4qRG0v4Exft
	.kLfmR952sBodv.DkNThhsS7CpafiHfWrGJLcR60w6EKPahgQWZc87vCONjcjMzfANrYo5NBUuQD
	9ahfDZBBR.T9GUbqVogfWcARCdPgA5BTPg0r_3rgfU7AIF0jRU3N4aZaEs2JqXlCiMCEWuhc8Coe
	PSYwY1.vxyErh9gyAgI4OZ2lc1lyiGhU0weZyzXlrzbEGsMED6YIoxI3R97JNwX_8Sr1Im8RFCq6
	pp..f0CSsRvneOn8WaDDDYD_24EgmXGgcvOjdlh5WLXGq6bR7krEts1c-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic309.consmr.mail.ne1.yahoo.com with HTTP;
	Thu, 14 May 2020 22:20:42 +0000
Received: by smtp421.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 0c511fbc001a3a5bf9289aff8b2acbb5; 
	Thu, 14 May 2020 22:20:38 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v17 08/23] LSM: Use lsmblob in security_ipc_getsecid
Date: Thu, 14 May 2020 15:11:27 -0700
Message-Id: <20200514221142.11857-9-casey@schaufler-ca.com>
In-Reply-To: <20200514221142.11857-1-casey@schaufler-ca.com>
References: <20200514221142.11857-1-casey@schaufler-ca.com>
MIME-Version: 1.0
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
index 2ab69ebd2f72..c7e4ce8d209a 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -488,7 +488,7 @@ int security_task_prctl(int option, unsigned long arg2, unsigned long arg3,
 			unsigned long arg4, unsigned long arg5);
 void security_task_to_inode(struct task_struct *p, struct inode *inode);
 int security_ipc_permission(struct kern_ipc_perm *ipcp, short flag);
-void security_ipc_getsecid(struct kern_ipc_perm *ipcp, u32 *secid);
+void security_ipc_getsecid(struct kern_ipc_perm *ipcp, struct lsmblob *blob);
 int security_msg_msg_alloc(struct msg_msg *msg);
 void security_msg_msg_free(struct msg_msg *msg);
 int security_msg_queue_alloc(struct kern_ipc_perm *msq);
@@ -1196,9 +1196,10 @@ static inline int security_ipc_permission(struct kern_ipc_perm *ipcp,
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
index 585a1b3afa51..6fb75f799c60 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -2296,11 +2296,16 @@ void __audit_mq_getsetattr(mqd_t mqdes, struct mq_attr *mqstat)
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
index 9df05c1eb7bd..18370f3f824b 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1834,10 +1834,16 @@ int security_ipc_permission(struct kern_ipc_perm *ipcp, short flag)
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

