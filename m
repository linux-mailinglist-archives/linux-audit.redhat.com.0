Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C2631C3BC4
	for <lists+linux-audit@lfdr.de>; Tue,  1 Oct 2019 18:49:13 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3D44A18C4288;
	Tue,  1 Oct 2019 16:49:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 417D15C224;
	Tue,  1 Oct 2019 16:49:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D75F94EE69;
	Tue,  1 Oct 2019 16:49:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x91Gmq0j005779 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 1 Oct 2019 12:48:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 13CE52632E; Tue,  1 Oct 2019 16:48:52 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx23.extmail.prod.ext.phx2.redhat.com
	[10.5.110.64])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E1582632F
	for <linux-audit@redhat.com>; Tue,  1 Oct 2019 16:48:48 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 77D26105787F
	for <linux-audit@redhat.com>; Tue,  1 Oct 2019 16:48:47 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id q5so8392860pfg.13
	for <linux-audit@redhat.com>; Tue, 01 Oct 2019 09:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:mime-version:content-disposition; 
	bh=20rYn1QbDb7O1Jy/WEQnWDY4kyWThv4W3UDnp8d9vY0=;
	b=incc1FUxNcuHOGOSdHcLUvYZ+S9DvRryel7pL2XWNa0CD0Rh/KNc8lcVsA5KIAMO4t
	bA+Tmct/udrc4HNV2LqKjNIhg9aJ4k+p/2Wm6+Dz/JEQYhHmuYCTv+51hclaJoKsi84v
	ZBQ9Fxz5MkV9S48MZoVRuyZwJ8B3m3Jq1xWWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-disposition;
	bh=20rYn1QbDb7O1Jy/WEQnWDY4kyWThv4W3UDnp8d9vY0=;
	b=ekCRnRygjnU6vQFd1+uDRFNNoa5t5+t+XdpAWMMr50rX7DxeB1Nquz2Wlm9PA+hBz8
	XiwSTm9kxn0QW+Hw+QT22x5tYXF6KFvPkqLjjGNjgS/kjAzKYwbcJ9acKsdbgdlKGDSK
	tCRZR78jkfr/DGjO/hdnCVjJV4bUIccuzrWaj6TKTgVFq71aChrjKa812AXwBFgGxp4x
	/+1v0ZOBN+Jm+K1d1L4opptrJj6Zb9Nprd6/30RYnJi/CuxFDOMNYc5uU4VwskxRPdzT
	LhJ+UP+NaENJDz3oGUZhsQ9HaNKLWWqXEPFqIDBt/lI+NRysKrFydryCy/+aZEHOHq7S
	ADhA==
X-Gm-Message-State: APjAAAUKHG91OpVAvH3WrdJ3o2ZXD90v/1gPGtVEIas68Xw/k7JpSg67
	hf0X7QY9NLP4k0QIGmWYMHiEqA==
X-Google-Smtp-Source: APXvYqyQdM54m8I3epULb9G/NnqJjXeZcpNK3uSgKyfYIzayyiRPCSEbx2BiWIr88Kk9uq04ooueQw==
X-Received: by 2002:a63:6b49:: with SMTP id g70mr29953089pgc.92.1569948526763; 
	Tue, 01 Oct 2019 09:48:46 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	q204sm17704948pfc.11.2019.10.01.09.48.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 01 Oct 2019 09:48:45 -0700 (PDT)
Date: Tue, 1 Oct 2019 09:48:44 -0700
From: Kees Cook <keescook@chromium.org>
To: Paul Moore <paul@paul-moore.com>
Subject: [PATCH v2] audit: Report suspicious O_CREAT usage
Message-ID: <201910010945.CAABF57@keescook>
MIME-Version: 1.0
Content-Disposition: inline
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.64]);
	Tue, 01 Oct 2019 16:48:47 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]);
	Tue, 01 Oct 2019 16:48:47 +0000 (UTC) for IP:'209.85.210.195'
	DOMAIN:'mail-pf1-f195.google.com'
	HELO:'mail-pf1-f195.google.com' FROM:'keescook@chromium.org'
	RCPT:''
X-RedHat-Spam-Score: -0.102  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.210.195 mail-pf1-f195.google.com 209.85.210.195
	mail-pf1-f195.google.com <keescook@chromium.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.64
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
Cc: s.mesoraca16@gmail.com, kernel-hardening@lists.openwall.com,
	linux-kernel@vger.kernel.org, linux-audit@redhat.com,
	=?iso-8859-1?Q?J=E9r=E9mie?= Galarneau <jeremie.galarneau@efficios.com>,
	viro@zeniv.linux.org.uk,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	akpm@linux-foundation.org, Linus Torvalds <torvalds@linux-foundation.org>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.62]); Tue, 01 Oct 2019 16:49:12 +0000 (UTC)

