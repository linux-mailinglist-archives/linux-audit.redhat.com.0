Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 40B4C3205CD
	for <lists+linux-audit@lfdr.de>; Sat, 20 Feb 2021 15:51:11 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-8zr7RrFBOpa1KzVgWHgyMQ-1; Sat, 20 Feb 2021 09:51:07 -0500
X-MC-Unique: 8zr7RrFBOpa1KzVgWHgyMQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CED5980402C;
	Sat, 20 Feb 2021 14:51:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A73D36091B;
	Sat, 20 Feb 2021 14:51:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 28E9E18095CB;
	Sat, 20 Feb 2021 14:51:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11KEoc3t001105 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 20 Feb 2021 09:50:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 28E48103CA8; Sat, 20 Feb 2021 14:50:38 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2365F103CC2
	for <linux-audit@redhat.com>; Sat, 20 Feb 2021 14:50:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC9A11022F0A
	for <linux-audit@redhat.com>; Sat, 20 Feb 2021 14:50:35 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
	[209.85.208.43]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-362-JJe4p9rmPSa09bG_kenBSg-1; Sat, 20 Feb 2021 09:50:33 -0500
X-MC-Unique: JJe4p9rmPSa09bG_kenBSg-1
Received: by mail-ed1-f43.google.com with SMTP id c6so15976230ede.0
	for <linux-audit@redhat.com>; Sat, 20 Feb 2021 06:50:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=g9x+oRQ4dxdX/Lcd7XzVC8mAPWvFSQ3BbpYDOmT75qU=;
	b=dUg1HxnzjvvXMsZUX2WVMcnRuk9ANLN+vdW07upo6Y6pe1v6sYnH/+HSI0MwO6i2Xl
	pPuKerQO5FEgloWtGPcxcOjfMboZDVhpqPoC27Doyq6650mNp4Bd9Y+mg6wrhTbUKPj0
	zdVy9NgK0QxRF+V91uxrcqKdkNSiJzOYELwUdvJ2Fsk4oreq4Ulhvanuufy7muEc8ctv
	8j+Z+uFDevOIScuhJKfyX/Iyb68EU48JjpCqjVU/X/bpmRHyzuWPq5ac8sXvPI8TcA5Y
	7naJLEfVkUzTKblUMf6kEQKHPICNfH3l+PIIY6m2pTGuF17uwFo7lsTsQJH6CSkgsPt/
	6H9g==
X-Gm-Message-State: AOAM533VjDX6id7DZuPML7k0wiFhEW7SX21j7d/qeldhTwVA8O2i8HfP
	fGcRutl8qhnq3SoDJ0pk2X5IPgbZcojqmn7Puknt
X-Google-Smtp-Source: ABdhPJxDoQDl1riak88nhmzRFC5m+4Ns2U3daQUcXKO4UHBPAml5XfjQwYfQDJVh7yqcBX+pQqn608ufvJbf4pPLn4Y=
X-Received: by 2002:a05:6402:438d:: with SMTP id
	o13mr14030563edc.135.1613832632309; 
	Sat, 20 Feb 2021 06:50:32 -0800 (PST)
MIME-Version: 1.0
References: <CAHC9VhSiq5gqY1bfouia4GwYsE9MGGXnUOqwEtHi2u0-1=8aZQ@mail.gmail.com>
	<67cacc61-4d6a-39d5-f2c0-5530e8d1e39@namei.org>
In-Reply-To: <67cacc61-4d6a-39d5-f2c0-5530e8d1e39@namei.org>
From: Paul Moore <paul@paul-moore.com>
Date: Sat, 20 Feb 2021 09:50:21 -0500
Message-ID: <CAHC9VhRmFFqiF8oW_K_Rm3cKS9iEE97pjHeiTDcnYxR-HrpbeQ@mail.gmail.com>
Subject: Re: security_task_getsecid() and subjective vs objective task creds
To: James Morris <jmorris@namei.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 19, 2021 at 9:55 PM James Morris <jmorris@namei.org> wrote:
> On Thu, 18 Feb 2021, Paul Moore wrote:
>
> > Hi all,
> >
> > When looking into a problem I noticed that audit was recording the
> > wrong subject label for a process.
>
> Is this a public bug? It would be good to know what the extent of this
> issue may be and whether it warrants a CVE.

Let me rephrase, "When looking into a problem with some new patches
that I am working on I noticed ...".

I am not aware of any public bugs relating to this subj/obj confusion,
this was simply something I noticed while doing some new work.  I
would post those patches now, but they are still incomplete.
Regardless, this subj/obj confusion is something we should resolve.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

