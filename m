Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 1D59C2068CF
	for <lists+linux-audit@lfdr.de>; Wed, 24 Jun 2020 02:08:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592957282;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nY/E0NCGKIoCIBBNeMGl6mJQQ50oM0x+qWxb9BjAZh0=;
	b=YfYmtW3+asSHZb/B2JXmQEXJXM2gYEDb1wB0A8l85gDEyH31/2wDQTqsDGGmwrHTGRq7iK
	Gk3YX3IZ2QinpSkxml7667tbCthG5v8fHydQoCjG4gK4EHEVRw0KcWIp2n6GUmDhejP8Sx
	ZaHjKJScjynteN7TdpDO0qKYOQKFnU4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-0lgP-yGeO4ut3WtqBB0IAw-1; Tue, 23 Jun 2020 20:07:59 -0400
X-MC-Unique: 0lgP-yGeO4ut3WtqBB0IAw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93B26800D5C;
	Wed, 24 Jun 2020 00:07:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FC595BAF8;
	Wed, 24 Jun 2020 00:07:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 71697833CF;
	Wed, 24 Jun 2020 00:07:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05O07YPv014574 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 23 Jun 2020 20:07:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B17EF10D14E1; Wed, 24 Jun 2020 00:07:34 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD0A710D14D0
	for <linux-audit@redhat.com>; Wed, 24 Jun 2020 00:07:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76DCF858EE2
	for <linux-audit@redhat.com>; Wed, 24 Jun 2020 00:07:31 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-413-Yg0esgCZMLipUc2lx5ngDg-1; Tue, 23 Jun 2020 20:07:25 -0400
X-MC-Unique: Yg0esgCZMLipUc2lx5ngDg-1
Received: by mail-ed1-f65.google.com with SMTP id z17so122039edr.9
	for <linux-audit@redhat.com>; Tue, 23 Jun 2020 17:07:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wYef0IlAA5cnvfvaD0Ws/jCKLqqDtLAVNioagh3fxFo=;
	b=nrBxRZv6gkDlNjkqXRXAW1y285eG6Bwro8eJcSuP5rRMymBbiu3vv774jWierNzZNm
	OOrFC/tiQOhzx4ze/FTjT1oHJxugNrhl4nowZPHtMWJWFcXHmcZOBIRhW0YdS8Of8l5I
	p6ZxtaNvLfv68jD/NUwRwdWA5g0zrvOTDIyLnaLsKCzueq0zJztIAGs8BtGpzHa95QuK
	MutEk1Tzh6ZtvbBIfdzll4vjFSmQzUhf3ZTSHTABwgJPJcr4RSvx/OULbv1bMy3SbZJI
	GB/yzLE7a1u8hJ8QTT9G17SvQS1Qua9jXpF+9Hhnxz1+lat8N/54l+r8SJpTMBwiOG9Y
	T4/g==
X-Gm-Message-State: AOAM530opgWplgRti3mmmlzoYDVt11FMN2PtmFxWhW+6gcFzWTLf9/Wl
	f2NMq6Cs/tsKKkw6pZVR6OUnZck/bnoVCwODz9O6
X-Google-Smtp-Source: ABdhPJxm2K+GHRjbkAJL7JkYWCiCsE49AHvZ3AgzIC+2MhsncYMq9OfsaBZK3cyOIwmZUZDbN96x/rMx2egaXaIUw38=
X-Received: by 2002:aa7:de08:: with SMTP id h8mr23618936edv.164.1592957244179; 
	Tue, 23 Jun 2020 17:07:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200618211012.2823-1-nramas@linux.microsoft.com>
