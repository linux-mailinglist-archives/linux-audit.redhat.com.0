Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 10092E3E12
	for <lists+linux-audit@lfdr.de>; Thu, 24 Oct 2019 23:24:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571952250;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xn5rJHKSNiHdIv2uP4wYrSUILJsT5oX2lrS2Mq1Ih/o=;
	b=Ran7KtZFiIXNNtO2dgPNAPWcxjHluOG9e1XzumiOR6z3sJ4Rglmzi/j+NoOwH0o1CA4PjR
	4NhP13f9xnut0+pywWhlGGggTtbdlsF3EsaY7Y+fPM+p7Vpjp6yROfrTJQPEq5/SG+GbAc
	D2XYaRwHsipFawUkHR34sWoflsD+Vis=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-0svzUt4iMCylZ6yhQsY2Zg-1; Thu, 24 Oct 2019 17:24:05 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81086107AD33;
	Thu, 24 Oct 2019 21:24:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C449D60BE0;
	Thu, 24 Oct 2019 21:23:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 845C24EE68;
	Thu, 24 Oct 2019 21:23:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9OLNpXf020333 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 24 Oct 2019 17:23:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C29986012E; Thu, 24 Oct 2019 21:23:51 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-19.phx2.redhat.com [10.3.112.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 13D9D600C6;
	Thu, 24 Oct 2019 21:23:37 +0000 (UTC)
Date: Thu, 24 Oct 2019 17:23:35 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak90 V7 06/21] audit: contid limit of 32k imposed to
	avoid DoS
Message-ID: <20191024212335.y4ou7g4tsxnotvnk@madcap2.tricolour.ca>
References: <cover.1568834524.git.rgb@redhat.com>
	<230e91cd3e50a3d8015daac135c24c4c58cf0a21.1568834524.git.rgb@redhat.com>
	<20190927125142.GA25764@hmswarspite.think-freely.org>
	<CAHC9VhRbSUCB0OZorC4+y+5uJDR5uMXdRn2LOTYGu2gcFJSrcA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhRbSUCB0OZorC4+y+5uJDR5uMXdRn2LOTYGu2gcFJSrcA@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 0svzUt4iMCylZ6yhQsY2Zg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On 2019-10-10 20:38, Paul Moore wrote:
> On Fri, Sep 27, 2019 at 8:52 AM Neil Horman <nhorman@tuxdriver.com> wrote=
:
> > On Wed, Sep 18, 2019 at 09:22:23PM -0400, Richard Guy Briggs wrote:
> > > Set an arbitrary limit on the number of audit container identifiers t=
o
> > > limit abuse.
> > >
> > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > ---
> > >  kernel/audit.c | 8 ++++++++
> > >  kernel/audit.h | 4 ++++
> > >  2 files changed, 12 insertions(+)
> > >
> > > diff --git a/kernel/audit.c b/kernel/audit.c
> > > index 53d13d638c63..329916534dd2 100644
> > > --- a/kernel/audit.c
> > > +++ b/kernel/audit.c
>=20
> ...
>=20
> > > @@ -2465,6 +2472,7 @@ int audit_set_contid(struct task_struct *task, =
u64 contid)
> > >                               newcont->owner =3D current;
> > >                               refcount_set(&newcont->refcount, 1);
> > >                               list_add_rcu(&newcont->list, &audit_con=
tid_hash[h]);
> > > +                             audit_contid_count++;
> > >                       } else {
> > >                               rc =3D -ENOMEM;
> > >                               goto conterror;
> > > diff --git a/kernel/audit.h b/kernel/audit.h
> > > index 162de8366b32..543f1334ba47 100644
> > > --- a/kernel/audit.h
> > > +++ b/kernel/audit.h
> > > @@ -219,6 +219,10 @@ static inline int audit_hash_contid(u64 contid)
> > >       return (contid & (AUDIT_CONTID_BUCKETS-1));
> > >  }
> > >
> > > +extern int audit_contid_count;
> > > +
> > > +#define AUDIT_CONTID_COUNT   1 << 16
> > > +
> >
> > Just to ask the question, since it wasn't clear in the changelog, what
> > abuse are you avoiding here?  Ostensibly you should be able to create a=
s
> > many container ids as you have space for, and the simple creation of
> > container ids doesn't seem like the resource strain I would be concerne=
d
> > about here, given that an orchestrator can still create as many
> > containers as the system will otherwise allow, which will consume
> > significantly more ram/disk/etc.
>=20
> I've got a similar question.  Up to this point in the patchset, there
> is a potential issue of hash bucket chain lengths and traversing them
> with a spinlock held, but it seems like we shouldn't be putting an
> arbitrary limit on audit container IDs unless we have a good reason
> for it.  If for some reason we do want to enforce a limit, it should
> probably be a tunable value like a sysctl, or similar.

Can you separate and clarify the concerns here?

I plan to move this patch to the end of the patchset and make it
optional, possibly adding a tuning mechanism.  Like the migration from
/proc to netlink for loginuid/sessionid/contid/capcontid, this was Eric
Biederman's concern and suggested mitigation.

As for the first issue of the bucket chain length traversal while
holding the list spin-lock, would you prefer to use the rcu lock to
traverse the list and then only hold the spin-lock when modifying the
list, and possibly even make the spin-lock more fine-grained per list?

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

