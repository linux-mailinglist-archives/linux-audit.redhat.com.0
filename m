Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E690B102B55
	for <lists+linux-audit@lfdr.de>; Tue, 19 Nov 2019 19:03:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574186634;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uPGI6bRQmJq4JCcs1Brsbg6u//SAX2GpNAMMN2Cl8r8=;
	b=GW3qlbQDQNarbzUYFSkk7JGFJJ9IOHB9J7QPGYlrKZWCfEJsXmRykkHThHXrqkpgKTJkdG
	nNaQHj51HVc+3tfnZOsoR732WkH8ksNZfMtceoicLvDUYdSS05Y7QYQznJ/vGHXn9wBvMe
	3JlRPNS2I1kKzfYbFwOz7q3CSvYig4M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-KfUF0TzkP0-YafeJ0k2UgQ-1; Tue, 19 Nov 2019 13:03:53 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29A2ADB35;
	Tue, 19 Nov 2019 18:03:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA52010016EB;
	Tue, 19 Nov 2019 18:03:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6B5554BB65;
	Tue, 19 Nov 2019 18:03:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAJI3dnf001059 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 19 Nov 2019 13:03:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DD4BF178BB; Tue, 19 Nov 2019 18:03:39 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D86DC178B1
	for <linux-audit@redhat.com>; Tue, 19 Nov 2019 18:03:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ADB04800211
	for <linux-audit@redhat.com>; Tue, 19 Nov 2019 18:03:39 +0000 (UTC)
X-YMail-OSG: xTxEOZYVM1lM3H9UqfdsbZlPylWUMl51JHTWO7Z1k67KBQMyArua82XtUiKk2ns
	Td3UXxuz8WJAD0O8m8lvSR4fEA3JcEuklasiWZNTeUdcSJtXadWJqWCaseoLv9dC7k4znnVdbF0G
	nwd.lmCLPWszAzQ2loDtPu_xS01qeyyRYKBBZUYe_tGMdVxc60PDIccu6p5FMuR9rx_q4TFJ11Z0
	0BM9sAMuAkSWc7kuL..eSWYhfu4p96v6ezi6UlZSu9bPklPQcj5455DHk5EPl9NWdmXZ9UOql7BU
	1BOYoPPinCR78vxUo5JxImszFmlNXX5IuYLXAe.M3SF55N.rek7tDkVicSsagdbkyT8GoEwB9oj1
	8t1jzjSSWYtDNdRZbAFBTk4_zSpd4MZWMlWrXPrPAz1sOxqyS7J7TePMsCBzsxHk.UBvTRJkJi_3
	1k8e46AKIkCVTvlQHfprA59fxYa3.6iyYA5RBffuQDO2jH9GiiOF0u7nOhfU46vJfCCcqDcEiMg4
	EwakpNE1VfqZgF_Rjw7tzBgU6IjDiYQ_hW49PYYt6R6req0a_UEg8FkzWXfaIreQXML1V3zq1hAe
	R4bfH6SPX0am9C0HOpmw3tvPYCpVTIUbzkPnZ8bWxhylViJxRe9g9ZXvDhZz7WiPUiBvre1EMfVu
	4.wOMUy.gJF7dZvtC05rohIexbD7UgzsnTlifHDQQ7o3mjgCnuj2tbFBaeZKwZzLG_DukmQffBwU
	8tewJsnRgmgoEduWitlFsV8Z56iucg6xzugQckkMlP6A.0vPi9Mb.t0QiRiuDcod75gYnxeOP2x5
	n41ss44055jVLOpNF.Ug3saRzqwFD1fNkjWykixHKH3S6i14neG2T07ptd7dHm1rCTdv5UNTGgj7
	F6X5Vzxomj5ilMRmV04iamfQbEuRnFV.9occ4y_kV7rUKilBjYbaYVscgEcH4XHHXgouiwydSph7
	0P5aOLcRMyj5._rWjCp0Y.huuAVWdTtFNiGQyCQOdsyAcxmprg0jivp03AIrXpJJRXZ9efQ8PEck
	N9zkeJx9u3wC1Wi76HRJoM9irscrAlW1OE4AT9SAoExUpi6z3aDXSOnTIMJksVvdtt.wEB_kFyeO
	79J4tu7Rt.FW3LmWhDqKhRnLOV9.eqH5HOTRe5ck8HBock7vzUXo4C6_Y.Cy5V79ODEK0aRhYsFn
	Mq_oCrOHEs_HYg5WFVS2eu6DN884bHdrbBIYblB4yDQb9l.n2L5t9PIf4wa82Gz2AJ7AxPiukuLq
	nZwnkfGIALkFNVzR3E7unxKs0HVgx6Nk51r79aDJjM33wrqKpEpFtM0ArQOHAZkMdeSX3MxndSs3
	YaEu0kzl0qu_BE9ei7Xls1x.bcpcxiAz0IaQttwSScdgU9rLp.KKj77UZkFw41ianiQveeARyCKQ
	dh76UcOR.m3sS33dkF_jynWv3pSXJKZKqr.fby9sKD7A-
