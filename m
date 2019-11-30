Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9968A10DE05
	for <lists+linux-audit@lfdr.de>; Sat, 30 Nov 2019 16:28:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575127710;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=V724SVH8gvHRoG/YlfUcss6iwlIbkLx5AAFtnG+f1fs=;
	b=A09BO2AFxbwkTRM+nFQXXlHddO6+Dd8cs0gnd3x9aHfSXHsj6V9HNnQEZY4VMfI+1isEvg
	ufncH6mt/ETmM+FrXaFxrESq9hNgGidOJ+TqMM4TkrLjRHBf8o/MpWTejCd8zyIGd9NAcS
	WcrKgy2iujA+y4KTrampi5/fA/HcMPI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-e-761S9HOkqLMlBA497_1A-1; Sat, 30 Nov 2019 10:28:28 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81B2C184CAB3;
	Sat, 30 Nov 2019 15:28:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 749375C290;
	Sat, 30 Nov 2019 15:28:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 08ED71809567;
	Sat, 30 Nov 2019 15:28:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAU27pxQ016389 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 29 Nov 2019 21:07:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5EA0212EC20; Sat, 30 Nov 2019 02:07:51 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A86B13AF7F
	for <linux-audit@redhat.com>; Sat, 30 Nov 2019 02:07:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C9308012BC
	for <linux-audit@redhat.com>; Sat, 30 Nov 2019 02:07:49 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-215-DrqnFZVpPLyo36pxsFdjuA-1; Fri, 29 Nov 2019 21:07:45 -0500
Received: by mail-pf1-f193.google.com with SMTP id l22so3049803pff.9
	for <linux-audit@redhat.com>; Fri, 29 Nov 2019 18:07:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=QudVKO8PpHDY0QPRDjrLS+45fBA9fe2WvpbxZI2jQhM=;
	b=ZbnLDYMaeWxhXqsfyiCR0Pvje3I8O7xlpoel8DE/rPtg1ciaU4infOVOc+phmhsR05
	fTCRprI7Tq57FLrWoLTggFlqx99kUQytOaSOyBThAR+fO6rH1erzcHEHPsewhowTnGJy
	VU+SkEcFbqKA1xJuePNl87JvHMiL6DPN0p5lKSkRzuX/7k9XCytY0EZjpuZXCnZmqlw6
	GechPglBhML9iFS7r9K3l4EJXcoIQkHz2i3gTi/jXXM7Crz6jO72mVcSITgj9b/tHMgS
	sQczTNrmw/w2najDpQUpkE9Xrv33fF8NFHDnDrS0zbmxm61p3DadH7aL9DY/RPRNGeta
	1QvA==
X-Gm-Message-State: APjAAAUSR+KlJvKttmxxTb7B7mUVf20E1ZK/07EVDd2EoUuBbzy7OmN3
	Lqgw4aN91MkXrwUdbEYtfQvLfg==
X-Google-Smtp-Source: APXvYqxvrL7gQ4UHvGl0OH80nFnpTXbY9LyocxTQJ8pHkSe9LnSm6z/+3DuUedz0z8nb/MsLQYnEYQ==
X-Received: by 2002:aa7:87c5:: with SMTP id i5mr59616561pfo.60.1575079664078; 
	Fri, 29 Nov 2019 18:07:44 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
	by smtp.gmail.com with ESMTPSA id
	s22sm15478745pjr.5.2019.11.29.18.07.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 29 Nov 2019 18:07:43 -0800 (PST)
Date: Fri, 29 Nov 2019 21:07:42 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: Amol Grover <frextrite@gmail.com>
Subject: Re: [PATCH v2] kernel: audit.c: Add __rcu notation to RCU pointer
Message-ID: <20191130020742.GF157739@google.com>
References: <20191128153203.GA23803@workstation-kernel-dev>
MIME-Version: 1.0
In-Reply-To: <20191128153203.GA23803@workstation-kernel-dev>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-MC-Unique: DrqnFZVpPLyo36pxsFdjuA-1
X-MC-Unique: e-761S9HOkqLMlBA497_1A-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAU27pxQ016389
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Sat, 30 Nov 2019 10:28:00 -0500
Cc: linux-kernel@vger.kernel.org, linux-audit@redhat.com,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel-mentees@lists.linuxfoundation.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Nov 28, 2019 at 09:02:03PM +0530, Amol Grover wrote:
> add __rcu notation to RCU protected global pointer auditd_conn

Again, please use proper punctuation and captilization. This is unacceptable.
Please put more effort into changelog.

Otherwise the patch diff itself looks good to me, with the above nit
corrected, you could add my tag to the next revision:

Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>

thanks,

 - Joel

> 
> Fixes multiple instances of sparse error:
> error: incompatible types in comparison expression
> (different address spaces)
> 
> Signed-off-by: Amol Grover <frextrite@gmail.com>
> ---
> v2:
> - fix erroneous RCU pointer initialization
> 
>  kernel/audit.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/audit.c b/kernel/audit.c
> index da8dc0db5bd3..ff7cfc61f53d 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -102,12 +102,13 @@ struct audit_net {
>   * This struct is RCU protected; you must either hold the RCU lock for reading
>   * or the associated spinlock for writing.
>   */
> -static struct auditd_connection {
> +struct auditd_connection {
>  	struct pid *pid;
>  	u32 portid;
>  	struct net *net;
>  	struct rcu_head rcu;
> -} *auditd_conn = NULL;
> +};
> +static struct auditd_connection __rcu *auditd_conn;
>  static DEFINE_SPINLOCK(auditd_conn_lock);
>  
>  /* If audit_rate_limit is non-zero, limit the rate of sending audit records
> -- 
> 2.24.0
> 


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

