Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A7DDE1FF4D7
	for <lists+linux-audit@lfdr.de>; Thu, 18 Jun 2020 16:37:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592491025;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZirEhDhXxxrLKizpFbgqVObI1jGqJnbfyWxLp+VQVFw=;
	b=T5GBzZbPm6dIyRy/Rug3U7Jayp05nL1EDmIiVnU0oTvu/Toa3XgcEqdtQCiGaoIEL/QgMt
	hRyd7c3X/Xy8wHmaueDR4fc0mB4YQHx0t5N5UdyD51AtEKgHwDt3Pbe/Mz6/PGx9wQPuxD
	5HFJeMQ/ogdBUtXBQZsDP/nE6N1x9JY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-y-yK38ucO4myAxiUTh85uQ-1; Thu, 18 Jun 2020 10:37:02 -0400
X-MC-Unique: y-yK38ucO4myAxiUTh85uQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F36D102C80D;
	Thu, 18 Jun 2020 14:36:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2A1F1001E91;
	Thu, 18 Jun 2020 14:36:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2E7E2833C8;
	Thu, 18 Jun 2020 14:36:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05IEal9R014603 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 18 Jun 2020 10:36:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2EBC61002388; Thu, 18 Jun 2020 14:36:47 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-113-148.phx2.redhat.com [10.3.113.148])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1385E1001E91;
	Thu, 18 Jun 2020 14:36:44 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH] audit: optionally print warning after waiting to enqueue
	record
Date: Thu, 18 Jun 2020 10:36:43 -0400
Message-ID: <8359651.kEV6mM8lSS@x2>
Organization: Red Hat
In-Reply-To: <CAHC9VhRVk0OtY=r9iKyVmJJX6m4+oWWV0=idy-FOS9zOszMcKQ@mail.gmail.com>
References: <20200616045855.GA1699@linux-kernel-dev> <1648649.cZYg8c8PMo@x2>
	<CAHC9VhRVk0OtY=r9iKyVmJJX6m4+oWWV0=idy-FOS9zOszMcKQ@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thursday, June 18, 2020 9:46:54 AM EDT Paul Moore wrote:
> On Thu, Jun 18, 2020 at 9:39 AM Steve Grubb <sgrubb@redhat.com> wrote:
> > The kernel cannot grow the backlog unbounded. If you do nothing, the
> > backlog is 64 - which is too small to really use. Otherwise, you set the
> > backlog to a finite number with the -b option.
> 
> If one were to set the backlog limit to 0, it is effectively disabled
> allowing the backlog to grow without any restrictions placed on it by
> the audit subsystem.

Then I'd say you asked for it. The cure is setting a number. But regardless, 
we could use some metrics on the backlog and visibility into the time it 
takes to dequeue. That might signal problems with plugins or overly agressive 
rules.

-Steve



--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

