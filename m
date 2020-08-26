Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA8F2532E1
	for <lists+linux-audit@lfdr.de>; Wed, 26 Aug 2020 17:07:31 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-haPh2Eg8MKaBLM740R7ZXA-1; Wed, 26 Aug 2020 11:07:27 -0400
X-MC-Unique: haPh2Eg8MKaBLM740R7ZXA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27D8E1DDFE;
	Wed, 26 Aug 2020 15:07:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6EA760C13;
	Wed, 26 Aug 2020 15:07:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 65C39662D9;
	Wed, 26 Aug 2020 15:07:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07QF7H6e007664 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 26 Aug 2020 11:07:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2B8A9205EB11; Wed, 26 Aug 2020 15:07:17 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EDB9B2068FE3
	for <linux-audit@redhat.com>; Wed, 26 Aug 2020 15:07:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC28D811E90
	for <linux-audit@redhat.com>; Wed, 26 Aug 2020 15:07:11 +0000 (UTC)
Received: from sonic312-29.consmr.mail.ne1.yahoo.com
	(sonic312-29.consmr.mail.ne1.yahoo.com [66.163.191.210]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-259-AssfWWx4MvOKkx5y3LQPGw-1;
	Wed, 26 Aug 2020 11:07:05 -0400
X-MC-Unique: AssfWWx4MvOKkx5y3LQPGw-1
X-YMail-OSG: EvxdTMQVM1lENv2nsqalH1UCmxnrZBVivbml8.OQFWPP5FBjZdbPghPDfsIAmvR
	68SamD0I4j0tTd9oPmp5Z3obS68NL7hD5_rpKZFSgTAwqmbDNVJGQd7sw4FKDOmBHnZTbXdlLCDQ
	vsabo.pr9z4fOw64j0y_6f0.3WStwv3M9qzwmkv88Q69_FrQ5uQTt1q1dPl0gb1TN6Quim4ZPdM9
	z1JU78cvqpcP7ObqQ0si7nOUUMn6iyNNh8bjGcOclaRbu9ZCzLdu04ojo_KcoYwM.P5nLCG8W6Jy
	Z4k9hA0bUSdKt.8ZFbqhFtX_xgj5GcfTnYHM9RZp4pdN6QRSLwD3StsQVRyXDHngLDYYE3paG.GC
	jd1ye1Fa_b5LKce2bFWs8kDGix8FYLYXTG71jPOwzgHBcIQgSTDVBFvyr..awaoc.7RIOcCMOtmQ
	9VuMLnLU.cA_n_ig2udyCcogO2rmnPKZJbX5EUud7oNCLqfWI93V6zml9PAaSb28hxuzd9cyfIrc
	_DW10yoPMJYLeMBgjXray4eUjSUHWfDto3WemyNvMWODrWBRtqLdGZN8C.FaLIrYRz95.1QVj7l8
	JFP1a23y.6GEZCThhWvnPwjqFAatpUpSLDy2e_JgDvjv5mE2JlRhIh9iU1yFTmJbEiM0svhthEyS
	6uAu3EftunMbc4Aq738iQiBxB_OCL0twchqkgJDdK6xSpdomGUF_j_mxHTK5i8ZhbCmU42OAQknR
	gy6emNRHpkBbqyzJX1SAxm.H1HZfmvuStCr8fakh2glk2qayhHEj9fpzRWsqSe0jPEMeXWkbmJ0T
	w8bTmiXo8GoBecx8a5pV1a9zqB383opcWm9CiSiWzPZShlPxCcxANIeZle6myUc0tol0aNcG6Y2H
	r0gerx6dDLVoIJ7u9lv__tjaHipw7Bm2X_Q9OuQ1L5IPj3VVvv4SerTyqsuNSdKpzEHnXGmsxtUa
	gvmKbDb5B91wJ9P_hFRWpw42a12nYsRkpPErA3Vk0ZskxJV2kKy.j7Tq8NsDwEsbRhnydyrBecKk
	3wovu6r5o6VOsjTLihWifn31v3zkZMCMrQa9sJQHYVL2CbtpQeXYZZOR66L95.VhucjP5wCWv5tA
	IW3ZT2XeUwQ3wxAd.jA5tIsOZvn6ARxT_CdrS.meIc6pdfav3bnkw2JtbF1clTmJW4p1BPdOUlsG
	QONsWsE9TAhScqaGSjoJ.VQvy6y9yZ6GP37hCOWjgLOWILGn6YxPRQVN6lZ62h8Sjkh1Nwe6.BAL
	3WSO65JqpTy1vh5kgMzrdDtjzzAYGDb0UVJVDPjhpu.5P6wPHTb1knHNbOYDKlGU3SU818FaftTJ
	mkxcyiBaT1LpZQtzbDXd9n6pbgOtk71lxYmCUA6qaTBwteK8IdsuxfIaYI1DBIF0JS9RlrmjRwVb
	Z_ZUuz7AOeYYs8oofkGjMpT.RUUI7B9dsxUXToR9OlqfAA.ouNflnYpaxOY0S4Y1UBFhdy1ULChi
	KJXchxGRJVUPHxPQuiwALyNH4PSfQYHwm7qRNKi3drVp8482Nrj8v_TYt4Lg93mn_HHFpQhnLWz4
	xhl8NJpSlwNb4cr1p81F7X1OI5JQTcNVK6BBqyWc-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic312.consmr.mail.ne1.yahoo.com with HTTP;
	Wed, 26 Aug 2020 15:07:04 +0000
Received: by smtp420.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID c9bd364ef6fb7019f43de6f5fe8ff325; 
	Wed, 26 Aug 2020 15:07:00 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v20 05/23] net: Prepare UDS for security module stacking
Date: Wed, 26 Aug 2020 07:52:29 -0700
Message-Id: <20200826145247.10029-6-casey@schaufler-ca.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
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
index e2ef982b3dd7..ae623b89cdf4 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -1398,7 +1398,8 @@ int security_socket_shutdown(struct socket *sock, int how);
 int security_sock_rcv_skb(struct sock *sk, struct sk_buff *skb);
 int security_socket_getpeersec_stream(struct socket *sock, char __user *optval,
 				      int __user *optlen, unsigned len);
-int security_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *skb, u32 *secid);
+int security_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *skb,
+				     struct lsmblob *blob);
 int security_sk_alloc(struct sock *sk, int family, gfp_t priority);
 void security_sk_free(struct sock *sk);
 void security_sk_clone(const struct sock *sk, struct sock *newsk);
@@ -1536,7 +1537,9 @@ static inline int security_socket_getpeersec_stream(struct socket *sock, char __
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
index d2c223554ff7..551dfbc717e9 100644
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
index 181ea6fb56a6..c15668b80d1d 100644
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

