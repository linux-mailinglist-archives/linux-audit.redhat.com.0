Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5C3B215CDAF
	for <lists+linux-audit@lfdr.de>; Thu, 13 Feb 2020 23:00:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581631199;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TlWFCzOZelznAlJm9UV2C1gNfTBIaTCzp6otcpSXtlA=;
	b=MYE239vwzWJ5SNi+AlMZbil8Ao85Ud8ehmcLxeVRYAneZwNtDXLIQEcfpPLJ/RGAIiTHxy
	VRiKAy28jY91p9Rm3kDe07VdrYhsiZM2d/RZ/D13HsIGEl+I6k0QRvKvWjZZyFRkMNM+26
	RS2QRmN66R8aS+f1dQ/UdG/YSS4rg4M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-L_1QhGnsM1u0PCD13IG86g-1; Thu, 13 Feb 2020 16:59:57 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B239D8017DF;
	Thu, 13 Feb 2020 21:59:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C822289F3C;
	Thu, 13 Feb 2020 21:59:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9B37918089CF;
	Thu, 13 Feb 2020 21:59:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01DLxEMM007368 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 13 Feb 2020 16:59:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2CDEA120ED3; Thu, 13 Feb 2020 21:59:14 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2832C120ECC
	for <linux-audit@redhat.com>; Thu, 13 Feb 2020 21:59:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1D551011E08
	for <linux-audit@redhat.com>; Thu, 13 Feb 2020 21:59:11 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-149-0FOYx_4ZNPuoY7DcN5EAHw-1; Thu, 13 Feb 2020 16:59:09 -0500
Received: by mail-ed1-f67.google.com with SMTP id p23so8720996edr.5
	for <linux-audit@redhat.com>; Thu, 13 Feb 2020 13:59:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dR96Ls041PGles0WWTgdxsFA4gswjPBr2dNrlkBSuNQ=;
	b=AztIcOJos6SRCN9PO+plJ6oy2l8il50IKVnB7Akp46iglKgdKtVQZivVCpVKyPizIO
	rE8mnBd/gvh+s9LptbThb8XwLkCqRsQoRrmxgEk0wviyeW0X+O/RqPt+7veGQcxCiNKu
	HOVBVf0YXo0l4+MknOmZfk68tLoC2HaAycKhBAM2A5RwvA8cmDEOVzv5mOYzLojljHau
	CxZ7bhyvgaeYVMvDBMjPXQG9i7lc8kSAdA2h4MjUNH7astEsm1oHHQ+81TN4KaHbjdeU
	vV6jneQtGaNdw4TLJHlSjNXNtBiCd0QpFRDzBp79eOzQbbBsAk9sT1Jg8ycfx5Svh2m3
	lL4Q==
X-Gm-Message-State: APjAAAXjLbFWBdCYXrltyCV9s26u83hXgx95Mtfobc40tPMHz1CUc86S
	TZIoqkStpGmL5kpurLNmc6907BExJRuM8wAXE12o
X-Google-Smtp-Source: APXvYqwJlC4P1+vTqQ7auzlqHDyoqi32fnbka+h4eFFK4GnrJSQwBwYPSRpLTAitL/ZfvrnPR1P7gUIIEptxDZxCT9E=
X-Received: by 2002:a50:a7a5:: with SMTP id i34mr17484612edc.128.1581631147637;
	Thu, 13 Feb 2020 13:59:07 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577736799.git.rgb@redhat.com>
	<5941671b6b6b5de28ab2cc80e72f288cf83291d5.1577736799.git.rgb@redhat.com>
	<CAHC9VhQYXQp+C0EHwLuW50yUenfH4KF1xKQdS=bn_OzHfnFmmg@mail.gmail.com>
	<20200205003930.2efpm4tvrisgmj4t@madcap2.tricolour.ca>
	<CAHC9VhSsfBbfYmqLoR=QBgF5_VwbA8Dqqz97MjqwwJ6Jq6fHwA@mail.gmail.com>
	<20200206125135.u4dmybkmvxfgui2b@madcap2.tricolour.ca>
In-Reply-To: <20200206125135.u4dmybkmvxfgui2b@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 13 Feb 2020 16:58:56 -0500
Message-ID: <CAHC9VhT8RsFtmqD22p_NxJaqoAg+do9mX45Luw9fEkr+nQjvxg@mail.gmail.com>
Subject: Re: [PATCH ghak90 V8 16/16] audit: add capcontid to set contid
	outside init_user_ns
