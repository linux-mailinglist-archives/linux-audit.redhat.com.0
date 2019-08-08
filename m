Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8FA86722
	for <lists+linux-audit@lfdr.de>; Thu,  8 Aug 2019 18:31:04 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BB384C0546D5;
	Thu,  8 Aug 2019 16:31:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BDE7B5D9CC;
	Thu,  8 Aug 2019 16:30:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0167C2551C;
	Thu,  8 Aug 2019 16:30:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x78GUjdd011481 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 8 Aug 2019 12:30:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3EED910016EB; Thu,  8 Aug 2019 16:30:45 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 374EC10016E9
	for <linux-audit@redhat.com>; Thu,  8 Aug 2019 16:30:42 +0000 (UTC)
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 59A2430A7BAB
	for <linux-audit@redhat.com>; Thu,  8 Aug 2019 16:30:41 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id b17so67327664lff.7
	for <linux-audit@redhat.com>; Thu, 08 Aug 2019 09:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iY8nuKTlngZ6cVx7pjJ+gcI4zt0MUj4vPq7BpastRy8=;
	b=a8+EQTG7BiGxv4u4aTmwJqwb4qnmNsqHUpML7PKh4xM0iB7FR/kSJ8k2dUsVcC2Ejr
	MzB5jtrTwjPkXRXfhG0ZF2flgLpWsRi1Z5prbAhvELkDA72Jvug47tARy5V9GrJTNiy/
	4Rp1K/afNw8XKnP1/9drSPw1ytJqjpp1o5DwGEoyiCr2PnGIBzUTo9be+o7trZuBSucT
	Mi45XtY8PjiWI+OI/PsRXBskkz+JsTP1oMPpz3jwjB60IcMTErNafiUN81ApYszP8Js2
	ncAObqH3h7dHBwVufFQnjjhBDUiXHDWkbCbOgB/eteDvUoDeD0Sgw7Wsi7ZhrM8qfxAc
	OePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iY8nuKTlngZ6cVx7pjJ+gcI4zt0MUj4vPq7BpastRy8=;
	b=rvjQ+Elb/m64453uqzi2RHitN2CG7MIh+1koH5uxcKYjvghIwt+z3GtIrWPR5L0FL1
	hdnR3fpG6u/ufQ5J3W1+jqbQ190qjRI292t++W/js8sTSOy/ehRsjXLfmwOiLE3+n8e9
	hJAPloaEe1BGzZDe9mZEw4aZAnltM765kRJJUMLFEby8yPJtnGwWmNQKcegmysIx2CB5
	xeSD12e/7HF78nNyIT+EK8UzEGaAYK3b2UXlQVofoVmlao1iBylKrbjkFXohvvUxXfNL
	Uc9De03ewICkIviNvkdblOgyi+K68pexmLOCAdBLzyupXcuARspVC9mlucXiCwnu9JUh
	63Lg==
X-Gm-Message-State: APjAAAWNWuYbo2QSr2GqIr0TRaBrfT7sw7woKje/3VNc/NKBG4je9hDO
	0uEubMyq0++tsWKNPgG8jolH+7WpMUcE0dhM7AiS+oA/9g==
X-Google-Smtp-Source: APXvYqwVXF9SRbb6l7UmJ40+7Sy0n+wlkxBLnQUVXaicekRi8iUM4mIz6wJAMn34OZDv5bhMZStPI7lWK//AdVQlLKI=
X-Received: by 2002:ac2:4c37:: with SMTP id u23mr9734454lfq.119.1565281839463; 
	Thu, 08 Aug 2019 09:30:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190801144313.1014-1-acgoide@tycho.nsa.gov>
In-Reply-To: <20190801144313.1014-1-acgoide@tycho.nsa.gov>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 8 Aug 2019 12:30:28 -0400
Message-ID: <CAHC9VhTSWiz45vh+M+sgu+ePwgFPZ4Mr8GmRZQjsGWQSzkjbLg@mail.gmail.com>
Subject: Re: [RFC PATCH v2] security,
	capability: pass object information to security_capable
To: Aaron Goidel <acgoide@tycho.nsa.gov>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Thu, 08 Aug 2019 16:30:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Thu, 08 Aug 2019 16:30:41 +0000 (UTC) for IP:'209.85.167.65'
	DOMAIN:'mail-lf1-f65.google.com' HELO:'mail-lf1-f65.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.167.65 mail-lf1-f65.google.com 209.85.167.65
	mail-lf1-f65.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
