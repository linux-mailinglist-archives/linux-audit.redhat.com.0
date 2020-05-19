Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 18EEA1D9B54
	for <lists+linux-audit@lfdr.de>; Tue, 19 May 2020 17:33:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589902383;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vDt0HHbz9V0hjmamFU5A3xwe/klxqiZw92YSkiMZSeU=;
	b=DR6Vb+tjTaA1SjnP5XpgVROCSWXorKTIvIG4udYXpKEZrKJuQ+8W3eIZS1YQJx+2zmYkcn
	UPg3u366JuYFzVF7RugWxjoDOOh4Cdo0riml9JHv3u8M0S/vnSkOJJ5LCK3ijShPGie39f
	TpKRN5q9+RESjCFg326r9hpESKnIqSU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-T5pLg9cYOoOZWQGX0tz9Pw-1; Tue, 19 May 2020 11:32:32 -0400
X-MC-Unique: T5pLg9cYOoOZWQGX0tz9Pw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CC55835B4A;
	Tue, 19 May 2020 15:32:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 71A0C6246F;
	Tue, 19 May 2020 15:32:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4879F4ED80;
	Tue, 19 May 2020 15:32:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04JFWPHU003591 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 19 May 2020 11:32:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3FBBB6442A; Tue, 19 May 2020 15:32:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B414A6E716;
	Tue, 19 May 2020 15:32:21 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>
Subject: [PATCH ghak28/ghak25 user 2/2] ausearch-parse: mod parser for YAASAO
	for NETFILTER_CFG
Date: Tue, 19 May 2020 11:31:27 -0400
Message-Id: <1589902287-19911-3-git-send-email-rgb@redhat.com>
In-Reply-To: <1589902287-19911-1-git-send-email-rgb@redhat.com>
References: <1589902287-19911-1-git-send-email-rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Modify the YAASAO parser to accomodate the ghak25 NETFILTER_CFG record.

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 src/ausearch-parse.c | 42 ++++++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/src/ausearch-parse.c b/src/ausearch-parse.c
index 147b1fa7acaf..7feabe40b6fa 100644
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
@@ -2620,23 +2620,23 @@ static int parse_yaasao(lnode *n, search_items *s)
 	// get loginuid if not already filled
 	if ((s->loginuid == -2 && !s->tauid) && (event_loginuid != -2 || event_tauid)) {
 		str = strstr(term, "auid=");
-		if (str == NULL) {
-			return 59;
-		} else
+		if (str) {
 			ptr = str + 5;
-		term = strchr(ptr, ' ');
-		if (term == NULL)
-			return 60;
-		*term = 0;
-		errno = 0;
-		s->loginuid = strtoul(ptr, NULL, 10);
-		if (errno)
+			term = strchr(ptr, ' ');
+			if (term == NULL)
+				return 59;
+			*term = 0;
+			errno = 0;
+			s->loginuid = strtoul(ptr, NULL, 10);
+			if (errno)
+				return 60;
+			*term = ' ';
+			if (s->tauid) free((void *)s->tauid);
+			s->tauid = lookup_uid("auid", s->loginuid);
+		} else
 			return 61;
-		*term = ' ';
-		if (s->tauid) free((void *)s->tauid);
-		s->tauid = lookup_uid("auid", s->loginuid);
 	}
-	// get tty if not already filled
+	// optionally get tty if not already filled
 	if (!s->terminal && event_terminal) {
 		// dont do this search unless needed
 		str = strstr(term, "tty=");
@@ -2650,9 +2650,10 @@ static int parse_yaasao(lnode *n, search_items *s)
 				free(s->terminal);
 			s->terminal = strdup(str);
 			*term = ' ';
-		}
+		} else
+			s->terminal = strdup("(none)");
 	}
-	// get ses if not already filled
+	// optionally get ses if not already filled
 	if (s->session_id == -2 && event_session_id != -2 ) {
 		str = strstr(term, "ses=");
 		if (str) {
@@ -2666,7 +2667,8 @@ static int parse_yaasao(lnode *n, search_items *s)
 			if (errno)
 				return 64;
 			*term = ' ';
-		}
+		} else
+			s->session_id = (unsigned long)-1;
 	}
 	// get subject if not already filled
 	if (!s->avc && event_subject) {
@@ -2712,7 +2714,7 @@ static int parse_yaasao(lnode *n, search_items *s)
 		} else
 			return 69;
 	}
-	// get exe if not already filled
+	// optionally get exe if not already filled
 	if (!s->exe && event_exe) {
 		// dont do this search unless needed
 		str = strstr(n->message, "exe=");
@@ -2729,7 +2731,7 @@ static int parse_yaasao(lnode *n, search_items *s)
 			} else 
 				s->exe = unescape(str);
 		} else
-			return 71;
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

