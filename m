Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AE82FDF6
	for <lists+linux-audit@lfdr.de>; Thu, 30 May 2019 16:35:41 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EA69D8553B;
	Thu, 30 May 2019 14:35:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B5940611A1;
	Thu, 30 May 2019 14:35:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C55C11806B0F;
	Thu, 30 May 2019 14:35:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4UEZDwo025660 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 30 May 2019 10:35:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0A8201973B; Thu, 30 May 2019 14:35:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0511F808B
	for <linux-audit@redhat.com>; Thu, 30 May 2019 14:35:10 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 60BF6E3E08
	for <linux-audit@redhat.com>; Thu, 30 May 2019 14:35:02 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id a9so3802879lff.7
	for <linux-audit@redhat.com>; Thu, 30 May 2019 07:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BnDbzkkNEs3+qCAYM6PlcBSJ9muruAbc6zh0yrmMscI=;
	b=GWJCSp8Ea5nLSw4PQsmUexLPU9ilEqisyppKzq55gGe0EXTU1gK81I2OupZcNpEfBp
	FEt6cP3ID92EWi+7AOnBYGA0Ks7kMMHmIwuCOXSTnoWyt9G0QUg/qPKTyCr++U1Vj81z
	OBD9bVbRccfpHrJSutlT+QxN7HGtO6iu7CDa5SLnoPR89ac3mi2LAiNOoxPv0PDN/hp4
	l40+0DaiA/QQzBIUYu0FZHnaSsQni3VmtD1j1Ni4uJrquQC2ecy5KN+HQxdP9IoLrIqB
	NQaPK9NrzK6KSr1mQCUVyOMXunHba1wxDCzenzD+grV8InLlZw+DV7yqW3qc0uFM5f2z
	aTnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BnDbzkkNEs3+qCAYM6PlcBSJ9muruAbc6zh0yrmMscI=;
	b=db78Sy3LEpcJ9Ic8FSjpSBlonFNOsd+lBDg/UxX4SydAKSNcFRkg9kTH9GDTd474SF
	BzKO/IZwR3tWIWuYWujKnGwoQ3hKJPn1yPXFW+jwm6bP5z69unEH4QMOlbPsTQFuE/Gz
	qqazmycmWYVF1W9MN8XKiZjZGIHZ9kHHbKem7UZ0Oebz0EMlr1O/vwR3wZLRKu8RBOX9
	1pQ5L10aJ+V1wmVEFYyVlyinrorBsxCKbFYVUh7JJvYOgbyPltwM1t/k+qEliP08ig66
	q7suXKKhcv3sN4mDTJ9uGXs0QdYk7BMYyAiQq50NufVz3A9LLaw9nIkqjdL71sbp9fiI
	oxhg==
X-Gm-Message-State: APjAAAW24eoykCjUIui5+ozI1jSDAgGx5yA7J01Esbaf/DQDT7BAfhEF
	kO76CMb7/10SUOruE6GmlY4vq3GTJ/HKywQnkED2
X-Google-Smtp-Source: APXvYqwHC8RbjMH6lxvVIhsAzDm3HE9/Eadxhwf+Gs4Sub/2cYfUPJHXYxbbG9TWyQTvzlhVlUcV6s1iN4J/NfvvlRg=
X-Received: by 2002:ac2:410a:: with SMTP id b10mr2250887lfi.175.1559226900658; 
	Thu, 30 May 2019 07:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1554732921.git.rgb@redhat.com>
	<0785ee2644804f3ec6af1243cc0dcf89709c1fd4.1554732921.git.rgb@redhat.com>
	<CAHC9VhRV-0LSEcRvPO1uXtKdpEQsaLZnBV3T=zcMTZPN5ugz5w@mail.gmail.com>
	<20190530141951.iofimovrndap4npq@madcap2.tricolour.ca>
