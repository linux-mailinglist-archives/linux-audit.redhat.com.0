Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0EA6431FF4E
	for <lists+linux-audit@lfdr.de>; Fri, 19 Feb 2021 20:18:15 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-fQZZQTOKOAynTd4qYY70kA-1; Fri, 19 Feb 2021 14:18:12 -0500
X-MC-Unique: fQZZQTOKOAynTd4qYY70kA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B4029126D;
	Fri, 19 Feb 2021 19:18:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 520165D9C2;
	Fri, 19 Feb 2021 19:18:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A187018095CB;
	Fri, 19 Feb 2021 19:17:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11JJHT54000886 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 19 Feb 2021 14:17:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E23F914E78E; Fri, 19 Feb 2021 19:17:28 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD0DF8145
	for <linux-audit@redhat.com>; Fri, 19 Feb 2021 19:17:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E6CB185A7BC
	for <linux-audit@redhat.com>; Fri, 19 Feb 2021 19:17:25 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
	[209.85.218.47]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-356-FA6f4F9sMPquuA6WzS6Xlw-1; Fri, 19 Feb 2021 14:17:22 -0500
X-MC-Unique: FA6f4F9sMPquuA6WzS6Xlw-1
Received: by mail-ej1-f47.google.com with SMTP id n13so15403138ejx.12
	for <linux-audit@redhat.com>; Fri, 19 Feb 2021 11:17:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nZs1wSdgL/SgoAFkReiUr/6KBmirZDSjcDrTj7CIg3Q=;
	b=VQ4nGcxkuvwsTajlXwhN23undRGCOGn17LNn0s5NDtFtuu5Aq7coXTzMHwE8TNVVaL
	nB8Y157h/EtOUdfWW7z65ZP/IXvhLwhpJgF9iC4JPkaARIyrMcW4DTpXegM+HnrUJ8uC
	8nnfSyLoBPJ8E4CaED8V5/zVI1tAoVs4gxAxN7UOwiAJq0j72RXsxH8TOxQ0B4OG1Fpm
	r7V2DBakGvsybtWuPaI4wNluOw1FwH1LKwDeu3p1VL2YfQ5Jw9g5j39pRdP844EWW2mh
	FWj7rwYGPEzNF4VDpJSQ5PjH3ki/ATo7fuOpZqWSrvJSzET7XXIqDAh8ByaHqr++PgX/
	j47A==
X-Gm-Message-State: AOAM533H0PXX5YOk8nNjioHl+KR+afZWVk5XjxQcvyufxyhRCbtoIhZf
	Nw+xQd59BPCy+EtP61H2X+YdF/ezwwcSPsFYUUE2
X-Google-Smtp-Source: ABdhPJw+gZP/nDPCsSBenWAkB0SKtr5q8oled0F3cbjP7gQRq9BHgZ9B/kJBuy5LKnJX9UA8ax3dR7wXijdM4FThhI4=
X-Received: by 2002:a17:906:c28e:: with SMTP id
	r14mr7665056ejz.546.1613762241659; 
	Fri, 19 Feb 2021 11:17:21 -0800 (PST)
MIME-Version: 1.0
References: <CAHC9VhSiq5gqY1bfouia4GwYsE9MGGXnUOqwEtHi2u0-1=8aZQ@mail.gmail.com>
	<a38955de-1a71-ab0c-0cff-d63ea258ca81@schaufler-ca.com>
In-Reply-To: <a38955de-1a71-ab0c-0cff-d63ea258ca81@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 19 Feb 2021 14:17:10 -0500
Message-ID: <CAHC9VhQcDbitpkWXoY5xU+Hmqv5PHKFS+An402gzDT71dUmPfA@mail.gmail.com>
Subject: Re: security_task_getsecid() and subjective vs objective task creds
To: Casey Schaufler <casey@schaufler-ca.com>
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
Cc: selinux@vger.kernel.org, linux-security-module@vger.kernel.org,
	linux-audit@redhat.com
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 18, 2021 at 4:40 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> On 2/18/2021 11:34 AM, Paul Moore wrote:

...

> > How do we want to fix this?  The obvious fix is to change the SELinux,
> > AppArmor, and Smack security_task_getsecid() implementations to return
> > the subjective security ID (->cred), and likely make a note in
> > lsm_hooks.h,
>
> That would be my choice.

As I've dug into this more, it does look like that is closest to being
correct, but there are still a few callers where it looks like the
objective creds are needed.  I think the correct thing to do is
convert the existing hook to use the subjective creds and add a
"_subj" at the end, while also creating a new
security_task_getsecid_obj() hook to return the objective cred and
updating those few callers that need it.

I'll see about making the associated changes to the Smack and AppArmor
code too, but that will obviously need some heavy review by you and
John.

--
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

