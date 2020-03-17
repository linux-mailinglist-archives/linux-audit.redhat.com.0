Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id EC514189063
	for <lists+linux-audit@lfdr.de>; Tue, 17 Mar 2020 22:31:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584480692;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hNDgNWDshqFEJzP9v03a0YFKBku57Br2F8vnfyMx1gc=;
	b=JWmSOsCaGFqOqTE5BihwyE2OJ94L6mrFsmGAPjSHjYvelzioYVYKx6ajPRqlKxFjAlrugs
	tbQnYBPRc8Je1vFuYTSo8MmYvSxGTLlx9kWpkZJig/DazhIpTzsgABYPKPu86xqaOvtciv
	VK+AhxFWXiqYOQMt5xUMOhclohnTlTo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-RqOtwU8uOWGzmLnin_AqFQ-1; Tue, 17 Mar 2020 17:31:27 -0400
X-MC-Unique: RqOtwU8uOWGzmLnin_AqFQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9517800D5A;
	Tue, 17 Mar 2020 21:31:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 015A09080B;
	Tue, 17 Mar 2020 21:31:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2051487010;
	Tue, 17 Mar 2020 21:31:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02HLVDRV019359 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 17 Mar 2020 17:31:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 02EC319757; Tue, 17 Mar 2020 21:31:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.36.110.5])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 28DB619C58;
	Tue, 17 Mar 2020 21:31:00 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>, netfilter-devel@vger.kernel.org
Subject: [PATCH ghak25 v3 0/3] Address NETFILTER_CFG issues
Date: Tue, 17 Mar 2020 17:30:21 -0400
Message-Id: <cover.1584480281.git.rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

 include/linux/audit.h           | 20 +++++++++++++++++++
 kernel/auditsc.c                | 43 +++++++++++++++++++++++++++++++++++++++++
 net/bridge/netfilter/ebtables.c | 14 ++++++--------
 net/netfilter/x_tables.c        | 14 +++++---------
 4 files changed, 74 insertions(+), 17 deletions(-)

-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

