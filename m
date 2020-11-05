Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 397EF2A7AAB
	for <lists+linux-audit@lfdr.de>; Thu,  5 Nov 2020 10:34:52 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-FdyFfKcsO2CPOl0PpgY7TQ-1; Thu, 05 Nov 2020 04:34:48 -0500
X-MC-Unique: FdyFfKcsO2CPOl0PpgY7TQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7443C107ACF6;
	Thu,  5 Nov 2020 09:34:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5461B7BE43;
	Thu,  5 Nov 2020 09:34:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AA85E5812F;
	Thu,  5 Nov 2020 09:34:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A59VOfo021403 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 5 Nov 2020 04:31:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3DD8D2144B35; Thu,  5 Nov 2020 09:31:24 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 38F282144B32
	for <linux-audit@redhat.com>; Thu,  5 Nov 2020 09:31:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2573A8582AA
	for <linux-audit@redhat.com>; Thu,  5 Nov 2020 09:31:21 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-486-mJGmWNPjM76qmgCYeiqE6g-1;
	Thu, 05 Nov 2020 04:31:19 -0500
X-MC-Unique: mJGmWNPjM76qmgCYeiqE6g-1
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 32D3820786;
	Thu,  5 Nov 2020 09:21:56 +0000 (UTC)
Date: Thu, 5 Nov 2020 10:22:45 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: [PATCH v22 12/23] LSM: Specify which LSM to display
Message-ID: <20201105092245.GB3439341@kroah.com>
References: <20201104234114.11346-1-casey@schaufler-ca.com>
	<20201104234114.11346-13-casey@schaufler-ca.com>
MIME-Version: 1.0
In-Reply-To: <20201104234114.11346-13-casey@schaufler-ca.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: john.johansen@canonical.com, selinux@vger.kernel.org,
	linux-api@vger.kernel.org, jmorris@namei.org, linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	casey.schaufler@intel.com, sds@tycho.nsa.gov
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 04, 2020 at 03:41:03PM -0800, Casey Schaufler wrote:
> Create a new entry "display" in the procfs attr directory for
> controlling which LSM security information is displayed for a
> process. A process can only read or write its own display value.
> 
> The name of an active LSM that supplies hooks for
> human readable data may be written to "display" to set the
> value. The name of the LSM currently in use can be read from
> "display". At this point there can only be one LSM capable
> of display active. A helper function lsm_task_display() is
> provided to get the display slot for a task_struct.
> 
> Setting the "display" requires that all security modules using
> setprocattr hooks allow the action. Each security module is
> responsible for defining its policy.
> 
> AppArmor hook provided by John Johansen <john.johansen@canonical.com>
> SELinux hook provided by Stephen Smalley <sds@tycho.nsa.gov>
> 
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
> Acked-by: Paul Moore <paul@paul-moore.com>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> Cc: linux-api@vger.kernel.org
> ---
>  fs/proc/base.c                       |   1 +
>  include/linux/lsm_hooks.h            |  17 +++
>  security/apparmor/include/apparmor.h |   3 +-
>  security/apparmor/lsm.c              |  32 +++++
>  security/security.c                  | 169 ++++++++++++++++++++++++---
>  security/selinux/hooks.c             |  11 ++
>  security/selinux/include/classmap.h  |   2 +-
>  security/smack/smack_lsm.c           |   7 ++
>  8 files changed, 223 insertions(+), 19 deletions(-)
> 
> diff --git a/fs/proc/base.c b/fs/proc/base.c
> index 0f707003dda5..7432f24f0132 100644
> --- a/fs/proc/base.c
> +++ b/fs/proc/base.c
> @@ -2806,6 +2806,7 @@ static const struct pid_entry attr_dir_stuff[] = {
>  	ATTR(NULL, "fscreate",		0666),
>  	ATTR(NULL, "keycreate",		0666),
>  	ATTR(NULL, "sockcreate",	0666),
> +	ATTR(NULL, "display",		0666),

That's a vague name, any chance it can be more descriptive?

And where is the Documentation/ABI/ entries for all of this, how does
userspace know what these things are, and how to use them?

thanks,

greg k-h

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

