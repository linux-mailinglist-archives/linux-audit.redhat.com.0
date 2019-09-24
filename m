Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id DB077BD016
	for <lists+linux-audit@lfdr.de>; Tue, 24 Sep 2019 19:05:38 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F09AC2107;
	Tue, 24 Sep 2019 17:05:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 83F2B5C224;
	Tue, 24 Sep 2019 17:05:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 899714E58A;
	Tue, 24 Sep 2019 17:05:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8OH5Vrk004060 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 24 Sep 2019 13:05:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B2F7E1001938; Tue, 24 Sep 2019 17:05:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ACE4110016EB
	for <linux-audit@redhat.com>; Tue, 24 Sep 2019 17:05:29 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BF40430603AD
	for <linux-audit@redhat.com>; Tue, 24 Sep 2019 17:05:27 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id 72so1983356lfh.6
	for <linux-audit@redhat.com>; Tue, 24 Sep 2019 10:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PaeMc0t03cIGJW3QCybDKTEg7Rhlae4QY/t/oXRSyF0=;
	b=QFv1USPh0kNsLjLCn6KDhZ6GOehlhwbx8pj60BxT28JgW2JJ44jJTWI4aSbCVZ1+9x
	2hKmXsG3n0Nit+HSF3mYHiJrQFCZYU5Ve499Mh9JNJGgh8WI4FggQdw++ycae7dGiYA/
	NY8tdPd5Lelka6KQay8aA2D1A7cQqQGDeERsv9nP+/dTWoaDccrq879qpoyqKX6kZRRU
	L0YWSkYOjDI+c5Y+Gq4bpfqpw/XKcyFHOysPAHeawHOxw1TziWokzSMnObU86E5vKgxt
	76UQ/7F+YB0AlT1ZggGhdG/TnKNvgjCR+g940FQhBJI0WO/AKqsraEuFB9Lca3sGpxCk
	8EIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PaeMc0t03cIGJW3QCybDKTEg7Rhlae4QY/t/oXRSyF0=;
	b=g+22IsQA+YKRd/4pVUKg7l6EnXmSxt4t2+EVDcZj/Wod/0HOLp3UBZyJ/MtZ8WB+Uc
	6p4oyid4l97MMI3m6L5F53zWx+h28Nn1fpkweq/igEX5sssGrknpFLNm/TQ1IpCQKom9
	ZMJ0aSUXVKblRTxR/oKB/c9c4n3r2bJQPK7eHLj+EKCpei0HSa8qmsq2Z3Z40KkmXTm4
	Ncq0fMgVTEyF4KZK86m+8GM1Unv6VkX41SyX8UO9QDcwyJTbGBeYM3yZuu6ZWC6LV7BC
	cD05hIYVpu2JYxuHg9M0VgAEt1zREnfYc+d3MA4NBm7j2HJCfFqIAQfzOEtLntYKDOaX
	ko9Q==
X-Gm-Message-State: APjAAAVaZwdQ91mZuhCur1U848/8xSNryBmBOajy8vaHNQAoork7SQR0
	8WqK46CUZSuTecS4sLmdTfPVAEmrClPwWrzhs45/
X-Google-Smtp-Source: APXvYqyN6rw64HRkgk116h9YMOpjw6jDzCAtHpygQSi32MgcWW+ZtK165buWD1NgGcFaWBKPKMI7oh+sxiUsfzQZgIo=
X-Received: by 2002:a19:6517:: with SMTP id z23mr2345791lfb.31.1569344725960; 
	Tue, 24 Sep 2019 10:05:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190923155041.GA14807@codemonkey.org.uk>
	<CAHC9VhTyz7fd+iQaymVXUGFe3ZA5Z_WkJeY_snDYiZ9GP6gCOA@mail.gmail.com>
	<20190923210021.5vfc2fo4wopennj5@madcap2.tricolour.ca>
	<CAHC9VhQPvS7mfmeomRLJ+SyXk=tZprSJQ9Ays3qr=+rqd=L16Q@mail.gmail.com>
	<20190924135046.kkt5hntbjpcampwr@madcap2.tricolour.ca>
In-Reply-To: <20190924135046.kkt5hntbjpcampwr@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 24 Sep 2019 13:05:14 -0400
Message-ID: <CAHC9VhTJ53OSpNDLHMMrv65NFv7MK1XQt1zXPwd7nnAPo3rG0Q@mail.gmail.com>
Subject: Re: ntp audit spew.
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Tue, 24 Sep 2019 17:05:28 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Tue, 24 Sep 2019 17:05:28 +0000 (UTC) for IP:'209.85.167.68'
	DOMAIN:'mail-lf1-f68.google.com' HELO:'mail-lf1-f68.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.167.68 mail-lf1-f68.google.com 209.85.167.68
	mail-lf1-f68.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
Cc: Dave Jones <davej@codemonkey.org.uk>, linux-audit@redhat.com,
	Linux Kernel <linux-kernel@vger.kernel.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]); Tue, 24 Sep 2019 17:05:37 +0000 (UTC)

On Tue, Sep 24, 2019 at 9:50 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2019-09-23 23:01, Paul Moore wrote:
> > On Mon, Sep 23, 2019 at 5:00 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > On 2019-09-23 12:14, Paul Moore wrote:
> > > > On Mon, Sep 23, 2019 at 11:50 AM Dave Jones <davej@codemonkey.org.uk> wrote:
> > > > >
> > > > > I have some hosts that are constantly spewing audit messages like so:
> > > > >
> > > > > [46897.591182] audit: type=1333 audit(1569250288.663:220): op=offset old=2543677901372 new=2980866217213
> > > > > [46897.591184] audit: type=1333 audit(1569250288.663:221): op=freq old=-2443166611284 new=-2436281764244
> > >
> > > Odd.  It appears these two above should have the same serial number and
> > > should be accompanied by a syscall record.  It appears that it has no
> > > context to update to connect the two records.  Is it possible it is not
> > > being called in a task context?  If that were the case though, I'd
> > > expect audit_dummy_context() to return 1...
> >
> > Yeah, I'm a little confused with these messages too.  As you pointed
> > out, the different serial numbers imply that the audit_context is NULL
> > and if the audit_context is NULL I would have expected it to fail the
> > audit_dummy_context() check in audit_ntp_log().  I'm looking at this
> > with tired eyes at the moment, so I'm likely missing something, but I
> > just don't see it right now ...
> >
> > What is even more confusing is that I don't see this issue on my test systems.
> >
> > > Checking audit_enabled should not be necessary but might fix the
> > > problem, but still not explain why we're getting these records.
> >
> > I'd like to understand why this is happening before we start changing the code.
>
> Absolutely.
>
> This looks like a similar issue to the AUDIT_NETFILTER_CFG issue where
> we get a lone record unconnected to a syscall when one of the netfilter
> table initialization (ipv4 filter) is linked into the kernel rather than
> compiled as a module, so it is run in kernel context at boot rather than
> in user context as a module load later.  This is why I ask if it is
> being run by a kernel thread rather than a user task, perhaps using a
> syscall function call internally.

I don't see where in the code that could happen, but I agree that it
looks like it; maybe I'm just missing a code path somewhere.

Is anyone else seeing these records?  Granted my audit test systems
are running chrony, not ntp, but the syscalls/behaviors should be
similar and I can't seem to recreate this.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
