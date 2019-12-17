Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8780512361A
	for <lists+linux-audit@lfdr.de>; Tue, 17 Dec 2019 20:57:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576612635;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xmEfXb7jFLuQ/yKSpFJnFbn2ulregDHR00v+lpV7fgc=;
	b=OjMJLVvQiwMszmC6zcXx0YmKP/XSFZW6m0SHjlmTQr4nb2uVHNT4Yc/Zl319kHNovhzgid
	B8wydFdos+Th9dkUzLV1LeDrl1mKjcdV3kdC6/GlJvvqK4aL4hoBF/dTbIXIn4d+FrPDya
	67MSoZmWvJzRuUOYDR5jvc43zazNqmI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-GOdoGf5IPsutQTVbi5OzrQ-1; Tue, 17 Dec 2019 14:57:08 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5848F80058D;
	Tue, 17 Dec 2019 19:57:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 294E56887D;
	Tue, 17 Dec 2019 19:56:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 26CC818089C8;
	Tue, 17 Dec 2019 19:56:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBHJukJj004553 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 17 Dec 2019 14:56:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E567A5C554; Tue, 17 Dec 2019 19:56:46 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-28.phx2.redhat.com [10.3.112.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7331C5C548;
	Tue, 17 Dec 2019 19:56:34 +0000 (UTC)
Date: Tue, 17 Dec 2019 14:56:31 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Steve Grubb <sgrubb@redhat.com>
Subject: Re: [PATCH ghak90 V7 06/21] audit: contid limit of 32k imposed to
	avoid DoS
Message-ID: <20191217195631.3obqll4nf5poe7cz@madcap2.tricolour.ca>
References: <cover.1568834524.git.rgb@redhat.com>
	<CAHC9VhTrKVQNvTPoX5xdx-TUX_ukpMv2tNFFqLa2Njs17GuQMg@mail.gmail.com>
	<20191217184541.tagssqt4zujbanf6@madcap2.tricolour.ca>
	<2318345.msVmMTmnKu@x2>
MIME-Version: 1.0
In-Reply-To: <2318345.msVmMTmnKu@x2>
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
X-MC-Unique: GOdoGf5IPsutQTVbi5OzrQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2019-12-17 14:25, Steve Grubb wrote:
> On Tuesday, December 17, 2019 1:45:41 PM EST Richard Guy Briggs wrote:
> > On 2019-11-08 12:49, Paul Moore wrote:
> > > On Thu, Oct 24, 2019 at 5:23 PM Richard Guy Briggs <rgb@redhat.com> 
> wrote:
> > > > On 2019-10-10 20:38, Paul Moore wrote:
> > > > > On Fri, Sep 27, 2019 at 8:52 AM Neil Horman <nhorman@tuxdriver.com> 
> wrote:
> > > > > > On Wed, Sep 18, 2019 at 09:22:23PM -0400, Richard Guy Briggs wrote:
> > > > > > > Set an arbitrary limit on the number of audit container
> > > > > > > identifiers to
> > > > > > > limit abuse.
> > > > > > > 
> > > > > > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > > > > > ---
> > > > > > > kernel/audit.c | 8 ++++++++
> > > > > > > kernel/audit.h | 4 ++++
> > > > > > > 2 files changed, 12 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/kernel/audit.c b/kernel/audit.c
> > > > > > > index 53d13d638c63..329916534dd2 100644
> > > > > > > --- a/kernel/audit.c
> > > > > > > +++ b/kernel/audit.c
> > > > > 
> > > > > ...
> > > > > 
> > > > > > > @@ -2465,6 +2472,7 @@ int audit_set_contid(struct task_struct
> > > > > > > *task, u64 contid) newcont->owner = current;
> > > > > > > refcount_set(&newcont->refcount, 1);
> > > > > > > list_add_rcu(&newcont->list, &audit_contid_hash[h]);
> > > > > > > +                             audit_contid_count++;
> > > > > > > } else {
> > > > > > > rc = -ENOMEM;
> > > > > > > goto conterror;
> > > > > > > diff --git a/kernel/audit.h b/kernel/audit.h
> > > > > > > index 162de8366b32..543f1334ba47 100644
> > > > > > > --- a/kernel/audit.h
> > > > > > > +++ b/kernel/audit.h
> > > > > > > @@ -219,6 +219,10 @@ static inline int audit_hash_contid(u64
> > > > > > > contid)
> > > > > > > return (contid & (AUDIT_CONTID_BUCKETS-1));
> > > > > > > }
> > > > > > > 
> > > > > > > +extern int audit_contid_count;
> > > > > > > +
> > > > > > > +#define AUDIT_CONTID_COUNT   1 << 16
> > > > > > > +
> > > > > > 
> > > > > > Just to ask the question, since it wasn't clear in the changelog,
> > > > > > what
> > > > > > abuse are you avoiding here?  Ostensibly you should be able to
> > > > > > create as
> > > > > > many container ids as you have space for, and the simple creation
> > > > > > of
> > > > > > container ids doesn't seem like the resource strain I would be
> > > > > > concerned
> > > > > > about here, given that an orchestrator can still create as many
> > > > > > containers as the system will otherwise allow, which will consume
> > > > > > significantly more ram/disk/etc.
> > > > > 
> > > > > I've got a similar question.  Up to this point in the patchset, there
> > > > > is a potential issue of hash bucket chain lengths and traversing them
> > > > > with a spinlock held, but it seems like we shouldn't be putting an
> > > > > arbitrary limit on audit container IDs unless we have a good reason
> > > > > for it.  If for some reason we do want to enforce a limit, it should
> > > > > probably be a tunable value like a sysctl, or similar.
> > > > 
> > > > Can you separate and clarify the concerns here?
> > > 
> > > "Why are you doing this?" is about as simple as I can pose the question.
> > 
> > It was more of a concern for total system resources, primarily memory,
> > but this is self-limiting and an arbitrary concern.
> > 
> > The other limit of depth of nesting has different concerns that arise
> > depending on how reporting is done.
> 
> Well, there is a limit on the audit record size. So, whatever is being sent 
> in the record plus the size of the timestamp deducted from 
> MAX_AUDIT_MESSAGE_LENGTH (8970) is the limit. That can be divided by however 
> many ID's fit in that space and you have the real limit.

This will be addressed in the v8 patch set.

> -Steve

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

