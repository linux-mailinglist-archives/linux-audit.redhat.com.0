Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6541A117
	for <lists+linux-audit@lfdr.de>; Fri, 10 May 2019 18:16:12 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B5D67308621F;
	Fri, 10 May 2019 16:16:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D55875D71C;
	Fri, 10 May 2019 16:16:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 17D7F18089CC;
	Fri, 10 May 2019 16:16:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4AGG0Sw003116 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 10 May 2019 12:16:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BE3CA5D71A; Fri, 10 May 2019 16:16:00 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-16.phx2.redhat.com [10.3.112.16])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B23D65D6A9;
	Fri, 10 May 2019 16:15:54 +0000 (UTC)
Date: Fri, 10 May 2019 12:15:51 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak64 V3] audit: add saddr_fam filter field
Message-ID: <20190510161551.h4sxqqmpsb7xjvzh@madcap2.tricolour.ca>
References: <875429973aa2d4d5d54de195b2233f70fed8553c.1557409253.git.rgb@redhat.com>
	<CAHC9VhTqDjh+CnVZFbtThfp9pyE+4tUOFEKyu0Dwu67-MmL5Rw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHC9VhTqDjh+CnVZFbtThfp9pyE+4tUOFEKyu0Dwu67-MmL5Rw@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Fri, 10 May 2019 16:16:11 +0000 (UTC)

On 2019-05-10 11:28, Paul Moore wrote:
> On Thu, May 9, 2019 at 8:02 PM Richard Guy Briggs <rgb@redhat.com> wrote:
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
> > v3:
> > - eliminate AF_UNSPEC check
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
> > index 5beb2244d5ba..df8a7d6184dc 100644
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
> > +               if (f->val >= AF_MAX)
> > +                       return -EINVAL;
> > +               break;
> 
> The f->val check looks better, thank you.  However, I just noticed
> that it appears you've added two AUDIT_SADDR_FAM cases to the switch
> statement?

They are in seperate switch statements that depend on the ghak73
refactoring patch to separate out field/op validity from a few value
checks.

> >         default:
> >                 break;
> >         }
> > diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> > index 4bd0ec60a0e8..aab364804b9b 100644
> > --- a/kernel/auditsc.c
> > +++ b/kernel/auditsc.c
> > @@ -623,6 +623,11 @@ static int audit_filter_rules(struct task_struct *tsk,
> >                 case AUDIT_LOGINUID_SET:
> >                         result = audit_comparator(audit_loginuid_set(tsk), f->op, f->val);
> >                         break;
> > +               case AUDIT_SADDR_FAM:
> > +                       if (ctx->sockaddr)
> > +                               result = audit_comparator(ctx->sockaddr->ss_family,
> > +                                                         f->op, f->val);
> > +                       break;
> >                 case AUDIT_SUBJ_USER:
> >                 case AUDIT_SUBJ_ROLE:
> >                 case AUDIT_SUBJ_TYPE:
> 
> -- 
> paul moore
> www.paul-moore.com

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
