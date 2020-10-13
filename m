Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D02F828C686
	for <lists+linux-audit@lfdr.de>; Tue, 13 Oct 2020 02:58:45 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-qLOPhirONu-nIPOBAp07vQ-1; Mon, 12 Oct 2020 20:58:42 -0400
X-MC-Unique: qLOPhirONu-nIPOBAp07vQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA0E8107AD64;
	Tue, 13 Oct 2020 00:58:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A59C6EF55;
	Tue, 13 Oct 2020 00:58:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A8E4558109;
	Tue, 13 Oct 2020 00:58:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09D0wVId018468 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 12 Oct 2020 20:58:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 854D2207A506; Tue, 13 Oct 2020 00:58:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 804A32016F2C
	for <linux-audit@redhat.com>; Tue, 13 Oct 2020 00:58:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 237491823612
	for <linux-audit@redhat.com>; Tue, 13 Oct 2020 00:58:29 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-563-ht26CuCnPdG5yNK4RpTM1w-1; Mon, 12 Oct 2020 20:58:27 -0400
X-MC-Unique: ht26CuCnPdG5yNK4RpTM1w-1
Received: by mail-ed1-f68.google.com with SMTP id dn5so19054950edb.10
	for <linux-audit@redhat.com>; Mon, 12 Oct 2020 17:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DqFFBvtE1qeWxzZ4YXFzIC5jeC2s6YKrrSNxDkFYOXo=;
	b=DvNAqTkJBFYmv0xJVf19JJXgwP4dKNFQmMDPlNLvpHQvY7Rm1Gqjxb/aiTjMR07Fwg
	gNLN80FkfytcjJLSaeVkJ+oaGiX9e+J21WyoVPBVqKTGrLwwLqU4iO6GZTEONDz5ppgX
	/VkNLmTghgRT0BOd8QWl5/IOZvqAi1CMn3Bq6ZkguN2tHft1Y3w1Ruu8NIh9akRJglcg
	LP55b43TxQBrm0EXyuKMY2qy1ABMffBVqrZpRABxvbWj9ut2slA/ljzht6A2XMPR+4bj
	gJB06I12zynH9BPC7UY9LyC00TYRXz0dc2Lipdv6DM0CEwUdbKf/89f2g/lvwrPEh5aE
	pt6A==
X-Gm-Message-State: AOAM533F59hSs41vy+1B47GkF0zkWX8QPN99ETM+aVWLGPtjAVUtabfH
	jLgHIDaG90Ziqzvt81ZZRQBRRfyHD4+FaPZ/cVgU
X-Google-Smtp-Source: ABdhPJz1Zpk7P/UOqJYfTTtstqAeO/iB6SdqqzrmgxdkdBlf8iB371HEZtZ2+JT17/PT0wipA5Z2LwQg2WPSfnQW7LI=
X-Received: by 2002:a05:6402:94f:: with SMTP id
	h15mr16871460edz.12.1602550705600; 
	Mon, 12 Oct 2020 17:58:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAHC9VhTNqnzrtu1DHquVF7kK9v9tCAa8q=V3f9kUZi_nLTzfYg@mail.gmail.com>
	<CAHC9VhQrBHr00Lxeocv9FkWP5svcEF1=y_9KTRf7Q0-P2ZZJkg@mail.gmail.com>
In-Reply-To: <CAHC9VhQrBHr00Lxeocv9FkWP5svcEF1=y_9KTRf7Q0-P2ZZJkg@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 12 Oct 2020 20:58:14 -0400
Message-ID: <CAHC9VhTp+XaWou6=hQQzuG3DjKLn-x2irQZcjiAACy+ziEPTtg@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 12, 2020 at 8:54 PM Paul Moore <paul@paul-moore.com> wrote:
> On Mon, Oct 12, 2020 at 8:51 PM Paul Moore <paul@paul-moore.com> wrote:
> >
> > Hi Linus,
> >
> > A small set of audit patches for v5.10.  There are only three patches
> > in total, and all three are trivial fixes that don't really warrant
> > any explanations beyond their descriptions.  As usual, all three
> > patches pass our test suite and as of a few minutes ago they applied
> > cleanly to your tree.  Please merge for v5.10.
> >
> > Thanks,
> > -Paul
> >
> > --
> > The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:
> >
> >  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)
> >
> > are available in the Git repository at:
> >
> >  git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git
> >    stable-5.10
>
> My apologies, I mistakenly sent the branch and not the signed tag, the
> proper PR tag is below:
>
>  git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git
> audit-pr-20201012

Today is just not my day, of course the tag reference above is missing
the "tags/" prefix.  Sorry for all the noise.

> > for you to fetch changes up to c07203516439b9cd9f7b3cbed82a77164de5af40:
> >
> >  audit: Remove redundant null check (2020-08-26 09:10:39 -0400)
> >
> > ----------------------------------------------------------------
> > Jules Irenge (2):
> >      audit: change unnecessary globals into statics
> >      audit: uninitialize variable audit_sig_sid
> >
> > Xu Wang (1):
> >      audit: Remove redundant null check
> >
> > kernel/audit.c | 9 ++++-----
> > kernel/audit.h | 4 ----
> > 2 files changed, 4 insertions(+), 9 deletions(-)
> >
> > --
> > paul moore
> > www.paul-moore.com
>
>
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

