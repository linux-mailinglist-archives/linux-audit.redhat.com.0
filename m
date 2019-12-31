Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9180C12DB5D
	for <lists+linux-audit@lfdr.de>; Tue, 31 Dec 2019 20:50:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1577821833;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:in-reply-to:references:references:references:
	 list-id:list-help:list-unsubscribe:list-subscribe:list-post;
	bh=4gdU4E/1j56nsZIdfnNUxyN3uxwrwu/Ng4JN6DYsWbA=;
	b=CRaWk4dfEbDklYRnrBismUNQxte8QxH6DWIoKrRtXGLJ1M8B9ca5f3KGeZizAaoiTh19ui
	L12BqRz8xegnSOPsfi43f5MSJZj0fO3kBolJjz1/Ua4xc2KynkzV/PvfRzVeE2ZCPYYWVJ
	fHowa7q7lv9fIuc4H/sQLAPRWLN7zPs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-hzIXB4oGOGGc1bHsgthk9w-1; Tue, 31 Dec 2019 14:50:31 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9D01800D48;
	Tue, 31 Dec 2019 19:50:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B9F8477FFD;
	Tue, 31 Dec 2019 19:50:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7D44418089C8;
	Tue, 31 Dec 2019 19:50:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBVJoNZZ032170 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 31 Dec 2019 14:50:23 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B50AD82086; Tue, 31 Dec 2019 19:50:23 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-15.phx2.redhat.com [10.3.112.15])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4D82F82093;
	Tue, 31 Dec 2019 19:50:12 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: containers@lists.linux-foundation.org, linux-api@vger.kernel.org,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	linux-fsdevel@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	netdev@vger.kernel.org, netfilter-devel@vger.kernel.org
Subject: [PATCH ghak90 V8 05/16] audit: log drop of contid on exit of last task
Date: Tue, 31 Dec 2019 14:48:18 -0500
Message-Id: <b3725abab452beaba740ac58f76144e6c3bda2fa.1577736799.git.rgb@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: hzIXB4oGOGGc1bHsgthk9w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Since we are tracking the life of each audit container indentifier, we
can match the creation event with the destruction event.  Log the
destruction of the audit container identifier when the last process in
that container exits.

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 kernel/audit.c   | 17 +++++++++++++++++
 kernel/audit.h   |  2 ++
 kernel/auditsc.c |  2 ++
 3 files changed, 21 insertions(+)

diff --git a/kernel/audit.c b/kernel/audit.c
index 4bab20f5f781..fa8f1aa3a605 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -2502,6 +2502,23 @@ int audit_set_contid(struct task_struct *task, u64 contid)
 	return rc;
 }
 
+void audit_log_container_drop(void)
+{
+	struct audit_buffer *ab;
+
+	if (!current->audit || !current->audit->cont ||
+	    refcount_read(&current->audit->cont->refcount) > 1)
+		return;
+	ab = audit_log_start(audit_context(), GFP_KERNEL, AUDIT_CONTAINER_OP);
+	if (!ab)
+		return;
+
+	audit_log_format(ab, "op=drop opid=%d contid=%llu old-contid=%llu",
+			 task_tgid_nr(current), audit_get_contid(current),
+			 audit_get_contid(current));
+	audit_log_end(ab);
+}
+
 /**
  * audit_log_end - end one audit record
  * @ab: the audit_buffer
diff --git a/kernel/audit.h b/kernel/audit.h
index e4a31aa92dfe..162de8366b32 100644
--- a/kernel/audit.h
+++ b/kernel/audit.h
@@ -255,6 +255,8 @@ extern void audit_log_d_path_exe(struct audit_buffer *ab,
 extern struct tty_struct *audit_get_tty(void);
 extern void audit_put_tty(struct tty_struct *tty);
 
+extern void audit_log_container_drop(void);
+
 /* audit watch/mark/tree functions */
 #ifdef CONFIG_AUDITSYSCALL
 extern unsigned int audit_serial(void);
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 0e2d50533959..bd855794ad26 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -1568,6 +1568,8 @@ static void audit_log_exit(void)
 
 	audit_log_proctitle();
 
+	audit_log_container_drop();
+
 	/* Send end of event record to help user space know we are finished */
 	ab = audit_log_start(context, GFP_KERNEL, AUDIT_EOE);
 	if (ab)
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

