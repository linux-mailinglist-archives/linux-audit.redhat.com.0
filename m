Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 387EF2DFEC5
	for <lists+linux-audit@lfdr.de>; Mon, 21 Dec 2020 18:13:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608570822;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MYBNf85h0r6UQNizZ02DFFbpLuUUnGGpTKRvdPukIAU=;
	b=hn/plK8RJR2LTjAdmeCKLEj0hm3UECnPcUJ4dMb3iMC5MA2lZd6ja+FuqQA17Cv7cIHSrG
	kbYjJdcVuWewBjK2bYO2VzblqR87KLWBOzzuK/fyOeG3cQD2ZrtQja8SUgyqyfCRXtufss
	6/ZUrvfh4Ua3GTE91FUYUyAQIsKs8X0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-EQ3fc1AfN-W6OZzMu08rtA-1; Mon, 21 Dec 2020 12:13:39 -0500
X-MC-Unique: EQ3fc1AfN-W6OZzMu08rtA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA743B8104;
	Mon, 21 Dec 2020 17:13:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DF2C5D6D1;
	Mon, 21 Dec 2020 17:13:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 436E54BB7B;
	Mon, 21 Dec 2020 17:13:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BLHDPPA018874 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 21 Dec 2020 12:13:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B40DA5D9DB; Mon, 21 Dec 2020 17:13:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1A3F35D9CA;
	Mon, 21 Dec 2020 17:13:14 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux Containers List <containers@lists.linux-foundation.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH ghau51/ghau40 v10 00/11] add support for audit container
	identifier
Date: Mon, 21 Dec 2020 12:12:40 -0500
Message-Id: <20201221171251.2610890-1-rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, Eric Paris <eparis@parisplace.org>,
	mpatel@redhat.com, Neil Horman <nhorman@tuxdriver.com>
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add support for audit kernel container identifiers to userspace tools.

The first and second add new record types.  The third adds filter
support.  The fourth and 5th start to add search support.

The 6th is to read the calling process' audit container identifier from
the /proc filesystem matching the kernel /proc read patch.

The 7th is to fix signal support and the 8th is to learn the audit
container identifier of the process that signals the audit daemon.

The 9th is a touch up to allow the contid field to be interpreted as a
CSV list.

The 10th adds audit contid list support to ausearch.

The last adds audit library support to allow a process to give
permission to a container orchestrator in a non-init user namespace via
audit netlink messages.

See: https://github.com/linux-audit/audit-userspace/issues/51
See: https://github.com/linux-audit/audit-userspace/issues/40
See: https://github.com/linux-audit/audit-kernel/issues/90
See: https://github.com/linux-audit/audit-kernel/issues/91
See: https://github.com/linux-audit/audit-testsuite/issues/64
  https://githu.com/linux-audit/audit-testsuite/pull/91
  https://github.com/rgbriggs/audit-testsuite/tree/ghat64-contid
See: https://github.com/linux-audit/audit-kernel/wiki/RFE-Audit-Container-ID

A repo of the code is here:
  git@github.com:rgbriggs/audit-userspace.git ghau40-containerid-filter.v10
And test rpms built from it are here:
  people.redhat.com/~rbriggs/ghak90/git-a52e3dd-fc32

Changelog:
v10
- rebase on upstream

v9
- accept a contid list for sig_info2
- bump AUDIT_CONTAINER_ID to 1336 to accommodate AUDIT_EVENT_LISTENER
- fix logical result reversal in audit_signal_info_has_ctx()
- fix event_contid clist declaration, fix comment about CONTAINER_OP/ID old-/contid CSV
- add SET_CAPCONTID to lib/netlink.c adjust_reply() and check_events()
- rebase on ghak28 parser
- rebase on ghak25 parser
- rebase on ghau86 fix
- in auparse/interpret.c:print_contid() also detect "-1"
- remove patches to limit nesting depth and netns count
- whitespace fixes
- squash clist into slist
- simplify audit_[sg]et_capcontid()

v8
- renumber contid records and drop netlink contid set/get support
- remove subject attributes from parse_container_op()
- fix audit_request_signal_info.3 manpage
- add manpage for audit_set_capcontid()
- implement clist for contid list search
- rebase on audit_bpf patches (bump CONTAINER_ID to 1335)
- implement control for audit container identifier nesting depth limit with manpage
- implent control for audit container identifier netns count limit with manpage

