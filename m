Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7761D2DFF12
	for <lists+linux-audit@lfdr.de>; Mon, 21 Dec 2020 18:57:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608573471;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KRigJqEpOvTIJHhF5c3LWZ5rJ5mKYHkO/xWRUulcSbk=;
	b=OH9Z9qcnVwroAqr2y9WU7ridTdEukC4b4CGsAIHe8/d5ScwSXflgSj44VhFzAa6kJ1HZmb
	XjaFzLqB9vuQtOGAT53N54VWCs1O93/Kq+xANiPdePb+6xROsxOhyXtQ8NYB5K+rtBkXDN
	X7du3uNbWoSr3KDapzKKW1Thiiam4+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-JNR9o2H3NlqAj5r4e3zZAw-1; Mon, 21 Dec 2020 12:57:49 -0500
X-MC-Unique: JNR9o2H3NlqAj5r4e3zZAw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D3311005504;
	Mon, 21 Dec 2020 17:57:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 289855D6D1;
	Mon, 21 Dec 2020 17:57:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BF3BD180954D;
	Mon, 21 Dec 2020 17:57:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BLHvTUk025249 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 21 Dec 2020 12:57:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E731D6064B; Mon, 21 Dec 2020 17:57:29 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.9])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B53BD1E5;
	Mon, 21 Dec 2020 17:57:15 +0000 (UTC)
Date: Mon, 21 Dec 2020 12:57:12 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak90 v10 01/11] audit: collect audit task parameters
Message-ID: <20201221175712.GI1762914@madcap2.tricolour.ca>
References: <cover.1608225886.git.rgb@redhat.com>
	<982b9adffbd32264a853fe7f4f06f0d0a882c11d.1608225886.git.rgb@redhat.com>
	<CAHC9VhSTuBJ3LXxMY=nD7qBzmKLDjXY0V3hsuN34_siq_xRrig@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhSTuBJ3LXxMY=nD7qBzmKLDjXY0V3hsuN34_siq_xRrig@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020-12-21 12:14, Paul Moore wrote:
> On Mon, Dec 21, 2020 at 11:57 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> >
> > The audit-related parameters in struct task_struct should ideally be
> > collected together and accessed through a standard audit API and the audit
> > structures made opaque to other kernel subsystems.
> >
> > Collect the existing loginuid, sessionid and audit_context together in a
> > new opaque struct audit_task_info called "audit" in struct task_struct.
> >
> > Use kmem_cache to manage this pool of memory.
> > Un-inline audit_free() to be able to always recover that memory.
> >
> > Please see the upstream github issues
> > https://github.com/linux-audit/audit-kernel/issues/81
> > https://github.com/linux-audit/audit-kernel/issues/90
> >
> > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > Acked-by: Neil Horman <nhorman@tuxdriver.com>
> > Reviewed-by: Ondrej Mosnacek <omosnace@redhat.com>
> 
> Did Neil and Ondrej really ACK/Review the changes that you made here
> in v10 or are you just carrying over the ACK/Review?  I'm hopeful it
> is the former, because I'm going to be a little upset if it is the
> latter.

It is the latter, sorry.  So, this needs to be reposted without their
ACK/Review lines.

> > ---
> >  fs/io-wq.c            |   8 +--
> >  fs/io_uring.c         |  16 ++---
> >  include/linux/audit.h |  49 +++++---------
> >  include/linux/sched.h |   7 +-
> >  init/init_task.c      |   3 +-
> >  init/main.c           |   2 +
> >  kernel/audit.c        | 154 +++++++++++++++++++++++++++++++++++++++++-
> >  kernel/audit.h        |   7 ++
> >  kernel/auditsc.c      |  24 ++++---
> >  kernel/fork.c         |   1 -
> >  10 files changed, 205 insertions(+), 66 deletions(-)
> 
> -- 
> paul moore
> www.paul-moore.com
> 

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

