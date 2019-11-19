Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id EF0EE102B57
	for <lists+linux-audit@lfdr.de>; Tue, 19 Nov 2019 19:03:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574186637;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7y0WeoDBPytwDpO2V5v5AHHcmX7bcfUhrrshrRDxoMw=;
	b=VKnmyBWYkQSWeMXZfbBsMuJEOob6DM2aqo426p8VsF3rIgsegE4tCaoKxWZiEcAddAWGbr
	U6aVfczDJ/fdMWxHWtTOUOL++74F1zX2Nlka4txII2G2/9FVJlt8xmEa+Ro8RRFU3tQ54B
	mbO5r5AkPzouGakOQXB1Z2RS/Kj7kUk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-j5P1tmVENUSByB5mT-6YDw-1; Tue, 19 Nov 2019 13:03:53 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 090F41883527;
	Tue, 19 Nov 2019 18:03:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CFFB5503AE;
	Tue, 19 Nov 2019 18:03:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8CBFC18089CE;
	Tue, 19 Nov 2019 18:03:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAJI3dx6001053 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 19 Nov 2019 13:03:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EB2F310BBCD5; Tue, 19 Nov 2019 18:03:38 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E711E10BBCC2
	for <linux-audit@redhat.com>; Tue, 19 Nov 2019 18:03:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C254E80029C
	for <linux-audit@redhat.com>; Tue, 19 Nov 2019 18:03:38 +0000 (UTC)
X-YMail-OSG: eq5dDOsVM1kCg8usPrRW8f8WhUSmqKFckCVlA4KV2axT2IyEGbyRIs2Raq5VnPF
	kH60LmQraUVpKCNXYI8vgCn9C1wnK8CPZEkcLfcmACXvAtXefgd.hGU6_LeVqXxIfwLDWdHcILLl
	Qb5qCjo3KISrve3UvFUX.R4v4IoPvQSWJy07Y4UIUy.ABTBZPEPiE0sNuUxz9fJ0FeWFPkCHjSaE
	CeejGGIq7BNeChn_aOMdr_I706MbgN4EnK3BUsmbm4ZWY7A8UvH4I5gqLA5Nmpsa1V9l5McYB.0R
	mKS6FJN1XOfBa8.IkI1gbIOgwScW9geaRFwMyDAqtg6oHpEWhZRqshr4XC1nobCIOj2r0RMDK.81
	UNQAQXdNRWFbAi0slfJolN7vH343gSshy_OipkrAKW7CzQu4AFSxqFDOzOSJxd50_QN_cvY3KUJu
	.3E3u5Cpbdt6JkP0Iwrm1P5VAWQ_vMwGKb92HUZ2au5wFFwb5dDWY0Y7P_WzKLhxPfzS61FBrY8j
	lFntzbEtNMVCTYUY7hDJjr8YKweSRYNp_SLHlhx586qAwj18zkUkDtrjbjhUBvL4AMvKtk43F.Tt
	SlIIUZxbH7D8MH4a5xRqUwE3jomMPUJXmOoeAxsKeCnpTwT87O4GG8LcfPvlbjyzJyn6Yu5IXb25
	UnKn7hARXprnSI6_rrmBuVvmVJJFmClFPXyjmEDz3O_L3aJSiQ8EBhIckkxVyYo4lIPiaXbnigCA
	b0NKJ7t84XLZ8qHaT_wjLtWbg8GpjNUztbayBW6vBXGYk7EYYwDpNNdwvOoZSnXrHLyLFmF81pQ8
	7U70_yEGmhKG6ToHIw8hDspZcnzH4rnkffBPANA4o6FbQUPK3ir5.ZG_9g1o3JDBxImAU92..KU9
	cukIyoxNws7qPOOlN42cFSd50RO8zoM9UloxtDOZcafv3aIlJ7S5Yakh6sPTA9l3WHvbVQQQCnc.
	lnOgpZuQy2e1bgqBmf.XKIIiLq9ba5Lr1TFFrSqrimDcbQwH6Oq4R8eEokIFRhIErx0_BJTeaU2G
	M1ErIcDUVBl7jNNSlVDFcQXyZAKAoDUkZCP7rDLR3v2vawYBNMkV7I9lVRgZ4IykfRjpIf69LLvC
	7ZNubiZoblT5hzrQG1_BepLcFSAtpy3FaDVh8PHL31wWZFWmkC6nV8eS_wFVWZ8GltsMIobMg3IE
	YNnjaAVYA8SVGcCB0BPH7Nosj8DLtAWnY2f9W8qXvO5.3lPF0ZlH_ql1kgXL4TkunW1DBWK8oufc
	p7L4lRYN7MZ8YqMUrlpyGYd6F1pp35S6uWncxV60lZj4hF5J081hJTwIivePy0SUgB6wzbKNVvCQ
	Sr5UJaDzYzUqCUB1HA2P.vfuXLFU1bffSbWaCBcEue7CHI2xTDEZD_ytcMj2lJ24shNY9O9WgyFa
	OOzlxCsjF89j2FmVJerl.zzQGMMDmF3ClfFO8D1i8LP_b
