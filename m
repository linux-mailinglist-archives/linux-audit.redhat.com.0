Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A27D3638
	for <lists+linux-audit@lfdr.de>; Fri, 11 Oct 2019 02:39:23 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 181F6316D8C8;
	Fri, 11 Oct 2019 00:39:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E640564020;
	Fri, 11 Oct 2019 00:39:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 523EF1800B74;
	Fri, 11 Oct 2019 00:39:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9B0dEl3028747 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 10 Oct 2019 20:39:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C959A60BF7; Fri, 11 Oct 2019 00:39:14 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C214C60BE1
	for <linux-audit@redhat.com>; Fri, 11 Oct 2019 00:39:12 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 886933082128
	for <linux-audit@redhat.com>; Fri, 11 Oct 2019 00:39:11 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id y127so5749378lfc.0
	for <linux-audit@redhat.com>; Thu, 10 Oct 2019 17:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=aFT8cm8S0DEJCyLgBpASXj1oSQTtinFEh4s2GyLpCAk=;
	b=SUM+Ozmq/ACZrOTEwqmyCavmWazXGQLL83huZDzHGsYRooxZavBq96G3gSZB8aZEun
	4tNuU+9vatgFwhZ2C3CnGZuIm6rSCm9tF7Ri4hZuTLyRNG9wMsfSGbDW4ixy4pABeYx8
	RiZoc4KtGQBAZafsKpyIRkoagGDxiybFw91oHrLAIp2elU9Glh7hQMRnxYemxk3LXdAf
	83242C0BufY7yeIMuHD1/BJ/mBqjnb4LbON2RYZFDpSRI7c5hR+satKSZpXAtXUtZp2a
	IsbLva/X8n/wCo/lzhff7J2wgO0KRpDAcFyAp4oyWjPRYAF/2wcK+vpAQmg9N9Fs+doF
	90IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=aFT8cm8S0DEJCyLgBpASXj1oSQTtinFEh4s2GyLpCAk=;
	b=Yc8LHmclLFo+xZ+PJM63VX6vXgeazbzOVwclJlLDGmheV67Gbca7+keefjm8Hx5ohV
	Odjpia6xn5GC9crpV19XZoku9Of/nf5pEGupjjAa/uAJkTybgT5ju1wZpaCwSDOeAE+j
	pRYzWNyha8wIX5LQxktFPj6rHthlrpBVXr2aDT7xzAiJArIEpcDDa4SJkN6t0z9s03IU
	Tq360elNR28vgYbBoRcwdbB7CqDTkSNmk1nzLkX4Wlhg5iRKKTjX/k73MlvibDxEpKmW
	NeTUIRv6eBfQ3ljlZtWgJ2/BPmoqQ5AdQ+Isk01sGE6HPYnlH/dkE0/JN9BkL8xoPt5N
	1GXw==
X-Gm-Message-State: APjAAAXoIY7V2UBZSkBRYoF8LKN9vH4d1/ToxOqHRU6u+n1MNRKER/7Y
	XLCAZafQX1TDgAJVRYVbdLQiO5cHIfo77jTB/aq6
X-Google-Smtp-Source: APXvYqy7lQItMV1AedUlABKN6Qqbi/t4grfJyN2rcTNd4EtP3vm905LTdxYK80Osnp73B/vBccWvg766BbHJwloILAc=
X-Received: by 2002:a19:520d:: with SMTP id m13mr7617840lfb.137.1570754349796; 
	Thu, 10 Oct 2019 17:39:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1568834524.git.rgb@redhat.com>
	<230e91cd3e50a3d8015daac135c24c4c58cf0a21.1568834524.git.rgb@redhat.com>
	<20190927125142.GA25764@hmswarspite.think-freely.org>
In-Reply-To: <20190927125142.GA25764@hmswarspite.think-freely.org>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 10 Oct 2019 20:38:58 -0400
Message-ID: <CAHC9VhRbSUCB0OZorC4+y+5uJDR5uMXdRn2LOTYGu2gcFJSrcA@mail.gmail.com>
Subject: Re: [PATCH ghak90 V7 06/21] audit: contid limit of 32k imposed to
	avoid DoS
To: Neil Horman <nhorman@tuxdriver.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Fri, 11 Oct 2019 00:39:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Fri, 11 Oct 2019 00:39:11 +0000 (UTC) for IP:'209.85.167.68'
	DOMAIN:'mail-lf1-f68.google.com' HELO:'mail-lf1-f68.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.167.68 mail-lf1-f68.google.com 209.85.167.68
	mail-lf1-f68.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, linux-api@vger.kernel.org,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Fri, 11 Oct 2019 00:39:22 +0000 (UTC)

On Fri, Sep 27, 2019 at 8:52 AM Neil Horman <nhorman@tuxdriver.com> wrote:
> On Wed, Sep 18, 2019 at 09:22:23PM -0400, Richard Guy Briggs wrote:
> > Set an arbitrary limit on the number of audit container identifiers to
> > limit abuse.
> >
> > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > ---
> >  kernel/audit.c | 8 ++++++++
> >  kernel/audit.h | 4 ++++
> >  2 files changed, 12 insertions(+)
> >
> > diff --git a/kernel/audit.c b/kernel/audit.c
> > index 53d13d638c63..329916534dd2 100644
> > --- a/kernel/audit.c
> > +++ b/kernel/audit.c

...

> > @@ -2465,6 +2472,7 @@ int audit_set_contid(struct task_struct *task, u64 contid)
> >                               newcont->owner = current;
> >                               refcount_set(&newcont->refcount, 1);
> >                               list_add_rcu(&newcont->list, &audit_contid_hash[h]);
> > +                             audit_contid_count++;
> >                       } else {
> >                               rc = -ENOMEM;
> >                               goto conterror;
> > diff --git a/kernel/audit.h b/kernel/audit.h
> > index 162de8366b32..543f1334ba47 100644
> > --- a/kernel/audit.h
> > +++ b/kernel/audit.h
> > @@ -219,6 +219,10 @@ static inline int audit_hash_contid(u64 contid)
> >       return (contid & (AUDIT_CONTID_BUCKETS-1));
> >  }
> >
> > +extern int audit_contid_count;
> > +
> > +#define AUDIT_CONTID_COUNT   1 << 16
> > +
>
> Just to ask the question, since it wasn't clear in the changelog, what
> abuse are you avoiding here?  Ostensibly you should be able to create as
> many container ids as you have space for, and the simple creation of
> container ids doesn't seem like the resource strain I would be concerned
> about here, given that an orchestrator can still create as many
> containers as the system will otherwise allow, which will consume
> significantly more ram/disk/etc.

I've got a similar question.  Up to this point in the patchset, there
is a potential issue of hash bucket chain lengths and traversing them
with a spinlock held, but it seems like we shouldn't be putting an
arbitrary limit on audit container IDs unless we have a good reason
for it.  If for some reason we do want to enforce a limit, it should
probably be a tunable value like a sysctl, or similar.

--
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
