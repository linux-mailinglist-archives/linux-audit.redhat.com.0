Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 896B030CE29
	for <lists+linux-audit@lfdr.de>; Tue,  2 Feb 2021 22:45:36 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-roFY9IoZOL-CwmTB_fvu7A-1; Tue, 02 Feb 2021 16:45:32 -0500
X-MC-Unique: roFY9IoZOL-CwmTB_fvu7A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E29351F0;
	Tue,  2 Feb 2021 21:45:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E9F5F5D722;
	Tue,  2 Feb 2021 21:45:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 70C5A18095CB;
	Tue,  2 Feb 2021 21:45:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 112Lj4X3017549 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 2 Feb 2021 16:45:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 69475101F0A8; Tue,  2 Feb 2021 21:45:04 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 64A171020445
	for <linux-audit@redhat.com>; Tue,  2 Feb 2021 21:45:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE197185A794
	for <linux-audit@redhat.com>; Tue,  2 Feb 2021 21:45:01 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
	[209.85.208.53]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-163-32US3g1yP6WV4wpVTqYttA-1; Tue, 02 Feb 2021 16:44:59 -0500
X-MC-Unique: 32US3g1yP6WV4wpVTqYttA-1
Received: by mail-ed1-f53.google.com with SMTP id s11so24646059edd.5
	for <linux-audit@redhat.com>; Tue, 02 Feb 2021 13:44:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jqE3NBkcYof351zw0GZ4Pohphx1oYlmm/8WK6ccPjhk=;
	b=rKaURPzfffhIOvn3v8cMw+rNcEtyk58giN9GETeonHunG80sUbuUwRN/LS4/IVpbgH
	1W6OiycgZQihVO7/4Xwx6cEQ5hz5avJMvqrJJ8wjPAX1ko9160zoiU1SBo8fjpS5AvmX
	FdV4hVKTIZZPfoTg/nCgaqB2lXOzs21oUQDXqzmkccoqlLbeLlFBbR5ULw9uX9xbBmYx
	VAZno3Cq7xaWLw1B//P7dgUGVqanw4EvN51nDfwEy/MLEtiKYNj6M/xcEzspgruTlO1x
	5hXDpLwMhYxb9Vy2UjYyMc20L03MjwP/4L5PfKpKZoMNDrVTZ+OhQZ1XOmI5L5hg7yCB
	uoKQ==
X-Gm-Message-State: AOAM530Ps96xFLIMfv0mF0Dr0mGbjI0HhV0kKJlNdD9v4FpfIU8L3XYn
	5iWc/BXh45mlPR3/iDXyrBTR4O+jGrHeSxvwvQDg
X-Google-Smtp-Source: ABdhPJxOBFi9brI4qqJZ7PRXNM/LhhjWpc226wQCu4D34YiD5U69GMmAkx+jxIY8Wqs4OTiU0jr3QJ8wbA28O58BJDw=
X-Received: by 2002:aa7:c78e:: with SMTP id n14mr103716eds.31.1612302298389;
	Tue, 02 Feb 2021 13:44:58 -0800 (PST)
MIME-Version: 1.0
References: <20210202212930.18845-2-danielwa@cisco.com>
In-Reply-To: <20210202212930.18845-2-danielwa@cisco.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 2 Feb 2021 16:44:47 -0500
Message-ID: <CAHC9VhTo_aTTsS5W-+AJe+RrNG4yL3_TbfOKZhZfpjg0QkkZUQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] audit: show (grand)parents information of an audit
	context
To: Daniel Walker <danielwa@cisco.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
Cc: Phil Zhang <xuanyzha@cisco.com>, linux-audit@redhat.com,
	linux-kernel@vger.kernel.org, xe-linux-external@cisco.com
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

On Tue, Feb 2, 2021 at 4:29 PM Daniel Walker <danielwa@cisco.com> wrote:
> From: Phil Zhang <xuanyzha@cisco.com>
>
> To ease the root cause analysis of SELinux AVCs, this new feature
> traverses task structs to iteratively find all parent processes
> starting with the denied process and ending at the kernel. Meanwhile,
> it prints out the command lines and subject contexts of those parents.
>
> This provides developers a clear view of how processes were spawned
> and where transitions happened, without the need to reproduce the
> issue and manually audit interesting events.
>
> Example on bash over ssh:
>     $ runcon -u system_u -r system_r -t polaris_hm_t ls
>     ...
>     type=PARENT msg=audit(1610548241.033:255): subj=root:unconfined_r:unconfined_t:s0-s0:c0.c1023  cmdline="-bash"
>     type=PARENT msg=audit(1610548241.033:255): subj=system_u:system_r:sshd_t:s0-s0:c0.c1023        cmdline="sshd: root@pts/0"
>     type=PARENT msg=audit(1610548241.033:255): subj=system_u:system_r:sshd_t:s0-s0:c0.c1023        cmdline="/tmp/sw/rp/0/0/rp_security/mount/usr/sbin/sshd
>     type=PARENT msg=audit(1610548241.033:255): subj=system_u:system_r:init_t:s0                    cmdline="/init"
>     type=PARENT msg=audit(1610548241.033:255): subj=system_u:system_r:kernel_t:s0
>     ...
>
> Cc: xe-linux-external@cisco.com
> Signed-off-by: Phil Zhang <xuanyzha@cisco.com>
> Signed-off-by: Daniel Walker <danielwa@cisco.com>
> ---
>  include/uapi/linux/audit.h |  5 ++-
>  init/Kconfig               |  7 +++++
>  kernel/audit.c             |  3 +-
>  kernel/auditsc.c           | 64 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 77 insertions(+), 2 deletions(-)

This is just for development/testing of SELinux policy, right?  It
seems like this is better done in userspace to me through a
combination of policy analysis and just understanding of how your
system is put together.

If you really need this information in the audit log for some
production use, it seems like you could audit the various
fork()/exec() syscalls to get an understanding of the various process
(sub)trees on the system.  It would require a bit of work to sift
through the audit log and reconstruct the events that led to a process
being started, and generating the AVC you are interested in debugging,
but folks who live The Audit Life supposedly do this sort of thing a
lot (this sort of thing being tracing a process/session).

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

