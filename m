Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 04FC417CAB7
	for <lists+linux-audit@lfdr.de>; Sat,  7 Mar 2020 03:19:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583547565;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UBUgDGQNdVuNljE3pzRoxSurQDyhd+fSBUX5My66KeE=;
	b=djkZjdqw/VKrHqcPAnd74UFAysYxCxcjmgkpXUE3PBVoAQKwWDDvqWJUiGt3IZEwmT+iIC
	WgipSjrWYdwLlTihr7rqEhwr0Dx5JYCQAEpfHKapuWQtFYkMoO7YYEqyzsiygmtOqFpoIQ
	aUhzzRN8yUP8fe2n8Jby7Zl3oXpcLTY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-lIWl5e65NQWCCURoez_0Yw-1; Fri, 06 Mar 2020 21:19:23 -0500
X-MC-Unique: lIWl5e65NQWCCURoez_0Yw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C55F13F5;
	Sat,  7 Mar 2020 02:19:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA5652719C;
	Sat,  7 Mar 2020 02:19:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8E30484488;
	Sat,  7 Mar 2020 02:19:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0272IxuB016574 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 6 Mar 2020 21:18:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 81DA0103543E; Sat,  7 Mar 2020 02:18:59 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D3EE103543F
	for <linux-audit@redhat.com>; Sat,  7 Mar 2020 02:18:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B01C08002E0
	for <linux-audit@redhat.com>; Sat,  7 Mar 2020 02:18:57 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-266-Jd5jZH-oPNqadz7_OIsSgg-1; Fri, 06 Mar 2020 21:18:55 -0500
X-MC-Unique: Jd5jZH-oPNqadz7_OIsSgg-1
Received: by mail-ed1-f66.google.com with SMTP id h62so4727679edd.12
	for <linux-audit@redhat.com>; Fri, 06 Mar 2020 18:18:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nNkcxZcjiXy8seUZyCOUQowBOA6IKctgH73/1V7RDXE=;
	b=IRitphYxsYormjpdH/zm2/SxUcqXbabPjZaF0s5/Xx3FDsT6dmHYeu3tIj60r86K+I
	URKurvK2BmO1rPZwCEeHb0VcrgSE1N0ybMQGx07kgtmbJXO6q+Lacr1QAEg9TCiWujrF
	ymOXuLNm2FBeNe5XC5JHc7q4vqqGP2XucDBKEVZpWl7bOZYBXCr6mFHSO9jD4/T6anNI
	Z9LYZXtdNzyriki9mwivy370DsMUcyeKeDL3l356EFTIdGOqbf1LoYc9KzYTlBE8lMWR
	MEX1VqExozyXa4Ly38myEQSHdyagR2u5hUCVJGF2tJhdQpTT/Jqs0XyHdyUDUfXCugbZ
	1mjg==
X-Gm-Message-State: ANhLgQ1LfNpJ/Itt3NAEh37RadKfl6rMZ6yV3VgBUfBrNhW4D2rJjiNd
	NWYw7q2tppvh+aEhHS3i8ZV2TLaCJMLr1RWEDMmr
X-Google-Smtp-Source: ADFU+vtjsi5vFVCwXjeraCsHS0uqDBpoX6D/lL1p4D5VOvwQ2+ZOiTPjHOmuvrali6KHDXRxiqtLBl4ZVJNVlIXlyBg=
X-Received: by 2002:a17:906:3607:: with SMTP id
	q7mr5449015ejb.308.1583547533945; 
	Fri, 06 Mar 2020 18:18:53 -0800 (PST)
MIME-Version: 1.0
References: <20200222000407.110158-1-casey@schaufler-ca.com>
	<20200222000407.110158-13-casey@schaufler-ca.com>
In-Reply-To: <20200222000407.110158-13-casey@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 6 Mar 2020 21:18:43 -0500
Message-ID: <CAHC9VhS==wJOAN96VU_aNSDbjh9mpeKCaUEt4Wat4Fg2o+00Zw@mail.gmail.com>
Subject: Re: [PATCH v15 20/23] Audit: Add subj_LSM fields when necessary
To: Casey Schaufler <casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0272IxuB016574
X-loop: linux-audit@redhat.com
Cc: casey.schaufler@intel.com, linux-audit@redhat.com
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 21, 2020 at 7:06 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> Add record entries to identify subject data for all of the
> security modules when there is more than one.
>
> Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> Cc: netdev@vger.kernel.org
> Cc: linux-audit@redhat.com
> ---
>  drivers/android/binder.c                |  2 +-
>  include/linux/audit.h                   |  1 +
>  include/linux/security.h                |  9 ++++-
>  include/net/scm.h                       |  3 +-
>  kernel/audit.c                          | 40 ++++++++++++++++++-
>  kernel/audit_fsnotify.c                 |  1 +
>  kernel/auditfilter.c                    |  1 +
>  kernel/auditsc.c                        | 10 +++--
>  net/ipv4/ip_sockglue.c                  |  2 +-
>  net/netfilter/nf_conntrack_netlink.c    |  4 +-
>  net/netfilter/nf_conntrack_standalone.c |  2 +-
>  net/netfilter/nfnetlink_queue.c         |  2 +-
>  net/netlabel/netlabel_unlabeled.c       | 11 ++++--
>  net/netlabel/netlabel_user.c            |  2 +-
>  net/xfrm/xfrm_policy.c                  |  2 +
>  net/xfrm/xfrm_state.c                   |  2 +
>  security/integrity/ima/ima_api.c        |  1 +
>  security/integrity/integrity_audit.c    |  1 +
>  security/security.c                     | 51 +++++++++++++++++++++++--
>  19 files changed, 124 insertions(+), 23 deletions(-)

I'm not in love with some of the naming choices, but considering none
of it is visible to userspace it isn't worth worrying about.

Acked-by: Paul Moore <paul@paul-moore.com>

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

