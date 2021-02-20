Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D38A33205C3
	for <lists+linux-audit@lfdr.de>; Sat, 20 Feb 2021 15:42:46 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-_tV5eUdAPTGLqmAj9DpoyQ-1; Sat, 20 Feb 2021 09:42:43 -0500
X-MC-Unique: _tV5eUdAPTGLqmAj9DpoyQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 254D718449E6;
	Sat, 20 Feb 2021 14:42:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E11161970A;
	Sat, 20 Feb 2021 14:42:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B67ED4EE7F;
	Sat, 20 Feb 2021 14:42:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11KEg2mC032165 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 20 Feb 2021 09:42:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E248C2026D14; Sat, 20 Feb 2021 14:42:01 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD7212026D13
	for <linux-audit@redhat.com>; Sat, 20 Feb 2021 14:41:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C18B8919BA
	for <linux-audit@redhat.com>; Sat, 20 Feb 2021 14:41:59 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
	[209.85.208.49]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-268-txmHKm9GM8iebRtAhgNkeg-1; Sat, 20 Feb 2021 09:41:56 -0500
X-MC-Unique: txmHKm9GM8iebRtAhgNkeg-1
Received: by mail-ed1-f49.google.com with SMTP id h25so2245075eds.4
	for <linux-audit@redhat.com>; Sat, 20 Feb 2021 06:41:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bcMXzHETlziskFHmDJ+qkZLeneeQpeM7XNw3uJBtD+c=;
	b=P95Otovm9JHWmWVXjIDgTBFuoSMbXHFWPmISoVH+zXZbRI9UCuvXFEb8rHKJrx4lXd
	3E2tGFzlNfa1++DkpcL32DuPnuzRPg804POKGWz9iKofU09Waua4u5uJMa/6vOeaO8eK
	hQGDPsfkkOnlsUCW8X+gdGWZhqX0G7wiE+yG9a9XieiJ40NZv2sUZJaLXJkp3M94TChj
	JUr1tuZjckqeI6fanVEKMuqK2IfxGbGL5Z3L4YIiaEH+AbUSw88aWuWmrJqdteDKPOf+
	tp/nlHxXrgZSgJS7ZZbyOfgfuqleWCBrM0IW7PI8+4Gswfy1ugyHV/iC3ixvrvqtOlqt
	U9Tw==
X-Gm-Message-State: AOAM533Mertp9V7E+X172uu4g2R3mxXFY5oYGN9cQ9e5THVZwuio+DIR
	Mf6I2JmJnQIszfRMU97fNLdq18DA5A5jRUnhq9Jj
X-Google-Smtp-Source: ABdhPJxxLAZLt/puGXEZyNivaEvDVegaTzTNADNqggY/6U73kUDTWgCF0vyCCU1n+fkOfxsvgqCtQWMRbxJG7KkTEHs=
X-Received: by 2002:aa7:df0a:: with SMTP id c10mr14279765edy.12.1613832115287; 
	Sat, 20 Feb 2021 06:41:55 -0800 (PST)
MIME-Version: 1.0
References: <161377712068.87807.12246856567527156637.stgit@sifl>
	<9ea5259b-fd84-e176-c042-c52a1c4fcc27@schaufler-ca.com>
In-Reply-To: <9ea5259b-fd84-e176-c042-c52a1c4fcc27@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sat, 20 Feb 2021 09:41:44 -0500
Message-ID: <CAHC9VhQBbep2WkD6JkCemtcXFLq7j5=AQeM9vVJ4_gmvi7hPQA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] Split security_task_getsecid() into subj and obj
	variants
To: Casey Schaufler <casey@schaufler-ca.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
Cc: selinux@vger.kernel.org, linux-security-module@vger.kernel.org,
	John Johansen <john.johansen@canonical.com>, linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 19, 2021 at 8:49 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> On 2/19/2021 3:28 PM, Paul Moore wrote:
> > As discussed briefly on the list (lore link below), we are a little
> > sloppy when it comes to using task credentials, mixing both the
> > subjective and object credentials.  This patch set attempts to fix
> > this by replacing security_task_getsecid() with two new hooks that
> > return either the subjective (_subj) or objective (_obj) credentials.
> >
> > https://lore.kernel.org/linux-security-module/806848326.0ifERbkFSE@x2/T/
> >
> > Casey and John, I made a quick pass through the Smack and AppArmor
> > code in an effort to try and do the right thing, but I will admit
> > that I haven't tested those changes, just the SELinux code.  I
> > would really appreciate your help in reviewing those changes.  If
> > you find it easier, feel free to wholesale replace my Smack/AppArmor
> > patch with one of your own.
>
> A quick test pass didn't show up anything obviously
> amiss with the Smack changes. I have will do some more
> through inspection, but they look fine so far.

Thanks for testing it out and giving it a look.  Beyond the Smack
specific changes, I'm also interested in making sure all the hook
callers are correct; I believe I made the correct substitutions, but a
second (or third (or fourth ...)) set of eyes is never a bad idea.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

