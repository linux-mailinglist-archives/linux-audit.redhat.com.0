Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC52CAE52
	for <lists+linux-audit@lfdr.de>; Thu,  3 Oct 2019 20:36:52 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 009083001571;
	Thu,  3 Oct 2019 18:36:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B01B5D9E1;
	Thu,  3 Oct 2019 18:36:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5412B18005A0;
	Thu,  3 Oct 2019 18:36:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x93ITW0W003563 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 3 Oct 2019 14:29:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F0A81608C0; Thu,  3 Oct 2019 18:29:32 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB8F6608A5
	for <linux-audit@redhat.com>; Thu,  3 Oct 2019 18:29:30 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4E63D3CA20
	for <linux-audit@redhat.com>; Thu,  3 Oct 2019 18:29:29 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id y3so3861420ljj.6
	for <linux-audit@redhat.com>; Thu, 03 Oct 2019 11:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2cO77cLY9Zi5R0T68SRSCW4d8IffVADLpJPQ8SXEy8c=;
	b=SqOVYIgy87r6YtFTTSo9IZe+fDrUsz6DGqmrCEZAnJwFB7tO2dmG/aN/PlwDaJNECn
	kpXEzPAlsE2a8m2uf1Jff+hFsdVmg5kJUzZe4/Q/9cI9cd2/P2y47+3YWC/gG8X9cuim
	Cla4F1XSGPdDS6kSLMnITzhr0WxlrK5UOkUd5ybXXi5S0ZAv+kLNviYNWAKS2RMqXJJi
	F8N3bi87ArMe5/5QwCfc1mk+QhmpYL3miNsati1Liw2wVhmJdDUkkQLYiYJQbWYGqCBQ
	YTjv6q42JzBtEvqCcZ35Wkg0gm4YV7zv0p9S4+cwtcq7gM35s1E+Zqw6VSVe3mNJnjAX
	4LzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2cO77cLY9Zi5R0T68SRSCW4d8IffVADLpJPQ8SXEy8c=;
	b=Y/WHsX+ob7BtepCOqKQVkUGZXHGFmnpKPGucLTLXuW6kkEroc8Q8/EzME7F2d2JlZv
	f5ftIjht60x0Syjch9I/i6cKjXfnVYy2ThTpv1ZVbmZ1A8W2YH9BCDrzPWgTuYQMj9F/
	femrIKG4BHpItfnfOQoOt+WVWL/tJSGNcuLcjf1WlWtHoh3W2h8CVZh/6C03vxrcSyff
	l4OKW0aU1nQ5SirULv2Xq0zhts36U/GHPzYEZuPs7X7IWZY4v5a7RteGDpS3CPBM3DP5
	9VFAIWzhqf9pTCQAXYX+CMkvJ6NUkBBMkdEI4gFCwYIZE3VADbblG2SIlvOMQSjI3F/m
	2Yog==
X-Gm-Message-State: APjAAAVbIlWI3KH5MQ9MPjQoxTscoj37TnJO96iipLrKetR8WERZA/CW
	aHTdnlc5WmsGXUhy38+wbh7G2UEqNriXEvOjO4KiV9A=
X-Google-Smtp-Source: APXvYqziNAxWP+LWtRPmp0JQpUGI/15O8lUpsN9fOIt1PlWaVDDr0iDcTZbKN2QdCZ+ABWX+Rg5xj+YrJvdZNibPWds=
X-Received: by 2002:a2e:b4c5:: with SMTP id r5mr679986ljm.54.1570127367536;
	Thu, 03 Oct 2019 11:29:27 -0700 (PDT)
MIME-Version: 1.0
References: <201910021640.B01FA41@keescook>
In-Reply-To: <201910021640.B01FA41@keescook>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 3 Oct 2019 14:29:17 -0400
Message-ID: <CAHC9VhQKyHAvNhuquVEYXP9U7ix2pDwXGnRO6QaxYTUKA08=UQ@mail.gmail.com>
Subject: Re: [PATCH v3] audit: Report suspicious O_CREAT usage
To: Kees Cook <keescook@chromium.org>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 03 Oct 2019 18:29:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Thu, 03 Oct 2019 18:29:29 +0000 (UTC) for IP:'209.85.208.196'
	DOMAIN:'mail-lj1-f196.google.com'
	HELO:'mail-lj1-f196.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.196 mail-lj1-f196.google.com 209.85.208.196
	mail-lj1-f196.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Thu, 03 Oct 2019 18:36:51 +0000 (UTC)

On Wed, Oct 2, 2019 at 7:42 PM Kees Cook <keescook@chromium.org> wrote:
>
> This renames the very specific audit_log_link_denied() to
> audit_log_path_denied() and adds the AUDIT_* type as an argument. This
> allows for the creation of the new AUDIT_ANOM_CREAT that can be used to
> report the fifo/regular file creation restrictions that were introduced
> in commit 30aba6656f61 ("namei: allow restricted O_CREAT of FIFOs and
> regular files").
>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
> v3:
>  - retain existing operation names (paul)
> v2:
>  - fix build failure typo in CONFIG_AUDIT=n case
>  - improve operations naming (paul)
> ---
>  fs/namei.c                 |  8 ++++++--
>  include/linux/audit.h      |  5 +++--
>  include/uapi/linux/audit.h |  1 +
>  kernel/audit.c             | 11 ++++++-----
>  4 files changed, 16 insertions(+), 9 deletions(-)

Merged into audit/next - thanks!

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
