Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D61761A02BD
	for <lists+linux-audit@lfdr.de>; Tue,  7 Apr 2020 02:07:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586218073;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=g2D554J+w0iGO8DtqPMC/zR01AUk9V47ewmEL2ZxgeY=;
	b=fldQ5nzwW1g/aQIl1ZU2CH/7QtruxXFNFK2LFibHIcvwxwFdjOzvpVA3x9+5ugpPCA7iXO
	mOO9snZRS7UF9xRFmdNABuRB45zn9OFiMeCFhaXZCIsXj/TSlz+KL6PYrABWo8DjUCQSU5
	2rnNGE1NTNZDyUJdaYkpI9TUcCVie/Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-cEgzSJIEO6qOi_IgBmt_Sg-1; Mon, 06 Apr 2020 20:07:51 -0400
X-MC-Unique: cEgzSJIEO6qOi_IgBmt_Sg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A628800D5C;
	Tue,  7 Apr 2020 00:07:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A4E45DA7B;
	Tue,  7 Apr 2020 00:07:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AFF2A18089CD;
	Tue,  7 Apr 2020 00:07:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03707enY024695 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 6 Apr 2020 20:07:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E0F9AD0197; Tue,  7 Apr 2020 00:07:39 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB697D0B36
	for <linux-audit@redhat.com>; Tue,  7 Apr 2020 00:07:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7EAAE1017E41
	for <linux-audit@redhat.com>; Tue,  7 Apr 2020 00:07:37 +0000 (UTC)
Received: from sonic311-31.consmr.mail.ne1.yahoo.com
	(sonic311-31.consmr.mail.ne1.yahoo.com [66.163.188.212]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-259-iSvBxTUQMUW-p4UwAhWP-g-1;
	Mon, 06 Apr 2020 20:07:35 -0400
X-MC-Unique: iSvBxTUQMUW-p4UwAhWP-g-1
X-YMail-OSG: gbvylA0VM1l5tLKbQw91x2BUc1Nj817h4gk.56mJJHxpdOj0RTecebHEVnqRXk3
	3uCG1LdO8NYyULE3uVhiwmB9QEPHEI5qjCFO.kxmk_Csj75mWDyj.bJc8_7jimkfkdwKhMU7DP.m
	6JsU3Ollrr48ca3iRocE0DwDNqGht6F9D7a2BEE5UrAVFoNgZoqbdDDMBY9nQLfm7_f8nR_iRMXG
	QbMDQAiKYpz_1BwQeijzR4s40LMdlN2hVIxr2JlZm6r5DYO7cK48sHQ6Tn1uQSXGCEm1wY5T8z69
	R00rWI_RYmuamATfAa9Z7KlKqVYmGk9oC_ndEJC3RV_jyvOOIFb24wsi7SLXpCLggCyF0nriIekA
	7ZbcikTPFlLOjdDaCoLWsXBzTc_3.A1zZDb8XFS3IyQQ5sJ_mbI5qfW4_0aM9Ri57Xu.9Z948MNy
	V0JiL7sjrwTcMdTD4MXQ7z3dDz_EwZS46o09gAIeozX_dNjHCSU8_xdbSLCn9yl30cGo4oATckjD
	nt2poZPCspWicp7yzakCDrjYyU0MoYgg4NpBBhjvOKR4aVgz6x2pEBDt0_tmpgOKrx5rsStLZtL.
	xsn_4M9JCVr.qvh.dfvk.c0TKyawB1j0V0DOi5571f8wOQLLvZvvZR2NYkrGE376UxKViwfIO0WA
	4_5fqJwCHgWNvsw0UHotHO.A4F19MqnjVKudtwFGFxZDJvlZjHD2joYtstLRtWvuArj96E5pzar2
	7KocvQRIW_QNjMnGCMIMW7lfFJSp1XG1dCf2HT9HIBfsu9e_coR6_0v0YJxslC07KHdP5m5ruDOv
	SmK5y8ZUMzDB7NpyNdlBQ4F5KMeLfGQ6qIcK.PSdgzilDGIYWEvT9BS4qLuKbZiPFAhYJHdmclI0
	Nv3qvuAaXOAHVtxIDI5mt9phGb9tOXAwrz2756YvKxmN0VXPrz5NXRKVGwYBbefM2edPMckgBets
	h6VSJe7MzrZTwoV_Wq9ofZTdUdnDQy1Gcn43vRGBvxffh_feFlNCSIoow8vyWdo6lFur7dBfusyR
	pnWJ.96BDNUzmOdr8sjhIB.KGvHkzUBirwbJv1mS2tojUsT_rW5c32e_wyKX4C4qpOwUtHqcKRRy
	L64zaXXuc6KW75Jre.5E4KnJPnYGBbiiBR6K8hLFNVFD27K_Z2RluvlUUUAIgOc0QbR7cj0rgcm0
	PnWeH2I0ibBbV02.fEScJv0a4ri8FVVBVMQhXPghJt0xlopq5xIRbAbvOvxsi9BG7qe43K_dt1xB
	wMo_62LtcLHCMbX3Dq9i47TtgrvHC0U5FaHKjftCsV66692Fz2x5NuFDaN2V8ov3ozCv4HVLkHRU
	2xdbKj7LIOmKvvpo00d5t2zE0Vr5rdDnIj8_FlB20wHmNilQjzbSlfoIQMCbq9ymPhtck0DZ0sm4
	bg40e1cf.U_BhkAnAqQv2Q0iMqm1YpsWxu8EJJlKGlb95oSM5Rsjl
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic311.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 7 Apr 2020 00:07:34 +0000
Received: by smtp421.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 8354b1c5a0c61b9cdb6752552e2b7707; 
	Tue, 07 Apr 2020 00:07:30 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v16 05/23] net: Prepare UDS for security module stacking
Date: Mon,  6 Apr 2020 17:01:41 -0700
Message-Id: <20200407000159.43602-6-casey@schaufler-ca.com>
In-Reply-To: <20200407000159.43602-1-casey@schaufler-ca.com>
References: <20200407000159.43602-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03707enY024695
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
index 1bfaf9ece13e..2ad58e2900e7 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -1358,7 +1358,8 @@ int security_socket_shutdown(struct socket *sock, int how);
 int security_sock_rcv_skb(struct sock *sk, struct sk_buff *skb);
 int security_socket_getpeersec_stream(struct socket *sock, char __user *optval,
 				      int __user *optlen, unsigned len);
-int security_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *skb, u32 *secid);
+int security_socket_getpeersec_dgram(struct socket *sock, struct sk_buff *skb,
+				     struct lsmblob *blob);
 int security_sk_alloc(struct sock *sk, int family, gfp_t priority);
 void security_sk_free(struct sock *sk);
 void security_sk_clone(const struct sock *sk, struct sock *newsk);
@@ -1496,7 +1497,9 @@ static inline int security_socket_getpeersec_stream(struct socket *sock, char __
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
index 17e10fba2152..83c3b3034030 100644
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
index 68debcb28fa4..179876573d6d 100644
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
index 914aecd89822..2fa826000889 100644
--- a/security/security.c
+++ b/security/security.c
@@ -2140,10 +2140,22 @@ int security_socket_getpeersec_stream(struct socket *sock, char __user *optval,
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

