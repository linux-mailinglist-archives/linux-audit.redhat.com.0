Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 51CAD142EB3
	for <lists+linux-audit@lfdr.de>; Mon, 20 Jan 2020 16:24:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579533850;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1zE7XCNYtvzS5BV3mBvEn5S+NcM3vGochZW//gnb8KQ=;
	b=eN7y6V7CYD1lStLnBWDS73LbnegACD2tb9b3VSIUvgJWVJE7OF2D2DoO8CIULsKDI1LqPP
	/ySozJFMJGhWWnbzKuPovqpyejkWf74H/bM6AH+Pq2pmiKMRMLZ3kHvum87ucaGSYK0eVX
	lskHMljJIcveCpv6lFylLFMYqV9VDjI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-wv_3I6OwMa-q7AEpuMXSuw-1; Mon, 20 Jan 2020 10:24:08 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B03DC1137848;
	Mon, 20 Jan 2020 15:24:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D51160BF4;
	Mon, 20 Jan 2020 15:24:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CE58F18089CD;
	Mon, 20 Jan 2020 15:24:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00KFNrTj020355 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 20 Jan 2020 10:23:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9AD9E5DA32; Mon, 20 Jan 2020 15:23:53 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-179.phx2.redhat.com [10.3.116.179])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6485A5D9E1;
	Mon, 20 Jan 2020 15:23:50 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: Duplicate settings?
Date: Mon, 20 Jan 2020 10:23:50 -0500
Message-ID: <7829952.Y7kJdS22V4@x2>
Organization: Red Hat
In-Reply-To: <f61d4614-cd98-5cad-e739-82ce82ab258b@gmail.com>
References: <725ed78a-f8e8-d73a-486a-13e821567752@gmail.com>
	<7256033.AoGtHsJfsT@x2>
	<f61d4614-cd98-5cad-e739-82ce82ab258b@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: wv_3I6OwMa-q7AEpuMXSuw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Monday, January 20, 2020 10:00:06 AM EST Leam Hall wrote:
> On 1/20/20 9:37 AM, Steve Grubb wrote:
> > On Monday, January 20, 2020 9:24:56 AM EST Leam Hall wrote:
> >> If /etc/audit/auditd.conf encounters conflicting duplicate settings,
> >> 
> >> what happens? Takes the first, takes the last, or what? For example:
> >> 	space_left = 25
> >> 	space_left = 100
> > 
> > It overwrites the first value with the second one. You can also run:
> > 
> > # service auditd state
> > 
> > to see what the current value is if your audit daemon is somewhat recent.
> 
> Hey Steve, thanks! We're on the default RHEL/CentOS 7 auditd, and
> "state" doesn't show space_left.

2.8.5 and later should have it. You have to be in daemon mode and write_logs 
enabled.

-Steve



--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

