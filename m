Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EB263AEC
	for <lists+linux-audit@lfdr.de>; Tue,  9 Jul 2019 20:26:13 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C251081E19;
	Tue,  9 Jul 2019 18:25:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 106289D41;
	Tue,  9 Jul 2019 18:25:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 66BC21833002;
	Tue,  9 Jul 2019 18:25:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x693FCWS012911 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 8 Jul 2019 23:15:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 58BF95C559; Tue,  9 Jul 2019 03:15:12 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 53C6A61792
	for <linux-audit@redhat.com>; Tue,  9 Jul 2019 03:15:10 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 42122308330C
	for <linux-audit@redhat.com>; Tue,  9 Jul 2019 03:15:07 +0000 (UTC)
Subject: Re: [GIT PULL] Audit patches for v5.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1562642106;
	bh=kUCUIuuvcBdKnEGzrNhNOlf6e4V0XnVxsJjaK1hFxbI=;
	h=From:In-Reply-To:References:Date:To:Cc:From;
	b=uvQkHgu3l/Ol/y/obZbi6XnmVTkkVtO+9DM6Hi8ezGRBl+53MNJNk3IuS51XGyzeH
	NQ3tx1rM+wrnBe6g/7lZLHx/Vue3K+lY0FxZ0MKS0OzBdFqySo59H2Xn5IgsXPQekw
	iCi/u7AxaPPCFxFXtglXgmXzEd0PvaYp9pD48zpk=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAHC9VhQ7md3PmUkzv8DNL-RTrq_4r2sRzGjwwaT0ZS-CPOxGBw@mail.gmail.com>
References: <CAHC9VhQ7md3PmUkzv8DNL-RTrq_4r2sRzGjwwaT0ZS-CPOxGBw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAHC9VhQ7md3PmUkzv8DNL-RTrq_4r2sRzGjwwaT0ZS-CPOxGBw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git
	tags/audit-pr-20190702
X-PR-Tracked-Commit-Id: 839d05e413856bd686a33b59294d4e8238169320
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 61fc5771f5e729a2ce235af42f69c8506725e84a
Message-Id: <156264210680.2709.714753527819815674.pr-tracker-bot@kernel.org>
Date: Tue, 09 Jul 2019 03:15:06 +0000
To: Paul Moore <paul@paul-moore.com>
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Tue, 09 Jul 2019 03:15:07 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Tue, 09 Jul 2019 03:15:07 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'pr-tracker-bot@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.101  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<pr-tracker-bot@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 09 Jul 2019 14:24:20 -0400
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Tue, 09 Jul 2019 18:26:12 +0000 (UTC)

The pull request you sent on Tue, 2 Jul 2019 13:28:33 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git tags/audit-pr-20190702

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/61fc5771f5e729a2ce235af42f69c8506725e84a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
