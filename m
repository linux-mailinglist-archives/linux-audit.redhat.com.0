Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id B120021E4F6
	for <lists+linux-audit@lfdr.de>; Tue, 14 Jul 2020 03:09:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594688962;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tUbVZs8BvHBFg3XSLax6sAjQ8JEt7Gxgf7hTdSQ4/lQ=;
	b=JJAoP2YGn/2JmPkHGPS4M7aT4Mb1kkWZZz+nNwt/kv6h8JqdRwz4yAkPVLaPg2F5xlxJ8X
	+KvxtGH27pnXXwkSldNPJ9WRnkyuwN3LJmFINxmqGla819wHWlitKFLw72XkGKoFuYLKaC
	hCaoJlEJ9zyA1V7bpMshqDhyt1kVF9o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-1cyi-G-VP367to2vzQPjjg-1; Mon, 13 Jul 2020 21:09:20 -0400
X-MC-Unique: 1cyi-G-VP367to2vzQPjjg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7C388015F4;
	Tue, 14 Jul 2020 01:09:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 551BB1A912;
	Tue, 14 Jul 2020 01:09:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 24E5994EFA;
	Tue, 14 Jul 2020 01:09:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06E18OH4028972 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 21:08:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 42A6076219; Tue, 14 Jul 2020 01:08:24 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.3])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7471879222;
	Tue, 14 Jul 2020 01:08:17 +0000 (UTC)
Date: Mon, 13 Jul 2020 21:08:14 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak122 v1] audit: store event sockaddr in case of no rules
Message-ID: <20200714010814.rbmpsbmyvyj5tab4@madcap2.tricolour.ca>
References: <b62d4388b488dedfa2758f32e6d1e5414179b4f2.1593796497.git.rgb@redhat.com>
	<CAHC9VhReURKRe63t7mudKpkW0aVNpCmF=UWHSof1uvRkmZ8HTQ@mail.gmail.com>
	<20200713174014.mjsdugomgjtl3kgz@madcap2.tricolour.ca>
	<9ec00f40-e7e9-950e-4ed9-48533a9ee223@schaufler-ca.com>
	<20200713200214.qh3vnhcjozpnqf2l@madcap2.tricolour.ca>
	<e2a183b2-35f4-8493-c485-8bf86e5866e9@schaufler-ca.com>
	<CAHC9VhQUiqkeygtEWAa=j8Dxysh_jSWhf33CYo7i2Tij26FH2w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhQUiqkeygtEWAa=j8Dxysh_jSWhf33CYo7i2Tij26FH2w@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
Cc: Eric Paris <eparis@parisplace.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-07-13 20:11, Paul Moore wrote:
> On Mon, Jul 13, 2020 at 7:09 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> > ... but it does appear that I could switch to using your audit_alloc_local().
> 
> In my opinion, linking the audit container ID and LSM stacking
> patchsets would seem like a very big mistake, especially since the
> consolidation you are describing could be done after the fact without
> any disruption to the kernel/userspace interface.  I would strongly
> encourage both patchsets to remain self-contained if at all possible
> so as to not jeopardize each other.

I see no need to link them.  The audit_alloc_local() patch could stand
on its own to be used by either patchset and doesn't need to be included
in the contid patchset.  There is no mention of contid in it.  Patches 8
and 11 depend on it so as long as it is already upstream that's fine.
Of course, we could send a fixup patch after both patchsets are accepted
upstream to merge the functionality of the two.

> paul moore

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

