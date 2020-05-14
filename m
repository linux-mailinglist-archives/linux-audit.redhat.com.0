Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 807821D40AA
	for <lists+linux-audit@lfdr.de>; Fri, 15 May 2020 00:17:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589494662;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4ZBaaoO9SxqrjrITzsRZDCrWTe2pfbBPi7DO67iRbkQ=;
	b=VO8Y04Bm19nbZPZ2jeX60848PggW4Bv5O4wYvT6gZ8NZxP2iCm8rw41WxTWyJ2CMt16j/0
	YKp+DmCoKvOhj+Mp7xSVtSTGHBcwf6Pa4xfo3FRig/vrtQxe6iJWnC6OchVoZkI7dS8rHU
	HcXrb5oZXdGXVSi4R+2WgRy6tTmLh1w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-wOLMm24eNZKnBnCUG7PVsA-1; Thu, 14 May 2020 18:17:40 -0400
X-MC-Unique: wOLMm24eNZKnBnCUG7PVsA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A47081005512;
	Thu, 14 May 2020 22:17:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B1736A977;
	Thu, 14 May 2020 22:17:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B78CD4E994;
	Thu, 14 May 2020 22:17:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04EMHVXL018112 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 14 May 2020 18:17:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EF337202B16C; Thu, 14 May 2020 22:17:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB5CE20110C7
	for <linux-audit@redhat.com>; Thu, 14 May 2020 22:17:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C838F1859160
	for <linux-audit@redhat.com>; Thu, 14 May 2020 22:17:27 +0000 (UTC)
Received: from sonic316-27.consmr.mail.ne1.yahoo.com
	(sonic316-27.consmr.mail.ne1.yahoo.com [66.163.187.153]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-454-DF0A9D_xPE2r5Mw186uG2A-1;
	Thu, 14 May 2020 18:17:25 -0400
X-MC-Unique: DF0A9D_xPE2r5Mw186uG2A-1
X-YMail-OSG: oXU6uCUVM1mQzMG6pu6YrJmBu0aUT5C.8mFZRxSGpx0pDfGoaO2VOgQkJ_BS5DT
	LW1aIbUqyBQguIz4TbxPtLzh5SkgSHrhdBrgW3tP9I.sBcCU4OcdtY8SYYoWmmmlnTe2G2cXAW_q
	YnKUpcncdwUfCLjbna7Jr1peehuEyxZwr7g0t8zeUQU_ytRBo7DkzvdtjOk75TiD8h6XDVHYK_Uj
	r7IvQTK2y.NK3_VNf2Dle.cTe9dDkgu_edw_fvWllEJcpQc3IO_4JnN8CeRh3VSEcmiy7KACbPzH
	Qa69MbtoMp9tcEubWZFTpKZ.qPYHC6tn2WuNKcQu28_4uMDlmucJ34J.troqR_Pp294lRNVa.I97
	JSUQph0oRbEe6BRRvM55wmhfJOs7HIU30nkTc49rpmhLjSqJVFcdlsesUqvvFjjVXwy3VEDO8yyY
	.wU2HE5E9TTUFz9sB6HxqLdhGItSd.ag3v0Zmdsxh5_4H4nWU5nQML0KaBDKIaRdGIH5hEecX_WH
	ANkpOlooQmF__jpk8mIbvpYTykepMXvBybz77L0srxTL.L_e5Frg4HrcFJuM4ChpLFP7D_2abSuG
	oICNOITQpWimq_ajK1xH6sRIv.ae7SqX4WGxkY0kcCeV9prwcJghE8aBSI3WY0a08z7gAK7na9zj
	pyjV4Gcqp5LkgpoH42VDkUJHJnt0FATJfQIpvegbqaJvpfn3CIZgZhkzGYLchlU7J7QmwyfYwX7z
	KxcbbYQvLZ2ByuGyROSOdk7nEYSJqfacixNeSUyv9ZDsqKS4_yQ4LtFwkm94QoLbJxeREXXU.46n
	KxHjJZoJbzBIyac8uCVCODkQ5CukZMw1R.PHQcArvlMxpBE6PMnVrnSUVL.fEZn0Fu6IKVbEFNsG
	2oIeB7lb8bSwbrkFHshVG8Fp.grrqd5orVJ7SRFChngaPm6FjBHTJhevk0d.kuUMYLBAAWO7BmbB
	0zVaZbKNQakKBG8Dq7OAoBligfqWS8ZBpaxzvl1EmlHI_mq2ayEBftBq6nIRsChyhp37gzS5wS.H
	Rcupwa3CphtO7AATbdM3OO.aKD2ddpHxAyFP_V8fi_9saDHsPI1uhZqbd6IOgEr6yfIW8ScnFquC
	ktgm33NSMWxQLur2_Ww91V2.fQ5kTH9mkzUx6XeugnC9SGpltsf6manXBSbaCnaX5py12oEDAo62
	yrwh9RzGLG2ptGkdwNRs.McRyrxHlZL60dgLm5Kccyt4vAIwTJCm9Sgg8oG12I8CsQqyJJ2yt05Z
	tO5hiTvMy7y6oeYsHZRLyThYhx8iIUkKwhPw4BarJNzJ98H38d7D3dq8tS5lj6bopL38GiEgxgbA
	Cu015JFlNRecziL.Xq2IvmUKBTCs43Hc7UIBaVFJ8fKCaPS4LLruAG5adV1F2fSTnlZu5BXaaM5s
	KLGFodbafXrayRqy6JGx4bvCBEVRo8AsgmhKB9mLnXl4-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic316.consmr.mail.ne1.yahoo.com with HTTP;
	Thu, 14 May 2020 22:17:24 +0000
Received: by smtp408.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 93c3c5cec162e79885943e41cf62d47a; 
	Thu, 14 May 2020 22:17:22 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v17 05/23] net: Prepare UDS for security module stacking
