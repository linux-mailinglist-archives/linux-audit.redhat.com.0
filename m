Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id CCC9F168AA9
	for <lists+linux-audit@lfdr.de>; Sat, 22 Feb 2020 01:05:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582329905;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=78vipTWpsRkPPwVB0XwK/JxBEL+LBcI35bSNk+BdK/0=;
	b=TgDxk44tTtlkIz6mZDJO7g5YL5AHonTD+Xhcb/eP94gM2buQEQklDAKPCZHBasvSwa6e1/
	hYdu4os9Yvo5DvcJ/H+84Lhmj/uCBvZOlwQJq6BSYnpS2VbQIg1950AsMpO3zIvBhuQxdx
	ZIwXWZffuN84K8Xd6PT3UmQYHDSCkDQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-FmQ5Y1pdNLqjduKYxajWSw-1; Fri, 21 Feb 2020 19:05:03 -0500
X-MC-Unique: FmQ5Y1pdNLqjduKYxajWSw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3671E107ACC7;
	Sat, 22 Feb 2020 00:04:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6103E1001DF0;
	Sat, 22 Feb 2020 00:04:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D86DB35B1A;
	Sat, 22 Feb 2020 00:04:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01M04L5l001284 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 21 Feb 2020 19:04:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 084C0103E1DC; Sat, 22 Feb 2020 00:04:21 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 038E6103E1DA
	for <linux-audit@redhat.com>; Sat, 22 Feb 2020 00:04:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6E19185A78E
	for <linux-audit@redhat.com>; Sat, 22 Feb 2020 00:04:18 +0000 (UTC)
