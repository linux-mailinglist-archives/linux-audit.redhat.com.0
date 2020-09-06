Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A2EDF25EC5A
	for <lists+linux-audit@lfdr.de>; Sun,  6 Sep 2020 05:39:35 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-JeHJw6KqNH-bKMZnVe-tfw-1; Sat, 05 Sep 2020 23:38:52 -0400
X-MC-Unique: JeHJw6KqNH-bKMZnVe-tfw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48FC71074662;
	Sun,  6 Sep 2020 03:38:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2CDC6FDB6;
	Sun,  6 Sep 2020 03:38:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F3315180B656;
	Sun,  6 Sep 2020 03:38:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0863cdnO026955 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 5 Sep 2020 23:38:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 97CE2200A799; Sun,  6 Sep 2020 03:38:39 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 92209201828C
	for <linux-audit@redhat.com>; Sun,  6 Sep 2020 03:38:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43E4F101A540
	for <linux-audit@redhat.com>; Sun,  6 Sep 2020 03:38:37 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-262-Ev8IgkRQPcWpoTgennzkKg-1; Sat, 05 Sep 2020 23:37:55 -0400
X-MC-Unique: Ev8IgkRQPcWpoTgennzkKg-1
Received: by mail-ed1-f66.google.com with SMTP id g4so9548436edk.0
	for <linux-audit@redhat.com>; Sat, 05 Sep 2020 20:37:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SybKxt5r4DpvJrcMyqAvCQLDougVZq4LzKHHKUMsChQ=;
	b=AIhu9c94JRSxq40OydLl1PGDZCPuXqJYq7UjMGVKIbhoa6ZDCA37VHgOLNIn4f4uq+
	Sq6Sai3sCsleYb52IA1kdslN1ID9VT3bhu94kQ0KyxFLlMM3YG8OQleQYopmrl3y9uKv
	QzzyVIJWHGQjIctpH4fnB9fOCBIIOauVsG8AvCjl6ldmNMpM7VcFRkfXMPTZAp2F3I3v
	+7qY/8RpRdcXiHffaf6SuyNMcTgOSgOu1oUlZJil7ieAq2d6em99OFx9ztm4wmdOp95L
	5MdS+BHJWZnG745eZ1HrGj8zjoEuLWZhQHXVpkrCxgOSj2f7K/KYU60Z1P3Jgf5mEtpa
	o1/Q==
X-Gm-Message-State: AOAM530eSKKMtCm8iQHh2NXQ6GelI8qnY8awI5C8490Dcl0EQX8XgrVR
	VOxutLynhXNLqoSiOTZP8u9Hscc4HwdAlEr3eCr1XLwoSA==
X-Google-Smtp-Source: ABdhPJz5gSoHhhwkKtx1ywEnb64j++4ZT6agTN648mykHqeVYLGtzaHe4GRGCTjL1A1eMy+wXx/j7tG+2Bw+w4rGAXU=
X-Received: by 2002:a17:906:a415:: with SMTP id
	l21mr13979834ejz.431.1599361892319; 
	Sat, 05 Sep 2020 20:11:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200826145247.10029-1-casey@schaufler-ca.com>
	<20200826145247.10029-18-casey@schaufler-ca.com>
In-Reply-To: <20200826145247.10029-18-casey@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sat, 5 Sep 2020 23:11:21 -0400
Message-ID: <CAHC9VhQEvw2jKekJeC+-eXVNii4gTS7vxqDHqWVgQL2vFCJqXA@mail.gmail.com>
Subject: Re: [PATCH v20 17/23] LSM: security_secid_to_secctx in netlink
	netfilter
To: Casey Schaufler <casey@schaufler-ca.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
Cc: john.johansen@canonical.com, selinux@vger.kernel.org,
	netdev@vger.kernel.org, James Morris <jmorris@namei.org>,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	casey.schaufler@intel.com, Stephen Smalley <sds@tycho.nsa.gov>
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 26, 2020 at 11:20 AM Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> Change netlink netfilter interfaces to use lsmcontext
> pointers, and remove scaffolding.
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: John Johansen <john.johansen@canonical.com>
> Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> cc: netdev@vger.kernel.org
> ---
>  net/netfilter/nfnetlink_queue.c | 31 ++++++++++++-------------------
>  1 file changed, 12 insertions(+), 19 deletions(-)

...

> diff --git a/net/netfilter/nfnetlink_queue.c b/net/netfilter/nfnetlink_queue.c
> index d3f8e808c5d3..c830401f7792 100644
> --- a/net/netfilter/nfnetlink_queue.c
> +++ b/net/netfilter/nfnetlink_queue.c
> @@ -401,8 +399,7 @@ nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
>         enum ip_conntrack_info ctinfo;
>         struct nfnl_ct_hook *nfnl_ct;
>         bool csum_verify;
> -       struct lsmcontext scaff; /* scaffolding */
> -       char *secdata = NULL;
> +       struct lsmcontext context = { };
>         u32 seclen = 0;
>
>         size = nlmsg_total_size(sizeof(struct nfgenmsg))
> @@ -469,7 +466,7 @@ nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
>         }
>
>         if ((queue->flags & NFQA_CFG_F_SECCTX) && entskb->sk) {
> -               seclen = nfqnl_get_sk_secctx(entskb, &secdata);
> +               seclen = nfqnl_get_sk_secctx(entskb, &context);
>                 if (seclen)
>                         size += nla_total_size(seclen);
>         }

I think we can get rid of the local "seclen" variable, right?  We can
embed the nfqnl_get_sk_secctx() in the conditional and then simply
reference "context.len" everywhere else, yes?  For example:

  if (nfqnl_get_sk_secctx(..., &context))
    size += nla_total_size(context.len);

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

