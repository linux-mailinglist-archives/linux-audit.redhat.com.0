Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AE55A611503
	for <lists+linux-audit@lfdr.de>; Fri, 28 Oct 2022 16:46:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666968401;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iDXyB8z/4yZaOTe+fRk482ANI1OuYqhxwDsO69rRBao=;
	b=Ep6aiDR0rfgC9Na2H3MrVla/zjeSWAdiShU9LR2HO7ole0QqRxrKfZS36zBDMdK74mGOGR
	UFRHcSeSFDuO95B6kaqL5Vij6O2uUZbnoarRkbPE0Z5e5XhJzb3FLaJ6QB/PNwq55yHSJQ
	RCUvf5034USsIE+T8zJplvljBPhCW8g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-391-0dXSBgTqPb2AU4yvmXgk0A-1; Fri, 28 Oct 2022 10:46:37 -0400
X-MC-Unique: 0dXSBgTqPb2AU4yvmXgk0A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD57B3850EB8;
	Fri, 28 Oct 2022 14:46:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F100F111E3EB;
	Fri, 28 Oct 2022 14:46:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5342C194704E;
	Fri, 28 Oct 2022 14:46:30 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 94E9C1946586 for <linux-audit@listman.corp.redhat.com>;
 Fri, 28 Oct 2022 14:15:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 77CE540C83C5; Fri, 28 Oct 2022 14:15:09 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 701DD40C206B
 for <linux-audit@redhat.com>; Fri, 28 Oct 2022 14:15:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 547A58828C8
 for <linux-audit@redhat.com>; Fri, 28 Oct 2022 14:15:09 +0000 (UTC)
