Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 91BFD1336E7
	for <lists+linux-audit@lfdr.de>; Tue,  7 Jan 2020 23:53:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578437635;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vJfLZr1h2/1gmVRx4AmQ8XH6XuAWg6eRS36B+XFFvrE=;
	b=OnxP1Ezt5vcQn3Nk/2YjaXM0UMUdoP8cfapGEHi3ZfOvZWlK+3nsGnN7fcHyp6IGdByxuQ
	gpoZ77Yv92QEJCoTxUx5bhRzdQwzoxOdxj7HjizR7cPMA4fKFUU5ULQCu/3mtpuwUW9n9w
	srmYS4qLNDrcghloKqI0Gu/yccYY85M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-avO1Rol1PYuD1EAfWD4zzw-1; Tue, 07 Jan 2020 17:53:53 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2EE61800D4E;
	Tue,  7 Jan 2020 22:53:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B2007691AD;
	Tue,  7 Jan 2020 22:53:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9017818089CD;
	Tue,  7 Jan 2020 22:53:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 007MqpKa004302 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 7 Jan 2020 17:52:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 340C9858BA; Tue,  7 Jan 2020 22:52:51 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-167.phx2.redhat.com [10.3.116.167])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 756D9691AD;
	Tue,  7 Jan 2020 22:52:48 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH 1/1] audit: CONFIG_CHANGE don't log internal bookkeeping
	as an event
Date: Tue, 07 Jan 2020 17:52:48 -0500
Message-ID: <5079865.NZeRZbyqen@x2>
Organization: Red Hat
In-Reply-To: <CAHC9VhT28zhWmt2pNDmaLR2p6D39o3LRmVU34Ue3Z_WUNzMdcw@mail.gmail.com>
References: <2595185.DiOs4DVqks@x2>
	<CAHC9VhT28zhWmt2pNDmaLR2p6D39o3LRmVU34Ue3Z_WUNzMdcw@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
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
X-MC-Unique: avO1Rol1PYuD1EAfWD4zzw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Monday, January 6, 2020 8:47:33 PM EST Paul Moore wrote:
> On Sun, Jan 5, 2020 at 10:22 AM Steve Grubb <sgrubb@redhat.com> wrote:
> > Common Criteria calls out for any action that modifies the audit trail to
> > be recorded. That usually is interpreted to mean insertion or removal of
> > rules. It is not required to log modification of the inode information
> > since the watch is still in effect. Additionally, if the rule is a never
> > rule and the underlying file is one they do not want events for, they
> > get an event for this bookkeeping update against their wishes.
> > 
> > Since no device/inode info is logged at insertion and no device/inode
> > information is logged on update, there is nothing meaningful being
> > communicated to the admin by the CONFIG_CHANGE updated_rules event. One
> > can assume that the rule was not "modified" because it is still watching
> > the intended target. If the device or inode cannot be resolved, then
> > audit_panic is called which is sufficient.
> > 
> > I think the correct resolution is to drop logging config_update events
> > since the watch is still in effect but just on another unknown inode.
> 
> Either this patch is the correct resolution or it isn't, the
> description should state that clearly.  If you are unsure we can
> discuss it, but it sounds like you are certain that this record isn't
> needed here, yes?

It's not needed based on the rationale above and it's irritating some people 
because of that.

-Steve


> > Signed-off-by: Steve Grubb <sgrubb@redhat.com>
> > ---
> > 
> >  kernel/audit_watch.c | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/kernel/audit_watch.c b/kernel/audit_watch.c
> > index 4508d5e0cf69..8a8fd732ff6d 100644
> > --- a/kernel/audit_watch.c
> > +++ b/kernel/audit_watch.c
> > @@ -302,8 +302,6 @@ static void audit_update_watch(struct audit_parent
> > *parent,> 
> >                         if (oentry->rule.exe)
> >                         
> >                                 audit_remove_mark(oentry->rule.exe);
> > 
> > -                       audit_watch_log_rule_change(r, owatch,
> > "updated_rules"); -
> > 
> >                         call_rcu(&oentry->rcu, audit_free_rule_rcu);
> >                 
> >                 }




--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

