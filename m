Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 9F12A1958A2
	for <lists+linux-audit@lfdr.de>; Fri, 27 Mar 2020 15:09:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585318165;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ApAG9RcI7vRqcmn9DXnLMQj18kck+nmEr3ywdgrlw6c=;
	b=VLtQC/wOnBt6175QDPE8G13FiMc/3K/YQIEUdB1ocpgu2H997zhYpD0RIx+175Wt9/l+0a
	ZokylcVXfX1Eo7uX61a54Pes19uTS5xwKuDd/XeOsvhTOCyub4J9hnPuOJO0WH7AWpDKEo
	9d983EY/nOCH4S1lLJKXlvPPX6+LRg8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-g4D_2cH8P7u6n6EUC1d4HA-1; Fri, 27 Mar 2020 10:09:23 -0400
X-MC-Unique: g4D_2cH8P7u6n6EUC1d4HA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACD4318AB2D6;
	Fri, 27 Mar 2020 14:09:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 805975DA7D;
	Fri, 27 Mar 2020 14:09:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 71A428A057;
	Fri, 27 Mar 2020 14:09:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02RE97LR007696 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 27 Mar 2020 10:09:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 20B8E7E311; Fri, 27 Mar 2020 14:09:07 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-113-202.phx2.redhat.com [10.3.113.202])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ADBBE96FB1;
	Fri, 27 Mar 2020 14:09:00 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: Audit record ordering requirements
Date: Fri, 27 Mar 2020 10:08:57 -0400
Message-ID: <1624736.Ce3VpmeUTe@x2>
Organization: Red Hat
In-Reply-To: <2966967.03MRl4nvq3@x2>
References: <de87d7bb-a7df-0251-0f33-9aeeef3d0879.ref@schaufler-ca.com>
	<CAHC9VhS3Nj=KHAaCV2s9h3G02RG96BzmhiqrGT5n+Y+Cegy_QQ@mail.gmail.com>
	<2966967.03MRl4nvq3@x2>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>
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

On Friday, March 27, 2020 10:03:07 AM EDT Steve Grubb wrote:
> On Thursday, March 26, 2020 8:28:51 PM EDT Paul Moore wrote:
> > On Thu, Mar 26, 2020 at 7:49 PM Casey Schaufler <casey@schaufler-ca.com>
> 
> wrote:
> > > I'm looking at adding an audit record type for the case where
> > > there are multiple security modules providing subject data. There
> > > are several reasons to create a new record rather than adding the
> > > additional information to existing records, including possible
> > > size overflows and format compatibility.
> > > 
> > > While working with the code I have found that it is much easier
> > > if the new record (I'm calling it MAC_TASK_CONTEXTS) can be generated
> > > before the "base" record, which could be a SYSCALL record, than
> > > after it. Can I get away with this? I haven't seen any documentation
> > > that says the CWD record has to follow the event's SYSCALL record,
> > > but I wouldn't be at all surprised if it's implicitly assumed.
> > 
> > From a kernel perspective, as long as the timestamp matches (so it's
> > considered part of the same "event") I've got no problem with that.
> > However, Steve's audit userspace has a lot of assumptions about how
> > things are done so it's probably best that he comments on this so his
> > tools don't blow up.
> 
> There are some assumptions about what record is last in order to speed up
> "aging" the event during search so that we know the event is complete and
> ready for processing. We can always change that if needed. But a new kernel
> won't be compatible with older tools.
> 
> The only long term fix for this would be to have something that says how
> many records are in this event, then add a field for each record saying
> which one it is. Then we can have a reliable way to decide when we have
> all records ready for processing. This only affects searching/reporting,
> not logging.

Or I can make a change to put EOF to disk. Currently, that is not done to 
conserve disk space.


> But I think the records are in chronological order as the syscall traverses
> the various observers in the kernel. And as Paul said, as long as they all
> have the same timestamp/serial number, userspace will collect them all up.
> 
> -Steve
> 
> 
> --
> Linux-audit mailing list
> Linux-audit@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-audit




--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

