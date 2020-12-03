Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D051B2CE334
	for <lists+linux-audit@lfdr.de>; Fri,  4 Dec 2020 00:56:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607039788;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EbhaF88LFZo/xi8n1Saam4vp2zGn4ddtTQ32Z8Md/ec=;
	b=OckZXTttEl4VI9hChTHzxoCrNWImSug1qHYJS5Ht2jK4M8wBImEVToCwSU3+xBTX+tO05F
	1PuBrP4S+pGvdR7I9KEX9XizlIVHOMzIb95O9F26WYqQfCcto7StkDZirJzL8O6FY4QSJe
	DUTvFgDH0j6vE9NpH0NtfZT2wPMWGxs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-54dtN7jVNmS3jFs3bEJYDg-1; Thu, 03 Dec 2020 18:56:26 -0500
X-MC-Unique: 54dtN7jVNmS3jFs3bEJYDg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7A0D107ACE8;
	Thu,  3 Dec 2020 23:56:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E10695C1CF;
	Thu,  3 Dec 2020 23:56:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B5BF04A7C6;
	Thu,  3 Dec 2020 23:56:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B3NtupX019485 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 18:55:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3E0875D9CC; Thu,  3 Dec 2020 23:55:56 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-119-87.rdu2.redhat.com [10.10.119.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E542F5D9CA;
	Thu,  3 Dec 2020 23:55:49 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Richard Guy Briggs <rgb@redhat.com>, Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v2] audit: report audit wait metric in audit status reply
Date: Thu, 03 Dec 2020 18:55:49 -0500
Message-ID: <20883376.EfDdHjke4D@x2>
Organization: Red Hat
In-Reply-To: <CAHC9VhR91u2VKy3RwxB4_bs3GdZupyq6oWKg5hPvacssc6tuOQ@mail.gmail.com>
References: <20200701213244.GA1817@linux-kernel-dev>
	<20201203231003.GK1762914@madcap2.tricolour.ca>
	<CAHC9VhR91u2VKy3RwxB4_bs3GdZupyq6oWKg5hPvacssc6tuOQ@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thursday, December 3, 2020 6:43:11 PM EST Paul Moore wrote:
> > So far there are only seven bits used out of 32, so it does not appear we
> > are in danger of running out anytime soon.

Exactly. Even capability bits are easier to get assigned.  :-)

> > It was introduced with commit 0288d7183c41c0192d2963d44590f346f4aee917
> > Author:     Richard Guy Briggs <rgb@redhat.com>
> > AuthorDate: 2014-11-17 15:51:01 -0500
> > Commit:     Paul Moore <pmoore@redhat.com>
> > CommitDate: 2014-11-17 16:53:51 -0500
> > ("audit: convert status version to a feature bitmap")
> > It was introduced specifically to enable distributions to selectively
> > backport features.  It was converted away from AUDIT_VERSION.
> > 
> > There are other ways to detect the presence of backlog_wait_time_actual
> > as I mentioned above.
> 
> Let me be blunt - I honestly don't care what Steve's audit userspace
> does to detect this.  I've got my own opinion, but Steve's audit
> userspace is not my project to manage and I think we've established
> over the years that Steve and I have very different views on what
> constitutes good design.

And guessing what might be in buffers of different sizes is good design? The 
FEATURE_BITMAP was introduced to get rid of this ambiguity.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

