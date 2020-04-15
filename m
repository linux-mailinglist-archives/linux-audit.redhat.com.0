Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6C29D1AAC59
	for <lists+linux-audit@lfdr.de>; Wed, 15 Apr 2020 17:54:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586966071;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=td+7M9tgfunxc18SilAq287Eo+DyoxotGuru3GrwUkI=;
	b=DA1saUIESTfod8ik7jdXn5DXlRcxy7oJhdgXzfGX9tYVvqGU3dBgveOmPrry84xI/XmgpG
	4r55UVqapWIY6s5ADy8l+DJVplgim4Y8va62Tpa1E6/F1rdkzqFVZ+7aqeiMbH/jrmNiLw
	JFCZ20bWlIMtfEVltaT9qnTIQNzDJuQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-09DLvDOYNNmcobKr2-tEew-1; Wed, 15 Apr 2020 11:54:27 -0400
X-MC-Unique: 09DLvDOYNNmcobKr2-tEew-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D5ED8017F6;
	Wed, 15 Apr 2020 15:54:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B505F11D2D9;
	Wed, 15 Apr 2020 15:54:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1662E93363;
	Wed, 15 Apr 2020 15:54:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03FFs75C011965 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 15 Apr 2020 11:54:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 676CB9F9B0; Wed, 15 Apr 2020 15:54:07 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.3.128.9])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 412FD99E03;
	Wed, 15 Apr 2020 15:53:58 +0000 (UTC)
Date: Wed, 15 Apr 2020 11:53:55 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Luca BRUNO <lucab@redhat.com>
Subject: Re: multicast listeners and audit events to kmsg
Message-ID: <20200415155355.qudqepcvvler55xs@madcap2.tricolour.ca>
References: <20200414092740.2fdf0f78@xantho>
MIME-Version: 1.0
In-Reply-To: <20200414092740.2fdf0f78@xantho>
User-Agent: NeoMutt/20180716
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-04-14 09:27, Luca BRUNO wrote:
> Hi all,
> I'm trying to re-spin a very old thread related to multicast listeners
> and audit events to kmsg.
> 
> One surprising kernel behavior when using only a multicast listener
> to collect audit events (in this case, systemd-journald) is that
> audit events end up spamming the console [0].
> 
> [0] https://github.com/systemd/systemd/issues/15324

This is not surprising, since the multicast audit socket is not
considered a reliable sink for the audit log and thus cannot be relied
upon to key the decision to forward potentially lost messages to the
system log.

> After a bunch of digging, it seems like this is due to a long-standing
> RFE on the kernel side [1] (plus further references on BZ and LKML).
> 
> [1] https://github.com/linux-audit/audit-kernel/issues/102
> 
> Apparently there isn't a clear consensus on how this should be
> approached. Looking at the github and bugzilla tickets, it seems to me
> that Eric and Paul initially had in mind some logic based on multicast
> listener detection, while Richard doesn't deem that reliable and
> suggests an explicit configuration.

I'm regretting having developped this feature due to the problems it has
caused the audit developpers and innocent bystanders.  Instead, an audit
daemon plugin should have been used to direct log records to journald.

My understanding is Paul does not think multicast listener detection is
reliable enough either.

> I'm not personally knowledgeable enough to judge kernel-land
> approaches (nor to implement them), but I'd be happy if the audit folks
> could converge to a consensus on how to implement this RFE, how it
> would be consumed by userland, and what would be the kernel default
> behavior once this RFE is implemented.

Well, Steve, Paul and myself are all fairly firmly on the side of the
problem being in systemd and its overreach.

> For Richard and the "explicit configuration" approach in particular, I'm
> missing some further details:
>  * Is the current behavior considered buggy, or is that intended to be
>    kept as the default?

The current systemd behaviour of unilatterally enabling audit logging is
considered buggy.  The current audit kernel behaviour is considered
intentional.

>  * Would this be tweaked via a (boolean?) sysctl, and what would be the
>    semantics of flipping it?

It would be controlled via a new audit unicast netlink message similar
to the one that enabled auditing in the first place by systemd that
would explicitly disable klog when a multicast client is connected.

>  * How would this play with namespacing, especially netns?

Currently, it is moot since there can be only one audit daemon and it
listens in all network namespaces.

The future needs some thought since there are tickets open to allow
multiple audit daemons and to devise a way to route messages to those
multiple audit daemons.

> Ciao, Luca

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

