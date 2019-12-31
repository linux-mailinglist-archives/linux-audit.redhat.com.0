Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id D76F812DB53
	for <lists+linux-audit@lfdr.de>; Tue, 31 Dec 2019 20:50:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1577821821;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:in-reply-to:references:references:references:
	 list-id:list-help:list-unsubscribe:list-subscribe:list-post;
	bh=Q0imPnzRK9sLJ31mW21wvDEx6vwDvYkFvoaXqMEJdzg=;
	b=SupJABRFolNxNJhVGu9l8bFDGZoGj8zXQCKEVOrk9/mdff3w7tWB/YTItujtyQdfBoZZIc
	a0pFbv1KX4W7ErvW0e5OktYorLiVdEYj6+mZD2sDHK2r7ryBzRBwpklbe0BWa3LARVGIqs
	G5i0qhBciKdZcu0r+qm/SNZlyI57GrE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-Tlg-XJzxMe-b7DLZjR4grw-1; Tue, 31 Dec 2019 14:50:20 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25970800D48;
	Tue, 31 Dec 2019 19:50:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 05DAC5C28D;
	Tue, 31 Dec 2019 19:50:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BEA4118089CD;
	Tue, 31 Dec 2019 19:50:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBVJoBlB032147 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 31 Dec 2019 14:50:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DE76482093; Tue, 31 Dec 2019 19:50:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-15.phx2.redhat.com [10.3.112.15])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D65B681C0A;
	Tue, 31 Dec 2019 19:49:59 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: containers@lists.linux-foundation.org, linux-api@vger.kernel.org,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	linux-fsdevel@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	netdev@vger.kernel.org, netfilter-devel@vger.kernel.org
Subject: [PATCH ghak90 V8 04/16] audit: convert to contid list to check for
	orch/engine ownership
Date: Tue, 31 Dec 2019 14:48:17 -0500
Message-Id: <a911acf0b209c05dc156fb6b57f9da45778747ce.1577736799.git.rgb@redhat.com>
In-Reply-To: <cover.1577736799.git.rgb@redhat.com>
References: <cover.1577736799.git.rgb@redhat.com>
In-Reply-To: <cover.1577736799.git.rgb@redhat.com>
References: <cover.1577736799.git.rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, Richard Guy Briggs <rgb@redhat.com>,
	dhowells@redhat.com, ebiederm@xmission.com, simo@redhat.com,
	eparis@parisplace.org, mpatel@redhat.com, serge@hallyn.com
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
MIME-Version: 1.0
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: Tlg-XJzxMe-b7DLZjR4grw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Store the audit container identifier in a refcounted kernel object that
is added to the master list of audit container identifiers.  This will
allow multiple container orchestrators/engines to work on the same
machine without danger of inadvertantly re-using an existing identifier.
It will also allow an orchestrator to inject a process into an existing
container by checking if the original container owner is the one
injecting the task.  A hash table list is used to optimize searches.

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 include/linux/audit.h | 14 ++++++--
 kernel/audit.c        | 98 ++++++++++++++++++++++++++++++++++++++++++++++++---
 kernel/audit.h        |  8 +++++
 3 files changed, 112 insertions(+), 8 deletions(-)

