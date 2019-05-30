Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 660002FDE7
	for <lists+linux-audit@lfdr.de>; Thu, 30 May 2019 16:34:01 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C3184A3B75;
	Thu, 30 May 2019 14:33:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6EA27C0B6;
	Thu, 30 May 2019 14:33:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2EAC6206D2;
	Thu, 30 May 2019 14:33:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4UEWqwb025410 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 30 May 2019 10:32:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D7C8B7E5BF; Thu, 30 May 2019 14:32:52 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2B4C7E5BC
	for <linux-audit@redhat.com>; Thu, 30 May 2019 14:32:47 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 66433C0AD2A1
	for <linux-audit@redhat.com>; Thu, 30 May 2019 14:32:37 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id y13so5190134lfh.9
	for <linux-audit@redhat.com>; Thu, 30 May 2019 07:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vPRuBME96qBkv2+pdKHmfYwrxMsHLYg2XjuDskufNdA=;
	b=XTIIueYDuIgusp3aH/O/Ki3sag5Wo0nfFBfQ5a1MquEch+jZpd5CxLU9S/Vcl1vcBP
	+e/cbimawwKO5T7z6axW+B8doqpZbxx+w4JqnZ1W4X0pNfaJsiS6UNFI9ppHs0yLg8jA
	MJZ1u1tJuNQZIt4PnlrR7EOBDumvSxEOcENCwrOeR4qPt82fOdeBPxdvUPRN3VzBm2zs
	5jc3A6uBDJ0mhFfHdcm3oAtkX645YiV0lWSAfOFzGSySLJV6dm/2IM67xOOsUGKcQE4F
	uUDgJNZPQukOMWkZfVyK5chCylXVcH6Ovs78CXXT6oZrsvd2YVkdsa1SS8uvVOuJDPIW
	Q3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vPRuBME96qBkv2+pdKHmfYwrxMsHLYg2XjuDskufNdA=;
	b=C5eWvUuiJJIDMyp6UvaRFVDoaJ2K0SyRN2T4ISbhekR2eNnceIpbYy82SvhyK0inOm
	KN/a6zlI/iiMdiH8SCtqej/rFpTvHtwAL7y4D7cOBg6FVQVgegfG+XpEaeO2fvvnPmRZ
	4SX/KnoQjqICmFQc+hh3y8BYn+nXkkwbLlBNgjyTt8136twFw5QsQkmUfyXSUFUVLP/p
	3p2zjufaOaiq2NkghFSnYABfx86YD8JN74gbgCZZk42DMKZqowpvd2jMHmOil/CgzjDd
	LoYMS9IWY6EwLpPt9Grxtngt8P3dZ5m0UtMbRC4WRiRpkBGS6OsUHp7+D3JWBzSX2nG7
	aO8w==
X-Gm-Message-State: APjAAAWr6yGrF+dX9+OEx82+ti4QP0Q5FPsmyaycQSx/jyW+7OnKG+xj
	tTqAf3xMyv0yObpC58gwpo6hQEzEGPZqu83WQ2hTbuI=
X-Google-Smtp-Source: APXvYqwqhEkdksMPTeb2g5KCjCxj8n1bQStwL7p4+8Wc9za8dt2GnyEk0aqQIiknzks4C0Ggoh9fezHY+u9LtZClqqc=
X-Received: by 2002:ac2:4358:: with SMTP id o24mr2301162lfl.13.1559226755674; 
	Thu, 30 May 2019 07:32:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1554732921.git.rgb@redhat.com>
	<423ed5e5c5e4ed7c3e26ac7d2bd7c267aaae777c.1554732921.git.rgb@redhat.com>
	<CAHC9VhQ9t-mvJGNCzArjg+MTGNXcZbVrWV4=RUD5ML_bHqua1Q@mail.gmail.com>
	<20190530141555.qqcbasvyp7eokwjz@madcap2.tricolour.ca>
