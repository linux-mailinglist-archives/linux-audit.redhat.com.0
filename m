Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 6F37CEA5F2
	for <lists+linux-audit@lfdr.de>; Wed, 30 Oct 2019 23:04:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572473072;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CuDd8cIDr0ISqQ+EUr2ZzLKXUiiDIFfg8q53qwX1pM0=;
	b=cpKlt+uPu4XfaCiEkT/zHyEvHrbcFkIhSxsvYkHhrTI8h1LZGvLoYDf8yXiMe6VqHcU+ZP
	t3HqkVVJ+s963Uwdp2xC0pNXr5U2km+hqGEdn1jQcN5Bvi2D+aawXl9DVW5sKNXF0iO8eO
	19rlgL6thK0NEt1oFthrrF7qFYp22mU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-7P795RBHOg2evyBi6QG7PA-1; Wed, 30 Oct 2019 18:04:30 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9AE71005500;
	Wed, 30 Oct 2019 22:04:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B99F419756;
	Wed, 30 Oct 2019 22:04:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 44BED1803C33;
	Wed, 30 Oct 2019 22:04:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9UM40Mb002807 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 30 Oct 2019 18:04:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2FCF85C54A; Wed, 30 Oct 2019 22:04:00 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-19.phx2.redhat.com [10.3.112.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FBB15C548;
	Wed, 30 Oct 2019 22:03:22 +0000 (UTC)
Date: Wed, 30 Oct 2019 18:03:20 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak90 V7 20/21] audit: add capcontid to set contid
	outside init_user_ns
Message-ID: <20191030220320.tnwkaj5gbzchcn7j@madcap2.tricolour.ca>
References: <cover.1568834524.git.rgb@redhat.com>
	<214163d11a75126f610bcedfad67a4d89575dc77.1568834525.git.rgb@redhat.com>
	<20191019013904.uevmrzbmztsbhpnh@madcap2.tricolour.ca>
	<CAHC9VhRPygA=LsHLUqv+K=ouAiPFJ6fb2_As=OT-_zB7kGc_aQ@mail.gmail.com>
	<20191021213824.6zti5ndxu7sqs772@madcap2.tricolour.ca>
	<CAHC9VhRdNXsY4neJpSoNyJoAVEoiEc2oW5kSscF99tjmoQAxFA@mail.gmail.com>
	<20191021235734.mgcjotdqoe73e4ha@madcap2.tricolour.ca>
	<CAHC9VhSiwnY-+2awxvGeO4a0NgfVkOPd8fzzBVujp=HtjskTuQ@mail.gmail.com>
	<20191024210010.owwgc3bqbvtdsqws@madcap2.tricolour.ca>
	<CAHC9VhRDoX9du4XbCnBtBzsNPMGOsb-TKM1CC+sCL7HP=FuTRQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhRDoX9du4XbCnBtBzsNPMGOsb-TKM1CC+sCL7HP=FuTRQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 7P795RBHOg2evyBi6QG7PA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On 2019-10-30 16:27, Paul Moore wrote:
> On Thu, Oct 24, 2019 at 5:00 PM Richard Guy Briggs <rgb@redhat.com> wrote=
:
> > Here's the note I had from that meeting:
> >
> > - Eric raised the issue that using /proc is likely to get more and more
> >   hoary due to mount namespaces and suggested that we use a netlink
> > audit message (or a new syscall) to set the audit container identifier
> > and since the loginuid is a similar type of operation, that it should b=
e
> > migrated over to a similar mechanism to get it away from /proc.  Get
> > could be done with a netlink audit message that triggers an audit log
> > message to deliver the information.  I'm reluctant to further pollute
> > the syscall space if we can find another method.  The netlink audit
> > message makes sense since any audit-enabled service is likely to alread=
y
> > have an audit socket open.
>=20
> Thanks for the background info on the off-list meeting.  I would
> encourage you to have discussions like this on-list in the future; if
> that isn't possible, hosting a public call would okay-ish, but a
> distant second.

I'm still trying to get Eric's attention to get him to weigh in here and
provide a more eloquent representation of his ideas and concerns.  Some
of it was related to CRIU(sp?) issues which we've already of which we've
already seen similar concerns in namespace identifiers including the
device identity to qualify it.

> At this point in time I'm not overly concerned about /proc completely
> going away in namespaces/containers that are full featured enough to
> host a container orchestrator.  If/when reliance on procfs becomes an
> issue, we can look at alternate APIs, but given the importance of
> /proc to userspace (including to audit) I suspect we are going to see
> it persist for some time.  I would prefer to see you to drop the audit
> container ID netlink API portions of this patchset and focus on the
> procfs API.

I've already refactored the code to put the netlink bits at the end as
completely optional pieces for completeness so they won't get in the way
of the real substance of this patchset.  The nesting depth and total
number of containers checks have also been punted to the end of the
patchset to get them out of the way of discussion.

> Also, for the record, removing the audit loginuid from procfs is not
> something to take lightly, if at all; like it or not, it's part of the
> kernel API.

Oh, I'm quite aware of how important this change is and it was discussed
with Steve Grubb who saw the concern and value of considering such a
disruptive change.  Removing proc support for auid/ses would be a
long-term deprecation if accepted.

Really, I should have labelled the v7 patchset as RFC since there were
so many new and disruptive ideas presented in it.

> paul moore
> www.paul-moore.com

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

