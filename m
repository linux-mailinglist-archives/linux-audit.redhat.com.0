Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D4FFE56
	for <lists+linux-audit@lfdr.de>; Tue, 30 Apr 2019 19:03:02 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0F15E821F3;
	Tue, 30 Apr 2019 17:02:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8288B10027BD;
	Tue, 30 Apr 2019 17:02:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DA64F18089CB;
	Tue, 30 Apr 2019 17:02:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3UH1fJU013307 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 30 Apr 2019 13:01:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EC01762495; Tue, 30 Apr 2019 17:01:41 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-16.phx2.redhat.com [10.3.112.16])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 304506249B;
	Tue, 30 Apr 2019 17:01:34 +0000 (UTC)
Date: Tue, 30 Apr 2019 13:01:32 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak64 V1] audit: add saddr_fam filter field
Message-ID: <20190430170132.qhdnryr4mjtyc4fp@madcap2.tricolour.ca>
References: <cdfe08c120ddf24429a6fc90c995284aa173f818.1556297772.git.rgb@redhat.com>
	<CAHC9VhRykfjMpTpCSwX9bL1CX6cCxqd=qnr5xximj8v_k4Y9ug@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHC9VhRykfjMpTpCSwX9bL1CX6cCxqd=qnr5xximj8v_k4Y9ug@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Tue, 30 Apr 2019 17:03:00 +0000 (UTC)

On 2019-04-27 10:09, Paul Moore wrote:
> On Fri, Apr 26, 2019 at 1:00 PM Richard Guy Briggs <rgb@redhat.com> wrote:
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
> > Please see the github issue
> > https://github.com/linux-audit/audit-kernel/issues/64
> > Please see the github issue for the accompanying userspace support
> > https://github.com/linux-audit/audit-userspace/issues/93
> >
> > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > ---
> >  include/uapi/linux/audit.h | 1 +
> >  kernel/auditfilter.c       | 6 ++----
> >  kernel/auditsc.c           | 5 +++++
> >  3 files changed, 8 insertions(+), 4 deletions(-)
> 
> In general -rc6 is getting late for things that touch include/uapi,
> but that shouldn't be news.  I also don't see any references here, or
> in the GitHub issue, regarding new/modified tests, but I'm sure you
> are also aware of that and are working on something (I hope anyway).

Please don't let this distract you from other patchsets already posted.

I have a test procedure that I used to verify this is in fact working,
but I'm still thinking about how to automate it (to remove the rule
add/delete events) to check it is properly filtering out any other
events which is the whole purpose of this feature.

> Beyond that, looking at the patch below it seems like there is an
> obvious omission regarding validating the address families; some
> updates to audit_field_valid() to verify that the specified address
> family is greater than AF_UNSPEC and less than AF_MAX would be good to
> have.

I thought of that and as you can see had added it to the userspace code
that accompanies it.  There isn't really any harm to allow it to go
outside those address family limits if someone really wants to do that.

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
> > index 2c3c2f349b23..f4bb8e61a54b 100644
> > --- a/kernel/auditfilter.c
> > +++ b/kernel/auditfilter.c
> > @@ -410,6 +410,8 @@ static int audit_field_valid(struct audit_entry *entry, struct audit_field *f)
> >         /* FALL THROUGH */
> >         case AUDIT_ARCH:
> >         case AUDIT_FSTYPE:
> > +       case AUDIT_EXE:
> > +       case AUDIT_SADDR_FAM:
> >                 if (f->op != Audit_not_equal && f->op != Audit_equal)
> >                         return -EINVAL;
> >                 break;
> > @@ -425,10 +427,6 @@ static int audit_field_valid(struct audit_entry *entry, struct audit_field *f)
> >                 if (f->val > AUDIT_MAX_FIELD_COMPARE)
> >                         return -EINVAL;
> >                 break;
> > -       case AUDIT_EXE:
> > -               if (f->op != Audit_not_equal && f->op != Audit_equal)
> > -                       return -EINVAL;
> > -               break;
> >         }
> >         return 0;
> >  }
> > diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> > index 5371b59bde36..0a830f67ca7a 100644
> > --- a/kernel/auditsc.c
> > +++ b/kernel/auditsc.c
> > @@ -615,6 +615,11 @@ static int audit_filter_rules(struct task_struct *tsk,
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
> > --
> > 1.8.3.1
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
