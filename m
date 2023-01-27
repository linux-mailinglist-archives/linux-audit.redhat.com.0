Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EA57F67EF6B
	for <lists+linux-audit@lfdr.de>; Fri, 27 Jan 2023 21:17:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674850668;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2V3OxYx9MiNVDKPQbbIzD1oj6JjJqNxoBbbfgaic3Iw=;
	b=hABlLB4ICzrm80QbrBuVbdJGGnankGlzBGHlKP2MxpjFG88qN5qG+ONUK4JPQT4IYohDvp
	oBnJy04HikfeoKKZyx2g/2JK5veG3VJwHX7ygT0lG6wNgPCiM+oDJjMIqM9FJ0pChuNx5X
	CcJThVOdw4K/qeYylVLmdqeYlvAS22I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-Nzkh-TPdOk6QfP4z9Pnbcg-1; Fri, 27 Jan 2023 15:17:47 -0500
X-MC-Unique: Nzkh-TPdOk6QfP4z9Pnbcg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D8A41C05156;
	Fri, 27 Jan 2023 20:17:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 97F101121318;
	Fri, 27 Jan 2023 20:17:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 053C919465A3;
	Fri, 27 Jan 2023 20:17:44 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 480B6194658C for <linux-audit@listman.corp.redhat.com>;
 Fri, 27 Jan 2023 20:17:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8911A14171C0; Fri, 27 Jan 2023 20:17:42 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.33.250])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 172D214171BE;
 Fri, 27 Jan 2023 20:17:42 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Richard Guy Briggs <rgb@redhat.com>, Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v6 3/3] fanotify,
 audit: Allow audit to use the full permission event response
Date: Fri, 27 Jan 2023 15:17:41 -0500
Message-ID: <12154220.O9o76ZdvQC@x2>
Organization: Red Hat
In-Reply-To: <CAHC9VhRWDD6Tk6AEmgoobBkcVKRYbVOte7-F0TGJD2dRk7NKxw@mail.gmail.com>
References: <cover.1673989212.git.rgb@redhat.com>
 <Y9Gn4YmKFBot/R4l@madcap2.tricolour.ca>
 <CAHC9VhRWDD6Tk6AEmgoobBkcVKRYbVOte7-F0TGJD2dRk7NKxw@mail.gmail.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Friday, January 27, 2023 3:00:37 PM EST Paul Moore wrote:
> On Wed, Jan 25, 2023 at 5:06 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > On 2023-01-20 13:52, Paul Moore wrote:
> > > On Wed, Jan 18, 2023 at 1:34 PM Steve Grubb <sgrubb@redhat.com> wrote:
> > > > Hello Richard,
> > > > 
> > > > I built a new kernel and tested this with old and new user space. It
> > > > is
> > > > working as advertised. The only thing I'm wondering about is why we
> > > > have 3F as the default value when no additional info was sent? Would
> > > > it be better to just make it 0?
> > > 
> > > ...
> > > 
> > > > On Tuesday, January 17, 2023 4:14:07 PM EST Richard Guy Briggs wrote:
> > > > > diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> > > > > index d1fb821de104..3133c4175c15 100644
> > > > > --- a/kernel/auditsc.c
> > > > > +++ b/kernel/auditsc.c
> > > > > @@ -2877,10 +2878,19 @@ void __audit_log_kern_module(char *name)
> > > > > 
> > > > >       context->type = AUDIT_KERN_MODULE;
> > > > >  
> > > > >  }
> > > > > 
> > > > > -void __audit_fanotify(u32 response)
> > > > > +void __audit_fanotify(u32 response, struct
> > > > > fanotify_response_info_audit_rule *friar) {
> > > > > -     audit_log(audit_context(), GFP_KERNEL,
> > > > > -             AUDIT_FANOTIFY, "resp=%u", response);
> > > > > +     /* {subj,obj}_trust values are {0,1,2}: no,yes,unknown */
> > > > > +     if (friar->hdr.type == FAN_RESPONSE_INFO_NONE) {
> > > > > +             audit_log(audit_context(), GFP_KERNEL,
> > > > > AUDIT_FANOTIFY,
> > > > > +                       "resp=%u fan_type=%u fan_info=3F
> > > > > subj_trust=2
> > > > 
> > > > obj_trust=2",
> > > > 
> > > > > +                       response, FAN_RESPONSE_INFO_NONE);
> > > > > +             return;
> > > > > +     }
> > > 
> > > (I'm working under the assumption that the "fan_info=3F" in the record
> > > above is what Steve was referring to in his comment.)
> > > 
> > > I vaguely recall Richard commenting on this in the past, although
> > > maybe not ... my thought is that the "3F" is simply the hex encoded
> > > "?" character in ASCII ('man 7 ascii' is your friend).  I suppose the
> > > question is what to do in the FAN_RESPONSE_INFO_NONE case.
> > > 
> > > Historically when we had a missing field we would follow the "field=?"
> > > pattern, but I don't recall doing that for a field which was
> > > potentially hex encoded, is there an existing case where we use "?"
> > > for a field that is hex encoded?  If so, we can swap out the "3F" for
> > > a more obvious "?".
> > 
> > I was presuming encoding the zero: "30"
> 
> I'm sorry, but you've lost me here.
> 
> > > However, another option might be to simply output the current
> > > AUDIT_FANOTIFY record format in the FAN_RESPONSE_INFO_NONE case, e.g.
> > > only "resp=%u".  This is a little against the usual guidance of
> > > "fields should not disappear from a record", but considering that
> > > userspace will always need to support the original resp-only format
> > > for compatibility reasons this may be an option.
> > 
> > I don't have a strong opinion.
> 
> I'm not sure I care too much either.  I will admit that the "3F" seems
> to be bordering on the "bit too clever" side of things, but it's easy
> to argue it is in keeping with the general idea of using "?" to denote
> absent/unknown fields.

The translation will be from %X to %u. In that case, someone might think 63 
has some meaning. It would be better to leave it as 0 so there's less to 
explain.

-Steve

> As Steve was the one who raised the question in this latest round, and
> he knows his userspace tools the best, it seems wise to get his input
> on this.




--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

