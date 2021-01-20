Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E51072FDC02
	for <lists+linux-audit@lfdr.de>; Wed, 20 Jan 2021 22:41:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611178882;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=t4ys2GmN+/Xf0UFHnvg8L3kONc1ou6z3wSyPgtCNY0I=;
	b=XTV2DmCpCU09Zs6xGb6P8OfOhINJyerd13AtmYoFMg0tWo5xT/FfTXKm7C1s2ZOXkmdBk+
	/lga2eEAAs64r+d1KM9mZ78wEtZlVs0EeL/hujGf+qD9SMsqFotzcQFRYp9chptqCXJAV/
	iBu/IprFyXjvohrHlLvWKk+myxV2smA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-3WrVmM6uNSyi8k8ZPxUT4g-1; Wed, 20 Jan 2021 16:41:18 -0500
X-MC-Unique: 3WrVmM6uNSyi8k8ZPxUT4g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E70C11005D4E;
	Wed, 20 Jan 2021 21:41:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24BA95D9D5;
	Wed, 20 Jan 2021 21:41:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9985C180954D;
	Wed, 20 Jan 2021 21:41:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10KLcxQG002358 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 20 Jan 2021 16:38:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CFF995D9DD; Wed, 20 Jan 2021 21:38:59 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-114-140.phx2.redhat.com [10.3.114.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 844485D9C2;
	Wed, 20 Jan 2021 21:38:55 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: "linux-audit@redhat.com" <linux-audit@redhat.com>
Subject: Re: Probable bug in auditd
Date: Wed, 20 Jan 2021 16:38:55 -0500
Message-ID: <2062426.irdbgypaU6@x2>
Organization: Red Hat
In-Reply-To: <SA2PR03MB567451FA692CEF4BC66D0A9886A20@SA2PR03MB5674.namprd03.prod.outlook.com>
References: <SA2PR03MB567451FA692CEF4BC66D0A9886A20@SA2PR03MB5674.namprd03.prod.outlook.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-audit@redhat.com
Cc: "shourya98@gmail.com" <shourya98@gmail.com>,
	Shourya Jaiswal <shourya.jaiswal@citrix.com>
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

Hello,

On Wednesday, January 20, 2021 3:54:45 PM EST Shourya Jaiswal wrote:
> I have found a weird behavior in auditd. File "/abc" does not exist.
> 
> audit.rules:
> 
> -a always,exit -F arch=b32 -S open -S openat
> 
> -a always,exit -F arch=b64 -S open -S openat
> 
> A non-root user executes "echo > /abc", it doesn't get logged in audit.log.

This is because name resolution fails before it gets to audit hooks inside 
the kernel. The audit hooks want to collect device, inode, permission, owner, 
group, etc. IOW, things that do not exist.



> Same with "echo > /etc/abc" A non-root user executes "cat /abc", it gets
> logged in audit.log
> 
> Since auditd is monitoring all the open and openat syscalls, ideally both
> the cases (i.e. read and write) should have be logged.

It's the kernel doing it. This comes up from time to time. It is logged here:

https://github.com/linux-audit/audit-kernel/issues/118

> After I execute "chmod a+w /" then "chmod a-w /", if a non-root user
> executes "echo > /abc", then it gets logged in audit.log.
> 
> This looks like a bug to me. Kindly let me know if it's a bug or an
> intended feature.

This is essentially how it works. But, there will be an improvement at some 
future point when issue 118 is resolved.

-Steve

> System used to test: Linux 5.4.0-56-generic #62-Ubuntu SMP x86_64 x86_64
> x86_64 GNU/Linux
> 


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

