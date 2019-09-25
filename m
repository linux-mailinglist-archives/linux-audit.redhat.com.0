Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id F3189BE8D6
	for <lists+linux-audit@lfdr.de>; Thu, 26 Sep 2019 01:15:16 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E73D989AC8;
	Wed, 25 Sep 2019 23:15:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A237A60C5D;
	Wed, 25 Sep 2019 23:15:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5730718005A0;
	Wed, 25 Sep 2019 23:15:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8PNEvbV014594 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 25 Sep 2019 19:14:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 17B361001B20; Wed, 25 Sep 2019 23:14:57 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1233F1001B09
	for <linux-audit@redhat.com>; Wed, 25 Sep 2019 23:14:54 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1B0B1C057F88
	for <linux-audit@redhat.com>; Wed, 25 Sep 2019 23:14:52 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id x10so239625pgi.5
	for <linux-audit@redhat.com>; Wed, 25 Sep 2019 16:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to;
	bh=3yR13IGBtpRxVrAvXtfdwL1FPEzwU8Klk4nC+0EqJDk=;
	b=USlapULohZkvBJ17J2gKRIWAKw/YXLuN9Fnt7BuRoAbcPLpaksvJ19mWQjaAdswy9I
	XJ3EaMa0HMcTzhP7IHvOXewlMJLc4YjrgiwltQHTNYsK9SIZ1fM4mw3qJUZ6I961Y3rq
	xMpnts49joruj2BWQz0UB7FFSvWLzWnus5LdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=3yR13IGBtpRxVrAvXtfdwL1FPEzwU8Klk4nC+0EqJDk=;
	b=sseiRWNFbEBDduUP/Yl1Pgf2bu38jomhOW3SoB3PxCbI+I1C57HRSKhMkcn6rB/jnU
	JW4/pzyOQO+J2zjddp9cPaQtfHzxaRJ67ci7oSWYPZm6p1ORq+xup4xaG+UVy5JOWAE1
	6gTYL6Wva4yQgvP0p2lvFM1Ox9lz+MuPU5cnE5vfQLZYTaRYGhhwpAwBGLZZSTeKWjvu
	qGO6SmLWwgaepHaynNOmFxFImCf/xkCYfjGJDXV3RdgYdQFZTZuRI+oTOCG0DT7ZybWU
	fuFi2uxhfY2XV6IMdjQRZtKYjglCSn3sDugR9MLSq4bnpoNXXQQv01wjqUmbfoTdHzwN
	fU8w==
X-Gm-Message-State: APjAAAXgYMx3LM5z8Y02zUjQ4Xr0ksTa4CZKP4GUy7u3nLY7NZPtx0DA
	my10wnZ5po34AcAPLrpcDvLnnA==
X-Google-Smtp-Source: APXvYqy10lz2t+xFYDw8ejqY/v+AUKNcAsXJqKVO6YWQl/wFQTx9PSW3o6jaAjC3MWIfLPMq/Q3cnw==
X-Received: by 2002:a17:90a:3462:: with SMTP id o89mr238538pjb.2.1569453291258;
	Wed, 25 Sep 2019 16:14:51 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id 22sm90977pfo.131.2019.09.25.16.14.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 25 Sep 2019 16:14:50 -0700 (PDT)
Date: Wed, 25 Sep 2019 16:14:48 -0700
From: Kees Cook <keescook@chromium.org>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH] audit: Report suspicious O_CREAT usage
Message-ID: <201909251614.5FDA48B1@keescook>
References: <201909251348.A1542A52@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201909251348.A1542A52@keescook>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 25 Sep 2019 23:14:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Wed, 25 Sep 2019 23:14:52 +0000 (UTC) for IP:'209.85.215.194'
	DOMAIN:'mail-pg1-f194.google.com'
	HELO:'mail-pg1-f194.google.com' FROM:'keescook@chromium.org'
	RCPT:''
X-RedHat-Spam-Score: -0.099  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.215.194 mail-pg1-f194.google.com 209.85.215.194
	mail-pg1-f194.google.com <keescook@chromium.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.32
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
Cc: s.mesoraca16@gmail.com, kernel-hardening@lists.openwall.com,
	linux-kernel@vger.kernel.org, linux-audit@redhat.com,
	=?iso-8859-1?Q?J=E9r=E9mie?= Galarneau <jeremie.galarneau@efficios.com>,
	viro@zeniv.linux.org.uk,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	akpm@linux-foundation.org, torvalds@linux-foundation.org,
	dan.carpenter@oracle.com
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Wed, 25 Sep 2019 23:15:15 +0000 (UTC)

