Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0656E69FDAA
	for <lists+linux-audit@lfdr.de>; Wed, 22 Feb 2023 22:21:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677100914;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yakPdhyyWGn9753CNAJNUJJLAp0v1jUuWbTtk1n0KLI=;
	b=h7JUCllbefgSwzYXXL0o5eOsI+oCFvKjoqqitbWKuU4QRCNTYXZqHouG9Cc1kGvW6KgfnA
	lLjq0a3GGzt1URJfQ/M3LAh1ZUwqmQrqMbgUuTpUZ4zNd2sWxYIxAXKsa579dMlR9LdiJa
	Q0JDXkMwbxeincLEeX/ek2+Ug51lfOw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-198-jBg82iJ9NQ6yG2D0EuBcsA-1; Wed, 22 Feb 2023 16:21:52 -0500
X-MC-Unique: jBg82iJ9NQ6yG2D0EuBcsA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E5D3101A521;
	Wed, 22 Feb 2023 21:21:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B29472026D4B;
	Wed, 22 Feb 2023 21:21:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 65F7C19465BC;
	Wed, 22 Feb 2023 21:21:31 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9C5DB194658C for <linux-audit@listman.corp.redhat.com>;
 Wed, 22 Feb 2023 21:08:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5B5BF4051E45; Wed, 22 Feb 2023 21:08:40 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5392B4051E44
 for <linux-audit@redhat.com>; Wed, 22 Feb 2023 21:08:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3569B1C051AA
 for <linux-audit@redhat.com>; Wed, 22 Feb 2023 21:08:40 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-dgB5h6AkP9OK4rUTqyBqXQ-1; Wed, 22 Feb 2023 16:08:38 -0500
X-MC-Unique: dgB5h6AkP9OK4rUTqyBqXQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F2B7EB81887;
 Wed, 22 Feb 2023 20:59:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 958A8C4339C;
 Wed, 22 Feb 2023 20:59:01 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 82A16C43157; Wed, 22 Feb 2023 20:59:01 +0000 (UTC)
Subject: Re: [GIT PULL] Audit patches for v6.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAHC9VhT7aw1tGB2fqQMcoCFpwdvC2xfsUbgU0vaTiY_jRk+K9w@mail.gmail.com>
References: <CAHC9VhT7aw1tGB2fqQMcoCFpwdvC2xfsUbgU0vaTiY_jRk+K9w@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAHC9VhT7aw1tGB2fqQMcoCFpwdvC2xfsUbgU0vaTiY_jRk+K9w@mail.gmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git
 tags/audit-pr-20230220
X-PR-Tracked-Commit-Id: 6c6cd913accd77008f74a1a9d57b816db3651daa
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 23064dfe088e0926e3fc0922f118866dc1564405
Message-Id: <167709954153.1614.11181099863522437173.pr-tracker-bot@kernel.org>
Date: Wed, 22 Feb 2023 20:59:01 +0000
To: Paul Moore <paul@paul-moore.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Wed, 22 Feb 2023 21:21:29 +0000
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
Cc: audit@vger.kernel.org, linux-audit@redhat.com,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The pull request you sent on Mon, 20 Feb 2023 17:38:12 -0500:

> https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git tags/audit-pr-20230220

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/23064dfe088e0926e3fc0922f118866dc1564405

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