Date: Thu, 14 May 2020 15:11:24 -0700
Message-Id: <20200514221142.11857-6-casey@schaufler-ca.com>
In-Reply-To: <20200514221142.11857-1-casey@schaufler-ca.com>
References: <20200514221142.11857-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
Cc: john.johansen@canonical.com, netdev@vger.kernel.org, linux-audit@redhat.com,
	sds@tycho.nsa.gov
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

Change the data used in UDS SO_PEERSEC processing from a
secid to a more general struct lsmblob. Update the
security_socket_getpeersec_dgram() interface to use the
lsmblob. There is a small amount of scaffolding code
that will come out when the security_secid_to_secctx()
code is brought in line with the lsmblob.

The secid field of the unix_skb_parms structure has been
replaced with a pointer to an lsmblob structure, and the
lsmblob is allocated as needed. This is similar to how the
list of passed files is managed. While an lsmblob structure
will fit in the available space today, there is no guarantee
that the addition of other data to the unix_skb_parms or
support for additional security modules wouldn't exceed what
is available.

Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
cc: netdev@vger.kernel.org
---
 include/linux/security.h |  7 +++++--
 include/net/af_unix.h    |  2 +-
 include/net/scm.h        |  8 +++++---
 net/ipv4/ip_sockglue.c   |  8 +++++---
 net/unix/af_unix.c       |  7 ++++---
 net/unix/scm.c           |  6 ++++++
 security/security.c      | 18 +++++++++++++++---
 7 files changed, 41 insertions(+), 15 deletions(-)

diff --git a/include/linux/security.h b/include/linux/security.h
index 453737cefe09..2715b8dd115e 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -1357,7 +1357,8 @@ int security_socket_shutdown(struct socket *sock, int how);
 int security_sock_rcv_skb(struct sock *sk, struct sk_buff *skb);
 int security_socket_getpeersec_stream(struct socket *sock, char __user *optval,
 				      int __user *optlen, unsigned len);
-int security_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *skb, u32 *secid);
+int security_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *skb,
+				     struct lsmblob *blob);
 int security_sk_alloc(struct sock *sk, int family, gfp_t priority);
 void security_sk_free(struct sock *sk);
 void security_sk_clone(const struct sock *sk, struct sock *newsk);
@@ -1495,7 +1496,9 @@ static inline int security_socket_getpeersec_stream(struct socket *sock, char __
 	return -ENOPROTOOPT;
 }
 
-static inline int security_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *skb, u32 *secid)
+static inline int security_socket_getpeersec_dgram(struct socket *sock,
+						   struct sk_buff *skb,
+						   struct lsmblob *blob)
 {
 	return -ENOPROTOOPT;
 }
diff --git a/include/net/af_unix.h b/include/net/af_unix.h
index f42fdddecd41..e99c84677e14 100644
--- a/include/net/af_unix.h
+++ b/include/net/af_unix.h
@@ -36,7 +36,7 @@ struct unix_skb_parms {
 	kgid_t			gid;
 	struct scm_fp_list	*fp;		/* Passed files		*/
 #ifdef CONFIG_SECURITY_NETWORK
-	u32			secid;		/* Security ID		*/
+	struct lsmblob		*lsmdata;	/* Security LSM data	*/
 #endif
 	u32			consumed;
 } __randomize_layout;
diff --git a/include/net/scm.h b/include/net/scm.h
index 1ce365f4c256..e2e71c4bf9d0 100644
--- a/include/net/scm.h
+++ b/include/net/scm.h
@@ -33,7 +33,7 @@ struct scm_cookie {
 	struct scm_fp_list	*fp;		/* Passed files		*/
 	struct scm_creds	creds;		/* Skb credentials	*/
 #ifdef CONFIG_SECURITY_NETWORK
-	u32			secid;		/* Passed security ID 	*/
+	struct lsmblob		lsmblob;	/* Passed LSM data	*/
 #endif
 };
 
@@ -46,7 +46,7 @@ struct scm_fp_list *scm_fp_dup(struct scm_fp_list *fpl);
 #ifdef CONFIG_SECURITY_NETWORK
 static __inline__ void unix_get_peersec_dgram(struct socket *sock, struct scm_cookie *scm)
 {
-	security_socket_getpeersec_dgram(sock, NULL, &scm->secid);
+	security_socket_getpeersec_dgram(sock, NULL, &scm->lsmblob);
 }
 #else
 static __inline__ void unix_get_peersec_dgram(struct socket *sock, struct scm_cookie *scm)