This renames the very specific audit_log_link_denied() to
audit_log_path_denied() and adds the AUDIT_* type as an argument. This
allows for the creation of the new AUDIT_ANOM_CREAT that can be used to
report the fifo/regular file creation restrictions that were introduced
in commit 30aba6656f61 ("namei: allow restricted O_CREAT of FIFOs and
regular files"). Additionally further clarifies the existing
"operations" strings.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
v2:
 - fix build failure typo in CONFIG_AUDIT=n case
 - improve operations naming (paul)
---
 fs/namei.c                 |  8 ++++++--
 include/linux/audit.h      |  5 +++--
 include/uapi/linux/audit.h |  1 +
 kernel/audit.c             | 11 ++++++-----
 4 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/fs/namei.c b/fs/namei.c
index 671c3c1a3425..2d5d245ae723 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -925,7 +925,7 @@ static inline int may_follow_link(struct nameidata *nd)
 		return -ECHILD;
 
 	audit_inode(nd->name, nd->stack[0].link.dentry, 0);
-	audit_log_link_denied("follow_link");
+	audit_log_path_denied(AUDIT_ANOM_LINK, "sticky_follow_link");
 	return -EACCES;
 }
 
@@ -993,7 +993,7 @@ static int may_linkat(struct path *link)
 	if (safe_hardlink_source(inode) || inode_owner_or_capable(inode))
 		return 0;
 
-	audit_log_link_denied("linkat");
+	audit_log_path_denied(AUDIT_ANOM_LINK, "unowned_linkat");
 	return -EPERM;
 }
 
@@ -1031,6 +1031,10 @@ static int may_create_in_sticky(struct dentry * const dir,
 	    (dir->d_inode->i_mode & 0020 &&
 	     ((sysctl_protected_fifos >= 2 && S_ISFIFO(inode->i_mode)) ||
 	      (sysctl_protected_regular >= 2 && S_ISREG(inode->i_mode))))) {
+		const char *operation = S_ISFIFO(inode->i_mode) ?
+					"sticky_create_fifo" :
+					"sticky_create_regular";
+		audit_log_path_denied(AUDIT_ANOM_CREAT, operation);
 		return -EACCES;
 	}
 	return 0;
diff --git a/include/linux/audit.h b/include/linux/audit.h
index aee3dc9eb378..f9ceae57ca8d 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -156,7 +156,8 @@ extern void		    audit_log_d_path(struct audit_buffer *ab,
 					     const struct path *path);
 extern void		    audit_log_key(struct audit_buffer *ab,
 					  char *key);
-extern void		    audit_log_link_denied(const char *operation);
+extern void		    audit_log_path_denied(int type,
+						  const char *operation);
 extern void		    audit_log_lost(const char *message);
 
 extern int audit_log_task_context(struct audit_buffer *ab);
@@ -217,7 +218,7 @@ static inline void audit_log_d_path(struct audit_buffer *ab,
 { }
 static inline void audit_log_key(struct audit_buffer *ab, char *key)
 { }
-static inline void audit_log_link_denied(const char *string)
+static inline void audit_log_path_denied(int type, const char *operation)
 { }
 static inline int audit_log_task_context(struct audit_buffer *ab)
 {
diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
index c89c6495983d..3ad935527177 100644
--- a/include/uapi/linux/audit.h
+++ b/include/uapi/linux/audit.h
@@ -143,6 +143,7 @@
 #define AUDIT_ANOM_PROMISCUOUS      1700 /* Device changed promiscuous mode */
 #define AUDIT_ANOM_ABEND            1701 /* Process ended abnormally */
 #define AUDIT_ANOM_LINK		    1702 /* Suspicious use of file links */
+#define AUDIT_ANOM_CREAT	    1703 /* Suspicious file creation */
 #define AUDIT_INTEGRITY_DATA	    1800 /* Data integrity verification */
 #define AUDIT_INTEGRITY_METADATA    1801 /* Metadata integrity verification */
 #define AUDIT_INTEGRITY_STATUS	    1802 /* Integrity enable status */
diff --git a/kernel/audit.c b/kernel/audit.c
index da8dc0db5bd3..d75485aa25ff 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -2155,18 +2155,19 @@ void audit_log_task_info(struct audit_buffer *ab)
 EXPORT_SYMBOL(audit_log_task_info);
 
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
 
 	if (!audit_enabled || audit_dummy_context())
 		return;
 
-	/* Generate AUDIT_ANOM_LINK with subject, operation, outcome. */
-	ab = audit_log_start(audit_context(), GFP_KERNEL, AUDIT_ANOM_LINK);
+	/* Generate log with subject, operation, outcome. */
+	ab = audit_log_start(audit_context(), GFP_KERNEL, type);
 	if (!ab)
 		return;
 	audit_log_format(ab, "op=%s", operation);
-- 
2.17.1


-- 
Kees Cook

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
