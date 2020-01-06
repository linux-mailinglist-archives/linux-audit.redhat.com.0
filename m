Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id AE5331317D8
	for <lists+linux-audit@lfdr.de>; Mon,  6 Jan 2020 19:55:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578336953;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:in-reply-to:references:references:references:
	 list-id:list-help:list-unsubscribe:list-subscribe:list-post;
	bh=mz2KuoblKgi/yUz7BQ9fUtJcW03m6bDq9vIeMeRZjrw=;
	b=Prtrbm4u48j1tALwjFuYnrKpVkThZoUwB5T9DkzMemM1/p6isjh5VeScZrm5rBis5MP7Y8
	CFokHv4w63ri+5hzPsHx6TMxHpN9IzC3bJYLcx758BZiYxJtcPzDicdj+j5HXI69yKqI0R
	McKBy9xJGsAZ8v+CeIho2MXTWiWV+Uo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-f6D66IFGM0a-gpWtoAX-Cw-1; Mon, 06 Jan 2020 13:55:51 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E56018B645B;
	Mon,  6 Jan 2020 18:55:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 212167C34F;
	Mon,  6 Jan 2020 18:55:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8404181C76;
	Mon,  6 Jan 2020 18:55:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 006Itgjp027100 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 6 Jan 2020 13:55:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2A8DF5DDB1; Mon,  6 Jan 2020 18:55:42 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-34.phx2.redhat.com [10.3.112.34])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 42DB25D9D6;
	Mon,  6 Jan 2020 18:55:24 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>, netfilter-devel@vger.kernel.org
Subject: [PATCH ghak25 v2 5/9] netfilter: x_tables audit only on syscall rule
Date: Mon,  6 Jan 2020 13:54:06 -0500
Message-Id: <48636daf8850e06a4d33e99a8a9ad534d2f525d8.1577830902.git.rgb@redhat.com>
In-Reply-To: <cover.1577830902.git.rgb@redhat.com>
References: <cover.1577830902.git.rgb@redhat.com>
In-Reply-To: <cover.1577830902.git.rgb@redhat.com>
References: <cover.1577830902.git.rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: f6D66IFGM0a-gpWtoAX-Cw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Call new audit_nf_cfg() to store table parameters for later use with
syscall records.

See: https://github.com/linux-audit/audit-kernel/issues/25
See: https://github.com/linux-audit/audit-kernel/issues/35
Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 net/netfilter/x_tables.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/net/netfilter/x_tables.c b/net/netfilter/x_tables.c
index 0094853ab42a..c0416ae52f7f 100644
--- a/net/netfilter/x_tables.c
+++ b/net/netfilter/x_tables.c
@@ -1401,14 +1401,8 @@ struct xt_table_info *xt_replace_table(struct xt_table *table,
 		}
 	}
 
-#ifdef CONFIG_AUDIT
-	if (audit_enabled) {
-		audit_log(audit_context(), GFP_KERNEL,
-			  AUDIT_NETFILTER_CFG,
-			  "table=%s family=%u entries=%u",
-			  table->name, table->af, private->number);
-	}
-#endif
+	if (audit_enabled)
+		audit_nf_cfg(table->name, table->af, private->number);
 
 	return private;
 }
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

