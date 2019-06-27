Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D962587A2
	for <lists+linux-audit@lfdr.de>; Thu, 27 Jun 2019 18:51:30 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 72A29309264F;
	Thu, 27 Jun 2019 16:50:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FB766013A;
	Thu, 27 Jun 2019 16:50:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 403CD206D2;
	Thu, 27 Jun 2019 16:49:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5RGmf7L030259 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 27 Jun 2019 12:48:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3C06119723; Thu, 27 Jun 2019 16:48:41 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-14.phx2.redhat.com [10.3.112.14])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CE67019C4F;
	Thu, 27 Jun 2019 16:48:34 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>, SElinux list <selinux@vger.kernel.org>
Subject: [PATCH ghak57 V2] selinux: format all invalid context as untrusted
Date: Thu, 27 Jun 2019 12:48:01 -0400
Message-Id: <20b1e7b386ba06f013e5e4206cca1bb487d90a68.1561640731.git.rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Thu, 27 Jun 2019 16:51:29 +0000 (UTC)

The userspace tools expect all fields of the same name to be logged
consistently with the same encoding.  Since the invalid_context fields
contain untrusted strings in selinux_inode_setxattr()
and selinux_setprocattr(), encode all instances of this field the same
way as though they were untrusted even though
compute_sid_handle_invalid_context() and security_sid_mls_copy() are
trusted.

Please see github issue
https://github.com/linux-audit/audit-kernel/issues/57

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 security/selinux/ss/services.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/security/selinux/ss/services.c b/security/selinux/ss/services.c
index cc043bc8fd4c..a1c89ac22f1d 100644
--- a/security/selinux/ss/services.c
+++ b/security/selinux/ss/services.c
@@ -1588,6 +1588,7 @@ static int compute_sid_handle_invalid_context(
 	struct policydb *policydb = &state->ss->policydb;
 	char *s = NULL, *t = NULL, *n = NULL;
 	u32 slen, tlen, nlen;
+	struct audit_buffer *ab;
 
 	if (context_struct_to_string(policydb, scontext, &s, &slen))
 		goto out;
@@ -1595,12 +1596,14 @@ static int compute_sid_handle_invalid_context(
 		goto out;
 	if (context_struct_to_string(policydb, newcontext, &n, &nlen))
 		goto out;
-	audit_log(audit_context(), GFP_ATOMIC, AUDIT_SELINUX_ERR,
-		  "op=security_compute_sid invalid_context=%s"
-		  " scontext=%s"
-		  " tcontext=%s"
-		  " tclass=%s",
-		  n, s, t, sym_name(policydb, SYM_CLASSES, tclass-1));
+	ab = audit_log_start(audit_context(), GFP_ATOMIC, AUDIT_SELINUX_ERR);
+	audit_log_format(ab,
+			 "op=security_compute_sid invalid_context=");
+	/* no need to record the NUL with untrusted strings */
+	audit_log_n_untrustedstring(ab, n, nlen - 1);
+	audit_log_format(ab, " scontext=%s tcontext=%s tclass=%s",
+			 s, t, sym_name(policydb, SYM_CLASSES, tclass-1));
+	audit_log_end(ab);
 out:
 	kfree(s);
 	kfree(t);
@@ -3007,10 +3010,16 @@ int security_sid_mls_copy(struct selinux_state *state,
 		if (rc) {
 			if (!context_struct_to_string(policydb, &newcon, &s,
 						      &len)) {
-				audit_log(audit_context(),
-					  GFP_ATOMIC, AUDIT_SELINUX_ERR,
-					  "op=security_sid_mls_copy "
-					  "invalid_context=%s", s);
+				struct audit_buffer *ab;
+
+				ab = audit_log_start(audit_context(),
+						     GFP_ATOMIC,
+						     AUDIT_SELINUX_ERR);
+				audit_log_format(ab,
+						 "op=security_sid_mls_copy invalid_context=");
+				/* don't record NUL with untrusted strings */
+				audit_log_n_untrustedstring(ab, s, len - 1);
+				audit_log_end(ab);
 				kfree(s);
 			}
 			goto out_unlock;
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
