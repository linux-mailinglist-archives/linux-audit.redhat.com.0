Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 051071C926
	for <lists+linux-audit@lfdr.de>; Tue, 14 May 2019 15:04:04 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 723CC3086231;
	Tue, 14 May 2019 13:03:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 20D5751DF6;
	Tue, 14 May 2019 13:03:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A86044EE05;
	Tue, 14 May 2019 13:03:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x482eG40021657 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 7 May 2019 22:40:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B97C25C269; Wed,  8 May 2019 02:40:16 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4B035C22E
	for <linux-audit@redhat.com>; Wed,  8 May 2019 02:40:14 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D6A283D3C
	for <linux-audit@redhat.com>; Wed,  8 May 2019 02:40:13 +0000 (UTC)
Subject: Re: [GIT PULL] Audit patches for v5.2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1557283213;
	bh=gXo79XzPzH7ksKQt/v7qwBPzCp8whnJR8uHL6evR7ic=;
	h=From:In-Reply-To:References:Date:To:Cc:From;
	b=fGOnHKKY54owP2JxR/ALCwL3gWx/u//Z4hNaDBS9a+zkt7MqWs88B/41ohoiE1aIE
	/ieATh2jsQvu9hLpwQxapMt+y0ceorY9ds/dgrZFUfL+uMnem8331l/pXQLjA1A9Gj
	+i2UgW3NeVIoh5+Qp/ROhhsTxGY7fhHRuRtOJ2jY=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAHC9VhQ8aEqiKo6oj8-qMTzbs73ipEbTf5akENYc-m6xg7JRXg@mail.gmail.com>
References: <CAHC9VhQ8aEqiKo6oj8-qMTzbs73ipEbTf5akENYc-m6xg7JRXg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAHC9VhQ8aEqiKo6oj8-qMTzbs73ipEbTf5akENYc-m6xg7JRXg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git
	tags/audit-pr-20190507
X-PR-Tracked-Commit-Id: 70c4cf17e445264453bc5323db3e50aa0ac9e81f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 02aff8db6438ce29371fd9cd54c57213f4bb4536
Message-Id: <155728321338.19924.590432199264381915.pr-tracker-bot@kernel.org>
Date: Wed, 08 May 2019 02:40:13 +0000
To: Paul Moore <paul@paul-moore.com>
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 08 May 2019 02:40:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Wed, 08 May 2019 02:40:13 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'pr-tracker-bot@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.111  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_HI, SPF_PASS,
	T_DKIMWL_WL_HIGH) 198.145.29.99 mail.kernel.org 198.145.29.99
	mail.kernel.org <pr-tracker-bot@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 14 May 2019 09:02:08 -0400
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Tue, 14 May 2019 13:04:02 +0000 (UTC)

The pull request you sent on Tue, 7 May 2019 13:23:05 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git tags/audit-pr-20190507

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/02aff8db6438ce29371fd9cd54c57213f4bb4536

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
