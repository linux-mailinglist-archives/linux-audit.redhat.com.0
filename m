Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E0CCC1B2AD5
	for <lists+linux-audit@lfdr.de>; Tue, 21 Apr 2020 17:15:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587482143;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5TzFpiwfI+1p7KJvSbJDDqSXOy6BqZIiVgHFAyOiUD0=;
	b=C8XElItKnu60QSx6VsiNNGmcKsHv2ov2Xp5F48PSKYiPUgoI+xNfViqXE/UyuU+wU5nbZ7
	OE3Fh1Bo3uCsOAPJ6errcjmqSBJ1Q64QDMe+IDSKOqgscpzFHzOq/muQdPWIEeesVD2h7y
	kj0xoZDtU4WdnlcZGP6d/0h7yNFk62c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-VG60D5GLMzqCfJKeyol1lA-1; Tue, 21 Apr 2020 11:15:40 -0400
X-MC-Unique: VG60D5GLMzqCfJKeyol1lA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B264118FE863;
	Tue, 21 Apr 2020 15:15:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A3D28A105B;
	Tue, 21 Apr 2020 15:15:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 744C493A97;
	Tue, 21 Apr 2020 15:15:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03LFFBPw010481 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 21 Apr 2020 11:15:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F084B76E95; Tue, 21 Apr 2020 15:15:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-113-195.phx2.redhat.com [10.3.113.195])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2781376E92;
	Tue, 21 Apr 2020 15:15:04 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: [PATCH ghak25 v3 3/3] audit: add subj creds to NETFILTER_CFG
	record to cover async unregister
Date: Tue, 21 Apr 2020 11:15:02 -0400
Message-ID: <2156032.xcGZvdN1jG@x2>
Organization: Red Hat
In-Reply-To: <CAHC9VhSbbjFbF0A_-saquZ8B85XaF7SWD2e1QcWsXhFSQrUAbQ@mail.gmail.com>
References: <cover.1584480281.git.rgb@redhat.com>
	<20200318213327.ow22q6nnjn3ijq6v@madcap2.tricolour.ca>
	<CAHC9VhSbbjFbF0A_-saquZ8B85XaF7SWD2e1QcWsXhFSQrUAbQ@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, fw@strlen.de,
	LKML <linux-kernel@vger.kernel.org>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Friday, April 17, 2020 5:53:47 PM EDT Paul Moore wrote:
> On Wed, Mar 18, 2020 at 5:33 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > On 2020-03-18 17:22, Paul Moore wrote:
> > > On Wed, Mar 18, 2020 at 9:12 AM Richard Guy Briggs <rgb@redhat.com> 
wrote:
> > > > On 2020-03-17 17:30, Richard Guy Briggs wrote:
> > > > > Some table unregister actions seem to be initiated by the kernel to
> > > > > garbage collect unused tables that are not initiated by any
> > > > > userspace actions.  It was found to be necessary to add the subject
> > > > > credentials to cover this case to reveal the source of these
> > > > > actions.  A sample record:
> > > > >   type=NETFILTER_CFG msg=audit(2020-03-11 21:25:21.491:269) :
> > > > >   table=nat family=bridge entries=0 op=unregister pid=153 uid=root
> > > > >   auid=unset tty=(none) ses=unset
> > > > >   subj=system_u:system_r:kernel_t:s0 comm=kworker/u4:2 exe=(null)

If this is the kernel, why is pid not 0? And if pid is 0, then isn't 
exe=/boot/vmlinuz-X.Y.Z-blah?

> > > > Given the precedent set by bpf unload, I'd really rather drop this
> > > > patch that adds subject credentials.

<snip> 

> I'm in the middle of building patches 1/3 and 2/3, assuming all goes
> well I'll merge them into audit/next (expect mail soon), however I'm
> going back and forth on this patch.  Like you I kinda don't like it,
> and with both of us not in love with this patch I have to ask if there
> is certification requirement for this?

Yes, any change to information flow must be auditable.

> I know about the generic
> subj/obj requirements, but in the case where there is no associated
> task/syscall/etc. information it isn't like the extra fields supplied
> in this patch are going to have much information in that regard; it's
> really the *absence* of that information which is telling.

Exactly. But if someone does a search based on the fields, they need to be 
able to find this record. For example, suppose I want to know what actions 
have been performed by kernel_t, I can run a  search and find this event. 

> Which brings me to wonder if simply the lack of any associated records in
> this event is enough?  Before when we weren't associating records into
> a single event it would have been a problem, but the way things
> currently are, if there are no other records (and you have configured
> that) then I think you have everything you need to know.
> 
> Thoughts?

You can't search on the absense of information. There are some fields that 
have meaning. It's OK if they are unset. It happens for daemons, too. But we 
don't remove the fields because of it. It tells part of the story.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

