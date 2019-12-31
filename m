Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6F4DE12DBB3
	for <lists+linux-audit@lfdr.de>; Tue, 31 Dec 2019 20:59:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1577822374;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=stjMMMucbiZF8phCZRe+e4A9p8hlrU3TmhHU7OkK5Ic=;
	b=Rd9lDQDz8vqG/DSPL+Z4UIVw8J9PsaalvvBp9SNjFog+mTOBkTK3ZZ2SwbddDrXfUUigyf
	X/VGaafULnbZfJ4OcJUqC6K+CuRDHc6UrlTga34C8jMymhwHSFkPeiQ2YZGKI0ltJDP9Mu
	i3zJUmMm7hJlU1wdiyErDcek9r0jVrs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-TLIBWQNQPGiN70BEV5OilQ-1; Tue, 31 Dec 2019 14:59:33 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEB29800D55;
	Tue, 31 Dec 2019 19:59:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BD315C1D8;
	Tue, 31 Dec 2019 19:59:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 45D4318089C8;
	Tue, 31 Dec 2019 19:59:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBVJxPXh000456 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 31 Dec 2019 14:59:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 024BA60FC6; Tue, 31 Dec 2019 19:59:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-15.phx2.redhat.com [10.3.112.15])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4F22B60BEC;
	Tue, 31 Dec 2019 19:59:22 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: containers@lists.linux-foundation.org,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH ghau51/ghau40 v8 07/14] signal_info: only print context if it
	is available.
Date: Tue, 31 Dec 2019 14:58:14 -0500
Message-Id: <1577822301-19760-8-git-send-email-rgb@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: TLIBWQNQPGiN70BEV5OilQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 src/auditd-event.c    | 20 +++++++++++++++-----
 src/auditd-reconfig.c |  2 --
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/src/auditd-event.c b/src/auditd-event.c
index 68eacd5cb028..85b647014154 100644
--- a/src/auditd-event.c
+++ b/src/auditd-event.c
@@ -1323,13 +1323,16 @@ static void reconfigure(struct auditd_event *e)
 	const char *ctx = nconf->sender_ctx;
 	struct timeval tv;
 	char txt[MAX_AUDIT_MESSAGE_LENGTH];
+	int txt_len;
 	char date[40];
 	unsigned int seq_num;
 	int need_size_check = 0, need_reopen = 0, need_space_check = 0;
 
-	snprintf(txt, sizeof(txt),
-		"config change requested by pid=%d auid=%u subj=%s",
-		pid, uid, ctx);
+	txt_len = snprintf(txt, sizeof(txt),
+		"config change requested by pid=%d auid=%u", pid, uid);
+	if (ctx)
+		snprintf(txt + txt_len, sizeof(txt) - txt_len,
+			 " subj=%s", ctx);
 	audit_msg(LOG_NOTICE, "%s", txt);
 
 	/* Do the reconfiguring. These are done in a specific
@@ -1578,8 +1581,15 @@ static void reconfigure(struct auditd_event *e)
 
 	e->reply.type = AUDIT_DAEMON_CONFIG;
 	e->reply.len = snprintf(e->reply.msg.data, MAX_AUDIT_MESSAGE_LENGTH-2, 
-	"%s: op=reconfigure state=changed auid=%u pid=%d subj=%s res=success",
-		date, uid, pid, ctx );
+				"%s: op=reconfigure state=changed auid=%u pid=%d",
+				date, uid, pid);
+	if (ctx)
+		e->reply.len += snprintf(e->reply.msg.data + e->reply.len,
+					 MAX_AUDIT_MESSAGE_LENGTH-2 - e->reply.len,
+					 " subj=%s", ctx);
+	e->reply.len += snprintf(e->reply.msg.data + e->reply.len,
+				 MAX_AUDIT_MESSAGE_LENGTH-2 - e->reply.len, 
+				 " res=success");
 	e->reply.message = e->reply.msg.data;
 	free((char *)ctx);
 }
diff --git a/src/auditd-reconfig.c b/src/auditd-reconfig.c
index f5b00e6d1dc7..1af402526c4e 100644
--- a/src/auditd-reconfig.c
+++ b/src/auditd-reconfig.c
@@ -106,8 +106,6 @@ static void *config_thread_main(void *arg)
 		if (e->reply.len > 24)
 			new_config.sender_ctx = 
 				strdup(e->reply.signal_info->ctx);
-		else
-			new_config.sender_ctx = strdup("?"); 
 		memcpy(e->reply.msg.data, &new_config, sizeof(new_config));
 		e->reply.conf = (struct daemon_conf *)e->reply.msg.data;
 		e->reply.type = AUDIT_DAEMON_RECONFIG;
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

