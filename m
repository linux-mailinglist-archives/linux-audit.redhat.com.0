Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 53B3714E773
	for <lists+linux-audit@lfdr.de>; Fri, 31 Jan 2020 04:18:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580440722;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tUaeySp/Mr5ZgVutYcca435j0eurJrIKA3CGxcdPO4M=;
	b=VeMpFb6ZgRhoIJN+okF+s2YbWBZLZe356pv2X+8W5Iu/PBarH3iDjzZ9q5y+kZsg5PRPaX
	btCfnX9/GhcUvcpRW6iiXw1A1j9w9iXyzkg5KuWTgXLKbVyU6wxq1PEIDkPlijmRut3haD
	BDbvap3xCxcjkNaW06yp2dqbziOLGAw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-wwijiXJQM9SGQN8v6mWDGg-1; Thu, 30 Jan 2020 22:18:39 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4B5F182B91B;
	Fri, 31 Jan 2020 03:18:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 821951001B0B;
	Fri, 31 Jan 2020 03:18:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3BC8987A96;
	Fri, 31 Jan 2020 03:18:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00V3IOcQ019823 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 30 Jan 2020 22:18:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 609EB2033955; Fri, 31 Jan 2020 03:18:24 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B1FE2093CE3
	for <linux-audit@redhat.com>; Fri, 31 Jan 2020 03:18:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 097A818A02C0
	for <linux-audit@redhat.com>; Fri, 31 Jan 2020 03:18:22 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-17-oQcyahUkMUqbVsI4qe1zFg-1; Thu, 30 Jan 2020 22:18:20 -0500
Received: by mail-ed1-f67.google.com with SMTP id j17so6245265edp.3
	for <linux-audit@redhat.com>; Thu, 30 Jan 2020 19:18:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kKinvHI4TDJydSGpXy3MUxdAooObzKTfiZRkdcYYm2w=;
	b=Kz90U7SrTlc4iG2cARV8q2AVVQb3e26TUrvdX+4c+HP2hcZqtX/EuHraGl0B4SrYEJ
	Oq/pcO6UfB4EbHwJPlBqy1pWy9OZWsKrMssl9xYtS66glqyYAqlGsjGIjTx5nsDmp0Cl
	cwH56Osiz5yPEnOBSS3uGqBPnKBZNmif5HgELSmo+Hq97Ubk10odsG+UbD2CHsCBaE2r
	NRk674+LXtnFYcCc5SBpFZpupb0f97uYoKW/eBVPIKux3CYl+93r3FWmg0y9E0qUQvRL
	Y8ncrkZLEyH/ZFaNRU5jSOdtWPQGpSuN/BEVQd3WLSC0l/3loWn0TI36eRm/59PwXw1Y
	w7Kg==
X-Gm-Message-State: APjAAAVUkTLhC4yg6dynkQb2oqmjtuN4LGnl4fVH21TMsBC4TwkvV6i9
	VwvYS9Xc6fRqt3Csectf6fSHV1AubPJ8QqzFSyQf
X-Google-Smtp-Source: APXvYqySKvh6n+nvv2uh7W6ky4Lsp823lPE9v8olzIGwgG1h8U6FCiz9KtyKcZ6Xssk/OPASBLREbduPcBcxWIpbSRk=
X-Received: by 2002:a17:906:c299:: with SMTP id
	r25mr7047956ejz.272.1580440698700; 
	Thu, 30 Jan 2020 19:18:18 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577830902.git.rgb@redhat.com>
	<b1b2e6f917816c4ae85b53d7f93c10c3d1df4a53.1577830902.git.rgb@redhat.com>
In-Reply-To: <b1b2e6f917816c4ae85b53d7f93c10c3d1df4a53.1577830902.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 30 Jan 2020 22:18:07 -0500
Message-ID: <CAHC9VhRSRggBD9QgXD7-YEx=qY7Ym_1D12y3anAihE=9P7r-6w@mail.gmail.com>
Subject: Re: [PATCH ghak25 v2 4/9] audit: record nfcfg params
To: Richard Guy Briggs <rgb@redhat.com>
X-MC-Unique: oQcyahUkMUqbVsI4qe1zFg-1
X-MC-Unique: wwijiXJQM9SGQN8v6mWDGg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00V3IOcQ019823
X-loop: linux-audit@redhat.com
Cc: fw@strlen.de, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	twoerner@redhat.com, Eric Paris <eparis@parisplace.org>,
	tgraf@infradead.org
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 6, 2020 at 1:55 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> Record the auditable parameters of any non-empty netfilter table
> configuration change.
>
> See: https://github.com/linux-audit/audit-kernel/issues/25
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  include/linux/audit.h | 11 +++++++++++
>  kernel/auditsc.c      | 16 ++++++++++++++++
>  2 files changed, 27 insertions(+)

