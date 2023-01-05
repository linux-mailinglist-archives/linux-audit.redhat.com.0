Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B5665F13A
	for <lists+linux-audit@lfdr.de>; Thu,  5 Jan 2023 17:32:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672936329;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=khsF0Mo7TOSVYnrXXWMuAvGa6TyFLesSRogJG22UNCw=;
	b=KvqeKOZXt3dIrrS5O2ltpEcSnl9tCcOOlfRA6+oH59xKwbknM7FYJJrUerRIF67jsevGCH
	vL9nBqq3VafAyD8v7OIYZZhvtQzt1ZC6ueMDMGa1lRgaQ3p8GJ7GQGxXuhm1WbD3cTLSB3
	ZcQaEz7Qg6vITvrgxzJnmwkXpXeaJes=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-TENi406aMPyqERVfwBSPjw-1; Thu, 05 Jan 2023 11:32:07 -0500
X-MC-Unique: TENi406aMPyqERVfwBSPjw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73A5585CBF2;
	Thu,  5 Jan 2023 16:32:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9BB90140EBF6;
	Thu,  5 Jan 2023 16:32:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2518A1947053;
	Thu,  5 Jan 2023 16:32:00 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 915491946586 for <linux-audit@listman.corp.redhat.com>;
 Thu,  5 Jan 2023 16:31:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 62FB0492B06; Thu,  5 Jan 2023 16:31:58 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.33.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F115492B07;
 Thu,  5 Jan 2023 16:31:58 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Ariel Silver <arielsilver77@gmail.com>, linux-audit@redhat.com
Subject: Re: New bug in Audit
Date: Thu, 05 Jan 2023 11:31:57 -0500
Message-ID: <5654293.DvuYhMxLoT@x2>
Organization: Red Hat
In-Reply-To: <CAHC9VhQ10FeuFYqhC31YCmU9BB67go3RoMOsYn+SWA5TsWKy9w@mail.gmail.com>
References: <CACKMdf=43CJmauoVnyzemsGtJoR5g=yDUUojJ3P1qsbKrrNMXQ@mail.gmail.com>
 <CAHC9VhQ10FeuFYqhC31YCmU9BB67go3RoMOsYn+SWA5TsWKy9w@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thursday, January 5, 2023 10:41:49 AM EST Paul Moore wrote:
> On Thu, Jan 5, 2023 at 8:38 AM Ariel Silver <arielsilver77@gmail.com> 
wrote:
> > I found the following bug:
> > 
> > OS version = Red Hat Enterprise Linux release 8.6 (Ootpa)
> > Kernel version = 4.18.0-425.3.1.el8.x86_64
> > auditctl version = 3.0.7
> 
> This mailing list is focused on the development and support of
> upstream Linux Kernels and Steve's audit userspace, we don't really
> provide support for paid distributions.  If you are seeing problems
> with the upstream Linux Kernel or tools, please report them here, but
> issues with distribution kernels and/or tools should be sent to the
> distribution for support/assistance.

Paul, we take bug reports and help requests from anyone. Often, distributions 
are how we first hear of problems.

> I believe you should be able to submit a bug report against Red Hat
> Enterprise Linux using the Red Hat bugzilla instance at the URL below:

I believe this is fixed by this commit:

https://github.com/linux-audit/audit-kernel/commit/
1b2263a807ca651f94517b1b22dc5f13e494984d

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

