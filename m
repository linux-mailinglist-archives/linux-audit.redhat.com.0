Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id CAAC4135240
	for <lists+linux-audit@lfdr.de>; Thu,  9 Jan 2020 05:43:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578545027;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xAJH2/ZW2Ue2dfUCFBpgyVmadHOnKNJYPABMaNOZ+YI=;
	b=hnYl7ML56BeFLNqEzuriDsIMetlGlRDqHlKr+bv8Nq54r8JdSVtsw3nKqxgoS3G/Qax9Aa
	AZ6CXUg01VMU4V6621gBg1//7Tz15kDXmN5C9SbbOcxhcWyNR/s2mbMG/Yjdohc9ng5hij
	2tY8AHFqA3xL7BscFlP89sV97yyPmcI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-VRpxPXkLMOOxNHWB1lCNPg-1; Wed, 08 Jan 2020 23:43:46 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D3E110054E3;
	Thu,  9 Jan 2020 04:43:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FA777BA39;
	Thu,  9 Jan 2020 04:43:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 717D0503B4;
	Thu,  9 Jan 2020 04:43:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0094hFnS032655 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 8 Jan 2020 23:43:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D33BB1014272; Thu,  9 Jan 2020 04:43:15 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE11C1014252
	for <linux-audit@redhat.com>; Thu,  9 Jan 2020 04:43:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D02358028B8
	for <linux-audit@redhat.com>; Thu,  9 Jan 2020 04:43:13 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-163-Rtoy_ilWMXuOWWve_a68Aw-1; Wed, 08 Jan 2020 23:43:11 -0500
Received: by mail-lf1-f68.google.com with SMTP id b15so4173336lfc.4
	for <linux-audit@redhat.com>; Wed, 08 Jan 2020 20:43:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=j9yFszG1JOZvJRzKzSmKKoF4lMV2ZExx1PoVnXyp4hs=;
	b=e7/CIdrRrfFW4l97OT1qygw8FBI+eYhjs/povK7UHAp3r68O9ke+HGIUE6ow/xIvHM
	iVKRLo+lYEplDK2bJBBIh1TqJDzx5LGHuqmHzW0RKSp4p9Be70T0FDGi8HXTreJiPqec
	vxUvmcwROYZt9svBAzdb+38GvGVo0GO7uceCNCpAoAy+zTEHTOq79lLcKDOUh5ZhIMD5
	CugypmJj/R8XRliwivKbAiLegoD6tVNBc/S+q1kXoZv3Nn0WF5S2+gyikNYX2o9JpxEx
	0Om2m9gucbnFitolcCNuklJ4iumpiKVF64ylOkJ83crmMuKJd9YhH5IO/Qy6NPBGoPH9
	BhYQ==
X-Gm-Message-State: APjAAAUHugv711yFUtqHep2BdmF8n/b10x4Fsg9uVkCjQXxrv/OZVs4k
	zrtu5hoHk3Rs55vb2hNB2/RzCwOayLhmNexDLa4m
X-Google-Smtp-Source: APXvYqxsVnRdMRAULWgaG82y7mszx0ySjCj3NoeSAV/UfEcfLlFQ6PW1oKB4kJkxUegovD66h496lKPv+p7KzmI7Ie8=
X-Received: by 2002:a19:ae04:: with SMTP id f4mr5066467lfc.64.1578544989938;
	Wed, 08 Jan 2020 20:43:09 -0800 (PST)
MIME-Version: 1.0
References: <9515137.CPG8BucVjl@x2>
In-Reply-To: <9515137.CPG8BucVjl@x2>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 8 Jan 2020 23:42:58 -0500
Message-ID: <CAHC9VhQK3OG9p7O86T+O8snqNyiBh8uwTJC_52VVHiM_YpahtQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] audit: CONFIG_CHANGE don't log internal bookkeeping
	as an event
To: Steve Grubb <sgrubb@redhat.com>
X-MC-Unique: Rtoy_ilWMXuOWWve_a68Aw-1
X-MC-Unique: VRpxPXkLMOOxNHWB1lCNPg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0094hFnS032655
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 8, 2020 at 8:37 AM Steve Grubb <sgrubb@redhat.com> wrote:
>
> Common Criteria calls out for any action that modifies the audit trail to
> be recorded. That usually is interpreted to mean insertion or removal of
> rules. It is not required to log modification of the inode information
> since the watch is still in effect. Additionally, if the rule is a never
> rule and the underlying file is one they do not want events for, they
> get an event for this bookkeeping update against their wishes.
>
> Since no device/inode info is logged at insertion and no device/inode
> information is logged on update, there is nothing meaningful being
> communicated to the admin by the CONFIG_CHANGE updated_rules event. One
> can assume that the rule was not "modified" because it is still watching
> the intended target. If the device or inode cannot be resolved, then
> audit_panic is called which is sufficient.
>
> The correct resolution is to drop logging config_update events since
> the watch is still in effect but just on another unknown inode.
>
> Signed-off-by: Steve Grubb <sgrubb@redhat.com>
> ---
>  kernel/audit_watch.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/kernel/audit_watch.c b/kernel/audit_watch.c
> index 4508d5e0cf69..8a8fd732ff6d 100644
> --- a/kernel/audit_watch.c
> +++ b/kernel/audit_watch.c
> @@ -302,8 +302,6 @@ static void audit_update_watch(struct audit_parent
> *parent,

It looks like your mail client is mangling your patch such that it
can't be applied directly from the mail you sent (look at the line
above).  Granted this patch is trivial and easily applied by hand but
I think it would be good for you Steve to get the experience in
sending kernel patches properly, please try it again.

If you are unfamiliar with how to do it, I would suggest looking at
Documentation/process/submitting-patches.rst and
Documentation/process/email-clients.rst in the kernel source tree.

>                         if (oentry->rule.exe)
>                                 audit_remove_mark(oentry->rule.exe);
>
> -                       audit_watch_log_rule_change(r, owatch, "updated_rules");
> -
>                         call_rcu(&oentry->rcu, audit_free_rule_rcu);
>                 }
>
> --
> 2.24.1

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

