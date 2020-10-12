Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9EEF128C251
	for <lists+linux-audit@lfdr.de>; Mon, 12 Oct 2020 22:27:30 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372--FOSIoqZOyqbs6PpTK5fDQ-1; Mon, 12 Oct 2020 16:27:27 -0400
X-MC-Unique: -FOSIoqZOyqbs6PpTK5fDQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3C131005E6B;
	Mon, 12 Oct 2020 20:27:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 94AF05578A;
	Mon, 12 Oct 2020 20:27:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 61CCF180B658;
	Mon, 12 Oct 2020 20:27:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09CKRJQb019248 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 12 Oct 2020 16:27:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 87A8A2BBA0A; Mon, 12 Oct 2020 20:27:19 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 81C892BBA01
	for <linux-audit@redhat.com>; Mon, 12 Oct 2020 20:27:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6625D1010426
	for <linux-audit@redhat.com>; Mon, 12 Oct 2020 20:27:17 +0000 (UTC)
Received: from sonic312-30.consmr.mail.ne1.yahoo.com
	(sonic312-30.consmr.mail.ne1.yahoo.com [66.163.191.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-439-LFVlxLHRPmiHTzMcguR5EQ-1;
	Mon, 12 Oct 2020 16:27:15 -0400
X-MC-Unique: LFVlxLHRPmiHTzMcguR5EQ-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1602534434; bh=5Oj59/rzhl0P/P4SSEuayHIGpG9W/FQntIVB/W/dDgn=;
	h=From:To:Subject:Date;
	b=n3W4FKMOzLMtWLIEHjxTWRndhXyKNFsk9Hv+C6FEuE/jqfiIvwRr25s5x4yD5PkSeIULpYN/sZcHzNVxrrFgBWlHtKqC1WxNsDLqEkCeSpIS0kkoRV/McxAF0RqJzOrRODmRdVJNvKCXcmIamac87qXQqjTv3CDTzzI6iK8dW/IKSNMPY9HU5D8Sak3v03KMOeZzPPLJ+482ABjxYMDSZmwQrOnlbepArEaj/J+WHx6XxgW8Elt98E+UeJtzwXzr2hVPD29wQyaZo0IjYlto0z7kzLsAr0bxuD/YLyUiIWbwkDzjKKed7UIujc3PYyJQih7XPswAp6CgTsNowrXFfQ==
X-YMail-OSG: m8UqKdQVM1kCwRrTrHfoOOcvrFMGvGnAhUEeUYpd8oSgZvPylkgGYyAKjJoDmMn
	1obgYcfJzbSpg4gCcZu5ChnzYD4XE2gCdupcQMuzxqT2pwTySfPTN0hf1cSye.C7azzWMuO5JH1Q
	q7soE.ekB1spzNIUY_pF_jTydH0RIBbM5DHQVuG3bti4.OwYm8m_ezNEJ7F8XCy66ll8T1j0zzv3
	Mb3Z2dkrichKsqeJE.N63dQxm._.QEqcUgUzmF5opQk3FJwXSGrW6SmnU2dO.wozTKZkP0aak5UI
	LBlAEohCS.rRixc8wt8WMhYz1kouykUQxveKQqyHiK6RX6..7DCH.tC2nRtN98JI1CU5hUu9WeHq
	4clDQpgg63YLorymiGAUh3qDuaMb1QvVHDDat.g3mLoVRSlHVk37WpVQy2x4yoVlTGw0Cq48AABL
	.1fC.w5dx2OhokLdygofKl5lnpGaVT9hFfQqB.9gzFbKImZ45NDPZYygINbipojEfhEtt2jEJBqK
	UI_mqKDXeu74a8s81l53pm_7x967dHbm1HzrtXZs6UowJA3_eAfmPl.eT3quvZArOpy0C2m1A2n9
	7ODtEP8uANddOgX_jj.Z0hgGLCWfSDMWUdHcl3HfnVBIHp5XPCjhH2dALOWhFeyZLFP2L9H.i9I7
	H2YpyNuofu8DA22qzreLbjlMZshnfflMTJSu2sOQu6uvlxSfzFs3XRVdLHeGu59b0GbfG1ejSImj
	euAAEO7vg28oW8ZYEczmFRTc58MWj3BMV6hHRfbAMtyWdxCMxg_KH97o1yFZy1OIQdVNArofLH8e
	zS1eaqnocp.6u6V.0WAjG_clEZaroDHD68wmFi6R21hFNVcwrhZZ7o3vrKMZreDH58u8MOuC5fMz
	TkMbb4bu4rtaa9y4W5m9OpNs0gr.FjjRF6WF5836I9u1_ukNDazo9rO1.uXBRZSSsirk9iH30eBj
	G_FxuP4n5tbp6y2UHsFnz7qmme4tw4odJF3vZgKyukc9sIuawy2CbICVlTUkPxT2FI1JHzkaPr4E
	OHg.u7GM0mwboXtTpJ9ChX9g_p6XeS_MbZM7cpCtqiXt28ERZbvULZG0q1GLw0rEKw.rT9seU4Tg
	KRq3cRAes6RnWMRX7hFPkH5JyJ_qlMW6r4pQyNLDH48Ml7mjcayb1xRyoXXd5fB34Px_XGImLy_j
	.Vl58643JiQsZaqrO1OYyUF72KuL3kQFMRjfGpi29rdJrqloRXwKge9FSjc95rsSdY0ltENMeHle
	J1hp3oSYuBi1cHxPNi5F9W05CK8SCRo8iRcfU0Sf2npFR87e_f37GMuQQEvUo_skJwb0Bn6sfqbW
	9v7EwaSKxCUJ0Rf2jDMl55PJJ9efHoBzMHu9_xUyxu60XQggnCEwYxekM1zxvVf0q2tt3f.FArh7
	52.4bhbxP1Grnw7zwAyXLEVtIOz883GHmUz984LqhnsxZe4Ap_s5orpPSalIaPfIo1A5vzLiLQzh
	xufcSqdarVplTrPCPsLSQO.Yn26NjoEGdRwOryOReGnOTm8xXSJdwFV8QyLXGgP2aNIv2pUILlhg
	k27sG0x2RCKMGT8McQIBkwizbfzC_0joMC1XoAfsHJpDDqnBI
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic312.consmr.mail.ne1.yahoo.com with HTTP;
	Mon, 12 Oct 2020 20:27:14 +0000
Received: by smtp415.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 98ea85600c76d59dda96b1fdc8715d06; 
	Mon, 12 Oct 2020 20:27:11 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v21 07/23] LSM: Use lsmblob in security_ipc_getsecid
Date: Mon, 12 Oct 2020 13:19:08 -0700
Message-Id: <20201012201924.71463-8-casey@schaufler-ca.com>
In-Reply-To: <20201012201924.71463-1-casey@schaufler-ca.com>
References: <20201012201924.71463-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Acked-by: Paul Moore <paul@paul-moore.com>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 include/linux/security.h |  7 ++++---
 kernel/auditsc.c         |  7 ++++++-
 security/security.c      | 12 +++++++++---
 3 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/include/linux/security.h b/include/linux/security.h
index ab7fc9849186..9dc11a8d9b60 100644
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
index 135e8d4d50af..b6ea2f6dab9a 100644
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

