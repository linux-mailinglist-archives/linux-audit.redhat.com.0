Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id D3B69102B52
	for <lists+linux-audit@lfdr.de>; Tue, 19 Nov 2019 19:03:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574186632;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3iqO4ImvkUMfzgVZ4B76SYUK8YptqlOGVSih/90oBmw=;
	b=LD0gSBuISmwTBfudODbZ11UpgWUyudtTljuQvvH+vOcFYCC6akO2hWCsVzfBPma33AaeQ9
	M34hKd/dO3ZMgjY0HC8DdcnFpXUbq8u7sPwCqobsRvWsO0iP8jOUZQq2q0aTros1NrUIjY
	n5XlORdLMdJikFZ0DD+rcy8p+K/IrjY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-DM8QBvD0PhCfMXTyruY0Ow-1; Tue, 19 Nov 2019 13:03:50 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92B051883522;
	Tue, 19 Nov 2019 18:03:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B31AA10016EB;
	Tue, 19 Nov 2019 18:03:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3D7EC4BB65;
	Tue, 19 Nov 2019 18:03:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAJI3Rao001032 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 19 Nov 2019 13:03:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D949110BBCD6; Tue, 19 Nov 2019 18:03:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D31D910BBCC2
	for <linux-audit@redhat.com>; Tue, 19 Nov 2019 18:03:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 553ED800151
	for <linux-audit@redhat.com>; Tue, 19 Nov 2019 18:03:24 +0000 (UTC)
X-YMail-OSG: jHSO2r4VM1kImrXFPpJMmziK9ouUnrGFdSkT6dOVJnj52xNjNvTVQ5HKKm3Ll1k
	FzFSg2P2g_sJFXPGzQWUXMj7qREGzJpz6WUVw_mEOm.W234e2SzR3jt4fnajBSEbL7rjJxHWHN4z
	ag3i0dFhXwndG5TAtn4EIMU.6e.0LAnOfMrj5p6wTL0XU9dgPDgKuTnxmZzC86OplYDe2xHeCZbK
	Xd0HIRXbZx6D9E.wVDZrcH8OVb5QU7KmaQKTfqdkQenYbotviQkBtmrz12yduIYIuOMr6rQKikA8
	TBe7bVWLChs.5YTcmZoZp4Q8OlJqHIAArBUyMambWjpQMg4EWSzuwHzQ4R6tVy1UeiyXNtgq2bKB
	DfYErW7eojl7JEEfPYhn3lxJMUwjeCoYDCpHmELmtLsq_dauNUDUgRpiMXs0NbIKqWAhACMgIcCh
	nRD1rvkvphPgyglnLpbXrpTygOaoeVO22aq8bh.9aT3sJCpmfsY6Osq6GQCiL1ns6o1WZ3PhFq41
	a6dn_P2IxQaHn39ui7ukh8qbiRiwHY.bpZ1yLMeT4MVyqEwnmtusBe5T4a5gBAT_9BRS5mmjm9vN
	ucuAWKffsRVO7RvwmRxdiQYyNmJB2j9hL3WzpfbCBh.fbTgcr4VShK4Jj1_RihGcbp7dErQrbKoZ
	82lb_4voiLscefQBjj7_z1tZ3sbw34x4dMrrCv8KRQIbkNAqp27EorKwTvg2xP0mW0FmK3LxzUe9
	T.WfBJ8M87HwyZeeC0PdVtbbF8oxpzWzvNlW7LOlumS7kV2gNdZX3GV7.KXK1.rASvfmzlG4ZKag
	Yn93.rdEjR.R6KzwEwA6TT8bT_gR7s34DOxhn9VJlzlZeOPKwYjXukytCBN4SdA3HRpmWZgzbp5o
	K8OsseTVv5oNo5AlA0nwIDoGThzNT0yEDJtX8lmNiutoyT6U1ymwca0WA9upnHtl58M89h.XXEB2
	7Ns26juDnLIjqOfLkbQSWuSLlBPD.35WAw_YSh7JqtOsdUexxUjyY7hRLqLfAni9TkgPHZn_nqZF
	HuCSwODV.OLu3a8NDFEqqjwqJBkXlE63RaqpPLe5ptGgOn3UnycuTqMNMVUF1iUU_yfcjtTCDUiT
	cxRq4vpEcqRDV3NHE5wzw2.H4zS6XFziFyAknfqwZGwQlsHC4y5k7EhIu.ZXHXMxULrtWQ1qBZYJ
	K2zhKTcUsX102w7o1LyrRFZjGSnH1KY1.6aEr_.RO9.bLDIApefNfKHrbMTJOhcnprw2egwP3g6j
	ubmOuDdBuizZKxQpYokaopf3HkEP8ZVX7pujhNncNfAeAt8Bi9HTUgXKkOQteEV5LyYjdkBr0mmb
	pCIyezW_XPIs9u7xjFPeTMU7qmLk_T0yD3G2.Mf09.56_EDeJy.AFOxwykw9e.VaQ8vfmytX5GZl
	5u0N4eAeKgJpgUx164y8e4CGrFgBY2hgyHFwaOoo-
