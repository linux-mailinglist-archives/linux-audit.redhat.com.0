Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id D7C26184CC6
	for <lists+linux-audit@lfdr.de>; Fri, 13 Mar 2020 17:45:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584117956;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LPeZMp9qjfkSaBk8YbYkUFcji33MDRX3xzN/kDPsptM=;
	b=dmah1KWsqDRGlpDGWqgG9QfyzRALC+lgGCYxvLI+QC2eMK/5OUwznKgLSgQy2jeXLvybi2
	Vlsju6TqrYquoWU9n6MH4dW8x/Z5f7f+Ef5Q5qJGWfyh/Fzl/chPMDyMkr82pj9qcIsScb
	WQBnUS2mWgNmp+X784Jhp8Pmug+Wbso=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-z9yPe_HwPiKLblCdAnUdVQ-1; Fri, 13 Mar 2020 12:45:54 -0400
X-MC-Unique: z9yPe_HwPiKLblCdAnUdVQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A58DF100FB03;
	Fri, 13 Mar 2020 16:45:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 703385DA60;
	Fri, 13 Mar 2020 16:45:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ADFC985EE4;
	Fri, 13 Mar 2020 16:45:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02DGjejJ011508 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 13 Mar 2020 12:45:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5DB925C1B5; Fri, 13 Mar 2020 16:45:40 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-117-60.phx2.redhat.com [10.3.117.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D1C565C1BB;
	Fri, 13 Mar 2020 16:45:30 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak90 V8 07/16] audit: add contid support for signalling
	the audit daemon
Date: Fri, 13 Mar 2020 12:45:29 -0400
Message-ID: <2588582.z15pWOfGEt@x2>
Organization: Red Hat
In-Reply-To: <CAHC9VhS9DtxJ4gvOfMRnzoo6ccGJVKL+uZYe6qqH+SPqD8r01Q@mail.gmail.com>
References: <cover.1577736799.git.rgb@redhat.com>
	<20200312202733.7kli64zsnqc4mrd2@madcap2.tricolour.ca>
	<CAHC9VhS9DtxJ4gvOfMRnzoo6ccGJVKL+uZYe6qqH+SPqD8r01Q@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, Richard Guy Briggs <rgb@redhat.com>,
	linux-api@vger.kernel.org, containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	linux-audit@redhat.com, netfilter-devel@vger.kernel.org,
	ebiederm@xmission.com, simo@redhat.com, netdev@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Friday, March 13, 2020 12:42:15 PM EDT Paul Moore wrote:
> > I think more and more, that more complete isolation is being done,
> > taking advantage of each type of namespace as they become available, but
> > I know a nuber of them didn't find it important yet to use IPC, PID or
> > user namespaces which would be the only namespaces I can think of that
> > would provide that isolation.
> > 
> > It isn't entirely clear to me which side you fall on this issue, Paul.
> 
> That's mostly because I was hoping for some clarification in the
> discussion, especially the relevant certification requirements, but it
> looks like there is still plenty of room for interpretation there (as
> usual).  I'd much rather us arrive at decisions based on requirements
> and not gut feelings, which is where I think we are at right now.

Certification rquirements are that we need the identity of anyone attempting 
to modify the audit configuration including shutting it down.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

