Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 796B510F275
	for <lists+linux-audit@lfdr.de>; Mon,  2 Dec 2019 22:57:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575323862;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1LFewevmZ1CYh7pZU0fZPOGN64lnCf6Nl7M/HE3gjb0=;
	b=JyA4hUBo+PPyzNYe+cc27aHsrODv42AssP9XIgLp1mVrMfjq5tQxIwIwauu+4PeS0iRX/w
	6Cs+hkSFcYxuJwGRa4J2OCo8eeoivSbjxnQoZ9KW34v8RydgFVdp1/5b3jFFMWI8LIwTf4
	AE+KuIHG+jXJpaEAfaLUW7x8OKsRYfE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-bj8u6hSTN0-SwaztfuBpxw-1; Mon, 02 Dec 2019 16:57:39 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CBA8DB64;
	Mon,  2 Dec 2019 21:57:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 35A6B600CA;
	Mon,  2 Dec 2019 21:57:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D63CC4EDAC;
	Mon,  2 Dec 2019 21:57:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB2LJQIC016930 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 2 Dec 2019 16:19:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9A0E8E38CA; Mon,  2 Dec 2019 21:19:26 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 96264EB350
	for <linux-audit@redhat.com>; Mon,  2 Dec 2019 21:19:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48701905987
	for <linux-audit@redhat.com>; Mon,  2 Dec 2019 21:19:24 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-188-QCLO63Z2Oa2aL0FfKWWwOg-1; Mon, 02 Dec 2019 16:19:22 -0500
Received: by mail-pf1-f195.google.com with SMTP id h14so372262pfe.10
	for <linux-audit@redhat.com>; Mon, 02 Dec 2019 13:19:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=BDFi2KtUfHoxYhQyKwF8j1ECcKUBGo4/hE4QVcfZiuY=;
	b=S/mAVVGDzfdytPIi2klTbDAgiV3AeCnEIjQvumD200pVtn/wi4fhl48boAgkRsNae0
	kr+J+JW6vdi3n7dMNA48ISJ8UPn8WpLdOpLt0krGJETWInaK5jYt97eantT0x8jTMWCe
	IpoJZZxgeYzF2YGGWoax+598PpT4qgvdhmFHgUhIl7GZiveg+srH16q6yqVuGR7WFSpV
	wE2JekbVi9k5UByy9pFIIBfDb9wVd8s77xJD1mBnRKRpLugkkl9Hrw6mWUEjsFoEXYg6
	xXWhb471OU9b21yvn0FI7oSaj63JvLwwd4CiajQJFS77dwuvykl0ir341J++veMjemwL
	X/jw==
X-Gm-Message-State: APjAAAUxoUqvPR6cqrZ5Z/Nx86Ihmt5roWq3vsUrKR41M/6XmpQrtdaf
	3qsIJjDR6fb+tFZX7I8lUYjaqA==
X-Google-Smtp-Source: APXvYqxSoc2SCTWEE4t/98ajNaXkB89lCMxgkBxngI0eYX8ZLLrTxHxWP3ZysSCHCSy6mvVMxbj+MQ==
X-Received: by 2002:a62:5807:: with SMTP id m7mr743978pfb.180.1575321558967;
	Mon, 02 Dec 2019 13:19:18 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
	by smtp.gmail.com with ESMTPSA id
	a26sm398874pff.155.2019.12.02.13.19.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Dec 2019 13:19:16 -0800 (PST)
Date: Mon, 2 Dec 2019 16:19:15 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: Amol Grover <frextrite@gmail.com>
Subject: Re: [PATCH v3] kernel: audit.c: Add __rcu annotation to RCU pointer
Message-ID: <20191202211915.GF17234@google.com>
References: <20191201183347.18122-1-frextrite@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191201183347.18122-1-frextrite@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-MC-Unique: QCLO63Z2Oa2aL0FfKWWwOg-1
X-MC-Unique: bj8u6hSTN0-SwaztfuBpxw-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB2LJQIC016930
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 02 Dec 2019 16:57:16 -0500
Cc: paulmck@kernel.org, linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
	linux-audit@redhat.com, Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel-mentees@lists.linuxfoundation.org, rostedt@kernel.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Good idea to CC the following on RCU patches:
Paul McKenney
Steven Rostedt
(Any others on the RCU maintainers list).
And, the list: rcu@vger.kernel.org

Could anyone Ack the patch? Looks safe and straight forward.

On Mon, Dec 02, 2019 at 12:03:48AM +0530, Amol Grover wrote:
> Add __rcu annotation to RCU-protected global pointer auditd_conn.
> 
> auditd_conn is an RCU-protected global pointer,i.e., accessed
> via RCU methods rcu_dereference() and rcu_assign_pointer(),
> hence it must be annotated with __rcu for sparse to report
> warnings/errors correctly.
> 
> Fix multiple instances of the sparse error:
> error: incompatible types in comparison expression
> (different address spaces)
> 
> Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> Signed-off-by: Amol Grover <frextrite@gmail.com>
> ---
> v3:
> - update changelog to be more descriptive
> 
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