Received: from sonic315-26.consmr.mail.ne1.yahoo.com
	(sonic315-26.consmr.mail.ne1.yahoo.com [66.163.190.152]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-55-u6h-jyWFMMu4UTGguArRHQ-1;
	Tue, 19 Nov 2019 13:03:21 -0500
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic315.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 19 Nov 2019 18:03:21 +0000
Received: by smtp411.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 5c625e7366fd4c784e1de9eefb8a42af; 
	Tue, 19 Nov 2019 18:03:18 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: linux-audit@redhat.com
Subject: [PATCH v11 03/25] LSM: Use lsmblob in security_audit_rule_match
Date: Tue, 19 Nov 2019 10:03:05 -0800
Message-Id: <20191119180315.12254-2-casey@schaufler-ca.com>
In-Reply-To: <20191119180315.12254-1-casey@schaufler-ca.com>
References: <20191119180315.12254-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-MC-Unique: u6h-jyWFMMu4UTGguArRHQ-1
X-MC-Unique: DM8QBvD0PhCfMXTyruY0Ow-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAJI3Rao001032
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Change the secid parameter of security_audit_rule_match
to a lsmblob structure pointer. Pass the entry from the
lsmblob structure for the approprite slot to the LSM hook.

Change the users of security_audit_rule_match to use the
lsmblob instead of a u32. In some cases this requires a
temporary conversion using lsmblob_init() that will go
away when other interfaces get converted.

Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: John Johansen <john.johansen@canonical.com>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 include/linux/security.h            |  7 ++++---
 kernel/auditfilter.c                |  7 +++++--
 kernel/auditsc.c                    | 14 ++++++++++----
 security/integrity/ima/ima.h        |  4 ++--
 security/integrity/ima/ima_policy.c |  7 +++++--
 security/security.c                 | 18 +++++++++++++++---
 6 files changed, 41 insertions(+), 16 deletions(-)

diff --git a/include/linux/security.h b/include/linux/security.h
index 5eced28fa0c9..2df58448f1f2 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -1835,7 +1835,8 @@ static inline int security_key_getsecurity(struct key=
 *key, char **_buffer)
 #ifdef CONFIG_SECURITY
 int security_audit_rule_init(u32 field, u32 op, char *rulestr, void **lsmr=
ule);
 int security_audit_rule_known(struct audit_krule *krule);
-int security_audit_rule_match(u32 secid, u32 field, u32 op, void *lsmrule)=
;
+int security_audit_rule_match(struct lsmblob *blob, u32 field, u32 op,
+=09=09=09      void *lsmrule);
 void security_audit_rule_free(void *lsmrule);
=20
 #else
@@ -1851,8 +1852,8 @@ static inline int security_audit_rule_known(struct au=
dit_krule *krule)
 =09return 0;
 }
=20
-static inline int security_audit_rule_match(u32 secid, u32 field, u32 op,
-=09=09=09=09=09    void *lsmrule)
+static inline int security_audit_rule_match(struct lsmblob *blob, u32 fiel=
d,
+=09=09=09=09=09    u32 op, void *lsmrule)
 {
 =09return 0;
 }
diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
index b0126e9c0743..356db1dd276c 100644
--- a/kernel/auditfilter.c
+++ b/kernel/auditfilter.c
@@ -1325,6 +1325,7 @@ int audit_filter(int msgtype, unsigned int listtype)
 =09=09=09struct audit_field *f =3D &e->rule.fields[i];
 =09=09=09pid_t pid;
 =09=09=09u32 sid;
