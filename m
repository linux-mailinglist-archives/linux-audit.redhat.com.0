Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D70F5151DA1
	for <lists+linux-audit@lfdr.de>; Tue,  4 Feb 2020 16:49:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580831370;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=u7ifpl8fgiPSU21h71IfIpKJMk/UjiV4RVy665iwPnM=;
	b=ZhH8aS4qNdT06K6K3FfIuXNlc0/iIW7NttsiJzXJLpwJx6BXMpzhTSjhRRwiGfrlpr1CBk
	jjfH8hn0ZcBgixxsGobCdunytNQCidwVLD+o/WCxMvXlKyxHAAytuICf8fUMoZ/pR+g7DC
	bGwrzhhVfNtACRyrqvqASyxpnBMxPeA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-5cMFZn6hOEKzg17HUzkl4Q-1; Tue, 04 Feb 2020 10:48:02 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C64885B6EE;
	Tue,  4 Feb 2020 15:47:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 92BA98DC08;
	Tue,  4 Feb 2020 15:47:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D6EDA81746;
	Tue,  4 Feb 2020 15:47:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 014Fla1O000951 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 4 Feb 2020 10:47:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B08E65C883; Tue,  4 Feb 2020 15:47:36 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-11.phx2.redhat.com [10.3.116.11])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BFF115C1B5;
	Tue,  4 Feb 2020 15:47:23 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: [PATCH ghak90 V8 13/16] audit: track container nesting
Date: Tue, 04 Feb 2020 10:47:22 -0500
Message-ID: <3665686.i1MIc9PeWa@x2>
Organization: Red Hat
In-Reply-To: <20200204131944.esnzcqvnecfnqgbi@madcap2.tricolour.ca>
References: <cover.1577736799.git.rgb@redhat.com> <5238532.OiMyN8JqPO@x2>
	<20200204131944.esnzcqvnecfnqgbi@madcap2.tricolour.ca>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 5cMFZn6hOEKzg17HUzkl4Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tuesday, February 4, 2020 8:19:44 AM EST Richard Guy Briggs wrote:
> > The established pattern is that we print -1 when its unset and "?" when
> > its totalling missing. So, how could this be invalid? It should be set
> > or not. That is unless its totally missing just like when we do not run
> > with selinux enabled and a context just doesn't exist.
> 
> Ok, so in this case it is clearly unset, so should be -1, which will be a
> 20-digit number when represented as an unsigned long long int.
> 
> Thank you for that clarification Steve.

It is literally a  -1.  ( 2 characters)

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