@@ -97,7 +97,9 @@ static inline void scm_passec(struct socket *sock, struct msghdr *msg, struct sc
 	int err;
 
 	if (test_bit(SOCK_PASSSEC, &sock->flags)) {
-		err = security_secid_to_secctx(scm->secid, &secdata, &seclen);
+		/* Scaffolding - it has to be element 0 for now */
+		err = security_secid_to_secctx(scm->lsmblob.secid[0],
+					       &secdata, &seclen);
 
 		if (!err) {
 			put_cmsg(msg, SOL_SOCKET, SCM_SECURITY, seclen, secdata);
diff --git a/net/ipv4/ip_sockglue.c b/net/ipv4/ip_sockglue.c
index aa3fd61818c4..6cf57d5ac899 100644
--- a/net/ipv4/ip_sockglue.c
+++ b/net/ipv4/ip_sockglue.c
@@ -130,15 +130,17 @@ static void ip_cmsg_recv_checksum(struct msghdr *msg, struct sk_buff *skb,
 
 static void ip_cmsg_recv_security(struct msghdr *msg, struct sk_buff *skb)
 {
+	struct lsmblob lb;
 	char *secdata;
-	u32 seclen, secid;
+	u32 seclen;
 	int err;
 
-	err = security_socket_getpeersec_dgram(NULL, skb, &secid);
+	err = security_socket_getpeersec_dgram(NULL, skb, &lb);
 	if (err)
 		return;
 
-	err = security_secid_to_secctx(secid, &secdata, &seclen);
+	/* Scaffolding - it has to be element 0 */
+	err = security_secid_to_secctx(lb.secid[0], &secdata, &seclen);
 	if (err)
 		return;
 
diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
index 3385a7a0b231..a5c1a029095d 100644
--- a/net/unix/af_unix.c
+++ b/net/unix/af_unix.c
@@ -138,17 +138,18 @@ static struct hlist_head *unix_sockets_unbound(void *addr)
 #ifdef CONFIG_SECURITY_NETWORK
 static void unix_get_secdata(struct scm_cookie *scm, struct sk_buff *skb)
 {
-	UNIXCB(skb).secid = scm->secid;
+	UNIXCB(skb).lsmdata = kmemdup(&scm->lsmblob, sizeof(scm->lsmblob),
+				      GFP_KERNEL);
 }
 
 static inline void unix_set_secdata(struct scm_cookie *scm, struct sk_buff *skb)
 {
-	scm->secid = UNIXCB(skb).secid;
+	scm->lsmblob = *(UNIXCB(skb).lsmdata);
 }
 
 static inline bool unix_secdata_eq(struct scm_cookie *scm, struct sk_buff *skb)
 {
-	return (scm->secid == UNIXCB(skb).secid);
+	return lsmblob_equal(&scm->lsmblob, UNIXCB(skb).lsmdata);
 }
 #else
 static inline void unix_get_secdata(struct scm_cookie *scm, struct sk_buff *skb)
diff --git a/net/unix/scm.c b/net/unix/scm.c
index 8c40f2b32392..3094323935a4 100644
--- a/net/unix/scm.c
+++ b/net/unix/scm.c
@@ -142,6 +142,12 @@ void unix_destruct_scm(struct sk_buff *skb)
 	scm.pid  = UNIXCB(skb).pid;
 	if (UNIXCB(skb).fp)
 		unix_detach_fds(&scm, skb);
+#ifdef CONFIG_SECURITY_NETWORK
+	if (UNIXCB(skb).lsmdata) {
+		kfree(UNIXCB(skb).lsmdata);
+		UNIXCB(skb).lsmdata = NULL;
+	}
+#endif
 
 	/* Alas, it calls VFS */
 	/* So fscking what? fput() had been SMP-safe since the last Summer */
diff --git a/security/security.c b/security/security.c
index 0a13e98ec6fc..fb003806807b 100644
--- a/security/security.c
+++ b/security/security.c
@@ -2159,10 +2159,22 @@ int security_socket_getpeersec_stream(struct socket *sock, char __user *optval,
 				optval, optlen, len);
 }
 
-int security_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *skb, u32 *secid)
+int security_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *skb,
+				     struct lsmblob *blob)
 {
-	return call_int_hook(socket_getpeersec_dgram, -ENOPROTOOPT, sock,
-			     skb, secid);
+	struct security_hook_list *hp;
+	int rc = -ENOPROTOOPT;
+
+	hlist_for_each_entry(hp, &security_hook_heads.socket_getpeersec_dgram,
+			     list) {
+		if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
+			continue;
+		rc = hp->hook.socket_getpeersec_dgram(sock, skb,
+						&blob->secid[hp->lsmid->slot]);
+		if (rc != 0)
+			break;
+	}
+	return rc;
 }
 EXPORT_SYMBOL(security_socket_getpeersec_dgram);
 
-- 
2.24.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