In-Reply-To: <20200618211012.2823-1-nramas@linux.microsoft.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 23 Jun 2020 20:07:13 -0400
Message-ID: <CAHC9VhTW-M7e7BK3d-UKi6KuPo3=8wNzAU1hN3HDsw=B-CGxFw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] integrity: Add errno field in audit message
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
Cc: rgb@redhat.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com,
	linux-audit@redhat.com, linux-integrity@vger.kernel.org
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jun 18, 2020 at 5:10 PM Lakshmi Ramasubramanian
<nramas@linux.microsoft.com> wrote:
>
> Error code is not included in the audit messages logged by
> the integrity subsystem.
>
> Define a new function integrity_audit_message() that takes error code
> in the "errno" parameter. Add "errno" field in the audit messages logged
> by the integrity subsystem and set the value passed in the "errno"
> parameter.
>
> [    6.303048] audit: type=1804 audit(1592506281.627:2): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel op=measuring_key cause=ENOMEM comm="swapper/0" name=".builtin_trusted_keys" res=0 errno=-12
>
> [    7.987647] audit: type=1802 audit(1592506283.312:9): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 op=policy_update cause=completed comm="systemd" res=1 errno=0
>
> [    8.019432] audit: type=1804 audit(1592506283.344:10): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 op=measuring_kexec_cmdline cause=hashing_error comm="systemd" name="kexec-cmdline" res=0 errno=-22
>
> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
> Suggested-by: Steve Grubb <sgrubb@redhat.com>
> Suggested-by: Mimi Zohar <zohar@linux.ibm.com>
> ---
>  security/integrity/integrity.h       | 13 +++++++++++++
>  security/integrity/integrity_audit.c | 11 ++++++++++-
>  2 files changed, 23 insertions(+), 1 deletion(-)

The audit record changes look good to me.

Acked-by: Paul Moore <paul@paul-moore.com>

> diff --git a/security/integrity/integrity.h b/security/integrity/integrity.h
> index 16c1894c29bb..413c803c5208 100644
> --- a/security/integrity/integrity.h
> +++ b/security/integrity/integrity.h
> @@ -239,6 +239,11 @@ void integrity_audit_msg(int audit_msgno, struct inode *inode,
>                          const unsigned char *fname, const char *op,
>                          const char *cause, int result, int info);
>
> +void integrity_audit_message(int audit_msgno, struct inode *inode,
> +                            const unsigned char *fname, const char *op,
> +                            const char *cause, int result, int info,
> +                            int errno);
> +
>  static inline struct audit_buffer *
>  integrity_audit_log_start(struct audit_context *ctx, gfp_t gfp_mask, int type)
>  {
> @@ -253,6 +258,14 @@ static inline void integrity_audit_msg(int audit_msgno, struct inode *inode,
>  {
>  }
>
> +static inline void integrity_audit_message(int audit_msgno,
> +                                          struct inode *inode,
> +                                          const unsigned char *fname,
> +                                          const char *op, const char *cause,
> +                                          int result, int info, int errno)
> +{
> +}
> +
>  static inline struct audit_buffer *
>  integrity_audit_log_start(struct audit_context *ctx, gfp_t gfp_mask, int type)
>  {
> diff --git a/security/integrity/integrity_audit.c b/security/integrity/integrity_audit.c
> index 5109173839cc..f25e7df099c8 100644
> --- a/security/integrity/integrity_audit.c
> +++ b/security/integrity/integrity_audit.c
> @@ -28,6 +28,15 @@ __setup("integrity_audit=", integrity_audit_setup);
>  void integrity_audit_msg(int audit_msgno, struct inode *inode,
>                          const unsigned char *fname, const char *op,
>                          const char *cause, int result, int audit_info)
> +{
> +       integrity_audit_message(audit_msgno, inode, fname, op, cause,
> +                               result, audit_info, 0);
> +}
> +
> +void integrity_audit_message(int audit_msgno, struct inode *inode,
> +                            const unsigned char *fname, const char *op,
> +                            const char *cause, int result, int audit_info,
> +                            int errno)
>  {
>         struct audit_buffer *ab;
>         char name[TASK_COMM_LEN];
> @@ -53,6 +62,6 @@ void integrity_audit_msg(int audit_msgno, struct inode *inode,
>                 audit_log_untrustedstring(ab, inode->i_sb->s_id);
>                 audit_log_format(ab, " ino=%lu", inode->i_ino);
>         }
> -       audit_log_format(ab, " res=%d", !result);
> +       audit_log_format(ab, " res=%d errno=%d", !result, errno);
>         audit_log_end(ab);
>  }
> --
> 2.27.0
>


-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

