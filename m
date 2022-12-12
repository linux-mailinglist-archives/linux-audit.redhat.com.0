Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C423964A2D3
	for <lists+linux-audit@lfdr.de>; Mon, 12 Dec 2022 15:07:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670854024;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=g0KAhjYUUZHljgK1JauLY/pEx/Nnzf/dZ6f/1PyAZwM=;
	b=RccUXuk4uC0HwBxGrrA1QS410ZPxIgR0ZhB/b32nuzvPbiZuZly+WU8v+Ogwhdim4pDbFL
	Jj6sYL5YNg8opJJRp9KYYgH3XeR3ZzX3D9/L0bnOjz3QRnphhF3Yzz7cnHYyJ94dyD9uXb
	S0lFl/MxEzMSNLn7Fe5ULblgeUjLjM0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-22-n7JoifquOK-LzCDw6jSpeQ-1; Mon, 12 Dec 2022 09:06:27 -0500
X-MC-Unique: n7JoifquOK-LzCDw6jSpeQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6C1F3C0F66B;
	Mon, 12 Dec 2022 14:06:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E477E2026D4B;
	Mon, 12 Dec 2022 14:06:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B6DA71946595;
	Mon, 12 Dec 2022 14:06:19 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DB06C1946586 for <linux-audit@listman.corp.redhat.com>;
 Mon, 12 Dec 2022 14:06:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CE856492C18; Mon, 12 Dec 2022 14:06:18 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.com (ovpn-0-3.rdu2.redhat.com [10.22.0.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 49331492C14;
 Mon, 12 Dec 2022 14:06:17 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-api@vger.kernel.org
Subject: [PATCH v5 0/3] fanotify: Allow user space to pass back additional
 audit info
Date: Mon, 12 Dec 2022 09:06:08 -0500
Message-Id: <cover.1670606054.git.rgb@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: Jan Kara <jack@suse.cz>, Richard Guy Briggs <rgb@redhat.com>,
 Amir Goldstein <amir73il@gmail.com>, Eric Paris <eparis@parisplace.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

This patchset defines a new flag (FAN_INFO) and new extensions that
define additional information which are appended after the response
structure returned from user space on a permission event.  The appended
information is organized with headers containing a type and size that
can be delegated to interested subsystems.  One new information type is
defined to audit the triggering rule number.  

A newer kernel will work with an older userspace and an older kernel
will behave as expected and reject a newer userspace, leaving it up to
the newer userspace to test appropriately and adapt as necessary.

The audit function was updated to log the additional information in the
AUDIT_FANOTIFY record. The following are examples of the new record
format:
  type=FANOTIFY msg=audit(1600385147.372:590): resp=2 fan_type=1 fan_info=3137 subj_trust=3 obj_trust=5
  type=FANOTIFY msg=audit(1659730979.839:284): resp=1 fan_type=0 fan_info=3F subj_trust=? obj_trust=?

changelog:
v1:
- first version by Steve Grubb <sgrubb@redhat.com>
Link: https://lore.kernel.org/r/2042449.irdbgypaU6@x2

v2:
- enhancements suggested by Jan Kara <jack@suse.cz>
- 1/3 change %d to %u in pr_debug
- 2/3 change response from __u32 to __u16
- mod struct fanotify_response and fanotify_perm_event add extra_info_type, extra_info_buf
- extra_info_buf size max FANOTIFY_MAX_RESPONSE_EXTRA_LEN, add struct fanotify_response_audit_rule
- extend debug statements
- remove unneeded macros
- [internal] change interface to finish_permission_event() and process_access_response()
- 3/3 update format of extra information
- [internal] change interface to audit_fanotify()
- change ctx_type= to fan_type=
Link: https://lore.kernel.org/r/cover.1651174324.git.rgb@redhat.com

v3:
- 1/3 switch {,__}audit_fanotify() from uint to u32
- 2/3 re-add fanotify_get_response switch case FAN_DENY: to avoid unnecessary churn
- add FAN_EXTRA flag to indicate more info and break with old kernel
- change response from u16 to u32 to avoid endian issues
- change extra_info_buf to union
- move low-cost fd check earlier
- change FAN_RESPONSE_INFO_AUDIT_NONE to FAN_RESPONSE_INFO_NONE
- switch to u32 for internal and __u32 for uapi
Link: https://lore.kernel.org/all/cover.1652730821.git.rgb@redhat.com

v4:
- scrap FAN_INVALID_RESPONSE_MASK in favour of original to catch invalid response == 0
- introduce FANOTIFY_RESPONSE_* macros
- uapi: remove union
- keep original struct fanotify_response, add fan_info infra starting with audit reason
- uapi add struct fanotify_response_info_header{type/pad/len} and struct fanotify_response_info_audit_rule{hdr/rule}
- rename fan_ctx= to fan_info=, FAN_EXTRA to FAN_INFO
- change event struct from type/buf to len/buf
- enable multiple info extensions in one message
- hex encode fan_info in __audit_fanotify()
- record type FANOTIFY extended to "type=FANOTIFY msg=audit(1659730979.839:284): resp=1 fan_type=0 fan_info=3F"                                                                                                                     
Link: https://lore.kernel.org/all/cover.1659996830.git.rgb@redhat.com

v5:
- fixed warnings in p2/4 and p3/4 found by <lkp@intel.com>
- restore original behaviour for !FAN_INFO case and fanotify_get_response()
- rename member audit_rule to rule_number
- eliminate memory leak of info_buf on failure (no longer dynamic)
- rename buf:info, count:info_len, c:remain, ib:infop
- fix pr_debug
- return -ENOENT on FAN_INFO and fd==FAN_NOFD to signal new kernel
- fanotify_write() remove redundant size check
- add u32 subj_trust obj_trust fields with unknown value "2"
- split out to helper process_access_response_info()
- restore finish_permission_event() response_struct to u32
- assume and enforce one rule to audit, pass struct directly to __audit_fanotify()
- change fanotify_perm_event struct to union hdr/audir_rule
- add vspace to fanotify_write() and process_access_response_info()
- squash 3/4 with 4/4
- fix v3 and v4 links
Link: https://lore.kernel.org/all/cover.1670606054.git.rgb@redhat.com

Richard Guy Briggs (3):
  fanotify: Ensure consistent variable type for response
  fanotify: define struct members to hold response decision context
  fanotify,audit: Allow audit to use the full permission event response

 fs/notify/fanotify/fanotify.c      |  8 ++-
 fs/notify/fanotify/fanotify.h      |  6 +-
 fs/notify/fanotify/fanotify_user.c | 88 ++++++++++++++++++++++--------
 include/linux/audit.h              |  9 +--
 include/linux/fanotify.h           |  5 ++
 include/uapi/linux/fanotify.h      | 30 +++++++++-
 kernel/auditsc.c                   | 25 ++++++++-
 7 files changed, 138 insertions(+), 33 deletions(-)

-- 
2.27.0

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

