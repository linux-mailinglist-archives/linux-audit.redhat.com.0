Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5816C19FF36
	for <lists+linux-audit@lfdr.de>; Mon,  6 Apr 2020 22:41:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586205668;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=L9MHuhWgyIP8H8lO5YG/9UZjjrv3jtT7mk6/YnRzS+s=;
	b=Tp4M8x3w0cdppIcIFrCNxdnDkvIlBMmkAlCeCNs1JnTdVkMOJae1OXl3Wq6hOCNbnXPPt7
	wL2q3keB0oHHegtwQeo1vGUGE2lYms4APv88YKLflZiMmlaetrfhWqb9FW3XKrV6/Cs/Tg
	E02JkXPi20ZnLjMlbYTtGIY3uhuZnmg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-8ux98czkPWKlk2vFN7j3mA-1; Mon, 06 Apr 2020 16:41:01 -0400
X-MC-Unique: 8ux98czkPWKlk2vFN7j3mA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6CB3193578F;
	Mon,  6 Apr 2020 20:40:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D55D19C58;
	Mon,  6 Apr 2020 20:40:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 49FC118089CD;
	Mon,  6 Apr 2020 20:40:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 036KemNY012669 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 6 Apr 2020 16:40:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9B27C2093CC3; Mon,  6 Apr 2020 20:40:48 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 972882028CD6
	for <linux-audit@redhat.com>; Mon,  6 Apr 2020 20:40:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0C60185A791
	for <linux-audit@redhat.com>; Mon,  6 Apr 2020 20:40:45 +0000 (UTC)
