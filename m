Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6610A1D9B4C
	for <lists+linux-audit@lfdr.de>; Tue, 19 May 2020 17:32:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589902351;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tBrO4wdaRrJ1ZtwFFH+0lFUJE6veCMaHUNH783gkmA8=;
	b=XekRDhZ25wpHDfWKfd9WtuIiMADLI6UYBJ+3soEzrwkBOledf/qxGxyH0/BI0qaHPCnDlC
	4Wi2AQ7fQ8AaqMngkGUQO84V4EYztLgjGDTpM6I45OCc8RcSuwh6CorisEkXYFaeCs75Gb
	MpYVP4I2RmVfiNrGMxoh+bCx2x234Sk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-oW2xbHgGOWaey_OVECaY4A-1; Tue, 19 May 2020 11:32:29 -0400
X-MC-Unique: oW2xbHgGOWaey_OVECaY4A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3277B108BD10;
	Tue, 19 May 2020 15:32:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14BD960C84;
	Tue, 19 May 2020 15:32:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DD2674ED80;
	Tue, 19 May 2020 15:32:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04JFWL3I003571 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 19 May 2020 11:32:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6E37864441; Tue, 19 May 2020 15:32:21 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 64E93600E3;
	Tue, 19 May 2020 15:32:17 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>
Subject: [PATCH ghak28/ghak25 user 1/2] ausearch-parse: add parser for YAASAO
Date: Tue, 19 May 2020 11:31:26 -0400
Message-Id: <1589902287-19911-2-git-send-email-rgb@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a parser for Yet Another Audit Subject Attributes Order that was
introduced with ghak28 for the AUDIT_EVENT_LISTENER.

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 src/ausearch-parse.c | 166 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 166 insertions(+)

diff --git a/src/ausearch-parse.c b/src/ausearch-parse.c
index a2cdb1fb5c60..147b1fa7acaf 100644
--- a/src/ausearch-parse.c
+++ b/src/ausearch-parse.c
@@ -62,6 +62,7 @@ static int parse_kernel_anom(const lnode *n, search_items *s);
 static int parse_simple_message(const lnode *n, search_items *s);
 static int parse_tty(const lnode *n, search_items *s);
 static int parse_pkt(const lnode *n, search_items *s);
+static int parse_yaasao(lnode *n, search_items *s);
 
 
 static int audit_avc_init(search_items *s)
@@ -177,6 +178,9 @@ int extract_search_items(llist *l)
 			case AUDIT_REPLACE...AUDIT_BPF:
 				// Nothing to parse
 				break;
+			case AUDIT_EVENT_LISTENER:
+				ret = parse_yaasao(n, s);
+				break;
 			case AUDIT_TTY:
 				ret = parse_tty(n, s);
 				break;
@@ -2568,3 +2572,165 @@ static int parse_pkt(const lnode *n, search_items *s)
 	return 0;
 }
 
+// parse Yet Another Audit Subject Attributes Order
+// /pid.*uid.*auid.*tty.*ses.*subj.*comm.*exe
+static int parse_yaasao(lnode *n, search_items *s)
+{
+	char *ptr, *str, *term;
+	term = n->message;
+
+	// get pid if not already filled
+	if (event_pid != -1 && s->pid == -1) {
+		str = strstr(term, " pid=");
+		if (str == NULL)
+			return 52;
+		ptr = str + 5;
+		term = strchr(ptr, ' ');
+		if (term == NULL)
+			return 53;
+		*term = 0;
+		errno = 0;
+		s->pid = strtoul(ptr, NULL, 10);
+		if (errno)
+			return 54;
+		*term = ' ';
+	}
+	// get uid if not already filled
+	if ((s->uid == -1 && !s->tuid) && (event_uid != -1 || event_tuid)) {
+		str = strstr(term, "uid=");
+		if (str == NULL)
+			return 55;
+		// This could hit auid instead of uid. If so, fail.
+		if (*(str-1) == 'a') {
+			return 56;
+		}
+		ptr = str + 4;
+		term = strchr(ptr, ' ');
+		if (term == NULL)
+			return 57;
+		*term = 0;
+		errno = 0;
+		s->uid = strtoul(ptr, NULL, 10);
+		if (errno)
+			return 58;
+		*term = ' ';
+		if (s->tuid) free((void *)s->tuid);
+		s->tuid = lookup_uid("uid", s->uid);
+	}
+	// get loginuid if not already filled
+	if ((s->loginuid == -2 && !s->tauid) && (event_loginuid != -2 || event_tauid)) {
+		str = strstr(term, "auid=");
+		if (str == NULL) {
+			return 59;
+		} else
+			ptr = str + 5;
+		term = strchr(ptr, ' ');
+		if (term == NULL)
+			return 60;
+		*term = 0;
+		errno = 0;
+		s->loginuid = strtoul(ptr, NULL, 10);
+		if (errno)
+			return 61;
+		*term = ' ';
+		if (s->tauid) free((void *)s->tauid);
+		s->tauid = lookup_uid("auid", s->loginuid);
+	}
+	// get tty if not already filled
+	if (!s->terminal && event_terminal) {
+		// dont do this search unless needed
+		str = strstr(term, "tty=");
+		if (str) {
+			str += 4;
+			term = strchr(str, ' ');
+			if (term == NULL)
+				return 62;
+			*term = 0;
+			if (s->terminal) // ANOM_NETLINK has one
+				free(s->terminal);
+			s->terminal = strdup(str);
+			*term = ' ';
+		}
+	}
+	// get ses if not already filled
+	if (s->session_id == -2 && event_session_id != -2 ) {
+		str = strstr(term, "ses=");
+		if (str) {
+			ptr = str + 4;
+			term = strchr(ptr, ' ');
+			if (term == NULL)
+				return 63;
+			*term = 0;
+			errno = 0;
+			s->session_id = strtoul(ptr, NULL, 10);
+			if (errno)
+				return 64;
+			*term = ' ';
+		}
+	}
+	// get subject if not already filled
+	if (!s->avc && event_subject) {
+		// scontext
+		str = strstr(term, "subj=");
+		if (str != NULL) {
+			str += 5;
+			term = strchr(str, ' ');
+			if (term == NULL)
+				return 65;
+			*term = 0;
+			if (audit_avc_init(s) == 0) {
+				anode an;
+
+				anode_init(&an);
+				an.scontext = strdup(str);
+				alist_append(s->avc, &an);
+				*term = ' ';
+			} else
+				return 66;
+		} else
+			return 67;
+	}
+	// get command line if not already filled
+	if (!s->comm && event_comm) {
+		// dont do this search unless needed
+		str = strstr(term, "comm=");
+		if (str) {
+			/* Make the syscall one override */
+			if (s->comm)
+				free(s->comm);
+			str += 5;
+			if (*str == '"') {
+				str++;
+				term = strchr(str, '"');
+				if (term == NULL)
+					return 68;
+				*term = 0;
+				s->comm = strdup(str);
+				*term = '"';
+			} else 
+				s->comm = unescape(str);
+		} else
+			return 69;
+	}
+	// get exe if not already filled
+	if (!s->exe && event_exe) {
+		// dont do this search unless needed
+		str = strstr(n->message, "exe=");
+		if (str) {
+			str += 4;
+			if (*str == '"') {
+				str++;
+				term = strchr(str, '"');
+				if (term == NULL)
+					return 70;
+				*term = 0;
+				s->exe = strdup(str);
+				*term = '"';
+			} else 
+				s->exe = unescape(str);
+		} else
+			return 71;
+	}
+	return 0;
+}
+
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

