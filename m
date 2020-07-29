Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 55E05231FDE
	for <lists+linux-audit@lfdr.de>; Wed, 29 Jul 2020 16:05:50 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-TE4FPj08Nm6xsnez9ZPeLg-1; Wed, 29 Jul 2020 10:05:47 -0400
X-MC-Unique: TE4FPj08Nm6xsnez9ZPeLg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11F311902EA0;
	Wed, 29 Jul 2020 14:05:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5444E1C957;
	Wed, 29 Jul 2020 14:05:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B5EEB18095FF;
	Wed, 29 Jul 2020 14:05:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06TE5OF9019666 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 29 Jul 2020 10:05:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 023512157F23; Wed, 29 Jul 2020 14:05:24 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F250D2166BA3
	for <linux-audit@redhat.com>; Wed, 29 Jul 2020 14:05:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49AAF10DD0C3
	for <linux-audit@redhat.com>; Wed, 29 Jul 2020 14:05:20 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-300-tfHvTU1eNQ-apuQvAPireQ-1; Wed, 29 Jul 2020 10:05:17 -0400
X-MC-Unique: tfHvTU1eNQ-apuQvAPireQ-1
Received: by mail-ed1-f68.google.com with SMTP id o10so7809459edh.6
	for <linux-audit@redhat.com>; Wed, 29 Jul 2020 07:05:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bAVFRrgqiTDhwMCaAtxfUC0KKkFwBycU28eW1S22JSQ=;
	b=YWhi8yWnJbSwuSOuDTU6HqZVT/IOkmgibcdL+JHQ2kDlD5XEs+1UEVckNCoE489bbk
	aFzwDmfg6aFG6OxQ2tx4mpjjEoBkbGsfibiUeohgF5mjcVxUHW7uoYJJcQWs0iaDm6W5
	F9Q65z1HxwfWljsM6IsIt19r3IRKmlAAhYteQReGEmo0J/Tf2gyVqYN8nxVGHHV08Ehw
	D8jGESu8AcuuIT1guM4rADt6O+upo413mGkywge4sjW+OiCdeUDieCJQncFxamT4wOse
	6cCc/uaJKpTHH2AXpOtdT2lOlvM+BtkCq5lvXIfcWaqNLhjTf2nYRiJTVqDdrl6YQe07
	/zbQ==
X-Gm-Message-State: AOAM531HTypC7GoTKY0QtVys6AWd0AjYTGJYWsjux+X8tB2wJz0Txrt2
	n1QprU2l/fe4YuBzNZEpdi69n0PbHJaoNeF4t2IIp4j3Vg==
X-Google-Smtp-Source: ABdhPJwnRo50TRCeb+411nxxUD1mldzg2xefpDtZGX3dmUeZyRV2GrFG16I4MAt2eTBKQGgS0I41FCgILVaPaUbMxRk=
X-Received: by 2002:a05:6402:13d0:: with SMTP id
	a16mr30929040edx.269.1596031514234; 
	Wed, 29 Jul 2020 07:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <159597057565.40164.9909646970085967040.stgit@sifl>
In-Reply-To: <159597057565.40164.9909646970085967040.stgit@sifl>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 29 Jul 2020 10:05:03 -0400
Message-ID: <CAHC9VhT7DJ-1NHv1GzADuceLy6r+fyNHTxKNDcokr4_ODdV-Vw@mail.gmail.com>
Subject: Re: [PATCH] revert: 1320a4052ea1 ("audit: trigger accompanying
	records when no rules present")
To: linux-audit@redhat.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 28, 2020 at 5:09 PM Paul Moore <paul@paul-moore.com> wrote:
>
> Unfortunately the commit listed in the subject line above failed
> to ensure that the task's audit_context was properly initialized/set
> before enabling the "accompanying records".  Depending on the
> sitation, the resulting audit_context could have invalid values in
> some of it's fields which could cause a kernel panic/oops when the
> task/syscall exists and the audit records are generated.
>
> We will revisit the original patch, with the necessary fixes, in a
> future kernel but right now we just want to fix the kernel panic
> with the least amount of added risk.
>
> Cc: stable@vger.kernel.org
> Fixes: 1320a4052ea1 ("audit: trigger accompanying records when no rules present")
> Reported-by: j2468h@googlemail.com
> Signed-off-by: Paul Moore <paul@paul-moore.com>
> ---
>  kernel/audit.c   |    1 -
>  kernel/audit.h   |    8 --------
>  kernel/auditsc.c |    3 +++
>  3 files changed, 3 insertions(+), 9 deletions(-)

William pointed out a misspelling in the patch description above,
which I just fixed.  Unfortunately I had already pushed the patch to
audit/stable-5.8 so I did a force-push to correct the spelling;
normally I wouldn't do something like that for such a trivial matter,
but since it is unlikely anyone is based of the audit/stable-5.8
branch this seemed like an okay time to do that.

I'll be sending a PR to Linus shortly.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

