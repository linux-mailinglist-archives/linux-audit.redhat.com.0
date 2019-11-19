Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 41466102B53
	for <lists+linux-audit@lfdr.de>; Tue, 19 Nov 2019 19:03:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574186633;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=1qLwntAYPzLkQP5tGs7MLT8xuDSbxSLMo0N0mHhyjn0=;
	b=I4A9e9Jp1LpOJXUDziUPQ5H9h1Vdinr3G7K5h2YrkVen4sk/yqX2bIle4cqbFljdTVo1s3
	EpV2S2E61JsFo66SQucdcjsLUY0A252Phx9OTsdz8QvWtNO4y/T6aDaIfvyRKpz5vkG/jF
	/L9AKm4MlpnjCPKiradE+SsJJo1LkdE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-e6icDSHhOXipj9hI3J2ekw-1; Tue, 19 Nov 2019 13:03:49 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7D291883523;
	Tue, 19 Nov 2019 18:03:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B307560467;
	Tue, 19 Nov 2019 18:03:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3D60918089C8;
	Tue, 19 Nov 2019 18:03:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAJI3P2R001022 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 19 Nov 2019 13:03:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CFDBC17590; Tue, 19 Nov 2019 18:03:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA5DE1C59A
	for <linux-audit@redhat.com>; Tue, 19 Nov 2019 18:03:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07E98800FFF
	for <linux-audit@redhat.com>; Tue, 19 Nov 2019 18:03:23 +0000 (UTC)
X-YMail-OSG: 4kJI9mwVM1l5_XEHvch7KalwjKw80Af4GCY2V3xR6WGCB0duxcF5xjk1mTLhv.c
	IE8tuGFk.qIqrLp3olbJQKd2dwlJ9wHx53af0HmgjJi6tbiFFUI2g1xuSx1FTGEHWhqkWX_TVTRA
	hVIMEMEHV.5GF_oIZxGVYQkF8DMGE4DtUY94X8TZy8KRSWVe9ADlfFnyCb3Ag.ChUEtUXpG2DPdm
	G8TWLJNQkxfBef8qVYL.M4qhSIWZVQ5romcb2nBDXm0uVcZkLVli4nfHrbnDncsrrN2j56Cxy_Rx
	7Ill8pXiyNtQWErep7x53MDF788UxPAXyUzOSV2G9kC7.RsGML1YBdhfYdWLvK8y8rE3atqVNZhm
	TajqTaC0Ju6LZ_h7hHUhBY_pU99jrENeuwDiyz1h_HrH4e8ZlpVghbkuRrOl7Bd_n0Y3NgPCvQmX
	rCtjH2vnaayAm93ANMEHuK0WSy8uHZsGNV2NIS1h98NoQM6OeDsqfbozmmXnwAo2ADtIj3K3e751
	_7MN.1FCJzLTyCJLQy.bQbj1Ala7yoBtea2SItrMgXrqeukpeeXd0ERcaBsliPK4007xWFyC2Opy
	22EEWc3LX9mJzvaw1Gc_WymCKcawl2AyuhcPtpqvARB3xhh1uYyPVoQx5RZaqb0a_Ov1H9o_FJBJ
	9S3UGTEQ9px38tTXtTjML_56FIhirONA5lKnkk6OO2Giw3RH4LR9q7jiEg4o35CZOpm61HYugBto
	qawr8.yWY8YQtNH5YRMGsQ_wcntWgqwQLLJPqXtQkYVsvsShpHyjs9FMiyirj.RTcfG6tGZmi9NY
	PV.JYBTUK.I56QXn7DUTxuQbk0f.tTIrHsnmk9aEIh88KSwuM8mUNE8wAv3ElDvxPO5Cue3oFBOT
	TTtuSfBmypwHmj_CWW2VBCt9WGCXlQZQe8VVpRa3HYXIXztRA7ONYtrEy0dwSXXxqzn3NYUvJNRI
	srLY87BQASdm76OwiriM759xSwKC9s1.4OCQbkuguJym0kKyemGOD9_68GQi2RPiPe.iQjQRHGnK
	jJY12lbsB.UkzhelAGD9.q7DsrVyJ.kmJSFd3h0bDC6PigR82GPrRNX.9ABXy_oIRJ08SSRVNZ3b
	zkI3pUFHuwaZrpg_V7wrUkl.rTG7WD72TL.jkP8ydcAAOJuJZ8LPLfbbRPON4UcCHgsKpCrgyQ4z
	CSwXEVjVshMKNErgF0mUVHH9Q3CF4.1JgGfHZqS8.6NMHe28gh6WrAlZ2tPE9Fka4IP9STC0YBgQ
	fYc81kr2twnfOimiw0fCGtpadZUuoyIKe_jXLMdzhRcffkfkDYh7ufpK_aFg50gY45LOCcb79wd8
	FLhBUiyHatVnZmaZDBvPMH8RKKTyIoAvWOCNYguXNLu4bj_tATtnril9_hI7XmkTLiKZbnSha7OY
	t3GKXYZW9INs-
