Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE302FEFF4
	for <lists+linux-audit@lfdr.de>; Thu, 21 Jan 2021 17:16:58 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-x8CPKev-MveCqctiRU4eUA-1; Thu, 21 Jan 2021 11:16:54 -0500
X-MC-Unique: x8CPKev-MveCqctiRU4eUA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 402AE871805;
	Thu, 21 Jan 2021 16:16:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11FFB60BF3;
	Thu, 21 Jan 2021 16:16:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BEAA04BB7B;
	Thu, 21 Jan 2021 16:16:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10LGGC7j028626 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 21 Jan 2021 11:16:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 08F2E2026D3A; Thu, 21 Jan 2021 16:16:12 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 010362026D35
	for <linux-audit@redhat.com>; Thu, 21 Jan 2021 16:16:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 881AA803C9F
	for <linux-audit@redhat.com>; Thu, 21 Jan 2021 16:16:08 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-300-NWMlX1P0OjuT7kWzHnyXsw-1;
	Thu, 21 Jan 2021 11:16:06 -0500
X-MC-Unique: NWMlX1P0OjuT7kWzHnyXsw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 8360CABD6;
	Thu, 21 Jan 2021 16:16:03 +0000 (UTC)
From: Enzo Matsumiya <ematsumiya@suse.de>
To: linux-audit@redhat.com
Subject: [RFC PATCH] audit.spec: create audit group for log read access
Date: Thu, 21 Jan 2021 13:15:42 -0300
Message-Id: <20210121161542.29406-1-ematsumiya@suse.de>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 10LGGC7j028626
X-loop: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch introduces a new "audit" group.

The purpose of this group is to restrict read access to audit.log file.

No users are added to this group by default in this patch; it's up to
the user to do so.

One use case for this is to use AppArmor denial notifications (aa-notify),
which currently requires sudo. So, with this patch, instead of
modifying sudo configuration, the user who wants to run aa-notify to
read audit.log can just be added to the new audit group.

This patch already uses systemd-sysuser facilities to create system
groups.

Signed-off-by: Enzo Matsumiya <ematsumiya@suse.de>
---
 audit.spec              | 27 +++++++++++++++++++++++++--
 init.d/auditd.conf      |  2 +-
 system-group-audit.conf |  2 ++
 3 files changed, 28 insertions(+), 3 deletions(-)
 create mode 100644 system-group-audit.conf

diff --git a/audit.spec b/audit.spec
index 23153a60dc80..be6490b7ad09 100644
--- a/audit.spec
+++ b/audit.spec
@@ -7,22 +7,35 @@ License: GPLv2+
 Group: System Environment/Daemons
 URL: http://people.redhat.com/sgrubb/audit/
 Source0: http://people.redhat.com/sgrubb/audit/%{name}-%{version}.tar.gz
+Source1: system-group-audit.conf
 BuildRequires: gcc swig
 BuildRequires: golang
 BuildRequires: krb5-devel libcap-ng-devel
 BuildRequires: kernel-headers >= 2.6.29
 BuildRequires: systemd
+BuildRequires: sysuser-tools
 
 Requires: %{name}-libs = %{version}-%{release}
 Requires(post): systemd coreutils
 Requires(preun): systemd initscripts
 Requires(postun): systemd coreutils initscript
+Requires: group(audit)
 
 %description
 The audit package contains the user space utilities for
 storing and searching the audit records generated by
 the audit subsystem in the Linux 2.6 and later kernels.
 
+%package -n system-group-audit
+Summary:       System group 'audit'
+License:       LGPL-2.1-or-later
+Group:         System/Fhs
+Provides:      group(audit)
+%sysusers_requires
+
+%description -n system-group-audit
+This package contains the system group 'audit' for restrict read access to logs.
+
 %package libs
 Summary: Dynamic library for libaudit
 License: LGPLv2+
@@ -98,13 +111,17 @@ behavior.
 
 make CFLAGS="%{optflags}" %{?_smp_mflags}
 
+%sysusers_generate_pre %{SOURCE1} audit
+
 %install
 mkdir -p $RPM_BUILD_ROOT/{sbin,etc/audit/plugins.d,etc/audit/rules.d}
 mkdir -p $RPM_BUILD_ROOT/%{_mandir}/{man5,man8}
 mkdir -p $RPM_BUILD_ROOT/%{_lib}
 mkdir -p $RPM_BUILD_ROOT/%{_libdir}/audit
-mkdir --mode=0700 -p $RPM_BUILD_ROOT/%{_var}/log/audit
+mkdir --mode=0750 -p $RPM_BUILD_ROOT/%{_var}/log/audit
 mkdir -p $RPM_BUILD_ROOT/%{_var}/spool/audit
+mkdir -p $RPM_BUILD_ROOT/%{_sysusersdir}
+install -m 0644 %{SOURCE1} $RPM_BUILD_ROOT/%{_sysusersdir}/
 make DESTDIR=$RPM_BUILD_ROOT install
 
 mkdir -p $RPM_BUILD_ROOT/%{_libdir}
@@ -143,6 +160,8 @@ if [ "$files" -eq 0 ] ; then
 fi
 %systemd_post auditd.service
 
+%pre -n system-group-audit -f audit.pre
+
 %preun
 %systemd_preun auditd.service
 if [ $1 -eq 0 ]; then
@@ -228,7 +247,8 @@ fi
 %attr(750,root,root) %{_libexecdir}/initscripts/legacy-actions/auditd/state
 %attr(750,root,root) %{_libexecdir}/initscripts/legacy-actions/auditd/stop
 %ghost %{_localstatedir}/run/auditd.state
-%attr(-,root,-) %dir %{_var}/log/audit
+%attr(750,root,audit) %dir %{_var}/log/audit
+%ghost %config(noreplace) %attr(640,root,audit) %dir %{_var}/log/audit/audit.log
 %attr(750,root,root) %dir /etc/audit
 %attr(750,root,root) %dir /etc/audit/rules.d
 %attr(750,root,root) %dir /etc/audit/plugins.d
@@ -238,6 +258,9 @@ fi
 %config(noreplace) %attr(640,root,root) /etc/audit/audit-stop.rules
 %config(noreplace) %attr(640,root,root) /etc/audit/plugins.d/af_unix.conf
 
+%files -n system-group-audit
+%{_sysusersdir}/system-group-audit.conf
+
 %files -n audispd-plugins
 %config(noreplace) %attr(640,root,root) /etc/audit/plugins.d/audispd-zos-remote.conf
 %config(noreplace) %attr(640,root,root) /etc/audit/zos-remote.conf
diff --git a/init.d/auditd.conf b/init.d/auditd.conf
index ff6a3352854f..0c68c00322f9 100644
--- a/init.d/auditd.conf
+++ b/init.d/auditd.conf
@@ -5,7 +5,7 @@
 local_events = yes
 write_logs = yes
 log_file = /var/log/audit/audit.log
-log_group = root
+log_group = audit
 log_format = ENRICHED
 flush = INCREMENTAL_ASYNC
 freq = 50
diff --git a/system-group-audit.conf b/system-group-audit.conf
new file mode 100644
index 000000000000..ea2ffb04b405
--- /dev/null
+++ b/system-group-audit.conf
@@ -0,0 +1,2 @@
+# Type Name ID GECOS [HOME]
+g audit -
-- 
2.30.0


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

