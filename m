Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id DEA35168AAC
	for <lists+linux-audit@lfdr.de>; Sat, 22 Feb 2020 01:05:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582329912;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Dky7tRDDgZWHJWEIWxvp2EdcCgme7VZr1tX+36S+zPA=;
	b=EBgRjJg9mF9+zHFSgXzFJcPSnYdNdj0AhR4OHMxfO3jh4r4FaflQzwIgLtc1lU7MEa6EdO
	xUMVoSH/zdKV+qANztyfi/YpVCPmbGQyvCEEsruICYlf2kkd3QtvoLBWIyViSR4rvuPpCR
	SGgIetGTr+SKbiF/ao2qxqcPDicOLbQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-nwaSRxHcM8mcz6Sosoq3zg-1; Fri, 21 Feb 2020 19:05:10 -0500
X-MC-Unique: nwaSRxHcM8mcz6Sosoq3zg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2342107B272;
	Sat, 22 Feb 2020 00:05:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB56291836;
	Sat, 22 Feb 2020 00:05:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 44FE618095FF;
	Sat, 22 Feb 2020 00:05:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01M050bp001353 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 21 Feb 2020 19:05:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 983A0165448; Sat, 22 Feb 2020 00:05:00 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 923261649C5
	for <linux-audit@redhat.com>; Sat, 22 Feb 2020 00:04:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75C66185A78E
	for <linux-audit@redhat.com>; Sat, 22 Feb 2020 00:04:59 +0000 (UTC)
