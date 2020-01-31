Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 51F0214E77A
	for <lists+linux-audit@lfdr.de>; Fri, 31 Jan 2020 04:19:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580440748;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wTCql06GNFXtmmy+7ep/+zvLUVzfHbA696yXmjMBFu8=;
	b=EfWzH0lgcKNvjmiuhYAjcQRsEVIt2cGcTrUYQW98Rm7Ls6r3DrTgqiZpgJvdZC0P+Eo3k4
	WIi2xDniG5t/vBugtvYJOc/4i+9KKmDicN1VhTu2HWHgSnKcBRhMJsUlRPZtM0Y0bqPA3Y
	22jR51kG0MXoLGJwYGeI2n8ei+nS+FI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-zTnuuQXiNDCXNH6XFfmKwQ-1; Thu, 30 Jan 2020 22:19:04 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B436F182B90D;
	Fri, 31 Jan 2020 03:18:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 901B25DA7B;
	Fri, 31 Jan 2020 03:18:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 518FD87A97;
	Fri, 31 Jan 2020 03:18:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00V3IuFn019921 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 30 Jan 2020 22:18:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4AC2D2033955; Fri, 31 Jan 2020 03:18:56 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45CB22093CE3
	for <linux-audit@redhat.com>; Fri, 31 Jan 2020 03:18:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29F28185AB9B
	for <linux-audit@redhat.com>; Fri, 31 Jan 2020 03:18:56 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-185-IAaFS8iWOgCHXnWOdOm5JQ-1; Thu, 30 Jan 2020 22:18:52 -0500
Received: by mail-ed1-f67.google.com with SMTP id dc19so6187858edb.10
	for <linux-audit@redhat.com>; Thu, 30 Jan 2020 19:18:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=buSrMaq3P1kBcoQzppNWiz8mxz8CGYk6xzumXwp47Gw=;
	b=rK04YlbPxxLZw9ptXlUlmYI4PRWiGWegCM5OHOSftVgh5WPKLwLYjMhxchLxjZl4dG
	WLqgjfV6wCVTjG2hhEI4nKC9iG0resaHHL6Ag7CqV1VvQc22/+I6IHLYtOeHX9INncOQ
	HC56xlf6MIT/bOP2eKFlxemrCzI2c4WvKGW/upzhK2cRoZD+2caYguWElRwxBltx1Mut
	v0j7NkOy8GNAngx+FEgRyTj6NUEHnCGDXfrL7py/+vAUnnDjNkc2nlFudBPk8ykqAn8/
	xuN+MD6qgO2E5zdLklLrAyU6skoZOrebtRekk/ZIU4CGlcPxr3BM6JZAx2txBayOYB95
	o1Cg==
X-Gm-Message-State: APjAAAWCi8yAhO+Z8Dxd0NddFE9xr46MdluJPblRcdQNXl27OOh+X8Hs
	pqum0Sr5Noy4xPb8QrVmv7qMXYJhA4L74e6bU4GN
X-Google-Smtp-Source: APXvYqxQTQi2ruXUw7RGKVRL/KdRLdKxHLUtihlr0JephRf2b1FHU4WCfGPUlVGABO7BBYiOcz2IgCKd3oA1Edxrbc4=
X-Received: by 2002:a17:906:198b:: with SMTP id
	g11mr6985931ejd.271.1580440730598; 
	Thu, 30 Jan 2020 19:18:50 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577830902.git.rgb@redhat.com>
	<65974a7254dffe53b5084bedfd60c95a29a41e08.1577830902.git.rgb@redhat.com>
In-Reply-To: <65974a7254dffe53b5084bedfd60c95a29a41e08.1577830902.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 30 Jan 2020 22:18:39 -0500
Message-ID: <CAHC9VhSSxfBLM5gpcmR-4BXctc-iKwvtcuYDkBesVttnWsNmmQ@mail.gmail.com>
Subject: Re: [PATCH ghak25 v2 9/9] netfilter: audit table unregister actions
To: Richard Guy Briggs <rgb@redhat.com>
X-MC-Unique: IAaFS8iWOgCHXnWOdOm5JQ-1
X-MC-Unique: zTnuuQXiNDCXNH6XFfmKwQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00V3IuFn019921
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 6, 2020 at 1:56 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> Audit the action of unregistering ebtables and x_tables.
>
> See: https://github.com/linux-audit/audit-kernel/issues/44
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  kernel/auditsc.c                | 3 ++-
>  net/bridge/netfilter/ebtables.c | 3 +++
>  net/netfilter/x_tables.c        | 4 +++-
>  3 files changed, 8 insertions(+), 2 deletions(-)

... and in keeping with an ongoing theme for this patchset, please
squash this patch too.

> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index 999ac184246b..2644130a9e66 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -2557,7 +2557,8 @@ void __audit_nf_cfg(const char *name, u8 af, int nentries, int op)
>                 return; /* audit_panic or being filtered */
>         audit_log_format(ab, "table=%s family=%u entries=%u op=%s",
>                          name, af, nentries,
> -                        op ? "replace" : "register");
> +                        op == 1 ? "replace" :
> +                                  (op ? "unregister" : "register"));
>         audit_log_end(ab);
>  }
>  EXPORT_SYMBOL_GPL(__audit_nf_cfg);
> diff --git a/net/bridge/netfilter/ebtables.c b/net/bridge/netfilter/ebtables.c
> index baff2f05af43..3dd4eb5b13fd 100644
> --- a/net/bridge/netfilter/ebtables.c
> +++ b/net/bridge/netfilter/ebtables.c
> @@ -1126,6 +1126,9 @@ static void __ebt_unregister_table(struct net *net, struct ebt_table *table)
>         mutex_lock(&ebt_mutex);
>         list_del(&table->list);
>         mutex_unlock(&ebt_mutex);
> +       if (audit_enabled)
> +               audit_nf_cfg(table->name, AF_BRIDGE, table->private->nentries,
> +                            2);
>         EBT_ENTRY_ITERATE(table->private->entries, table->private->entries_size,
>                           ebt_cleanup_entry, net, NULL);
>         if (table->private->nentries)
> diff --git a/net/netfilter/x_tables.c b/net/netfilter/x_tables.c
> index 4ae4f7bf8946..e4852a0cb62f 100644
> --- a/net/netfilter/x_tables.c
> +++ b/net/netfilter/x_tables.c
> @@ -1403,7 +1403,7 @@ struct xt_table_info *xt_replace_table(struct xt_table *table,
>
>         if (audit_enabled)
>                 audit_nf_cfg(table->name, table->af, private->number,
> -                            private->number);
> +                            !!private->number);
>
>         return private;
>  }
> @@ -1466,6 +1466,8 @@ void *xt_unregister_table(struct xt_table *table)
>         private = table->private;
>         list_del(&table->list);
>         mutex_unlock(&xt[table->af].mutex);
> +       if (audit_enabled)
> +               audit_nf_cfg(table->name, table->af, private->number, 2);
>         kfree(table);
>
>         return private;
> --
> 1.8.3.1

--
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

