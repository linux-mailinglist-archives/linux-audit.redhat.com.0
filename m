Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5B46913C2
	for <lists+linux-audit@lfdr.de>; Thu,  9 Feb 2023 23:54:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675983278;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7fK4DaUGhWmegL9aF78jI0pHXNAYWJiJLSPz/rsDcaQ=;
	b=ZXSWWOM+4S3O0mLf2wrZbMhcDjA81ZRIMhWPqAWy385LyjpHDtHG8XhbEGaDmwvja2o3AK
	EMR3mb/PTFC5jXUbKGTMBwdO7o5A79mcy16zG9BYWWXSgHly3lSXA45pVe5UaOSpkdEcAX
	rYYeLo3QfSkIHdBTMb6QaUnlo3a1jRY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-qJOWK_2NNgOihMbi_2ikJQ-1; Thu, 09 Feb 2023 17:54:34 -0500
X-MC-Unique: qJOWK_2NNgOihMbi_2ikJQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 739881C05AF3;
	Thu,  9 Feb 2023 22:54:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 920E9492B00;
	Thu,  9 Feb 2023 22:54:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B70EB19465A0;
	Thu,  9 Feb 2023 22:54:27 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 336CF1946589 for <linux-audit@listman.corp.redhat.com>;
 Thu,  9 Feb 2023 22:54:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E0A9D40B42D4; Thu,  9 Feb 2023 22:54:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.33.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 663DB401014C;
 Thu,  9 Feb 2023 22:54:25 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Richard Guy Briggs <rgb@redhat.com>, Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v2] io_uring,audit: don't log IORING_OP_MADVISE
Date: Thu, 09 Feb 2023 17:54:24 -0500
Message-ID: <13293926.uLZWGnKmhe@x2>
Organization: Red Hat
In-Reply-To: <CAHC9VhTNb4gOpk9=49-ABtYs1DFKqqwXPSc-2bhJX7wcZ82o=g@mail.gmail.com>
References: <b5dfdcd541115c86dbc774aa9dd502c964849c5f.1675282642.git.rgb@redhat.com>
 <Y+VrSLZKZoAGikUS@madcap2.tricolour.ca>
 <CAHC9VhTNb4gOpk9=49-ABtYs1DFKqqwXPSc-2bhJX7wcZ82o=g@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
Cc: Christian Brauner <brauner@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux-Audit Mailing List <linux-audit@redhat.com>, Stefan Roesch <shr@fb.com>,
 Eric Paris <eparis@parisplace.org>, io-uring@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thursday, February 9, 2023 5:37:22 PM EST Paul Moore wrote:
> On Thu, Feb 9, 2023 at 4:53 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > On 2023-02-01 16:18, Paul Moore wrote:
> > > On Wed, Feb 1, 2023 at 3:34 PM Richard Guy Briggs <rgb@redhat.com> 
wrote:
> > > > fadvise and madvise both provide hints for caching or access pattern
> > > > for file and memory respectively.  Skip them.
> > > 
> > > You forgot to update the first sentence in the commit description :/
> > 
> > I didn't forget.  I updated that sentence to reflect the fact that the
> > two should be treated similarly rather than differently.
> 
> Ooookay.  Can we at least agree that the commit description should be
> rephrased to make it clear that the patch only adjusts madvise?  Right
> now I read the commit description and it sounds like you are adjusting
> the behavior for both fadvise and madvise in this patch, which is not
> true.
> 
> > > I'm still looking for some type of statement that you've done some
> > > homework on the IORING_OP_MADVISE case to ensure that it doesn't end
> > > up calling into the LSM, see my previous emails on this.  I need more
> > > than "Steve told me to do this".
> > > 
> > > I basically just want to see that some care and thought has gone into
> > > this patch to verify it is correct and good.
> > 
> > Steve suggested I look into a number of iouring ops.  I looked at the
> > description code and agreed that it wasn't necessary to audit madvise.
> > The rationale for fadvise was detemined to have been conflated with
> > fallocate and subsequently dropped.  Steve also suggested a number of
> > others and after investigation I decided that their current state was
> > correct.  *getxattr you've advised against, so it was dropped.  It
> > appears fewer modifications were necessary than originally suspected.
> 
> My concern is that three of the four changes you initially proposed
> were rejected, which gives me pause about the fourth.  You mention
> that based on your reading of madvise's description you feel auditing
> isn't necessary - and you may be right - but based on our experience
> so far with this patchset I would like to hear that you have properly
> investigated all of the madvise code paths, and I would like that in
> the commit description.

I think you're being unnecessarily hard on this. Yes, the commit message 
might be touched up. But madvise is advisory in nature. It is not security 
relevant. And a grep through the security directory doesn't turn up any 
hooks.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

