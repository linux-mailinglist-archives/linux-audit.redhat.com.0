Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 042705ECDEE
	for <lists+linux-audit@lfdr.de>; Tue, 27 Sep 2022 22:09:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664309372;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=i2IcpD2WPjjKBh/BV7rsHs8UkWU13gT45Zzzjiif4gE=;
	b=AQtPlv339moDFwkOvtkZlUToVHMilxnLnmPoeOGSDgXTcfWVJYeZsr4nSxZJ2yfEdsNXEP
	0ACOfPMJXZDELIT2ma+/Pxo6ykhzqA4SRSkkN3PzOO3p9ey9lnuYIEI3uMjKg9oczjxUFv
	VLDAqAsIMzAikDnnuGgavjS4l0/LGNY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-pP3OVZ4xO2WbpU8hZ58upg-1; Tue, 27 Sep 2022 16:09:28 -0400
X-MC-Unique: pP3OVZ4xO2WbpU8hZ58upg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9D16803D4B;
	Tue, 27 Sep 2022 20:09:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ACA7240C6E15;
	Tue, 27 Sep 2022 20:09:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 555721946A48;
	Tue, 27 Sep 2022 20:09:25 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 392FA1946586 for <linux-audit@listman.corp.redhat.com>;
 Tue, 27 Sep 2022 20:09:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0DFD8112132D; Tue, 27 Sep 2022 20:09:24 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 05F7B112132C
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 20:09:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7DC43C0F225
 for <linux-audit@redhat.com>; Tue, 27 Sep 2022 20:09:23 +0000 (UTC)
