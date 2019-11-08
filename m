Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 089CAF52E8
	for <lists+linux-audit@lfdr.de>; Fri,  8 Nov 2019 18:49:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573235399;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uJI1nzGr7NqdmV2Uw6HAtUctz7wNOU8p5Qjf3mK/nOY=;
	b=FKABea7entOZNFz0VDQ4tH+/yPVCOjJRGab99pQAsWF7xko2BkoK5gnRwX4rQ8rfZ502uc
	dXqxsVlk+izzAjRQBV1y3D1FYEhjmz4911OSF51kt9fPAbSr/ysE2KJkJ/ulvzqngSf2oo
	9/+CzjoZRgXkpoPKeckjIe2engkMFdw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-R3BUZ65FNfaq9-0of7CqbQ-1; Fri, 08 Nov 2019 12:49:57 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 217562A3;
	Fri,  8 Nov 2019 17:49:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4356F2898A;
	Fri,  8 Nov 2019 17:49:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6B5E61803C33;
	Fri,  8 Nov 2019 17:49:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA8HnhFX023792 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 8 Nov 2019 12:49:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AEF7E61071; Fri,  8 Nov 2019 17:49:43 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A496C4139
	for <linux-audit@redhat.com>; Fri,  8 Nov 2019 17:49:37 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B1DA43083387
	for <linux-audit@redhat.com>; Fri,  8 Nov 2019 17:49:36 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id k15so7131366lja.3
	for <linux-audit@redhat.com>; Fri, 08 Nov 2019 09:49:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UVAbz2qNISBamKJ8aYyWKPdYYFUtEofFZoGab/xVx6Q=;
	b=XepaWIfi2xdvr9dYMc7PvO6/T2pMXCVxeENTjMqWAvtcxNA/ReCuj7ovPSt/zPAUpT
	W2Y+F1PdTO6yqs8EZFCPWVHbVA75QW0bF9XQ8NWqUf3LP0IWdng3QV52IwvWDu3S+HqO
	sPxe83hxtvAAOEIrTHLe7SRQIoFFamVY+gJmA8Ghy/y9OVKFgBuAvJIAukUhurtaRPl6
	Yx/P7XwOojMBz4OBw3n9x1CdUSKQfB6Xada9y0PfpmFv/KqpSbfwrPPSRHAZrVVoI1kR
	Brjx7znXqBvI3Ash8rS2wN7qv0ZSKufcO5k4qxfm4WPebyumZIee3rkOiabwKeXTY7Ba
	qp8g==
X-Gm-Message-State: APjAAAV6fuuWdiiF0iNz5VEHS4JnkOALacnUI176UMo9ZzWGEEOmrNNe
	zPtGD8jwXSJU8Sz7okldZKV0T+oSWWclRUWBqiuY
X-Google-Smtp-Source: APXvYqwXdfG4GypAr+j8sH3slLDDTCL7KQFTcRwsFnuUnnR/MbQkn3eAVhzXbnZTJXwiGsLyrFAGgJuGlFt1dlMpA3Q=
X-Received: by 2002:a2e:898d:: with SMTP id c13mr7895602lji.54.1573235374890; 
	Fri, 08 Nov 2019 09:49:34 -0800 (PST)
MIME-Version: 1.0
References: <cover.1568834524.git.rgb@redhat.com>
	<230e91cd3e50a3d8015daac135c24c4c58cf0a21.1568834524.git.rgb@redhat.com>
	<20190927125142.GA25764@hmswarspite.think-freely.org>
	<CAHC9VhRbSUCB0OZorC4+y+5uJDR5uMXdRn2LOTYGu2gcFJSrcA@mail.gmail.com>
	<20191024212335.y4ou7g4tsxnotvnk@madcap2.tricolour.ca>
In-Reply-To: <20191024212335.y4ou7g4tsxnotvnk@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 8 Nov 2019 12:49:23 -0500
Message-ID: <CAHC9VhTrKVQNvTPoX5xdx-TUX_ukpMv2tNFFqLa2Njs17GuQMg@mail.gmail.com>
Subject: Re: [PATCH ghak90 V7 06/21] audit: contid limit of 32k imposed to
	avoid DoS
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Fri, 08 Nov 2019 17:49:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Fri, 08 Nov 2019 17:49:37 +0000 (UTC) for IP:'209.85.208.193'
	DOMAIN:'mail-lj1-f193.google.com'
	HELO:'mail-lj1-f193.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.193 mail-lj1-f193.google.com 209.85.208.193
	mail-lj1-f193.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
