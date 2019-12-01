Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id E063710F274
	for <lists+linux-audit@lfdr.de>; Mon,  2 Dec 2019 22:57:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575323861;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jI/4iHQvTsRZxqhuoRdBGJu4KHb9vef349LWZBJhPTU=;
	b=cm0F9QY2fsMPGZsO1WMWG7wpfviL7X/eckPabWk65VGykWBh9hNIvxDB+b3vqanq+46CVb
	sUlzAZ2wQPdIhzJxuz8LzUz4Sy24XYwBOajup2xS4MqXi7bj6QY1aQc9sfHsQoIB2ovpxH
	+2bqTr4+M22BQfb5kj5QbLxCrSyocSM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-JtbkcMb0MsyV53AgpNSdBQ-1; Mon, 02 Dec 2019 16:57:39 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 208E8800D4E;
	Mon,  2 Dec 2019 21:57:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 33DA567E63;
	Mon,  2 Dec 2019 21:57:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7349A4EDAD;
	Mon,  2 Dec 2019 21:57:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB11jwD7032049 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 30 Nov 2019 20:45:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 65E3A2166B29; Sun,  1 Dec 2019 01:45:58 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 616FD2166B27
	for <linux-audit@redhat.com>; Sun,  1 Dec 2019 01:45:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 050318001EB
	for <linux-audit@redhat.com>; Sun,  1 Dec 2019 01:45:56 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-257-2D-lV7BiO82AwAzOkUkPRA-1;
	Sat, 30 Nov 2019 20:45:54 -0500
Subject: Re: [GIT PULL] Audit patches for v5.5
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAHC9VhRnN4yWO0So+u4Ktm1N8EpAbe+W1AGPXU-U7Bd7cPBv7g@mail.gmail.com>
References: <CAHC9VhRnN4yWO0So+u4Ktm1N8EpAbe+W1AGPXU-U7Bd7cPBv7g@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAHC9VhRnN4yWO0So+u4Ktm1N8EpAbe+W1AGPXU-U7Bd7cPBv7g@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git
	tags/audit-pr-20191126
X-PR-Tracked-Commit-Id: c34c78dfc1fc68a1f5403f996de8ca62f298d7b2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3b805ca177a24ff78b466ca73febe8466c67ea61
Message-Id: <157516442058.28955.13379032546958515249.pr-tracker-bot@kernel.org>
Date: Sun, 01 Dec 2019 01:40:20 +0000
To: Paul Moore <paul@paul-moore.com>
X-MC-Unique: 2D-lV7BiO82AwAzOkUkPRA-1
X-MC-Unique: JtbkcMb0MsyV53AgpNSdBQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB11jwD7032049
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 02 Dec 2019 16:57:16 -0500
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The pull request you sent on Tue, 26 Nov 2019 16:33:51 -0500:

> git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git tags/audit-pr-20191126

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3b805ca177a24ff78b466ca73febe8466c67ea61

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

