Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 039F725E226
	for <lists+linux-audit@lfdr.de>; Fri,  4 Sep 2020 21:47:44 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-q2GNu6diPC2RcuLiWKMKrA-1; Fri, 04 Sep 2020 15:47:42 -0400
X-MC-Unique: q2GNu6diPC2RcuLiWKMKrA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47DBE64093;
	Fri,  4 Sep 2020 19:47:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 83AF25C1D0;
	Fri,  4 Sep 2020 19:47:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AFE4F18561B1;
	Fri,  4 Sep 2020 19:47:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 084JkvBp012676 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 4 Sep 2020 15:46:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7436D1008B8C; Fri,  4 Sep 2020 19:46:57 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6ED601008B72
	for <linux-audit@redhat.com>; Fri,  4 Sep 2020 19:46:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D81C827EE1
	for <linux-audit@redhat.com>; Fri,  4 Sep 2020 19:46:55 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
	[209.85.218.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-578-8SDPL4eSOzmXrfy9PGCMhg-1; Fri, 04 Sep 2020 15:46:52 -0400
X-MC-Unique: 8SDPL4eSOzmXrfy9PGCMhg-1
Received: by mail-ej1-f66.google.com with SMTP id i22so10093850eja.5
	for <linux-audit@redhat.com>; Fri, 04 Sep 2020 12:46:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ahv6Gcf8u2r+jQtV3sHwka6vcwXItXD23IbL0Z84Fnc=;
	b=RdBeF6FL0/dw9lOHl8UxOQDqGiL5RYV+u5xMejdSKXw0DcQQTJloDsLccyGX2KEpwe
	hcRiGyG0C1/DS07LOb8zsKUFM4TE2ICGX0rFx/KaTIX2ye/aJGT75/VkgvPPPuUyT8xJ
	IHVL57QagmvYhIhAUWT5RjcM+71HEZsKheSa/NKMI5tLWA/eRiD6WEUQ5mdf2HAd6JX+
	enAUlJKV3m59W7b2rH7QgNQqhq84HVwJ4GeVT3RCfsXs3uB10H4OYQ9HI9EU/DBjvvH1
	dAIZssGmw9EccNJB+VGCe0bx2NyLuHgLwc6wVQ3DMKTp/3CCyq9k5+DzzZFnZZtRF+u8
	c+Gg==
X-Gm-Message-State: AOAM533qgBhcYI08dFaiODAmeMW0Tmuy3ZaOBDYIUbwqy1uK7Tn4C/HH
	AWBXEXnF4iDRQT1ysgwNt5Qv/K/oxWnmh+UwSrRa
X-Google-Smtp-Source: ABdhPJz6jGSVTQEdTCAyQ7P6P1g32qaLILNtTQua1cP7DRd/2P2IL6el9t6w9LAbPjr1LDVsw2QSQ3OLEv+yCzp5DqQ=
X-Received: by 2002:a17:906:15d4:: with SMTP id
	l20mr8873629ejd.178.1599248811394; 
	Fri, 04 Sep 2020 12:46:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200826145247.10029-1-casey@schaufler-ca.com>
	<20200826145247.10029-5-casey@schaufler-ca.com>
In-Reply-To: <20200826145247.10029-5-casey@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 4 Sep 2020 15:46:40 -0400
Message-ID: <CAHC9VhSNkycyfv8Aeh23CHPRz9-TZAbM1ipN8jd_amwUqoawfw@mail.gmail.com>
Subject: Re: [PATCH v20 04/23] LSM: Use lsmblob in security_kernel_act_as
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 26, 2020 at 11:05 AM Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> Change the security_kernel_act_as interface to use a lsmblob
> structure in place of the single u32 secid in support of
> module stacking. Change its only caller, set_security_override,
> to do the same. Change that one's only caller,
> set_security_override_from_ctx, to call it with the new
> parameter type.
>
> The security module hook is unchanged, still taking a secid.
> The infrastructure passes the correct entry from the lsmblob.
> lsmblob_init() is used to fill the lsmblob structure, however
> this will be removed later in the series when security_secctx_to_secid()
> is undated to provide a lsmblob instead of a secid.
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: John Johansen <john.johansen@canonical.com>
> Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> ---
>  include/linux/cred.h     |  3 ++-
>  include/linux/security.h |  5 +++--
>  kernel/cred.c            | 10 ++++++----
>  security/security.c      | 14 ++++++++++++--
>  4 files changed, 23 insertions(+), 9 deletions(-)

Acked-by: Paul Moore <paul@paul-moore.com>

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

