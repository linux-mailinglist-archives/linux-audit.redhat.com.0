Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8FA77213B1B
	for <lists+linux-audit@lfdr.de>; Fri,  3 Jul 2020 15:37:31 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-UIYzNiSGPKKuEVF4Rwl-ow-1; Fri, 03 Jul 2020 09:37:28 -0400
X-MC-Unique: UIYzNiSGPKKuEVF4Rwl-ow-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66F0987950B;
	Fri,  3 Jul 2020 13:37:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FDF378120;
	Fri,  3 Jul 2020 13:37:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E408C1809547;
	Fri,  3 Jul 2020 13:37:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 063Db4Nx008134 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 3 Jul 2020 09:37:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 11B181007A49; Fri,  3 Jul 2020 13:37:04 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D73C112C06E
	for <linux-audit@redhat.com>; Fri,  3 Jul 2020 13:37:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD81A8EF3A3
	for <linux-audit@redhat.com>; Fri,  3 Jul 2020 13:37:01 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-2-9dal217oNY20uhXiqiStXw-1; Fri, 03 Jul 2020 09:37:00 -0400
X-MC-Unique: 9dal217oNY20uhXiqiStXw-1
Received: by mail-qt1-f193.google.com with SMTP id e12so23854437qtr.9
	for <linux-audit@redhat.com>; Fri, 03 Jul 2020 06:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:date:message-id:user-agent
	:mime-version:content-transfer-encoding;
	bh=bJmqwWFrAIe8ZK9B67ZPHMKhCaBXUrrmbgzZcvhmbT0=;
	b=LIbP8+TESXTOltkc5btqQ4dV1JWRoI+Ive81y/Jian0WrPaE4uOC9ZU+rLXSVh61om
	IkFA494+VjcdGuMEGKNOC5wDfxXOSSnFYLev1fXFBFVqYCjrBQ4q/j8/vbp3/CdKo51/
	T/zYsZ5ndfIgc70yB0vucsebTWnLagdiF0B+5J74IrZl+trYUbze5UXEajXvWepNHuFm
	lj55NPAiRqncyK7JRtj1EUCPYAg2KMe/2T4CkFzZr4RV1tX7e/9I6dR7IrVZUoC7O2jO
	183TUJBEvf8kG2F6T8aNKRQAMadM81Et+ueHg3U++cb1vK7QpU/4Ibd4pCjVvdruE1F+
	Uw1g==
X-Gm-Message-State: AOAM533IQi8btfeCa6UuixRa6LhdGQzKVjsvhsikgWje3I1OaZMQjG9t
	TOzAstJr8P7NJJ9AkKgBvB38oILe8w==
X-Google-Smtp-Source: ABdhPJweXHQZCIZ09TB4Ia4NsEfzcvCSUK/hSin/naGrWBqifP4aa9aCMw3X9VjaQpv/M+00tWAIMA==
X-Received: by 2002:ac8:5484:: with SMTP id h4mr35754240qtq.322.1593783418831; 
	Fri, 03 Jul 2020 06:36:58 -0700 (PDT)
Received: from localhost (pool-96-230-24-152.bstnma.fios.verizon.net.
	[96.230.24.152]) by smtp.gmail.com with ESMTPSA id
	z68sm10734785qke.113.2020.07.03.06.36.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 03 Jul 2020 06:36:58 -0700 (PDT)
Subject: [PATCH] audit: use the proper gfp flags in the audit_log_nfcfg() calls
From: Paul Moore <paul@paul-moore.com>
To: linux-audit@redhat.com
Date: Fri, 03 Jul 2020 09:36:56 -0400
Message-ID: <159378341669.5956.13490174029711421419.stgit@sifl>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, netfilter-devel@vger.kernel.org,
	Jones Desougi <jones.desougi+netfilter@gmail.com>
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Commit 142240398e50 ("audit: add gfp parameter to audit_log_nfcfg")
incorrectly passed gfp flags to audit_log_nfcfg() which were not
consistent with the calling function, this commit fixes that.

Fixes: 142240398e50 ("audit: add gfp parameter to audit_log_nfcfg")
Reported-by: Jones Desougi <jones.desougi+netfilter@gmail.com>
Signed-off-by: Paul Moore <paul@paul-moore.com>
---
 net/netfilter/nf_tables_api.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/netfilter/nf_tables_api.c b/net/netfilter/nf_tables_api.c
index f7ff91479647..886e64291f41 100644
--- a/net/netfilter/nf_tables_api.c
+++ b/net/netfilter/nf_tables_api.c
@@ -5953,7 +5953,7 @@ static int nf_tables_dump_obj(struct sk_buff *skb, struct netlink_callback *cb)
 				goto cont;
 
 			if (reset) {
-				char *buf = kasprintf(GFP_KERNEL,
+				char *buf = kasprintf(GFP_ATOMIC,
 						      "%s:%llu;?:0",
 						      table->name,
 						      table->handle);
@@ -5962,7 +5962,7 @@ static int nf_tables_dump_obj(struct sk_buff *skb, struct netlink_callback *cb)
 						family,
 						obj->handle,
 						AUDIT_NFT_OP_OBJ_RESET,
-						GFP_KERNEL);
+						GFP_ATOMIC);
 				kfree(buf);
 			}
 
@@ -6084,7 +6084,7 @@ static int nf_tables_getobj(struct net *net, struct sock *nlsk,
 				family,
 				obj->handle,
 				AUDIT_NFT_OP_OBJ_RESET,
-				GFP_KERNEL);
+				GFP_ATOMIC);
 		kfree(buf);
 	}
 
@@ -6172,7 +6172,7 @@ void nft_obj_notify(struct net *net, const struct nft_table *table,
 			event == NFT_MSG_NEWOBJ ?
 				AUDIT_NFT_OP_OBJ_REGISTER :
 				AUDIT_NFT_OP_OBJ_UNREGISTER,
-			GFP_KERNEL);
+			gfp);
 	kfree(buf);
 
 	if (!report &&

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

