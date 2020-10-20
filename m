Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5D195293D63
	for <lists+linux-audit@lfdr.de>; Tue, 20 Oct 2020 15:34:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603200857;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=i7Wsl5YfFk0P58qTr7z/XrixGgd7rXHxLxti6iA09i4=;
	b=cr86DlSCLPnBfP643NQaYIFwWL/wL0tT5BoYZlrwh/tARShG/MAA3DqSE7rqQDWivpoqJn
	OmR9SJ2bYym7gIsiraSYkXNS0RxOV5jTQmRBWYtVlbEMGZ3lalzwN75YdRX5miCQi2/FdW
	fUjpeKxV6G5rFLZjIOcrppUTsycFYck=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-2cih1GkqMI2WfaV5wJj2ZQ-1; Tue, 20 Oct 2020 09:34:15 -0400
X-MC-Unique: 2cih1GkqMI2WfaV5wJj2ZQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2EA1803F5C;
	Tue, 20 Oct 2020 13:34:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CAD61002C14;
	Tue, 20 Oct 2020 13:34:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 42E678C7B9;
	Tue, 20 Oct 2020 13:34:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09KDXpkK019373 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 20 Oct 2020 09:33:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9232A5B4AE; Tue, 20 Oct 2020 13:33:51 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-115-32.rdu2.redhat.com [10.10.115.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 285B35B4B3;
	Tue, 20 Oct 2020 13:33:48 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: "linux-audit@redhat.com" <linux-audit@redhat.com>
Subject: Re: How to monitor only when a binary is launched
Date: Tue, 20 Oct 2020 09:33:46 -0400
Message-ID: <3089038.aeNJFYEL58@x2>
Organization: Red Hat
In-Reply-To: <5F4EE10832231F4F921A255C1D954298154FB33A@DEERLM99EX7MSX.ww931.my-it-solutions.net>
References: <5F4EE10832231F4F921A255C1D954298154FB33A@DEERLM99EX7MSX.ww931.my-it-solutions.net>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-audit@redhat.com
Cc: "MAUPERTUIS, PHILIPPE" <philippe.maupertuis@equensworldline.com>
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

On Tuesday, October 20, 2020 4:59:56 AM EDT MAUPERTUIS, PHILIPPE wrote:
> Aide or clamscan are analyzing all the files on the system thus generating
> a lot of messages They are binaries that I can trust so I can exclude
> their activity from auditd. I know that I can do this with -a never,exit
> -F arch=b64 -F exe=/sbin/aide
> 
> However I would like to have an entry for the execution of the binary
> itself with the parameters used. I would like to turn off only the report
> of the syscall it issued .
> 
> Is there a general way to achieve that : record the launch of a binary but
> not its actions.

Wouldn't -a always,exit -S execve  do the job?

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

