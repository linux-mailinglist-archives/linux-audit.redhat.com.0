Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id EA2381B6196
	for <lists+linux-audit@lfdr.de>; Thu, 23 Apr 2020 19:08:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587661718;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=D/R0Dl/Bsb4kxBTxIaHPcbtr/4OMWOIipMzIIsUkZPI=;
	b=gVxPvJ5wkcDgao2ufkhGwREQr57RMybzMcHIMuhIEfmrWqnoNYSLIvKafrhUHXMuH3jLk6
	BjZsH9thXBsLb1yVdS9NHfJd95otCcPpTylTZg3rwPJY6mB9FkkOsetq1f7bS8eBFsUgv6
	Tmk1reh0k3Mbi0WRIM3rPag0gKiPuB8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-zBPlK-cLN1qs4GnxqawARA-1; Thu, 23 Apr 2020 13:08:36 -0400
X-MC-Unique: zBPlK-cLN1qs4GnxqawARA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 977BE100A622;
	Thu, 23 Apr 2020 17:08:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F3A3D5D9CC;
	Thu, 23 Apr 2020 17:08:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B48EC4CA95;
	Thu, 23 Apr 2020 17:08:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03NGjPqL018497 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 23 Apr 2020 12:45:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 05728D74D0; Thu, 23 Apr 2020 16:45:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01316F41C0
	for <linux-audit@redhat.com>; Thu, 23 Apr 2020 16:45:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4EB0C85A5A0
	for <linux-audit@redhat.com>; Thu, 23 Apr 2020 16:45:22 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-154-WGpwfLI4Mc-MKJFTusElmg-1;
	Thu, 23 Apr 2020 12:45:19 -0400
X-MC-Unique: WGpwfLI4Mc-MKJFTusElmg-1
Subject: Re: [GIT PULL] Audit fixes for v5.7 (#1)
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAHC9VhQNo=Z3G-K8KvTGiu0Fzmwv4byFQriNuTsu+vwnx85YXg@mail.gmail.com>
References: <CAHC9VhQNo=Z3G-K8KvTGiu0Fzmwv4byFQriNuTsu+vwnx85YXg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAHC9VhQNo=Z3G-K8KvTGiu0Fzmwv4byFQriNuTsu+vwnx85YXg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git
	tags/audit-pr-20200422
X-PR-Tracked-Commit-Id: 763dafc520add02a1f4639b500c509acc0ea8e5b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6a400063826b6ab7a9dc8eeddcb36a55ebbd7dab
Message-Id: <158766031859.20212.3262990343424454639.pr-tracker-bot@kernel.org>
Date: Thu, 23 Apr 2020 16:45:18 +0000
To: Paul Moore <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03NGjPqL018497
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 23 Apr 2020 13:08:17 -0400
Cc: linux-audit@redhat.com, Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The pull request you sent on Wed, 22 Apr 2020 17:25:44 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git tags/audit-pr-20200422

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6a400063826b6ab7a9dc8eeddcb36a55ebbd7dab

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

