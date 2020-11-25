Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id D59482C381E
	for <lists+linux-audit@lfdr.de>; Wed, 25 Nov 2020 05:31:51 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-cKe7fOa9M9CDmVX8LrBzCA-1; Tue, 24 Nov 2020 23:31:47 -0500
X-MC-Unique: cKe7fOa9M9CDmVX8LrBzCA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C5BD180E489;
	Wed, 25 Nov 2020 04:31:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E7BD19C45;
	Wed, 25 Nov 2020 04:31:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9354E4A7C6;
	Wed, 25 Nov 2020 04:31:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AP4VOQg005366 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 24 Nov 2020 23:31:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6B1139C04D; Wed, 25 Nov 2020 04:31:24 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 660379D46D
	for <linux-audit@redhat.com>; Wed, 25 Nov 2020 04:31:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48E928007DF
	for <linux-audit@redhat.com>; Wed, 25 Nov 2020 04:31:22 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
	[209.85.218.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-179-vDs8oUXvOOyRB-AfU1of9g-1; Tue, 24 Nov 2020 23:31:20 -0500
X-MC-Unique: vDs8oUXvOOyRB-AfU1of9g-1
Received: by mail-ej1-f66.google.com with SMTP id oq3so1099595ejb.7
	for <linux-audit@redhat.com>; Tue, 24 Nov 2020 20:31:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VQoITc04m9qX/YolWYBe1OcinNU2l6wcKdMgtU14AFA=;
	b=oKPrGC1wmsY3IqyMZY+qWJrG04frGHgFv0qkJvO9jp4QP0n+X1Jt9JWj3VhfMxVtUr
	Yen8qIeTnHjUW4entCflRFJak7eWadSz4afyk94d6CoV6fWxFt3o7XCZKAdWZGVio7W7
	wIe7z83WIu5UMManR2qMMGBIAiRjFlSUaWrBTAxNY4r/WEtbornfb6YcZSeNlsGuLsnm
	+/lBg9m5r6sc7wLutJMO8uVkVDjR1z1KGkU0mXf+3AB7IaYL0eszwmPvm7I6897pZ0fq
	J7VEbowvYKqvzm/Hq4wcupalOzq4S///HHwDckCoxV+A+v3q2r+hUWHcg1G+o0puNc8X
	Ofow==
X-Gm-Message-State: AOAM533jj6FY4fM8jizEmK18zSmcMC400r53L8svYY/w9nGuwzmdqrm5
	oO8iiVJpRVlym6qF/3A6GIHNOrzqqDZJ6guzIUgd
X-Google-Smtp-Source: ABdhPJzKIsrI5ch6e08dr6gzH4USSMha9EUcuGrCD4rq4sAvUQNRqXBe+/L+uBo1EiTAgJ1S3Ukfo4ctq6aLnnUzsX0=
X-Received: by 2002:a17:906:7c9:: with SMTP id
	m9mr1581773ejc.178.1606278678898; 
	Tue, 24 Nov 2020 20:31:18 -0800 (PST)
MIME-Version: 1.0
References: <1604651482-9780-1-git-send-email-alex.shi@linux.alibaba.com>
	<20201110152310.GB55411@madcap2.tricolour.ca>
	<CAHC9VhQiQoZh8in+zoYa5hbTN_yL-=mt7nTQFN9GAyQZ+tz-Ww@mail.gmail.com>
	<20201111030359.GB55072@madcap2.tricolour.ca>
	<bae6d2fa-64d9-623b-6729-3827d745ed7a@linux.alibaba.com>
	<20201111131759.GD55072@madcap2.tricolour.ca>
	<9784a39e-c39f-b3f9-3d05-68d63e560c75@linux.alibaba.com>
In-Reply-To: <9784a39e-c39f-b3f9-3d05-68d63e560c75@linux.alibaba.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 24 Nov 2020 23:31:07 -0500
Message-ID: <CAHC9VhRGQOaNaPO19vKJhjaB9-wvX=bZF9X6spwOoi_C9MRb0A@mail.gmail.com>
Subject: Re: [PATCH] audit: remove unused macros
To: Alex Shi <alex.shi@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, linux-audit@redhat.com,
	linux-kernel@vger.kernel.org
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 11, 2020 at 7:38 PM Alex Shi <alex.shi@linux.alibaba.com> wrote:
> From 5fef5f1b7b745b52bedc9c7eec9fc163202ad421 Mon Sep 17 00:00:00 2001
> From: Alex Shi <alex.shi@linux.alibaba.com>
> Date: Fri, 6 Nov 2020 16:31:22 +0800
> Subject: [PATCH v3] audit: fix macros warnings
>
> Some unused macros could cause gcc warning:
> kernel/audit.c:68:0: warning: macro "AUDIT_UNINITIALIZED" is not used
> [-Wunused-macros]
> kernel/auditsc.c:104:0: warning: macro "AUDIT_AUX_IPCPERM" is not used
> [-Wunused-macros]
> kernel/auditsc.c:82:0: warning: macro "AUDITSC_INVALID" is not used
> [-Wunused-macros]
>
> AUDIT_UNINITIALIZED and AUDITSC_INVALID are still meaningful and should
> be in incorporated.
>
> Just remove AUDIT_AUX_IPCPERM.
>
> Thanks comments from Richard Guy Briggs and Paul Moore.
>
> Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
> Cc: Paul Moore <paul@paul-moore.com>
> Cc: Richard Guy Briggs <rgb@redhat.com>
> Cc: Eric Paris <eparis@redhat.com>
> Cc: linux-audit@redhat.com
> Cc: linux-kernel@vger.kernel.org
> ---
>  kernel/audit.c   |  2 +-
>  kernel/auditsc.c | 11 +++++------
>  2 files changed, 6 insertions(+), 7 deletions(-)

Sorry for the delay, this was buried in my inbox but I've just merged
it into audit/next.  Thanks for your help and patience with this!

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

