Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 984E012DBB2
	for <lists+linux-audit@lfdr.de>; Tue, 31 Dec 2019 20:59:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1577822373;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4YCJOSA9zb13p6fx1X4cRklBPwiOXHhtoGpR7cB8/u0=;
	b=GkPiE6qTLSOgHmizld7E1CwZ7vH8CKmFM+IcWBneGAqFTXlEMIMNhzoS+8TYnd3kXIMHth
	WOw1QztB8jckWHexEMnsvE66aBGthBEsVZLFZxeDX6QGpmCEr/PFS7xCNknYg1DD9Di0Iy
	jazjszw4FMYiQjCOfTXMRw4np9BZ/EE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-Mvrv2bTYMLqzkcl6z5JeoA-1; Tue, 31 Dec 2019 14:59:31 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E7CC800D54;
	Tue, 31 Dec 2019 19:59:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AB7263742;
	Tue, 31 Dec 2019 19:59:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2813C819C9;
	Tue, 31 Dec 2019 19:59:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBVJxIBs000429 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 31 Dec 2019 14:59:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D0F7160FC4; Tue, 31 Dec 2019 19:59:18 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-15.phx2.redhat.com [10.3.112.15])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2795860BEC;
	Tue, 31 Dec 2019 19:59:15 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: containers@lists.linux-foundation.org,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH ghau51/ghau40 v8 05/14] start normalization containerid support
Date: Tue, 31 Dec 2019 14:58:12 -0500
Message-Id: <1577822301-19760-6-git-send-email-rgb@redhat.com>
In-Reply-To: <1577822301-19760-1-git-send-email-rgb@redhat.com>
References: <1577822301-19760-1-git-send-email-rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
Cc: nhorman@redhat.com, Richard Guy Briggs <rgb@redhat.com>,
	eparis@parisplace.org, mpatel@redhat.com
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
X-MC-Unique: Mvrv2bTYMLqzkcl6z5JeoA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 auparse/auparse-defs.h           |  3 ++-
 auparse/interpret.c              | 10 ++++++++++
 auparse/normalize_record_map.h   |  2 ++
 auparse/typetab.h                |  2 ++
 bindings/python/auparse_python.c |  1 +
 5 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/auparse/auparse-defs.h b/auparse/auparse-defs.h
index 27bfa943612c..a9b144df3462 100644
--- a/auparse/auparse-defs.h
+++ b/auparse/auparse-defs.h
@@ -87,7 +87,8 @@ typedef enum {  AUPARSE_TYPE_UNCLASSIFIED,  AUPARSE_TYPE_UID, AUPARSE_TYPE_GID,
 	AUPARSE_TYPE_PROCTITLE, AUPARSE_TYPE_HOOK,
 	AUPARSE_TYPE_NETACTION, AUPARSE_TYPE_MACPROTO,
 	AUPARSE_TYPE_IOCTL_REQ, AUPARSE_TYPE_ESCAPED_KEY,
-	AUPARSE_TYPE_ESCAPED_FILE, AUPARSE_TYPE_FANOTIFY } auparse_type_t;
+	AUPARSE_TYPE_ESCAPED_FILE, AUPARSE_TYPE_FANOTIFY, AUPARSE_TYPE_CONTID
+} auparse_type_t;
 
 /* This type determines what escaping if any gets applied to interpreted fields */
 typedef enum { AUPARSE_ESC_RAW, AUPARSE_ESC_TTY, AUPARSE_ESC_SHELL,
diff --git a/auparse/interpret.c b/auparse/interpret.c
index 42014ee4ddea..e251384136bc 100644
--- a/auparse/interpret.c
+++ b/auparse/interpret.c
@@ -2842,6 +2842,13 @@ static const char *print_seccomp_code(const char *val)
 	return out;
 }
 
+static const char *print_contid(const char *val)
+{
+	if (strcmp(val, "18446744073709551615") == 0)
+		return strdup("unset");
+	return strdup(val);
+}
+
 int lookup_type(const char *name)
 {
 	int i;
@@ -3082,6 +3089,9 @@ unknown:
 		case AUPARSE_TYPE_FANOTIFY:
 			out = print_fanotify(id->val);
 			break;
+		case AUPARSE_TYPE_CONTID:
+			out = print_contid(id->val);
+			break;
 		case AUPARSE_TYPE_MAC_LABEL:
 		case AUPARSE_TYPE_UNCLASSIFIED:
 		default:
diff --git a/auparse/normalize_record_map.h b/auparse/normalize_record_map.h
index fee778e76db7..7332249c7b34 100644
--- a/auparse/normalize_record_map.h
+++ b/auparse/normalize_record_map.h
@@ -25,6 +25,7 @@
 
 _S(AUDIT_USER, "sent-message")
 _S(AUDIT_LOGIN, "changed-login-id-to")
+_S(AUDIT_CONTAINER_OP, "changed-container-id-to")
 _S(AUDIT_USER_AUTH, "authenticated")
 _S(AUDIT_USER_ACCT, "was-authorized")
 _S(AUDIT_USER_MGMT, "modified-user-account")
@@ -84,6 +85,7 @@ _S(AUDIT_FEATURE_CHANGE, "changed-audit-feature")
 //_S(AUDIT_REPLACE,"")
 _S(AUDIT_KERN_MODULE, "loaded-kernel-module")
 _S(AUDIT_FANOTIFY, "accessed-policy-controlled-file")
+_S(AUDIT_CONTAINER_ID, "has-container-id")
 _S(AUDIT_AVC, "accessed-mac-policy-controlled-object")
 _S(AUDIT_MAC_POLICY_LOAD, "loaded-selinux-policy")
 _S(AUDIT_MAC_STATUS, "changed-selinux-enforcement-to")
diff --git a/auparse/typetab.h b/auparse/typetab.h
index 0391e87f731c..0c160bb56c3b 100644
--- a/auparse/typetab.h
+++ b/auparse/typetab.h
@@ -142,3 +142,5 @@ _S(AUPARSE_TYPE_IOCTL_REQ,	"ioctlcmd"	)
 _S(AUPARSE_TYPE_FANOTIFY,	"resp"		)
 _S(AUPARSE_TYPE_ESCAPED,	"sw"		)
 _S(AUPARSE_TYPE_ESCAPED,	"root_dir"	)
+_S(AUPARSE_TYPE_CONTID,		"contid"	)
+_S(AUPARSE_TYPE_CONTID,		"old-contid"	)
diff --git a/bindings/python/auparse_python.c b/bindings/python/auparse_python.c
index f262305b6a46..f55b08ad6324 100644
--- a/bindings/python/auparse_python.c
+++ b/bindings/python/auparse_python.c
@@ -2391,6 +2391,7 @@ initauparse(void)
     PyModule_AddIntConstant(m, "AUPARSE_ESC_TTY", AUPARSE_ESC_TTY);
     PyModule_AddIntConstant(m, "AUPARSE_ESC_SHELL", AUPARSE_ESC_SHELL);
     PyModule_AddIntConstant(m, "AUPARSE_ESC_SHELL_QUOTE", AUPARSE_ESC_SHELL_QUOTE);
+    PyModule_AddIntConstant(m, "AUPARSE_TYPE_CONTID", AUPARSE_TYPE_CONTID);
 
 #ifdef IS_PY3K
     return m;
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

