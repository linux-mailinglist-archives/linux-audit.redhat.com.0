Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1EE6547BB
	for <lists+linux-audit@lfdr.de>; Thu, 22 Dec 2022 22:17:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671743838;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=z9nKorEc2SUHzWFRWbxhfI24B4T3d6zkmUZkfcjkxDQ=;
	b=RUsGSrPciFRDhS14VaeoMo0aANUDDde7h0XFCYhUnjY/SPXld11+s/wryplO+xoI5m+/fW
	qqi1FtAvZdA1v8/Q5WDWKhEstW+fLYOi9QO3RLJPFCU5NXXd56R482L5t5j6yya+j6BJMw
	ogiClfgR+BPS3WAz3rdkGgO/3xAw7r0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-292-J_l4C23AOG-DuL1bg6xfVw-1; Thu, 22 Dec 2022 16:17:16 -0500
X-MC-Unique: J_l4C23AOG-DuL1bg6xfVw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 36FE880D0EB;
	Thu, 22 Dec 2022 21:17:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DBBE8400D79E;
	Thu, 22 Dec 2022 21:17:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7FAAF1946A40;
	Thu, 22 Dec 2022 21:17:14 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2AB0019465B1 for <linux-audit@listman.corp.redhat.com>;
 Thu, 22 Dec 2022 21:17:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EEB83492B02; Thu, 22 Dec 2022 21:17:12 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E63C6492B00
 for <linux-audit@redhat.com>; Thu, 22 Dec 2022 21:17:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8AF1101A521
 for <linux-audit@redhat.com>; Thu, 22 Dec 2022 21:17:12 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-253-6rtJeIqOMYyyMgEBaPe8Sg-1; Thu, 22 Dec 2022 16:17:11 -0500
X-MC-Unique: 6rtJeIqOMYyyMgEBaPe8Sg-1
Received: by mail-pg1-f172.google.com with SMTP id r18so2100147pgr.12
 for <linux-audit@redhat.com>; Thu, 22 Dec 2022 13:17:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DKGYCzvkrRQsG26exGSDsGM12AW8tkADFj8h5RB+A30=;
 b=d9XhIZKvUbyXQxq6i0+9Pp+onQfaJ8Kgk5VTmRcLaHiWcSET4xSOl1YqLqFhSQpfQC
 cCO5DwccA6Na7569Fg5TXWr+Q4s00IBymJHbHRDftrBTusWAOVSyhivnHrdUWgYrQSzx
 XGH1AE/uUdrGOXUv11b+E4jaklT9e3ev699gBjRJ3zP024pJJpt5piYufDYwLJ51Rj8N
 PIXNDsz1W2HByaM/RIrmF5/3P7i1QRL1wFXgsUnlcHKPOgRJD+WOS3Qby52YlucCt3qI
 cfEoZTqffIfJyknwQKBL7om/cx+g4u4AdKQqonrK1yyc3N99VwVgsy0GUlfc3m+0BDKu
 7xog==
X-Gm-Message-State: AFqh2kq44K7SgG2HkZG2UamOIcfRh/bCgwy/e7srTOtygaP1Re7MxjYE
 m5dqXKscfXmYpDPpmeweRUKzMikIPiadRmcRwJIV
X-Google-Smtp-Source: AMrXdXutQGBOBCQtEo6BWJnU2LinVPQY1YK1lmJoTJgmHaEQzUCCjkTLfrnDcRjCZNzga7g8tnUcuDgqK3DL5+HgtFo=
X-Received: by 2002:aa7:924d:0:b0:577:62a8:f7a1 with SMTP id
 13-20020aa7924d000000b0057762a8f7a1mr454916pfp.2.1671743829956; Thu, 22 Dec
 2022 13:17:09 -0800 (PST)
MIME-Version: 1.0
References: <cover.1670606054.git.rgb@redhat.com>
 <79fcf72ea442eeede53ed5e6de567f8df8ef7d83.1670606054.git.rgb@redhat.com>
 <CAHC9VhQont7=S9pvTpLUmxVSj-g-j2ZhVCLiUki69vtp8rf-9A@mail.gmail.com>
 <Y6TBL7+W7Q1lYc9Q@madcap2.tricolour.ca>
