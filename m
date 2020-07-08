Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id DF4EA21940F
	for <lists+linux-audit@lfdr.de>; Thu,  9 Jul 2020 01:07:11 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-1HN6zLy0M6CNsAyabWltNA-1; Wed, 08 Jul 2020 19:07:09 -0400
X-MC-Unique: 1HN6zLy0M6CNsAyabWltNA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71F6B105250E;
	Wed,  8 Jul 2020 23:07:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A90E67981B;
	Wed,  8 Jul 2020 23:07:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E242593F63;
	Wed,  8 Jul 2020 23:06:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 068N6ZYT020021 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 8 Jul 2020 19:06:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 213F2111F6; Wed,  8 Jul 2020 23:06:35 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C71F3325B
	for <linux-audit@redhat.com>; Wed,  8 Jul 2020 23:06:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4C1D924906
	for <linux-audit@redhat.com>; Wed,  8 Jul 2020 23:06:32 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
	[209.85.218.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-291-Bup-9_R-PViU5xNiFUWDBQ-1; Wed, 08 Jul 2020 19:06:30 -0400
X-MC-Unique: Bup-9_R-PViU5xNiFUWDBQ-1
Received: by mail-ej1-f68.google.com with SMTP id n26so247458ejx.0
	for <linux-audit@redhat.com>; Wed, 08 Jul 2020 16:06:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2jApHR8WZLOFE/3qde/qPD8ZtCUTqk+p5HMCDcm4XcE=;
	b=hQmugevIQS+EB3dCG5Mk54IEOmCnVerjhwH8ZNh5F7kIkxJfiN1nhfqBZ+UbVvigDW
	8SzFAxO/RBqZn1p7Io5T5kv4doEMdrp2Z1ZR3VNXPEZLaskf2P5Sqp4f1ihWf/M4oVaX
	NmIcsZz8UGLNGgm+F1KkVy6Mg2/f7T6rVPsApJX28tTQ4RfknxiJRiW7IxNqqDQM4MQa
	XIhvT+CEeiUjEWQ4Qr74QRRJIjdal2QUhWYMkaEZGuK2kULRBZiMjbf4ilLCzBEWdACw
	HwvQIJuY+bRMfaNwIgxxLmZ+/ro33jn7W4RzZTQEs6dfZ0hgYQaaWAKDC2cOUlxQSBtr
	FMUg==
X-Gm-Message-State: AOAM533EL6aZMit29kuFZ+2afzDk0WiUJPOjwJlrIubzPVkuc9J5uVC2
	pr0HEb7lIrjmsnC7WtZqXFFBuzNXoTWZbA7Zgsy7
X-Google-Smtp-Source: ABdhPJxEI74qZhwUWSKk0hFFl180ExVWBpR6pJlwatkcRmWOeQZ+z2OKCc+DEzr4Hd0AhJGNQUM5Ky2Op4P28Eh4efw=
X-Received: by 2002:a17:906:456:: with SMTP id
	e22mr47815401eja.178.1594249589239; 
	Wed, 08 Jul 2020 16:06:29 -0700 (PDT)
MIME-Version: 1.0
References: <878ac79163e31142963f1cd4f743599c35b6754a.1593691408.git.rgb@redhat.com>
In-Reply-To: <878ac79163e31142963f1cd4f743599c35b6754a.1593691408.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 8 Jul 2020 19:06:18 -0400
Message-ID: <CAHC9VhT59qkGZar0wUkNK7uVsKvHVQL4-P-gmw+99F8eTKkz-w@mail.gmail.com>
Subject: Re: [PATCH ghak96 v3] audit: issue CWD record to accompany
	LSM_AUDIT_DATA_* records
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
Cc: Eric Paris <eparis@parisplace.org>,
	Linux Security Module list <linux-security-module@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>, john.johansen@canonical.com
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jul 3, 2020 at 12:56 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> The LSM_AUDIT_DATA_* records for PATH, FILE, IOCTL_OP, DENTRY and INODE
> are incomplete without the task context of the AUDIT Current Working
> Directory record.  Add it.
>
> This record addition can't use audit_dummy_context to determine whether
> or not to store the record information since the LSM_AUDIT_DATA_*
> records are initiated by various LSMs independent of any audit rules.
> context->in_syscall is used to determine if it was called in user
> context like audit_getname.
>
> Please see the upstream issue
> https://github.com/linux-audit/audit-kernel/issues/96
>
> Adapted from Vladis Dronov's v2 patch.
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
> Passes audit-testsuite.
>
> Changelog:
> v3
> - adapt and refactor__audit_getname, don't key on dummy
>
> v2
> 2020-04-02 vdronov https://www.redhat.com/archives/linux-audit/2020-April/msg00004.html
> - convert to standalone CWD record
>
> v1:
> 2020-03-24 vdronov https://github.com/nefigtut/audit-kernel/commit/df0b55b7ab84e1c9faa588b08e547e604bf25c87
> - add cwd= field to LSM record
>
>  include/linux/audit.h |  9 ++++++++-
>  kernel/auditsc.c      | 17 +++++++++++++++--
>  security/lsm_audit.c  |  5 +++++
>  3 files changed, 28 insertions(+), 3 deletions(-)

Merged into audit/next, thanks.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

