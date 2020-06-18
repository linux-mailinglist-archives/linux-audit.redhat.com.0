Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 332A51FF93E
	for <lists+linux-audit@lfdr.de>; Thu, 18 Jun 2020 18:30:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592497842;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0IsR31AIbmdy/V2fykxhuVDfcjluZeNSE1aa8lVP5GM=;
	b=c7jDJGkprDwfYspHeg6/J65cBZNtRmok98W3RnbJ05pLDjFWmPUmPKtcNxFT1paB0QOiNP
	slQiZUY0hF3mIJVJBw/wStPg/YNCPlqpH4OVg7xFN9qv07l1uoZVuS41CiECcOlvVX2pKe
	bsJU25tBgNTvCGdD/kzAnpoaAwX3oZU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-7vKz5gmnO2ywo5o_8LPUAA-1; Thu, 18 Jun 2020 12:30:39 -0400
X-MC-Unique: 7vKz5gmnO2ywo5o_8LPUAA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2636801504;
	Thu, 18 Jun 2020 16:30:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C61360BF4;
	Thu, 18 Jun 2020 16:30:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7783F833C6;
	Thu, 18 Jun 2020 16:30:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05IGUJtf029660 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 18 Jun 2020 12:30:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 97731F77D6; Thu, 18 Jun 2020 16:30:19 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 92C86F7FD3
	for <linux-audit@redhat.com>; Thu, 18 Jun 2020 16:30:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 337AE811E77
	for <linux-audit@redhat.com>; Thu, 18 Jun 2020 16:30:15 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-185-Q-Lc8uJfN56NetFNVTjskg-1; Thu, 18 Jun 2020 12:30:12 -0400
X-MC-Unique: Q-Lc8uJfN56NetFNVTjskg-1
Received: by mail-ed1-f66.google.com with SMTP id c35so5358166edf.5
	for <linux-audit@redhat.com>; Thu, 18 Jun 2020 09:30:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Z2RDANTDm6E/qY2EZVHCZ4I3pSkghs/YjkDWsp3YdWc=;
	b=R+CX5ZCq3S/lvADzPpnVa0YH7wpf75HUZJB7h+xafRx1KIJ8euVRggzfo8B3i1TAO6
	Uy/fQVAZNYw5dT7i5BhfjSikxADlLkdLhpk6MdOhiT0pq4FzJAOieHIVqG/7aN/HSMXQ
	rjqXXsg465AhJjn8bxdvJ2pMZBpOYzFSbDKODFGR+GuadPfKTazjivz8DXq8ONlpfrup
	1JuQtDFK45TSfD8WGUxtCMm1lSnzXVsESNzELZBVzPoriU7Ljyl5lFgUq2J52SSEVBPh
	i9+ny8liCsEVWVV9M9vJOLlloCy9Fqzl4SGAJaoJ0AXfgh5vFL27larrTTq2vnYkQxpq
	S09A==
X-Gm-Message-State: AOAM531DuNWtnYx1sJBmgr4vRYVXs2cYutpgdm7jXdGILXN2dCO248Uf
	WQu74iM/32jnfa8F1yHpo3EvDmvKkH3LGx+3uo4X
X-Google-Smtp-Source: ABdhPJwWxVN0qm+lRwQ1xkvWtl4E4rTgW0jaz9C9xTrwzKxuaoB2efqr+aDLq8wpJ7L6Y3OTUFXfw63GJDx2h8FwWwg=
X-Received: by 2002:aa7:de08:: with SMTP id h8mr4743804edv.164.1592497811353; 
	Thu, 18 Jun 2020 09:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200616045855.GA1699@linux-kernel-dev> <1648649.cZYg8c8PMo@x2>
	<CAHC9VhRVk0OtY=r9iKyVmJJX6m4+oWWV0=idy-FOS9zOszMcKQ@mail.gmail.com>
	<8359651.kEV6mM8lSS@x2>
In-Reply-To: <8359651.kEV6mM8lSS@x2>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 18 Jun 2020 12:29:59 -0400
Message-ID: <CAHC9VhTZfSkWg-ioE0CR9o15PbS9evmb7G-cH_r_Knkqwn_wmA@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jun 18, 2020 at 10:36 AM Steve Grubb <sgrubb@redhat.com> wrote:
> On Thursday, June 18, 2020 9:46:54 AM EDT Paul Moore wrote:
> > On Thu, Jun 18, 2020 at 9:39 AM Steve Grubb <sgrubb@redhat.com> wrote:
> > > The kernel cannot grow the backlog unbounded. If you do nothing, the
> > > backlog is 64 - which is too small to really use. Otherwise, you set the
> > > backlog to a finite number with the -b option.
> >
> > If one were to set the backlog limit to 0, it is effectively disabled
> > allowing the backlog to grow without any restrictions placed on it by
> > the audit subsystem.
>
> Then I'd say you asked for it. The cure is setting a number.

I wasn't commenting on if it was wise or not, that is going to depend
on the goals of the admin.  I just wanted to correct some bad
information you provided so those reading the mailing list were not
ill-informed.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

