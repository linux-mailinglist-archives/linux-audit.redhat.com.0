Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6933267BFA5
	for <lists+linux-audit@lfdr.de>; Wed, 25 Jan 2023 23:11:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674684703;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pWMiuuqaVhW6nxxosk+qrF6h0WnUNt9iw6NUOCy1wfs=;
	b=EZsvaaaM34IGhWEi0W2ohGl1Fdx3NngO3ePdlcy9RG+v1ZnMM9KsxKS5h3jNCkvQqSZLRr
	QUDPNJhkMcvE5Q9BslLXqjh2poYvcsLh6TfLZgCZ3gObxppGF/HLwVxt/G1flnJM2Y2nE7
	pSEl2VSMcFOXntc25DuxAPtkjTApjX8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-YgJmPsTlNEC2qoW_AZUk8A-1; Wed, 25 Jan 2023 17:11:41 -0500
X-MC-Unique: YgJmPsTlNEC2qoW_AZUk8A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 630B73C10247;
	Wed, 25 Jan 2023 22:11:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B99B31121330;
	Wed, 25 Jan 2023 22:11:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D8E3B19465A3;
	Wed, 25 Jan 2023 22:11:35 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 285C5194658C for <linux-audit@listman.corp.redhat.com>;
 Wed, 25 Jan 2023 22:11:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D184F14171BE; Wed, 25 Jan 2023 22:11:29 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-0-3.rdu2.redhat.com [10.22.0.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6096414171BB;
 Wed, 25 Jan 2023 22:11:28 +0000 (UTC)
Date: Wed, 25 Jan 2023 17:11:26 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v6 3/3] fanotify,audit: Allow audit to use the full
 permission event response
Message-ID: <Y9GpDpjlwBr+ZTWm@madcap2.tricolour.ca>
References: <cover.1673989212.git.rgb@redhat.com>
 <82aba376bfbb9927ab7146e8e2dee8d844a31dc2.1673989212.git.rgb@redhat.com>
 <CAHC9VhTgesdmF3-+oP-EYuNZ-8LKXGPYuSffVst_Wca5Oj0EAQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhTgesdmF3-+oP-EYuNZ-8LKXGPYuSffVst_Wca5Oj0EAQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2023-01-20 13:58, Paul Moore wrote:
> On Tue, Jan 17, 2023 at 4:14 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> >
> > This patch passes the full response so that the audit function can use all
> > of it. The audit function was updated to log the additional information in
> > the AUDIT_FANOTIFY record.
> >
> > Currently the only type of fanotify info that is defined is an audit
> > rule number, but convert it to hex encoding to future-proof the field.
> > Hex encoding suggested by Paul Moore <paul@paul-moore.com>.
> >
> > The {subj,obj}_trust values are {0,1,2}, corresponding to no, yes, unknown.
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
> >  kernel/auditsc.c              | 16 +++++++++++++---
> >  3 files changed, 20 insertions(+), 8 deletions(-)
> 
> ...
> 
> > diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> > index d1fb821de104..3133c4175c15 100644
> > --- a/kernel/auditsc.c
> > +++ b/kernel/auditsc.c
> > @@ -2877,10 +2878,19 @@ void __audit_log_kern_module(char *name)
> >         context->type = AUDIT_KERN_MODULE;
> >  }
> >
> > -void __audit_fanotify(u32 response)
> > +void __audit_fanotify(u32 response, struct fanotify_response_info_audit_rule *friar)
> >  {
> > -       audit_log(audit_context(), GFP_KERNEL,
> > -               AUDIT_FANOTIFY, "resp=%u", response);
> > +       /* {subj,obj}_trust values are {0,1,2}: no,yes,unknown */
> > +       if (friar->hdr.type == FAN_RESPONSE_INFO_NONE) {
> > +               audit_log(audit_context(), GFP_KERNEL, AUDIT_FANOTIFY,
> > +                         "resp=%u fan_type=%u fan_info=3F subj_trust=2 obj_trust=2",
> > +                         response, FAN_RESPONSE_INFO_NONE);
> > +               return;
> > +       }
> > +       audit_log(audit_context(), GFP_KERNEL, AUDIT_FANOTIFY,
> > +                 "resp=%u fan_type=%u fan_info=%X subj_trust=%u obj_trust=%u",
> > +                 response, friar->hdr.type, friar->rule_number,
> > +                 friar->subj_trust, friar->obj_trust);
> >  }
> 
> The only thing that comes to mind might be to convert the if-return
> into a switch statement to make it a bit cleaner and easier to patch
> in the future, but that is soooo far removed from any real concern
> that I debated even mentioning it.  I only bring it up in case the
> "3F" discussion results in a respin, and even then I'm not going to
> hold my ACK over something as silly as a if-return vs switch.
> 
> For clarity, this is what I was thinking:
> 
> void __audit_fanontify(...)
> {
>   switch (type) {
>   case FAN_RESPONSE_INFO_NONE:
>     audit_log(...);
>     break;
>   default:
>     audit_log(...);
>   }
> }

I agree that would be cleaner, but FAN_RESPONSE_INFO_NONE and
FAN_RESPONSE_INFO_AUDIT_RULE would be the two, with default being
ignored since they could be other types unrelated to audit.

There were a number of bits of code to future proof it in previous
versions that were questioned as necessary so they were removed...

> paul-moore.com

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