diff --git a/include/linux/audit.h b/include/linux/audit.h
index a045b34ecf44..0e6dbe943ae4 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -94,10 +94,18 @@ struct audit_ntp_data {
 struct audit_ntp_data {};
 #endif
 
+struct audit_contobj {
+	struct list_head	list;
+	u64			id;
+	struct task_struct	*owner;
+	refcount_t              refcount;
+	struct rcu_head         rcu;
+};
+
 struct audit_task_info {
 	kuid_t			loginuid;
 	unsigned int		sessionid;
-	u64			contid;
+	struct audit_contobj	*cont;
 #ifdef CONFIG_AUDITSYSCALL
 	struct audit_context	*ctx;
 #endif
@@ -203,9 +211,9 @@ static inline unsigned int audit_get_sessionid(struct task_struct *tsk)
 
 static inline u64 audit_get_contid(struct task_struct *tsk)
 {
-	if (!tsk->audit)
+	if (!tsk->audit || !tsk->audit->cont)
 		return AUDIT_CID_UNSET;
-	return tsk->audit->contid;
+	return tsk->audit->cont->id;
 }
 
 extern u32 audit_enabled;
diff --git a/kernel/audit.c b/kernel/audit.c
index 2d7707426b7d..4bab20f5f781 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -138,6 +138,12 @@ struct auditd_connection {
 
 /* Hash for inode-based rules */
 struct list_head audit_inode_hash[AUDIT_INODE_BUCKETS];
+/* Hash for contid object lists */
+struct list_head audit_contid_hash[AUDIT_CONTID_BUCKETS];
+/* Lock all additions and deletions to the contid hash lists, assignment
+ * of container objects to tasks and refcount changes.  There should be
+ * no need for interaction with tasklist_lock */
+static DEFINE_SPINLOCK(audit_contobj_list_lock);
 
 static struct kmem_cache *audit_buffer_cache;
 
@@ -212,6 +218,31 @@ void __init audit_task_init(void)
 					     0, SLAB_PANIC, NULL);
 }
 
+static struct audit_contobj *_audit_contobj(struct task_struct *tsk)
+{
+	if (!tsk->audit)
+		return NULL;
+	return tsk->audit->cont;
+}
+
+/* audit_contobj_list_lock must be held by caller unless new */
+static void _audit_contobj_hold(struct audit_contobj *cont)
+{
+	refcount_inc(&cont->refcount);
+}
+
+/* audit_contobj_list_lock must be held by caller */
+static void _audit_contobj_put(struct audit_contobj *cont)
+{
+	if (!cont)
+		return;
+	if (refcount_dec_and_test(&cont->refcount)) {
+		put_task_struct(cont->owner);
+		list_del_rcu(&cont->list);
+		kfree_rcu(cont, rcu);
+	}
+}
+
 /**
  * audit_alloc - allocate an audit info block for a task
  * @tsk: task
@@ -232,7 +263,11 @@ int audit_alloc(struct task_struct *tsk)
 	}
 	info->loginuid = audit_get_loginuid(current);
 	info->sessionid = audit_get_sessionid(current);
-	info->contid = audit_get_contid(current);
+	spin_lock(&audit_contobj_list_lock);
+	info->cont = _audit_contobj(current);
+	if (info->cont)
+		_audit_contobj_hold(info->cont);
+	spin_unlock(&audit_contobj_list_lock);
 	tsk->audit = info;
 
 	ret = audit_alloc_syscall(tsk);
@@ -247,7 +282,7 @@ int audit_alloc(struct task_struct *tsk)
 struct audit_task_info init_struct_audit = {
 	.loginuid = INVALID_UID,
 	.sessionid = AUDIT_SID_UNSET,
-	.contid = AUDIT_CID_UNSET,
+	.cont = NULL,
 #ifdef CONFIG_AUDITSYSCALL
 	.ctx = NULL,
 #endif
@@ -267,6 +302,9 @@ void audit_free(struct task_struct *tsk)
 	/* Freeing the audit_task_info struct must be performed after
 	 * audit_log_exit() due to need for loginuid and sessionid.
 	 */
+	spin_lock(&audit_contobj_list_lock); 
+	_audit_contobj_put(tsk->audit->cont);
+	spin_unlock(&audit_contobj_list_lock); 
 	info = tsk->audit;
 	tsk->audit = NULL;
 	kmem_cache_free(audit_task_cache, info);
@@ -1658,6 +1696,9 @@ static int __init audit_init(void)
 	for (i = 0; i < AUDIT_INODE_BUCKETS; i++)
 		INIT_LIST_HEAD(&audit_inode_hash[i]);
 
+	for (i = 0; i < AUDIT_CONTID_BUCKETS; i++)
+		INIT_LIST_HEAD(&audit_contid_hash[i]);
+
 	mutex_init(&audit_cmd_mutex.lock);
 	audit_cmd_mutex.owner = NULL;
 
@@ -2365,6 +2406,9 @@ int audit_signal_info(int sig, struct task_struct *t)
  *
  * Returns 0 on success, -EPERM on permission failure.
  *
+ * If the original container owner goes away, no task injection is
+ * possible to an existing container.
+ *
  * Called (set) from fs/proc/base.c::proc_contid_write().
  */
 int audit_set_contid(struct task_struct *task, u64 contid)
@@ -2381,9 +2425,12 @@ int audit_set_contid(struct task_struct *task, u64 contid)
 	}
 	oldcontid = audit_get_contid(task);
 	read_lock(&tasklist_lock);