On Wed, Sep 25, 2019 at 02:02:33PM -0700, Kees Cook wrote:
> This renames the very specific audit_log_link_denied() to
> audit_log_path_denied() and adds the AUDIT_* type as an argument. This
> allows for the creation of the new AUDIT_ANOM_CREAT that can be used to
> report the fifo/regular file creation restrictions that were introduced
> in commit 30aba6656f61 ("namei: allow restricted O_CREAT of FIFOs and
> regular files"). Without this change, discovering that the restriction
> is enabled can be very challenging:
> https://lore.kernel.org/lkml/CA+jJMxvkqjXHy3DnV5MVhFTL2RUhg0WQ-XVFW3ngDQO=
dkFq0PA@mail.gmail.com
> =

> Reported-by: J=E9r=E9mie Galarneau <jeremie.galarneau@efficios.com>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
> This is not a complete fix because reporting was broken in commit
> 15564ff0a16e ("audit: make ANOM_LINK obey audit_enabled and
> audit_dummy_context")
> which specifically goes against the intention of these records: they
> should _always_ be reported. If auditing isn't enabled, they should be
> ratelimited.
> =

> Instead of using audit, should this just go back to using
> pr_ratelimited()?
> ---
>  fs/namei.c                 |  7 +++++--
>  include/linux/audit.h      |  5 +++--
>  include/uapi/linux/audit.h |  1 +
>  kernel/audit.c             | 11 ++++++-----
>  4 files changed, 15 insertions(+), 9 deletions(-)
> =

> diff --git a/fs/namei.c b/fs/namei.c
> index 671c3c1a3425..0e60f81e1d5a 100644
> --- a/fs/namei.c
> +++ b/fs/namei.c
> @@ -925,7 +925,7 @@ static inline int may_follow_link(struct nameidata *n=
d)
>  		return -ECHILD;
>  =

>  	audit_inode(nd->name, nd->stack[0].link.dentry, 0);
> -	audit_log_link_denied("follow_link");
> +	audit_log_path_denied(AUDIT_ANOM_LINK, "follow_link");
>  	return -EACCES;
>  }
>  =

> @@ -993,7 +993,7 @@ static int may_linkat(struct path *link)
>  	if (safe_hardlink_source(inode) || inode_owner_or_capable(inode))
>  		return 0;
>  =

> -	audit_log_link_denied("linkat");
> +	audit_log_path_denied(AUDIT_ANOM_LINK, "linkat");
>  	return -EPERM;
>  }
>  =

> @@ -1031,6 +1031,9 @@ static int may_create_in_sticky(struct dentry * con=
st dir,
>  	    (dir->d_inode->i_mode & 0020 &&
>  	     ((sysctl_protected_fifos >=3D 2 && S_ISFIFO(inode->i_mode)) ||
>  	      (sysctl_protected_regular >=3D 2 && S_ISREG(inode->i_mode))))) {
> +		audit_log_path_denied(AUDIT_ANOM_CREAT,
> +				      S_ISFIFO(inode->i_mode) ? "fifo"
> +							      : "regular");
>  		return -EACCES;
>  	}
>  	return 0;
> diff --git a/include/linux/audit.h b/include/linux/audit.h
> index aee3dc9eb378..b3715e2ee1c5 100644
> --- a/include/linux/audit.h
> +++ b/include/linux/audit.h
> @@ -156,7 +156,8 @@ extern void		    audit_log_d_path(struct audit_buffer=
 *ab,
>  					     const struct path *path);
>  extern void		    audit_log_key(struct audit_buffer *ab,
>  					  char *key);
> -extern void		    audit_log_link_denied(const char *operation);
> +extern void		    audit_log_path_denied(int type,
> +						  const char *operation);
>  extern void		    audit_log_lost(const char *message);
>  =

>  extern int audit_log_task_context(struct audit_buffer *ab);
> @@ -217,7 +218,7 @@ static inline void audit_log_d_path(struct audit_buff=
er *ab,
>  { }
>  static inline void audit_log_key(struct audit_buffer *ab, char *key)
>  { }
> -static inline void audit_log_link_denied(const char *string)
> +static inline void audit_log_path_denied(int type, const char *string);

Oops, typo above (should be no trailing ";"). Thanks 0day-bot! I didn't
build without CONFIG_AUDIT. :)

-Kees

>  { }
>  static inline int audit_log_task_context(struct audit_buffer *ab)
>  {
> diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
> index c89c6495983d..3ad935527177 100644
> --- a/include/uapi/linux/audit.h
> +++ b/include/uapi/linux/audit.h
> @@ -143,6 +143,7 @@
>  #define AUDIT_ANOM_PROMISCUOUS      1700 /* Device changed promiscuous m=
ode */
>  #define AUDIT_ANOM_ABEND            1701 /* Process ended abnormally */
>  #define AUDIT_ANOM_LINK		    1702 /* Suspicious use of file links */
> +#define AUDIT_ANOM_CREAT	    1703 /* Suspicious file creation */
>  #define AUDIT_INTEGRITY_DATA	    1800 /* Data integrity verification */
>  #define AUDIT_INTEGRITY_METADATA    1801 /* Metadata integrity verificat=
ion */
>  #define AUDIT_INTEGRITY_STATUS	    1802 /* Integrity enable status */
> diff --git a/kernel/audit.c b/kernel/audit.c
> index da8dc0db5bd3..ed7402ac81b6 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -2155,18 +2155,19 @@ void audit_log_task_info(struct audit_buffer *ab)
>  EXPORT_SYMBOL(audit_log_task_info);
>  =

>  /**
> - * audit_log_link_denied - report a link restriction denial
> - * @operation: specific link operation
> + * audit_log_path_denied - report a path restriction denial
> + * @type: audit message type (AUDIT_ANOM_LINK, AUDIT_ANOM_CREAT, etc)
> + * @operation: specific operation name
>   */
> -void audit_log_link_denied(const char *operation)
> +void audit_log_path_denied(int type, const char *operation)
>  {
>  	struct audit_buffer *ab;
>  =

>  	if (!audit_enabled || audit_dummy_context())
>  		return;
>  =

> -	/* Generate AUDIT_ANOM_LINK with subject, operation, outcome. */
> -	ab =3D audit_log_start(audit_context(), GFP_KERNEL, AUDIT_ANOM_LINK);
> +	/* Generate log with subject, operation, outcome. */
> +	ab =3D audit_log_start(audit_context(), GFP_KERNEL, type);
>  	if (!ab)
>  		return;
>  	audit_log_format(ab, "op=3D%s", operation);
> -- =

> 2.17.1
> =

> =

> -- =

> Kees Cook

-- =

Kees Cook

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
