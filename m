Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6BAF7228C81
	for <lists+linux-audit@lfdr.de>; Wed, 22 Jul 2020 01:11:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595373106;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fh6KVHYX3Y12/GWn+m1TPLZHJzfqbObJbeLpFZmmBHg=;
	b=X+I4Ixuvs+AuJF30GpNC13KvqcFIvCSSYwtf1YiLTyinxu9ccA0+lztDrqtbRt+1kuzHM6
	mk03C94qdS2je5C9M7ZXQ82XPjqR8eEh/Ysw1ivoAKXFZxGKbvVvpW8IIY/x7r67pDlEnS
	tTtMmqcphd42+UWoInYspHzSX7YVH/Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-YovWp2GhPi-84oh_Z1iK_w-1; Tue, 21 Jul 2020 19:11:44 -0400
X-MC-Unique: YovWp2GhPi-84oh_Z1iK_w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21C1A10059A4;
	Tue, 21 Jul 2020 23:11:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C6FA60E1C;
	Tue, 21 Jul 2020 23:11:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C29C3730C9;
	Tue, 21 Jul 2020 23:11:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06LN9N7k023038 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 21 Jul 2020 19:09:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A86931009978; Tue, 21 Jul 2020 23:09:23 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.3])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 92AE010013C1;
	Tue, 21 Jul 2020 23:09:16 +0000 (UTC)
Date: Tue, 21 Jul 2020 19:09:13 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: null pointer dereference regression in 5.7
Message-ID: <20200721230913.gnoakbg4mrb5opsz@madcap2.tricolour.ca>
References: <9c8f1fc6-2b8e-e9e3-37bf-2d1d6bedace1@gmail.com>
	<360c7a62-fd39-ad02-60b8-87fb18022eeb@defensec.nl>
	<CAHC9VhRGJ4EwFYpRtoHe=m_GNB6WAt3cDCf7pd4YbvydEPpy3w@mail.gmail.com>
	<CAHC9VhTbMB==FaxwUDviw9D5-M6wUGnYwwHz7wCDMYSOUw07dA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhTbMB==FaxwUDviw9D5-M6wUGnYwwHz7wCDMYSOUw07dA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
Cc: bauen1 <j2468h@googlemail.com>, linux-audit@redhat.com,
	Dominick Grift <dominick.grift@defensec.nl>
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
Content-Disposition: inline

On 2020-07-21 18:45, Paul Moore wrote:
> On Tue, Jul 21, 2020 at 6:30 PM Paul Moore <paul@paul-moore.com> wrote:
> > Richard, you broke it, you bought it :)  Did you want to take a closer
> > look at this?  If you can't let me know.  Based on a quick look, my
> > gut feeling is that either context->pwd is never set properly or it is
> > getting free'd prematurely; I'm highly suspicious of the latter but
> > the former seems like it might be a reasonable place to start.
> 
> Actually, yes, I'm pretty certain the problem is that context->pwd is
> never set in this case.

I'll have a look.  This review is also related to ghak122 and
potentially missing PATH records...

> Normally context->pwd would be set by a call to
> audit_getname()/__audit_getname(), but if there audit context is a
> dummy context, that is skipped and context->pwd is never set.
> Normally that is fine, expect with Richard's patch if the kernel
> explicitly calls audit_log_start() we mark the context as ... not a
> dummy?  smart?  I'm not sure of the right term here ... which then
> triggers all the usual logging one would expect.  In this particular
> case, a SELinux AVC, the audit_log_start() happens *after* the
> pathname has been resolved and the audit_getname() calls are made;
> thus in this case context->pwd is not valid when the normal audit
> logging takes place on exit and things explode in predictable fashion.
> 
> Unfortunately, it is beginning to look like 1320a4052ea1 ("audit:
> trigger accompanying records when no rules present") may be more
> dangerous than initially thought.  I'm borderline tempted to just
> revert this patch, but I'll leave this open for discussion ...
> Richard, I think you need to go through the code and audit all of the
> functions that store data in an audit context that are skipped when
> there is a dummy context to see which fields are potentially unset,
> and then look at all the end of task/syscall code to make sure the
> necessary set/unset checks are in place.
> 
> This should be a priority.
> 
> -- 
> paul moore
> www.paul-moore.com
> 
> --
> Linux-audit mailing list
> Linux-audit@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-audit

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

