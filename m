Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id EE275BE6D6
	for <lists+linux-audit@lfdr.de>; Wed, 25 Sep 2019 23:02:59 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9FE4E308403B;
	Wed, 25 Sep 2019 21:02:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 36D4F60A35;
	Wed, 25 Sep 2019 21:02:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 543444E589;
	Wed, 25 Sep 2019 21:02:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8PL2dR8008177 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 25 Sep 2019 17:02:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B123560A35; Wed, 25 Sep 2019 21:02:39 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx30.extmail.prod.ext.phx2.redhat.com
	[10.5.110.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC77660920
	for <linux-audit@redhat.com>; Wed, 25 Sep 2019 21:02:37 +0000 (UTC)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 23C7F20F5
	for <linux-audit@redhat.com>; Wed, 25 Sep 2019 21:02:36 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id q7so178149pfh.8
	for <linux-audit@redhat.com>; Wed, 25 Sep 2019 14:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:mime-version:content-disposition
	:content-transfer-encoding;
	bh=7xhrP95QBYJiSF2YxdsM/vyNYpW4G7L9q0PwFgts0Eg=;
	b=PhYrdbXFW7DxjoTBihqkbscUj3ihaM+7AY9Uko1qzd/uFoRL8eCcWcrRFhuukFI+Oz
	tHzDS4E8nYIttCuj/nMIfyN+ttt8eZInD6Ld0sgEK6AuJlEQGAUO5CV2x0pMB6curxMS
	NQeJZM+/oKiZHqo7s+oNvkBKelSGTUnca6lg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-disposition:content-transfer-encoding;
	bh=7xhrP95QBYJiSF2YxdsM/vyNYpW4G7L9q0PwFgts0Eg=;
	b=VdS2cSaUl7mGp9St7ui3WOXHWZ7QmA+faazQFYXAJcV+t+JR8iIHKxhFefgh40wtjS
	aJdJC+uuHD33TiGK1mhiaK5bWLqgDKk/b9BOCp+nGCT5zLQyLpNrE8f8WOoJoi18gbA1
	IeIiPm9Uw3DtPHCq/vWQFZA3nSHORWtFvLZu3ZMna2m86Wf+whdx17QjjxwuT0PR5dqZ
	hGaKVU57FXZICuEaTVugwy9d45CfPQ+NKs1jx/zpBFTBdQpk4tIeCNJfNLaRuMY1hRK1
	ToAOzDgFdk1M9gS7c4xJvEtkYokTQ//fkOYlbhLqWt1AYvhaC/otwhAmvPCN9r2B/WCj
	A+Tg==
X-Gm-Message-State: APjAAAXe3XWDopYZzPbfx8LF2MDqCyYqmbVupH7A42V/9xKE7OXc8ubI
	Gu/1qooV/QGX+TGzX26tHs3Xzg==
X-Google-Smtp-Source: APXvYqy8enN66HCBAXgdyj2WiN3UN+3QBv7218MOZV3xhCqI5u1BW3NXe4CmUibg81qEWdaXeJbpZA==
X-Received: by 2002:a17:90a:8c14:: with SMTP id
	a20mr8916240pjo.45.1569445355367; 
	Wed, 25 Sep 2019 14:02:35 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	p66sm13856502pfg.127.2019.09.25.14.02.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 25 Sep 2019 14:02:34 -0700 (PDT)
Date: Wed, 25 Sep 2019 14:02:33 -0700
From: Kees Cook <keescook@chromium.org>
To: Paul Moore <paul@paul-moore.com>
Subject: [PATCH] audit: Report suspicious O_CREAT usage
Message-ID: <201909251348.A1542A52@keescook>
MIME-Version: 1.0
Content-Disposition: inline
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.71]);
	Wed, 25 Sep 2019 21:02:36 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]);
	Wed, 25 Sep 2019 21:02:36 +0000 (UTC) for IP:'209.85.210.194'
	DOMAIN:'mail-pf1-f194.google.com'
	HELO:'mail-pf1-f194.google.com' FROM:'keescook@chromium.org'
	RCPT:''
X-RedHat-Spam-Score: -0.099  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.210.194 mail-pf1-f194.google.com 209.85.210.194
	mail-pf1-f194.google.com <keescook@chromium.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.71
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
Cc: s.mesoraca16@gmail.com, kernel-hardening@lists.openwall.com,
	linux-kernel@vger.kernel.org, linux-audit@redhat.com,
	=?iso-8859-1?Q?J=E9r=E9mie?= Galarneau <jeremie.galarneau@efficios.com>,
	viro@zeniv.linux.org.uk,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	akpm@linux-foundation.org, torvalds@linux-foundation.org,
	dan.carpenter@oracle.com
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Wed, 25 Sep 2019 21:02:58 +0000 (UTC)

