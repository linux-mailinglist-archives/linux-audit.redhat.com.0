Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C155F496C
	for <lists+linux-audit@lfdr.de>; Tue,  4 Oct 2022 20:48:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664909334;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nVXQatXD/shyIZM31uki7+eP9Pvm2Sfu2aIrz0t/mn4=;
	b=T8Z57xu3lKdpIlm2WgiW1csZuX9VHyEfrn1kvBCTWvsTpririvQ8PUbbuInTgZqxNRwuYd
	X+enF0wbXklnDbgKdZz3rgqVUbbwGPuRVLZhljLRw4wLM8382SscKhtlG8Br1aq2k5O4dB
	n1A5UE1PONN+2ISMznYqgGpkS87aim8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-NWlMItkgMpeCCFUTp55vIw-1; Tue, 04 Oct 2022 14:48:51 -0400
X-MC-Unique: NWlMItkgMpeCCFUTp55vIw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC2E3381494D;
	Tue,  4 Oct 2022 18:48:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3A3B04A9254;
	Tue,  4 Oct 2022 18:48:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E24E7194705A;
	Tue,  4 Oct 2022 18:48:42 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7A8F01946A4C for <linux-audit@listman.corp.redhat.com>;
 Tue,  4 Oct 2022 18:25:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 535671410F36; Tue,  4 Oct 2022 18:25:52 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BA40140EBF3
 for <linux-audit@redhat.com>; Tue,  4 Oct 2022 18:25:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2C11101A5BB
 for <linux-audit@redhat.com>; Tue,  4 Oct 2022 18:25:48 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-wZ_8j_ljNkyPrLQE_PvWmg-1; Tue, 04 Oct 2022 14:25:47 -0400
X-MC-Unique: wZ_8j_ljNkyPrLQE_PvWmg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 01D66B81B67;
 Tue,  4 Oct 2022 18:18:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BFE72C433C1;
 Tue,  4 Oct 2022 18:18:53 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 AE1D4E21EC2; Tue,  4 Oct 2022 18:18:53 +0000 (UTC)
Subject: Re: [GIT PULL] Audit patches for v6.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAHC9VhTEHLd-PVLArOH20UGaB21JJzz5nT54VFegF23631QSxA@mail.gmail.com>
References: <CAHC9VhTEHLd-PVLArOH20UGaB21JJzz5nT54VFegF23631QSxA@mail.gmail.com>
X-PR-Tracked-List-Id: Linux Audit Discussion <linux-audit.redhat.com>
X-PR-Tracked-Message-Id: <CAHC9VhTEHLd-PVLArOH20UGaB21JJzz5nT54VFegF23631QSxA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git
 tags/audit-pr-20221003
X-PR-Tracked-Commit-Id: 934f70d9d498a7fffd611edf48356698f1d72e91
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c645c11a2dba116bad3ee43e08e330db8f03ede6
Message-Id: <166490753370.15936.11551051255575412972.pr-tracker-bot@kernel.org>
Date: Tue, 04 Oct 2022 18:18:53 +0000
To: Paul Moore <paul@paul-moore.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mailman-Approved-At: Tue, 04 Oct 2022 18:48:42 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The pull request you sent on Mon, 3 Oct 2022 15:19:57 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git tags/audit-pr-20221003

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c645c11a2dba116bad3ee43e08e330db8f03ede6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