+=09=09=09struct lsmblob blob;
=20
 =09=09=09switch (f->type) {
 =09=09=09case AUDIT_PID:
@@ -1355,8 +1356,10 @@ int audit_filter(int msgtype, unsigned int listtype)
 =09=09=09case AUDIT_SUBJ_CLR:
 =09=09=09=09if (f->lsm_rule) {
 =09=09=09=09=09security_task_getsecid(current, &sid);
-=09=09=09=09=09result =3D security_audit_rule_match(sid,
-=09=09=09=09=09=09   f->type, f->op, f->lsm_rule);
+=09=09=09=09=09lsmblob_init(&blob, sid);
+=09=09=09=09=09result =3D security_audit_rule_match(
+=09=09=09=09=09=09=09&blob, f->type,
+=09=09=09=09=09=09=09f->op, f->lsm_rule);
 =09=09=09=09}
 =09=09=09=09break;
 =09=09=09case AUDIT_EXE:
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 4effe01ebbe2..7566e5b1c419 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -445,6 +445,7 @@ static int audit_filter_rules(struct task_struct *tsk,
 =09const struct cred *cred;
 =09int i, need_sid =3D 1;
 =09u32 sid;
+=09struct lsmblob blob;
 =09unsigned int sessionid;
=20
 =09cred =3D rcu_dereference_check(tsk->cred, tsk =3D=3D current || task_cr=
eation);
@@ -643,7 +644,9 @@ static int audit_filter_rules(struct task_struct *tsk,
 =09=09=09=09=09security_task_getsecid(tsk, &sid);
 =09=09=09=09=09need_sid =3D 0;
 =09=09=09=09}
-=09=09=09=09result =3D security_audit_rule_match(sid, f->type,
+=09=09=09=09lsmblob_init(&blob, sid);
+=09=09=09=09result =3D security_audit_rule_match(&blob,
+=09=09=09=09=09=09=09=09   f->type,
 =09=09=09=09=09=09=09=09   f->op,
 =09=09=09=09=09=09=09=09   f->lsm_rule);
 =09=09=09}
@@ -658,15 +661,17 @@ static int audit_filter_rules(struct task_struct *tsk=
,
 =09=09=09if (f->lsm_rule) {
 =09=09=09=09/* Find files that match */
 =09=09=09=09if (name) {
+=09=09=09=09=09lsmblob_init(&blob, name->osid);
 =09=09=09=09=09result =3D security_audit_rule_match(
-=09=09=09=09=09=09=09=09name->osid,
+=09=09=09=09=09=09=09=09&blob,
 =09=09=09=09=09=09=09=09f->type,
 =09=09=09=09=09=09=09=09f->op,
 =09=09=09=09=09=09=09=09f->lsm_rule);
 =09=09=09=09} else if (ctx) {
 =09=09=09=09=09list_for_each_entry(n, &ctx->names_list, list) {
+=09=09=09=09=09=09lsmblob_init(&blob, n->osid);
 =09=09=09=09=09=09if (security_audit_rule_match(
-=09=09=09=09=09=09=09=09n->osid,
+=09=09=09=09=09=09=09=09&blob,
 =09=09=09=09=09=09=09=09f->type,
 =09=09=09=09=09=09=09=09f->op,
 =09=09=09=09=09=09=09=09f->lsm_rule)) {
@@ -678,7 +683,8 @@ static int audit_filter_rules(struct task_struct *tsk,
 =09=09=09=09/* Find ipc objects that match */
 =09=09=09=09if (!ctx || ctx->type !=3D AUDIT_IPC)
 =09=09=09=09=09break;
-=09=09=09=09if (security_audit_rule_match(ctx->ipc.osid,
+=09=09=09=09lsmblob_init(&blob, ctx->ipc.osid);
+=09=09=09=09if (security_audit_rule_match(&blob,
 =09=09=09=09=09=09=09      f->type, f->op,
 =09=09=09=09=09=09=09      f->lsm_rule))
 =09=09=09=09=09++result;
diff --git a/security/integrity/ima/ima.h b/security/integrity/ima/ima.h
index 3689081aaf38..5bcd6011ef8c 100644
--- a/security/integrity/ima/ima.h
+++ b/security/integrity/ima/ima.h
@@ -370,8 +370,8 @@ static inline int security_filter_rule_init(u32 field, =
u32 op, char *rulestr,
 =09return -EINVAL;
 }
=20
-static inline int security_filter_rule_match(u32 secid, u32 field, u32 op,
-=09=09=09=09=09     void *lsmrule)
+static inline int security_filter_rule_match(struct lsmblob *blob, u32 fie=
ld,
+=09=09=09=09=09     u32 op, void *lsmrule)
 {
 =09return -EINVAL;
 }
diff --git a/security/integrity/ima/ima_policy.c b/security/integrity/ima/i=
ma_policy.c
index 5380aca2b351..7711cc6a3fe3 100644
--- a/security/integrity/ima/ima_policy.c
+++ b/security/integrity/ima/ima_policy.c
@@ -414,6 +414,7 @@ static bool ima_match_rules(struct ima_rule_entry *rule=
, struct inode *inode,
 =09for (i =3D 0; i < MAX_LSM_RULES; i++) {
 =09=09int rc =3D 0;
 =09=09u32 osid;
+=09=09struct lsmblob blob;
=20
 =09=09if (!rule->lsm[i].rule)
 =09=09=09continue;
@@ -423,7 +424,8 @@ static bool ima_match_rules(struct ima_rule_entry *rule=
, struct inode *inode,
 =09=09case LSM_OBJ_ROLE:
 =09=09case LSM_OBJ_TYPE:
 =09=09=09security_inode_getsecid(inode, &osid);
-=09=09=09rc =3D security_filter_rule_match(osid,
+=09=09=09lsmblob_init(&blob, osid);
+=09=09=09rc =3D security_filter_rule_match(&blob,
 =09=09=09=09=09=09=09rule->lsm[i].type,
 =09=09=09=09=09=09=09Audit_equal,
 =09=09=09=09=09=09=09rule->lsm[i].rule);
@@ -431,7 +433,8 @@ static bool ima_match_rules(struct ima_rule_entry *rule=
, struct inode *inode,
 =09=09case LSM_SUBJ_USER:
 =09=09case LSM_SUBJ_ROLE:
 =09=09case LSM_SUBJ_TYPE:
-=09=09=09rc =3D security_filter_rule_match(secid,
+=09=09=09lsmblob_init(&blob, secid);
+=09=09=09rc =3D security_filter_rule_match(&blob,
 =09=09=09=09=09=09=09rule->lsm[i].type,
 =09=09=09=09=09=09=09Audit_equal,
 =09=09=09=09=09=09=09rule->lsm[i].rule);
diff --git a/security/security.c b/security/security.c
index 5f503cadf7f3..7c386cbe4cf3 100644
--- a/security/security.c
+++ b/security/security.c
@@ -439,7 +439,7 @@ static int lsm_append(const char *new, char **result)
 /*
  * Current index to use while initializing the lsmblob secid list.
  */
-static int lsm_slot __initdata;
+static int lsm_slot __lsm_ro_after_init;
=20
 /**
  * security_add_hooks - Add a modules hooks to the hook lists.
@@ -2412,9 +2412,21 @@ void security_audit_rule_free(void *lsmrule)
 =09call_void_hook(audit_rule_free, lsmrule);
 }
=20
-int security_audit_rule_match(u32 secid, u32 field, u32 op, void *lsmrule)
+int security_audit_rule_match(struct lsmblob *blob, u32 field, u32 op,
+=09=09=09      void *lsmrule)
 {
-=09return call_int_hook(audit_rule_match, 0, secid, field, op, lsmrule);
+=09struct security_hook_list *hp;
+=09int rc;
+
+=09hlist_for_each_entry(hp, &security_hook_heads.audit_rule_match, list) {
+=09=09if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >=3D lsm_slot))
+=09=09=09continue;
+=09=09rc =3D hp->hook.audit_rule_match(blob->secid[hp->lsmid->slot],
+=09=09=09=09=09       field, op, lsmrule);
+=09=09if (rc !=3D 0)
+=09=09=09return rc;
+=09}
+=09return 0;
 }
 #endif /* CONFIG_AUDIT */
=20
--=20
2.20.1


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

