Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0D28E130480
	for <lists+linux-audit@lfdr.de>; Sat,  4 Jan 2020 22:08:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578172093;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/REd6gVXhFkj+ot3ZLY3fA6d6Egr8inxqbfLT0qAK8Y=;
	b=P2vpvXUybWm/HvbDW2tgPwy+7ySasIDWXUPlhNpyDHVlt3XPBfLoMonZnHCfdYY7ZTDcr3
	bXqBijpqsJ+yv0lJIKgUwndYloEVDWxhRozyQjq59/8IShkLI/rpcbJmkrErOaFRs7E/4c
	pSX+9sMmThbmo8wKHf12w+GZaSO9VDM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-vmVvx0gQNFicAVSt4HPnkg-1; Sat, 04 Jan 2020 16:08:11 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7279D477;
	Sat,  4 Jan 2020 21:08:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 891D45D9D6;
	Sat,  4 Jan 2020 21:07:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3AEB581E09;
	Sat,  4 Jan 2020 21:07:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 004L75jB002266 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 4 Jan 2020 16:07:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9716C1081325; Sat,  4 Jan 2020 21:07:05 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-96.phx2.redhat.com [10.3.116.96])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 319AD10013D9;
	Sat,  4 Jan 2020 21:07:02 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: Config_change events
Date: Sat, 04 Jan 2020 16:07:02 -0500
Message-ID: <6165760.8hHFWGXKb8@x2>
Organization: Red Hat
In-Reply-To: <5F4EE10832231F4F921A255C1D954298251E24@DEERLM99EX7MSX.ww931.my-it-solutions.net>
References: <5F4EE10832231F4F921A255C1D954298251E24@DEERLM99EX7MSX.ww931.my-it-solutions.net>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
Cc: "MAUPERTUIS, PHILIPPE" <philippe.maupertuis@equensworldline.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: vmVvx0gQNFicAVSt4HPnkg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Monday, December 30, 2019 12:21:15 PM EST MAUPERTUIS, PHILIPPE wrote:
> When I issue a service auditd restart, I get the following events :
> [root@xxxxxxxx ~]# ausearch -k 10.5.5-modification-audit -ts recent
> --format raw node=xxxxxxxx type=CONFIG_CHANGE
> msg=audit(1577725960.912:8745):  auid=4294967295 ses=4294967295
> op=remove_rule key="10.5.5-modification-audit" list=4 res=1AUID="unset"
> node=xxxxxxxx type=CONFIG_CHANGE msg=audit(1577725960.947:8777): 
> auid=4294967295 ses=4294967295 op=add_rule key="10.5.5-modification-audit"
> list=4 res=1AUID="unset"
> 
> How can I link this event to the daemon_start daemon_end events ?

The best way is by a time window. Did it occur within a second of the audit 
daemon starting or stopping?

> How can I trace the CONFIG_CHANGE events to a user action ?

You would have to place a watch on auditctl. In this particular case, auid 
and session are -1, which means a daemon did it.

> Are the Daemon_start and daemon_end events specifically linked to auditd ?

Yes.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

