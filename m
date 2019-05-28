Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF0A2D16B
	for <lists+linux-audit@lfdr.de>; Wed, 29 May 2019 00:22:50 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3DD1630833AF;
	Tue, 28 May 2019 22:22:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0CF55D9CC;
	Tue, 28 May 2019 22:22:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BEDFA206D2;
	Tue, 28 May 2019 22:22:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4SMMc6J032332 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 28 May 2019 18:22:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A59FD5D9CC; Tue, 28 May 2019 22:22:38 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-16.phx2.redhat.com [10.3.112.16])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C88A5DD92;
	Tue, 28 May 2019 22:22:31 +0000 (UTC)
Date: Tue, 28 May 2019 18:22:28 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak114 V1] audit: enforce op for string fields
Message-ID: <20190528222228.uaexdwummj64ndof@madcap2.tricolour.ca>
References: <2fd85f3efc5a8816483497a84c1e031ee56d4ebf.1558553100.git.rgb@redhat.com>
	<CAHC9VhQ09UQV+mg4HRhMuWFV+7sX_XqhwPMpfO2oUTSD4Bup+A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHC9VhQ09UQV+mg4HRhMuWFV+7sX_XqhwPMpfO2oUTSD4Bup+A@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Tue, 28 May 2019 22:22:49 +0000 (UTC)

On 2019-05-28 18:00, Paul Moore wrote:
> On Wed, May 22, 2019 at 5:52 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> >
> > The field operator is ignored on several string fields.  WATCH, DIR,
> > PERM and FILETYPE field operators are completely ignored and meaningless
> > since the op is not referenced in audit_filter_rules().  Range and
> > bitwise operators are already addressed in ghak73.
> >
> > Honour the operator for WATCH, DIR, PERM, FILETYPE fields as is done in
> > the EXE field.
> >
> > Please see github issue
> > https://github.com/linux-audit/audit-kernel/issues/114
> > ---
> >  kernel/auditsc.c | 18 +++++++++++++++---
> >  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> While the patch looks fine, it is missing your sign-off.  If you reply
> to this thread with it, I'll go ahead and add to the patch when
> merging.

GHAK!  Sorry about that!

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>

It passed checkpatch.pl when that code was in the ghak73 patch.  :-)

> I'm sure everyone is tired of hearing me complain about people not
> checking their patches, but this is something that would have been
> caught by running ./scripts/checkpatch.pl against your patch (the
> entire patch, not just the code portion).  If you aren't running your
> full patch through checkpatch already, it is easy to do (there are
> likely other ways too, these are just the two that I use):
> 
> * using git
> # git format-patch --stdout -1 <commit_id> | ./scripts/checkpatch.pl -
> 
> * using stgit (my favorite)
> # stg export -s <patch> | ./scripts/checkpatch.pl -

Nice, it even works for a series...

> > diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> > index 30aa07b0115f..087137d341a2 100644
> > --- a/kernel/auditsc.c
> > +++ b/kernel/auditsc.c
> > @@ -601,12 +601,20 @@ static int audit_filter_rules(struct task_struct *tsk,
> >                         }
> >                         break;
> >                 case AUDIT_WATCH:
> > -                       if (name)
> > -                               result = audit_watch_compare(rule->watch, name->ino, name->dev);
> > +                       if (name) {
> > +                               result = audit_watch_compare(rule->watch,
> > +                                                            name->ino,
> > +                                                            name->dev);
> > +                               if (f->op == Audit_not_equal)
> > +                                       result = !result;
> > +                       }
> >                         break;
> >                 case AUDIT_DIR:
> > -                       if (ctx)
> > +                       if (ctx) {
> >                                 result = match_tree_refs(ctx, rule->tree);
> > +                               if (f->op == Audit_not_equal)
> > +                                       result = !result;
> > +                       }
> >                         break;
> >                 case AUDIT_LOGINUID:
> >                         result = audit_uid_comparator(audit_get_loginuid(tsk),
> > @@ -684,9 +692,13 @@ static int audit_filter_rules(struct task_struct *tsk,
> >                         break;
> >                 case AUDIT_PERM:
> >                         result = audit_match_perm(ctx, f->val);
> > +                       if (f->op == Audit_not_equal)
> > +                               result = !result;
> >                         break;
> >                 case AUDIT_FILETYPE:
> >                         result = audit_match_filetype(ctx, f->val);
> > +                       if (f->op == Audit_not_equal)
> > +                               result = !result;
> >                         break;
> >                 case AUDIT_FIELD_COMPARE:
> >                         result = audit_field_compare(tsk, cred, f, ctx, name);
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
