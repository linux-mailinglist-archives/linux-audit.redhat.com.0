Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D53A25BED
	for <lists+linux-audit@lfdr.de>; Wed, 22 May 2019 04:26:49 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9A7F259464;
	Wed, 22 May 2019 02:26:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C11071A929;
	Wed, 22 May 2019 02:26:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 84D36206D2;
	Wed, 22 May 2019 02:26:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4M2NokI012223 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 21 May 2019 22:23:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 38BC32CFD0; Wed, 22 May 2019 02:23:50 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 30A4D17519
	for <linux-audit@redhat.com>; Wed, 22 May 2019 02:23:46 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ADF73792AE
	for <linux-audit@redhat.com>; Wed, 22 May 2019 02:23:39 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id 14so578933ljj.5
	for <linux-audit@redhat.com>; Tue, 21 May 2019 19:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FoATy8oZsskl8ARNANZmhlDNjVNkchw4y2fRYzB5sLg=;
	b=PVPFHzryLgdl317MtVFNF4zHtZ9oKN1Vd1ljsQiqgKDbN6uztGOCkcuaO1VMftuRnl
	VutoyZXPws6YtnCNpjj9ORtgriTRvWLuXp/nIUG2YEUsBp4CfNtxNUOv5zggwq0JxNyz
	JBXDPdq3cVwXGcV6Ubb3Blx2+t1YYDNbK9njZwcTI90V69psWIQ4514/glNSAUPL5X21
	gtxk6nQ3MxfjVWV7isrI/fSN7QLV9ZkhGslrh+IVoTnIFM9OlaDbJdKz+b8iQLJrbn4w
	fhjDX/9ncQqEvq8vus8mrlUzoUtFL0s/hPPOIfe8IYhh8vKKzsSAevcW55XIjoEBbiZO
	hMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FoATy8oZsskl8ARNANZmhlDNjVNkchw4y2fRYzB5sLg=;
	b=YwrbWxNnLLDyDH9In5RxxHEgiwg7IGkFBHQY3tuDqPHPC3YxpWQEWxb7k8PZh64ERC
	h3gYQh6Hh33PyHqVcfZnuwTb/06UMqrOCkKQp07OqpTEKosijSCRkThZXPdNY765CKR4
	wGNDjh2FNq429xI6Z6pBMeMi7IbknfbW3gLS8mgqVraO7YW69S+6LR8Zx7okna/iVHGN
	d23ZHh/01hgwS7MiDiZm8/f2NxvXFf/c5ib84eTu9czHeewAT1erlvzZEKcizegPXDit
	XNy2ArA/g9h+x2wI2Uaz3l4ElixL5JrZFy52quAegQ9O+qAaPHpXIH4gvgAfXUl+dah1
	RVHw==
X-Gm-Message-State: APjAAAWV85mp16zg9QE02CiJPvv+jyWodU7YQny0tTJSu0Vtu6qF+by8
	Tba8cER37IkCPyoCam4u0RwBYpfN6B1lMt4nCBPX
X-Google-Smtp-Source: APXvYqy8jWokTyif6KzOybi3pSR8WmhOtchqhgdhvt7RrSGFTqkGrmdUyolCs+vmB7F+uW4cl7gy9HWttXA8XM5+5fI=
X-Received: by 2002:a2e:1412:: with SMTP id u18mr8759792ljd.197.1558491817982; 
	Tue, 21 May 2019 19:23:37 -0700 (PDT)
MIME-Version: 1.0
References: <67828806f9d2bf0f1e98e24afa58af55c8c8678f.1557358701.git.rgb@redhat.com>
In-Reply-To: <67828806f9d2bf0f1e98e24afa58af55c8c8678f.1557358701.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 21 May 2019 22:23:27 -0400
Message-ID: <CAHC9VhQ2X_iVO658JP5GgUy8rsr_LnqeJNeQTiWKnQxaCUUFKw@mail.gmail.com>
Subject: Re: [PATCH ghak111 V2] audit: deliver signal_info regarless of syscall
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 22 May 2019 02:23:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Wed, 22 May 2019 02:23:40 +0000 (UTC) for IP:'209.85.208.193'
	DOMAIN:'mail-lj1-f193.google.com'
	HELO:'mail-lj1-f193.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.321  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.193 mail-lj1-f193.google.com 209.85.208.193
	mail-lj1-f193.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
Cc: LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	ebiederm@xmission.com, oleg@redhat.com, Eric Paris <eparis@parisplace.org>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Wed, 22 May 2019 02:26:47 +0000 (UTC)

On Fri, May 10, 2019 at 12:22 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> When a process signals the audit daemon (shutdown, rotate, resume,
> reconfig) but syscall auditing is not enabled, we still want to know the
> identity of the process sending the signal to the audit daemon.
>
> Move audit_signal_info() out of syscall auditing to general auditing but
> create a new function audit_signal_info_syscall() to take care of the
> syscall dependent parts for when syscall auditing is enabled.
>
> Please see the github kernel audit issue
> https://github.com/linux-audit/audit-kernel/issues/111
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
> Changelog:
> v2:
> - change patch title to avoid siginfo_t confusion
> - change return value to "0" from AUDIT_OFF
> - use dummy functions instead of macros in header files
>
> Compile/boot/test auditsyscall enable/disable, audit disable,
> auditsyscall enable/selinux disable.
>
>  include/linux/audit.h |  9 +++++++++
>  kernel/audit.c        | 27 +++++++++++++++++++++++++++
>  kernel/audit.h        |  8 ++++++--
>  kernel/auditsc.c      | 19 +++----------------
>  kernel/signal.c       |  2 +-
>  5 files changed, 46 insertions(+), 19 deletions(-)

Merged into audit/next, thanks.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
