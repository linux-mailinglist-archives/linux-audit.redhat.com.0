Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C62A6BC36
	for <lists+linux-audit@lfdr.de>; Wed, 17 Jul 2019 14:24:24 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 258DC300CB25;
	Wed, 17 Jul 2019 12:24:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 469055C21A;
	Wed, 17 Jul 2019 12:24:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 20C514E58F;
	Wed, 17 Jul 2019 12:24:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6HCOE3N005674 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 17 Jul 2019 08:24:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 590145C232; Wed, 17 Jul 2019 12:24:14 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 53E4A5C21A
	for <linux-audit@redhat.com>; Wed, 17 Jul 2019 12:24:12 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
	[209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E50F5C18B2CC
	for <linux-audit@redhat.com>; Wed, 17 Jul 2019 12:24:10 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id 16so23399871ljv.10
	for <linux-audit@redhat.com>; Wed, 17 Jul 2019 05:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6fjmRWh4VVEeFFvGgt+lgp6jp51UPEMlzWuwbTO9L4k=;
	b=AuJH/e1LFAc1bhlTsCyC5vYc/VAs1BB76cesc7PDTepSuPXorBnlxTjEUA92NDBC+t
	Fj898AMwRlAEq/q5cAVczqgqCdJClWEteoSRDttCZJlt3DYFwtlwiyVT8qZ64qfKtff0
	bhBE9gNjqgX+dv5vJ/IdUFihc5FAcOqXWNxzUdp4SDNukxySNWzFoEJtsCLBQJar4Dlb
	vSbMReVbphpmAKR3vejVVHdLjpaAs28phWM3V2iMLt/f9p9+TpK/DBEA0nk7fbhOHa26
	11ructPEEN1B8N1K4g/NpZQDXQOoGPkoSD3Inu6z3rAkQpIqk/z3uBUuzRodMFHWq9xU
	CPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6fjmRWh4VVEeFFvGgt+lgp6jp51UPEMlzWuwbTO9L4k=;
	b=cOidV5UhvxjlltluYJg0tScHefqxm+UXdyslQn8MrUxUM+icinOnYbdpbkCGJ3gjfz
	vBCaUCQmZZtpQqRjtcIxSD2WQ85je8Ri7IpYZcFT0cj6WRyQ7a/iu7DVOHnk8DsbUisx
	Z/8PvgnmofhbvMF1whqfONjoEnYKE64YC8nrqO7gsEzCkF7sryDv/9g56pjgoz39eewX
	vaWagzF+8p2V07DbtqMFMBvqx9AQcQcNwynT+88brVGpeKdfu0uHK2Ao9UJ1UmAICRLw
	1DQjHHQwk2XRuaSQKyoVPSIiyWrwupPcwC4p9wueD4p3tvFac4mLqcSH26SwpVoqZvvD
	gz9w==
X-Gm-Message-State: APjAAAUv4vra5zeQFO3ksBque7rO7Mqo7QY37m+DyDignIsnFD0laLUa
	y5bBgh0UNl24sj09CRahSJ9Ny1u5bLUxQNEvyQ==
X-Google-Smtp-Source: APXvYqz+uZDCqnc/wZtJVW6dbWEGdaaWNRkbT/+omtUxB5Tj1/fPQfWmrZtkcbzIrsgyqLq4GzdlH97S4aocUKJUANc=
X-Received: by 2002:a2e:3807:: with SMTP id f7mr7467552lja.87.1563366249173;
	Wed, 17 Jul 2019 05:24:09 -0700 (PDT)
MIME-Version: 1.0
References: <f824828c-5c9d-b91e-5cec-70ee7a45e760@schaufler-ca.com>
	<d1a237d3-4b72-48b0-27d6-fb168354ad31@schaufler-ca.com>
	<CAHC9VhTQLihNQ1iGjJB=LAn=C6BQokFsjsRcj8O_O9AjqQ7HBg@mail.gmail.com>
	<2517266.eHZzEmjMsX@x2>
	<CAHC9VhS-WGuKYzG5AU01BN8tk8nzp+7qxk7Sz-hbHQGL+UXOfg@mail.gmail.com>
	<alpine.LRH.2.21.1907171435200.2314@namei.org>
In-Reply-To: <alpine.LRH.2.21.1907171435200.2314@namei.org>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 17 Jul 2019 08:23:57 -0400
Message-ID: <CAHC9VhQA9iCbk2F35i9qjP5G8SP_jzMzduwxJcj4wH7fbR1kDw@mail.gmail.com>
Subject: Re: Preferred subj= with multiple LSMs
To: James Morris <jmorris@namei.org>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 17 Jul 2019 12:24:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Wed, 17 Jul 2019 12:24:11 +0000 (UTC) for IP:'209.85.208.180'
	DOMAIN:'mail-lj1-f180.google.com'
	HELO:'mail-lj1-f180.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.002  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_NONE) 209.85.208.180 mail-lj1-f180.google.com 209.85.208.180
	mail-lj1-f180.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>,
	Linux Security Module list <linux-security-module@vger.kernel.org>,
	"linux-audit@redhat.com" <linux-audit@redhat.com>
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Wed, 17 Jul 2019 12:24:22 +0000 (UTC)

On Wed, Jul 17, 2019 at 12:36 AM James Morris <jmorris@namei.org> wrote:
> On Tue, 16 Jul 2019, Paul Moore wrote:
>
> > The subj_X approach is still backwards compatible, the difference is
> > that old versions of the tools get a "?" for the LSM creds which is a
> > rather sane way of indicating something is different.
>
> This will still break existing userspace, right?  We can't do that.

Trust me, I don't want to break userspace, I wouldn't be suggesting that.

The subj_X approach would cause userspace to see a "?" for the LSM
creds when looking at logs from a stacked-LSM system.  I would argue
this is actually safer than the multiplexed approach as "?" is a safe
sentinel used by the audit subsystem when the value can't be
determined; the multiplexed label in the hands of legacy userspace
tools would be confusing at best, and misleading at worst.

> > Once again, I believe that the subj_X approach is going to be faster
> > than safely parsing the multiplexed format.
>
> What about emitting one audit record for each LSM?

In many of the LSM generated audit events that is what would happen,
and should just work.  What we've been discussing in all the cases
where the audit event is generated outside the context of the LSM but
the LSM credentials are still desirable bits of information.  While we
are definitely going in the direction of making multiple record events
more common, duplicating the same record, with only changes to the LSM
creds, may end up confusing Steve's tools.  It would also end up
bloating the audit log, which I know is something everyone wants to
avoid.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
