Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3565B1F03D4
	for <lists+linux-audit@lfdr.de>; Sat,  6 Jun 2020 02:22:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591402969;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5NDBKDr+D+aRHCtoJFs0cOpkhcvc+gvqnz27Ql4D51s=;
	b=fEclr9cCjfmrvjo3/4C/vwwB3+zMe7Bw7qrhm60rfv+xMrZXXciYZYxWr7/ZqhcidbAUJj
	D6Y/widN85aXoULk9U76lzVlk56bZP5Tc/ZsAEBcq7hWnIajG4BxmRII5OGc3io5WPbSt5
	4CDJPcbARiTpRR0dHj7vvbCqGpuvGWw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-Arnai7yjPpiU7zCzu1wkhQ-1; Fri, 05 Jun 2020 20:22:47 -0400
X-MC-Unique: Arnai7yjPpiU7zCzu1wkhQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 783E819200D0;
	Sat,  6 Jun 2020 00:22:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C34F78FDB;
	Sat,  6 Jun 2020 00:22:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6588D1805311;
	Sat,  6 Jun 2020 00:22:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 055Jc9G9002958 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 5 Jun 2020 15:38:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AF9F2100335C; Fri,  5 Jun 2020 19:38:09 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ABC5C1007393
	for <linux-audit@redhat.com>; Fri,  5 Jun 2020 19:38:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F3088007A4
	for <linux-audit@redhat.com>; Fri,  5 Jun 2020 19:38:07 +0000 (UTC)
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
	[209.85.218.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-332-aGgs-o8PPja4kByGJuRAmQ-1; Fri, 05 Jun 2020 15:38:04 -0400
X-MC-Unique: aGgs-o8PPja4kByGJuRAmQ-1
Received: by mail-ej1-f67.google.com with SMTP id x1so11316482ejd.8
	for <linux-audit@redhat.com>; Fri, 05 Jun 2020 12:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eOF1BRH3hqUoMNIFRgJb8qWo4oAn8/8kkqpSwUrcV0E=;
	b=LgfPBFE0UatUovv/bnXIo4jNXF371coE94qNJgfsG2zYg5mmG5iLuC80ZmlOUWhqAJ
	kdrJQBM71Eu13l2+9Aqi/ZG+81J7l8uWzFuSDlIidRdWFqa+zG8ohwnNWEKcG7jo8hvV
	8pIedVASKKk2IVzJ9krMuj6SUbC0/KmMeCuiDZLRYGsJA97H1xvCpyAqS1po4n4D3PYT
	Nny4E0mPhtsw/SYfFFq485VkZNbulqqwwjkBYH1UXCPS7H5Wweyadd7GqZNGSgTkB+YN
	FvjUV2wi70tZNR9/N6l8XDiekiMfLO27WGy7VpjBGZ2RwjKk60CL0RD34ZL7sTDC523h
	Fk9A==
X-Gm-Message-State: AOAM530lu3ofpllgpoLUjemziQbKMphM1yabhiSNRSNLC580aXXfxFpS
	3IH0znRWrAYtTbMWzqUZaksKQU+IyWtVa6bVldsO
X-Google-Smtp-Source: ABdhPJynBTUuAesu8TZmhXmvdaQE0Ftl+C+xkFDUiYKUtjaE5qcD7vJ2l61mQAblJihXIT2xzHwpHUX6JZ9vZlZOznI=
X-Received: by 2002:a17:906:e257:: with SMTP id
	gq23mr9631120ejb.398.1591385882972; 
	Fri, 05 Jun 2020 12:38:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200604163243.2575-1-nramas@linux.microsoft.com>
	<1591382782.5816.36.camel@linux.ibm.com>
In-Reply-To: <1591382782.5816.36.camel@linux.ibm.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 5 Jun 2020 15:37:52 -0400
Message-ID: <CAHC9VhS-EP=Kk3GKRzAGAYa5mqupkLQCHz_m_DgoAKRWcSTgLA@mail.gmail.com>
Subject: Re: [PATCH] IMA: Add log statements for failure conditions
To: Mimi Zohar <zohar@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
Cc: tusharsu@linux.microsoft.com,
	Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
	linux-integrity@vger.kernel.org, linux-audit@redhat.com,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 5, 2020 at 2:46 PM Mimi Zohar <zohar@linux.ibm.com> wrote:
>
> [Cc'ing Paul Moore]

If it's audit related, it's generally best to CC the linux-audit list,
not just me (fixed).

It's not clear to me what this pr_err() is trying to indicate other
than *something* failed.  Can someone provide some more background on
this message?

> Hi Lakshmi,
>
> On Thu, 2020-06-04 at 09:32 -0700, Lakshmi Ramasubramanian wrote:
> > The final log statement in process_buffer_measurement() for failure
> > condition is at debug level. This does not log the message unless
> > the system log level is raised which would significantly increase
> > the messages in the system log. Change this log message to error level,
> > and add eventname and ima_hooks enum to the message for better triaging
> > failures in the function.
> >
> > ima_alloc_key_entry() does not log a message for failure condition.
> > Add an error message for failure condition in this function.
> >
> > Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
>
> These messages should probably be turned into audit messages.  Look at
> integerity_audit_msg().
>
> Mimi
>
> > ---
> >  security/integrity/ima/ima_main.c       | 3 ++-
> >  security/integrity/ima/ima_queue_keys.c | 2 ++
> >  2 files changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
> > index 9d0abedeae77..3b371f31597b 100644
> > --- a/security/integrity/ima/ima_main.c
> > +++ b/security/integrity/ima/ima_main.c
> > @@ -756,7 +756,8 @@ void process_buffer_measurement(const void *buf, int size,
> >
> >  out:
> >       if (ret < 0)
> > -             pr_devel("%s: failed, result: %d\n", __func__, ret);
> > +             pr_err("%s failed. eventname: %s, func: %d, result: %d\n",
> > +                    __func__, eventname, func, ret);
> >
> >       return;
> >  }
> > diff --git a/security/integrity/ima/ima_queue_keys.c b/security/integrity/ima/ima_queue_keys.c
> > index cb3e3f501593..e51d0eb08d8a 100644
> > --- a/security/integrity/ima/ima_queue_keys.c
> > +++ b/security/integrity/ima/ima_queue_keys.c
> > @@ -88,6 +88,8 @@ static struct ima_key_entry *ima_alloc_key_entry(struct key *keyring,
> >
> >  out:
> >       if (rc) {
> > +             pr_err("%s failed. keyring: %s, result: %d\n",
> > +                    __func__, keyring->description, rc);
> >               ima_free_key_entry(entry);
> >               entry = NULL;
> >       }
>


-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

