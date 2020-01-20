Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id CF4A1142DBC
	for <lists+linux-audit@lfdr.de>; Mon, 20 Jan 2020 15:37:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579531072;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rV3L+MsSHiQgqRiqLOY2FNw4/icxzzJO79+Das7bWnw=;
	b=Jp28P9qpyxXc2Pb6VZZhbSA/NUyk6/GA93p0AGakC4qIdEMsYFrxeC5z5NaNhs21ILHnw8
	i0i+mQ4yc4R/MK0/4weftU09Q58GaJw0x4eC/7Q8aHQeo2peUUbcualh1/DBdplKwawrNj
	mI3Uw6ulMS/AJBGWARtKy9nt2p7OO48=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-lzIw8gmGPPqVASyG4B-G3Q-1; Mon, 20 Jan 2020 09:37:50 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC379800D54;
	Mon, 20 Jan 2020 14:37:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EE465C1BB;
	Mon, 20 Jan 2020 14:37:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B734C18089C8;
	Mon, 20 Jan 2020 14:37:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00KEbZrn017560 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 20 Jan 2020 09:37:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9F6B65C299; Mon, 20 Jan 2020 14:37:35 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-179.phx2.redhat.com [10.3.116.179])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 666C25C1BB;
	Mon, 20 Jan 2020 14:37:32 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: Duplicate settings?
Date: Mon, 20 Jan 2020 09:37:32 -0500
Message-ID: <7256033.AoGtHsJfsT@x2>
Organization: Red Hat
In-Reply-To: <725ed78a-f8e8-d73a-486a-13e821567752@gmail.com>
References: <725ed78a-f8e8-d73a-486a-13e821567752@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
Cc: Leam Hall <leamhall@gmail.com>
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
X-MC-Unique: lzIw8gmGPPqVASyG4B-G3Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Monday, January 20, 2020 9:24:56 AM EST Leam Hall wrote:
> If /etc/audit/auditd.conf encounters conflicting duplicate settings,
> what happens? Takes the first, takes the last, or what? For example:
> 
> 	space_left = 25
> 	space_left = 100

It overwrites the first value with the second one. You can also run:

# service auditd state

to see what the current value is if your audit daemon is somewhat recent.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

