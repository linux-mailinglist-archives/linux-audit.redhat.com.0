Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 0F64823177E
	for <lists+linux-audit@lfdr.de>; Wed, 29 Jul 2020 04:01:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595988102;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=87XC7hgF1jdu/drfn9gqr7YMOds89T8hM2FGQmv0Uhw=;
	b=c3XWyGcTcDNoiB6anYt+jVTAQHcq5FES0gZqRonVEXnm71/cGDh/ZC/7MwMHKC9h270xvr
	ccsBKRPrnErIet9jXdl+jdINv3tdHxGs3k524d/AZu1SqhArWDeH/kGXck8u96VG2GyOSl
	qx339NjeeaqenT9qZORZMnGcwWm870M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-L2m4LvIOMsu6AAe06zwl_g-1; Tue, 28 Jul 2020 22:01:39 -0400
X-MC-Unique: L2m4LvIOMsu6AAe06zwl_g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49D79100CCC1;
	Wed, 29 Jul 2020 02:01:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C5611002388;
	Wed, 29 Jul 2020 02:01:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8CA4DA35A8;
	Wed, 29 Jul 2020 02:01:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06T21GT1022944 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 28 Jul 2020 22:01:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7B97E8A164; Wed, 29 Jul 2020 02:01:16 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.3])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 986A38A169;
	Wed, 29 Jul 2020 02:01:09 +0000 (UTC)
Date: Tue, 28 Jul 2020 22:01:06 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH V3fix ghak120] audit: initialize context values in case
	of mandatory events
Message-ID: <20200729020106.x5tfijvnxdmujtbj@madcap2.tricolour.ca>
References: <e3e9c9da9115fd233c5a7895dbb4a698a365b1b0.1595884394.git.rgb@redhat.com>
	<CAHC9VhSx23JiN6GprskxdEcs9uftJOp03Svh7YJbQLOV91AMiQ@mail.gmail.com>
	<20200728162722.djvy3qyclj57wsfn@madcap2.tricolour.ca>
	<CAHC9VhSDoi8QS3c6Wmx6agmmphja60cS3+aTKVx76xvdkxJ0DQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhSDoi8QS3c6Wmx6agmmphja60cS3+aTKVx76xvdkxJ0DQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
Cc: Eric Paris <eparis@parisplace.org>,
	Linux Security Module list <linux-security-module@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-07-28 14:47, Paul Moore wrote:
> On Tue, Jul 28, 2020 at 12:27 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > I know you like only really minimal fixes this late, but this seemed
> > pretty minimal to me...
> 
> Minimal is a one (two?) line NULL check in audit_log_name(), this
> patch is not that.

I didn't try and test that since I'm not sure that would have worked
because there appeared to be a low non-NULL value in it.  brauer1's trace had
0x60 and mine had 0xd0.  Or am I missing something obvious?

The patch provided the information rather than ignoring the problem
(which maybe should have been caught by WARN_ONCE?).

> paul moore

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