Received: from sonic306-27.consmr.mail.ne1.yahoo.com
	(sonic306-27.consmr.mail.ne1.yahoo.com [66.163.189.89]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-275-hbbADUkXOdy7lr1i_ceQfg-1;
	Tue, 19 Nov 2019 13:03:21 -0500
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic306.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 19 Nov 2019 18:03:20 +0000
Received: by smtp411.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 5c625e7366fd4c784e1de9eefb8a42af; 
	Tue, 19 Nov 2019 18:03:17 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: linux-audit@redhat.com
Subject: [PATCH v11 00/25] LSM: Module stacking for AppArmor
Date: Tue, 19 Nov 2019 10:03:04 -0800
Message-Id: <20191119180315.12254-1-casey@schaufler-ca.com>
MIME-Version: 1.0
References: <20191119180315.12254-1-casey.ref@schaufler-ca.com>
X-MC-Unique: hbbADUkXOdy7lr1i_ceQfg-1
X-MC-Unique: e6icDSHhOXipj9hI3J2ekw-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAJI3P2R001022
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Sending the patches relevant to audit to the linux-audit list.

This patchset provides the changes required for
the AppArmor security module to stack safely with any other.

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
    - Add subj_<lsm>=3D and obj_<lsm>=3D fields to audit records
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

Patche 0001 moves management of the sock security blob from the individual
modules to the infrastructure.

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
instead of secids in Patches 0018-0019.

Patch 0020 adds checks to the binder hooks which verify
that if both ends of a transaction use the same "display".

Patches 0021-0022 add addition data to the audit records
to identify the LSM specific data for all active modules.

Patches 0023-0024 add new interfaces for getting the
compound security contexts.

Finally, with all interference on the AppArmor hooks
removed, Patch 0025 removes the exclusive bit from
AppArmor. An unnecessary stub hook was also removed.

The Ubuntu project is using an earlier version of
this patchset in their distribution to enable stacking
for containers.

Performance measurements to date have the change
within the "noise". The sockperf and dbench results
are on the order of 0.2% to 0.8% difference, with
better performance being as common as worse. The
benchmarks were run with AppArmor and Smack on Ubuntu.

https://github.com/cschaufler/lsm-stacking.git#stack-5.4-rc6-v11-apparmor

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 arch/alpha/include/uapi/asm/socket.h    |   1 +
 arch/mips/include/uapi/asm/socket.h     |   1 +
 arch/parisc/include/uapi/asm/socket.h   |   1 +
 arch/sparc/include/uapi/asm/socket.h    |   1 +
 drivers/android/binder.c                |  26 +-
 fs/ceph/xattr.c                         |   6 +-
 fs/nfs/nfs4proc.c                       |  22 +-
 fs/nfsd/nfs4xdr.c                       |  20 +-
 fs/proc/base.c                          |   2 +
 include/linux/audit.h                   |   1 +
 include/linux/cred.h                    |   3 +-
 include/linux/lsm_hooks.h               |  37 +-
 include/linux/security.h                | 175 ++++++++--
 include/net/af_unix.h                   |   2 +-
 include/net/netlabel.h                  |   8 +-
 include/net/scm.h                       |  15 +-
 include/uapi/asm-generic/socket.h       |   1 +
 kernel/audit.c                          |  72 +++-
 kernel/audit.h                          |   9 +-
 kernel/audit_fsnotify.c                 |   1 +
 kernel/auditfilter.c                    |  10 +-
 kernel/auditsc.c                        | 127 ++++---
 kernel/cred.c                           |  12 +-
 net/core/sock.c                         |   7 +-
 net/ipv4/cipso_ipv4.c                   |   6 +-
 net/ipv4/ip_sockglue.c                  |  12 +-
 net/netfilter/nf_conntrack_netlink.c    |  20 +-
 net/netfilter/nf_conntrack_standalone.c |  11 +-
 net/netfilter/nfnetlink_queue.c         |  26 +-
 net/netfilter/nft_meta.c                |  13 +-
 net/netfilter/xt_SECMARK.c              |   5 +-
 net/netlabel/netlabel_kapi.c            |   6 +-
 net/netlabel/netlabel_unlabeled.c       |  97 +++---
 net/netlabel/netlabel_unlabeled.h       |   2 +-
 net/netlabel/netlabel_user.c            |  13 +-
 net/netlabel/netlabel_user.h            |   6 +-
 net/unix/af_unix.c                      |   6 +-
 net/xfrm/xfrm_policy.c                  |   2 +
 net/xfrm/xfrm_state.c                   |   2 +
 security/apparmor/include/apparmor.h    |   3 +-
 security/apparmor/include/net.h         |   6 +-
 security/apparmor/lsm.c                 | 117 +++----
 security/commoncap.c                    |   7 +-
 security/integrity/ima/ima.h            |  15 +-
 security/integrity/ima/ima_api.c        |  11 +-
 security/integrity/ima/ima_appraise.c   |   6 +-
 security/integrity/ima/ima_main.c       |  49 +--
 security/integrity/ima/ima_policy.c     |  19 +-
 security/integrity/integrity_audit.c    |   1 +
 security/loadpin/loadpin.c              |   8 +-
 security/safesetid/lsm.c                |   8 +-
 security/security.c                     | 593 ++++++++++++++++++++++++++++=
+---
 security/selinux/hooks.c                | 109 +++---
 security/selinux/include/classmap.h     |   2 +-
 security/selinux/include/objsec.h       |   5 +
 security/selinux/include/security.h     |   1 +
 security/selinux/netlabel.c             |  25 +-
 security/selinux/ss/services.c          |   4 +-
 security/smack/smack.h                  |   6 +
 security/smack/smack_lsm.c              | 124 ++++---
 security/smack/smack_netfilter.c        |   8 +-
 security/smack/smackfs.c                |  10 +-
 security/tomoyo/tomoyo.c                |   8 +-
 security/yama/yama_lsm.c                |   7 +-
 64 files changed, 1376 insertions(+), 563 deletions(-)


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

