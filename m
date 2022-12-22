Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FA665476B
	for <lists+linux-audit@lfdr.de>; Thu, 22 Dec 2022 21:42:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671741760;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xQApUzHUZ2YV1JOuP82omeHTQSHzxbj4I+rWLtBT+W0=;
	b=Iwa2xBAAMN1G09OUnczyzvDzQIh+YnAh+ccfzQGoSY+7tvoewRIotPNGBiXg7NjwfgCH6f
	ZlARf1gZ8YJFbcT6BCaVgqhFfIhKUTQBTFKNEqryfVkwKZFm+SbeNFJRgZ5ptv76lgxMvW
	nBgnoiidgtYPWEe3GUw33V+0fZZ4d3U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-46-0M9Bsx9MOi6025gYYm_oqg-1; Thu, 22 Dec 2022 15:42:38 -0500
X-MC-Unique: 0M9Bsx9MOi6025gYYm_oqg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2BB2811E6E;
	Thu, 22 Dec 2022 20:42:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B374440C1074;
	Thu, 22 Dec 2022 20:42:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0097A1946A40;
	Thu, 22 Dec 2022 20:42:35 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 790A619465B1 for <linux-audit@listman.corp.redhat.com>;
 Thu, 22 Dec 2022 20:42:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F3F242166B29; Thu, 22 Dec 2022 20:42:26 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-0-3.rdu2.redhat.com [10.22.0.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 681EC2166B26;
 Thu, 22 Dec 2022 20:42:25 +0000 (UTC)
Date: Thu, 22 Dec 2022 15:42:23 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v5 3/3] fanotify,audit: Allow audit to use the full
 permission event response
Message-ID: <Y6TBL7+W7Q1lYc9Q@madcap2.tricolour.ca>
References: <cover.1670606054.git.rgb@redhat.com>
 <79fcf72ea442eeede53ed5e6de567f8df8ef7d83.1670606054.git.rgb@redhat.com>
 <CAHC9VhQont7=S9pvTpLUmxVSj-g-j2ZhVCLiUki69vtp8rf-9A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhQont7=S9pvTpLUmxVSj-g-j2ZhVCLiUki69vtp8rf-9A@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: Jan Kara <jack@suse.cz>, linux-api@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Linux-Audit Mailing List <linux-audit@redhat.com>,
 linux-fsdevel@vger.kernel.org, Eric Paris <eparis@parisplace.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2022-12-20 18:31, Paul Moore wrote:
> On Mon, Dec 12, 2022 at 9:06 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> >
> > This patch passes the full response so that the audit function can use all
> > of it. The audit function was updated to log the additional information in
> > the AUDIT_FANOTIFY record.
> >
> > Currently the only type of fanotify info that is defined is an audit
> > rule number, but convert it to hex encoding to future-proof the field.
> > Hex encoding suggested by Paul Moore <paul@paul-moore.com>.
> >
> > Sample records:
> >   type=FANOTIFY msg=audit(1600385147.372:590): resp=2 fan_type=1 fan_info=3137 subj_trust=3 obj_trust=5
> >   type=FANOTIFY msg=audit(1659730979.839:284): resp=1 fan_type=0 fan_info=3F subj_trust=2 obj_trust=2
> >
> > Suggested-by: Steve Grubb <sgrubb@redhat.com>
> > Link: https://lore.kernel.org/r/3075502.aeNJFYEL58@x2
> > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > ---
> >  fs/notify/fanotify/fanotify.c |  3 ++-
> >  include/linux/audit.h         |  9 +++++----
> >  kernel/auditsc.c              | 25 ++++++++++++++++++++++---
> >  3 files changed, 29 insertions(+), 8 deletions(-)
> 
> ...
> 
> > diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> > index d1fb821de104..8d523066d81f 100644
> > --- a/kernel/auditsc.c
> > +++ b/kernel/auditsc.c
> > @@ -64,6 +64,7 @@
> >  #include <uapi/linux/limits.h>
> >  #include <uapi/linux/netfilter/nf_tables.h>
> >  #include <uapi/linux/openat2.h> // struct open_how
> > +#include <uapi/linux/fanotify.h>
> >
> >  #include "audit.h"
> >
> > @@ -2877,10 +2878,28 @@ void __audit_log_kern_module(char *name)
> >         context->type = AUDIT_KERN_MODULE;
> >  }
> >
> > -void __audit_fanotify(u32 response)
> > +void __audit_fanotify(u32 response, struct fanotify_response_info_audit_rule *friar)
> >  {
> > -       audit_log(audit_context(), GFP_KERNEL,
> > -               AUDIT_FANOTIFY, "resp=%u", response);
> > +       struct audit_context *ctx = audit_context();
> > +       struct audit_buffer *ab;
> > +       char numbuf[12];
> > +
> > +       if (friar->hdr.type == FAN_RESPONSE_INFO_NONE) {
> > +               audit_log(audit_context(), GFP_KERNEL, AUDIT_FANOTIFY,
> > +                         "resp=%u fan_type=%u fan_info=3F subj_trust=2 obj_trust=2",
> > +                         response, FAN_RESPONSE_INFO_NONE);
> 
> The fan_info, subj_trust, and obj_trust constant values used here are
> awfully magic-numbery and not the usual sentinel values one might
> expect for a "none" operation, e.g. zeros/INT_MAX/etc. I believe a
> comment here explaining the values would be a good idea.

Ack.  I'll add a comment.  I would have preferred zero for default of
unset, but Steve requested 0/1/2 no/yes/unknown.

> > +               return;
> > +       }
> > +       ab = audit_log_start(ctx, GFP_KERNEL, AUDIT_FANOTIFY);
> > +       if (ab) {
> > +               audit_log_format(ab, "resp=%u fan_type=%u fan_info=",
> > +                                response, friar->hdr.type);
> > +               snprintf(numbuf, sizeof(numbuf), "%u", friar->rule_number);
> > +               audit_log_n_hex(ab, numbuf, sizeof(numbuf));
> 
> It looks like the kernel's printf format string parsing supports %X so
> why not just use that for now, we can always complicate it later if
> needed.  It would probably also remove the need for the @ab, @numbuf,
> and @ctx variables.  For example:
> 
> audit_log(audit_context(), GFP_KERNEL, AUDIT_FANOTIFY,
>   "resp=%u fan_type=%u fan_info=%X subj_trust=%u obj_trust=%u",
>   response, friar->hdr.type, friar->rule_number,
>   friar->subj_trust, friar->obj_trust);
> 
> Am I missing something?

No, I am.  Thank you, that's much cleaner.

> > +               audit_log_format(ab, " subj_trust=%u obj_trust=%u",
> > +                                friar->subj_trust, friar->obj_trust);
> > +               audit_log_end(ab);
> > +       }
> >  }
> >
> >  void __audit_tk_injoffset(struct timespec64 offset)
> > --
> > 2.27.0
> 
> -- 
> paul-moore.com
> 
> --
> Linux-audit mailing list
> Linux-audit@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-audit
> 

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
https://listman.redhat.com/mailman/listinfo/linux-audit

