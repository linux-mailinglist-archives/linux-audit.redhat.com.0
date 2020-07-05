Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5F9B0214D62
	for <lists+linux-audit@lfdr.de>; Sun,  5 Jul 2020 17:10:53 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-IzPTOLmDMtWc7iH1mSut6w-1; Sun, 05 Jul 2020 11:10:46 -0400
X-MC-Unique: IzPTOLmDMtWc7iH1mSut6w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53DD81005510;
	Sun,  5 Jul 2020 15:10:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD53C6FDD1;
	Sun,  5 Jul 2020 15:10:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2C2BB1809561;
	Sun,  5 Jul 2020 15:10:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 065FAXfg028182 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 5 Jul 2020 11:10:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 585DC17459; Sun,  5 Jul 2020 15:10:33 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E5C69D7C
	for <linux-audit@redhat.com>; Sun,  5 Jul 2020 15:10:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC06B924905
	for <linux-audit@redhat.com>; Sun,  5 Jul 2020 15:10:26 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-410-QEPJs3f_MayXnsQ40HyDFg-1; Sun, 05 Jul 2020 11:10:25 -0400
X-MC-Unique: QEPJs3f_MayXnsQ40HyDFg-1
Received: by mail-ed1-f65.google.com with SMTP id n2so23320179edr.5
	for <linux-audit@redhat.com>; Sun, 05 Jul 2020 08:10:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=y3JwZGbweZ3BK0fV1w8xzrYzjR5xwU4JCV9NoTN0jpw=;
	b=df3S9zZ24QaNeIJ276togerGkQb4CPFufsZO6PFPzTPLYrPOY5jOswYwpUr6hdgC04
	tsZ3tFhUh+d2kAJAucAlLJLkUWsqURjqAcJd60uEJ2ZWHTakvPQ/Bpe+J/Fb0Xzyp7+C
	ZkcaEAe7+QY/wL6XtozOYUl0KwGiOQy3eg2qPQXSh1bW6Mjb701a+PcHp5VIph5n3pXB
	IDiivp3AnHxQSPMz6KSfuEUAA/PJeSpk23e9Hn+Jv3KIdvg9AHnJezNZIQ4rXZOiOqAt
	AbZiSw0X/kbnLIcywF2Bx8cywptsqkA41VoLtBbCFlD6dZf+6yDSIwsCXYtILUeuJdZA
	Puog==
X-Gm-Message-State: AOAM530hdX0rJALU5F/6ylVup3Osu1rflz8IWxZD37T5FGMBOMhBdqki
	nUuH1pbCjC4BaMXUD0QqtRjq47JvZ0sKLsuVIPIXepY=
X-Google-Smtp-Source: ABdhPJxmCW6mI05l3xIDHLx8qBO/0qPoQYIx6tUcpj0AgBk4IDP/Xb+w50SWr/wKbjgl+/Q/V05f4AkowPSQxVt5Db8=
X-Received: by 2002:a05:6402:1d89:: with SMTP id
	dk9mr39302382edb.31.1593961823707; 
	Sun, 05 Jul 2020 08:10:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593198710.git.rgb@redhat.com>
	<e9310d6d9d909f4ac7ef1b688fbb0263711f9a24.1593198710.git.rgb@redhat.com>
In-Reply-To: <e9310d6d9d909f4ac7ef1b688fbb0263711f9a24.1593198710.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 5 Jul 2020 11:10:12 -0400
Message-ID: <CAHC9VhQsg8zCMCEwKFFchebTPSHZOC+oYoUAEKeAFm248OXsOQ@mail.gmail.com>
Subject: Re: [PATCH ghak90 V9 04/13] audit: log drop of contid on exit of last
	task
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jun 27, 2020 at 9:22 AM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> Since we are tracking the life of each audit container indentifier, we
> can match the creation event with the destruction event.  Log the
> destruction of the audit container identifier when the last process in
> that container exits.
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  kernel/audit.c   | 20 ++++++++++++++++++++
>  kernel/audit.h   |  2 ++
>  kernel/auditsc.c |  2 ++
>  3 files changed, 24 insertions(+)

If you end up respinning this patchset it seems like this should be
merged in with patch 2/13.  This way patch 2/13 would include both the
"set" and "drop" records, making that patch a bit more useful on it's
own.

> diff --git a/kernel/audit.c b/kernel/audit.c
> index 6d387793f702..9e0b38ce1ead 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -2558,6 +2558,26 @@ int audit_set_contid(struct task_struct *task, u64 contid)
>         return rc;
>  }
>
> +void audit_log_container_drop(void)
> +{
> +       struct audit_buffer *ab;
> +       struct audit_contobj *cont;
> +
> +       rcu_read_lock();
> +       cont = _audit_contobj_get(current);
> +       _audit_contobj_put(cont);
> +       if (!cont || refcount_read(&cont->refcount) > 1)
> +               goto out;
> +       ab = audit_log_start(audit_context(), GFP_KERNEL, AUDIT_CONTAINER_OP);

You may want to check on sleeping with RCU locks held, or just use
GFP_ATOMIC to be safe.


> +       if (!ab)
> +               goto out;
> +       audit_log_format(ab, "op=drop opid=%d contid=%llu old-contid=%llu",
> +                        task_tgid_nr(current), cont->id, cont->id);
> +       audit_log_end(ab);
> +out:
> +       rcu_read_unlock();
> +}
> +
>  /**
>   * audit_log_end - end one audit record
>   * @ab: the audit_buffer
> diff --git a/kernel/audit.h b/kernel/audit.h
> index 182fc76ea276..d07093903008 100644
> --- a/kernel/audit.h
> +++ b/kernel/audit.h
> @@ -254,6 +254,8 @@ extern void audit_log_d_path_exe(struct audit_buffer *ab,
>  extern struct tty_struct *audit_get_tty(void);
>  extern void audit_put_tty(struct tty_struct *tty);
>
> +extern void audit_log_container_drop(void);
> +
>  /* audit watch/mark/tree functions */
>  #ifdef CONFIG_AUDITSYSCALL
>  extern unsigned int audit_serial(void);
> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index f00c1da587ea..f03d3eb0752c 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -1575,6 +1575,8 @@ static void audit_log_exit(void)
>
>         audit_log_proctitle();
>
> +       audit_log_container_drop();
> +
>         /* Send end of event record to help user space know we are finished */
>         ab = audit_log_start(context, GFP_KERNEL, AUDIT_EOE);
>         if (ab)

--
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

