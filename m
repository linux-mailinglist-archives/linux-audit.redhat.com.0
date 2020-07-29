Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8A6D923274A
	for <lists+linux-audit@lfdr.de>; Thu, 30 Jul 2020 00:04:26 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-4bj1JwykN0St9_7YxU5TEA-1; Wed, 29 Jul 2020 18:04:23 -0400
X-MC-Unique: 4bj1JwykN0St9_7YxU5TEA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E008C1893DCD;
	Wed, 29 Jul 2020 22:04:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DBBC7AC6F;
	Wed, 29 Jul 2020 22:04:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0415695A6D;
	Wed, 29 Jul 2020 22:04:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06TLoNXa023821 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 29 Jul 2020 17:50:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7C357F783D; Wed, 29 Jul 2020 21:50:23 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 77AF8F784C
	for <linux-audit@redhat.com>; Wed, 29 Jul 2020 21:50:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86AA080CDB8
	for <linux-audit@redhat.com>; Wed, 29 Jul 2020 21:50:20 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-328-68NP-3HHN0OBr1ugV6IS4Q-1;
	Wed, 29 Jul 2020 17:50:18 -0400
X-MC-Unique: 68NP-3HHN0OBr1ugV6IS4Q-1
Subject: Re: [GIT PULL] Audit fixes for v5.8 (#1)
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAHC9VhQSq87=vk63=Wr-0mdOZ3ExAKG3s6_9AMS=n_s8zGjhBQ@mail.gmail.com>
References: <CAHC9VhQSq87=vk63=Wr-0mdOZ3ExAKG3s6_9AMS=n_s8zGjhBQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAHC9VhQSq87=vk63=Wr-0mdOZ3ExAKG3s6_9AMS=n_s8zGjhBQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git
	tags/audit-pr-20200729
X-PR-Tracked-Commit-Id: 8ac68dc455d9d18241d44b96800d73229029ed34
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d3590ebf6f91350192737dd1d1b219c05277f067
Message-Id: <159605910640.4880.5720016071008602002.pr-tracker-bot@kernel.org>
Date: Wed, 29 Jul 2020 21:45:06 +0000
To: Paul Moore <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Wed, 29 Jul 2020 17:55:26 -0400
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

The pull request you sent on Wed, 29 Jul 2020 10:54:14 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git tags/audit-pr-20200729

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d3590ebf6f91350192737dd1d1b219c05277f067

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

