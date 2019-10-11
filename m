Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C79F1D3637
	for <lists+linux-audit@lfdr.de>; Fri, 11 Oct 2019 02:39:22 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A237880F83;
	Fri, 11 Oct 2019 00:39:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A2092102471F;
	Fri, 11 Oct 2019 00:39:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 55D031803517;
	Fri, 11 Oct 2019 00:39:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9B0d1Zt028703 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 10 Oct 2019 20:39:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 94304450C; Fri, 11 Oct 2019 00:39:01 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F021194BE
	for <linux-audit@redhat.com>; Fri, 11 Oct 2019 00:39:01 +0000 (UTC)
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A4826309BDA3
	for <linux-audit@redhat.com>; Fri, 11 Oct 2019 00:39:00 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id 72so5737433lfh.6
	for <linux-audit@redhat.com>; Thu, 10 Oct 2019 17:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Pm/TZSzXy437wu+vyWK0Qjm9IhWSg3vJAsAFSwxSnrk=;
	b=1KcesDffcGnKA4GAzrknPzqvQrPTCqS9t2/rckO1iG3HulAZG3zPkLOIB4rv9R2qm1
	cYK5lMtArrFF57CeA2o5TZF9NYI1WYOiaZQ8jRjc6DGgrpvU1cKMJEQGMnUwzFG9eOQL
	QubM+E7t070B7K+SENHzNKM83N5bfzYlNct+yvWYwNb7ONj4jpPp1fB2aVwMmRZJOuCJ
	JLWOCEG9U1Az0cT3rZOmZLSFoxZqFlXSNi632LpISf8g5LANO33I819fqUC4Y3msBH3t
	Az/5MQmT+V6oQZhDIEF/9UeUDII17W0qJJhQ0RrtmnQv3E6NBA1WraU96da6QpQto2Zu
	zaKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Pm/TZSzXy437wu+vyWK0Qjm9IhWSg3vJAsAFSwxSnrk=;
	b=oswvEZ4lttrBxj5MOdGV5hH2FGKfJ6DkmAqDFPTItMcGleYT87QDJ17drirTH3Z291
	T+cyrKfBGJFhT2Ost4fSG0fjXijRIzcuDLr32djfamKP/dIVvqqX/WlDYwKdLb3oNZvk
	NBk0HP95d3Bio0ryQW/j9RKL0Yy/NVJSCPOmOvVcB9rJUMLyXt2C8+mfTKuazVDe290K
	mAIMG7eIaWerVqzn6zFlv99+dhdLm4pvy/WOt59gg6Wss3WVFSzLrxlqlHHPxwOWdRVR
	NQHin85L5Lu5Q2DMZ5A89RxXUz2swXlF2Owf/LB1yJeRRsZlWg34cZWkOL61JsiD9zTM
	EZhw==
X-Gm-Message-State: APjAAAVlpQu7WHLIgo2HJ38XiXp+9rmxqW61LmgIoQaMkyZvYKnAK4mf
	RBrLEDfgtudOPpSGEHAnAbD/oIf+EbrlRZkllV3/
X-Google-Smtp-Source: APXvYqxG/pSHweUE1uKB7QkPj7LT5EXlmpz5kWU352mmZUeLqkWI276AG/DSr8XDfskTEFx9V66sNy0xCK/wzAtSSqQ=
X-Received: by 2002:ac2:5542:: with SMTP id l2mr7186058lfk.119.1570754338909; 
	Thu, 10 Oct 2019 17:38:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1568834524.git.rgb@redhat.com>
	<71b75f54342f32f176c2b6d94584f2a666964e68.1568834524.git.rgb@redhat.com>
In-Reply-To: <71b75f54342f32f176c2b6d94584f2a666964e68.1568834524.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 10 Oct 2019 20:38:47 -0400
Message-ID: <CAHC9VhQYVzGKRx48dgX1j3CJOe1N0widkhWb=_-3ohnOdZHhUw@mail.gmail.com>
Subject: Re: [PATCH ghak90 V7 05/21] audit: log drop of contid on exit of last
	task
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Fri, 11 Oct 2019 00:39:01 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Fri, 11 Oct 2019 00:39:01 +0000 (UTC) for IP:'209.85.167.65'
	DOMAIN:'mail-lf1-f65.google.com' HELO:'mail-lf1-f65.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.167.65 mail-lf1-f65.google.com 209.85.167.65
	mail-lf1-f65.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Fri, 11 Oct 2019 00:39:21 +0000 (UTC)

On Wed, Sep 18, 2019 at 9:24 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> Since we are tracking the life of each audit container indentifier, we
> can match the creation event with the destruction event.  Log the
> destruction of the audit container identifier when the last process in
> that container exits.
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  kernel/audit.c   | 32 ++++++++++++++++++++++++++++++++
>  kernel/audit.h   |  2 ++
>  kernel/auditsc.c |  2 ++
>  3 files changed, 36 insertions(+)
>
> diff --git a/kernel/audit.c b/kernel/audit.c
> index ea0899130cc1..53d13d638c63 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -2503,6 +2503,38 @@ int audit_set_contid(struct task_struct *task, u64 contid)
>         return rc;
>  }
>
> +void audit_log_container_drop(void)
> +{
> +       struct audit_buffer *ab;
> +       uid_t uid;
> +       struct tty_struct *tty;
> +       char comm[sizeof(current->comm)];
> +
> +       if (!current->audit || !current->audit->cont ||
> +           refcount_read(&current->audit->cont->refcount) > 1)
> +               return;
> +       ab = audit_log_start(audit_context(), GFP_KERNEL, AUDIT_CONTAINER_OP);
> +       if (!ab)
> +               return;
> +
> +       uid = from_kuid(&init_user_ns, task_uid(current));
> +       tty = audit_get_tty();
> +       audit_log_format(ab,
> +                        "op=drop opid=%d contid=%llu old-contid=%llu pid=%d uid=%u auid=%u tty=%s ses=%u",
> +                        task_tgid_nr(current), audit_get_contid(current),
> +                        audit_get_contid(current), task_tgid_nr(current), uid,
> +                        from_kuid(&init_user_ns, audit_get_loginuid(current)),
> +                        tty ? tty_name(tty) : "(none)",
> +                                audit_get_sessionid(current));
> +       audit_put_tty(tty);
> +       audit_log_task_context(ab);
> +       audit_log_format(ab, " comm=");
> +       audit_log_untrustedstring(ab, get_task_comm(comm, current));
> +       audit_log_d_path_exe(ab, current->mm);
> +       audit_log_format(ab, " res=1");
> +       audit_log_end(ab);
> +}

Why can't we just do this in audit_cont_put()?  Is it because we call
audit_cont_put() in the new audit_free() function?  What if we were to
do it in __audit_free()/audit_free_syscall()?

--
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
