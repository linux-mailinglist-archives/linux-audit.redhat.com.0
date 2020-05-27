Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 907581E3419
	for <lists+linux-audit@lfdr.de>; Wed, 27 May 2020 02:37:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590539842;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=m1LUXoxvIWbISkMuFOXD7kkNpGVhOm6RqLDpb6EZn+E=;
	b=Wvc52WV5GB54Llb+SZWz91yIQrLukhyEppicJdVyQPjn0GzQbfIJJ/h+HPZ1NxcUWbKKcs
	COL4jU/YpGOA6nRBYMeYYFY9N/U94InhUqVB1D5gjUnW54JnO+0onPLoYUKl2gvKy/gepS
	Nim5qAyf6/8q95c4wJHSo7fs3YjgjMY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-Zhcrg3h3Nui0XMvkhH97iQ-1; Tue, 26 May 2020 20:37:20 -0400
X-MC-Unique: Zhcrg3h3Nui0XMvkhH97iQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27E6E107ACF2;
	Wed, 27 May 2020 00:37:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2B5786C7C;
	Wed, 27 May 2020 00:37:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6CD6E1809543;
	Wed, 27 May 2020 00:37:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04R0atsR026879 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 26 May 2020 20:36:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2DF6479C38; Wed, 27 May 2020 00:36:55 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from shell-el7.hosts.prod.upshift.rdu2.redhat.com
	(shell-el7.hosts.prod.upshift.rdu2.redhat.com [10.0.15.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5ACAB79C2C;
	Wed, 27 May 2020 00:36:52 +0000 (UTC)
Received: by shell-el7.hosts.prod.upshift.rdu2.redhat.com (Postfix,
	from userid 2518)
	id 46B4C600D26D; Wed, 27 May 2020 00:36:51 +0000 (UTC)
Date: Wed, 27 May 2020 00:36:51 +0000
From: Alexander Viro <aviro@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [RFC] audit: allow audit_reusename to check kernel path
Message-ID: <20200527003651.GA97661@shell-el7.hosts.prod.upshift.rdu2.redhat.com>
References: <1590391317-71528-1-git-send-email-guyiwen@huawei.com>
	<CAHC9VhQ8orX0B4Rq5ztaumrGQKmaPvu8n059MomRM0fxUc3H_Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhQ8orX0B4Rq5ztaumrGQKmaPvu8n059MomRM0fxUc3H_Q@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, May 26, 2020 at 08:32:06AM -0400, Paul Moore wrote:
> On Mon, May 25, 2020 at 3:22 AM Yiwen Gu <guyiwen@huawei.com> wrote:
> > For now, we met a situation where the audit_reusename checking
> > function returns the same filename structure for files sharing
> > the same uptr. However, these files are different, and we are trying
> > to open them in a loop where the names are loaded into the same address.
> > Therefore, the function returns the same structure for different files.
> > By the way, may I ask in what situation would the audit_list be kept
> > across syscalls?

Never.  "reuse" is strictly within the same syscall, so e.g. -ESTALE
retry logics doesn't have to worry about extra instances of struct
filename.

> What kernel are you using?  Is this an Android kernel?
> 
> Do you have a reproducer you can share?

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

