Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id AE937306B5B
	for <lists+linux-audit@lfdr.de>; Thu, 28 Jan 2021 04:05:39 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-G0UsOenMMQWhunP22-t4JA-1; Wed, 27 Jan 2021 22:05:36 -0500
X-MC-Unique: G0UsOenMMQWhunP22-t4JA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CC0A1005504;
	Thu, 28 Jan 2021 03:05:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CF0D61F5E;
	Thu, 28 Jan 2021 03:05:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0801D4BB7B;
	Thu, 28 Jan 2021 03:05:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10S30HPo018827 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 27 Jan 2021 22:00:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CBA88DEE69; Thu, 28 Jan 2021 03:00:17 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C64ACE7790
	for <linux-audit@redhat.com>; Thu, 28 Jan 2021 03:00:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 050EB858285
	for <linux-audit@redhat.com>; Thu, 28 Jan 2021 03:00:15 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
	[209.85.208.45]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-16-znMON2nvOfSlkxul84hi5A-1; Wed, 27 Jan 2021 22:00:12 -0500
X-MC-Unique: znMON2nvOfSlkxul84hi5A-1
Received: by mail-ed1-f45.google.com with SMTP id j13so4930357edp.2
	for <linux-audit@redhat.com>; Wed, 27 Jan 2021 19:00:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AP3tGQs6s5P8wm/ejXQRcsMvZE63wwCDiLfyGUDNGfs=;
	b=OYz6jAkMjRNurL3U6sAdhvRQZCBEo6W6mOt1kgJlglwSH7MKjGoM+H/lIa1GJcGMGD
	RZiqU97g3IUAMo1nNIiXh6iYB+AoHiHDELjZQ00a07S052MUOdimPCy8KEASt0Mqqcqz
	q96JzeYvNyR0W4FKZjpYZGUb6l4y0GVlb2lGyXh5uOkbg/sOW3uFh2FuYlLPJL+jyAK3
	pjn233fmxpEme4n+JFGXL8zLDYaahM3LV2ueYAm7+AYspO2NVpwUtu6UoSPg+EAWugDu
	SMHg1wv8/f4ceWA+Cx+iv6zChTlFIwgbpTHbYkZ45+pg11fZAq3+RUt6HGqf0SwCvBiZ
	QdSg==
X-Gm-Message-State: AOAM530itO21T+z0IPX5KhAv1P2ZhERBdFSHfWiCYbeVb5nUAHXvgfaH
	+POIH4yO8NU5jsMAx+xjl/EkfDnchPILaoYCVwjE/j7l/pLr
X-Google-Smtp-Source: ABdhPJyGUyWZpntm+TS64e45JgJCqkq+loUyRGPu4UOhP92e5dbVN00ikHNfAurqWEkwaMzIrKqGJDgoiCAg37Ck3qs=
X-Received: by 2002:a05:6402:54d:: with SMTP id
	i13mr11785340edx.12.1611802811444; 
	Wed, 27 Jan 2021 19:00:11 -0800 (PST)
MIME-Version: 1.0
References: <20210127025144.24253-1-yang.yang29@zte.com.cn>
In-Reply-To: <20210127025144.24253-1-yang.yang29@zte.com.cn>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 27 Jan 2021 22:00:00 -0500
Message-ID: <CAHC9VhTsQ4j8EYd4H-PXmZeFhqHeyV2GDpNikU-tw2qMtbFyUw@mail.gmail.com>
Subject: Re: [PATCH v2] audit: Make audit_filter_syscall() return void
To: menglong8.dong@gmail.com
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
Cc: Yang Yang <yang.yang29@zte.com.cn>, Richard Guy Briggs <rgb@redhat.com>,
	linux-audit@redhat.com, linux-kernel@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 26, 2021 at 9:52 PM <menglong8.dong@gmail.com> wrote:
>
> From: Yang Yang <yang.yang29@zte.com.cn>
>
> No invoker uses the return value of audit_filter_syscall().
> So make it return void, and amend the comment of
> audit_filter_syscall().
>
> Changes since v1:
> - amend the comment of audit_filter_syscall().
>
> Signed-off-by: Yang Yang <yang.yang29@zte.com.cn>
> Reviewed-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  kernel/auditsc.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

This is a simple enough patch so I think merging it during -rc5 should
be okay; merged into audit/next - thanks!

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

