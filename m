Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7C9681B4F5C
	for <lists+linux-audit@lfdr.de>; Wed, 22 Apr 2020 23:27:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587590831;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uEBlFtityLtkZ6TyK6/aISPuA4zap4IszD/izpY4wsw=;
	b=Pb1uL0DqV2xCHtOnWB35x5m+48zqDG2ViE1/7yz/DombH74o5Ez6jpR2ctOmsJBcZQSoQQ
	JWNk1tsSdLPcyNTsy+N1CQGl7FpsUmj3zGFLWovG0tDSI30MWQuApRSIDVFyb6OyKUDsBb
	PPfw0IdPIX5oS7wE1pleZexe9VV8Bc0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-cqOS2tF0My6vR9LkDRclXA-1; Wed, 22 Apr 2020 17:27:09 -0400
X-MC-Unique: cqOS2tF0My6vR9LkDRclXA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4D6B8017F5;
	Wed, 22 Apr 2020 21:27:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DD00600D2;
	Wed, 22 Apr 2020 21:27:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 105D81809541;
	Wed, 22 Apr 2020 21:26:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03MLQ1ri008456 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 22 Apr 2020 17:26:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EADCE2166B2E; Wed, 22 Apr 2020 21:26:00 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E6F6F2166B2A
	for <linux-audit@redhat.com>; Wed, 22 Apr 2020 21:25:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02B61185A78F
	for <linux-audit@redhat.com>; Wed, 22 Apr 2020 21:25:59 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-173-dpTJIQ4oOYqn0_UF-VMY6A-1; Wed, 22 Apr 2020 17:25:56 -0400
X-MC-Unique: dpTJIQ4oOYqn0_UF-VMY6A-1
Received: by mail-ed1-f67.google.com with SMTP id r16so2711671edw.5
	for <linux-audit@redhat.com>; Wed, 22 Apr 2020 14:25:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=mRuIQRX3UeU0blGuPEnScFGYp7NwM8RgwXBeGeDaOVI=;
	b=myyrHJuYV7RF10EF62y/Ll6S+0NPrKrICPgBPzrF4UB4uI7uRNpejkztGsyZTtZvdT
	5VG5SFnH8dmETTYVShuHy8CBy+yaLrZXfTixGCrQaGyZ+HIlWluylMe5ykthdFCO47+X
	Axcu8vOoaBpC+dmRi95aXOzYpxwakHhBp4l2L/bkfF1NKobwyDHn8MZNhGbmt3h4RbnO
	IJ6mx+DlXwfk9iiGZdZvt8aE2SlCJdotNXQj3B/Nz1IHk0OdH6NYcBOcScOgY8UD2tdJ
	i0YXl/GznSam8iTovgl2edn9EQYn26PKaSmvjjN6aMis01z6p2/tUZxl1wmK0IU8VQhc
	J6jA==
X-Gm-Message-State: AGi0PuaF9tm6/IZmuz2msYpVfr8FaxybOv4HDRbLmwCpbVfdtB0IACYR
	cNVAKc7yb6wc3WLtyrOG927qs25faqJ28iPkIRj/yijxwg==
X-Google-Smtp-Source: APiQypKDbUBEnzDY7XXQBQy9V9Ty73Piah8yLs/mTDj7UdFZP9Jmx8O3fzY7/dgsubMcaJ2oXKarinHY5Iptk1hVcso=
X-Received: by 2002:a05:6402:1b0b:: with SMTP id
	by11mr460843edb.269.1587590755431; 
	Wed, 22 Apr 2020 14:25:55 -0700 (PDT)
MIME-Version: 1.0
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 22 Apr 2020 17:25:44 -0400
Message-ID: <CAHC9VhQNo=Z3G-K8KvTGiu0Fzmwv4byFQriNuTsu+vwnx85YXg@mail.gmail.com>
Subject: [GIT PULL] Audit fixes for v5.7 (#1)
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03MLQ1ri008456
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com, linux-kernel@vger.kernel.org
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
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Linus,

One small audit patch for the next v5.7-rcX release.  You can read the
commit description, but basically it fixes a missing length check on
input from userspace, nothing crazy.

Thanks,
-Paul
--
The following changes since commit ae83d0b416db002fe95601e7f97f64b59514d936:

 Linux 5.7-rc2 (2020-04-19 14:35:30 -0700)

are available in the Git repository at:

 git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git
   tags/audit-pr-20200422

for you to fetch changes up to 763dafc520add02a1f4639b500c509acc0ea8e5b:

 audit: check the length of userspace generated audit records
   (2020-04-20 17:10:58 -0400)

----------------------------------------------------------------
audit/stable-5.7 PR 20200422

----------------------------------------------------------------
Paul Moore (1):
     audit: check the length of userspace generated audit records

kernel/audit.c | 3 +++
1 file changed, 3 insertions(+)

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

