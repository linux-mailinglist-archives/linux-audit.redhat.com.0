Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 73B44195AF2
	for <lists+linux-audit@lfdr.de>; Fri, 27 Mar 2020 17:20:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585326005;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vZLfFHAejntyca+R9wTLVDf5NbmR52Mo/2B6uPKaOOY=;
	b=XvEl05n29epw/oh7fMOI6UPs5nsROnO4S1px5cfqBCBo9tUHpSccE8bKKxZStZ6wOZgbOG
	ujUEfvaGdhorKoRQPCVZb/RyDfN/ctbFyvHryXUapP4oYdiYCrYT8MWcDlvbqk/L1eFsYf
	tJPKH2Iu4pmArgoz9hrjh7WP69KnogI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-Y4lc_RjbN7CZPlE_x25Fyg-1; Fri, 27 Mar 2020 12:20:03 -0400
X-MC-Unique: Y4lc_RjbN7CZPlE_x25Fyg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F7F68010F2;
	Fri, 27 Mar 2020 16:19:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E7C775E242;
	Fri, 27 Mar 2020 16:19:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E561E18089CD;
	Fri, 27 Mar 2020 16:19:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02RGIAGq012410 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 27 Mar 2020 12:18:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5BD175DA7D; Fri, 27 Mar 2020 16:18:10 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 954235DA75;
	Fri, 27 Mar 2020 16:18:03 +0000 (UTC)
Date: Fri, 27 Mar 2020 12:18:00 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Steve Grubb <sgrubb@redhat.com>
Subject: Re: Full shell access or sudo command
Message-ID: <20200327161800.jsvfizi2dxucv62f@madcap2.tricolour.ca>
References: <5F4EE10832231F4F921A255C1D95429807639D60@DEERLM99EX7MSX.ww931.my-it-solutions.net>
	<1930026.6Tes88mm62@x2>
MIME-Version: 1.0
In-Reply-To: <1930026.6Tes88mm62@x2>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com, "MAUPERTUIS,
	PHILIPPE" <philippe.maupertuis@equensworldline.com>
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-03-27 10:36, Steve Grubb wrote:
> On Friday, March 27, 2020 5:15:37 AM EDT MAUPERTUIS, PHILIPPE wrote:
> > Hi,
> > Our sysadmins are able to use sudo to take a root shell and do whatever
> > they want. On the contrary, application managers for example have only a
> > limited set of sudo scripts and commands Is it possible to find if a given
> > audit message (for example due to a watch on a file) has been  issued in
> > the context of sudo or a shell? My goal is to be able  to search for
> > potential sudo abuse through misconfiguration.
> 
> Assuming direct root login is disabled since root is a shared account, then 
> any event with uid ==0 and session != -1 has to be under sudo/su.

Or uid==0 and auid=>1000 (or 500 on some systems)?

> -Steve

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

