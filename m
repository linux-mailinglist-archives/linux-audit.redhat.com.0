Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 88B0C1DBA3E
	for <lists+linux-audit@lfdr.de>; Wed, 20 May 2020 18:52:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589993556;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XVqyFE7j+g8FOMV4QAoqic9tje2ohdH2KcjIbIfXM+0=;
	b=gkjmul7ypNSzipCSjtc9l2BMqbbaY8NheBPnN22bGTvrAlIvbs/9GmBMl1Zcs3ebb9uOCg
	SjRPsriiBJrfDyaIv9CBaBwvQZI6R3eusn7pIaS+mEEj/3R5TvY2Kf7dlCWOtnpFEBUwgu
	YVMi0lpdZF11b3wGEzn+Da3R3CsaYyg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-hYWhLYcyPSa-lpDpzlhrBA-1; Wed, 20 May 2020 12:52:34 -0400
X-MC-Unique: hYWhLYcyPSa-lpDpzlhrBA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94CA780183C;
	Wed, 20 May 2020 16:52:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 407535C1BE;
	Wed, 20 May 2020 16:52:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B9D4F4EDBE;
	Wed, 20 May 2020 16:52:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04KGq5KF014702 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 20 May 2020 12:52:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4CAD160C84; Wed, 20 May 2020 16:52:05 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 31E3B60BEC;
	Wed, 20 May 2020 16:51:56 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>, netfilter-devel@vger.kernel.org
Subject: [PATCH ghak25 v6] audit: add subj creds to NETFILTER_CFG record to
	cover async unregister
Date: Wed, 20 May 2020 12:51:32 -0400
Message-Id: <a585b9933896bc542347d8f3f26b08005344dd84.1589920939.git.rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, fw@strlen.de, twoerner@redhat.com,
	eparis@parisplace.org, tgraf@infradead.org
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Some table unregister actions seem to be initiated by the kernel to
garbage collect unused tables that are not initiated by any userspace
actions.  It was found to be necessary to add the subject credentials to
cover this case to reveal the source of these actions.  A sample record:

The uid, auid, tty, ses and exe fields have not been included since they
are in the SYSCALL record and contain nothing useful in the non-user
context.

  type=NETFILTER_CFG msg=audit(2020-03-11 21:25:21.491:269) : table=nat family=bridge entries=0 op=unregister pid=153 subj=system_u:system_r:kernel_t:s0 comm=kworker/u4:2

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
Changelog:
v6
- remove uid, auid fields as duplicates or unset

v5
- rebase on upstreamed ghak28 on audit/next v5.7-rc1
- remove tty, ses and exe fields as duplicates or unset
- drop upstreamed patches 1&2 from set

v4
- rebase on audit/next v5.7-rc1
- fix checkpatch.pl errors/warnings in 1/3 and 2/3

v3
- rebase on v5.6-rc1 audit/next
- change audit_nf_cfg to audit_log_nfcfg
- squash 2,3,4,5 to 1 and update patch descriptions
- add subject credentials to cover garbage collecting kernel threads

v2
- Rebase (audit/next 5.5-rc1) to get audit_context access and ebt_register_table ret code
- Split x_tables and ebtables updates
- Check audit_dummy_context
- Store struct audit_nfcfg params in audit_context, abstract to audit_nf_cfg() call
- Restore back to "table, family, entries" from "family, table, entries"
- Log unregistration of tables
- Add "op=" at the end of the AUDIT_NETFILTER_CFG record
- Defer nsid patch (ghak79) to once nsid patchset upstreamed (ghak32)
- Add ghak refs
- Ditch NETFILTER_CFGSOLO record

 kernel/auditsc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index cfe3486e5f31..e646055adb0b 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -2557,12 +2557,21 @@ void __audit_log_nfcfg(const char *name, u8 af, unsigned int nentries,
 		       enum audit_nfcfgop op)
 {
 	struct audit_buffer *ab;
+	const struct cred *cred;
+	struct tty_struct *tty;
+	char comm[sizeof(current->comm)];
 
 	ab = audit_log_start(audit_context(), GFP_KERNEL, AUDIT_NETFILTER_CFG);
 	if (!ab)
 		return;
 	audit_log_format(ab, "table=%s family=%u entries=%u op=%s",
 			 name, af, nentries, audit_nfcfgs[op].s);
+
+	cred = current_cred();
+	audit_log_format(ab, " pid=%u", task_pid_nr(current));
+	audit_log_task_context(ab); /* subj= */
+	audit_log_format(ab, " comm=");
+	audit_log_untrustedstring(ab, get_task_comm(comm, current));
 	audit_log_end(ab);
 }
 EXPORT_SYMBOL_GPL(__audit_log_nfcfg);
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