v7
- rebase on ghau90 and touchup
- rebase on ghak10 support (change AUDIT_CONTAINER_ID to 1334)
- render type contid as a CSV
- switch from /proc to audit netlink to set/get contid, auid/sessionid
- add support for capcontid

v6
- auditd signaller tracking was moved to a new AUDIT_SIGNAL_INFO2
  request and record
- swap CONTAINER_OP contid/old-contid to ease parsing
- add to auparse

v5
- updated aux record from AUDIT_CONTAINER to AUDIT_CONTAINER_ID
- add AUDIT_CONTAINER_ID to normalization
- rebase on AUDIT_ANOM_LINK and AUDIT_MAC_CALIPSO_ADD

v4
- change from AUDIT_CONTAINER_ID to AUDIT_CONTAINER_OP
- change from AUDIT_FEATURE_BITMAP_CONTAINERID_FILTER to
  AUDIT_FEATURE_BITMAP_CONTAINERID
- change from event_container_id to event_contid internally
- change from container_id to contid and event_container_id to
  event_contid internally
- change command line option from --container-id to --contid

v3
- change from AUDIT_CONTAINER to AUDIT_CONTAINER_ID
- change from AUDIT_CONTAINER_INFO to AUDIT_CONTAINER
- change from AUDIT_CONTAINERID to AUDIT_CONTID
- update github issue refs
- add audit_get_containerid
- change event_container_id default value
- add --containerid to ausearch options help text
- update ausearch parser and error codes

v2
- rebase on UINT_MAX patch
- add patches for AUDIT_CONTAINER, AUDIT_CONTAINER_INFO, ausearch,
  normalization

Richard Guy Briggs (11):
  AUDIT_CONTAINER_OP message type basic support
  AUDIT_CONTAINER_ID message type basic support
  auditctl: add support for AUDIT_CONTID filter
  add ausearch containerid support
  start normalization containerid support
  libaudit: add support to get the task audit container identifier
  signal_info: only print context if it is available.
  add support for audit_signal_info2
  contid: interpret correctly CONTAINER_ID contid field csv
  ausearch: convert contid to comma-sep/carrat-mod cnode/clist
  libaudit: add support to get and set capcontid on a task

 auparse/auditd-config.c          |   1 +
 auparse/auparse-defs.h           |   3 +-
 auparse/interpret.c              |  10 ++
 auparse/normalize.c              |   1 +
 auparse/normalize_record_map.h   |   3 +
 auparse/typetab.h                |   2 +
 bindings/python/auparse_python.c |   1 +
 docs/Makefile.am                 |   3 +-
 docs/audit_get_capcontid.3       |  25 ++++
 docs/audit_get_containerid.3     |  25 ++++
 docs/audit_request_signal_info.3 |  15 ++-
 docs/audit_set_capcontid.3       |  24 ++++
 docs/auditctl.8                  |   3 +
 lib/fieldtab.h                   |   1 +
 lib/libaudit.c                   | 188 +++++++++++++++++++++++++++++--
 lib/libaudit.h                   |  36 +++++-
 lib/msg_typetab.h                |   4 +
 lib/netlink.c                    |   6 +
 src/Makefile.am                  |   6 +-
 src/auditctl-listing.c           |  21 ++++
 src/auditd-config.c              |   1 +
 src/auditd-config.h              |   1 +
 src/auditd-event.c               |  28 ++++-
 src/auditd-reconfig.c            |  27 +++--
 src/auditd.c                     |   4 +-
 src/aureport-options.c           |   2 +
 src/ausearch-contid.c            | 172 ++++++++++++++++++++++++++++
 src/ausearch-contid.h            |  60 ++++++++++
 src/ausearch-llist.c             |   6 +
 src/ausearch-llist.h             |   2 +
 src/ausearch-lol.c               |   4 +
 src/ausearch-match.c             |  35 ++++++
 src/ausearch-options.c           |  78 ++++++++++++-
 src/ausearch-options.h           |   2 +
 src/ausearch-parse.c             | 124 ++++++++++++++++++++
 src/ausearch-report.c            |   6 +-
 36 files changed, 898 insertions(+), 32 deletions(-)
 create mode 100644 docs/audit_get_capcontid.3
 create mode 100644 docs/audit_get_containerid.3
 create mode 100644 docs/audit_set_capcontid.3
 create mode 100644 src/ausearch-contid.c
 create mode 100644 src/ausearch-contid.h

-- 
2.18.4

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

