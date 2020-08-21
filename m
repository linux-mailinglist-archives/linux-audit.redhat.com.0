Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 4E5A224DFF1
	for <lists+linux-audit@lfdr.de>; Fri, 21 Aug 2020 20:48:36 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-kcCGFEX4NSeduExClG7sLw-1; Fri, 21 Aug 2020 14:48:33 -0400
X-MC-Unique: kcCGFEX4NSeduExClG7sLw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E45C1084C91;
	Fri, 21 Aug 2020 18:48:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC11639A74;
	Fri, 21 Aug 2020 18:48:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 50C2A181A86E;
	Fri, 21 Aug 2020 18:48:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07LImIP0007824 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 14:48:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DF819100BCB2; Fri, 21 Aug 2020 18:48:18 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB87F100BFE4
	for <linux-audit@redhat.com>; Fri, 21 Aug 2020 18:48:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD64D811E93
	for <linux-audit@redhat.com>; Fri, 21 Aug 2020 18:48:16 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-261-Hal7224lNrWJ0v-v5AnL6w-1; Fri, 21 Aug 2020 14:48:13 -0400
X-MC-Unique: Hal7224lNrWJ0v-v5AnL6w-1
Received: by mail-ed1-f68.google.com with SMTP id df16so2281536edb.9
	for <linux-audit@redhat.com>; Fri, 21 Aug 2020 11:48:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zFS0hAClZdBqg1ygZpYSD8oadp4rG9FtsqCxJLGMqfA=;
	b=Eqbh+svZGrfqaTDoOS/Qi/+7rXQFML7UeTf3Jff+MXISfOaJHKW8MrFPLwd5UG6Qct
	w5MwHy35GQV7WospJYIOy3XITqDqPwiPEZ/mhmUoQI+xtDwDgV31GAkPL82Ou3VlC7eW
	AjsnPsdnyPjOIVPUaWLXCkLj93L9H4SOVaAoSKixyYKeOkm7UU/42M5J0V8w1T1Tnp2Y
	i3k36SW0axpumy+J6b5nEI4WSESJCStG+cSP3az9KWudfuTtzgFGhBnSGiNy0rbE1JpE
	4FlpFVgbQd0S5jSFk5ThBThLhl2I2uBG7CGyYNb3oVFA4SFjpQqnZKgQJhsns2KG7cv/
	ysWw==
X-Gm-Message-State: AOAM531+LC18hqtZmZGcue7CoLy9PJ3Ysf8GXeIg8FmLSHAQ1luB9j+E
	UZSIIdZ0mCMDMP/gWtNNCLiczCngJtsfWti7sfCl
X-Google-Smtp-Source: ABdhPJxY+3WwF8gu1nXbDCAOZ7CXNs3ESEQrI/MAHP08AsZCOrBpTjUWaGk4a55AOk3EOVvdlEJTtMfdxww8QDWXNp8=
X-Received: by 2002:a50:ee93:: with SMTP id f19mr4182974edr.31.1598035692549; 
	Fri, 21 Aug 2020 11:48:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593198710.git.rgb@redhat.com>
	<f01f38dbb3190191e5914874322342700aecb9e1.1593198710.git.rgb@redhat.com>
	<CAHC9VhRPm4=_dVkZCu9iD5u5ixJOUnGNZ2wM9CL4kWwqv3GRnA@mail.gmail.com>
	<20200729190025.mueangq3os3r7ew6@madcap2.tricolour.ca>
In-Reply-To: <20200729190025.mueangq3os3r7ew6@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 21 Aug 2020 14:48:01 -0400
Message-ID: <CAHC9VhQoSH7Lza517WNr+6LaS7i890JPQfvisV6thLmnu01QOw@mail.gmail.com>
Subject: Re: [PATCH ghak90 V9 06/13] audit: add contid support for signalling
	the audit daemon
