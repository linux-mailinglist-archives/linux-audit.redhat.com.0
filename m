Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F7267BF8D
	for <lists+linux-audit@lfdr.de>; Wed, 25 Jan 2023 23:07:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674684433;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kWcbPCUDQYjAlHpL9YUHytmmzyWAZFPfG8NbHK0lraI=;
	b=OwRXtx2SD2LvnfkXVOcuZ84IeNFNwyAOri90boJbXtEFCrtNBGOeOKVqqbWa5sdeBUKnUt
	5Deb3MzPVnG+YxCfx73yyl3e5Tl22pKxpAtHQ1miu4Ddo/egFZQOWyuVc5muGFc5ehO2b/
	EfN+tflCZXgKvBc550376Ku1WgNzcxQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-440-iUQbfWsbPYCVrko_yX1syA-1; Wed, 25 Jan 2023 17:07:09 -0500
X-MC-Unique: iUQbfWsbPYCVrko_yX1syA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8CFF1823612;
	Wed, 25 Jan 2023 22:07:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BE51940C200C;
	Wed, 25 Jan 2023 22:06:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A668819465A3;
	Wed, 25 Jan 2023 22:06:43 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 301C7194658C for <linux-audit@listman.corp.redhat.com>;
 Wed, 25 Jan 2023 22:06:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 96DCB40C200E; Wed, 25 Jan 2023 22:06:41 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-0-3.rdu2.redhat.com [10.22.0.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AA4440C200C;
 Wed, 25 Jan 2023 22:06:27 +0000 (UTC)
Date: Wed, 25 Jan 2023 17:06:25 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v6 3/3] fanotify,audit: Allow audit to use the full
 permission event response
Message-ID: <Y9Gn4YmKFBot/R4l@madcap2.tricolour.ca>
References: <cover.1673989212.git.rgb@redhat.com>
 <82aba376bfbb9927ab7146e8e2dee8d844a31dc2.1673989212.git.rgb@redhat.com>
 <5680172.DvuYhMxLoT@x2>
 <CAHC9VhQbSCxmSbLFJZidAr952uHt-KktfRRJN3Lr+uDSCzHtfQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhQbSCxmSbLFJZidAr952uHt-KktfRRJN3Lr+uDSCzHtfQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2023-01-20 13:52, Paul Moore wrote:
> On Wed, Jan 18, 2023 at 1:34 PM Steve Grubb <sgrubb@redhat.com> wrote:
> > Hello Richard,
> >
> > I built a new kernel and tested this with old and new user space. It is
> > working as advertised. The only thing I'm wondering about is why we have 3F
> > as the default value when no additional info was sent? Would it be better to
> > just make it 0?
> 
> ...
> 
> > On Tuesday, January 17, 2023 4:14:07 PM EST Richard Guy Briggs wrote:
> > > diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> > > index d1fb821de104..3133c4175c15 100644
> > > --- a/kernel/auditsc.c
> > > +++ b/kernel/auditsc.c
> > > @@ -2877,10 +2878,19 @@ void __audit_log_kern_module(char *name)
> > >       context->type = AUDIT_KERN_MODULE;
> > >  }
> > >
> > > -void __audit_fanotify(u32 response)
> > > +void __audit_fanotify(u32 response, struct
> > > fanotify_response_info_audit_rule *friar) {
> > > -     audit_log(audit_context(), GFP_KERNEL,
> > > -             AUDIT_FANOTIFY, "resp=%u", response);
> > > +     /* {subj,obj}_trust values are {0,1,2}: no,yes,unknown */
> > > +     if (friar->hdr.type == FAN_RESPONSE_INFO_NONE) {
> > > +             audit_log(audit_context(), GFP_KERNEL, AUDIT_FANOTIFY,
> > > +                       "resp=%u fan_type=%u fan_info=3F subj_trust=2
> > obj_trust=2",
> > > +                       response, FAN_RESPONSE_INFO_NONE);
> > > +             return;
> > > +     }
> 
> (I'm working under the assumption that the "fan_info=3F" in the record
> above is what Steve was referring to in his comment.)
> 
> I vaguely recall Richard commenting on this in the past, although
> maybe not ... my thought is that the "3F" is simply the hex encoded
> "?" character in ASCII ('man 7 ascii' is your friend).  I suppose the
> question is what to do in the FAN_RESPONSE_INFO_NONE case.
> 
> Historically when we had a missing field we would follow the "field=?"
> pattern, but I don't recall doing that for a field which was
> potentially hex encoded, is there an existing case where we use "?"
> for a field that is hex encoded?  If so, we can swap out the "3F" for
> a more obvious "?".

I was presuming encoding the zero: "30"

> However, another option might be to simply output the current
> AUDIT_FANOTIFY record format in the FAN_RESPONSE_INFO_NONE case, e.g.
> only "resp=%u".  This is a little against the usual guidance of
> "fields should not disappear from a record", but considering that
> userspace will always need to support the original resp-only format
> for compatibility reasons this may be an option.

I don't have a strong opinion.

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

