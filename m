Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 51036213BB7
	for <lists+linux-audit@lfdr.de>; Fri,  3 Jul 2020 16:19:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593785973;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=W6kaQUu0voMV9P4U0DNOxgLKVNBMJSZHuiQbnwwJrWU=;
	b=Armu7kMpVMqYBHSKnsdY4tHbwmAVOAWiZQ8yS/oH5oWVb8rHADVLOkWrNddTNyx8jriLqR
	hz58IqSbHRCqQx1+K+BFw++t+S9Ec8uikmbwRWaiXW5WMJZCnS6l26giEI56mtVuc4uPg2
	mjo+n/1Ic3+MpXZvAK6KJAHVpETWfSg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-jpwdl6tgNOeIt5v9-9GpZw-1; Fri, 03 Jul 2020 10:19:30 -0400
X-MC-Unique: jpwdl6tgNOeIt5v9-9GpZw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23ACF800401;
	Fri,  3 Jul 2020 14:19:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 66E8F4F6AC;
	Fri,  3 Jul 2020 14:19:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3AD876C9CB;
	Fri,  3 Jul 2020 14:19:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 063EJHfb011303 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 3 Jul 2020 10:19:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 128706111F; Fri,  3 Jul 2020 14:19:17 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.3])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60C2218B05;
	Fri,  3 Jul 2020 14:19:06 +0000 (UTC)
Date: Fri, 3 Jul 2020 10:19:03 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak124 v3fix] audit: add gfp parameter to audit_log_nfcfg
Message-ID: <20200703141903.zniosc4bxuw5dhit@madcap2.tricolour.ca>
References: <3eda864fb69977252a061c8c3ccd2d8fcd1f3a9b.1593278952.git.rgb@redhat.com>
	<CAGdUbJEwoxEFJZDUjF7ZwKurKNibPW86=s3yFSA6BBt-YsC=Nw@mail.gmail.com>
	<CAHC9VhTYy5Zd6kB77xYL6HbnqL29AL6jF8RzVAN6=UC6eVLqCg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhTYy5Zd6kB77xYL6HbnqL29AL6jF8RzVAN6=UC6eVLqCg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
Cc: Jones Desougi <jones.desougi+netfilter@gmail.com>,
	Florian Westphal <fw@strlen.de>, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, twoerner@redhat.com,
	Eric Paris <eparis@parisplace.org>, tgraf@infradead.org,
	dan.carpenter@oracle.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-07-03 09:41, Paul Moore wrote:
> On Fri, Jul 3, 2020 at 8:41 AM Jones Desougi
> <jones.desougi+netfilter@gmail.com> wrote:
> >
> > Doesn't seem entirely consistent now either though. Two cases below.
> 
> Yes, you're right, that patch was incorrect; thanks for catching that.
> I just posted a fix (lore link below) that fixes the two problems you
> pointed out as well as converts a call in a RCU protected section to
> an ATOMIC.

Thanks Paul.  I was just about to switch branches and fix these.  :-)
I really need to upgrade this devel machine so I can use git 2.x
worktrees...

I checked all of these (I thought) thoroughly before I started changing
code and obviously didn't after.  :-/

> https://lore.kernel.org/linux-audit/159378341669.5956.13490174029711421419.stgit@sifl
> 
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

