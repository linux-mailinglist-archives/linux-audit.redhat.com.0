Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E9DA32D2181
	for <lists+linux-audit@lfdr.de>; Tue,  8 Dec 2020 04:35:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607398502;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KvMjbmNCtJscPddeZgm+ILqranL2glF8CtB9/Y/5NYc=;
	b=TnuzVzCL53HenHXcCNwx4oGyl2r6YYLDAr24AcpTjzeVeqX4TvovVLtriVGQx4isvP/IEL
	QLccafqcMl7U1vb9gKi57FiJNZ67KdlYKCIPRp6bv3D7jHS89CRxoceXWY+XwxhyqqsuNc
	fvBJpaJlNo/9z6bJDGzTpWWvXUVTTWE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-8_mjiirgOUuqnPdRlpRz0Q-1; Mon, 07 Dec 2020 22:35:01 -0500
X-MC-Unique: 8_mjiirgOUuqnPdRlpRz0Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC8CC51E2;
	Tue,  8 Dec 2020 03:34:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 41A5C5D6AB;
	Tue,  8 Dec 2020 03:34:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BE89A4BB7B;
	Tue,  8 Dec 2020 03:34:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B83YR0K023792 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 7 Dec 2020 22:34:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 176C05D9E2; Tue,  8 Dec 2020 03:34:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-112-212.rdu2.redhat.com [10.10.112.212])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A80D85D9DE;
	Tue,  8 Dec 2020 03:34:20 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: [PATCH v2] audit: report audit wait metric in audit status reply
Date: Mon, 07 Dec 2020 22:34:17 -0500
Message-ID: <5414845.DvuYhMxLoT@x2>
Organization: Red Hat
In-Reply-To: <20201208013435.GU1762914@madcap2.tricolour.ca>
References: <20200701213244.GA1817@linux-kernel-dev> <2046910.irdbgypaU6@x2>
	<20201208013435.GU1762914@madcap2.tricolour.ca>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Monday, December 7, 2020 8:34:35 PM EST Richard Guy Briggs wrote:
> On 2020-12-07 18:28, Steve Grubb wrote:
> > Hello Max,
> > 
> > On Monday, December 7, 2020 4:28:14 PM EST Max Englander wrote:
> > > Steve, I'm happy to make changes to the userspace PR based on
> > > Richard's suggestions, if that sounds good to you. I'll follow up in
> > > the PR to discuss it more
> > 
> > The only issue is new userspace on old kernel. I think if we use both the
> > configure macro in addition to a size check, then it will at least allow
> > forward and backward compatibility.
> 
> Are you talking about a new userspace compiled on a new kernel header
> file run on an old kernel?

Yes. This is my worry. Someone compiles the code and the does a roll back. It 
can happen because the new kernel has some problems that a driver cannot 
handle.

> That would be less reliable and need the
> size check.  The bitmap would be the most reliable in that scenario.

Right, but the person that can make that happen doesn't want to use this 
facility for what it was intended for. So, we are all trying to do the best.


> By configure macro are you talking about the presence of that audit
> status mask bit, or the presence of that struct audit_status member?

Yes. But it doesn't apply to old kernels.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

