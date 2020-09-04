Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0495F25E399
	for <lists+linux-audit@lfdr.de>; Sat,  5 Sep 2020 00:08:32 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-mbikVb1TMaSa7LQz_Accuw-1; Fri, 04 Sep 2020 18:08:30 -0400
X-MC-Unique: mbikVb1TMaSa7LQz_Accuw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADAF18015FA;
	Fri,  4 Sep 2020 22:08:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6425219C59;
	Fri,  4 Sep 2020 22:08:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7DCB618561B2;
	Fri,  4 Sep 2020 22:08:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 084M6Xtl028952 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 4 Sep 2020 18:06:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9509410087D9; Fri,  4 Sep 2020 22:06:33 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8EB3610087D6
	for <linux-audit@redhat.com>; Fri,  4 Sep 2020 22:06:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71C898F3663
	for <linux-audit@redhat.com>; Fri,  4 Sep 2020 22:06:30 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-26-1ejmIvXdOw-mKCjb2yhzzw-1; Fri, 04 Sep 2020 18:06:27 -0400
X-MC-Unique: 1ejmIvXdOw-mKCjb2yhzzw-1
Received: by mail-ed1-f67.google.com with SMTP id n22so7480507edt.4
	for <linux-audit@redhat.com>; Fri, 04 Sep 2020 15:06:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5sj8Qs8D244b3DypbkVLK9SyzByIH1TSJxbsczlHJv0=;
	b=taTIEmI137U7eJa9menREIZfk1QKbjHnIBORooIapOopmk+DNRZrB/TOAT9PVPZmQN
	91kxgiBnUG3PDpUC5jmj2OGRDESkSP7hHDePALcqeHZ+1x6YtBFEmtgoeHLJBwEXR/9n
	B8+rh+t5oCue1s0EAZhFJ7BVuWNRiQRyB9n7vZNvjX6bEiYZYVqsI5pP3LBrjLO/xpNF
	+g5rdkE3i7xBPi61dRnIH+2Uqjt9AYUBFaRvyuEP/eVXmdrXJGrakaamT9Ufs6x4ZSqY
	oDtckpA2lBjl3tAtq213Hicl48rZPayD3ciRPtu4GCg6udX2dp0PIDAfYNt4pd7Z8MWC
	ZRlQ==
X-Gm-Message-State: AOAM532IQ8SBeuvtdZs58rsFpPgYhevtfaYubl6cUQU4f6U7wbcGk4bm
	mp+nUWelmlQ/Cxiqetz2oMIDcBnj5gG5Qr2DVFYdTOAFUQ==
X-Google-Smtp-Source: ABdhPJyEo302Bpff3ClIcmQHpPcN7oCXqhq2TQCQ5B9CTFtk+KixYuWcSnC0gp7xea3RivSrzCT9299b9ttsc/6vX2s=
X-Received: by 2002:a17:906:8c8:: with SMTP id o8mr9529534eje.91.1599256760459;
	Fri, 04 Sep 2020 14:59:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200826145247.10029-1-casey@schaufler-ca.com>
	<20200826145247.10029-8-casey@schaufler-ca.com>
In-Reply-To: <20200826145247.10029-8-casey@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 4 Sep 2020 17:59:09 -0400
Message-ID: <CAHC9VhTqec_n-4y+Qd_i_YEOx6hrb5qKTDubWR1Y6mwCf3zgUA@mail.gmail.com>
Subject: Re: [PATCH v20 07/23] LSM: Use lsmblob in security_secid_to_secctx
To: Casey Schaufler <casey@schaufler-ca.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
Cc: john.johansen@canonical.com, selinux@vger.kernel.org,
	James Morris <jmorris@namei.org>,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	casey.schaufler@intel.com, Stephen Smalley <sds@tycho.nsa.gov>
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 26, 2020 at 11:09 AM Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> Change security_secid_to_secctx() to take a lsmblob as input
> instead of a u32 secid. It will then call the LSM hooks
> using the lsmblob element allocated for that module. The
> callers have been updated as well. This allows for the
> possibility that more than one module may be called upon
> to translate a secid to a string, as can occur in the
> audit code.
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: John Johansen <john.johansen@canonical.com>
> Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> ---
>  drivers/android/binder.c                | 12 +++++++++-
>  include/linux/security.h                |  5 +++--
>  include/net/scm.h                       |  8 ++-----
>  kernel/audit.c                          | 20 +++++++++++++++--
>  kernel/auditsc.c                        | 28 +++++++++++++++++++----
>  net/ipv4/ip_sockglue.c                  |  5 +----
>  net/netfilter/nf_conntrack_netlink.c    | 14 ++++++++++--
>  net/netfilter/nf_conntrack_standalone.c |  4 +++-
>  net/netfilter/nfnetlink_queue.c         | 11 +++++++--
>  net/netlabel/netlabel_unlabeled.c       | 30 +++++++++++++++++++++----
>  net/netlabel/netlabel_user.c            |  6 ++---
>  security/security.c                     | 11 +++++----
>  12 files changed, 117 insertions(+), 37 deletions(-)

Acked-by: Paul Moore <paul@paul-moore.com>

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

