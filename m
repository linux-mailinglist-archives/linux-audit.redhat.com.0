Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 519F72DFED1
	for <lists+linux-audit@lfdr.de>; Mon, 21 Dec 2020 18:15:13 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-5LFcpsb-MveChXG2CxsVaw-1; Mon, 21 Dec 2020 12:15:07 -0500
X-MC-Unique: 5LFcpsb-MveChXG2CxsVaw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A51BE835B4A;
	Mon, 21 Dec 2020 17:15:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E45919725;
	Mon, 21 Dec 2020 17:15:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 314654BB7B;
	Mon, 21 Dec 2020 17:15:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BLHEv7c019516 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 21 Dec 2020 12:14:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7B4CD2166B28; Mon, 21 Dec 2020 17:14:57 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 769682166B27
	for <linux-audit@redhat.com>; Mon, 21 Dec 2020 17:14:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 170DF811E76
	for <linux-audit@redhat.com>; Mon, 21 Dec 2020 17:14:55 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
	[209.85.218.45]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-180-V7m3DbbdM9mRQCwOpxeLXA-1; Mon, 21 Dec 2020 12:14:51 -0500
X-MC-Unique: V7m3DbbdM9mRQCwOpxeLXA-1
Received: by mail-ej1-f45.google.com with SMTP id lt17so14477389ejb.3
	for <linux-audit@redhat.com>; Mon, 21 Dec 2020 09:14:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RDT3CMWkb5v4KlAY6bNjmDFLqwN6ZEiRSV+Z6DSzr0s=;
	b=uaFFCxxPJB2+VNFut6pUVJIZJaDD9mPSWHnFkiMZ8P1BNJKA8bWpjxYQZDXQGI2idZ
	vgwexfA6UcIh2nhxohIjfaR5jETpshNu8aMqrlKrd9ai9WljgYsGGhafIefrdz4Su9UH
	Axq/wuKjSt4PPb3cNH97If+9ykBJbT0QmSJFdnpdAyX+jM7Kxdt7aa55lzQe4+c3xo89
	Tn0vNWJCwFMohBVFP5TA/2cLwKpFlbqEXQpOwursok7QcIzM3HQZ6FyNMQdK95G2pnfX
	XP/YWpSJAoVjGcY/z5U+lY+q4bswbsVhWSdK8J7+foambfzYGE79uJUHnoDKWNwW2IF3
	YHTg==
X-Gm-Message-State: AOAM5320mWuVEJVgw7wS6HVaTCEYUy4wuo46wEjaiFUj4I17XN89KycQ
	MyhlhNWUYxDHs4BPQKGNJgm1AUZ0JfO86s7DD7Jd
X-Google-Smtp-Source: ABdhPJwPBtlia5uDw63ingozAyc7AR0jROeP8m6nydP3bWYSBIMRH20XUWt+8TeXFSZsv23dBiOY4HZ+Ga0eJQoO4Vg=
X-Received: by 2002:a17:907:d9e:: with SMTP id
	go30mr15735065ejc.488.1608570889830; 
	Mon, 21 Dec 2020 09:14:49 -0800 (PST)
MIME-Version: 1.0
References: <cover.1608225886.git.rgb@redhat.com>
	<982b9adffbd32264a853fe7f4f06f0d0a882c11d.1608225886.git.rgb@redhat.com>
In-Reply-To: <982b9adffbd32264a853fe7f4f06f0d0a882c11d.1608225886.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 21 Dec 2020 12:14:38 -0500
Message-ID: <CAHC9VhSTuBJ3LXxMY=nD7qBzmKLDjXY0V3hsuN34_siq_xRrig@mail.gmail.com>
Subject: Re: [PATCH ghak90 v10 01/11] audit: collect audit task parameters
To: Richard Guy Briggs <rgb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Neil Horman <nhorman@tuxdriver.com>,
	Linux API <linux-api@vger.kernel.org>,
	Linux Containers List <containers@lists.linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	Netfilter Devel List <netfilter-devel@vger.kernel.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>, Simo Sorce <simo@redhat.com>,
	Linux NetDev Upstream Mailing List <netdev@vger.kernel.org>,
	Linux FSdevel <linux-fsdevel@vger.kernel.org>,
	Eric Paris <eparis@parisplace.org>,
	Christian Brauner <christian.brauner@ubuntu.com>,
	mpatel@redhat.com, Serge Hallyn <serge@hallyn.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 21, 2020 at 11:57 AM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> The audit-related parameters in struct task_struct should ideally be
> collected together and accessed through a standard audit API and the audit
> structures made opaque to other kernel subsystems.
>
> Collect the existing loginuid, sessionid and audit_context together in a
> new opaque struct audit_task_info called "audit" in struct task_struct.
>
> Use kmem_cache to manage this pool of memory.
> Un-inline audit_free() to be able to always recover that memory.
>
> Please see the upstream github issues
> https://github.com/linux-audit/audit-kernel/issues/81
> https://github.com/linux-audit/audit-kernel/issues/90
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> Acked-by: Neil Horman <nhorman@tuxdriver.com>
> Reviewed-by: Ondrej Mosnacek <omosnace@redhat.com>

Did Neil and Ondrej really ACK/Review the changes that you made here
in v10 or are you just carrying over the ACK/Review?  I'm hopeful it
is the former, because I'm going to be a little upset if it is the
latter.

> ---
>  fs/io-wq.c            |   8 +--
>  fs/io_uring.c         |  16 ++---
>  include/linux/audit.h |  49 +++++---------
>  include/linux/sched.h |   7 +-
>  init/init_task.c      |   3 +-
>  init/main.c           |   2 +
>  kernel/audit.c        | 154 +++++++++++++++++++++++++++++++++++++++++-
>  kernel/audit.h        |   7 ++
>  kernel/auditsc.c      |  24 ++++---
>  kernel/fork.c         |   1 -
>  10 files changed, 205 insertions(+), 66 deletions(-)

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

