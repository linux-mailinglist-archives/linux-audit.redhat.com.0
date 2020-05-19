Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 1C2151DA135
	for <lists+linux-audit@lfdr.de>; Tue, 19 May 2020 21:45:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589917533;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=biHAb/Mk7G/l8Ln+f3whoU/9WvfMiHpRpVvnIrPavoc=;
	b=QXb82IAMuhAlhy/CRXKsR4QmNzNqqzN3GavUjybH6zkVU4KctP3g/vMikeNIk/ZWZAypS0
	zPajaSS5yDLKGL17MmiQEwogaEJJHFXrVpYaldRFqAbdUKQQHY3zhr0PIUm/aj7aZU6z0/
	dHTf5DVEio9y7lauuBkjTCSu9bGFKRA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-bGqP46inOHiphGsJcsWvWQ-1; Tue, 19 May 2020 15:45:31 -0400
X-MC-Unique: bGqP46inOHiphGsJcsWvWQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5633819200C2;
	Tue, 19 May 2020 19:45:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B8DA6246F;
	Tue, 19 May 2020 19:45:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6A1C54ED87;
	Tue, 19 May 2020 19:45:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04JJjBtn022799 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 19 May 2020 15:45:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5AAD360C05; Tue, 19 May 2020 19:45:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E4BD460BEC;
	Tue, 19 May 2020 19:44:59 +0000 (UTC)
Date: Tue, 19 May 2020 15:44:57 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak25 v5] audit: add subj creds to NETFILTER_CFG record
	to cover async unregister
Message-ID: <20200519194457.nouzteqv2vpcqnta@madcap2.tricolour.ca>
References: <2794b22c0b88637a4270b346e52aeb8db7f59457.1589853445.git.rgb@redhat.com>
	<CAHC9VhQYUooJbZ9tcOOwb=48LTjtnfo0g11vQuyLzoxdetaxnw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhQYUooJbZ9tcOOwb=48LTjtnfo0g11vQuyLzoxdetaxnw@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
Cc: fw@strlen.de, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, twoerner@redhat.com,
	Eric Paris <eparis@parisplace.org>, tgraf@infradead.org
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-05-19 15:18, Paul Moore wrote:
> On Tue, May 19, 2020 at 11:31 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> > Some table unregister actions seem to be initiated by the kernel to
> > garbage collect unused tables that are not initiated by any userspace
> > actions.  It was found to be necessary to add the subject credentials to
> > cover this case to reveal the source of these actions.  A sample record:
> >
> > The tty, ses and exe fields have not been included since they are in the
> > SYSCALL record and contain nothing useful in the non-user context.
> >
> >   type=NETFILTER_CFG msg=audit(2020-03-11 21:25:21.491:269) : table=nat family=bridge entries=0 op=unregister pid=153 uid=root auid=unset subj=system_u:system_r:kernel_t:s0 comm=kworker/u4:2
> 
> Based on where things were left in the discussion on the previous
> draft, I think it would be good if you could explain a bit why the uid
> and auid fields are useful here.

They aren't really useful here.  I was hoping to remove them given your
reasoning, but I was having trouble guessing what you wanted even after
asking for clarity.  Can you clarify what you would prefer to see in
this patch?  I was hoping to skip this extra patch revision which took
longer than hoped due to trying to guess what you wanted while working
yesterday during a public holiday to get this patch out in time for the
merge window.

A UID of 0="root" is really a bit misleading since while it is the most
trusted user running the most privileged level, the event wasn't
triggered by a user.  It is the default value of that field.  I did
think aloud that uid could be set by the kernel to run under a
particular user's id (like a daemon dropping capabilities and switching
user after setup to limit abuse), but the kernel is just a tracker for
these IDs and doesn't really know what they mean other than root.  I saw
no reply to that idea.  It was set to "root" which isn't unset or
unexpected, but granted is useless in this case.

You had offered that keeping auid was a concession to Steve so I kept it
in since I had the impression that is what you wanted to see.  That
explanation seems pretty thin to include in a patch description if what
you are getting at in your sentence above.

I am willing to purge both if that is what you would prefer to accept in
the patch.

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

