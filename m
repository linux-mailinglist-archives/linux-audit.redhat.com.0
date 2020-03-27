Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 99B77195ACD
	for <lists+linux-audit@lfdr.de>; Fri, 27 Mar 2020 17:14:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585325681;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CG74yT7jYxQhWkTcuMR6UIA1hg6ncqn22F9+gHmhUWI=;
	b=BZxHX1CgEGoFyg5fUvge5fq3Ou+UqRycob/2mmz6Ieff02WYWlEzZxgaPwHQGkFwhVlTYp
	jmPNs7k405qtA59jGXoeQeS5qaF3R804HYsodYB/0zPljHYgEbk0ey1eSivo4ZrApkBteR
	2x0ZYlKkta7Cvht94iexuhUxa+Y672M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-7a4CHUGgPUav_7CeHzeFbQ-1; Fri, 27 Mar 2020 12:14:38 -0400
X-MC-Unique: 7a4CHUGgPUav_7CeHzeFbQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C261A1922021;
	Fri, 27 Mar 2020 16:14:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0ACA260304;
	Fri, 27 Mar 2020 16:14:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 49DC68A04D;
	Fri, 27 Mar 2020 16:14:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02RGEDiJ012259 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 27 Mar 2020 12:14:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 86ABF5E009; Fri, 27 Mar 2020 16:14:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 932A05E01D;
	Fri, 27 Mar 2020 16:14:07 +0000 (UTC)
Date: Fri, 27 Mar 2020 12:14:04 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Steve Grubb <sgrubb@redhat.com>
Subject: Re: Audit record ordering requirements
Message-ID: <20200327161404.mn26qzdlh2d6ln25@madcap2.tricolour.ca>
References: <de87d7bb-a7df-0251-0f33-9aeeef3d0879.ref@schaufler-ca.com>
	<CAHC9VhS3Nj=KHAaCV2s9h3G02RG96BzmhiqrGT5n+Y+Cegy_QQ@mail.gmail.com>
	<2966967.03MRl4nvq3@x2> <1624736.Ce3VpmeUTe@x2>
MIME-Version: 1.0
In-Reply-To: <1624736.Ce3VpmeUTe@x2>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-03-27 10:08, Steve Grubb wrote:
> On Friday, March 27, 2020 10:03:07 AM EDT Steve Grubb wrote:
> > On Thursday, March 26, 2020 8:28:51 PM EDT Paul Moore wrote:
> > > On Thu, Mar 26, 2020 at 7:49 PM Casey Schaufler <casey@schaufler-ca.com>
> > 
> > wrote:
> > > > I'm looking at adding an audit record type for the case where
> > > > there are multiple security modules providing subject data. There
> > > > are several reasons to create a new record rather than adding the
> > > > additional information to existing records, including possible
> > > > size overflows and format compatibility.
> > > > 
> > > > While working with the code I have found that it is much easier
> > > > if the new record (I'm calling it MAC_TASK_CONTEXTS) can be generated
> > > > before the "base" record, which could be a SYSCALL record, than
> > > > after it. Can I get away with this? I haven't seen any documentation
> > > > that says the CWD record has to follow the event's SYSCALL record,
> > > > but I wouldn't be at all surprised if it's implicitly assumed.
> > > 
> > > From a kernel perspective, as long as the timestamp matches (so it's
> > > considered part of the same "event") I've got no problem with that.
> > > However, Steve's audit userspace has a lot of assumptions about how
> > > things are done so it's probably best that he comments on this so his
> > > tools don't blow up.
> > 
> > There are some assumptions about what record is last in order to speed up
> > "aging" the event during search so that we know the event is complete and
> > ready for processing. We can always change that if needed. But a new kernel
> > won't be compatible with older tools.
> > 
> > The only long term fix for this would be to have something that says how
> > many records are in this event, then add a field for each record saying
> > which one it is. Then we can have a reliable way to decide when we have
> > all records ready for processing. This only affects searching/reporting,
> > not logging.
> 
> Or I can make a change to put EOF to disk. Currently, that is not done to 
> conserve disk space.

I was going to say.  We already had that functionality.  It was recently
deleted.  An EOF isn't a big record.

> > But I think the records are in chronological order as the syscall traverses
> > the various observers in the kernel. And as Paul said, as long as they all
> > have the same timestamp/serial number, userspace will collect them all up.
> > 
> > -Steve

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
https://www.redhat.com/mailman/listinfo/linux-audit