In-Reply-To: <20190530141951.iofimovrndap4npq@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 30 May 2019 10:34:49 -0400
Message-ID: <CAHC9VhQhkzCtVOXhPL7BzaqvF0y+8gBQwhOo1EQDS2OUyZbV5g@mail.gmail.com>
Subject: Re: [PATCH ghak90 V6 08/10] audit: add containerid filtering
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 30 May 2019 14:35:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Thu, 30 May 2019 14:35:02 +0000 (UTC) for IP:'209.85.167.68'
	DOMAIN:'mail-lf1-f68.google.com' HELO:'mail-lf1-f68.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.305  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_NONE) 209.85.167.68 mail-lf1-f68.google.com 209.85.167.68
	mail-lf1-f68.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, Serge Hallyn <serge@hallyn.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Thu, 30 May 2019 14:35:40 +0000 (UTC)

On Thu, May 30, 2019 at 10:20 AM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> On 2019-05-29 18:16, Paul Moore wrote:
> > On Mon, Apr 8, 2019 at 11:41 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > >
> > > Implement audit container identifier filtering using the AUDIT_CONTID
> > > field name to send an 8-character string representing a u64 since the
> > > value field is only u32.
> > >
> > > Sending it as two u32 was considered, but gathering and comparing two
> > > fields was more complex.
> > >
> > > The feature indicator is AUDIT_FEATURE_BITMAP_CONTAINERID.
> > >
> > > Please see the github audit kernel issue for the contid filter feature:
> > >   https://github.com/linux-audit/audit-kernel/issues/91
> > > Please see the github audit userspace issue for filter additions:
> > >   https://github.com/linux-audit/audit-userspace/issues/40
> > > Please see the github audit testsuiite issue for the test case:
> > >   https://github.com/linux-audit/audit-testsuite/issues/64
> > > Please see the github audit wiki for the feature overview:
> > >   https://github.com/linux-audit/audit-kernel/wiki/RFE-Audit-Container-ID
> > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > Acked-by: Serge Hallyn <serge@hallyn.com>
> > > Acked-by: Neil Horman <nhorman@tuxdriver.com>
> > > Reviewed-by: Ondrej Mosnacek <omosnace@redhat.com>
> > > ---
> > >  include/linux/audit.h      |  1 +
> > >  include/uapi/linux/audit.h |  5 ++++-
> > >  kernel/audit.h             |  1 +
> > >  kernel/auditfilter.c       | 47 ++++++++++++++++++++++++++++++++++++++++++++++
> > >  kernel/auditsc.c           |  4 ++++
> > >  5 files changed, 57 insertions(+), 1 deletion(-)
> >
> > ...
> >
> > > diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
> > > index 63f8b3f26fab..407b5bb3b4c6 100644
> > > --- a/kernel/auditfilter.c
> > > +++ b/kernel/auditfilter.c
> > > @@ -1206,6 +1224,31 @@ int audit_comparator(u32 left, u32 op, u32 right)
> > >         }
> > >  }
> > >
> > > +int audit_comparator64(u64 left, u32 op, u64 right)
> > > +{
> > > +       switch (op) {
> > > +       case Audit_equal:
> > > +               return (left == right);
> > > +       case Audit_not_equal:
> > > +               return (left != right);
> > > +       case Audit_lt:
> > > +               return (left < right);
> > > +       case Audit_le:
> > > +               return (left <= right);
> > > +       case Audit_gt:
> > > +               return (left > right);
> > > +       case Audit_ge:
> > > +               return (left >= right);
> > > +       case Audit_bitmask:
> > > +               return (left & right);
> > > +       case Audit_bittest:
> > > +               return ((left & right) == right);
> > > +       default:
> > > +               BUG();
> >
> > A little birdy mentioned the BUG() here as a potential issue and while
> > I had ignored it in earlier patches because this is likely a
> > cut-n-paste from another audit comparator function, I took a closer
> > look this time.  It appears as though we will never have an invalid op
> > value as audit_data_to_entry()/audit_to_op() ensure that the op value
> > is a a known good value.  Removing the BUG() from all the audit
> > comparators is a separate issue, but I think it would be good to
> > remove it from this newly added comparator; keeping it so that we
> > return "0" in the default case seems reasoanble.
>
> Fair enough.  That BUG(); can be removed.

Please send a fixup patch for this.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