Cc: Neil Horman <nhorman@tuxdriver.com>, linux-api@vger.kernel.org,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: R3BUZ65FNfaq9-0of7CqbQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2019 at 5:23 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2019-10-10 20:38, Paul Moore wrote:
> > On Fri, Sep 27, 2019 at 8:52 AM Neil Horman <nhorman@tuxdriver.com> wro=
te:
> > > On Wed, Sep 18, 2019 at 09:22:23PM -0400, Richard Guy Briggs wrote:
> > > > Set an arbitrary limit on the number of audit container identifiers=
 to
> > > > limit abuse.
> > > >
> > > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > > ---
> > > >  kernel/audit.c | 8 ++++++++
> > > >  kernel/audit.h | 4 ++++
> > > >  2 files changed, 12 insertions(+)
> > > >
> > > > diff --git a/kernel/audit.c b/kernel/audit.c
> > > > index 53d13d638c63..329916534dd2 100644
> > > > --- a/kernel/audit.c
> > > > +++ b/kernel/audit.c
> >
> > ...
> >
> > > > @@ -2465,6 +2472,7 @@ int audit_set_contid(struct task_struct *task=
, u64 contid)
> > > >                               newcont->owner =3D current;
> > > >                               refcount_set(&newcont->refcount, 1);
> > > >                               list_add_rcu(&newcont->list, &audit_c=
ontid_hash[h]);
> > > > +                             audit_contid_count++;
> > > >                       } else {
> > > >                               rc =3D -ENOMEM;
> > > >                               goto conterror;
> > > > diff --git a/kernel/audit.h b/kernel/audit.h
> > > > index 162de8366b32..543f1334ba47 100644
> > > > --- a/kernel/audit.h
> > > > +++ b/kernel/audit.h
> > > > @@ -219,6 +219,10 @@ static inline int audit_hash_contid(u64 contid=
)
> > > >       return (contid & (AUDIT_CONTID_BUCKETS-1));
> > > >  }
> > > >
> > > > +extern int audit_contid_count;
> > > > +
> > > > +#define AUDIT_CONTID_COUNT   1 << 16
> > > > +
> > >
> > > Just to ask the question, since it wasn't clear in the changelog, wha=
t
> > > abuse are you avoiding here?  Ostensibly you should be able to create=
 as
> > > many container ids as you have space for, and the simple creation of
> > > container ids doesn't seem like the resource strain I would be concer=
ned
> > > about here, given that an orchestrator can still create as many
> > > containers as the system will otherwise allow, which will consume
> > > significantly more ram/disk/etc.
> >
> > I've got a similar question.  Up to this point in the patchset, there
> > is a potential issue of hash bucket chain lengths and traversing them
> > with a spinlock held, but it seems like we shouldn't be putting an
> > arbitrary limit on audit container IDs unless we have a good reason
> > for it.  If for some reason we do want to enforce a limit, it should
> > probably be a tunable value like a sysctl, or similar.
>
> Can you separate and clarify the concerns here?

"Why are you doing this?" is about as simple as I can pose the question.

> I plan to move this patch to the end of the patchset and make it
> optional, possibly adding a tuning mechanism.  Like the migration from
> /proc to netlink for loginuid/sessionid/contid/capcontid, this was Eric
> Biederman's concern and suggested mitigation.

Okay, let's just drop it.  I *really* don't like this approach of
tossing questionable stuff at the end of the patchset; I get why you
are doing it, but I think we really need to focus on keeping this
changeset small.  If the number of ACIDs (heh) become unwieldy the
right solution is to improve the algorithms/structures, if we can't do
that for some reason, *then* we can fall back to a limiting knob in a
latter release.

> As for the first issue of the bucket chain length traversal while
> holding the list spin-lock, would you prefer to use the rcu lock to
> traverse the list and then only hold the spin-lock when modifying the
> list, and possibly even make the spin-lock more fine-grained per list?

Until we have a better idea of how this is going to be used, I think
it's okay for now.  It's also internal to the kernel so we can change
it at any time.  My comments about the locking/structs was only to try
and think of some reason why one might want to limit the number of
ACIDs since neither you or Eric provided any reasoning that I could
see.

--=20
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

