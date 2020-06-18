Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1AEF11FF39D
	for <lists+linux-audit@lfdr.de>; Thu, 18 Jun 2020 15:47:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592488053;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LlCa4THtgFOAaV7NI6MRUecVltbQiJJ8A5BP7WzAbnQ=;
	b=LVX6yDc033EgsNNjJAEMpxcRtgxZdDbjy/JgmedQlZ0rXI02bq8eBzudqJ5GtaVDrr9bJK
	dpXthla07NyaO0eJX385iyBUonEj9DQN1YCNTlfwqwJhZtl0r+nRocwdjO7dgQYYi2DnFg
	FUoJsb4MqRl+0NjzjIF8fts6+qvXHrA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-fSE6ESeDO2GG7V6LCQnQAw-1; Thu, 18 Jun 2020 09:47:31 -0400
X-MC-Unique: fSE6ESeDO2GG7V6LCQnQAw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6312A0C03;
	Thu, 18 Jun 2020 13:47:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D6A771667;
	Thu, 18 Jun 2020 13:47:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B8A17833C8;
	Thu, 18 Jun 2020 13:47:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05IDlFF9008301 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 18 Jun 2020 09:47:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 24194F5AEE; Thu, 18 Jun 2020 13:47:15 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F68FF5AF6
	for <linux-audit@redhat.com>; Thu, 18 Jun 2020 13:47:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D84E101A526
	for <linux-audit@redhat.com>; Thu, 18 Jun 2020 13:47:12 +0000 (UTC)
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
	[209.85.218.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-266-FTYKbwqbNumVZZdZ3XedRA-1; Thu, 18 Jun 2020 09:47:07 -0400
X-MC-Unique: FTYKbwqbNumVZZdZ3XedRA-1
Received: by mail-ej1-f67.google.com with SMTP id dp18so6467950ejc.8
	for <linux-audit@redhat.com>; Thu, 18 Jun 2020 06:47:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=E9cHNWvMNRGbn5bRnG3IhP+WFx2nAW0h0oDr+09iYog=;
	b=JvjHaUdwM+1J5BSzysp8m7wvK9tznsE7NJksu194x55Dc3Z4P5nr6OZzyh00CVgMrT
	baEiAFZ77sUIBbdsB4BIinlAQcJXVCTXoEPXSxp6C/naO7VOyVdhQIYe0O6dlD80WH6M
	fqO/pDJFjx9Mh16vHAvLbCiqSTSBdnY6UAoJ4F3CK6TpEDajSH8NGb2OYTDQ+2LpG7d3
	og+BRTcyTXpca+FaPj/+vi8iL53/Vvgji1RRM7Ul+NnBrfKbcEaZgct08btsVn1zPMy9
	KxoIJXkwRAuvzX6CR1rqizY74QcAkv8MAbLxr04Yy52BbR1G9HRPKJJR2atoTqNOMixE
	ufkg==
X-Gm-Message-State: AOAM531Cl0n0HIN1RpcdxHN1uCKsOL3t4zZ6M7S0FtZRfjC2Xj1nv5yH
	+F3hCDdbS0GCAKKsVxpynrqEJQqEsJNq9MEINT+X
X-Google-Smtp-Source: ABdhPJxQOo8PiGfKOeN+WbC41L5VO5yLjRhSoUQwITcgLSfBb0GqAkhegKC107btm9epagm3crK+HLu4kSHi7Izp3+Q=
X-Received: by 2002:a17:906:19d3:: with SMTP id
	h19mr3959412ejd.106.1592488025823; 
	Thu, 18 Jun 2020 06:47:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200616045855.GA1699@linux-kernel-dev>
	<CAHC9VhSotFw2i7HzWrHUyc6VSbwTpv8ZBeP58H_mzi6bd=Uouw@mail.gmail.com>
	<20200617225416.GA2688@linux-kernel-dev> <1648649.cZYg8c8PMo@x2>
In-Reply-To: <1648649.cZYg8c8PMo@x2>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 18 Jun 2020 09:46:54 -0400
Message-ID: <CAHC9VhRVk0OtY=r9iKyVmJJX6m4+oWWV0=idy-FOS9zOszMcKQ@mail.gmail.com>
Subject: Re: [PATCH] audit: optionally print warning after waiting to enqueue
	record
To: Steve Grubb <sgrubb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jun 18, 2020 at 9:39 AM Steve Grubb <sgrubb@redhat.com> wrote:
> The kernel cannot grow the backlog unbounded. If you do nothing, the backlog
> is 64 - which is too small to really use. Otherwise, you set the backlog to a
> finite number with the -b option.

If one were to set the backlog limit to 0, it is effectively disabled
allowing the backlog to grow without any restrictions placed on it by
the audit subsystem.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

