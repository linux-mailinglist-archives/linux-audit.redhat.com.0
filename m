Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id DC3A2313FF4
	for <lists+linux-audit@lfdr.de>; Mon,  8 Feb 2021 21:09:25 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-XTmqetq_MiWhaj1Dw_7C-Q-1; Mon, 08 Feb 2021 15:09:22 -0500
X-MC-Unique: XTmqetq_MiWhaj1Dw_7C-Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D772D107ACC7;
	Mon,  8 Feb 2021 20:09:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 603FE5D6A8;
	Mon,  8 Feb 2021 20:09:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 77A4557DFA;
	Mon,  8 Feb 2021 20:09:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 118K8fuZ022900 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 8 Feb 2021 15:08:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6A1E12166B2B; Mon,  8 Feb 2021 20:08:41 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 645DD2166B2A
	for <linux-audit@redhat.com>; Mon,  8 Feb 2021 20:08:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2019F801233
	for <linux-audit@redhat.com>; Mon,  8 Feb 2021 20:08:39 +0000 (UTC)
Received: from mail.namei.org (namei.org [65.99.196.166]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-355-r6xU2uVfPUS_11CkRN0YOA-1;
	Mon, 08 Feb 2021 15:08:34 -0500
X-MC-Unique: r6xU2uVfPUS_11CkRN0YOA-1
Received: from localhost (localhost [127.0.0.1])
	by mail.namei.org (Postfix) with ESMTPS id C33199C4;
	Mon,  8 Feb 2021 19:59:01 +0000 (UTC)
Date: Tue, 9 Feb 2021 06:59:01 +1100 (AEDT)
From: James Morris <jmorris@namei.org>
To: linux-security-module@vger.kernel.org
Subject: [ANNOUNCE][CFP] Linux Security Summit 2021
Message-ID: <c244f77-56a1-c089-521d-2e670488c10@namei.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: Linux Security Summit Program Committee <lss-pc@lists.linuxfoundation.org>,
	keyrings@linux-nfs.org, gentoo-hardened@gentoo.org,
	kernel-hardening@lists.openwall.com, selinux@vger.kernel.org,
	linux-kernel@vger.kernel.org, tpmdd-devel@lists.sourceforge.net,
	Audit-ML <linux-audit@redhat.com>, linux-crypto@vger.kernel.org,
	lwn@lwn.net, linux-integrity@vger.kernel.org,
	fedora-selinux-list@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

==============================================================================
                   ANNOUNCEMENT AND CALL FOR PARTICIPATION

                         LINUX SECURITY SUMMIT 2021
                             
                              27-29 September
                              Dublin, Ireland
==============================================================================

DESCRIPTION
 
Linux Security Summit (LSS) is a technical forum for collaboration between
Linux developers, researchers, and end-users.  Its primary aim is to foster
community efforts in analyzing and solving Linux security challenges.

 The program committee currently seeks proposals for:
 
   * Refereed Presentations:
     45 minutes in length.
 
   * Panel Discussion Topics:
     45 minutes in length.
 
   * Short Topics:
     30 minutes in total, including at least 10 minutes discussion.
 
   * Tutorials
     90 minutes in length.
 
Tutorial sessions should be focused on advanced Linux security defense
topics within areas such as the kernel, compiler, and security-related
libraries.  Priority will be given to tutorials created for this conference,
and those where the presenter a leading subject matter expert on the topic.
 
Topic areas include, but are not limited to:
 
   * Kernel self-protection
   * Access control
   * Cryptography and key management
   * Integrity policy and enforcement
   * Hardware Security
   * IoT and embedded security
   * Virtualization and containers
   * System-specific system hardening
   * Case studies
   * Security tools
   * Security UX
   * Emerging technologies, threats & techniques

  Proposals should be submitted via:
    https://events.linuxfoundation.org/linux-security-summit-europe/program/cfp/


** Note that for 2021, the North American and European events are combined into
a single event planned for Dublin, Ireland. **
 

DATES
 
  * CFP close:            June 27
  * CFP notifications:    July 20
  * Schedule announced:   July 22
  * Event:                September 27-29

WHO SHOULD ATTEND
 
We're seeking a diverse range of attendees and welcome participation by
people involved in Linux security development, operations, and research.
 
LSS is a unique global event that provides the opportunity to present and
discuss your work or research with key Linux security community members and
maintainers.  It's also useful for those who wish to keep up with the latest
in Linux security development and to provide input to the development
process.

WEB SITE

    https://events.linuxfoundation.org/linux-security-summit-europe/

TWITTER

  For event updates and announcements, follow:

    https://twitter.com/LinuxSecSummit
  
    #linuxsecuritysummit

PROGRAM COMMITTEE

  The program committee for LSS 2021 is:

    * James Morris, Microsoft
    * Serge Hallyn, Cisco
    * Paul Moore, Cisco
    * Stephen Smalley, NSA
    * Elena Reshetova, Intel
    * John Johansen, Canonical
    * Kees Cook, Google
    * Casey Schaufler, Intel
    * Mimi Zohar, IBM
    * David A. Wheeler, Institute for Defense Analyses

  The program committee may be contacted as a group via email:
    lss-pc () lists.linuxfoundation.org

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

