Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 15B9B25E1A6
	for <lists+linux-audit@lfdr.de>; Fri,  4 Sep 2020 20:54:49 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-mGuSeSybOIaqH4fDJEu2lQ-1; Fri, 04 Sep 2020 14:54:47 -0400
X-MC-Unique: mGuSeSybOIaqH4fDJEu2lQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E16841DDE1;
	Fri,  4 Sep 2020 18:54:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DEBE5DA83;
	Fri,  4 Sep 2020 18:54:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 622F479DA9;
	Fri,  4 Sep 2020 18:54:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 084Is0Lr007633 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 4 Sep 2020 14:54:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D7068207A809; Fri,  4 Sep 2020 18:54:00 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2574207A808
	for <linux-audit@redhat.com>; Fri,  4 Sep 2020 18:53:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 21CC7101A53F
	for <linux-audit@redhat.com>; Fri,  4 Sep 2020 18:53:58 +0000 (UTC)
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-45-kUTBwCxKNgCtH78w0UWAdQ-1; Fri, 04 Sep 2020 14:53:55 -0400
X-MC-Unique: kUTBwCxKNgCtH78w0UWAdQ-1
Received: by mail-pj1-f68.google.com with SMTP id u3so222672pjr.3
	for <linux-audit@redhat.com>; Fri, 04 Sep 2020 11:53:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=F0EdNA6QqIRV7z2Jdp5B7kGzED4Dd6lXmJioCdLGMho=;
	b=AvvT55PSIdMUE6dFwGj6451vATkHtk+euR0JAxdHH7BanKovJPRM7crWHaaLmX3ehp
	AleF/1FbXEoxolirC8UmNsRrZXUDH4Q2nAo5vBZz9h9fSAwIMP5PkfkC3Fo5FAE/AEv2
	1BzNwX7b6NcC+gywMPU6V8BuVummu8SpxLXMda5zkTiRMaIhud4QyecXZZelxcNIUrPj
	MztyygeMsfBM/6WqVxDd8m6ba433JAEI9kT8D0aIm8yjO+XhTxoO02PXeX5epcqRRVD4
	0GUe3AI5ESh0zyHLd9XyJiVFtH9kuAzmX/Ua+Aut5I8Yd0/gaISrseNp/1REjtvMnkUP
	Yt2Q==
X-Gm-Message-State: AOAM531YOTPmz/wQ9afpk1NQB9lyMU45m6AcpZijjEznhwzPLBxVEhUx
	5fxOv7t4Zt4X72EAJrphsezJjR98CKt3i83K+uyu
X-Google-Smtp-Source: ABdhPJyM9O0la6AoFSfY0FtgHcG7DxhFxvh9tdrS0BKPzORvKYAQm06i1OFQLZrxVd5kaPq97I37Cbphesx4sQLi/2M=
X-Received: by 2002:a17:902:b20e:: with SMTP id
	t14mr3393806plr.24.1599245634561; 
	Fri, 04 Sep 2020 11:53:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200826145247.10029-1-casey@schaufler-ca.com>
	<20200826145247.10029-4-casey@schaufler-ca.com>
In-Reply-To: <20200826145247.10029-4-casey@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 4 Sep 2020 14:53:43 -0400
Message-ID: <CAHC9VhSe18hJMcjma4kDLPzo2MmiWYk2FY5+EfYiDUX5FmTyrg@mail.gmail.com>
Subject: Re: [PATCH v20 03/23] LSM: Use lsmblob in security_audit_rule_match
To: Casey Schaufler <casey@schaufler-ca.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 26, 2020 at 11:04 AM Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> Change the secid parameter of security_audit_rule_match
> to a lsmblob structure pointer. Pass the entry from the
> lsmblob structure for the approprite slot to the LSM hook.
>
> Change the users of security_audit_rule_match to use the
> lsmblob instead of a u32. The scaffolding function lsmblob_init()
> fills the blob with the value of the old secid, ensuring that
> it is available to the appropriate module hook. The sources of
> the secid, security_task_getsecid() and security_inode_getsecid(),
> will be converted to use the blob structure later in the series.
> At the point the use of lsmblob_init() is dropped.
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: John Johansen <john.johansen@canonical.com>
> Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> ---
>  include/linux/security.h            |  7 ++++---
>  kernel/auditfilter.c                |  6 ++++--
>  kernel/auditsc.c                    | 14 ++++++++++----
>  security/integrity/ima/ima.h        |  4 ++--
>  security/integrity/ima/ima_policy.c |  7 +++++--
>  security/security.c                 | 10 ++++++++--
>  6 files changed, 33 insertions(+), 15 deletions(-)

Acked-by: Paul Moore <paul@paul-moore.com>

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

