Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E90822FDCD3
	for <lists+linux-audit@lfdr.de>; Thu, 21 Jan 2021 00:15:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611184542;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ygihIHR8Bu5+5+IGKk/sKQdSobRISs3QhaY5gpBDwUE=;
	b=Sj+OQYc35iI52dQTG9Svamicxy2l8Sh5qVZlQVBkH32Z0xzFJG/RFpEuscgnIyAxCbf+dN
	DlbAhiPJOuZx64DAQCxOrhVefc09OZ7JUetM1A8qFF5E5tzPpTNTkCdXyGBbCdaEFK1+CT
	WSDIDeKFm2qwDGX3d0im2Gr21bZVlUU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-03SxIbXUOIW4UbH0SMGT5g-1; Wed, 20 Jan 2021 18:15:40 -0500
X-MC-Unique: 03SxIbXUOIW4UbH0SMGT5g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC0981005D44;
	Wed, 20 Jan 2021 23:15:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F6B260C6D;
	Wed, 20 Jan 2021 23:15:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 49688180954D;
	Wed, 20 Jan 2021 23:15:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10KNFEuK013731 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 20 Jan 2021 18:15:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3527310021B3; Wed, 20 Jan 2021 23:15:14 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-114-140.phx2.redhat.com [10.3.114.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DA16110023BD;
	Wed, 20 Jan 2021 23:15:10 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Enzo Matsumiya <ematsumiya@suse.de>
Subject: Re: [RFC] audit.spec: create audit group for log read access
Date: Wed, 20 Jan 2021 18:15:10 -0500
Message-ID: <8724290.CDJkKcVGEf@x2>
Organization: Red Hat
In-Reply-To: <20210120213911.32v27lqeqhrdm53i@hyori>
References: <20210120175224.dchx7f6z6i2bslst@hyori> <5439988.DvuYhMxLoT@x2>
	<20210120213911.32v27lqeqhrdm53i@hyori>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wednesday, January 20, 2021 4:39:11 PM EST Enzo Matsumiya wrote:
> >I consider the audit.spec file to be an example to help others with
> >packaging. But I'm not entirely sure if it's 100% in sync with Fedora
> >since they make arbitrary policy changes like removing gcc and make from
> >the build root which then causes specfile updates. If you want to submit
> >a patch, feel free. I would apply it as an example to others.
> 
> Thanks. We also have some modifications to the specfile.
> 
> So what I'm getting from your reply is it's up to the OS vendor to provide,
> or not, such modification -- i.e. it's more of a general OS problem than
> audit's problem. Is that correct?

I consider it to be an end user choice. Because if you set the log_group, you 
may need to do a chgrp command to get your logs in order. And I don't know 
who should get access. Would it be wheel or a special audit-view group? To 
me, it just seems like any choice I make may not work for everyone.

But you're welcome to send a patch if you want.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

