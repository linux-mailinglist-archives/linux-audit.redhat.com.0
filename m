Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 3B10C25E7DA
	for <lists+linux-audit@lfdr.de>; Sat,  5 Sep 2020 15:21:23 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-mhqz6DNuNYud7rpxtwBp-w-1; Sat, 05 Sep 2020 09:21:20 -0400
X-MC-Unique: mhqz6DNuNYud7rpxtwBp-w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9483B801ABE;
	Sat,  5 Sep 2020 13:21:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AC9E60C11;
	Sat,  5 Sep 2020 13:21:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5CA1718561B1;
	Sat,  5 Sep 2020 13:21:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 085DLAai005403 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 5 Sep 2020 09:21:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1C0FF2144B32; Sat,  5 Sep 2020 13:21:10 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 162AC2144B2F
	for <linux-audit@redhat.com>; Sat,  5 Sep 2020 13:21:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA651101A53F
	for <linux-audit@redhat.com>; Sat,  5 Sep 2020 13:21:03 +0000 (UTC)
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
	[209.85.218.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-340-TybNw10uOXC9p81wzyCEHQ-1; Sat, 05 Sep 2020 09:21:01 -0400
X-MC-Unique: TybNw10uOXC9p81wzyCEHQ-1
Received: by mail-ej1-f67.google.com with SMTP id i22so12115836eja.5
	for <linux-audit@redhat.com>; Sat, 05 Sep 2020 06:21:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cf70RVIxoNSgahE+uIsH3+C73R0A8ae+hS6CMm9ibGo=;
	b=jZ3a0f54+ickyrR5IMFF7DTy2IcFvOT1hs9LI1lQrjA6jWZWK8oX1g4aXziyqrsE6c
	BUestab4GRJi5zvw32dJT5YRnicTKG+cQgyBLhtsAYaAhgiG7fqY+yCeZvElNInalOna
	BWR2mkFeTipcRYjWNhmrWFGECRW4ga5IfbgxhJeijymONlzde9/1zdilA9MW/Hl+ac5/
	eYVoHp/Mo+PgoeKJK3oNeb3wSkGroYhK8xYIKVq1JWOYMTa9A9cBMuh6sSqQgqEQ+Agw
	+05F+Jcwj+E+433ZigHcsNUcRnxE8+ep0Q7jpHyqnn7Wf8Ka6QZd7903G5CstMFeze8X
	B7/g==
X-Gm-Message-State: AOAM531dR3aNHKeAE9qyp2Fo3gtQ6hU66sWpVE8zq4Z7gxxA3Bl8U3El
	g/y5W2WS2Ol+8tB2dc4C/l8/SwerEKOHNkErAd+fQ5I93Q==
X-Google-Smtp-Source: ABdhPJzK5OBvPjv4UCM6lUpsfkAvko4dfcrSwtYROIrJJ1NOd9VUANU2TzN94R2eyORzcQb0ryRH67pSUK0SpPp44Sg=
X-Received: by 2002:a17:906:43c9:: with SMTP id
	j9mr12357873ejn.542.1599312060415; 
	Sat, 05 Sep 2020 06:21:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200826145247.10029-1-casey@schaufler-ca.com>
	<20200826145247.10029-11-casey@schaufler-ca.com>
In-Reply-To: <20200826145247.10029-11-casey@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sat, 5 Sep 2020 09:20:49 -0400
Message-ID: <CAHC9VhQDmx5tSJ4NrEGat-iXjONL0Rfn1O2OqqW7ZbJ43tH6gA@mail.gmail.com>
Subject: Re: [PATCH v20 10/23] LSM: Use lsmblob in security_inode_getsecid
To: Casey Schaufler <casey@schaufler-ca.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: john.johansen@canonical.com, selinux@vger.kernel.org,
	James Morris <jmorris@namei.org>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 26, 2020 at 11:12 AM Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> Change the security_inode_getsecid() interface to fill in a
> lsmblob structure instead of a u32 secid. This allows for its
> callers to gather data from all registered LSMs. Data is provided
> for IMA and audit.
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: John Johansen <john.johansen@canonical.com>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
> cc: linux-integrity@vger.kernel.org
> ---
>  include/linux/security.h            |  7 ++++---
>  kernel/auditsc.c                    |  6 +++++-
>  security/integrity/ima/ima_policy.c |  4 +---
>  security/security.c                 | 11 +++++++++--
>  4 files changed, 19 insertions(+), 9 deletions(-)

Acked-by: Paul Moore <paul@paul-moore.com>

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

