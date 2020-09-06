Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 8873A25EC3A
	for <lists+linux-audit@lfdr.de>; Sun,  6 Sep 2020 04:59:00 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-g6pnIaoBMWe2Nbi8Ltut1g-1; Sat, 05 Sep 2020 22:58:57 -0400
X-MC-Unique: g6pnIaoBMWe2Nbi8Ltut1g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFF5C801AC8;
	Sun,  6 Sep 2020 02:58:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C622D7E188;
	Sun,  6 Sep 2020 02:58:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 05E5C18561B1;
	Sun,  6 Sep 2020 02:58:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0862u2R1023347 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 5 Sep 2020 22:56:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 378A62157F23; Sun,  6 Sep 2020 02:56:02 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 329542166B28
	for <linux-audit@redhat.com>; Sun,  6 Sep 2020 02:55:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04F69811E76
	for <linux-audit@redhat.com>; Sun,  6 Sep 2020 02:55:59 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
	[209.85.218.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-137-BdgqXbfpN46tz0ij1E1QuA-1; Sat, 05 Sep 2020 22:55:56 -0400
X-MC-Unique: BdgqXbfpN46tz0ij1E1QuA-1
Received: by mail-ej1-f65.google.com with SMTP id z23so13389698ejr.13
	for <linux-audit@redhat.com>; Sat, 05 Sep 2020 19:55:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XrzR+/JpzSYwrKw8f7HoYXOSurj0d42UoeyPovZLhO8=;
	b=QJ5DgMZN/TjFwz3i24y5QH89V42H+cnhVEA8ft9UuURi4tJ/ZZUcM7+RYDUzbkJTh7
	fQf6PsFh7kMpZ284hfJGZBdmwEiSWZsHmkBtzAfJb+r3wKsVwEdGzyuPtAnSn6nWyg0Z
	wGrKiCRGUlBVwZYbX4bH2BHCSC1n8RLrkvfZPcTFoVNpe+BSZKN9ltwAWMhMfg6OvP2V
	kKzA0zASJlNaFZrwWwcLu+svXKu3LEL0JX7ZDDGcr5hBvPJuhWKvoY7UoXhFvmc70JpN
	QThPcH/hc3Y1yI7ldAHTDKwF+uTVGqMwt+gy+P5/Mrb/kIIht21W4WjSRRmH5nhPSkep
	OIEQ==
X-Gm-Message-State: AOAM5310iKaVnYcpvAVDs5vNFnjM9Wrwh9Hkf1GTXVUv/Zps8aGkCVzE
	JiKDbcQfMHL4Psn+RV7ppy3dYrdwkdN3vcPmkaCf
X-Google-Smtp-Source: ABdhPJx0bbwxpEDgIIhOu/lGMFbl3Uwi1hzkVJXfvBMLz4eoFci2W4EPe6s5SiDNNFf68i9C+KtANwcP2Ndg6HpJu4Y=
X-Received: by 2002:a17:906:a415:: with SMTP id
	l21mr13943401ejz.431.1599360955372; 
	Sat, 05 Sep 2020 19:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200826145247.10029-1-casey@schaufler-ca.com>
	<20200826145247.10029-17-casey@schaufler-ca.com>
In-Reply-To: <20200826145247.10029-17-casey@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sat, 5 Sep 2020 22:55:44 -0400
Message-ID: <CAHC9VhScgUoV452BrbufH1xCdFS3hLmKSyFqQRxHBO6k8tk55Q@mail.gmail.com>
Subject: Re: [PATCH v20 16/23] LSM: Use lsmcontext in security_inode_getsecctx
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 26, 2020 at 11:19 AM Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> Change the security_inode_getsecctx() interface to fill
> a lsmcontext structure instead of data and length pointers.
> This provides the information about which LSM created the
> context so that security_release_secctx() can use the
> correct hook.
>
> Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> ---
>  fs/nfsd/nfs4xdr.c        | 23 +++++++++--------------
>  include/linux/security.h |  5 +++--
>  security/security.c      | 13 +++++++++++--
>  3 files changed, 23 insertions(+), 18 deletions(-)

Acked-by: Paul Moore <paul@paul-moore.com>

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

