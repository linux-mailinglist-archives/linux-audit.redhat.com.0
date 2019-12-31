Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2AAEF12DBB8
	for <lists+linux-audit@lfdr.de>; Tue, 31 Dec 2019 20:59:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1577822387;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rqmVBaLTXX3hhyplBhheg0/ynnZoNuw3EagmDJSLzQw=;
	b=Tg2pPLLKUjPISOUZ3Bvz24cBxpmzYdZdEFMEATzsIMkDFbeXS/mOpEXpQqET2GLsBnOC0t
	qfl5SWsUxn1VN5BVmDfGpxFEVHuIa4godbyvUGlrORLQcc6jld4H8DGCw/JO8hpzMnsGQ8
	VTaSqV9fCVVozdY18y5Mhxl+rt7jI1Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-9Fg8VRNNNTioYPwgRPKKYA-1; Tue, 31 Dec 2019 14:59:46 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65AFEDB22;
	Tue, 31 Dec 2019 19:59:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 461CA5D72D;
	Tue, 31 Dec 2019 19:59:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 09EC9104909;
	Tue, 31 Dec 2019 19:59:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBVJxcCu000558 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 31 Dec 2019 14:59:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AD99F60FC4; Tue, 31 Dec 2019 19:59:38 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-15.phx2.redhat.com [10.3.112.15])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 045F160BEC;
	Tue, 31 Dec 2019 19:59:35 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: containers@lists.linux-foundation.org,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH ghau51/ghau40 v8 10/14] ausearch: convert contid to
	comma/carrat-sep list
