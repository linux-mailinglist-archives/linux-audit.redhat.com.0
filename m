Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C1AB809A
	for <lists+linux-audit@lfdr.de>; Thu, 19 Sep 2019 20:12:43 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 04CE08E584;
	Thu, 19 Sep 2019 18:12:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B40D60BF1;
	Thu, 19 Sep 2019 18:12:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 132D7180085A;
	Thu, 19 Sep 2019 18:12:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8JI9dUQ009050 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 19 Sep 2019 14:09:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 470791001B22; Thu, 19 Sep 2019 18:09:39 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-19.phx2.redhat.com [10.3.112.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A0C8210018F8;
	Thu, 19 Sep 2019 18:09:29 +0000 (UTC)
Date: Thu, 19 Sep 2019 14:09:26 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: containers@lists.linux-foundation.org,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH ghau51/ghau40 v7 00/12] add support for audit container
	identifier
Message-ID: <20190919180926.vhpuxv3vzuwjffop@madcap2.tricolour.ca>
References: <1568856472-10173-1-git-send-email-rgb@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1568856472-10173-1-git-send-email-rgb@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
Cc: eparis@parisplace.org, nhorman@redhat.com, mpatel@redhat.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Thu, 19 Sep 2019 18:12:42 +0000 (UTC)

On 2019-09-18 21:27, Richard Guy Briggs wrote:
> Add support for audit kernel container identifiers to userspace tools.
> 
> The first and second add new record types.  The third adds filter
> support.  The fourth and 5th start to add search support.
> 
> The 6th is to read the calling process' audit container identifier from
> the /proc filesystem matching the kernel /proc read patch.
> 
> The 7th is to fix signal support and the 8th is to learn the audit
> container identifier of the process that signals the audit daemon.
> 
> The 9th is a touch up to allow the contid field to be interpreted as a
> CSV list.
> 
> The 10th and 11th add audit netlink support for setting and getting
> contid, loginuid and sessionid preparing to deprecate the /proc
> interface.
> 
> The last adds audit library support to allow a process to give
> permission to a container orchestrator in a non-init user namespace via
> audit netlink messages.
> 
> See: https://github.com/linux-audit/audit-userspace/issues/51
> See: https://github.com/linux-audit/audit-userspace/issues/40
> See: https://github.com/linux-audit/audit-kernel/issues/90
> See: https://github.com/linux-audit/audit-kernel/issues/91
> See: https://github.com/linux-audit/audit-testsuite/issues/64
> See: https://github.com/linux-audit/audit-kernel/wiki/RFE-Audit-Container-ID

Here's my working tree:
        https://github.com/linux-audit/audit-userspace/compare/master...rgbriggs:ghau40-containerid-filter.v7.0
And a test rpms:
        http://people.redhat.com/~rbriggs/ghak90/git-247fe71

> Changelog:
> v7
> - rebase on ghau90 and touchup
> - rebase on ghak10 support (change AUDIT_CONTAINER_ID to 1334)
> - render type contid as a CSV
> - switch from /proc to audit netlink to set/get contid, auid/sessionid
> - add support for capcontid
> 
> v6
> - auditd signaller tracking was moved to a new AUDIT_SIGNAL_INFO2
>   request and record
> - swap CONTAINER_OP contid/old-contid to ease parsing
> - add to auparse
> 
> v5
> - updated aux record from AUDIT_CONTAINER to AUDIT_CONTAINER_ID
> - add AUDIT_CONTAINER_ID to normalization
> - rebase on AUDIT_ANOM_LINK and AUDIT_MAC_CALIPSO_ADD
> 
> v4
> - change from AUDIT_CONTAINER_ID to AUDIT_CONTAINER_OP
> - change from AUDIT_FEATURE_BITMAP_CONTAINERID_FILTER to
>   AUDIT_FEATURE_BITMAP_CONTAINERID
> - change from event_container_id to event_contid internally
> - change from container_id to contid and event_container_id to
>   event_contid internally
> - change command line option from --container-id to --contid
> 
> v3
> - change from AUDIT_CONTAINER to AUDIT_CONTAINER_ID
> - change from AUDIT_CONTAINER_INFO to AUDIT_CONTAINER
> - change from AUDIT_CONTAINERID to AUDIT_CONTID
> - update github issue refs
> - add audit_get_containerid
> - change event_container_id default value
> - add --containerid to ausearch options help text
> - update ausearch parser and error codes
> 
> v2
> - rebase on UINT_MAX patch
> - add patches for AUDIT_CONTAINER, AUDIT_CONTAINER_INFO, ausearch,
>   normalization
> 
> Richard Guy Briggs (12):
>   AUDIT_CONTAINER_OP message type basic support
>   AUDIT_CONTAINER_ID message type basic support
>   auditctl: add support for AUDIT_CONTID filter
>   add ausearch containerid support
>   start normalization containerid support
>   libaudit: add support to get the task audit container identifier
>   signal_info: only print context if it is available.
>   add support for audit_signal_info2
>   contid: interpret correctly CONTAINER_ID contid field csv
>   contid: switch from /proc to netlink
>   loginuid/sessionid: switch from /proc to netlink
>   libaudit: add support to get and set capcontid on a task
> 
>  auparse/auditd-config.c          |   1 +
>  auparse/auparse-defs.h           |   3 +-
>  auparse/interpret.c              |  10 +
>  auparse/normalize_record_map.h   |   2 +
>  auparse/typetab.h                |   2 +
>  bindings/python/auparse_python.c |   1 +
>  docs/Makefile.am                 |   3 +-
>  docs/audit_get_containerid.3     |  25 +++
>  docs/audit_request_signal_info.3 |   1 +
>  docs/audit_set_containerid.3     |  24 +++
>  docs/auditctl.8                  |   3 +
>  lib/fieldtab.h                   |   1 +
>  lib/libaudit.c                   | 425 ++++++++++++++++++++++++++++++++-------
>  lib/libaudit.h                   |  73 +++++++
>  lib/msg_typetab.h                |  10 +
>  lib/netlink.c                    |  15 ++
>  src/auditctl-listing.c           |  21 ++
>  src/auditd-config.c              |   1 +
>  src/auditd-config.h              |   1 +
>  src/auditd-event.c               |  28 ++-
>  src/auditd-reconfig.c            |  25 ++-
>  src/auditd.c                     |   3 +-
>  src/aureport-options.c           |   1 +
>  src/ausearch-llist.c             |   2 +
>  src/ausearch-llist.h             |   1 +
>  src/ausearch-match.c             |   3 +
>  src/ausearch-options.c           |  47 ++++-
>  src/ausearch-options.h           |   1 +
>  src/ausearch-parse.c             | 197 ++++++++++++++++++
>  src/ausearch-report.c            |   6 +-
>  30 files changed, 848 insertions(+), 88 deletions(-)
>  create mode 100644 docs/audit_get_containerid.3
>  create mode 100644 docs/audit_set_containerid.3
> 
> -- 
> 1.8.3.1
> 
> --
> Linux-audit mailing list
> Linux-audit@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-audit

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
