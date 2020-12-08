Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B7C072D2BC9
	for <lists+linux-audit@lfdr.de>; Tue,  8 Dec 2020 14:20:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607433648;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lmZcTWAT5oQB8SSnX+XXgES0pEi6pXM+DAVmPe6sIPc=;
	b=CibAbNfhVxXgoUiGBEJBrviibOSJggpUnBkmVsLJOFnE6zjmRQWosR5z6NPkynggyboroh
	TYyZgNPtY5SywXhVJ6ytVoWOfakUAngIgkI+Fwc3VLoUtljLJx/0NOJstAn1Iyodhp3oJi
	CwPyDFKnSQmfSrq1yyc3I687ywZ5MQQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-rLOYFC3NOp-B4G09jp-8bw-1; Tue, 08 Dec 2020 08:20:46 -0500
X-MC-Unique: rLOYFC3NOp-B4G09jp-8bw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9506180A093;
	Tue,  8 Dec 2020 13:20:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45C515D719;
	Tue,  8 Dec 2020 13:20:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B35D6180954D;
	Tue,  8 Dec 2020 13:20:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B8DKDG9016806 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 8 Dec 2020 08:20:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9B27E5C1BB; Tue,  8 Dec 2020 13:20:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AEFE25C1A3;
	Tue,  8 Dec 2020 13:20:06 +0000 (UTC)
Date: Tue, 8 Dec 2020 08:20:03 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Steve Grubb <sgrubb@redhat.com>
Subject: Re: [PATCH v2] audit: report audit wait metric in audit status reply
Message-ID: <20201208132003.GW1762914@madcap2.tricolour.ca>
References: <20200701213244.GA1817@linux-kernel-dev> <2046910.irdbgypaU6@x2>
	<20201208013435.GU1762914@madcap2.tricolour.ca>
	<5414845.DvuYhMxLoT@x2>
MIME-Version: 1.0
In-Reply-To: <5414845.DvuYhMxLoT@x2>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020-12-07 22:34, Steve Grubb wrote:
> On Monday, December 7, 2020 8:34:35 PM EST Richard Guy Briggs wrote:
> > On 2020-12-07 18:28, Steve Grubb wrote:
> > > Hello Max,
> > > 
> > > On Monday, December 7, 2020 4:28:14 PM EST Max Englander wrote:
> > > > Steve, I'm happy to make changes to the userspace PR based on
> > > > Richard's suggestions, if that sounds good to you. I'll follow up in
> > > > the PR to discuss it more
> > > 
> > > The only issue is new userspace on old kernel. I think if we use both the
> > > configure macro in addition to a size check, then it will at least allow
> > > forward and backward compatibility.
> > 
> > Are you talking about a new userspace compiled on a new kernel header
> > file run on an old kernel?
> 
> Yes. This is my worry. Someone compiles the code and the does a roll back. It 
> can happen because the new kernel has some problems that a driver cannot 
> handle.

Ok, fair enough.

> > That would be less reliable and need the
> > size check.  The bitmap would be the most reliable in that scenario.
> 
> Right, but the person that can make that happen doesn't want to use this 
> facility for what it was intended for. So, we are all trying to do the best.

Yes, the firmness of that stance is puzzling to me...

> > By configure macro are you talking about the presence of that audit
> > status mask bit, or the presence of that struct audit_status member?
> 
> Yes. But it doesn't apply to old kernels.

An "or" question usually needs one or the other reply unless both are
true...  Which one were you talking about?

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
https://www.redhat.com/mailman/listinfo/linux-audit

