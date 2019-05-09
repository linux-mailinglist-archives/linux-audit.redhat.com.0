Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A458618A2A
	for <lists+linux-audit@lfdr.de>; Thu,  9 May 2019 14:59:10 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 858CB308219E;
	Thu,  9 May 2019 12:59:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CAFD95D710;
	Thu,  9 May 2019 12:59:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CC64B3FB11;
	Thu,  9 May 2019 12:59:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x49CwiED023728 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 9 May 2019 08:58:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8DBB560CA8; Thu,  9 May 2019 12:58:44 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8865860FC3
	for <linux-audit@redhat.com>; Thu,  9 May 2019 12:58:42 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EF7653001800
	for <linux-audit@redhat.com>; Thu,  9 May 2019 12:58:34 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id m20so1937405lji.2
	for <linux-audit@redhat.com>; Thu, 09 May 2019 05:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JoBrrUe33WsXln807xFomTyiID0EQ53Yi4dsyBA122M=;
	b=rLmhRDxL7LWfXRSqGnjwqXqzdL2iFs+0NpM4HQRiofeCPbWtAa2VXiM2Npxfel5A9/
	tg9BFJRNshB9sLmPET2/404ta9bIyGaqSWIHQMY+4qpXlT+efzAYelCG0nzQ6YbsPsuP
	4SjAEDbgsvG9m7gg9WWvObF0fDytJHpF0sRTdVygd9zBpa/0NQg45GY07hEc2UsnDR0r
	d0Np5tABBAll32lnQYyaiTHAmldNbBF+klwxdsLr4rKTh1YNgijdI5XgqUbNc5kbBvvg
	Cp8qWEz3ptgBDIGJdBOif230kEQzXVchdujR+u8T2h3PO6rvhTpAAfP4qkC8Bw9niZBi
	wEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JoBrrUe33WsXln807xFomTyiID0EQ53Yi4dsyBA122M=;
	b=el0PBjOHi3A7mEzKeDpXGX2Z0X2SsbBs9rpPXkKPIlKznGw3tYme3x/PgF3HniyOKQ
	NP6VPbShzcgOg5tamFoNqIQFpG0s3K2TnhtltS7l+uSwhBrakh40rZeFiLpgGIPtE02N
	JcLuyiPvpTtcgDnvel7ahhhf4MmoRBW33+b4OKd1bSp4Ceq4jYfoNFWrSz91LL5BQCHS
	ipMgBC7grtGw86dCL2UdNMc593Xn6AdUX5yPYNr3pjzNn7Smx7snVUhU/2isofTzEBBB
	bWvZ0Eul5VwllL4jQTC00WMOfrouP/QOeyEQJuLaP4kw/8oROp/SwvKXJYrh2Xhduuzz
	ONDA==
X-Gm-Message-State: APjAAAUaMjGcwqyRrWB8KdOg1yP2V8LtHWpf5fyZoLV6v1s1RvektiNf
	pjptUZ+CMs+wlG0gV0CT6Qkbs/bQXTzyPXXd4ZLm
X-Google-Smtp-Source: APXvYqyIYJTd+2EqWvu/OfP6ip20oxWiC7EW7ks/LLewleecBLNYslxRnWhkBokPGLwRVlHjbc/9UNpHIAumRGINgv0=
X-Received: by 2002:a2e:4743:: with SMTP id u64mr2266466lja.57.1557406713229; 
	Thu, 09 May 2019 05:58:33 -0700 (PDT)
MIME-Version: 1.0
References: <bf0d3fc2728cc4ec29aa684d08efdf6d71d185c4.1557330804.git.rgb@redhat.com>
	<CAHC9VhQTVO4nPxY-R4aOghBhJe3jPBQTgfgBk8PfPSnp-wrsqw@mail.gmail.com>
	<20190509015226.qribqdkuknm4hwnc@madcap2.tricolour.ca>
In-Reply-To: <20190509015226.qribqdkuknm4hwnc@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 9 May 2019 08:58:22 -0400
Message-ID: <CAHC9VhTbY6W+WEtcfzcHQG=iQ8eeXXipyU3AJ+eyMhm_yy6Evg@mail.gmail.com>
Subject: Re: [PATCH ghak64 V2] audit: add saddr_fam filter field
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Thu, 09 May 2019 12:58:35 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Thu, 09 May 2019 12:58:35 +0000 (UTC) for IP:'209.85.208.195'
	DOMAIN:'mail-lj1-f195.google.com'
	HELO:'mail-lj1-f195.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.011  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2) 209.85.208.195
	mail-lj1-f195.google.com 209.85.208.195
	mail-lj1-f195.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
