Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1FEED317255
	for <lists+linux-audit@lfdr.de>; Wed, 10 Feb 2021 22:27:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612992457;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Xs+65S1SWJ0ea3goRxfI+8blsLGEk3c321Qn2k0tNvE=;
	b=GSINjxBLP4vjH41Ec8aPwtFogV+G8jHNdU/2xr2uIrJRoA3KF3rjwgueyt58w+J/EJJKs3
	prbO9VjbiVitv8OHTo5YC3c2b2RxlxfdaommkAlUvANNdVAlThkiWsZ/w+zsZVuwOymRrR
	HJvRGF1ni6cuNbeNzXV88O/8QLEMIDg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-GIgVtZqdP52V05_7ifov8A-1; Wed, 10 Feb 2021 16:27:34 -0500
X-MC-Unique: GIgVtZqdP52V05_7ifov8A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E82B1020C22;
	Wed, 10 Feb 2021 21:27:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A9B8719C44;
	Wed, 10 Feb 2021 21:27:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0CCD457DFA;
	Wed, 10 Feb 2021 21:27:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11ALQjeR018068 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 10 Feb 2021 16:26:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 461F11A86A; Wed, 10 Feb 2021 21:26:45 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-117-36.rdu2.redhat.com [10.10.117.36])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F00181A838;
	Wed, 10 Feb 2021 21:26:42 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com, Alan Evangelista <alan.vitor@gmail.com>
Subject: Re: Samba and AuditD
Date: Wed, 10 Feb 2021 16:26:39 -0500
Message-ID: <2316118.jE0xQCEvom@x2>
Organization: Red Hat
In-Reply-To: <CAKz+TUvuOh849j=CaM=OjH1dwbr0bocM6_gdGO-i-wA2-bkr5g@mail.gmail.com>
References: <CAKz+TUvuOh849j=CaM=OjH1dwbr0bocM6_gdGO-i-wA2-bkr5g@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

Moderator system is acting up. But it'll go through eventually.

On Wednesday, February 10, 2021 3:41:45 PM EST Alan Evangelista wrote:
> I have installed audit 2.8.5 on a CentOS 7 and set up the following rule in
> /etc/audit/rules.d/audit.rules:
> 
> -w /data
> 
> /data is shared via Samba to a Windows Server 2016 system. If I write to
> /data in the CentOS7 system, I get the open syscall event in the auditd
> log. If I write to the same directory in the Windows Server 2016, I see the
> file in the /data directory in the CentOS7 system, but the event is not
> logged by audit. Is that the expected behavior?

Unfortunately, yes. The Linux kernel has no idea who the user is in the 
Windows machine since they're not really logged in. This applies to all 
remote files systems. They may yield a few events, but that is more by 
accident than design.

-Steve



--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

