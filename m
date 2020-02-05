Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id BDA0F153B85
	for <lists+linux-audit@lfdr.de>; Wed,  5 Feb 2020 23:58:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580943487;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3+346zzXBbH8+tv3lhTv1vH9nbmDZ3/sB4UxEVeLL0M=;
	b=BmnysLWMNiNOvSofUIN3zGHG68UhEMSNjKrxUNFon/S//NxsW+Rb1GL8GAXiorSw6NL0fI
	OjsUEVJFg7QD7iZo/jGi5LudcIu+o6PZbN1rNX/ZtINFfOmaILYcpbsTbwm7RSEkfuS/vI
	YcpzaBIz7EacTrpRW4RHiqFFuOVFpQQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-jZ2Gn4EHMSSC7_iOKzAdZQ-1; Wed, 05 Feb 2020 17:58:05 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6535E107BA97;
	Wed,  5 Feb 2020 22:58:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC3445C1B0;
	Wed,  5 Feb 2020 22:57:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D2B7918089CD;
	Wed,  5 Feb 2020 22:57:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 015Mv8vM028587 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 5 Feb 2020 17:57:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DF3A810A859A; Wed,  5 Feb 2020 22:57:07 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA7AB10A8594
	for <linux-audit@redhat.com>; Wed,  5 Feb 2020 22:57:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 685E28032A8
	for <linux-audit@redhat.com>; Wed,  5 Feb 2020 22:57:05 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-312-nxjLqnbpMLOsy16ctyn7wA-1; Wed, 05 Feb 2020 17:57:00 -0500
Received: by mail-ed1-f66.google.com with SMTP id r21so3896236edq.0
	for <linux-audit@redhat.com>; Wed, 05 Feb 2020 14:57:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Amzhmy9xv9aiOonSPr+eThtNwsfLtl5zGLSppwlbgNs=;
	b=EIEkW13WK5IcQ7PZd67zDalhW3dTHpRzYyk0M5Uom+SSgg4Tvoa6Q81DuzC8tx18dY
	YaiHBzkXyXkOk9sA0rDrlFpjqBWxHPQQQnI9TbVt8kJWeoks7SPIhW8vp/PRidhznkmS
	RYlxF+9erhGi1nboecZFle5NaP/pGcnUWKXSUheNLsedYOUrGXBnoI0QRTswV24QQIzq
	9Hzodk4tLOz+O2BhiNzj418KbAWswXsljULGJ8zsc9MIsFZx4x4u8M/w0nqbjxnP0jB6
	/sMTQYY7KZeRofPRi0d2e4Irm6vn1AUUAtmepl+fSjO8ePCUeeL1S4uUHGDrhPkRO0SW
	SAxA==
X-Gm-Message-State: APjAAAUxTLaYRYFzVrEZ0If0+v9wJypiF6Y9+E9KB/cHBSugMD9uRQNl
	eIVg9LQV/7A+c4lWGuPJ728NH/S/By8UY1IKm0IP
X-Google-Smtp-Source: APXvYqyinVfnH51DI0L2SrSFONQ5jPWbqu4SEEJkGSvze4nkV8Nj8TjI5cDCggcgijMU0lqRKjn1C1Mv8js0mEJYleE=
X-Received: by 2002:a17:906:19d0:: with SMTP id
	h16mr350075ejd.70.1580943419104; 
	Wed, 05 Feb 2020 14:56:59 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577736799.git.rgb@redhat.com>
	<5941671b6b6b5de28ab2cc80e72f288cf83291d5.1577736799.git.rgb@redhat.com>
	<CAHC9VhQYXQp+C0EHwLuW50yUenfH4KF1xKQdS=bn_OzHfnFmmg@mail.gmail.com>
	<20200205003930.2efpm4tvrisgmj4t@madcap2.tricolour.ca>
In-Reply-To: <20200205003930.2efpm4tvrisgmj4t@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 5 Feb 2020 17:56:48 -0500
Message-ID: <CAHC9VhSsfBbfYmqLoR=QBgF5_VwbA8Dqqz97MjqwwJ6Jq6fHwA@mail.gmail.com>
Subject: Re: [PATCH ghak90 V8 16/16] audit: add capcontid to set contid
	outside init_user_ns
