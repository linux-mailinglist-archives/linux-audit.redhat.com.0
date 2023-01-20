Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A621675D1E
	for <lists+linux-audit@lfdr.de>; Fri, 20 Jan 2023 19:53:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674240788;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PH6KmpOO24N6tKw/GVGmEMZk5uQOmhiXs1QwgcCWmlI=;
	b=GbnFqy9jbxwhb+OxcPS534ioEdFy+5k6w3eGkTvowqL36qoPV3Qyy6f87milvmLtzBeKlQ
	UjFUuRiJ2nrJU8A9bO+TMBKos0pZgT6T4un/Iw/J27DQr239cPcCSFqhG4sXoSqFzilFy8
	aN/qRj4TW4SDwtH5Olj9jL156353AMs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-379-7Vf6thx5NYOakr7KWFiozw-1; Fri, 20 Jan 2023 13:53:06 -0500
X-MC-Unique: 7Vf6thx5NYOakr7KWFiozw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 684CD101B450;
	Fri, 20 Jan 2023 18:53:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CED5B492C3C;
	Fri, 20 Jan 2023 18:52:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A3F2A1946A77;
	Fri, 20 Jan 2023 18:52:52 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 03EE21946588 for <linux-audit@listman.corp.redhat.com>;
 Fri, 20 Jan 2023 18:52:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C47AD4221F; Fri, 20 Jan 2023 18:52:51 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BBAAF53AA
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 18:52:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94F6C88606A
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 18:52:51 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-668-CZZ_yLQ4Mu6P64X6R7qUug-2; Fri, 20 Jan 2023 13:52:49 -0500
X-MC-Unique: CZZ_yLQ4Mu6P64X6R7qUug-2
Received: by mail-pg1-f181.google.com with SMTP id f3so4835886pgc.2
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 10:52:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FPfy+reM6AKfPj+P9Rafnu4Ibypa0LESref2+wODD18=;
 b=UDHQArO2WhoC+y0pNVoohibv7822NMG5FSwpk6qMoc/dYmXixOoKYfIXwNBmOwdCej
 A6l/E4f8Y9JARQX3pyicxG6n1v+TBfbrUKytXPMZbhSBHkxFpI8sfAwUeiScgVxV2JMm
 5CWtJHpCi/5anKzHM9BJTsNmeX/eLkNLCPQBT7re5Ae4UfeWBfQtr1LrcLKLedx8+k1t
 hhTeIZpggYbAJj9hKa7dS3MMhfHwM986JR9DyPMygKHXXriidZikP6wCXPkiXoRa58rP
 9cdOesQd7rsDq3rxdv0vFBe2wYEMXJyh4Am7XZXX6c4kr1vO/Qt6kFSI5Kv8kZrM5HOD
 4juQ==
X-Gm-Message-State: AFqh2kpSFLSvmLI8fhvvzKE69S5d24cIKv4+HArU6T1EaogB7ncD0Z7s
 zv2g1/xUHhpFmF5uH3yFKgmp075eIob97RIUZVKW
X-Google-Smtp-Source: AMrXdXv6XdC27v9Qt7fHt//RR9OOqJAxF6QqxrildvdTUbBXmQAvsFo9EGfhk/9ydU1jbeskiocoXCzAHBK0epOqvSo=
X-Received: by 2002:a05:6a00:f07:b0:577:62a8:f7a1 with SMTP id
 cr7-20020a056a000f0700b0057762a8f7a1mr1561601pfb.2.1674240769040; Fri, 20 Jan
 2023 10:52:49 -0800 (PST)
MIME-Version: 1.0
References: <cover.1673989212.git.rgb@redhat.com>
 <82aba376bfbb9927ab7146e8e2dee8d844a31dc2.1673989212.git.rgb@redhat.com>
 <5680172.DvuYhMxLoT@x2>
In-Reply-To: <5680172.DvuYhMxLoT@x2>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 20 Jan 2023 13:52:37 -0500
Message-ID: <CAHC9VhQbSCxmSbLFJZidAr952uHt-KktfRRJN3Lr+uDSCzHtfQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] fanotify,audit: Allow audit to use the full
 permission event response
To: Steve Grubb <sgrubb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
Cc: Jan Kara <jack@suse.cz>, Richard Guy Briggs <rgb@redhat.com>,
 linux-api@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux-Audit Mailing List <linux-audit@redhat.com>,
 linux-fsdevel@vger.kernel.org, Eric Paris <eparis@parisplace.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 18, 2023 at 1:34 PM Steve Grubb <sgrubb@redhat.com> wrote:
>
> Hello Richard,
>
> I built a new kernel and tested this with old and new user space. It is
> working as advertised. The only thing I'm wondering about is why we have 3F
> as the default value when no additional info was sent? Would it be better to
> just make it 0?

...

> On Tuesday, January 17, 2023 4:14:07 PM EST Richard Guy Briggs wrote:
> > diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> > index d1fb821de104..3133c4175c15 100644
> > --- a/kernel/auditsc.c
> > +++ b/kernel/auditsc.c
> > @@ -2877,10 +2878,19 @@ void __audit_log_kern_module(char *name)
> >       context->type = AUDIT_KERN_MODULE;
> >  }
> >
> > -void __audit_fanotify(u32 response)
> > +void __audit_fanotify(u32 response, struct
> > fanotify_response_info_audit_rule *friar) {
> > -     audit_log(audit_context(), GFP_KERNEL,
> > -             AUDIT_FANOTIFY, "resp=%u", response);
> > +     /* {subj,obj}_trust values are {0,1,2}: no,yes,unknown */
> > +     if (friar->hdr.type == FAN_RESPONSE_INFO_NONE) {
> > +             audit_log(audit_context(), GFP_KERNEL, AUDIT_FANOTIFY,
> > +                       "resp=%u fan_type=%u fan_info=3F subj_trust=2
> obj_trust=2",
> > +                       response, FAN_RESPONSE_INFO_NONE);
> > +             return;
> > +     }

(I'm working under the assumption that the "fan_info=3F" in the record
above is what Steve was referring to in his comment.)

I vaguely recall Richard commenting on this in the past, although
maybe not ... my thought is that the "3F" is simply the hex encoded
"?" character in ASCII ('man 7 ascii' is your friend).  I suppose the
question is what to do in the FAN_RESPONSE_INFO_NONE case.

Historically when we had a missing field we would follow the "field=?"
pattern, but I don't recall doing that for a field which was
potentially hex encoded, is there an existing case where we use "?"
for a field that is hex encoded?  If so, we can swap out the "3F" for
a more obvious "?".

However, another option might be to simply output the current
AUDIT_FANOTIFY record format in the FAN_RESPONSE_INFO_NONE case, e.g.
only "resp=%u".  This is a little against the usual guidance of
"fields should not disappear from a record", but considering that
userspace will always need to support the original resp-only format
for compatibility reasons this may be an option.

--
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