In-Reply-To: <20190530141555.qqcbasvyp7eokwjz@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 30 May 2019 10:32:24 -0400
Message-ID: <CAHC9VhQ0miKFDegG-FTF6_y1nfOPpf69L8ONd3xgCZZxRrmo1w@mail.gmail.com>
Subject: Re: [PATCH ghak90 V6 09/10] audit: add support for containerid to
	network namespaces
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 30 May 2019 14:32:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Thu, 30 May 2019 14:32:37 +0000 (UTC) for IP:'209.85.167.68'
	DOMAIN:'mail-lf1-f68.google.com' HELO:'mail-lf1-f68.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.002  (DKIM_SIGNED, DKIM_VALID, SPF_HELO_NONE,
	SPF_NONE) 209.85.167.68 mail-lf1-f68.google.com
	209.85.167.68 mail-lf1-f68.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.32
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, Serge Hallyn <serge@hallyn.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Thu, 30 May 2019 14:34:00 +0000 (UTC)

On Thu, May 30, 2019 at 10:16 AM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> On 2019-05-29 18:17, Paul Moore wrote:
> > On Mon, Apr 8, 2019 at 11:41 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > >
> > > Audit events could happen in a network namespace outside of a task
> > > context due to packets received from the net that trigger an auditing
> > > rule prior to being associated with a running task.  The network
> > > namespace could be in use by multiple containers by association to the
> > > tasks in that network namespace.  We still want a way to attribute
> > > these events to any potential containers.  Keep a list per network
> > > namespace to track these audit container identifiiers.
> > >
> > > Add/increment the audit container identifier on:
> > > - initial setting of the audit container identifier via /proc
> > > - clone/fork call that inherits an audit container identifier
> > > - unshare call that inherits an audit container identifier
> > > - setns call that inherits an audit container identifier
> > > Delete/decrement the audit container identifier on:
> > > - an inherited audit container identifier dropped when child set
> > > - process exit
> > > - unshare call that drops a net namespace
> > > - setns call that drops a net namespace
> > >
> > > Please see the github audit kernel issue for contid net support:
> > >   https://github.com/linux-audit/audit-kernel/issues/92
> > > Please see the github audit testsuiite issue for the test case:
> > >   https://github.com/linux-audit/audit-testsuite/issues/64
> > > Please see the github audit wiki for the feature overview:
> > >   https://github.com/linux-audit/audit-kernel/wiki/RFE-Audit-Container-ID
> > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > Acked-by: Neil Horman <nhorman@tuxdriver.com>
> > > Reviewed-by: Ondrej Mosnacek <omosnace@redhat.com>
> > > ---
> > >  include/linux/audit.h | 19 +++++++++++
> > >  kernel/audit.c        | 88 +++++++++++++++++++++++++++++++++++++++++++++++++--
> > >  kernel/nsproxy.c      |  4 +++
> > >  3 files changed, 108 insertions(+), 3 deletions(-)
> >
> > ...
> >
> > > diff --git a/kernel/audit.c b/kernel/audit.c
> > > index 6c742da66b32..996213591617 100644
> > > --- a/kernel/audit.c
> > > +++ b/kernel/audit.c
> > > @@ -376,6 +384,75 @@ static struct sock *audit_get_sk(const struct net *net)
> > >         return aunet->sk;
> > >  }
> > >
> > > +void audit_netns_contid_add(struct net *net, u64 contid)
> > > +{
> > > +       struct audit_net *aunet;
> > > +       struct list_head *contid_list;
> > > +       struct audit_contid *cont;
> > > +
> > > +       if (!net)
> > > +               return;
> > > +       if (!audit_contid_valid(contid))
> > > +               return;
> > > +       aunet = net_generic(net, audit_net_id);
> > > +       if (!aunet)
> > > +               return;
> > > +       contid_list = &aunet->contid_list;
> > > +       spin_lock(&aunet->contid_list_lock);
> > > +       list_for_each_entry_rcu(cont, contid_list, list)
> > > +               if (cont->id == contid) {
> > > +                       refcount_inc(&cont->refcount);
> > > +                       goto out;
> > > +               }
> > > +       cont = kmalloc(sizeof(struct audit_contid), GFP_ATOMIC);
> > > +       if (cont) {
> > > +               INIT_LIST_HEAD(&cont->list);
> >
> > I thought you were going to get rid of this INIT_LIST_HEAD() call?
>
> I was intending to, and then Neil weighed in with this opinion:
>
>         https://www.redhat.com/archives/linux-audit/2019-April/msg00014.html
>
> If you feel that isn't important, please remove it.

Okay, I missed/forgot that, it seems like the right thing to do is to
leave it as-is.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