To: Richard Guy Briggs <rgb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 29, 2020 at 3:00 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-07-05 11:10, Paul Moore wrote:
> > On Sat, Jun 27, 2020 at 9:22 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> > >
> > > Add audit container identifier support to the action of signalling the
> > > audit daemon.
> > >
> > > Since this would need to add an element to the audit_sig_info struct,
> > > a new record type AUDIT_SIGNAL_INFO2 was created with a new
> > > audit_sig_info2 struct.  Corresponding support is required in the
> > > userspace code to reflect the new record request and reply type.
> > > An older userspace won't break since it won't know to request this
> > > record type.
> > >
> > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > ---
> > >  include/linux/audit.h       |  8 ++++
> > >  include/uapi/linux/audit.h  |  1 +
> > >  kernel/audit.c              | 95 ++++++++++++++++++++++++++++++++++++++++++++-
> > >  security/selinux/nlmsgtab.c |  1 +
> > >  4 files changed, 104 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/include/linux/audit.h b/include/linux/audit.h
> > > index 5eeba0efffc2..89cf7c66abe6 100644
> > > --- a/include/linux/audit.h
> > > +++ b/include/linux/audit.h
> > > @@ -22,6 +22,13 @@ struct audit_sig_info {
> > >         char            ctx[];
> > >  };
> > >
> > > +struct audit_sig_info2 {
> > > +       uid_t           uid;
> > > +       pid_t           pid;
> > > +       u32             cid_len;
> > > +       char            data[];
> > > +};
> > > +
> > >  struct audit_buffer;
> > >  struct audit_context;
> > >  struct inode;
> > > @@ -105,6 +112,7 @@ struct audit_contobj {
> > >         u64                     id;
> > >         struct task_struct      *owner;
> > >         refcount_t              refcount;
> > > +       refcount_t              sigflag;
> > >         struct rcu_head         rcu;
> > >  };
> >
> > It seems like we need some protection in audit_set_contid() so that we
> > don't allow reuse of an audit container ID when "refcount == 0 &&
> > sigflag != 0", yes?
>
> We have it, see -ESHUTDOWN below.

That check in audit_set_contid() is checking ->refcount and not
->sigflag; ->sigflag is more important in this context, yes?

> > > diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
> > > index fd98460c983f..a56ad77069b9 100644
> > > --- a/include/uapi/linux/audit.h
> > > +++ b/include/uapi/linux/audit.h
> > > @@ -72,6 +72,7 @@
> > >  #define AUDIT_SET_FEATURE      1018    /* Turn an audit feature on or off */
> > >  #define AUDIT_GET_FEATURE      1019    /* Get which features are enabled */
> > >  #define AUDIT_CONTAINER_OP     1020    /* Define the container id and info */
> > > +#define AUDIT_SIGNAL_INFO2     1021    /* Get info auditd signal sender */
> > >
> > >  #define AUDIT_FIRST_USER_MSG   1100    /* Userspace messages mostly uninteresting to kernel */
> > >  #define AUDIT_USER_AVC         1107    /* We filter this differently */
> > > diff --git a/kernel/audit.c b/kernel/audit.c
> > > index a09f8f661234..54dd2cb69402 100644
> > > --- a/kernel/audit.c
> > > +++ b/kernel/audit.c
> > > @@ -126,6 +126,8 @@ struct auditd_connection {
> > >  kuid_t         audit_sig_uid = INVALID_UID;
> > >  pid_t          audit_sig_pid = -1;
> > >  u32            audit_sig_sid = 0;
> > > +static struct audit_contobj *audit_sig_cid;
> > > +static struct task_struct *audit_sig_atsk;
> >
> > This looks like a typo, or did you mean "atsk" for some reason?
>
> No, I meant atsk to refer specifically to the audit daemon task and not
> any other random one that is doing the signalling.  I can change it is
> there is a strong objection.

Esh, yeah, "atsk" looks too much like a typo ;)  At the very leask add
a 'd' in there, e.g. "adtsk", but something better than that would be
welcome.

> > > @@ -2532,6 +2620,11 @@ int audit_set_contid(struct task_struct *task, u64 contid)
> > >                         if (cont->id == contid) {
> > >                                 /* task injection to existing container */
> > >                                 if (current == cont->owner) {
> > > +                                       if (!refcount_read(&cont->refcount)) {
> > > +                                               rc = -ESHUTDOWN;
> >
> > Reuse -ENOTUNIQ; I'm not overly excited about providing a lot of
> > detail here as these are global system objects.  If you must have a
> > different errno (and I would prefer you didn't), use something like
> > -EBUSY.
>
> I don't understand the issue of "global system objects" since the only
> time this error would be issued is if its own contid were being reused
> but it hadn't cleaned up its own references yet by either issuing an
> AUDIT_SIGNAL_INFO* request or the targetted audit daemon hadn't cleaned
> up yet.  EBUSY could be confused with already having spawned threads or
> children, and ENOTUNIQ could indicate that another orchestrator/engine
> had stolen its desired contid after we released it and wanted to reuse
> it.

All the more reason for ENOTUNIQ.  The point is that the audit
container ID is not available for use, and since the IDs are shared
across the entire system I think we are better off having some
ambiquity here with errnos.

> This gets me thinking about making reservations for preferred
> contids that are otherwise unavailable and making callbacks to indicate
> when they become available, but that seems undesirably complex right
> now.

That is definitely beyond the scope of this work, or rather *should*
be beyond the scope of this work.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

