Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id DE65B17CABC
	for <lists+linux-audit@lfdr.de>; Sat,  7 Mar 2020 03:25:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583547903;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RBIQtZ6yaW2ftZxFKYPRJDwiO9fxYjsR+85xUsu7d3U=;
	b=ZQCER+jxZ8cxBav2Z3UnL/sHp6SRIFMRTIrAYWpC+i70k1Ta0HsCOCa7h273oeL+dOuKRo
	pZEAeylHQH6ao1IvDTzqJAkOT6eYDw8Qz7H09YkknmIHtcSMgrgeUuH8r7qJEn76QF/onb
	dkspQ72piHyLQ2fj4wVUIxwcuLFjed4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-_B5BkINTNHm1pbXYiFAu8g-1; Fri, 06 Mar 2020 21:25:01 -0500
X-MC-Unique: _B5BkINTNHm1pbXYiFAu8g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D39C0800D50;
	Sat,  7 Mar 2020 02:24:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD8078D56A;
	Sat,  7 Mar 2020 02:24:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 460A018089CF;
	Sat,  7 Mar 2020 02:24:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0272Ok9t016779 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 6 Mar 2020 21:24:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EDA7A103543E; Sat,  7 Mar 2020 02:24:45 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E8AE31035441
	for <linux-audit@redhat.com>; Sat,  7 Mar 2020 02:24:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDB258007A4
	for <linux-audit@redhat.com>; Sat,  7 Mar 2020 02:24:43 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-8-YeoZ2nIzMh6dIJpGDvOMKQ-1; Fri, 06 Mar 2020 21:24:41 -0500
X-MC-Unique: YeoZ2nIzMh6dIJpGDvOMKQ-1
Received: by mail-ed1-f67.google.com with SMTP id y3so4728803edj.13
	for <linux-audit@redhat.com>; Fri, 06 Mar 2020 18:24:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RMeQMP0Pgnq0QXIFN4k7lrTB/puwqGEpbCeaurBwcvI=;
	b=ZPHZS0N4zxDRv8J+5TS6As1Ur+ois2gQlsNRuE8bidYJMrT16d3hdG6phgz8LcRj0W
	96GTtGWQvf+uRkLMtu50wcO/pjybK8iPnYs7bzlavB4Hip2ksbnniQSvOEctDHI4wUP3
	T2HOQ+yAuZCigP+w9nDFpya7kCO4YbRlY+HJd7E5fzrlf2KbfI5rp/UeBKpeH/5mIa+Q
	rYUGQaW32vh/ITQFU0WVCvEU9ZPG/2mybbqHGrz+0n6fjv3GMojHgQ/tp/Hil/5W1g8h
	+qW+ZRBPeOggUgtC//AiYDsjueWIo2DiG/Z2yyNSTu0lIllLKh1wF+6cevAyt3RlaRRg
	nWXA==
X-Gm-Message-State: ANhLgQ0ek6cX808wxDAJT7gaJ2aMur3738WlCbwNY8LiXTNIHBCZoCsf
	bowwU8MrpZIVeZ05+1gq0/z/liwgSFRwLi85OvdyR/o=
X-Google-Smtp-Source: ADFU+vubQS1F1gKXV4WZhPxiosqH8QqgcqvybL9/8SUXRAO+SAHNcr87l8KX1f+KQyVvnt/HVZb2dBnC0fz0y/hcoi0=
X-Received: by 2002:a17:906:370a:: with SMTP id
	d10mr5719463ejc.281.1583547880272; 
	Fri, 06 Mar 2020 18:24:40 -0800 (PST)
MIME-Version: 1.0
References: <20200222000407.110158-1-casey@schaufler-ca.com>
	<20200222000407.110158-13-casey@schaufler-ca.com>