Received: from sonic308-15.consmr.mail.ne1.yahoo.com
 (sonic308-15.consmr.mail.ne1.yahoo.com [66.163.187.38]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-348-BMH2UO9DMe-xvcsAQjRivw-1; Tue,
 27 Sep 2022 16:09:16 -0400
X-MC-Unique: BMH2UO9DMe-xvcsAQjRivw-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1664309355; bh=+FCJkUAUCkZPrQXmSfs+tP+AC6KgA63ZoKIqcpgsLiO=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=LTTCf38+DZcApJzyac8IB1hCvUxdKS/3kXja+iYftF2pONATftTA2MUEtILjYWaj1fWMptgYsWJ0CzABbelJfFPu9lLXp2StO+Vfaq7Ka18oGFc+RpR+Z9HF3J0JitVlsxifD0iko9ZtsVCocSKlM7K8aN+CujJe4kh25z9J2fN+DG7DtERLjQtsITXGnWmxeiwLyJ4K6xYrHlyfvXUQiXKCbPJpRYn4CGhdbsQfF+Nh4k+AAd2fQG+FaGGxabeudN5gTobNUDiK83WEuI7DeEVgL8OJmtsfYH56G6YvZD+/l7JOJheMj0wjex5yEASBNZcKskOqhjPWn7G45Ars3w==
X-YMail-OSG: EY8ithsVM1k1JgCy8FGfVNofA_JECG9_hcIm0VLs1W9IxTO4KjOLLRzoIjMpjgd
 .K57Y5UnakJoPF_hrhVBWS1V40989PVOpe5YWARk2.9YVcCIXpzBy2ZB67su9xGhxuPfBlT1IWAl
 q_T6hHsSzRY8sZ1S5MEID2E0bo.sia0R.Kpgr.mJQy7RW8Dc1J1hnpJs7IcvuaEgvKejneXJGdva
 P3E5AoYj3e7hFrS4nnGb791v53lgzwNgnPS0ywkFie327SiRqCC8ggXfhqxs4tIdJSYuIojLB9W.
 k3FuJCxM0Wi9tpxZhtTy97f0z2UUEgdtBQoSykwK9lWt6CRA2nAvrlW5ZshU7AwfDKse39m8qijy
 sFmfNSAq229oSSdvjlx8poFa8KGmMQmCv.N.MJqFLO1rrWUUzBohsKB_vKuV5ceYgskULykrxVNk
 KaSQpk1kFVwVKpmG68l6K8upweyf770sn3etg6H5fjAFfBIoCXO_e3QnawlJXSfobkIPqRCxuiZv
 7ZsONNaiut6Li1mkY_296rAflEnip10.CyDngfP5fpTB4SbTfHP40P5H4KBgt7rfosnQvl9tXtjH
 aB_P77wjo7vC_3QI0c6INxqYqr18k68o1Wg.xUPeU8REmUfqjBQbpt.s.BxPC5pDWhcG56F._1Ah
 OuvHvJRxtNgd8LqmW3jK_cZipD8IoHaVS5Pi58unLGiYM8H87TP0B0UQbLi65wkVwPJ5GiOdVZZc
 0ZQFg3XnSWXAa7sJzr968amzU.iFSuWzTd2lEHAcDcv5VjOj84l5XboJwXCmbqz_xkgTVMUFDmJU
 .FlO9zXaWr6hrccO2tnUv.4DnfNwwhMS6VH4k2qacZ.J6UkwiByc9zMlo2wG3zNZpXgwJ.N1bWoC
 IoWRMWvltqC9tLwNdjOVgmrfnjJi6SPX4nwXqbPz.fmJUtmB8LSqhj.QTc8af3eL6oU7B.5gJY53
 KvhNaWFvTTAVdvxAiEeyFIy1YHjCgQpZbb2tqRux7S8LCv0cXFaA_mvFmA0p5GHmTZbujI77FPOn
 igaYZVJsGTagx1xtonAFO.Q6GxD9QfE9iXFZjbGronsF_YRBaXVW.ejFF5nFQ14JAQrvaxjb__OS
 mMQhrDxMYfQYjwpxukV2biP3cOvD3oXrHKJls__5BCS.EW4aAOGkhpjvPKSSLfJpzP3ONhrR7DCh
 wAkQZ4TOBrzpCWWDxlqfIsTKkPfQYq4Eae6Vx.dLhbrmdNfdUuvxiQLoa6HR0Tavyj5abwnt_0dn
 3dYXuavYyJEHVctQA24JsUvmC6xRIbMw_kkZjHQlmCSbd__7lvIw2E7.VlYID79qES3l2y5dPQ8X
 cFm48Ryd5q__kWS8QDUprnt7NU2CP._806wLPdo1NojMSwDbCudLgIon8BlvZUZm88RJ5aUaBdou
 1wWKej4FMWwKZ3jNeqcpBo.GXYNFQ89xsG3FXvDsIpa3.zkQAlnwa2PI7xwArS85xeTKVhqayLDu
 2HeH7YHLj848kj04VjzRefY2Ymnt2hWlMc8ZlatAwn1mXFvrwq3EtpS76RtgklrNOw1fX2SKJuwL
 46F9k_qbN_1xYuesnhpKTgBOPht_2WSeD0PjnZY1x69XZgDXOpyUh5ZWO6Ic77q1uyDa2Lv5g1N1
 PFvPtYxZWHzN8lbVVFLfUeLXSsDnvtTxRwDx216TSP64icZNw6PiP1vVP6nxF5wAVVd.vSkfgNz3
 JZJnRotGMFCrTIcrq_uhvUTYk.TVsHmbr0hKl9bNHISLWx6VEXGP2jpvtcj5j2XjWAMeT8uMd.e6
 CxuJEc0OlTRwIfn117Phc2juRbd8UnOuxWtdHxJdCtNZ7PI08meO_00eS.syFOjzs1QQoq1qdfk_
 TXKNPtmUy6SKUuqXRgaqWwamZe5ERytvhOSfGCQxqEGqeHfNXEyO6c_SJqu2WLrS2cqagY6hdW47
 mPU5jgL1dii_l6RDc_yJzJseSa_ufbUB4sAdswVnjBblH3C847yJwVY8EdcNoPgR9q8KT1ObfIE_
 XfrIienpjYcQsqx8Ui.tUMBl6kes5nMiIPU5dFjWMqqR1OmLf.kZ4o4Oa6N0SompL8rDl4HxOGC3
 x57TuZJeNOhQV4dMaUQLsVwEdrN4bD.UV0us_cVC66gIPpKVAJQWmbSlt2rDTnKvg30ecv79orlx
 lIZrMNada82DRbrw_nVykanI2Iw7RKKRjDSbnz7Tci85LEvANezpTbQhtR9h0jNgiReq8mzmonfx
 sk0G9S5VvxbMtHxDAyewkNTfmE6IYo8K0eZD2.6Whktee3mdwNZFOh6dfRxq_2Q--
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.ne1.yahoo.com with HTTP; Tue, 27 Sep 2022 20:09:15 +0000
Received: by hermes--production-ne1-6dd4f99767-x2f2n (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 962ba498c220faeab9c55c1f2e7ba390; 
 Tue, 27 Sep 2022 20:09:11 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, paul@paul-moore.com,
 linux-security-module@vger.kernel.org
Subject: [PATCH v38 28/39] LSM: security_secid_to_secctx module selection
Date: Tue, 27 Sep 2022 12:54:10 -0700
Message-Id: <20220927195421.14713-29-casey@schaufler-ca.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a parameter to security_secid_to_secctx() to identify
which of the security modules that may be active should
provide the security context. If the parameter is greater
than or equal to zero, the security module associated with
that LSM "slot" is used. If the value is LSMBLOB_DISPLAY
the "interface lsm" is used. If the value is LSMBLOB_FIRST
the first security module providing a hook is used.

The integrity IMA subsystem has chosen to always use the
LSMBLOB_FIRST behavior, regardless of the lsm_display values.

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 drivers/android/binder.c                |  2 +-
 include/linux/security.h                |  7 +++++--
 include/net/scm.h                       |  2 +-
 kernel/audit.c                          |  4 ++--
 kernel/auditsc.c                        |  7 ++++---
 net/ipv4/ip_sockglue.c                  |  2 +-
 net/netfilter/nf_conntrack_netlink.c    |  4 ++--
 net/netfilter/nf_conntrack_standalone.c |  2 +-
 net/netfilter/nfnetlink_queue.c         |  2 +-
 net/netlabel/netlabel_unlabeled.c       | 11 +++++++----
 net/netlabel/netlabel_user.c            |  2 +-
 security/security.c                     | 20 ++++++++++++++++++--
 12 files changed, 44 insertions(+), 21 deletions(-)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index ff8f35b9bd1b..2206f7275349 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -3172,7 +3172,7 @@ static void binder_transaction(struct binder_proc *proc,
 		size_t added_size;
 
 		security_cred_getsecid(proc->cred, &blob);
-		ret = security_secid_to_secctx(&blob, &lsmctx);
+		ret = security_secid_to_secctx(&blob, &lsmctx, LSMBLOB_DISPLAY);
 		if (ret) {
 			binder_txn_error("%d:%d failed to get security context\n",
 				thread->pid, proc->pid);
diff --git a/include/linux/security.h b/include/linux/security.h
index 4f2c1bb857be..170b303e9122 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -203,6 +203,8 @@ struct lsmblob {
 #define LSMBLOB_INVALID		-1	/* Not a valid LSM slot number */
 #define LSMBLOB_NEEDED		-2	/* Slot requested on initialization */
 #define LSMBLOB_NOT_NEEDED	-3	/* Slot not requested */
+#define LSMBLOB_DISPLAY		-4	/* Use the "interface_lsm" slot */
+#define LSMBLOB_FIRST		-5	/* Use the first slot */
 
 /**
  * lsmblob_init - initialize a lsmblob structure
@@ -646,7 +648,8 @@ int security_getprocattr(struct task_struct *p, int lsmid, char *name,
 int security_setprocattr(int lsmid, const char *name, void *value, size_t size);
 int security_netlink_send(struct sock *sk, struct sk_buff *skb);
 int security_ismaclabel(const char *name);
-int security_secid_to_secctx(struct lsmblob *blob, struct lsmcontext *cp);
+int security_secid_to_secctx(struct lsmblob *blob, struct lsmcontext *cp,
+			     int ilsm);
 int security_secctx_to_secid(const char *secdata, u32 seclen,
 			     struct lsmblob *blob);
 void security_release_secctx(struct lsmcontext *cp);
@@ -1507,7 +1510,7 @@ static inline int security_ismaclabel(const char *name)
 }
 
 static inline int security_secid_to_secctx(struct lsmblob *blob,
-					   struct lsmcontext *cp)
+					   struct lsmcontext *cp, int ilsm)
 {
 	return -EOPNOTSUPP;
 }
diff --git a/include/net/scm.h b/include/net/scm.h
index b77a52f93389..f4d567d4885e 100644
--- a/include/net/scm.h
+++ b/include/net/scm.h
@@ -101,7 +101,7 @@ static inline void scm_passec(struct socket *sock, struct msghdr *msg, struct sc
 		 * and the infrastructure will know which it is.
 		 */
 		lsmblob_init(&lb, scm->secid);
-		err = security_secid_to_secctx(&lb, &context);
+		err = security_secid_to_secctx(&lb, &context, LSMBLOB_DISPLAY);
 
 		if (!err) {
 			put_cmsg(msg, SOL_SOCKET, SCM_SECURITY, context.len,
diff --git a/kernel/audit.c b/kernel/audit.c
index 154fe4c40bb8..98c5ace6f453 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -1464,7 +1464,7 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
 
 		if (lsmblob_is_set(&audit_sig_lsm)) {
 			err = security_secid_to_secctx(&audit_sig_lsm,
-						       &context);
+						       &context, LSMBLOB_FIRST);
 			if (err)
 				return err;
 		}
@@ -2176,7 +2176,7 @@ int audit_log_task_context(struct audit_buffer *ab)
 	if (!lsmblob_is_set(&blob))
 		return 0;
 
-	error = security_secid_to_secctx(&blob, &context);
+	error = security_secid_to_secctx(&blob, &context, LSMBLOB_FIRST);
 
 	if (error) {
 		if (error != -EINVAL)
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index c3d4617d31c7..ca00187b4864 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -1107,7 +1107,7 @@ static int audit_log_pid_context(struct audit_context *context, pid_t pid,
 			 from_kuid(&init_user_ns, auid),
 			 from_kuid(&init_user_ns, uid), sessionid);
 	if (lsmblob_is_set(blob)) {
-		if (security_secid_to_secctx(blob, &lsmctx)) {
+		if (security_secid_to_secctx(blob, &lsmctx, LSMBLOB_FIRST)) {
 			audit_log_format(ab, " obj=(none)");
 			rc = 1;
 		} else {
@@ -1400,7 +1400,8 @@ static void show_special(struct audit_context *context, int *call_panic)
 			struct lsmblob blob;
 
 			lsmblob_init(&blob, osid);
-			if (security_secid_to_secctx(&blob, &lsmcxt)) {
+			if (security_secid_to_secctx(&blob, &lsmcxt,
+						     LSMBLOB_FIRST)) {
 				audit_log_format(ab, " osid=%u", osid);
 				*call_panic = 1;
 			} else {
@@ -1568,7 +1569,7 @@ static void audit_log_name(struct audit_context *context, struct audit_names *n,
 		struct lsmcontext lsmctx;
 
 		lsmblob_init(&blob, n->osid);
-		if (security_secid_to_secctx(&blob, &lsmctx)) {
+		if (security_secid_to_secctx(&blob, &lsmctx, LSMBLOB_FIRST)) {
 			audit_log_format(ab, " osid=%u", n->osid);
 			if (call_panic)
 				*call_panic = 2;
diff --git a/net/ipv4/ip_sockglue.c b/net/ipv4/ip_sockglue.c
index ec3ef548264d..4aaac7b9b452 100644
--- a/net/ipv4/ip_sockglue.c
+++ b/net/ipv4/ip_sockglue.c
@@ -140,7 +140,7 @@ static void ip_cmsg_recv_security(struct msghdr *msg, struct sk_buff *skb)
 		return;
 
 	lsmblob_init(&lb, secid);
-	err = security_secid_to_secctx(&lb, &context);
+	err = security_secid_to_secctx(&lb, &context, LSMBLOB_DISPLAY);
 	if (err)
 		return;
 
diff --git a/net/netfilter/nf_conntrack_netlink.c b/net/netfilter/nf_conntrack_netlink.c
index 93855cd7ce4b..dce0994272ed 100644
--- a/net/netfilter/nf_conntrack_netlink.c
+++ b/net/netfilter/nf_conntrack_netlink.c
@@ -353,7 +353,7 @@ static int ctnetlink_dump_secctx(struct sk_buff *skb, const struct nf_conn *ct)
 	 * security_secid_to_secctx() will know which security module
 	 * to use to create the secctx.  */
 	lsmblob_init(&blob, ct->secmark);
-	ret = security_secid_to_secctx(&blob, &context);
+	ret = security_secid_to_secctx(&blob, &context, LSMBLOB_DISPLAY);
 	if (ret)
 		return 0;
 
@@ -663,7 +663,7 @@ static inline int ctnetlink_secctx_size(const struct nf_conn *ct)
 	int len;
 	struct lsmblob blob;
 
-	len = security_secid_to_secctx(&blob, NULL);
+	len = security_secid_to_secctx(&blob, NULL, LSMBLOB_DISPLAY);
 	if (len <= 0)
 		return 0;
 
diff --git a/net/netfilter/nf_conntrack_standalone.c b/net/netfilter/nf_conntrack_standalone.c
index b5b301f5b3f7..fbeeeb7080bf 100644
--- a/net/netfilter/nf_conntrack_standalone.c
+++ b/net/netfilter/nf_conntrack_standalone.c
@@ -180,7 +180,7 @@ static void ct_show_secctx(struct seq_file *s, const struct nf_conn *ct)
 	struct lsmcontext context;
 
 	lsmblob_init(&blob, ct->secmark);
-	ret = security_secid_to_secctx(&blob, &context);
+	ret = security_secid_to_secctx(&blob, &context, LSMBLOB_DISPLAY);
 	if (ret)
 		return;
 
diff --git a/net/netfilter/nfnetlink_queue.c b/net/netfilter/nfnetlink_queue.c
index 3a7d1a693c5e..bef123b1250c 100644
--- a/net/netfilter/nfnetlink_queue.c
+++ b/net/netfilter/nfnetlink_queue.c
@@ -316,7 +316,7 @@ static void nfqnl_get_sk_secctx(struct sk_buff *skb, struct lsmcontext *context)
 		 * blob. security_secid_to_secctx() will know which security
 		 * module to use to create the secctx.  */
 		lsmblob_init(&blob, skb->secmark);
-		security_secid_to_secctx(&blob, context);
+		security_secid_to_secctx(&blob, context, LSMBLOB_DISPLAY);
 	}
 
 	read_unlock_bh(&skb->sk->sk_callback_lock);
diff --git a/net/netlabel/netlabel_unlabeled.c b/net/netlabel/netlabel_unlabeled.c
index ae2f49f3398d..050753d2f2bb 100644
--- a/net/netlabel/netlabel_unlabeled.c
+++ b/net/netlabel/netlabel_unlabeled.c
@@ -437,7 +437,8 @@ int netlbl_unlhsh_add(struct net *net,
 unlhsh_add_return:
 	rcu_read_unlock();
 	if (audit_buf != NULL) {
-		if (security_secid_to_secctx(lsmblob, &context) == 0) {
+		if (security_secid_to_secctx(lsmblob, &context,
+					     LSMBLOB_FIRST) == 0) {
 			audit_log_format(audit_buf, " sec_obj=%s",
 					 context.context);
 			security_release_secctx(&context);
@@ -491,7 +492,8 @@ static int netlbl_unlhsh_remove_addr4(struct net *net,
 					  addr->s_addr, mask->s_addr);
 		dev_put(dev);
 		if (entry != NULL &&
-		    security_secid_to_secctx(&entry->lsmblob, &context) == 0) {
+		    security_secid_to_secctx(&entry->lsmblob, &context,
+					     LSMBLOB_FIRST) == 0) {
 			audit_log_format(audit_buf, " sec_obj=%s",
 					 context.context);
 			security_release_secctx(&context);
@@ -550,7 +552,8 @@ static int netlbl_unlhsh_remove_addr6(struct net *net,
 					  addr, mask);
 		dev_put(dev);
 		if (entry != NULL &&
-		    security_secid_to_secctx(&entry->lsmblob, &context) == 0) {
+		    security_secid_to_secctx(&entry->lsmblob, &context,
+					     LSMBLOB_FIRST) == 0) {
 			audit_log_format(audit_buf, " sec_obj=%s",
 					 context.context);
 			security_release_secctx(&context);
@@ -1120,7 +1123,7 @@ static int netlbl_unlabel_staticlist_gen(u32 cmd,
 		lsmb = (struct lsmblob *)&addr6->lsmblob;
 	}
 
-	ret_val = security_secid_to_secctx(lsmb, &context);
+	ret_val = security_secid_to_secctx(lsmb, &context, LSMBLOB_FIRST);
 	if (ret_val != 0)
 		goto list_cb_failure;
 	ret_val = nla_put(cb_arg->skb,
diff --git a/net/netlabel/netlabel_user.c b/net/netlabel/netlabel_user.c
index 951ba0639d20..1941877fd16f 100644
--- a/net/netlabel/netlabel_user.c
+++ b/net/netlabel/netlabel_user.c
@@ -100,7 +100,7 @@ struct audit_buffer *netlbl_audit_start_common(int type,
 
 	lsmblob_init(&blob, audit_info->secid);
 	if (audit_info->secid != 0 &&
-	    security_secid_to_secctx(&blob, &context) == 0) {
+	    security_secid_to_secctx(&blob, &context, LSMBLOB_FIRST) == 0) {
 		audit_log_format(audit_buf, " subj=%s", context.context);
 		security_release_secctx(&context);
 	}
diff --git a/security/security.c b/security/security.c
index d31989e4bc25..0456bb6503d5 100644
--- a/security/security.c
+++ b/security/security.c
@@ -2334,20 +2334,36 @@ EXPORT_SYMBOL(security_ismaclabel);
  * security_secid_to_secctx - convert secid to secctx
  * @blob: set of secids
  * @cp: lsm context into which result is put
+ * @ilsm: which security module to report
  *
  * Translate secid information into a secctx string.
  * Return a negative value on error.
  * If cp is NULL return the length of the string.
  * Otherwise, return 0.
  */
-int security_secid_to_secctx(struct lsmblob *blob, struct lsmcontext *cp)
+int security_secid_to_secctx(struct lsmblob *blob, struct lsmcontext *cp,
+			     int ilsm)
 {
 	struct security_hook_list *hp;
-	int ilsm = lsm_task_ilsm(current);
 
 	if (cp)
 		memset(cp, 0, sizeof(*cp));
 
+	/*
+	 * ilsm either is the slot number use for formatting
+	 * or an instruction on which relative slot to use.
+	 */
+	if (ilsm == LSMBLOB_DISPLAY)
+		ilsm = lsm_task_ilsm(current);
+	else if (ilsm == LSMBLOB_FIRST)
+		ilsm = LSMBLOB_INVALID;
+	else if (ilsm < 0) {
+		WARN_ONCE(true, "LSM: %s unknown interface LSM\n", __func__);
+		ilsm = LSMBLOB_INVALID;
+	} else if (ilsm >= lsm_slot) {
+		WARN_ONCE(true, "LSM: %s invalid interface LSM\n", __func__);
+		ilsm = LSMBLOB_INVALID;
+	}
 	hlist_for_each_entry(hp, &security_hook_heads.secid_to_secctx, list) {
 		if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
 			continue;
-- 
2.37.3

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