I can not see a good reason why this patch is separate from patches 5
and 6, please squash them down into one patch.  As it currently stands
the logging function introduced here has no caller so it is pointless
by itself.  Strive to make an individual patch have some significance
on its own whenever possible.

This will also help you write a better commit description, right now
the commit description tells me nothing, but if you bring in the other
patches you can talk about consolidating similar code into a common
function.

> diff --git a/include/linux/audit.h b/include/linux/audit.h
> index f9ceae57ca8d..96cabb095eed 100644
> --- a/include/linux/audit.h
> +++ b/include/linux/audit.h
> @@ -379,6 +379,7 @@ extern int __audit_log_bprm_fcaps(struct linux_binprm *bprm,
>  extern void __audit_fanotify(unsigned int response);
>  extern void __audit_tk_injoffset(struct timespec64 offset);
>  extern void __audit_ntp_log(const struct audit_ntp_data *ad);
> +extern void __audit_nf_cfg(const char *name, u8 af, int nentries);
>
>  static inline void audit_ipc_obj(struct kern_ipc_perm *ipcp)
>  {
> @@ -514,6 +515,12 @@ static inline void audit_ntp_log(const struct audit_ntp_data *ad)
>                 __audit_ntp_log(ad);
>  }
>
> +static inline void audit_nf_cfg(const char *name, u8 af, int nentries)
> +{
> +       if (!audit_dummy_context())
> +               __audit_nf_cfg(name, af, nentries);

See my comments below about audit_enabled.

> +}
> +
>  extern int audit_n_rules;
>  extern int audit_signals;
>  #else /* CONFIG_AUDITSYSCALL */
> @@ -646,6 +653,10 @@ static inline void audit_ntp_log(const struct audit_ntp_data *ad)
>
>  static inline void audit_ptrace(struct task_struct *t)
>  { }
> +
> +static inline void audit_nf_cfg(const char *name, u8 af, int nentries)
> +{ }
> +
>  #define audit_n_rules 0
>  #define audit_signals 0
>  #endif /* CONFIG_AUDITSYSCALL */
> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index 4effe01ebbe2..4e1df4233cd3 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -2545,6 +2545,22 @@ void __audit_ntp_log(const struct audit_ntp_data *ad)
>         audit_log_ntp_val(ad, "adjust", AUDIT_NTP_ADJUST);
>  }
>
> +void __audit_nf_cfg(const char *name, u8 af, int nentries)

Should nentries be an unsigned int?

> +{
> +       struct audit_buffer *ab;
> +       struct audit_context *context = audit_context();

This is a good example of why the context of a caller matters; taken
alone I would say that we need a check for audit_enabled here, but if
we look at the latter patches we can see that the caller already has
the audit_enabled check.

Considering that the caller is already doing an audit_enabled check,
we might want to consider moving the audit_enabled check into
audit_nf_cfg() where we do the dummy context check.  It's a static
inline so there shouldn't be a performance impact and it makes the
caller's code cleaner.

> +       if (!nentries)
> +               return;
> +       ab = audit_log_start(context, GFP_KERNEL, AUDIT_NETFILTER_CFG);

Why do we need the context variable, why not just call audit_context()
here directly?

> +       if (!ab)
> +               return; /* audit_panic or being filtered */

We generally don't add comments when audit_log_start() fails
elsewhere, please don't do it here.

> +       audit_log_format(ab, "table=%s family=%u entries=%u",
> +                        name, af, nentries);
> +       audit_log_end(ab);
> +}
> +EXPORT_SYMBOL_GPL(__audit_nf_cfg);
> +
>  static void audit_log_task(struct audit_buffer *ab)
>  {
>         kuid_t auid, uid;
> --
> 1.8.3.1

--
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

