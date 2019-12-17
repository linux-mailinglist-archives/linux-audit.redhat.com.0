Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1206B123539
	for <lists+linux-audit@lfdr.de>; Tue, 17 Dec 2019 19:46:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576608380;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ySvjoDrZOxHtmRodjFvlrKZh6PXjT1fz6DcdJxF5VHg=;
	b=KYEZu9SjIgfKkseUAtnEByRTeJqRIhZaatvdQqS8rxFjfwuFY19YCj3t+1PuuZScirJ8tN
	t1ZsEZ2t37gTKZrD344iT6easWGwKg07ugn4N7V+mrXuzhk6ecIHRXu1wttgNFS0lnCGCY
	SuBJIgu7vG/nGuo42dMVokuj5Jzd0a8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-9qGFlOxUOXWodf3AVmCjig-1; Tue, 17 Dec 2019 13:46:18 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9E29107ACE3;
	Tue, 17 Dec 2019 18:46:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 172B768871;
	Tue, 17 Dec 2019 18:46:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DA55B104871;
	Tue, 17 Dec 2019 18:46:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBHIjvZ4001686 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 17 Dec 2019 13:45:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3C9005C554; Tue, 17 Dec 2019 18:45:57 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-28.phx2.redhat.com [10.3.112.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27F125C1C3;
	Tue, 17 Dec 2019 18:45:43 +0000 (UTC)
Date: Tue, 17 Dec 2019 13:45:41 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak90 V7 06/21] audit: contid limit of 32k imposed to
	avoid DoS
Message-ID: <20191217184541.tagssqt4zujbanf6@madcap2.tricolour.ca>
References: <cover.1568834524.git.rgb@redhat.com>
	<230e91cd3e50a3d8015daac135c24c4c58cf0a21.1568834524.git.rgb@redhat.com>
	<20190927125142.GA25764@hmswarspite.think-freely.org>
	<CAHC9VhRbSUCB0OZorC4+y+5uJDR5uMXdRn2LOTYGu2gcFJSrcA@mail.gmail.com>
	<20191024212335.y4ou7g4tsxnotvnk@madcap2.tricolour.ca>
	<CAHC9VhTrKVQNvTPoX5xdx-TUX_ukpMv2tNFFqLa2Njs17GuQMg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhTrKVQNvTPoX5xdx-TUX_ukpMv2tNFFqLa2Njs17GuQMg@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: 9qGFlOxUOXWodf3AVmCjig-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2019-11-08 12:49, Paul Moore wrote:
> On Thu, Oct 24, 2019 at 5:23 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > On 2019-10-10 20:38, Paul Moore wrote:
> > > On Fri, Sep 27, 2019 at 8:52 AM Neil Horman <nhorman@tuxdriver.com> wrote:
> > > > On Wed, Sep 18, 2019 at 09:22:23PM -0400, Richard Guy Briggs wrote:
> > > > > Set an arbitrary limit on the number of audit container identifiers to
> > > > > limit abuse.
> > > > >
> > > > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > > > ---
> > > > >  kernel/audit.c | 8 ++++++++
> > > > >  kernel/audit.h | 4 ++++
> > > > >  2 files changed, 12 insertions(+)
> > > > >
> > > > > diff --git a/kernel/audit.c b/kernel/audit.c
> > > > > index 53d13d638c63..329916534dd2 100644
> > > > > --- a/kernel/audit.c
> > > > > +++ b/kernel/audit.c
> > >
> > > ...
> > >
> > > > > @@ -2465,6 +2472,7 @@ int audit_set_contid(struct task_struct *task, u64 contid)
> > > > >                               newcont->owner = current;
> > > > >                               refcount_set(&newcont->refcount, 1);
> > > > >                               list_add_rcu(&newcont->list, &audit_contid_hash[h]);
> > > > > +                             audit_contid_count++;
> > > > >                       } else {
> > > > >                               rc = -ENOMEM;
> > > > >                               goto conterror;
> > > > > diff --git a/kernel/audit.h b/kernel/audit.h
> > > > > index 162de8366b32..543f1334ba47 100644
> > > > > --- a/kernel/audit.h
> > > > > +++ b/kernel/audit.h
> > > > > @@ -219,6 +219,10 @@ static inline int audit_hash_contid(u64 contid)
> > > > >       return (contid & (AUDIT_CONTID_BUCKETS-1));
> > > > >  }
> > > > >
> > > > > +extern int audit_contid_count;
> > > > > +
> > > > > +#define AUDIT_CONTID_COUNT   1 << 16
> > > > > +
> > > >
> > > > Just to ask the question, since it wasn't clear in the changelog, what
> > > > abuse are you avoiding here?  Ostensibly you should be able to create as
> > > > many container ids as you have space for, and the simple creation of
> > > > container ids doesn't seem like the resource strain I would be concerned
> > > > about here, given that an orchestrator can still create as many
> > > > containers as the system will otherwise allow, which will consume
> > > > significantly more ram/disk/etc.
> > >
> > > I've got a similar question.  Up to this point in the patchset, there
> > > is a potential issue of hash bucket chain lengths and traversing them
> > > with a spinlock held, but it seems like we shouldn't be putting an
> > > arbitrary limit on audit container IDs unless we have a good reason
> > > for it.  If for some reason we do want to enforce a limit, it should
> > > probably be a tunable value like a sysctl, or similar.
> >
> > Can you separate and clarify the concerns here?
> 
> "Why are you doing this?" is about as simple as I can pose the question.

It was more of a concern for total system resources, primarily memory,
but this is self-limiting and an arbitrary concern.

The other limit of depth of nesting has different concerns that arise
depending on how reporting is done.

> > I plan to move this patch to the end of the patchset and make it
> > optional, possibly adding a tuning mechanism.  Like the migration from
> > /proc to netlink for loginuid/sessionid/contid/capcontid, this was Eric
> > Biederman's concern and suggested mitigation.
> 
> Okay, let's just drop it.  I *really* don't like this approach of
> tossing questionable stuff at the end of the patchset; I get why you
> are doing it, but I think we really need to focus on keeping this
> changeset small.  If the number of ACIDs (heh) become unwieldy the
> right solution is to improve the algorithms/structures, if we can't do
> that for some reason, *then* we can fall back to a limiting knob in a
> latter release.

Ok, I've dropped it.  There are mitigations in place for large numbers
of contids and it can be limited later without breaking anything.

> > As for the first issue of the bucket chain length traversal while
> > holding the list spin-lock, would you prefer to use the rcu lock to
> > traverse the list and then only hold the spin-lock when modifying the
> > list, and possibly even make the spin-lock more fine-grained per list?
> 
> Until we have a better idea of how this is going to be used, I think
> it's okay for now.  It's also internal to the kernel so we can change
> it at any time.  My comments about the locking/structs was only to try
> and think of some reason why one might want to limit the number of
> ACIDs since neither you or Eric provided any reasoning that I could
> see.

I've switched to using an rcu read lock on the list traversal and
spin-lock on list update.

> paul moore

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

