Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id C55C81D9B4A
	for <lists+linux-audit@lfdr.de>; Tue, 19 May 2020 17:32:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589902349;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DbTADmPS0nWAwoslPi8mI10npDxVHweGYLFqdaO7oSg=;
	b=TUiqKdMBX8M7jq318kPMtGYGB7NOTwWKL2wcPTyrOxpKZsye+jTnCZn1OxkJPkvX68hmJG
	U4n3HrCQGtM0etZtPr+WK3FqY6Zmq2snsdrwHa9x+oXpFrffMzhQuIWzpavZyjAfua/aHR
	rPEq8dogh2aX0pHvbibx1ozwttDw+Ik=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-sRNx6OBBMSS_PO_00HDZpQ-1; Tue, 19 May 2020 11:32:27 -0400
X-MC-Unique: sRNx6OBBMSS_PO_00HDZpQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9308474;
	Tue, 19 May 2020 15:32:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 71C9F6246F;
	Tue, 19 May 2020 15:32:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AA0D74ED63;
	Tue, 19 May 2020 15:32:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04JFWHet003552 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 19 May 2020 11:32:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 060A66F43D; Tue, 19 May 2020 15:32:17 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D3C40600E3;
	Tue, 19 May 2020 15:32:09 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>
Subject: [PATCH ghak28/ghak25 user 0/2] parse EVENT_LISTENER and NETFILTER_CFG
Date: Tue, 19 May 2020 11:31:25 -0400
Message-Id: <1589902287-19911-1-git-send-email-rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

Richard Guy Briggs (2):
  ausearch-parse: add parser for YAASAO
  ausearch-parse: mod parser for YAASAO for NETFILTER_CFG

 src/ausearch-parse.c | 170 ++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 169 insertions(+), 1 deletion(-)

-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

