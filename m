Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 28035145E11
	for <lists+linux-audit@lfdr.de>; Wed, 22 Jan 2020 22:31:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579728672;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yP3dm+bbDt2ymU95jgmPdCDZGCnkIhpr81g4X5hgti0=;
	b=atV06B7u7ajXbPw7xc6KvOj5VDOkUNBLb1AIlJGUW44sF5Xei1kP41jFihi86IEsXOSf2F
	ADbv/ojuI9AhSjUOpBoZTV1Ub8+rtAAyHhT7dkqaCK25nsA+0BuKMA9M0dVyMXTueLa4M2
	mg/DN6nERJD/3AJcaj2WWejgXKCXLeI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-hFSSx1i9OYyrOaH_QcGD_A-1; Wed, 22 Jan 2020 16:31:06 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D8F8DB64;
	Wed, 22 Jan 2020 21:30:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C7465DA60;
	Wed, 22 Jan 2020 21:30:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C6E9D18089CE;
	Wed, 22 Jan 2020 21:30:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00MLTTNk003640 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 22 Jan 2020 16:29:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F22572166B28; Wed, 22 Jan 2020 21:29:28 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED33F2166B27
	for <linux-audit@redhat.com>; Wed, 22 Jan 2020 21:29:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73BB318E6C69
	for <linux-audit@redhat.com>; Wed, 22 Jan 2020 21:29:20 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-202-isLs4YcEOjCN2lg7CXhmAA-1; Wed, 22 Jan 2020 16:29:18 -0500
Received: by mail-lj1-f194.google.com with SMTP id a13so687559ljm.10
	for <linux-audit@redhat.com>; Wed, 22 Jan 2020 13:29:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0IWzoSHaF7JN7KzmRnEKXue37+ElHpTL6tvjAuEiiiE=;
	b=CAqOSJ5g6sga/WA1GcNi27IBFWW2HPQ0/pb7dT++ohp6wjyBp82mKR5yAAltxRuoJA
	TeJ+tQ/wzYijM+emOX4biLNh9aqZ3kidJToSvdUji0Y/FFtzeGvo9LXWknaPSVxrNRXw
	JoemqcAKBu8HlXXUHsGn/c76yNuxcZDf7yofr0R27GaFzVfjtDKtCyZuEXcMHqdYk8A8
	yi1T4lJBqx4J7JFtVebp6rnkepv6e4zFukLAH8F/HRieHtReT2BgsEiRUwA4cN4/Zr3D
	E1R8RgWOW9i+O+B4fHbmfXTDzEgOp+CE3B7EBDqqpTLutVZ8xwapv1ODyl9FwGTjyq0W
	cVYA==
X-Gm-Message-State: APjAAAUsfWH94fUN0RhxrC8EZ9JI7Hhj1MmMg1sfZKw2u6EKgKAgNCyT
	C6Bk3fhlP0x11jhnf7e7tVQ4PasmjRHhALjcxUfy
X-Google-Smtp-Source: APXvYqyJPHhr26PhrZ+pA9b8pTPEHYf1WFuy5Ob3gcESY7hxuJ6vYnDhzK5W1Ro4odt+SPVTOx5x/cd75TN9sGtuTYo=
X-Received: by 2002:a2e:5357:: with SMTP id t23mr21086243ljd.227.1579728556739;
	Wed, 22 Jan 2020 13:29:16 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577736799.git.rgb@redhat.com>
	<cfbb80a08fc770dd0dcf6dac6ff307a80d877c3f.1577736799.git.rgb@redhat.com>
In-Reply-To: <cfbb80a08fc770dd0dcf6dac6ff307a80d877c3f.1577736799.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 22 Jan 2020 16:29:05 -0500
Message-ID: <CAHC9VhT1+mx_tVzyXD=UBqagqYgAFjZ=X1A6oBiMvjVCn8=V-w@mail.gmail.com>
Subject: Re: [PATCH ghak90 V8 12/16] audit: contid check descendancy and
	nesting
To: Richard Guy Briggs <rgb@redhat.com>
X-MC-Unique: isLs4YcEOjCN2lg7CXhmAA-1
X-MC-Unique: hFSSx1i9OYyrOaH_QcGD_A-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00MLTTNk003640
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, mpatel@redhat.com,
	Serge Hallyn <serge@hallyn.com>
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

On Tue, Dec 31, 2019 at 2:51 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> Require the target task to be a descendant of the container
> orchestrator/engine.
>
> You would only change the audit container ID from one set or inherited
> value to another if you were nesting containers.
>
> If changing the contid, the container orchestrator/engine must be a
> descendant and not same orchestrator as the one that set it so it is not
> possible to change the contid of another orchestrator's container.
>
> Since the task_is_descendant() function is used in YAMA and in audit,
> remove the duplication and pull the function into kernel/core/sched.c
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  include/linux/sched.h    |  3 +++
>  kernel/audit.c           | 44 ++++++++++++++++++++++++++++++++++++--------
>  kernel/sched/core.c      | 33 +++++++++++++++++++++++++++++++++
>  security/yama/yama_lsm.c | 33 ---------------------------------
>  4 files changed, 72 insertions(+), 41 deletions(-)

...

> diff --git a/kernel/audit.c b/kernel/audit.c
> index f7a8d3288ca0..ef8e07524c46 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -2603,22 +2610,43 @@ int audit_set_contid(struct task_struct *task, u64 contid)
>         oldcontid = audit_get_contid(task);
>         read_lock(&tasklist_lock);
>         /* Don't allow the contid to be unset */
> -       if (!audit_contid_valid(contid))
> +       if (!audit_contid_valid(contid)) {
>                 rc = -EINVAL;
> +               goto unlock;
> +       }
>         /* Don't allow the contid to be set to the same value again */
> -       else if (contid == oldcontid) {
> +       if (contid == oldcontid) {
>                 rc = -EADDRINUSE;
> +               goto unlock;
> +       }
>         /* if we don't have caps, reject */
> -       else if (!capable(CAP_AUDIT_CONTROL))
> +       if (!capable(CAP_AUDIT_CONTROL)) {
>                 rc = -EPERM;
> -       /* if task has children or is not single-threaded, deny */
> -       else if (!list_empty(&task->children))
> +               goto unlock;
> +       }
> +       /* if task has children, deny */
> +       if (!list_empty(&task->children)) {
>                 rc = -EBUSY;
> -       else if (!(thread_group_leader(task) && thread_group_empty(task)))
> +               goto unlock;
> +       }
> +       /* if task is not single-threaded, deny */
> +       if (!(thread_group_leader(task) && thread_group_empty(task))) {
>                 rc = -EALREADY;
> -       /* if contid is already set, deny */
> -       else if (audit_contid_set(task))
> +               goto unlock;
> +       }

It seems like the if/else-if conversion above should be part of an
earlier patchset.

> +       /* if task is not descendant, block */
> +       if (task == current) {
> +               rc = -EBADSLT;
> +               goto unlock;
> +       }
> +       if (!task_is_descendant(current, task)) {
> +               rc = -EXDEV;
> +               goto unlock;
> +       }

I understand you are trying to provide a unique error code for each
failure case, but this is getting silly.  Let's group the descendent
checks under the same error code.

> +       /* only allow contid setting again if nesting */
> +       if (audit_contid_set(task) && audit_contid_isowner(task))
>                 rc = -ECHILD;

Should that be "!audit_contid_isowner()"?

--
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

