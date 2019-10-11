Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id AC76ED3649
	for <lists+linux-audit@lfdr.de>; Fri, 11 Oct 2019 02:40:15 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 044648372F2;
	Fri, 11 Oct 2019 00:40:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D33BC5D6C8;
	Fri, 11 Oct 2019 00:40:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 90802180B536;
	Fri, 11 Oct 2019 00:40:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9B0e9Kr028961 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 10 Oct 2019 20:40:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CF312100EBD6; Fri, 11 Oct 2019 00:40:09 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6E43100EBA2
	for <linux-audit@redhat.com>; Fri, 11 Oct 2019 00:40:05 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A2F5FC057F31
	for <linux-audit@redhat.com>; Fri, 11 Oct 2019 00:40:03 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id 72so5738625lfh.6
	for <linux-audit@redhat.com>; Thu, 10 Oct 2019 17:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QkzZR9OEPJLaUXXIdfh6gF0s61TBZnR/lxZWV3PihuE=;
	b=UTddWIBiR1GAGxR+mVYGM2xyl/RvsIwM/NAHHgw54XYygmhj3i5UVV2I4PEAPeMN6C
	gUnZcpxsnn/VIoSqeuT29NvcCnTBtQZZYIzezV5nhl7h4g7PLvfzBM9JLlGRzxCT3t2Z
	V27bVV3SutbKjSG6fE1eHwplxGQDRN6z39JCyjIWMYGA/+VseS+1Fy34mOJ9AHdVA5AH
	3C1Tm5Nh052pq5kI5hNpRdfIZf13CWV/RwRTcOz8sqXffvjbRwBESlTXGOtLlGBMADel
	MFiIkKsyURq0OHNdEEPAgujRar/g74XGku51ImEHY3XnH6J7Re0MG9K7AQuvm1WQxIJG
	lrQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QkzZR9OEPJLaUXXIdfh6gF0s61TBZnR/lxZWV3PihuE=;
	b=kCRuQsB+TEY8plQrYrEVsmnGQRBCBYrrZmOpCEthjw1QHa6QwuSxalOvs752AiOiMO
	wPbXeZMNhYTEPBaLJI5A4nEuQLdlPn7WZyQ2tz+rdgyesm5akYCGm2mx+eM1iBzUArFy
	mCuTCCBXLb9rD5dBabcn3zrv/zk/endtXZQu5LG2Vhztvj4DWft6fQn0G01/k3vOTMlI
	zaDp4GYycNRba7gqdj2P3H5MijnByNdBBIjlWc3e83NvoACUb6eDlNYBdwJrO65DONRW
	MUG+4iZkQjuF/txJyr3iMpnYbNBR39o3RLsKguW6XzrBvNtLUgzT8MRRNxuuj23lu4qo
	sykA==
X-Gm-Message-State: APjAAAXLsIltazypSZoTg12qsiMuMJjRvhmQQdUMKvw+F7Oog+Lkb0et
	Pae7Wxc5BoeEwGV3X/GOZLrXnOUALXkUHzIJrgkj
X-Google-Smtp-Source: APXvYqy/DOSZitDBR7TqyrESxgPgD+yFqEzNoecNTAToFNbWp+w16SQ8prdItu7++b4q9m+f88vJY4RLR7eP7fAj9Y0=
X-Received: by 2002:a19:c7cf:: with SMTP id x198mr7323383lff.158.1570754401856;
	Thu, 10 Oct 2019 17:40:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1568834524.git.rgb@redhat.com>
	<18f14bfbffc30c53c2b1dd06694b69ef286f3b72.1568834524.git.rgb@redhat.com>
In-Reply-To: <18f14bfbffc30c53c2b1dd06694b69ef286f3b72.1568834524.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 10 Oct 2019 20:39:50 -0400
Message-ID: <CAHC9VhQNWP-UhnXRoDWQDcWAOB6KkW3S0uhbJ_Z+9zGNteVwRw@mail.gmail.com>
Subject: Re: [PATCH ghak90 V7 13/21] audit: NETFILTER_PKT: record each
	container ID associated with a netNS
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 11 Oct 2019 00:40:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Fri, 11 Oct 2019 00:40:04 +0000 (UTC) for IP:'209.85.167.67'
	DOMAIN:'mail-lf1-f67.google.com' HELO:'mail-lf1-f67.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.167.67 mail-lf1-f67.google.com 209.85.167.67
	mail-lf1-f67.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.32
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]); Fri, 11 Oct 2019 00:40:14 +0000 (UTC)

On Wed, Sep 18, 2019 at 9:26 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> Add audit container identifier auxiliary record(s) to NETFILTER_PKT
> event standalone records.  Iterate through all potential audit container
> identifiers associated with a network namespace.
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> Acked-by: Neil Horman <nhorman@tuxdriver.com>
> Reviewed-by: Ondrej Mosnacek <omosnace@redhat.com>
> ---
>  include/linux/audit.h    |  5 +++++
>  kernel/audit.c           | 39 +++++++++++++++++++++++++++++++++++++++
>  net/netfilter/nft_log.c  | 11 +++++++++--
>  net/netfilter/xt_AUDIT.c | 11 +++++++++--
>  4 files changed, 62 insertions(+), 4 deletions(-)

This should be squashed together with patch 12/21; neither patch makes
sense by themselves.

