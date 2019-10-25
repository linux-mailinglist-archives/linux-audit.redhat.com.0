Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 933D1E54F8
	for <lists+linux-audit@lfdr.de>; Fri, 25 Oct 2019 22:16:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572034568;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XBD1IW5ks5dwsw6aU0O7pjUzDR1CbFzXaPCt617yXpc=;
	b=WfSJwlym0fUZHB0yVDwr+2po9Y8L/eN6k8Ldaqv/+X7vBkAMsRkhgw1GI4hHcA0I0/LLAI
	fJ/CCLxkt5/5Em2YN/I60/4wnzGnejwHRcBuU9SUA+cU/VBrZYJVeykFf5Ilr0ULqudE5g
	z6r6+2TYZ0VlqLegzopMkAqxPfvjavM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-LQDfFEJuMuO2kxGtsEh54Q-1; Fri, 25 Oct 2019 16:16:06 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 753B4800D41;
	Fri, 25 Oct 2019 20:16:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EEBF560628;
	Fri, 25 Oct 2019 20:16:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F28E04EE68;
	Fri, 25 Oct 2019 20:15:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9PKFrmC027034 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 25 Oct 2019 16:15:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BA59E60167; Fri, 25 Oct 2019 20:15:53 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-19.phx2.redhat.com [10.3.112.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CFF5600D1;
	Fri, 25 Oct 2019 20:15:42 +0000 (UTC)
Date: Fri, 25 Oct 2019 16:15:39 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Neil Horman <nhorman@tuxdriver.com>
Subject: Re: [PATCH ghak90 V7 06/21] audit: contid limit of 32k imposed to
	avoid DoS
Message-ID: <20191025201539.5nvjg3x7zshoqjwl@madcap2.tricolour.ca>
References: <cover.1568834524.git.rgb@redhat.com>
	<230e91cd3e50a3d8015daac135c24c4c58cf0a21.1568834524.git.rgb@redhat.com>
	<20190927125142.GA25764@hmswarspite.think-freely.org>
MIME-Version: 1.0
In-Reply-To: <20190927125142.GA25764@hmswarspite.think-freely.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-audit@redhat.com
Cc: linux-api@vger.kernel.org, containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, eparis@parisplace.org,
	mpatel@redhat.com, serge@hallyn.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: LQDfFEJuMuO2kxGtsEh54Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On 2019-09-27 08:51, Neil Horman wrote:
> On Wed, Sep 18, 2019 at 09:22:23PM -0400, Richard Guy Briggs wrote:
> > Set an arbitrary limit on the number of audit container identifiers to
> > limit abuse.
> >=20
> > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > ---
> >  kernel/audit.c | 8 ++++++++
> >  kernel/audit.h | 4 ++++
> >  2 files changed, 12 insertions(+)
> >=20
> > diff --git a/kernel/audit.c b/kernel/audit.c
> > index 53d13d638c63..329916534dd2 100644
> > --- a/kernel/audit.c
> > +++ b/kernel/audit.c
> > @@ -139,6 +139,7 @@ struct audit_net {
> >  struct list_head audit_inode_hash[AUDIT_INODE_BUCKETS];
> >  /* Hash for contid-based rules */
> >  struct list_head audit_contid_hash[AUDIT_CONTID_BUCKETS];
> > +int audit_contid_count =3D 0;
> > =20
> >  static struct kmem_cache *audit_buffer_cache;
> > =20
> > @@ -2384,6 +2385,7 @@ void audit_cont_put(struct audit_cont *cont)
> >  =09=09put_task_struct(cont->owner);
> >  =09=09list_del_rcu(&cont->list);
> >  =09=09kfree_rcu(cont, rcu);
> > +=09=09audit_contid_count--;
> >  =09}
> >  }
> > =20
> > @@ -2456,6 +2458,11 @@ int audit_set_contid(struct task_struct *task, u=
64 contid)
> >  =09=09=09=09=09goto conterror;
> >  =09=09=09=09}
> >  =09=09=09}
> > +=09=09/* Set max contids */
> > +=09=09if (audit_contid_count > AUDIT_CONTID_COUNT) {
> > +=09=09=09rc =3D -ENOSPC;
> > +=09=09=09goto conterror;
> > +=09=09}
> You should check for audit_contid_count =3D=3D AUDIT_CONTID_COUNT here, n=
o?
> or at least >=3D, since you increment it below.  Otherwise its possible
> that you will exceed it by one in the full condition.

Yes, agreed.

> >  =09=09if (!newcont) {
> >  =09=09=09newcont =3D kmalloc(sizeof(struct audit_cont), GFP_ATOMIC);
> >  =09=09=09if (newcont) {
> > @@ -2465,6 +2472,7 @@ int audit_set_contid(struct task_struct *task, u6=
4 contid)
> >  =09=09=09=09newcont->owner =3D current;
> >  =09=09=09=09refcount_set(&newcont->refcount, 1);
> >  =09=09=09=09list_add_rcu(&newcont->list, &audit_contid_hash[h]);
> > +=09=09=09=09audit_contid_count++;
> >  =09=09=09} else {
> >  =09=09=09=09rc =3D -ENOMEM;
> >  =09=09=09=09goto conterror;
> > diff --git a/kernel/audit.h b/kernel/audit.h
> > index 162de8366b32..543f1334ba47 100644
> > --- a/kernel/audit.h
> > +++ b/kernel/audit.h
> > @@ -219,6 +219,10 @@ static inline int audit_hash_contid(u64 contid)
> >  =09return (contid & (AUDIT_CONTID_BUCKETS-1));
> >  }
> > =20
> > +extern int audit_contid_count;
> > +
> > +#define AUDIT_CONTID_COUNT=091 << 16
> > +
> Just to ask the question, since it wasn't clear in the changelog, what
> abuse are you avoiding here?  Ostensibly you should be able to create as
> many container ids as you have space for, and the simple creation of
> container ids doesn't seem like the resource strain I would be concerned
> about here, given that an orchestrator can still create as many
> containers as the system will otherwise allow, which will consume
> significantly more ram/disk/etc.

Agreed.  I'm not a huge fan of this, but included it as an optional
patch to address resource abuse concerns of Eric Beiderman.  I'll push
it to the end of the patchset and make it clear it is optional unless I
hear a compelling reason to keep it.

A similar argument was used to make the audit queue length tunable
parameter unlimited.

> >  /* Indicates that audit should log the full pathname. */
> >  #define AUDIT_NAME_FULL -1
> > =20
> > --=20
> > 1.8.3.1

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

