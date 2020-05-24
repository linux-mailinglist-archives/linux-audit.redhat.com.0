Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3021E04AD
	for <lists+linux-audit@lfdr.de>; Mon, 25 May 2020 04:28:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590373680;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lcneN95kO6ohPXIHrEnLmlI4K3t8C+eWAiB9813l5cE=;
	b=JYv+Ub0GC9Y6xnuHZG1tSLJvt/kT6MSMSy99TXut0682GfW2dz7x32sleAMzKXM87TJmme
	w24LmCxJyYB5vhkS5KSOMUGlym8ORaxYiquIIZgqG+qqBeNVJ83LWTFvB6n4vWX6pLSbNb
	r18IkzLeu99HgsA43FN1aSx8dXoE/oM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-IC8ICO_kPE-V6wzlmE86Ww-1; Sun, 24 May 2020 22:27:58 -0400
X-MC-Unique: IC8ICO_kPE-V6wzlmE86Ww-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDD7880183C;
	Mon, 25 May 2020 02:27:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 027035D9E2;
	Mon, 25 May 2020 02:27:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 933E11809543;
	Mon, 25 May 2020 02:27:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04OKlsFA012155 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 24 May 2020 16:47:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 887372166BA0; Sun, 24 May 2020 20:47:54 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CD102166B27
	for <linux-audit@redhat.com>; Sun, 24 May 2020 20:47:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E184101A526
	for <linux-audit@redhat.com>; Sun, 24 May 2020 20:47:51 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-29-0neizka9PuysEUJbrZnxKQ-1; 
	Sun, 24 May 2020 16:47:47 -0400
X-MC-Unique: 0neizka9PuysEUJbrZnxKQ-1
Received: from embeddedor (unknown [189.207.59.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 8CBBF207D8;
	Sun, 24 May 2020 20:47:44 +0000 (UTC)
Date: Sun, 24 May 2020 15:52:38 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Paul Moore <paul@paul-moore.com>, Eric Paris <eparis@redhat.com>
Subject: [PATCH] audit: Use struct_size() helper in alloc_chunk
Message-ID: <20200524205238.GA17576@embeddedor>
MIME-Version: 1.0
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Sun, 24 May 2020 22:27:33 -0400
Cc: linux-audit@redhat.com, linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

One of the more common cases of allocation size calculations is finding
the size of a structure that has a zero-sized array at the end, along
with memory for some number of elements for that array. For example:

struct audit_chunk {
	...
        struct node {
                struct list_head list;
                struct audit_tree *owner;
                unsigned index;         /* index; upper bit indicates 'will prune' */
        } owners[];
};

Make use of the struct_size() helper instead of an open-coded version
in order to avoid any potential type mistakes.

So, replace the following form:

offsetof(struct audit_chunk, owners) + count * sizeof(struct node);

with:

struct_size(chunk, owners, count)

This code was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 kernel/audit_tree.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/kernel/audit_tree.c b/kernel/audit_tree.c
index e49c912f862d0..1b7a2f0417936 100644
--- a/kernel/audit_tree.c
+++ b/kernel/audit_tree.c
@@ -188,11 +188,9 @@ static struct fsnotify_mark *alloc_mark(void)
 static struct audit_chunk *alloc_chunk(int count)
 {
 	struct audit_chunk *chunk;
-	size_t size;
 	int i;
 
-	size = offsetof(struct audit_chunk, owners) + count * sizeof(struct node);
-	chunk = kzalloc(size, GFP_KERNEL);
+	chunk = kzalloc(struct_size(chunk, owners, count), GFP_KERNEL);
 	if (!chunk)
 		return NULL;
 
-- 
2.26.2

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

