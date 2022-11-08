Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 084FF621E5C
	for <lists+linux-audit@lfdr.de>; Tue,  8 Nov 2022 22:15:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667942108;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UXnHnmfwX6ilBmWkGwM5j5MF3Wk/J3fyHDhqvuEkDjQ=;
	b=bTCB4nmFR08Z13MX3vPQbWLVkb96RTWQOX2wj0qZhoL322rFxzOghNeDRapVFc7cjWKMVm
	8AFQIj7wYKXiExvf0Kl34oj7DAD5ecdpHfll3si0ItnYgj8sAuGx66A9MxpFzBPxT+aPWX
	QSBeP0EPRf459rm+fk6Fxdwh4mYFH40=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-c9soc-BPNA2BObi1XwKoQA-1; Tue, 08 Nov 2022 16:15:04 -0500
X-MC-Unique: c9soc-BPNA2BObi1XwKoQA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D16CC1C16EA1;
	Tue,  8 Nov 2022 21:15:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3EE1540C94AD;
	Tue,  8 Nov 2022 21:14:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2D6DF19465B5;
	Tue,  8 Nov 2022 21:14:53 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E7E871946588 for <linux-audit@listman.corp.redhat.com>;
 Tue,  8 Nov 2022 20:56:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C6E5D35429; Tue,  8 Nov 2022 20:56:05 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF42D9E70
 for <linux-audit@redhat.com>; Tue,  8 Nov 2022 20:56:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9DEC286E921
 for <linux-audit@redhat.com>; Tue,  8 Nov 2022 20:56:05 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-74-Mx1A48JUPhKg68nbg8jtfA-1; Tue, 08 Nov 2022 15:56:04 -0500
X-MC-Unique: Mx1A48JUPhKg68nbg8jtfA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id C352ECE1CE8;
 Tue,  8 Nov 2022 20:48:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9ABDC433D7;
 Tue,  8 Nov 2022 20:48:55 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 D1E64E270CD; Tue,  8 Nov 2022 20:48:55 +0000 (UTC)
Subject: Re: [GIT PULL] Audit fixes for v6.1 (#1)
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAHC9VhTv96BsOTQyyBTWSJ80fDuiniacDUhfz1GJrP-huWxJzg@mail.gmail.com>
References: <CAHC9VhTv96BsOTQyyBTWSJ80fDuiniacDUhfz1GJrP-huWxJzg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAHC9VhTv96BsOTQyyBTWSJ80fDuiniacDUhfz1GJrP-huWxJzg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git
 tags/audit-pr-20221107
X-PR-Tracked-Commit-Id: 986d93f55bdeab1cac858d1e47b41fac10b2d7f6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f141df371335645ce29a87d9683a3f79fba7fd67
Message-Id: <166794053585.22160.9230442831910400778.pr-tracker-bot@kernel.org>
Date: Tue, 08 Nov 2022 20:48:55 +0000
To: Paul Moore <paul@paul-moore.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Tue, 08 Nov 2022 21:14:51 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The pull request you sent on Mon, 7 Nov 2022 18:10:15 -0500:

> git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git tags/audit-pr-20221107

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f141df371335645ce29a87d9683a3f79fba7fd67

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

