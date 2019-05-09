Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CD00418366
	for <lists+linux-audit@lfdr.de>; Thu,  9 May 2019 03:54:44 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4BE933091755;
	Thu,  9 May 2019 01:54:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A0ABC19729;
	Thu,  9 May 2019 01:54:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8079641F56;
	Thu,  9 May 2019 01:54:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x491qam5032463 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 8 May 2019 21:52:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3830460C93; Thu,  9 May 2019 01:52:36 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-16.phx2.redhat.com [10.3.112.16])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ACF0460BFB;
	Thu,  9 May 2019 01:52:29 +0000 (UTC)
Date: Wed, 8 May 2019 21:52:26 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak64 V2] audit: add saddr_fam filter field
Message-ID: <20190509015226.qribqdkuknm4hwnc@madcap2.tricolour.ca>
References: <bf0d3fc2728cc4ec29aa684d08efdf6d71d185c4.1557330804.git.rgb@redhat.com>
	<CAHC9VhQTVO4nPxY-R4aOghBhJe3jPBQTgfgBk8PfPSnp-wrsqw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHC9VhQTVO4nPxY-R4aOghBhJe3jPBQTgfgBk8PfPSnp-wrsqw@mail.gmail.com>
User-Agent: NeoMutt/20180716
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Thu, 09 May 2019 01:54:43 +0000 (UTC)

On 2019-05-08 18:05, Paul Moore wrote:
> On Wed, May 8, 2019 at 12:46 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> >
> > Provide a method to filter out sockaddr and bind calls by network
> > address family.
> >
> > Existing SOCKADDR records are listed for any network activity.
> > Implement the AUDIT_SADDR_FAM field selector to be able to classify or
> > limit records to specific network address families, such as AF_INET or
> > AF_INET6.
> >
> > An example of a network record that is unlikely to be useful and flood
> > the logs:
> >
> > type=SOCKADDR msg=audit(07/27/2017 12:18:27.019:845) : saddr={ fam=local
> > path=/var/run/nscd/socket }
> > type=SYSCALL msg=audit(07/27/2017 12:18:27.019:845) : arch=x86_64
> > syscall=connect success=no exit=ENOENT(No such file or directory) a0=0x3
> > a1=0x7fff229c4980 a2=0x6e a3=0x6 items=1 ppid=3301 pid=6145 auid=sgrubb
> > uid=sgrubb gid=sgrubb euid=sgrubb suid=sgrubb fsuid=sgrubb egid=sgrubb
> > sgid=sgrubb fsgid=sgrubb tty=pts3 ses=4 comm=bash exe=/usr/bin/bash
> > subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
> > key=network-test
> >
> > Please see the audit-testsuite PR at
> > https://github.com/linux-audit/audit-testsuite/pull/87
> > Please see the github issue
> > https://github.com/linux-audit/audit-kernel/issues/64
> > Please see the github issue for the accompanying userspace support
> > https://github.com/linux-audit/audit-userspace/issues/93
> >
> > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > ---
> > Changelog:
> > v2:
> > - rebase on ghak73 v2
> > - check for valid range of saddr_fam value
> >
> >  include/uapi/linux/audit.h | 1 +
> >  kernel/auditfilter.c       | 5 +++++
> >  kernel/auditsc.c           | 5 +++++
> >  3 files changed, 11 insertions(+)
> >
> > diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
> > index a1280af20336..c89c6495983d 100644
> > --- a/include/uapi/linux/audit.h
> > +++ b/include/uapi/linux/audit.h
> > @@ -281,6 +281,7 @@
> >  #define AUDIT_OBJ_GID  110
> >  #define AUDIT_FIELD_COMPARE    111
> >  #define AUDIT_EXE      112
> > +#define AUDIT_SADDR_FAM        113
> >
> >  #define AUDIT_ARG0      200
> >  #define AUDIT_ARG1      (AUDIT_ARG0+1)
> > diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
> > index 5beb2244d5ba..4c897281beb8 100644
> > --- a/kernel/auditfilter.c
> > +++ b/kernel/auditfilter.c
> > @@ -387,6 +387,7 @@ static int audit_field_valid(struct audit_entry *entry, struct audit_field *f)
> >         case AUDIT_SUCCESS:
> >         case AUDIT_INODE:
> >         case AUDIT_SESSIONID:
> > +       case AUDIT_SADDR_FAM:
> >                 /* bit ops are only useful on syscall args */
> >                 if (f->op == Audit_bitmask || f->op == Audit_bittest)
> >                         return -EINVAL;
> > @@ -438,6 +439,10 @@ static int audit_field_valid(struct audit_entry *entry, struct audit_field *f)
> >                 if (f->val > AUDIT_MAX_FIELD_COMPARE)
> >                         return -EINVAL;
> >                 break;
> > +       case AUDIT_SADDR_FAM:
> > +               if (f->val <= AF_UNSPEC || f->val >= AF_MAX)
> 
> AF_UNSPEC is a valid address family for some operations, and while I'm
> not sure what value there is in an auditing these events, we should
> allow it.  It's also worth noting that f->val is an unsigned value so
> we are never going to see a value less than AF_UNSPEC/0.  This is why
> on your earlier patch I only talked about AF_MAX and not AF_UNSPEC.

On reflection, I agree about the unsigned nature of f->val.  I'm also prepared
to allow AF_UNSPEC/0.

However, I'm having trouble reconciling your last sentence with the
previous thread in which you explicitly mention AF_UNSPEC and sanity
checks related to it:  (Am I losing it, or misunderstanding?)

Subject: Re: [PATCH ghak64 V1] audit: add saddr_fam filter field
On Tue, 30 Apr 2019 13:37:41 -0400, Paul Moore <paul@paul-moore.com> wrote:
> On Tue, Apr 30, 2019 at 1:01 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > On 2019-04-27 10:09, Paul Moore wrote:
> > > Beyond that, looking at the patch below it seems like there is an
> > > obvious omission regarding validating the address families; some
> > > updates to audit_field_valid() to verify that the specified address
> > > family is greater than AF_UNSPEC and less than AF_MAX would be good to
> > > have.
> >
> > I thought of that and as you can see had added it to the userspace code
> > that accompanies it.  There isn't really any harm to allow it to go
> > outside those address family limits if someone really wants to do that.
> 
> I see it as a usability issue.  In general terms, we shouldn't allow
> admins to add a nonsense filter rule to the kernel, and we shouldn't
> rely on the userspace to catch everything.


> paul moore

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