Received: from sonic314-27.consmr.mail.ne1.yahoo.com
	(sonic314-27.consmr.mail.ne1.yahoo.com [66.163.189.153]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-249-Wnsyn_hxNXuM_1NJG3sC-w-1;
	Fri, 21 Feb 2020 19:04:57 -0500
X-MC-Unique: Wnsyn_hxNXuM_1NJG3sC-w-1
X-YMail-OSG: I7GB_vwVM1l2ZVsgAOsW5rzeXZ8.y5trypXAYc7nlrpIQ4O9.MF6eN5iUw7cYf0
	PxHJ4TQeV5MYfs5dycei00E.fzLWbV3SurMsvJxcdnz6ZxMgAQCbyel8dTYQ66S7Gz18vIQwHQjv
	Ae0TcCGICvkLl6d4ozRpMRF0gMU9zROIEs7kyNu.c4_T_CIat8SCS5EwM0iXuaJhIREIl7_G1STI
	KRM_gQNWlpdPK6pq3h4mLhBq2meSzQNZ7e4.rvAru.z64ypzEC8zdpcJDAe4n7WZFqUpwTzgeAed
	GYQBs6gjTm6KMs0xtR0ulTUHAnRYm_wcllmzww_dR1.Sc8XZ7J.b.NVp_AsuOjUxZqhsS0Uwc5t6
	7spIG6cuPOyrTakF4mzOltJLC2VoihMZXfojiEIDBriLgGdo5zdJaiJp8auKVKZUV4FVJyf9e7Fg
	QvweHGnUtkswsChSGXr1CH1yuM0Z_c3SXGwf73nRcWKxk9PzZEaQBHI_QfWZx_PFAHq5D.heKcse
	s32Rp8QLxixoN6wS5rSPZqnBSsycUyOYVvGsStqxL3o..n7epGtZoh_ELrR62odFD4BuBdrYMGSn
	xjquu7Sp2zmQUE7Vp4kYL3RTb5fwkm4xR8Yv.ZFKhQORRaENXoZO4IUYalD4va7BNGT86XTc97WQ
	maHWBdM8UHgOxsllVl2QXibxq33r2pnDfUuqxsjdFxmDQii4YdYuOsdi8iFfOxbHAckf4EKk3wd8
	XrVXe3VbqYm4M5IgoHPtMA_bB8ExoUYu5bD6OHqExlzvy2EJOIqVrAMVKIKOhVaAOU9MD82S9hsc
	yzO2cPDlwG5.uqGEWzVMrvzePiC9wQkCv2Z80W6XuPlzAESDekOJQUqzMMmCm9KksYC3Xg3dFhTw
	8mGsBagYZ9xwHlsy0U90d0ntfVgpHYz6RjHPfVQuSAzkRst1jBSW1jb.EJCwZ_k9fu478.KPHfNu
	5wyTbncjbqDmSfEjWqRxTx_KC0zMm1rQgoCH0aPTdarGXEsze3eVD6aR2ozngutv5kW_CyWrZGVx
	AJ_l5z6A67yqo4M2.d.bkxIojazUn8m24HZ75KkWWSlF.MsqznPrLD7rSea7UQ_uvSDBNhtKuIYp
	RIBMvopAFo6q61TqNNjkZhRPwdSD4kvgChAd0AQWlZkoAtCdmuFSjRnfPW_FEPGUajHsZb1.UKEK
	Fh.zXxKH4Kwcq9vPXSrBJGVuC6gLyraR9v.zRB6y_yQP9_cNAczmWGo3u5aLVKzUuu1k9ISxSsP8
	hA8IOs1_Kn0WMOA89swBys1xAScQM3a8.qFqmdPDEdeV18bJNzrlsTK783_Qyl4v2Q18Jq1rmLjr
	yaP0lASt9zkFZ8uo6xl.0lveYHi1B08_DxxtILsQR8aoiJ5_uUQriDzcylIJ6b2g7qs8N8Fipxys
	uPZR_EPh3_mkbnFtmPRHq4AeiBRiKoqStUlJJAHEQILxX.FCoVHus
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic314.consmr.mail.ne1.yahoo.com with HTTP;
	Sat, 22 Feb 2020 00:04:56 +0000
Received: by smtp408.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID bf470847a47bde7c61a750c1265c56f1; 
	Sat, 22 Feb 2020 00:04:52 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, linux-audit@redhat.com
Subject: [PATCH v15 08/23] LSM: Use lsmblob in security_ipc_getsecid
Date: Fri, 21 Feb 2020 16:03:59 -0800
Message-Id: <20200222000407.110158-6-casey@schaufler-ca.com>
In-Reply-To: <20200222000407.110158-1-casey@schaufler-ca.com>
References: <20200222000407.110158-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01M050bp001353
X-loop: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 kernel/auditsc.c         |  5 ++++-
 security/security.c      | 12 +++++++++---
 3 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/include/linux/security.h b/include/linux/security.h
index fdcba6e8d242..3ceea6c51bed 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -468,7 +468,7 @@ int security_task_prctl(int option, unsigned long arg2, unsigned long arg3,
 			unsigned long arg4, unsigned long arg5);
 void security_task_to_inode(struct task_struct *p, struct inode *inode);
 int security_ipc_permission(struct kern_ipc_perm *ipcp, short flag);
-void security_ipc_getsecid(struct kern_ipc_perm *ipcp, u32 *secid);
+void security_ipc_getsecid(struct kern_ipc_perm *ipcp, struct lsmblob *blob);
 int security_msg_msg_alloc(struct msg_msg *msg);
 void security_msg_msg_free(struct msg_msg *msg);
 int security_msg_queue_alloc(struct kern_ipc_perm *msq);
@@ -1176,9 +1176,10 @@ static inline int security_ipc_permission(struct kern_ipc_perm *ipcp,
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
index d6723c225c7e..032cdb603ac0 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -2285,11 +2285,14 @@ void __audit_mq_getsetattr(mqd_t mqdes, struct mq_attr *mqstat)
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
+	/* scaffolding on the [0] - change "osid" to a lsmblob */
+	context->ipc.osid = blob.secid[0];
 	context->type = AUDIT_IPC;
 }
 
diff --git a/security/security.c b/security/security.c
index dae86629a2f6..9d67db68f6f2 100644
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

