Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 875EC211216
	for <lists+linux-audit@lfdr.de>; Wed,  1 Jul 2020 19:42:26 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-Bpd3LkxuPPSAS__ndr1yfw-1; Wed, 01 Jul 2020 13:42:23 -0400
X-MC-Unique: Bpd3LkxuPPSAS__ndr1yfw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 764E61005513;
	Wed,  1 Jul 2020 17:42:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 50D3260C81;
	Wed,  1 Jul 2020 17:42:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BCA826C9C4;
	Wed,  1 Jul 2020 17:42:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 061Hdngm017416 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 1 Jul 2020 13:39:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 12A792144B39; Wed,  1 Jul 2020 17:39:49 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DAC42156A3B
	for <linux-audit@redhat.com>; Wed,  1 Jul 2020 17:39:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EAA2F8EF3AA
	for <linux-audit@redhat.com>; Wed,  1 Jul 2020 17:39:46 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-24-REkcJUrdMq2jFnyi1mkypg-1; Wed, 01 Jul 2020 13:39:40 -0400
X-MC-Unique: REkcJUrdMq2jFnyi1mkypg-1
Received: by mail-ed1-f66.google.com with SMTP id dg28so20795227edb.3
	for <linux-audit@redhat.com>; Wed, 01 Jul 2020 10:39:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Yn7XeTVjkVmqd3P77wwFRaYsNWRPThlLTupAArbmm7w=;
	b=OH9tF5i31fdWkZmLBQvvjB66a5qEddgoiODLoeUs+mkejpSJTlnjBJoNpcW0nRPzoT
	ZyyGeEM8LZT42dZIWp0nXOq07GMS5OkqUuWLP9Ak+p7gbq+Atcos70roEKzm4YwxX5ek
	B90kGadbyJhm7VY49l+T7vLv+uPQGkQce/BQtFmwUhkH/DvnhEuwASQ6VYJozy5GyyDI
	Lb4QqIH6zrNdbyZpmw8UxL1DDscBdNY7P9zCdPOpY8GcVrsMhVzD3OsCrvdsucUAhxaM
	c7OP+GRfL7nKqq9tUZRpUHBwrFs2H90gtndVXpKMtsmHXSy+bMFl+6LYirxPZWdx9aBu
	aekw==
X-Gm-Message-State: AOAM532kQJY79Taz3fvyCP9bVmMK0c3AZPOpgoa90fjo2umYFui0QfPy
	3wG/KveL6fnvHZXo4IbX4kW8ReTw7phg/HR/bfM5qU4=
X-Google-Smtp-Source: ABdhPJziOX3izU3BH5ucPG8aFjJtUSerMH8c7zhUQPft5HrGQaVH+XtpdPkQICqmt97NtBa3VxioFYyFztradLGWs9c=
X-Received: by 2002:aa7:d6cf:: with SMTP id x15mr29643066edr.164.1593625179109;
	Wed, 01 Jul 2020 10:39:39 -0700 (PDT)
MIME-Version: 1.0
References: <8d93828705825f4126708f9cae463afd1d88ac95.1593555369.git.rgb@redhat.com>
In-Reply-To: <8d93828705825f4126708f9cae463afd1d88ac95.1593555369.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 1 Jul 2020 13:39:28 -0400
Message-ID: <CAHC9VhREUM34rDEbo0hzs03bsaPWc+xVG=KHZSmqS4xnRef+xw@mail.gmail.com>
Subject: Re: [PATCH] audit: remove unused !CONFIG_AUDITSYSCALL __audit_inode*
	stubs
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: Eric Paris <eparis@parisplace.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>, viro@zeniv.linux.org.uk
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

On Tue, Jun 30, 2020 at 6:17 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> Added 14 years ago in commit 73241ccca0f7 ("[PATCH] Collect more inode
> information during syscall processing.") but never used however
> needlessly churned no less than 10 times since.  Remove the unused
> __audit_inode* stubs in the !CONFIG_AUDITSYSCALL case.
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  include/linux/audit.h | 8 --------
>  1 file changed, 8 deletions(-)

Merged into audit/next.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

