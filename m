Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 15012152041
	for <lists+linux-audit@lfdr.de>; Tue,  4 Feb 2020 19:12:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580839962;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/jokVQrCKeAZd6w9SwM2xdvLs+nQ5U6m25YSnpNo7fg=;
	b=RuYYaZtdn5m7myVYZPOuzAem6Ymt+qjqbUjl9GKq9WUnc9GhZ74Gs8klylCgxJSfePhG7p
	x6duI4xf22itSt15zDxsSyc7CrXv7vWsjFdAVT00UYyhuI6qGCQL3odx3mgDQGu92hUEJo
	ujbiWYp6Ab7wpBId5jaVP5Ck3+svyoU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-8JvmCEj_Nk24vSuXLUJ4Vw-1; Tue, 04 Feb 2020 13:12:39 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 661F7B1569;
	Tue,  4 Feb 2020 18:12:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 61DD560BF3;
	Tue,  4 Feb 2020 18:12:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E09AE18089CE;
	Tue,  4 Feb 2020 18:12:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 014ICFDX006033 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 4 Feb 2020 13:12:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 08343194BB; Tue,  4 Feb 2020 18:12:15 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-11.phx2.redhat.com [10.3.116.11])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9117C19C69;
	Tue,  4 Feb 2020 18:12:03 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak90 V8 13/16] audit: track container nesting
Date: Tue, 04 Feb 2020 13:12:02 -0500
Message-ID: <35934535.C1y6eIYgqz@x2>
Organization: Red Hat
In-Reply-To: <CAHC9VhRHfjuv5yyn+nQ2LbHtcezBcjKtOQ69ssYrXOiExuCjBw@mail.gmail.com>
References: <cover.1577736799.git.rgb@redhat.com> <3665686.i1MIc9PeWa@x2>
	<CAHC9VhRHfjuv5yyn+nQ2LbHtcezBcjKtOQ69ssYrXOiExuCjBw@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, Richard Guy Briggs <rgb@redhat.com>,
	linux-api@vger.kernel.org, containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, mpatel@redhat.com,
	Serge Hallyn <serge@hallyn.com>
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
X-MC-Unique: 8JvmCEj_Nk24vSuXLUJ4Vw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tuesday, February 4, 2020 10:52:36 AM EST Paul Moore wrote:
> On Tue, Feb 4, 2020 at 10:47 AM Steve Grubb <sgrubb@redhat.com> wrote:
> > On Tuesday, February 4, 2020 8:19:44 AM EST Richard Guy Briggs wrote:
> > > > The established pattern is that we print -1 when its unset and "?"
> > > > when
> > > > its totalling missing. So, how could this be invalid? It should be
> > > > set
> > > > or not. That is unless its totally missing just like when we do not
> > > > run
> > > > with selinux enabled and a context just doesn't exist.
> > > 
> > > Ok, so in this case it is clearly unset, so should be -1, which will be
> > > a
> > > 20-digit number when represented as an unsigned long long int.
> > > 
> > > Thank you for that clarification Steve.
> > 
> > It is literally a  -1.  ( 2 characters)
> 
> Well, not as Richard has currently written the code, it is a "%llu".
> This was why I asked the question I did; if we want the "-1" here we
> probably want to special case that as I don't think we want to display
> audit container IDs as signed numbers in general.

OK, then go with the long number, we'll fix it in the interpretation. I guess 
we do the same thing for auid.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

