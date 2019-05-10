Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FA41A14A
	for <lists+linux-audit@lfdr.de>; Fri, 10 May 2019 18:20:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6263085376;
	Fri, 10 May 2019 16:20:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 133E01779C;
	Fri, 10 May 2019 16:20:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7D26118089CB;
	Fri, 10 May 2019 16:20:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4AGKlcM003897 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 10 May 2019 12:20:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 677841001E74; Fri, 10 May 2019 16:20:47 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 61B711001E6E
	for <linux-audit@redhat.com>; Fri, 10 May 2019 16:20:45 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EDACB3091749
	for <linux-audit@redhat.com>; Fri, 10 May 2019 16:20:43 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id z5so5568363lji.10
	for <linux-audit@redhat.com>; Fri, 10 May 2019 09:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wh7BxD7HWXZlOtb3dsBpGQoQGbcploPnL3D3Gn56CLc=;
	b=klQN4lJcliYhOR+8aIJuNFMpyDA/jylcOPw72HtsK1ElXojQpyzozkaUbe8Up5pjNj
	0kueLgATZEnr6y6flTF/uo8u+ogwwpJRCPf1l1cqK8jpp4iFXmxhJjgJh+EaC8b5n0Zd
	K6e7Ucq+RU0uyVwRNQQvd5WtdyeiEIVb0cXbzOHFjXOOQB0HhQSQYwtsbOZucQh8k5o/
	2SmCWxPGIVeQjqIojc4F81pBO0wQnDXU1lO6IrKzVfEDDO7tocuGZmBPiYBXuf8ACJis
	sBb34gjJIVNw1De7BTHe0bIKHsrfyX9txCACNlFNorzdZd8cMTVK9A06tKMDz1ATK214
	sBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wh7BxD7HWXZlOtb3dsBpGQoQGbcploPnL3D3Gn56CLc=;
	b=QU7i2v/G+m3YRdUGrL2H8y8N9p0ejiniNlFBq4N3jUWuZ6v+O1evHDs7B4jMvhoOXM
	uezfwMRdhqdDoegygxokQ+ku8rMF89VBpEyzYiQVyEWEZG1Sz55IWh+buA9ZX91JnaN5
	FRFqe4rGdAxKwUrgn2L3l22bn0xRanhVbNG3ZR1e7oXeA5AdR6Rq2mXp1+2J+mntoVyx
	MagV4WHL5sSmB1fGTJHe/I+oYcpNz6mfgUaqaK9jkJ2kNVfJQzhXCwbS0Yf3qf9pNcTU
	JHk2ZuoSpX8RUnrUjKwk1pVrANmFezj78PHgemXUKsoFxFKFRKL/EBdm1APgj4QkhMX1
	6+RQ==
X-Gm-Message-State: APjAAAXi14kP/d9YrEva0NOjiIPzLCw3VlSEr8pI8xR32dDe0iFlQYJp
	rIMBw/ABgvSP49CSMspTN9NsTUH7lAVul6NqkxtM
X-Google-Smtp-Source: APXvYqyebjHk27jFUHURiiNs5ihNeWDe5K9suANBru/UROeXyZBk+0bup758riwP/ejgjBuEfYjPqRuvjbH4IgNbpeg=
X-Received: by 2002:a2e:4743:: with SMTP id u64mr6491661lja.57.1557505242151; 
	Fri, 10 May 2019 09:20:42 -0700 (PDT)
MIME-Version: 1.0
References: <875429973aa2d4d5d54de195b2233f70fed8553c.1557409253.git.rgb@redhat.com>
	<CAHC9VhTqDjh+CnVZFbtThfp9pyE+4tUOFEKyu0Dwu67-MmL5Rw@mail.gmail.com>
	<20190510161551.h4sxqqmpsb7xjvzh@madcap2.tricolour.ca>
In-Reply-To: <20190510161551.h4sxqqmpsb7xjvzh@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 10 May 2019 12:20:31 -0400
Message-ID: <CAHC9VhQ5nK=Dhy=YgcGZaHrg1rqHY6P=nVPTTVo602UwBuT-hg@mail.gmail.com>
Subject: Re: [PATCH ghak64 V3] audit: add saddr_fam filter field
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Fri, 10 May 2019 16:20:44 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Fri, 10 May 2019 16:20:44 +0000 (UTC) for IP:'209.85.208.194'
	DOMAIN:'mail-lj1-f194.google.com'
	HELO:'mail-lj1-f194.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.011  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2) 209.85.208.194
	mail-lj1-f194.google.com 209.85.208.194
	mail-lj1-f194.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Fri, 10 May 2019 16:20:54 +0000 (UTC)

On Fri, May 10, 2019 at 12:16 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2019-05-10 11:28, Paul Moore wrote:
> > On Thu, May 9, 2019 at 8:02 PM Richard Guy Briggs <rgb@redhat.com> wrote:
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
> > > v3:
> > > - eliminate AF_UNSPEC check
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
> > > index 5beb2244d5ba..df8a7d6184dc 100644
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
> > > +               if (f->val >= AF_MAX)
> > > +                       return -EINVAL;
> > > +               break;
> >
> > The f->val check looks better, thank you.  However, I just noticed
> > that it appears you've added two AUDIT_SADDR_FAM cases to the switch
> > statement?
>
> They are in seperate switch statements that depend on the ghak73
> refactoring patch to separate out field/op validity from a few value
> checks.

Okay.  For future reference, if you are posting a patch that is based
on another patch that is *not* in either Linus' master branch or the
audit/next branch, it should be posted with it's other dependencies in
a single patchset.  Please don't repost this patch, but keep this in
mind for the future.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
