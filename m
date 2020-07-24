Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 416EB22CF89
	for <lists+linux-audit@lfdr.de>; Fri, 24 Jul 2020 22:38:32 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-q19MED9BP66F9b1Lmqk7dQ-1; Fri, 24 Jul 2020 16:38:28 -0400
X-MC-Unique: q19MED9BP66F9b1Lmqk7dQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2BF31009457;
	Fri, 24 Jul 2020 20:38:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C67685C1BD;
	Fri, 24 Jul 2020 20:38:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 91DAF1809554;
	Fri, 24 Jul 2020 20:38:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06OKcKNS030977 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 24 Jul 2020 16:38:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BCDBA11DFB8B; Fri, 24 Jul 2020 20:38:20 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C09311E0146
	for <linux-audit@redhat.com>; Fri, 24 Jul 2020 20:38:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 889751832D20
	for <linux-audit@redhat.com>; Fri, 24 Jul 2020 20:38:18 +0000 (UTC)
Received: from sonic315-22.consmr.mail.bf2.yahoo.com
	(sonic315-22.consmr.mail.bf2.yahoo.com [74.6.134.196]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-432-0yTmk5mANluZDeOTLIMIrw-1;
	Fri, 24 Jul 2020 16:38:16 -0400
X-MC-Unique: 0yTmk5mANluZDeOTLIMIrw-1
X-YMail-OSG: IwlBEikVM1lK1fGvTL9rDC.FVZVMTJtUCA9rGGKygCz7i6jB.52KxJ9l25XYj0X
	94vAPP2ctkLQtGXHl6fNilnwiXez1cyjNH0pE3QgTmUHVSKgrg82RQmOWeAhhsw_ZPiutPdkaCpi
	JjYVVHFd4f6brrevUx3uAihtmT2Jt9C0RTZDg4Jz2TWxOJ6tg5jkoUojkXlEd0coP7.Amo3cJphg
	Eji2mdOgjd50t5op7wWLsFF0gVoJkdM70IsnkhdJEFNtlBSJeDjPwb7qj7s_uJ7AZ5TLdA0RBymS
	sbBdfi1ilrWfh7CyjOd4bLceF8XgtEmZZApg0fwbGhaH43xGfZxfMN_pEhOMf9qw094a_1kskGYP
	SuJvpiTO.2KaurM1i4_3M_6HFrrF365sPvppoRbYH.trLnkVahwvMPIc43T1k85h.fG4eQ8BLKJW
	yRCebi_Y9pjz5KzkndtjFxAKTWKoGjI8eoGIESN3AllAdhkAZCxRWOfvc_r.qBw7B4BP4ippVA0i
	cwFkxSXqQSOH9ACl2GHivznI0yOmWF2fpZbv1uAkw02C5L3BJBBCtIjMob.WvYxkmc0Dc7k3FGof
	PdtQSHR_V.iF7Is.xm2n7RPgBojEfLHJWS11QG_SpNZdPcTeeQyN2yjkqV92S6hL34fkmNM1EaQK
	o57x.AizsnzxOP15j199ghhdql5GU2L_nC4qN2tj2jvt2r8uXszZnMvOAPCLFsg3WJRU6YiOdhKV
	EQgY2OPM_phGkVbHBJTJdrYxooTyEwakfK8lSq6Q6ooDSIiCOKEZa6fPYpw2ngmQdPepS.TI9eQ8
	t52bJvCxy7S8qsF0q9v5jlBYs44q70uZGIzm_J93WdnGljjGb02iNpc0SbKZWHJkR4d5X4snXENO
	r1zVaVfX4NdHx6MK99j8u88TTKiPqVmgIC89slenS9ktq_35zKDdSUkYege3pAupOIrdSTH6ha3y
	UPWTjR5lyKhna.a_70wx4CQn7JNVrJ65I9hL2tn3eKXiYLhLEeuLHB_nNyTq9UCXLsQy3RFYKIid
	nSAVUis8fKG6ODFi73gWYO1KGUW8Aqage2o4Y4nUe_dYzulv_uZMongMH71YSc5vcHEL2j9tSykT
	PNg8O_.pj6LuIRaQ73TAv917hIm5UR6xCBkGUbK0EI3RsMpm4ogiNUchZ6Wq1C918UTi1Uk5DvjR
	eJP0uL2yWPHcK3AaaagFCxIrcF.mY3CNMJI4ytmpIyfxUccwiU0rY5cpOk5isXmZnMKbiiFKqMeS
	QY.wiK5Qjd2ks4YsnT8SkblsPsmGDcuWiMQD2VO27deh4py0Bkw_.l2EaB6U16vPGxgUb2_oHReX
	1lqIvLy6I9UN9u1RGo7FWS9y9YccWinruzIQuFyCEPrQ5ltsF0uiGBlEc1tmoVqciAgSIjN4ysPg
	h5h8DVQrbIQnA55DiPukrEGqj0RORF8eA9bDmDN7oRVNAwsBRZqlFFA--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic315.consmr.mail.bf2.yahoo.com with HTTP;
	Fri, 24 Jul 2020 20:38:15 +0000
Received: by smtp432.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 50b1192e9c340a755b331404425f5af7; 
	Fri, 24 Jul 2020 20:38:10 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v19 05/23] net: Prepare UDS for security module stacking