Cc: mortonm@chromium.org, john.johansen@canonical.com, selinux@vger.kernel.org,
	James Morris <jmorris@namei.org>, luto@amacapital.net,
	rgb@redhat.com, linux-security-module@vger.kernel.org,
	linux-audit@redhat.com, Nicholas Franck <nhfran2@tycho.nsa.gov>,
	Stephen Smalley <sds@tycho.nsa.gov>, Serge Hallyn <serge@hallyn.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Thu, 08 Aug 2019 16:31:03 +0000 (UTC)

On Thu, Aug 1, 2019 at 10:43 AM Aaron Goidel <acgoide@tycho.nsa.gov> wrote:
> From: Nicholas Franck <nhfran2@tycho.nsa.gov>
>
> At present security_capable does not pass any object information
> and therefore can neither audit the particular object nor take it
> into account. Augment the security_capable interface to support
> passing supplementary data. Use this facility initially to convey
> the inode for capability checks relevant to inodes. This only
> addresses capable_wrt_inode_uidgid calls; other capability checks
> relevant to inodes will be addressed in subsequent changes. In the
> future, this will be further extended to pass object information for
> other capability checks such as the target task for CAP_KILL.
>
> In SELinux this new information is leveraged here to include the inode
> in the audit message. In the future, it could also be used to perform
> a per inode capability checks.
>
> It would be possible to fold the existing opts argument into this new
> supplementary data structure. This was omitted from this change to
> minimize changes.
>
> Signed-off-by: Nicholas Franck <nhfran2@tycho.nsa.gov>
> Signed-off-by: Aaron Goidel <acgoide@tycho.nsa.gov>
> ---
> v2:
> - Changed order of audit prints so optional information comes second
> ---
>  include/linux/capability.h             |  7 ++++++
>  include/linux/lsm_audit.h              |  5 +++-
>  include/linux/lsm_hooks.h              |  3 ++-
>  include/linux/security.h               | 23 +++++++++++++-----
>  kernel/capability.c                    | 33 ++++++++++++++++++--------
>  kernel/seccomp.c                       |  2 +-
>  security/apparmor/capability.c         |  8 ++++---
>  security/apparmor/include/capability.h |  4 +++-
>  security/apparmor/ipc.c                |  2 +-
>  security/apparmor/lsm.c                |  5 ++--
>  security/apparmor/resource.c           |  2 +-
>  security/commoncap.c                   | 11 +++++----
>  security/lsm_audit.c                   | 21 ++++++++++++++--
>  security/safesetid/lsm.c               |  3 ++-
>  security/security.c                    |  5 ++--
>  security/selinux/hooks.c               | 20 +++++++++-------
>  security/smack/smack_access.c          |  2 +-
>  17 files changed, 110 insertions(+), 46 deletions(-)

You should CC the linux-audit list, I've added them on this mail.

I had hoped to see some thought put into the idea of dynamically
emitting the proper audit records as I mentioned in the previous patch
set, but regardless there are some comments on this code as written
...

> diff --git a/security/lsm_audit.c b/security/lsm_audit.c
> index 33028c098ef3..18cc7c956b69 100644
> --- a/security/lsm_audit.c
> +++ b/security/lsm_audit.c
> @@ -229,9 +229,26 @@ static void dump_common_audit_data(struct audit_buffer *ab,
>         case LSM_AUDIT_DATA_IPC:
>                 audit_log_format(ab, " key=%d ", a->u.ipc_id);
>                 break;
> -       case LSM_AUDIT_DATA_CAP:
> -               audit_log_format(ab, " capability=%d ", a->u.cap);
> +       case LSM_AUDIT_DATA_CAP: {
> +               const struct inode *inode;
> +
> +               audit_log_format(ab, " capability=%d ", a->u.cap_struct.cap);
> +               if (a->u.cap_struct.cad) {
> +                       switch (a->u.cap_struct.cad->type) {
> +                       case CAP_AUX_DATA_INODE: {
> +                               inode = a->u.cap_struct.cad->u.inode;
> +
> +                               audit_log_format(ab, " dev=");
> +                               audit_log_untrustedstring(ab,
> +                                       inode->i_sb->s_id);
> +                               audit_log_format(ab, " ino=%lu",
> +                                       inode->i_ino);
> +                               break;
> +                       }

Since you are declaring "inode" further up, there doesn't appear to be
any need for the CAP_AUX_DATA_INODE braces, please remove them.

The general recommended practice when it comes to "sometimes" fields
in an audit record, is to always record them in the record, but use a
value of "?" when there is nothing relevant to record.  For example,
when *not* recording inode information you would do something like the
following:

  audit_log_format(ab, " dev=? ino=?");

> +                       }
> +               }
>                 break;
> +       }
>         case LSM_AUDIT_DATA_PATH: {
>                 struct inode *inode;
>

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
