Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 964C81B4F7B
	for <lists+linux-audit@lfdr.de>; Wed, 22 Apr 2020 23:40:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587591655;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/YZRWgBXK6y0GTrOhH5eLBIuX2+wUzdhqNAA5zyeSRQ=;
	b=L8e6ODYFGnlJnvJhousfAd6DwyWtL+Za12pgKbTfKrhv6/aS2Y8JuNb60Q3zEf6RAw/8+j
	6AnxJmQ5rP24qgYO4QGeCTYkmOxx/nlSiCijEqgVR+HlH5vC4PhqfYOPLQXsTd3ajpxbaY
	33ubi9uBO+0Se0jpwmDT3//CTMX903E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-6AURoxC8P8utL5seg4N_PQ-1; Wed, 22 Apr 2020 17:40:25 -0400
X-MC-Unique: 6AURoxC8P8utL5seg4N_PQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9187107ACC4;
	Wed, 22 Apr 2020 21:40:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B10019C69;
	Wed, 22 Apr 2020 21:40:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4461F941C7;
	Wed, 22 Apr 2020 21:40:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03MLeCZ2009643 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 22 Apr 2020 17:40:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E34C45D70A; Wed, 22 Apr 2020 21:40:12 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.3.128.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5AA305D750;
	Wed, 22 Apr 2020 21:39:57 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>, netfilter-devel@vger.kernel.org
Subject: [PATCH ghak25 v4 0/3] Address NETFILTER_CFG issues
Date: Wed, 22 Apr 2020 17:39:27 -0400
Message-Id: <cover.1587500467.git.rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There were questions about the presence and cause of unsolicited syscall events
in the logs containing NETFILTER_CFG records and sometimes unaccompanied
NETFILTER_CFG records.

During testing at least the following list of events trigger NETFILTER_CFG
records and the syscalls related (There may be more events that will trigger
this message type.):
	init_module, finit_module: modprobe
	delete_module: rmmod
	setsockopt: iptables-restore, ip6tables-restore, ebtables-restore
	unshare: (h?)ostnamed, updatedb
	clone: libvirtd
	kernel threads garbage collecting empty ebtables

The syscall events unsolicited by any audit rule were found to be caused by a
missing !audit_dummy_context() check before issuing a NETFILTER_CFG
record.  In fact, since this is a configuration change it is required,
and we always want the accompanying syscall record even with no rules
present, so this has been addressed by ghak120.

The vast majority of unaccompanied records are caused by the fedora default
rule: "-a never,task" and the occasional early startup one is I believe caused
by the iptables filter table module hard linked into the kernel rather than a
loadable module.

A couple of other factors should help eliminate unaccompanied records
which include commit cb74ed278f80 ("audit: always enable syscall
auditing when supported and audit is enabled") which makes sure that
when audit is enabled, so automatically is syscall auditing, and ghak66
which addressed initializing audit before PID 1.

Ebtables module initialization to register tables doesn't generate records
because it was never hooked in to audit.  Recommend adding audit hooks to log
this covered by ghak43 covered by patch 1.

Table unregistration was never logged, which is now covered by ghak44 in
patch 2.  Unaccompanied records were caused by kernel threads
automatically unregistering empty ebtables, which necessitates adding
subject credentials covered in patch 3.

Seemingly duplicate records are not actually exact duplicates that are caused
by netfilter table initialization in different network namespaces from the same
syscall.  Recommend adding the network namespace ID (proc inode and dev)
to the record to make this obvious (address later with ghak79 after nsid
patches).

See: https://github.com/linux-audit/audit-kernel/issues/25
See: https://github.com/linux-audit/audit-kernel/issues/35
See: https://github.com/linux-audit/audit-kernel/issues/43
See: https://github.com/linux-audit/audit-kernel/issues/44

Changelog:
v4
- rebase on audit/next v5.7-rc1
- fix checkpatch.pl errors/warnings in 1/3 and 2/3

v3
- rebase on v5.6-rc1 audit/next
- change audit_nf_cfg to audit_log_nfcfg
- squash 2,3,4,5 to 1 and update patch descriptions
- add subject credentials to cover garbage collecting kernel threads

v2
- Rebase (audit/next 5.5-rc1) to get audit_context access and ebt_register_table ret code
- Split x_tables and ebtables updates
- Check audit_dummy_context
- Store struct audit_nfcfg params in audit_context, abstract to audit_nf_cfg() call
- Restore back to "table, family, entries" from "family, table, entries"
- Log unregistration of tables
- Add "op=" at the end of the AUDIT_NETFILTER_CFG record
- Defer nsid patch (ghak79) to once nsid patchset upstreamed (ghak32)
- Add ghak refs
- Ditch NETFILTER_CFGSOLO record

Richard Guy Briggs (3):
  audit: tidy and extend netfilter_cfg x_tables and ebtables logging
  netfilter: add audit table unregister actions
  audit: add subj creds to NETFILTER_CFG record to cover async
    unregister

 include/linux/audit.h           | 22 +++++++++++++++++++++
 kernel/auditsc.c                | 43 +++++++++++++++++++++++++++++++++++++++++
 net/bridge/netfilter/ebtables.c | 14 ++++++--------
 net/netfilter/x_tables.c        | 14 +++++---------
 4 files changed, 76 insertions(+), 17 deletions(-)

-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

