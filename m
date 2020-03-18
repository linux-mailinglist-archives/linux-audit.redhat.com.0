Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 00C9718A77B
	for <lists+linux-audit@lfdr.de>; Wed, 18 Mar 2020 22:59:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584568781;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+8CeXKy1eor0rprSuBTOAAmNkIIUo61NoqHJqGUW30s=;
	b=bvW8AAhYcnVdsHMafsJ04HE/dXYQjZqbKRowrwgKLMv1YOJCqC3zvB8cV+AxJZy8NOnZfO
	6zotK9MGiYhcqNrchbQBzktAo1tam4bkUTjIuMzctq5XV6xbfdGG0nl0+hpmFxkjaRf56L
	Yn55N67LSRr2a+Uu7VZQL3er26IhwJI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-7jucu6MnNXKSdHRQNzmOLA-1; Wed, 18 Mar 2020 17:59:39 -0400
X-MC-Unique: 7jucu6MnNXKSdHRQNzmOLA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B2E8800EB6;
	Wed, 18 Mar 2020 21:59:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD38A19756;
	Wed, 18 Mar 2020 21:59:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DA8D618089C8;
	Wed, 18 Mar 2020 21:59:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02ILsg0g007866 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 18 Mar 2020 17:54:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1ADDC1049478; Wed, 18 Mar 2020 21:54:42 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 15DB3104FFA0
	for <linux-audit@redhat.com>; Wed, 18 Mar 2020 21:54:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C643D185A78E
	for <linux-audit@redhat.com>; Wed, 18 Mar 2020 21:54:39 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-291-4h7cTRN_P-GHgpmFi5fwDQ-1; Wed, 18 Mar 2020 17:54:37 -0400
X-MC-Unique: 4h7cTRN_P-GHgpmFi5fwDQ-1
Received: by mail-ed1-f66.google.com with SMTP id b18so50263edu.3
	for <linux-audit@redhat.com>; Wed, 18 Mar 2020 14:54:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=au4UNn3QqNUChn3BLHtwX07oVBM4ryrMaWKZ7Y+L8CU=;
	b=PEYmgukpSUd59MnuztbIf08YCERbi2mY8Z/w4wFl+F292fENj4OLJf5SGQmwPV34YE
	pdAu8KjTF8v1m8eltYzz5yt+OSW7a/WPl29ba/XHIBgI9lwue/qwncxjQ4uuV525L91Q
	XVytQ8rrIJ/3d/w4dXc8ju51Gs2Ocem+oLlu754c0VV/LF5512kPl5GzIinEOoxvfZBS
	jWg3k9so2T7gK/l6im+zI1CkJfCRnsXUgNCiAE1Ak+a7P9EHsgDtBsBReMXV8geIL416
	3nvUGQncx1P4lAVaBQavIY6rncyjiwLWQJlU0Guqlpo4yxsZlzS3pHZ3jeK0dDjvukjB
	0ekA==
X-Gm-Message-State: ANhLgQ2nS9CSrmXAcpw+ixf7k/DeNCgakhsNPX88EJtWsNVROjvQKYDz
	5es24LFnL5HOYph0+A0XzbZ/6eqbj1xzKnmCzI94
X-Google-Smtp-Source: ADFU+vutjASI3AztJGUCiHQ3hTXDBoQauisEgUSQ6bO954EQ6P7ghZ239siSSVuKzPqcgls4Wr6aYY1bVrErMIkhK3I=
X-Received: by 2002:a17:906:7a46:: with SMTP id i6mr303161ejo.95.1584568475949;
	Wed, 18 Mar 2020 14:54:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1584480281.git.rgb@redhat.com>
	<3d591dc49fcb643890b93e5b9a8169612b1c96e1.1584480281.git.rgb@redhat.com>
In-Reply-To: <3d591dc49fcb643890b93e5b9a8169612b1c96e1.1584480281.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 18 Mar 2020 17:54:25 -0400
Message-ID: <CAHC9VhTQBxzFrGn=+b9MzoapV0iiccPOLvkwemdESSb6nOFGXQ@mail.gmail.com>
Subject: Re: [PATCH ghak25 v3 1/3] audit: tidy and extend netfilter_cfg
	x_tables and ebtables logging
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02ILsg0g007866
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 17, 2020 at 5:31 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> NETFILTER_CFG record generation was inconsistent for x_tables and
> ebtables configuration changes.  The call was needlessly messy and there
> were supporting records missing at times while they were produced when
> not requested.  Simplify the logging call into a new audit_log_nfcfg
> call.  Honour the audit_enabled setting while more consistently
> recording information including supporting records by tidying up dummy
> checks.
>
> Add an op= field that indicates the operation being performed (register
> or replace).
>
> Here is the enhanced sample record:
>   type=NETFILTER_CFG msg=audit(1580905834.919:82970): table=filter family=2 entries=83 op=replace
>
> Generate audit NETFILTER_CFG records on ebtables table registration.
> Previously this was being done for x_tables registration and replacement
> operations and ebtables table replacement only.
>
> See: https://github.com/linux-audit/audit-kernel/issues/25
> See: https://github.com/linux-audit/audit-kernel/issues/35
> See: https://github.com/linux-audit/audit-kernel/issues/43
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  include/linux/audit.h           | 19 +++++++++++++++++++
>  kernel/auditsc.c                | 24 ++++++++++++++++++++++++
>  net/bridge/netfilter/ebtables.c | 12 ++++--------
>  net/netfilter/x_tables.c        | 12 +++---------
>  4 files changed, 50 insertions(+), 17 deletions(-)
>
> diff --git a/include/linux/audit.h b/include/linux/audit.h
> index f9ceae57ca8d..f4aed2b9be8d 100644
> --- a/include/linux/audit.h
> +++ b/include/linux/audit.h
> @@ -94,6 +94,11 @@ struct audit_ntp_data {
>  struct audit_ntp_data {};
>  #endif
>
> +enum audit_nfcfgop {
> +       AUDIT_XT_OP_REGISTER,
> +       AUDIT_XT_OP_REPLACE,
> +};
> +
>  extern int is_audit_feature_set(int which);
>
>  extern int __init audit_register_class(int class, unsigned *list);
> @@ -379,6 +384,8 @@ extern int __audit_log_bprm_fcaps(struct linux_binprm *bprm,
>  extern void __audit_fanotify(unsigned int response);
>  extern void __audit_tk_injoffset(struct timespec64 offset);
>  extern void __audit_ntp_log(const struct audit_ntp_data *ad);
> +extern void __audit_log_nfcfg(const char *name, u8 af, unsigned int nentries,
> +                             enum audit_nfcfgop op);
>
>  static inline void audit_ipc_obj(struct kern_ipc_perm *ipcp)
>  {
> @@ -514,6 +521,13 @@ static inline void audit_ntp_log(const struct audit_ntp_data *ad)
>                 __audit_ntp_log(ad);
>  }
>
> +static inline void audit_log_nfcfg(const char *name, u8 af, unsigned int nentries,
> +                                  enum audit_nfcfgop op)
> +{
> +       if (audit_enabled)
> +               __audit_log_nfcfg(name, af, nentries, op);

Do we want a dummy check here too?  Or do we always want to generate
this record (assuming audit is enabled) because it is a configuration
related record?

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

