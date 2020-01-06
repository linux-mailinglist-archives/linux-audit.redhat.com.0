Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E13CC1317D9
	for <lists+linux-audit@lfdr.de>; Mon,  6 Jan 2020 19:56:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578336964;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:in-reply-to:references:references:references:
	 list-id:list-help:list-unsubscribe:list-subscribe:list-post;
	bh=iZeaAxZmZxclp2yPmWteuRtS4OUReA0myRZyZaodk9Y=;
	b=hwBKBvrudjZJE59h1b2luD06xt6yZD7L6sPrntWIJwoAGzIN9USrLs8OpvN3vsflYjMHje
	/7hfgcQ8cNTfymx8je/nKbP/dFFdpFrrmkd8OojcqN1c8J7oP2XK+C4JotMyFDOms7iTKi
	82t65G+7ctf6363aLNJ8poZGyijEJRM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-DPtmfyx5OdiNFv_rgEUtFQ-1; Mon, 06 Jan 2020 13:56:03 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03C8B190D37B;
	Mon,  6 Jan 2020 18:55:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D441D60CC0;
	Mon,  6 Jan 2020 18:55:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9099481C77;
	Mon,  6 Jan 2020 18:55:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 006ItqWe027141 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 6 Jan 2020 13:55:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D204B5E267; Mon,  6 Jan 2020 18:55:51 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-34.phx2.redhat.com [10.3.112.34])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 230685DE54;
	Mon,  6 Jan 2020 18:55:42 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>, netfilter-devel@vger.kernel.org
Subject: [PATCH ghak25 v2 6/9] netfilter: ebtables audit only on syscall rule
Date: Mon,  6 Jan 2020 13:54:07 -0500
Message-Id: <a1de082129f5db330c0a16b3d8b279a99c5529f2.1577830902.git.rgb@redhat.com>
In-Reply-To: <cover.1577830902.git.rgb@redhat.com>
References: <cover.1577830902.git.rgb@redhat.com>
In-Reply-To: <cover.1577830902.git.rgb@redhat.com>
References: <cover.1577830902.git.rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, fw@strlen.de, ebiederm@xmission.com,
	twoerner@redhat.com, eparis@parisplace.org, tgraf@infradead.org
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
X-MC-Unique: DPtmfyx5OdiNFv_rgEUtFQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Call new audit_nf_cfg() to store table parameters for later use with
syscall records.

See: https://github.com/linux-audit/audit-kernel/issues/25
See: https://github.com/linux-audit/audit-kernel/issues/35
Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 net/bridge/netfilter/ebtables.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/net/bridge/netfilter/ebtables.c b/net/bridge/netfilter/ebtables.c
index b3c784ae33a0..57dc11c0f349 100644
--- a/net/bridge/netfilter/ebtables.c
+++ b/net/bridge/netfilter/ebtables.c
@@ -1048,14 +1048,8 @@ static int do_replace_finish(struct net *net, struct ebt_replace *repl,
 	vfree(table);
 	vfree(counterstmp);
 
-#ifdef CONFIG_AUDIT
-	if (audit_enabled) {
-		audit_log(audit_context(), GFP_KERNEL,
-			  AUDIT_NETFILTER_CFG,
-			  "table=%s family=%u entries=%u",
-			  repl->name, AF_BRIDGE, repl->nentries);
-	}
-#endif
+	if (audit_enabled)
+		audit_nf_cfg(repl->name, AF_BRIDGE, repl->nentries);
 	return ret;
 
 free_unlock:
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

