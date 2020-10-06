Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 281A5285302
	for <lists+linux-audit@lfdr.de>; Tue,  6 Oct 2020 22:20:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602015654;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=T+rt0NxTzKDylZJnQmEQmbOY3GwWqiJfJxJVgZUy63A=;
	b=IP4nKqhuCrbi9+d4QZf/5k8FflhtLyR8KpTBi1rEOjRiqnTlnGbQ5FbneqLzhSvwRYagQQ
	BIT/JS3n05/5zuFF6pGgmr4OQMB4S8+5ADviaeZALmI9sPKP9efHhxiYN4vZC5mJZQBmQ9
	IL5TzN+4LFC4nxcsG5D1zcCJA1FdKW8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-bZ7J5ZKsMW-udMUtFGHS_g-1; Tue, 06 Oct 2020 16:20:52 -0400
X-MC-Unique: bZ7J5ZKsMW-udMUtFGHS_g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72C9010866AC;
	Tue,  6 Oct 2020 20:20:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 09B1410013D7;
	Tue,  6 Oct 2020 20:20:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CA9A379FF3;
	Tue,  6 Oct 2020 20:20:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 096KKab2023906 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 6 Oct 2020 16:20:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D9C5037DD; Tue,  6 Oct 2020 20:20:36 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-174.rdu2.redhat.com [10.10.116.174])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 94EC760E1C;
	Tue,  6 Oct 2020 20:20:33 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: Identifying thread/process termination
Date: Tue, 06 Oct 2020 16:20:32 -0400
Message-ID: <5549003.MhkbZ0Pkbq@x2>
Organization: Red Hat
In-Reply-To: <CAPErmPdDACGemKqTrUk4xKNBwnoj6FEeWbsvmk7jS0TjOyaOqg@mail.gmail.com>
References: <CAPErmPdDACGemKqTrUk4xKNBwnoj6FEeWbsvmk7jS0TjOyaOqg@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

On Monday, October 5, 2020 3:07:12 PM EDT Natan Yellin wrote:
> I've been tracking all process terminations using a rule for the exit and
> exit_group syscalls. However, by looking at the audit events for exit it is
> impossible to differentiate between the death of different threads in the
> same thread group. Is there an alternative way to track this?

I don't think the audit system was ever designed to distinguish between 
threads. But there is a general need to determine the exit of a process 
rather than a thread. 

Paul, Richard, Do you have any thoughts?

-Steve

> For my use case, I would like to know when either processes or individual
> threads execute and terminate. (I'm fine tracking at either granularity.)
> Right now I can track the creation properly using fork/clone/etc but for
> termination I receive multiple exit events with identical information that
> doesn't let me know which thread died.




--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

