Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DB93428C683
	for <lists+linux-audit@lfdr.de>; Tue, 13 Oct 2020 02:54:51 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-3N1nFGTsOcyU4iAuYs4iQQ-1; Mon, 12 Oct 2020 20:54:49 -0400
X-MC-Unique: 3N1nFGTsOcyU4iAuYs4iQQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A18B981CBDD;
	Tue, 13 Oct 2020 00:54:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1029F60BF3;
	Tue, 13 Oct 2020 00:54:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D2C5B1826D36;
	Tue, 13 Oct 2020 00:54:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09D0sZBA018128 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 12 Oct 2020 20:54:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0DD4B2C003B; Tue, 13 Oct 2020 00:54:35 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 08DB42C003A
	for <linux-audit@redhat.com>; Tue, 13 Oct 2020 00:54:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF9D8858289
	for <linux-audit@redhat.com>; Tue, 13 Oct 2020 00:54:31 +0000 (UTC)
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
	[209.85.218.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-109-SDkzbVkJMwa2m_ttsWJglg-1; Mon, 12 Oct 2020 20:54:29 -0400
X-MC-Unique: SDkzbVkJMwa2m_ttsWJglg-1
Received: by mail-ej1-f67.google.com with SMTP id a3so25809464ejy.11
	for <linux-audit@redhat.com>; Mon, 12 Oct 2020 17:54:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6HukdDFPy45a3aIumcfc0MFcpWuJbnHPSUT8UUjL53A=;
	b=BTePT3PezGkG55q8T3P4HlZbmMEbPEa6373Qf8SH8K+OlqV3hjaAZE0VHgv6Kmz5dj
	OEcm0MjZEshvBoG0/jqwpQ1zedpdGeJU9qlkJTA7wNojHTKplnDUfwxLfmTIVB9RGwor
	5cGnKKerRpJ5TOdFKhSsi5cy5DH7sP0ZlZPwz2F0fzPp/NQ7SDNdXxmNNtKQqRSjqu2P
	6ua5wlZcZWxHqjksgMmHnm4VuGJ8RBoBM3ODdf90pmqDCMKFYHxdcmMbwVOd0qhmuH9I
	OIw6cIoPuFN3co2UDUG+V2Uqq70wR9pcIobcH7yfmT+WLRKyvFEUAHdkLiOBu0BpscWP
	LmYQ==
X-Gm-Message-State: AOAM531kA6R589gbhbnY5ynD3O4jOV92sKu7y2DCfhCDLdOkrgVUHUCV
	BjtPFE9gNHSFOo+0mu+4AlQtA58bYcGTabYPJX+m
X-Google-Smtp-Source: ABdhPJylnZ+0gGDHO99ud6Ze8t5ualUVdgCroLu4d6mSfa9ZZGXwZFHFaX6ABjoQ25hgWA9Rmdc0975AWl/utA6bBkA=
X-Received: by 2002:a17:906:c1d4:: with SMTP id
	bw20mr30265414ejb.91.1602550468068; 
	Mon, 12 Oct 2020 17:54:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAHC9VhTNqnzrtu1DHquVF7kK9v9tCAa8q=V3f9kUZi_nLTzfYg@mail.gmail.com>
In-Reply-To: <CAHC9VhTNqnzrtu1DHquVF7kK9v9tCAa8q=V3f9kUZi_nLTzfYg@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 12 Oct 2020 20:54:16 -0400
Message-ID: <CAHC9VhQrBHr00Lxeocv9FkWP5svcEF1=y_9KTRf7Q0-P2ZZJkg@mail.gmail.com>
Subject: Re: [GIT PULL] Audit patches for v5.10
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com, linux-kernel@vger.kernel.org
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
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 12, 2020 at 8:51 PM Paul Moore <paul@paul-moore.com> wrote:
>
> Hi Linus,
>
> A small set of audit patches for v5.10.  There are only three patches
> in total, and all three are trivial fixes that don't really warrant
> any explanations beyond their descriptions.  As usual, all three
> patches pass our test suite and as of a few minutes ago they applied
> cleanly to your tree.  Please merge for v5.10.
>
> Thanks,
> -Paul
>
> --
> The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:
>
>  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)
>
> are available in the Git repository at:
>
>  git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git
>    stable-5.10

My apologies, I mistakenly sent the branch and not the signed tag, the
proper PR tag is below:

 git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git
audit-pr-20201012

> for you to fetch changes up to c07203516439b9cd9f7b3cbed82a77164de5af40:
>
>  audit: Remove redundant null check (2020-08-26 09:10:39 -0400)
>
> ----------------------------------------------------------------
> Jules Irenge (2):
>      audit: change unnecessary globals into statics
>      audit: uninitialize variable audit_sig_sid
>
> Xu Wang (1):
>      audit: Remove redundant null check
>
> kernel/audit.c | 9 ++++-----
> kernel/audit.h | 4 ----
> 2 files changed, 4 insertions(+), 9 deletions(-)
>
> --
> paul moore
> www.paul-moore.com



-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

