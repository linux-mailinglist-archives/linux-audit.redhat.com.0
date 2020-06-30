Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B908220FFF8
	for <lists+linux-audit@lfdr.de>; Wed,  1 Jul 2020 00:18:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593555499;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=N1fWBQF/Zl0E5UYAiNtkSgTp6XISBWyd2m8omr67WF4=;
	b=OrlATXCPbg+UK+9KwBauhtZatPvgb9/D6RJxhoG2sCSMUeKO2J3ZwydF2M+dJ6NU+MRqNl
	3tqUqBos7nNylq0+HD2FkOlR3YmjNfDWRRAJ8yfgBWGBBt0pzhhLK6XINceVs4ENlRTAU9
	IAYQCpg/8x8ecNxbIMXCdBV+1w7VWP8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-Z9Q1hFGkPl2AqUnAfkDExw-1; Tue, 30 Jun 2020 18:18:17 -0400
X-MC-Unique: Z9Q1hFGkPl2AqUnAfkDExw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E00B918FF663;
	Tue, 30 Jun 2020 22:18:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 08A1E5DAA0;
	Tue, 30 Jun 2020 22:18:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CA8006C9C4;
	Tue, 30 Jun 2020 22:17:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05UMHdTF023595 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 30 Jun 2020 18:17:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D0A5C5BAC9; Tue, 30 Jun 2020 22:17:39 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.5])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BBBF55BAC8;
	Tue, 30 Jun 2020 22:17:32 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>
Subject: [PATCH] audit: remove unused !CONFIG_AUDITSYSCALL __audit_inode* stubs
Date: Tue, 30 Jun 2020 18:17:07 -0400
Message-Id: <8d93828705825f4126708f9cae463afd1d88ac95.1593555369.git.rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, eparis@parisplace.org,
	viro@zeniv.linux.org.uk
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Added 14 years ago in commit 73241ccca0f7 ("[PATCH] Collect more inode
information during syscall processing.") but never used however
needlessly churned no less than 10 times since.  Remove the unused
__audit_inode* stubs in the !CONFIG_AUDITSYSCALL case.

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 include/linux/audit.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/include/linux/audit.h b/include/linux/audit.h
index 604ede630580..03c4035a532b 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -579,14 +579,6 @@ static inline struct filename *audit_reusename(const __user char *name)
 }
 static inline void audit_getname(struct filename *name)
 { }
-static inline void __audit_inode(struct filename *name,
-					const struct dentry *dentry,
-					unsigned int flags)
-{ }
-static inline void __audit_inode_child(struct inode *parent,
-					const struct dentry *dentry,
-					const unsigned char type)
-{ }
 static inline void audit_inode(struct filename *name,
 				const struct dentry *dentry,
 				unsigned int aflags)
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

