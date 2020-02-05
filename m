Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 2AB73153B9B
	for <lists+linux-audit@lfdr.de>; Thu,  6 Feb 2020 00:06:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580943986;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IW0YhqlzbF04NtM/jHT06wNp5RbkWehjl94ykXez0zc=;
	b=TBidLtSu7tdLXU6W9lVMoNKwrY5tZmxPxoMJ47oMQFkY05cbjduEpNCTxeSReS4jSZ9fen
	CUo41cHQ4gNbvBm/mRItwIZKqgKdlYSHTZYqOWlE5TwlLW4+8FWCYOPpiOCeYyBXJmIwoi
	hHaRQnqdhTKys+LIospgCSIg0i6t6Uc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-xzyz5hnFOHqB_1bFGR3Bpw-1; Wed, 05 Feb 2020 18:06:24 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4387ADB63;
	Wed,  5 Feb 2020 23:06:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C32B5D9E2;
	Wed,  5 Feb 2020 23:06:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CE5CC18089CD;
	Wed,  5 Feb 2020 23:06:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 015N6BrF028773 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 5 Feb 2020 18:06:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6C22920316E0; Wed,  5 Feb 2020 23:06:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 669F220316F9
	for <linux-audit@redhat.com>; Wed,  5 Feb 2020 23:06:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3DFA101D235
	for <linux-audit@redhat.com>; Wed,  5 Feb 2020 23:06:08 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-411-954nb7E3OMqsznGlxhoybA-1; Wed, 05 Feb 2020 18:06:04 -0500
Received: by mail-ed1-f66.google.com with SMTP id r21so3916817edq.0
	for <linux-audit@redhat.com>; Wed, 05 Feb 2020 15:06:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vlJ/U1sEBP1oQwj7OCYoHbsQvGpwGivKoqIGPKoUwhQ=;
	b=tT/xJY5nGEp+oTfAJrO8MqcjckYsBNrHVdWOUPXByRihhTfgq/x1bMdkb1SSmqnWQ6
	SVQ5vVlNUjFmgjyJ0+Qey7octQWx2ns2B8JcGDwoxLcXBBiiCsEXfXeBY9FUm2ieo5uc
	vBkr8WIXuAT/tFW+ImU+paDVzQyU6QpWE2wMkqxeih8Ph+vqJcR0MXY5hZjq1wPNOkt9
	aPi92UKleZ7BaAg64MawSuj6bAcytWEdUQRCpIg5zey+vrr93exCtKpNahsNwEQ/sJiW
	QHMjYlzijYl79pXtK26q8wn0/lxFh3FxknnW81pfHxho9Xyhgj2ibLZpItnruK/IgcjH
	Ie6A==
X-Gm-Message-State: APjAAAVTa4QWT0qv3cx/trmrJI6xMZNGHNWztqb786BrW0wiIEzf9a7f
	IRSI6oHXfGP1flReH0wlQaRJ0VuNNHGzOEjCUVKQ
X-Google-Smtp-Source: APXvYqz/4rBVGOVjSYn3epCJFE9lKFv+T/52X8+lWfni3jO5pJYkLxPkkrOJ1odyceqG814XJFKyAUMdwXjFbMkHuZg=
X-Received: by 2002:a17:906:f251:: with SMTP id
	gy17mr338432ejb.308.1580943963052; 
	Wed, 05 Feb 2020 15:06:03 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577736799.git.rgb@redhat.com>
	<6452955c1e038227a5cd169f689f3fd3db27513f.1577736799.git.rgb@redhat.com>
	<CAHC9VhRkH=YEjAY6dJJHSp934grHnf=O4RiqLu3U8DzdVQOZkg@mail.gmail.com>
	<20200130192753.n7jjrshbhrczjzoe@madcap2.tricolour.ca>
