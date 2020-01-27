Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6C06914AEA0
	for <lists+linux-audit@lfdr.de>; Tue, 28 Jan 2020 05:20:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580185207;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tIixxS8COZVnLWUMLsguhTZSTo26t2EaJy1R+zBvv6A=;
	b=FRlCet25v1HOWX1HpaBQQDWtWpwmH/yQlcXHG/n4gypeMioqFm3K+t9GL5rZ0I9W4FOHGE
	+TVxGGcdCct3czxbAaqTg/eirjI68Li5mkSni76k/kw6/xLdtS9NB2SVa0FQXws9L6ie9i
	g7pHhBnha+H6A+sYOmZEXYt24USb1dA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-cVUMirQzNaGW0QAtoiPTyA-1; Mon, 27 Jan 2020 23:20:04 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0413F801E6C;
	Tue, 28 Jan 2020 04:19:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 10D7C863C9;
	Tue, 28 Jan 2020 04:19:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 511041809567;
	Tue, 28 Jan 2020 04:19:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00RNtBml025237 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 27 Jan 2020 18:55:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 30EF7A318C; Mon, 27 Jan 2020 23:55:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B74D7D55E
	for <linux-audit@redhat.com>; Mon, 27 Jan 2020 23:55:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D83EC1019284
	for <linux-audit@redhat.com>; Mon, 27 Jan 2020 23:55:08 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-218-nZ3hXNSnN3C7zPkRWNz0Zw-1;
	Mon, 27 Jan 2020 18:55:04 -0500
Subject: Re: [GIT PULL] Audit patch for v5.6
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAHC9VhRm1dAsc+_eH7iKj4C6RVdzYeZLLqShcOjvMMbEaB4VQA@mail.gmail.com>
References: <CAHC9VhRm1dAsc+_eH7iKj4C6RVdzYeZLLqShcOjvMMbEaB4VQA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAHC9VhRm1dAsc+_eH7iKj4C6RVdzYeZLLqShcOjvMMbEaB4VQA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git
	tags/audit-pr-20200127
X-PR-Tracked-Commit-Id: cb5172d96d16df72db8b55146b0ec00bfd97f079
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 07e309a972cae9de1807f48968f4673f6868e211
Message-Id: <158016930370.17044.5708242043522403584.pr-tracker-bot@kernel.org>
Date: Mon, 27 Jan 2020 23:55:03 +0000
To: Paul Moore <paul@paul-moore.com>
X-MC-Unique: nZ3hXNSnN3C7zPkRWNz0Zw-1
X-MC-Unique: cVUMirQzNaGW0QAtoiPTyA-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00RNtBml025237
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 27 Jan 2020 23:19:34 -0500
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

The pull request you sent on Mon, 27 Jan 2020 15:33:04 -0500:

> git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git tags/audit-pr-20200127

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/07e309a972cae9de1807f48968f4673f6868e211

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

