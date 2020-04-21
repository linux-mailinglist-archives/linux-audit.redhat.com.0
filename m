Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id CC6071B3111
	for <lists+linux-audit@lfdr.de>; Tue, 21 Apr 2020 22:20:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587500423;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ANGS+l8YU9mhM+pM3vNS8UOOsGT8szxYzU1xqHoL8HQ=;
	b=BM0rmKUGuqBvu86lnv/jEjh9f2udB9wd71IQ/7DR1he1NIIAk9L+JKhMQIdeq2BGlypXp8
	4iWgLlyqnOyr9mcqYT8f8z1JRPAbF61qTAlA/UuFIgnZ5koG/8HiDLex8xq8yGPYFohDsE
	z6mZBRwjRBXVrWCDClsX23phf+5akv0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-p12Xa2vUN1WtbxdkF3uKhw-1; Tue, 21 Apr 2020 16:20:21 -0400
X-MC-Unique: p12Xa2vUN1WtbxdkF3uKhw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 440C8107ACC4;
	Tue, 21 Apr 2020 20:20:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A7E52B3A81;
	Tue, 21 Apr 2020 20:20:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6519F941A3;
	Tue, 21 Apr 2020 20:20:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03LKJurR002921 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 21 Apr 2020 16:19:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0FD1F60C88; Tue, 21 Apr 2020 20:19:56 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.3.128.9])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5540660BEC;
	Tue, 21 Apr 2020 20:19:48 +0000 (UTC)
Date: Tue, 21 Apr 2020 16:19:45 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak25 v3 3/3] audit: add subj creds to NETFILTER_CFG
	record to cover async unregister
Message-ID: <20200421201945.spw3ec4duusijswl@madcap2.tricolour.ca>
References: <cover.1584480281.git.rgb@redhat.com>
	<13ef49b2f111723106d71c1bdeedae09d9b300d8.1584480281.git.rgb@redhat.com>
	<20200318131128.axyddgotzck7cit2@madcap2.tricolour.ca>
	<CAHC9VhTdLZop0eT11H4uSXRj5M=kBet=GkA8taDwGN_BVMyhrQ@mail.gmail.com>
	<20200318213327.ow22q6nnjn3ijq6v@madcap2.tricolour.ca>
	<CAHC9VhSbbjFbF0A_-saquZ8B85XaF7SWD2e1QcWsXhFSQrUAbQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhSbbjFbF0A_-saquZ8B85XaF7SWD2e1QcWsXhFSQrUAbQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
Cc: fw@strlen.de, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	twoerner@redhat.com, Eric Paris <eparis@parisplace.org>,
	tgraf@infradead.org
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

On 2020-04-17 17:53, Paul Moore wrote:
> On Wed, Mar 18, 2020 at 5:33 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > On 2020-03-18 17:22, Paul Moore wrote:
> > > On Wed, Mar 18, 2020 at 9:12 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > > On 2020-03-17 17:30, Richard Guy Briggs wrote:
> > > > > Some table unregister actions seem to be initiated by the kernel to
> > > > > garbage collect unused tables that are not initiated by any userspace
> > > > > actions.  It was found to be necessary to add the subject credentials to
> > > > > cover this case to reveal the source of these actions.  A sample record:
> > > > >
> > > > >   type=NETFILTER_CFG msg=audit(2020-03-11 21:25:21.491:269) : table=nat family=bridge entries=0 op=unregister pid=153 uid=root auid=unset tty=(none) ses=unset subj=system_u:system_r:kernel_t:s0 comm=kworker/u4:2 exe=(null)
> > > >
> > > > Given the precedent set by bpf unload, I'd really rather drop this patch
> > > > that adds subject credentials.
> > > >
> > > > Similarly with ghak25's subject credentials, but they were already
> > > > present and that would change an existing record format, so it isn't
> > > > quite as justifiable in that case.
> > >
> > > Your comments have me confused - do you want this patch (v3 3/3)
> > > considered for merging or no?
> >
> > I would like it considered for merging if you think it will be required
> > to provide enough information about the event that happenned.  In the
> > bpf unload case, there is a program number to provide a link to a
> > previous load action.  In this case, we won't know for sure what caused
> > the table to be unloaded if the number of entries was empty.  I'm still
> > trying to decide if it matters.  For the sake of caution I think it
> > should be included.  I don't like it, but I think it needs to be
> > included.
> 
> I'm in the middle of building patches 1/3 and 2/3, assuming all goes
> well I'll merge them into audit/next (expect mail soon), however I'm
> going back and forth on this patch.  Like you I kinda don't like it,
> and with both of us not in love with this patch I have to ask if there
> is certification requirement for this?  I know about the generic
> subj/obj requirements, but in the case where there is no associated
> task/syscall/etc. information it isn't like the extra fields supplied
> in this patch are going to have much information in that regard; it's
> really the *absence* of that information which is telling.  Which
> brings me to wonder if simply the lack of any associated records in
> this event is enough?  Before when we weren't associating records into
> a single event it would have been a problem, but the way things
> currently are, if there are no other records (and you have configured
> that) then I think you have everything you need to know.
> 
> Thoughts?

I'm good dropping that third patch, but Steve's perspective is more
authoritative here.

I'll respin patch 1/3 and 2/3 to fix the checkpatch.pl errors if you
prefer (was erroneously mentioned in ghak28 feedback).

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

