Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E963C9356
	for <lists+linux-audit@lfdr.de>; Wed,  2 Oct 2019 23:14:40 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 47007300CB28;
	Wed,  2 Oct 2019 21:14:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1ABFE5D9D6;
	Wed,  2 Oct 2019 21:14:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F05E94E58A;
	Wed,  2 Oct 2019 21:14:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x92LCItP022476 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 2 Oct 2019 17:12:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B5C9E19C7F; Wed,  2 Oct 2019 21:12:18 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx24.extmail.prod.ext.phx2.redhat.com
	[10.5.110.65])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0BFD19C6A
	for <linux-audit@redhat.com>; Wed,  2 Oct 2019 21:12:16 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BAF8910C0515
	for <linux-audit@redhat.com>; Wed,  2 Oct 2019 21:12:14 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id l21so365123lje.4
	for <linux-audit@redhat.com>; Wed, 02 Oct 2019 14:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Q2JSS08Ms57UqEsZfow4fHq4+PEYXwM7+yB7IFgfXSw=;
	b=O8BrNr27QXvmNqQqCPd87Q34YcNRBGNZygSd5rEl8zhICGOlt34sSpk4usntjKcnug
	1/WbRDmOoshrLLvkZn51WuDY9r8Y4AMn3uAHHIjRkxy3t53U2Kias4Vl6Gv28bkF7bhf
	mmZZjI0YNbWDyo8B8eBw3LasbJo/z9WigOs51+Wtvb/rJdi7YqZzk8n84YPX1aDQbDvL
	sCLh/SHl2G56jiYm3WglyjdxCfb3sC9FTAPFlroY0Ki2oPYCAg4OspWbJbyYeT9nvSZ7
	Wy+Ks1SGgCdkNVLmdtISHAeoYCRv2u8eqtd4xSBsqSxjLE+/dfqbPJzE0NxYFuhkpOvp
	q3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Q2JSS08Ms57UqEsZfow4fHq4+PEYXwM7+yB7IFgfXSw=;
	b=PIsbHjk5DDXUrbgDyM7/8mi1dlUHFHymWy6wSRHuXCNSqAiFgsCPvRzHEGrXU9w0Ut
	SpxcqSo+GnUyYmEG0IKG5xByosjA5RDNt7EiFWvPjONqz70vO6hAEsIyZTBIMYUIXaPP
	LcE8+yvm2yZIUuoLAmdO8oJTaKYkHOVJ6dxkG/XrdeUP5X/KvBv3hMU1PSfs4BHTQ9pC
	TKKiXXqJfAApemrMNq2Vs2LTq480oxkDS47IEofjLRSZVt0hPQEw/Qy6SeMpNyWejbs8
	KOWKYa4+ludJqqCVN+JVzKadsEB6uynGOCRnuFjife+cfImjxpRxxp5mBlAgXv9bsnZB
	EvMg==
X-Gm-Message-State: APjAAAV6GmWkuWIaq1dmtjsw+1XHnXU5J6xoxLidQyF3wcb5E7rWzO+O
	aa2YHgYAbbs10R9ybT2yy4EOZnNkTJj42dPeh+8u+Ds=
X-Google-Smtp-Source: APXvYqxLPUEu90fIr51j/ZlGZU7LVnF40q+p+8nV43id+zxjf17VYMDmWZtju1P5RtNnFnFv9JBQFsueA01CfQe020o=
X-Received: by 2002:a2e:5418:: with SMTP id i24mr3665540ljb.126.1570050732902; 
	Wed, 02 Oct 2019 14:12:12 -0700 (PDT)
