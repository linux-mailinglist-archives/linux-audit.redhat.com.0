Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B836522EE
	for <lists+linux-audit@lfdr.de>; Tue, 20 Dec 2022 15:44:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671547467;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UIG3zg73hB64AEqFXwZZb2XCKXowVRmOKdtOVV80bEE=;
	b=KuHf7Yv6qwFYIZ3CMgQwF6oaUge4NJ3JQW0O9qZM5XsUHD7POKroDGpeu8CjR+lucxMSdk
	iEXa1svrVGWj2dOnpchKkKqEVR9YLzVzsJ6u5eLpNGkKlRaTrPFWVsnLvvGEUJQRYA0Chv
	Wj1ETHUVN8JMONqJDRtnefytIeQW5C0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-Woaw7BxuPl-8hjkW6Nu_SA-1; Tue, 20 Dec 2022 09:44:25 -0500
X-MC-Unique: Woaw7BxuPl-8hjkW6Nu_SA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39E1780234E;
	Tue, 20 Dec 2022 14:44:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 99ABD14171B6;
	Tue, 20 Dec 2022 14:44:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3C25C19465B2;
	Tue, 20 Dec 2022 14:44:09 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EFA971946586 for <linux-audit@listman.corp.redhat.com>;
 Tue, 13 Dec 2022 18:22:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D40E4C15BAD; Tue, 13 Dec 2022 18:22:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC38AC15BA0
 for <linux-audit@redhat.com>; Tue, 13 Dec 2022 18:22:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B126A3806736
 for <linux-audit@redhat.com>; Tue, 13 Dec 2022 18:22:30 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-NkOz9qVAM6WadhgQ9UirGQ-1; Tue, 13 Dec 2022 13:22:28 -0500
X-MC-Unique: NkOz9qVAM6WadhgQ9UirGQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E27CDB81227;
 Tue, 13 Dec 2022 18:13:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 353DEC433D2;
 Tue, 13 Dec 2022 18:13:39 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 23490C00445; Tue, 13 Dec 2022 18:13:39 +0000 (UTC)
Subject: Re: [GIT PULL] Audit patches for v6.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAHC9VhTiYVO5SV6-P6gPcqR1chzwpEvwnDZaYEQACcU1kgvugw@mail.gmail.com>
References: <CAHC9VhTiYVO5SV6-P6gPcqR1chzwpEvwnDZaYEQACcU1kgvugw@mail.gmail.com>
X-PR-Tracked-List-Id: Linux Audit Discussion <linux-audit.redhat.com>
X-PR-Tracked-Message-Id: <CAHC9VhTiYVO5SV6-P6gPcqR1chzwpEvwnDZaYEQACcU1kgvugw@mail.gmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git
 tags/audit-pr-20221212
X-PR-Tracked-Commit-Id: 50979953c0c41e929e5f955800da68e1bb24c7ab
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bbdf4d54618ca1d4af304eab6631d68fd2d6ce39
Message-Id: <167095521914.23919.14566100970871486298.pr-tracker-bot@kernel.org>
Date: Tue, 13 Dec 2022 18:13:39 +0000
To: Paul Moore <paul@paul-moore.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mailman-Approved-At: Tue, 20 Dec 2022 14:44:08 +0000
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: linux-audit@redhat.com, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The pull request you sent on Mon, 12 Dec 2022 22:05:07 -0500:

> https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git tags/audit-pr-20221212

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bbdf4d54618ca1d4af304eab6631d68fd2d6ce39

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