Received: from sonic306-27.consmr.mail.ne1.yahoo.com
	(sonic306-27.consmr.mail.ne1.yahoo.com [66.163.189.89]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-203-d2UyFPumMoOiGzNYMh1kFQ-1;
	Tue, 19 Nov 2019 13:03:36 -0500
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic306.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 19 Nov 2019 18:03:35 +0000
Received: by smtp413.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 3fb5178ac301ad9f620e9736a13e6599; 
	Tue, 19 Nov 2019 18:03:33 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: linux-audit@redhat.com
Subject: [PATCH v11 08/25] LSM: Use lsmblob in security_ipc_getsecid
Date: Tue, 19 Nov 2019 10:03:07 -0800
Message-Id: <20191119180315.12254-4-casey@schaufler-ca.com>
In-Reply-To: <20191119180315.12254-1-casey@schaufler-ca.com>
References: <20191119180315.12254-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-MC-Unique: d2UyFPumMoOiGzNYMh1kFQ-1
X-MC-Unique: j5P1tmVENUSByB5mT-6YDw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAJI3dx6001053
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

There may be more than one LSM that provides IPC data
for auditing. Change security_ipc_getsecid() to fill in
a lsmblob structure instead of the u32 secid. The
audit data structure containing the secid will be updated
later, so there is a bit of scaffolding here.

Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: John Johansen <john.johansen@canonical.com>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 include/linux/security.h |  7 ++++---
 kernel/auditsc.c         |  5 ++++-
 security/security.c      | 12 +++++++++---
 3 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/include/linux/security.h b/include/linux/security.h
index a3e99bccb1bb..9519b4fb43ae 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -464,7 +464,7 @@ int security_task_prctl(int option, unsigned long arg2,=
 unsigned long arg3,
 =09=09=09unsigned long arg4, unsigned long arg5);
 void security_task_to_inode(struct task_struct *p, struct inode *inode);
 int security_ipc_permission(struct kern_ipc_perm *ipcp, short flag);
-void security_ipc_getsecid(struct kern_ipc_perm *ipcp, u32 *secid);
+void security_ipc_getsecid(struct kern_ipc_perm *ipcp, struct lsmblob *blo=
b);
 int security_msg_msg_alloc(struct msg_msg *msg);
 void security_msg_msg_free(struct msg_msg *msg);
 int security_msg_queue_alloc(struct kern_ipc_perm *msq);
@@ -1172,9 +1172,10 @@ static inline int security_ipc_permission(struct ker=
n_ipc_perm *ipcp,
 =09return 0;
 }
=20
-static inline void security_ipc_getsecid(struct kern_ipc_perm *ipcp, u32 *=
secid)
+static inline void security_ipc_getsecid(struct kern_ipc_perm *ipcp,
+=09=09=09=09=09 struct lsmblob *blob)
 {
-=09*secid =3D 0;
+=09lsmblob_init(blob, 0);
 }
=20
 static inline int security_msg_msg_alloc(struct msg_msg *msg)
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 04803c3099b2..ce8bf2d8f8d2 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -2285,11 +2285,14 @@ void __audit_mq_getsetattr(mqd_t mqdes, struct mq_a=
ttr *mqstat)
 void __audit_ipc_obj(struct kern_ipc_perm *ipcp)
 {
 =09struct audit_context *context =3D audit_context();
+=09struct lsmblob blob;
 =09context->ipc.uid =3D ipcp->uid;
 =09context->ipc.gid =3D ipcp->gid;
 =09context->ipc.mode =3D ipcp->mode;
 =09context->ipc.has_perm =3D 0;
-=09security_ipc_getsecid(ipcp, &context->ipc.osid);
+=09security_ipc_getsecid(ipcp, &blob);
+=09/* scaffolding on the [0] - change "osid" to a lsmblob */
+=09context->ipc.osid =3D blob.secid[0];
 =09context->type =3D AUDIT_IPC;
 }
=20
diff --git a/security/security.c b/security/security.c
index 0fc75a31a6bb..b60c6a51f622 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1783,10 +1783,16 @@ int security_ipc_permission(struct kern_ipc_perm *i=
pcp, short flag)
 =09return call_int_hook(ipc_permission, 0, ipcp, flag);
 }
=20
-void security_ipc_getsecid(struct kern_ipc_perm *ipcp, u32 *secid)
+void security_ipc_getsecid(struct kern_ipc_perm *ipcp, struct lsmblob *blo=
b)
 {
-=09*secid =3D 0;
-=09call_void_hook(ipc_getsecid, ipcp, secid);
+=09struct security_hook_list *hp;
+
+=09lsmblob_init(blob, 0);
+=09hlist_for_each_entry(hp, &security_hook_heads.ipc_getsecid, list) {
+=09=09if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >=3D lsm_slot))
+=09=09=09continue;
+=09=09hp->hook.ipc_getsecid(ipcp, &blob->secid[hp->lsmid->slot]);
+=09}
 }
=20
 int security_msg_msg_alloc(struct msg_msg *msg)
--=20
2.20.1


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

