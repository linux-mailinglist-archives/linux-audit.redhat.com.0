Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 07FCA1CBC33
	for <lists+linux-audit@lfdr.de>; Sat,  9 May 2020 03:49:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588988978;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AwlL+4NnRz2jmXgy5OtKBQ6q4LZupRyoLH0NPZT+d2Y=;
	b=Eq6YhR41J1EHQt7z5UqnxiASpKv3ofvcbhDfMhuFcapxb6tPlaUhylj4lwJhE6PAy0ynqf
	j6x/TbYzfiBVysiGya43WfCY5qo8Vy48mzl/zAct9uRnXUJzdNtvDY5yNM6OBX0Io6cAga
	KMnbrameabnR7TudqG7LeCWzilIBMBw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-YJuLFpdZPe6SGjIbwFBRfQ-1; Fri, 08 May 2020 21:49:35 -0400
X-MC-Unique: YJuLFpdZPe6SGjIbwFBRfQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1941D1005510;
	Sat,  9 May 2020 01:49:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FE1C7049E;
	Sat,  9 May 2020 01:49:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6299C4CAA0;
	Sat,  9 May 2020 01:49:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 048Nld4X030139 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 8 May 2020 19:47:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 616872156A2E; Fri,  8 May 2020 23:47:39 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DAA82166B28
	for <linux-audit@redhat.com>; Fri,  8 May 2020 23:47:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CAC54856FFF
	for <linux-audit@redhat.com>; Fri,  8 May 2020 23:47:34 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-483-166eO2moNF-WNWb2RfJwpw-1;
	Fri, 08 May 2020 19:47:30 -0400
X-MC-Unique: 166eO2moNF-WNWb2RfJwpw-1
Received: from embeddedor (unknown [189.207.59.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 72D7B2063A;
	Fri,  8 May 2020 23:47:28 +0000 (UTC)
Date: Fri, 8 May 2020 18:51:56 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH] audit: Replace zero-length array with flexible-array
Message-ID: <20200508235156.GA27779@embeddedor>
References: <20200507185041.GA13930@embeddedor>
	<CAHC9VhSm_GWWXuzuwrrcTF3QcKCv1WSZv2=WF4t3DB4P7vshoA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhSm_GWWXuzuwrrcTF3QcKCv1WSZv2=WF4t3DB4P7vshoA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 08 May 2020 21:48:58 -0400
Cc: linux-audit@redhat.com, linux-kernel@vger.kernel.org
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

On Thu, May 07, 2020 at 10:52:09PM -0400, Paul Moore wrote:
> >
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> > ---
> >  include/linux/audit.h |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Merged into audit/next, thanks!
> 

Thanks, Paul.

--
Gustavo

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

