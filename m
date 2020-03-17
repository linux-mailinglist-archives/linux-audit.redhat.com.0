Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id CF42C189069
	for <lists+linux-audit@lfdr.de>; Tue, 17 Mar 2020 22:31:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584480710;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:in-reply-to:references:references:references:
	 list-id:list-help:list-unsubscribe:list-subscribe:list-post;
	bh=9wGfNYGrsuu6P7OuByGE6f91yycQRvEoYvbjiKa0sys=;
	b=LdYhDQiSrBpSd5xx/mMTsgEnwO3RBIRxIG64peL66Y97E4dYf0xXCB3cmjNf3kWeUjaQBA
	zWFqSATiJ9sXlPAPthncG18LoXfO1NSNJbxNLNx7QCG10QRMM+/gI0Fv57B7Q6X0yplxvU
	i22SeIl4iXZnZZt9v/jkoa5MYquowLU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-Wy5Ztrw3PJaUO7Df1qxt6A-1; Tue, 17 Mar 2020 17:31:48 -0400
X-MC-Unique: Wy5Ztrw3PJaUO7Df1qxt6A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 124B8800D5E;
	Tue, 17 Mar 2020 21:31:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC3A119C4F;
	Tue, 17 Mar 2020 21:31:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9703C18089CE;
	Tue, 17 Mar 2020 21:31:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02HLVdPW019406 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 17 Mar 2020 17:31:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A2DC719C70; Tue, 17 Mar 2020 21:31:39 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.36.110.5])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D506F19C4F;
	Tue, 17 Mar 2020 21:31:33 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>, netfilter-devel@vger.kernel.org
Subject: [PATCH ghak25 v3 3/3] audit: add subj creds to NETFILTER_CFG record
	to cover async unregister
Date: Tue, 17 Mar 2020 17:30:24 -0400
Message-Id: <13ef49b2f111723106d71c1bdeedae09d9b300d8.1584480281.git.rgb@redhat.com>
In-Reply-To: <cover.1584480281.git.rgb@redhat.com>
References: <cover.1584480281.git.rgb@redhat.com>
In-Reply-To: <cover.1584480281.git.rgb@redhat.com>
References: <cover.1584480281.git.rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, fw@strlen.de, ebiederm@xmission.com,
	twoerner@redhat.com, eparis@parisplace.org, tgraf@infradead.org
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Some table unregister actions seem to be initiated by the kernel to
garbage collect unused tables that are not initiated by any userspace
actions.  It was found to be necessary to add the subject credentials to
cover this case to reveal the source of these actions.  A sample record:

  type=NETFILTER_CFG msg=audit(2020-03-11 21:25:21.491:269) : table=nat family=bridge entries=0 op=unregister pid=153 uid=root auid=unset tty=(none) ses=unset subj=system_u:system_r:kernel_t:s0 comm=kworker/u4:2 exe=(null)

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 kernel/auditsc.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index dbb056feccb9..6c233076dfb7 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -2557,12 +2557,30 @@ void __audit_log_nfcfg(const char *name, u8 af, unsigned int nentries,
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
+	tty = audit_get_tty();
+	audit_log_format(ab, " pid=%u uid=%u auid=%u tty=%s ses=%u",
+			 task_pid_nr(current),
+			 from_kuid(&init_user_ns, cred->uid),
+			 from_kuid(&init_user_ns, audit_get_loginuid(current)),
+			 tty ? tty_name(tty) : "(none)",
+			 audit_get_sessionid(current));
+	audit_put_tty(tty);
+	audit_log_task_context(ab); /* subj= */
+	audit_log_format(ab, " comm=");
+	audit_log_untrustedstring(ab, get_task_comm(comm, current));
+	audit_log_d_path_exe(ab, current->mm); /* exe= */
+
 	audit_log_end(ab);
 }
 EXPORT_SYMBOL_GPL(__audit_log_nfcfg);
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

