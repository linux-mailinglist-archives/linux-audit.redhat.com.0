Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 20008235440
	for <lists+linux-audit@lfdr.de>; Sat,  1 Aug 2020 22:26:53 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-ir2yZuXINNu0fnctthVJzw-1; Sat, 01 Aug 2020 16:26:49 -0400
X-MC-Unique: ir2yZuXINNu0fnctthVJzw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08ED38064B2;
	Sat,  1 Aug 2020 20:26:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B215987B36;
	Sat,  1 Aug 2020 20:26:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4828995A94;
	Sat,  1 Aug 2020 20:26:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 071KLs0j032358 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 1 Aug 2020 16:21:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 42A29DBB0C; Sat,  1 Aug 2020 20:21:54 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E7E9DBAE5
	for <linux-audit@redhat.com>; Sat,  1 Aug 2020 20:21:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D5B1101A525
	for <linux-audit@redhat.com>; Sat,  1 Aug 2020 20:21:51 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-435-WfVl_5cgPdqyn1Gp-4xDbg-1; Sat, 01 Aug 2020 16:21:28 -0400
X-MC-Unique: WfVl_5cgPdqyn1Gp-4xDbg-1
Received: by mail-ed1-f68.google.com with SMTP id q4so21413013edv.13
	for <linux-audit@redhat.com>; Sat, 01 Aug 2020 13:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DpdyXRkNBFG6+sXGVp5popQlf9jPzy3fYXE2HQTaqO8=;
	b=raBDtOVg4Y8yvInSqPHswUmK/6FyWlHyD+zdlCcAnJyWgDvnZ96MiJFkRQQPPKqOZG
	6dMEMTV+GF8lTF5Dv3gsvXuV78O8sDRkMEv5OJcRJ5OZDqiFNLxavEYA5XiYcLxJbohL
	SEzoUCKbE5f7OZfmCZRzkhK5BorE3ajE9x9Q+MmLNlLFPiXs5PzdYg9JVr1iB56+3TRB
	HvqAFpKASuc0PGcijfg2dw7R/KZIj0LSbEu8Rperk6wDE1MOV5CPcB8RHZ6CbWPB26Ca
	kd6ro7RzEIOqYQ4piiKeWUqN0UZgGxKatZPvt4GQ9iObCP/d0jODa3V3Zd0PWDlMBxur
	3JYg==
X-Gm-Message-State: AOAM533P1Yk2imB0NAo22LEzHbz7sjgt87thMkFlMSTwH8zZHneYOx0g
	oFhZW+3nu7K6UI6ahvNDgVZJ+hZ2y/I2eNW+SzVDD9LkMQ==
X-Google-Smtp-Source: ABdhPJxKvpP7c/4ASnHj27ybqk8nE0dF6fzyqwCvABNvHDQ61gcaXwTR2Q6Q0tBM+zsR0oflrNIPY5GLxaAiHJz9ksg=
X-Received: by 2002:aa7:db10:: with SMTP id t16mr9125634eds.196.1596313287057; 
	Sat, 01 Aug 2020 13:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200801184603.310769-1-jbi.octave@gmail.com>
	<20200801184603.310769-4-jbi.octave@gmail.com>
In-Reply-To: <20200801184603.310769-4-jbi.octave@gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sat, 1 Aug 2020 16:21:15 -0400
Message-ID: <CAHC9VhTQTvr2+TTL3rWyweVEDx_=q81YozPJyfhELOpn9zxDqA@mail.gmail.com>
Subject: Re: [PATCH 3/4] audit: uninitialize static variables
To: Jules Irenge <jbi.octave@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
Cc: "moderated list:AUDIT SUBSYSTEM" <linux-audit@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Aug 1, 2020 at 2:46 PM Jules Irenge <jbi.octave@gmail.com> wrote:
>
> Checkpatch tool reports an error at variable declaration
>
> "ERROR: do not initialise statics to 0"
>
> This is due to the fact that these variables are stored in the buffer
> In the .bss section, one can not set an initial value
> Here we can trust the compiler to automatically set them to zero.
> The variable has since been uninitialized.
>
> Signed-off-by: Jules Irenge <jbi.octave@gmail.com>
> ---
>  kernel/audit.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

In general this is fine, but it will have to wait until after the
merge window closes.

> diff --git a/kernel/audit.c b/kernel/audit.c
> index 7b1a38a211a9..7d79ecb58b01 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -311,8 +311,8 @@ void audit_panic(const char *message)
>
>  static inline int audit_rate_check(void)
>  {
> -       static unsigned long    last_check = 0;
> -       static int              messages   = 0;
> +       static unsigned long    last_check;
> +       static int              messages;
>         static DEFINE_SPINLOCK(lock);
>         unsigned long           flags;
>         unsigned long           now;
> @@ -348,7 +348,7 @@ static inline int audit_rate_check(void)
>  */
>  void audit_log_lost(const char *message)
>  {
> -       static unsigned long    last_msg = 0;
> +       static unsigned long    last_msg;
>         static DEFINE_SPINLOCK(lock);
>         unsigned long           flags;
>         unsigned long           now;
> @@ -713,7 +713,7 @@ static int kauditd_send_queue(struct sock *sk, u32 portid,
>  {
>         int rc = 0;
>         struct sk_buff *skb;
> -       static unsigned int failed = 0;
> +       static unsigned int failed;
>
>         /* NOTE: kauditd_thread takes care of all our locking, we just use
>          *       the netlink info passed to us (e.g. sk and portid) */
> --
> 2.26.2

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

