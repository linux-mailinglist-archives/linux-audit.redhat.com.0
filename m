Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 394B1137A71
	for <lists+linux-audit@lfdr.de>; Sat, 11 Jan 2020 01:04:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578701074;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KNLmOcFTjeIw1KhMh2DGNdeVC54QZUCGCqB7nJ37c/g=;
	b=fhLWgoA4wKVDxhCnlGHNmGW1h/oUda+r2mEbXjFA1whwBpARN1zPHLYEfryAIfx+IPPqZR
	S3zPustPGUqxtdt6LUhxIceNpy68y/R33Lqg2zwPI8fRkWkQgABIkwA8+q1CFuanU9kC/0
	zR41dU4mpgn104RTiV4+3ezs0692bbo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-XwV7d4VYN5-vyUT-TiaNew-1; Fri, 10 Jan 2020 19:04:33 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53595107ACC7;
	Sat, 11 Jan 2020 00:04:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ADF1C60E3E;
	Sat, 11 Jan 2020 00:04:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6130F503C2;
	Sat, 11 Jan 2020 00:04:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00B0446v020304 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 10 Jan 2020 19:04:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 36DC020316DF; Sat, 11 Jan 2020 00:04:04 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 323292026D67
	for <linux-audit@redhat.com>; Sat, 11 Jan 2020 00:04:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7B55185AB8D
	for <linux-audit@redhat.com>; Sat, 11 Jan 2020 00:04:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-365-ulxyhbqtNNSo18xGEr0huA-1;
	Fri, 10 Jan 2020 19:03:58 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 21792B26E;
	Sat, 11 Jan 2020 00:03:56 +0000 (UTC)
Date: Fri, 10 Jan 2020 16:03:47 -0800
From: Tony Jones <tonyj@suse.de>
To: linux-audit@redhat.com
Subject: [PATCH] audit: fix external header definitions for gcc10
Message-ID: <20200111000346.GA22149@suse.de>
MIME-Version: 1.0
User-Agent: Mutt/1.11.3 (2019-02-01)
X-MC-Unique: ulxyhbqtNNSo18xGEr0huA-1
X-MC-Unique: XwV7d4VYN5-vyUT-TiaNew-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00B0446v020304
X-loop: linux-audit@redhat.com
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
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Header definitions need to be external when building with -fno-common (which is default in GCC 10).

(.text+0x0): multiple definition of `event_node_list'; ausearch.o (symbol from plugin):(.text+0x0): first defined here
[   60s] /usr/lib64/gcc/x86_64-suse-linux/9/../../../../x86_64-suse-linux/bin/ld: ausearch-time.o (symbol from plugin): in function `lookup_time':

Fixes: ff25054df7ed
---
 src/ausearch-common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/ausearch-common.h b/src/ausearch-common.h
index 6669203..3040547 100644
--- a/src/ausearch-common.h
+++ b/src/ausearch-common.h
@@ -50,7 +50,7 @@ extern pid_t event_pid;
 extern int event_exact_match;
 extern uid_t event_uid, event_euid, event_loginuid;
 extern const char *event_tuid, *event_teuid, *event_tauid;
-slist *event_node_list;
+extern slist *event_node_list;
 extern const char *event_comm;
 extern const char *event_filename;
 extern const char *event_hostname;
--
2.21.0



--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

