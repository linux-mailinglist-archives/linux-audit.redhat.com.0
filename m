Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id B03B6131D56
	for <lists+linux-audit@lfdr.de>; Tue,  7 Jan 2020 02:48:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578361716;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GxVB5clCw1CJGqJdLFTiDlm8GTwocksOIJNeH4CAJ10=;
	b=Pk7rCeMQeZcD3xzddVSkzhDRJBCMdbsiZedv1CVbrPDIVSIxXiAH/kbKxdleo2lt7I1IG3
	aOgYLx44c2GsEO+5vpjqiEfZUuvuM6q3vLW1rHrmye61zx0u8jeoz+Q2aRtBCWu1mW5Sse
	5drOFB/IMeuXWERah8HZDclilPNeEBM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-Z-fOLScVMcSrYHA1U9BU2w-1; Mon, 06 Jan 2020 20:48:35 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8BCA10054E3;
	Tue,  7 Jan 2020 01:48:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 97BC71A8E3;
	Tue,  7 Jan 2020 01:48:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0D0F41809567;
	Tue,  7 Jan 2020 01:48:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0071lojg021980 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 6 Jan 2020 20:47:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BD3992166B2A; Tue,  7 Jan 2020 01:47:50 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8AE32166B29
	for <linux-audit@redhat.com>; Tue,  7 Jan 2020 01:47:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0BBB0801033
	for <linux-audit@redhat.com>; Tue,  7 Jan 2020 01:47:48 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-393-DrUbnlwCNIK6ZtYKLg-Fpg-1; Mon, 06 Jan 2020 20:47:45 -0500
Received: by mail-lj1-f193.google.com with SMTP id y6so44948898lji.0
	for <linux-audit@redhat.com>; Mon, 06 Jan 2020 17:47:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nnUUeovc0/sQehcb3jnUHcFqmAMp5cCGxX1FxjWaRGg=;
	b=s+Bs7DKWhrp8kPABEIdncB6pO+KsWVjnsndFLkv4nMQv9weiOEnIc9sct+lRqqFQSR
	uVkTr9tn+whL3WNEPdAJKPZbbw0lKKLh4nnMylgqlYaMdaj6jl4P0/yLwyxxPBq2rbz0
	S+ek0c9MJFRaXzHbU3On77vAVY789SgJ82/hC07eAx3QDvXxG1e6hlpZJbjYWyqWN9tB
	IRjm+B/VWuH/cPb7JV0ZPWQ91rbsaOpGPpwx6ksrmKK7z+CZ3L0Kd8TIyVmqoT559A2a
	L/7Nw9ArqmLag3vGoyIEQU/1w8fyTANv5l1V0cQHAEPFwN9PTPvwAb1lv/ZEUJVhY5Xg
	4Vjg==
X-Gm-Message-State: APjAAAWr6ESebSQMiVuDZdQWf47VDrFw+Pi+kqkuCIaxIx1zG5jXUWKx
	iX4YyDlFT1tuKIIvaIXCJrOv2TgfqtXgAHQLjMdB
X-Google-Smtp-Source: APXvYqwxiNutuq0EQnDMhRNJwocEvb801z8QJaqidTsqeeIVAUVuBOTAoOZ7hU/hiNNXCWNXY/973/sxpx9tIYH+MAU=
X-Received: by 2002:a2e:800b:: with SMTP id j11mr56293636ljg.126.1578361664330;
	Mon, 06 Jan 2020 17:47:44 -0800 (PST)
MIME-Version: 1.0
References: <2595185.DiOs4DVqks@x2>
In-Reply-To: <2595185.DiOs4DVqks@x2>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 6 Jan 2020 20:47:33 -0500
Message-ID: <CAHC9VhT28zhWmt2pNDmaLR2p6D39o3LRmVU34Ue3Z_WUNzMdcw@mail.gmail.com>
Subject: Re: [PATCH 1/1] audit: CONFIG_CHANGE don't log internal bookkeeping
	as an event
To: Steve Grubb <sgrubb@redhat.com>
X-MC-Unique: DrUbnlwCNIK6ZtYKLg-Fpg-1
X-MC-Unique: Z-fOLScVMcSrYHA1U9BU2w-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0071lojg021980
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Jan 5, 2020 at 10:22 AM Steve Grubb <sgrubb@redhat.com> wrote:
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
> I think the correct resolution is to drop logging config_update events
> since the watch is still in effect but just on another unknown inode.

Either this patch is the correct resolution or it isn't, the
description should state that clearly.  If you are unsure we can
discuss it, but it sounds like you are certain that this record isn't
needed here, yes?

> Signed-off-by: Steve Grubb <sgrubb@redhat.com>
> ---
>  kernel/audit_watch.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/kernel/audit_watch.c b/kernel/audit_watch.c
> index 4508d5e0cf69..8a8fd732ff6d 100644
> --- a/kernel/audit_watch.c
> +++ b/kernel/audit_watch.c
> @@ -302,8 +302,6 @@ static void audit_update_watch(struct audit_parent *parent,
>                         if (oentry->rule.exe)
>                                 audit_remove_mark(oentry->rule.exe);
>
> -                       audit_watch_log_rule_change(r, owatch, "updated_rules");
> -
>                         call_rcu(&oentry->rcu, audit_free_rule_rcu);
>                 }
>

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