This renames the very specific audit_log_link_denied() to
audit_log_path_denied() and adds the AUDIT_* type as an argument. This
allows for the creation of the new AUDIT_ANOM_CREAT that can be used to
report the fifo/regular file creation restrictions that were introduced
in commit 30aba6656f61 ("namei: allow restricted O_CREAT of FIFOs and
regular files"). Without this change, discovering that the restriction
is enabled can be very challenging:
https://lore.kernel.org/lkml/CA+jJMxvkqjXHy3DnV5MVhFTL2RUhg0WQ-XVFW3ngDQOdk=
Fq0PA@mail.gmail.com

Reported-by: J=E9r=E9mie Galarneau <jeremie.galarneau@efficios.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
This is not a complete fix because reporting was broken in commit
15564ff0a16e ("audit: make ANOM_LINK obey audit_enabled and
audit_dummy_context")
which specifically goes against the intention of these records: they
should _always_ be reported. If auditing isn't enabled, they should be
ratelimited.

Instead of using audit, should this just go back to using
pr_ratelimited()?
---
 fs/namei.c                 |  7 +++++--
 include/linux/audit.h      |  5 +++--
 include/uapi/linux/audit.h |  1 +
 kernel/audit.c             | 11 ++++++-----
 4 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/fs/namei.c b/fs/namei.c
index 671c3c1a3425..0e60f81e1d5a 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -925,7 +925,7 @@ static inline int may_follow_link(struct nameidata *nd)
 		return -ECHILD;
 =

 	audit_inode(nd->name, nd->stack[0].link.dentry, 0);
-	audit_log_link_denied("follow_link");
+	audit_log_path_denied(AUDIT_ANOM_LINK, "follow_link");
 	return -EACCES;
 }
 =

@@ -993,7 +993,7 @@ static int may_linkat(struct path *link)
 	if (safe_hardlink_source(inode) || inode_owner_or_capable(inode))
 		return 0;
 =

-	audit_log_link_denied("linkat");
+	audit_log_path_denied(AUDIT_ANOM_LINK, "linkat");
 	return -EPERM;
 }
 =

@@ -1031,6 +1031,9 @@ static int may_create_in_sticky(struct dentry * const=
 dir,
 	    (dir->d_inode->i_mode & 0020 &&
 	     ((sysctl_protected_fifos >=3D 2 && S_ISFIFO(inode->i_mode)) ||
 	      (sysctl_protected_regular >=3D 2 && S_ISREG(inode->i_mode))))) {
+		audit_log_path_denied(AUDIT_ANOM_CREAT,
+				      S_ISFIFO(inode->i_mode) ? "fifo"
+							      : "regular");
 		return -EACCES;
 	}
 	return 0;
diff --git a/include/linux/audit.h b/include/linux/audit.h
index aee3dc9eb378..b3715e2ee1c5 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -156,7 +156,8 @@ extern void		    audit_log_d_path(struct audit_buffer *=
ab,
 					     const struct path *path);
 extern void		    audit_log_key(struct audit_buffer *ab,
 					  char *key);
-extern void		    audit_log_link_denied(const char *operation);
+extern void		    audit_log_path_denied(int type,
+						  const char *operation);
 extern void		    audit_log_lost(const char *message);
 =

 extern int audit_log_task_context(struct audit_buffer *ab);
@@ -217,7 +218,7 @@ static inline void audit_log_d_path(struct audit_buffer=
 *ab,
 { }
 static inline void audit_log_key(struct audit_buffer *ab, char *key)
 { }
-static inline void audit_log_link_denied(const char *string)
+static inline void audit_log_path_denied(int type, const char *string);
 { }
 static inline int audit_log_task_context(struct audit_buffer *ab)
 {
diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
index c89c6495983d..3ad935527177 100644
--- a/include/uapi/linux/audit.h
+++ b/include/uapi/linux/audit.h
@@ -143,6 +143,7 @@
 #define AUDIT_ANOM_PROMISCUOUS      1700 /* Device changed promiscuous mod=
e */
 #define AUDIT_ANOM_ABEND            1701 /* Process ended abnormally */
 #define AUDIT_ANOM_LINK		    1702 /* Suspicious use of file links */
+#define AUDIT_ANOM_CREAT	    1703 /* Suspicious file creation */
 #define AUDIT_INTEGRITY_DATA	    1800 /* Data integrity verification */
 #define AUDIT_INTEGRITY_METADATA    1801 /* Metadata integrity verificatio=
n */
 #define AUDIT_INTEGRITY_STATUS	    1802 /* Integrity enable status */
diff --git a/kernel/audit.c b/kernel/audit.c
index da8dc0db5bd3..ed7402ac81b6 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -2155,18 +2155,19 @@ void audit_log_task_info(struct audit_buffer *ab)
 EXPORT_SYMBOL(audit_log_task_info);
 =

 /**
- * audit_log_link_denied - report a link restriction denial
- * @operation: specific link operation
+ * audit_log_path_denied - report a path restriction denial
+ * @type: audit message type (AUDIT_ANOM_LINK, AUDIT_ANOM_CREAT, etc)
+ * @operation: specific operation name
  */
-void audit_log_link_denied(const char *operation)
+void audit_log_path_denied(int type, const char *operation)
 {
 	struct audit_buffer *ab;
 =

 	if (!audit_enabled || audit_dummy_context())
 		return;
 =

-	/* Generate AUDIT_ANOM_LINK with subject, operation, outcome. */
-	ab =3D audit_log_start(audit_context(), GFP_KERNEL, AUDIT_ANOM_LINK);
+	/* Generate log with subject, operation, outcome. */
+	ab =3D audit_log_start(audit_context(), GFP_KERNEL, type);
 	if (!ab)
 		return;
 	audit_log_format(ab, "op=3D%s", operation);
-- =

2.17.1


-- =

Kees Cook

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