In-Reply-To: <20200222000407.110158-13-casey@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 6 Mar 2020 21:24:28 -0500
Message-ID: <CAHC9VhQ+zmB8zxYz0_jfk1SHkkYjUcDpHw1FzKH8G7GkenpH0g@mail.gmail.com>
Subject: Re: [PATCH v15 20/23] Audit: Add subj_LSM fields when necessary
To: Casey Schaufler <casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0272Ok9t016779
X-loop: linux-audit@redhat.com
Cc: casey.schaufler@intel.com, linux-audit@redhat.com
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
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 21, 2020 at 7:06 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> Add record entries to identify subject data for all of the
> security modules when there is more than one.
>
> Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> Cc: netdev@vger.kernel.org
> Cc: linux-audit@redhat.com
> ---
>  drivers/android/binder.c                |  2 +-
>  include/linux/audit.h                   |  1 +
>  include/linux/security.h                |  9 ++++-
>  include/net/scm.h                       |  3 +-
>  kernel/audit.c                          | 40 ++++++++++++++++++-
>  kernel/audit_fsnotify.c                 |  1 +
>  kernel/auditfilter.c                    |  1 +
>  kernel/auditsc.c                        | 10 +++--
>  net/ipv4/ip_sockglue.c                  |  2 +-
>  net/netfilter/nf_conntrack_netlink.c    |  4 +-
>  net/netfilter/nf_conntrack_standalone.c |  2 +-
>  net/netfilter/nfnetlink_queue.c         |  2 +-
>  net/netlabel/netlabel_unlabeled.c       | 11 ++++--
>  net/netlabel/netlabel_user.c            |  2 +-
>  net/xfrm/xfrm_policy.c                  |  2 +
>  net/xfrm/xfrm_state.c                   |  2 +
>  security/integrity/ima/ima_api.c        |  1 +
>  security/integrity/integrity_audit.c    |  1 +
>  security/security.c                     | 51 +++++++++++++++++++++++--
>  19 files changed, 124 insertions(+), 23 deletions(-)

...

> diff --git a/kernel/audit.c b/kernel/audit.c
> index a25097cfe623..c3a1d8d2d33c 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -2054,6 +2061,33 @@ void audit_log_key(struct audit_buffer *ab, char *key)
>                 audit_log_format(ab, "(null)");
>  }
>
> +void audit_log_task_lsms(struct audit_buffer *ab)
> +{
> +       int i;
> +       const char *lsm;
> +       struct lsmblob blob;
> +       struct lsmcontext context;
> +
> +       /*
> +        * Don't do anything unless there is more than one LSM
> +        * with a security context to report.
> +        */
> +       if (security_lsm_slot_name(1) == NULL)
> +               return;
> +
> +       security_task_getsecid(current, &blob);
> +
> +       for (i = 0; i < LSMBLOB_ENTRIES; i++) {
> +               lsm = security_lsm_slot_name(i);
> +               if (lsm == NULL)
> +                       break;
> +               if (security_secid_to_secctx(&blob, &context, i))
> +                       continue;
> +               audit_log_format(ab, " subj_%s=%s", lsm, context.context);
> +               security_release_secctx(&context);
> +       }
> +}
> +
>  int audit_log_task_context(struct audit_buffer *ab)
>  {
>         int error;
> @@ -2064,7 +2098,7 @@ int audit_log_task_context(struct audit_buffer *ab)
>         if (!lsmblob_is_set(&blob))
>                 return 0;
>
> -       error = security_secid_to_secctx(&blob, &context);
> +       error = security_secid_to_secctx(&blob, &context, LSMBLOB_FIRST);
>         if (error) {
>                 if (error != -EINVAL)
>                         goto error_path;

Sorry, please disregard my previous ACK.

We should treat "subj=" similar to how we treat "obj="; if there is
more than one LSM loaded the "subj=" should be set to "?" with the
"subj_XXX=" set to the appropriate label for the named LSM.  This
patch looks like it is always using LSMBLOB_FIRST and not "?" when
multiple LSMs are present.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

