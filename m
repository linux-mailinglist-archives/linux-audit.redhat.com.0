Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3224E67EF0A
	for <lists+linux-audit@lfdr.de>; Fri, 27 Jan 2023 21:01:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674849670;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=W/R36T7BWhiQp2/9DlBYCi/+VWXN+V+JP9vt0Rzqa14=;
	b=AAcwFpFZoL3Af9jOxooew5NXmGyIDny86Kl5ajau8CF7fuXU+4DFPqnDqZLnkIt9Flmhxy
	+NP51SAGZKDfFH7wAa+gJSBlRZ7f4f380wl9oNvHHT3Do9K0xeZenr6PiRMlcnj6aT753Z
	Hl744u6IbEYigJdCej3yzYgy1ijdR6g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-M-dOtA53Pnaig_e7jNOt5w-1; Fri, 27 Jan 2023 15:01:05 -0500
X-MC-Unique: M-dOtA53Pnaig_e7jNOt5w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 148742A59563;
	Fri, 27 Jan 2023 20:01:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8580040C945A;
	Fri, 27 Jan 2023 20:01:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D97F619465A3;
	Fri, 27 Jan 2023 20:01:01 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1DE1C194658C for <linux-audit@listman.corp.redhat.com>;
 Fri, 27 Jan 2023 20:00:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id ED6CA492B02; Fri, 27 Jan 2023 20:00:51 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E5D5B492B03
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 20:00:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA0CD85C06A
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 20:00:51 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-314-UAwthrwmO7mDPye1bpe7Ig-1; Fri, 27 Jan 2023 15:00:50 -0500
X-MC-Unique: UAwthrwmO7mDPye1bpe7Ig-1
Received: by mail-pj1-f49.google.com with SMTP id j5so5579951pjn.5
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 12:00:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=am+vlnLsg0XsWPedwqTMfueZR+oGnG7UWNBHwR8AcYc=;
 b=6W+TRwrlsiEBk0KChRbvyT75LIOND4V0wLszc2zJMpAbcw3NnkZCWirxMfwLiwkzCR
 D6MlPKB68snSWjKx6uU7Xc6k8Wmsr6TOpRTStVklZVufzttMGQnQMXdV5H30SNEoo+cM
 R7+ZJkOQ7e/umhYrSl7hy/b4yfvKPhKqURZsn9ic3x/OYV4SU2A5aRMnhzTUx/0aq93w
 y5dohUmb0H6yxHCHrar8I2tR3+4z8xv2bgDSdJQ9hm3YVk3S5ZFNqEhD6MhIN525iS2j
 KoKBRYtlLBkqzOdgQGEcXAlrQU6CvZvMYMIm71dn/pPrMwDCSTjjYz4FhE/+vRWE2g35
 4ouw==
X-Gm-Message-State: AFqh2krE+rj0c0PiloOSERCSdribOfJ0T7VJ5mCnetWXTZt+sy8eo3Ak
 sGnLSYWp/9GslfNJZyzm5EJ23y3droXqopX0wtupTgVKC5DS
X-Google-Smtp-Source: AMrXdXtgDZu6IiaCLCwfyX/1peJyGjLyCaHOG29QZFCt9RV37pAXcnEo7stUTPwkGz0Tc+B2pfdv256KSKwS87gRKSQ=
X-Received: by 2002:a17:90b:3903:b0:225:de08:b714 with SMTP id
 ob3-20020a17090b390300b00225de08b714mr4950213pjb.193.1674849648652; Fri, 27
 Jan 2023 12:00:48 -0800 (PST)
MIME-Version: 1.0
References: <cover.1673989212.git.rgb@redhat.com>
 <82aba376bfbb9927ab7146e8e2dee8d844a31dc2.1673989212.git.rgb@redhat.com>
 <5680172.DvuYhMxLoT@x2>
 <CAHC9VhQbSCxmSbLFJZidAr952uHt-KktfRRJN3Lr+uDSCzHtfQ@mail.gmail.com>
 <Y9Gn4YmKFBot/R4l@madcap2.tricolour.ca>
In-Reply-To: <Y9Gn4YmKFBot/R4l@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 27 Jan 2023 15:00:37 -0500
Message-ID: <CAHC9VhRWDD6Tk6AEmgoobBkcVKRYbVOte7-F0TGJD2dRk7NKxw@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 25, 2023 at 5:06 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2023-01-20 13:52, Paul Moore wrote:
> > On Wed, Jan 18, 2023 at 1:34 PM Steve Grubb <sgrubb@redhat.com> wrote:
> > > Hello Richard,
> > >
> > > I built a new kernel and tested this with old and new user space. It is
> > > working as advertised. The only thing I'm wondering about is why we have 3F
> > > as the default value when no additional info was sent? Would it be better to
> > > just make it 0?
> >
> > ...
> >
> > > On Tuesday, January 17, 2023 4:14:07 PM EST Richard Guy Briggs wrote:
> > > > diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> > > > index d1fb821de104..3133c4175c15 100644
> > > > --- a/kernel/auditsc.c
> > > > +++ b/kernel/auditsc.c
> > > > @@ -2877,10 +2878,19 @@ void __audit_log_kern_module(char *name)
> > > >       context->type = AUDIT_KERN_MODULE;
> > > >  }
> > > >
> > > > -void __audit_fanotify(u32 response)
> > > > +void __audit_fanotify(u32 response, struct
> > > > fanotify_response_info_audit_rule *friar) {
> > > > -     audit_log(audit_context(), GFP_KERNEL,
> > > > -             AUDIT_FANOTIFY, "resp=%u", response);
> > > > +     /* {subj,obj}_trust values are {0,1,2}: no,yes,unknown */
> > > > +     if (friar->hdr.type == FAN_RESPONSE_INFO_NONE) {
> > > > +             audit_log(audit_context(), GFP_KERNEL, AUDIT_FANOTIFY,
> > > > +                       "resp=%u fan_type=%u fan_info=3F subj_trust=2
> > > obj_trust=2",
> > > > +                       response, FAN_RESPONSE_INFO_NONE);
> > > > +             return;
> > > > +     }
> >
> > (I'm working under the assumption that the "fan_info=3F" in the record
> > above is what Steve was referring to in his comment.)
> >
> > I vaguely recall Richard commenting on this in the past, although
> > maybe not ... my thought is that the "3F" is simply the hex encoded
> > "?" character in ASCII ('man 7 ascii' is your friend).  I suppose the
> > question is what to do in the FAN_RESPONSE_INFO_NONE case.
> >
> > Historically when we had a missing field we would follow the "field=?"
> > pattern, but I don't recall doing that for a field which was
> > potentially hex encoded, is there an existing case where we use "?"
> > for a field that is hex encoded?  If so, we can swap out the "3F" for
> > a more obvious "?".
>
> I was presuming encoding the zero: "30"

I'm sorry, but you've lost me here.

> > However, another option might be to simply output the current
> > AUDIT_FANOTIFY record format in the FAN_RESPONSE_INFO_NONE case, e.g.
> > only "resp=%u".  This is a little against the usual guidance of
> > "fields should not disappear from a record", but considering that
> > userspace will always need to support the original resp-only format
> > for compatibility reasons this may be an option.
>
> I don't have a strong opinion.

I'm not sure I care too much either.  I will admit that the "3F" seems
to be bordering on the "bit too clever" side of things, but it's easy
to argue it is in keeping with the general idea of using "?" to denote
absent/unknown fields.

As Steve was the one who raised the question in this latest round, and
he knows his userspace tools the best, it seems wise to get his input
on this.

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