Received: from mailgw.gate-on.net (auth.Gate-On.Net [210.197.74.21]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-427-pdMTBj_TMJyYGxdkcUg_lw-1; Fri,
 28 Oct 2022 10:15:06 -0400
X-MC-Unique: pdMTBj_TMJyYGxdkcUg_lw-1
Received: from vega.pgw.jp (unknown [49.135.98.196])
 by mailgw.gate-on.net (Postfix) with ESMTP id C23A380B8D
 for <linux-audit@redhat.com>; Fri, 28 Oct 2022 23:13:45 +0900 (JST)
Received: from localhost (vega.pgw.jp [10.5.0.30])
 by vega.pgw.jp (Postfix) with SMTP
 id C2A1EA53D; Fri, 28 Oct 2022 23:13:44 +0900 (JST)
From: <gkabe@vega.pgw.jp>
To: linux-audit@redhat.com
Subject: [PATCH] Properly pass struct timeval.tv_sec to snprintf under
 -D_TIME_BITS=64
Date: Fri, 28 Oct 2022 23:13:44 +0900
Message-ID: <221028231344.M0104986@vega.pgw.jp>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Fri, 28 Oct 2022 14:46:29 +0000
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: gkabe@vega.pgw.jp
MIME-Version: 1.0
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Without this patch, auditd coredumps on 32bit when compiled with
-D_TIME_BITS=64:

Thread 1 "auditd" received signal SIGSEGV, Segmentation fault.
0xb7c7528f in strlen () from /lib/libc.so.6
(gdb) where
#0  0xb7c7528f in strlen () from /lib/libc.so.6
#1  0xb7cbe3c9 in __vfprintf_internal () from /lib/libc.so.6
#2  0xb7cce3a5 in __vsnprintf_internal () from /lib/libc.so.6
#3  0xb7d72180 in __snprintf_chk () from /lib/libc.so.6
#4  0x0040b3b5 in send_audit_event ()
#5  0x004047ff in main ()


diff -up ./src/auditd-event.c.t64 ./src/auditd-event.c
--- ./src/auditd-event.c.t64	2022-01-24 04:36:56.000000000 +0900
+++ ./src/auditd-event.c	2022-10-28 22:43:32.103854794 +0900
@@ -104,7 +104,7 @@ void write_logging_state(FILE *f)
 		int rc;
 		struct statfs buf;
 
-		fprintf(f, "current log size = %lu KB\n", log_size/1024);
+		fprintf(f, "current log size = %llu KB\n", (unsigned long long)log_size/1024);
 		fprintf(f, "max log size = %lu KB\n",
 				config->max_log_size * (MEGABYTE/1024));
 		fprintf(f,"logs detected last rotate/shift = %u\n", known_logs);
@@ -112,8 +112,8 @@ void write_logging_state(FILE *f)
 					fs_space_left ? "yes" : "no");
 		rc = fstatfs(log_fd, &buf);
 		if (rc == 0) {
-			fprintf(f, "Logging partition free space %lu MB\n",
-				(buf.f_bavail * buf.f_bsize)/MEGABYTE);
+			fprintf(f, "Logging partition free space %llu MB\n",
+				(unsigned long long)(buf.f_bavail * buf.f_bsize)/MEGABYTE);
 			fprintf(f, "space_left setting %lu MB\n",
 				config->space_left);
 			fprintf(f, "admin_space_left setting %lu MB\n",
@@ -1632,7 +1632,7 @@ static void reconfigure(struct auditd_ev
 	srand(time(NULL));
 	seq_num = rand()%10000;
 	if (gettimeofday(&tv, NULL) == 0) {
-		snprintf(date, sizeof(date), "audit(%lu.%03u:%u)", tv.tv_sec,
+		snprintf(date, sizeof(date), "audit(%llu.%03u:%u)", (unsigned long long)tv.tv_sec,
 			(unsigned)(tv.tv_usec/1000), seq_num);
 	} else {
 		snprintf(date, sizeof(date),
diff -up ./src/auditd.c.t64 ./src/auditd.c
--- ./src/auditd.c.t64	2022-01-24 04:36:56.000000000 +0900
+++ ./src/auditd.c	2022-10-28 22:38:40.817495792 +0900
@@ -312,12 +312,12 @@ int send_audit_event(int type, const cha
 	// Write event into netlink area like normal events
 	if (gettimeofday(&tv, NULL) == 0) {
 		e->reply.len = snprintf((char *)e->reply.msg.data,
-			DMSG_SIZE, "audit(%lu.%03u:%u): %s", 
-			tv.tv_sec, (unsigned)(tv.tv_usec/1000), seq_num, str);
+			DMSG_SIZE, "audit(%llu.%03u:%u): %s", 
+			(long long)tv.tv_sec, (unsigned)(tv.tv_usec/1000), seq_num, str);
 	} else {
 		e->reply.len = snprintf((char *)e->reply.msg.data,
-			DMSG_SIZE, "audit(%lu.%03d:%u): %s", 
-			(unsigned long)time(NULL), 0, seq_num, str);
+			DMSG_SIZE, "audit(%llu.%03d:%u): %s", 
+			(long long)time(NULL), 0, seq_num, str);
 	}
 	// Point message at the netlink buffer like normal events
 	e->reply.message = e->reply.msg.data;
diff -up ./src/ausearch-checkpt.c.t64 ./src/ausearch-checkpt.c
--- ./src/ausearch-checkpt.c.t64	2022-01-24 04:36:56.000000000 +0900
+++ ./src/ausearch-checkpt.c	2022-10-28 22:50:20.558201108 +0900
@@ -147,6 +147,7 @@ void save_ChkPt(const char *fn)
 static int parse_checkpt_event(char *lbuf, int ndix, event *e)
 {
 	char *rest;
+	unsigned long long t;
 
 	/*
  	 * Find the space after the node, then make it '\0' so
@@ -173,13 +174,14 @@ static int parse_checkpt_event(char *lbu
 			return 1;
 		}
 	}
-	if (sscanf(rest, "%lu.%03u:%lu 0x%X", &e->sec, &e->milli,
+	if (sscanf(rest, "%llu.%03u:%lu 0x%X", &t, &e->milli,
 						&e->serial, &e->type) != 4) {
 		fprintf(stderr, "Malformed output/event checkpoint line "
 			"after node - [%s]\n", lbuf);
 		checkpt_failure |= CP_STATUSBAD;
 		return 1;
 	}
+	e->sec = t;
 
 	return 0;
 }
diff -up ./src/ausearch.c.t64 ./src/ausearch.c
--- ./src/ausearch.c.t64	2022-01-24 04:36:56.000000000 +0900
+++ ./src/ausearch.c	2022-10-28 22:48:03.676082763 +0900
@@ -472,10 +472,10 @@ static int process_log_fd(void)
 				output_event(entries);
 			} else if (do_output == 3) {
 				fprintf(stderr,
-			"Corrupted checkpoint file. Inode match, but newer complete event (%lu.%03u:%lu) found before loaded checkpoint %lu.%03u:%lu\n",
-					entries->e.sec, entries->e.milli,
+			"Corrupted checkpoint file. Inode match, but newer complete event (%llu.%03u:%lu) found before loaded checkpoint %llu.%03u:%lu\n",
+					(unsigned long long)entries->e.sec, entries->e.milli,
 					entries->e.serial,
-					chkpt_input_levent.sec,
+					(unsigned long long)chkpt_input_levent.sec,
 					chkpt_input_levent.milli,
 					chkpt_input_levent.serial);
 				checkpt_failure |= CP_CORRUPTED;
diff -up ./tools/auvirt/auvirt.c.t64 ./tools/auvirt/auvirt.c
--- ./tools/auvirt/auvirt.c.t64	2022-01-24 04:36:56.000000000 +0900
+++ ./tools/auvirt/auvirt.c	2022-10-28 22:52:31.081335459 +0900
@@ -340,8 +340,8 @@ static int extract_virt_fields(auparse_s
 error:
 	if (debug) {
 		fprintf(stderr, "Failed to get field \"%s\" for record "
-				"%ld.%03u:%lu\n", field,
-				auparse_get_time(au),
+				"%lld.%03u:%lu\n", field,
+				(long long)auparse_get_time(au),
 				auparse_get_milli(au),
 				auparse_get_serial(au));
 	}

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

