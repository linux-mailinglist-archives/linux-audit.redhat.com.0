Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id CB1A1151391
	for <lists+linux-audit@lfdr.de>; Tue,  4 Feb 2020 01:01:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580774471;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=7vOW79qIrViokaHz/ezZD4cSf9/NcBa6cd572ngB7T8=;
	b=BzT1Q7hq7qQsQ1ghBeXIGdx1tStdJu93qxNfQRVPBklL3CoZnS08/1c+g/xBXxAqMJLY09
	Jq0hvTs0jet6tvaylglfPQD7EGiaXnsMvFZ1SuBr8IWUcHEBhm1gjZQuDF3EgwrAluJ6Ky
	HE3Q+5okmDNROYopksSFZ650X4FOIU0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-KeKe3wHCMxKM-wmF3GOEkg-1; Mon, 03 Feb 2020 19:01:09 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E601800D48;
	Tue,  4 Feb 2020 00:01:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AC295DA83;
	Tue,  4 Feb 2020 00:01:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 739AD1809567;
	Tue,  4 Feb 2020 00:00:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01400eYP028047 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 3 Feb 2020 19:00:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2AA692038B9A; Tue,  4 Feb 2020 00:00:40 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2631E2038B97
	for <linux-audit@redhat.com>; Tue,  4 Feb 2020 00:00:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11CB58007D2
	for <linux-audit@redhat.com>; Tue,  4 Feb 2020 00:00:38 +0000 (UTC)
Received: from namei.org (namei.org [65.99.196.166]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-244-XMlkNA5aNoaiJ8KMgmY4PA-1;
	Mon, 03 Feb 2020 19:00:24 -0500
Received: from localhost (localhost [127.0.0.1])
	by namei.org (8.14.4/8.14.4) with ESMTP id 013Nxnn2015307;
	Mon, 3 Feb 2020 23:59:49 GMT
Date: Tue, 4 Feb 2020 10:59:49 +1100 (AEDT)
From: James Morris <jmorris@namei.org>
To: linux-security-module@vger.kernel.org
Subject: [ANNOUNCE][CFP] Linux Security Summit North America 2020
Message-ID: <alpine.LRH.2.21.2002041054320.12768@namei.org>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
Content-ID: <alpine.LRH.2.21.2002041056360.12768@namei.org>
X-MC-Unique: XMlkNA5aNoaiJ8KMgmY4PA-1
X-MC-Unique: KeKe3wHCMxKM-wmF3GOEkg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
	BOUNDARY="1665246916-1737447927-1580774163=:12768"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
--1665246916-1737447927-1580774163=:12768
Content-Type: text/plain; charset=ISO-8859-7
Content-ID: <alpine.LRH.2.21.2002041056361.12768@namei.org>
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by namei.org id
	013Nxnn2015307

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
=09=09   ANNOUNCEMENT AND CALL FOR PARTICIPATION

=09=09   LINUX SECURITY SUMMIT NORTH AMERICA 2020
                            =20
=09=09=09        24-26 JUNE
=09=09=09    AUSTIN, TEXAS, USA
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D

DESCRIPTION
=20
Linux Security Summit North America (LSS-NA) is a technical forum for
collaboration between Linux developers, researchers, and end-users.  Its
primary aim is to foster community efforts in analyzing and solving Linux
security challenges.
=20
 The program committee currently seeks proposals for:
=20
   * Refereed Presentations:
     45 minutes in length.
=20
   * Panel Discussion Topics:
     45 minutes in length.
=20
   * Short Topics:
     30 minutes in total, including at least 10 minutes discussion.
=20
   * Tutorials
     90 minutes in length.
=20
Tutorial sessions should be focused on advanced Linux security defense
topics within areas such as the kernel, compiler, and security-related
libraries.  Priority will be given to tutorials created for this conference=
,
and those where the presenter a leading subject matter expert on the topic.
=20
Topic areas include, but are not limited to:
=20
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

    https://events.linuxfoundation.org/linux-security-summit-north-america/=
program/cfp/
=20

DATES
=20
  * CFP close:            March 31
  * CFP notifications:    April 13
  * Schedule announced:   April 16
  * Event:                June 24-26


WHO SHOULD ATTEND
=20
We're seeking a diverse range of attendees and welcome participation by
people involved in Linux security development, operations, and research.
=20
LSS-NA is a unique global event that provides the opportunity to present an=
d
discuss your work or research with key Linux security community members and
maintainers.  It=A2s also useful for those who wish to keep up with the lat=
est
in Linux security development and to provide input to the development
process.

WEB SITE

    https://events.linuxfoundation.org/linux-security-summit-north-america/

TWITTER

  For event updates and announcements, follow:

    https://twitter.com/LinuxSecSummit
 =20
    #linuxsecuritysummit

PROGRAM COMMITTEE

  The program committee for LSS 2020 is:

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
--1665246916-1737447927-1580774163=:12768
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--1665246916-1737447927-1580774163=:12768--

