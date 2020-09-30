Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 035CB27EEB5
	for <lists+linux-audit@lfdr.de>; Wed, 30 Sep 2020 18:16:06 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601482566;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=R6g/oRKcD8q+g4KlJ5afGaei2A+kzn5zNfiX8xT1REY=;
	b=UnI3ELeTYyu+iAb1tuJIaQjf+P3DHLXqHlGcg6EvgUUBdkbYULJ42/SK9UmqtR+B71lJ5M
	t9LXTr5SxlcBMIdzZpQ8swGw8s7vSSyYnlq5rmxbpDe8/llGKPegmPxXqgPYZuczcQcfw3
	D/iSWpjyAPvN0rr77588vwmN/mtj78A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-Y9KXDxGcMRuFAuScXe_7GA-1; Wed, 30 Sep 2020 12:16:03 -0400
X-MC-Unique: Y9KXDxGcMRuFAuScXe_7GA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D557564084;
	Wed, 30 Sep 2020 16:15:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AFB8F78807;
	Wed, 30 Sep 2020 16:15:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CA3DC44A5D;
	Wed, 30 Sep 2020 16:15:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08UGCQQd006581 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 30 Sep 2020 12:12:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D42836198B; Wed, 30 Sep 2020 16:12:26 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-117-41.rdu2.redhat.com [10.10.117.41])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 742D865F5E;
	Wed, 30 Sep 2020 16:12:21 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.cz>,
	linux-audit@redhat.com, Paul Moore <paul@paul-moore.com>
Subject: [PATCH 0/3] fanotify: Allow user space to pass back additional audit
	info
Date: Wed, 30 Sep 2020 12:12:19 -0400
Message-ID: <2042449.irdbgypaU6@x2>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
Cc: Amir Goldstein <amir73il@gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The Fanotify API can be used for access control by requesting permission
event notification. The user space tooling that uses it may have a
complicated policy that inherently contains additional context for the
decision. If this information were available in the audit trail, policy
writers can close the loop on debugging policy. Also, if this additional
information were available, it would enable the creation of tools that
can suggest changes to the policy similar to how audit2allow can help
refine labeled security.

This patch defines 2 bit maps within the response variable returned from
user space on a permission event. The first field is 3 bits for the 
context type. The context type will describe what the meaning is of the
second bit field. The audit system will separate the pieces and log them
individually.

The audit function was updated to log the additional information in the
AUDIT_FANOTIFY record. The following is an example of the new record
format:

type=FANOTIFY msg=audit(1600385147.372:590): resp=2 ctx_type=1 fan_ctx=17


Steve Grubb (3):
  fanotify: Ensure consistent variable type for response
  fanotify: define bit map fields to hold response decision context
  fanotify: Allow audit to use the full permission event response

 fs/notify/fanotify/fanotify.c      |  5 ++---
 fs/notify/fanotify/fanotify.h      |  2 +-
 fs/notify/fanotify/fanotify_user.c | 11 +++--------
 include/linux/fanotify.h           |  5 +++++
 include/uapi/linux/fanotify.h      | 31 ++++++++++++++++++++++++++++++
 kernel/auditsc.c                   |  7 +++++--
 6 files changed, 47 insertions(+), 14 deletions(-)

-- 
2.26.2




--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