To: Richard Guy Briggs <rgb@redhat.com>
X-MC-Unique: nxjLqnbpMLOsy16ctyn7wA-1
X-MC-Unique: jZ2Gn4EHMSSC7_iOKzAdZQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 015Mv8vM028587
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, mpatel@redhat.com,
	Serge Hallyn <serge@hallyn.com>
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
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 4, 2020 at 7:39 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-01-22 16:29, Paul Moore wrote:
> > On Tue, Dec 31, 2019 at 2:51 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > >
> > > Provide a mechanism similar to CAP_AUDIT_CONTROL to explicitly give a
> > > process in a non-init user namespace the capability to set audit
> > > container identifiers.
> > >
> > > Provide /proc/$PID/audit_capcontid interface to capcontid.
> > > Valid values are: 1==enabled, 0==disabled
> >
> > It would be good to be more explicit about "enabled" and "disabled" in
> > the commit description.  For example, which setting allows the target
> > task to set audit container IDs of it's children processes?
>
> Ok...
>
> > > Report this action in message type AUDIT_SET_CAPCONTID 1022 with fields
> > > opid= capcontid= old-capcontid=
> > >
> > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > ---
> > >  fs/proc/base.c             | 55 ++++++++++++++++++++++++++++++++++++++++++++++
> > >  include/linux/audit.h      | 14 ++++++++++++
> > >  include/uapi/linux/audit.h |  1 +
> > >  kernel/audit.c             | 35 +++++++++++++++++++++++++++++
> > >  4 files changed, 105 insertions(+)

...

> > > diff --git a/kernel/audit.c b/kernel/audit.c
> > > index 1287f0b63757..1c22dd084ae8 100644
> > > --- a/kernel/audit.c
> > > +++ b/kernel/audit.c
> > > @@ -2698,6 +2698,41 @@ static bool audit_contid_isowner(struct task_struct *tsk)
> > >         return false;
> > >  }
> > >
> > > +int audit_set_capcontid(struct task_struct *task, u32 enable)
> > > +{
> > > +       u32 oldcapcontid;
> > > +       int rc = 0;
> > > +       struct audit_buffer *ab;
> > > +
> > > +       if (!task->audit)
> > > +               return -ENOPROTOOPT;
> > > +       oldcapcontid = audit_get_capcontid(task);
> > > +       /* if task is not descendant, block */
> > > +       if (task == current)
> > > +               rc = -EBADSLT;
> > > +       else if (!task_is_descendant(current, task))
> > > +               rc = -EXDEV;
> >
> > See my previous comments about error code sanity.
>
> I'll go with EXDEV.
>
> > > +       else if (current_user_ns() == &init_user_ns) {
> > > +               if (!capable(CAP_AUDIT_CONTROL) && !audit_get_capcontid(current))
> > > +                       rc = -EPERM;
> >
> > I think we just want to use ns_capable() in the context of the current
> > userns to check CAP_AUDIT_CONTROL, yes?  Something like this ...
>
> I thought we had firmly established in previous discussion that
> CAP_AUDIT_CONTROL in anything other than init_user_ns was completely irrelevant
> and untrustable.

In the case of a container with multiple users, and multiple
applications, one being a nested orchestrator, it seems relevant to
allow that container to control which of it's processes are able to
exercise CAP_AUDIT_CONTROL.  Granted, we still want to control it
within the overall host, e.g. the container in question must be
allowed to run a nested orchestrator, but allowing the container
itself to provide it's own granularity seems like the right thing to
do.

> >   if (current_user_ns() != &init_user_ns) {
> >     if (!ns_capable(CAP_AUDIT_CONTROL) || !audit_get_capcontid())
> >       rc = -EPERM;
> >   } else if (!capable(CAP_AUDIT_CONTROL))
> >     rc = -EPERM;
> >

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

