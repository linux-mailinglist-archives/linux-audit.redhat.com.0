Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D66742AA433
	for <lists+linux-audit@lfdr.de>; Sat,  7 Nov 2020 10:16:05 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-wUDZ6fkNP_Ctdc11ThHmUw-1; Sat, 07 Nov 2020 04:16:02 -0500
X-MC-Unique: wUDZ6fkNP_Ctdc11ThHmUw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DB1B805EFD;
	Sat,  7 Nov 2020 09:15:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 84C175C26B;
	Sat,  7 Nov 2020 09:15:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4DC5D180B658;
	Sat,  7 Nov 2020 09:15:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A79FdJL017345 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 7 Nov 2020 04:15:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B7A63F41D4; Sat,  7 Nov 2020 09:15:39 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B2881F41CE
	for <linux-audit@redhat.com>; Sat,  7 Nov 2020 09:15:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A14E811E76
	for <linux-audit@redhat.com>; Sat,  7 Nov 2020 09:15:37 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-591-kVFSxV4WM9--BVwOxZQ_Eg-1;
	Sat, 07 Nov 2020 04:15:35 -0500
X-MC-Unique: kVFSxV4WM9--BVwOxZQ_Eg-1
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 845C120B1F;
	Sat,  7 Nov 2020 09:15:32 +0000 (UTC)
Date: Sat, 7 Nov 2020 10:15:29 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: [PATCH v22 12/23] LSM: Specify which LSM to display
Message-ID: <20201107091529.GA23328@kroah.com>
References: <20201104234114.11346-1-casey@schaufler-ca.com>
	<20201104234114.11346-13-casey@schaufler-ca.com>
	<20201105092245.GB3439341@kroah.com>
	<31027d8e-50bc-70be-b4f2-a96a84de2bae@schaufler-ca.com>
MIME-Version: 1.0
In-Reply-To: <31027d8e-50bc-70be-b4f2-a96a84de2bae@schaufler-ca.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 06, 2020 at 04:20:43PM -0800, Casey Schaufler wrote:
> On 11/5/2020 1:22 AM, Greg KH wrote:
> > On Wed, Nov 04, 2020 at 03:41:03PM -0800, Casey Schaufler wrote:
> >> Create a new entry "display" in the procfs attr directory for
> >> controlling which LSM security information is displayed for a
> >> process. A process can only read or write its own display value.
> >>
> >> The name of an active LSM that supplies hooks for
> >> human readable data may be written to "display" to set the
> >> value. The name of the LSM currently in use can be read from
> >> "display". At this point there can only be one LSM capable
> >> of display active. A helper function lsm_task_display() is
> >> provided to get the display slot for a task_struct.
> >>
> >> Setting the "display" requires that all security modules using
> >> setprocattr hooks allow the action. Each security module is
> >> responsible for defining its policy.
> >>
> >> AppArmor hook provided by John Johansen <john.johansen@canonical.com>
> >> SELinux hook provided by Stephen Smalley <sds@tycho.nsa.gov>
> >>
> >> Reviewed-by: Kees Cook <keescook@chromium.org>
> >> Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
> >> Acked-by: Paul Moore <paul@paul-moore.com>
> >> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> >> Cc: linux-api@vger.kernel.org
> >> ---
> >>  fs/proc/base.c                       |   1 +
> >>  include/linux/lsm_hooks.h            |  17 +++
> >>  security/apparmor/include/apparmor.h |   3 +-
> >>  security/apparmor/lsm.c              |  32 +++++
> >>  security/security.c                  | 169 ++++++++++++++++++++++++---
> >>  security/selinux/hooks.c             |  11 ++
> >>  security/selinux/include/classmap.h  |   2 +-
> >>  security/smack/smack_lsm.c           |   7 ++
> >>  8 files changed, 223 insertions(+), 19 deletions(-)
> >>
> >> diff --git a/fs/proc/base.c b/fs/proc/base.c
> >> index 0f707003dda5..7432f24f0132 100644
> >> --- a/fs/proc/base.c
> >> +++ b/fs/proc/base.c
> >> @@ -2806,6 +2806,7 @@ static const struct pid_entry attr_dir_stuff[] = {
> >>  	ATTR(NULL, "fscreate",		0666),
> >>  	ATTR(NULL, "keycreate",		0666),
> >>  	ATTR(NULL, "sockcreate",	0666),
> >> +	ATTR(NULL, "display",		0666),
> > That's a vague name, any chance it can be more descriptive?
> 
> Sure. How about lsm_display, or display_lsm? I wouldn't say that
> any of the files in /proc/*/attr have especially descriptive names,
> but that's hardly an excuse.

I still don't understand what "display" means in this context.  Perhaps
documentation will help clear it up?

thanks,

greg k-h

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