In-Reply-To: <Y6TBL7+W7Q1lYc9Q@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 22 Dec 2022 16:16:58 -0500
Message-ID: <CAHC9VhQ6Nn2DuO-w3OtMj3rrtPp+X5ULYpZW8wLTakK9sMrs0g@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] fanotify,audit: Allow audit to use the full
 permission event response
To: Richard Guy Briggs <rgb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 22, 2022 at 3:42 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2022-12-20 18:31, Paul Moore wrote:
> > On Mon, Dec 12, 2022 at 9:06 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> > >
> > > This patch passes the full response so that the audit function can use all
> > > of it. The audit function was updated to log the additional information in
> > > the AUDIT_FANOTIFY record.
> > >
> > > Currently the only type of fanotify info that is defined is an audit
> > > rule number, but convert it to hex encoding to future-proof the field.
> > > Hex encoding suggested by Paul Moore <paul@paul-moore.com>.
> > >
> > > Sample records:
> > >   type=FANOTIFY msg=audit(1600385147.372:590): resp=2 fan_type=1 fan_info=3137 subj_trust=3 obj_trust=5
> > >   type=FANOTIFY msg=audit(1659730979.839:284): resp=1 fan_type=0 fan_info=3F subj_trust=2 obj_trust=2
> > >
> > > Suggested-by: Steve Grubb <sgrubb@redhat.com>
> > > Link: https://lore.kernel.org/r/3075502.aeNJFYEL58@x2
> > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > ---
> > >  fs/notify/fanotify/fanotify.c |  3 ++-
> > >  include/linux/audit.h         |  9 +++++----
> > >  kernel/auditsc.c              | 25 ++++++++++++++++++++++---
> > >  3 files changed, 29 insertions(+), 8 deletions(-)
> >
> > ...
> >
> > > diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> > > index d1fb821de104..8d523066d81f 100644
> > > --- a/kernel/auditsc.c
> > > +++ b/kernel/auditsc.c
> > > @@ -64,6 +64,7 @@
> > >  #include <uapi/linux/limits.h>
> > >  #include <uapi/linux/netfilter/nf_tables.h>
> > >  #include <uapi/linux/openat2.h> // struct open_how
> > > +#include <uapi/linux/fanotify.h>
> > >
> > >  #include "audit.h"
> > >
> > > @@ -2877,10 +2878,28 @@ void __audit_log_kern_module(char *name)
> > >         context->type = AUDIT_KERN_MODULE;
> > >  }
> > >
> > > -void __audit_fanotify(u32 response)
> > > +void __audit_fanotify(u32 response, struct fanotify_response_info_audit_rule *friar)
> > >  {
> > > -       audit_log(audit_context(), GFP_KERNEL,
> > > -               AUDIT_FANOTIFY, "resp=%u", response);
> > > +       struct audit_context *ctx = audit_context();
> > > +       struct audit_buffer *ab;
> > > +       char numbuf[12];
> > > +
> > > +       if (friar->hdr.type == FAN_RESPONSE_INFO_NONE) {
> > > +               audit_log(audit_context(), GFP_KERNEL, AUDIT_FANOTIFY,
> > > +                         "resp=%u fan_type=%u fan_info=3F subj_trust=2 obj_trust=2",
> > > +                         response, FAN_RESPONSE_INFO_NONE);
> >
> > The fan_info, subj_trust, and obj_trust constant values used here are
> > awfully magic-numbery and not the usual sentinel values one might
> > expect for a "none" operation, e.g. zeros/INT_MAX/etc. I believe a
> > comment here explaining the values would be a good idea.
>
> Ack.  I'll add a comment.  I would have preferred zero for default of
> unset, but Steve requested 0/1/2 no/yes/unknown.

Yeah, if they were zeros I don't think we would need to comment on
them as zeros for unset/unknown/invalid is rather common, 2 ... not so
much.

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