Cc: Linux-Audit Mailing List <linux-audit@redhat.com>,
	Eric Paris <eparis@parisplace.org>
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Thu, 09 May 2019 12:59:09 +0000 (UTC)

On Wed, May 8, 2019 at 9:52 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2019-05-08 18:05, Paul Moore wrote:
> > On Wed, May 8, 2019 at 12:46 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > >
> > > Provide a method to filter out sockaddr and bind calls by network
> > > address family.
> > >
> > > Existing SOCKADDR records are listed for any network activity.
> > > Implement the AUDIT_SADDR_FAM field selector to be able to classify or
> > > limit records to specific network address families, such as AF_INET or
> > > AF_INET6.
> > >
> > > An example of a network record that is unlikely to be useful and flood
> > > the logs:
> > >
> > > type=SOCKADDR msg=audit(07/27/2017 12:18:27.019:845) : saddr={ fam=local
> > > path=/var/run/nscd/socket }
> > > type=SYSCALL msg=audit(07/27/2017 12:18:27.019:845) : arch=x86_64
> > > syscall=connect success=no exit=ENOENT(No such file or directory) a0=0x3
> > > a1=0x7fff229c4980 a2=0x6e a3=0x6 items=1 ppid=3301 pid=6145 auid=sgrubb
> > > uid=sgrubb gid=sgrubb euid=sgrubb suid=sgrubb fsuid=sgrubb egid=sgrubb
> > > sgid=sgrubb fsgid=sgrubb tty=pts3 ses=4 comm=bash exe=/usr/bin/bash
> > > subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
> > > key=network-test
> > >
> > > Please see the audit-testsuite PR at
> > > https://github.com/linux-audit/audit-testsuite/pull/87
> > > Please see the github issue
> > > https://github.com/linux-audit/audit-kernel/issues/64
> > > Please see the github issue for the accompanying userspace support
> > > https://github.com/linux-audit/audit-userspace/issues/93
> > >
> > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > ---
> > > Changelog:
> > > v2:
> > > - rebase on ghak73 v2
> > > - check for valid range of saddr_fam value
> > >
> > >  include/uapi/linux/audit.h | 1 +
> > >  kernel/auditfilter.c       | 5 +++++
> > >  kernel/auditsc.c           | 5 +++++
> > >  3 files changed, 11 insertions(+)
> > >
> > > diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
> > > index a1280af20336..c89c6495983d 100644
> > > --- a/include/uapi/linux/audit.h
> > > +++ b/include/uapi/linux/audit.h
> > > @@ -281,6 +281,7 @@
> > >  #define AUDIT_OBJ_GID  110
> > >  #define AUDIT_FIELD_COMPARE    111
> > >  #define AUDIT_EXE      112
> > > +#define AUDIT_SADDR_FAM        113
> > >
> > >  #define AUDIT_ARG0      200
> > >  #define AUDIT_ARG1      (AUDIT_ARG0+1)
> > > diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
> > > index 5beb2244d5ba..4c897281beb8 100644
> > > --- a/kernel/auditfilter.c
> > > +++ b/kernel/auditfilter.c
> > > @@ -387,6 +387,7 @@ static int audit_field_valid(struct audit_entry *entry, struct audit_field *f)
> > >         case AUDIT_SUCCESS:
> > >         case AUDIT_INODE:
> > >         case AUDIT_SESSIONID:
> > > +       case AUDIT_SADDR_FAM:
> > >                 /* bit ops are only useful on syscall args */
> > >                 if (f->op == Audit_bitmask || f->op == Audit_bittest)
> > >                         return -EINVAL;
> > > @@ -438,6 +439,10 @@ static int audit_field_valid(struct audit_entry *entry, struct audit_field *f)
> > >                 if (f->val > AUDIT_MAX_FIELD_COMPARE)
> > >                         return -EINVAL;
> > >                 break;
> > > +       case AUDIT_SADDR_FAM:
> > > +               if (f->val <= AF_UNSPEC || f->val >= AF_MAX)
> >
> > AF_UNSPEC is a valid address family for some operations, and while I'm
> > not sure what value there is in an auditing these events, we should
> > allow it.  It's also worth noting that f->val is an unsigned value so
> > we are never going to see a value less than AF_UNSPEC/0.  This is why
> > on your earlier patch I only talked about AF_MAX and not AF_UNSPEC.
>
> On reflection, I agree about the unsigned nature of f->val.  I'm also prepared
> to allow AF_UNSPEC/0.
>
> However, I'm having trouble reconciling your last sentence with the
> previous thread in which you explicitly mention AF_UNSPEC and sanity
> checks related to it:  (Am I losing it, or misunderstanding?)

I'm not prepared to comment on your mental condition, but it appears
that I did mistakenly say that we should exclude AF_UNSPEC.  My
apologies.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
