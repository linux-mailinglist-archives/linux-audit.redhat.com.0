Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 721601DBA42
	for <lists+linux-audit@lfdr.de>; Wed, 20 May 2020 18:53:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589993591;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mQuKcfl4NOA7UQMJ1xxcC3SldtXb0hxeMAP0lVKxaHw=;
	b=SETUjNdSsO63vSCM5nAUUHSdZ/3ARpsv9vftqy3I14D+NdMEYj4p9La4qUnrRq56Re47Yv
	bRLE63tgeX/RI8yWCvTDKXNtErmQmdtpyIbMpg0Ilpq7qvqrl4iorK0Ot17v2END2XE8r6
	2L/Sa1hewwr53JjEflszMvvG1YORVl8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-RCn25Sp9O2urNnXjPp7Atg-1; Wed, 20 May 2020 12:53:08 -0400
X-MC-Unique: RCn25Sp9O2urNnXjPp7Atg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A26118FE864;
	Wed, 20 May 2020 16:53:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD7D862932;
	Wed, 20 May 2020 16:53:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 65CF61809543;
	Wed, 20 May 2020 16:53:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04KGqxmM014816 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 20 May 2020 12:52:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6160860C87; Wed, 20 May 2020 16:52:59 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5AC3E60F89;
	Wed, 20 May 2020 16:52:46 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>
Subject: [PATCH ghak28/ghak25 user v6 0/2] parse EVENT_LISTENER and
	NETFILTER_CFG
Date: Wed, 20 May 2020 12:52:18 -0400
Message-Id: <1589993540-21629-1-git-send-email-rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a parser to parse subject attributes from EVENT_LISTENER and
NETFILTER_CFG record types.

This is a new order for subject attributes for two record types that
usually occur in user context and therefore would be informed by a
SYSCALL record, but occasionally stand alone and need the subject
attributes added.  In the case of the NETFILTER_CFG event, since it is
kernel-initiated, several of the subject attributes are unset and
meaningless in the kernel context and duplicates in user context, hence
removed.

Please see the upstream issues
https://github.com/linux-audit/audit-kernel/issues/28 and
https://github.com/linux-audit/audit-kernel/issues/25 .

changelog:
v6
- remove uid, auid as duplicates or unset

v1-4
- no userspace patches

Richard Guy Briggs (2):
  ausearch-parse: add parser for YAASAO
  ausearch-parse: mod parser for YAASAO for NETFILTER_CFG

 src/ausearch-parse.c | 168 ++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 167 insertions(+), 1 deletion(-)

-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