Received: from sonic306-27.consmr.mail.ne1.yahoo.com
	(sonic306-27.consmr.mail.ne1.yahoo.com [66.163.189.89]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-275-ziWEJ5xhPVCZf_rcxEM6Ig-1;
	Tue, 19 Nov 2019 13:03:35 -0500
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic306.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 19 Nov 2019 18:03:35 +0000
Received: by smtp413.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 3fb5178ac301ad9f620e9736a13e6599; 
	Tue, 19 Nov 2019 18:03:34 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: linux-audit@redhat.com
Subject: [PATCH v11 09/25] LSM: Use lsmblob in security_task_getsecid
Date: Tue, 19 Nov 2019 10:03:08 -0800
Message-Id: <20191119180315.12254-5-casey@schaufler-ca.com>
In-Reply-To: <20191119180315.12254-1-casey@schaufler-ca.com>
References: <20191119180315.12254-1-casey@schaufler-ca.com>
MIME-Version: 1.0
X-MC-Unique: ziWEJ5xhPVCZf_rcxEM6Ig-1
X-MC-Unique: KfUF0TzkP0-YafeJ0k2UgQ-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAJI3dnf001059
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

Change the security_task_getsecid() interface to fill in
a lsmblob structure instead of a u32 secid in support of
LSM stacking. Audit interfaces will need to collect all
possible secids for possible reporting.

Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: John Johansen <john.johansen@canonical.com>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
cc: linux-integrity@vger.kernel.org
---
 drivers/android/binder.c              |  4 +--
 include/linux/security.h              |  7 ++---
 kernel/audit.c                        | 11 ++++----
 kernel/auditfilter.c                  |  4 +--
 kernel/auditsc.c                      | 18 ++++++++-----
 net/netlabel/netlabel_unlabeled.c     |  5 +++-
 net/netlabel/netlabel_user.h          |  6 ++++-
 security/integrity/ima/ima_appraise.c |  4 ++-
 security/integrity/ima/ima_main.c     | 39 ++++++++++++++++-----------
 security/security.c                   | 12 ++++++---
 10 files changed, 68 insertions(+), 42 deletions(-)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 5f4702b4c507..3a7fcdc8dbe2 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -3108,12 +3108,10 @@ static void binder_transaction(struct binder_proc *=
proc,
 =09t->priority =3D task_nice(current);
=20
 =09if (target_node && target_node->txn_security_ctx) {
-=09=09u32 secid;
 =09=09struct lsmblob blob;
 =09=09size_t added_size;
=20
-=09=09security_task_getsecid(proc->tsk, &secid);
-=09=09lsmblob_init(&blob, secid);
+=09=09security_task_getsecid(proc->tsk, &blob);
 =09=09ret =3D security_secid_to_secctx(&blob, &secctx, &secctx_sz);
 =09=09if (ret) {
 =09=09=09return_error =3D BR_FAILED_REPLY;
diff --git a/include/linux/security.h b/include/linux/security.h
index 9519b4fb43ae..67f95a335b5d 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -447,7 +447,7 @@ int security_task_fix_setuid(struct cred *new, const st=
ruct cred *old,
 int security_task_setpgid(struct task_struct *p, pid_t pgid);
 int security_task_getpgid(struct task_struct *p);
 int security_task_getsid(struct task_struct *p);
-void security_task_getsecid(struct task_struct *p, u32 *secid);
+void security_task_getsecid(struct task_struct *p, struct lsmblob *blob);
 int security_task_setnice(struct task_struct *p, int nice);
 int security_task_setioprio(struct task_struct *p, int ioprio);
 int security_task_getioprio(struct task_struct *p);
@@ -1099,9 +1099,10 @@ static inline int security_task_getsid(struct task_s=
truct *p)
 =09return 0;
 }
=20
-static inline void security_task_getsecid(struct task_struct *p, u32 *seci=
d)
+static inline void security_task_getsecid(struct task_struct *p,
+=09=09=09=09=09  struct lsmblob *blob)
 {
-=09*secid =3D 0;
+=09lsmblob_init(blob, 0);
 }
=20
 static inline int security_task_setnice(struct task_struct *p, int nice)
diff --git a/kernel/audit.c b/kernel/audit.c
index 2f8e89eaf3e5..fd29186ae977 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -2062,14 +2062,12 @@ int audit_log_task_context(struct audit_buffer *ab)
 =09char *ctx =3D NULL;
 =09unsigned len;
 =09int error;
-=09u32 sid;
 =09struct lsmblob blob;
=20
-=09security_task_getsecid(current, &sid);
-=09if (!sid)
+=09security_task_getsecid(current, &blob);
+=09if (!lsmblob_is_set(&blob))
 =09=09return 0;
=20
-=09lsmblob_init(&blob, sid);
 =09error =3D security_secid_to_secctx(&blob, &ctx, &len);
 =09if (error) {
 =09=09if (error !=3D -EINVAL)
@@ -2276,6 +2274,7 @@ int audit_set_loginuid(kuid_t loginuid)
 int audit_signal_info(int sig, struct task_struct *t)
 {
 =09kuid_t uid =3D current_uid(), auid;
+=09struct lsmblob blob;
=20
 =09if (auditd_test_task(t) &&
 =09    (sig =3D=3D SIGTERM || sig =3D=3D SIGHUP ||
@@ -2286,7 +2285,9 @@ int audit_signal_info(int sig, struct task_struct *t)
 =09=09=09audit_sig_uid =3D auid;
 =09=09else
 =09=09=09audit_sig_uid =3D uid;
-=09=09security_task_getsecid(current, &audit_sig_sid);
+=09=09security_task_getsecid(current, &blob);
+=09=09/* scaffolding until audit_sig_sid is converted */
+=09=09audit_sig_sid =3D blob.secid[0];
 =09}
=20
 =09return audit_signal_info_syscall(t);
diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
index 356db1dd276c..19cfbe716f9d 100644
--- a/kernel/auditfilter.c
+++ b/kernel/auditfilter.c
@@ -1324,7 +1324,6 @@ int audit_filter(int msgtype, unsigned int listtype)
 =09=09for (i =3D 0; i < e->rule.field_count; i++) {
 =09=09=09struct audit_field *f =3D &e->rule.fields[i];
 =09=09=09pid_t pid;
-=09=09=09u32 sid;
 =09=09=09struct lsmblob blob;
=20
 =09=09=09switch (f->type) {
@@ -1355,8 +1354,7 @@ int audit_filter(int msgtype, unsigned int listtype)
 =09=09=09case AUDIT_SUBJ_SEN:
 =09=09=09case AUDIT_SUBJ_CLR:
 =09=09=09=09if (f->lsm_rule) {
-=09=09=09=09=09security_task_getsecid(current, &sid);
-=09=09=09=09=09lsmblob_init(&blob, sid);
+=09=09=09=09=09security_task_getsecid(current, &blob);
 =09=09=09=09=09result =3D security_audit_rule_match(
 =09=09=09=09=09=09=09&blob, f->type,
 =09=09=09=09=09=09=09f->op, f->lsm_rule);
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index ce8bf2d8f8d2..cccb681ad081 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -444,7 +444,6 @@ static int audit_filter_rules(struct task_struct *tsk,
 {
 =09const struct cred *cred;
 =09int i, need_sid =3D 1;
-=09u32 sid;
 =09struct lsmblob blob;
 =09unsigned int sessionid;
=20
@@ -641,10 +640,9 @@ static int audit_filter_rules(struct task_struct *tsk,
 =09=09=09   logged upon error */
 =09=09=09if (f->lsm_rule) {
 =09=09=09=09if (need_sid) {
-=09=09=09=09=09security_task_getsecid(tsk, &sid);
+=09=09=09=09=09security_task_getsecid(tsk, &blob);
 =09=09=09=09=09need_sid =3D 0;
 =09=09=09=09}
-=09=09=09=09lsmblob_init(&blob, sid);
 =09=09=09=09result =3D security_audit_rule_match(&blob,
 =09=09=09=09=09=09=09=09   f->type,
 =09=09=09=09=09=09=09=09   f->op,
@@ -2382,12 +2380,15 @@ int __audit_sockaddr(int len, void *a)
 void __audit_ptrace(struct task_struct *t)
 {
 =09struct audit_context *context =3D audit_context();
+=09struct lsmblob blob;
=20
 =09context->target_pid =3D task_tgid_nr(t);
 =09context->target_auid =3D audit_get_loginuid(t);
 =09context->target_uid =3D task_uid(t);
 =09context->target_sessionid =3D audit_get_sessionid(t);
-=09security_task_getsecid(t, &context->target_sid);
+=09security_task_getsecid(t, &blob);
+=09/* scaffolding - until target_sid is converted */
+=09context->target_sid =3D blob.secid[0];
 =09memcpy(context->target_comm, t->comm, TASK_COMM_LEN);
 }
=20
@@ -2403,6 +2404,7 @@ int audit_signal_info_syscall(struct task_struct *t)
 =09struct audit_aux_data_pids *axp;
 =09struct audit_context *ctx =3D audit_context();
 =09kuid_t t_uid =3D task_uid(t);
+=09struct lsmblob blob;
=20
 =09if (!audit_signals || audit_dummy_context())
 =09=09return 0;
@@ -2414,7 +2416,9 @@ int audit_signal_info_syscall(struct task_struct *t)
 =09=09ctx->target_auid =3D audit_get_loginuid(t);
 =09=09ctx->target_uid =3D t_uid;
 =09=09ctx->target_sessionid =3D audit_get_sessionid(t);
-=09=09security_task_getsecid(t, &ctx->target_sid);
+=09=09security_task_getsecid(t, &blob);
+=09=09/* scaffolding until target_sid is converted */
+=09=09ctx->target_sid =3D blob.secid[0];
 =09=09memcpy(ctx->target_comm, t->comm, TASK_COMM_LEN);
 =09=09return 0;
 =09}
@@ -2435,7 +2439,9 @@ int audit_signal_info_syscall(struct task_struct *t)
 =09axp->target_auid[axp->pid_count] =3D audit_get_loginuid(t);
 =09axp->target_uid[axp->pid_count] =3D t_uid;
 =09axp->target_sessionid[axp->pid_count] =3D audit_get_sessionid(t);
-=09security_task_getsecid(t, &axp->target_sid[axp->pid_count]);
+=09security_task_getsecid(t, &blob);
+=09/* scaffolding until target_sid is converted */
+=09axp->target_sid[axp->pid_count] =3D blob.secid[0];
 =09memcpy(axp->target_comm[axp->pid_count], t->comm, TASK_COMM_LEN);
 =09axp->pid_count++;
=20
diff --git a/net/netlabel/netlabel_unlabeled.c b/net/netlabel/netlabel_unla=
beled.c
index 0cda17cb44a0..e279b81d9545 100644
--- a/net/netlabel/netlabel_unlabeled.c
+++ b/net/netlabel/netlabel_unlabeled.c
@@ -1539,11 +1539,14 @@ int __init netlbl_unlabel_defconf(void)
 =09int ret_val;
 =09struct netlbl_dom_map *entry;
 =09struct netlbl_audit audit_info;
+=09struct lsmblob blob;
=20
 =09/* Only the kernel is allowed to call this function and the only time
 =09 * it is called is at bootup before the audit subsystem is reporting
 =09 * messages so don't worry to much about these values. */
-=09security_task_getsecid(current, &audit_info.secid);
+=09security_task_getsecid(current, &blob);
+=09/* scaffolding until audit_info.secid is converted */
+=09audit_info.secid =3D blob.secid[0];
 =09audit_info.loginuid =3D GLOBAL_ROOT_UID;
 =09audit_info.sessionid =3D 0;
=20
diff --git a/net/netlabel/netlabel_user.h b/net/netlabel/netlabel_user.h
index 3c67afce64f1..438b5db6c714 100644
--- a/net/netlabel/netlabel_user.h
+++ b/net/netlabel/netlabel_user.h
@@ -34,7 +34,11 @@
 static inline void netlbl_netlink_auditinfo(struct sk_buff *skb,
 =09=09=09=09=09    struct netlbl_audit *audit_info)
 {
-=09security_task_getsecid(current, &audit_info->secid);
+=09struct lsmblob blob;
+
+=09security_task_getsecid(current, &blob);
+=09/* scaffolding until secid is converted */
+=09audit_info->secid =3D blob.secid[0];
 =09audit_info->loginuid =3D audit_get_loginuid(current);
 =09audit_info->sessionid =3D audit_get_sessionid(current);
 }
diff --git a/security/integrity/ima/ima_appraise.c b/security/integrity/ima=
/ima_appraise.c
index 136ae4e0ee92..7288a574459b 100644
--- a/security/integrity/ima/ima_appraise.c
+++ b/security/integrity/ima/ima_appraise.c
@@ -48,11 +48,13 @@ bool is_ima_appraise_enabled(void)
 int ima_must_appraise(struct inode *inode, int mask, enum ima_hooks func)
 {
 =09u32 secid;
+=09struct lsmblob blob;
=20
 =09if (!ima_appraise)
 =09=09return 0;
=20
-=09security_task_getsecid(current, &secid);
+=09security_task_getsecid(current, &blob);
+=09lsmblob_secid(&blob, &secid);
 =09return ima_match_policy(inode, current_cred(), secid, func, mask,
 =09=09=09=09IMA_APPRAISE | IMA_HASH, NULL, NULL);
 }
diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima=
_main.c
index 60027c643ecd..cac654c2faaf 100644
--- a/security/integrity/ima/ima_main.c
+++ b/security/integrity/ima/ima_main.c
@@ -380,12 +380,13 @@ static int process_measurement(struct file *file, con=
st struct cred *cred,
  */
 int ima_file_mmap(struct file *file, unsigned long prot)
 {
-=09u32 secid;
+=09struct lsmblob blob;
=20
 =09if (file && (prot & PROT_EXEC)) {
-=09=09security_task_getsecid(current, &secid);
-=09=09return process_measurement(file, current_cred(), secid, NULL,
-=09=09=09=09=09   0, MAY_EXEC, MMAP_CHECK);
+=09=09security_task_getsecid(current, &blob);
+=09=09/* scaffolding - until process_measurement changes */
+=09=09return process_measurement(file, current_cred(), blob.secid[0],
+=09=09=09=09=09   NULL, 0, MAY_EXEC, MMAP_CHECK);
 =09}
=20
 =09return 0;
@@ -408,10 +409,12 @@ int ima_bprm_check(struct linux_binprm *bprm)
 {
 =09int ret;
 =09u32 secid;
+=09struct lsmblob blob;
=20
-=09security_task_getsecid(current, &secid);
-=09ret =3D process_measurement(bprm->file, current_cred(), secid, NULL, 0,
-=09=09=09=09  MAY_EXEC, BPRM_CHECK);
+=09security_task_getsecid(current, &blob);
+=09/* scaffolding until process_measurement changes */
+=09ret =3D process_measurement(bprm->file, current_cred(), blob.secid[0],
+=09=09=09=09  NULL, 0, MAY_EXEC, BPRM_CHECK);
 =09if (ret)
 =09=09return ret;
=20
@@ -432,10 +435,11 @@ int ima_bprm_check(struct linux_binprm *bprm)
  */
 int ima_file_check(struct file *file, int mask)
 {
-=09u32 secid;
+=09struct lsmblob blob;
=20
-=09security_task_getsecid(current, &secid);
-=09return process_measurement(file, current_cred(), secid, NULL, 0,
+=09security_task_getsecid(current, &blob);
+=09/* scaffolding until process_measurement changes */
+=09return process_measurement(file, current_cred(), blob.secid[0], NULL, 0=
,
 =09=09=09=09   mask & (MAY_READ | MAY_WRITE | MAY_EXEC |
 =09=09=09=09=09   MAY_APPEND), FILE_CHECK);
 }
@@ -544,7 +548,7 @@ int ima_post_read_file(struct file *file, void *buf, lo=
ff_t size,
 =09=09       enum kernel_read_file_id read_id)
 {
 =09enum ima_hooks func;
-=09u32 secid;
+=09struct lsmblob blob;
=20
 =09if (!file && read_id =3D=3D READING_FIRMWARE) {
 =09=09if ((ima_appraise & IMA_APPRAISE_FIRMWARE) &&
@@ -566,9 +570,10 @@ int ima_post_read_file(struct file *file, void *buf, l=
off_t size,
 =09}
=20
 =09func =3D read_idmap[read_id] ?: FILE_CHECK;
-=09security_task_getsecid(current, &secid);
-=09return process_measurement(file, current_cred(), secid, buf, size,
-=09=09=09=09   MAY_READ, func);
+=09security_task_getsecid(current, &blob);
+=09/* scaffolding until process_measurement changes */
+=09return process_measurement(file, current_cred(), blob.secid[0], buf,
+=09=09=09=09   size, MAY_READ, func);
 }
=20
 /**
@@ -687,11 +692,13 @@ static void process_buffer_measurement(const void *bu=
f, int size,
 void ima_kexec_cmdline(const void *buf, int size)
 {
 =09u32 secid;
+=09struct lsmblob blob;
=20
 =09if (buf && size !=3D 0) {
-=09=09security_task_getsecid(current, &secid);
+=09=09security_task_getsecid(current, &blob);
+=09=09/* scaffolding */
 =09=09process_buffer_measurement(buf, size, "kexec-cmdline",
-=09=09=09=09=09   current_cred(), secid);
+=09=09=09=09=09   current_cred(), blob.secid[0]);
 =09}
 }
=20
diff --git a/security/security.c b/security/security.c
index b60c6a51f622..e1f216d453bf 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1700,10 +1700,16 @@ int security_task_getsid(struct task_struct *p)
 =09return call_int_hook(task_getsid, 0, p);
 }
=20
-void security_task_getsecid(struct task_struct *p, u32 *secid)
+void security_task_getsecid(struct task_struct *p, struct lsmblob *blob)
 {
-=09*secid =3D 0;
-=09call_void_hook(task_getsecid, p, secid);
+=09struct security_hook_list *hp;
+
+=09lsmblob_init(blob, 0);
+=09hlist_for_each_entry(hp, &security_hook_heads.task_getsecid, list) {
+=09=09if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >=3D lsm_slot))
+=09=09=09continue;
+=09=09hp->hook.task_getsecid(p, &blob->secid[hp->lsmid->slot]);
+=09}
 }
 EXPORT_SYMBOL(security_task_getsecid);
=20
--=20
2.20.1


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

