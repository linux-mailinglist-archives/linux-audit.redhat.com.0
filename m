Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id D2C8F17299F
	for <lists+linux-audit@lfdr.de>; Thu, 27 Feb 2020 21:43:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582836190;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pJO2l/rg1TX886r9svqC4saU0FXWDkEiVv6/hqW3hqg=;
	b=KLxgf69EeY/MZlj0UCSvg1x1fma2RvQq8mVfuLkq8Z/2+vnjaxKKsF2VTUD1HFzN9+TAry
	UD4L2mRy8kmWaNnJetcoBRQd2yOLagvzKS7OTVMyZImmgnAueYduHz4jcuMjF/c04j0Y3e
	vOJnpuIsrq6VYMgov+W0skb+80Qx5GI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-2paSkkDxNPCVZEiRcE2ZYg-1; Thu, 27 Feb 2020 15:42:39 -0500
X-MC-Unique: 2paSkkDxNPCVZEiRcE2ZYg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E8411005514;
	Thu, 27 Feb 2020 20:42:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 44BB58C07F;
	Thu, 27 Feb 2020 20:42:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 091C918089C8;
	Thu, 27 Feb 2020 20:42:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01RJeEOL027485 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 27 Feb 2020 14:40:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 85A472166B2E; Thu, 27 Feb 2020 19:40:14 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 81B432166B2B
	for <linux-audit@redhat.com>; Thu, 27 Feb 2020 19:40:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C0714800299
	for <linux-audit@redhat.com>; Thu, 27 Feb 2020 19:40:11 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-427-fHPri_riN0uD7EDdNsJaPw-1;
	Thu, 27 Feb 2020 14:40:09 -0500
X-MC-Unique: fHPri_riN0uD7EDdNsJaPw-1
Subject: Re: [GIT PULL] Audit fixes for v5.6 (#1)
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAHC9VhSL2M4QBP-_z9U-MMNUAT9G_pnJxrPcNtQs03yi7epYxQ@mail.gmail.com>
References: <CAHC9VhSL2M4QBP-_z9U-MMNUAT9G_pnJxrPcNtQs03yi7epYxQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAHC9VhSL2M4QBP-_z9U-MMNUAT9G_pnJxrPcNtQs03yi7epYxQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git
	tags/audit-pr-20200226
X-PR-Tracked-Commit-Id: 756125289285f6e55a03861bf4b6257aa3d19a93
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ed5fa5591866f95be1fe75cd267cf9df2c0390f5
Message-Id: <158283240799.25748.3429930730028694695.pr-tracker-bot@kernel.org>
Date: Thu, 27 Feb 2020 19:40:07 +0000
To: Paul Moore <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01RJeEOL027485
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 27 Feb 2020 15:42:13 -0500
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The pull request you sent on Wed, 26 Feb 2020 20:50:44 -0500:

> git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git tags/audit-pr-20200226

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ed5fa5591866f95be1fe75cd267cf9df2c0390f5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

