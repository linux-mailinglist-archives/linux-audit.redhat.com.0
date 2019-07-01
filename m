Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id DD28C5C462
	for <lists+linux-audit@lfdr.de>; Mon,  1 Jul 2019 22:43:04 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C54783082B63;
	Mon,  1 Jul 2019 20:42:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 878D217108;
	Mon,  1 Jul 2019 20:42:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A83F31806B16;
	Mon,  1 Jul 2019 20:41:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x61KeeS8011573 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 1 Jul 2019 16:40:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BA4C17A4C9; Mon,  1 Jul 2019 20:40:40 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB31B7A4ED
	for <linux-audit@redhat.com>; Mon,  1 Jul 2019 20:40:38 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0B93A28DE
	for <linux-audit@redhat.com>; Mon,  1 Jul 2019 20:40:22 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id d11so9729575lfb.4
	for <linux-audit@redhat.com>; Mon, 01 Jul 2019 13:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rhBgh/MkgSBMv3ODP8kXtzfCmYcCK8Oylmokposzhdw=;
	b=zK3eddfZNyVy3htnMG/wmHc2lCyF/DF0DqnwwPyk46Uc4NgyQwiTCNlo3rsxCepQ/v
	BlfE9FcDzFARbkj8HovAIAKIubRkYH987WTU+mtt1kEaEFfO3vepiXY2t972NlxQVQK4
	WCdG8rMYzEEyi3IH6yfKv4uMunNp7E2kTzAkwkays3SB23Y1Lop4AJJ0MXNZJKSWnUzd
	I59KcyKvK+hS2By9mmmUlkk1G/zaqGRm91DA0LzNXNLfwfEAn2IH8FT0O9+rYL+Tukdg
	GnxMaqVIc42uypVCS2Fpf5gyOWZlLkmozGmbNTwaHKrfb+pLaJEYPcdP7bBIMuYTLxci
	sK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rhBgh/MkgSBMv3ODP8kXtzfCmYcCK8Oylmokposzhdw=;
	b=L/8m/ZMFtKA+dCxRAP5klw9D0h6DCzdtDkQqxFjVZQ/4MlKttBatwAwx+mgLdcwxzN
	yAIBlskM4Q7YmWNsiEvKo3qMskScT0oEuRmObXywmdcjFwsjBbUHQtL3F9vmi/mV53z8
	sV+V66PcsRpZv3IsANyDEfXg/itmJtEGRK15v9MWUjX1EZPwVJ8iok+B5zijg/ZXQ6DZ
	tEHT+4og8Vd6FBja8z2CcTbaPnSoZs/kP66Pg5DFrFGU8U+v17BrK2wKG4jjuRvGuavZ
	NLSZmd1rV/lDEMBYurzK3pidrfoiYh3rBZ4bk4GvVVo9PxPSsYl9qqx6fvnjrJQmtgJg
	KyZQ==
X-Gm-Message-State: APjAAAXomOOXNgDZHYWqGyJ/2RcNI+zg7Rlq7y/UHQVHrBr7o5Uo/pW7
	K7ma11q+uVIvb2oiC2wvtWC3mQw/8Uj6XQe8iHxuZW+LmQ==
X-Google-Smtp-Source: APXvYqzzhSAHQcPRAh6guaIvbAU0FF7A23Bzg+QFUyZHVOFCRf5F152rlANY7hqDp6WfYMutSNXYgtDhVdfiL387NkA=
X-Received: by 2002:ac2:5310:: with SMTP id c16mr6363668lfh.119.1562013620246; 
	Mon, 01 Jul 2019 13:40:20 -0700 (PDT)
MIME-Version: 1.0
References: <20b1e7b386ba06f013e5e4206cca1bb487d90a68.1561640731.git.rgb@redhat.com>
In-Reply-To: <20b1e7b386ba06f013e5e4206cca1bb487d90a68.1561640731.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 1 Jul 2019 16:40:08 -0400
Message-ID: <CAHC9VhTQt6t--Bo=ZwMCt4C+woNp-9LexcbMvroMC52kPwaWjQ@mail.gmail.com>
Subject: Re: [PATCH ghak57 V2] selinux: format all invalid context as untrusted
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 01 Jul 2019 20:40:22 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Mon, 01 Jul 2019 20:40:22 +0000 (UTC) for IP:'209.85.167.68'
	DOMAIN:'mail-lf1-f68.google.com' HELO:'mail-lf1-f68.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.199  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_MSPIKE_H2,
	SPF_NONE) 209.85.167.68 mail-lf1-f68.google.com
	209.85.167.68 mail-lf1-f68.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-audit@redhat.com
Cc: SElinux list <selinux@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Mon, 01 Jul 2019 20:43:03 +0000 (UTC)

On Thu, Jun 27, 2019 at 12:48 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> The userspace tools expect all fields of the same name to be logged
> consistently with the same encoding.  Since the invalid_context fields
> contain untrusted strings in selinux_inode_setxattr()
> and selinux_setprocattr(), encode all instances of this field the same
> way as though they were untrusted even though
> compute_sid_handle_invalid_context() and security_sid_mls_copy() are
> trusted.
>
> Please see github issue
> https://github.com/linux-audit/audit-kernel/issues/57
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  security/selinux/ss/services.c | 29 +++++++++++++++++++----------
>  1 file changed, 19 insertions(+), 10 deletions(-)

Generally rc6/rc7 is a bit late for things, but this is pretty
straightforward so I think it should be safe.  Merged into
selinux/next.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
