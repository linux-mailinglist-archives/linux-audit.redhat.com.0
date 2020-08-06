Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id B69F023E07E
	for <lists+linux-audit@lfdr.de>; Thu,  6 Aug 2020 20:36:46 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-JJEtDJJ-NfWyzk_3AJwnqQ-1; Thu, 06 Aug 2020 14:36:42 -0400
X-MC-Unique: JJEtDJJ-NfWyzk_3AJwnqQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D8B8D8E64;
	Thu,  6 Aug 2020 18:36:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 75BD387A4D;
	Thu,  6 Aug 2020 18:36:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C78029693D;
	Thu,  6 Aug 2020 18:36:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 076IY7n5007294 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 14:34:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 954DF208DD80; Thu,  6 Aug 2020 18:34:07 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 90FFD208DD83
	for <linux-audit@redhat.com>; Thu,  6 Aug 2020 18:34:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ECF28805F51
	for <linux-audit@redhat.com>; Thu,  6 Aug 2020 18:34:04 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
	[209.85.218.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-357-5qjjby-XOFSmZbauGY12iQ-1; Thu, 06 Aug 2020 14:34:00 -0400
X-MC-Unique: 5qjjby-XOFSmZbauGY12iQ-1
Received: by mail-ej1-f66.google.com with SMTP id c16so31010109ejx.12
	for <linux-audit@redhat.com>; Thu, 06 Aug 2020 11:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6Lwo0h1UUt/TkFfE8EDJeJnCBcomQmQ6I+GLf07iiXg=;
	b=UUz4pmvtTKqeTklqGOZvFav2VTLqbwFj68LpeHwQvFxI5fNxgVZxtwyVlP08k2cMZ/
	5l677toWVaX9IRA/5VyIW7hlhHtEfWnmyRRYoIDcmzOij5ChbH3U7VA+5U4RQGaxkr1G
	Fjs7F4yRaEk1up4lxnTXkVIBYivpf5Fxs1z1MvB8Oi+yJW5MFMI+YwdbX++M+i1D0XL9
	aB/UksYd4KP0cWRQq6+Ygopw1nIpwDbbYuDIyQ3hY9RnHd9JtNxniaZVOntI6n3n1I3g
	xrhatpkuNJdvdA/CyLIzi6KVpypDcZDQAtKywEHddCazaVfOF84c6dgOC8VBGUHVHDNw
	OSAg==
X-Gm-Message-State: AOAM5315VPyn9lxxz5OGH72q21ikLrZlt3PIYiN83qRQ6pETc3VttAKo
	FBcPF4zUi2Z7+EHu6vEyBIbo+eeB0kLe5Xybm6WQ
X-Google-Smtp-Source: ABdhPJxMQZuQY3avDUyZx56UT2rDq0X/QFpraARHLo6LAMfX3Rh5oyf19noACgmf5bDruxn2zfaSliNFW2ds+o0adCE=
X-Received: by 2002:a17:906:1403:: with SMTP id
	p3mr5592371ejc.106.1596738839416; 
	Thu, 06 Aug 2020 11:33:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200803123439.83400-1-jbi.octave@gmail.com>
	<20200803123439.83400-2-jbi.octave@gmail.com>
In-Reply-To: <20200803123439.83400-2-jbi.octave@gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 6 Aug 2020 14:33:48 -0400
Message-ID: <CAHC9VhR1-=veLYGeRiF9MAi3QxrGy_z-q+B1DD9t-foPPRJmbA@mail.gmail.com>
Subject: Re: [RESEND PATCH 1/2] audit: change unnecessary globals into statics
To: Jules Irenge <jbi.octave@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
Cc: "moderated list:AUDIT SUBSYSTEM" <linux-audit@redhat.com>,
	linux-kernel@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Aug 3, 2020 at 8:35 AM Jules Irenge <jbi.octave@gmail.com> wrote:
>
> Variables sig_pid, audit_sig_uid and audit_sig_sid
> are only used in the audit.c file across the kernel
> Hence it appears no reason for declaring them as globals
> This patch removes their global declarations from the .h file
> and change them into static in the .c file.
>
> Signed-off-by: Jules Irenge <jbi.octave@gmail.com>
> ---
>  kernel/audit.c | 6 +++---
>  kernel/audit.h | 4 ----
>  2 files changed, 3 insertions(+), 7 deletions(-)

Thanks Jules, this looks reasonable although I'm not going to merge
them into audit/next until after the merge window closes.  I'll send
another reply once this has been merged.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

