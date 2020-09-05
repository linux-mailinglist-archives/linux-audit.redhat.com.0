Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 89EC625E7CF
	for <lists+linux-audit@lfdr.de>; Sat,  5 Sep 2020 15:19:13 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-kzaigBv7MM6aDHYBmjbaVw-1; Sat, 05 Sep 2020 09:19:09 -0400
X-MC-Unique: kzaigBv7MM6aDHYBmjbaVw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A90F21DDF2;
	Sat,  5 Sep 2020 13:19:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B64F85C1BD;
	Sat,  5 Sep 2020 13:19:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6F01F18561B1;
	Sat,  5 Sep 2020 13:18:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 085DIpFU005218 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 5 Sep 2020 09:18:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 686C55F24D; Sat,  5 Sep 2020 13:18:51 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 63CF0E7786
	for <linux-audit@redhat.com>; Sat,  5 Sep 2020 13:18:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C0556101A53F
	for <linux-audit@redhat.com>; Sat,  5 Sep 2020 13:18:48 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-505-JKitQKObP_C71mamtCLECg-1; Sat, 05 Sep 2020 09:18:46 -0400
X-MC-Unique: JKitQKObP_C71mamtCLECg-1
Received: by mail-ed1-f65.google.com with SMTP id c10so8562601edk.6
	for <linux-audit@redhat.com>; Sat, 05 Sep 2020 06:18:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WK7p3KEx2Y1obY9ifz2GCoN6MGqbfG7ZjSbn/axOcCo=;
	b=FnJ433eQ3Gqs6qesnYF7r8kFTlX/U4q81WU+35VBMJfj3OxW6PHHjPLp+7M8voG7FM
	K7zAXFxr/kF6GWsQc3O8WO4ejluodXeXcfBSsTf5wmL+GckkYUssCmIMeqCvMcbvEcWG
	8W+PARBayqmF8l3DAylTpFUB14XPxWIeO0t8NPpsb28awxVeoKxgn4Vt83u3N2BrhYvs
	jlbzeKixiqe6sNilUhv2NHCSIEd4CxmHT8fyK+tr+oIUheAqXYLtTcjD4Ie6xuD7ivAs
	cJ8sg2SA7iVmF9NkbrtfhhsXAP7JVPLhqKv0YtrgiAgr2+vQGSLE6IR5xrlybmqAo06W
	Gk8w==
X-Gm-Message-State: AOAM532NMu7mJSf2BveFhMKrsWWmIkwzF6bhdJaBCJNaToWxVPHooZYF
	6osY8b5/GF3yk/fPrwoUQhP+wITJUro3hAN130rB
X-Google-Smtp-Source: ABdhPJxuCv/2FKUD/4jcrASP1SzCOIc0XcI66J4vGjkUKFwbMiBFGzI4zC9CaPzZEeto9qDHSvepG0dMKziKlEiXQKI=
X-Received: by 2002:a50:8e17:: with SMTP id 23mr13327162edw.31.1599311925396; 
	Sat, 05 Sep 2020 06:18:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200826145247.10029-1-casey@schaufler-ca.com>
	<20200826145247.10029-10-casey@schaufler-ca.com>
In-Reply-To: <20200826145247.10029-10-casey@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sat, 5 Sep 2020 09:18:34 -0400
Message-ID: <CAHC9VhSsz+O28xAuVykhYq6L2XBC2gV+G-3A2AqiFzDY1_8Q6A@mail.gmail.com>
Subject: Re: [PATCH v20 09/23] LSM: Use lsmblob in security_task_getsecid
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 26, 2020 at 11:11 AM Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> Change the security_task_getsecid() interface to fill in
> a lsmblob structure instead of a u32 secid in support of
> LSM stacking. Audit interfaces will need to collect all
> possible secids for possible reporting.
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: John Johansen <john.johansen@canonical.com>
> Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> cc: linux-integrity@vger.kernel.org
> ---
>  drivers/android/binder.c              | 12 +------
>  include/linux/security.h              |  7 ++--
>  kernel/audit.c                        | 16 ++++-----
>  kernel/auditfilter.c                  |  4 +--
>  kernel/auditsc.c                      | 25 +++++++-------
>  net/netlabel/netlabel_unlabeled.c     |  5 ++-
>  net/netlabel/netlabel_user.h          |  6 +++-
>  security/integrity/ima/ima_appraise.c | 10 +++---
>  security/integrity/ima/ima_main.c     | 49 +++++++++++++++------------
>  security/security.c                   | 12 +++++--
>  10 files changed, 76 insertions(+), 70 deletions(-)

Acked-by: Paul Moore <paul@paul-moore.com>

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