Received: from sonic309-28.consmr.mail.ne1.yahoo.com
	(sonic309-28.consmr.mail.ne1.yahoo.com [66.163.184.154]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-151-4VSUDl3OOCW042MSmcVRUw-1;
	Fri, 21 Feb 2020 19:04:16 -0500
X-MC-Unique: 4VSUDl3OOCW042MSmcVRUw-1
X-YMail-OSG: UJY3m.AVM1lyKzrvfiN8uNiT9GOVwNySidjKNmtFkuaYl1th0U8zI5WGMbpiTVo
	5KS63FmQ_A5x5IObkCIUr8QeXTwvrSrQulKm4uYN42HC.Xmm7yNAXyrZqwvGKiyxzO9mOPJg5Ki9
	LfC9kg.H5kjZ80Z1UU_eHQBQHrb_.VjKj8074ST9QIfWqrsiGam_odFg0sFApzSpQSB5uRopQpXd
	JUYJxoTj64dKR6p9SeuVHpYQUtAGrtIrsToZC233lu4ViUR99bJlRcxGoGM76DZv3qgB7YmiRq9R
	UctlBeD6_Hq5LrRs1Can1Y7GwFMws4KWi_w5xdJH49FYatoh_mlyY7CoQSMayIfha40a_QQTYmfN
	OTYaUPZ_dTvzHF2fmKboO.haygk7_gVMfo1eTmEJoXFMCqySWxq3CoPfz3N4.hnpMFm6_qMCT_.u
	XUZq54mDsSLdMqnZXYQJ9TBORwBhd4Z25qfL4FR6tOEB3jp6zkJBuIoGv6YiedotWCgdHCfn7rK.
	3vDE6lg0dcsvgMBF92TEDVlLXClJooCtUaCDsex9FcSlaQRShdXHS6vjSrQIfTC8ReFf6AP0EBy_
	YOc9c5RrgQ6saFHtQU_jG4Pt1cwlZi6ek_yYtZurJj_yDPYka6OKlEodmX8HFOxOK.J2udDrmXeu
	jOsbpFbcIXhRWtqW0Kdbnvu0HRhjoT7brZcNUcKqIQzRVr8gqzxMxiVAXliFTlcNQsKXhRfJvNp0
	doXoYG3StfylWfeBXaSiu6qJsXr0uoqJquVZjS__dlx9Pw_EYlvMNlU7Kjr7js_JLh1GpeQHLhjB
	K5d7Iab41VrVs6r6.bXH7HluaxebAM5TaSvJ3TCOclEFucGehxVkTnSobI2eVi.9XLkhyeE6MiFf
	bZp9LLkfLbkvBfR41__eVYoFEfLvnEvr_GE2Ay94KHDCZAtxpk5FL72rWMCleHRy869VgILQeoeR
	jNoYR4TmbGtHPtori.a1JRgAyxcDp0kuK5zQLG8i_fP1C._uV..QOxifiOLiC2PmDTgPSHfEhcAJ
	rELzTRMa_XIku2WWWyovWqM4uSnbk5Tvf81_0t5habYrEXak9jqf6Hl9S6AjmvLrpnANp7iXvEcK
	HK4vTXheoMlXTvdzGHePYWT2FGy0xU0g624RyXlA7dP6Cycxs0Wuu03qMnO0DK2urIlj3QE.b9mi
	FAU6WFZUJPJ37xuKiq9BcfB6ThLbfYHz5egsLRnpJ4d2BXu0wjVAgV77YW5sBzwSgqDgMVG_zvIS
	X8OMYdHieLHDwTtSlu6cPxsOTI9kfkCaG2Wy_lx.bC3S7.YnakWyxxevvlioC8De2C.zp7YLIJF3
	USo.iyeoin1.b_TSEebeG1nYzCEpInMEGxSHNN_10RK8gZvjqmSbKcQqRNisOA25JnVri6hTrRxw
	tyK1cp0B3dDCVFuxjJceLRWq3rixXRtlL72AY4kBC0IVruCo_dw.O3Bdg_iy12vaF9g--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic309.consmr.mail.ne1.yahoo.com with HTTP;
	Sat, 22 Feb 2020 00:04:15 +0000
Received: by smtp404.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID d818bf54dc5177874d24d3abbbf22d14; 
	Sat, 22 Feb 2020 00:04:10 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, linux-audit@redhat.com
Subject: [PATCH v15 00/23] LSM: Module stacking for AppArmor
Date: Fri, 21 Feb 2020 16:03:54 -0800
Message-Id: <20200222000407.110158-1-casey@schaufler-ca.com>
MIME-Version: 1.0
References: <20200222000407.110158-1-casey.ref@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01M04L5l001284
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Resending the audit related patches to the audit list,
as there have been problems with the CC lists. 

This patchset provides the changes required for
the AppArmor security module to stack safely with any other.

v15: Rebase to 5.6-rc1
     - Revise IMA data use (patch 0002)
     Incorporate feedback from v14
     - Fix lockdown module registration naming (patch 0002)
     - Revise how /proc/self/attr/context is gathered. (patch 0022)
     - Revise access modes on /proc/self/attr/context. (patch 0022)
     - Revise documentation on LSM external interfaces. (patch 0022)

v14: Rebase to 5.5-rc5
     Incorporate feedback from v13
     - Use an array of audit rules (patch 0002)
     - Significant change, removed Acks (patch 0002)
     - Remove unneeded include (patch 0013)
     - Use context.len correctly (patch 0015)
     - Reorder code to be more sensible (patch 0016)
     - Drop SO_PEERCONTEXT as it's not needed yet (patch 0023)

v13: Rebase to 5.5-rc2
     Incorporate feedback from v12
     - Print lsmblob size with %z (Patch 0002)
     - Convert lockdown LSM initialization. (Patch 0002)
     - Restore error check in nft_secmark_compute_secid (Patch 0006)
     - Correct blob scaffolding in ima_must_appraise() (Patch 0009)
     - Make security_setprocattr() clearer (Patch 0013)
     - Use lsm_task_display more widely (Patch 0013)
     - Use passed size in lsmcontext_init() (Patch 0014)
     - Don't add a smack_release_secctx() hook (Patch 0014)
     - Don't print warning in security_release_secctx() (Patch 0014)
     - Don't duplicate the label in nfs4_label_init_security() (Patch 0016)
     - Remove reviewed-by as code has significant change (Patch 0016)
     - Send the entire lsmblob for Tag 6 (Patch 0019)
     - Fix description of socket_getpeersec_stream parameters (Patch 0023)
     - Retain LSMBLOB_FIRST. What was I thinking? (Patch 0023)
     - Add compound context to LSM documentation (Patch 0023)

v12: Rebase to 5.5-rc1
     Fixed a couple of incorrect contractions in the text.

v11: Rebase to 5.4-rc6
     Incorporate feedback from v10
     - Disambiguate reading /proc/.../attr/display by restricting
       all use of the interface to the current process.
     - Fix a merge error in AppArmor's display attribute check

v10: Ask the security modules if the display can be changed.

v9: There is no version 9

v8: Incorporate feedback from v7
    - Minor clean-up in display value management
    - refactor "compound" context creation to use a common
      append_ctx() function.

v7: Incorporate feedback from v6
    - Make setting the display a privileged operation. The
      availability of compound contexts reduces the need for
      setting the display.

v6: Incorporate feedback from v5
    - Add subj_<lsm>= and obj_<lsm>= fields to audit records
    - Add /proc/.../attr/context to get the full context in
      lsmname\0value\0... format as suggested by Simon McVittie
    - Add SO_PEERCONTEXT for getsockopt() to get the full context
      in the same format, also suggested by Simon McVittie.
    - Add /sys/kernel/security/lsm_display_default to provide
      the display default value.

v5: Incorporate feedback from v4
    - Initialize the lsmcontext in security_secid_to_secctx()
    - Clear the lsmcontext in all security_release_secctx() cases
    - Don't use the "display" on strictly internal context
      interfaces.
    - The SELinux binder hooks check for cases where the context
      "display" isn't compatible with SELinux.

v4: Incorporate feedback from v3
    - Mark new lsm_<blob>_alloc functions static
    - Replace the lsm and slot fields of the security_hook_list
      with a pointer to a LSM allocated lsm_id structure. The
      LSM identifies if it needs a slot explicitly. Use the
      lsm_id rather than make security_add_hooks return the
      slot value.
    - Validate slot values used in security.c
    - Reworked the "display" process attribute handling so that
      it works right and doesn't use goofy list processing.
    - fix display value check in dentry_init_security
    - Replace audit_log of secids with '?' instead of deleting
      the audit log

v3: Incorporate feedback from v2
    - Make lsmblob parameter and variable names more
      meaningful, changing "le" and "l" to "blob".
    - Improve consistency of constant naming.
    - Do more sanity checking during LSM initialization.
    - Be a bit clearer about what is temporary scaffolding.
    - Rather than clutter security_getpeersec_dgram with
      otherwise unnecessary checks remove the apparmor
      stub, which does nothing useful.

Patch 0001 moves management of the sock security blob
from the individual modules to the infrastructure.

Patches 0002-0012 replace system use of a "secid" with
a structure "lsmblob" containing information from the
security modules to be held and reused later. At this
point lsmblob contains an array of u32 secids, one "slot"
for each of the security modules compiled into the
kernel that used secids. A "slot" is allocated when
a security module requests one.
The infrastructure is changed to use the slot number
to pass the correct secid to or from the security module
hooks.

It is important that the lsmblob be a fixed size entity
that does not have to be allocated. Several of the places
where it is used would have performance and/or locking
issues with dynamic allocation.

Patch 0013 provides a mechanism for a process to
identify which security module's hooks should be used
when displaying or converting a security context string.
A new interface /proc/self/attr/display contains the name
of the security module to show. Reading from this file
will present the name of the module, while writing to
it will set the value. Only names of active security
modules are accepted. Internally, the name is translated
to the appropriate "slot" number for the module which
is then stored in the task security blob. Setting the
display requires that all modules using the /proc interfaces
allow the transition. The "display" of other processess
can be neither read nor written. All suggested cases
for reading the display of a different process have race
conditions.

Patch 0014 Starts the process of changing how a security
context is represented. Since it is possible for a
security context to have been generated by more than one
security module it is now necessary to note which module
created a security context so that the correct "release"
hook can be called. There are several places where the
module that created a security context cannot be inferred.

This is achieved by introducing a "lsmcontext" structure
which contains the context string, its length and the
"slot" number of the security module that created it.
The security_release_secctx() interface is changed,
replacing the (string,len) pointer pair with a lsmcontext
pointer.

Patches 0015-0017 convert the security interfaces from
(string,len) pointer pairs to a lsmcontext pointer.
The slot number identifying the creating module is
added by the infrastructure. Where the security context
is stored for extended periods the data type is changed.

The Netlabel code is converted to save lsmblob structures
instead of secids in Patch 0018.

Patch 0019 adds checks to the binder hooks which verify
that if both ends of a transaction use the same "display".

Patches 0020-0021 add addition data to the audit records
to identify the LSM specific data for all active modules.

Patch 0022 adds a new interfaces for getting the
compound security contexts.

Finally, with all interference on the AppArmor hooks
removed, Patch 0023 removes the exclusive bit from
AppArmor. An unnecessary stub hook was also removed.

The Ubuntu project is using an earlier version of
this patchset in their distribution to enable stacking
for containers.

Performance measurements to date have the change
within the "noise". The sockperf and dbench results
are on the order of 0.2% to 0.8% difference, with
better performance being as common as worse. The
benchmarks were run with AppArmor and Smack on Ubuntu.

https://github.com/cschaufler/lsm-stacking.git#stack-5.6-rc1-v15

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 Documentation/security/lsm.rst          |  22 ++
 drivers/android/binder.c                |  26 +-
 fs/ceph/xattr.c                         |   6 +-
 fs/nfs/nfs4proc.c                       |   8 +-
 fs/nfsd/nfs4xdr.c                       |  20 +-
 fs/proc/base.c                          |   2 +
 include/linux/audit.h                   |   5 +-
 include/linux/cred.h                    |   3 +-
 include/linux/lsm_hooks.h               |  34 ++-
 include/linux/security.h                | 159 ++++++++--
 include/net/af_unix.h                   |   2 +-
 include/net/netlabel.h                  |   8 +-
 include/net/scm.h                       |  15 +-
 kernel/audit.c                          |  78 +++--
 kernel/audit.h                          |   9 +-
 kernel/audit_fsnotify.c                 |   1 +
 kernel/auditfilter.c                    |  34 ++-
 kernel/auditsc.c                        | 139 +++++----
 kernel/cred.c                           |  12 +-
 net/ipv4/cipso_ipv4.c                   |  23 +-
 net/ipv4/ip_sockglue.c                  |  12 +-
 net/netfilter/nf_conntrack_netlink.c    |  20 +-
 net/netfilter/nf_conntrack_standalone.c |  11 +-
 net/netfilter/nfnetlink_queue.c         |  26 +-
 net/netfilter/nft_meta.c                |  12 +-
 net/netfilter/xt_SECMARK.c              |   5 +-
 net/netlabel/netlabel_kapi.c            |   6 +-
 net/netlabel/netlabel_unlabeled.c       |  98 +++---
 net/netlabel/netlabel_unlabeled.h       |   2 +-
 net/netlabel/netlabel_user.c            |  13 +-
 net/netlabel/netlabel_user.h            |   6 +-
 net/unix/af_unix.c                      |   6 +-
 net/xfrm/xfrm_policy.c                  |   2 +
 net/xfrm/xfrm_state.c                   |   2 +
 security/apparmor/include/apparmor.h    |   3 +-
 security/apparmor/include/net.h         |   6 +-
 security/apparmor/include/procattr.h    |   2 +-
 security/apparmor/lsm.c                 | 105 ++++---
 security/apparmor/procattr.c            |  22 +-
 security/commoncap.c                    |   7 +-
 security/integrity/ima/ima.h            |  15 +-
 security/integrity/ima/ima_api.c        |  11 +-
 security/integrity/ima/ima_appraise.c   |   6 +-
 security/integrity/ima/ima_main.c       |  42 +--
 security/integrity/ima/ima_policy.c     |  53 ++--
 security/integrity/integrity_audit.c    |   1 +
 security/loadpin/loadpin.c              |   8 +-
 security/lockdown/lockdown.c            |   7 +-
 security/safesetid/lsm.c                |   8 +-
 security/security.c                     | 525 +++++++++++++++++++++++++++++---
 security/selinux/hooks.c                |  99 +++---
 security/selinux/include/classmap.h     |   2 +-
 security/selinux/include/objsec.h       |   5 +
 security/selinux/include/security.h     |   1 +
 security/selinux/netlabel.c             |  25 +-
 security/selinux/ss/services.c          |   4 +-
 security/smack/smack.h                  |   6 +
 security/smack/smack_lsm.c              |  83 ++---
 security/smack/smack_netfilter.c        |   8 +-
 security/smack/smackfs.c                |  10 +-
 security/tomoyo/tomoyo.c                |   8 +-
 security/yama/yama_lsm.c                |   7 +-
 62 files changed, 1350 insertions(+), 556 deletions(-)


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