Date: Fri, 24 Jul 2020 13:32:08 -0700
Message-Id: <20200724203226.16374-6-casey@schaufler-ca.com>
In-Reply-To: <20200724203226.16374-1-casey@schaufler-ca.com>
References: <20200724203226.16374-1-casey@schaufler-ca.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
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

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 include/linux/security.h |  7 +++++--
 include/net/af_unix.h    |  2 +-
 include/net/scm.h        |  8 +++++---
 net/ipv4/ip_sockglue.c   |  8 +++++---
 net/unix/af_unix.c       |  6 +++---
 security/security.c      | 18 +++++++++++++++---
 6 files changed, 34 insertions(+), 15 deletions(-)

diff --git a/include/linux/security.h b/include/linux/security.h
index 6d403a522918..d81e8886d799 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -1397,7 +1397,8 @@ int security_socket_shutdown(struct socket *sock, int how);
 int security_sock_rcv_skb(struct sock *sk, struct sk_buff *skb);
 int security_socket_getpeersec_stream(struct socket *sock, char __user *optval,
 				      int __user *optlen, unsigned len);
-int security_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *skb, u32 *secid);
+int security_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *skb,
+				     struct lsmblob *blob);
 int security_sk_alloc(struct sock *sk, int family, gfp_t priority);
 void security_sk_free(struct sock *sk);
 void security_sk_clone(const struct sock *sk, struct sock *newsk);
@@ -1535,7 +1536,9 @@ static inline int security_socket_getpeersec_stream(struct socket *sock, char __
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
index f42fdddecd41..a86da0cb5ec1 100644
--- a/include/net/af_unix.h
+++ b/include/net/af_unix.h
@@ -36,7 +36,7 @@ struct unix_skb_parms {
 	kgid_t			gid;
 	struct scm_fp_list	*fp;		/* Passed files		*/
 #ifdef CONFIG_SECURITY_NETWORK
-	u32			secid;		/* Security ID		*/
+	struct lsmblob		lsmblob;	/* Security LSM data	*/
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
index 84ec3703c909..3ea1103b4c29 100644
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
index 3385a7a0b231..a676dc264464 100644
--- a/net/unix/af_unix.c
+++ b/net/unix/af_unix.c
@@ -138,17 +138,17 @@ static struct hlist_head *unix_sockets_unbound(void *addr)
 #ifdef CONFIG_SECURITY_NETWORK
 static void unix_get_secdata(struct scm_cookie *scm, struct sk_buff *skb)
 {
-	UNIXCB(skb).secid = scm->secid;
+	UNIXCB(skb).lsmblob = scm->lsmblob;
 }
 
 static inline void unix_set_secdata(struct scm_cookie *scm, struct sk_buff *skb)
 {
-	scm->secid = UNIXCB(skb).secid;
+	scm->lsmblob = UNIXCB(skb).lsmblob;
 }
 
 static inline bool unix_secdata_eq(struct scm_cookie *scm, struct sk_buff *skb)
 {
-	return (scm->secid == UNIXCB(skb).secid);
+	return lsmblob_equal(&scm->lsmblob, &(UNIXCB(skb).lsmblob));
 }
 #else
 static inline void unix_get_secdata(struct scm_cookie *scm, struct sk_buff *skb)
diff --git a/security/security.c b/security/security.c
index d6d882b1f7d5..c42873876954 100644
--- a/security/security.c
+++ b/security/security.c
@@ -2219,10 +2219,22 @@ int security_socket_getpeersec_stream(struct socket *sock, char __user *optval,
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

