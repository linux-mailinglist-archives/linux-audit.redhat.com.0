Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F1844B0C
	for <lists+linux-audit@lfdr.de>; Thu, 13 Jun 2019 20:46:56 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9C6B9A705;
	Thu, 13 Jun 2019 18:45:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2279E5C28C;
	Thu, 13 Jun 2019 18:45:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 328891806B16;
	Thu, 13 Jun 2019 18:45:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5DIhrcH029934 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 13 Jun 2019 14:43:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 021FF2AA88; Thu, 13 Jun 2019 18:43:53 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-16.phx2.redhat.com [10.3.112.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 929FE2B465;
	Thu, 13 Jun 2019 18:43:46 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>, SElinux list <selinux@vger.kernel.org>
Subject: [PATCH ghak57 V1] selinux: format all invalid context as untrusted
Date: Thu, 13 Jun 2019 14:43:21 -0400
Message-Id: <53af233d05da5e07d75d122878387288a10276df.1560447640.git.rgb@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Thu, 13 Jun 2019 18:46:50 +0000 (UTC)

All instances of one field type should be encoded in the same way.
Since some invalid_context fields can contain untrusted strings, encode
all instances of this field the same way.

Please see github issue
https://github.com/linux-audit/audit-kernel/issues/57

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
Passes audit-testsuite.

 security/selinux/ss/services.c | 48 +++++++++++++++++++++++++++++++++---------
 1 file changed, 38 insertions(+), 10 deletions(-)

diff --git a/security/selinux/ss/services.c b/security/selinux/ss/services.c
index cc043bc8fd4c..817576802f7d 100644
--- a/security/selinux/ss/services.c
+++ b/security/selinux/ss/services.c
@@ -1588,6 +1588,8 @@ static int compute_sid_handle_invalid_context(
 	struct policydb *policydb = &state->ss->policydb;
 	char *s = NULL, *t = NULL, *n = NULL;
 	u32 slen, tlen, nlen;
+	struct audit_buffer *ab;
+	size_t audit_size;
 
 	if (context_struct_to_string(policydb, scontext, &s, &slen))
 		goto out;
@@ -1595,12 +1597,22 @@ static int compute_sid_handle_invalid_context(
 		goto out;
 	if (context_struct_to_string(policydb, newcontext, &n, &nlen))
 		goto out;
-	audit_log(audit_context(), GFP_ATOMIC, AUDIT_SELINUX_ERR,
-		  "op=security_compute_sid invalid_context=%s"
-		  " scontext=%s"
-		  " tcontext=%s"
-		  " tclass=%s",
-		  n, s, t, sym_name(policydb, SYM_CLASSES, tclass-1));
+	/* We strip a nul only if it is at the end, otherwise the
+	 * context contains a nul and we should audit that */
+	if (n) {
+		if (n[nlen - 1] == '\0')
+			audit_size = nlen - 1;
+		else
+			audit_size = nlen;
+	} else {
+		audit_size = 0;
+	}
+	ab = audit_log_start(audit_context(), GFP_ATOMIC, AUDIT_SELINUX_ERR);
+	audit_log_format(ab, "op=security_compute_sid invalid_context=");
+	audit_log_n_untrustedstring(ab, n, audit_size);
+	audit_log_format(ab, " scontext=%s tcontext=%s tclass=%s",
+		  	 s, t, sym_name(policydb, SYM_CLASSES, tclass-1));
+	audit_log_end(ab);
 out:
 	kfree(s);
 	kfree(t);
@@ -3007,10 +3019,26 @@ int security_sid_mls_copy(struct selinux_state *state,
 		if (rc) {
 			if (!context_struct_to_string(policydb, &newcon, &s,
 						      &len)) {
-				audit_log(audit_context(),
-					  GFP_ATOMIC, AUDIT_SELINUX_ERR,
-					  "op=security_sid_mls_copy "
-					  "invalid_context=%s", s);
+				struct audit_buffer *ab;
+				size_t audit_size;
+
+				/* We strip a nul only if it is at the
+				 * end, otherwise the context contains a
+				 * nul and we should audit that */
+				if (s) {
+					if (s[len - 1] == '\0')
+						audit_size = len - 1;
+					else
+						audit_size = len;
+				} else {
+					audit_size = 0;
+				}
+				ab = audit_log_start(audit_context(),
+						     GFP_ATOMIC,
+						     AUDIT_SELINUX_ERR);
+				audit_log_format(ab, "op=security_sid_mls_copy invalid_context=");
+				audit_log_n_untrustedstring(ab, s, audit_size);
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
