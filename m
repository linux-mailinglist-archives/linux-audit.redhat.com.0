Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1E8C023543F
	for <lists+linux-audit@lfdr.de>; Sat,  1 Aug 2020 22:26:53 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-MJDLBKjaNzOtNO4eLFYATw-1; Sat, 01 Aug 2020 16:26:50 -0400
X-MC-Unique: MJDLBKjaNzOtNO4eLFYATw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B941C8017FB;
	Sat,  1 Aug 2020 20:26:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F5805D9E8;
	Sat,  1 Aug 2020 20:26:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C781495A9B;
	Sat,  1 Aug 2020 20:26:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 071KQPNE000329 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 1 Aug 2020 16:26:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4F8B4DBAE5; Sat,  1 Aug 2020 20:26:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B4CEDBAEE
	for <linux-audit@redhat.com>; Sat,  1 Aug 2020 20:26:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3EC8D8007D7
	for <linux-audit@redhat.com>; Sat,  1 Aug 2020 20:26:22 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
	[209.85.218.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-395-LPwibuxIM4-vZLLMZ9t8vg-1; Sat, 01 Aug 2020 16:26:20 -0400
X-MC-Unique: LPwibuxIM4-vZLLMZ9t8vg-1
Received: by mail-ej1-f66.google.com with SMTP id o18so34751543eje.7
	for <linux-audit@redhat.com>; Sat, 01 Aug 2020 13:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+a0yGWWLvkimp+sCjAPTJ7AG+vTG8fsI+soOkfq3Pko=;
	b=QYEPgQ/cXf7PglvpeYAQHJ8SXJZqcJ0aBtbSch8IUOYM8dqO4pTeQOUfCAYzhGKLIs
	VBL2FXkLne90yGIMm5NKiX+qyS34B/7MzmDx26OZDJq/Fu5Y39N/piMOTv1c1kCFLfZP
	WhgSnHQWYEkbAPk57fKyEU5YgGJmzj2sBrmF9OGMuZU7rd4dwjsK85p/D+LrEkswONzP
	cCNfvr7/iDJbvjKCbkGXqLHjq36RrA84hrcECx6TUdvkyTabfBIqL8w6GSIx1RttclN9
	broujaVDlxmSQ/QeRhRx/97nKrkug1Vbv0fIDTEa9yZdJ00njQQBHYUJUUS7LJF7n9Z1
	7gWg==
X-Gm-Message-State: AOAM533zn5Vvu4vBIFK0+CZPcEjnCQf+FWQEQVrFuAQIaaD+w/05fpPf
	oAM+irNksUIDrD3XR6flybBCfrss1WxTSYFgYlbs
X-Google-Smtp-Source: ABdhPJwXECVTRu8guNz+dzN8J9+xWDM9V6RqekJhlUpEKFQgqXixVlN0WdfX25oXJLL0dVvYiOa0wDOgjmoMLDdqupc=
X-Received: by 2002:a17:906:7c86:: with SMTP id
	w6mr9625303ejo.178.1596313578663; 
	Sat, 01 Aug 2020 13:26:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200801184603.310769-1-jbi.octave@gmail.com>
	<20200801184603.310769-3-jbi.octave@gmail.com>
	<91c6c45f0d8ec0d031c216711cd8d7f6e9aad7ad.camel@perches.com>
In-Reply-To: <91c6c45f0d8ec0d031c216711cd8d7f6e9aad7ad.camel@perches.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sat, 1 Aug 2020 16:26:07 -0400
Message-ID: <CAHC9VhRZ8_ZH_HZxG7coSgXo5O+G-o91wYrCv-UPK8R03OjFxg@mail.gmail.com>
Subject: Re: [PATCH 2/4] audit: uninitialize global variable audit_sig_sid
To: Joe Perches <joe@perches.com>, Jules Irenge <jbi.octave@gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Aug 1, 2020 at 2:55 PM Joe Perches <joe@perches.com> wrote:
> On Sat, 2020-08-01 at 19:46 +0100, Jules Irenge wrote:
> > Checkpatch tool reports an error at variable audit_sig_sid declaration
> []
> > diff --git a/kernel/audit.c b/kernel/audit.c
> []
> > @@ -125,7 +125,7 @@ static u32        audit_backlog_wait_time = AUDIT_BACKLOG_WAIT_TIME;
> >  /* The identity of the user shutting down the audit system. */
> >  kuid_t               audit_sig_uid = INVALID_UID;
> >  pid_t                audit_sig_pid = -1;
> > -u32          audit_sig_sid = 0;
> > +u32          audit_sig_sid;
>
> All of these are unused outside of audit.c and might as
> well be static and removed from the .h file.

There's plenty of time before the merge window closes, doing this
would definitely make this patch much more useful than the typical
checkpatch noise.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

