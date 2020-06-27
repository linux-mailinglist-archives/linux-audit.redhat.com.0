Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 8F17820C2C1
	for <lists+linux-audit@lfdr.de>; Sat, 27 Jun 2020 17:20:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593271230;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=n+pzmCFU56QHQkid+KI/mnGoFyrCAOPqM/Ajb2IugCA=;
	b=K5BTdX3HuQ617aKPRAudyVgLFetGW9s2jbm8z8yJpVxGCjQPzlr+LqlRAJk5slOl8Zu22d
	xfTZmf4p5heDUcps+tYq0PN88EUsSpzXEyNv2vWsvz2iIXWPmecWP0ToEPtufgeJJAhP8a
	r8Zp2HB6Npz7vHeuv+SxGd3XnQtVnFU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-xXSIm_-tPIKNv0OSc-QmQg-1; Sat, 27 Jun 2020 11:19:45 -0400
X-MC-Unique: xXSIm_-tPIKNv0OSc-QmQg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E19B310059A2;
	Sat, 27 Jun 2020 15:19:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C76CA79309;
	Sat, 27 Jun 2020 15:19:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9EA9F875B5;
	Sat, 27 Jun 2020 15:19:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05RFJcCn019352 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 27 Jun 2020 11:19:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B40AB61981; Sat, 27 Jun 2020 15:19:38 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A775160BF4;
	Sat, 27 Jun 2020 15:19:35 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: containers@lists.linux-foundation.org,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH ghau51/ghau40 v9 09/11] contid: interpret correctly
	CONTAINER_ID contid field csv
Date: Sat, 27 Jun 2020 11:18:09 -0400
Message-Id: <1593271091-30188-10-git-send-email-rgb@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
index 416c2b13fa6a..754b28af2cb6 100644
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
+			// Known: CONTAINER_ID/OP old-/contid can be a comma-separated list
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

