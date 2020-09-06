Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2E4C325EC32
	for <lists+linux-audit@lfdr.de>; Sun,  6 Sep 2020 04:46:34 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-mLcb9-mrNICWlfOeZLv5gQ-1; Sat, 05 Sep 2020 22:46:31 -0400
X-MC-Unique: mLcb9-mrNICWlfOeZLv5gQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58FE21DDE1;
	Sun,  6 Sep 2020 02:46:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60B487E182;
	Sun,  6 Sep 2020 02:46:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CEBEC79DA9;
	Sun,  6 Sep 2020 02:46:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0862kFC1021427 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 5 Sep 2020 22:46:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6767F5AB78; Sun,  6 Sep 2020 02:46:15 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6222349C35
	for <linux-audit@redhat.com>; Sun,  6 Sep 2020 02:46:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C20B1856DEE
	for <linux-audit@redhat.com>; Sun,  6 Sep 2020 02:46:12 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-73-VZ2jpehNOYKqdKrFFsKByQ-1; Sat, 05 Sep 2020 22:46:10 -0400
X-MC-Unique: VZ2jpehNOYKqdKrFFsKByQ-1
Received: by mail-ed1-f66.google.com with SMTP id n13so9447225edo.10
	for <linux-audit@redhat.com>; Sat, 05 Sep 2020 19:46:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fZqDWW5vNAoJJAbX0kuyb7Ud5+qbw+9T/B7X+7yryh8=;
	b=q4SRRq/QO3uQqewRIUXF3HCw55QpwbGt6x8pP/Cw1kJyFp0B/2PFd13OHIls1Pmm7Q
	KZwPpJR5YB9cC4QWGg6wCfRvJGk3XRbfQESXdD2d6jpl3+9nDhuI5g5ZJgNaVQouHbfr
	VbUXkD7Ms2gqJiHlJGSfbW0MQM5uWgq2tczj+C/rpWufQvMuvkglCeM6HGOvrGcTS2A6
	PbTe1Jx3veCLtyqSMLRotUu398Zc3agYYoCF0FqEyafFvob6O4OjPqhRK6WJ5+PPZVRK
	/3FNaFX+JvLN3YvsddmoK9urVvNzZn1XV/gnHMkcMka18qD1inB3i03Cclv8Och2gjaG
	AqTg==
X-Gm-Message-State: AOAM531QtQt2fPb6sHxIE0aPu+m0G+NShbz8FaUAbnHaWY60AmYxj4ph
	owc0CVWaaDmfMK85RZ5z+OJzh4xvqy6WhUBjLxDi
X-Google-Smtp-Source: ABdhPJwEnqc7V1NRJVUfKvCRxDcLWxHKwC04LW/AslJ8t3tHT+VIhkM1GtvHSi9RzbnnsIGUXVyYSmBJ5klezGQfiL8=
X-Received: by 2002:aa7:ce97:: with SMTP id y23mr16089395edv.128.1599360369151;
	Sat, 05 Sep 2020 19:46:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200826145247.10029-1-casey@schaufler-ca.com>
	<20200826145247.10029-15-casey@schaufler-ca.com>
In-Reply-To: <20200826145247.10029-15-casey@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sat, 5 Sep 2020 22:45:57 -0400
Message-ID: <CAHC9VhQmEgNgsXmk8MeMsfkvZ82GuHBguoBvG5WR9mcoztBDOA@mail.gmail.com>
Subject: Re: [PATCH v20 14/23] LSM: Ensure the correct LSM context releaser
To: Casey Schaufler <casey@schaufler-ca.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
Cc: john.johansen@canonical.com, selinux@vger.kernel.org,
	netdev@vger.kernel.org, James Morris <jmorris@namei.org>,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	casey.schaufler@intel.com, linux-integrity@vger.kernel.org,
	Stephen Smalley <sds@tycho.nsa.gov>
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 26, 2020 at 11:16 AM Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> Add a new lsmcontext data structure to hold all the information
> about a "security context", including the string, its size and
> which LSM allocated the string. The allocation information is
> necessary because LSMs have different policies regarding the
> lifecycle of these strings. SELinux allocates and destroys
> them on each use, whereas Smack provides a pointer to an entry
> in a list that never goes away.
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: John Johansen <john.johansen@canonical.com>
> Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> Cc: linux-integrity@vger.kernel.org
> Cc: netdev@vger.kernel.org
> ---
>  drivers/android/binder.c                | 10 ++++---
>  fs/ceph/xattr.c                         |  6 ++++-
>  fs/nfs/nfs4proc.c                       |  8 ++++--
>  fs/nfsd/nfs4xdr.c                       |  7 +++--
>  include/linux/security.h                | 35 +++++++++++++++++++++++--
>  include/net/scm.h                       |  5 +++-
>  kernel/audit.c                          | 14 +++++++---
>  kernel/auditsc.c                        | 12 ++++++---
>  net/ipv4/ip_sockglue.c                  |  4 ++-
>  net/netfilter/nf_conntrack_netlink.c    |  4 ++-
>  net/netfilter/nf_conntrack_standalone.c |  4 ++-
>  net/netfilter/nfnetlink_queue.c         | 13 ++++++---
>  net/netlabel/netlabel_unlabeled.c       | 19 +++++++++++---
>  net/netlabel/netlabel_user.c            |  4 ++-
>  security/security.c                     | 11 ++++----
>  15 files changed, 121 insertions(+), 35 deletions(-)

One small comment below, but otherwise ...

Acked-by: Paul Moore <paul@paul-moore.com>

> +/**
> + * lsmcontext_init - initialize an lsmcontext structure.
> + * @cp: Pointer to the context to initialize
> + * @context: Initial context, or NULL
> + * @size: Size of context, or 0
> + * @slot: Which LSM provided the context
> + *
> + * Fill in the lsmcontext from the provided information.
> + * This is a scaffolding function that will be removed when
> + * lsmcontext integration is complete.
> + */
> +static inline void lsmcontext_init(struct lsmcontext *cp, char *context,
> +                                  u32 size, int slot)
> +{
> +       cp->slot = slot;
> +       cp->context = context;
> +       cp->len = size;
> +}

Here is another case where some of the intermediate code, and perhaps
some of the final code, can probably be simplified if
lsmcontext_init() returns the lsmcontext pointer.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

