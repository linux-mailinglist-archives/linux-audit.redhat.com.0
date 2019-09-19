Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 72566B710A
	for <lists+linux-audit@lfdr.de>; Thu, 19 Sep 2019 03:29:07 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C5620308302F;
	Thu, 19 Sep 2019 01:29:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 97C9D19C6A;
	Thu, 19 Sep 2019 01:29:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4C62D180B76F;
	Thu, 19 Sep 2019 01:29:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8J1T29Y011104 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 18 Sep 2019 21:29:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2D23B5DD6F; Thu, 19 Sep 2019 01:29:02 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-19.phx2.redhat.com [10.3.112.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4257D5D9CC;
	Thu, 19 Sep 2019 01:28:59 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: containers@lists.linux-foundation.org,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH ghau51/ghau40 v7 09/12] contid: interpret correctly
	CONTAINER_ID contid field csv
Date: Wed, 18 Sep 2019 21:27:49 -0400
Message-Id: <1568856472-10173-10-git-send-email-rgb@redhat.com>
In-Reply-To: <1568856472-10173-1-git-send-email-rgb@redhat.com>
References: <1568856472-10173-1-git-send-email-rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Thu, 19 Sep 2019 01:29:06 +0000 (UTC)

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