Received: from sonic306-27.consmr.mail.ne1.yahoo.com
	(sonic306-27.consmr.mail.ne1.yahoo.com [66.163.189.89]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-452-DkZDnX2wP7WUtqxnHKWHPA-1;
	Mon, 06 Apr 2020 16:40:43 -0400
X-MC-Unique: DkZDnX2wP7WUtqxnHKWHPA-1
X-YMail-OSG: yov..lEVM1l.6fCsRX3XVDwQD7bTCofR8SbrWPwypquDXHZkN6o7Yif2cDbG1Kg
	zU.3oyud7iyc3_O427Mlz93pcYuFKCXBtyfyc39mmSxoAlqhowkZjbaJ7lfiCvvQTeLvUzBkUJOS
	WGD1H7a9kgRJGalkTftTjQ.63VQ7dAN4Sr3qUv.qCkF7JSmgFhvb6TH1Yzi8vZCI_j.U3bi67.9h
	ztH2JzyhPZOZbr6xPut5DicUhp9AIerHBXoi8bO3OGHz6kpIum2uzNKcuyUV.tEpWoz2kBO5ZeRh
	li.2LRUqW73QRcO9nlX_3R_M3qhMLM4Gnfo_zebv8kK8NRhIBki_Ype_NkDQvuPEMWk055deIDs4
	HO1XsOwxxeOO6DN46xvZ4Ijzs96FeaL3kl93_DHWMCR7S1IUEPxSmOFtoxKzjpm3kHKVj3VCGHld
	GKQICSw8Ouq27PtjrEIJ4WWzcAKmGhNDZPdCBFI8NTfgbR_SIDHLphzMlt6vNif2UHNYZWTD7jg7
	VKLstgO4gT1dkfXBYlliHiDH2UQMWg7FVSnsSQQDweyMu_fQlwvBMYI.9S16AS4DMV9Hi.d69uxa
	vcoO9gh3mMLqtOh3bTzIHxASRkOE5n2Cpsi9pJf5QRcfvbtBOpFgUD1WUh7x9kf.fuAHy.a8Bxo_
	9k424NgtB5lsUjOJ01SFlgSeP8ip.EzwVhK1V3n_NpxyVwFVNXVYssqP6Je5iLPRSBd_UJHokFov
	203er_1NINQViKhTjox89qA8OKP.hUMno177FeL4siXzHYufFuIgzGsTS8_GOjeA4BiuN5r6IQTQ
	hNVLCXyodI_9NSaNUDUWjHJZxKj25ugywyUQ.rLPq0p9oEtcawvBn_Gz0PDZQaYQCRaI_jSvr2Jj
	sGVAwz9ztTSKdBLn07vjYPNE07.amCOfMxahETFoAoGemq6KkTsof656zZn1fcSm4ZwHOgDqkaUm
	d5HlK1oMUzNEuD.o5o6PT6DzZf2QsTNeTuS73BZ5MIbKrI7q5o8KVcg3v7UOeoXYwumn87kfuupw
	R_K2au0kPup6ucqV363MOHm.CIxb84uMpxpI.st16L62MYPv3OL_2RQnzL5Zj3MFDVhdYZVoDaod
	OJ_6ktajJy.wslCka9zBpFF5x8.FIqPxtedTZKf8X1PzYQTv.phK7C8g7WNiKGEinnggqwlT.O.P
	GXVWsG69jDnrj7IaRIA.GOLwAC.LPHQ2dGl0oTCryWrYFWF01JvuMIgZRny7i3s5IInV0dXdRpI4
	u0Qj1G4SObSmqnv7fR.vPDB2r85xh9Q0p.kyd66T4a_pEgzUmNsjxoJB.6pgcwAysTXCt4LbYea5
	pfrOKAX9hRb9JIeCbEzW2vCNeCMAIg2B0vLx2pVsXV2_M.fYV0bz3CmtDvMjX3yD5Flr6TePmacZ
	5ejaxLeAmPI4wQnTMQdek5NRfSl1ECOcNfzZH8Oaqj3NgtAQW59ZjK8CQbWcW6plvyJk-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic306.consmr.mail.ne1.yahoo.com with HTTP;
	Mon, 6 Apr 2020 20:40:43 +0000
Received: by smtp418.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 061ea7ac6ba9231258b10caa630a4aef; 
	Mon, 06 Apr 2020 20:40:40 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Subject: [PATCH v15 00/23] LSM: Module stacking for AppArmor
Date: Mon,  6 Apr 2020 13:40:14 -0700
Message-Id: <20200406204037.42262-1-casey@schaufler-ca.com>
MIME-Version: 1.0
References: <20200406204037.42262-1-casey.ref@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 036KemNY012669
X-loop: linux-audit@redhat.com
Cc: john.johansen@canonical.com, linux-audit@redhat.com, sds@tycho.nsa.gov
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patchset provides the changes required for
the AppArmor security module to stack safely with any other.

v16: Rebase to 5.6
     Incorporate feedback from v15 - Thanks Stephen, Mimi and Paul
     - Generally improve commit messages WRT scaffolding
     - Comment ima_lsm_isset() (patch 0002)
     - Some question may remain on IMA warning (patch 0002)
     - Mark lsm_slot as __lsm_ro_after_init not __init_data (patch 0002)
     - Change name of lsmblob variable in ima_match_rules() (patch 0003)
     - Instead of putting a struct lsmblob into the unix_skb_parms
       structure put a pointer to an allocated instance. There is
       currently only space for 5 u32's in unix_skb_parms and it is
       likely to get even tighter. Fortunately, the lifecycle
       management of the allocated lsmblob is simple. (patch 0005)
     - Dropped Acks due to the above change (patch 0005)
     - Improved commentary on secmark labeling scaffolding. (patch 0006)
     - Reduced secmark related labeling scaffolding. (patch 0006)
     - Replace use of the zeroth entry of an lsmblob in scaffolding
       with a function lsmblob_value() to hopefully make it less
       obscure. (patch 0006)
     - Convert security_secmark_relabel_packet to use lsmblob as
       this reduces much of the most contentious scaffolding. (patch 0006)
     - Dropped Acks due to the above change (patch 0006)
     - Added BUILD_BUG_ON() for CIPSO tag 6. (patch 0018)
     - Reworked audit subject information. Instead of adding fields in
       the middle of existing records add a new record to the event. When
       a separate record is required use subj="?". (patch 0020)
     - Dropped Acks due to the above change (patch 0020)
     - Reworked audit object information. Instead of adding fields in
       the middle of existing records add a new record to the event. When
       a separate record is required use obj="?". (patch 0021)
     - Dropped Acks due to the above change (patch 0021)
     - Enhanced documentation (patch 0022)
     - Removed unnecessary error code check in security_getprocattr()
       (patch 0021)

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

Patches 0020-0021 add addition audit records
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

https://github.com/cschaufler/lsm-stacking.git#stack-5.6-v16

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

