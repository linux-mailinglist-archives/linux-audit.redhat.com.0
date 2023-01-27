Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BED067EF0F
	for <lists+linux-audit@lfdr.de>; Fri, 27 Jan 2023 21:02:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674849755;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ogbd/sSroKbuL1oOUPN0i28IgOxnKbDRJCpZLzq1GVs=;
	b=Tct9tRvADL2iq1On/6yxJdbjxZ/eiquzJ2L86RmHGvnq9pW7T/hur+NVenRACExxihC5GE
	P8wq+r6K7OgN30H7uEbbtw0R7IkwTHviEHbqhMSbO2NokJVswSq/xGf7LJgzP1EpK/LZU+
	xRkb6UWg+l+jbZohBh2rqlDQyql3enk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-wm9YqhoxPFO0F9LOqJKyFA-1; Fri, 27 Jan 2023 15:02:31 -0500
X-MC-Unique: wm9YqhoxPFO0F9LOqJKyFA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7AD5C3C106A3;
	Fri, 27 Jan 2023 20:02:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2540DC15BAD;
	Fri, 27 Jan 2023 20:02:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A919819465A3;
	Fri, 27 Jan 2023 20:02:28 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7F129194658C for <linux-audit@listman.corp.redhat.com>;
 Fri, 27 Jan 2023 20:02:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 72B2F492B02; Fri, 27 Jan 2023 20:02:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B7EB492B01
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 20:02:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4FF6D85A588
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 20:02:27 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-584-A1hxLuWNN1SmCFMDQRbJRQ-1; Fri, 27 Jan 2023 15:02:25 -0500
X-MC-Unique: A1hxLuWNN1SmCFMDQRbJRQ-1
Received: by mail-pg1-f169.google.com with SMTP id q9so3910271pgq.5
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 12:02:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EfpmMAjatY4kOsbY4TrkMHzBXh5/X5BJOB000E4SZn0=;
 b=qLXHnS+iJu2EqYugoFoszV9a/H9ZDztIEO4stqU82kWAtOYC2fA+g+piKPjKuMXDuO
 HKVteTlFXFeQPSC/pMGgLDE1eMaeymH7NDqt4gljGEjKHcs9jjNajvJnUJ6gILrtlbkF
 lfGt0zBDMdQpTz1wWRPp7vBGFDlS7A8qgdSv9Rf6yHyJLBX8rxJ9wxowy1EUWZqqiQ2A
 /HKFOk+mwq6bgyaIXDZR/DmonXLWNX4ouUPdn0RMecP+iyHIZDgVNO3I8ex4RGdICaA/
 mmkBQ1AkN6fPMtPlujtmHWAdbNPXnbCPq49rP/S6ORP1wNNCzDiSQcjfcnqkV+2Cnr+/
 iQ7w==
X-Gm-Message-State: AO0yUKUf7H5ykj0+ghuw1QICIojzKnm3sRtL98bAbddZN/WjHLNwBZWA
 yml4ga5n0MCWIrLYyozFavPCbbBa1Y9lOPr5l409
X-Google-Smtp-Source: AK7set9cHd9eqigM7Z80LSp1WCi5uON322QrXrpvNCrJTc0+ocBLek6mOp1j8JQUOubRBHUx4ngqoNZ2hk173uCj0yQ=
X-Received: by 2002:a62:8e0a:0:b0:592:a8af:4ffc with SMTP id
 k10-20020a628e0a000000b00592a8af4ffcmr487646pfe.52.1674849744106; Fri, 27 Jan
 2023 12:02:24 -0800 (PST)
MIME-Version: 1.0
References: <cover.1673989212.git.rgb@redhat.com>
 <82aba376bfbb9927ab7146e8e2dee8d844a31dc2.1673989212.git.rgb@redhat.com>
 <CAHC9VhTgesdmF3-+oP-EYuNZ-8LKXGPYuSffVst_Wca5Oj0EAQ@mail.gmail.com>
 <Y9GpDpjlwBr+ZTWm@madcap2.tricolour.ca>
In-Reply-To: <Y9GpDpjlwBr+ZTWm@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 27 Jan 2023 15:02:13 -0500
Message-ID: <CAHC9VhQY3zfwh_=6swUN7BWGSQdsLDxw-dbyTh6rayZq7q-x5w@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] fanotify,audit: Allow audit to use the full
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 25, 2023 at 5:11 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> On 2023-01-20 13:58, Paul Moore wrote:
> > On Tue, Jan 17, 2023 at 4:14 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > >
> > > This patch passes the full response so that the audit function can use all
> > > of it. The audit function was updated to log the additional information in
> > > the AUDIT_FANOTIFY record.
> > >
> > > Currently the only type of fanotify info that is defined is an audit
> > > rule number, but convert it to hex encoding to future-proof the field.
> > > Hex encoding suggested by Paul Moore <paul@paul-moore.com>.
> > >
> > > The {subj,obj}_trust values are {0,1,2}, corresponding to no, yes, unknown.
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
> > >  kernel/auditsc.c              | 16 +++++++++++++---
> > >  3 files changed, 20 insertions(+), 8 deletions(-)
> >
> > ...
> >
> > > diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> > > index d1fb821de104..3133c4175c15 100644
> > > --- a/kernel/auditsc.c
> > > +++ b/kernel/auditsc.c
> > > @@ -2877,10 +2878,19 @@ void __audit_log_kern_module(char *name)
> > >         context->type = AUDIT_KERN_MODULE;
> > >  }
> > >
> > > -void __audit_fanotify(u32 response)
> > > +void __audit_fanotify(u32 response, struct fanotify_response_info_audit_rule *friar)
> > >  {
> > > -       audit_log(audit_context(), GFP_KERNEL,
> > > -               AUDIT_FANOTIFY, "resp=%u", response);
> > > +       /* {subj,obj}_trust values are {0,1,2}: no,yes,unknown */
> > > +       if (friar->hdr.type == FAN_RESPONSE_INFO_NONE) {
> > > +               audit_log(audit_context(), GFP_KERNEL, AUDIT_FANOTIFY,
> > > +                         "resp=%u fan_type=%u fan_info=3F subj_trust=2 obj_trust=2",
> > > +                         response, FAN_RESPONSE_INFO_NONE);
> > > +               return;
> > > +       }
> > > +       audit_log(audit_context(), GFP_KERNEL, AUDIT_FANOTIFY,
> > > +                 "resp=%u fan_type=%u fan_info=%X subj_trust=%u obj_trust=%u",
> > > +                 response, friar->hdr.type, friar->rule_number,
> > > +                 friar->subj_trust, friar->obj_trust);
> > >  }
> >
> > The only thing that comes to mind might be to convert the if-return
> > into a switch statement to make it a bit cleaner and easier to patch
> > in the future, but that is soooo far removed from any real concern
> > that I debated even mentioning it.  I only bring it up in case the
> > "3F" discussion results in a respin, and even then I'm not going to
> > hold my ACK over something as silly as a if-return vs switch.
> >
> > For clarity, this is what I was thinking:
> >
> > void __audit_fanontify(...)
> > {
> >   switch (type) {
> >   case FAN_RESPONSE_INFO_NONE:
> >     audit_log(...);
> >     break;
> >   default:
> >     audit_log(...);
> >   }
> > }
>
> I agree that would be cleaner ...

As I said, the "3F" concern of Steve is really the only thing I would
bother respinning for, my other comments were just passing
observations.

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