> diff --git a/include/linux/audit.h b/include/linux/audit.h
> index 73e3ab38e3e0..dcd92f964120 100644
> --- a/include/linux/audit.h
> +++ b/include/linux/audit.h
> @@ -241,6 +241,8 @@ static inline u64 audit_get_contid(struct task_struct *tsk)
>  extern void audit_netns_contid_del(struct net *net, u64 contid);
>  extern void audit_switch_task_namespaces(struct nsproxy *ns,
>                                          struct task_struct *p);
> +extern void audit_log_netns_contid_list(struct net *net,
> +                                       struct audit_context *context);
>
>  extern u32 audit_enabled;
>
> @@ -328,6 +330,9 @@ static inline void audit_netns_contid_del(struct net *net, u64 contid)
>  static inline void audit_switch_task_namespaces(struct nsproxy *ns,
>                                                 struct task_struct *p)
>  { }
> +static inline void audit_log_netns_contid_list(struct net *net,
> +                                              struct audit_context *context)
> +{ }
>
>  #define audit_enabled AUDIT_OFF
>
> diff --git a/kernel/audit.c b/kernel/audit.c
> index e0c27bc39925..9ce7a1ec7a92 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -450,6 +450,45 @@ void audit_switch_task_namespaces(struct nsproxy *ns, struct task_struct *p)
>                 audit_netns_contid_add(new->net_ns, contid);
>  }
>
> +/**
> + * audit_log_netns_contid_list - List contids for the given network namespace
> + * @net: the network namespace of interest
> + * @context: the audit context to use
> + *
> + * Description:
> + * Issues a CONTAINER_ID record with a CSV list of contids associated
> + * with a network namespace to accompany a NETFILTER_PKT record.
> + */
> +void audit_log_netns_contid_list(struct net *net, struct audit_context *context)
> +{
> +       struct audit_buffer *ab = NULL;
> +       struct audit_contid *cont;
> +       struct audit_net *aunet;
> +
> +       /* Generate AUDIT_CONTAINER_ID record with container ID CSV list */
> +       rcu_read_lock();
> +       aunet = net_generic(net, audit_net_id);
> +       if (!aunet)
> +               goto out;
> +       list_for_each_entry_rcu(cont, &aunet->contid_list, list) {
> +               if (!ab) {
> +                       ab = audit_log_start(context, GFP_ATOMIC,
> +                                            AUDIT_CONTAINER_ID);
> +                       if (!ab) {
> +                               audit_log_lost("out of memory in audit_log_netns_contid_list");
> +                               goto out;
> +                       }
> +                       audit_log_format(ab, "contid=");
> +               } else
> +                       audit_log_format(ab, ",");
> +               audit_log_format(ab, "%llu", cont->id);
> +       }
> +       audit_log_end(ab);
> +out:
> +       rcu_read_unlock();
> +}
> +EXPORT_SYMBOL(audit_log_netns_contid_list);
> +
>  void audit_panic(const char *message)
>  {
>         switch (audit_failure) {
> diff --git a/net/netfilter/nft_log.c b/net/netfilter/nft_log.c
> index fe4831f2258f..98d1e7e1a83c 100644
> --- a/net/netfilter/nft_log.c
> +++ b/net/netfilter/nft_log.c
> @@ -66,13 +66,16 @@ static void nft_log_eval_audit(const struct nft_pktinfo *pkt)
>         struct sk_buff *skb = pkt->skb;
>         struct audit_buffer *ab;
>         int fam = -1;
> +       struct audit_context *context;
> +       struct net *net;
>
>         if (!audit_enabled)
>                 return;
>
> -       ab = audit_log_start(NULL, GFP_ATOMIC, AUDIT_NETFILTER_PKT);
> +       context = audit_alloc_local(GFP_ATOMIC);
> +       ab = audit_log_start(context, GFP_ATOMIC, AUDIT_NETFILTER_PKT);
>         if (!ab)
> -               return;
> +               goto errout;
>
>         audit_log_format(ab, "mark=%#x", skb->mark);
>
> @@ -99,6 +102,10 @@ static void nft_log_eval_audit(const struct nft_pktinfo *pkt)
>                 audit_log_format(ab, " saddr=? daddr=? proto=-1");
>
>         audit_log_end(ab);
> +       net = xt_net(&pkt->xt);
> +       audit_log_netns_contid_list(net, context);
> +errout:
> +       audit_free_context(context);
>  }
>
>  static void nft_log_eval(const struct nft_expr *expr,
> diff --git a/net/netfilter/xt_AUDIT.c b/net/netfilter/xt_AUDIT.c
> index 9cdc16b0d0d8..ecf868a1abde 100644
> --- a/net/netfilter/xt_AUDIT.c
> +++ b/net/netfilter/xt_AUDIT.c
> @@ -68,10 +68,13 @@ static bool audit_ip6(struct audit_buffer *ab, struct sk_buff *skb)
>  {
>         struct audit_buffer *ab;
>         int fam = -1;
> +       struct audit_context *context;
> +       struct net *net;
>
>         if (audit_enabled == AUDIT_OFF)
> -               goto errout;
> -       ab = audit_log_start(NULL, GFP_ATOMIC, AUDIT_NETFILTER_PKT);
> +               goto out;
> +       context = audit_alloc_local(GFP_ATOMIC);
> +       ab = audit_log_start(context, GFP_ATOMIC, AUDIT_NETFILTER_PKT);
>         if (ab == NULL)
>                 goto errout;
>
> @@ -101,7 +104,11 @@ static bool audit_ip6(struct audit_buffer *ab, struct sk_buff *skb)
>
>         audit_log_end(ab);
>
> +       net = xt_net(par);
> +       audit_log_netns_contid_list(net, context);
>  errout:
> +       audit_free_context(context);
> +out:
>         return XT_CONTINUE;
>  }
>

--
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