In-Reply-To: <20200130192753.n7jjrshbhrczjzoe@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 5 Feb 2020 18:05:52 -0500
Message-ID: <CAHC9VhSVN3mNb5enhLR1hY+ekiAyiYWbehrwd_zN7kz13dF=1w@mail.gmail.com>
Subject: Re: [PATCH ghak90 V8 13/16] audit: track container nesting
To: Richard Guy Briggs <rgb@redhat.com>
X-MC-Unique: 954nb7E3OMqsznGlxhoybA-1
X-MC-Unique: xzyz5hnFOHqB_1bFGR3Bpw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 015N6BrF028773
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 30, 2020 at 2:28 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-01-22 16:29, Paul Moore wrote:
> > On Tue, Dec 31, 2019 at 2:51 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > >
> > > Track the parent container of a container to be able to filter and
> > > report nesting.
> > >
> > > Now that we have a way to track and check the parent container of a
> > > container, modify the contid field format to be able to report that
> > > nesting using a carrat ("^") separator to indicate nesting.  The
> > > original field format was "contid=<contid>" for task-associated records
> > > and "contid=<contid>[,<contid>[...]]" for network-namespace-associated
> > > records.  The new field format is
> > > "contid=<contid>[^<contid>[...]][,<contid>[...]]".
> >
> > Let's make sure we always use a comma as a separator, even when
> > recording the parent information, for example:
> > "contid=<contid>[,^<contid>[...]][,<contid>[...]]"
>
> The intent here is to clearly indicate and separate nesting from
> parallel use of several containers by one netns.  If we do away with
> that distinction, then we lose that inheritance accountability and
> should really run the list through a "uniq" function to remove the
> produced redundancies.  This clear inheritance is something Steve was
> looking for since tracking down individual events/records to show that
> inheritance was not aways feasible due to rolled logs or search effort.

Perhaps my example wasn't clear.  I'm not opposed to the little
carat/hat character indicating a container's parent, I just think it
would be good to also include a comma *in*addition* to the carat/hat.

> > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > ---
> > >  include/linux/audit.h |  1 +
> > >  kernel/audit.c        | 53 +++++++++++++++++++++++++++++++++++++++++++--------
> > >  kernel/audit.h        |  1 +
> > >  kernel/auditfilter.c  | 17 ++++++++++++++++-
> > >  kernel/auditsc.c      |  2 +-
> > >  5 files changed, 64 insertions(+), 10 deletions(-)
> >
> > ...
> >
> > > diff --git a/kernel/audit.c b/kernel/audit.c
> > > index ef8e07524c46..68be59d1a89b 100644
> > > --- a/kernel/audit.c
> > > +++ b/kernel/audit.c
> >
> > > @@ -492,6 +493,7 @@ void audit_switch_task_namespaces(struct nsproxy *ns, struct task_struct *p)
> > >                 audit_netns_contid_add(new->net_ns, contid);
> > >  }
> > >
> > > +void audit_log_contid(struct audit_buffer *ab, u64 contid);
> >
> > If we need a forward declaration, might as well just move it up near
> > the top of the file with the rest of the declarations.
>
> Ok.
>
> > > +void audit_log_contid(struct audit_buffer *ab, u64 contid)
> > > +{
> > > +       struct audit_contobj *cont = NULL, *prcont = NULL;
> > > +       int h;
> >
> > It seems safer to pass the audit container ID object and not the u64.
>
> It would also be faster, but in some places it isn't available such as
> for ptrace and signal targets.  This also links back to the drop record
> refcounts to hold onto the contobj until process exit, or signal
> delivery.
>
> What we could do is to supply two potential parameters, a contobj and/or
> a contid, and have it use the contobj if it is valid, otherwise, use the
> contid, as is done for names and paths supplied to audit_log_name().

Let's not do multiple parameters, that begs for misuse, let's take the
wrapper function route:

 func a(int id) {
   // important stuff
 }

 func ao(struct obj) {
   a(obj.id);
 }

... and we can add a comment that you *really* should be using the
variant that passes an object.

> > > @@ -2705,9 +2741,10 @@ int audit_set_contid(struct task_struct *task, u64 contid)
> > >         if (!ab)
> > >                 return rc;
> > >
> > > -       audit_log_format(ab,
> > > -                        "op=set opid=%d contid=%llu old-contid=%llu",
> > > -                        task_tgid_nr(task), contid, oldcontid);
> > > +       audit_log_format(ab, "op=set opid=%d contid=", task_tgid_nr(task));
> > > +       audit_log_contid(ab, contid);
> > > +       audit_log_format(ab, " old-contid=");
> > > +       audit_log_contid(ab, oldcontid);
> >
> > This is an interesting case where contid and old-contid are going to
> > be largely the same, only the first (current) ID is going to be
> > different; do we want to duplicate all of those IDs?
>
> At first when I read your comment, I thought we could just take contid
> and drop oldcontid, but if it fails, we still want all the information,
> so given the way I've set up the search code in userspace, listing only
> the newest contid in the contid field and all the rest in oldcontid
> could be a good compromise.

This is along the lines of what I was thinking.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

