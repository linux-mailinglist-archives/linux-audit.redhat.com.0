Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 4BBEE1EB050
	for <lists+linux-audit@lfdr.de>; Mon,  1 Jun 2020 22:38:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591043911;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=m+xDuo5O9gSZl/KwWxh/1aTxp5+4x/8Jv0mZZX1PAeg=;
	b=OqCoVrI/7XbRGPqZ6fYoaOmljOS9SNep/ekuesseMXFjpL1CazDlY9IwJKelMWiuHzhAK0
	3rR6D07myY5+CyUpIn779qSyPjRrb98jVZk53xcW64zzG7UG0bgtBIb5Qs1hSJW1nO9zzn
	MkIfKUnPMdIZ0+32mBeggYzcfPVA8Ls=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-0pGxHov5OgSnBH0BKIwmwQ-1; Mon, 01 Jun 2020 16:38:28 -0400
X-MC-Unique: 0pGxHov5OgSnBH0BKIwmwQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBE568014D4;
	Mon,  1 Jun 2020 20:38:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB1086FF1B;
	Mon,  1 Jun 2020 20:38:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7645686C0C;
	Mon,  1 Jun 2020 20:38:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 051FkYZk030200 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 1 Jun 2020 11:46:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 602987D2AD; Mon,  1 Jun 2020 15:46:34 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A6807D2B9
	for <linux-audit@redhat.com>; Mon,  1 Jun 2020 15:46:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6405018ABF81
	for <linux-audit@redhat.com>; Mon,  1 Jun 2020 15:46:32 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-334-S97LqzExMoaEMSxb5hIAHA-1;
	Mon, 01 Jun 2020 11:46:30 -0400
X-MC-Unique: S97LqzExMoaEMSxb5hIAHA-1
Received: from embeddedor (unknown [189.207.59.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id A3D782074B;
	Mon,  1 Jun 2020 15:46:27 +0000 (UTC)
Date: Mon, 1 Jun 2020 10:51:30 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH] audit: Use struct_size() helper in alloc_chunk
Message-ID: <20200601155130.GC10051@embeddedor>
References: <20200524205238.GA17576@embeddedor>
	<CAHC9VhRcpqs6TGoqK_soTz8Jo5BCDfhq1kqKGGJeJpbXhWZRsg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhRcpqs6TGoqK_soTz8Jo5BCDfhq1kqKGGJeJpbXhWZRsg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 01 Jun 2020 16:37:27 -0400
Cc: linux-audit@redhat.com, linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>
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
Content-Disposition: inline

On Mon, Jun 01, 2020 at 11:36:09AM -0400, Paul Moore wrote:
> >
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> > ---
> >  kernel/audit_tree.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> Thanks, this looks reasonable to me, but it came in too late for the
> v5.8 merge window (I dislike taking changes past -rc5/6 unless

Sounds sensible.

> critical).  Once the merge window closes I'll merge this into
> audit/next.
> 

Thanks, Paul.
--
Gustavo

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

