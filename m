Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id B526614E799
	for <lists+linux-audit@lfdr.de>; Fri, 31 Jan 2020 04:32:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580441558;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tVubyYs56ve6rNcQfIvIINBIP1rJN+YyP7fURBOcclU=;
	b=VUT6+Xnj1hcWK2kyZBnrTUkmqoviTZI8lB2WrMKp5SjXOkPGeNAz/dlmXBq5Tm1/T06NOp
	cirUkzfYgxKDSymGaSrUNagO8fm7Rl15Smq3MdKD9zJKj0tcNibwvnp5VBv1qvf8+LZFIM
	5cUi0xIbqQ5Ap6gn/DfzsXZgizl6JWA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-Z3PDWih7Oqemva8RIUMEYQ-1; Thu, 30 Jan 2020 22:32:35 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 300A88010C9;
	Fri, 31 Jan 2020 03:32:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BCAA19756;
	Fri, 31 Jan 2020 03:32:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 084EA87A71;
	Fri, 31 Jan 2020 03:32:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00V3WLhO020344 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 30 Jan 2020 22:32:22 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BCC831055235; Fri, 31 Jan 2020 03:32:21 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B81D61055232
	for <linux-audit@redhat.com>; Fri, 31 Jan 2020 03:32:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1C778EFB5A
	for <linux-audit@redhat.com>; Fri, 31 Jan 2020 03:32:19 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-249-Vi8TJXaIP1qq5BTbKeCgPg-1; Thu, 30 Jan 2020 22:32:17 -0500
Received: by mail-ed1-f65.google.com with SMTP id j17so6272153edp.3
	for <linux-audit@redhat.com>; Thu, 30 Jan 2020 19:32:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TkL/P/i1LBOF7kxmuy+cm6Vp50rHIOf8SQpYnM2mD6A=;
	b=r1IF0AqQ9VP4CxNNcibJ6CCfO8N+1dexhmKyaudndxQw3bd3+lYcdbuaEjGytC/y21
	22O7VDe/dT9WUj6A94n+5yPdeWgmkNFf5aK5potaQS2wHs+rCeXhKa7ZOGXenjuf7qEh
	kwTJX6IBTu0xmRrY6+e5yBtHypxdkB3uiwNBXDVgU9eoSo2w02JutWEF6b3vbxGiKaWR
	XXg6L6cIXFlYY+x4C4NAoOQUry0hFo5KSrdtl9o35p9/dwiibqLOOnHRFemd19dl/YEh
	pt6Q8eZFDhZ7R9pAWu4QjNX5R9i2Eyxwf48+yd0cgQeGtYDn9BuZbReRIZGyOAF66mQD
	T8qA==
X-Gm-Message-State: APjAAAUWcE8wUBCqoM6N1HyGiUW5Fa6StpfGJbJUv+bCuHAU7ROnARUJ
	8vsqc6940Ncf/O4oPguhgPDPJqjmdW1zfVfPZWGN
X-Google-Smtp-Source: APXvYqzPzz8soELC35ZL2r8FccS/wMwd7amo1FTo5fLuVcopfuzpqAUqQ7xPlyDGNVUnR7AjjlINcLJkzb6f3Eb7YCU=
X-Received: by 2002:a50:e108:: with SMTP id h8mr6325711edl.196.1580441536186; 
	Thu, 30 Jan 2020 19:32:16 -0800 (PST)
MIME-Version: 1.0
References: <1952297.O3Wc8COjA7@x2>
In-Reply-To: <1952297.O3Wc8COjA7@x2>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 30 Jan 2020 22:32:05 -0500
Message-ID: <CAHC9VhTRDP=xnxq5GhEkmijvZaL-HinXvpv8BQSXzLEw_zF5Ww@mail.gmail.com>
Subject: Re: audit: CONFIG_CHANGE don't log internal bookkeeping as an event
To: Steve Grubb <sgrubb@redhat.com>
X-MC-Unique: Vi8TJXaIP1qq5BTbKeCgPg-1
X-MC-Unique: Z3PDWih7Oqemva8RIUMEYQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00V3WLhO020344
X-loop: linux-audit@redhat.com
Cc: Linux Audit <linux-audit@redhat.com>
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

On Fri, Jan 24, 2020 at 5:32 PM Steve Grubb <sgrubb@redhat.com> wrote:
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

Much better.  I've queued this up for audit/next, you'll see it in the
tree once the merge window closes.

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

