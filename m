Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 24A7E247B8C
	for <lists+linux-audit@lfdr.de>; Tue, 18 Aug 2020 02:39:13 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-kPpuM6dFMLyzw7WPzkI5xw-1; Mon, 17 Aug 2020 20:39:07 -0400
X-MC-Unique: kPpuM6dFMLyzw7WPzkI5xw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB3C4100CEC1;
	Tue, 18 Aug 2020 00:39:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D49E07D901;
	Tue, 18 Aug 2020 00:38:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2C8D959CCD;
	Tue, 18 Aug 2020 00:38:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07I0cXEX004343 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 17 Aug 2020 20:38:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 381CC2166BDB; Tue, 18 Aug 2020 00:38:33 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 340C12166BCC
	for <linux-audit@redhat.com>; Tue, 18 Aug 2020 00:38:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 383CC800BED
	for <linux-audit@redhat.com>; Tue, 18 Aug 2020 00:38:30 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
	[209.85.218.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-568-lbr8rztXNJyorUTTznTIEA-1; Mon, 17 Aug 2020 20:38:25 -0400
X-MC-Unique: lbr8rztXNJyorUTTznTIEA-1
Received: by mail-ej1-f68.google.com with SMTP id f24so20003559ejx.6
	for <linux-audit@redhat.com>; Mon, 17 Aug 2020 17:38:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=llLDdslF9VJQ+TYHo8ll+MktUpA631YAS7CkJsS+nq8=;
	b=o0CNwDE3BkNashWnHtPmanVhgs5lyn0bIODixgTL0ErRlgBE5GUb4/0afp5qoGnhk3
	c6qhQM4wDrYok9YwU89wAXgkmGIhaNMdOIin54pvmgYJz2wEfqe7OhZ3nrWaN60EWmXM
	pZIy0kb2fNBLz9VAdNwL0hFFutB4AstZTeQllQrfj2DTlznsVyMm3vuQIskfWuB5OeqC
	/HgcQcMm1CqJQjJywDzYvIorb8+rXxlcsDlzzsB2Jp69coOD3+YLitsWt71YcZLJvZEz
	gGW8dF0lVJCKzh5f0Zun7ftauHzGAsi2HEoaqxqC6A2qBBuToI4lPX/EhuWv2vzpk4sg
	2wig==
X-Gm-Message-State: AOAM533tnjUC3yCc5anXPKHOgyflhy4UHE+E61ibciOpDb+Pbd2n9GXm
	jXyHrczIIjgLVsU18V/yio3Ng3pHsG4FRBCpcayo
X-Google-Smtp-Source: ABdhPJxD/WHhrRHYPJ7Z6bI5LpRYeokjFbmCu3YWL+lFCVHWHiC3mpb/U0Y3UJuJEW5i0MrlwMBf6u3gwyMLyrvfIvs=
X-Received: by 2002:a17:906:990c:: with SMTP id
	zl12mr17327397ejb.488.1597711104381; 
	Mon, 17 Aug 2020 17:38:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200803123439.83400-1-jbi.octave@gmail.com>
	<20200803123439.83400-2-jbi.octave@gmail.com>
	<CAHC9VhR1-=veLYGeRiF9MAi3QxrGy_z-q+B1DD9t-foPPRJmbA@mail.gmail.com>
In-Reply-To: <CAHC9VhR1-=veLYGeRiF9MAi3QxrGy_z-q+B1DD9t-foPPRJmbA@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 17 Aug 2020 20:38:13 -0400
Message-ID: <CAHC9VhQNZkEa-PmhCDu8mGW8AV0UkA5-Qxh_FGPu+hAcH=tK0Q@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 6, 2020 at 2:33 PM Paul Moore <paul@paul-moore.com> wrote:
>
> On Mon, Aug 3, 2020 at 8:35 AM Jules Irenge <jbi.octave@gmail.com> wrote:
> >
> > Variables sig_pid, audit_sig_uid and audit_sig_sid
> > are only used in the audit.c file across the kernel
> > Hence it appears no reason for declaring them as globals
> > This patch removes their global declarations from the .h file
> > and change them into static in the .c file.
> >
> > Signed-off-by: Jules Irenge <jbi.octave@gmail.com>
> > ---
> >  kernel/audit.c | 6 +++---
> >  kernel/audit.h | 4 ----
> >  2 files changed, 3 insertions(+), 7 deletions(-)
>
> Thanks Jules, this looks reasonable although I'm not going to merge
> them into audit/next until after the merge window closes.  I'll send
> another reply once this has been merged.

... and I just merged this into audit/next, thanks Jules.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

