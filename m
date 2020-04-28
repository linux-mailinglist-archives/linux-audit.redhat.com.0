Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5342D1BCF9E
	for <lists+linux-audit@lfdr.de>; Wed, 29 Apr 2020 00:16:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588112167;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yjJQxVjDgiFLSUuVgkXfzaB+jgVCIZJOazFvbkQKTvI=;
	b=jQgf2AHxPmm7+OLdQc0Sojr3CeqUSxoKVfqx+qNDKSKYGVT7KA+RWA7YXj8ZMYVKJF6wT9
	7adj7JgiCkqDwmHjAdT1XUPE7ZK/eVBrgxeXHcYL//liftlvqfEz5RwixKBOLX+niJZ83a
	mWN30U9oE4NKpCtZaG157jG6/bqnqXE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-e4BYV-hxMRmnKutR8KZNoQ-1; Tue, 28 Apr 2020 18:16:05 -0400
X-MC-Unique: e4BYV-hxMRmnKutR8KZNoQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85E73835B8B;
	Tue, 28 Apr 2020 22:15:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 803941002395;
	Tue, 28 Apr 2020 22:15:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 92A641809542;
	Tue, 28 Apr 2020 22:15:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03SMFd2A022657 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 28 Apr 2020 18:15:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5148310054E3; Tue, 28 Apr 2020 22:15:39 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D423111CD48
	for <linux-audit@redhat.com>; Tue, 28 Apr 2020 22:15:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5BDD48007C8
	for <linux-audit@redhat.com>; Tue, 28 Apr 2020 22:15:37 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
	[209.85.218.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-10-jbCzRIPoMmy3mVpIfgNbMw-1; Tue, 28 Apr 2020 18:15:34 -0400
X-MC-Unique: jbCzRIPoMmy3mVpIfgNbMw-1
Received: by mail-ej1-f65.google.com with SMTP id q8so195719eja.2
	for <linux-audit@redhat.com>; Tue, 28 Apr 2020 15:15:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qXp1I6HH/Av+hIwjTztKPUJHlaLNrd82Kk+BvbSp5Bg=;
	b=YvlLPCLZzjKUh4pdaT1RnjLEFNlau6L2Eu2E4ngbfpQyj3ghd6E3hEFutTbF8hBdmt
	C82YFnnjY3hs7hjRe5vYo6thzex5ZuptCYaksyMhs6PbVKFxUnS2wscMS0Fl3unpBIaS
	QdID1vZDTcY4ZydnLvWsvuljKkB9eaxa7I75ir4Nkv/ErE7goteYgby8ZsziP/pYyDQQ
	fVGS2DkrBICVsQkavWVaOrCehcc36tDg7h+x6poLxjUPqLmX7YXqELMkQlz8IFe7EIX7
	PXnZdJVuwfjqe+AkH81cXN25NmGplJKGWRINXz1rBesiwCj1fycJ1OK/9rDCni3W5Voh
	f/KQ==
X-Gm-Message-State: AGi0PuZZuUIzo0LQK+q0L5XeisKUem09pxISo/8OMvppd2O+hdi/YoXx
	9ZTOm/9W590hp2AVA4qNeVXNIVUcViZ+cUEEEjI4
X-Google-Smtp-Source: APiQypKItbOYLluWf/Xq3D81mI8VPZ2D1qUNRDymz1VnlMeA6yrBY3d7Oyzty7KYlstf868GeukM9WpAoQE7x9f7el8=
X-Received: by 2002:a17:906:f106:: with SMTP id
	gv6mr27400254ejb.271.1588112133067; 
	Tue, 28 Apr 2020 15:15:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1587500467.git.rgb@redhat.com>
	<97d8dabf45ee191bc4b51dea2ae27d34fd5ea40d.1587500467.git.rgb@redhat.com>
In-Reply-To: <97d8dabf45ee191bc4b51dea2ae27d34fd5ea40d.1587500467.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 28 Apr 2020 18:15:22 -0400
Message-ID: <CAHC9VhRoUntHAhdmkhMOE661rS2_6VK-zL_F8ZxiqGswLQ77UA@mail.gmail.com>
Subject: Re: [PATCH ghak25 v4 1/3] audit: tidy and extend netfilter_cfg
	x_tables and ebtables logging
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03SMFd2A022657
X-loop: linux-audit@redhat.com
Cc: fw@strlen.de, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	twoerner@redhat.com, Eric Paris <eparis@parisplace.org>,
	tgraf@infradead.org
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 22, 2020 at 5:40 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> NETFILTER_CFG record generation was inconsistent for x_tables and
> ebtables configuration changes.  The call was needlessly messy and there
> were supporting records missing at times while they were produced when
> not requested.  Simplify the logging call into a new audit_log_nfcfg
> call.  Honour the audit_enabled setting while more consistently
> recording information including supporting records by tidying up dummy
> checks.
>
> Add an op= field that indicates the operation being performed (register
> or replace).
>
> Here is the enhanced sample record:
>   type=NETFILTER_CFG msg=audit(1580905834.919:82970): table=filter family=2 entries=83 op=replace
>
> Generate audit NETFILTER_CFG records on ebtables table registration.
> Previously this was being done for x_tables registration and replacement
> operations and ebtables table replacement only.
>
> See: https://github.com/linux-audit/audit-kernel/issues/25
> See: https://github.com/linux-audit/audit-kernel/issues/35
> See: https://github.com/linux-audit/audit-kernel/issues/43
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  include/linux/audit.h           | 21 +++++++++++++++++++++
>  kernel/auditsc.c                | 24 ++++++++++++++++++++++++
>  net/bridge/netfilter/ebtables.c | 12 ++++--------
>  net/netfilter/x_tables.c        | 12 +++---------
>  4 files changed, 52 insertions(+), 17 deletions(-)

Merged into audit/next, thanks.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

