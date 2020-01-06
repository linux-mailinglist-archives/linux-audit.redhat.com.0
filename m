Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 436BF1317DA
	for <lists+linux-audit@lfdr.de>; Mon,  6 Jan 2020 19:56:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578336982;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:in-reply-to:references:references:references:
	 list-id:list-help:list-unsubscribe:list-subscribe:list-post;
	bh=HBY8p2auoGDFJxqvdUE1FfcjDRWiFpGWnRs085y3u9g=;
	b=D6J12g5TJzffO8UwyKOgzad6rt2xqDj7QBbQTVn1grwWS7aTixV0MBbttylvPRilDLTAH7
	Nn/iNMe1MWNxGta1cHxm0kNVE7jXx8SHYCEtA9fFXBXxlL86MiPHt9EqFuVROjmgae30wO
	Bdi2Qzlvesqo6fpEMiNcZX/6tLL/1Ok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-i__tmPTiPkO6Rk6ebGnKtQ-1; Mon, 06 Jan 2020 13:56:20 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F2BC8024E0;
	Mon,  6 Jan 2020 18:56:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CE7F5D9E1;
	Mon,  6 Jan 2020 18:56:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D57C381C76;
	Mon,  6 Jan 2020 18:56:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 006IuBtd027221 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 6 Jan 2020 13:56:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 946C25D9E5; Mon,  6 Jan 2020 18:56:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-34.phx2.redhat.com [10.3.112.34])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E5A555D9D6;
	Mon,  6 Jan 2020 18:55:51 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>, netfilter-devel@vger.kernel.org
Subject: [PATCH ghak25 v2 7/9] netfilter: ebtables audit table registration
Date: Mon,  6 Jan 2020 13:54:08 -0500
Message-Id: <9f16dee52bac9a3068939283a0122a632ee0438d.1577830902.git.rgb@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: i__tmPTiPkO6Rk6ebGnKtQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Generate audit NETFILTER_CFG records on ebtables table registration.

Previously this was only being done for all x_tables operations and
ebtables table replacement.

Call new audit_nf_cfg() to store table parameters for later use with
syscall records.

Here is a sample accompanied record:
  type=NETFILTER_CFG msg=audit(1494907217.558:5403): table=filter family=7 entries=0

See: https://github.com/linux-audit/audit-kernel/issues/43
Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 net/bridge/netfilter/ebtables.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/bridge/netfilter/ebtables.c b/net/bridge/netfilter/ebtables.c
index 57dc11c0f349..58126547b175 100644
--- a/net/bridge/netfilter/ebtables.c
+++ b/net/bridge/netfilter/ebtables.c
@@ -1219,6 +1219,8 @@ int ebt_register_table(struct net *net, const struct ebt_table *input_table,
 		*res = NULL;
 	}
 
+	if (audit_enabled)
+		audit_nf_cfg(repl->name, AF_BRIDGE, repl->nentries);
 	return ret;
 free_unlock:
 	mutex_unlock(&ebt_mutex);
-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

