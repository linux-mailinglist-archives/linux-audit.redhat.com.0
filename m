Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id A81741317D4
	for <lists+linux-audit@lfdr.de>; Mon,  6 Jan 2020 19:55:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578336911;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+jZdHzoQkdt3bXX6MBq5rQB9wjFs03bVMOrD/SOCFZs=;
	b=JnCIgIzQof7uVBNPNnq3oHiprWi7uz1Ut2O1IG9xvOBJBL+uFXQKlCebJNOAbuyKOEGx2G
	aXefYNiwcU/PAjm3Eaxi9Ogzwvsjpp+mQ+SJMHuRj9JdrWp6Ol+8pVzwny/DYOI6kBeqkb
	x1w9+0bwMd3nEKWBWAXFVuVzQgj/H3Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-F42t-w0NNeqm43VYO9K20Q-1; Mon, 06 Jan 2020 13:55:07 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22904100550E;
	Mon,  6 Jan 2020 18:55:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A6B5C858BE;
	Mon,  6 Jan 2020 18:55:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 74518180880C;
	Mon,  6 Jan 2020 18:54:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 006IsnwY026932 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 6 Jan 2020 13:54:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 371FE5DA2C; Mon,  6 Jan 2020 18:54:49 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-34.phx2.redhat.com [10.3.112.34])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 76E3A5D9E5;
	Mon,  6 Jan 2020 18:54:40 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>, netfilter-devel@vger.kernel.org
Subject: [PATCH ghak25 v2 0/9] Address NETFILTER_CFG issues
Date: Mon,  6 Jan 2020 13:54:01 -0500
Message-Id: <cover.1577830902.git.rgb@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: F42t-w0NNeqm43VYO9K20Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There were questions about the presence and cause of unsolicited syscall events
in the logs containing NETFILTER_CFG records and sometimes unaccompanied
NETFILTER_CFG records.

During testing at least the following list of events trigger NETFILTER_CFG
records and the syscalls related (There may be more events that will trigger
this message type.):
	init_module, finit_module: modprobe
	setsockopt: iptables-restore, ip6tables-restore, ebtables-restore
	unshare: (h?)ostnamed
	clone: libvirtd

The syscall events unsolicited by any audit rule were found to be caused by a
missing !audit_dummy_context() check before creating a NETFILTER_CFG
record and issuing the record immediately rather than saving the
information to create the record at syscall exit.
Check !audit_dummy_context() before creating the NETFILTER_CFG record.

The vast majority of unaccompanied records are caused by the fedora default
rule: "-a never,task" and the occasional early startup one is I believe caused
by the iptables filter table module hard linked into the kernel rather than a
loadable module. The !audit_dummy_context() check above should avoid them.

A couple of other factors should help eliminate unaccompanied records
which include commit cb74ed278f80 ("audit: always enable syscall
auditing when supported and audit is enabled") which makes sure that
when audit is enabled, so automatically is syscall auditing, and ghak66
which addressed initializing audit before PID 1.

Ebtables module initialization to register tables doesn't generate records
because it was never hooked in to audit.  Recommend adding audit hooks to log
this.

Table unregistration was never logged, which is now covered.

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

Richard Guy Briggs (9):
  netfilter: normalize x_table function declarations
  netfilter: normalize ebtables function declarations
  netfilter: normalize ebtables function declarations II
  audit: record nfcfg params
  netfilter: x_tables audit only on syscall rule
  netfilter: ebtables audit only on syscall rule
  netfilter: ebtables audit table registration
  netfilter: add audit operation field
  netfilter: audit table unregister actions

 include/linux/audit.h           |  11 ++++
 kernel/auditsc.c                |  18 +++++
 net/bridge/netfilter/ebtables.c | 142 ++++++++++++++++++++--------------------
 net/netfilter/x_tables.c        |  56 +++++++---------
 4 files changed, 124 insertions(+), 103 deletions(-)

-- 
1.8.3.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

