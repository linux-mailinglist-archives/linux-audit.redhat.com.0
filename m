Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 701971DBA45
	for <lists+linux-audit@lfdr.de>; Wed, 20 May 2020 18:53:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589993599;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=y1fwy44gf3y7wkwec/zEK6VzjFwVdobKOCYf5dPjVXs=;
	b=fg2S/+piUnDFHD+A9BGuHKw4aF2c7aEf+1CBS6QuKHrKgKM3BpCTUtDbc73z5NKjusvwjg
	TiCDCwkyUw9Ros13IeYaV2CMZL9eDYuzOIRFJEN3Qce0elGz354uaNrMHNEF4MYb3Ogpwr
	tdiIt+hb2i16cG2j38dOyZoADx3rbI0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-S7oqEtKlM02uDJOCzd3LzA-1; Wed, 20 May 2020 12:53:16 -0400
X-MC-Unique: S7oqEtKlM02uDJOCzd3LzA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25EE118FE866;
	Wed, 20 May 2020 16:53:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 094B53420D;
	Wed, 20 May 2020 16:53:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CE8541809547;
	Wed, 20 May 2020 16:53:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04KGr9dK014840 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 20 May 2020 12:53:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8DAF060C87; Wed, 20 May 2020 16:53:09 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AB4CE60C84;
	Wed, 20 May 2020 16:53:03 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>
Subject: [PATCH ghak28/ghak25 user v6 2/2] ausearch-parse: mod parser for
	YAASAO for NETFILTER_CFG
Date: Wed, 20 May 2020 12:52:20 -0400
Message-Id: <1589993540-21629-3-git-send-email-rgb@redhat.com>
In-Reply-To: <1589993540-21629-1-git-send-email-rgb@redhat.com>
References: <1589993540-21629-1-git-send-email-rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, eparis@parisplace.org
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

Modify the YAASAO parser to accomodate the ghak25 NETFILTER_CFG record.

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 src/ausearch-parse.c | 52 ++++++++++++++++++++++++++--------------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/src/ausearch-parse.c b/src/ausearch-parse.c
index be1d32cdfa5f..cd8632a58ac0 100644
--- a/src/ausearch-parse.c
+++ b/src/ausearch-parse.c
@@ -173,11 +173,11 @@ int extract_search_items(llist *l)
 			case AUDIT_BPRM_FCAPS:
 			case AUDIT_CAPSET:
 			case AUDIT_MMAP:
-			case AUDIT_NETFILTER_CFG:
 			case AUDIT_PROCTITLE:
 			case AUDIT_REPLACE...AUDIT_BPF:
 				// Nothing to parse
 				break;
+			case AUDIT_NETFILTER_CFG:
 			case AUDIT_EVENT_LISTENER:
 				ret = parse_yaasao(n, s);
 				break;
@@ -2596,7 +2596,7 @@ static int parse_yaasao(lnode *n, search_items *s)
 		} else
 			return 54;
 	}
-	// get uid if not already filled
+	// optionally get uid if not already filled
 	if ((s->uid == -1 && !s->tuid) && (event_uid != -1 || event_tuid)) {
 		str = strstr(term, "uid=");
 		if (str) {
@@ -2610,31 +2610,31 @@ static int parse_yaasao(lnode *n, search_items *s)
 			if (errno)
 				return 56;
 			*term = ' ';
-			if (s->tuid) free((void *)s->tuid);
-			s->tuid = lookup_uid("uid", s->uid);
 		} else
-			return 57;
+			s->uid = 0;
+		if (s->tuid) free((void *)s->tuid);
+		s->tuid = lookup_uid("uid", s->uid);
 	}
-	// get loginuid if not already filled
+	// optionally get loginuid if not already filled
 	if ((s->loginuid == -2 && !s->tauid) && (event_loginuid != -2 || event_tauid)) {
 		str = strstr(term, "auid=");
 		if (str) {
 			ptr = str + 5;
 			term = strchr(ptr, ' ');
 			if (term == NULL)
-				return 58;
+				return 57;
 			*term = 0;
 			errno = 0;
 			s->loginuid = strtoul(ptr, NULL, 10);
 			if (errno)
-				return 59;
+				return 58;
 			*term = ' ';
-			if (s->tauid) free((void *)s->tauid);
-			s->tauid = lookup_uid("auid", s->loginuid);
 		} else
-			return 60;
+			s->loginuid = (unsigned long)-1;
+		if (s->tauid) free((void *)s->tauid);
+		s->tauid = lookup_uid("auid", s->loginuid);
 	}
-	// get tty if not already filled
+	// optionally get tty if not already filled
 	if (!s->terminal && event_terminal) {
 		// dont do this search unless needed
 		str = strstr(term, "tty=");
@@ -2642,31 +2642,31 @@ static int parse_yaasao(lnode *n, search_items *s)
 			str += 4;
 			term = strchr(str, ' ');
 			if (term == NULL)
-				return 61;
+				return 59;
 			*term = 0;
 			if (s->terminal) // ANOM_NETLINK has one
 				free(s->terminal);
 			s->terminal = strdup(str);
 			*term = ' ';
 		} else
-			return 62;
+			s->terminal = strdup("(none)");
 	}
-	// get ses if not already filled
+	// optionally get ses if not already filled
 	if (s->session_id == -2 && event_session_id != -2 ) {
 		str = strstr(term, "ses=");
 		if (str) {
 			ptr = str + 4;
 			term = strchr(ptr, ' ');
 			if (term == NULL)
-				return 63;
+				return 60;
 			*term = 0;
 			errno = 0;
 			s->session_id = strtoul(ptr, NULL, 10);
 			if (errno)
-				return 64;
+				return 61;
 			*term = ' ';
 		} else
-			return 65
+			s->session_id = (unsigned long)-1;
 	}
 	// get subject if not already filled
 	if (!s->avc && event_subject) {
@@ -2676,7 +2676,7 @@ static int parse_yaasao(lnode *n, search_items *s)
 			str += 5;
 			term = strchr(str, ' ');
 			if (term == NULL)
-				return 66;
+				return 62;
 			*term = 0;
 			if (audit_avc_init(s) == 0) {
 				anode an;
@@ -2686,9 +2686,9 @@ static int parse_yaasao(lnode *n, search_items *s)
 				alist_append(s->avc, &an);
 				*term = ' ';
 			} else
-				return 67;
+				return 63;
 		} else
-			return 68;
+			return 64;
 	}
 	// get command line if not already filled
 	if (!s->comm && event_comm) {
@@ -2703,16 +2703,16 @@ static int parse_yaasao(lnode *n, search_items *s)
 				str++;
 				term = strchr(str, '"');
 				if (term == NULL)
-					return 69;
+					return 65;
 				*term = 0;
 				s->comm = strdup(str);
 				*term = '"';
 			} else 
 				s->comm = unescape(str);
 		} else
-			return 70;
+			return 66;
 	}
-	// get exe if not already filled
+	// optionally get exe if not already filled
 	if (!s->exe && event_exe) {
 		// dont do this search unless needed
 		str = strstr(n->message, "exe=");
@@ -2722,14 +2722,14 @@ static int parse_yaasao(lnode *n, search_items *s)
 				str++;
 				term = strchr(str, '"');
 				if (term == NULL)
-					return 71;
+					return 67;
 				*term = 0;
 				s->exe = strdup(str);
 				*term = '"';
 			} else 
 				s->exe = unescape(str);
 		} else
-			return 72;
+			s->exe = strdup("(null)");
 	}
 	return 0;
 }
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

