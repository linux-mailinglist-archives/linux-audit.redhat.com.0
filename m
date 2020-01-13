Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1629B139C29
	for <lists+linux-audit@lfdr.de>; Mon, 13 Jan 2020 23:06:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578953167;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FQurSN///+WSi1J+BaVsqXoXk6+yWHbDkdDWyK/9Rms=;
	b=Fxie4cOdZXfkWIaOnmzgEi/BwdTBmda+003PyPPkuSJLvpogfLKVp5vcfeEkDz+Dz0LcC8
	f3NKx3kqPSBOLswcpbRtcsyA7gzUJ0368nsF7umBTyP0xenjap3G2T55QWqA1/m0fIpmLu
	83aNCdZZpwAcgqk96pzuaWYeHypbTAo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-8nj-Mgn8M_eJXN59C--k4Q-1; Mon, 13 Jan 2020 17:06:05 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBD35107ACC4;
	Mon, 13 Jan 2020 22:05:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82FB9A4B60;
	Mon, 13 Jan 2020 22:05:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B96D118089CD;
	Mon, 13 Jan 2020 22:05:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00DM5chx018038 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 13 Jan 2020 17:05:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9E32D108132E; Mon, 13 Jan 2020 22:05:38 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-242.phx2.redhat.com [10.3.116.242])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3AB8D1001B07;
	Mon, 13 Jan 2020 22:05:35 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: PCI System level object
Date: Mon, 13 Jan 2020 17:05:35 -0500
Message-ID: <2470485.v1Se5RCo8b@x2>
Organization: Red Hat
In-Reply-To: <5F4EE10832231F4F921A255C1D954298261DA3@DEERLM99EX7MSX.ww931.my-it-solutions.net>
References: <5F4EE10832231F4F921A255C1D954298261DA3@DEERLM99EX7MSX.ww931.my-it-solutions.net>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 8nj-Mgn8M_eJXN59C--k4Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Monday, January 13, 2020 12:46:15 PM EST MAUPERTUIS, PHILIPPE wrote:
> Redhat is providing audit rules sample for PCI DSS.
> For the requirement 10.2.7 it is written :
> ## 10.2.7 Creation and deletion of system-level objects
> ## This requirement seems to be database table related and not audit
> 
> However the PCI glossary defines system level objects as :
> System-level object:
> Anything on a system component that is required for its operation,
> including but not limited to database tables, stored procedures,
> application executables and configuration files, system configuration
> files, static and shared libraries and DLLs, system executables, device
> drivers and device configuration files,and third-party components. 

This seems a lot like overkill.

> It seems It should be covered by the FIM solution and not by audit.

There is the aide program which can certainly tell you what's changed. But I 
wouldn't exactly call it an audit because it doesn't tell you when something 
changed or who did it.

If you had to meet this, then you might want to use:
30-ospp-v42-1-create-success.rules
30-ospp-v42-4-delete-success.rules

That should limit things to creation and deletion but not access or 
modification which don't seem to be called out. Expect a dnf update to flood 
the system with audit events.

> However loading and unloading kernel modules  should probably be covered by
> auditd. Could you tell me which events are generated in that case ?

The rules are in 43-module-load.rules and they create a syscall event with a 
KERN_MODULE record.

> Are there any others events that should consider for this requirement

It depends on your definition of system level objects. Some define it to also 
include sockets, shared memory, disk partitions (mounts), IPC, USB devices, 
etc. I think a more narrow interpretation is better.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

