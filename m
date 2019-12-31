Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0513912DBB7
	for <lists+linux-audit@lfdr.de>; Tue, 31 Dec 2019 20:59:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1577822385;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6u2uTAbPTeMYQZTzI8OOk+moEMqtKL4LZ9U/UorfIcs=;
	b=GDwjXOCikb4CSNuQQ+sd7yj+984pGe2XH6+XZwGILUcw5g7dSSGno1dN9NnApBJKDJrIiN
	n5Nh1ldr7JMOhfAGDyZqkn8+64+qHbM2zLzxvh/L0tCEifCLk3BrHHNeRfuJJn4S7xxKfx
	Ejcj+u/kqoLIADBui8EAOB0R5jL4eZE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-1f1o2bgyMme4CRnwLaEiWg-1; Tue, 31 Dec 2019 14:59:43 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A09E11005502;
	Tue, 31 Dec 2019 19:59:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F8FE1081333;
	Tue, 31 Dec 2019 19:59:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3FF2E18089CE;
	Tue, 31 Dec 2019 19:59:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBVJxZcF000537 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 31 Dec 2019 14:59:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 98E4960FC5; Tue, 31 Dec 2019 19:59:35 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-15.phx2.redhat.com [10.3.112.15])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 584E460BEC;
	Tue, 31 Dec 2019 19:59:28 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: containers@lists.linux-foundation.org,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH ghau51/ghau40 v8 09/14] contid: interpret correctly
	CONTAINER_ID contid field csv
Date: Tue, 31 Dec 2019 14:58:16 -0500
Message-Id: <1577822301-19760-10-git-send-email-rgb@redhat.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 1f1o2bgyMme4CRnwLaEiWg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The CONTAINER_ID record contid field can contain comma-separated values
when accompanying a NETFILTER_PKT record.  Records appeared interpreted
as such:

Wrong:
	CONTAINER_ID msg=audit(2019-04-10 13:20:18.746:1690) : contid=777 666,333
Right:
	CONTAINER_ID msg=audit(2019-04-10 13:20:18.746:1690) : contid=777,666,333

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 src/ausearch-report.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/src/ausearch-report.c b/src/ausearch-report.c
index 416c2b13fa6a..82fa9579f972 100644
--- a/src/ausearch-report.c
+++ b/src/ausearch-report.c
@@ -279,7 +279,7 @@ no_print:
 			if (str && val && (str < val)) {
 			// Value side  has commas and another field exists
 			// Known: LABEL_LEVEL_CHANGE banners=none,none
-			// Known: ROLL_ASSIGN new-role=r,r
+			// Known: ROLE_ASSIGN new-role=r,r
 			// Known: any MAC LABEL can potentially have commas
 				int ftype = auparse_interp_adjust_type(n->type,
 								name, val);
@@ -293,9 +293,11 @@ no_print:
 			} else if (str && (val == NULL)) {
 			// Goes all the way to the end. Done parsing
 			// Known: MCS context in PATH rec obj=u:r:t:s0:c2,c7
+			// Known: CONTAINER_ID contid can be a comma-separated list
 				int ftype = auparse_interp_adjust_type(n->type,
 								name, ptr);
-				if (ftype == AUPARSE_TYPE_MAC_LABEL)
+				if (ftype == AUPARSE_TYPE_MAC_LABEL
+				    || ftype == AUPARSE_TYPE_CONTID)
 					str = NULL;
 				else {
 					*str++ = 0;
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

