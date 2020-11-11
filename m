Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6C3982AE687
	for <lists+linux-audit@lfdr.de>; Wed, 11 Nov 2020 03:47:53 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-44_YrlZyMQ2oWTgU4FmcHA-1; Tue, 10 Nov 2020 21:47:50 -0500
X-MC-Unique: 44_YrlZyMQ2oWTgU4FmcHA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EB1F10866BE;
	Wed, 11 Nov 2020 02:47:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AF961002C01;
	Wed, 11 Nov 2020 02:47:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5250144A43;
	Wed, 11 Nov 2020 02:47:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AB2lOxN015881 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 10 Nov 2020 21:47:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 50C682166BDD; Wed, 11 Nov 2020 02:47:24 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BD9C2166BA3
	for <linux-audit@redhat.com>; Wed, 11 Nov 2020 02:47:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E66631021F8B
	for <linux-audit@redhat.com>; Wed, 11 Nov 2020 02:47:21 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-292-LDvOXb93P8i4Nm2IWvhOVg-1; Tue, 10 Nov 2020 21:47:19 -0500
X-MC-Unique: LDvOXb93P8i4Nm2IWvhOVg-1
Received: by mail-ed1-f66.google.com with SMTP id cq7so688087edb.4
	for <linux-audit@redhat.com>; Tue, 10 Nov 2020 18:47:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4nu9R3ini0DJUYFxlXcOZoD/UHlTCD3Gyc9oHDqhMzM=;
	b=e29LjRjrR0X1E+Zciv6SLyv+mpC6yDGLH2NHqaAzb5YFssCNu9eI9XfxS01qcR0cIV
	kiDCCUsR2QQKrY2cxS7QDoGDYaiMF14i6e+5Z1AjjQwuNqNbGy/UK2srWaWJC3HCH0A9
	ZoH+uITdPMywYjicbm7BTmvpR2B36DELogb4WSmc1AzWT10+teq/OwR7A8rg6d0Hyx1U
	kxBmdwlgnUd4n2nl7TWbsQeqsJZ4lMRFuv2VwVOZ6XJFgW7OHuykvyrH8o5HtLsML6us
	AhwmovDHiCGzfa2GiIq8tZgRBtLZm78iAd2sb4+rForpKIZDaH6DDxpkE4nRCEXus/oH
	8cDQ==
X-Gm-Message-State: AOAM533xEJh7YOXBJ6S6kQAgEzyJt1KTzSSD43Qs/tB3CdJ2In5y4rcD
	1z8g9JXoCt6Xvwg3sExhGqkTq1K1F/OM9dwfwo8VWRqcDfTz
X-Google-Smtp-Source: ABdhPJw2IcHVJZiQH2el4IvKVSLlQj8IHMx0QGFJtccL5YLRLYPAJvia6xIq6JSSJ+LuVap1HHeOlNjVOaS2BkwvsNs=
X-Received: by 2002:a50:d587:: with SMTP id v7mr23364994edi.38.1605062838314; 
	Tue, 10 Nov 2020 18:47:18 -0800 (PST)
MIME-Version: 1.0
References: <1604651482-9780-1-git-send-email-alex.shi@linux.alibaba.com>
	<20201110152310.GB55411@madcap2.tricolour.ca>
In-Reply-To: <20201110152310.GB55411@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 10 Nov 2020 21:47:07 -0500
Message-ID: <CAHC9VhQiQoZh8in+zoYa5hbTN_yL-=mt7nTQFN9GAyQZ+tz-Ww@mail.gmail.com>
Subject: Re: [PATCH] audit: remove unused macros
To: Alex Shi <alex.shi@linux.alibaba.com>
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
Cc: Richard Guy Briggs <rgb@redhat.com>, linux-audit@redhat.com,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 10, 2020 at 10:23 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-11-06 16:31, Alex Shi wrote:
> > Some unused macros could cause gcc warning:
> > kernel/audit.c:68:0: warning: macro "AUDIT_UNINITIALIZED" is not used
> > [-Wunused-macros]
> > kernel/auditsc.c:104:0: warning: macro "AUDIT_AUX_IPCPERM" is not used
> > [-Wunused-macros]
> > kernel/auditsc.c:82:0: warning: macro "AUDITSC_INVALID" is not used
> > [-Wunused-macros]
> >
> > remove them to tame gcc.
> >
> > Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
> > Cc: Paul Moore <paul@paul-moore.com>
> > Cc: Eric Paris <eparis@redhat.com>
> > Cc: linux-audit@redhat.com
> > Cc: linux-kernel@vger.kernel.org
> > ---
> >  kernel/audit.c   | 1 -
> >  kernel/auditsc.c | 3 ---
> >  2 files changed, 4 deletions(-)
> >
> > diff --git a/kernel/audit.c b/kernel/audit.c
> > index ac0aeaa99937..dfac1e0ca887 100644
> > --- a/kernel/audit.c
> > +++ b/kernel/audit.c
> > @@ -65,7 +65,6 @@
> >  /* No auditing will take place until audit_initialized == AUDIT_INITIALIZED.
> >   * (Initialization happens after skb_init is called.) */
> >  #define AUDIT_DISABLED               -1
> > -#define AUDIT_UNINITIALIZED  0
> >  #define AUDIT_INITIALIZED    1
> >  static int   audit_initialized;
>
> This one is part of a set, so it feels like it should stay, but the code
> is structured in such a way that it is not necessary.

Yes, I'd like for us to find a way to keep this if possible.  Let's
simply initialize "audit_initialized" to AUDIT_UNINITIALIZED in this
file.  At some point someone will surely complain about not needing to
initialize to zero, but we can deal with that later.

> > diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> > index 183d79cc2e12..eeb4930d499f 100644
> > --- a/kernel/auditsc.c
> > +++ b/kernel/auditsc.c
> > @@ -80,7 +80,6 @@
> >  #include "audit.h"
> >
> >  /* flags stating the success for a syscall */
> > -#define AUDITSC_INVALID 0
> >  #define AUDITSC_SUCCESS 1
> >  #define AUDITSC_FAILURE 2
>
> Same here, but this one should really be fixed by using
> AUDITSC_INVALID as the value assigned to context->return_valid in
> __audit_free() to avoid using magic numbers.

Agreed.

We could probably explicitly set it in audit_alloc_context() as well
if we wanted to be complete.

> Similarly, the compared
> values in audit_filter_rules() under the AUDIT_EXIT and AUDIT_SUCCESS
> cases should be "ctx->return_valid != AUDITSC_INVALID" rather than just
> "ctx->return_valid".  Same in audit_log_exit().

Agreed.

> > @@ -102,8 +101,6 @@ struct audit_aux_data {
> >       int                     type;
> >  };
> >
> > -#define AUDIT_AUX_IPCPERM    0
> > -
>
> Hmmm, this one looks like it was orphaned 15 years ago a couple of
> months after it was introduced due to this commit:
> c04049939f88 Steve Grubb <sgrubb@redhat.com> 2005-05-13
>     ("AUDIT: Add message types to audit records")
>
> Introduced here:
> 8e633c3fb2a2 David Woodhouse <dwmw2@shinybook.infradead.org> 2005-03-01
>     ("Audit IPC object owner/permission changes.")
>
> I agree, remove it.

No arguments from me.

--
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