-	/* Don't allow the audit containerid to be unset */
+	/* Don't allow the contid to be unset */
 	if (!audit_contid_valid(contid))
 		rc = -EINVAL;
+	/* Don't allow the contid to be set to the same value again */
+	else if (contid == oldcontid) {
+		rc = -EADDRINUSE;
 	/* if we don't have caps, reject */
 	else if (!capable(CAP_AUDIT_CONTROL))
 		rc = -EPERM;
@@ -2396,8 +2443,49 @@ int audit_set_contid(struct task_struct *task, u64 contid)
 	else if (audit_contid_set(task))
 		rc = -ECHILD;
 	read_unlock(&tasklist_lock);
-	if (!rc)
-		task->audit->contid = contid;
+	if (!rc) {
+		struct audit_contobj *oldcont = _audit_contobj(task);
+		struct audit_contobj *cont = NULL, *newcont = NULL;
+		int h = audit_hash_contid(contid);
+
+		rcu_read_lock();
+		list_for_each_entry_rcu(cont, &audit_contid_hash[h], list)
+			if (cont->id == contid) {
+				/* task injection to existing container */
+				if (current == cont->owner) {
+					spin_lock(&audit_contobj_list_lock);
+					_audit_contobj_hold(cont);
+					spin_unlock(&audit_contobj_list_lock);
+					newcont = cont;
+				} else {
+					rc = -ENOTUNIQ;
+					goto conterror;
+				}
+				break;
+			}
+		if (!newcont) {
+			newcont = kmalloc(sizeof(*newcont), GFP_ATOMIC);
+			if (newcont) {
+				INIT_LIST_HEAD(&newcont->list);
+				newcont->id = contid;
+				get_task_struct(current);
+				newcont->owner = current;
+				refcount_set(&newcont->refcount, 1);
+				spin_lock(&audit_contobj_list_lock);
+				list_add_rcu(&newcont->list, &audit_contid_hash[h]);
+				spin_unlock(&audit_contobj_list_lock);
+			} else {
+				rc = -ENOMEM;
+				goto conterror;
+			}
+		}
+		task->audit->cont = newcont;
+		spin_lock(&audit_contobj_list_lock);
+		_audit_contobj_put(oldcont);
+		spin_unlock(&audit_contobj_list_lock);
+conterror:
+		rcu_read_unlock();
+	}
 	task_unlock(task);
 
 	if (!audit_enabled)
diff --git a/kernel/audit.h b/kernel/audit.h
index 16bd03b88e0d..e4a31aa92dfe 100644
--- a/kernel/audit.h
+++ b/kernel/audit.h
@@ -211,6 +211,14 @@ static inline int audit_hash_ino(u32 ino)
 	return (ino & (AUDIT_INODE_BUCKETS-1));
 }
 
+#define AUDIT_CONTID_BUCKETS	32
+extern struct list_head audit_contid_hash[AUDIT_CONTID_BUCKETS];
+
+static inline int audit_hash_contid(u64 contid)
+{
+	return (contid & (AUDIT_CONTID_BUCKETS-1));
+}
+
 /* Indicates that audit should log the full pathname. */
 #define AUDIT_NAME_FULL -1
 
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

