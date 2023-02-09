Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE6F691373
	for <lists+linux-audit@lfdr.de>; Thu,  9 Feb 2023 23:37:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675982268;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PtiBlwr1DHJCYAavufS1SW5OyRzW6DVqD5bJpPZOTkA=;
	b=KXmTv6F6v/EMgqXJXPTDfNJV9URJHJ3bykmBlJ57AtYyPIVAP84WXCaO4C5FOE8qO/1YZq
	155gkBXwTWyeV/zz6dGkjU3Ep3Ssu9VvwGiNDhvD+PYwNmO9tHDymUyOCvCzaJI9Rap4d9
	dM0RfGc9rv1c5P6u9b/NmSnDkOYCKZs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-Z-k5rpBFM225VViPgVL7KQ-1; Thu, 09 Feb 2023 17:37:44 -0500
X-MC-Unique: Z-k5rpBFM225VViPgVL7KQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E62DC800B23;
	Thu,  9 Feb 2023 22:37:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AD90D40C83B6;
	Thu,  9 Feb 2023 22:37:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E95E719465A0;
	Thu,  9 Feb 2023 22:37:37 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2C62B1946589 for <linux-audit@listman.corp.redhat.com>;
 Thu,  9 Feb 2023 22:37:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1E406492B01; Thu,  9 Feb 2023 22:37:37 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 15E50492B00
 for <linux-audit@redhat.com>; Thu,  9 Feb 2023 22:37:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E95883C0254C
 for <linux-audit@redhat.com>; Thu,  9 Feb 2023 22:37:36 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-641-qcS6UYhdNjqsDnfT1kdsdg-1; Thu, 09 Feb 2023 17:37:35 -0500
X-MC-Unique: qcS6UYhdNjqsDnfT1kdsdg-1
Received: by mail-pl1-f174.google.com with SMTP id be8so4571573plb.7
 for <linux-audit@redhat.com>; Thu, 09 Feb 2023 14:37:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hwtypz4GumTJ+cjPZt4+9SVVyQ90xH/ty3YTeW6kigU=;
 b=E8WEq/RH0gGtO1JmSjid+wOiScSjQ75l8VK3xSwOXK8QIGPgxo4//Z9aCR6FH7RLpI
 zxp2SBOvB1Dbk9YdT8UXZ+7D1nX7GJgNf3EhbFSxfPg34YimIymYdgOCRxinxdvWk0UM
 myvypKbdDiT+tfw/P0EvD2zgfFO3y3JKCaPIM9toJIWouDrWe99f3Vh5p0MqSOqRfuOu
 IqS/X8AveYmWBs/kj8fgnLticJvoCIi1jqZ0sVIPX0YJEGT6KzO4KCHk5ncTBpEb8aYq
 e5QnVsuYfMINQYqHa5ZemyqRm9DMqjqidQzrkCB7oKSrf6IYOZcWR+HA6PxZEL0hzEgt
 XSWw==
X-Gm-Message-State: AO0yUKVH6+1xOopMODF6B6/R9tsjotzgqYQRDkFuDGpzFGfrHyVvLWjg
 W9bzv8jbG5wIIdFHrfLAX+sp2xoIuyzTXPJ5Tv0a
X-Google-Smtp-Source: AK7set9TglaxYfjekFil+jFiNjwYsr8jWmSQ++F779gm/+8NIlCPQYs53uzH3AzBWNKyl8pzsR+e5WB/o7jnRyXS4gs=
X-Received: by 2002:a17:90a:4f85:b0:22c:41c7:c7ed with SMTP id
 q5-20020a17090a4f8500b0022c41c7c7edmr2117292pjh.61.1675982253954; Thu, 09 Feb
 2023 14:37:33 -0800 (PST)
MIME-Version: 1.0
References: <b5dfdcd541115c86dbc774aa9dd502c964849c5f.1675282642.git.rgb@redhat.com>
 <CAHC9VhS0rPfkwUT1WMfqsTF-qYXdbbhHAfVPs=d3ZQVgbXBHnw@mail.gmail.com>
 <Y+VrSLZKZoAGikUS@madcap2.tricolour.ca>
In-Reply-To: <Y+VrSLZKZoAGikUS@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 9 Feb 2023 17:37:22 -0500
Message-ID: <CAHC9VhTNb4gOpk9=49-ABtYs1DFKqqwXPSc-2bhJX7wcZ82o=g@mail.gmail.com>
Subject: Re: [PATCH v2] io_uring,audit: don't log IORING_OP_MADVISE
To: Richard Guy Briggs <rgb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 9, 2023 at 4:53 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2023-02-01 16:18, Paul Moore wrote:
> > On Wed, Feb 1, 2023 at 3:34 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > fadvise and madvise both provide hints for caching or access pattern for
> > > file and memory respectively.  Skip them.
> >
> > You forgot to update the first sentence in the commit description :/
>
> I didn't forget.  I updated that sentence to reflect the fact that the
> two should be treated similarly rather than differently.

Ooookay.  Can we at least agree that the commit description should be
rephrased to make it clear that the patch only adjusts madvise?  Right
now I read the commit description and it sounds like you are adjusting
the behavior for both fadvise and madvise in this patch, which is not
true.

> > I'm still looking for some type of statement that you've done some
> > homework on the IORING_OP_MADVISE case to ensure that it doesn't end
> > up calling into the LSM, see my previous emails on this.  I need more
> > than "Steve told me to do this".
> >
> > I basically just want to see that some care and thought has gone into
> > this patch to verify it is correct and good.
>
> Steve suggested I look into a number of iouring ops.  I looked at the
> description code and agreed that it wasn't necessary to audit madvise.
> The rationale for fadvise was detemined to have been conflated with
> fallocate and subsequently dropped.  Steve also suggested a number of
> others and after investigation I decided that their current state was
> correct.  *getxattr you've advised against, so it was dropped.  It
> appears fewer modifications were necessary than originally suspected.

My concern is that three of the four changes you initially proposed
were rejected, which gives me pause about the fourth.  You mention
that based on your reading of madvise's description you feel auditing
isn't necessary - and you may be right - but based on our experience
so far with this patchset I would like to hear that you have properly
investigated all of the madvise code paths, and I would like that in
the commit description.

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