Date: Tue, 31 Dec 2019 14:58:17 -0500
Message-Id: <1577822301-19760-11-git-send-email-rgb@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: 9Fg8VRNNNTioYPwgRPKKYA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Now that the kernel is able to track container nesting ("audit: track
container nesting"), convert the ausearch internals to parse and track
the compound list of contids.

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 src/aureport-options.c |   2 +-
 src/ausearch-llist.c   |   8 +++-
 src/ausearch-llist.h   |   2 +-
 src/ausearch-match.c   |  40 ++++++++++++++++-
 src/ausearch-options.c |  36 ++++++++++++++--
 src/ausearch-options.h |   2 +-
 src/ausearch-parse.c   | 115 ++++++++++++++++++++++++++++++++++++++++++++++++-
 src/ausearch-report.c  |   2 +-
 8 files changed, 195 insertions(+), 12 deletions(-)

diff --git a/src/aureport-options.c b/src/aureport-options.c
index 679c36c00985..69e2d18519b8 100644
--- a/src/aureport-options.c
+++ b/src/aureport-options.c
@@ -62,7 +62,7 @@ const char *event_vmname = NULL;
 long long event_exit = 0;
 int event_exit_is_set = 0;
 int event_ppid = -1, event_session_id = -2;
-unsigned long long int event_contid = -1;
+const char *event_contid = NULL;
 int event_debug = 0, event_machine = -1;
 
 /* These are used by aureport */
diff --git a/src/ausearch-llist.c b/src/ausearch-llist.c
index ade727a9e102..525ddf67464b 100644
--- a/src/ausearch-llist.c
+++ b/src/ausearch-llist.c
@@ -60,7 +60,7 @@ void list_create(llist *l)
 	l->s.arch = 0;
 	l->s.syscall = 0;
 	l->s.session_id = -2;
-	l->s.contid = -1;
+	l->s.contid = NULL;
 	l->s.uuid = NULL;
 	l->s.vmname = NULL;
 	l->s.tuid = NULL;
@@ -212,7 +212,11 @@ void list_clear(llist* l)
 	l->s.arch = 0;
 	l->s.syscall = 0;
 	l->s.session_id = -2;
-	l->s.contid = -1;
+	if (l->s.contid) {
+		slist_clear(l->s.contid);
+		free(l->s.contid);
+		l->s.contid = NULL;
+	}
 	free(l->s.uuid);
 	l->s.uuid = NULL;
 	free(l->s.vmname);
diff --git a/src/ausearch-llist.h b/src/ausearch-llist.h
index 2d1f52237ce6..c652b4ca06c0 100644
--- a/src/ausearch-llist.h
+++ b/src/ausearch-llist.h
@@ -56,7 +56,7 @@ typedef struct
   int arch;             // arch
   int syscall;          // syscall
   uint32_t session_id;  // Login session id
-  __u64 contid;         // Container id
+  slist *contid;        // Container id
   long long exit;       // Syscall exit code
   int exit_is_set;      // Syscall exit code is valid
   char *hostname;       // remote hostname
diff --git a/src/ausearch-match.c b/src/ausearch-match.c
index 47c12581a963..ae03b670b762 100644
--- a/src/ausearch-match.c
+++ b/src/ausearch-match.c
@@ -37,6 +37,7 @@ static int strmatch(const char *needle, const char *haystack);
 static int user_match(llist *l);
 static int group_match(llist *l);
 static int context_match(llist *l);
+static int contid_match(llist *l);
 
 static void load_interpretations(const llist *l)
 {
@@ -113,8 +114,7 @@ int match(llist *l)
 				if ((event_session_id != -2) &&
 					(event_session_id != l->s.session_id))
 					return 0;
-				if ((event_contid != -1) &&
-					(event_contid != l->s.contid))
+				if (contid_match(l) == 0)
 					return 0;
 				if (event_exit_is_set) {
 					if (l->s.exit_is_set == 0)
@@ -417,3 +417,39 @@ static int context_match(llist *l)
 	return 1;
 }
 
+/*
+ * This function compares container ids. It returns a 0 if no match and a 1 if
+ * there is a match 
+ */
+static int contid_match(llist *l)
+{
+	if (event_contid) {
+		int found = 0;
+		const snode *ecn;
+		slist *ecptr = event_contid;
+
+		slist_first(ecptr);
+		ecn = slist_get_cur(ecptr);
+		if (l->s.contid) {
+			while (ecn && !found) {
+				const snode *sn;
+				slist *sptr = l->s.contid;
+	
+				slist_first(sptr);
+				sn = slist_get_cur(sptr);
+				while (sn && !found) {
+					if (!strcmp(sn->str, ecn->str))
+						found++;
+					else
+						sn = slist_next(sptr);
+				}
+				if (found)
+					return found;
+				ecn = slist_next(ecptr);
+			}
+			return found;
+		}
+	}
+	return 0;
+}
+
diff --git a/src/ausearch-options.c b/src/ausearch-options.c
index 550f47ed20e4..f4d0f308eddb 100644
--- a/src/ausearch-options.c
+++ b/src/ausearch-options.c
@@ -60,7 +60,7 @@ int event_syscall = -1, event_machine = -1;
 int event_ua = 0, event_ga = 0, event_se = 0;
 int just_one = 0;
 uint32_t event_session_id = -2;
-unsigned long long int event_contid = -1;
+const char *event_contid = NULL;
 long long event_exit = 0;
 int event_exit_is_set = 0;
 int line_buffered = 0;
@@ -1200,22 +1200,52 @@ int check_params(int count, char *vars[])
 			{
 			size_t len = strlen(optarg);
 			if (isdigit(optarg[0])) {
+				__u64 contid;
+
 				errno = 0;
-				event_contid = strtoull(optarg,NULL,0);
+				contid = strtoull(optarg,NULL,0);
 				if (errno) {
 					fprintf(stderr, 
 			"Numeric container ID conversion error (%s) for %s\n",
 						strerror(errno), optarg);
 					retval = -1;
+				} else {
+					if (!event_contid) {
+						event_contid = malloc(sizeof(slist));
+						if (!event_contid) {
+							retval = -1;
+							break;
+						}
+						slist_create(event_contid);
+					}
+					sn.str = strdup(optarg);
+					sn.key = NULL;
+					sn.hits = 0;
+					slist_append(event_contid, &sn);
 				}
 			} else if (len >= 2 && *(optarg)=='-' &&
 					(isdigit(optarg[1]))) {
+				__u64 contid;
+
 				errno = 0;
-				event_contid = strtoll(optarg, NULL, 0);
+				contid = strtoll(optarg, NULL, 0);
 				if (errno) {
 					retval = -1;
 					fprintf(stderr, "Error converting %s\n",
 						optarg);
+				} else {
+					if (!event_contid) {
+						event_contid = malloc(sizeof(slist));
+						if (!event_contid) {
+							retval = -1;
+							break;
+						}
+						slist_create(event_contid);
+					}
+					sn.str = strdup(optarg);
+					sn.key = NULL;
+					sn.hits = 0;
+					slist_append(event_contid, &sn);
 				}
 			} else {
 				fprintf(stderr, 
diff --git a/src/ausearch-options.h b/src/ausearch-options.h
index c03256e36495..a49d2400ff0d 100644
--- a/src/ausearch-options.h
+++ b/src/ausearch-options.h
@@ -40,7 +40,7 @@ extern int line_buffered;
 extern int event_debug;
 extern pid_t event_ppid;
 extern uint32_t event_session_id;
-extern unsigned long long int event_contid;
+extern const char *event_contid;
 extern ilist *event_type;
 
 /* Data type to govern output format */
diff --git a/src/ausearch-parse.c b/src/ausearch-parse.c
index a3932ae07eee..1b58bbc05a57 100644
--- a/src/ausearch-parse.c
+++ b/src/ausearch-parse.c
@@ -77,6 +77,18 @@ static int audit_avc_init(search_items *s)
 	return 0;
 }
 
+static int audit_contid_init(search_items *s)
+{
+	if (s->contid == NULL) {
+		//create
+		s->contid = malloc(sizeof(slist));
+		if (s->contid == NULL)
+			return -1;
+		slist_create(s->contid);
+	}
+	return 0;
+}
+
 /*
  * This function will take the list and extract the searchable fields from it.
  * It returns 0 on success and 1 on failure.
@@ -1459,6 +1471,7 @@ static int parse_container_op(const lnode *n, search_items *s)
 	// skip op
 	// skip opid
 	// get contid
+/*
 	if (event_contid != -1) {
 		str = strstr(term, "contid=");
 		if (str == NULL)
@@ -1473,8 +1486,65 @@ static int parse_container_op(const lnode *n, search_items *s)
 		if (errno)
 			return 48;
 		*term = ' ';
+ */
+	if (event_contid) {
+		snode sn;
+		char *comma, *carrat;
+
+		str = strstr(term, "contid=");
+		if (!str)
+			return 46;
+		if (audit_contid_init(s) < 0)
+			return 48;
+		str += 7;
+		term = strchr(str, ' ');
+		if (term == NULL)
+			return 47;
+		*term = 0;
+		sn.str = strdup(str);
+		sn.key = NULL;
+		sn.hits = 1;
+		slist_append(s->contid, &sn);
+		if (term)
+			*term = ' ';
+	// old-contid
+		str = strstr(term, "old-contid=");
+		if (!str)
+			return 46;
+		if (audit_contid_init(s) < 0)
+			return 48;
+		str += 11;
+		term = strchr(str, ' ');
+		if (term)
+			*term = 0;
+		comma = strchr(str, ',');
+		if (comma)
+			*comma = 0;
+		do {
+			carrat = strchr(str, '^');
+			if (carrat)
+				*carrat = 0;
+			do {
+				sn.str = strdup(str);
+				sn.key = NULL;
+				sn.hits = 1;
+				slist_append(s->contid, &sn);
+
+				if (carrat) {
+					str = carrat + 1;
+					*carrat = '^';
+					carrat = strchr(str, '^');
+				}
+			} while (carrat);
+			if (comma) {
+				str = comma + 1;
+				*comma = ',';
+				comma = strchr(str, ',');
+			}
+		} while (comma);
+		if (term)
+			*term = ' ';
 	}
-	// skip old-contid
 	return 0;
 }
 
@@ -1483,6 +1553,7 @@ static int parse_container_id(const lnode *n, search_items *s)
 	char *ptr, *str, *term = n->message;
 
 	// get contid
+/*
 	if (event_contid != -1) {
 		str = strstr(term, "contid=");
 		if (str == NULL)
@@ -1497,6 +1568,48 @@ static int parse_container_id(const lnode *n, search_items *s)
 		if (errno)
 			return 51;
 		*term = ' ';
+ */
+	if (event_contid) {
+		str = strstr(term, "contid=");
+		if (str) {
+			snode sn;
+			char *comma, *carrat;
+
+			if (audit_contid_init(s) < 0)
+				return 50;
+			str += 7;
+			term = strchr(str, ' ');
+			if (term)
+				*term = 0;
+			comma = strchr(str, ',');
+			if (comma)
+				*comma = 0;
+			do {
+				carrat = strchr(str, '^');
+				if (carrat)
+					*carrat = 0;
+				do {
+					sn.str = strdup(str);
+					sn.key = NULL;
+					sn.hits = 1;
+					slist_append(s->contid, &sn);
+
+					if (carrat) {
+						str = carrat + 1;
+						*carrat = '^';
+						carrat = strchr(str, '^');
+					}
+				} while (carrat);
+				if (comma) {
+					str = comma + 1;
+					*comma = ',';
+					comma = strchr(str, ',');
+				}
+			} while (comma);
+			if (term)
+				*term = ' ';
+		} else
+			return 49;
 	}
 	return 0;
 }
diff --git a/src/ausearch-report.c b/src/ausearch-report.c
index 82fa9579f972..7b597b5f3be0 100644
--- a/src/ausearch-report.c
+++ b/src/ausearch-report.c
@@ -293,7 +293,7 @@ no_print:
 			} else if (str && (val == NULL)) {
 			// Goes all the way to the end. Done parsing
 			// Known: MCS context in PATH rec obj=u:r:t:s0:c2,c7
-			// Known: CONTAINER_ID contid can be a comma-separated list
+			// Known: CONTAINER_ID contid can be a comma/carrat-separated list
 				int ftype = auparse_interp_adjust_type(n->type,
 								name, ptr);
 				if (ftype == AUPARSE_TYPE_MAC_LABEL
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

