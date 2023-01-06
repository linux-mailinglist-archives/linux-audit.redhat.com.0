Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F9465F830
	for <lists+linux-audit@lfdr.de>; Fri,  6 Jan 2023 01:35:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672965347;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Y8sdGzuw4pBBccmCN61/GQroO81B1zfM2kzNf+nulBI=;
	b=H7DPh98S8y7/YDxzmGBGzAZszVB04Oatlpr+gALiKQwGMiShQPSzLtnRX7Vo/yF2g8Sh/G
	bkJ5G9rXp4ggSFpF+LJUzXsEBssLDVIcZB//GmDDHEGOva4oAM6Zs6NJpcFv5/Txqb780U
	+x3KQxdEhK90peBdceqqx0dp5P5QhEE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-LLq7vtx8O9GIyfqpAsvP4w-1; Thu, 05 Jan 2023 19:35:44 -0500
X-MC-Unique: LLq7vtx8O9GIyfqpAsvP4w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5413338041DB;
	Fri,  6 Jan 2023 00:35:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 227DC400E107;
	Fri,  6 Jan 2023 00:35:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8F48419465A3;
	Fri,  6 Jan 2023 00:35:31 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BDD1D1946586 for <linux-audit@listman.corp.redhat.com>;
 Fri,  6 Jan 2023 00:35:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 00AC42026D76; Fri,  6 Jan 2023 00:35:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-0-3.rdu2.redhat.com [10.22.0.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 52CB92026D4B;
 Fri,  6 Jan 2023 00:35:29 +0000 (UTC)
Date: Thu, 5 Jan 2023 19:35:27 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Steve Grubb <sgrubb@redhat.com>
Subject: Re: New bug in Audit
Message-ID: <Y7dsz8lctQfIefO+@madcap2.tricolour.ca>
References: <CACKMdf=43CJmauoVnyzemsGtJoR5g=yDUUojJ3P1qsbKrrNMXQ@mail.gmail.com>
 <CAHC9VhQ10FeuFYqhC31YCmU9BB67go3RoMOsYn+SWA5TsWKy9w@mail.gmail.com>
 <5654293.DvuYhMxLoT@x2>
MIME-Version: 1.0
In-Reply-To: <5654293.DvuYhMxLoT@x2>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
Cc: linux-audit@redhat.com, Ariel Silver <arielsilver77@gmail.com>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2023-01-05 11:31, Steve Grubb wrote:
> On Thursday, January 5, 2023 10:41:49 AM EST Paul Moore wrote:
> > On Thu, Jan 5, 2023 at 8:38 AM Ariel Silver <arielsilver77@gmail.com> wrote:
> > > I found the following bug:
> > > 
> > > OS version = Red Hat Enterprise Linux release 8.6 (Ootpa)
> > > Kernel version = 4.18.0-425.3.1.el8.x86_64
> > > auditctl version = 3.0.7
> > 
> > This mailing list is focused on the development and support of
> > upstream Linux Kernels and Steve's audit userspace, we don't really
> > provide support for paid distributions.  If you are seeing problems
> > with the upstream Linux Kernel or tools, please report them here, but
> > issues with distribution kernels and/or tools should be sent to the
> > distribution for support/assistance.
> 
> Paul, we take bug reports and help requests from anyone. Often, distributions 
> are how we first hear of problems.

We did, it is filed upstream as:

	https://github.com/linux-audit/audit-kernel/issues/138

> > I believe you should be able to submit a bug report against Red Hat
> > Enterprise Linux using the Red Hat bugzilla instance at the URL below:
> 
> I believe this is fixed by this commit:
> 
> https://github.com/linux-audit/audit-kernel/commit/
> 1b2263a807ca651f94517b1b22dc5f13e494984d

Yes, that commit fixes that bug upstream.

It has been backported to RHEL.

> -Steve

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635
--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

