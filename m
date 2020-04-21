Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 75BD81B2F9C
	for <lists+linux-audit@lfdr.de>; Tue, 21 Apr 2020 20:55:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587495310;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DkLsDZEgzEjlSiVhfjmuS9dYcZ7HEerd/BuHVZ032vs=;
	b=IJXq7mu6tPldX7CeJ4LbcYl9n40x9W5UpWwx1N3fdROmPOov+Osx4oMzFCbH+2aVczN57B
	isHaakom6T1d7/INTyL/QbhzMtka7BvjfPPW7s3sHqhmRmRJ0AgKku3AA7hZlGWqZq9JlP
	T5oqEEaTdGW9zS50d4wvDYnsM/udiIU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-qktHlTdPNhK16Z6Dgl_exQ-1; Tue, 21 Apr 2020 14:55:08 -0400
X-MC-Unique: qktHlTdPNhK16Z6Dgl_exQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F373DBA6;
	Tue, 21 Apr 2020 18:55:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 256EC5C1D4;
	Tue, 21 Apr 2020 18:54:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 399E518089C8;
	Tue, 21 Apr 2020 18:54:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03LIsX2X030782 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 21 Apr 2020 14:54:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 459EA1001B3F; Tue, 21 Apr 2020 18:54:33 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.3.128.9])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C5471001B30;
	Tue, 21 Apr 2020 18:54:25 +0000 (UTC)
Date: Tue, 21 Apr 2020 14:54:22 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Steve Grubb <sgrubb@redhat.com>
Subject: Re: [PATCH ghak25 v3 3/3] audit: add subj creds to NETFILTER_CFG
	record to cover async unregister
Message-ID: <20200421185422.ziu2ejdvuofg5fu5@madcap2.tricolour.ca>
References: <cover.1584480281.git.rgb@redhat.com>
	<20200318213327.ow22q6nnjn3ijq6v@madcap2.tricolour.ca>
	<CAHC9VhSbbjFbF0A_-saquZ8B85XaF7SWD2e1QcWsXhFSQrUAbQ@mail.gmail.com>
	<2156032.xcGZvdN1jG@x2>
MIME-Version: 1.0
In-Reply-To: <2156032.xcGZvdN1jG@x2>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
Cc: fw@strlen.de, LKML <linux-kernel@vger.kernel.org>, linux-audit@redhat.com,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-04-21 11:15, Steve Grubb wrote:
> On Friday, April 17, 2020 5:53:47 PM EDT Paul Moore wrote:
> > On Wed, Mar 18, 2020 at 5:33 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > On 2020-03-18 17:22, Paul Moore wrote:
> > > > On Wed, Mar 18, 2020 at 9:12 AM Richard Guy Briggs <rgb@redhat.com> 
> wrote:
> > > > > On 2020-03-17 17:30, Richard Guy Briggs wrote:
> > > > > > Some table unregister actions seem to be initiated by the kernel to
> > > > > > garbage collect unused tables that are not initiated by any
> > > > > > userspace actions.  It was found to be necessary to add the subject
> > > > > > credentials to cover this case to reveal the source of these
> > > > > > actions.  A sample record:
> > > > > >   type=NETFILTER_CFG msg=audit(2020-03-11 21:25:21.491:269) :
> > > > > >   table=nat family=bridge entries=0 op=unregister pid=153 uid=root
> > > > > >   auid=unset tty=(none) ses=unset
> > > > > >   subj=system_u:system_r:kernel_t:s0 comm=kworker/u4:2 exe=(null)
> 
> If this is the kernel, why is pid not 0? And if pid is 0, then isn't 
> exe=/boot/vmlinuz-X.Y.Z-blah?

It isn't PID 0 because it is a kernel thread.

> > > > > Given the precedent set by bpf unload, I'd really rather drop this
> > > > > patch that adds subject credentials.
> 
> <snip> 
> 
> > I'm in the middle of building patches 1/3 and 2/3, assuming all goes
> > well I'll merge them into audit/next (expect mail soon), however I'm
> > going back and forth on this patch.  Like you I kinda don't like it,
> > and with both of us not in love with this patch I have to ask if there
> > is certification requirement for this?
> 
> Yes, any change to information flow must be auditable.
> 
> > I know about the generic
> > subj/obj requirements, but in the case where there is no associated
> > task/syscall/etc. information it isn't like the extra fields supplied
> > in this patch are going to have much information in that regard; it's
> > really the *absence* of that information which is telling.
> 
> Exactly. But if someone does a search based on the fields, they need to be 
> able to find this record. For example, suppose I want to know what actions 
> have been performed by kernel_t, I can run a  search and find this event. 
> 
> > Which brings me to wonder if simply the lack of any associated records in
> > this event is enough?  Before when we weren't associating records into
> > a single event it would have been a problem, but the way things
> > currently are, if there are no other records (and you have configured
> > that) then I think you have everything you need to know.
> > 
> > Thoughts?
> 
> You can't search on the absense of information. There are some fields that 
> have meaning. It's OK if they are unset. It happens for daemons, too. But we 
> don't remove the fields because of it. It tells part of the story.
> 
> -Steve
> 
> 
> --
> Linux-audit mailing list
> Linux-audit@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-audit

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

