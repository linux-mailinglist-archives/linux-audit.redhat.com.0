Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 230BB20C2AF
	for <lists+linux-audit@lfdr.de>; Sat, 27 Jun 2020 17:19:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593271178;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zAqmMx3s8azuUboSDCh7g7MKcSvYoAujvkw0WZsBlQo=;
	b=Njd3mV+vLWquJKJE2R9h8M6+MStghfw8DtWAIRMhtDpYmj8TqLMCsWYI8qZ/E60ilPyP3E
	P+zQ4ZCju2dCOYfZMb98a8LG3wpqEFKkG97sqz4q9AM1IJ+/t0PeVE38hUivuBtTf4GYCn
	OJ0ELq5XcoLtLTEBI/0pdkxqvMRko3o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-SjOv-WY4PNuVw5WGdHKnHg-1; Sat, 27 Jun 2020 11:19:30 -0400
X-MC-Unique: SjOv-WY4PNuVw5WGdHKnHg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B61FB8015FE;
	Sat, 27 Jun 2020 15:19:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9702F60C05;
	Sat, 27 Jun 2020 15:19:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6D22F87599;
	Sat, 27 Jun 2020 15:19:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05RFIoqA019173 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 27 Jun 2020 11:18:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8B35661984; Sat, 27 Jun 2020 15:18:50 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CD33F60BF4;
	Sat, 27 Jun 2020 15:18:47 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: containers@lists.linux-foundation.org,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH ghau51/ghau40 v9 02/11] AUDIT_CONTAINER_ID message type basic
	support
Date: Sat, 27 Jun 2020 11:18:02 -0400
Message-Id: <1593271091-30188-3-git-send-email-rgb@redhat.com>
In-Reply-To: <1593271091-30188-1-git-send-email-rgb@redhat.com>
References: <1593271091-30188-1-git-send-email-rgb@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This defines the message number for the audit container identifier
information record should the kernel headers not be up to date and gives
the record number a name for printing.

See: https://github.com/linux-audit/audit-userspace/issues/51
See: https://github.com/linux-audit/audit-kernel/issues/90
See: https://github.com/linux-audit/audit-testsuite/issues/64
See: https://github.com/linux-audit/audit-kernel/wiki/RFE-Audit-Container-ID
Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 lib/libaudit.h    | 4 ++++
 lib/msg_typetab.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/lib/libaudit.h b/lib/libaudit.h
index da7c61cc2e6d..9c2f6d4248b0 100644
--- a/lib/libaudit.h
+++ b/lib/libaudit.h
@@ -302,6 +302,10 @@ extern "C" {
 #define AUDIT_EVENT_LISTENER		1335 /* audit mcast sock join/part */
 #endif
 
+#ifndef AUDIT_CONTAINER_ID
+#define AUDIT_CONTAINER_ID	1336 /* Container ID */
+#endif
+
 #ifndef AUDIT_MAC_CALIPSO_ADD
 #define AUDIT_MAC_CALIPSO_ADD	1418 /* NetLabel: add CALIPSO DOI entry */
 #endif
diff --git a/lib/msg_typetab.h b/lib/msg_typetab.h
index 881f440c9d32..7490939c39a2 100644
--- a/lib/msg_typetab.h
+++ b/lib/msg_typetab.h
@@ -128,6 +128,7 @@ _S(AUDIT_TIME_INJOFFSET,             "TIME_INJOFFSET"                )
 _S(AUDIT_TIME_ADJNTPVAL,             "TIME_ADJNTPVAL"                )
 _S(AUDIT_BPF,                        "BPF"                           )
 _S(AUDIT_EVENT_LISTENER,             "EVENT_LISTENER"                )
+_S(AUDIT_CONTAINER_ID,               "CONTAINER_ID"                  )
 _S(AUDIT_AVC,                        "AVC"                           )
 _S(AUDIT_SELINUX_ERR,                "SELINUX_ERR"                   )
 _S(AUDIT_AVC_PATH,                   "AVC_PATH"                      )
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

