Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id CAAAF145E0F
	for <lists+linux-audit@lfdr.de>; Wed, 22 Jan 2020 22:31:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579728660;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KrkW8ACVzU2bfyomADPtaxo7w1BledDgOsC6qGLpLAI=;
	b=TEayxz7wD/d5neh5dJnewX9WRezx43RiXNC2nUgq5GtpdefS2XBR5gI337q0nnjKzLgu5Q
	kgK2lJV3lrFiNLt4BKzWuDjNVGvWO6jX2KiseoheBgBjtus7nQCV0ZbTjvpzKAWAaRLFs7
	eH4tU7Dp0iLWcXaa9zpXZFDLKlePFAc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-F5Mu7HZlNNmEdbrjkX6evg-1; Wed, 22 Jan 2020 16:30:58 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B6C0801E6C;
	Wed, 22 Jan 2020 21:30:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 246955C548;
	Wed, 22 Jan 2020 21:30:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A1568870B3;
	Wed, 22 Jan 2020 21:30:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00MLSdw4003515 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 22 Jan 2020 16:28:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B474BF4D31; Wed, 22 Jan 2020 21:28:39 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B09C9F89EE
	for <linux-audit@redhat.com>; Wed, 22 Jan 2020 21:28:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9EABE803889
	for <linux-audit@redhat.com>; Wed, 22 Jan 2020 21:28:37 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-37-MwGDGopMN9eV07Q_9TdKEA-1; Wed, 22 Jan 2020 16:28:35 -0500
Received: by mail-lj1-f194.google.com with SMTP id h23so705356ljc.8
	for <linux-audit@redhat.com>; Wed, 22 Jan 2020 13:28:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PP/urhQquewzkG31d0Bv7dDFia5iR+GM30A5qGisAZo=;
	b=bonnEEA0qqoB18DIPie8D/EzvPMVbcX9i7rv/p7hmtaF+Ug8dlFe6GP3zl+JW5d0fc
	vpMyQa1HOLcmE0VZMXhr8mfHGtjulA+gzsuE01eoGuzT81UVSqGyqWBe/S6AyiCaZO7n
	l0+B3GmnxVLnkvAX1KsEGodLQlCPtmFt8+eQ1TFGsGTDdkU8J/IyIWngB/4qoOtswR4q
	U4cNvYBhZ5nXUoAcHIjGj8OFfSOj0qqv2a4VOvgirdCgzPqt2/7y6KnyC898qmeK2uFf
	z9DH8JA61dwATNDqRoACi22pdC+u7Tn4D0bavXZTJq1v7uxqqdo/gqblp+BnPg6zgD3M
	l4gw==
X-Gm-Message-State: APjAAAVg28WIgutJLXVmVPZMgVE0Gke7tuIUwa2hck0EPH0WpU+eXK3G
	+G9lNq/k/wsZkGhV10WjydXHWNfaFyffzqz61ScK
X-Google-Smtp-Source: APXvYqzouLX05x7dEZusBBRcnAKMMWYsgy2d+H9MFjd13MPyiEyOVYhFhGf6qiCbTeoXa/XkPTez2v/ENY6/zc2Zo34=
X-Received: by 2002:a2e:6f19:: with SMTP id k25mr20795552ljc.84.1579728513965; 
	Wed, 22 Jan 2020 13:28:33 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577736799.git.rgb@redhat.com>
	<b3725abab452beaba740ac58f76144e6c3bda2fa.1577736799.git.rgb@redhat.com>
In-Reply-To: <b3725abab452beaba740ac58f76144e6c3bda2fa.1577736799.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 22 Jan 2020 16:28:22 -0500
Message-ID: <CAHC9VhQ=+4P6Rr1S1-sNb2X-CbYYKMQMJDGP=bBr8GG3xLD8qQ@mail.gmail.com>
Subject: Re: [PATCH ghak90 V8 05/16] audit: log drop of contid on exit of last
	task
To: Richard Guy Briggs <rgb@redhat.com>
X-MC-Unique: MwGDGopMN9eV07Q_9TdKEA-1
X-MC-Unique: F5Mu7HZlNNmEdbrjkX6evg-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00MLSdw4003515
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, mpatel@redhat.com,
	Serge Hallyn <serge@hallyn.com>
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
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 31, 2019 at 2:50 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> Since we are tracking the life of each audit container indentifier, we
> can match the creation event with the destruction event.  Log the
> destruction of the audit container identifier when the last process in
> that container exits.
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  kernel/audit.c   | 17 +++++++++++++++++
>  kernel/audit.h   |  2 ++
>  kernel/auditsc.c |  2 ++
>  3 files changed, 21 insertions(+)
>
> diff --git a/kernel/audit.c b/kernel/audit.c
> index 4bab20f5f781..fa8f1aa3a605 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -2502,6 +2502,23 @@ int audit_set_contid(struct task_struct *task, u64 contid)
>         return rc;
>  }
>
> +void audit_log_container_drop(void)
> +{
> +       struct audit_buffer *ab;
> +
> +       if (!current->audit || !current->audit->cont ||
> +           refcount_read(&current->audit->cont->refcount) > 1)
> +               return;
> +       ab = audit_log_start(audit_context(), GFP_KERNEL, AUDIT_CONTAINER_OP);
> +       if (!ab)
> +               return;
> +
> +       audit_log_format(ab, "op=drop opid=%d contid=%llu old-contid=%llu",
> +                        task_tgid_nr(current), audit_get_contid(current),
> +                        audit_get_contid(current));
> +       audit_log_end(ab);
> +}

Assumine we are careful about where we call it in audit_free(...), you
are confident we can't do this as part of _audit_contobj_put(...),
yes?


>  /**
>   * audit_log_end - end one audit record
>   * @ab: the audit_buffer
> diff --git a/kernel/audit.h b/kernel/audit.h
> index e4a31aa92dfe..162de8366b32 100644
> --- a/kernel/audit.h
> +++ b/kernel/audit.h
> @@ -255,6 +255,8 @@ extern void audit_log_d_path_exe(struct audit_buffer *ab,
>  extern struct tty_struct *audit_get_tty(void);
>  extern void audit_put_tty(struct tty_struct *tty);
>
> +extern void audit_log_container_drop(void);
> +
>  /* audit watch/mark/tree functions */
>  #ifdef CONFIG_AUDITSYSCALL
>  extern unsigned int audit_serial(void);
> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index 0e2d50533959..bd855794ad26 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -1568,6 +1568,8 @@ static void audit_log_exit(void)
>
>         audit_log_proctitle();
>
> +       audit_log_container_drop();
> +
>         /* Send end of event record to help user space know we are finished */
>         ab = audit_log_start(context, GFP_KERNEL, AUDIT_EOE);
>         if (ab)
> --
> 1.8.3.1
>

--
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