MIME-Version: 1.0
References: <201910010945.CAABF57@keescook>
In-Reply-To: <201910010945.CAABF57@keescook>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 2 Oct 2019 17:12:01 -0400
Message-ID: <CAHC9VhTwyNsW5xVNsb+jXhgoLL86daZL1cWG9d+DVB0dQJAgMQ@mail.gmail.com>
Subject: Re: [PATCH v2] audit: Report suspicious O_CREAT usage
To: Kees Cook <keescook@chromium.org>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.65]);
	Wed, 02 Oct 2019 21:12:15 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.65]);
	Wed, 02 Oct 2019 21:12:15 +0000 (UTC) for IP:'209.85.208.196'
	DOMAIN:'mail-lj1-f196.google.com'
	HELO:'mail-lj1-f196.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.196 mail-lj1-f196.google.com 209.85.208.196
	mail-lj1-f196.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.65
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
Cc: s.mesoraca16@gmail.com, kernel-hardening@lists.openwall.com,
	linux-kernel@vger.kernel.org, linux-audit@redhat.com,
	=?UTF-8?Q?J=C3=A9r=C3=A9mie_Galarneau?=
	<jeremie.galarneau@efficios.com>, viro@zeniv.linux.org.uk,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	akpm@linux-foundation.org, Linus Torvalds <torvalds@linux-foundation.org>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Wed, 02 Oct 2019 21:14:39 +0000 (UTC)

On Tue, Oct 1, 2019 at 12:48 PM Kees Cook <keescook@chromium.org> wrote:
>
> This renames the very specific audit_log_link_denied() to
> audit_log_path_denied() and adds the AUDIT_* type as an argument. This
> allows for the creation of the new AUDIT_ANOM_CREAT that can be used to
> report the fifo/regular file creation restrictions that were introduced
> in commit 30aba6656f61 ("namei: allow restricted O_CREAT of FIFOs and
> regular files"). Additionally further clarifies the existing
> "operations" strings.
>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
> v2:
>  - fix build failure typo in CONFIG_AUDIT=n case
>  - improve operations naming (paul)
> ---
>  fs/namei.c                 |  8 ++++++--
>  include/linux/audit.h      |  5 +++--
>  include/uapi/linux/audit.h |  1 +
>  kernel/audit.c             | 11 ++++++-----
>  4 files changed, 16 insertions(+), 9 deletions(-)

Thanks for the update, but I think we need another respin, see below.

> diff --git a/fs/namei.c b/fs/namei.c
> index 671c3c1a3425..2d5d245ae723 100644
> --- a/fs/namei.c
> +++ b/fs/namei.c
> @@ -925,7 +925,7 @@ static inline int may_follow_link(struct nameidata *nd)
>                 return -ECHILD;
>
>         audit_inode(nd->name, nd->stack[0].link.dentry, 0);
> -       audit_log_link_denied("follow_link");
> +       audit_log_path_denied(AUDIT_ANOM_LINK, "sticky_follow_link");

Maybe I should have been more clear in the last patch thread, but my
suggested name change was only for the new records you are adding; we
don't want to change the operation/op names for existing records.  In
the above change, "follow_link" should stay "follow_link".

> @@ -993,7 +993,7 @@ static int may_linkat(struct path *link)
>         if (safe_hardlink_source(inode) || inode_owner_or_capable(inode))
>                 return 0;
>
> -       audit_log_link_denied("linkat");
> +       audit_log_path_denied(AUDIT_ANOM_LINK, "unowned_linkat");

See above, this should stay as "linkat".

> @@ -1031,6 +1031,10 @@ static int may_create_in_sticky(struct dentry * const dir,
>             (dir->d_inode->i_mode & 0020 &&
>              ((sysctl_protected_fifos >= 2 && S_ISFIFO(inode->i_mode)) ||
>               (sysctl_protected_regular >= 2 && S_ISREG(inode->i_mode))))) {
> +               const char *operation = S_ISFIFO(inode->i_mode) ?
> +                                       "sticky_create_fifo" :
> +                                       "sticky_create_regular";
> +               audit_log_path_denied(AUDIT_ANOM_CREAT, operation);

This is a new record, so this is fine.  Thanks for changing this.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