To: Richard Guy Briggs <rgb@redhat.com>
X-MC-Unique: 0FOYx_4ZNPuoY7DcN5EAHw-1
X-MC-Unique: L_1QhGnsM1u0PCD13IG86g-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01DLxEMM007368
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 6, 2020 at 7:52 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-02-05 17:56, Paul Moore wrote:
> > On Tue, Feb 4, 2020 at 7:39 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > On 2020-01-22 16:29, Paul Moore wrote:
> > > > On Tue, Dec 31, 2019 at 2:51 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > > >
> > > > > Provide a mechanism similar to CAP_AUDIT_CONTROL to explicitly give a
> > > > > process in a non-init user namespace the capability to set audit
> > > > > container identifiers.
> > > > >
> > > > > Provide /proc/$PID/audit_capcontid interface to capcontid.
> > > > > Valid values are: 1==enabled, 0==disabled
> > > >
> > > > It would be good to be more explicit about "enabled" and "disabled" in
> > > > the commit description.  For example, which setting allows the target
> > > > task to set audit container IDs of it's children processes?
> > >
> > > Ok...
> > >
> > > > > Report this action in message type AUDIT_SET_CAPCONTID 1022 with fields
> > > > > opid= capcontid= old-capcontid=
> > > > >
> > > > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > > > ---
> > > > >  fs/proc/base.c             | 55 ++++++++++++++++++++++++++++++++++++++++++++++
> > > > >  include/linux/audit.h      | 14 ++++++++++++
> > > > >  include/uapi/linux/audit.h |  1 +
> > > > >  kernel/audit.c             | 35 +++++++++++++++++++++++++++++
> > > > >  4 files changed, 105 insertions(+)
> >
> > ...
> >
> > > > > diff --git a/kernel/audit.c b/kernel/audit.c
> > > > > index 1287f0b63757..1c22dd084ae8 100644
> > > > > --- a/kernel/audit.c
> > > > > +++ b/kernel/audit.c
> > > > > @@ -2698,6 +2698,41 @@ static bool audit_contid_isowner(struct task_struct *tsk)
> > > > >         return false;
> > > > >  }
> > > > >
> > > > > +int audit_set_capcontid(struct task_struct *task, u32 enable)
> > > > > +{
> > > > > +       u32 oldcapcontid;
> > > > > +       int rc = 0;
> > > > > +       struct audit_buffer *ab;
> > > > > +
> > > > > +       if (!task->audit)
> > > > > +               return -ENOPROTOOPT;
> > > > > +       oldcapcontid = audit_get_capcontid(task);
> > > > > +       /* if task is not descendant, block */
> > > > > +       if (task == current)
> > > > > +               rc = -EBADSLT;
> > > > > +       else if (!task_is_descendant(current, task))
> > > > > +               rc = -EXDEV;
> > > >
> > > > See my previous comments about error code sanity.
> > >
> > > I'll go with EXDEV.
> > >
> > > > > +       else if (current_user_ns() == &init_user_ns) {
> > > > > +               if (!capable(CAP_AUDIT_CONTROL) && !audit_get_capcontid(current))
> > > > > +                       rc = -EPERM;
> > > >
> > > > I think we just want to use ns_capable() in the context of the current
> > > > userns to check CAP_AUDIT_CONTROL, yes?  Something like this ...
> > >
> > > I thought we had firmly established in previous discussion that
> > > CAP_AUDIT_CONTROL in anything other than init_user_ns was completely irrelevant
> > > and untrustable.
> >
> > In the case of a container with multiple users, and multiple
> > applications, one being a nested orchestrator, it seems relevant to
> > allow that container to control which of it's processes are able to
> > exercise CAP_AUDIT_CONTROL.  Granted, we still want to control it
> > within the overall host, e.g. the container in question must be
> > allowed to run a nested orchestrator, but allowing the container
> > itself to provide it's own granularity seems like the right thing to
> > do.
>
> Looking back to discussion on the v6 patch 2/10 (2019-05-30 15:29 Paul
> Moore[1], 2019-07-08 14:05 RGB[2]) , it occurs to me that the
> ns_capable(CAP_AUDIT_CONTROL) application was dangerous since there was
> no parental accountability in storage or reporting.  Now that is in
> place, it does seem a bit more reasonable to allow it, but I'm still not
> clear on why we would want both mechanisms now.  I don't understand what
> the last line in that email meant: "We would probably still want a
> ns_capable(CAP_AUDIT_CONTROL) restriction in this case."  Allow
> ns_capable(CAP_AUDIT_CONTROL) to govern these actions, or restrict
> ns_capable(CAP_AUDIT_CONTROL) from being used to govern these actions?
>
> If an unprivileged user has been given capcontid to be able run their
> own container orchestrator/engine and spawns a user namespace with
> CAP_AUDIT_CONTROL, what matters is capcontid, and not CAP_AUDIT_CONTROL.
> I could see needing CAP_AUDIT_CONTROL *in addition* to capcontid to give
> it finer grained control, but since capcontid would have to be given to
> each process explicitly anways, I don't see the point.
>
> If that unprivileged user had not been given capcontid,
> giving itself or one of its descendants CAP_AUDIT_CONTROL should not let
> it jump into the game all of a sudden unless the now chained audit
> container identifiers are deemed accountable enough.  And then now we
> need those hard limits on container depth and network namespace
> container membership.

Perhaps I'm not correctly understanding what you are trying to do with
this patchset, but my current understanding is that you are trying to
use capcontid to control which child audit container IDs (ACIDs) are
allowed to manage their own ACIDs.  Further, I believe that the
capcontid setting operates at a per-ACID level, meaning there is no
provision for the associated container to further restrict that
ability, i.e. no access control granularity below the ACID level.  My
thinking is that ns_capable(CAP_AUDIT_CONTROL) could be used within an
ACID to increase the granularity of the access controls so that only
privileged processes running inside the ACID would be able to manage
the ACIDs.  Does that make sense?

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

